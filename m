Return-Path: <ajlennon@dynamicdevices.co.uk>
Received: from www.dynamicdevices.co.uk (www.dynamicdevices.co.uk
	[89.200.136.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0029A62252
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 11:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by www.dynamicdevices.co.uk (Postfix) with ESMTP id C222727E062;
	Sat,  9 Aug 2014 11:57:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at lennoab2.miniserver.com
Received: from www.dynamicdevices.co.uk ([127.0.0.1])
	by localhost (www.dynamicdevices.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3bhMunrp9mFM; Sat,  9 Aug 2014 11:57:38 +0000 (UTC)
Received: from [127.0.0.1] (cpc32-live22-2-0-cust59.17-2.cable.virginm.net
	[82.36.253.60])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by www.dynamicdevices.co.uk (Postfix) with ESMTPSA id 34C9C27E031;
	Sat,  9 Aug 2014 11:57:38 +0000 (UTC)
Message-ID: <53E60CAF.7000804@dynamicdevices.co.uk>
Date: Sat, 09 Aug 2014 12:57:35 +0100
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>
References: <1571948.CrPtZqAbFm@peggleto-mobl5.ger.corp.intel.com>	<53E3512E.5090008@dynamicdevices.co.uk>	<2374073.Q4LByM6bcI@peggleto-mobl5.ger.corp.intel.com>
	<53E5D844.2050909@topic.nl> <53E5DF83.3060301@dynamicdevices.co.uk>
	<53E60462.3010700@topic.nl>
In-Reply-To: <53E60462.3010700@topic.nl>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [yocto] RFC: Improving the developer workflow
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
X-List-Received-Date: Sat, 09 Aug 2014 11:57:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


On 09/08/2014 12:22, Mike Looijmans wrote:
> On 08/09/2014 10:44 AM, Alex J Lennon wrote:
>
> Going off-topic here I guess, but I think you can use the UBI block
> layer in combination with e.g. squashfs. Never tried it, but it should
> be possible to create an UBI volume, write a squash blob into it and
> mount that.
>
> However, any system that accomplishes that, is sort of cheating. It
> isn't a read-only rootfs in the true meaning of the word any more. In
> time, the volume will move around on the flash, thus the rootfs will
> be re-written.
>

I guess it comes down to what risks we're trying to guard against here?

Thinking aloud...

If I believe that my UBI - or other - layer is robust (and I think it is
nowadays?) then I should be able to believe that UBI can wear level my
data across NAND without a risk of data-loss due to bad sectors, power
interruption or other (assuming enough spare blocks)

Now if that's a true statement then the risk of my main
'read-only-but-wear-levelled' file-system becoming corrupted due to this
is very low.

I think I would accept that risk - with some testing to prove it out to
myself - given that the main file-system partition is likely to be the
largest partition and if I am minimising cost/size of flash then I want
to be able to wear level using that larger area.

I've had exactly this problem before with e.g. data/logs on small
read-write data partitions which rapidly kill the flash as there's a
very small area being wear levelled.


So, what I am thinking is more of a risk for us is if I remount that OS
filesystem as read/write and start doing some kind of update to it,
whether via package feeds or some delta-based system?

I think if I could remount read-write / start a transaction / do the
update / commit the update transaction that would be rather good. And of
course if it gets interrupted or otherwise fails we just roll-back.

>>> For the OpenPLi settop boxes we've been using "online upgrades" which
>>> basically just call "opkg update && opkg upgrade" for many years, and
>>> there's never been a real disaster. The benefits easily outweigh the
>>> drawbacks.
>>>
>>> When considering system upgrades, too much attention is being spent in
>>> the "corner cases". It's not really a problem if the box is bricked
>>> when the power fails during an upgrade. As long as there's a procedure
>>> the end-user can use to recover the system (on most settop boxes,
>>> debricking the system is just a matter of inserting a USB stick and
>>> flipping the power switch).
>>
>> For us on this latest project - and indeed the past few projects - it is
>> a major problem (and cost) if the device is bricked. These devices are
>> not user-maintainable and we'd be sending engineers out around the world
>> to fix.
>>
>> Not a good impression to make with the customers either.
>>
>> Whether we're a usual use case I don't know.
>
> I think you're a very usual use case, and it's a valid one indeed. I'm
> just trying to create awareness that there are projects out there that
> use OE for consumer products, and have millions of devices running in
> the end-users' living rooms, who upgrade at a whim (feed servers
> sending out about 4TB traffic each month).
>
> I've also done medical devices where, just as you say, bricking it
> just isn't an option. These are typically inaccessible by the
> end-user, and see no modification other than about 1k of configuration
> data (e.g. wifi keys) during their lifespan.
>

That's really interesting. Do you mind me asking who pays for that
traffic? (!)

Yes we have done some medical devices in the past. This current crop is
smart buildings which is similarly difficult to access if something
blows up.
Then we've done some in-car telematics and train telemetry which is all
similarly difficult due to inaccessibility, maintenance constraints, and the
desire to keep the users' fingers out of the device.

I guess it's horses for courses isn't it. Glad to hear I'm not too much
of an outlier ;)

Cheers,

Alex


