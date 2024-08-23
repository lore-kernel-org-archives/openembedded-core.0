Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDADC5472F
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 01:48:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7355.1724377704380509537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 18:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89658b1c4b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MBhYIr018581
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:23 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6x11n-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEwM6kCVwO5r55TFagkrMKyl2W5nakkj4mR+3N8/bl9EdUaLw4vS+uD9l+fcc6mEs4g4uHtoHz6cEop83af3IV+0OkOe6HFsQubi36LI69pX7RTAnTx1YgvRNSlto5fp4wEgCIH2TKEUMj4guWt++WuAoOXL9pzLdKgDqZonZ7HnBUv3DMFikZnhpfk6s3gcM/e+feelpX5b/bjK3RYkC2kd09Pue4vjfbT9hzfAWysCvpGekDQRCA6bDuefRJoZBsyRsn6iiX4hDyBrTH+aCvS2i+bqU8Iz0dEuVsOKjiR+aWQM+78SS6vh/DQ+kOivHtqNx9K6clpwLFvNTUzzGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gURhjWmb4UeVLCAvavzbi1X5fiW4IDq1/iGZeAUJdo=;
 b=PMJKe48p9qr0P8UgCbFjoBCNYHjRs8lSLtIiP5GhA4d6pUgYLCWTFuXS68vDCddCVzwDNffh0Yt+sJZG31UHJDbCZypV7wbiGJNUGOhG2wcjcb7/TG7X89OxrvbuE3mrRLNz2u6LXE2+7KqTnIsnqrN/b7/KjrW9XlLhtdszIf1Y3HL2WZI0o9HXk9tQ6yLoVvYNeZusxHbdIj4eo0WQ0ted7kWjrYkvFCEeBEB22QsOa0iYPd4go9M2TOKfETLcTPmhtvSwD4fUmvFrcziQx4psphID0jZIqn0GzoKmaGsGaZGkPP9E4n+amvkxvtOLeI51ICbT+3nwyFuhbq2gfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 01:48:22 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:48:22 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH 5/9] rpcbind: 1.2.6 -> 1.2.7
Date: Fri, 23 Aug 2024 09:48:02 +0800
Message-Id: <20240823014806.4154590-6-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240823014806.4154590-1-hongxu.jia@windriver.com>
References: <20240823014806.4154590-1-hongxu.jia@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e203c6-b02a-46c1-57a6-08dcc315ab7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3hUEUidtZ0h/1uJdZxgwvsMnOWZ/lnOfQzqxAUOyfx9bQbol9i8gRQ4d9R2I?=
 =?us-ascii?Q?wVy24Y+1Bg4vmWH/zVZxxUs7hodRjnEBlBRyugSSkbQ9nB9sjyA/+3R2/h9L?=
 =?us-ascii?Q?A1SMVOWFlmSfwCiLjLM7wvHj+YfPIY4eFAuuG3C/yCk2B6lcQEcalYiKpeY+?=
 =?us-ascii?Q?kYdU8KhQCwueljboTU9sfM/uWC0LdHuQtgT2m8RjT3Qd9muyFblMAllvLqfd?=
 =?us-ascii?Q?c+May+4R8Av+G1pRfDn1pgauhA7ydNfLiL9Wwrk3GLF3NdHGp5mkOh9nACAF?=
 =?us-ascii?Q?/CQ1xxL2hVhEF+sRM9vboBIAAc1r31QLWjr/bylRQ2vvsBQ07FMq87IUKOPs?=
 =?us-ascii?Q?epIAOGG7HPi3DVxx2Y4sJQWLyk9pUfLlvRvCXvd9YTxayz4FFhMGBXRx2Rpe?=
 =?us-ascii?Q?J2MWorDvB8OM6tn8YXHT1XVhs08QvS1ThIG9ulLqb4oSYKL5L0aGn1YmO21W?=
 =?us-ascii?Q?+xHDVjIOx4lwrYLSQYbPSTJ6XyAeecQYrhFwaJXuDCb1fAeF6+4cSqi1nYn1?=
 =?us-ascii?Q?FcUhMaLvZZgRuMhnzn7aSAp1vML+MwuUHEmkIqLODWwruxrDmPB4KJv9yxa7?=
 =?us-ascii?Q?u90m+rZ/+py6yS0j6BY7CWv9i+XBHMWKuChC1saNqEVZQYNy8xqHnd/1aZIQ?=
 =?us-ascii?Q?hDwS8JAVNCxb0ZybF6B8dXym3JtF6sfUSfFgXibeBtAMrBPNJ7kSZVC7vCxn?=
 =?us-ascii?Q?NEuEqTz9/fvLpL9tsaYBybwalYum1IREBR6gXKI46yGEnfCn4Rn5DAB0Y07D?=
 =?us-ascii?Q?WzuHg+MlmVU5Em2QXj4uhqnVwOU9xoNKK5qWM5+7qpqJkaV4dPF/mUAi4Ojr?=
 =?us-ascii?Q?mzoAkLEfr0yjGyd9p4V4b10o7jJf3KeDVbI7R9lATureotIuv0W3e+bnvwxP?=
 =?us-ascii?Q?ArSNi3mBGOkm22qfty59Zg6ox5sgu8mWkKkCWP7OJYQeCZdkMIKEa4CfeUGW?=
 =?us-ascii?Q?2qHLRrGY9u4RpErs8e8vk5Vj37VM1SI5M15ncB4L5eotBfWVP11EMhYuLnc2?=
 =?us-ascii?Q?Xz52lyw7KkOL4NiLjG3UYHqxmz1HgnOdeyfguUqdj/5uy4BSQ/X0FYJVg9rs?=
 =?us-ascii?Q?gd43MgwnBYkVk6zH2kRRj0ZkM3eZ5FOwpyelpcYDgbVJuhU16xpT4+5JCpqS?=
 =?us-ascii?Q?XqcJLE610REEUWtoO4du5KjVLcQSFGLsMZNtP1wzauWqby0DcZ8yvA1Wq1pt?=
 =?us-ascii?Q?wzMLb2ndOY+FPcRJqzcvQivVo48nHB9gTheEZLBCwADaRqlD42K8q6p8WIny?=
 =?us-ascii?Q?AM/bhBBPutWndTJK+pbkqhgkeqmc2ngYjIAsMKZTIGBQGHJ1+F5+RhGDK3PI?=
 =?us-ascii?Q?ajAxAbhexPLWkqFVyevMfRk0UFcBrWbSzlIwKdYYjhDzHa1ZuRuXfqNcDHpf?=
 =?us-ascii?Q?cb7DSHGv9ji111fPdVgqctJfVHEFKnjooMEN7xaRbW8yXPbM6A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ozb9W13b2VVioSxnoUBcT22AAZgMXHshR5oI2Ya6EO5HzZjU1h2UbjMwBR2n?=
 =?us-ascii?Q?3hy4iwVZvv6x0LHiE0ynlizYNrhH9ghcn5j50SJtBqhIAToB1piBTVzd2jr/?=
 =?us-ascii?Q?xu8VdOrvIwHqjjOJ9r6UCsVg4TsOnwDH/iMWvBtpMNodb9EM6S7a74+BhlqL?=
 =?us-ascii?Q?2EBVtdBhu+fE/kymvm3n842k9cKjNh6XlPvJNnX8b8g9YLxfRZU43/zC6hcw?=
 =?us-ascii?Q?vbvziaU62sopBSKgG8kz7G+bp7OfP5mF56x2x4cheBz4BAEJWA+KQ93TK3TN?=
 =?us-ascii?Q?S5pulvl0gDMDpQz5xskNSDzbM0dD5h+c4vCoVE0faf0D76NG+iUxN4S7CNMz?=
 =?us-ascii?Q?Apw0WgcagQvUV2rbEzwmLrffqCOEM+LcwhWp03K7e4QWOQzpZlhOEGhdicrC?=
 =?us-ascii?Q?YgiRIcCQ4AfVOSVZH0DfXHlsk7xKYAMlvYiSQKjBgEb8iBpE5qVEJPf+Vpvb?=
 =?us-ascii?Q?YoSh6QIhNruR0q+elVd8dSKIfVjuDOGdGktx5wcDZen36aKHOjZ5EJH0DTAK?=
 =?us-ascii?Q?GZdlXhAxfsEzv5i37DzqaZta5KTAvg/X/Yjjf6kAl9wxsfvryxWAnn3yMdNH?=
 =?us-ascii?Q?dY0i+H2kJtm202BPclJRHUQoD2KJccmgaUz0bQxA7LGdJlb3w3TKrcovpk0T?=
 =?us-ascii?Q?xp7/94tT9J9I1FWx7r5lz5MP0EMW8eVrSfqvVixmlL2YRN79jCeQZz/VXCK1?=
 =?us-ascii?Q?oFGv2l+tLyrbHZ5kk7So6uvEA7wYYiGGCUYvQOdHpf9cCgJYLda84Kc0N1GC?=
 =?us-ascii?Q?mlRiiqIIHjvWJYPW9odK6eGTjK4FDAkPwr4/gLrhKztxfZlJCAP1aR/YQ6wK?=
 =?us-ascii?Q?L8gRXLpPOCIGXgsTajQKxHLA4iQfLY8PoDKPZ6FgyE+j6qV85zuMJkbXsA3K?=
 =?us-ascii?Q?zg0h2T2BRcA7oFkyAlHIIfQN5Fbw6sipP0pxHUKeJK9LZ1bAAKCGsm9lxhz2?=
 =?us-ascii?Q?cRe5Mq9f4fFdAS4UFu5PSfM6JSTudQiWhcJe4sw+R6zzFEaYEotiI74uUkoH?=
 =?us-ascii?Q?5dgbH18wMQ0ReqlLUQj4hmBSuYL1qRZep/rvXmNCKJ6xs4xSih456DU/X8aT?=
 =?us-ascii?Q?FR8HIGWPvBT6fJ0H5Maf5SCaFdJ+dY9cYKAphW/cjPBRhnPeSLQlpL+gCR8g?=
 =?us-ascii?Q?UdormjzWA4TZ+61/qBcOsCnblxiJvcdn96jtwM9u9NaC9G7cQqfQTC4WECaw?=
 =?us-ascii?Q?Ia1pH0D5p0+I5GdKsAiEhdbxnP3eJVzhkm82HAlQAyJVml7Q3KnRZdbhDXkT?=
 =?us-ascii?Q?BYTr6oZYtkrGf9+yyjSz4sPF2wd7BXA2PhC64LSppC7exazUBKjFNZIcza/5?=
 =?us-ascii?Q?WOVck3wc5vc45a6jPw+xKN2QA4CmrJQpMVB4atbwby1OeiOvzbi6HOhhslEd?=
 =?us-ascii?Q?3l3r3lp7o5t3NO50Ik68WQb8IXhVdwSaTfcS/AjslNvvUKQLK0rzujw6OjoM?=
 =?us-ascii?Q?fD8h4+zlFqqhXLsilWg1AAf937pbHSt1Eixls8vlGuGgRCqo7X3Q/lHO7ypZ?=
 =?us-ascii?Q?jyc4blTtNyQLoqmCmMcTWsydrpvCQe9mme18TLmDorA465NNxsbIav8MaaVS?=
 =?us-ascii?Q?KN5gLcHQYmSUNRMStDclE4Fy2pIftdgv0b99rh6CbQlPPQ0kV7sONsK1Yf+9?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e203c6-b02a-46c1-57a6-08dcc315ab7b
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:48:22.0266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ng32K/Z1bOQzahOxHVUR7UZbVMnitAACz7iDL6f/CkQrIcT0VmZASoycnZFdwEj1YOKMOB+96aLofJRzhH9u045qo31TuCoTLtgu9UWQsI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
X-Proofpoint-ORIG-GUID: _0-S-ikNx8Buy_wyocuiWDQ7nXA9RHS8
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c7ea67 cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=m8ToADvmAAAA:8 a=PhIi-PsnD8SNSrD5HrwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: _0-S-ikNx8Buy_wyocuiWDQ7nXA9RHS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_01,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408230010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203672

Rebase 0001-systemd-use-EnvironmentFile.patch to 1.2.7

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-systemd-use-EnvironmentFile.patch    | 30 ++++++++++---------
 .../{rpcbind_1.2.6.bb => rpcbind_1.2.7.bb}    |  2 +-
 2 files changed, 17 insertions(+), 15 deletions(-)
 rename meta/recipes-extended/rpcbind/{rpcbind_1.2.6.bb => rpcbind_1.2.7.bb} (96%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
index 79dc96050e..87f6133879 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
@@ -1,42 +1,44 @@
-From da528d5d60137f13202102b53cf178aba45849a5 Mon Sep 17 00:00:00 2001
-From: Stefan Agner <stefan.agner@toradex.com>
-Date: Sun, 6 Oct 2019 00:05:54 +0200
+From aca8799a29c2a94ab596b5629a4d16f4e6d5692c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 22 Aug 2024 12:55:52 +0800
 Subject: [PATCH] systemd: use EnvironmentFile
 
 Use OE specific environment file.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
+
+Rebase to 1.2.7
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  configure.ac               | 2 ++
- systemd/rpcbind.service.in | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
+ systemd/rpcbind.service.in | 1 +
+ 2 files changed, 3 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 2dd9471..47a46c0 100644
+index 8f4cef3..4705413 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -69,5 +69,7 @@ AC_CHECK_HEADERS([nss.h rpcsvc/mount.h])
+@@ -86,5 +86,7 @@ AC_CHECK_HEADERS([nss.h])
  # 2 "evals" needed to expand variable names
  AC_SUBST([_sbindir])
  AC_CONFIG_COMMANDS_PRE([eval eval _sbindir=$sbindir])
 +AC_SUBST([_sysconfdir])
 +AC_CONFIG_COMMANDS_PRE([eval eval _sysconfdir=$sysconfdir])
  
- AC_OUTPUT([Makefile systemd/rpcbind.service])
+ AC_OUTPUT([Makefile systemd/rpcbind.service systemd/rpcbind.socket])
 diff --git a/systemd/rpcbind.service.in b/systemd/rpcbind.service.in
-index 7b1c74b..f45ee1e 100644
+index c892ca8..e0511bd 100644
 --- a/systemd/rpcbind.service.in
 +++ b/systemd/rpcbind.service.in
-@@ -11,7 +11,7 @@ Wants=rpcbind.target
- 
+@@ -12,6 +12,7 @@ Wants=rpcbind.target
  [Service]
  Type=notify
--# distro can provide a drop-in adding EnvironmentFile=-/??? if needed.
+ # distro can provide a drop-in adding EnvironmentFile=-/??? if needed.
 +EnvironmentFile=-@_sysconfdir@/rpcbind.conf
- ExecStart=@_sbindir@/rpcbind $RPCBIND_OPTIONS -w -f
+ ExecStart=@_sbindir@/rpcbind $RPCBIND_OPTIONS @warmstarts_opt@ -f
  
  [Install]
 -- 
-2.23.0
+2.27.0
 
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
similarity index 96%
rename from meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
rename to meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
index aeca86e564..d308071d29 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
@@ -18,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
           "
-SRC_URI[sha256sum] = "5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de"
+SRC_URI[sha256sum] = "f6edf8cdf562aedd5d53b8bf93962d61623292bfc4d47eedd3f427d84d06f37e"
 
 inherit autotools update-rc.d systemd pkgconfig update-alternatives
 
-- 
2.27.0


