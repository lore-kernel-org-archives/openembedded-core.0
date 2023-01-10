Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A417AC46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 06:53:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.98191.1673333574750498524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 22:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=la9a5IlW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03748902d1=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A6J3BT010710
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 06:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=9n0sjR2d8AwS5wt+tmI3ajkSB3LcMBbNTfaHtHMBcv8=;
 b=la9a5IlWYARmrEYGeWDPU5s5uZRD2S3St4arSJsBz271YRbU1tgNPyxDdkG2U3eu06kx
 kGUV+nyuxwi3/Fj0vRKdYMECsB60BAHJz+wYlrrNJI0aaD8RrRBVlIB1p2lfiREKIDCi
 Coq9fWmpFmDoJx9EUWyqTLqUoSjJl5EErVffWoO4qrVEenUzcdpX3cnpTHpWJXhgsWzu
 4RHS6CIElnzGm3o4cLgGhBOzPcTO9a+YA94jbUtcW3NF9XKEm9mxJgXshwo5hYERwSJo
 9JrJE+53agfjdS/T75abEF748vUcrhwIsZ4pe/bJxV1o+kH52oHQfO80mqRz55u6dLbv +A== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mxwy2jjt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 06:52:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdFpYM0ADgP/7KTRAbMdEhiIXOZzW2u+4tLn6pcpDU/nK/RqZHNo5jPbge/VZjB/08KcnNX2bLudx+OGdcDDJslwAfqFfzuo3wTblljJ0p1iIxdtxvSbnnUkQNIgwcu7towrEpwPI+AFXTgAH0dNTiIShetM0lol73qJdokdyxeYXY1cW99ZTRL0349wC4CV4ctNdRSToB8uWDpbXbtXXoQDIxY0POBOjOuD60nYpuWz8YQXwHVF4Me5r9FL7cE38/U+npqcRlbkRgBCwsJSK/alzZ77CNx0GcH3kbaHjpg+gTOwjHIAHOhuSZBTlgr+IOnmzhzNzdNGNx7JsnHeRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9n0sjR2d8AwS5wt+tmI3ajkSB3LcMBbNTfaHtHMBcv8=;
 b=eJym0nJgL//8I9GXqf/POxVgWvNbTWrJyP3VbwByZ4Eqs20gUGhcIeR0sk3uiRrd7WDeJdmBvTrQFAGKKV3CH53yRFrlVpmluLU7/55e9QTjv4diwroICmlX0zQyzGd9g1cytYhWpYJ8+RulbQ55oSJvr2fip97VVOkXD8k8AUb7ngImIr1n9YzDXgTHecI4uWxWVIW6FzeU6/pWdX95yx9GgbtREdzY+j8FWBFr3JZ+epguxD8CTXDASvOY/oqL0Wu04WlRvc97iFM6DZX/mPbpi3RJ2Y+zanu1TKC7bbjhfXrH9cd3qS4fdEkQxVV4Mr6+IZTtjq33gxl1B6LZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH0PR11MB5506.namprd11.prod.outlook.com (2603:10b6:610:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 06:52:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%9]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 06:52:52 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] dhcpcd: backport two patches to fix runtime error
Date: Tue, 10 Jan 2023 14:52:32 +0800
Message-Id: <20230110065232.21934-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::30)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH0PR11MB5506:EE_
X-MS-Office365-Filtering-Correlation-Id: d5cc7abb-c164-45db-5ac2-08daf2d74b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LWSVLda7yBGdwbVks/FuGoIsVqdquPrZtD0u3Z9uhgyg7TTNir0IpdQrBVd/RW6EQTNPHaG15VNkc8MN2ljG5vmXXBRRcQNRescycosK8/HqIGkD4M+DrEzqu87lWYsMRqQmWMygHiTdeBRZkFlKhHNOk+rbjYQ53lkp5vBJQYHuMaAvRDlpC1VqoEY1S3rMaMw0iEvyad/tCyLnIZW6WJz45/jbU+GsqXsN9hOTnctHfozF8nTgsR/sK4ihJPhnKKPA27bt7vz3CYB+FhvQHOh4SKnVdQZDNA3V2JJj21lXRwaWKrQIyUl2G9gbMOS+fN9LYxSprmEBcXjBe1QpjLWCyXeXRPBYzvBo6++pS9qtp46LLDYalYWxzft7Qb35GfEECv+vUjiHarP4+kQPxaz5qCD/KAWvTLN0X91F9L7LGd4YIWyFPC++NYU/EW090hkUc9lyXlGOhHpKt5Z22XkRD90/XvwJrO1cDyJD67MmoulnHHRfSE/SUS8lMWH5aINIYy1d/ZSl3NwJp/Fo4hc1xQBNtz7bJWb/l6eALQ4ro/iE+S19wiyr5t+RKfCa1mCz4Yv04ky449ZnCS0sxYs6Gyhr7XQOJEhQppd68cKhwWlFZwq0B8RNuiSEJEpVVOMeQzzQ00tfgWaGNaNVhwWr5yuljzp/SxYU76s6R86NgDx2Yl8ZHWfXN89kSrATPgfetyp8Az7GzJ+YAoJyBWMSm8HMAj89TJkpW/fAw2mhccluHscaf4HNSuLI5N5T
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(396003)(39850400004)(451199015)(8936002)(2906002)(5660300002)(41300700001)(52116002)(6916009)(8676002)(66556008)(316002)(66946007)(66476007)(26005)(6512007)(1076003)(2616005)(38100700002)(38350700002)(86362001)(186003)(83380400001)(36756003)(478600001)(6506007)(6486002)(6666004)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YdLTx3JVpVsCAmW5mff1gpxEZQX8YZ2eChsuURWwrMSAw0ZQSsHegSeVPSf1?=
 =?us-ascii?Q?g2pLHS5mbT/v4eixUOR7xdPychF6qCIhQQzWIJiKsQKINpZ81algaAgUBtJX?=
 =?us-ascii?Q?MEMl7393NOfgExyEVthgtR1Xlig9HxB4LnzOU94PZqrmhKX/JcB1PJhFyym/?=
 =?us-ascii?Q?0weu7gx0Vz7DXIvRi5QE5ds+gOzL18nmZcPDRuA6ErJhVOn9SSAGSb8n1iDr?=
 =?us-ascii?Q?m+b81FTbdAdFuWWK2asLM404cZ7qPPIa8G/sLEzaCwdJ6YMze0jMR2rlW3NF?=
 =?us-ascii?Q?FVmeBU6werl6fGq9YCZyCxohCQuEYY+/XxRBFiGfJTAikST1rKQNaDYCMtHT?=
 =?us-ascii?Q?FEWoTMbz2PbWRODWAzhcFTh9vhH1rFP7ipVwhb/u8yxN9jE/VWNSYhwEU52Q?=
 =?us-ascii?Q?udBDUcaJvwF49crNN0FCHimQqabAj9o3pka7JN4Jgj0AxdT2c0IG1LxcaJ6Q?=
 =?us-ascii?Q?JPO3cXCa779yrQ9sf8KdiGDzYvaM5zrD1ClP11IiBeBGU5Q/h0J8IMLKwIh6?=
 =?us-ascii?Q?9SVdOJGhLE2cunWXPHwRbaVS3zdMwjF3gmEDudWaCJ0ch16Va3UL/oovYwfV?=
 =?us-ascii?Q?mYMMGitx2/hy2Z8uqvaWrW8E8XloPAepXNI6epVPGZUgJrV7P8QQLp6OPeI7?=
 =?us-ascii?Q?/FOqP+fTquYAY9/kvnklrg5xZ/QkreRDZpwsxc0sjFDi1Ke9/hXE0V9lLafQ?=
 =?us-ascii?Q?MRs1a8qRlR8Bjg2GYSwR2wMYPzdC0Zkz20c6Rt2v9bg0yV+WtoQR2WXGoI37?=
 =?us-ascii?Q?b0+4uWsfCA8WVbuQ4gzrz8KY9JPiYKZRdc9FIBlsZ5CNGolpGf8vW0i2n2nh?=
 =?us-ascii?Q?5aAyfkIsFN/LzidnJhQ/6AIQ2NIzD5Mit8Drr2mOTyKk0FHvQzFU8eBga5pY?=
 =?us-ascii?Q?hhF2q7wUvj5rlEX21QV4wpse23CqvGE5metR4LVDIHEt62hVYISzTtCF0PUO?=
 =?us-ascii?Q?bs6Sm8C58X7lhNVv56azMvRiLbuzawOIR3AuFW0sLfpRzXxkdkvQ5buLHlTq?=
 =?us-ascii?Q?yqRm+oerxbna/Lv0ilK8nDCa6fk7xlLKzKnO/YhY2nx5XtADkD8oLyxS943A?=
 =?us-ascii?Q?8F9wzl4y5QhMsNVbimiJCz4BBPt2n5yA7Wno9l6b4cmyCfrJnK9dEgcUZXTP?=
 =?us-ascii?Q?ZpRTIDqyuK5M9T+4MAK2gidCfplEPN7AmHOqTlwn6jY2OrAAicJm0eclkekL?=
 =?us-ascii?Q?n4L53/pQh2ULCgrBZEELzLD1UEoqwSUbF4Lz1Tgdrs0cHKmm4yIE/W+4rVMC?=
 =?us-ascii?Q?2L5LLZeB0SX0fHH+VXHpEq72rU2yPxHb0Rm31clJC3e4+oEJE7Hl7cUN0wf0?=
 =?us-ascii?Q?4AoR+WICxyMPmVq8p5Hwsix9fR574v2AoJ07E24kKcAvtnxWd3ZqrlleBtwn?=
 =?us-ascii?Q?lX5HI4X6HB6cs+lkzyQf9ep/DcgNFa93KmdTI2Id7WhwfMwk3yMGo12ivKz6?=
 =?us-ascii?Q?uTSdBcPZLniY8MyyJrMlXMwOK3qM32hc0H4wA8B17t24/HV4HayYuZHJXAjs?=
 =?us-ascii?Q?JCjN5NfJ7I3ZwsOoAdHEVxab1W+AJUW6+vyVKJbYBrKFQ9aeHJNH2XBSaqHd?=
 =?us-ascii?Q?bmKADShzAemEjQBpaoAWd5F/n7OrqDnZaEGbP2Aa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cc7abb-c164-45db-5ac2-08daf2d74b1a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 06:52:52.0598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPO3WJ8iPU7hY0cA1NHgWax6Wpyj5V6wmA125Uah+lQ1nm3y0Iwv9vqJy8QN/6fYaRxhq1eZbb66HnmwWII2/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5506
X-Proofpoint-GUID: ULY1KJ79TzrWvk-CxzJrzmq6WCehXeBj
X-Proofpoint-ORIG-GUID: ULY1KJ79TzrWvk-CxzJrzmq6WCehXeBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_02,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1011 bulkscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 06:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175706

In case of nodistro, dhcpcd gives us 'Bad system call'
error and exits. This is because there are syscalls that
should be allowed but not in privsep. Backport two patches
to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../dhcpcd/dhcpcd_9.4.1.bb                    |  2 ++
 ...low-getrandom-sysctl-for-newer-glibc.patch | 30 ++++++++++++++++++
 ...sep-Allow-newfstatat-syscall-as-well.patch | 31 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index 1d03de09c8..5cf77fa0f6 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -14,6 +14,8 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
            file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch \
+           file://0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch \
+           file://0002-privsep-Allow-newfstatat-syscall-as-well.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            "
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch
new file mode 100644
index 0000000000..68ab93416a
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch
@@ -0,0 +1,30 @@
+From c6cdf0aee71ab4126d36b045f02428ee3c6ec50b Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Fri, 26 Aug 2022 09:08:36 +0100
+Subject: [PATCH 1/2] privsep: Allow getrandom sysctl for newer glibc
+
+Fixes #120
+
+Upstream-Status: Backport [c6cdf0aee71ab4126d36b045f02428ee3c6ec50b]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/privsep-linux.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index b238644b..479a1d82 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -300,6 +300,9 @@ static struct sock_filter ps_seccomp_filter[] = {
+ #ifdef __NR_getpid
+ 	SECCOMP_ALLOW(__NR_getpid),
+ #endif
++#ifdef __NR_getrandom
++	SECCOMP_ALLOW(__NR_getrandom),
++#endif
+ #ifdef __NR_getsockopt
+ 	/* For route socket overflow */
+ 	SECCOMP_ALLOW_ARG(__NR_getsockopt, 1, SOL_SOCKET),
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch b/meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch
new file mode 100644
index 0000000000..c5d2cba305
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch
@@ -0,0 +1,31 @@
+From 7625a555797f587a89dc2447fd9d621024d5165c Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Fri, 26 Aug 2022 09:24:50 +0100
+Subject: [PATCH 2/2] privsep: Allow newfstatat syscall as well
+
+Allows newer glibc variants to work apparently.
+As reported in #84 and #89.
+
+Upstream-Status: Backport [7625a555797f587a89dc2447fd9d621024d5165c]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/privsep-linux.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 479a1d82..6327b1bc 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -328,6 +328,9 @@ static struct sock_filter ps_seccomp_filter[] = {
+ #ifdef __NR_nanosleep
+ 	SECCOMP_ALLOW(__NR_nanosleep),	/* XXX should use ppoll instead */
+ #endif
++#ifdef __NR_newfstatat
++	SECCOMP_ALLOW(__NR_newfstatat),
++#endif
+ #ifdef __NR_ppoll
+ 	SECCOMP_ALLOW(__NR_ppoll),
+ #endif
+-- 
+2.17.1
+
-- 
2.17.1


