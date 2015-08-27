Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E4D7F60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 19:49:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2015 12:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,423,1437462000"; d="scan'208";a="633521736"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.168])
	([10.219.5.168])
	by orsmga003.jf.intel.com with ESMTP; 27 Aug 2015 12:49:00 -0700
Message-ID: <55DF69EF.9050303@linux.intel.com>
Date: Thu, 27 Aug 2015 14:50:07 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1440681597.3006.35.camel@intel.com>
In-Reply-To: <1440681597.3006.35.camel@intel.com>
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
X-List-Received-Date: Thu, 27 Aug 2015 19:49:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/27/2015 08:19 AM, Patrick Ohly wrote:
> On Tue, 2015-07-14 at 20:07 +0000,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> These patches include:
>>
>>      1. iasl recipe taken from luv-yocto repository into OE-Core (the only
>>         change done was the LICENSE, from Intel-ACPI to BSD | GPLv2)
>>      2. OVMF recipe (taken from luv-yocto repository) into OE-Core
>>      3. Boot script: Instrumenting runqemu to include OECORE_MACHINE_SYSROOT,
>>      so the OVMF BIOS can be found.
>
> I've tried out these patches. Mostly it worked as advertised and I'd
> love to use EFI with qemu, so I'd like to see this merged.
>
> I noticed that "git format-patches" from your branch followed by "git
> am" mangles the
> meta/recipes-core/ovmf/ovmf/0001-BaseTools-Force-tools-variables-to-host-toolchain.patch because it is a mixture of Unix line ends (patch boiler plate) and DOS line ends (actual patches). The file ended up with all Unix line ends, which then failed during do_patch. I solved that by checking out your branch and copying the file. Whoever merges needs to be careful here. This might also be a problem for combo-layer, so perhaps a solution not based on patching the makefiles may be needed.
>

I believe Paul has answered this. I also got some trouble, in fact the 
reason I sent V3 was because I patch incorrectly V2. it is a pain these 
line endings.

> When I use runqemu, it ends up invoking qemu with "-vga vmware". With
> that, I don't see any output from TianoCore and booting hangs. It boots
> when disabling graphical output ("serial nographic" as parameter of
> runqemu) or when explicitly selecting a different graphics
> ("'qemuparams=-vga std'"). Might be worthwhile adding to the commit
> message.

In the 3/3 commit's description, there is a command line with the 
nographic parameter. I did not test with any other kernel command line.

>
> It wasn't clear from the description whether one had to build "ovmf" or
> "ovmf-native" - it's the former (obvious after thinking about it some
> more, because the code runs on the target).
>

you are right. It is not obvious.

> Do you happen to know how non-volatile EFI variables are handled? There
> are several posts from around 2012 saying that qemu does not support
> storing nvram persistently (for example, [1]). I've not seen anything
> more recent directly contradicting that, but there seems to be
> something, at least in Fedora [2]. That patch mentions that "OVMF [...]
> works in two
> modes: 1) Code and UEFI variable store is mixed in one file. ...".
>

sorry, I do not know.

> I'm probably doing something wrong (haven't tried this before), but when
> I do a "setvar foobar ="foobar" in the EFI shell, I just get a "unable
> to set: Invalid Parameter" error, with and without -nv.
>
> [1] http://blog.hansenpartnership.com/uefi-secure-boot/
> [2] http://www.redhat.com/archives/libvir-list/2014-August/msg00960.html
>
>

