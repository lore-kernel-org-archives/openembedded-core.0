Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 06C197F2B0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:00:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46BKxF23vMz3y
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Aug 2019 17:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566140433;
	bh=E0TsuOkR79Of09Ckcr1brpl6NYhFVxscD21sfGeBk/M=;
	h=From:To:Subject:Date:From;
	b=QomRcULjseqO7mI03czFT27eCcdq3YZSRfLiFVYjnleeGRoR7D5kD/5AyxbBbCylS
	zzX2csODKDGq8E9CHyn3w54EzDK4vR1HDQ1oEHLFBmjsNiSAERwScwclnvWvp0A6nH
	hVtiTkHmLiC9AcnSBCwbCmMqlJ54fV3JQtve2zlynMgmkWeejyjQScb8kEwGbjpNWe
	JEueKT47CSYjYOzx9EEUEpjZPKfsjQ8h3gvx/Epact/crHYfRBzczXPCVLBDN8ePkQ
	j1LUjf8tXnrue+7Ok67MzQyrH9NmzwIdOEA2618u8AxpslmK9LfL5GS4ffHabPBrJf
	Zv7M0nl5vRqyS41GVF0T9OVRaXJx+IR3DzGLFPmZ42PcXqShPceTN0/L/AABjY7l8I
	qTruLXDpSRFmXtlD1lH+hQf+CgbpB+woPNvY1eIoTnkdrmtIIep6gnKn7REoARR5AD
	bWDXUUGVXz1ok8t1ZNebBaeQSnlUvBBBH9RqyO91RiWNUJMtSZg8Hy6VfF5IMRHF7e
	0EmkZV/JOhPvD+b/8GGAZaXQWfNlcPRmZleemL6Tf39TqYCCo71izwmGlVWKbLJK7W
	/BPWRPfUICxyTZycUX3rfvTEnqW4vpnexh92IMu31rSfa6LPmHotmSlP6Pq0gBVxuH
	SxHyly2NeZtma6yUawVnGHIE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Aug 2019 18:00:31 +0300
Message-Id: <20190818150032.12232-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] shadow: musl now supports secure_getenv
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
X-List-Received-Date: Sun, 18 Aug 2019 15:00:34 -0000

This fixed a potential security vulnerability on musl and made
the patch obsolete.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...ettime-Use-secure_getenv-over-getenv.patch | 71 -------------------
 meta/recipes-extended/shadow/shadow.inc       |  1 -
 2 files changed, 72 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch

diff --git a/meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch b/meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch
deleted file mode 100644
index 8c8234d038..0000000000
--- a/meta/recipes-extended/shadow/files/0002-gettime-Use-secure_getenv-over-getenv.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 3d921155e0a761f61c8f1ec37328724aee1e2eda Mon Sep 17 00:00:00 2001
-From: Chris Lamb <chris@chris-lamb.co.uk>
-Date: Sun, 31 Mar 2019 15:59:45 +0100
-Subject: [PATCH 2/2] gettime: Use secure_getenv over getenv.
-
-Upstream-Status: Backport
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- README            | 1 +
- configure.ac      | 3 +++
- lib/defines.h     | 6 ++++++
- libmisc/gettime.c | 2 +-
- 4 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/README b/README
-index 952ac5787f06..26cfff1e8fa8 100644
---- a/README
-+++ b/README
-@@ -51,6 +51,7 @@ Brian R. Gaeke <brg@dgate.org>
- Calle Karlsson <ckn@kash.se>
- Chip Rosenthal <chip@unicom.com>
- Chris Evans <lady0110@sable.ox.ac.uk>
-+Chris Lamb <chris@chris-lamb.co.uk>
- Cristian Gafton <gafton@sorosis.ro>
- Dan Walsh <dwalsh@redhat.com>
- Darcy Boese <possum@chardonnay.niagara.com>
-diff --git a/configure.ac b/configure.ac
-index da236722766b..a738ad662cc3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -110,6 +110,9 @@ AC_REPLACE_FUNCS(sgetgrent sgetpwent sgetspent)
- AC_REPLACE_FUNCS(snprintf strcasecmp strdup strerror strstr)
- 
- AC_CHECK_FUNC(setpgrp)
-+AC_CHECK_FUNC(secure_getenv, [AC_DEFINE(HAS_SECURE_GETENV,
-+                                        1,
-+                                        [Defined to 1 if you have the declaration of 'secure_getenv'])])
- 
- if test "$ac_cv_header_shadow_h" = "yes"; then
- 	AC_CACHE_CHECK(for working shadow group support,
-diff --git a/lib/defines.h b/lib/defines.h
-index cded1417fd12..2fb1b56eca6b 100644
---- a/lib/defines.h
-+++ b/lib/defines.h
-@@ -382,4 +382,10 @@ extern char *strerror ();
- # endif
- #endif
- 
-+#ifdef HAVE_SECURE_GETENV
-+#  define shadow_getenv(name) secure_getenv(name)
-+# else
-+#  define shadow_getenv(name) getenv(name)
-+#endif
-+
- #endif				/* _DEFINES_H_ */
-diff --git a/libmisc/gettime.c b/libmisc/gettime.c
-index 53eaf51670bb..0e25a4b75061 100644
---- a/libmisc/gettime.c
-+++ b/libmisc/gettime.c
-@@ -52,7 +52,7 @@
- 	unsigned long long epoch;
- 
- 	fallback = time (NULL);
--	source_date_epoch = getenv ("SOURCE_DATE_EPOCH");
-+	source_date_epoch = shadow_getenv ("SOURCE_DATE_EPOCH");
- 
- 	if (!source_date_epoch)
- 		return fallback;
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 7f82d20826..acd753d0c1 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -12,7 +12,6 @@ UPSTREAM_CHECK_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz \
            file://shadow-4.1.3-dots-in-usernames.patch \
            file://0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch  \
-           file://0002-gettime-Use-secure_getenv-over-getenv.patch \
            file://0001-configure.ac-fix-configure-error-with-dash.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
-- 
2.17.1


