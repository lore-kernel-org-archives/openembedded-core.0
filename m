Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T2N0C-0006Xc-Ds
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:54:16 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Aug 2012 06:42:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,784,1336374000"; 
	d="scan'208,217";a="135401664"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 06:42:08 -0700
Message-ID: <502E4AB5.8030206@intel.com>
Date: Fri, 17 Aug 2012 16:44:21 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1345208249.git.andrei.gherzan@windriver.com>
	<fe8f0c9d64b8fb123545d8afcd7891c6d6d90728.1345208249.git.andrei.gherzan@windriver.com>
In-Reply-To: <fe8f0c9d64b8fb123545d8afcd7891c6d6d90728.1345208249.git.andrei.gherzan@windriver.com>
Subject: Re: [PATCH 2/2] dbus-tests: Add separate recipe for building dbus-tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 13:54:16 -0000
Content-Type: multipart/alternative;
	boundary="------------090001000204080407030203"

--------------090001000204080407030203
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 08/17/2012 04:02 PM, Andrei Gherzan wrote:
> While compiling dbus with tests, dbus and dbus-glib are needed.
> To compile dbus-glib, dbus is needed (obviously). The only solution
> (to compile dbus with tests) is to create a new recipe where to
> compile dbus with --enable-tests --enable-embedded-tests, skip write
> to sysroot (noexec) and just package dbus-tests.
> A bash wrapper to run all tests is included.
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>   meta/recipes-core/dbus/dbus-tests/run_test.sh |   22 +++++++++
>   meta/recipes-core/dbus/dbus-tests_1.4.20.bb   |   64 +++++++++++++++++++++++++
>   2 files changed, 86 insertions(+), 0 deletions(-)
>   create mode 100755 meta/recipes-core/dbus/dbus-tests/run_test.sh
>   create mode 100644 meta/recipes-core/dbus/dbus-tests_1.4.20.bb
>
> diff --git a/meta/recipes-core/dbus/dbus-tests/run_test.sh b/meta/recipes-core/dbus/dbus-tests/run_test.sh
> new file mode 100755
> index 0000000..90abad2
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus-tests/run_test.sh
> @@ -0,0 +1,22 @@
> +#!/bin/sh
> +
> +# Tests location
> +export DBUS_TEST_HOMEDIR=/usr/lib/dbus-tests
> +# Tests data location
> +export DBUS_TEST_DATA=${DBUS_TEST_HOMEDIR}/test/data
> +
> +TESTS=" \
> +	bus/bus-test \
> +	bus/bus-test-system \
> +	dbus/dbus-test \
> +	bus/bus-test-launch-helper \
> +	test/shell-test \
> +	test/test-corrupt \
> +	test/test-dbus-daemon \
> +	test/test-loopback \
> +	test/test-marshal \
> +	test/test-relay \
> +	test/test-syslog \
> +	test/test-refs"
> +
> +${DBUS_TEST_HOMEDIR}/test/dbus-test-runner ${DBUS_TEST_HOMEDIR} ${TESTS}
> diff --git a/meta/recipes-core/dbus/dbus-tests_1.4.20.bb b/meta/recipes-core/dbus/dbus-tests_1.4.20.bb
> new file mode 100644
> index 0000000..0e7d272
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus-tests_1.4.20.bb
> @@ -0,0 +1,64 @@
> +FILESEXTRAPATHS_append := "${THISDIR}/dbus-${PV}"
> +include recipes-core/dbus/dbus.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI[md5sum] = "79eca2f2c1894ac347acce128314428b"
> +SRC_URI[sha256sum] = "103bdcd261a13140730b5fa69f56a98ab5c89ba3f0116ea62fcfd639520d5aaf"
> +
> +DEPENDS += "python-pygobject-native python-dbus-native dbus-glib dbus"
> +RDEPENDS_${PN} = "dbus-x11"
wouldn't RDEPENDS_${PN} = "dbus" be a better choice since dbus-x11 is 
RPROVIDED only for compatibility reasons?

radu

--------------090001000204080407030203
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-cite-prefix">On 08/17/2012 04:02 PM, Andrei Gherzan
      wrote:<br>
    </div>
    <blockquote
cite="mid:fe8f0c9d64b8fb123545d8afcd7891c6d6d90728.1345208249.git.andrei.gherzan@windriver.com"
      type="cite">
      <pre wrap="">While compiling dbus with tests, dbus and dbus-glib are needed.
To compile dbus-glib, dbus is needed (obviously). The only solution
(to compile dbus with tests) is to create a new recipe where to
compile dbus with --enable-tests --enable-embedded-tests, skip write
to sysroot (noexec) and just package dbus-tests.
A bash wrapper to run all tests is included.

Signed-off-by: Andrei Gherzan <a class="moz-txt-link-rfc2396E" href="mailto:andrei.gherzan@windriver.com">&lt;andrei.gherzan@windriver.com&gt;</a>
---
 meta/recipes-core/dbus/dbus-tests/run_test.sh |   22 +++++++++
 meta/recipes-core/dbus/dbus-tests_1.4.20.bb   |   64 +++++++++++++++++++++++++
 2 files changed, 86 insertions(+), 0 deletions(-)
 create mode 100755 meta/recipes-core/dbus/dbus-tests/run_test.sh
 create mode 100644 meta/recipes-core/dbus/dbus-tests_1.4.20.bb

diff --git a/meta/recipes-core/dbus/dbus-tests/run_test.sh b/meta/recipes-core/dbus/dbus-tests/run_test.sh
new file mode 100755
index 0000000..90abad2
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-tests/run_test.sh
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+# Tests location
+export DBUS_TEST_HOMEDIR=/usr/lib/dbus-tests
+# Tests data location
+export DBUS_TEST_DATA=${DBUS_TEST_HOMEDIR}/test/data
+
+TESTS=" \
+	bus/bus-test \
+	bus/bus-test-system \
+	dbus/dbus-test \
+	bus/bus-test-launch-helper \
+	test/shell-test \
+	test/test-corrupt \
+	test/test-dbus-daemon \
+	test/test-loopback \
+	test/test-marshal \
+	test/test-relay \
+	test/test-syslog \
+	test/test-refs"
+
+${DBUS_TEST_HOMEDIR}/test/dbus-test-runner ${DBUS_TEST_HOMEDIR} ${TESTS}
diff --git a/meta/recipes-core/dbus/dbus-tests_1.4.20.bb b/meta/recipes-core/dbus/dbus-tests_1.4.20.bb
new file mode 100644
index 0000000..0e7d272
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-tests_1.4.20.bb
@@ -0,0 +1,64 @@
+FILESEXTRAPATHS_append := "${THISDIR}/dbus-${PV}"
+include recipes-core/dbus/dbus.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "79eca2f2c1894ac347acce128314428b"
+SRC_URI[sha256sum] = "103bdcd261a13140730b5fa69f56a98ab5c89ba3f0116ea62fcfd639520d5aaf"
+
+DEPENDS += "python-pygobject-native python-dbus-native dbus-glib dbus"
+RDEPENDS_${PN} = "dbus-x11"</pre>
    </blockquote>
    wouldn't <small><font face="Droid Sans Mono">RDEPENDS_${PN} =
        "dbus"</font></small> be a better choice since <small><font
        face="DejaVu Sans Mono">dbus-x11</font></small> is <small>RPROVIDED</small>
    only for compatibility reasons? <br>
    <br>
    radu<br>
  </body>
</html>

--------------090001000204080407030203--
