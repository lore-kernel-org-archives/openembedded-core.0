Received: from mail-la0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlO-0000dG-FJ
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:45 +0100
Received: by mail-la0-f42.google.com with SMTP id fe20so8670269lab.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=yXRhBuAIFp/6QQHLWlqZbwtihOnu7/IUgdMNedAvYqI=;
	b=GiAUFm3nI3mO8Dyo6XBdaAWvIskim5szyFsuXsU9WURMkRBzBN8raCBpR7GngJOcB2
	EbOVdreh/FtSBxss7nM3xBIGJIaBltFpEJVAddSK9HqG3Yb2x0ODYh+xhVf3YyVKQC9H
	8y4kMZ2AaAhSOKo8QA/Hi8LSp20s2fppvHV+aaLI4kibTmUrGf6PRw8Km4sfgZhbeU+Z
	FU9tC68VrjDEDeBl8+7viBw5BnQRN1dBqRYUrDmnoPMCimXaiPWDKqOomi4SE7Lx1gGJ
	fJdvSPJxJy1TpCL72Uqmbz1UKbn973+SMlHmWOrkQyBQcc6Alsb3FieuwJH3caqtsEsX
	3L1g==
X-Received: by 10.152.125.136 with SMTP id mq8mr47988339lab.41.1357245398367; 
	Thu, 03 Jan 2013 12:36:38 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ja10sm18774440lab.6.2013.01.03.12.36.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:36 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqrWk-0002DP-32; Thu, 03 Jan 2013 22:36:34 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:19 +0200
Message-Id: <1357245391-11055-4-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357245391-11055-3-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 03/15] bison: remove help2man dependency
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
X-List-Received-Date: Thu, 03 Jan 2013 20:51:45 -0000

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
index 0000000..66b1e37
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch
@@ -0,0 +1,32 @@
+Upstream-status: Inappropriate
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



