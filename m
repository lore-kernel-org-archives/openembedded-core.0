Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 62D4A6B1EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 09:51:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2013 02:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,692,1367996400"; d="scan'208";a="367253486"
Received: from unknown (HELO helios.localnet) ([10.252.122.61])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2013 02:51:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tudor Florea <tudor.florea@enea.com>
Date: Thu, 18 Jul 2013 10:51:20 +0100
Message-ID: <3508255.N7Chy3QYdi@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <1374019772-63941-1-git-send-email-tudor.florea@enea.com>
References: <1374019772-63941-1-git-send-email-tudor.florea@enea.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Install Python test suite and run it as ptest.
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
X-List-Received-Date: Thu, 18 Jul 2013 09:51:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Tudor,

On Wednesday 17 July 2013 02:09:32 Tudor Florea wrote:
>...
> +++ b/meta/recipes-devtools/python/python/run-ptest
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +#
> +#This script is used to run python test suites
> +
> +make -f /usr/lib/python/ptest/Makefile -k runtest-TESTS
> srcdir=/usr/lib/python2.7 TESTPROG=/usr/lib/python2.7/test/regrtest.py |
> sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g'
> -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\.
> ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g' 

The run-ptest script here has hardcoded /usr/lib/ for ${libdir} (which can and 
is changed in some distro configurations), we should ideally avoid this e.g. 
through use of sed in do_install after installing the file.

>...
> +RDEPENDS_${PN}-ptest = "${PN}-json ${PN}-crypt ${PN}-unittest ${PN}-difflib
> ${PN}-pprint ${PN}-shell ${PN}-tests ${PN}-misc ${PN}-netclient
> ${PN}-mailbox ${PN}-pkgutil ${PN}-profile ${PN}-compile ${PN}-pydoc
> ${PN}-robotparser ${PN}-netserver ${PN}-datetime ${PN}-compression
> ${PN}-mime ${PN}-audio ${PN}-db ${PN}-resource ${PN}-image ${PN}-subprocess
> ${PN}-doctest ${PN}-numbers ${PN}-html ${PN}-email ${PN}-distutils
> ${PN}-hotshot ${PN}-2to3 ${PN}-mmap ${PN}-terminal ${PN}-xmlrpc ${PN}-smtpd
> ${PN}-unixadmin ${PN}-compiler" 

Could the ptest package simply depend on ${PN}-modules rather than having an 
additional hardcoded list of modules packages? It looks like this could be 
replaced by:

RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-misc"

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

