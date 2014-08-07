Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E3A1B601A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 13:05:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2014 05:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,818,1400050800"; d="scan'208";a="555138453"
Received: from bidesilv-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.223])
	by orsmga001.jf.intel.com with ESMTP; 07 Aug 2014 06:05:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Date: Thu, 07 Aug 2014 14:05:01 +0100
Message-ID: <2374073.Q4LByM6bcI@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.7-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <53E3512E.5090008@dynamicdevices.co.uk>
References: <1571948.CrPtZqAbFm@peggleto-mobl5.ger.corp.intel.com>
	<53E3512E.5090008@dynamicdevices.co.uk>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 07 Aug 2014 13:05:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alex,

On Thursday 07 August 2014 11:13:02 Alex J Lennon wrote:
> On 07/08/2014 10:10, Paul Eggleton wrote:
> fwiw Upgrade solutions are something that is still a read need imho,  as
> I think we discussed at one of the FOSDEMs.
>
> (The other real need being an on-board test framework, again imho, and
> which I believe is ongoing)

Indeed; I think we've made some pretty good progress here in that the Yocto 
Project QA team is now using the automated runtime testing to do QA tests on 
real hardware. Reporting and monitoring of ptest results is also being looked 
at as well as integration with LAVA.
 
> Historically I, and I suspect others, have done full image updates of
> the storage medium,  onboard flash or whatever but these images are
> getting so big now that I am trying to  move away from that and into
> using package feeds for updates to embedded targets.

Personally with how fragile package management can end up being, I'm convinced 
that full-image updates are the way to go for a lot of cases, but ideally with 
some intelligence so that you only ship the changes (at a filesystem level 
rather than a package or file level). This ensures that an upgraded image on 
one device ends up exactly identical to any other device including a newly 
deployed one. Of course it does assume that you have a read-only rootfs and 
keep your configuration data / logs / other writeable data on a separate 
partition or storage medium. However, beyond improvements to support for 
having a read-only rootfs we haven't really achieved anything in terms of out-
of-the-box support for this, mainly due to lack of resources.

However, whilst I haven't had a chance to look at it closely, there has been 
some work on this within the community:

http://sbabic.github.io/swupdate/swupdate.html
https://github.com/sbabic/swupdate
https://github.com/sbabic/meta-swupdate/
 
> My initial experience has been that
> 
> - as you mention it would be really helpful to have something "more"
> around management  of package feed releases / targets.
> 
> - some automation around deployment of package feeds to production
> servers would help,   or at least some documentation on best practice.

So the scope of my proposal is a little bit narrower, i.e. for the SDK; and 
I'm suggesting that we mostly bypass the packaging system since it doesn't 
really add much benefit and sometimes gets in the way when you're an 
application developer in the middle of development and the level of churn is 
high (as opposed to making incremental changes after the product's release).

> The other big issue I am seeing, which is mostly my own fault thus far,
> is that I have sometimes  taken  the easy option of modifying the root
> filesystem image in various ways within the image recipe (for example
> changing  a Webmin configuration perhaps)
> 
> However when I then come to upgrade a package in-situ, such as Webmin,
> the changes  are  then overwritten.
> 
> I think this is probably also an issue when upgrading packages that have
> had local modifications made, and I wonder whether there's a solution to
> this that I'm not aware of?

We do have CONFFILES to point to configuration files that may be modified (and 
thus should not just be overwritten on upgrade). There's not much logic in the 
actual build system to deal with this, we just pass it to the package manager; 
but it does work, and recipes that deploy configuration files (and bbappends, if 
the configuration file is being added rather than changed from there) should set 
CONFFILES so that the right thing happens on upgrade if you are using a 
package manager on the target.

A related issue is that for anything other than temporary changes it's often 
not clear which recipe you need to change/append in order to provide your own 
version of a particular config file. FYI I entered the following enhancement bug 
some months ago to add a tool to help with that:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6447

> I am aware of course that mainstream package management tools allow
> diffing, upgrading,  ignoring and such but I am unsure as to how that is
> supported under Yocto at present?

There isn't really any support for this at the moment, no; I think we'd want 
to try to do this kind of thing at the build system end though to avoid tying 
ourselves to one particular package manager.
 
Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

