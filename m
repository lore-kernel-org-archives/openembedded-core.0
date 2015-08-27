Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id D41A775794
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:20:02 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so16341768igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 06:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=pN9haOp/Av0CaiTd0U936CWcM3+fULVjbtNgc2OMjqw=;
	b=bCixOqE9qDkWmeZQPwWNp0a2LXW0tLGuIVkE5JUG1BrRzqSV/iZsGx5NLaXBNCLh+K
	L45onsYsnr9BRVA2P3zMRZBnR5SbRB9yXd7d4d3LmwP88dSDTEHWAkhnBZVJQyd23dfe
	h96Gi9pJj6P7N9qyxwBjImCCSgskTZpyWKkpwgqFFyMjMkzspKjWxwn3ZIUlCS9JhRZ+
	VhQ+HoFjN8SUEY3BkSCTas8qwcKn47mdUkfl6aGPm4QhMkGleLJ9TIJfcZQg8RqzCIX8
	r35M1KEsnBsWPZKld1mCgdNuFug3Kfb3jmR56eyXzuCpAFpBTI9c3bs7tCO3KBfq5M54
	Yrpw==
X-Gm-Message-State: ALoCoQnfqeFc1M04rMQ8oSk45j8LVIOSLb1Pxjg3TacCizwU20xR3KFK0E24HkFEHw0lqcd4uh+h
X-Received: by 10.50.70.67 with SMTP id k3mr10016291igu.76.1440681601837;
	Thu, 27 Aug 2015 06:20:01 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F2EE.dip0.t-ipconnect.de. [93.232.242.238])
	by smtp.gmail.com with ESMTPSA id
	s12sm1658940ioe.14.2015.08.27.06.20.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 06:20:01 -0700 (PDT)
Message-ID: <1440681597.3006.35.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Date: Thu, 27 Aug 2015 15:19:57 +0200
In-Reply-To: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: leonardo.sandoval.gonzalez@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/3] Add UEFI firmware for qemux86*
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
X-List-Received-Date: Thu, 27 Aug 2015 13:20:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-07-14 at 20:07 +0000,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> These patches include:
> 
>     1. iasl recipe taken from luv-yocto repository into OE-Core (the only 
>        change done was the LICENSE, from Intel-ACPI to BSD | GPLv2)
>     2. OVMF recipe (taken from luv-yocto repository) into OE-Core
>     3. Boot script: Instrumenting runqemu to include OECORE_MACHINE_SYSROOT, 
>     so the OVMF BIOS can be found.

I've tried out these patches. Mostly it worked as advertised and I'd
love to use EFI with qemu, so I'd like to see this merged.

I noticed that "git format-patches" from your branch followed by "git
am" mangles the
meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch because it is a mixture of Unix line ends (patch boiler plate) and DOS line ends (actual patches). The file ended up with all Unix line ends, which then failed during do_patch. I solved that by checking out your branch and copying the file. Whoever merges needs to be careful here. This might also be a problem for combo-layer, so perhaps a solution not based on patching the makefiles may be needed.

When I use runqemu, it ends up invoking qemu with "-vga vmware". With
that, I don't see any output from TianoCore and booting hangs. It boots
when disabling graphical output ("serial nographic" as parameter of
runqemu) or when explicitly selecting a different graphics
("'qemuparams=-vga std'"). Might be worthwhile adding to the commit
message.

It wasn't clear from the description whether one had to build "ovmf" or
"ovmf-native" - it's the former (obvious after thinking about it some
more, because the code runs on the target).

Do you happen to know how non-volatile EFI variables are handled? There
are several posts from around 2012 saying that qemu does not support
storing nvram persistently (for example, [1]). I've not seen anything
more recent directly contradicting that, but there seems to be
something, at least in Fedora [2]. That patch mentions that "OVMF [...]
works in two
modes: 1) Code and UEFI variable store is mixed in one file. ...".

I'm probably doing something wrong (haven't tried this before), but when
I do a "setvar foobar ="foobar" in the EFI shell, I just get a "unable
to set: Invalid Parameter" error, with and without -nv.

[1] http://blog.hansenpartnership.com/uefi-secure-boot/
[2] http://www.redhat.com/archives/libvir-list/2014-August/msg00960.html


-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




