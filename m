Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9BB97C5F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 07:16:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5Q7GVLj012920
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 00:16:31 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Wed, 26 Jun 2019 00:16:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Jun 2019 15:40:22 +0800
Message-ID: <389ee09386e4280e0c64dec5d30543417073416c.1561534279.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561534279.git.liezhi.yang@windriver.com>
References: <cover.1561534279.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v3 2/3] busybox: make postinst run firstly before update-alternatives
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
X-List-Received-Date: Wed, 26 Jun 2019 07:16:29 -0000
Content-Type: text/plain

The update-alternatives.bbclass' postinst script runs firstly before other
postinst, but busybox needs set basic tools such as sed command firstly,
otherwise, update-alternatives doesn't work, so run busybox' postinst firstly
to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc | 62 +++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 174ce5a..49165d7 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -392,34 +392,40 @@ python do_package_prepend () {
         set_alternative_vars("${sysconfdir}/busybox.links.suid", "${base_bindir}/busybox.suid")
 }
 
-pkg_postinst_${PN} () {
-	# This part of code is dedicated to the on target upgrade problem.
-	# It's known that if we don't make appropriate symlinks before update-alternatives calls,
-	# there will be errors indicating missing commands such as 'sed'.
-	# These symlinks will later be updated by update-alternatives calls.
-	test -n 2 > /dev/null || alias test='busybox test'
-	if test "x$D" = "x"; then
-		# Remove busybox.nosuid if it's a symlink, because this situation indicates
-		# that we're installing or upgrading to a one-binary busybox.
-		if test -h ${base_bindir}/busybox.nosuid; then
-			rm -f ${base_bindir}/busybox.nosuid
-		fi
-		for suffix in "" ".nosuid" ".suid"; do
-			if test -e ${sysconfdir}/busybox.links$suffix; then
-				while read link; do
-					if test ! -e "$link"; then
-						# we can use busybox here because even if we are using splitted busybox
-						# we've made a symlink from /bin/busybox to /bin/busybox.nosuid.
-						busybox rm -f $link
-						busybox ln -s "${base_bindir}/busybox$suffix" $link
-					fi
-				done < ${sysconfdir}/busybox.links$suffix
-			fi
-		done
-	fi
-	if grep -q "^${base_bindir}/bash$" $D${sysconfdir}/busybox.links*; then
-		grep -q "^${base_bindir}/bash$" $D${sysconfdir}/shells || echo ${base_bindir}/bash >> $D${sysconfdir}/shells
-	fi
+# This part of code is dedicated to the on target upgrade problem.  It's known
+# that if we don't make appropriate symlinks before update-alternatives calls,
+# there will be errors indicating missing commands such as 'sed'.
+# These symlinks will later be updated by update-alternatives calls.
+# The update-alternatives.bbclass' postinst script runs firstly before other
+# postinst, but this part of code needs run firstly, so add this funtion.
+python populate_packages_updatealternatives_append() {
+    postinst = """
+test -n 2 > /dev/null || alias test='busybox test'
+if test "x$D" = "x"; then
+    # Remove busybox.nosuid if it's a symlink, because this situation indicates
+    # that we're installing or upgrading to a one-binary busybox.
+    if test -h ${base_bindir}/busybox.nosuid; then
+        rm -f ${base_bindir}/busybox.nosuid
+    fi
+    for suffix in "" ".nosuid" ".suid"; do
+        if test -e ${sysconfdir}/busybox.links$suffix; then
+            while read link; do
+                if test ! -e "$link"; then
+                    # we can use busybox here because even if we are using splitted busybox
+                    # we've made a symlink from /bin/busybox to /bin/busybox.nosuid.
+                    busybox rm -f $link
+                    busybox ln -s "${base_bindir}/busybox$suffix" $link
+                fi
+            done < ${sysconfdir}/busybox.links$suffix
+        fi
+    done
+fi
+if grep -q "^${base_bindir}/bash$" $D${sysconfdir}/busybox.links*; then
+    grep -q "^${base_bindir}/bash$" $D${sysconfdir}/shells || echo ${base_bindir}/bash >> $D${sysconfdir}/shells
+fi
+
+"""
+    d.prependVar('pkg_postinst_%s' % pkg, postinst)
 }
 
 pkg_prerm_${PN} () {
-- 
2.7.4


