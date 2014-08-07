Return-Path: <ajlennon@dynamicdevices.co.uk>
Received: from www.dynamicdevices.co.uk (www.dynamicdevices.co.uk
	[89.200.136.37])
	by mail.openembedded.org (Postfix) with ESMTP id AB1DF7064F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 13:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by www.dynamicdevices.co.uk (Postfix) with ESMTP id D8E6227E05D;
	Thu,  7 Aug 2014 13:14:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at lennoab2.miniserver.com
Received: from www.dynamicdevices.co.uk ([127.0.0.1])
	by localhost (www.dynamicdevices.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Bt1dwUXfBK1S; Thu,  7 Aug 2014 13:14:20 +0000 (UTC)
Received: from [127.0.0.1] (cpc32-live22-2-0-cust59.17-2.cable.virginm.net
	[82.36.253.60])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by www.dynamicdevices.co.uk (Postfix) with ESMTPSA id 3C45B27E058;
	Thu,  7 Aug 2014 13:14:20 +0000 (UTC)
Message-ID: <53E37BA4.6010100@dynamicdevices.co.uk>
Date: Thu, 07 Aug 2014 14:14:12 +0100
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
X-List-Received-Date: Thu, 07 Aug 2014 13:14:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


On 07/08/2014 14:05, Paul Eggleton wrote:
> Hi Alex,
>
> On Thursday 07 August 2014 11:13:02 Alex J Lennon wrote:
>> On 07/08/2014 10:10, Paul Eggleton wrote:
>> fwiw Upgrade solutions are something that is still a read need imho,  as
>> I think we discussed at one of the FOSDEMs.
>>
>> (The other real need being an on-board test framework, again imho, and
>> which I believe is ongoing)
> Indeed; I think we've made some pretty good progress here in that the Yocto 
> Project QA team is now using the automated runtime testing to do QA tests on 
> real hardware. Reporting and monitoring of ptest results is also being looked 
> at as well as integration with LAVA.
>  

Great news. I really want to look into this but as ever time is the
constraining factor.

>> Historically I, and I suspect others, have done full image updates of
>> the storage medium,  onboard flash or whatever but these images are
>> getting so big now that I am trying to  move away from that and into
>> using package feeds for updates to embedded targets.
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

Deltas. Yes I've seen binary deltas attempted over the years, with
varying degrees of success.

I can see how what you say could work at a file-system level if we could
separate out the
writeable data, yes. Not sure I've seen any tooling around this though?

Back in the day when I first started out with Arcom Embedded Linux in
the late '90's I had us
do something similar with a read only JFFS2 system partition and then a
separate app/data
partition. That seemed to work OK. Maybe I need to revisit that.

> However, whilst I haven't had a chance to look at it closely, there has been 
> some work on this within the community:
>
> http://sbabic.github.io/swupdate/swupdate.html
> https://github.com/sbabic/swupdate
> https://github.com/sbabic/meta-swupdate/

I'll take a look. Thanks.

>  
>> My initial experience has been that
>>
>> - as you mention it would be really helpful to have something "more"
>> around management  of package feed releases / targets.
>>
>> - some automation around deployment of package feeds to production
>> servers would help,   or at least some documentation on best practice.
> So the scope of my proposal is a little bit narrower, i.e. for the SDK; and 
> I'm suggesting that we mostly bypass the packaging system since it doesn't 
> really add much benefit and sometimes gets in the way when you're an 
> application developer in the middle of development and the level of churn is 
> high (as opposed to making incremental changes after the product's release).

Mmm. Yes I can understand that. Same here.

>> The other big issue I am seeing, which is mostly my own fault thus far,
>> is that I have sometimes  taken  the easy option of modifying the root
>> filesystem image in various ways within the image recipe (for example
>> changing  a Webmin configuration perhaps)
>>
>> However when I then come to upgrade a package in-situ, such as Webmin,
>> the changes  are  then overwritten.
>>
>> I think this is probably also an issue when upgrading packages that have
>> had local modifications made, and I wonder whether there's a solution to
>> this that I'm not aware of?
> We do have CONFFILES to point to configuration files that may be modified (and 
> thus should not just be overwritten on upgrade). There's not much logic in the 
> actual build system to deal with this, we just pass it to the package manager; 
> but it does work, and recipes that deploy configuration files (and bbappends, if 
> the configuration file is being added rather than changed from there) should set 
> CONFFILES so that the right thing happens on upgrade if you are using a 
> package manager on the target.
>
> A related issue is that for anything other than temporary changes it's often 
> not clear which recipe you need to change/append in order to provide your own 
> version of a particular config file. FYI I entered the following enhancement bug 
> some months ago to add a tool to help with that:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6447

Interesting thanks. I don't recall seeing this in recipes. I might have
missed it or are not many
people using this features in their recipes? Of course the next issue is
not knowing what you
want to do with those conf files during an unattended upgrade onto an
embedded box.

>> I am aware of course that mainstream package management tools allow
>> diffing, upgrading,  ignoring and such but I am unsure as to how that is
>> supported under Yocto at present?
> There isn't really any support for this at the moment, no; I think we'd want 
> to try to do this kind of thing at the build system end though to avoid tying 
> ourselves to one particular package manager.
>  

Indeed.

Cheers!

Alex


