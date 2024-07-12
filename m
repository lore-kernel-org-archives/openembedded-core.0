Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD272C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 11:01:01 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web10.5136.1720782052917193646
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 04:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=MUpZEFqS;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: ohnatiuk@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1532; q=dns/txt; s=iport;
  t=1720782052; x=1721991652;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=biBF+HF4sG0jprg1zm/70Xmr6lAG9JaDsQtM+tyU9Rs=;
  b=MUpZEFqSmEfTs4QFMX53REEiF6kH3TgMQH1tZwALhw742+bqRKDwA8RQ
   FbT6AGjxNrBLBUO/GYjsA/qikHx8IGKzZ4dzCrcjDlFJOH4PDx8SbNgqE
   LCQ010D6eSrqfMytUGjUE5fEXKr59akXpyBggfasB9++bCOZLjgkk6xE8
   M=;
X-CSE-ConnectionGUID: Rr/2tju2SJ+/eldckLxqLg==
X-CSE-MsgGUID: iBDFgceySbSs5GI5mP9zsg==
X-IPAS-Result: =?us-ascii?q?A0AkAQBKDJFmmJhdJa1agliEGkJIlB2gM4ElA1YPAQEBD?=
 =?us-ascii?q?0QEAQGOIgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQUBAQUBAQECAQcFFAEBA?=
 =?us-ascii?q?QEBAQEBHhkFDhAnhgKHFgEzgWODAIJlAgGsOoIsgQHeMYFsgUiNCoVkJxuBS?=
 =?us-ascii?q?USEB3aFEIV3BJZAhTGIZ38mC41ASoEhA1khAhEBVRMNCgs+CRYCFgMbFAQwD?=
 =?us-ascii?q?wkLJikGOQISDAYGBlk0CQQjAwgEA0IDIHERAwQaBAsHd4MlBBNEA4E3gVKIF?=
 =?us-ascii?q?YIFgS2CG4EMgw1LhG2BawxhiGWBCi2BEYEjP4IKgUBLhWlAAwsYDUgRLDUUG?=
 =?us-ascii?q?wY+bgetPzFdgW86QKUVoHGEHqE0GjOqOwGYaqQnhGWBZzqBWzMaCBsVgyJSG?=
 =?us-ascii?q?Q+OOh/JZiM1OwIHCwEBAwmKagEB?=
IronPort-Data: A9a23:LmmiRq/Cig3x7dYCTlaUDrUDmn6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zYWW2+AP6vYYzHyftsladu18ENVvcXcndBiSgU/qnpEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEzmB4E7rauW8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4ujyyHjEAX9gWIsbTtOs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kMJ8pC5uRqW1pst
 rsVLDwGbTSTnsa5lefTpulE3qzPLeHxN48Z/3pn1zycVLAtQIvIROPB4towMDUY358VW62BI
 ZtCL2MyNnwsYDUXUrsTIJU+mu60h2T8WzZZs1mS46Ew5gA/ySQqieS3bIqII4DiqcN9n2y0i
 G3N8nXCCCoBafO+lD+9o2C3ibqa9c/8cNlPTOLjrKECbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIwa3O7kPAQGMFVTVGLtchsafaWADGy
 HezhZSzGT5y6oa3CjWQ8rufrheiIAwaeDpqiTA/cSMJ5NzqoYcWhx3JT8p+HKPdsjETMW+rq
 9xthHZl74j/nfI2O7OHEUcrag9AS7DTRQIzow7QRG/gt0VyZZWuYMqj7l2zARd8wGSxEAfpU
 JsswpT2AAUy4Xelz3blrAIlR+rB2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RCJ4V0JvsMJYSD0Ncebhr5d7ex3k8AM8vy4CZjpgiZmO8kZmPKvpXs3PBXBhQgBbmB3wf9jZ
 f93jvpA/V5BVPw4l2DpLwvs+bQq3Ss5jXjCXoz2yg/v0LyVIhaopUQtbjOzghQCxPrc+m39q
 o8HX+PTkkk3eLOlOEH/r9VMRW3m2FBmX/gaXeQNKL7aSuencUl8Y8LsLUQJIdM4wPgKyLaUo
 hlQmCZwkTLCuJEOEi3SAlgLVV8ldc8XQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:sewi5qgrHSA7JYwBQOqCddzdjXBQXskji2hC6mlwRA09TyX+rb
 HMoB1173DJYVoqMk3I+urhBED/ex3hHPdOiOF7AV7IZmXbUQWTQb2KlbGC/9UlcBeOk9K0Es
 xbAspDNOE=
X-Talos-CUID: =?us-ascii?q?9a23=3AotOPAmvITkMH1VqgQpXej11t6IsfaDqH0HXNeXS?=
 =?us-ascii?q?aSiFkTLGeSnuA4Ydrxp8=3D?=
X-Talos-MUID: 9a23:A8LDXQlPafBoDLPqRM9sdnpjHutG7K+jGXsHqo5blOjZMBQhKSyS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.09,202,1716249600"; 
   d="scan'208";a="314248514"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by alln-iport-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 11:00:51 +0000
Received: from sjc-ads-3960.cisco.com (sjc-ads-3960.cisco.com [171.68.251.157])
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 46CB0p0K015142
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 11:00:51 GMT
From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: remove paths to sysroot from configargs.h and checksum-options for gcc-cross-canadian
Date: Fri, 12 Jul 2024 04:00:50 -0700
Message-Id: <20240712110050.2211164-1-ohnatiuk@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.251.157, sjc-ads-3960.cisco.com
X-Outbound-Node: rcdn-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 11:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201819

Copy fixes for gcc-cross (84a78f46d594 and 0ead8cbdfb96) to gcc-cross-canadian.
This will improve (but not fix) reproducibility of gcc-cross-canadian.

Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 7c4233c21157..127f97473f91 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -64,6 +64,20 @@ do_configure () {
 }
 
 do_compile () {
+	# Prevent native/host sysroot path from being used in configargs.h header,
+	# as it will be rewritten when used by other sysroots preventing support
+	# for gcc plugins
+	oe_runmake configure-gcc
+	sed -i 's@${STAGING_DIR_TARGET}@/host@g' ${B}/gcc/configargs.h
+	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/configargs.h
+
+	# Prevent sysroot/workdir paths from being used in checksum-options.
+	# checksum-options is used to generate a checksum which is embedded into
+	# the output binary.
+	oe_runmake TARGET-gcc=checksum-options all-gcc
+	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
+	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/checksum-options
+
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
 }
-- 
2.35.6


