Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8E011771E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:24:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2017 09:24:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,264,1486454400"; d="scan'208";a="1106280664"
Received: from jyotigan-mobl.ger.corp.intel.com (HELO
	jlock-mobl1.ger.corp.intel.com) ([10.252.22.226])
	by orsmga001.jf.intel.com with ESMTP; 08 Mar 2017 09:24:21 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 17:24:15 +0000
Message-Id: <20170308172417.15776-2-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170308172417.15776-1-joshua.g.lock@intel.com>
References: <20170308172417.15776-1-joshua.g.lock@intel.com>
Subject: [PATCH 2/4] meta-selftest: add selftest-ed recipes
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
X-List-Received-Date: Wed, 08 Mar 2017 17:24:20 -0000

The oe-selftest oescripts.TestScripts.test_cleanup_workdir was using
gzip and the GPLv2 variant to test cleanup of the workdir. This broke
with the removal of GPLv2 recipes from OE-Core.

Instead of relying on recipes in OE-Core remaining static we should
ensure that meta-selftest provides recipes required for the tests to pass.
To that end we take a copy of the current GPLv2 and GPLv3 variants of ed
and include them in meta-selftest as new recipes.
We chose ed over gzip as gzip has dependencies which would require
additional GPLv2 recipes to be included in meta-selftest.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 .../recipes-test/selftest-ed/selftest-ed_0.5.bb    | 22 ++++++++++++++
 .../recipes-test/selftest-ed/selftest-ed_1.14.1.bb | 35 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
 create mode 100644 meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb

diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
new file mode 100644
index 0000000..8e0d1cd
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Line-oriented text editor -- selftest GPLv2 version"
+HOMEPAGE = "http://www.gnu.org/software/ed/"
+SECTION = "base"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6ddd5335ef96fb858a138230af773710 \
+                    file://main.c;beginline=1;endline=17;md5=36d4b85e5ae9028e918d1cc775c2475e"
+
+PR = "r2"
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/ed/ed-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "4ee21e9dcc9b5b6012c23038734e1632"
+SRC_URI[sha256sum] = "edef2bbde0fbf0d88232782a0eded323f483a0519d6fde9a3b1809056fd35f3e"
+
+inherit autotools texinfo
+
+S = "${WORKDIR}/ed-${PV}"
+
+EXTRA_OECONF = "'CC=${CC}' 'CXX=${CXX}' 'CFLAGS=${CFLAGS}' 'CXXFLAGS=${CXXFLAGS}' 'CPPFLAGS=${CPPFLAGS}' 'LDFLAGS=${LDFLAGS}'"
+
+CONFIGUREOPTS_remove = "--disable-dependency-tracking"
+CONFIGUREOPTS_remove = "--disable-silent-rules"
+EXTRA_OECONF_remove = "--disable-static"
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
new file mode 100644
index 0000000..62931c4
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Line-oriented text editor -- selftest variant"
+HOMEPAGE = "http://www.gnu.org/software/ed/"
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
+                    file://ed.h;endline=20;md5=4e36b7a40e137f42aee718165590d125 \
+                    file://main.c;endline=17;md5=c5b8f78f115df187af76868a2aead16a"
+
+SECTION = "base"
+
+# LSB states that ed should be in /bin/
+bindir = "${base_bindir}"
+
+SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
+
+SRC_URI[md5sum] = "7f4a54fa7f366479f03654b8af645fd0"
+SRC_URI[sha256sum] = "ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a"
+
+S = "${WORKDIR}/ed-${PV}"
+
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
+inherit texinfo
+
+do_configure() {
+	${S}/configure
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+	# Info dir listing isn't interesting at this point so remove it if it exists.
+	if [ -e "${D}${infodir}/dir" ]; then
+		rm -f ${D}${infodir}/dir
+	fi
+}
-- 
2.9.3


