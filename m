Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB8B06F61F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 11:27:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s37BRQlT017758
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Apr 2014 04:27:26 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Mon, 7 Apr 2014 04:27:25 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Apr 2014 19:27:18 +0800
Message-ID: <1396870039-26834-2-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1396870039-26834-1-git-send-email-ming.liu@windriver.com>
References: <1396870039-26834-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] freetype: fix multilib header conflict - ftconfig.h
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
X-List-Received-Date: Mon, 07 Apr 2014 11:27:28 -0000
Content-Type: text/plain

ftconfig.h conflicts between 32-bit and 64-bit versions.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-graphics/freetype/freetype_2.5.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/freetype/freetype_2.5.2.bb b/meta/recipes-graphics/freetype/freetype_2.5.2.bb
index b93453a..0c62a67 100644
--- a/meta/recipes-graphics/freetype/freetype_2.5.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.2.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "4ff4bd393aa01071ec7b849d035508a505a78f88b2bcf25ff11e58e43c
 
 S = "${WORKDIR}/freetype-${PV}"
 
-inherit autotools-brokensep pkgconfig binconfig
+inherit autotools-brokensep pkgconfig binconfig multilib_header
 
 LIBTOOL = "${S}/builds/unix/${HOST_SYS}-libtool"
 EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
@@ -50,5 +50,9 @@ do_compile_prepend() {
 	${BUILD_CC} -o objs/apinames src/tools/apinames.c
 }
 
+do_install_append() {
+	oe_multilib_header freetype2/config/ftconfig.h
+}
+
 BBCLASSEXTEND = "native"
 
-- 
1.8.4.1


