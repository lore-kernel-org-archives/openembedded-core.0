Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DD2B2728EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 09:17:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBJ9Hk0Q016678
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 01:17:47 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 19 Dec 2014 01:17:46 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 17:17:44 +0800
Message-ID: <bce5d25923fa12b78995d41278ed940869221feb.1418979966.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418979966.git.Qi.Chen@windriver.com>
References: <cover.1418979966.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] sed: test bindir and base_bindir before moving and removing things
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
X-List-Received-Date: Fri, 19 Dec 2014 09:17:52 -0000
Content-Type: text/plain

It's possible that ${base_bindir} and ${bindir} point to the same directory.
So we need to test it before moving things around or removing things.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sed/sed_4.1.2.bb | 6 ++++--
 meta/recipes-extended/sed/sed_4.2.2.bb | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/sed/sed_4.1.2.bb b/meta/recipes-extended/sed/sed_4.1.2.bb
index fe242e1..a2bcb7d 100644
--- a/meta/recipes-extended/sed/sed_4.1.2.bb
+++ b/meta/recipes-extended/sed/sed_4.1.2.bb
@@ -23,8 +23,10 @@ do_configure_prepend () {
 do_install () {
 	autotools_do_install
 	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/sed ${D}${base_bindir}/sed
-	rmdir ${D}${bindir}/
+	if [ "${bindir}" != "${base_bindir}" ]; then
+	    mv ${D}${bindir}/sed ${D}${base_bindir}/sed
+	    rmdir ${D}${bindir}/
+	fi
 }
 
 ALTERNATIVE_${PN} = "sed"
diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index ea39dae..1c49c12 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -22,8 +22,10 @@ EXTRA_OECONF = "--disable-acl \
 do_install () {
 	autotools_do_install
 	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/sed ${D}${base_bindir}/sed
-	rmdir ${D}${bindir}/
+	if [ "${bindir}" != "${base_bindir}" ]; then
+	    mv ${D}${bindir}/sed ${D}${base_bindir}/sed
+	    rmdir ${D}${bindir}/
+	fi
 }
 
 ALTERNATIVE_${PN} = "sed"
-- 
1.9.1


