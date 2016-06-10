Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A10AF73167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 15:12:15 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n184so18654718wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 08:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RDlCsJqFqnG7/ktfyjZxfYgctUFiPMQ6c0gnRA8oosI=;
	b=jHET2GNr+gVDWlsJeT/yr2L60PBMQtofVB2mg8FSOeaBmBNZSgEKfCVQyqdFt89VGs
	BNauqiMaiUvav1fzdUfped4rA0C4hiSvtAPqR1/ydsgO+6z16eaabyrZlCkolbpnqhVP
	nwhQPbCW7uzLiohgrwTfqqC84XzyhY+Dx12gn1DOS9gwP1dbfGWIBBFyx0h5DoMGgLih
	nsCflHjYa81Im+dydoKJtxfsn5WvJwaygkufAd8VZ/rTyk9VTd9LprHfeUlEXOP6wH1b
	nP/N/FcTs+TsqLLaTeLhgz/VnQJHX+uiGvtVFNQh6+vvxgvpgfGKA7onj5pFoURiFbQN
	DldA==
X-Gm-Message-State: ALyK8tJ5i/wNMlfZkdCkklBn46Djkbjp2QVb83rSJm+aU0gdHw0kIUAuhKAVo+gQ1Y/wTA==
X-Received: by 10.28.103.2 with SMTP id b2mr3378125wmc.28.1465571535446;
	Fri, 10 Jun 2016 08:12:15 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.66])
	by smtp.gmail.com with ESMTPSA id
	lf7sm12805298wjb.23.2016.06.10.08.12.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2016 08:12:14 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 16:12:12 +0100
Message-Id: <1465571533-21604-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 1/2] uclibc: no need for CONFIG_MIPS_ISA_xxx config options
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
X-List-Received-Date: Fri, 10 Jun 2016 15:12:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

The config option for the mips ISA have been completely removed
from uclibc-ng. uclibc doesn't add gcc options based on those
config options anymore. Hence we don't need to create them here
either.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 1d42284..71d4bdd 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -88,16 +88,6 @@ python () {
     if "${OE_DEL}":
         d.setVar('configmangle_append', "${OE_DEL}" + "\n")
 
-    # by default uclibc uses mips1 ISA for o32 ABI
-    # if we use TARGET_CC_ARCH="-march=mips32" we end up 
-    # with conflicting march options to gcc. Here we
-    # ask for MIPS32 ISA to match the chosen arch
-    tune = d.getVar("DEFAULTTUNE", True)
-    if tune.startswith('mips32'):
-        import re
-        tune = re.sub('(el)*(-nf)*', '', tune)
-        d.setVar('configmangle_append',
-                 "/^### MIPS32_CHECK$/a\\\nCONFIG_MIPS_ISA_%s=y\n\n" % (tune.upper()))
     if "${OE_FEATURES}":
         d.setVar('configmangle_append',
                    "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
@@ -146,7 +136,6 @@ do_configure() {
         echo "### FPU" >>${S}/merged.config
         echo "### ABI" >>${S}/merged.config
         echo "### DISTRO FEATURES" >>${S}/merged.config
-        echo "### MIPS32_CHECK" >>${S}/merged.config
 
         # Mangle the resulting .config depending on OE variables
         sed -i -e '${configmangle}' ${S}/merged.config
-- 
2.8.1


