Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7C5C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 10:06:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.18573.1709633171297725450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 02:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=it4N0r6l;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412e0feb40eso15224015e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 02:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709633170; x=1710237970; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdTSJKypOu33j99xEzE34aYit6fNpgezQMkaTe+BIB8=;
        b=it4N0r6lFFSvb6TRvKlgvdtsJzB6Q21JqA4Ys3VVAsIFJLy1gW3f1agLRjRFev3pNt
         61xWmQ+RwRfdUDN9ZaO7Sq8S66FZwynwbHDmp1ye4O81ZNHD4YuMpQ8hTylqTgOXvugC
         Zxf9fyMPpOdorlhOTglQ3/m54ZrksjRVayFndEv+UfrTgm3RRt2LGotBBIEIHQf58VAG
         AgtT9xghhyOB0VUxJ4vvSKacc0jrI4toZS+WjtS2OoGkOfR29b2dmOP21G3MuTvHKhw3
         wER2VFjYZwUdx8slBZUpLDpUw/99W//9PwDwEk1b9oifibYve5efsqcvgJRGwxIVRTas
         yf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709633170; x=1710237970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdTSJKypOu33j99xEzE34aYit6fNpgezQMkaTe+BIB8=;
        b=qDlyR2JXTFP2uPuHphox4pAwgHWF/naNBYVdb67vc5gyFdX7EjJ2KLgGrVYyq+7Mp8
         f21BOiG5l5MKFqYCY9IUuQEt1zeEAbDzTUSSTF2rmIx1q6Hr2VzTaEvBb3FcgjXqGBA5
         6q15QhaNQAarZLt0GfxivZPnE6tZ4iIghdq8QT4HMKDcULN+AIhiIpYScxuJlZJTaKgr
         b8SbQcJMk/VjMfN+YNLPp6FXLpspajHmAln8TKgfww3mmy/9eS7W5wBMjN5X6dGoZ/Yq
         W92BlphQsBocGSFaji6jyaaidAD6s9ii/OYxTQx/9v50/aaRXOyFZxOhXN0K/o5uHxq9
         SuPg==
X-Gm-Message-State: AOJu0YyHWxuCdzakasL+mX2ii/i89E6xCc7+pVPcC00y8Dt+fT/lpaIM
	KOXPQNFm8jJZn530HESjzrr9t/TwqQWSAvkaMkEJLW9YMHeeZ0RSV6Tn+UikBohEisVkA538EPn
	UgTpjRCfDD7HlsAzllBwhrgMKsWU04nPMlRo=
X-Google-Smtp-Source: AGHT+IFMZvDLar7cgFDMrO2mdxWx/IzzH3HJsas4VDVFgszCMDLJS7i83oUH1bd4rv1X3jo88fb+wqx4KTRTPRhE3v0=
X-Received: by 2002:a05:600c:1546:b0:412:e7e1:b5c with SMTP id
 f6-20020a05600c154600b00412e7e10b5cmr2683095wmg.15.1709633169447; Tue, 05 Mar
 2024 02:06:09 -0800 (PST)
MIME-Version: 1.0
References: <20240305084540.12235-1-christian.taedcke-oss@weidmueller.com>
In-Reply-To: <20240305084540.12235-1-christian.taedcke-oss@weidmueller.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 5 Mar 2024 11:05:55 +0100
Message-ID: <CA+chaQdDGQgnCUefbaE5y5i+i1+4DESKmj1k=aix8w6a-NUiVQ@mail.gmail.com>
Subject: Re: [OE-core] image_types.bbclass: fix vfat image names
To: "Taedcke, Christian" <christian.taedcke-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org, 
	Christian Taedcke <christian.taedcke@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 10:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196629

LGTM, I'm sorry I've missed it when updating other types.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>

On Tue, Mar 5, 2024 at 9:46=E2=80=AFAM Taedcke, Christian
<christian.taedcke-oss@weidmueller.com> wrote:
>
> From: Christian Taedcke <christian.taedcke@weidmueller.com>
>
> Remove the appended ${IMAGE_NAME_SUFFIX}, since it is already included
> in ${IMAGE_NAME}.
>
> In commit 26d97acc7137 ("image-artifact-names: include
> ${IMAGE_NAME_SUFFIX} directly in both ${IMAGE_NAME} and
> ${IMAGE_LINK_NAME}") ${IMAGE_NAME_SUFFIX} was included into
> ${IMAGE_NAME}. In this commit all other filesystems in
> image_types.bbclass were adapted.
>
> Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
> ---
>  meta/classes-recipe/image_types.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recip=
e/image_types.bbclass
> index 3733bdfc20..1c3a88bd0f 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -133,8 +133,8 @@ IMAGE_CMD:erofs-lz4hc =3D "mkfs.erofs -zlz4hc ${EXTRA=
_IMAGECMD} ${IMGDEPLOYDIR}/${
>  # can (e.g. device files, symlinks, etc.) and therefore it not suitable =
for all
>  # use cases
>  oe_mkvfatfs () {
> -    mkfs.vfat $@ -C ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.vf=
at ${ROOTFS_SIZE}
> -    mcopy -i "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.vfat" -v=
smpQ ${IMAGE_ROOTFS}/* ::/
> +    mkfs.vfat $@ -C ${IMGDEPLOYDIR}/${IMAGE_NAME}.vfat ${ROOTFS_SIZE}
> +    mcopy -i "${IMGDEPLOYDIR}/${IMAGE_NAME}.vfat" -vsmpQ ${IMAGE_ROOTFS}=
/* ::/
>  }
>
>  IMAGE_CMD:vfat =3D "oe_mkvfatfs ${EXTRA_IMAGECMD}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196627): https://lists.openembedded.org/g/openembedde=
d-core/message/196627
> Mute This Topic: https://lists.openembedded.org/mt/104740857/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

