Return-Path: <sean@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 53B237DDA2
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Sep 2019 17:31:26 +0000 (UTC)
Received: from zen.localdomain (unknown [85.184.140.241])
	by first.geanix.com (Postfix) with ESMTPSA id 1063E63DFB;
	Sun,  8 Sep 2019 17:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1567963862; bh=OqQ6ogfh8+PuiVGWFfbJjGWau3OSKhEAHFd1Qz6Q+q8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jwahPI7vCj06de1mzbgvrtNFKOOWfDlhiiZWt7NINToxoc4bW3U4y8uY7yVBL9Nce
	dTSDWgc1R3Q4dAwnoRU1tqE1eUcGnvwaBzJ5+EiP9JzEXGSMRHKn04A26CTxVP8P/X
	wzp1WHpaM3PYLa94ZbL9TWU2tYqiqn8XYTgAmSwU96qAdtgNR3yU8d2KfGt3zMSuGB
	V9pOkI7kbPQaizEmJ0jcddcgSQPZrkr09NcqZNFOFK6oRJ+xF/5kQ/JkCs19pXlIXB
	HwYHLoNEc4b2AziwOnWz0W6MouS5Mk1AtUuxLppzFpbBZsBTFFWvxeXMNRaOJJbfIQ
	azS86+9neuBvg==
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  8 Sep 2019 19:31:17 +0200
Message-Id: <20190908173117.101506-2-sean@geanix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <CAMKF1spJ4scwiMq5eNVCg-6dBk5VfozN6DwosoNHxKgE37pSHQ@mail.gmail.com>
References: <20190908173117.101506-1-sean@geanix.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=4.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DKIM_VALID_EF, UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on 77834cc0481d
Subject: [warrior][PATCH] libgpg-error: Fix build with gawk 5.x
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
X-List-Received-Date: Sun, 08 Sep 2019 17:31:26 -0000
Content-Transfer-Encoding: 8bit

Based on poky master, but for version 1.35

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 .../libgpg-error-1.35-gawk5-support.patch     | 160 ++++++++++++++++++
 .../libgpg-error/libgpg-error_1.35.bb         |   1 +
 2 files changed, 161 insertions(+)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch b/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch
new file mode 100644
index 0000000000..bbb38a60ca
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/libgpg-error-1.35-gawk5-support.patch
@@ -0,0 +1,160 @@
+From 37069826e497d6af01e3e48fe5d2220ae7f85449 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Mon, 15 Apr 2019 15:10:44 +0900
+Subject: [PATCH] awk: Prepare for Gawk 5.0.
+
+* src/Makefile.am: Use pkg_namespace (instead of namespace).
+* src/mkerrnos.awk: Likewise.
+* lang/cl/mkerrcodes.awk: Don't escape # in regexp.
+* src/mkerrcodes.awk, src/mkerrcodes1.awk, src/mkerrcodes2.awk: Ditto.
+
+--
+
+In Gawk 5.0, regexp routines are replaced by Gnulib implementation,
+which only allows escaping specific characters.
+
+GnuPG-bug-id: 4459
+Reported-by: Marius Schamschula
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+Upstream-Status: Backport [https://dev.gnupg.org/T4459]
+(cherry picked from commit 7865041c77f4f7005282f10f9b6666b19072fbdf)
+---
+ lang/cl/mkerrcodes.awk |  2 +-
+ src/Makefile.am        |  2 +-
+ src/mkerrcodes.awk     |  2 +-
+ src/mkerrcodes1.awk    |  2 +-
+ src/mkerrcodes2.awk    |  2 +-
+ src/mkerrnos.awk       |  2 +-
+ src/mkstrtable.awk     | 10 +++++-----
+ 7 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/lang/cl/mkerrcodes.awk b/lang/cl/mkerrcodes.awk
+index ae29043..9a1fc18 100644
+--- a/lang/cl/mkerrcodes.awk
++++ b/lang/cl/mkerrcodes.awk
+@@ -122,7 +122,7 @@ header {
+ }
+ 
+ !header {
+-  sub (/\#.+/, "");
++  sub (/#.+/, "");
+   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
+ 
+   if (/^$/)
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 42998e4..0ceac9f 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -281,7 +281,7 @@ code-from-errno.h: mkerrcodes Makefile
+ 
+ errnos-sym.h: Makefile mkstrtable.awk errnos.in
+ 	$(AWK) -f $(srcdir)/mkstrtable.awk -v textidx=2 -v nogettext=1 \
+-		-v prefix=GPG_ERR_ -v namespace=errnos_ \
++		-v prefix=GPG_ERR_ -v pkg_namespace=errnos_ \
+ 		$(srcdir)/errnos.in >$@
+ 
+ 
+diff --git a/src/mkerrcodes.awk b/src/mkerrcodes.awk
+index 46d436c..e9c857c 100644
+--- a/src/mkerrcodes.awk
++++ b/src/mkerrcodes.awk
+@@ -85,7 +85,7 @@ header {
+ }
+ 
+ !header {
+-  sub (/\#.+/, "");
++  sub (/#.+/, "");
+   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
+ 
+   if (/^$/)
+diff --git a/src/mkerrcodes1.awk b/src/mkerrcodes1.awk
+index a771a73..4578e29 100644
+--- a/src/mkerrcodes1.awk
++++ b/src/mkerrcodes1.awk
+@@ -81,7 +81,7 @@ header {
+ }
+ 
+ !header {
+-  sub (/\#.+/, "");
++  sub (/#.+/, "");
+   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
+ 
+   if (/^$/)
+diff --git a/src/mkerrcodes2.awk b/src/mkerrcodes2.awk
+index ea58503..188f7a4 100644
+--- a/src/mkerrcodes2.awk
++++ b/src/mkerrcodes2.awk
+@@ -91,7 +91,7 @@ header {
+ }
+ 
+ !header {
+-  sub (/\#.+/, "");
++  sub (/#.+/, "");
+   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
+ 
+   if (/^$/)
+diff --git a/src/mkerrnos.awk b/src/mkerrnos.awk
+index f79df66..15b1aad 100644
+--- a/src/mkerrnos.awk
++++ b/src/mkerrnos.awk
+@@ -83,7 +83,7 @@ header {
+ }
+ 
+ !header {
+-  sub (/\#.+/, "");
++  sub (/#.+/, "");
+   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
+ 
+   if (/^$/)
+diff --git a/src/mkstrtable.awk b/src/mkstrtable.awk
+index c9de9c1..285e45f 100644
+--- a/src/mkstrtable.awk
++++ b/src/mkstrtable.awk
+@@ -77,7 +77,7 @@
+ #
+ # The variable prefix can be used to prepend a string to each message.
+ #
+-# The variable namespace can be used to prepend a string to each
++# The variable pkg_namespace can be used to prepend a string to each
+ # variable and macro name.
+ 
+ BEGIN {
+@@ -102,7 +102,7 @@ header {
+       print "/* The purpose of this complex string table is to produce";
+       print "   optimal code with a minimum of relocations.  */";
+       print "";
+-      print "static const char " namespace "msgstr[] = ";
++      print "static const char " pkg_namespace "msgstr[] = ";
+       header = 0;
+     }
+   else
+@@ -110,7 +110,7 @@ header {
+ }
+ 
+ !header {
+-  sub (/\#.+/, "");
++  sub (/#.+/, "");
+   sub (/[ 	]+$/, ""); # Strip trailing space and tab characters.
+ 
+   if (/^$/)
+@@ -150,7 +150,7 @@ END {
+   else
+     print "  gettext_noop (\"" last_msgstr "\");";
+   print "";
+-  print "static const int " namespace "msgidx[] =";
++  print "static const int " pkg_namespace "msgidx[] =";
+   print "  {";
+   for (i = 0; i < coded_msgs; i++)
+     print "    " pos[i] ",";
+@@ -158,7 +158,7 @@ END {
+   print "  };";
+   print "";
+   print "static GPG_ERR_INLINE int";
+-  print namespace "msgidxof (int code)";
++  print pkg_namespace "msgidxof (int code)";
+   print "{";
+   print "  return (0 ? 0";
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
index 57ac143fd5..37c298e151 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
@@ -14,6 +14,7 @@ SECTION = "libs"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
+           file://libgpg-error-1.35-gawk5-support.patch \
 	  "
 
 SRC_URI[md5sum] = "2808a9e044f883f7554c5ba6a380b711"
-- 
2.23.0


