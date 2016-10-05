Return-Path: <diego.ml@zoho.com>
Received: from sender153-mail.zoho.com (sender153-mail.zoho.com
	[74.201.84.153])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5F171A4C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 13:10:26 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=EVi7uWp9sbjcrl0G9374CdrnOUPf2zloqu9OH3kUzJc6K7JydUsUsmopdldEyYUY32dFDQn1XWHL
	gvZWgJGV2okIRyULdfgS38Fp8awbdl5suaUXgWIqAOfmSN0uilrc  
Received: from ip-172-31-0-222.eu-west-1.compute.internal
	(ec2-52-48-117-71.eu-west-1.compute.amazonaws.com
	[52.48.117.71]) by mx.zohomail.com
	with SMTPS id 1475672119096771.2792771126013;
	Wed, 5 Oct 2016 05:55:19 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 13:00:58 +0000
Message-Id: <1475672458-12019-1-git-send-email-diego.ml@zoho.com>
X-Mailer: git-send-email 1.9.1
Subject: [jethro][PATCH] gnupg: fix find-version for beta checking
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
X-List-Received-Date: Wed, 05 Oct 2016 13:10:26 -0000

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
Signed-off-by: Ross Burton <ross.burton@intel.com>
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



