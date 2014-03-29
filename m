Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id C5D1260DDF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 20:04:51 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id z6so6206737yhz.21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 13:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=pzN29YzxXvHIDCXLgfgZ6EKSV+wprt5UU68fVSFuEEM=;
	b=fVG5F+S5iQI/8CXBLzNFK48D++EICHIBUqR+s1VsJj+u9YgnRnbYI7u+wh39mqIrxl
	VkghjCn62a0Nxdzs4Shso3AthHWrPgXYVW9lSjRIDj3AzarMX5mqOYDDfzWdz0Jx0qc0
	3Ohbm8aXCyMRwLtb/vTaPCVj/329eWnphu7mUsChBuh1EpvRQm8VqJ9Iy4tD7VyZ+UxZ
	g/EfZvwkceIPvTzQgNKQGokYpsawNsxEXiHDfrXBHTIpHP7Qn4lgdr1d87vaLghWgJ8S
	oZhCghnKnB1+Vn+mZx7dBQrY9CCZ57LOAl59mwG1Fh3X/KGTalzZbZ5Bxi1Pl6WwLvQW
	11GA==
X-Received: by 10.236.8.68 with SMTP id 44mr22807864yhq.39.1396123492411;
	Sat, 29 Mar 2014 13:04:52 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id r3sm15669128yhl.38.2014.03.29.13.04.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Mar 2014 13:04:51 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 44DE019E5CECE; Sat, 29 Mar 2014 17:04:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Mar 2014 17:04:41 -0300
Message-Id: <1396123481-6064-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] packagegroup-core-tools-testapps: Move GLTOOLS to X11GLTOOLS
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
X-List-Received-Date: Sat, 29 Mar 2014 20:04:53 -0000

piglit and mesa-demos are not buildable in x11-less distros so we must
to add those only when opengl and x11 DISTRO_FEATURES are available.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index d8a7306..0ced119 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -24,7 +24,7 @@ KEXECTOOLS_powerpc ?= ""
 KEXECTOOLS_e5500-64b ?= ""
 KEXECTOOLS_aarch64 ?= ""
 
-GLTOOLS = "\
+X11GLTOOLS = "\
     mesa-demos \
     piglit \
     "
@@ -58,6 +58,7 @@ RDEPENDS_${PN} = "\
     connman-tests \
     connman-client \
     ${@base_contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', "${GLTOOLS}", "", d)} \
+    ${@base_contains('DISTRO_FEATURES', 'opengl', \
+        base_contains('DISTRO_FEATURES', 'x11', "${X11GLTOOLS}", "", d), "", d)} \
     ${@base_contains('DISTRO_FEATURES', '3g', "${3GTOOLS}", "", d)} \
     "
-- 
1.9.1


