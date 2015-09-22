Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC827391A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 22:59:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8MMxKKp014293
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 15:59:20 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 22 Sep 2015 15:59:19 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Sep 2015 17:59:10 -0500
Message-ID: <0c75233f21aea98983dcde9d895c127b00ccc4f5.1442962633.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <cover.1442962633.git.peter.seebach@windriver.com>
References: <cover.1442962633.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo_1.7.4.bb: fix f*open()
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
X-List-Received-Date: Tue, 22 Sep 2015 22:59:20 -0000
Content-Type: text/plain

The 0600 modes were coming from fopen/freopen/etc., because those
don't specify a filesystem mode (just an access mode like "r" or
"w"). Use 0666 & ~umask. (And then the PSEUDO_FS_MODE macro masks
in the 0600 bits we want to be sure are present.)

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/pseudo/{pseudo_1.7.3.bb => pseudo_1.7.4.bb} | 4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.7.3.bb => pseudo_1.7.4.bb} (77%)

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.3.bb b/meta/recipes-devtools/pseudo/pseudo_1.7.4.bb
similarity index 77%
rename from meta/recipes-devtools/pseudo/pseudo_1.7.3.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.7.4.bb
index 1e9ef3b..d68e0af 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.7.3.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.7.4.bb
@@ -6,8 +6,8 @@ SRC_URI = " \
     file://fallback-group \
 "
 
-SRC_URI[md5sum] = "2bd0a44eadd4713e90ad8c152eea77aa"
-SRC_URI[sha256sum] = "e9fc3922f8feb97839b50d14eb1987afdc8f22cdcac93119323cccd5f8444652"
+SRC_URI[md5sum] = "6e4b59a346d08d4a29133c335ea12052"
+SRC_URI[sha256sum] = "f33ff84da328f943155f22cfd49030ef4ad85ad35fc2d9419a203521b65c384c"
 
 PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 31e1223..eb666c0 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "e795df44a90a426a76b790f1b2774f3046a8fc31"
-PV = "1.7.2+git${SRCPV}"
+SRCREV = "3bc3909fa70535c2ef876009dc58e577b10a7e0e"
+PV = "1.7.4+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
2.3.1


