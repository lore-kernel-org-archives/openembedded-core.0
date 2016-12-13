Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D1C8871A88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:07:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 13 Dec 2016 00:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="1071433190"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.7])
	by orsmga001.jf.intel.com with ESMTP; 13 Dec 2016 00:07:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 13 Dec 2016 21:07:05 +1300
Message-ID: <3698001.Ed7gRfCEom@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.12-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <18078b0a-ede2-41ff-491b-9151b5b2aa1c@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<2244665.P00pJDD7kM@peggleto-mobl.ger.corp.intel.com>
	<18078b0a-ede2-41ff-491b-9151b5b2aa1c@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/8] oeqa/sdkext/devtool.py: don't reset when the test is failed
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
X-List-Received-Date: Tue, 13 Dec 2016 08:07:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 13 Dec 2016 14:39:46 Robert Yang wrote:
> On 12/13/2016 02:33 PM, Paul Eggleton wrote:
> > On Tue, 13 Dec 2016 14:01:08 Robert Yang wrote:
> >> On 12/13/2016 12:48 PM, Paul Eggleton wrote:
> >>> On Wed, 16 Nov 2016 22:19:34 Robert Yang wrote:
> >>>> The contents are helpful to debug when the error happens.
> >>> 
> >>> In this case removing this is OK because we're operating on an eSDK that
> >>> the tests install. However, this wouldn't be appropriate for the devtool
> >>> oe- selftest tests since they are operating on the user's build system
> >>> itself - not that you probably have any intention of changing those, I
> >>> just wanted to note that.
> >> 
> >> Sorry, I don't quite understand, does selftest uses
> >> oeqa/sdkext/devtool.py,
> >> please ?
> > 
> > No, this is for bitbake -c testsdkext.
> > 
> >> Even if it uses devtool.py, I still think that we need keep the
> >> error contents for debugging when the error happens. It's very hard to
> >> debug when there is no error log or no workspace.
> > 
> > I mean the equivalent oe-selftest tests in oeqa/selftest/devtool.py.
> > 
> > Actually, I've realised something that applies here as well - leaving the
> > files around would be OK if we stopped on the first failure, but we don't
> > -
> > the next test proceeds after it. How will you be able to rely on what's in
> > the workspace if several other tests have run afterwards - not to mention
> > ensure those tests aren't disrupted by the leftover files?
> 
> That's a problem, but we really need consider debugging, otherwise it's
> painful when test are failed but nothing left. How about run test cases
> in different workspaces ?

Currently when I need to debug a test, I tend to either run the test commands 
manually, or comment out the cleanup. If we really want to improve debugging 
then we ought to do it properly - have proper teardown infrastructure and then 
provide a mode that disables it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

