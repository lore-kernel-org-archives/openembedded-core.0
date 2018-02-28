Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF79788A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 14:51:23 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 06:51:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,406,1515484800"; d="scan'208";a="20833215"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga007.fm.intel.com with ESMTP; 28 Feb 2018 06:51:23 -0800
Date: Wed, 28 Feb 2018 16:54:25 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Message-ID: <20180228145424.GA23739@mbabyjoh-desk.ger.corp.intel.com>
References: <1519762766-20100-1-git-send-email-juro.bystricky@intel.com>
MIME-Version: 1.0
In-Reply-To: <1519762766-20100-1-git-send-email-juro.bystricky@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: jurobystricky@hotmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dbus-test_1.12.2: various fixes
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
X-List-Received-Date: Wed, 28 Feb 2018 14:51:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Feb 27, 2018 at 12:19:26PM -0800, Juro Bystricky wrote:
> The result of running dbus-test-ptest was a series of
> various segfaults, interpreted as FAILs. This was a direct consequence
> of the test suite loading the installed shared library libdbus-1.so, not the
> one built along the test suite.
> 
> While we normally want to test against the installed libraries, we cannot
> do this in this case as the test suite expects a library that is configured/compiled
> differently from the installed one. We could configure the installed library
> identically as the test suite expects, (and there should be no issues), however
> this is not desirable for performance reasons.
> 
> Hence we need to use the library built along with the test suite.
> Of course, running the test suite against its own library does not
> test the installed library, however they are both built from the same
> sources so that can give us some kind of indication.
> 
> The following changes were made:
> 
> 1. Configure the test library as close as possible to the installed one,
>    with some additional configuration options that are needed for testing.
>    (Use dbus_1.12.2.bb recipe as a template)
> 2. Include the shared libraries in the package, use LD_LIBRARY_PATH during
>    testing to load them instead of the installed ones.
> 3. Add a few more tests. (There are still some additional tests built that
>    are not used, but they would have to be special-cased).
> 4. When evaluating the test results, differentiate between "FAIL" and "SKIP"
> 
> [YOCTO #10841]
> [YOCTO #12277]
> 
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-core/dbus/dbus-test_1.12.2.bb | 30 ++++++++++++++++++++++++++----
>  meta/recipes-core/dbus/dbus/run-ptest      | 20 +++++++++++++++++---
>  2 files changed, 43 insertions(+), 7 deletions(-)

Probably due to this change, dbus ptest related sanity tests fails here:

https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds/813/steps/Running%20Sanity%20Tests/logs/stdio


NOTE:  ... ok
| NOTE: ======================================================================
| NOTE: FAIL: test_ptestrunner (ptest.PtestRunnerTest)
| NOTE: ----------------------------------------------------------------------
| NOTE: Traceback (most recent call last):
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oeqa/runtime/cases/ptest.py", line 93, in test_ptestrunner
|     self.assertFalse(failed_tests, msg = "Failed ptests: %s" %(str(failed_tests)))
| AssertionError: {'dbus-test': [' test/test-bus', ' test/test-dbus-daemon', ' test/test-names']} is not false : Failed ptests: {'dbus-test': [' test/test-bus', ' test/test-dbus-daemon', ' test/test-names']}


Best Regards,
Maxin

