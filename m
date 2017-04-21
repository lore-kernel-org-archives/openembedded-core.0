Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56BB777AC0;
	Fri, 21 Apr 2017 13:42:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3LDg0G6005310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Apr 2017 06:42:00 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Apr 2017 06:41:59 -0700
To: David Vincent <freesilicon@gmail.com>,
	<openembedded-architecture@lists.openembedded.org>
References: <CAKRNOGxS5k4DSs3LwEDiUNJEcFAAX1LQeN6EUHuppB7Ak7rFEw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <b5136884-3fa1-eb65-c55f-fadc11c81e56@windriver.com>
Date: Fri, 21 Apr 2017 08:41:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAKRNOGxS5k4DSs3LwEDiUNJEcFAAX1LQeN6EUHuppB7Ak7rFEw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [RFC] Handling configuration files
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
X-List-Received-Date: Fri, 21 Apr 2017 13:42:04 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 4/21/17 5:49 AM, David Vincent wrote:
> Following this thread on OE-Core
> (http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135812.html),
> the subject of handling configuration files for a machine just got
> back. It seems there already was a discussion around it but I couldn't
> find it. I know that 2.3 has now hit 'feature-freeze' status but I try
> to gather some ideas for maybe an implementation in 2.4.
> 
> Simply put, the problem is this:
> I want to
>   - Override a configuration file in a package
>   - Make the configuration machine-specific
>   - Upgrade the configuration during package upgrade without human interaction
> 
> For now, one way to do this is to append the recipe and to replace the
> PACKAGE_ARCH with MACHINE_ARCH. The downside of this approach is that
> a package is created for each machine on package repositories where
> only the configuration is modified.
> 
> Another way is to modify the file in ROOTFS_POSTPROCESS_COMMAND. The
> downside is that depending on the packager, it would either not
> survive the package upgrade or not be upgradable.

Update is potentially an issue..  but not surviving a package upgrade means
we've got a recipe/package manager bug to deal with.

If the configuration items are properly specified, then a package upgrade should
NOT destroy custom configurations... if it does, I consider this a bug.

> The last way would be to use update-alternatives, but IMHO it does
> feel weird. Another downside would be the need to modify all recipes
> to mark the configurations as alternatives.
> 
> My idea was the following. Maybe we could rely on the CONFFILES
> variable to create a -conf package (like -dbg/-dev/-staticdev). If
> possible, this package only should be marked as MACHINE_ARCH. This
> could happen behind the scenes in package.bbclass. The only problem I
> see for now is how to identify that the configuration file has been
> overridden in a machine-specific recipe (SRC_URI or other variable ?).
> Do you think it is feasible or am I missing something ? I could
> proceed to implement that kind of behavior but I would like to know
> beforehand if there are other things I should take into account.

Unfortunately RPM does not permit generating a single package with multiple
architectures.

Also if even a piece of the constructed system is MACHINE specific, then usually
all of it has to be rebuilt from source -- which would overwrite previous
versions in the feeds.

I agree the update-alternatives feels 'strange', because it effectively
preserves the original and provides the 'custom' at the same time.. but
functionally it will work fine.

The other option is to go through the system and construct new 'conf' packages
(to be used as dependencies for the runtime) for packages that typically get
configured....

I'd almost suggest that a hybrid approach to this might be appropriate.

Use the update-alternatives method for items that are not commonly modified in
deployment... then use a "new" conf recipe for each item that is typically
modified.  (I'm worried this will add additional overhead to recipe upgrades and
such, so I'm not convinced a conf recipe is actually a sustainable idea here.)

--Mark

> Thanks,
> David
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
> 


