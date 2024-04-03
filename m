Return-Path: <omatiush@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F385CD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 08:54:06 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web10.6690.1712134440564758641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 01:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=ikjMwddf;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: omatiush@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1171; q=dns/txt; s=iport;
  t=1712134440; x=1713344040;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OJVvK92o9oNwecJT38lCYJ+XjZ/YADm8ScSKpHiQETg=;
  b=ikjMwddf8ATdjCOgsK/5OyhvHfe5NDEKO2YVmAVZa4uyAgQxtfsCDg5P
   oOpox1la29wsbGpuGO17Y6m+SnaWinbPmZnjXrPCkWX0d9uOoM53Ply8P
   dVOL4x9JTOloQxUFxHVjReS8VVar7RqO9Lb6Fnbbt0D6IvX1LdncX0m2q
   o=;
X-CSE-ConnectionGUID: Qgcq2Hs/T1+KdE4Zfjlt/w==
X-CSE-MsgGUID: q/sVWdc1T+aiiZcdM5EKxQ==
X-IPAS-Result: =?us-ascii?q?A0AyAQC1GA1mmIYNJK1agliEFUFIlBqOFZIXgSUDVg8BA?=
 =?us-ascii?q?QEPRAQBAY0PAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEGAQEFAQEBAgEHBRQBA?=
 =?us-ascii?q?QEBAQEBAR4ZBQ4QJ4V6hxIBghaDAIJgAgGxWoIsgQGEeK46gWqBSIx7hWEnG?=
 =?us-ascii?q?4FJRIQHdoQKgQaFdgSfYkqBIwNdMBEBZxsmChkqHxkYCTwPDBoCGxQNJCMCL?=
 =?us-ascii?q?D4DCQoQAhYDHRQEMBEJCyYDKgY2AhIMBgYGXCAWCQQjAwgEA1ADIHARAwQaB?=
 =?us-ascii?q?AsHdoM9BBNEAxCBMooagz+CIIESgyZOgVJtAwkDBwVJQAMLGA1IESw1FBsGI?=
 =?us-ascii?q?h9vB58VgQ6BR2LGMoQdoSsaM6oymGKkIoRjgWQ6gVtNIxWDIlIZD445pCVDN?=
 =?us-ascii?q?TsCBwsBAQMJiG6BegEB?=
IronPort-Data: A9a23:K2QOCq/eurVlFabh/PMMDrUDiH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WtJDG6POq2PYWunctx3atyxoxsH7MDQxtRrSlBr/y1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEzmE4E/ra+C9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4utyyHjEAX9gWIsbjpPs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dgJtb
 7+epF0R1jqxEyYFUrtJoJ6iGqE5auK60Ty1t5Zjc/PKbi6uCcAF+v1T2PI0MS+7gtgS9jx74
 I0lWZeYEW/FMkBQ8QgQe0EwLs1wAUFJ0IbIKmHlkdfU8xSFUHfBn8dgDkUqepJNr46bAUkWn
 RAZADkJahbGjOWszffiEK9nh98oK4/gO4Z3VnNIlG6CS614B8mYBfyRube03x9o7ixKNfHbb
 tYYdCFvRB/BeBZIfFwQDfrSmc/y2iKhKGMG+AL9Sawf+i/I8jN92+HRc9PUe+6BSeAIs2WIn
 zeTl4j+KkpHbIPEk2XtHmiXrujXkCX2XYgfGLG1+rthh0ee7mgSEwENE1yjrP+0j0SzV95SJ
 woT4CVGkEQp3EWvSt+4VBqirTvd5FgXWsFbFKsx7wTlJrfoDxixP2cPV2Rhc5sa7YwVSRF25
 FGLm8+uGmk62FGKck61+rCRpDK0HCEaK24eeCMJJTfpBfG9+enfaTqRFL5e/L6JszHjJd3nL
 9m3QMUWjrEXi4sA0L+2uAmdxTmtvZPOCAUy4207v15JDCsnO+ZJhKTxtTA3CMqsyq7CEDFtW
 1BfxKCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6ItkKuGwgfxkwb59YEdMMX
 KM1kV4BjHO0FCb7BZKbn6rhYyjX5fG5SoS7DKy8giRmO8cpLWdrAx2ClWbLgjiyyxJz+U3OE
 Zyaas2rRW0LErhqySH+RuEWl9cWKtMWmwvuqWTA503/i9K2PSfNIZ9caQfmRr5itsus/l6Km
 +uzwuPXkX2zpsWkPHmOmWPSRHhXRUUG6Wfe8pYILLfbeVI/SQnMyZb5mNscRmCspIwN/s+gw
 513chQwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:o6kqCqi1r2EEwefdtMpphJegFnBQXskji2hC6mlwRA09TyX+rb
 HMoB1173DJYVoqMk3I+urhBED/ex3hHPdOiOF7AV7IZmXbUQWTQb2KlbGC/9UlcBeOk9K0Es
 xbAspDNOE=
X-Talos-CUID: 9a23:abHxc2OzEr/i4e5DYSZs7RQ0AYcZKz7+wFqMEUG6DXouV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AxJCVKg0GKwEp1HOZwk/DZlUoRTUj+uO1Nn8Bmsw?=
 =?us-ascii?q?6+MCFNB57NxLAoRene9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.07,177,1708387200"; 
   d="scan'208";a="243636688"
Received: from alln-core-12.cisco.com ([173.36.13.134])
  by alln-iport-8.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 08:53:48 +0000
Received: from sjc-ads-4348.cisco.com (sjc-ads-4348.cisco.com [171.70.55.119])
	by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTP id 4338rlrv031766
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Apr 2024 08:53:48 GMT
From: Oleh Matiusha <omatiush@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] bash: improve reproducibility
Date: Wed,  3 Apr 2024 08:53:47 +0000
Message-Id: <20240403085347.1041034-1-omatiush@cisco.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.55.119, sjc-ads-4348.cisco.com
X-Outbound-Node: alln-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 08:54:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197912

nativesdk-bash package contains host references in output packages.
remove them.

Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
---
v2
 - moved common code to separate function
---
---
 meta/recipes-extended/bash/bash.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 7832ad052b..e541161c75 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -74,7 +74,8 @@ do_install:append () {
 		mv ${D}${bindir}/bash ${D}${base_bindir}
 	fi
 }
-do_install:append:class-target () {
+
+fix_absolute_paths () {
 	# Clean buildhost references in bashbug
 	sed -i -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
 		-e "s,-I${WORKDIR}/\S* ,,g" \
@@ -93,6 +94,14 @@ do_install:append:class-target () {
 		${D}${libdir}/bash/Makefile.inc
 }
 
+do_install:append:class-target () {
+	fix_absolute_paths
+}
+
+do_install:append:class-nativesdk () {
+	fix_absolute_paths
+}
+
 do_install_ptest () {
 	make INSTALL_TEST_DIR=${D}${PTEST_PATH}/tests install-test
 	cp ${B}/Makefile ${D}${PTEST_PATH}
-- 
2.33.0


