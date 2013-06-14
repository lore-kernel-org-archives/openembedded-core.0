Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD1AC6A8CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 07:15:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5E7FSme026049
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 00:15:28 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 14 Jun 2013 00:15:26 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Jun 2013 15:15:22 +0800
Message-ID: <2411a8f23640c7b3b808912af78c6d5686d85539.1371194065.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371194065.git.rongqing.li@windriver.com>
References: <cover.1371194065.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] directfb:filter out -fno-omit-frame-pointer option on x86 arch
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
X-List-Received-Date: Fri, 14 Jun 2013 07:15:25 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

directfb need -fomit-frame-pointer option of gcc to build some inline
asm code about mmx. But once -fno-omit-frame-pointer was added
into TARGET_CFLAGS. That will cause directfb build error on x86 arch.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-graphics/directfb/directfb.inc |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index aecc834..cff8a7f 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -34,6 +34,10 @@ EXTRA_OECONF = "\
   --disable-mesa \
 "
 
+#Once -fno-omit-frame-pointer option of gcc is added into TARGET_CLFAGS as default
+#this will cause directfb build failure on x86 arch, so filter out it.
+TARGET_CFLAGS_x86 := "${@oe_filter_out('-fno-omit-frame-pointer', '${TARGET_CFLAGS}', d)}"
+
 #PACKAGES_DYNAMIC += "^directfb-inputdrivers-.*"
 #
 #python populate_packages_prepend () {
-- 
1.7.10.4


