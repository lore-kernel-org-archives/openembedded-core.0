Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 886AF60796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 18:13:20 +0000 (UTC)
Received: by mail-ig0-f196.google.com with SMTP id ya17so7921616igc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c4CaOOFOs2mY0+OQg5NHxIH4PGjdvoKwNeBe5s7TN7c=;
	b=Y81B2tp8wBdEf3nZJRjnL/wPGlKtB8WupygFHuNBRORsDuune8IGnCnYUT8SLQTnd8
	E7lX8bWlcipoqp1sg5swI7E+9txvGzS1JaKuA59qYJPJidIEL2NB4NN8PcPbICvREf3U
	dshzT3fuKMmfvHymYg7DW9ihkOwvoJen/laSriLzqTUFCsHKE1dbrcg27zbhGy+ZtXkx
	NDvzbqmKWEvKs/gmD5TDVAjQLKZy38AElvKGrS5HujMZx8Idbfv0vXuwZCZn4XYqC7qb
	R/LJoh9FHt7sIdQ49uVuyzE1vavThmUlu97R7kIApxic5xkSVRX6pPP7SIne4UcEApmj
	LX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c4CaOOFOs2mY0+OQg5NHxIH4PGjdvoKwNeBe5s7TN7c=;
	b=ZOenhGZgCpJotpUFpi4ALJjbsBsaPO68XVXgEVyh9EjqCjTR0rw9OqkRYS5eh7EUgC
	Lb8DtY1RBwXpOZ5l5Znfx3iLX7ZXlRvA2PVmtUW3jT7BtRziFqreJriKCRVo9Jm+xeFy
	KsVQ/MJLWrKLPz+Q829V1df+eMd6RYFF5l9uBV9FF2O+r0m2C/oMmZWuySzIVL1HX8oR
	tPHmBaNG98zbyx6HBOsbP1oCnNiFntvsP2cFDPE2CNc0n1BjKKB2beigLq1dfR/bEaHU
	k9aL/geHFMgtY+c2k+smU3tVc95PHmfBUW015wlyPaL2QDh7Yxv8xm8/U0TyDNq5ERUL
	+AQw==
X-Gm-Message-State: AD7BkJI69WzdzVZWDGrR73TRYeiIOO2FpiEwBrL+HDJaolKwQpBQI671ZGzBoNml1vK2bA==
X-Received: by 10.50.43.137 with SMTP id w9mr214135igl.41.1459448000963;
	Thu, 31 Mar 2016 11:13:20 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p1sm4252058iop.12.2016.03.31.11.13.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 11:13:20 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 11:13:06 -0700
Message-Id: <1459447989-25263-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459447989-25263-1-git-send-email-armccurdy@gmail.com>
References: <1459447989-25263-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/4] base.bbclass: drop obsolete HOSTTOOLS_WHITELIST_GPL-3.0
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
X-List-Received-Date: Thu, 31 Mar 2016 18:13:20 -0000

base.bbclass sets 'check_license' to False (and therefore skips
license checking completely) for native, nativesdk, etc recipes
(ie anything which could potentially be classed as "host tools"),
so supporting a dedicated whitelist of GPLv3 host tools is not
necessary.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/base.bbclass                       | 25 ++++++++-----------------
 meta/classes/multilib.bbclass                   |  2 +-
 meta/conf/distro/include/default-distrovars.inc |  3 ---
 3 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e066dc9..ab8715e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -499,28 +499,21 @@ python () {
 
             whitelist = []
             incompatwl = []
-            htincompatwl = []
             for lic in bad_licenses:
                 spdx_license = return_spdx(d, lic)
-                for w in ["HOSTTOOLS_WHITELIST_", "LGPLv2_WHITELIST_", "WHITELIST_"]:
+                for w in ["LGPLv2_WHITELIST_", "WHITELIST_"]:
                     whitelist.extend((d.getVar(w + lic, True) or "").split())
                     if spdx_license:
                         whitelist.extend((d.getVar(w + spdx_license, True) or "").split())
                     '''
-                    We need to track what we are whitelisting and why. If pn is 
-                    incompatible and is not HOSTTOOLS_WHITELIST_ we need to be 
-                    able to note that the image that is created may infact 
-                    contain incompatible licenses despite INCOMPATIBLE_LICENSE 
-                    being set.
+                    We need to track what we are whitelisting and why. If pn is
+                    incompatible we need to be able to note that the image that
+                    is created may infact contain incompatible licenses despite
+                    INCOMPATIBLE_LICENSE being set.
                     '''
-                    if "HOSTTOOLS" in w:
-                        htincompatwl.extend((d.getVar(w + lic, True) or "").split())
-                        if spdx_license:
-                            htincompatwl.extend((d.getVar(w + spdx_license, True) or "").split())
-                    else:
-                        incompatwl.extend((d.getVar(w + lic, True) or "").split())
-                        if spdx_license:
-                            incompatwl.extend((d.getVar(w + spdx_license, True) or "").split())
+                    incompatwl.extend((d.getVar(w + lic, True) or "").split())
+                    if spdx_license:
+                        incompatwl.extend((d.getVar(w + spdx_license, True) or "").split())
 
             if not pn in whitelist:
                 recipe_license = d.getVar('LICENSE', True)
@@ -546,8 +539,6 @@ python () {
             elif pn in whitelist:
                 if pn in incompatwl:
                     bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted")
-                elif pn in htincompatwl:
-                    bb.note("INCLUDING " + pn + " as buildable despite INCOMPATIBLE_LICENSE because it has been whitelisted for HOSTTOOLS")
 
     needsrcrev = False
     srcuri = d.getVar('SRC_URI', True)
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 052f911..d5a3128 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -59,7 +59,7 @@ python multilib_virtclass_handler () {
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
 
     # Expand the WHITELISTs with multilib prefix
-    for whitelist in ["HOSTTOOLS_WHITELIST_GPL-3.0", "WHITELIST_GPL-3.0", "LGPLv2_WHITELIST_GPL-3.0"]:
+    for whitelist in ["WHITELIST_GPL-3.0", "LGPLv2_WHITELIST_GPL-3.0"]:
         pkgs = e.data.getVar(whitelist, True)
         for pkg in pkgs.split():
             pkgs += " " + variant + "-" + pkg
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 9779bfb..84cdaca 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -22,9 +22,6 @@ DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 
 IMAGE_FEATURES ?= ""
 
-# This is a list of packages that are used by the build system to build the distribution, they are not
-# directly part of the distribution. 
-HOSTTOOLS_WHITELIST_GPL-3.0 ?= ""
 WHITELIST_GPL-3.0 ?= ""
 LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan libidn"
 
-- 
1.9.1


