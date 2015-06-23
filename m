Return-Path: <ramaxlo@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 814E760097
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 16:22:56 +0000 (UTC)
Received: by pdcu2 with SMTP id u2so10420464pdc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 09:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Dg4fq/ckLQrmk0su3oUU5OdjBXfjXLPW25BoYcHh454=;
	b=sV8GZy86f/4r1Pw+to1SL3bjT21VH7IA63VqJOSbQFenxOgosaIEqjyA5d6z/OHoOi
	ECmUSxyG0VWIedJB34gRBoRk2qoMo6DlEPkSFKwBM/3R49cQDlyUHk88nDpCpHBrdBzE
	p/56LdFM/CDe9XFtr2FFRUq4JMfuVp6EHL0e08N3yv4/QYzf7nSHWHdaDM/6UoXLrXtB
	UWaRz4XjuLoA8bYkeMYyUaPtswMY5GCI2VUyEOqwyBvnFvix8QkrP/PtGxo1DZPg9a+z
	m4CxMyRDLy1S5pCEQAefwQeHXYURtfQedazjaDzkZgy9rRYqZxy/1TntFbxdo4lx//OU
	6KzQ==
X-Received: by 10.66.192.1 with SMTP id hc1mr70863650pac.38.1435076577365;
	Tue, 23 Jun 2015 09:22:57 -0700 (PDT)
Received: from linux-phenom.site (36-228-199-16.dynamic-ip.hinet.net.
	[36.228.199.16])
	by mx.google.com with ESMTPSA id m2sm23800674pdp.4.2015.06.23.09.22.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Jun 2015 09:22:56 -0700 (PDT)
From: Ramax Lo <ramaxlo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jun 2015 00:22:52 +0800
Message-Id: <1435076572-3966-1-git-send-email-ramaxlo@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] uclibc: Cope with other mips32 variants
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
X-List-Received-Date: Tue, 23 Jun 2015 16:22:58 -0000

Update uclibc.inc to handle different tunes of mips32 like mips32el,
mips32-nf, mips32el-nf, etc.

Signed-off-by: Ramax Lo <ramaxlo@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 18587ca..08465c4 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -94,7 +94,9 @@ python () {
     # with conflicting march options to gcc. Here we
     # ask for MIPS32 ISA to match the chosen arch
     tune = d.getVar("DEFAULTTUNE", True)
-    if tune in ['mips32', 'mips32r2']:
+    if tune.startswith('mips32'):
+        import re
+        tune = re.sub('(el)*(-nf)*', '', tune)
         d.setVar('configmangle_append',
                  "/^### MIPS32_CHECK$/a\\\nCONFIG_MIPS_ISA_%s=y\n\n" % (tune.upper()))
     if "${OE_FEATURES}":
-- 
2.1.4


