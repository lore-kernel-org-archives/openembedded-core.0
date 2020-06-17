Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.3838.1592360908734426885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 19:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GdpkZG/t;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id b8so451705oic.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 19:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FH0n4aQl+fC2WAXSrBk6t0E5nHgClSpdhpOwHd21B9A=;
        b=GdpkZG/tXR5EyZI2QyrP0FG9d24ethTi1YYvx7EEfFUMV4uH59GdobNeHGSd6iG68R
         TJoF5pZYX/5VsXEtdiKBAI5mkudUQchBsUCtbgLC7R2HyOD30mN+hjsbSGDFwASwHC2L
         Bfmb5eEnCyeldsHcfzcTP0lWKE7GLUPCtmIL4HqUBC182kPZnqk0B4kzyXE80FPSY7c6
         IG4E6L0WRaKDcdOLJ5yNKLbWgN8Te7OPXniuPOviw2IAUvrN507a0h/y20+bwFCIU9NF
         EDwJrGnhUY57PG2bzeiNHh51o/ZY2hNiUz6gQnntk3k/b8/M/GTDm6SBw5ijjnzlMUtD
         Ofdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FH0n4aQl+fC2WAXSrBk6t0E5nHgClSpdhpOwHd21B9A=;
        b=fTp4lvdffCadQH0anoUw5BEljtwnWi3JojYgXAiglNEnhx6wJW7E0XcD+lpLf0LCAx
         R6MuQhZy4FJ7H98czoCJPCb4lDLQjIbPaLGYz4oNZw0BCC/itVHJgeZwTakSsBACb+cF
         8MUn839F6KBxt+tQ7djjK5W1Qg59RvnqhUpME0+9d/ciO/rmALnGHPMauIiCddGrpGQt
         2Vya/BluW10nXFBjydFMt6CvFAUL66EBjCKchk+oQ0IsU/S+k8+FdG5zgW/P98p8Uzj+
         Bwg01NKkVVEtkkU70S85+rD91TSF5JxDvK2MYgk7c3yYRA5C3yc0/zoinDHjEFANzHPn
         yitQ==
X-Gm-Message-State: AOAM530DWks5Kt61tvg188XL1jFbBWyZ5pc+ZERyxilwVgtWo0jflpd7
	m0sOT6Eoeo+g4CU+w+ffEFQECWLCEWGXlOSykD8=
X-Google-Smtp-Source: ABdhPJzVcjMCS4r0G2xU8xXJjnSBExHbi+xsF3th2Ff4IgbiMj3cj7MfI+xdbKrJDbjKEFO46iGwItsIdD666iwaX7c=
X-Received: by 2002:a54:4015:: with SMTP id x21mr5519382oie.161.1592360908079;
 Tue, 16 Jun 2020 19:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190413144853.3765-1-jacob.kroon@gmail.com>
In-Reply-To: <20190413144853.3765-1-jacob.kroon@gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 16 Jun 2020 19:28:16 -0700
Message-ID: <CACMJ4GaTed_mZsxhP2A_60AN1pmg-OfJDk=Zf-hTqZoC4YorjQ@mail.gmail.com>
Subject: grub-efi-native: use RDEPENDS on grub-native instead of duplicating tools?
To: Jacob Kroon <jacob.kroon@gmail.com>, 
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

was: Re: [OE-core] [PATCH] grub-efi-native: Install grub-editenv

On Sat, Apr 13, 2019 at 7:49 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> Having a native version of grub-editenv around can be useful for
> setting the targets grub environment.

Would it be acceptable to replace the tools being packaged in
grub-efi-native with a RDEPENDS from grub-efi-native to grub-native,
and so use the grub-mkimage and grub-editenv tools from the grub
recipe instead?

The problem I'm encountering with the current dual packaging of
grub-mkimage and grub-editenv tools, in both grub and grub-efi
recipes, is that it prevents grub-native and grub-efi-native from
being installed concurrently, and breaks my image build:

ERROR: xen-image-minimal-1.0-r0 do_image_wic: The file
/usr/bin/grub-mkimage is installed by both grub-efi-native and
grub-native, aborting

There's a wic script here:
openembedded-core/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
that may also be affected since it creates a boot partition with both
legacy and EFI content.

The patch below resolves the error that I encountered. Does this change look OK?

Christopher


diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb
b/meta/recipes-bsp/grub/grub-efi_2.04.bb
index b9d6225d27..5dd3398540 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -6,6 +6,7 @@ GRUBPLATFORM = "efi"

 DEPENDS_append_class-target = " grub-efi-native"
 RDEPENDS_${PN}_class-target = "grub-common virtual/grub-bootconf"
+RDEPENDS_${PN}_class-native = "grub-native"

 SRC_URI += " \
            file://cfg \
@@ -61,9 +62,7 @@ do_install_append_class-target() {
 }

 do_install_class-native() {
-       install -d ${D}${bindir}
-       install -m 755 grub-mkimage ${D}${bindir}
-       install -m 755 grub-editenv ${D}${bindir}
+        :
 }

 do_install_class-target() {



>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/recipes-bsp/grub/grub-efi_2.02.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
> index 14fce97ff0..6dbd23a3c7 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
> @@ -70,6 +70,7 @@ do_install_append_class-target() {
>  do_install_class-native() {
>         install -d ${D}${bindir}
>         install -m 755 grub-mkimage ${D}${bindir}
> +       install -m 755 grub-editenv ${D}${bindir}
>  }
>
>  do_install_class-target() {
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
