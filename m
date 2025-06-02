Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95751C5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 21:37:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7215.1748900262421362214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 14:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NpbXERqW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so53606195e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 14:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748900261; x=1749505061; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlpDFhAkaQ7YsZhAzN9s5v8c4KUFka2hybsOYTZpWOM=;
        b=NpbXERqWd0TJ2VBND6BzIoRlQOK1NP/fCpdPxEV9RBpHU0TxRqD8oDVm1mz1NRxQrb
         qb/b6agW0c/BkpRfPU1hLrXtJBIjoBxcvxLVeZokaA2hx8Wafzpx9aQEzb0KpnnhV/wV
         AX14pd7qe0nqjaZgcJRXJ9OYdlsxEaG7dRxqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748900261; x=1749505061;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KlpDFhAkaQ7YsZhAzN9s5v8c4KUFka2hybsOYTZpWOM=;
        b=MwuvRT1e1R8KoteuAl1tisimsWms7CEO0zQzBHdMHA9OmcAUD7CtdqKmQsK9RZtBh7
         4Pe+oNKuBoFkULxVduvuaaQUFZV0Cj8hnPMWWEpTsKt1j7bTzZf4oaShX3v29DLjMuDF
         GZrWDLIOffwcF9GehFFaZa/uJNQH4BnVA4KJnvM2jzzqdHlqnraJCUTi+dJkuzxKSFcJ
         +pu6FL4w0s0LG2KqzIJPqXmhkz8tgVW08TtvLyZ5r+0HB7Ogh8FGiWSkn2/2fg2VgQMI
         cp5nhMVQpqShgzfmZyFoyI9TLbhevYSZJdS7LTKLi6UVrpgoFpCjh3vl9V5QuMUkaMb3
         XWRw==
X-Forwarded-Encrypted: i=1; AJvYcCVIUQgWahJcubV0iVUvrbnMffsVvTIErsRSzV3UUw2N9J7RR0jxw+CtN7Nfa1H4jITk0Ggjps4x2WKz7f/slKErxQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyo917aLkScq/EDAgTknL+aiAqe1A+6Bwf3sDp3o/FzPeZTRt9e
	kOUXVgXP5ufzXkY0blct2q9W3x7gi9rcD3B2a9uqSnZJQ2JsaeCjQ8njZmkQw2bFabZOnrfOJFt
	l0dG3hjk=
X-Gm-Gg: ASbGnctoX1UNfBCYXXd/hYzmWDhUDZ7H7ASYuu81fmv2coWGG8yVKonipEZAfOv0SWe
	rHhkp6xQ81v1EPyRtYI4LNg6IWS7JtX3Ae9SDOkE29p4oE/9L7mW1jZ0WSOFdv53rbt3wJ6qYw4
	2ApNQQG5TdI6Byst82GT/XRVJ+bgKIEN6DMA0THGD11lpieWU8tPSF8KzCM6LXzSgPL/NTCF8OO
	pzXbvI4xmGwTP0iHQc15R4Ue5yIcA8H/ca+HNEDhC3NVYARIbddkjjEJq2rPsgUorAM2TJxlyIc
	LelEsx+clmLx10gD2PBYm68czm10pQkk1ms/HAD0u4pISGE5EYpprnM3Vq+JFDDEkkXuc0p5Nqu
	RVU7UsPOf6hQnKHYhb9HnPWLJLiDXQbsb7rxu78jCaHx87OXwUrM=
X-Google-Smtp-Source: AGHT+IGn7uRjFlXJn5NFrTQzBsp+p0LsjeFarw1I+t43AHwr1insDgs0h61ZHUbjOa+p8LAn7FA2ag==
X-Received: by 2002:a05:600c:5494:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-4511ecc2522mr76115965e9.11.1748900260815;
        Mon, 02 Jun 2025 14:37:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f190:efe6:7bd4:a92a? ([2001:8b0:aba:5f3c:f190:efe6:7bd4:a92a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fa249esm141408245e9.13.2025.06.02.14.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 14:37:40 -0700 (PDT)
Message-ID: <31284b0f55e3c18957c9340cc399f1c0c9a8410a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes-recipe/image: Add variable to create
 rootfs with a exact size
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: fbberton@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 02 Jun 2025 22:37:39 +0100
In-Reply-To: <20250602213004.2123954-1-fbberton@gmail.com>
References: <20250602213004.2123954-1-fbberton@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 21:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217737

On Mon, 2025-06-02 at 22:30 +0100, Fabio Berton via lists.openembedded.org =
wrote:
> From: Fabio Berton <fabio.berton@criticaltechworks.com>
>=20
> Add the IMAGE_ROOTFS_EXACT_SIZE variable to allow the creation of a root
> filesystem with an exact size as specified by the user. This bypasses
> the default size calculation done by the get_rootfs_size function.
>=20
> This feature is useful for creating a small ext4 filesystem with a block
> size of 1k. The get_rootfs_size function uses a block size of 4k to
> determine the size of IMAGE_ROOTFS, which may be larger than the value
> set in IMAGE_ROOTFS_SIZE. If an ext4 rootfs with a block size of 1K is
> nearly full, the .ext4 file generated by Yocto will be larger than
> expected due to the way get_rootfs_size calculates the size.
>=20
> By using IMAGE_ROOTFS_EXACT_SIZE, users can specify the exact size
> required. Users should ensure that the size is set correctly according
> to the filesystem requirements. It is not easy to predict the block size
> that is used by a filesystem because it can be set by a parameter or it
> can be added automatically by the tool that creates the file system.
>=20
> Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
> ---
> =C2=A0meta/classes-recipe/image.bbclass | 13 +++++++++----
> =C2=A01 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/imag=
e.bbclass
> index 24a19fce1a..2df0a5c30d 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -132,7 +132,7 @@ python () {
> =C2=A0
> =C2=A0def rootfs_variables(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 from oe.rootfs import variable_depends
> -=C2=A0=C2=A0=C2=A0 variables =3D ['IMAGE_DEVICE_TABLE','IMAGE_DEVICE_TAB=
LES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT=
','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE',
> +=C2=A0=C2=A0=C2=A0 variables =3D ['IMAGE_DEVICE_TABLE','IMAGE_DEVICE_TAB=
LES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT=
','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE', 'IMAGE_ROOTFS_EXACT_SIZE', '=
IMAGE_ROOTFS_EXTRA_SPACE',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_L=
INK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTAL=
L_COMPLEMENTARY','IMAGE_LINGUAS', 'IMAGE_LINGUAS_COMPLEMENTARY', 'IMAGE_LOC=
ALES_ARCHIVE',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS=
','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GL=
OBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VE=
NDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYD=
IR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
> @@ -594,9 +594,14 @@ def get_rootfs_size(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 return base_size
> =C2=A0
> =C2=A0python set_image_size () {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rootfs_size =3D get_rootfs_si=
ze(d)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar('ROOTFS_SIZE', str(r=
ootfs_size))
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVarFlag('ROOTFS_SIZE', '=
export', '1')
> +=C2=A0=C2=A0=C2=A0 rootfs_size =3D d.getVar('IMAGE_ROOTFS_EXACT_SIZE')
> +=C2=A0=C2=A0=C2=A0 # If IMAGE_ROOTFS_EXACT_SIZE variable is not set, use=
 the result of
> +=C2=A0=C2=A0=C2=A0 # get_rootfs_size as ROOTFS_SIZE.
> +=C2=A0=C2=A0=C2=A0 if not rootfs_size:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rootfs_size =3D str(get_rootf=
s_size(d))
> +
> +=C2=A0=C2=A0=C2=A0 d.setVar('ROOTFS_SIZE', rootfs_size)
> +=C2=A0=C2=A0=C2=A0 d.setVarFlag('ROOTFS_SIZE', 'export', '1')
> =C2=A0}
>=20

I am loathed to add yet another rootfs size variable. This is like
having variables like:

IMAGE_ROOTFS_SIZE
IMAGE_ROOTFS_REALLY_THIS_SIZE
IMAGE_ROOTFS_REALLY_REALLY_THIS_SIZE
IMAGE_ROOTFS_REALLY_THIS_EXACT_SIZE

and then you don't know if "really really" wins compared to "really
this exact" or not without looking at the docs. It isn't a good
interface.

If we were to add one, shouldn't it be in the get_rootfs_size()
function along with the rest of the logic? Would it be better to set
the block size somewhere instead?

I'd also point out there are no tests for it.

Cheers,

Richard

