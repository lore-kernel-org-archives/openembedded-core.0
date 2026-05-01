Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD7FCCFA13
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 18:36:41 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1414.1777660591021224462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 11:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=MUgMSSvg;
 spf=pass (domain: prevas.dk, ip: 40.107.159.32, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLqM7tRSBaHZCDgGHYg2noWDcFtaq6Y+nVWt7dgRt5Z7lyu5IGJBXRGKXMi87C3tPMqPIEIKMb6Im9REzX1zAQ4qqt5Fc991nvv+94EzvdU5I38i5WSemBU4ViPd6JVKNvjb01+ePcpWwGI0AsuXzdV45tkGD6+aOUeK0yaUOUX1YIPvTpo4PfhPau7gTT59AjsS3daeA++kNm7sNDlx7Yt/VSLrjQ78S7riLpqmAg0L+HSDvsn3K4lzCi3YrGK2Y8ILtl+j+IJaw7sdg6i1qtpUeWo7EviplrbkvfA4/210FeCP7SWRS/x9gNjpWHkDaWWbEKKo5hJiXHnODeSjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFj9PSZWEROVBRrDFIA8lBbLqVpMq3eLflaFOIkMjPg=;
 b=gE8TCUQky0ZLLWHnsvOVvy2yDKp3p3Lg4VGZKObLBWUDcFko8WQTqnbeCqZTgaB2sGpdQZbtnljITxb2srxKhjWoFSt0JpiYNJz1XllCPCcTAxi4pgIQr3zNnBK0g8E8pPh0Lhn5LoqcaQUmCJMmR1mCeTPZMY7ED3Z4z6lTp/dyTftLcOFH/nq3ADaxFnsRMnyfZByool11sx4OSilz5h4tA58rDXW/gMCMFYPo4BpZefGtj7LT2OSCmcIqMsgDOZbHOpjI9iiFFoz+FhzCWHv7eC4+Uym0soFxQtLAghDRZY0U2NzIfuPn45CfhwLAW+1D4JO4aKbkfq41cNr1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFj9PSZWEROVBRrDFIA8lBbLqVpMq3eLflaFOIkMjPg=;
 b=MUgMSSvg+71FfmNyVpup8BtB0fmihwPIdgokS9gDvJSHkTd6aDSZCQ96dshkCEM8nbVsRgFLAKud6cloqWCB5MtKBg74uWR3fDqtF9T7gkt0iYpHTDOmmYdm8PpETUQyBsx4L6aYizK3WF35sCbv5IWHRRBvfHxPov3Ta/olkLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by GV1PR10MB6707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 18:36:22 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%6]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 18:36:22 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: chbs@prevas.dk,
	emkan@prevas.dk,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [RFC PATCH] license.bbclass: only create hardlinks within $TMPDIR
Date: Fri,  1 May 2026 20:36:15 +0200
Message-ID: <20260501183615.2728124-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CPAP307CA0006.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::14) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|GV1PR10MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 837a8d5b-f089-48af-371a-08dea7b08af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	uj+BHilUBKptnRUv+k5BPdjEHwPLuW7T/VngtR06Z7fgs52Yy208OejUsyvb0n02YWLxl2CCV79v2TyuYZVPhzEnRv5fzHH2tnb/Bx7BnW2LomIdZ6K1HN1s14Jq8EPpdDdHFpQcSEq2MewoKVTEXG/L5uVtwCsYJnFG0PJ9ouRDAW9Ps9u6BiCUXkEGSpeD9aN0Z/J7mR/bRXWbNu4+oRC/EqkPfndvN+aJwls9w3h3UDwPFToKBJQ8XdOdUnw6yb2foCzFIgGClVIDmGVO0OgvStFwiWVWerayWwrVrEMdHIlR2xucn5+Swt5vd4ZfwlKLBiS2Psp3YVimnjk8cZRbde9MDTio4w8WAODGAqMooJcYzH46ng+U54N1JduKaRdZ/h2kNKnlNULOrAJJYkVAserXHNYHC09onLfCwEsnmJY/kjpwkQVCRRo1VgtYl9p6JUktRpJmWSI320vpq1vq536xg+FOHfrsZ5yTGO4FKM9SLYhVd3+oUFSmx7WunMqiz3y4QaweH0uFh0kFd81ZUSJJyJF8Us2ec+G30SUszvp1UGe6pJ74iqConIulotIi0Z5n6KkBL7V4vCcy8bxwCTblYBP3QWwXckpoJP9SDKGBJ22YTT7IPjicj7A4T8w3Rfx5Pe53Dy4SKWHWVbqXPbv3HUZ5a+NTLUVPwa0PVfuvPn1R7eSDxi5Uw/KMCveCjkzoSX66V5X3loRggw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mH3WBNuVspiseK3GO6enmW35PXu9HHtCqOJ98rPASKoC5S2IjPLeIyEh22Wz?=
 =?us-ascii?Q?61n7OIa3dI9H78EPHr515wl01fLqvo7F0pgI9F61NfzwdakeDD+L1Uu6DWTg?=
 =?us-ascii?Q?VkcUTXpGdV6FAPQ1zhnCOha0s9hUwS4NOrJ08pE90wdzq+GXaP6/6lajzXXM?=
 =?us-ascii?Q?L0DRdKOyRpdm/Gq3p5kHUKiUAcIoJYGxVK/o3Ze9ojgZL8EgrjXS+fdKWRyB?=
 =?us-ascii?Q?pGGVeIyYpXOijvRoaf4+ZRoFxR1d70Udt8M0cPEs2B6Y9nLzvXdyqSOAqmGV?=
 =?us-ascii?Q?SqKI4tMJCBD3EdqIAa2CfdbTYSjS74WFwj+vh5we2+98x2zVrrZFjzU0ln1h?=
 =?us-ascii?Q?uWh+NzOQ46IxTccnPhKia7p3zCq/wR6/vaoM9y0M+9Dq/DYVNy18bwCUYLxy?=
 =?us-ascii?Q?64g7Kd97VZWT8e347Z4lACDQXfZ63FDoeU/BvUuoVbHfZLSrP6VUlBSTF8np?=
 =?us-ascii?Q?Z8A3fxKFO5qKFPypW3UnvSIUnZqGwT8rt7iI3O5Pprcc7vThqxwLObM90p6I?=
 =?us-ascii?Q?SkdWkGreAtf6yC7lGTtSRHyLrcylIkYwY5qR2vl3+4fjbek5llSUxAqt4jhW?=
 =?us-ascii?Q?BIS1ka3AimEBlcNFoKToiA9nCgWIamz+cXVchEBr95Xk0RG1jRfuDxJiDHad?=
 =?us-ascii?Q?3JVbWVUoSAp78CpKsA0l++AeoZnI76rX4P3lvlK7Cjj62K/Zi7LhspMltjDI?=
 =?us-ascii?Q?gw7ivv5ERLyLoSsWjguIQNIUWa2SnazMQUeNasKcMA7UV1i+8f7ti6FGKFqp?=
 =?us-ascii?Q?4ZZ+pehNr4vhvRzK/NGkPjHLeZijiSxkxa8AbikmAiSPeihQhC7sQK/XHa2o?=
 =?us-ascii?Q?e3mKGu/VUtj5yXXimQ4jIdY4h/xYY1uiqE9GX1Bjq/ETDdFhRv7l5ZiHTctb?=
 =?us-ascii?Q?/LRX75ne5xerhV2+yCBZu6a250EH/zEuLs8EiYxp+JmcJ8fXUKJ4hh4vA329?=
 =?us-ascii?Q?EbtLUtvJQcr5iCnv1jewEtWuh8zRHoIY630ZWXmhlLnDYtooU1FtaiKZG1KT?=
 =?us-ascii?Q?c+x4JOmXBR4+a1rAEb6AQR3NPFQsqWdEcagtpDI2OPuE9Q0p4V5i3Tc3+59f?=
 =?us-ascii?Q?c0ti4Z9De6msDUP0TtKlIZh0kuBqWm2VVm9W2leTDlboH+OLgel5/BNT2GRb?=
 =?us-ascii?Q?3+7xLY+mUEbRhlc+lyC4mpm6LbVMoCNMpf3+0XRHWUgKeCup+m3giJalrG8f?=
 =?us-ascii?Q?oLaYxqsqXW/aoj1EZYitJI95okXpjPxetxwfTkpc7/YeyPMzC4vKAoYLMU7A?=
 =?us-ascii?Q?sOa99Gwp/dFcvhwkAQ7tJemN8Gf/9GIwB2mUE6HrmFoU4QwaC+8WaYx7aHB1?=
 =?us-ascii?Q?Jxx3kHNRPLgy1KL82kREV9izmjLx0lPlN7iC51MWkTEHzXS+2mdQKKKe0E/p?=
 =?us-ascii?Q?xtAUsSERSu76Me80taDZxcYj620BR03ZtgGpXkKdJquGlmtPYKrTa2jpsRHY?=
 =?us-ascii?Q?69uf2VVJWFmVf/J0MQ0hrQmlqpnALK5x9o4ZE1eq+L3ikImrrZZuOXk2awFR?=
 =?us-ascii?Q?Z8ebtSChHjruW4XDbUvD4qA9lj0cz/2kSJTDop5mn3guMLz4iEDRgfRW2/Tb?=
 =?us-ascii?Q?YRyH/LhDJumpDkUR+ZiYlrKXBPnDBvl/zkbuCGSd/MTDm9v2z/o6GQkqpX7W?=
 =?us-ascii?Q?0v+TUlINI23lgFjfPfRi0TiyL2X47yuQl9S+BQFvx4G5srQXY+sRyk7Jr2jc?=
 =?us-ascii?Q?OL7CmcFHg1MHDe9GZ+3WIsBi2/L7dIURNl9pCEIhJGoYQrVhHL1Ofxc2RP0L?=
 =?us-ascii?Q?b8qdmq2lSeZzsj62907a0CPf1H5S4zs=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 837a8d5b-f089-48af-371a-08dea7b08af5
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 18:36:22.2229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3y/KdQkuzc2JRwKiNSWW/sbtY0Mm72i5jWBovgXXS8cMjd4/FLVtj7qNAaH0Z41yqhFwQ2mOQsP3QGuVtolG82bX1oSOm6QTdADZMjri+wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6707
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 18:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236303

From: Rasmus Villemoes <ravi@prevas.dk>

This is _not_ meant to be applied, but merely acts as a place to start
a discussion.

In our CI setup (which is gitlab-based, but I'm not sure that's too
relevant), we sometimes see spurious errors like

  touch: setting times of '[...]/rootfs/usr/share/common-licenses/go2rtc/CO=
PYING.MIT': Operation not permitted

Often, the error disappears when the job is re-run, which I don't
really claim to understand. But digging into this, it seems that it is
related to the use of hard-linking from common-licenses dir in the
oe-core repository and into the build directory (and then later steps
create further hard links).

While the test done here for whether a hard link can be made is mostly
correct (assuming the the sysctl protected_hardlinks is 1 as it is in
most distros), those are not the same requirements needed for a
subsequent utimensat(2) system call to be applied - that essentially
requires one to be the owner of the file, not merely having write
access.

We are not the only ones to have observed these spurious failures:
https://stackoverflow.com/questions/77926112/yocto-gitlab-ci-job-sometimes-=
causes-touch-to-give-operation-not-permitted

But apart from these concrete failures, at a higher level it seems
wrong for a build to cause the mtime property of files in the layer
directories to change, and it seems even more wrong considering that
if one of those files are rewritten (via open(O_TRUNC)+write(), not
via "write new file and rename on top"), that affects what is already
in build directories. Also, one could imagine two parallel builds
using the same layer directories as source, but with different values
for the REPRODUCIBLE_TIMESTAMP_ROOTFS, which would result in rather
random end results since both builds modify the mtimes of the same
inodes.

I do understand that using hard links is quite valuable for saving
time and space (I see GPL-2.0-only having 135 links, so that alone is
a few MB), which is why I don't think this should be applied as-is.

Could we do something like create a $TMPDIR/license-pool/, and
whenever encountering a src not inside TMPDIR, copy that file to
$TMPDIR/license-pool/<basename>-<sha256 of source> [if it doesn't
already exist], and then use the latter as src in the subsequent "can
we hardlink" logic? That would then also improve the case where the
meta-layers are (bind)mounted R/O, and we thus always end up copying.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/classes-global/license.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/lice=
nse.bbclass
index af5f1ed41d..61049d76fe 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -36,7 +36,7 @@ python do_populate_lic() {
=20
     # The base directory we wrangle licenses to
     destdir =3D os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('LICENSE_D=
EPLOY_PATHCOMPONENT'), d.getVar('PN'))
-    copy_license_files(lic_files_paths, destdir)
+    copy_license_files(lic_files_paths, destdir, d)
     info =3D get_recipe_info(d)
     with open(os.path.join(destdir, "recipeinfo"), "w") as f:
         for key in sorted(info.keys()):
@@ -52,7 +52,7 @@ python perform_packagecopy:prepend () {
=20
         # LICENSE_FILES_DIRECTORY starts with '/' so os.path.join cannot b=
e used to join D and LICENSE_FILES_DIRECTORY
         destdir =3D d.getVar('D') + os.path.join(d.getVar('LICENSE_FILES_D=
IRECTORY'), d.getVar('PN'))
-        copy_license_files(lic_files_paths, destdir)
+        copy_license_files(lic_files_paths, destdir, d)
         add_package_and_files(d)
 }
 perform_packagecopy[vardeps] +=3D "LICENSE_CREATE_PACKAGE"
@@ -76,10 +76,11 @@ def add_package_and_files(d):
         d.setVar('PACKAGES', "%s %s" % (pn_lic, packages))
         d.setVar('FILES:' + pn_lic, files)
=20
-def copy_license_files(lic_files_paths, destdir):
+def copy_license_files(lic_files_paths, destdir, d):
     import shutil
     import errno
=20
+    tmpdir =3D d.getVar("TMPDIR")
     bb.utils.mkdirhier(destdir)
     for (basename, path, beginline, endline) in lic_files_paths:
         try:
@@ -89,7 +90,7 @@ def copy_license_files(lic_files_paths, destdir):
                 os.remove(dst)
             if os.path.islink(src):
                 src =3D os.path.realpath(src)
-            canlink =3D os.access(src, os.W_OK) and (os.stat(src).st_dev =
=3D=3D os.stat(destdir).st_dev) and beginline is None and endline is None
+            canlink =3D src.startswith(tmpdir) and os.access(src, os.W_OK)=
 and (os.stat(src).st_dev =3D=3D os.stat(destdir).st_dev) and beginline is =
None and endline is None
             if canlink:
                 try:
                     os.link(src, dst)
--=20
2.53.0


