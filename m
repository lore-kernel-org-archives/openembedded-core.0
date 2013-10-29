Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8956CE77
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 20:30:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2013 13:27:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="426674667"
Received: from unknown (HELO [10.255.12.29]) ([10.255.12.29])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2013 13:30:30 -0700
Message-ID: <52701AE6.30106@linux.intel.com>
Date: Tue, 29 Oct 2013 13:30:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>, 
	Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <1381882516-29599-1-git-send-email-cjp256@gmail.com>	<5268DEE0.7000506@linux.intel.com>	<CABZSBQepb=+J-OSGkD7Kt-u9sZU0eLJ+-NSqZS-np9tp6xc2RQ@mail.gmail.com>	<20131029072729.GB6291@lpalcu-linux>
	<CABZSBQfM7hwgF7ZtmypBzJQoTGPObow59zADZdbnaEK-+YO-Jw@mail.gmail.com>
In-Reply-To: <CABZSBQfM7hwgF7ZtmypBzJQoTGPObow59zADZdbnaEK-+YO-Jw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to 1.6.1
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
X-List-Received-Date: Tue, 29 Oct 2013 20:30:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/2013 01:20 PM, Chris Patterson wrote:
>
>
>
> On Tue, Oct 29, 2013 at 3:27 AM, Laurentiu Palcu
> <laurentiu.palcu@intel.com <mailto:laurentiu.palcu@intel.com>> wrote:
>
>     Hi Chris,
>
>     On Mon, Oct 28, 2013 at 07:54:51PM -0400, Chris Patterson wrote:
>      >
>      > I'm not terribly familiar with the nativesdk, and (foolishly)
>     neglected to test
>      > that.  However, I looked into it, and it looks like the
>     relocatable_sdk.patch
>      > affects a linker script that is no longer available.  I dropped
>     the patch and
>      > tested installing an oe-core sdk sysroot (via bitbake -c populate_sdk
>      > core-image-minimal) and qemu appears to work fine from within the sdk
>      > environment.
>      >
>      > I'm open to suggestions for further testing this upgrade
>     (particularly a case
>      > to cover what relocatable_sdk.patch was originally intended to
>     resolve). I'm
>      > certainly not the expert here, but am willing to help out.
>      >
>     To test this particular case, build meta-toolchain and install it in a
>     different location than the default one. Then, just do a 'readelf -s"
>     on any qemu binary and make sure the .interp section has a size of
>     0x1000 bytes.
>
>     If it does, then it's ok to drop the patch. That patch was needed
>     because qemu happened to use their own linker scripts and, in order to
>     have the SDK relocatable, we needed to reseve space in the .interp
>     section to squeeze the new path.
>
>
> Thanks Laurentiu - I did validate that the interp section looks to be
> 0x1000 bytes for the qemu-* binaries:
>
> $
> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/qemu-system-arm
> --version
> QEMU emulator version 1.6.1, Copyright (c) 2003-2008 Fabrice Bellard
>
> $ readelf -S
> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/qemu-system-arm
>
> There are 29 section headers, starting at offset 0x5a14b8:
>
> Section Headers:
>    [Nr] Name              Type             Address           Offset
>         Size              EntSize          Flags  Link  Info  Align
>    [ 0]                   NULL             0000000000000000  00000000
>         0000000000000000  0000000000000000           0     0     0
>    [ 1] .interp           PROGBITS         0000000000000270  00000270
>         0000000000001000  0000000000000000   A       0     0     1
>    [ 2] .note.ABI-tag     NOTE             0000000000001270  00001270
>         0000000000000020  0000000000000000   A       0     0     4
>    [ 3] .note.gnu.build-i NOTE             0000000000001290  00001290
> ...
>
> If anyone has any other suggestions to test, I will gladly attempt them
> before posting a v2.
>

Your last message said you tested core-image-minimal, did you do any 
testing with a graphical image like core-image sato?  We really 
apperciate the work you put in here.

Thanks
	Sau!

> Cheers!
> -Chris

