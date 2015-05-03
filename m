Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C1DAA73C7D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 May 2015 10:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t43AmxD0020642; Sun, 3 May 2015 11:48:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IWO342FS1ql8; Sun,  3 May 2015 11:48:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t43Ami7m020639
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 3 May 2015 11:48:56 +0100
Message-ID: <1430650124.18360.96.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sun, 03 May 2015 11:48:44 +0100
In-Reply-To: <55459B76.4090502@windriver.com>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430521154.18360.28.camel@linuxfoundation.org>
	<55440C90.5060605@windriver.com>
	<1430557216.18360.38.camel@linuxfoundation.org>
	<55459B76.4090502@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Sun, 03 May 2015 10:49:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-05-02 at 23:52 -0400, Bruce Ashfield wrote:
> On 2015-05-02 5:00 AM, Richard Purdie wrote:
> > On Fri, 2015-05-01 at 19:30 -0400, Bruce Ashfield wrote:
> >> On 2015-05-01 6:59 PM, Richard Purdie wrote:
> >>> On Thu, 2015-04-30 at 21:34 -0400, Bruce Ashfield wrote:
> >>>> Here is the latest consolidated pull request for the supported linux-yocto
> >>>> kernels.
> >>>>
> >>>>    - We have a refresh of the 3.14-rt support
> >>>>    - bluetooh configuration changes for common-pc/qemux86
> >>>>    - braswell BSP features and fixes
> >>>>    - Introduction of the 4.1-rc1 -dev kernel (and associated perf fix).
> >>>>
> >>>> I've built and booted these on my local machines and qemu, and
> >>>> everything was sane.
> >>>>
> >>>> The -dev kernel obviously isn't something for deployment yet, but
> >>>> it builds, and forms the base for follow up config changes, features
> >>>> and development work. I built and booted core-image-kernel dev with
> >>>> the 4.1 changes in place.
> >>>
> >>> The autobuilder showed up this for an x32 build :/.
> >>
> >> Can one of the intel folks have a look at this ? I won't be able to get
> >> to it until Tuesday at the earliest.
> >
> > I had a look into this. The issue is that this has been applied:
> >
> > http://git.yoctoproject.org/cgit.cgi/linux-yocto-3.19/commit/?h=standard/base&id=423e98721e048f6c7b925a75448f6c4ecb2b5b69
> >
> > but it needs:
> >
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=ce793486e23e0162a732c605189c8028e0910e86
> >
> > and the ioapic driver also appears to need:
> >
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/patch/?id=ecf5636dcd59cd5508641f995cc4c2bafedbb995
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/patch/?id=62d1141ff34e35de496ba06491c8e854b23b3f3e
> >
> >
> > which meant I also had to add:
> >
> > struct resource_win {
> > 	struct resource res;		/* In master (CPU) address space */
> > 	resource_size_t offset;		/* Translation offset for bridge */
> > };
> >
> > to drivers/acpi/ioapic.c to make it compile which appears to be related to:
> >
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=a49170b552423a3e85fc4f0d778c707402ee4863
> >
> > which depends on a number of patches from around that time which change acpi/resource.c:
> >
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/drivers/acpi/resource.c
> >
> > (from 2015/2/3)
> >
> > At this point I'm out my depth on how you want to fix this but it does
> > appear related to the Braswell changes.
> >
> > To be clear qemux86 and qemux86-64 don't build at all with this series.
> > I'll see if I can just drop the Braswell parts.
> 
> I did reproduce the issue here as well, so with any luck, I can sneak
> enough time to have this fixed for Monday after all.

From my perspective there isn't a rush at this point. I've merged the
config changes which unblocked the bluez patches and things are
therefore "flowing" from my perspective, the stable update can wait
until later in the week.

Cheers,

Richard


