Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7CC71A70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 08:43:18 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0C8hH2Y026251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 12 Jan 2018 08:43:18 GMT
Message-ID: <1515746597.29722.130.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Date: Fri, 12 Jan 2018 08:43:17 +0000
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA01566C6D76@ALA-MBC.corp.ad.wrs.com>
References: <cover.1509604697.git.jackie.huang@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AA01566B9AEB@ALA-MBC.corp.ad.wrs.com>
	<1514987639.5525.138.camel@linuxfoundation.org>
	<1B858668EC6A94408DCA5225FDFA85AA01566C6D76@ALA-MBC.corp.ad.wrs.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2 v2] glibc: fixes for nscd and libnss-db
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
X-List-Received-Date: Fri, 12 Jan 2018 08:43:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-01-04 at 01:31 +0000, Huang, Jie (Jackie) wrote:
> 
> > 
> > -----Original Message-----
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > Sent: Wednesday, January 03, 2018 21:54
> > To: Huang, Jie (Jackie); openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 0/2 v2] glibc: fixes for nscd and
> > libnss-db
> > 
> > On Fri, 2017-12-22 at 02:08 +0000, Huang, Jie (Jackie) wrote:
> > > 
> > > Ping, I didn't see any objection on this, but it's not merged
> > > yet, do
> > > I miss anything?
> > When we test it we see:
> > 
> > WARNING: glibc-2.26-r0 do_package: glibc-extra-nss-2.26 was
> > registered as
> > shlib provider for libnss_db.so.2, changing it to libnss-db-2.26
> > because it was
> > built later
> Sorry, but I haven't seen this warning in our builds after this patch
> merged in our local branch for two weeks. Maybe we missed some cases
> in our test builds, so could you show me how to reproduce it? Thanks!
> 
> This patch is simply re-package libnss_db.so* from glibc-extra-nss
> into libnss-db, I don't understand why libnss_db.so* is still
> provided by both of them, did I miss anything when I do a re-
> packaging for a recipe?


I was able to reproduce this by starting with an existing build without
the patch, then applying the patch. The error shows once during the
rebuild and then not again. Its therefore probably less of an issue
(but does raise a question about why that is happening).

The new make dependency does cause an additional failure though:

$ oe-selftest -r bbtests.BitbakeTests.test_non_gplv3

2018-01-12 08:31:25,196 - oe-selftest - INFO - test_non_gplv3 (bbtests.BitbakeTests)
2018-01-12 08:34:02,940 - oe-selftest - INFO -  ... FAIL
2018-01-12 08:34:02,941 - oe-selftest - INFO - ======================================================================
2018-01-12 08:34:02,941 - oe-selftest - INFO - FAIL: test_non_gplv3 (bbtests.BitbakeTests)
2018-01-12 08:34:02,941 - oe-selftest - INFO - ----------------------------------------------------------------------
2018-01-12 08:34:02,941 - oe-selftest - INFO - Traceback (most recent call last):
  File "/media/build1/poky/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/media/build1/poky/meta/lib/oeqa/selftest/cases/bbtests.py", line 237, in test_non_gplv3
    self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
AssertionError: 1 != 0 : Bitbake failed, exit code 1, output Parsing recipes...done.
Parsing of 829 .bb files complete (0 cached, 829 parsed). 1287 targets, 99 skipped, 0 masked, 0 errors.
Removing 35 recipes from the core2-64 sysroot...done.
Removing 35 recipes from the qemux86-64 sysroot...done.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'make' (but /media/build1/poky/meta/recipes-core/glibc/glibc_2.26.bb RDEPENDS on or otherwise requires it)
make was skipped: it has an incompatible license: GPLv3 & LGPLv2
NOTE: Runtime target 'make' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['make']
ERROR: Required build target 'selftest-ed' has no buildable providers.
Missing or unbuildable dependency chain was: ['selftest-ed', 'virtual/libc', 'make']


Cheers,

Richard

