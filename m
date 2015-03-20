Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 09D3A6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 08:07:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 20 Mar 2015 01:07:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,435,1422950400"; d="scan'208";a="469971449"
Received: from tkkaskin-mobl3.ger.corp.intel.com ([10.252.21.195])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Mar 2015 01:07:08 -0700
Message-ID: <550BD52C.1040601@linux.intel.com>
Date: Fri, 20 Mar 2015 10:07:08 +0200
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Policy of explicit disabling of package features
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
X-List-Received-Date: Fri, 20 Mar 2015 08:07:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm using the pulseaudio packaging as the starting point to learn about 
OE packaging. I'm trying to understand why everything is done as it is 
done, and my current focus is on pulseaudio's EXTRA_OECONF:

EXTRA_OECONF = "\
                 --disable-hal-compat \
                 --disable-orc \
                 --enable-tcpwrap=no \
                 --with-access-group=audio \
                 --disable-openssl \
                 --disable-xen \
                 --with-database=simple \
                 --without-fftw \
                 --without-zsh-completion-dir \
                 --with-udev-rules-dir=`pkg-config --variable=udevdir 
udev`/rules.d \
                 ac_cv_header_valgrind_memcheck_h=no \
"

I'm trying to understand the reason for each of those options. One 
question that I had was that why are some features explicitly disabled, 
when they should get anyway disabled automatically due to missing 
dependencies. I found out from the git logs that at least some of them 
are explicitly disabled, because the configure script may randomly find 
some dependencies installed even if they are not listed in DEPENDS, due 
to other packages pulling them in.

This then raises the question that what the policy of explicit vs. 
implicit disabling is, and also what the policy *should* be. It seems 
that the current policy is that things are explicitly disabled only 
after someone has run into problems with the non-determinism. Is that 
correct?

It seems to me that a better policy would be to always explicitly 
disable *all* features that have external dependencies that aren't 
listed in DEPENDS. That kind of policy should reduce these 
non-determinism issues. Full compliance with such policy may not be 
feasible to achieve, since it requires great care to check for new 
optional dependencies whenever updating to new upstream versions, but I 
hope that at least "pre-emptive" patches that add explicit feature 
disabling will be accepted even before anyone has run into actual problems.

-- 
Tanu

