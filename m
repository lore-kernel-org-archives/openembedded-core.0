Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D69DA73695
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 15:49:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 11 Jun 2015 08:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,595,1427785200"; d="scan'208";a="709295932"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2015 08:49:43 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 07:45:46 +0000
Message-Id: <362f787e4b87d14d755419bd0a5922ea03369d11.1434008015.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1434008015.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1434008015.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1434008015.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1434008015.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 1/2] rpm: Fix CVE-2014-8118
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
X-List-Received-Date: Thu, 11 Jun 2015 15:49:48 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Backport patch to fix CVE-2014-8118. Description is on [1] and
original patch taken from [2].

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1168715
[2] https://bugzilla.redhat.com/attachment.cgi?id=962159

[YOCTO #7181]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../rpm/rpm/rpm-CVE-2014-8118.patch                | 43 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch b/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch
new file mode 100644
index 0000000..bf1795c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch
@@ -0,0 +1,43 @@
+From 71c812edf1431a9967bd99ba6ffa6ab89eb7ec7c Mon Sep 17 00:00:00 2001
+From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+Date: Wed, 10 Jun 2015 12:56:55 +0000
+Subject: [PATCH 1/2] rpm: CVE-2014-8118
+
+Upstream-Status: Backport
+
+Reference:
+https://bugzilla.redhat.com/show_bug.cgi?id=1168715
+
+Description:
+It was found that RPM could encounter an integer overflow,
+leading to a stack-based overflow, while parsing a crafted
+CPIO header in the payload section of an RPM file.  This could
+allow an attacker to modify signed RPM files in such a way that
+they would execute code chosen by the attacker during package
+installation.
+
+Original Patch:
+https://bugzilla.redhat.com/attachment.cgi?id=962159
+
+Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+---
+ lib/cpio.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/cpio.c b/lib/cpio.c
+index 382eeb6..74ddd9c 100644
+--- a/lib/cpio.c
++++ b/lib/cpio.c
+@@ -296,6 +296,9 @@ int rpmcpioHeaderRead(rpmcpio_t cpio, char ** path, struct stat * st)
+     st->st_rdev = makedev(major, minor);
+ 
+     GET_NUM_FIELD(hdr.namesize, nameSize);
++    if (nameSize <= 0 || nameSize > 4096) {
++        return CPIOERR_BAD_HEADER;
++    }
+ 
+     *path = xmalloc(nameSize + 1);
+     read = Fread(*path, nameSize, 1, cpio->fd);
+-- 
+1.8.4.5
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.11.2.bb b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
index 4e44bc4..7c402b6 100644
--- a/meta/recipes-devtools/rpm/rpm_4.11.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
@@ -34,6 +34,7 @@ SRC_URI += "http://rpm.org/releases/rpm-4.11.x/${BP}.tar.bz2 \
             file://fix_libdir.patch \
             file://rpm-scriptetexechelp.patch \
             file://pythondeps.sh \
+            file://rpm-CVE-2014-8118.patch \
            "
 
 SRC_URI[md5sum] = "876ac9948a88367054f8ddb5c0e87173"
-- 
1.8.4.5


