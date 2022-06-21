Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69E2C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 14:02:24 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web08.43829.1655820134259284126
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SNYnYskn;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id e4so15582702ljl.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ChF0LaDBeD0CPA8Jt1oD+SGB5qj/RD+r8grLJ55yfIY=;
        b=SNYnYsknp91dGsPb4Wo16l1png6ZnoB8fmoWcFkGZOwTDkXFThYzyKY+yW1HgXMNI6
         2wHcS67MsoIz3uYwLzWnZ8ELwe9dk6g6csV5rnAhBtIvGZP5AD0erSdP17PFwBG+i/2T
         wpybMuBU++c7jx5u30Kg+EL74a9mu11Mzy5d2H99CsBoiurDgh2iYM70wwgWsNgrtZFe
         D8USXgXlRAhcJ1yffKrUJAW2dFzkC/kh3JncQ+hppfkjySkCwf+koGkuxc29n4cEUYQY
         e9Z9jEnRPGbXok58gx9QGZRavOCWa95v+r+KmuPzctgy5cs59rxtveRRPVaeNS6jlxBV
         rP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ChF0LaDBeD0CPA8Jt1oD+SGB5qj/RD+r8grLJ55yfIY=;
        b=hJHSxKoA8Sg3sjz9d94X4jpoEwVNRknUopiULLI3kG8uVBJst5AfJ6RhpQnYQXIbuo
         hA7c8lKfBvAr+a83xEFbpfGQ6Nw8fLcVip4Do5JI00i+Ya0fOSz69Cu4zI7SkQ3DiOrq
         JHtHaHVd+S/wu9DERE3WGriSVQBTszC5861s20HJl32xTqAjs47nlC52GxzQJenV04Px
         iuac0mz/YeS3fNZ7109Sj3tIdf7p65iudr1tXRH6rkPFpaSaT0OZO6dn+KMl3A6jbmrU
         5OxHkDppUp84/5DHVDEwWAlabZ5UlAI4yydpE56fzKfdfKesF8X4iihiNWhkiqNes4Lv
         NwVw==
X-Gm-Message-State: AJIora+a/IPVerKPVhVv3KDUccIm4GCRbK/a4inc681wHMD5mLqCPjbl
	UZ6jMR+f5FAZJ66NmAB2xKRVFmSbfRjLBvn7E7M=
X-Google-Smtp-Source: 
 AGRyM1snyJ0AjmbJnDGZAgQrisb81rn2r7pdpmTOmMbgYuiZ6bPRcT6MgpAIPfqzplnqyhgIKrXY3Dv6zFWNItO0gZ0=
X-Received: by 2002:a2e:a812:0:b0:255:4aaf:c1fc with SMTP id
 l18-20020a2ea812000000b002554aafc1fcmr14368127ljq.257.1655820130731; Tue, 21
 Jun 2022 07:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220621140045.3318362-1-muhammad_hamza@mentor.com>
In-Reply-To: <20220621140045.3318362-1-muhammad_hamza@mentor.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Jun 2022 16:01:59 +0200
Message-ID: 
 <CANNYZj-tbYGgS_=_PGTEqVGVRcj10qwUtQDEzcwz4K8vH51JBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] connman: implement network interface management
 techniques
To: Muhammad Hamza <Muhammad_Hamza@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 14:02:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167152

This looks like it should be going to connman upstream, not to
openembedded-core?

Alex

On Tue, 21 Jun 2022 at 16:01, Muhammad Hamza <Muhammad_Hamza@mentor.com> wr=
ote:
>
> This is required to obtain a managed network interface before connman
> tries to call cleanup_devices function, this will let connman
> create new routing table without bringing down the ethernet interface.
>
> Signed-off-by: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
> Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
> ---
>  ...t-network-interface-management-techn.patch | 31 +++++++++++++++++++
>  .../connman/connman_1.41.bb                   |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-connectivity/connman/connman/0001-connma=
n-implement-network-interface-management-techn.patch
>
> diff --git a/meta/recipes-connectivity/connman/connman/0001-connman-imple=
ment-network-interface-management-techn.patch b/meta/recipes-connectivity/c=
onnman/connman/0001-connman-implement-network-interface-management-techn.pa=
tch
> new file mode 100644
> index 0000000000..06695ea566
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/0001-connman-implement-ne=
twork-interface-management-techn.patch
> @@ -0,0 +1,31 @@
> +From e6dedb531096f29825bddaf428ca8d3c4ad1df26 Mon Sep 17 00:00:00 2001
> +From: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
> +Date: Tue, 1 Jul 2014 23:47:15 +0530
> +Subject: [PATCH] connman: implement network interface management techniq=
ues
> +
> +This is required to obtain a managed network interface before connman
> +tries to call cleanup_devices function, this will let connman
> +create new routing table without bringing down the ethernet interface.
> +
> +Signed-off-by: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
> +
> +---
> + src/connman.service.in | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/connman.service.in b/src/connman.service.in
> +index 79e75d6..0e7275a 100644
> +--- a/src/connman.service.in
> ++++ b/src/connman.service.in
> +@@ -12,7 +12,10 @@ Conflicts=3Dsystemd-resolved.service
> + Type=3Ddbus
> + BusName=3Dnet.connman
> + Restart=3Don-failure
> +-ExecStart=3D@sbindir@/connmand -n
> ++EnvironmentFile=3D-/tmp/connman.env
> ++ExecStartPre=3D/bin/sh -c "if grep 'nfsroot\|ip=3D' /proc/cmdline; then=
 ETH_IFACE=3D$(ip addr | grep 'eth[0-9]:' | grep 'UP' | sed -e 's,\(eth[0-9=
]\)\(.*\),\1,' -e 's,^.*: ,,' ); NET_ADDR=3D$(cat /proc/cmdline | sed -ne '=
s/^.*ip=3D\([^ :]*\).*$/\1/p'); echo -e 'OPT=3D-I '$ETH_IFACE'\nOPT2=3D'$ET=
H_IFACE'\nNET_ADDR=3D'$NET_ADDR' ' > /tmp/connman.env; fi "
> ++ExecStart=3D/bin/sh -c "if [ \"$NET_ADDR\" =3D \"off\" ] || [ \"$NET_AD=
DR\" =3D \"none\" ]; then /usr/sbin/connmand -n; else /usr/sbin/connmand -n=
 $OPT; fi"
> ++ExecStartPost=3D/bin/sh -c "if [ ! -z \"$OPT\" ] && [ \"$NET_ADDR\" =3D=
 \"dhcp\" ]; then /sbin/udhcpc -i $OPT2; fi"
> + StandardOutput=3Dnull
> + CapabilityBoundingSet=3DCAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_NET_RAW =
CAP_SYS_TIME CAP_SYS_MODULE CAP_SYS_ADMIN
> + ProtectHome=3Dtrue
> diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/rec=
ipes-connectivity/connman/connman_1.41.bb
> index 736b78eaeb..9c09a71f46 100644
> --- a/meta/recipes-connectivity/connman/connman_1.41.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.41.bb
> @@ -5,6 +5,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${B=
P}.tar.xz \
>             file://0001-connman.service-stop-systemd-resolved-when-we-use=
-co.patch \
>             file://connman \
>             file://no-version-scripts.patch \
> +           file://0001-connman-implement-network-interface-management-te=
chn.patch \
>             "
>
>  SRC_URI:append:libc-musl =3D " file://0002-resolve-musl-does-not-impleme=
nt-res_ninit.patch"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167151): https://lists.openembedded.org/g/openembedde=
d-core/message/167151
> Mute This Topic: https://lists.openembedded.org/mt/91900036/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

