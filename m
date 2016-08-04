Return-Path: <california.l.sullivan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D8E4575D4A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 23:39:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2016 16:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,468,1464678000"; d="scan'208";a="1008007505"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga001.jf.intel.com with ESMTP; 03 Aug 2016 16:39:43 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 19:36:36 -0700
Message-Id: <1470278197-30440-2-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1470278197-30440-1-git-send-email-california.l.sullivan@intel.com>
References: <1470278197-30440-1-git-send-email-california.l.sullivan@intel.com>
Subject: [PATCH 1/2] sysvinit-inittab_2.88dsf.bb: Allow aliasing with SERIAL_CONSOLES_CHECK
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
X-List-Received-Date: Wed, 03 Aug 2016 23:39:42 -0000

With some hardware the name of the device node and the name in
/proc/console differ. This causes SERIAL_CONSOLES_CHECK to not enable
working consoles in these cases. This patch changes SERIAL_CONSOLES_CHECK
to have an optional alias for the checked consoles. The new format is:

<device>:<alias to check(optional)>

Fixes [YOCTO #9440].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index bdc3416..f136ad8 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -58,9 +58,12 @@ if [ "x$D" = "x" ] && [ -e /proc/consoles ]; then
 	tmp="${SERIAL_CONSOLES_CHECK}"
 	for i in $tmp
 	do
-		j=`echo ${i} | sed s/^.*\;//g`
+		j=`echo ${i} | sed -e s/^.*\;//g -e s/\:.*//g`
+		k=`echo ${i} | sed s/^.*\://g`
 		if [ -z "`grep ${j} /proc/consoles`" ]; then
-			sed -i /^.*${j}$/d /etc/inittab
+			if [ -z "${k}" ] || [ -z "`grep ${k} /proc/consoles`" ] || [ ! -e /dev/${j} ]; then
+				sed -i /^.*${j}$/d /etc/inittab
+			fi
 		fi
 	done
 	kill -HUP 1
-- 
2.5.5


