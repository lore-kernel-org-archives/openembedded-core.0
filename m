Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1F86CE77
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 04:54:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9T4s5hk002855
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 21:54:05 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 28 Oct 2013 21:54:04 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Oct 2013 12:54:03 +0800
Message-ID: <1383022443-4171-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] pseudo: fix library path in FILES_${PN}
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
X-List-Received-Date: Tue, 29 Oct 2013 04:54:04 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

libpseudo.so is always installed into ${prefix}/lib/, not ${libdir},
so fix these paths; and skip libdir WARN_QA checking to ignore the
warning in 64bit and multilib enabled system

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 0471cd6..9411c57 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -13,8 +13,11 @@ SRC_URI_append_class-nativesdk = " file://symver.patch"
 
 SRC_URI_append_class-native = " file://symver.patch"
 
-FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
-FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
+FILES_${PN} = "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
+FILES_${PN}-dbg += "${prefix}/lib/pseudo/lib*/.debug"
+INSANE_SKIP_${PN} += "libdir"
+INSANE_SKIP_${PN}-dbg += "libdir"
+
 PROVIDES += "virtual/fakeroot"
 
 MAKEOPTS = ""
-- 
1.7.10.4


