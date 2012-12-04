Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw55-0008Jt-Lp
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:15:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0SpK008456
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:28 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:28 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:48 -0600
Message-ID: <7bc8c43b4ad34ba85f5693d410cd7e6ee5dd11f6.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 16/22] python-smartpm: allow setting arbitrary macros in smart config
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

Add support for an rpm-extra-macros config option which can be
used to define some extra macros that need to be set for rootfs
construction to work on the host and that don't really warrant
their own specific named config options to be created.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python-smartpm/smart-rpm-extra-macros.patch    |   27 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    1 +
 2 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-extra-macros.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-rpm-extra-macros.patch b/meta/recipes-devtools/python/python-smartpm/smart-rpm-extra-macros.patch
new file mode 100644
index 0000000..30cb176
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-rpm-extra-macros.patch
@@ -0,0 +1,27 @@
+backends/rpm: implement rpm-extra-macros option
+
+Allow defining extra macros in the smart configuration to be passed
+to rpm before opening the database.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
+index b9e9cb2..234c844 100644
+--- a/smart/backends/rpm/base.py
++++ b/smart/backends/rpm/base.py
+@@ -53,6 +53,10 @@ def rpm_join_dbpath(root, dbpath):
+         return os.path.join(root, dbpath)
+ 
+ def getTS(new=False):
++    if sysconf.get("rpm-extra-macros"):
++        for key, value in sysconf.get("rpm-extra-macros").items():
++            rpm.addMacro(key, str(value))
++
+     rpm_root = os.path.abspath(sysconf.get("rpm-root", "/"))
+     if not hasattr(getTS, "ts") or getTS.root != rpm_root:
+         getTS.root = rpm_root
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 72a307d..4694d51 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "\
           file://smartpm-rpm5-nodig.patch \
           file://smart-rpm-root.patch \
           file://smart-recommends.patch \
+          file://smart-rpm-extra-macros.patch \
           file://smart-dflags.patch \
           file://smart-rpm-md-parse.patch \
           file://smart-tmpdir.patch \
-- 
1.7.3.4



