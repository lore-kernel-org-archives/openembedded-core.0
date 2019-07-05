Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD3F606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 01:18:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x651IIjv024207
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Jul 2019 18:18:18 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 4 Jul 2019 18:18:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Jul 2019 09:30:27 +0800
Message-ID: <c9d93056cbc6067892aa042e5f2c71f3cc264656.1562290204.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1562290204.git.Qi.Chen@windriver.com>
References: <cover.1562290204.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] xmlcatalog.bbclass: execute xmlcatalog only if it's available
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
X-List-Received-Date: Fri, 05 Jul 2019 01:18:18 -0000
Content-Type: text/plain

For build-sysroots.bb, the xmlcatalog would not be in its
staging directory. Causing the following error for eSDK.

ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Command '/PATH/TO/IMAGE/testsdkext/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit status 127.
ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Function failed: do_build_native_sysroot

The problem could be reproduced by the following steps.
1. Add in local.conf:
   IMAGE_INSTALL_append = " btrfs-tools"
   DISTRO_FEATURES_append = " api-documentation"
   INHERIT += "testsdk"
2. bitbake core-image-minimal -c populate_sdk_ext
3. bitbake core-image-minimal -c testsdkext

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/xmlcatalog.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/xmlcatalog.bbclass b/meta/classes/xmlcatalog.bbclass
index 075aef8..e805e7b 100644
--- a/meta/classes/xmlcatalog.bbclass
+++ b/meta/classes/xmlcatalog.bbclass
@@ -5,6 +5,8 @@ XMLCATALOGS ?= ""
 SYSROOT_PREPROCESS_FUNCS_append = " xmlcatalog_sstate_postinst"
 
 xmlcatalog_complete() {
+	# In case of eSDK, build-sysroot does not have xmlcatalog in its staging directory.
+	[ "`which xmlcatalog`" = "" ] && exit 0
 	ROOTCATALOG="${STAGING_ETCDIR_NATIVE}/xml/catalog"
 	if [ ! -f $ROOTCATALOG ]; then
 		mkdir --parents $(dirname $ROOTCATALOG)
-- 
1.9.1


