Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD60CEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 16:21:19 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.152.1687796476887425080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 09:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=NdmFbY9M;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51d946d2634so2004118a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687796475; x=1690388475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxnOgt/iqF9PGMnt8LOYbvIFjlL7Ecscewt8fzZ9yJs=;
        b=NdmFbY9MSv1F3DRsnFSJYMMn4WNCyFN3p6vJX/bHlEwvN/J+8VGndqsKwIlp8Gd1Bz
         GhR1OZvgrUhnLwlTsofS7/yZdMI+X6YnpuMlE9kgPr9eE4yA21VhXZGXjOg/ott3FcN/
         VBbkbL/Wa2oD13N1k/XwgOn9SkLkdV1Pz7Snxzp+Vgn3aKNjo8Ny4ONl+O0PfejS+Fy9
         xzgo7FyB5vUk5paFvvgDT3awomcfghRcsBtqpT/3ilIBsDVyigl9o/EvhVzzkaqZ8Rzr
         Pqwi/fyBglcmSurysNS18ppLEogGMuoTz8NRuKJpPZgG774UVfZlB7cttuH6BQ0XQ6kT
         04uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687796475; x=1690388475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxnOgt/iqF9PGMnt8LOYbvIFjlL7Ecscewt8fzZ9yJs=;
        b=G7KFf5W7sfjoK7u6p6uM3QTUy96u0GB+FgSWYImes8O90cEcQgn0O4/UYa9sMksbnp
         WlK/iqmJIrqJTjku4AYcmxJWYG24mk6VKFDb4av+664/XzKlh6iKWmoV4YOyt5vrkewY
         Ex7+3bZS5iuxyiTJZFHXPy6GLAWELZfzv333RyQNqP4Qg/5/lNOIR5nDlI5m0bwOxvrW
         xQYotDVQa3Zt9/nZRlfNvzeoqIX3Kx0nBdIhgxG0Y4/k2ZaftGjgVcfcwrbrgEI4J9cg
         j/hy17kXq3nnE+RdV5V2Q/jg1llOprJ5UIrzZPL0+7IGi15FtxBhtmsgd+zSwBp3CZfI
         vpbQ==
X-Gm-Message-State: AC+VfDxkMuSbbzXEX9YvPnuR4/YUr1OGvWyTX8sXOehlExuvCSRSFrwz
	jE6Kd8z11xwhY11qLHSAIzIjK77CptMKFR+BelCO3w==
X-Google-Smtp-Source: ACHHUZ5VfATYIY3M4dR5mfrzCz7uFm25fHkapfiV2rYtpT8x34sR0W4JcIYF9jRW5boyQIT9IRCroG2nGbv0XnDisk0=
X-Received: by 2002:a50:ee96:0:b0:518:82c4:cc7e with SMTP id
 f22-20020a50ee96000000b0051882c4cc7emr19007783edr.17.1687796474995; Mon, 26
 Jun 2023 09:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230626134000.426080-1-vkumbhar@mvista.com>
In-Reply-To: <20230626134000.426080-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 26 Jun 2023 06:21:03 -1000
Message-ID: <CAOSpxdYH872AVWKx=GWQcNKM=Sc_EajFdQm_T4v4J2oNRpBx2w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v2] libcap: fix CVE-2023-2603 Integer
 Overflow in _libcap_strdup()
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 16:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183423

On Mon, Jun 26, 2023 at 3:40=E2=80=AFAM vkumbhar <vkumbhar@mvista.com> wrot=
e:
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../libcap/files/CVE-2023-2603.patch          | 60 +++++++++++++++++++
>  meta/recipes-support/libcap/libcap_2.66.bb    |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2603.patch
>
> diff --git a/meta/recipes-support/libcap/files/CVE-2023-2603.patch b/meta=
/recipes-support/libcap/files/CVE-2023-2603.patch
> new file mode 100644
> index 0000000000..e09be78640
> --- /dev/null
> +++ b/meta/recipes-support/libcap/files/CVE-2023-2603.patch
> @@ -0,0 +1,60 @@
> +From 422bec25ae4a1ab03fd4d6f728695ed279173b18 Mon Sep 17 00:00:00 2001
> +From: "Andrew G. Morgan" <morgan@kernel.org>
> +Date: Wed, 3 May 2023 19:44:22 -0700
> +Subject: Large strings can confuse libcap's internal strdup code.
> +
> +Avoid something subtle with really long strings: 1073741823 should
> +be enough for anybody. This is an improved fix over something attempted
> +in libcap-2.55 to address some static analysis findings.
> +
> +Reviewing the library, cap_proc_root() and cap_launcher_set_chroot()
> +are the only two calls where the library is potentially exposed to a
> +user controlled string input.
> +
> +Credit for finding this bug in libcap goes to Richard Weinberger of
> +X41 D-Sec GmbH (https://x41-dsec.de/) who performed a security audit
> +of the libcap source code in April of 2023. The audit was sponsored
> +by the Open Source Technology Improvement Fund (https://ostif.org/).
> +
> +Audit ref: LCAP-CR-23-02 (CVE-2023-2603)
> +
> +Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
> +
> +Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/li=
bcap.git/commit/?id=3D422bec25ae4a1ab03fd4d6f728695ed279173b18]
> +CVE: CVE-2023-2603
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +
> +---
> + libcap/cap_alloc.c | 12 +++++++-----
> + 1 file changed, 7 insertions(+), 5 deletions(-)
> +
> +diff --git a/libcap/cap_alloc.c b/libcap/cap_alloc.c
> +index c826e7a..25f9981 100644
> +--- a/libcap/cap_alloc.c
> ++++ b/libcap/cap_alloc.c
> +@@ -105,15 +105,17 @@ char *_libcap_strdup(const char *old)
> +       errno =3D EINVAL;
> +       return NULL;
> +     }
> +-    len =3D strlen(old) + 1 + 2*sizeof(__u32);
> +-    if (len < sizeof(struct _cap_alloc_s)) {
> +-      len =3D sizeof(struct _cap_alloc_s);
> +-    }
> +-    if ((len & 0xffffffff) !=3D len) {
> ++
> ++    len =3D strlen(old);
> ++    if ((len & 0x3fffffff) !=3D len) {
> +       _cap_debug("len is too long for libcap to manage");
> +       errno =3D EINVAL;
> +       return NULL;
> +     }
> ++    len +=3D 1 + 2*sizeof(__u32);
> ++    if (len < sizeof(struct _cap_alloc_s)) {
> ++      len =3D sizeof(struct _cap_alloc_s);
> ++    }
> +
> +     raw_data =3D calloc(1, len);
> +     if (raw_data =3D=3D NULL) {
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/libcap/libcap_2.66.bb b/meta/recipes-su=
pport/libcap/libcap_2.66.bb
> index c50e9d8cc7..844ae58506 100644
> --- a/meta/recipes-support/libcap/libcap_2.66.bb
> +++ b/meta/recipes-support/libcap/libcap_2.66.bb
> @@ -19,6 +19,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/libs/security/li=
nux-privs/${BPN}2/${BPN}-${
>             "
>  SRC_URI:append:class-nativesdk =3D " \
>             file://0001-nativesdk-libcap-Raise-the-size-of-arrays-contain=
ing.patch \
> +           file://CVE-2023-2603.patch \

Did you really intend for this patch only to be applied for class-nativesdk=
?

Steve


>             "
>  SRC_URI[sha256sum] =3D "15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f86=
129c059a4bb466b2"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183418): https://lists.openembedded.org/g/openembedde=
d-core/message/183418
> Mute This Topic: https://lists.openembedded.org/mt/99787652/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

