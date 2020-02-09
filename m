Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 2F28660F0C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 06:07:01 +0000 (UTC)
IronPort-SDR: f5ERAcjxUIIAgVrvj1+w8F6VVL9VOmnZXGaNDcldQ1v0CfuEjMTr4ZcTqlQWH/+pyNQjhup49/
	KpMN7V3reVkrAnwvTKDpwSHXIjxjRgopPBF85NSM6bI+M8yuEFrSZfW6DREG6ji5QbygeiloHC
	Bgl9NUrhGWVl86yCuOywAI+nmzIQquSI76U6qYk5Qh16F1alJQpZPox9Q+SThVcYsJKQfAXxnm
	qcTFEZLXe5eyQZbFki7AGvEzKRdqOhZS4JgqttVlLPDCvvYc9l+ULly0nNIir5vzbQRtnDH6oZ
	f6s=
X-IronPort-AV: E=Sophos;i="5.70,420,1574118000"; 
   d="scan'208";a="5082205"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Feb 2020 07:06:58 +0100
Message-ID: <20200209060658.800-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH] Revert "rootfs: Make BUILDNAME a weak default in reproducible_build_simple"
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
X-List-Received-Date: Sun, 09 Feb 2020 06:07:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This reverts commit 8380df6566db49ef184b837432558750f77f592f.

Giving BUILDNAME a static default in reproducible_build_simple.bbclass
to have /etc/version be generated with that name lead to other users
of BUILDNAME no longer working as expected. E.g., buildstats.bcclass
would now write its information in a single directory, overwriting the
statistics for each build.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/reproducible_build_simple.bbclass | 1 -
 meta/classes/rootfs-postcommands.bbclass       | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/reproducible_build_simple.bbclass b/meta/classes/reproducible_build_simple.bbclass
index 3e5fd82432..393372993d 100644
--- a/meta/classes/reproducible_build_simple.bbclass
+++ b/meta/classes/reproducible_build_simple.bbclass
@@ -7,4 +7,3 @@ export PERL_HASH_SEED = "0"
 export SOURCE_DATE_EPOCH ??= "1520598896"
 
 REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
-BUILDNAME ??= "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index e40097444d..2f171836fa 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -356,6 +356,11 @@ python rootfs_log_check_recommends() {
 # Perform any additional adjustments needed to make rootf binary reproducible
 rootfs_reproducible () {
 	if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" != "" ]; then
+		# Convert UTC into %4Y%2m%2d%2H%2M%2S
+		sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
+		echo $sformatted > ${IMAGE_ROOTFS}/etc/version
+		bbnote "rootfs_reproducible: set /etc/version to $sformatted"
+
 		if [ -d ${IMAGE_ROOTFS}${sysconfdir}/gconf ]; then
 			find ${IMAGE_ROOTFS}${sysconfdir}/gconf -name '%gconf.xml' -print0 | xargs -0r \
 			sed -i -e 's@\bmtime="[0-9][0-9]*"@mtime="'${REPRODUCIBLE_TIMESTAMP_ROOTFS}'"@g'
-- 
2.21.1


