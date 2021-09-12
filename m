Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web10.17548.1631462959742018914
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 09:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@klausen.dk header.s=dkim header.b=0xrg0ijl;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
Date: Sun, 12 Sep 2021 18:09:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1631462957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LjxvSQGT5ShJGHSGTeNx75dTHG/X/91AL44YVl+oRQ8=;
	b=0xrg0ijls2epbq7fV1fLxc+qy7dtC07QHUatSxYjw6fK1CjspX/vyFWrofB+5mmouvUtDg
	JECJWK5GNwak6Iv2WxI5cQMJyz/xK+Vccc7CT5WqQnL62X93DXA3elGwcA+Nzlw1Y4ZQ4d
	i+shtw5o0d5CTVT7A4rP5dLBOnLDIl0=
From: "Kristian Klausen" <kristian@klausen.dk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: kristian@klausen.dk, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] wic/bootimg-efi: Add Unified Kernel Image option
Message-ID: <YT4mK3FkhRc/dBPs@bob>
References: <20210909175337.624-1-kristian@klausen.dk>
 <e09b8b9e26d55f71bda9afdd0c2e1e25ec2b4690.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <e09b8b9e26d55f71bda9afdd0c2e1e25ec2b4690.camel@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Den Fri, Sep 10, 2021 at 09:31:18 +0100 skrev Richard Purdie:
> On Thu, 2021-09-09 at 17:53 +0000, Kristian Klausen via lists.openembedded.org
> wrote:
> > "A unified kernel image is a single EFI PE executable combining an EFI
> > stub loader, a kernel image, an initramfs image, and the kernel command
> > line.
> > 
> > [...]
> > 
> > Images of this type have the advantage that all metadata and payload
> > that makes up the boot entry is monopolized in a single PE file that can
> > be signed cryptographically as one for the purpose of EFI
> > SecureBoot."[1]
> > 
> > This commit adds a create-unified-kernel-image=true option to the
> > bootimg-efi plugin for creating a Unified Kernel Image[1] and installing
> > it into $BOOT/EFI/Linux/ with a .efi extension per the the Boot Loader
> > Specification[1][2]. This is useful for implementing Secure Boot.
> > 
> > systemd-boot is the only mainstream bootloader implementing the
> > specification, but GRUB should be able to boot the EFI binary, this
> > commit however doesn't implement the necessary changes to the GRUB
> > config generation logic to boot the Unified Kernel Image.
> > 
> > [1] https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images
> > [2] https://systemd.io/BOOT_LOADER_SPECIFICATION/
> > 
> > Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> > ---
> > 
> > This patch supersedes:
> > "[RFC][PATCH] kernel: Add Unified Kernel Image image type"[1]
> > and:
> > "[PATCH] wic/bootimg-efi: Add option for only installing the bootloader"[2]
> > 
> > The latter is perhaps still useful, but with this patch it is no longer
> > needed for using a Unified Kernel Image with systemd-boot.
> > 
> > [1] https://lists.openembedded.org/g/openembedded-core/message/155801
> > [2] https://lists.openembedded.org/g/openembedded-core/message/155789
> > 
> >  scripts/lib/wic/plugins/source/bootimg-efi.py | 69 ++++++++++++++++---
> >  1 file changed, 59 insertions(+), 10 deletions(-)
> 
> Do we need to add a test for this into meta/lib/oeqa/selftest/cases/wic.py?
> 
> Cheers,
> 
> Richard
> 

A simple test wouldn't hurt :)
I will add a simple test checking the EFI binary is created in the 
expected location and a bootloader confing isn't created.

- Kristian
