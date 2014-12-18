Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 04EB572792
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 11:04:44 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBIB4gw6027689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:04:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1418900684;
	bh=7XBKr8i1m5IX5aBQaIxAgCrX+I9tcRx0xaLwhX0Fv5I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Sender;
	b=XwfsoDFFPihJlq1BGMdoBiun93GZ6YBDJI6JAu7w3a8PQShFf9izSD+Y5qldtQ9mf
	jWU5n1EeXHy6YbPf1ld6QXeP3Yc/Qls7t6iRjtkhMCQV3dtO1FKRau2VIwyJGkv8UH
	mzbh+89lw42T+Wg3EKb/gCe0x4ksgeYoMxKfev2o=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBIB4bJJ005840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Dec 2014 12:04:38 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Y1Ysl-0006fG-Vo; Thu, 18 Dec 2014 12:04:36 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Dec 2014 12:04:22 +0100
Message-Id: <1418900663-20985-3-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1418900663-20985-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1418900663-20985-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 2/3] pkgconfig.bblcass: remove PKG_CONFIG_SYSROOT_DIR from installed .pc files
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
X-List-Received-Date: Thu, 18 Dec 2014 11:04:48 -0000

Having ${PKG_CONFIG_SYSROOT_DIR} in installed .pc files is nearly
everytime an error because it next 'pkgconfig' call will prepend
${PKG_CONFIG_SYSROOT_DIR} environment variable again resulting into a
duplication and invalidation of paths.

Patch removes this string from installed .pc files.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/pkgconfig.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/pkgconfig.bbclass b/meta/classes/pkgconfig.bbclass
index ad1f84f..459a871 100644
--- a/meta/classes/pkgconfig.bbclass
+++ b/meta/classes/pkgconfig.bbclass
@@ -1,2 +1,19 @@
 DEPENDS_prepend = "pkgconfig-native "
 
+PKGCONFIG_FILE_PATTERN ?= "-path '*/pkgconfig/*' -name '*.pc' -type f"
+PKGCONFIG_FILE_PATTERN[doc] = "Options given to the 'find' utility to \
+ iterate over pkgconfig files"
+
+pkgconfig_mangle_pc() {
+    if test -n '${PKG_CONFIG_SYSROOT_DIR}'; then
+	# find .pc files, check and give out whether they contain
+	# the sysroot dir and remove this string
+	find '${D}' ${PKGCONFIG_FILE_PATTERN} \
+	     -exec grep '${PKG_CONFIG_SYSROOT_DIR}' '{}' \; \
+	     -printf "NOTE: removing PKG_CONFIG_SYSROOT_DIR from %P\n" \
+	     -exec sed -i \
+	               -e 's!${PKG_CONFIG_SYSROOT_DIR}!!g' \
+	           '{}' \;
+    fi
+}
+do_install[postfuncs] += "pkgconfig_mangle_pc"
-- 
1.9.3


