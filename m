Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8099A61788
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:21:41 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id u14so1586249lbd.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Iinqkh3yuFTORTXufbYDaCi6zI01YCBL0UvsT6ECEAU=;
	b=VRv1AZAAGRb3Bipi4HmfNE4nPxxstoL0Q56AFQjXbSrLcURxFshnDf4mYOO57YrJbK
	HwsrRUVRf85DtVR6Mf9AjLHbT2+ZCiHMmOxJAYrYnkqusfbCprUIbVdwlqH2NMZ+GaDr
	Po78PsgkypJMDDmoB1hi2hI3jJDapRV28UMbSxFaacWspFHrBnL0jEps5gpPS4mza+Tm
	1DLTvxQ6jMwwQExReZthcxLhmyaQL1mZtxDC4nE91yoj2db7iWpVcWOY//saI29JSDpq
	R6Gpw9v4Ri9zwjTqq0+mwaxqh1bI/jx2v1KPFLktV1XUe+4elxOay6zW5HsIXl3rnUsh
	6i0Q==
MIME-Version: 1.0
X-Received: by 10.112.89.100 with SMTP id bn4mr6931333lbb.16.1378383702442;
	Thu, 05 Sep 2013 05:21:42 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 5 Sep 2013 05:21:42 -0700 (PDT)
In-Reply-To: <20130905071133.GG11500@jama>
References: <1378311722-17752-1-git-send-email-ross.burton@intel.com>
	<1378332114.1059.260.camel@ted>
	<CADkTA4NbnmnQZXB2YLv5psJwA=gDAh9Bi4sGOr2dp30sTR0bJg@mail.gmail.com>
	<20130905071133.GG11500@jama>
Date: Thu, 5 Sep 2013 08:21:42 -0400
Message-ID: <CADkTA4Ok231DfBzGjFCDd5fsBuDsJ4fSu7Mow55vZye4itOPgA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: add recommend of kernel-modules for all qemu machines
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
X-List-Received-Date: Thu, 05 Sep 2013 12:21:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 5, 2013 at 3:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Sep 04, 2013 at 08:51:25PM -0400, Bruce Ashfield wrote:
>> On Wed, Sep 4, 2013 at 6:01 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Wed, 2013-09-04 at 17:22 +0100, Ross Burton wrote:
>> >> Only qemumips was recommending kernel-modules which meant that the other qemu
>> >> machines were missing some kernel modules, for example binfmt-misc.
>> >>
>> >> Move the recommends to qemu.inc so that all qemu machines pull in the kernel
>> >> modules that have been built.
>> >>
>> >> [ YOCTO #4863 ]
>> >>
>> >> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> >> ---
>> >>  meta/conf/machine/include/qemu.inc |    2 ++
>> >>  meta/conf/machine/qemumips.conf    |    2 --
>> >>  meta/conf/machine/qemumips64.conf  |    2 --
>> >>  3 files changed, 2 insertions(+), 4 deletions(-)
>> >
>> > How many modules are built for the qemu machines? Are they all useful?
>> > I'm just trying to get a feel for how much we're adding here and whether
>> > this is the right thing to be doing...
>>
>> We can control the configs as tightly as we want, so if we are building too much
>> for this, I'm happy to trim things down.
>
> I don't think this is right way to do it.
>
> It's good to have as many optional modules available in feed (so to
> enable many modules in configs - you never know what obscure device
> someone will try to test with qemu and one more module and package in
> feed has smaller overhead then need to change configs) and install
> only important modules by default in every image.

There's definite advantages to both, and I'm aware of preferences for and
against, so there's a place for either model.

I'm targeting specific machines, with known good configurations and feature
mixes. So getting the config right, and trusting that configuration is the
route that I take, and then just install everything that is built. Rather than
having the granularity and the need to depend on individual modules, which
ends up tying all my layers, to a specific set of kernel options .. which that
base BSP likes to be at liberty to change.

Having the options in the feed is nice, so somewhere in the middle would be
my ideal :)

Cheers,

Bruce

>
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> >
>> >
>> >>
>> >> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
>> >> index 545f8d1..7baf13e 100644
>> >> --- a/meta/conf/machine/include/qemu.inc
>> >> +++ b/meta/conf/machine/include/qemu.inc
>> >> @@ -27,3 +27,5 @@ EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
>> >>
>> >>  # Provide the nfs server kernel module for all qemu images
>> >>  KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
>> >> +
>> >> +MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
>> >> diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
>> >> index ce1c419..89721a6 100644
>> >> --- a/meta/conf/machine/qemumips.conf
>> >> +++ b/meta/conf/machine/qemumips.conf
>> >> @@ -9,5 +9,3 @@ KERNEL_IMAGETYPE = "vmlinux"
>> >>  KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
>> >>
>> >>  SERIAL_CONSOLE = "115200 ttyS0"
>> >> -
>> >> -MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
>> >> diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
>> >> index b2c7998..7ba98cb 100644
>> >> --- a/meta/conf/machine/qemumips64.conf
>> >> +++ b/meta/conf/machine/qemumips64.conf
>> >> @@ -9,5 +9,3 @@ KERNEL_IMAGETYPE = "vmlinux"
>> >>  KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
>> >>
>> >>  SERIAL_CONSOLE = "115200 ttyS0"
>> >> -
>> >> -MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
>> >
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

