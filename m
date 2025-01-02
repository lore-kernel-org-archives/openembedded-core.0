Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B058EE77198
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 18:33:30 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.14147.1735842804890678144
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 10:33:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SWI/pY5O;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.175, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e399e904940so13173083276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 10:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735842804; x=1736447604; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qi8OwxuzVWOLe+bKpWVKEMHdHNnr/F1sFHzT6j1xunU=;
        b=SWI/pY5OvFVl2IhhrNGjHaLuOL54YZf+Ampf0h3RnvSWxmlkOAIWalfPmstjTXs1ii
         qsJvJujtYgYE3qeQgVjJVe4FSv7yidzG013fmhcxr98fq+Ys+hYe1t8jpVvoz2XLd3DH
         /h+zv5KxNUJ2RNIbWNj1SwaYh3cMJBT5rMDUVJOSJYUnnO6biSB4B7h75Kvle+lVLQrz
         gb4kByHfGv9B7yjC1snRGnPgPsi/ySPMNOMRf5qSDq4Iz+x01+dP2o2JJv1ITkpVZuJT
         dc76Od7iQmKFK+eI46pjefZwCImibFpN+pCPnGt5W/JufPq+hbi9L0qmYkwbVxLEw4VW
         vEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735842804; x=1736447604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi8OwxuzVWOLe+bKpWVKEMHdHNnr/F1sFHzT6j1xunU=;
        b=n0JmKtvx5wEtMwFXBlKQfzwj/TLe/xhhQRVNM1fOmthqz4BaEU5mLa1VnOXQAiMYYK
         8cMdGisp/+lOBxSQdDn7VaFNJoidlhzy8xrLapoaoMC3l29FQ91kb9iCON7QXPXdg3d1
         nJ1wJhfTXFNciJ0b8V7JNBUd+JS3aCFg3m6qgS/cn+25hlacfuD28/mQLh7qGM18bOVa
         Rb/5fFTUPJ9ow4W7eeLw4jhb3tUTrFuY0+StEBXWG58g71MPGE9w8eCf8vHu3/aXXLaI
         +KH12A9bfCPgTITOb+PGOkSwR9BpfEc8u7GDFkQBaQKfzUQiLbvaQcZY7oc9rMaj4zNz
         v0zA==
X-Gm-Message-State: AOJu0Yw5hWHzmPP36QxMmnuNUTXqVX3YcyYGklh8ZvldbUej5AWuGsW+
	ajNQ5jWMeyuTJSD15OTu99Ot9/fRVD4co934hmrrtrF4Yq4R7cZgInczkFtGLRSfEK1N2gAltdB
	xlmg7vkoAmAtDI84W8hH0EjKp/c5AwkK+ScWz2/26+cp/LQz9Uu4=
X-Gm-Gg: ASbGncuOwRnxpGZ/GyliBWuAmHYBTnqyVrluAeb8TWRGGU0+x1BXyNpsZ8NfGrldNJa
	2w8lm9TBuHfKVRXNp0GqbogPHxj1xY7h3OTYdGg==
X-Google-Smtp-Source: AGHT+IGj46+xOMVjoWlfuo43nuq0RkWfCsVqmOaDKiOsf6NuL2THpsKcbpiSc0kqMT574K3l7hCcRI7fh5klmFpQYDc=
X-Received: by 2002:a05:690c:4c0d:b0:6ef:6c57:ddb6 with SMTP id
 00721157ae682-6f3f82236b3mr401180937b3.29.1735842803882; Thu, 02 Jan 2025
 10:33:23 -0800 (PST)
MIME-Version: 1.0
References: <20241230143258.2992487-1-hongxu.jia@windriver.com>
In-Reply-To: <20241230143258.2992487-1-hongxu.jia@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 2 Jan 2025 10:33:13 -0800
Message-ID: <CAOSpxdZhrX_jGEoC=cUP9oZg0XWxFwuvohOX5aRNNXC73g1h+w@mail.gmail.com>
Subject: Re: [scarthgap][PATCH] ovmf: fix CVE-2024-38805
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 18:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209311

Once again there are line ending issues :-(

I may need to pull them from a git repo like we did last time
(https://github.com/hongxu-jia/openembedded-core/tree/scarthgap
perhaps?)

Thanks,

Steve

On Mon, Dec 30, 2024 at 6:33=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> A malicious iSCSI target could reply to the iSCSI initiator with a
> malformed packet, causing out-of-bounds memory reads and writes.
> This most likely leads to a denial of service, as the write
> primitive should not be exploitable.
>
> References:
> https://github.com/tianocore/edk2/issues/10314
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...Dxe-add-checks-to-IScsiBuildKeyValue.patch | 60 +++++++++++++++++++
>  meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0001-NetworkPkg-IScsiDxe-=
add-checks-to-IScsiBuildKeyValue.patch
>
> diff --git a/meta/recipes-core/ovmf/ovmf/0001-NetworkPkg-IScsiDxe-add-che=
cks-to-IScsiBuildKeyValue.patch b/meta/recipes-core/ovmf/ovmf/0001-NetworkP=
kg-IScsiDxe-add-checks-to-IScsiBuildKeyValue.patch
> new file mode 100644
> index 0000000000..d121e066f6
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0001-NetworkPkg-IScsiDxe-add-checks-to-=
IScsiBuildKeyValue.patch
> @@ -0,0 +1,60 @@
> +From dfd8ef9a9e396c4979239e518525d0b77c7715da Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Sun, 29 Dec 2024 21:58:05 +0800
> +Subject: [PATCH] NetworkPkg/IScsiDxe: add checks to IScsiBuildKeyValueLi=
st
> +
> +Check we have any data left (Len > 0) before advancing the Data pointer
> +and reducing Len.  Avoids wrapping Len.
> +
> +Also replace the AsciiStrLen() call with an open-coded loop which
> +likewise checks Len to make sure we don't overrun the buffer.
> +
> +Bugzilla: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4207
> +Reported-by: Jeremy Boone <jeremy.boone@nccgroup.com>
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +CVE: CVE-2024-38805
> +Upstream-Status: Backport [https://edk2.groups.io/g/devel/message/106280=
]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + NetworkPkg/IScsiDxe/IScsiProto.c | 16 ++++++++++++----
> + 1 file changed, 12 insertions(+), 4 deletions(-)
> +
> +diff --git a/NetworkPkg/IScsiDxe/IScsiProto.c b/NetworkPkg/IScsiDxe/IScs=
iProto.c
> +index ef58764..88e7946 100644
> +--- a/NetworkPkg/IScsiDxe/IScsiProto.c
> ++++ b/NetworkPkg/IScsiDxe/IScsiProto.c
> +@@ -1903,9 +1903,8 @@ IScsiBuildKeyValueList (
> +       Data++;
> +     }
> +
> +-    if (*Data =3D=3D '=3D') {
> ++    if ((Len > 0) && (*Data =3D=3D '=3D')) {
> +       *Data =3D '\0';
> +-
> +       Data++;
> +       Len--;
> +     } else {
> +@@ -1917,8 +1916,17 @@ IScsiBuildKeyValueList (
> +
> +     InsertTailList (ListHead, &KeyValuePair->List);
> +
> +-    Data +=3D AsciiStrLen (KeyValuePair->Value) + 1;
> +-    Len  -=3D (UINT32)AsciiStrLen (KeyValuePair->Value) + 1;
> ++    while ((Len > 0) && (*Data !=3D '\0')) {
> ++      Len--;
> ++      Data++;
> ++    }
> ++
> ++    if ((Len > 0) && (*Data =3D=3D '\0')) {
> ++      Data++;
> ++      Len--;
> ++    } else {
> ++      goto ON_ERROR;
> ++    }
> +   }
> +
> +   return ListHead;
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
> index ada6ee72db..eeff5da991 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -26,6 +26,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;bran=
ch=3Dmaster;protocol=3Dhttps \
>             file://0004-reproducible.patch \
>             file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch =
\
>             file://0001-MdeModulePkg-Potential-UINT32-overflow-in-S3-Resu=
meC.patch \
> +           file://0001-NetworkPkg-IScsiDxe-add-checks-to-IScsiBuildKeyVa=
lue.patch \
>             "
>
>  PV =3D "edk2-stable202402"
> --
> 2.25.1
>

