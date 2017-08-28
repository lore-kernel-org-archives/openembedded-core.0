Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 97BA16E5FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 16:58:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7SGwX02000507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 28 Aug 2017 17:58:34 +0100
Message-ID: <1503939512.32591.309.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 28 Aug 2017 17:58:32 +0100
In-Reply-To: <157d0b98-436d-f536-b27e-d295f0ce0c90@windriver.com>
References: <1503787990.32591.247.camel@linuxfoundation.org>
	<157d0b98-436d-f536-b27e-d295f0ce0c90@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 28 Aug 2017 17:58:34 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Couple of kernel tracebacks
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
X-List-Received-Date: Mon, 28 Aug 2017 16:58:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-08-28 at 08:54 -0400, Bruce Ashfield wrote:
> On 08/26/2017 06:53 PM, Richard Purdie wrote:
> > 
> > Hi Bruce,
> > 
> > We are seeing a few teething issues which seem kernel related on
> > the
> > autobuilder. The x86 lsb build saw this traceback in the logs:
> I'll start running some stress tests and see if I can get anything
> to happen.

Thanks!

> > This has happened on multiple builders and on multiple images
> > (sato,
> > sato-sdk and I think minimal). Could be the new kernel, could be
> > qemu
> > :/. If has occurred on lsb and non-lsb ppc which makes it less
> > kernel
> > version specific I guess. For some reason I keep wanting to blame
> > the
> > IDE drivers but it is using virtio. We never get any backtrace for
> > this, the log just stop dead and then we hit timeouts, it never
> > boots
> > fully in these cases. It stops after:
> It could be the virtio back end interacting in ways that we've
> never hit before.
> 
> I'll take another look at that IDE mess in 4.12 and see if the
> driver is fixable.
> 
> Is there anyway that we could do a few runs with only virtio on
> the 4.12 kernel and confirm that the hang goes away with the
> lsb configuration ? That would definitely point the finger at some
> sort of virtio interaction and force us into that IDE driver for
> a fix.

I did try booting the system with a "CONFIG_IDE is not set" from a
config fragment and confirmed I can turn IDE off at least for ppc and
it still works. I could put that in master-next and test that a bit,
see if things keep working and if any of the hangs occur? Its a pure
guess whether its related to IDE or not at this point...

> FYI: that IDE issue is already logged in kernel.org bugzilla (by
> someone else) and was reported to the mailing list. Neither the
> bug or the post got any attention at all. I also tried to fix the
> code and it is really detailed stuff that is going to take a few
> days of study to actually understand and fix.

Understandable. I can't help wonder if we shouldn't concentrate on on
dropping the IDE bits where we can?

Cheers,

Richard

