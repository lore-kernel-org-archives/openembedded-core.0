Return-Path: <mark.hatle@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 3799E6AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 22:51:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r79MpP3q022800
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Aug 2013 18:51:27 -0400 (EDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 9 Aug 2013 15:51:25 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Aug 2013 17:51:29 -0500
Message-ID: <1376088690-24013-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1376088690-24013-1-git-send-email-mark.hatle@windriver.com>
References: <1376088690-24013-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2] rpm: Change references from RPM_VENDOR_POKY to RPM_VENDOR_OE
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
X-List-Received-Date: Fri, 09 Aug 2013 22:51:27 -0000
Content-Type: text/plain

Change the #define references to match RPM_VENDOR_OE.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/python-rpm-rpmsense.patch              |  4 ++--
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |  2 +-
 .../rpm/rpm/rpm-platform-file-fix.patch            |  2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |  8 ++++----
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |  6 +++---
 .../rpm/rpm/rpm-scriptletexechelper.patch          | 22 +++++++++++-----------
 6 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
index 0fae571..c1fab3e 100644
--- a/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
+++ b/meta/recipes-devtools/rpm/rpm/python-rpm-rpmsense.patch
@@ -17,7 +17,7 @@ Index: rpm-5.4.9/python/rpmmodule.c
      REGISTER_ENUM(RPMSENSE_NOTEQUAL);
      REGISTER_ENUM(RPMSENSE_FIND_REQUIRES);
 -#if defined(RPM_VENDOR_MANDRIVA)
-+#if defined(RPM_VENDOR_MANDRIVA) || defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_POKY)
++#if defined(RPM_VENDOR_MANDRIVA) || defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_OE)
      REGISTER_ENUM(RPMSENSE_PREREQ);
      REGISTER_ENUM(RPMSENSE_SCRIPT_PRE);
      REGISTER_ENUM(RPMSENSE_SCRIPT_POST);
@@ -26,7 +26,7 @@ Index: rpm-5.4.9/python/rpmmodule.c
 +    REGISTER_ENUM(RPMSENSE_SCRIPT_POSTUN);
 +#endif
 +
-+#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_POKY)
++#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_OE)
 +    REGISTER_ENUM(RPMSENSE_MISSINGOK);
  #endif
  
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch b/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
index d81e25a..c4b4c03 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
@@ -12,7 +12,7 @@ diff -urN rpm-5.4.0.orig/lib/order.c rpm-5.4.0/lib/order.c
  		rpmlogLvl msglvl = (anaconda || (rpmtsDFlags(ts) & RPMDEPS_FLAG_DEPLOOPS))
  			? RPMLOG_WARNING : RPMLOG_ERR;
 -#if defined(RPM_VENDOR_MANDRIVA) /* loop-detection-optional-loglevel */
-+#if defined(RPM_VENDOR_MANDRIVA) || defined(RPM_VENDOR_POKY) /* loop-detection-optional-loglevel */
++#if defined(RPM_VENDOR_MANDRIVA) || defined(RPM_VENDOR_OE) /* loop-detection-optional-loglevel */
  		// Report loops as debug-level message by default (7 = RPMLOG_DEBUG), overridable
  		msglvl = rpmExpandNumeric("%{?_loop_detection_loglevel}%{?!_loop_detection_loglevel:7}");
  #endif
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
index 0f391d2..1432b16 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform-file-fix.patch
@@ -12,7 +12,7 @@ index e676601..9140bbe 100644
  #endif
  	}
  
-+#if !defined(RPM_VENDOR_POKY) /* Skip the explicit-platform */
++#if !defined(RPM_VENDOR_OE) /* Skip the explicit-platform */
  #if defined(RPM_VENDOR_OPENPKG) /* explicit-platform */
  	/* do not use vendor and GNU attribution */
  	p = rpmExpand("%{_host_cpu}-%{_host_os}", NULL);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
index 9e167d8..172510c 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform.patch
@@ -14,7 +14,7 @@ diff -ur rpm-5.4.0.orig/lib/depends.c rpm-5.4.0/lib/depends.c
  	}
  
 -#if defined(RPM_VENDOR_WINDRIVER)
-+#if defined(RPM_VENDOR_WINDRIVER) && !defined(RPM_VENDOR_POKY)
++#if defined(RPM_VENDOR_WINDRIVER) && !defined(RPM_VENDOR_OE)
  	/*
  	 * If we're capable of installing multiple colors
  	 * but at least one of the packages are white (0), we
@@ -23,7 +23,7 @@ diff -ur rpm-5.4.0.orig/lib/depends.c rpm-5.4.0/lib/depends.c
  }
  
 -#if defined(RPM_VENDOR_WINDRIVER)
-+#if defined(RPM_VENDOR_WINDRIVER) && !defined(RPM_VENDOR_POKY)
++#if defined(RPM_VENDOR_WINDRIVER) && !defined(RPM_VENDOR_OE)
  /* Is "compat" compatible w/ arch? */
  int _isCompatibleArch(const char * arch, const char * compat)
  {
@@ -32,7 +32,7 @@ diff -ur rpm-5.4.0.orig/lib/depends.c rpm-5.4.0/lib/depends.c
  	    if (arch == NULL || (parch = rpmteA(p)) == NULL)
  		continue;
 -#if defined(RPM_VENDOR_WINDRIVER)
-+#if defined(RPM_VENDOR_WINDRIVER) && !defined(RPM_VENDOR_POKY)
++#if defined(RPM_VENDOR_WINDRIVER) && !defined(RPM_VENDOR_OE)
  	    /* XXX hackery for alias matching. */
  	    if (!_isCompatibleArch(arch, parch))
  		continue;
@@ -40,7 +40,7 @@ diff -ur rpm-5.4.0.orig/lib/depends.c rpm-5.4.0/lib/depends.c
      return rc;
  }
  
-+#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_POKY)
++#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_OE)
 +#define _ETC_RPM_SYSINFO        "%{_etcrpm}/sysinfo"
 +#else
 +#define _ETC_RPM_SYSINFO        SYSCONFIGDIR "/sysinfo"
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch b/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
index 6683d8f..79124bb 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
@@ -22,7 +22,7 @@ Index: rpm-5.4.9/lib/rpmrc.c
  {
  
 -#if defined(RPM_VENDOR_WINDRIVER)
-+#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_POKY)
++#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_OE)
      addMacro(NULL, "_usrlibrpm", NULL, __usrlibrpm, RMIL_DEFAULT);
      addMacro(NULL, "_etcrpm", NULL, __etcrpm, RMIL_DEFAULT);
      addMacro(NULL, "_vendor", NULL, "%{?_host_vendor}%{!?_host_vendor:wrs}", RMIL_DEFAULT);
@@ -38,7 +38,7 @@ Index: rpm-5.4.9/lib/rpmrc.c
  	}
  
  	if (!parseCVOG(p, &cvog) && cvog != NULL) {
-+#if defined(RPM_VENDOR_POKY)
++#if defined(RPM_VENDOR_OE)
 +	    char * _gnu = NULL;
 +
 +	    addMacro(NULL, "_platform_cpu", NULL, cvog->cpu, -1);
@@ -98,7 +98,7 @@ Index: rpm-5.4.9/python/rpmmodule.c
  
 -#if defined(RPM_VENDOR_WINDRIVER)
 -    platform = rpmExpand(arch, "-%{_host_vendor}", "-%{_host_os}%{?_gnu}", NULL);
-+#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_POKY)
++#if defined(RPM_VENDOR_WINDRIVER) || defined(RPM_VENDOR_OE)
 +    platform = rpmExpand(arch, "-%{_host_vendor}", "-%{_host_os}%{?_host_gnu}%{!?_host_gnu:%{?_gnu}}", NULL);
  #else
      platform = rpmExpand(arch, "-", "%{_vendor}", "-", "%{_os}", NULL);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
index 8a9e712..f4e4228 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
@@ -20,7 +20,7 @@ Index: rpm-5.4.9/lib/psm.c
      int xx;
      int i;
  
-+#ifdef RPM_VENDOR_POKY
++#ifdef RPM_VENDOR_OE
 +    const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
 +#endif
 +    
@@ -41,7 +41,7 @@ Index: rpm-5.4.9/lib/psm.c
 +	argc = 0;
 +    }
 +
-+#ifdef RPM_VENDOR_POKY
++#ifdef RPM_VENDOR_OE
 +    if (scriptletWrapper && *scriptletWrapper) {
 +	argv[argc++] = scriptletWrapper;
 +	argv[argc] = rpmtsRootDir(ts);
@@ -69,7 +69,7 @@ Index: rpm-5.4.9/lib/psm.c
  	if (rpmIsDebug() &&
 -	    (!strcmp(argv[0], "/bin/sh") || !strcmp(argv[0], "/bin/bash")))
 +	    (!strcmp(argv[0], "/bin/sh") || !strcmp(argv[0], "/bin/bash"))
-+#ifdef RPM_VENDOR_POKY
++#ifdef RPM_VENDOR_OE
 +	    || (scriptletWrapper && *scriptletWrapper && !strcmp(argv[1], "/bin/sh"))
 +	    || (scriptletWrapper && *scriptletWrapper && !strcmp(argv[1], "/bin/bash"))
 +#endif
@@ -81,7 +81,7 @@ Index: rpm-5.4.9/lib/psm.c
  
  	{   const char * rootDir = rpmtsRootDir(ts);
  	    if (!rpmtsChrootDone(ts) && rootDir != NULL &&
-+#ifdef RPM_VENDOR_POKY
++#ifdef RPM_VENDOR_OE
 +		!(scriptletWrapper && *scriptletWrapper) &&
 +#endif
  		!(rootDir[0] == '/' && rootDir[1] == '\0'))
@@ -90,7 +90,7 @@ Index: rpm-5.4.9/lib/psm.c
  		xx = Chroot(rootDir);
  		/*@=modobserver@*/
  	    }
-+#ifdef RPM_VENDOR_POKY
++#ifdef RPM_VENDOR_OE
 +	    if (!rpmtsChrootDone(ts) && rootDir != NULL &&
 +		(scriptletWrapper && *scriptletWrapper) &&
 +		!(rootDir[0] == '/' && rootDir[1] == '\0'))
@@ -105,7 +105,7 @@ Index: rpm-5.4.9/lib/psm.c
  	/* XXX running %verifyscript/%sanitycheck doesn't have psm->te */
      {	rpmtxn _parent = (psm && psm->te ? psm->te->txn : NULL);
 +
-+#ifdef RPM_VENDOR_POKY
++#ifdef RPM_VENDOR_OE
 +        const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
 +	if (scriptletWrapper && *scriptletWrapper)
 +	     rc = rpmpsmNext(psm, PSM_CHROOT_OUT);
@@ -118,7 +118,7 @@ Index: rpm-5.4.9/lib/psm.c
  	else
  	     xx = rpmtxnCommit(rpmtsGetRdb(ts)->db_txn);
  	rpmtsGetRdb(ts)->db_txn = NULL;
-+#ifdef RPM_VENDOR_POKY
++#ifdef RPM_VENDOR_OE
 +	if (scriptletWrapper && *scriptletWrapper)
 +	     rc = rpmpsmNext(psm, PSM_CHROOT_IN);
 +#endif
@@ -126,13 +126,13 @@ Index: rpm-5.4.9/lib/psm.c
      case PSM_TRIGGERS:
  	/* Run triggers in other package(s) this package sets off. */
  	if (rpmtsFlags(ts) & RPMTRANS_FLAG_TEST)	break;
-+#ifdef RPM_VENDOR_POKY
++#ifdef RPM_VENDOR_OE
 +        const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
 +	if (scriptletWrapper && *scriptletWrapper)
 +	     rc = rpmpsmNext(psm, PSM_CHROOT_OUT);
 +#endif
  	rc = runTriggers(psm);
-+#ifdef RPM_VENDOR_POKY
++#ifdef RPM_VENDOR_OE
 +	if (scriptletWrapper && *scriptletWrapper)
 +	     rc = rpmpsmNext(psm, PSM_CHROOT_IN);
 +#endif
@@ -143,14 +143,14 @@ Index: rpm-5.4.9/lib/psm.c
  	    F_SET(psm, GOTTRIGGERS);
  	}
  	if (psm->triggers != NULL)
-+#ifdef RPM_VENDOR_POKY
++#ifdef RPM_VENDOR_OE
 +	{
 +            const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
 +	    if (scriptletWrapper && *scriptletWrapper)
 +	         rc = rpmpsmNext(psm, PSM_CHROOT_OUT);
 +#endif
  	    rc = runImmedTriggers(psm);
-+#ifdef RPM_VENDOR_POKY
++#ifdef RPM_VENDOR_OE
 +	    if (scriptletWrapper && *scriptletWrapper)
 +	         rc = rpmpsmNext(psm, PSM_CHROOT_IN);
 +	}
-- 
1.8.3


