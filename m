Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXE5G-0003AN-Hx
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 19:11:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Apr 2013 09:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,582,1363158000"; d="scan'208";a="295525215"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.98])
	by azsmga001.ch.intel.com with ESMTP; 30 Apr 2013 09:53:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 17:53:00 +0100
Message-Id: <548c556a1a41ec6f24ea765273f52cbeb5f9c5c7.1367340369.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1367340369.git.paul.eggleton@linux.intel.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1367340369.git.paul.eggleton@linux.intel.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] shadow-securetty: change to handle SERIAL_CONSOLES
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
X-List-Received-Date: Tue, 30 Apr 2013 17:11:38 -0000

SERIAL_CONSOLES is now set from SERIAL_CONSOLE if not already set. This
change also installs the file before modifying it in place, allowing
do_install to re-execute properly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../shadow/shadow-securetty_4.1.4.3.bb               | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
index 86b5c89..4a1f79f 100644
--- a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
@@ -10,22 +10,28 @@ PR = "r2"
 
 SRC_URI = "file://securetty"
 
-# Since we deduce our arch from ${SERIAL_CONSOLE}
+# Since SERIAL_CONSOLES is likely to be set from the machine configuration
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_install () {
 	# Ensure we add a suitable securetty file to the package that has
 	# most common embedded TTYs defined.
-	if [ ! -z "${SERIAL_CONSOLE}" ]; then
-		# Our SERIAL_CONSOLE contains a baud rate and sometimes a -L
-		# option as well. The following pearl :) takes that and converts
+	install -d ${D}${sysconfdir}
+	install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty
+	if [ ! -z "${SERIAL_CONSOLES}" ]; then
+		# Our SERIAL_CONSOLES contains a baud rate and sometimes extra
+		# options as well. The following pearl :) takes that and converts
 		# it into newline-separated tty's and appends them into
 		# securetty. So if a machine has a weird looking console device
 		# node (e.g. ttyAMA0) that securetty does not know, it will get
 		# appended to securetty and root logins will be allowed on that
 		# console.
-		echo "${SERIAL_CONSOLE}" | sed -e 's/[0-9][0-9]\|\-L//g'|tr "[ ]" "[\n]"  >> ${WORKDIR}/securetty
+		tmp="${SERIAL_CONSOLES}"
+		for entry in $tmp ; do
+			ttydev=`echo "$entry" | sed -e 's/^[0-9]*\;//' -e 's/\;.*//'`
+			if ! grep -q $ttydev ${D}${sysconfdir}/securetty; then
+				echo $ttydev >> ${D}${sysconfdir}/securetty
+			fi
+		done
 	fi
-	install -d ${D}${sysconfdir}
-	install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty 
 }
-- 
1.8.1.2



