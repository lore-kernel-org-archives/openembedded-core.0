Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id EDAB17233E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 05:08:44 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBB58j1Z026629 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 23:08:45 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014121023084535-1004400 ;
	Wed, 10 Dec 2014 23:08:45 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 23:08:08 -0600
Message-Id: <954abcfcdfb2b2768a030d9bc6973a719d627714.1418274272.git.rich.tollerton@ni.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418274272.git.rich.tollerton@ni.com>
References: <cover.1418274272.git.rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/10/2014 11:08:45 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/10/2014 11:08:45 PM,
	Serialize complete at 12/10/2014 11:08:45 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-10_09:2014-12-10, 2014-12-10,
	1970-01-01 signatures=0
Cc: ken.sharp@ni.com
Subject: [PATCH v3 7/9] udev-cache: invalidate on rules.d changes
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
X-List-Received-Date: Thu, 11 Dec 2014 05:08:48 -0000

Presently, the cache is not regenerated if udev rules are modified,
which may cause the cache to preserve an old configuration. To fix,
include the size, mtime, and filename of all udev rules in the system
configuration.

This change requires `stat`. If busybox supplies stat,
CONFIG_FEATURE_STAT_FORMAT must be enabled.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/init       | 6 ++++++
 meta/recipes-core/udev/udev/udev-cache | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 32c677a..94dbba3 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -22,9 +22,14 @@ DEVCACHE_REGEN="/dev/shm/udev-regen" # create to request cache regen
 CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices"
 [ -f /proc/atags ] && CMP_FILE_LIST="$CMP_FILE_LIST /proc/atags"
 
+# List of files whose metadata (size/mtime/name) will be included in cached
+# system state.
+META_FILE_LIST="lib/udev/rules.d/* etc/udev/rules.d/*"
+
 # Command to compute system configuration.
 sysconf_cmd () {
 	cat -- $CMP_FILE_LIST
+	stat -L -c '%s %Y %n' -- $META_FILE_LIST | awk -F/ '{print $1 " " $NF;}'
 }
 
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
@@ -76,6 +81,7 @@ case "$1" in
 			    cat <<EOF
 udev: Not using udev cache because of changes detected in the following files:
 udev:     $CMP_FILE_LIST
+udev:     $META_FILE_LIST
 udev: The udev cache will be regenerated. To identify the detected changes,
 udev: compare the cached sysconf at   $SYSCONF_CACHED
 udev: against the current sysconf at  $SYSCONF_TMP
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 4d50876..571463f 100644
--- a/meta/recipes-core/udev/udev/udev-cache
+++ b/meta/recipes-core/udev/udev/udev-cache
@@ -25,9 +25,14 @@ DEVCACHE_REGEN="/dev/shm/udev-regen" # create to request cache regen
 CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices"
 [ -f /proc/atags ] && CMP_FILE_LIST="$CMP_FILE_LIST /proc/atags"
 
+# List of files whose metadata (size/mtime/name) will be included in cached
+# system state.
+META_FILE_LIST="lib/udev/rules.d/* etc/udev/rules.d/*"
+
 # Command to compute system configuration.
 sysconf_cmd () {
 	cat -- $CMP_FILE_LIST
+	stat -L -c '%s %Y %n' -- $META_FILE_LIST | awk -F/ '{print $1 " " $NF;}'
 }
 
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
-- 
2.1.3


