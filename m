Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 36F2460620
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 09:20:28 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u7T9KSFN004604; Mon, 29 Aug 2016 04:20:28 -0500
Received: from adi-pc-linux.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016082904202808-258389 ;
	Mon, 29 Aug 2016 04:20:28 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 12:19:05 +0300
Message-Id: <20160829091905.1068-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.9.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/29/2016 04:20:28 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/29/2016 04:20:28 AM,
	Serialize complete at 08/29/2016 04:20:28 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-29_04:, , signatures=0
Cc: yocto@yoctoproject.org
Subject: [yocto-kernel-tools][PATCH] merge_configs.sh: fail loudly if make also fails
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
X-List-Received-Date: Mon, 29 Aug 2016 09:20:30 -0000

merge_configs.sh calls make on the generated kernel config from
the defconfig + fragments to fill in any missing symbols. make
can fail and this can lead to nasty errors further on in the
build like generating an unbootable kernel image.

Check the make return code and fail loudly if non-zero.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 tools/merge_config.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/merge_config.sh b/tools/merge_config.sh
index 67d1314..5212f37 100755
--- a/tools/merge_config.sh
+++ b/tools/merge_config.sh
@@ -152,7 +152,10 @@ fi
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
 make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
-
+if [ "$?" -ne 0 ]; then
+    echo "Make failed to fill missing config symbols. Exit." >&2
+    exit 1
+fi
 
 # Check all specified config values took (might have missed-dependency issues)
 for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
-- 
2.9.3


