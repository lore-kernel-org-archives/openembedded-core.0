Return-Path: <mru@mansr.com>
X-Greylist: delayed 510 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Dec 2016 12:39:15 UTC
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA3A62136
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 12:39:15 +0000 (UTC)
Received: by unicorn.mansr.com (Postfix, from userid 51770)
	id B6CC416A4D; Thu,  1 Dec 2016 12:30:43 +0000 (GMT)
From: Mans Rullgard <mans@mansr.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 12:30:34 +0000
Message-Id: <20161201123034.16769-1-mans@mansr.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] initscripts: populate-volatile: improve config file parsing
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
X-List-Received-Date: Thu, 01 Dec 2016 12:39:17 -0000

This improves the config file parsing to permit blank lines and
comments following an entry or preceeded by whitespace.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh | 6 +++---
 meta/recipes-core/initscripts/initscripts-1.0/volatiles            | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index ce4622a5e555..91514bac86fa 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -150,9 +150,9 @@ apply_cfgfile() {
 		return 1
 	}
 
-	cat ${CFGFILE} | grep -v "^#" | \
-		while read LINE; do
-		eval `echo "$LINE" | sed -n "s/\(.*\)\ \(.*\) \(.*\)\ \(.*\)\ \(.*\)\ \(.*\)/TTYPE=\1 ; TUSER=\2; TGROUP=\3; TMODE=\4; TNAME=\5 TLTARGET=\6/p"`
+	cat ${CFGFILE} | sed 's/#.*//' | \
+	while read TTYPE TUSER TGROUP TMODE TNAME TLTARGET; do
+		test -z "${TLTARGET}" && continue
 		TNAME=${ROOT_DIR}${TNAME}
 		[ "${VERBOSE}" != "no" ] && echo "Checking for -${TNAME}-."
 
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index 297245d0e40e..bc17c4553da2 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -1,11 +1,13 @@
 # This configuration file lists filesystem objects that should get verified
 # during startup and be created if missing.
 #
-# Every line must either be a comment starting with #
-# or a definition of format:
+# Entries have the following format:
 # <type> <owner> <group> <mode> <path> <linksource>
 # where the items are separated by whitespace !
 #
+# The # character introduces a comment lasting until end of line.
+# Blank lines are ignored.
+#
 # <type> : d|f|l : (d)irectory|(f)ile|(l)ink
 #
 # A linking example:
-- 
2.10.2


