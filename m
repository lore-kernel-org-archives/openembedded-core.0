Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id EE676707D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 21:31:19 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s7MLVKbP009129; Fri, 22 Aug 2014 16:31:20 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014082216312038-290499 ;
	Fri, 22 Aug 2014 16:31:20 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 16:30:56 -0500
Message-Id: <6b39f0e8a7e0d8f904828fe21cc73f09e4f2dd47.1408742574.git.rich.tollerton@ni.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <cover.1408742574.git.rich.tollerton@ni.com>
References: <cover.1408742574.git.rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/22/2014 04:31:20 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/22/2014 04:31:20 PM,
	Serialize complete at 08/22/2014 04:31:20 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-22_06:2014-08-22, 2014-08-22,
	1970-01-01 signatures=0
Cc: otavio@ossystems.com.br
Subject: [PATCH v2 10/12] udev-cache: invalidate on rules.d changes
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
X-List-Received-Date: Fri, 22 Aug 2014 21:31:23 -0000

Presently, the cache is not regenerated if udev rules are modified,
which may cause the cache to preserve an old configuration. To fix,
include the size, mtime, and filename of all udev rules in the system
configuration.

This change requires `stat`. If busybox supplies stat,
CONFIG_FEATURE_STAT_FORMAT must be enabled.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/recipes-core/udev/udev/init       | 5 +++++
 meta/recipes-core/udev/udev/udev-cache | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 10cbf56..c44dc2d 100644
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
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
diff --git a/meta/recipes-core/udev/udev/udev-cache b/meta/recipes-core/udev/udev/udev-cache
index 5a1bc78..c499676 100644
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
2.0.4


