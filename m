Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3C577EAC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 13:21:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 05 Jun 2017 06:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,300,1493708400"; d="scan'208";a="864700579"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.0.25])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2017 06:21:31 -0700
Message-ID: <1496668890.3690.7.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Leonardo Sandoval
	<leonardo.sandoval.gonzalez@linux.intel.com>
Date: Mon, 05 Jun 2017 14:21:30 +0100
In-Reply-To: <4f9f2466-1409-e5d8-917c-58b4864f8863@linux.intel.com>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<1496585728.6630.165.camel@linuxfoundation.org>
	<4f9f2466-1409-e5d8-917c-58b4864f8863@linux.intel.com>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Mon, 05 Jun 2017 13:21:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-06-05 at 15:14 +0300, Alexander Kanavin wrote:
> On 06/04/2017 05:15 PM, Richard Purdie wrote:
> 
> > https://autobuilder.yoctoproject.org/main/builders/nightly-x86/buil
> > ds/1
> > 163/steps/BuildImages/logs/stdio
> > 
> > https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/b
> > uild
> > s/1203/steps/BuildImages/logs/stdio
> > 
> > https://autobuilder.yoctoproject.org/main/builders/nightly-ipk/buil
> > ds/1
> > 112/steps/BuildImages/logs/stdio
> > 
> > I suspect the same issue causing failures in multiple places.
> 
> The patches as they are now require that the C compiler on the host
> is 
> recent; specifically that it defaults to C11 mode. I'm not sure when
> GCC 
> made the switch, but it works that way with GCC 6.3.0.
> 
> In any case, I'll rework the patches to use openmp, as requested by 
> upstream - this may however cause a different set of compatibility 
> problems with older GCC versions. What are the oldest host compiler 
> versions/distro versions that we still need to support in master?

On the Yocto Autobuilder clusters we have:
* centos7 / gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-11)
* debian8 / gcc (Debian 4.9.2-10) 4.9.2
* debian-testing / gcc (Debian 6.3.0-14) 6.3.0 20170415
* fedora24 / gcc (GCC) 6.3.1 20161221 (Red Hat 6.3.1-1)
* fedora25 / gcc (GCC) 6.3.1 20161221 (Red Hat 6.3.1-1)
* opensuse132 / gcc (SUSE Linux) 4.8.3 20140627 [gcc-4_8-branch
revision 212064]
* opensuse422 / gcc (SUSE Linux) 4.8.5
* ubuntu1604 / gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609
* ubuntu1610 / gcc (Ubuntu 6.2.0-5ubuntu12) 6.2.0 20161005

We are aiming to replace openSUSE 13.2 (as it was discontinued in
January of this year) but CentOS 7 has a good long lifetime ahead of
it, therefore supporting it and RHEL 7 will require gcc 4.8.5 support.

Joshua

