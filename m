Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F27C001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 16:31:05 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.24977.1690302655276208510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 09:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aw/rUMUy;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso84888941fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690302653; x=1690907453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExOKrUbrh6YP+u1t6Kv4yIFbrdWbxSnYv1o7QrKLkUs=;
        b=aw/rUMUyx+bxxu+EKpPIDKm2+xOe/ryDdIffUPaOwfllpPVL79AxjU4XtOFcKUPqEF
         s3hGSTPgFFjlQdQ7r4V2MVCGGuqXz1QdEmkFMmPC35GSXLZQI6mkYwZwWRcbTz6Fttxy
         /TI2KvTyYInW8aImSAP9xhRfch8zgGFC7T50cgLecb6BlOR3gmTSwIVEVsbYC49mnsu6
         LurjdnDYJzz2vIG7slasLho8Liu8J/3Y8qYa1Pomaj9ZeB2Iq1qcHSdCoN43LXKoDYn3
         G484GWmHNhhCSokFMrWDrmgXWcj+7So32hDoBG2bqtqvOZAi5RwrL4+iH1HCR7Nt70HA
         p8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690302653; x=1690907453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExOKrUbrh6YP+u1t6Kv4yIFbrdWbxSnYv1o7QrKLkUs=;
        b=jniYX2QUG6+QBNio/tHHD9MnVvIVpurNXWIXodkPziS4HfihIt4MLTXOL2HEM5L7ha
         t62ADIx17dZEN2bt9BJFtYGTH36rYzccD7AOe931F9eyjcj56WIb4shaFRTmHek9fMEP
         12CkfrNQgtAeScCq7ZgCJZoxovrQKZQqj2BHg0sBGem2bCALtnEmIC1D4JALdJcBKum3
         JNnXZRAMj1UGZVyol8EHNUrcAjMfVmRWv7PHqNxo+gTzu1e637DO7YSYngv52cStvD4D
         XksuCqc9cZ2oKXwO660YGifjJ4e7fXx8vuOf/T+7/XnXHjjDnGsyjq8kWnc+aO0Sp4Uf
         F/AA==
X-Gm-Message-State: ABy/qLYEvSLdpgB9pZVuSSI5FxFbPtEImgQV7ZAfXlUgvFffZ89OVsMW
	4Y/CZMPsjX3+3EBFR6J7poOEIvy9Am4FCL3MAeY=
X-Google-Smtp-Source: APBJJlG9msWQMGw+PYTyO/Z06nqpU+qlm0Glif6heuLYMoX1IWC92OAFReFmT2KrYVsSp31jDl2gidu68NZ8lreQLyI=
X-Received: by 2002:a2e:7317:0:b0:2b9:a25f:a7af with SMTP id
 o23-20020a2e7317000000b002b9a25fa7afmr1735542ljc.44.1690302653172; Tue, 25
 Jul 2023 09:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230725135719.388231-1-zboszor@gmail.com>
In-Reply-To: <20230725135719.388231-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Jul 2023 18:30:42 +0200
Message-ID: <CANNYZj9_AbGN9YsahpHVHA8wqingZaKfv-DD_DPGURt4ezPn5Q@mail.gmail.com>
Subject: Re: [PATCH] rpm: Allow setting platform macro settings externally
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 16:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184852

I would want to hold this until we have a reaction from upstream.

RPM_CUSTOM_* exports should go to specific tasks where they are needed.

Alex

On Tue, 25 Jul 2023 at 15:57, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbosz=
or@gmail.com> wrote:
>
> Feed platform settings to installplatform externally. Based on the patch
> submitted under https://github.com/rpm-software-management/rpm/pull/2579
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  ...ng-plaform-macro-settings-externally.patch | 56 +++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.18.1.bb       | 17 ++++++
>  2 files changed, 73 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-setting-pl=
aform-macro-settings-externally.patch
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-m=
acro-settings-externally.patch b/meta/recipes-devtools/rpm/files/0001-Allow=
-setting-plaform-macro-settings-externally.patch
> new file mode 100644
> index 0000000000..8b3220f114
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-plaform-macro-se=
ttings-externally.patch
> @@ -0,0 +1,56 @@
> +From 320f4f3861dad70342f065004311eac143d6522d Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA=
9nyi?=3D
> + <zboszor@gmail.com>
> +Date: Tue, 25 Jul 2023 10:56:44 +0200
> +Subject: [PATCH] Allow setting plaform macro settings externally
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Yocto has their own way to set the platform names via BSPs
> +(Board Support Packages). These names are more specific than
> +basic CPU architectures, and such a platform name ends up in
> +/etc/rpm/platform but the corresponding subdirectory under
> +/usr/lib/rpm/platform does not exist.
> +
> +Allow creating such custom platform subdirectory with feeding
> +the necessary data using external variables: RPM_CUSTOM_ARCH,
> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
> +and RPM_CUSTOM_CANONCOLOR
> +
> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/r=
pm/pull/2579]
> +---
> + installplatform | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/installplatform b/installplatform
> +index a5ad7c5b8..59f57697b 100755
> +--- a/installplatform
> ++++ b/installplatform
> +@@ -11,7 +11,7 @@ VENDOR=3D"${4}"
> + OS=3D"${5}"
> + RPMRC_GNU=3D"${6}"
> +
> +-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
> ++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2` ${RPM_CUSTOM=
_ARCH:+custom}; do
> +   RPMRC_OPTFLAGS=3D"`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
> +   RPMRC_OPTFLAGS=3D"`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
> +   case $RPMRC_OPTFLAGS in
> +@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d:=
 -f2`; do
> +   CANONCOLOR=3D
> +   FILTER=3Dcat
> +   case "${ARCH}" in
> ++    custom)
> ++      ARCH=3D$RPM_CUSTOM_ARCH
> ++      ISANAME=3D$RPM_CUSTOM_ISANAME
> ++      ISABITS=3D$RPM_CUSTOM_ISABITS
> ++      CANONARCH=3D$RPM_CUSTOM_CANONARCH
> ++      CANONCOLOR=3D$RPM_CUSTOM_CANONCOLOR
> ++    ;;
> +     sparc64*)
> +       ISANAME=3Dsparc
> +       ISABITS=3D64
> +--
> +2.41.0
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devto=
ols/rpm/rpm_4.18.1.bb
> index 95a9e92f96..bc036fc843 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> @@ -40,6 +40,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/r=
pm;branch=3Drpm-4.18.x;protoc
>             file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.=
patch \
>             file://fix-declaration.patch \
>             file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
> +           file://0001-Allow-setting-plaform-macro-settings-externally.p=
atch \
>             "
>
>  PE =3D "1"
> @@ -103,6 +104,21 @@ WRAPPER_TOOLS =3D " \
>     ${libdir}/rpm/rpmdeps \
>  "
>
> +def rpm_isaname(d):
> +    import re
> +    arch =3D d.getVar('TARGET_ARCH')
> +    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
> +        return "x86"
> +    # Add more platform tweaks for ISANAME as needed
> +    return arch
> +
> +export RPM_CUSTOM_ARCH =3D "${MACHINE_ARCH}"
> +export RPM_CUSTOM_ISANAME =3D "${@rpm_isaname(d)}"
> +export RPM_CUSTOM_ISABITS =3D "${SITEINFO_BITS}"
> +export RPM_CUSTOM_CANONARCH =3D "${TARGET_ARCH}"
> +# CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for a 64-=
bit platform
> +export RPM_CUSTOM_CANONCOLOR =3D "${@bb.utils.contains('DISTRO_FEATURES'=
, 'multilib', '3', '0', d)}"
> +
>  do_configure:prepend() {
>          mkdir -p ${S}/build-aux
>  }
> @@ -132,6 +148,7 @@ do_install:append:class-nativesdk() {
>  do_install:append:class-target() {
>      rm -rf ${D}/var
>  }
> +
>  do_install:append:class-nativesdk() {
>      rm -rf ${D}${SDKPATHNATIVE}/var
>      # Ensure find-debuginfo is located correctly inside SDK
> --
> 2.41.0
>

