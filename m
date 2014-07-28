Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80C3870478
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 02:58:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6S2wwhX022171
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Jul 2014 19:58:58 -0700 (PDT)
Received: from yow-dellw-pg2.corp.ad.wrs.com (128.224.56.7) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 27 Jul 2014 19:58:58 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 27 Jul 2014 22:58:36 -0400
Message-ID: <1406516316-30111-4-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1406516316-30111-1-git-send-email-paul.gortmaker@windriver.com>
References: <1406516316-30111-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] base-files: fix up misleading dir grouping names for lsb dirs
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
X-List-Received-Date: Mon, 28 Jul 2014 02:59:00 -0000
Content-Type: text/plain

In commit b0df35f47fb79dc149504bd66d1186b3276f9510
("base-files: Add to make some directories needed by LSB.") there
were new groupings of dirs made.  But rather than keep the grouping
names permissions based as they clearly were, it seems that it was
unfortunately misinterpreted as a counter, simply incrementing as
a new group was added.

This leads to dir3755 getting chmod'd to 0755 and dir4775 being
chmod'd to 2775 which to any new reader of the code is terribly
confusing.

Choose names that clearly reflect the permissions, and add a lsb
suffix to indicate the role.

Also note that the settings for /var/mail seem incorrect, and so
they have been aligned with what is seen in most common distros.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/files/fs-perms.txt                           |  6 +++---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 19 ++++++++++---------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index 9c144109eaf1..109cbe553c16 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -60,8 +60,8 @@ ${localstatedir}/local		0755	root	root	false - - -
 /tmp				01777	root	root	false - - -
 ${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
-# Set 3755
+# Set 755-lsb
 /srv				0755	root	root	false - - -
 
-# Set 4775
-/var/mail			02755	root	root	false - - -
+# Set 2775-lsb
+/var/mail			02775	root	mail	false - - -
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 10d0f449fa3f..30b1bf463b08 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -45,12 +45,13 @@ dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
            ${localstatedir}/volatile/log \
            /home ${prefix}/src ${localstatedir}/local \
            /media"
-dirs3755 = "/srv  \
-            ${prefix}/local ${prefix}/local/bin ${prefix}/local/games \
-            ${prefix}/local/include ${prefix}/local/lib ${prefix}/local/sbin \
-            ${prefix}/local/share ${prefix}/local/src \
-            ${prefix}/lib/locale"
-dirs4775 = "/var/mail"
+
+dirs755-lsb = "/srv  \
+               ${prefix}/local ${prefix}/local/bin ${prefix}/local/games \
+               ${prefix}/local/include ${prefix}/local/lib ${prefix}/local/sbin \
+               ${prefix}/local/share ${prefix}/local/src \
+               ${prefix}/lib/locale"
+dirs2775-lsb = "/var/mail"
 
 volatiles = "log tmp"
 conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
@@ -130,12 +131,12 @@ do_install_basefilesissue () {
 }
 
 do_install_append_linuxstdbase() {
-	for d in ${dirs3755}; do
+	for d in ${dirs755-lsb}; do
                 install -m 0755 -d ${D}$d
         done
 
-	for d in ${dirs4775}; do
-                install -m 2755 -d ${D}$d
+	for d in ${dirs2775-lsb}; do
+                install -m 2775 -d ${D}$d
         done
 }
 
-- 
2.0.1


