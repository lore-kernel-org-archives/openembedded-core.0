Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4916975794
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:29:20 +0000 (UTC)
Received: by iofe124 with SMTP id e124so18699375iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 00:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=MU4E9msbaxi2ljPCc2O+ZsNpo0HDwyBATHH9eoafUto=;
	b=a4u2zrLlejSvMJp+OOypW2jghT1MZp92hka8h3a561Mypcw5LE/3xHIE8XuiewgH8T
	IwA3V+EsylekbeCjL3uCVlxAN3Rr4KdHD1ipWNNTKIZz9fnaDkzgieL074vI6NFbUbBY
	S7yzeKPLTMb4IqVldmLMuEobiZhBlG9R719DEPhgPJoaGR/MtEg8dgijmNyMso1FkUR8
	Mfwk+6prMKayLkWg2+7CCmrs7o4ZFS+NKcvWOby/TOvZ26iig4qnEVC08lbe4GJVWtB/
	XBQcBO30pHhHHpSdydsueR5OGoN2I35xt7gxqQehH0mFPwWV5PFiZ8Cala/iVMwVT69O
	gM6Q==
X-Gm-Message-State: ALoCoQkewBuTssbwZfxHUhVGETCoThnCClijnwRtqEnXfsXEl8DIP/nDjShrHHZq4demgkid1+I8
X-Received: by 10.107.131.208 with SMTP id n77mr11762608ioi.138.1440746960085; 
	Fri, 28 Aug 2015 00:29:20 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F655.dip0.t-ipconnect.de. [93.232.246.85])
	by smtp.gmail.com with ESMTPSA id
	o15sm1204909igi.15.2015.08.28.00.29.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 00:29:19 -0700 (PDT)
Message-ID: <1440746955.3006.73.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com, "Stoppa, Igor"
	<igor.stoppa@intel.com>
Date: Fri, 28 Aug 2015 09:29:15 +0200
In-Reply-To: <16f26bbb5fa39e399b185cd26fe9205c2e0cc5d4.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<16f26bbb5fa39e399b185cd26fe9205c2e0cc5d4.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: leonardo.sandoval.gonzalez@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 3/3] runqemu: Define OECORE_MACHINE_SYSROOT on setup_sysroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Aug 2015 07:29:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-07-14 at 20:07 +0000,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> At least the OVFM (UEFI Firmware for Qemu and KVM) recipe stores the BIOS
> under $OE_TMPDIR/sysroots/$MACHINE, now defined as OECORE_MACHINE_SYSROOT.
> The latter is used when searching BIOS, VGA BIOS and keymaps. As a example,
> to boot a OVFM BIOS, one can run the following command:
> 
> $ runqemu qemux86-64 core-image-minimal \
>     biosdir=usr/share/ovmf  \
>     biosfilename=bios.bin \
>     nographic
> 
> Note the bios* parameters: these two are needed to specify the subfolder
> (parent folder is OECORE_MACHINE_SYSROOT) and BIOS filename (without it,
> it picks a BIOS named bios-256k.bin).

While researching the nvram support question I came across the ovmf
whitepaper [1] showing how to use OVMF via "-drive
if=pflash,format=raw,file=fedora.flash" (where fedora.flash is a per-vm
copy of OVMF.fd = bios.bin in the sysroot).

I kept wondering why you were using "-bios bios.bin" instead of the
-drive method, and how that would affect nvram support. Then I found a
pretty clear statement by Laszlo Ersek, one of the OVMF co-maintainers,
saying [2] that -bios and the nvram support possible with it (storing in
an NvRam file in the EFI boot partition) are a kludge that should not be
used anymore.

So in other words, this particular patch needs further work. Perhaps add
an "ovmf" keyword (selecting the bios.bin as pflash drive), file name
handling (treat anything ending in .bin or .fd as pflash, supporting
more than one) and a OVMF env variable with a corresponding colon
separated list of pflash files?

I also wonder about the "bios.bin" name and the ".bin" suffix. I think
it would be better to stick with the upstream convention and just
install the file in the sysroot as OVMF.fd. This simplifies the file
name handling such that only .fd is special.

Note that the upstream discussion was about per-vm nvram storage. I
think in the context of runqemu it is okay to have a single file per
build configuration, because effectively we are creating a single
machine with one OS image. What's less nice is that the sysroot will get
modified when using bios.bin as pflash drive. Resetting the nvram needs
to be done with "bitbake -c clean ovmf && bitbake ovmf". Both is not
obvious.

Perhaps if runqemu picks up the file automatically from the sysroot (the
"ovmf" keyword usage), it should make a copy in tmp (on first run) and
then use that copy instead?

[1] http://www.linux-kvm.org/downloads/lersek/ovmf-whitepaper-c770f8c.txt
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=764918#47

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




