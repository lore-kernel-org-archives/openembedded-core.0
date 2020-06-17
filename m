Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.6529.1592397343713507391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 05:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RxXRGgte;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id q25so1824986wmj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 05:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DFmwmp2M88W4gPOBk5wngAUpL7UFG9+vzJGD5iZCYgU=;
        b=RxXRGgte1+cuFKK6RhhtLagUIT4lLvtvTs+iV8z410NbeH0ePPDRpP35vdqbT1KK8H
         vOG2MDFOPNpn2N8cOUPlYWa6TkrRNF59vsb5TvEaO03G5g2iVnp7G3DuQNu7RPFIKQff
         B+2PbMIaYhAP2n9WWyDdB5YO0DZph2/pMqJ6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DFmwmp2M88W4gPOBk5wngAUpL7UFG9+vzJGD5iZCYgU=;
        b=btO2SyImJe4S6A9r8IRTLR49T9tHFkMzbPouNV9sUFfMiW24Lfo9kBFtpVOGk66pm3
         OeqpongCpyH0FuCfHcsL61tSb/Lb39ip633qzaZS2OD8GWr2Vw9d9reW3WDlQbhiTTkf
         +wq/K7jLN8gigIJcDyOOxP6FEcEeWjfsLaf8mG13gtqFbPYom0JGq4kVpoopSevft6+r
         6fuzDgz0hy/g9QPcuSPqZ6Yoo0LH9fDrQkf8R7cv74TCAx3vJ1XDM6r3veDoZaG/cp03
         sF8MLnzgnrWpH/VZiFtUgYsV7+V8mn4cq2BWaqxUAerNuwhoVHzHPnCbg0fmg6iOiHzX
         dDxg==
X-Gm-Message-State: AOAM532PV7PCHmNozdg6ZH0ocAG7WBXB6tNnfUlZKN28Qy7ldN9N+Ydg
	rz+CLHppoEGLv8ry5v5fifQkcQ==
X-Google-Smtp-Source: ABdhPJwuKs8yUQOk2nC7fSb6XPocUCfTzdPWbscSeBVc6+NBtZM/xqvo8DN3oRc7PPzzq4j8FXwxMQ==
X-Received: by 2002:a1c:2d4d:: with SMTP id t74mr9008609wmt.177.1592397342317;
        Wed, 17 Jun 2020 05:35:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g19sm223563wmh.29.2020.06.17.05.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 05:35:41 -0700 (PDT)
Message-ID: <49b05d0672f3fa4b90d1a11df522b1a47f48c5ec.camel@linuxfoundation.org>
Subject: Re: grub-efi-native: use RDEPENDS on grub-native instead of duplicating tools?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, Christopher Clark
	 <christopher.w.clark@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jun 2020 13:35:40 +0100
In-Reply-To: <6cbda490-30ea-aab9-7657-b1fe809324dd@gmail.com>
References: <20190413144853.3765-1-jacob.kroon@gmail.com>
	 <CACMJ4GaTed_mZsxhP2A_60AN1pmg-OfJDk=Zf-hTqZoC4YorjQ@mail.gmail.com>
	 <7f904c18-4aa0-a671-557b-bc9136ed3a94@gmail.com>
	 <6cbda490-30ea-aab9-7657-b1fe809324dd@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-06-17 at 11:15 +0200, Jacob Kroon wrote:
> On 6/17/20 8:07 AM, Jacob Kroon wrote:
> > On 6/17/20 4:28 AM, Christopher Clark wrote:
> > > was: Re: [OE-core] [PATCH] grub-efi-native: Install grub-editenv
> > > 
> > > On Sat, Apr 13, 2019 at 7:49 AM Jacob Kroon <
> > > jacob.kroon@gmail.com> 
> > > wrote:
> > > > Having a native version of grub-editenv around can be useful
> > > > for
> > > > setting the targets grub environment.
> > > 
> > > Would it be acceptable to replace the tools being packaged in
> > > grub-efi-native with a RDEPENDS from grub-efi-native to grub-
> > > native,
> > > and so use the grub-mkimage and grub-editenv tools from the grub
> > > recipe instead?
> > > 
> > > The problem I'm encountering with the current dual packaging of
> > > grub-mkimage and grub-editenv tools, in both grub and grub-efi
> > > recipes, is that it prevents grub-native and grub-efi-native from
> > > being installed concurrently, and breaks my image build:
> > > 
> > > ERROR: xen-image-minimal-1.0-r0 do_image_wic: The file
> > > /usr/bin/grub-mkimage is installed by both grub-efi-native and
> > > grub-native, aborting
> > > 
> > > There's a wic script here:
> > > openembedded-core/scripts/lib/wic/plugins/source/bootimg-
> > > biosplusefi.py
> > > that may also be affected since it creates a boot partition with
> > > both
> > > legacy and EFI content.
> > > 
> > > The patch below resolves the error that I encountered. Does this 
> > > change look OK?
> > > 
> > > Christopher
> > > 
> > > 
> > > diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb
> > > b/meta/recipes-bsp/grub/grub-efi_2.04.bb
> > > index b9d6225d27..5dd3398540 100644
> > > --- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
> > > +++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
> > > @@ -6,6 +6,7 @@ GRUBPLATFORM = "efi"
> > > 
> > >   DEPENDS_append_class-target = " grub-efi-native"
> > >   RDEPENDS_${PN}_class-target = "grub-common virtual/grub-
> > > bootconf"
> > > +RDEPENDS_${PN}_class-native = "grub-native"
> > > 
> > >   SRC_URI += " \
> > >              file://cfg \
> > > @@ -61,9 +62,7 @@ do_install_append_class-target() {
> > >   }
> > > 
> > >   do_install_class-native() {
> > > -       install -d ${D}${bindir}
> > > -       install -m 755 grub-mkimage ${D}${bindir}
> > > -       install -m 755 grub-editenv ${D}${bindir}
> > > +        :
> > >   }
> > > 
> > >   do_install_class-target() {
> > > 
> > 
> > This change looks good to me. I added 'grub-editenv' before
> > realizing 
> > that the tools were duplicated in 'grub', and I believe they are 
> > interchangeable.
> > 
> 
> .. but this make grub-efi-native's sysroot empty in my build. Which
> then 
> begs the question whether a native version of grub-efi is necessary
> at all ?

If someone can confirm these tools are the same and have no difference
in functionality, then yes, grub-native and grub-efi-native should be
merged.

Cheers,

Richard

