Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1988E6F757
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 18:15:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Mar 2014 11:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,625,1389772800"; d="scan'208";a="495623894"
Received: from unknown (HELO [10.255.12.212]) ([10.255.12.212])
	by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2014 11:15:37 -0700
Message-ID: <531E0149.7010905@linux.intel.com>
Date: Mon, 10 Mar 2014 11:15:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>, 
	openembedded-core@lists.openembedded.org
References: <1394153667-4247-1-git-send-email-paul@paulbarker.me.uk>
	<1394153667-4247-2-git-send-email-paul@paulbarker.me.uk>
In-Reply-To: <1394153667-4247-2-git-send-email-paul@paulbarker.me.uk>
Subject: Re: [PATCH] python3: Add ptest support
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
X-List-Received-Date: Mon, 10 Mar 2014 18:15:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2014 04:54 PM, Paul Barker wrote:
> A run-ptest script written in python is added which defines a new TestRunner
> subclass which prints test results in the required ptest format and then
> executes python's built-in testsuite using this new TestRunner subclass.
>
> The built-in testsuite is included in the python standard library and we ensure
> we have the complete library by adding ${PN}-modules and ${PN}-misc to the
> RDEPENDS for the ptest package. We also require libgcc for pthread support.
>
> Tested on qemux86. Several tests fail and many skip; further investigation
> should be done to check that the current status is acceptable. In addition, the
> testsuite causes an out-of-memory crash when qemu is configured with 256 MB of
> RAM. The testsuite completes without crashing with 1 GB RAM.
>
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>   meta/recipes-devtools/python/python3/run-ptest | 56 ++++++++++++++++++++++++++
>   meta/recipes-devtools/python/python3_3.3.3.bb  | 12 ++++++
>   2 files changed, 68 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python3/run-ptest
>
> diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
> new file mode 100644
> index 0000000..bd3ea11
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/run-ptest
> @@ -0,0 +1,56 @@
> +#! /usr/bin/env python3
> +
> +from test import support
> +from test import regrtest
> +import unittest
> +import sys
> +
> +# Define a test result class which outputs results in the desired format.
> +class ptestResult(unittest.TestResult):
> +    def __init__(self, runner):
> +        super(ptestResult, self).__init__()
> +        self.runner = runner
> +
> +    def addError(self, test, err):
> +        super(ptestResult, self).addError(test, err)
> +        self.runner.write("ERROR: %s: %s\n" % (str(test), str(err[1])))
> +
> +    def addSuccess(self, test):
> +        super(ptestResult, self).addSuccess(test)
> +        self.runner.write("PASS: %s\n" % str(test))
> +
> +    def addFailure(self, test, err):
> +        super(ptestResult, self).addFailure(test, err)
> +        self.runner.write("FAIL: %s: %s\n" % (str(test), str(err[1])))
> +
> +    def addSkip(self, test, reason):
> +        super(ptestResult, self).addSkip(test, reason)
> +        self.runner.write("SKIP: %s: %s\n" % (str(test), str(reason)))
> +
> +    def addExpectedFailure(self, test, err):
> +        super(ptestResult, self).addExpectedFailure(test, err)
> +        self.runner.write("XFAIL: %s\n" % (str(test)))
> +
> +    def addUnexpectedSuccess(self, test):
> +        super(ptestResult, self).addUnexpectedSuccess(test)
> +        self.runner.write("XPASS: %s\n" % str(test))
> +
> +# Define a test runner which uses the above output class.
> +class ptestRunner:
> +    def __init__(self, stream=sys.stderr):
> +        self.stream = stream
> +
> +    def write(self, message):
> +        self.stream.write(message)
> +
> +    def run(self, test):
> +        result = ptestResult(self)
> +        test(result)
> +        return result
> +
> +# Replace the test runner in python's standard library 'test.support'.
> +support.BasicTestRunner = ptestRunner
> +
> +# Run the python regression test suite - the replacement test runner will be
> +# used.
> +regrtest.main()
> diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes-devtools/python/python3_3.3.3.bb
> index b6f6def..e405a25 100644
> --- a/meta/recipes-devtools/python/python3_3.3.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.3.3.bb
> @@ -35,6 +35,7 @@ SRC_URI += "\
>               file://sysroot-include-headers.patch \
>               file://unixccompiler.patch \
>               file://avoid-ncursesw-include-path.patch \
> +            file://run-ptest \
>              "
>   SRC_URI[md5sum] = "f3ebe34d4d8695bf889279b54673e10c"
>   SRC_URI[sha256sum] = "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bdbcddf47df84d8dcb"
> @@ -209,6 +210,17 @@ FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
>   PACKAGES += "${PN}-misc"
>   FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
>
> +#inherit ptest after "require python-${PYTHON_MAJMIN}-manifest.inc" so PACKAGES doesn't get overwritten
> +inherit ptest
> +

Seems like there is an issue with the multi-lib build.

ERROR: QA Issue: lib32-python3: Files/directories were installed but not 
shipped
   /usr/lib/python3
   /usr/lib/python3/ptest
NOTE: recipe lib32-pulseaudio-4.0-r0: task do_package_write_rpm: Started

Sau!


> +# This must come after inherit ptest for the override to take effect
> +do_install_ptest() {
> +    install -m 0755 -d ${D}/${libdir}/python3/ptest
> +    install -m 0755 ${S}/../run-ptest ${D}/${libdir}/${PN}/ptest
> +}
> +
> +RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-misc libgcc"
> +
>   # catch manpage
>   PACKAGES += "${PN}-man"
>   FILES_${PN}-man = "${datadir}/man"
>

