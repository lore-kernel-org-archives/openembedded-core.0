Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CBC1871A60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:21:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Dec 2016 00:21:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="1081125137"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.7])
	by fmsmga001.fm.intel.com with ESMTP; 13 Dec 2016 00:21:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 13 Dec 2016 21:21:53 +1300
Message-ID: <1611902.KszYoSQub8@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.12-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <d0d8f45f-774f-0965-2a60-6acd17aca09a@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<7884104.xbYfD5GGaH@peggleto-mobl.ger.corp.intel.com>
	<d0d8f45f-774f-0965-2a60-6acd17aca09a@windriver.com>
MIME-Version: 1.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>, "Limon,
	Anibal" <anibal.limon@intel.com>, "Lopez,
	Mariano" <mariano.lopez@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] oeqa/sdkext/devtool.py: remove workspace/sources before running test cases
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
X-List-Received-Date: Tue, 13 Dec 2016 08:21:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 13 Dec 2016 14:47:10 Robert Yang wrote:
> On 12/13/2016 02:29 PM, Paul Eggleton wrote:
> > On Tue, 13 Dec 2016 13:56:05 Robert Yang wrote:
> >> On 12/13/2016 12:45 PM, Paul Eggleton wrote:
> >>> It seems to me that's what's missing here is a proper teardown process
> >>> like we have for oe-selftest, so that tests clean up after themselves
> >>> whether they succeed or fail. I'm unsure as to whether that is part of
> >>> the plan for the new QA refactoring though.
> >> 
> >> There is already a 'devtool reset' which can do the cleanup, but it
> >> can't remove sources as I said in the commit log.
> > 
> > devtool reset not deleting the source tree is intentional - I don't want
> 
> Add an option like "devtool reset --force" ? When I met the error, the first
> I did was check "devtool reset", but there is no way to remove resources,
> so I have to remove it here to allow multilib test cases runs.

I've considered this and decided against it - it just seems to me that at 
least one person will use it every time until one day when they wipe out their 
source with their changes in it. I'd really rather not be enabling that. 
Besides, in everyday use repeated runs of devtool add / modify on the same 
recipe should be at a minimum, if that's not the case then we have other 
issues to look at.

You say there's no way to remove these, but there is - just delete the files 
explicitly.

> Or maybe fix "devtool add" to check the git repo correclty ? For example,
> when there is already a repo, just update it rather than clone it again.

Right, that has been suggested - and it's all fine if the source tree is 
unmodified and just a straight update to get from where it is currently to 
match the upstream. However, what if it's not fast-forward, or a different 
repo entirely? What if there are local modifications?

> The multilib + testsdkext would fail without this fix.

Yes, that's why I ultimately said we haven't much choice but to apply this 
patch. We must acknowledge however that the problem exists because the tests 
aren't cleaning up after themselves, which should be their responsibility.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

