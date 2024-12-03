Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E122E6C5FE
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 04:51:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12385.1733201487817300404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 20:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20671066c5=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B33r3qY005981
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Dec 2024 20:51:27 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7tmj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 20:51:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irHjuxhiVwwhTxUzyUCn/RPwUPYPJvTUKYSHWWl0uWH7x4YLgmzkMnzhSjNqoUk3gtA67P4R3BUcewyhwOjdeIArUegMixyTzGPuuZMw/VkLZREQvdhfG71Qq26+M1p20gDJKs4apM5MyoV0TiRRyu65XzVknNSpRR7eJhsG33lbHbtp5H8sVZLu3zzMpHwRpKtZq8+301dbAqLPzx9ZBTUPxsLbVtZUabqSNRpKhpe7WQ8lrUpzLEvp5r/i4zfte4pSGoSSXVRsjIx5FwFsG1KmY+S3ArPZt3UXbfyY40dn9+8iWrfqVUoNMLWtP0H3HnQk/BQk1e9g/xvlhGJFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViChlDwfxWZKLyqDqhtBATdsf+HkYo2iNoniY1yVcYc=;
 b=SqNRvePgk2ouAXafN9ldK+C3e0cmu6vBUepd5rTzNjvZAHk/HIThSMYKuzLKb2RY3Z/UnlNi5BvrzC3jTY10blTGjB7BSIH0kx2r8TmyXiRrue1t5OwhBNULmfACiebuK1+O78FDmxYx1oKK0znFQ/L+GQxlM2fmEV1fwbF0hUobKXPjK2kF9NAbw/RwtASiwEQ1nhO9d1OE95i8V0zt2+nhx1iBbQM+YKrEwoRBCGMYsbmSULOxMZ0CjKnhPauCM6w0KxSLRHMAiFPMSqsR3YkA3kk9NF9N2IETOs2tRo9IpQP6tUsgPOIQklkE1XDA+dTPcaDpKKJdM2F2bDgbIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB4783.namprd11.prod.outlook.com (2603:10b6:a03:2af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 04:51:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 04:51:24 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] meta/lib: move buildstats.py and rootfspostcommands.py into oe
Date: Tue,  3 Dec 2024 12:51:07 +0800
Message-Id: <20241203045107.3288584-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0043.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB4783:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f10a0ee-bf75-406f-6a22-08dd13562387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j2dq2x7QF5ygzKPC9nP2bS7D0eFwuZ0bj+v1dIhpFRX8bxujX8GrdEU9FJn+?=
 =?us-ascii?Q?GLtMivwV2WBmZwrXeDGKBNug02AZncAymcm5kPxThxuY4EE1rv8t/gBxsEsu?=
 =?us-ascii?Q?4iIfT5hbl7JTr1cB0jS8GpUMdKxJDG+kUVwisFWxyWFpvKN6wlLaKyjyJDSG?=
 =?us-ascii?Q?fZZfBNtf7kY86S6HHAeVek/AeZS2IPNXcqhJgblLD8MhLCi89hTcfQ4GX3le?=
 =?us-ascii?Q?sFMMSBkkH9JG1P/RKQDRwq/OdzQn/8jbieuL42brNbXudJLqCM8ozgFgXgj7?=
 =?us-ascii?Q?4d9zjhwW+J4tNfo4O8ve6GyLl9QgwHz5t8x6JH/T3hMZQdqclwhHFk0PKEG4?=
 =?us-ascii?Q?GQZeIOLlLHRbkvAEzsH/Lc2NCY+khvVA5TwJf5k/XEjvVbS4psN3iMmiesEj?=
 =?us-ascii?Q?Gc98KPKLGRS5vifZkbRTP7N9BK1o+wqwzebspv/5yBoqD51+IonzMwmCenH3?=
 =?us-ascii?Q?OUSXzCSeReIn4VqnwxUo7ETXGHghzgr/BlHy1ETwtGLXMRXaDwpbFK2zVPSM?=
 =?us-ascii?Q?q0llbfE35ZLm9fl0qP7/GFiq9T2MKIX0uHJR8QB8Fdj3KdngCZIyBd2ejKP1?=
 =?us-ascii?Q?/aS9zS8juziN/4VyD24MU3YzkZvVwsCGpoT2U+pbNWUPaq2PKWvtDu3Uid34?=
 =?us-ascii?Q?FyK+Z27EKvlDcLVitNq0zVrrcpgxOcijhWMR9bP1BdtM97Kt6PRgQVLFSTmq?=
 =?us-ascii?Q?PhzAvvLqli5XUtnd+VWT8QEAbDSlRtS3U8UzT1+tNJWu+qpadc/35MVZijyP?=
 =?us-ascii?Q?I9RLS7DrCL7tUc+kxLGtBuBILRovUugXb8gGo/7+fgL4AZZZHEy974+1CWwJ?=
 =?us-ascii?Q?7qRpQT+ZD+iQyX/wf5WFMIrvzvJ7O24WUL2foly51n1121+qpfeW1EwdEh59?=
 =?us-ascii?Q?9NckcLCHtLETONVrIr81CJIcvTOI1NZd1yZV7NfDxx6VsaZYjNhiVQvEso6V?=
 =?us-ascii?Q?r6Gc3ZTfoac1I/OQy5Ky+LuhI6W25hMziHNVu4L6z0/ZIdZH0LM4ylO8ZB24?=
 =?us-ascii?Q?2GnTZMN/yDlSWrSHesJOQnRtYKL4Gyv/AcwKie6S6N8wyvYcVd6M3urSEDq+?=
 =?us-ascii?Q?yGVc3mSsuW0XGX1tGWRCAG9B0loLMV40CewFAAmRglpiBlbxHZL0DaRKnZFP?=
 =?us-ascii?Q?Tk0FpEgioHgNkpJO7BFfZf7ZVWSw6vgLvjlMfkglZSiejV2WOtScvZ+i+QLE?=
 =?us-ascii?Q?HO1T6IETLsFgV3wBtwW7gYalV/UuODR1ic9cA2YKfRgTB5TKOI3+t9D3gUBL?=
 =?us-ascii?Q?dfp9q9dhso3EXlN6RoVf7rEdIihim4Pxe6xwT67tnxr7xv/Tzqe6lZxhYn1x?=
 =?us-ascii?Q?J9EYsVLK9SSmQVWGzjkT+yt6WYX028KiEN3CLYHFwkRPsvIM5GZ2epNkwjgF?=
 =?us-ascii?Q?8cUtRRd4H82B2eZIaeAYXTw2NY1lX05ppAXU5Q0Xoaehwvs9mg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zNsvf0de8VnXczlWskpHPrQ/7hs3pkyLcQVoDprLrY8sp0D5/s8BE57OBf3A?=
 =?us-ascii?Q?ivlMrhHXQSgt0GukAeEHqUZKZb5kB1ZAFvXr3G9ZDG0E1JwhoPuJH7wTeFYO?=
 =?us-ascii?Q?pqWsIz7YqFLUi2HUZLO5/hCnyti87B+Obsuzu2F1XYoFjDLMnSuSt9ZiC22e?=
 =?us-ascii?Q?elNUecLxNgjGYhqmBya8rlKH63qZCnIJ9PRGIeQDonBpbZd6n0b9+eSqAFg+?=
 =?us-ascii?Q?MYOq4pVrGCtpqBdXCy9vKnn2pMIAbyLiPIKSg91tHUhKU02SeyfBc59lX7dW?=
 =?us-ascii?Q?1QBc5RROv4/gIjBR+br/ba3+JI+j3KNGJVt9PAZkwgjbkJ4Miv/cqlGDTkgA?=
 =?us-ascii?Q?W5jHsbl35wgEp+PUGlaQhQcMmTWSKXI7zp8Q1g4H6vDvV3pWcGBOxrwsROvw?=
 =?us-ascii?Q?YOrDtcQPQ4XQdWcHVsjy+397CiY1IH26FvaS3XIAUFECvgi2CbLzeuI9/lgN?=
 =?us-ascii?Q?G+pavuV2WosPP4YYl5/+ZmI9dLtXEVIa4SI1XcL+/W9VXuukOmMxdEP+UiMK?=
 =?us-ascii?Q?xQcA4gfM+i3jyWmIdKK+YvWi7NLOA+n53m4MBPL893wR11VWrmbHEoIwfDSt?=
 =?us-ascii?Q?nimvWHj7yCxGT76GJi6evRjhfpfKH03RlkbyIXPyqY9qmNjZeoSAlNPCE4rQ?=
 =?us-ascii?Q?lhl0IEwOQmZq/Molg70w0cyXuKxEwDluTfoig6/wuHKlcxCEi1pa9Y6BZHpD?=
 =?us-ascii?Q?wIm5SYGMt+L6siEPzY4tf7uuz2dLWrtqxrd15f4g0dkX4tXprHirA9xBSYLa?=
 =?us-ascii?Q?+uvqEfhWh7DLBYhnI/HpnXZ9h2GLmzwkLEyMuGbe+xtjAemif9dDkCObumYD?=
 =?us-ascii?Q?XS7K9JJvGfeG7iyzofb1FcRJl9nOQTVECD3qdAqAjmvG34FTsWiU0U/XA9+V?=
 =?us-ascii?Q?bDg9JNOQ4tzgzvu86j3+eBIu+jw+dF3XlYFBMaOtYJNecGis5DCbQKPMh9oS?=
 =?us-ascii?Q?lpb0+y2kirqMGMQEGp+19KAbYWFMVcEwKmX6gHF4Ua+oHVk04LeRSzu+FUMn?=
 =?us-ascii?Q?ciMfit2Cppl6E2npe7L/0sEWVvovVenzCILwbXtgJ1qDVdCTbTy1kybTom4X?=
 =?us-ascii?Q?qoaMM6b0XZedv/UsKPDN3yIpyfV7Pl2LBWytkOASBToN7APpZu4XcK+6K2kf?=
 =?us-ascii?Q?VWEtcwDkovMetc/lHLqSMhRMSaHDQ8VizpDXdvLRRHnoCkkN+EJDy12th1VG?=
 =?us-ascii?Q?Zp4ZU6uq7aE3yqyK9ojZVTyuYnof5eAhrgRvvqSuicfZrMrYnTyOgepMfg24?=
 =?us-ascii?Q?dxMlnFgsvBy5iLuIPfbXDegp6zScjDOMa8HPZ1iiaZmvM2AEENFyY4D2YfPL?=
 =?us-ascii?Q?UJ03BTqgFNWrU8OaepJKuHdZhclRpYyOorpzTCAKKz3rYzu7z+rIyFDi8SUc?=
 =?us-ascii?Q?L4pNjCPhVN5ycNNllR4KIf3XyGJ63Ug/9yEU1oEyo4vGkq1WNUl21MEWFCVF?=
 =?us-ascii?Q?6V1KD9CsqGwYSXyGeKpZFEEqlAXyZJTQzLxSmAs+LSdiYUGNxQ+IH1kBgxEx?=
 =?us-ascii?Q?tT0o3F2q/SyIjyu52IMMcNwMPcDwVO47NbWIx28NDeXcLLEvSz4Znzct4qdf?=
 =?us-ascii?Q?yukTPR6mgy0yfMn9CbDRFTayPJZ6ZLCel6q76j83?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f10a0ee-bf75-406f-6a22-08dd13562387
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 04:51:24.2793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxkB2Enigwuv0KP639RWT2wAO9HmIA92RFESFfVtySRCjTymEwhqCZpHb+hWzOeOm66SZhCAPCm9TsZ+44zvBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4783
X-Proofpoint-GUID: AgKEV8Im2FMVNu_E6OdpH7SnPZR1rax2
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=674e8e4f cx=c_pps a=XlWNgFwcAB8XWrBhwjv7Vg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=UXqmzmZr725mQlld4dAA:9 a=lW7eM36Nki8unYNC:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: AgKEV8Im2FMVNu_E6OdpH7SnPZR1rax2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412030039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 04:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208177

From: Chen Qi <Qi.Chen@windriver.com>

These two files are the only ones that are not in left in meta/lib.
They logically belong to meta/lie/oe, so move them there.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-global/buildstats.bbclass          | 4 ++--
 meta/classes-recipe/rootfs-postcommands.bbclass | 8 ++++----
 meta/lib/{ => oe}/buildstats.py                 | 0
 meta/lib/{ => oe}/rootfspostcommands.py         | 0
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/lib/{ => oe}/buildstats.py (100%)
 rename meta/lib/{ => oe}/rootfspostcommands.py (100%)

diff --git a/meta/classes-global/buildstats.bbclass b/meta/classes-global/buildstats.bbclass
index f49a67aa4f..8a50bede5f 100644
--- a/meta/classes-global/buildstats.bbclass
+++ b/meta/classes-global/buildstats.bbclass
@@ -276,7 +276,7 @@ addhandler run_buildstats
 run_buildstats[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.event.HeartbeatEvent bb.build.TaskStarted bb.build.TaskSucceeded bb.build.TaskFailed"
 
 python runqueue_stats () {
-    import buildstats
+    import oe.buildstats
     from bb import event, runqueue
     # We should not record any samples before the first task has started,
     # because that's the first activity shown in the process chart.
@@ -286,7 +286,7 @@ python runqueue_stats () {
     # closed when the build is done.
     system_stats = d.getVar('_buildstats_system_stats', False)
     if not system_stats and isinstance(e, (bb.runqueue.sceneQueueTaskStarted, bb.runqueue.runQueueTaskStarted)):
-        system_stats = buildstats.SystemStats(d)
+        system_stats = oe.buildstats.SystemStats(d)
         d.setVar('_buildstats_system_stats', system_stats)
     if system_stats:
         # Ensure that we sample at important events.
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 50e77dca76..70ad3670d7 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -308,19 +308,19 @@ serial_autologin_root () {
 }
 
 python tidy_shadowutils_files () {
-    import rootfspostcommands
-    rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
+    import oe.rootfspostcommands
+    oe.rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
 }
 
 python sort_passwd () {
     """
     Deprecated in the favour of tidy_shadowutils_files.
     """
-    import rootfspostcommands
+    import oe.rootfspostcommands
     bb.warn('[sort_passwd] You are using a deprecated function for '
         'SORT_PASSWD_POSTPROCESS_COMMAND. The default one is now called '
         '"tidy_shadowutils_files".')
-    rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
+    oe.rootfspostcommands.tidy_shadowutils_files(d.expand('${IMAGE_ROOTFS}${sysconfdir}'))
 }
 
 #
diff --git a/meta/lib/buildstats.py b/meta/lib/oe/buildstats.py
similarity index 100%
rename from meta/lib/buildstats.py
rename to meta/lib/oe/buildstats.py
diff --git a/meta/lib/rootfspostcommands.py b/meta/lib/oe/rootfspostcommands.py
similarity index 100%
rename from meta/lib/rootfspostcommands.py
rename to meta/lib/oe/rootfspostcommands.py
-- 
2.34.1


