Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6825C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 14:48:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94807.1783090129380683192
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 07:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VRg5fur/;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-479b7aada85so673475f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 07:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783090122; x=1783694922; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CMv82EOqlaJrZ670ZE+Q/6rzBqDgnzPkfCK8larw6Rw=;
        b=VRg5fur/KobTswsvKQZbu6YrmUbNbSITkzAGgUcpoHTZhf8ZrMNDkY/zz9KfOYlDH0
         P0egdAr338kHGOCNFmQ+kye9jXuqArP8lZdcwgW7zbtLy0nhNPiDLRqe2sPy2GlMmybv
         jGuxVdlOIGtJLePhxSx2JNlz4Yvtxek5DH+zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783090122; x=1783694922;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMv82EOqlaJrZ670ZE+Q/6rzBqDgnzPkfCK8larw6Rw=;
        b=TTefE0hWMii7EVYHWO6srMu89SOl2QD7ONySaRt9VpucDDRbrMqdzFy2OSzwYnElmQ
         FTqiPZYlVI4J39pnmxwKpP8DtbEcVxjIXv89PCqVGVOkxwsEao8X8n5X1GK8jTaulQb6
         YuxFWyuxvzOzyqD+ml+Yw90uzMLHp3duqDO9+STOUyRCburHbqfIWuSAX2z1n2r98/hw
         9mcsYux16pBJNktQLjAxjgIbP4ytRrwtvy3p2T5aC326jagrF/9dhqp/EBepf+SYRjvc
         aEFCLfpCQFAGpTkDBmccCY2htatJgjT5EGsd5xr4MqMnjycN89uIsX1zc3wA+YPb8Hkh
         1z8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqknE+e/2l94KoTqLEeoulcuRAtKKxjAm0K+yRZuvqdyQrdX6JQz2LjQfZLj+47MG8LFRKFv5+B0Jd+HQ42OtHrmw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1jj2KyZM/wzF9HsuyVHVs9bwDUemMXFcSZc4yMksLuRAc/cRI
	TyfbM0o+n0bKpVsFPh/ccfrQ3yrxSVjGMi4rY19kPAG0D9ZT0pwFJtZSFmFXdpzQoKU=
X-Gm-Gg: AfdE7cnkHfiM0TO2bJADc4d4fUgZ9cMpM8Seu0niwbJgAY6oguL1J3he1mIv8Xu0DtB
	Vh8+6d9iHLETczx+TzJVOmXJjhU1riiAcTEpnj8xep8xC97z8ia70LUXzHFaldIdV82JFaC/y6x
	NGlZUWkEweTK69BqgDq6YAQCylO3mtd6Bb4iNv63OGpdKuKnXt3STLaz393fwonnfiheU+37VWx
	SUwo3QtT46dLzcch15MkrIyQ5+gvayOf4d24BGzzUzXH9VG1yu8r/hMtdhgsSzTwP0UDNgkfAl4
	DOKF04/WLxuGPv/4647mUGalcv8ZkbeXQe/5UEsd6nTVXjh0U1cpZuKL+K5ruS8QF0Oxs8+c+sZ
	khiYbNd3gUBCoTBqRyZCuP7ZKjAWpObKXgZiYCvQWexcUHOfLToavakrkayKdg9oWW/xZ0lI2sG
	S4DrxOzHjrDTvoQ6XHrDOTsAT+tPbN/YZ0wpBQ2u5oip2h0WL0mKpkdb00xa+NdpMUCCOIHOd5N
	IPqCN9kaW/1+7jC
X-Received: by 2002:a05:6000:4a1b:b0:46e:483c:2262 with SMTP id ffacd0b85a97d-477b3982f36mr14946639f8f.14.1783090117690;
        Fri, 03 Jul 2026 07:48:37 -0700 (PDT)
Received: from localhost (2a01cb001331aa0075403fb2c9c4e210.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:7540:3fb2:c9c4:e210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a450bsm20202782f8f.10.2026.07.03.07.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 07:48:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 16:48:37 +0200
Message-Id: <DJP0OZECQ9MR.1AGCZVSYCIK1H@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] util-linux: backport pam_lastlog2
 libpam linking fix
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Chen Qi" <Qi.Chen@windriver.com>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>
To: <sivakumar.bs@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260625150015.2832246-1-sivakumar.bs@gmail.com>
In-Reply-To: <20260625150015.2832246-1-sivakumar.bs@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 14:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240120

Hello,

On Thu Jun 25, 2026 at 5:00 PM CEST, Siva Balasubramanian via lists.openemb=
edded.org wrote:
> pam_lastlog2.so uses pam_syslog() and other libpam symbols but the
> autotools build did not link the module against libpam. With the
> linker default of --as-needed, libpam was discarded and did not end
> up in the module's ELF NEEDED entries. The module then fails to load
> via dlopen() in processes that do not themselves link libpam (e.g.
> systemd on recent Fedora, or weston on journald-based systems without
> syslog):
>
>   PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): undefined symb=
ol: pam_syslog
>   PAM adding faulty module: /usr/lib/security/pam_lastlog2.so
>
> Backport the upstream fix (in 2.41.5) that moves -lpam into LIBADD so
> it is placed after the object files and retained as a NEEDED entry.
> Against 2.41.3 only the LIBADD line needs changing.
>
> [YOCTO #16320]
>
> Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc   |  1 +
>  ...ix-libpam-linking-in-autotools-build.patch | 51 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-pam_last=
log2-fix-libpam-linking-in-autotools-build.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 0235862666..3cdc1e2c0f 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -21,6 +21,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
>             file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-h=
ard.patch \
>             file://0001-tests-script-Disable-size-option-test.patch \
>             file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlin=
k-a.patch \
> +           file://0001-pam_lastlog2-fix-libpam-linking-in-autotools-buil=
d.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed=
9b50ec2b5799e58b"
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fi=
x-libpam-linking-in-autotools-build.patch b/meta/recipes-core/util-linux/ut=
il-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch
> new file mode 100644
> index 0000000000..9aaa56e7b4
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpa=
m-linking-in-autotools-build.patch
> @@ -0,0 +1,51 @@
> +From c8d0af0421f6491ab1cb2301d2e197315289d34c Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Tue, 19 May 2026 10:54:57 +0200
> +Subject: [PATCH] pam_lastlog2: fix libpam linking in autotools build
> +
> +The pam_lastlog2 module uses pam_syslog() and other libpam symbols but
> +the autotools build did not link the module against libpam. With the
> +linker default of --as-needed (and -lpam previously only in LDFLAGS,
> +before the object files), libpam was discarded and did not appear in the
> +module's ELF NEEDED entries.
> +
> +The module then fails to load with dlopen() if the calling process does
> +not itself link against libpam (e.g. systemd on recent Fedora, or weston
> +on journald-based systems without syslog):
> +
> +  PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): undefined sym=
bol: pam_syslog
> +  PAM adding faulty module: /usr/lib/security/pam_lastlog2.so
> +
> +Move -lpam into pam_lastlog2_la_LIBADD so it is placed after the object
> +files on the link line and is retained in the NEEDED entries. The meson
> +build already links libpam correctly via cc.find_library('pam').
> +
> +Note for this backport: against 2.41.3 only the LIBADD line needs to
> +change. The upstream commit also removes -lpam from LDFLAGS, but that
> +LDFLAGS reference was added after 2.41.3 and is not present here, so the
> +net change is the single LIBADD hunk below.
> +
> +Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2453457
> +
> +Upstream-Status: Backport [https://github.com/util-linux/util-linux/comm=
it/c8d0af0421f6491ab1cb2301d2e197315289d34c]
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>

Please don't rewrite patch message when backporting.

Only append backporting info at the end. We depend quite heavily on
patch being similar to upstream patches and modifications like your
makes it hard to check.

Please send a v2 with the commit message preserved.

Also, I can't find the corresponding commit on oe-core/master. If this is i=
n
util-linux/2.42.x branch, can you tell me what is the commit?

Thanks!
--=20
Yoann Congal
Smile ECS


