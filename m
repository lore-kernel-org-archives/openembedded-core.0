Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F928755F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 05:53:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9S5reHA005028
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 22:53:41 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 27 Oct 2015 22:53:40 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Oct 2015 01:53:37 -0400
Message-ID: <6887445c3641d1de4dcb0d8bde456b6f007382b7.1445943047.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1445943047.git.wenzong.fan@windriver.com>
References: <cover.1445943047.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 v2] gnupg: fix find-version for beta checking
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
X-List-Received-Date: Wed, 28 Oct 2015 05:53:43 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

find-version always assumes that gnupg is beta if autogen.sh is run
out of git-repo. This doesn't work for users whom just take release
tarball and re-run autoconf in their local build dir.

This fixes runtime issue:

  $gpg --list-sigs
  gpg: NOTE: THIS IS A DEVELOPMENT VERSION!
  gpg: It is only intended for test purposes and should NOT be
  gpg: used in a production environment or with production keys!

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...gen.sh-fix-find-version-for-beta-checking.patch | 31 ++++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_2.1.7.bb          |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch

diff --git a/meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch
new file mode 100644
index 0000000..4241bc3
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/autogen.sh-fix-find-version-for-beta-checking.patch
@@ -0,0 +1,31 @@
+From 717f994be2466d378e6611a4739c606db6d0dc46 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Sun, 25 Oct 2015 22:44:47 -0400
+Subject: [PATCH] autogen.sh: fix find-version for beta checking
+
+find-version always assumes that gnupg is beta if autogen.sh is run
+out of git-repo. This doesn't work for users whom just take release
+tarball and re-run autoconf in their local build dir.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ autogen.sh | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 7effd56..d673432 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -228,7 +228,6 @@ if [ "$myhost" = "find-version" ]; then
+       rvd=$((0x$(echo ${rev} | head -c 4)))
+     else
+       ingit=no
+-      beta=yes
+       tmp="-unknown"
+       rev="0000000"
+       rvd="0"
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.1.7.bb b/meta/recipes-support/gnupg/gnupg_2.1.7.bb
index 48c7c96..979e6f9 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.7.bb
@@ -12,6 +12,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://use-pkgconfig-instead-of-npth-config.patch \
            file://dirmngr-uses-libgpg-error.patch \
+           file://autogen.sh-fix-find-version-for-beta-checking.patch \
           "
 
 SRC_URI[md5sum] = "ebdf92b15b8bcd8579b643c7f41a3238"
-- 
1.9.1


