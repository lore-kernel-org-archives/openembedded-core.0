Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXE55-00037S-0r
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 19:11:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Apr 2013 09:53:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,582,1363158000"; d="scan'208";a="295525200"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.98])
	by azsmga001.ch.intel.com with ESMTP; 30 Apr 2013 09:53:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 17:52:57 +0100
Message-Id: <6c11f3681c9d179aa01887357c8a1f6458bd7929.1367340369.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1367340369.git.paul.eggleton@linux.intel.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1367340369.git.paul.eggleton@linux.intel.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/5] sysvinit-inittab: ensure unique label for SERIAL_CONSOLES entries
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
X-List-Received-Date: Tue, 30 Apr 2013 17:11:21 -0000

The label field in /etc/inittab entries needs to be unique, and the
numeric label being used for the SERIAL_CONSOLES getty entries was
clashing with the entries added for standard ttyX entries added via
SYSVINIT_ENABLED_GETTYS. Use the part after "tty" in the device name
(which is what the comment further down explicitly says should be done)
as the label rather than a simple incrementing number.

Fixes [YOCTO #4374].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index b289853..fbac893 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -21,14 +21,12 @@ do_install() {
         echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}" >> ${D}${sysconfdir}/inittab
     fi
 
-    idx=0
     tmp="${SERIAL_CONSOLES}"
     for i in $tmp
     do
 	j=`echo ${i} | sed s/\;/\ /g`
-	echo "${idx}:12345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
-
-	idx=`expr $idx + 1`
+	label=`echo ${i} | sed -e 's/^.*;tty//'`
+	echo "$label:12345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
     done
 
     if [ "${USE_VT}" = "1" ]; then
-- 
1.8.1.2



