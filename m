Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 841196FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS7F6jU013852
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:06 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:05 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:33 -0800
Message-ID: <ed92440d19e5948aa64c95fcf30b989c5e6efdb9.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 25/40] populate_sdk_ext.bbclass: Be more permissive on the name of the buildtools
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:05 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

We want to support different names for the buildtools tarball.  The
name may not always be of the default oe-core format.

For instance, at Wind River we define the built-tools name to be:

${SDK_ARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}

because thes standard SDK_NAME has additional information that is not
relevant to the builtools tarball.

(From OE-Core master rev: b49c6f179b06a8b97106aa4c95f2cdb3c4dc0920)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index dc05261..8601c78 100644
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
1.7.9.5


