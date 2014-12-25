Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB277262C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Dec 2014 03:41:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBP3fB7V002511
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Dec 2014 19:41:12 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 24 Dec 2014 19:41:11 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Dec 2014 11:41:23 +0800
Message-ID: <1419478883-14044-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] glib-2.0: filter out -fvisibility=default option
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
X-List-Received-Date: Thu, 25 Dec 2014 03:41:15 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Once -fvisibility=default option is added, matchbox-desktop
will run into segfault, so filter it out as a workaround for now.

[YOCTO #7099]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
index 4b1bcf8..78fca20 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
@@ -20,3 +20,7 @@ SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
 SRC_URI[md5sum] = "05fb7cb17eacbc718e90366a1eae60d9"
 SRC_URI[sha256sum] = "0d27f195966ecb1995dcce0754129fd66ebe820c7cd29200d264b02af1aa28b5"
+
+# Once -fvisibility=default option is added, matchbox-desktop will run into segfault,
+# so filter it out as a wrokaround for now.
+TARGET_CFLAGS := "${@oe_filter_out('-fvisibility=default', '${TARGET_CFLAGS}', d)}"
-- 
1.9.1


