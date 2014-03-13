Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7456E7D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 10:01:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Mar 2014 03:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,646,1389772800"; d="scan'208";a="499073009"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.214])
	by orsmga002.jf.intel.com with ESMTP; 13 Mar 2014 03:01:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Thu, 13 Mar 2014 10:01:10 +0000
Message-ID: <3035449.StOc9XfpzV@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <5321803B.90400@windriver.com>
References: <cover.1394093112.git.Chong.Lu@windriver.com>
	<CAJTo0LZ_OjXVhoNv6wk085=5vY=i64_8T6s=Tef5h7qgFC5Sfw@mail.gmail.com>
	<5321803B.90400@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Thu, 13 Mar 2014 10:01:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 13 March 2014 17:54:03 Chong Lu wrote:
> On 03/06/2014 06:04 PM, Burton, Ross wrote:
> > On 6 March 2014 08:06, Chong Lu <Chong.Lu@windriver.com> wrote:
> >> +PACKAGES += "dbus-ptest"
> >> +ALLOW_EMPTY_${PN}-ptest = "1"
> >> +RDEPENDS_${PN}-ptest = "${@base_contains('IMAGE_FEATURES', 'ptest-pkgs',
> >> 'dbus-test-ptest', 'dbus-test', d)}"
> >
> > Clearly I wasn't thinking clearly last week.  You can't check
> > IMAGE_FEATURES in a non-image recipe so this isn't a good solution.
> 
> Do you have any suggestion about this issue?
> If we don't check IMAGE_FEATURES, I have no way to resolve this problem
> that only build but not install ptest. I'm very confused.

This should check DISTRO_FEATURES, not IMAGE_FEATURES. Assuming ptest is in 
DISTRO_FEATURES, even if ptest is not in IMAGE_FEATURES it doesn't matter if 
the dependency between dbus-ptest and dbus-ptest-ptest exists because dbus-
ptest itself shouldn't be in the image, so dbus-ptest-ptest shouldn't be 
pulled in either. Does that make sense?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

