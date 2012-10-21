Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TPxqx-0003TY-KL
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Oct 2012 17:54:15 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1000662wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2012 08:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=T5J68jfg8gz8NDwfqvcMRgxKxmKtlJsUgM7DEjFe6yo=;
	b=l/9XRiwT5DQxqUvA3Xmzvp3pbHD6/FokVfxJNDKph2+ORl1pVSydTTpB1Sd/WkAF9D
	KM4a4q+e8CkLzudLJHp8ZPICWbdQ+scWXN+YhPyCIkR1vRJ+QxErtZ9Mc8P6YO5tCFFt
	Iq3YiWmIHKR57dO+lEN4UKsIJaG7bktplpgo6aRb9oLh8nFS1kCO68ooGL+cX9kIwFZI
	CSuEeZLv0pbvO/6Fno9F04waCubsQlIOQe73Fxf46mPdvgxL5U0ckfKi5t9Ey23BUo8y
	6chAR2Ixa0AXDt+nPRKYzZh80OwtmwLSaefL37FbLejLr5QNZHHpslCh2l09sqHIBQrI
	pPWQ==
Received: by 10.216.207.199 with SMTP id n49mr3930741weo.136.1350834054313;
	Sun, 21 Oct 2012 08:40:54 -0700 (PDT)
Received: from localhost.localdomain (5-13-211-28.residential.rdsnet.ro.
	[5.13.211.28])
	by mx.google.com with ESMTPS id j8sm46423462wiy.9.2012.10.21.08.40.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 21 Oct 2012 08:40:53 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Oct 2012 18:40:41 +0300
Message-Id: <67ff120a7b9e2b737d9b52cfbb62456e1f7fae60.1350833713.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350833713.git.andrei@gherzan.ro>
References: <4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350833713.git.andrei@gherzan.ro>
In-Reply-To: <cover.1350833713.git.andrei@gherzan.ro>
References: <cover.1350833713.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQlgsI+gKTaAMp8Qfpmqryf4F5QU03OU6hPxgcpLyWbW69mTeiVzVFFIwe5RIAlnP3o8qN7e
Subject: [PATCH V2 3/5] opkg: Don't print empty PROVIDES
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
X-List-Received-Date: Sun, 21 Oct 2012 15:54:15 -0000

Every package provides itself. While printing package information all
fields are printed only if there is any relevant info for them. For
example: a package with no "Replaces" won't get this printed at all.
Packages which provide only themselves, were printing this field but with
no values. This patch skips this field if the package provides only
itself.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 ...n-t-print-provides-if-nothing-is-provided.patch |   24 ++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/don-t-print-provides-if-nothing-is-provided.patch

diff --git a/meta/recipes-devtools/opkg/opkg/don-t-print-provides-if-nothing-is-provided.patch b/meta/recipes-devtools/opkg/opkg/don-t-print-provides-if-nothing-is-provided.patch
new file mode 100644
index 0000000..669faef
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/don-t-print-provides-if-nothing-is-provided.patch
@@ -0,0 +1,24 @@
+Every package provides itself. While printing package information all
+fields are printed only if there is any relevant info for them. For
+example: a package with no "Replaces" won't get this printed at all.
+Packages which provide only themselves, were printing this field but with
+no values. This patch skips this field if the package provides only
+itself.
+
+Upstream-Status: Pending
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: trunk/libopkg/pkg.c
+===================================================================
+--- trunk.orig/libopkg/pkg.c	2011-12-18 02:11:34.000000000 +0200
++++ trunk/libopkg/pkg.c	2012-10-20 22:20:04.109201287 +0300
+@@ -731,7 +731,8 @@
+ 	  } else if (strcasecmp(field, "Priority") == 0) {
+                fprintf(fp, "Priority: %s\n", pkg->priority);
+ 	  } else if (strcasecmp(field, "Provides") == 0) {
+-	       if (pkg->provides_count) {
++	       /* Don't print provides if this package provides only itself */
++	       if (pkg->provides_count > 1) {
+                   fprintf(fp, "Provides:");
+ 		  for(i = 1; i < pkg->provides_count; i++) {
+                       fprintf(fp, "%s %s", i == 1 ? "" : ",",
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 3a90677..e1049a7 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -13,6 +13,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
   file://0010-pkg_depends-fix-version_constraints_satisfied.patch \
   file://opkg-no-sync-offline.patch \
   file://don-t-add-recommends-pkgs-to-depended-upon-by.patch \
+  file://don-t-print-provides-if-nothing-is-provided.patch \
 "
 
 S = "${WORKDIR}/trunk"
@@ -20,4 +21,4 @@ S = "${WORKDIR}/trunk"
 SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
 
-PR = "${INC_PR}.7"
+PR = "${INC_PR}.8"
-- 
1.7.9.5



