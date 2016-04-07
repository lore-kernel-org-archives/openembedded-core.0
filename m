Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1A8A770AB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 07:34:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u377YZwj026791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Apr 2016 00:34:35 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Apr 2016 00:34:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Apr 2016 00:34:32 -0700
Message-ID: <b937eb7a3c7b626579f1a7d12762129897be86d8.1460014426.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460014426.git.liezhi.yang@windriver.com>
References: <cover.1460014426.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] apr-util: fix path in rules.mk for nativesdk
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
X-List-Received-Date: Thu, 07 Apr 2016 07:34:35 -0000
Content-Type: text/plain

Fixed when build nativesdk-apr-util:
| gawk: fatal: can't open source file `/opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/share/build-1/make_exports.awk' for reading (No such file or directory)

The ${S} should be ${B}.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/apr/apr-util_1.5.4.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.5.4.bb b/meta/recipes-support/apr/apr-util_1.5.4.bb
index 28962bd..2b8676f 100644
--- a/meta/recipes-support/apr/apr-util_1.5.4.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.4.bb
@@ -53,10 +53,10 @@ do_configure_prepend_class-nativesdk() {
 }
 
 do_configure_append_class-nativesdk() {
-	sed -i "s#\(apr_builddir\)=.*#\1=${STAGING_DATADIR}/build-1#" ${S}/build/rules.mk
-	sed -i "s#\(apr_builders\)=.*#\1=${STAGING_DATADIR}/build-1#" ${S}/build/rules.mk
-	sed -i "s#\(top_builddir\)=.*#\1=${STAGING_DATADIR}/build-1#" ${S}/build/rules.mk
-	sed -i "s#\(LIBTOOL=\$(apr_builddir)\).*#\1/libtool#" ${S}/build/rules.mk
+	sed -i "s#\(apr_builddir\)=.*#\1=${STAGING_DATADIR}/build-1#" ${B}/build/rules.mk
+	sed -i "s#\(apr_builders\)=.*#\1=${STAGING_DATADIR}/build-1#" ${B}/build/rules.mk
+	sed -i "s#\(top_builddir\)=.*#\1=${STAGING_DATADIR}/build-1#" ${B}/build/rules.mk
+	sed -i "s#\(LIBTOOL=\$(apr_builddir)\).*#\1/libtool#" ${B}/build/rules.mk
 }
 
 do_install_append_class-target() {
-- 
2.7.4


