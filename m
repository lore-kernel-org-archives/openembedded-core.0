Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1USQ9r-0004Pf-CE
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 13:04:17 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2013 11:46:36 +0100
Message-Id: <1366195597-13363-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-oe][PATCHv2 1/2] net-snmp: fix failure when starting on system without pci bus
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
X-List-Received-Date: Wed, 17 Apr 2013 11:04:28 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

The snmpd daemon cannot start on platforms without a pci bus:

snmpd[15460]: pcilib: Cannot open /proc/bus/pci
snmpd[15460]: pcilib: Cannot find any working access method.

snmpd should not depend on a PCI bus and should simply move on.

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../recipes-extended/net-snmp/files/ifmib.patch    | 66 ++++++++++++++++++++++
 .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-extended/net-snmp/files/ifmib.patch

diff --git a/meta-oe/recipes-extended/net-snmp/files/ifmib.patch b/meta-oe/recipes-extended/net-snmp/files/ifmib.patch
new file mode 100644
index 0000000..859c52c
--- /dev/null
+++ b/meta-oe/recipes-extended/net-snmp/files/ifmib.patch
@@ -0,0 +1,66 @@
+Signed-off-by: Jack Mitchell <jack@embed.me.uk>
+Upstream-Status: Pending
+Bug-Report: http://sourceforge.net/p/net-snmp/bugs/2449/
+
+diff --git a/agent/mibgroup/if-mib/data_access/interface_linux.c b/agent/mibgroup/if-mib/data_access/interface_linux.c
+index 3419811..d6eb91a 100644
+--- a/agent/mibgroup/if-mib/data_access/interface_linux.c
++++ b/agent/mibgroup/if-mib/data_access/interface_linux.c
+@@ -18,7 +18,31 @@ netsnmp_feature_require(interface_ioctl_flags_set)
+ 
+ #ifdef HAVE_PCI_LOOKUP_NAME
+ #include <pci/pci.h>
++#include <setjmp.h>
+ static struct pci_access *pci_access;
++
++/* Avoid letting libpci call exit(1) when no PCI bus is available. */
++static int do_longjmp =0;
++static jmp_buf err_buf;
++static void
++netsnmp_pci_error(char *msg, ...)
++{
++    va_list args;
++    char *buf;
++    int buflen;
++
++    va_start(args, msg);
++    buflen = strlen("pcilib: ")+strlen(msg)+2;
++    buf = malloc(buflen);
++    snprintf(buf, buflen, "pcilib: %s\n", msg);
++    snmp_vlog(LOG_ERR, buf, args);
++    free(buf);
++    va_end(args);
++    if (do_longjmp)
++	longjmp(err_buf, 1);
++    else
++	exit(1);
++}
+ #endif
+ 
+ #ifdef HAVE_LINUX_ETHTOOL_H
+@@ -147,10 +171,22 @@ netsnmp_arch_interface_init(void)
+ 
+ #ifdef HAVE_PCI_LOOKUP_NAME
+     pci_access = pci_alloc();
+-    if (pci_access)
++    if (!pci_access) {
++	snmp_log(LOG_ERR, "pcilib: pci_alloc failed\n");
++	return;
++    }
++
++    pci_access->error = netsnmp_pci_error;
++
++    do_longjmp = 1;
++    if (setjmp(err_buf)) {
++        pci_cleanup(pci_access);
++	snmp_log(LOG_ERR, "pcilib: pci_init failed\n");
++        pci_access = NULL;
++    }
++    else if (pci_access)
+ 	pci_init(pci_access);
+-    else
+-	snmp_log(LOG_ERR, "Unable to create pci access method\n");
++    do_longjmp = 0;
+ #endif
+ }
+ 
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
index 14c1036..19aa163 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://systemd-support.patch \
         file://snmpd.service \
         file://snmptrapd.service \
+        file://ifmib.patch \
 "
 
 EXTRA_OECONF += "--disable-embedded-perl --with-perl-modules=no"
-- 
1.8.2



