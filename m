Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0r-0004v2-Ch
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:09 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=KxEr+pUKHK7PB4hmw5Qr7o2fYuLUd+KRvzKqP/KbxeU=;
	b=q1PrpPF94en9j5QZUf58hD150pMb9WY/q0l2f5ezevwInAPnNIRfWxSNLfrZrlI7Na
	5b8mEyCILqiKwog4A/2LYHS8eOq+TB4qkNifsGiRhKnslSoFR/6bRt6U2uaN1cGJzknQ
	Bxvf7Oa/JVPU2ErV2TgG+Q120QmbSq1GesDiE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vaiGFjlQIc4+lESV7eBKtpoFLKA5wUCp+OSVPpCk0A0eL/NNptn/5LMWkMyhSEhriU
	iTDCtbIPBNzQe09dfxYgpsScI4UmAYuIyjmXFi/8qZYxhh7ZGaAlBtg1spYccwFtzSyD
	kOm41Cppk0ja92e2Ox7A4EN5ixYYMgwnEi5kw=
Received: by 10.43.63.195 with SMTP id xf3mr4659048icb.219.1301632150689;
	Thu, 31 Mar 2011 21:29:10 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 19sm1180679ibx.35.2011.03.31.21.29.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:02 -0700
Message-Id: <ea11830c31df21d6f4f962fbd7f585ec342d875b.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 17/46] bison: Make compilable on uclibc
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
X-List-Received-Date: Fri, 01 Apr 2011 04:31:09 -0000

Import patch from OE to fix compilation on uclibc

Let inherit gettext take care of gettext dependencies

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../bison/bison/uclibc-sched_param-def.patch       |   19 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_2.3.bb           |    4 ++--
 meta/recipes-devtools/bison/bison_2.4.3.bb         |   10 ++++++----
 3 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/bison/bison/uclibc-sched_param-def.patch

diff --git a/meta/recipes-devtools/bison/bison/uclibc-sched_param-def.patch b/meta/recipes-devtools/bison/bison/uclibc-sched_param-def.patch
new file mode 100644
index 0000000..50652d8
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/uclibc-sched_param-def.patch
@@ -0,0 +1,19 @@
+uclibc defines __GLIBC__ but it does not expose struct shed_param as much as glibc
+and is not needed too per standard. gnulib attempts to use it but we have to account
+for it because in this case uclibc does not behave like glibc.
+
+-Khem
+
+http://bugs.gentoo.org/336484
+
+--- m4-1.4.14/lib/spawn.in.h
++++ m4-1.4.14/lib/spawn.in.h
+@@ -31,7 +31,7 @@
+ 
+ /* Get definitions of 'struct sched_param' and 'sigset_t'.
+    But avoid namespace pollution on glibc systems.  */
+-#ifndef __GLIBC__
++#if !defined __GLIBC__ || defined __UCLIBC__
+ # include <sched.h>
+ # include <signal.h>
+ #endif
diff --git a/meta/recipes-devtools/bison/bison_2.3.bb b/meta/recipes-devtools/bison/bison_2.3.bb
index 08aaa6e..8d76f7b 100644
--- a/meta/recipes-devtools/bison/bison_2.3.bb
+++ b/meta/recipes-devtools/bison/bison_2.3.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 SECTION = "devel"
 PRIORITY = "optional"
-DEPENDS = "gettext bison-native"
+DEPENDS = "bison-native"
 
 PR = "r0"
 
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "52f78aa4761a74ceb7fdf770f3554dd84308c3b93c4255e3a5c17558ec
 DEPENDS_virtclass-native = "gettext-native"
 SRC_URI_virtclass-native = "${BASE_SRC_URI}"
 
-inherit autotools
+inherit autotools gettext
 acpaths = "-I ${S}/m4"
 
 do_install_append_virtclass-native() {
diff --git a/meta/recipes-devtools/bison/bison_2.4.3.bb b/meta/recipes-devtools/bison/bison_2.4.3.bb
index fa2f154..3c164d9 100644
--- a/meta/recipes-devtools/bison/bison_2.4.3.bb
+++ b/meta/recipes-devtools/bison/bison_2.4.3.bb
@@ -8,12 +8,14 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 PRIORITY = "optional"
-DEPENDS = "gettext bison-native"
+DEPENDS = "bison-native"
 
-PR = "r1"
+PR = "r2"
 
 BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
-	   file://m4.patch;patch=1"
+	   file://m4.patch \
+	   file://uclibc-sched_param-def.patch \
+	  "
 
 SRC_URI = "${BASE_SRC_URI} \
         file://fix_cross_manpage_building.patch "
@@ -24,7 +26,7 @@ SRC_URI[sha256sum] = "6b17be5e63ff6667c83f6ef0423befe0ba23d4bc554c4c33b02ce5bb65
 DEPENDS_virtclass-native = "gettext-native"
 SRC_URI_virtclass-native = "${BASE_SRC_URI}"
 
-inherit autotools
+inherit autotools gettext
 acpaths = "-I ${S}/m4"
 
 do_install_append_virtclass-native() {
-- 
1.7.4.1



