Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAD7B70101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 03:05:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6I35tiM018273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jul 2016 20:05:58 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Jul 2016 20:05:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jul 2016 20:05:52 -0700
Message-ID: <658f337dff899cd6b35f183a85b011ae57030130.1468811058.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468811058.git.liezhi.yang@windriver.com>
References: <cover.1468811058.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] xmlto: only target requires coreutils
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
X-List-Received-Date: Mon, 18 Jul 2016 03:06:02 -0000
Content-Type: text/plain

The coreutils added to RDEPENDS was for tail command which is everywhere
on the build host, so only add it to target. There was a side effect if
coreutils-native was build, when its commands install to sysroots, they
would be removed during rebuild, and cause other recipes fail to build:

/path/to/tmp/sysroots/x86_64-linux/usr/bin/mkdir -p lib/sys
make: /path/to/tmp/sysroots/x86_64-linux/usr/bin/mkdir: Command not found

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 14d1009..886e7b4 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -20,10 +20,10 @@ RDEPENDS_${PN} = "docbook-xml-dtd4 \
                   util-linux \
                   libxml2 \
                   bash \
-                  coreutils \
 "
 RDEPENDS_${PN}_append_class-target = " \
                   libxslt-bin \
+                  coreutils \
 "
 CACHED_CONFIGUREVARS += "ac_cv_path_TAIL=${bindir}/tail"
 
-- 
2.9.0


