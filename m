Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B651C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 08:35:56 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.16148.1713170154131527759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 01:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IrHRM8Ns;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-518931f8d23so1908843e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 01:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713170152; x=1713774952; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EKLhIVHCUBwdU/MlC36YuaOLfHdzB1wzwbEhgcMfrE=;
        b=IrHRM8NsN61qcjed5Q7bGfagFnmPlfdWOuyAxrF78dxnhm2Fzgk9yZJ3k/NPb3XEpp
         6PyyasFCh/7KHmfqPNwXEbf4UEMBaPmLP1CTxawx7QPEpllPGo333rIcP40L/DRQrFmb
         WGdPI4e5BYYwb+pitBA5aaA6P+zP2lqM91x0AONORkZ6HNSpwMKuRBJ/rJ3Lcuil6tD5
         iaM9wg7iJo+Fyv9aW0XRnL8ssUuB6zSbBGpzGNd3ZTnY6vjgN3e4b53sFXyR2trNSxpC
         jSwNS5O240UH5+Ny43WZy5abiZJf2jFPTZnydnkES2WPWIDKgXwfwrO5eb4/VkOOxBKj
         jNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713170152; x=1713774952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EKLhIVHCUBwdU/MlC36YuaOLfHdzB1wzwbEhgcMfrE=;
        b=s/8aGTUnULQL9y9kaur+sNl8r/lV2yomYFnnjySWWHGykghuxqncMMF00PojZaq8Dy
         R0ezTPh6pQJtPCF+ZnZOxBIWe894cZbg3Ko+a21yd954k1O7SIJa8EZcOIz+G93u3jms
         axJ5bvY2AIAZzKQI8+DCiDMYz1TIm50mILbECH3+/PiofMWJT6yKfFAvQ+G2wp32W67y
         wqoQYVQ8x59qyhvifYFeLSHpiEqryzM1V5xuX07JNsIsBScoXCS/2vtiIoaNCExUGgxe
         IWoHjI8VmAVOMLN05mGX52fUztAzDgqFyqPN9L+gRLRkuJFlpPQlXdigIf04Zp+pCg6j
         utdA==
X-Gm-Message-State: AOJu0Yx18gsB9+7BSVQRkYIGGKt1MhEZW5jmaazLoSceRw4p5IIdS0QA
	YSkymC9UggeJ7fTV4cmPxWuWB6xbuid4ZD58pgADvjteEp6AEpCqrt6Bxp/3gLap+mBMkp7sr84
	nwB99Zx2X++wLattqmWy3p8/HP5o=
X-Google-Smtp-Source: AGHT+IGlXC2hjT/kF+RGC1uH9Vfm1QMLkPXDEDPP8vbuwNZVCoV9P/6AcsTJMIhw8cLLGnd6bUgkDLafd+l/m599dM0=
X-Received: by 2002:ac2:4db6:0:b0:516:d20a:9334 with SMTP id
 h22-20020ac24db6000000b00516d20a9334mr5067731lfe.22.1713170151745; Mon, 15
 Apr 2024 01:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240415083019.1867284-1-changqing.li@windriver.com>
In-Reply-To: <20240415083019.1867284-1-changqing.li@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 15 Apr 2024 10:35:39 +0200
Message-ID: <CA+chaQfNs02LRF4X8A1BsdotYA9ighoaZGqauNHoqGdN0rhYXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base.bbclass: make do_fetch depends on
 PREMIRRORS MIRRORS
To: changqing.li@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 08:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198223

How does this work when sharing sstate between builders with different
PREMIRRORS/MIRRORS? Doesn't this cause all signatures to be different
as do_unpack does depend on do_fetch?

On Mon, Apr 15, 2024 at 10:30=E2=80=AFAM Changqing Li via
lists.openembedded.org
<changqing.li=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> When there are tarballs in local mirror file://, do_fetch will
> create symlink under DL_DIR, eg:
> pseudo-prebuilt-2.33.tar.xz -> /project/path/to/localmirrorA/pseudo-prebu=
ilt-2.33.tar.xz
> after user update path from localmirrorA to localmirrorB, because
> do_fetch don't depends on PREMIRRORS/MIRRORS, do_fetch will not
> be rerun, so the symlink will not update to:
> pseudo-prebuilt-2.33.tar.xz -> /project/path/to/localmirrorB/pseudo-prebu=
ilt-2.33.tar.xz
> then, do_upack will failed since the tarball cannot be found.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/classes-global/base.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index 0999b42daa..5094a1540e 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -139,6 +139,7 @@ do_fetch[file-checksums] =3D "${@bb.fetch.get_checksu=
m_file_list(d)}"
>  do_fetch[file-checksums] +=3D " ${@get_lic_checksum_file_list(d)}"
>  do_fetch[prefuncs] +=3D "fetcher_hashes_dummyfunc"
>  do_fetch[network] =3D "1"
> +do_fetch[vardeps] +=3D "PREMIRRORS MIRRORS"
>  python base_do_fetch() {
>
>      src_uri =3D (d.getVar('SRC_URI') or "").split()
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198222): https://lists.openembedded.org/g/openembedde=
d-core/message/198222
> Mute This Topic: https://lists.openembedded.org/mt/105532159/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

