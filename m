Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF9960684
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 07:15:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8N7FO21013960
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 00:15:24 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 23 Sep 2016 00:15:23 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Sep 2016 03:15:20 -0400
Message-ID: <b61e723dfcebfcc915b66b0ca8c7d70089727b5c.1474614730.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1474614730.git.dengke.du@windriver.com>
References: <cover.1474614730.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cracklib: Apply patch to fix CVE-2016-6318
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
X-List-Received-Date: Fri, 23 Sep 2016 07:15:23 -0000
Content-Type: text/plain

Fix CVE-2016-6318

Backport from cracklib upstream:

https://github.com/cracklib/cracklib/commit/47e5dec521ab6243c9b249dd65b93d232d90d6b1

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../0001-Apply-patch-to-fix-CVE-2016-6318.patch    | 105 +++++++++++++++++++++
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb   |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch b/meta/recipes-extended/cracklib/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch
new file mode 100644
index 0000000..b251ac9
--- /dev/null
+++ b/meta/recipes-extended/cracklib/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch
@@ -0,0 +1,105 @@
+From 47e5dec521ab6243c9b249dd65b93d232d90d6b1 Mon Sep 17 00:00:00 2001
+From: Jan Dittberner <jan@dittberner.info>
+Date: Thu, 25 Aug 2016 17:13:49 +0200
+Subject: [PATCH] Apply patch to fix CVE-2016-6318
+
+This patch fixes an issue with a stack-based buffer overflow when
+parsing large GECOS field. See
+https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-6318 and
+https://security-tracker.debian.org/tracker/CVE-2016-6318 for more
+information.
+
+Upstream-Status: Backport [https://github.com/cracklib/cracklib/commit/47e5dec521ab6243c9b249dd65b93d232d90d6b1]
+CVE: CVE-2016-6318
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ lib/fascist.c | 57 ++++++++++++++++++++++++++++++++-----------------------
+ 1 file changed, 33 insertions(+), 24 deletions(-)
+
+diff --git a/lib/fascist.c b/lib/fascist.c
+index a996509..d4deb15 100644
+--- a/lib/fascist.c
++++ b/lib/fascist.c
+@@ -502,7 +502,7 @@ FascistGecosUser(char *password, const char *user, const char *gecos)
+     char gbuffer[STRINGSIZE];
+     char tbuffer[STRINGSIZE];
+     char *uwords[STRINGSIZE];
+-    char longbuffer[STRINGSIZE * 2];
++    char longbuffer[STRINGSIZE];
+ 
+     if (gecos == NULL)
+ 	gecos = "";
+@@ -583,38 +583,47 @@ FascistGecosUser(char *password, const char *user, const char *gecos)
+     {
+ 	for (i = 0; i < j; i++)
+ 	{
+-	    strcpy(longbuffer, uwords[i]);
+-	    strcat(longbuffer, uwords[j]);
+-
+-	    if (GTry(longbuffer, password))
++	    if (strlen(uwords[i]) + strlen(uwords[j]) < STRINGSIZE)
+ 	    {
+-		return _("it is derived from your password entry");
+-	    }
++		strcpy(longbuffer, uwords[i]);
++		strcat(longbuffer, uwords[j]);
+ 
+-	    strcpy(longbuffer, uwords[j]);
+-	    strcat(longbuffer, uwords[i]);
++		if (GTry(longbuffer, password))
++		{
++		    return _("it is derived from your password entry");
++		}
+ 
+-	    if (GTry(longbuffer, password))
+-	    {
+-		return _("it's derived from your password entry");
+-	    }
++		strcpy(longbuffer, uwords[j]);
++		strcat(longbuffer, uwords[i]);
+ 
+-	    longbuffer[0] = uwords[i][0];
+-	    longbuffer[1] = '\0';
+-	    strcat(longbuffer, uwords[j]);
++		if (GTry(longbuffer, password))
++		{
++		   return _("it's derived from your password entry");
++		}
++	    }
+ 
+-	    if (GTry(longbuffer, password))
++	    if (strlen(uwords[j]) < STRINGSIZE - 1)
+ 	    {
+-		return _("it is derivable from your password entry");
++		longbuffer[0] = uwords[i][0];
++		longbuffer[1] = '\0';
++		strcat(longbuffer, uwords[j]);
++
++		if (GTry(longbuffer, password))
++		{
++		    return _("it is derivable from your password entry");
++		}
+ 	    }
+ 
+-	    longbuffer[0] = uwords[j][0];
+-	    longbuffer[1] = '\0';
+-	    strcat(longbuffer, uwords[i]);
+-
+-	    if (GTry(longbuffer, password))
++	    if (strlen(uwords[i]) < STRINGSIZE - 1)
+ 	    {
+-		return _("it's derivable from your password entry");
++		longbuffer[0] = uwords[j][0];
++		longbuffer[1] = '\0';
++		strcat(longbuffer, uwords[i]);
++
++		if (GTry(longbuffer, password))
++		{
++		    return _("it's derivable from your password entry");
++		}
+ 	    }
+ 	}
+     }
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
index c185d23..8299521 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
@@ -10,6 +10,7 @@ EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
+           file://0001-Apply-patch-to-fix-CVE-2016-6318.patch \
            file://0002-craklib-fix-testnum-and-teststr-failed.patch"
 
 SRC_URI[md5sum] = "376790a95c1fb645e59e6e9803c78582"
-- 
2.8.1


