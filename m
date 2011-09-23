Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R7BnK-0006Ry-F6
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 21:52:23 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so4179694bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 12:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=1SJMuVJHgAhW5g1NPJxRY1uzemVBR6Mhkz65+kKP3Lo=;
	b=hafhYizVKDMWf14Oz2WPxn6SD2Sv7r/YPWS2YjclxsUdMT8ZO6VNUOKpPm/8Y77Or8
	+NGmnGQio9P9vKvUuLqiaVU8pC2IE6KtIB6h96m2SFs0WQxlx5sH2hROGHUQXAdxHnUk
	smxcn3MSMmrEYOh5mURgcFo5PJER62xC40cTA=
Received: by 10.204.144.86 with SMTP id y22mr2929450bku.160.1316807223664;
	Fri, 23 Sep 2011 12:47:03 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id ex8sm5500310bkc.2.2011.09.23.12.47.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Sep 2011 12:47:02 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2011 23:46:38 +0400
Message-Id: <1316807201-22623-7-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 07/10] gcc: fix possible problems with nscd compilation during eglibc-nativesdk build
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
X-List-Received-Date: Fri, 23 Sep 2011 19:52:23 -0000

Long time ago a066e7ca90a28d5681c5fa895a29e999ed7c88b was committed to
address possible problems with compilation of nscd during
eglibc-nativesdk build. Problems were related to the way gcc searches
for headers to check if it should enable it's own stack smash protection
bits or it can relay on eglibc for it.

However after 934d38530c9a67562e53d4034aee5531f0f26750 things got
broken, as for gcc-crosssdk-intermediate packages:
1) EXTRA_OECONF is ignored
2) headers are installed in a different location than expected by that
patch.

This results in eglibc-nativesdk build broken on some systems (e.g. mine
Debian x86_64 squeeze). Fix that by providing with-headers options to
crosssdk-intermediate gcc configuration.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 .../gcc/gcc-crosssdk-intermediate.inc              |    2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
index 90824bd..6a9a7a6 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r10"
+PR = "r11"
 
 DEPENDS =+ "mpfr gmp libmpc elfutils"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native elfutils-native"
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index ee42fa7..5d83e90 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r11"
+PR = "r12"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
index ed5d5e8..8f20d20 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate.inc
@@ -7,3 +7,5 @@ SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
 DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk gettext-native"
 DEPENDS += "virtual/${TARGET_PREFIX}libc-initial-nativesdk"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-intermediate-crosssdk"
+
+EXTRA_OECONF += " --with-headers=${STAGING_DIR_TCBOOTSTRAP}${SYSTEMHEADERS} "
-- 
1.7.2.5



