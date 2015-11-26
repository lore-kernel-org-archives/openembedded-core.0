Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 513826011F;
	Thu, 26 Nov 2015 21:00:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 13:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,348,1444719600"; d="scan'208";a="607686697"
Received: from rsiu-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.135.187])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Nov 2015 13:00:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Fri, 27 Nov 2015 10:00:36 +1300
Message-ID: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.13-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
MIME-Version: 1.0
Subject: Patchwork & patch handling improvements
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
X-List-Received-Date: Thu, 26 Nov 2015 21:00:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

Over the past several years one of the regular complaints people have made 
about our project has been that patches sometimes take a long time to make it 
into master, and it's not always clear what the state of a patch is during 
that time. On the other side of things, maintainers are finding it increasingly 
hard to keep up with testing and integrating incoming patches. Additionally, 
trivial mistakes sometimes creep in that would be fairly easy to catch with an 
automated process. We've been talking about this for a while and now I'd like 
to propose a plan to finally address this:

1) Upgrade the OE Patchwork instance [0] to a newer release; this should fix 
some of the problems we are having [1] plus give us additional features. I 
propose using the fork that freedesktop.org are using [2] [3] which is moving 
a bit faster than upstream Patchwork; whilst the changes there may eventually 
make it upstream (and work is ongoing there) we have a much greater ability to 
influence the fork given that it's being worked on by one of my colleagues who 
is pushing it in the direction we need it to go e.g. proper support for series 
as opposed to treating every patch individually, improved UI, etc.

2) Trigger automatic testing of submitted patches from Patchwork. We'd have a 
script look at the contents of a patch and first check that the expected style 
has been adhered to; second it would do some quick tests to verify that the 
patch hasn't caused any immediately obvious regressions. I've filed some bugs 
to cover this in more detail [4].

3) Provide a means to easily schedule an overnight build on the autobuilder 
for the set of patches that have passed the initial testing, as well as 
present the results in a form that's easier to review for maintainers. For OE-
Core this would be tied into the Yocto Project autobuilder, but I expect the 
tools could be made flexible.

At all stages through this process the patch status in patchwork will be kept 
up-to-date so it's clear to everyone what's happening. I'm also thinking we 
could do email notifications to the submitter (opt-in) though that would be a 
later add-on.

Whilst the initial plan covers only OE-Core, once we get them working the 
tools and scripts used should be just as applicable to other layers. I'm also 
trying to ensure that the patch validation is generic enough so it can live in 
OE-Core, and thus we can easily update and refine it over time in line with the 
code itself as well as encourage submitters to use the script on their own 
changes before sending.

Please let me know your thoughts on the above, most importantly on the 
patchwork upgrade, since most of this hinges on that; I don't believe we can 
practically base it on the version of Patchwork we are using now. 

[Note that this email is cross-posted - it may be best to reply on OE-Core 
only to save people's inboxes.]

Thanks,
Paul

[0] http://patchwork.openembedded.org/
[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7657#c21
[2] http://patchwork.freedesktop.org/ 
[3] https://github.com/dlespiau/patchwork
[4] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8648

-- 

Paul Eggleton
Intel Open Source Technology Centre

