Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C12460107
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 20:06:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAKK6uek009447
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 12:06:56 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 Nov 2015 12:06:55 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Nov 2015 14:06:54 -0600
Message-ID: <1448050014-106617-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] populate_sdk_ext.bbclass: Be more permissive on the name of the buildtools
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
X-List-Received-Date: Fri, 20 Nov 2015 20:06:58 -0000
Content-Type: text/plain

We want to support different names for the buildtools tarball.  The
name may not always be of the default oe-core format.

For instance, at Wind River we define the built-tools name to be:

${SDK_ARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}

because thes standard SDK_NAME has additional information that is not 
relevant to the builtools tarball.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 249ec36..e4e0233 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -187,10 +187,7 @@ python copy_buildsystem () {
 }
 
 def extsdk_get_buildtools_filename(d):
-    # This is somewhat of a hack
-    localdata = bb.data.createCopy(d)
-    localdata.setVar('PN', 'buildtools-tarball')
-    return localdata.expand('${SDK_NAME}-buildtools-nativesdk-standalone-*.sh')
+    return '*-buildtools-nativesdk-standalone-*.sh'
 
 install_tools() {
 	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}
-- 
2.5.0


