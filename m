Return-Path: <ajlennon@dynamicdevices.co.uk>
Received: from www.dynamicdevices.co.uk (www.dynamicdevices.co.uk
	[89.200.136.37])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6AF60CFC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 15:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by www.dynamicdevices.co.uk (Postfix) with ESMTP id A14D127E052;
	Fri,  8 Aug 2014 15:57:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at lennoab2.miniserver.com
Received: from www.dynamicdevices.co.uk ([127.0.0.1])
	by localhost (www.dynamicdevices.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id n3KH0-7Yd5f4; Fri,  8 Aug 2014 15:57:57 +0000 (UTC)
Received: from [127.0.0.1] (cpc32-live22-2-0-cust59.17-2.cable.virginm.net
	[82.36.253.60])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by www.dynamicdevices.co.uk (Postfix) with ESMTPSA id 90E1C27E031;
	Fri,  8 Aug 2014 15:57:57 +0000 (UTC)
Message-ID: <53E4F384.4050300@dynamicdevices.co.uk>
Date: Fri, 08 Aug 2014 16:57:56 +0100
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1571948.CrPtZqAbFm@peggleto-mobl5.ger.corp.intel.com>
	<53E3512E.5090008@dynamicdevices.co.uk>
	<2374073.Q4LByM6bcI@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2374073.Q4LByM6bcI@peggleto-mobl5.ger.corp.intel.com>
X-Enigmail-Version: 1.6
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 08 Aug 2014 15:58:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Paul,
> Personally with how fragile package management can end up being, I'm convinced 
> that full-image updates are the way to go for a lot of cases, but ideally with 
> some intelligence so that you only ship the changes (at a filesystem level 
> rather than a package or file level). This ensures that an upgraded image on 
> one device ends up exactly identical to any other device including a newly 
> deployed one. Of course it does assume that you have a read-only rootfs and 
> keep your configuration data / logs / other writeable data on a separate 
> partition or storage medium. However, beyond improvements to support for 
> having a read-only rootfs we haven't really achieved anything in terms of out-
> of-the-box support for this, mainly due to lack of resources.
>
> However, whilst I haven't had a chance to look at it closely, there has been 
> some work on this within the community:
>
> http://sbabic.github.io/swupdate/swupdate.html
> https://github.com/sbabic/swupdate
> https://github.com/sbabic/meta-swupdate/
>  
>

I had a quick look at this. It's interesting. If I am reading this
correctly it's based on the old

-> Bootloader runs Partition A
-> Update Partition B, set Bootloader to run Partition B
->   On failure stay on partition A and retry update.
-> Bootloader runs Partition B
-> Update Partition A, set Bootloader to run Partition A
->  etc.

We've done this type of thing before and it works well. Of course the
drawback is the amount
of flash you need to achieve it but it is a good robust system.

I'd be interested to see how this could work with filesystem deltas say.
I don't _think_ that is
documented here?

...

Thinking a little further what would also really interest me would be to
consider using the
transactionality of the underlying file-system or block-management layer
for the update process.

Given nowadays journalling and log-structure file-systems are already
designed to fail-back when
file/meta-data modifications are interrupted surely we should be able to
start a macro-transaction
point at the start of the  partition update,  and if that update doesn't
complete with a macro-commit
then the f/s layer should be able to automatically roll itself back?
Perhaps the same could be done at
a block management layer?

Cheers,

Alex


