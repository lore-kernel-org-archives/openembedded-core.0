Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id A2A1C73A92;
	Tue, 10 Mar 2015 21:16:28 +0000 (UTC)
Received: by obbnt9 with SMTP id nt9so4668213obb.12;
	Tue, 10 Mar 2015 14:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DYHQ8fqmmghG4FOSQSEdnZfFXvWoaTeU/V3uRzRlACw=;
	b=c6IHNC122BnIUI8WirtcH4GqDde2/uqxDMIvZA1U2qp5IBaZkA7/7qRKZ6xWdo8xZ7
	e++SAhdilFaBvg4MQqW/GLn0yhJ6vTsxvkgGdRTzUSGOiAS48bef4WL8PeyKA704uo5y
	9zkcRd17DLl1k58ZpeHgFaufLcz8fpXbzx2BzmPpo/Q3evsZzywLXMJaAJBdU2/vqt77
	HhI1sVTzmqzdmZC1JcRmS8wn4I5qM35BzKbdnqX3FDWusj55iLVBYbQvBWBI20NbmrOU
	fV4N8OIU2qu07I8C77jnK6ch37OXjql0DOJaqhskSjEltNimnkQqOIgJaKuxehtHgOqN
	sSXQ==
MIME-Version: 1.0
X-Received: by 10.60.94.199 with SMTP id de7mr27309007oeb.23.1426022189407;
	Tue, 10 Mar 2015 14:16:29 -0700 (PDT)
Received: by 10.202.217.69 with HTTP; Tue, 10 Mar 2015 14:16:29 -0700 (PDT)
In-Reply-To: <1421387378-4580-1-git-send-email-armccurdy@gmail.com>
References: <1421387378-4580-1-git-send-email-armccurdy@gmail.com>
Date: Tue, 10 Mar 2015 14:16:29 -0700
Message-ID: <CAJ86T=VcAgAVpk0EtU10miZzUjVb7RCqw1DQ0zgZHrktuyZ_DA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5] hardcoded rpath in Qt 5.4.0 qtbase-native uic binary
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
X-List-Received-Date: Tue, 10 Mar 2015 21:16:30 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 15, 2015 at 9:49 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> The Qt 5.4.0 qtbase-native uic binary seems to get built with a
> hardcoded RUNPATH, which causes problems when qtbase-native from
> sstate is later reused by a different build. The issue has been
> there since 5.4.0 alpha1 (5.3.2 is OK).
>

I'm still seeing this issue with Qt 5.4.1 and it seems to be related
to using gold as the linker (ie adding ld-is-gold to DISTRO_FEATURES).

With Qt 5.4.x, including ld-is-gold in DISTRO_FEATURES causes uic (and
other qtbase-native binaries) to be linked with "-fuse-ld=gold", which
causes these binaries to have runtime library paths defined via
"RUNPATH" instead of "RPATH".

Since chrpath.bbclass only fixes absolute paths in "RPATH", the
absolute paths specified via "RUNPATH" in the installed binaries don't
get fixed.


> --
>
> Build Configuration:
> BB_VERSION        = "1.25.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "LinuxMint-17.1"
> TARGET_SYS        = "i586-rdk-linux"
> MACHINE           = "vbox32"
> DISTRO            = "rdk"
> DISTRO_VERSION    = "2.0"
> TUNE_FEATURES     = "m32 core2"
> TARGET_FPU        = ""
> meta-bsp-vbox     = "(detachedfrom253724d):253724dfeace58edbb40025fa8e4b5ace2c90164"
> meta-rdk          = "(detachedfrom724d5c0):724d5c0030e3d2a53aad1929393ba2c00122ab91"
> meta-qt5          = "(detachedfromec50df6):ec50df68b80f9704f135dd4c9f384a5596ec77cb"
> meta-metrological = "(nobranch):abbd111fee3ae1ade2fc2997ccda0eb9782da761"
> meta-multimedia
> meta-filesystems
> meta-oe
> meta-python
> meta-networking
> meta-ruby         = "(detachedfrom7bbacd0):7bbacd0023fa1111da94ba0b2aafd7d872301ffe"
> meta              = "(detachedfromb61a2ac):b61a2acc321489c3427f0afa3059486dc144a13b"
>
>
> $ readelf -d tmp/sysroots/x86_64-linux/usr/bin/qt5/uic
>
> Dynamic section at offset 0x80c60 contains 27 entries:
>   Tag        Type                         Name/Value
>  0x0000000000000003 (PLTGOT)             0x481fe8
>  0x0000000000000002 (PLTRELSZ)           4368 (bytes)
>  0x0000000000000017 (JMPREL)             0x4033a0
>  0x0000000000000014 (PLTREL)             RELA
>  0x0000000000000007 (RELA)               0x4031a8
>  0x0000000000000008 (RELASZ)             504 (bytes)
>  0x0000000000000009 (RELAENT)            24 (bytes)
>  0x0000000000000015 (DEBUG)              0x0
>  0x0000000000000006 (SYMTAB)             0x400298
>  0x000000000000000b (SYMENT)             24 (bytes)
>  0x0000000000000005 (STRTAB)             0x401570
>  0x000000000000000a (STRSZ)              6625 (bytes)
>  0x000000006ffffef5 (GNU_HASH)           0x402f58
>  0x0000000000000001 (NEEDED)             Shared library: [libQt5Core.so.5]
>  0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
>  0x000000000000000c (INIT)               0x4044b0
>  0x000000000000000d (FINI)               0x4571cc
>  0x000000000000001a (FINI_ARRAY)         0x480ce8
>  0x000000000000001c (FINI_ARRAYSZ)       8 (bytes)
>  0x0000000000000019 (INIT_ARRAY)         0x480cf0
>  0x000000000000001b (INIT_ARRAYSZ)       8 (bytes)
>  0x000000000000001d (RUNPATH)            Library runpath: [/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/usr/lib:/home/andre/rdk/rdk-master/build-vbox32/tmp/sysroots/x86_64-linux/lib]
>  0x000000006ffffff0 (VERSYM)             0x402f90
>  0x000000006ffffffe (VERNEED)            0x403124
>  0x000000006fffffff (VERNEEDNUM)         2
>  0x0000000000000000 (NULL)               0x0
>
>

