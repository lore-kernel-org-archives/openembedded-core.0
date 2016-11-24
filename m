Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9340B719CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 03:18:24 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 23 Nov 2016 19:18:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,690,1473145200"; d="scan'208";a="34961115"
Received: from paolienk-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.157.213])
	by orsmga005.jf.intel.com with ESMTP; 23 Nov 2016 19:18:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 24 Nov 2016 16:18:21 +1300
Message-ID: <1525289.rQK3S6YPkZ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.10-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <adc8effe-1856-560a-a7fb-0d92138e1990@windriver.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<1479899811.31880.37.camel@intel.com>
	<adc8effe-1856-560a-a7fb-0d92138e1990@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Thu, 24 Nov 2016 03:18:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 24 Nov 2016 10:01:59 Robert Yang wrote:
> On 11/23/2016 07:16 PM, Patrick Ohly wrote:
> > On Tue, 2016-11-22 at 23:49 -0800, Robert Yang wrote:
> >> [YOCTO #10710]
> >> 
> >> Otherwise, we can't login as root when debug-tweaks is not in
> >> IMAGE_FEATURES, and there is no other users to login by default, so
> >> there is no way to login.
> > 
> > Wait a second, are you really suggesting that OE-core should have a
> > default root password in its default configuration?
> > 
> > That's very bad practice and I'm against doing it this way. Having a
> > default password is one of the common vulnerabilities in actual devices
> > on the market today. OE-core should make it hard to make that mistake,
> > not actively introduce it.
> > 
> > So if you think that having a root password set (instead of empty), then
> > at least make it an opt-in behavior that explicitly has to be selected.
> > Make it an image feature so that images with and without default
> > password can be build in the same build configuration. Changing
> > base-passwd doesn't achieve that.
> > 
> > Even then I'm still wondering what the benefit of a well-known password
> > compared to no password is. Both are equally insecure, so someone who
> > wants to allow logins might as well go with "empty password".
> 
> The problem is that when debug-tweaks or empty-root-password is not in
> IMAGE_FEATURE, there is no way to login by default, which will surprise
> the user. How about:
> 
> 1) Let user can set root passwd via a variable when building.
> 
> Or/And
> 
> 2) Warn the user at build time when the image is unable to login.

There are problems with both of these:

1) I'm concerned that by making it trivially easy this will encourage users to 
set a root password and forget they have done so. This may lead to yet more 
products going out with default root passwords, and that is not a good thing.

2) Having no root password in this scenario is not necessarily a mistake, it 
may be intentional. If nobody ever needs to log into your device via a 
terminal, then why would you need a root password set at all? In that scenario 
you wouldn't want to be implying "this could be wrong, you should set a root 
password".

If we need more documentation around this so that people understand how this 
aspect works (and I don't doubt that we do, people do ask about it) then by 
all means we should improved the documentation.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

