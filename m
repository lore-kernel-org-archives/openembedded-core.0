Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7A074C8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 08:31:44 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7F8VdBZ002329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 15 Aug 2018 09:31:40 +0100
Message-ID: <37d7044123efda7f67a0ab4fe12ddeb49db96c31.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 09:31:39 +0100
In-Reply-To: <20180814162113.22774-1-ross.burton@intel.com>
References: <20180814162113.22774-1-ross.burton@intel.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] oe-pkgdata-util: improve resiliance of lookup-recipe
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
X-List-Received-Date: Wed, 15 Aug 2018 08:31:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-08-14 at 17:21 +0100, Ross Burton wrote:
> If we can't find the pkgdata for a package, instead of erroring out
> just emit a
> message and continue.
> 
> This makes it possible to pass long lists of packages to oe-pkgdata-
> util and
> process the output.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  scripts/oe-pkgdata-util | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Fails in oe-selftest:

2018-08-15 01:35:23,638 - oe-selftest - INFO - ======================================================================
2018-08-15 01:35:23,638 - oe-selftest - INFO - FAIL: pkgdata.OePkgdataUtilTests.test_lookup_recipe (subunit.RemotedTestCase)
2018-08-15 01:35:23,638 - oe-selftest - INFO - ----------------------------------------------------------------------
2018-08-15 01:35:23,638 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/pkgdata.py", line 64, in test_lookup_recipe
    self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
  File "/usr/lib/python3.5/unittest/case.py", line 821, in assertEqual
    assertion_func(first, second, msg=msg)
  File "/usr/lib/python3.5/unittest/case.py", line 814, in _baseAssertEqual
    raise self.failureException(msg)
AssertionError: 0 != 1 : Status different than 1. output: The following packages could not be found: nonexistentpkg


