Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOD-0005aX-OD
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:37 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351189"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:17 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:45 -0800
Message-Id: <95e7807c0b00a1f6dee96d515e11fa6173bdf7b3.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 03/33] Introduce new SERIAL_CONSOLES to add multiple consoles for your MACHINE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Nov 2011 07:49:38 -0000

From: Matthew McClintock <msm@freescale.com>

Just define additional serial consoles like so:

SERIAL_CONSOLES="115200;ttyS0 115200;ttyS1 ... 115200;ttySN"

Also be sure to remove SERIAL_CONSOLE (lacking the S) from your
machine as they can conflict.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index ba60c74..3a716d7 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -25,6 +25,16 @@ do_install() {
     if [ ! -z "${SERIAL_CONSOLE}" ]; then
         echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}" >> ${D}${sysconfdir}/inittab
     fi
+
+    idx=0
+    tmp="${SERIAL_CONSOLES}"
+    for i in $tmp
+    do
+	j=`echo ${i} | sed s/\;/\ /g`
+        echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
+	idx=`expr $idx + 1`
+    done
+
     if [ "${USE_VT}" = "1" ]; then
         cat <<EOF >>${D}${sysconfdir}/inittab
 # ${base_sbindir}/getty invocations for the runlevels.
-- 
1.7.6.4



