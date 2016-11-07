Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A96BD6060F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 08:03:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA783OmV024695
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2016 00:03:24 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 7 Nov 2016 00:03:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Nov 2016 00:03:22 -0800
Message-ID: <26722d4430b38c5c98db776a22b007d065f86fb9.1478505779.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1478505779.git.liezhi.yang@windriver.com>
References: <cover.1478505779.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] populate_sdk_ext.bbclass: check unfsd before create it
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
X-List-Received-Date: Mon, 07 Nov 2016 08:03:24 -0000
Content-Type: text/plain

Fixed when nativesdk-unfs3 is installed:
$ bitbake <image> -c populate_sdk_ext
| Traceback (most recent call last):
|   File "/path/to/oe-core/scripts/lnr", line 21, in <module>
|     os.symlink(target, linkname)
| FileExistsError: [Errno 17] File exists: '../../../../tmp/sysroots/x86_64-linux/usr/bin/unfsd' -> '/path/to/9.0/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/unfsd'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index a0856d4..26b5ca6 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -502,9 +502,10 @@ install_tools() {
 	done
 	# We can't use the same method as above because files in the sysroot won't exist at this point
 	# (they get populated from sstate on installation)
-	if [ "${SDK_INCLUDE_TOOLCHAIN}" == "1" ] ; then
+	unfsd_path="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/unfsd"
+	if [ "${SDK_INCLUDE_TOOLCHAIN}" == "1" -a ! -e $unfsd_path ] ; then
 		binrelpath=${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE',True), d.getVar('TOPDIR', True))}
-		lnr ${SDK_OUTPUT}/${SDKPATH}/$binrelpath/unfsd ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/unfsd
+		lnr ${SDK_OUTPUT}/${SDKPATH}/$binrelpath/unfsd $unfsd_path
 	fi
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
 
-- 
2.9.0


