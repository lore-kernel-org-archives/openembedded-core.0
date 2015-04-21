Return-Path: <ken.sharp@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 959DF60167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 15:35:48 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t3LFZoLS021508 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 10:35:50 -0500
Received: from linux-mint-17-vm.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015042110355035-87200 ;
	Tue, 21 Apr 2015 10:35:50 -0500 
From: Ken Sharp <ken.sharp@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 10:35:45 -0500
Message-Id: <1429630545-17151-2-git-send-email-ken.sharp@ni.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1429630545-17151-1-git-send-email-ken.sharp@ni.com>
References: <1429630545-17151-1-git-send-email-ken.sharp@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 04/21/2015 10:35:50 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 04/21/2015 10:35:50 AM,
	Serialize complete at 04/21/2015 10:35:50 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-04-21_06:, , signatures=0
Cc: Ken Sharp <ken.sharp@ni.com>
Subject: [PATCH 2/2] udev-cache: improve error handling
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
X-List-Received-Date: Tue, 21 Apr 2015 15:35:49 -0000

If an error occurs while the udev cache is being populated, the system
is left in a state where udev is stopped.  Remedy this with a clean up
function to restart udev and remove any intermediate files.

Signed-off-by: Ken Sharp <ken.sharp@ni.com>
Reviewed-by: Ben Shelton <ben.shelton@ni.com>
---
 meta/recipes-core/udev/udev/udev-cache | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 12f68fb..dcfff1c 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -51,9 +51,15 @@ fi
 [ "${VERBOSE}" == "no" ] || echo "found."
 echo "Populating dev cache"
 
+err_cleanup () {
+        echo "udev-cache: update failed!"
+        udevadm control --start-exec-queue
+	rm -f -- "$SYSCONF_TMP" "$DEVCACHE_TMP" "$DEVCACHE" "$SYSCONF_CACHED"
+}
+
 (
 	set -e
-	trap 'echo "udev-cache: update failed!"' EXIT
+	trap 'err_cleanup' EXIT
 	udevadm control --stop-exec-queue
 	sysconf_cmd > "$SYSCONF_TMP"
 	find /dev -xdev \( -type b -o -type c -o -type l \) | cut -c 2- \
-- 
1.9.1


