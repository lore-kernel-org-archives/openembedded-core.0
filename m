Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 079A470656
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:42:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2014 08:41:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,710,1400050800"; d="scan'208";a="573675902"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.17])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2014 08:41:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 08:41:55 -0700
Message-Id: <1406043716-27903-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/2] cups: Upgrade to 1.7.4
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
X-List-Received-Date: Tue, 22 Jul 2014 15:42:28 -0000

Remove patch that was backported

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/cups/cups.inc                |   1 -
 meta/recipes-extended/cups/cups/cups-str4402.patch | 190 ---------------------
 meta/recipes-extended/cups/cups_1.7.3.bb           |   6 -
 meta/recipes-extended/cups/cups_1.7.4.bb           |   6 +
 4 files changed, 6 insertions(+), 197 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups/cups-str4402.patch
 delete mode 100644 meta/recipes-extended/cups/cups_1.7.3.bb
 create mode 100644 meta/recipes-extended/cups/cups_1.7.4.bb

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 7e8922b..6d04a2b 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -8,7 +8,6 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
            file://0001-don-t-try-to-run-generated-binaries.patch \
            file://cups_serverbin.patch \
            file://cups-no-gcrypt.patch \
-           file://cups-str4402.patch \
 	  "
 
 LEAD_SONAME = "libcupsdriver.so"
diff --git a/meta/recipes-extended/cups/cups/cups-str4402.patch b/meta/recipes-extended/cups/cups/cups-str4402.patch
deleted file mode 100644
index 69d349c..0000000
--- a/meta/recipes-extended/cups/cups/cups-str4402.patch
+++ /dev/null
@@ -1,190 +0,0 @@
-
-
-Upstream CUPS issue when building with out dnssd/avahi
-
-https://www.cups.org/str.php?L4408+P-1+S-2+C0+I0+E0+Q
-
-Upstream-Status: Backport [STR #4402]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
---- a/scheduler/dirsvc.c	2014-03-05 13:11:32.000000000 -0800
-+++ b/shceduler/dirsvc.c	2014-05-19 11:33:51.743124614 -0700
-@@ -50,6 +50,9 @@
- static void		update_lpd(int onoff);
- static void		update_smb(int onoff);
- 
-+static void		deregister_all_printers(int from_callback);
-+static void		register_all_printers(int from_callback);
-+
- 
- #if defined(HAVE_DNSSD) || defined(HAVE_AVAHI)
- #  ifdef __APPLE__
-@@ -60,12 +63,10 @@
- #  ifdef HAVE_AVAHI
- static void		dnssdClientCallback(AvahiClient *c, AvahiClientState state, void *userdata);
- #  endif /* HAVE_AVAHI */
--static void		dnssdDeregisterAllPrinters(int from_callback);
- static void		dnssdDeregisterInstance(cupsd_srv_t *srv, int from_callback);
- static void		dnssdDeregisterPrinter(cupsd_printer_t *p, int clear_name, int from_callback);
- static const char	*dnssdErrorString(int error);
- static void		dnssdFreeTxtRecord(cupsd_txt_t *txt);
--static void		dnssdRegisterAllPrinters(int from_callback);
- #  ifdef HAVE_DNSSD
- static void		dnssdRegisterCallback(DNSServiceRef sdRef,
- 					      DNSServiceFlags flags,
-@@ -241,7 +242,7 @@
-   * Register the individual printers
-   */
- 
--  dnssdRegisterAllPrinters(0);
-+  register_all_printers(0);
- }
- 
- 
-@@ -259,7 +260,7 @@
-   * De-register the individual printers
-   */
- 
--  dnssdDeregisterAllPrinters(0);
-+  deregister_all_printers(0);
- 
-  /*
-   * Shut down browsing sockets...
-@@ -579,7 +580,7 @@
- 	* Register the individual printers
- 	*/
- 
--	dnssdRegisterAllPrinters(1);
-+	register_all_printers(1);
- 	break;
- 
-     case AVAHI_CLIENT_FAILURE:
-@@ -591,7 +592,7 @@
- 	  * Unregister everything and close the client...
- 	  */
- 
--	  dnssdDeregisterAllPrinters(1);
-+	  deregister_all_printers(1);
- 	  dnssdDeregisterInstance(&WebIFSrv, 1);
- 	  avahi_client_free(DNSSDClient);
- 	  DNSSDClient = NULL;
-@@ -631,28 +632,6 @@
- 
- 
- /*
-- * 'dnssdDeregisterAllPrinters()' - Deregister all printers.
-- */
--
--static void
--dnssdDeregisterAllPrinters(
--    int             from_callback)	/* I - Deregistering because of callback? */
--{
--  cupsd_printer_t	*p;		/* Current printer */
--
--
--  if (!DNSSDMaster)
--    return;
--
--  for (p = (cupsd_printer_t *)cupsArrayFirst(Printers);
--       p;
--       p = (cupsd_printer_t *)cupsArrayNext(Printers))
--    if (!(p->type & (CUPS_PRINTER_REMOTE | CUPS_PRINTER_SCANNER)))
--      dnssdDeregisterPrinter(p, 1, from_callback);
--}
--
--
--/*
-  * 'dnssdDeregisterInstance()' - Deregister a DNS-SD service instance.
-  */
- 
-@@ -858,27 +837,6 @@
- 
- 
- /*
-- * 'dnssdRegisterAllPrinters()' - Register all printers.
-- */
--
--static void
--dnssdRegisterAllPrinters(int from_callback)	/* I - Called from callback? */
--{
--  cupsd_printer_t	*p;			/* Current printer */
--
--
--  if (!DNSSDMaster)
--    return;
--
--  for (p = (cupsd_printer_t *)cupsArrayFirst(Printers);
--       p;
--       p = (cupsd_printer_t *)cupsArrayNext(Printers))
--    if (!(p->type & (CUPS_PRINTER_REMOTE | CUPS_PRINTER_SCANNER)))
--      dnssdRegisterPrinter(p, from_callback);
--}
--
--
--/*
-  * 'dnssdRegisterCallback()' - DNSServiceRegister callback.
-  */
- 
-@@ -1813,6 +1771,61 @@
- }
- 
- 
-+/*
-+ * 'deregister_all_printers()' - Deregister all printers.
-+ */
-+
-+static void
-+deregister_all_printers(
-+    int             from_callback)	/* I - Deregistering because of callback? */
-+{
-+  cupsd_printer_t	*p;		/* Current printer */
-+
-+
-+#if defined(HAVE_DNSSD) || defined(HAVE_AVAHI)
-+  if (!DNSSDMaster)
-+    return;
-+#endif /* HAVE_DNSSD || HAVE_AVAHI */
-+
-+  for (p = (cupsd_printer_t *)cupsArrayFirst(Printers);
-+       p;
-+       p = (cupsd_printer_t *)cupsArrayNext(Printers))
-+    if (!(p->type & (CUPS_PRINTER_REMOTE | CUPS_PRINTER_SCANNER)))
-+#if defined(HAVE_DNSSD) || defined(HAVE_AVAHI)
-+      dnssdDeregisterPrinter(p, 1, from_callback);
-+#else
-+      cupsdDeregisterPrinter(p, 1);
-+#endif /* HAVE_DNSSD || HAVE_AVAHI */
-+}
-+
-+
-+/*
-+ * 'register_all_printers()' - Register all printers.
-+ */
-+
-+static void
-+register_all_printers(int from_callback)	/* I - Called from callback? */
-+{
-+  cupsd_printer_t	*p;			/* Current printer */
-+
-+
-+#if defined(HAVE_DNSSD) || defined(HAVE_AVAHI)
-+  if (!DNSSDMaster)
-+    return;
-+#endif /* HAVE_DNSSD || HAVE_AVAHI */
-+
-+  for (p = (cupsd_printer_t *)cupsArrayFirst(Printers);
-+       p;
-+       p = (cupsd_printer_t *)cupsArrayNext(Printers))
-+    if (!(p->type & (CUPS_PRINTER_REMOTE | CUPS_PRINTER_SCANNER)))
-+#if defined(HAVE_DNSSD) || defined(HAVE_AVAHI)
-+      dnssdRegisterPrinter(p, from_callback);
-+#else
-+      cupsdRegisterPrinter(p);
-+#endif /* HAVE_DNSSD || HAVE_AVAHI */
-+}
-+
-+
- /*
-  * End of "$Id: dirsvc.c 11688 2014-03-05 21:11:32Z msweet $".
-  */
diff --git a/meta/recipes-extended/cups/cups_1.7.3.bb b/meta/recipes-extended/cups/cups_1.7.3.bb
deleted file mode 100644
index 2175ba7..0000000
--- a/meta/recipes-extended/cups/cups_1.7.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cups.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5e50cb4b8f24b04636b719683a9102d"
-
-SRC_URI[md5sum] = "d498c3020acda0904ab0c13b6389a1ec"
-SRC_URI[sha256sum] = "fa989f856d1499169dc442fb2311053ea42fe455ca2721693ba5a9fe4b333e31"
diff --git a/meta/recipes-extended/cups/cups_1.7.4.bb b/meta/recipes-extended/cups/cups_1.7.4.bb
new file mode 100644
index 0000000..9dae986
--- /dev/null
+++ b/meta/recipes-extended/cups/cups_1.7.4.bb
@@ -0,0 +1,6 @@
+require cups.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5e50cb4b8f24b04636b719683a9102d"
+
+SRC_URI[md5sum] = "1a2295c2b2d2f422db2e50f40ed2fb99"
+SRC_URI[sha256sum] = "358fc7f22395a9ba07efcfc0d34a057ab5e9182b6e3297f71263a6b68fb41378"
-- 
1.8.3.1


