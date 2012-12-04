Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw54-0008JD-3J
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:14:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0QJB008443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:26 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:26 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:46 -0600
Message-ID: <639f3340012592f7dad1ffe281308b17f8dd9940.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 14/22] python-smartpm: don't create /var/tmp on every rpm database open
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
X-List-Received-Date: Tue, 04 Dec 2012 17:15:08 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

This directory if present in the rootfs interferes with proper
installation of base-files and doesn't seem to need to be there
for smart/rpm to work in any case.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python/python-smartpm/smart-tmpdir.patch       |   30 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    1 +
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-tmpdir.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-tmpdir.patch b/meta/recipes-devtools/python/python-smartpm/smart-tmpdir.patch
new file mode 100644
index 0000000..2f09ce9
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-tmpdir.patch
@@ -0,0 +1,30 @@
+backends/rpm: remove creation of /var/tmp
+
+This doesn't appear to be needed, and breaks installation of base-files
+in OpenEmbedded (since that is a symlink installed as part of the
+package).
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
+index 234c844..127354d 100644
+--- a/smart/backends/rpm/base.py
++++ b/smart/backends/rpm/base.py
+@@ -82,12 +82,6 @@ def getTS(new=False):
+             else:
+                 iface.warning(_("Initialized new rpm database at %s")
+                               % getTS.root)
+-        tmpdir = os.path.join(getTS.root, "var/tmp")
+-        if not os.path.isdir(tmpdir):
+-            try:
+-                os.makedirs(tmpdir)
+-            except OSError:
+-                pass
+     if new:
+         if sysconf.get("rpm-dbpath"):
+             rpm.addMacro('_dbpath', "/" + sysconf.get("rpm-dbpath"))
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 2d0f7cd..9ec7c7a 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "\
           file://smart-rpm-root.patch \
           file://smart-recommends.patch \
           file://smart-rpm-md-parse.patch \
+          file://smart-tmpdir.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.7.3.4



