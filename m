Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PztOO-0006Mj-AV
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 17:16:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2GGESpe027856
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Mar 2011 09:14:28 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 16 Mar 2011 09:14:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <poky@lists.pokylinux.org>, <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Mar 2011 11:15:23 -0500
Message-ID: <11d40b44544f2f3a252f5f8e8670d8f64e5444d7.1300291424.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1300291424.git.mark.hatle@windriver.com>
References: <cover.1300291424.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/6] libzypp: Fix release query
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
X-List-Received-Date: Wed, 16 Mar 2011 16:16:12 -0000
Content-Type: text/plain

Libzypp is looking for the "redhat-release" file and using that version
number to help adjust the system version.  This ensures that there is
something on the system that returns a correct value.

This patch is likely not necessary.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../libzypp/libzypp/config-release.patch           |   21 ++++++++++++++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |    3 +-
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/config-release.patch

diff --git a/meta/recipes-extended/libzypp/libzypp/config-release.patch b/meta/recipes-extended/libzypp/libzypp/config-release.patch
new file mode 100644
index 0000000..9128237
--- /dev/null
+++ b/meta/recipes-extended/libzypp/libzypp/config-release.patch
@@ -0,0 +1,21 @@
+Configure distro version package
+
+We need to configure a package that the system can use to determine the
+system distribution version.
+
+Hack: for now set to task-poky-rpm.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur git.orig/zypp/ZConfig.cc git/zypp/ZConfig.cc
+--- git.orig/zypp/ZConfig.cc	2011-03-14 16:30:07.492786134 -0500
++++ git/zypp/ZConfig.cc	2011-03-15 11:39:15.396801927 -0500
+@@ -821,7 +821,7 @@
+   ///////////////////////////////////////////////////////////////////
+ 
+   std::string ZConfig::distroverpkg() const
+-  { return "redhat-release"; }
++  { return "task-poky-rpm"; }
+ 
+   ///////////////////////////////////////////////////////////////////
+ 
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 825339d..621ce45 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -13,7 +13,7 @@ RDEPENDS_${PN} = "sat-solver"
 
 S = "${WORKDIR}/git"
 PV = "0.0-git${SRCPV}"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "git://gitorious.org/opensuse/libzypp.git;protocol=git \
            file://no-doc.patch \
@@ -22,6 +22,7 @@ SRC_URI = "git://gitorious.org/opensuse/libzypp.git;protocol=git \
            file://builtin-arch.patch;apply=no \
            file://no-builtin-arch.patch;apply=no \
            file://archconf.patch;apply=no \
+	   file://config-release.patch \
           "
 
 SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
-- 
1.7.3.4



