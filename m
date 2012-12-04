Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw54-0008JE-Oy
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:15:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0R7p026344
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:27 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:27 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:47 -0600
Message-ID: <7bc079ba04d82b43af8ac9b0e610c059490660ad.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 15/22] python-smartpm: support nolinktos and noparentdirs rpm options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 17:15:12 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Allowing us to turn on these options enables installation of base-files
which contains a symlink to /proc/mounts which is auto-detected as a
dependency and isn't provided by any other package.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python/python-smartpm/smart-dflags.patch       |   40 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    1 +
 2 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-dflags.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-dflags.patch b/meta/recipes-devtools/python/python-smartpm/smart-dflags.patch
new file mode 100644
index 0000000..3f27262
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-dflags.patch
@@ -0,0 +1,40 @@
+backends/rpm: add support for setting dependency flags
+
+This is useful for OpenEmbedded so that we can do the equivalent of
+the --nolinktos and --noparentdirs rpm command line options.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/smart/backends/rpm/pm.py b/smart/backends/rpm/pm.py
+index 707a146..aec82e7 100644
+--- a/smart/backends/rpm/pm.py
++++ b/smart/backends/rpm/pm.py
+@@ -106,6 +106,23 @@ class RPMPackageManager(PackageManager):
+             flags |= rpm.RPMTRANS_FLAG_TEST
+         ts.setFlags(flags)
+ 
++        dflags = ts.setDFlags(0)
++        if sysconf.get("rpm-noupgrade", False):
++            dflags |= rpm.RPMDEPS_FLAG_NOUPGRADE
++        if sysconf.get("rpm-norequires", False):
++            dflags |= rpm.RPMDEPS_FLAG_NOREQUIRES
++        if sysconf.get("rpm-noconflicts", False):
++            dflags |= rpm.RPMDEPS_FLAG_NOCONFLICTS
++        if sysconf.get("rpm-noobsoletes", False):
++            dflags |= rpm.RPMDEPS_FLAG_NOOBSOLETES
++        if sysconf.get("rpm-noparentdirs", False):
++            dflags |= rpm.RPMDEPS_FLAG_NOPARENTDIRS
++        if sysconf.get("rpm-nolinktos", False):
++            dflags |= rpm.RPMDEPS_FLAG_NOLINKTOS
++        if sysconf.get("rpm-nosuggest", False):
++            dflags |= rpm.RPMDEPS_FLAG_NOSUGGEST
++        ts.setDFlags(dflags)
++
+         # Set rpm verbosity level.
+         levelname = sysconf.get('rpm-log-level')
+         level = {
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 9ec7c7a..72a307d 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "\
           file://smartpm-rpm5-nodig.patch \
           file://smart-rpm-root.patch \
           file://smart-recommends.patch \
+          file://smart-dflags.patch \
           file://smart-rpm-md-parse.patch \
           file://smart-tmpdir.patch \
           "
-- 
1.7.3.4



