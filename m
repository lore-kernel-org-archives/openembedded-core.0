Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 19D8174A24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 14:05:02 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 74A765C1ACC;
	Tue, 15 May 2018 16:05:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1526393103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=3I3f53oYPBKbZZcN1NZ+xGdelbmUTJtZbLfTssKbFxY=;
	b=N79jBrv8r6EhwUHgNPAo3GXxZGP8kvezkKY5ADk+W8rdgZ2KtI9Qr96bNpKustJ2YbDUnt
	h310fZ/4crAJATop14MAKGbwT9QoH+Q5/LK649hD3hIqbggUJ2uNMsCCrv3u18YfE8WEzd
	dGkGZgrubbLj/a0ZmyarcoavRWFVi3o=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org, alexander.kanavin@linux.intel.com
Date: Tue, 15 May 2018 16:04:50 +0200
Message-Id: <20180515140451.60660-3-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180515140451.60660-1-stefan@agner.ch>
References: <20180515140451.60660-1-stefan@agner.ch>
X-Spamd-Result: default: False [0.89 / 15.00]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	BAYES_HAM(-0.01)[50.93%]; RCPT_COUNT_FIVE(0.00)[5];
	MIME_GOOD(-0.10)[text/plain]; FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[]; DKIM_SIGNED(0.00)[];
	TO_DN_SOME(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
	MID_CONTAINS_FROM(1.00)[];
	ASN(0.00)[asn:6830, ipnet:46.140.0.0/17, country:AT];
	RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[]
Cc: muhammad_shakeel@mentor.com, Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 2/3] run-postinsts: Do not rely on /etc/*-postinsts
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
X-List-Received-Date: Tue, 15 May 2018 14:05:03 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Start opkg/dpkg as soon as the respective package managers status
file is present, no matter whether /etc/$pm-postinsts exists. This
decouples the implicit link between postinsts scripts in /etc and
the package manager: Currently the package manager is only started
if those scripts are present, although the package manager does not
use those scripts at all! Package managers install their own set of
postinst scripts.

Note that using the package managers capability to execute postinst
scripts is preferred for good reasons: It makes sure that the
package managers database reflects that the packages have been
completely installed and configured.

This change allows to drop installation of the postinsts scripts
when package management is present. This will be done in a separate
change.

Note: Before commit 5aae19959a44 ("rootfs.py: Change logic to
unistall packages") rootfs.py did not install /etc/$pm-postinsts
when package management is installed! The change caused YOCTO #8235
which lead to the behavior change of run-postinsts in first place.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../run-postinsts/run-postinsts/run-postinsts       | 21 ++++++++++++---------
 .../run-postinsts/run-postinsts.service             |  1 -
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 307feb7187..95eff04e17 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -6,7 +6,8 @@
 #
 
 # The following script will run all the scriptlets found in #SYSCONFDIR#/deb-postinsts,
-# #SYSCONFDIR#/ipk-postinsts or #SYSCONFDIR#/rpm-postinsts.
+# #SYSCONFDIR#/ipk-postinsts or #SYSCONFDIR#/rpm-postinsts or the package manager in
+# case available.
 
 # the order of this list is important, do not change!
 backend_list="rpm deb ipk"
@@ -14,27 +15,29 @@ backend_list="rpm deb ipk"
 pm_installed=false
 
 for pm in $backend_list; do
-	pi_dir="#SYSCONFDIR#/$pm-postinsts"
-
-	if [ ! -d $pi_dir ]; then
-		continue
-	fi
-
 	# found the package manager, it has postinsts
 	case $pm in
 		"deb")
 			if [ -s "#LOCALSTATEDIR#/lib/dpkg/status" ]; then
 				pm_installed=true
+				break
 			fi
 			;;
 
 		"ipk")
 			if [ -s "#LOCALSTATEDIR#/lib/opkg/status" ]; then
 				pm_installed=true
+				break
 			fi
 			;;
 	esac
-	break
+
+	pi_dir="#SYSCONFDIR#/$pm-postinsts"
+
+	# found postinsts directory
+	if [ -d $pi_dir ]; then
+		break
+	fi
 done
 
 remove_rcsd_link () {
@@ -43,7 +46,7 @@ remove_rcsd_link () {
 	fi
 }
 
-if ! [ -d $pi_dir ]; then
+if ! [ -d $pi_dir ] && ! $pm_installed; then
 	remove_rcsd_link
 	exit 0
 fi
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
index 1b71a1f8be..d42addf510 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
@@ -3,7 +3,6 @@ Description=Run pending postinsts
 DefaultDependencies=no
 After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
 Before=sysinit.target
-ConditionPathExistsGlob=#SYSCONFDIR#/*-postinsts
 
 [Service]
 Type=oneshot
-- 
2.13.6


