Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 77E8972425
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 11:42:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Dec 2014 03:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,557,1413270000"; d="scan'208";a="646002775"
Received: from amoested-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.16.105])
	by fmsmga002.fm.intel.com with ESMTP; 11 Dec 2014 03:42:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Date: Thu, 11 Dec 2014 11:42:05 +0000
Message-ID: <2124477.a3meRqLHOW@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48257CB01F@sestoex09.enea.se>
References: <3230301C09DEF9499B442BBE162C5E48257CB01F@sestoex09.enea.se>
MIME-Version: 1.0
Cc: Maxin John <Maxin.John@enea.com>,
	'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH] python: Building without SSLv3 support , The POODLE Bites Again
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
X-List-Received-Date: Thu, 11 Dec 2014 11:42:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 December 2014 14:38:53 Sona Sarmadi wrote:
> > I think we should apply the patch now anyway; we'll want to know that it
> > works for backports to the stable branch(es), and in any case the upgrade
> > to 2.7.9 is not going to be a straightforward task based upon my earlier
> > attempt to upgrade to 2.7.6 (the current state of which is still in
> > paule/python276-wip in poky-contrib).
> 
> I have applied this patch in master and have run some tests to verify that 
> Sslv3 is really disabled.  It seems that SSLv3 still is enabled. I am
> running more tests to find out why SSLv3 is not disabled and what more
> needs to be done. 
> SSLv2 is disabled already, if we manage to disable SSLV3 then I guess we
> need to disable SSLv23 as well ??!

I'm not sure of that. It seems that SSLv23 is the default even in 2.7.9. I'm 
unclear on whether that is an issue or not based on what I can find.

> I think we should consider (start looking at upgrading to python 2.7.9 in
> master), to address this issue. I feel uncomfortable with this Debian
> patch. It seems that  we need to do more manual changes in order to make
> this work. I will soon update the bug 7015 with my test results. 

We definitely do need to do this upgrade, yes; but we'd also like to have a fix 
for older versions too. FWIW I've just entered an enhancement bug to cover 
this for master; at the moment I'm not sure who will end up doing it but I 
thought we should have something to track it since it's not a trivial piece of 
work:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=7059

(Richard is nominally the maintainer of the recipe, but I suspect he has his 
hands pretty much full with everything else that's going on.)
 
> While testing this issue a new vulnerability was released yesterday :
> Incorrect TLS padding may be accepted when terminating TLS 1.x CBC cipher
> connections. (CVE-2014-8730)
> 
> https://support.f5.com/kb/en-us/solutions/public/15000/800/sol15882.html 
> https://community.qualys.com/blogs/securitylabs/2014/12/08/poodle-bites-tls

Yes, they never stop coming :(

From my digging though I can't seem to find anything specifying any versions of 
open source software that need fixing for this new vulnerability, only 
proprietary software. Did you find anything?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

