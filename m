Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web12.4843.1592517522906517006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 14:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IIb6rLh6;
 spf=pass (domain: gmail.com, ip: 209.85.210.68, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f68.google.com with SMTP id g5so5784904otg.6
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 14:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FPTQPEpWaR1hFH/uT3gbzdLWWiculb6KorJhXc6tdZg=;
        b=IIb6rLh6Hu4Q6SCYD37QASg62xnujU40BS+dSxrwCp0G8wY9T4+LftrkUNdsdLXX2O
         +i035R5wuVwvoa7Z2W/1uTIEtdYfd22Zf/YodJ/B0uvjK5uNDV86bJi6QECRr0WMXFg6
         JSu1L04cmpMatn86GRBNUd8AKTz3B64R2g7hKd+M+muQHEq3HXh31IVEYQDzdNwrsSRy
         ErcVbe88hvlQQMA8z1YkUSIe6kNdM9FWeSqtZaayazPUVGFHL/B/9PZmyoNKp7kMQINK
         me6K+Xmibyt6q6PCermaoJJMIRCxzdpkgVmnEIgddSyP8prwa3MsHJiP3eGB6r0u/VL0
         SCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FPTQPEpWaR1hFH/uT3gbzdLWWiculb6KorJhXc6tdZg=;
        b=ZrvIPnREKPBH96H2LWZONFfLUXUdPRVD5MnZrdEMDkRj7Kexzq77S4TilnsiKpvWHx
         z5t4G4DmoO1/NhX/mZcWJ+NeMHviq+EQCzGQXdw2D34+yfaAGnf9ymuevWXSZeL1kynU
         LJcaOlAy7y9NHrQBsWotGBJ3TnCSaHS2wjucqmbZMQHGOU0ZhuXiDtPJ2x3SmfuBCO01
         6RnvJScvh/eIQ59m0x+Bh82YgDP7svW7I3U4tcVGNWEWOwjjMeUZHt9xf9YBMmcLUIK0
         qz+6EgGTYsm9wILFWxFDvU/W3vVjJHLZ/oMDj+3rIF5sZA0LPDlnDckaz3GcIiRjZquM
         bqbg==
X-Gm-Message-State: AOAM530PhyjiR+FKc0M0uwGLr5CUOxhIx6tcuNOBwZ8HoPMCEFNdb+iz
	8U9AXRrGkAT00zI+L8BTYyWtAkG4fTpi6wkKgqQ=
X-Google-Smtp-Source: ABdhPJxEEUDn5epugo7WpKKnk9ZJKjegdoz69O7oqk7SF0woFSxX0d9nPhczxgfMIb/BnTLRBjq4ASvt24uBskuDjVE=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr728680ots.192.1592517522139;
 Thu, 18 Jun 2020 14:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200617230710.9163-1-christopher.w.clark@gmail.com>
 <afb6222235af73893eb979a1f486108e902d4eaf.camel@linuxfoundation.org> <a2dcab79-dd9f-168a-c391-07897ad1b556@gmail.com>
In-Reply-To: <a2dcab79-dd9f-168a-c391-07897ad1b556@gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 18 Jun 2020 14:58:30 -0700
Message-ID: <CACMJ4GZGKQGGoZ=qA1SRvMuesRNDTkOVs4rcm_8xrU=Eur78nA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub-efi-native: use RDEPENDS on grub-native instead of duplicating tools
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 18, 2020 at 1:27 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On 6/18/20 1:12 AM, Richard Purdie wrote:
> > On Wed, 2020-06-17 at 16:07 -0700, Christopher Clark wrote:
> >> Both grub-native and grub-efi-native included packaging for the
> >> grub-mkimage and grub-editenv tools, which prevented concurrent
> >> installation of both the grub-native and grub-efi-native packages.
> >> This caused errors on image generation with wic when populating
> >> partitions with both legacy and efi boot support, so resolve this by
> >> removing the duplicated tools from grub-efi-native and add a
> >> runtime dependency from it to grub-native.> >>
> >
> > I think we want to PROVIDES_append_class-native = " grub-efi-native" in
> > grub and then drop the BBCLASSEXTEND from grub-efi?
>
> Just for the record, I tested building grub-native (x86-64) both with
> platform "pc" and "efi", and in the same build directory, and all tools
> in ${bindir} were binary identical. Asking in #grub on freenode also
> confirmed this, apparently Debian packaging also assumes this.
>
> So no grub-efi-native required, and we can remove that
> _class_target/_class_native special handling as well.

I'm not as confident as I was about the results of the binary
comparison that I did, since objdump definitely wasn't showing the
strings differences that were clearly present between those binaries.
I think that proposing this change was a mistake since there could
well be other layers that depend on core having separate packages with
behaviour specific to those that is needed. Sorry for the noise.

Christopher
