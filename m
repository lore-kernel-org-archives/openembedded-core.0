Received: from mail-la0-f49.google.com ([209.85.215.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0DC-0006mC-FI
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:07 +0100
Received: by mail-la0-f49.google.com with SMTP id fk20so13982390lab.36
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PnhvJvyObGWdyaY4eR7fVFZTmw+UtAo3+5GgmeodUS4=;
	b=r/ZzdF8BAShv6BDZaqJyYFiYRgSBlPW0C8CdcvdSLIrA02xzIwya6J68jn4WZmKEvu
	drulbeS8UC18PU0tIwqjQ7AHAqLWb0WkSUR0vRfDjz7IG41IJNpai+g81oib+sarFEo2
	VTp5BkURuy23yu6t1HgcsvVC0LVnLCqSjXMTf18h9i6nTbzlXoJdsJd1/avomBfY8Rxj
	kIcz5Vv/vpKavipcg0tYBEOJuZFrp77LEte+qzxqi3YmIeakb6Ez2cS8K7IfeZv2wf5M
	mX8QumYkx0Bqmf9Agqj93GTTakLhFxOOFxDpdTIzUGnuP0tYDSrPgTCKhwOM6dGVh7qE
	4Xvw==
X-Received: by 10.152.125.7 with SMTP id mm7mr56919818lab.2.1357516197841;
	Sun, 06 Jan 2013 15:49:57 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id to7sm18191916lab.13.2013.01.06.15.49.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:49:57 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrzyM-0001PP-S1; Mon, 07 Jan 2013 01:49:46 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:29 +0200
Message-Id: <1357516181-5358-4-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357516181-5358-3-git-send-email-cazfi74@gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2 03/15] bison: remove help2man dependency
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
X-List-Received-Date: Mon, 07 Jan 2013 00:05:07 -0000

Remove manpage creation. It wasn't working because of help2man
missing when bison is being built. This attempt to create
manpages without help2man turns from no-op to hard error with
automake-1.13.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../bison/bison/dont-depend-on-help2man.patch      |   32 ++++++++++++++++++++
 meta/recipes-devtools/bison/bison_2.7.bb           |    7 +++--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch

diff --git a/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch b/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch
new file mode 100644
index 0000000..21b44bf
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Inappropriate
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd bison-2.7/doc/Makefile.am bison-2.7/doc/Makefile.am
+--- bison-2.7/doc/Makefile.am	2012-12-09 17:51:03.000000000 +0200
++++ bison-2.7/doc/Makefile.am	2013-01-02 06:49:50.804894071 +0200
+@@ -52,15 +52,11 @@
+ ## Man Pages.  ##
+ ## ----------- ##
+
+-dist_man_MANS = $(srcdir)/bison.1
+-
+-EXTRA_DIST += $(dist_man_MANS:.1=.x) common.x
+-MAINTAINERCLEANFILES += $(dist_man_MANS)
++EXTRA_DIST += bison.x common.x
+
+ # Depend on configure to get version number changes.
+ common_dep = $(top_srcdir)/configure $(srcdir)/common.x
+ srcsrcdir = $(top_srcdir)/bin
+-$(srcdir)/bison.1:      $(common_dep) $(top_srcdir)/src/getargs.c
+
+ # Differences to ignore when comparing the man page (the date).
+ remove_time_stamp = \
+@@ -94,8 +90,6 @@
+	fi
+	$(AM_V_at)rm -f $@*.t
+
+-nodist_man_MANS = yacc.1
+-
+ ## ------------------------------ ##
+ ## Graphviz examples generation.  ##
+ ## ------------------------------ ##
diff --git a/meta/recipes-devtools/bison/bison_2.7.bb b/meta/recipes-devtools/bison/bison_2.7.bb
index 9fb3884..ee2effb 100644
--- a/meta/recipes-devtools/bison/bison_2.7.bb
+++ b/meta/recipes-devtools/bison/bison_2.7.bb
@@ -9,9 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 DEPENDS = "bison-native flex-native"
 
+PR = "r1"
+
 BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
-	   file://m4.patch \
-	  "
+	        file://m4.patch \
+                file://dont-depend-on-help2man.patch \
+	       "
 
 SRC_URI = "${BASE_SRC_URI} \
            file://fix_cross_manpage_building.patch \
-- 
1.7.10.4



