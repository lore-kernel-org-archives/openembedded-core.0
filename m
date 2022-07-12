Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BE7C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:48:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.6404.1657612097301607580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gm9YhopY;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4192ac903a=zhe.he@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26C6dNw6012858
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=hOy4ds3zJPvdsCJh9IABu9Wewlv8iowJLJhqsRbbwNk=;
 b=gm9YhopYQgXKXtdd7MClK6CH5FzYH6uMeXiMR08bgwVkCOkw2rSTIrQdhAamJK7jTRfQ
 U9iV5fMSKfL0o8VKeAoQfQcSAUFBPlBtudBFDnnsuW2W0qo+oxkY6ADUceZFrYNtXgVz
 Luz+mdYdtpLMw0cbjYCt/2UUkZXDQoyUD8eeYFkwnwAmvWIvedbYPee12RbluJFgZjB1
 DxIwMdwAexf6qEkDLylnCTeOxkD3z0MiRvS3B3CaGqNdN9CoqP0/hEn9NgdvnW0Peth+
 g9l5No7r4eW6lZu6+VcYPiBTF8WKp4QsMH/ym/0WR4/bNFLbEiNvFas47aSSdI/H7WfS kg==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h70n9j6t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 07:48:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPFlyj9s4+Ii44hlY/TT5BT4g3ectx56LUyWeXzzmvS588W0KzjX+ewy7/Ud5teLe0VNKNTD5qxRJ8eqCaxJA9NuIwNdT5Fs3gkSFX08yl4YCl0StRAkQBIXi2IflJi3mUiD06VPUJXZjY+FJBKV+r3MxVbVQACaFd5K4yi4ynAC9VULLOmnhJNzWZfqLyCwZJaO/48tFj2opPcr13G/odQ70eTmG365kxhp2+jqkGu2g0CHuvqmLJCfZEtayKJQ7GkBgsCt5mU1f3kI50vEiHYAn7noX4t2/JK7HPOHZFCo4HW821SbyzOnCF01I/8CbOxSxdZ5Zu9XVqMaOMeiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOy4ds3zJPvdsCJh9IABu9Wewlv8iowJLJhqsRbbwNk=;
 b=V41pazY6av9e+712OJEBDl6NngZeQqyjcLMkxPQ5CIwVqRaiUo1CTYRgSCbEaHLWQTcjVl82AoFoIB+nnB26KpfzwNx9WKqWgDnlzA+E6kWBsloukvYAAHFYh3B4om+o3S722V3SVhlao+7MiRIaSMjU6/aD2NGJhvTsYQjH1K8miztAvMGfkqPiWYysVan26uUOSXXBHviN3Le6Lg6okuRHmn3dye+SopbTbzEK4Yy1qU/uLSggGdGDLzB+IY9RANiISNCrU9bdxm104njEX/kbj43QXaaRl+FNp1hBBtZsD2wFIKm6XajAbB1U+WvCIofu8UbJAH2YJi5MBU3jDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DS7PR11MB6078.namprd11.prod.outlook.com (2603:10b6:8:86::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.26; Tue, 12 Jul 2022 07:48:14 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::e962:2a9c:c503:db56]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::e962:2a9c:c503:db56%11]) with mapi id 15.20.5417.026; Tue, 12 Jul
 2022 07:48:14 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] curl: Fix build failure for qemuriscv64
Date: Tue, 12 Jul 2022 15:47:57 +0800
Message-Id: <20220712074757.1705598-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:5:3b8::32) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06712728-3e49-43be-f93d-08da63dadff1
X-MS-TrafficTypeDiagnostic: DS7PR11MB6078:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KKFxc8mq1r9Rwvb3VeYf2g7N/RZPfPZXEPtCyaWi930nDyuH2BRwrYPtg3EWPh65z396xBspdaF9BzrMyeWu2tKqUXXTnznOlB5zFoEAsxM+HwSlgflB4mRw7Dz5gXFyqPUCFNt/HhZFwIjjPR9zB0h5kIQuU94DK/dqV2ykt7wcDkdzU2Vdxr2OCa8lnv7ojlxnkoh793dze9/7SNkN6q2LxsIo3NcBtpzmcxR0LSpBbPBqTVh5WFXcO0q/WTLad0H+mc10flFxATZKOpo8z4G8IFhX+nGltYcvdhJ4m8YvkZ97N8FR+gEUi3X4J1peq1Qd4jGif+NdeYwhkY9aO7syK9JzWWtZR0DSKyAvU3MpkT4FjaEnNImMOAbI92ZEJb01ItS8cJavCrecp65DnC0dhOEFpmRVRvl5WUesBN8vQ/Hhl00efL5Cd831LpKoJf+1xryku6F/L7vOaAYXLuljq8+lfQvg70bhZ6ARSCoCVi91tQKtbB98e92GeRHHNhyw3pG4ogb6uczuwLOAbU69jEsNcWdUWIqYiMQQy0VIw1C2Kv0rHQSrDb6BztKRSzFUzKu7DrRtoe7o9ML9ckXeKWvICLgTBjogl5i/1eEfI4wzj8BI9Wni5C7iJ0N1El1TpJiM1359Lzpedg7udiwziom42OQ+WmY/3JwfLtFabF8XR1i5LQErWa0IXf8h/pPflEZCCIVtFQUHLpPc690x4hEFpGJD4YQsqx5wI/lk/2QlZNR6iK+UgerFtPbQfix3gV0tIgilMwJJ/BokjUEG/P/ZPo2NTzyVwuyltCKDZLcxEQ1PDS4kwQ/88aS3fOxDvbXImoGBQO4F1AlQBg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39850400004)(366004)(346002)(41300700001)(8676002)(2906002)(6512007)(6486002)(86362001)(6666004)(316002)(966005)(6506007)(26005)(478600001)(6916009)(36756003)(52116002)(2616005)(38100700002)(38350700002)(83380400001)(5660300002)(8936002)(1076003)(66476007)(66556008)(66946007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EFmhDINYxLU5kRP7e0MUI+alebvy4aAIlo1kZPPFdeo1Pres3AELArc8qCvp?=
 =?us-ascii?Q?NPGkYXDcYIt4B5SSjqxh8+MfLq3S44nfKy+Pu4xnj6IIRVD2sM93hsERoD6k?=
 =?us-ascii?Q?59iJ4LGewemSNX4l3+6DNWYBI1N9x9/XjVunks8MHxRHeA8tQw5akSN1OVwT?=
 =?us-ascii?Q?L1fsj08RM7uFOyOi5ENkciqjdHOYVVwhwnqqJ++y9NnoPdCrjYzLPjIR9vE+?=
 =?us-ascii?Q?UEc3cEPnhbwayrzAz6v1OPszjFX8fqbzmnTGaeyILsUl8rikNNMHz10PJYF+?=
 =?us-ascii?Q?j6ATqrTirD5Pz+wD8tBNHpFuxUAVX0/ekbFbQEBvLMgcDIOpEIx69upZIj1/?=
 =?us-ascii?Q?f36OR27jqvZd24MvWl1cz4PAKpgsQc08ZY4uceYbwaU2B1CtOCsFQnVJDnh1?=
 =?us-ascii?Q?DtpWoH92J1CJ1uZNW0MKMIW4d8oktuUX6D1DYG5Wh4t5mFXAQ2yigDl8TVa/?=
 =?us-ascii?Q?ZzQhPtG1Ue/bugjuY0qJj9sJpbF0HM1LE5SescvkfZZRiaGb0jGnsNj8z5nh?=
 =?us-ascii?Q?ERQ39UcfO6R84XrtIPpMryoCRQqR9j9g5kfzs5uAwdI2z38QBR4R7dx1O+3r?=
 =?us-ascii?Q?JzPRipX1EokjhYDIZTB4n3zGoN5flSVqwvIIgr5Tv6NtKbwmPupfkeWNQhCQ?=
 =?us-ascii?Q?nCCD52lNQ4JZ3lfxdJJaPCFe6gin2SS57R/LBlurEiE13Gqa24Fh49Am5+P7?=
 =?us-ascii?Q?Yhv+/22uXblDOpwHV4Sv0zND0lDFv44d/oyRWZCa3iU7F8RYjiDcxpwmaRN1?=
 =?us-ascii?Q?9XtQtahrDgQZqxWxsh0JbK818IS2txvW+ZVPUIaGLtnyX/CLE60MhfU4lLH9?=
 =?us-ascii?Q?jrO1i2iN8Ca+CwbBWCP58kCnPsVNNBlM9ZpwYfwHKJW4K/tzMnyf88vZBHmH?=
 =?us-ascii?Q?CfTIaNmRv4O9xK1a4R/UHXgAzVTuj5oDq004vaqcT7xct+dJxm5MeOpta17K?=
 =?us-ascii?Q?9ugYX95Q5GvDwNyTzyiK4m2LZMe0fF6+SdKDv0rt1QmwlownFENHbMtuaPis?=
 =?us-ascii?Q?M8kqGlFwMXctITkV+J06bTInt/qB85knGifjlaFKZMtnoohsSBzkuYZf4F+/?=
 =?us-ascii?Q?6bIzPaHWEtc2EudyobPMN1cQFxlUPUwpeorrZJ4rP8AbjjZQ4ibYz6zZDMs0?=
 =?us-ascii?Q?p3zvf3K0dxdx4/y4GmoGkWcXeWAX9aFvqLieMwFCsWJ4wBTyMdkjdO8ZH2qZ?=
 =?us-ascii?Q?ZqDvy86OiOpLSAKGf1yzC2QKvK5OPRpkrYpIVonSnpT91+YvYmZFDAZ0A3K9?=
 =?us-ascii?Q?a/eUOuNpN5+SBCK/NfxDvuI26ODX24m52ntbgGewZ0guH96Pe5I6Uza7FXya?=
 =?us-ascii?Q?P41mp1SeiCboyOsQI3uvaOu/7KKCOVQf70Mnn2QI4Ee9G4jL3FLDHhFZ2fua?=
 =?us-ascii?Q?SY7uSxbyprJ5NAKqjq3QPIViW2CyDvShk/wvHSFQ7u+DfqDxjALY1zL/SrIZ?=
 =?us-ascii?Q?Chs3V/V2/+thsCLS7lpKzE+EdgcQDyYwkhre3MmdQbUpt2kqvnaxFPOWDgLw?=
 =?us-ascii?Q?hAZgRIan69jQ/vsjRptv68X1qzhkvsG8+4M1eQr7TIdcto2ru/kvm7kQ6Hh6?=
 =?us-ascii?Q?hmq2rOYjg5hrhOZ4mHBBjlBdLYM98XggQnJ22MNF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06712728-3e49-43be-f93d-08da63dadff1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 07:48:14.0825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 o2idOePDEK+Kje5gK8+lYDC8/CO33w5/e6kmLx8fqcpVDmpwRFX2npUYvQcFI35qU6nSbCB4sf+pOh4aMreLAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6078
X-Proofpoint-GUID: 2MEZggZaYqWMBw7SA8nnTz6jAfbOUGxW
X-Proofpoint-ORIG-GUID: 2MEZggZaYqWMBw7SA8nnTz6jAfbOUGxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_05,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:48:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167904

Backport a patch from upstream to fix the following build failure.

tmp-glibc/work/riscv64-wrs-linux/curl/7.84.0-r0/recipe-sysroot-native/
usr/bin/riscv64-wrs-linux/../../libexec/riscv64-wrs-linux/gcc/
riscv64-wrs-linux/12.1.0/ld: ../lib/.libs/libcurl.so:
undefined reference to `__atomic_exchange_1'
collect2: error: ld returned 1 exit status

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-support/curl/curl_7.84.0.bb      |  1 +
 ...-to-using-atomic_int-instead-of-bool.patch | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/curl/files/0001-easy_lock-switch-to-using-atomic_int-instead-of-bool.patch

diff --git a/meta/recipes-support/curl/curl_7.84.0.bb b/meta/recipes-support/curl/curl_7.84.0.bb
index 0d829cdf23..28b09ef017 100644
--- a/meta/recipes-support/curl/curl_7.84.0.bb
+++ b/meta/recipes-support/curl/curl_7.84.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 SRC_URI = " \
     https://curl.se/download/${BP}.tar.xz \
     file://0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch \
+    file://0001-easy_lock-switch-to-using-atomic_int-instead-of-bool.patch \
     file://run-ptest \
     file://disable-tests \
 "
diff --git a/meta/recipes-support/curl/files/0001-easy_lock-switch-to-using-atomic_int-instead-of-bool.patch b/meta/recipes-support/curl/files/0001-easy_lock-switch-to-using-atomic_int-instead-of-bool.patch
new file mode 100644
index 0000000000..878839a5e3
--- /dev/null
+++ b/meta/recipes-support/curl/files/0001-easy_lock-switch-to-using-atomic_int-instead-of-bool.patch
@@ -0,0 +1,37 @@
+From 50efb0822aa0e0ab165158dd0a26e65a2290e6d2 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 28 Jun 2022 09:00:25 +0200
+Subject: [PATCH] easy_lock: switch to using atomic_int instead of bool
+
+To work with more compilers without requiring separate libs to
+link. Like with gcc-12 for RISC-V on Linux.
+
+Reported-by: Adam Sampson
+Fixes #9055
+Closes #9061
+
+Upstream-Status: Backport [50efb0822aa0e0ab165158dd0a26e65a2290e6d2]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ lib/easy_lock.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/easy_lock.h b/lib/easy_lock.h
+index 07c85c5ff..9c11bc50c 100644
+--- a/lib/easy_lock.h
++++ b/lib/easy_lock.h
+@@ -40,8 +40,8 @@
+ #include <sched.h>
+ #endif
+ 
+-#define curl_simple_lock atomic_bool
+-#define CURL_SIMPLE_LOCK_INIT false
++#define curl_simple_lock atomic_int
++#define CURL_SIMPLE_LOCK_INIT 0
+ 
+ static inline void curl_simple_lock_lock(curl_simple_lock *lock)
+ {
+-- 
+2.25.1
+
-- 
2.32.0


