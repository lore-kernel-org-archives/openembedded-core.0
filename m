Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAFAC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 01:14:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.1149.1667956484100671335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 17:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83120d1e31=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A90ttQa025801
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Nov 2022 01:14:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knet9k6yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 01:14:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDG6cCS8t0OqWcnHeyRQ43y1sqiZ95L49PmvVzxVjEnpcSTjA5U+KFgRnZaBZl2aIdw1IkE0Ust3b97SNJ+dBWteRwgqYX33vIb8aoko5+1OeAF5+oJduWvCc7BOi+rcWNe0x5XXLVS13tVE5kxhaZx42eUZ5hcjrI20Iild5XWr2XSnE0APz3ax0V5onOiaufxTmxgwoVIVjIQmwIOhOFmhsrYrRVrlNaxmT4ogEKNOz+npIJpc+nRFpuFE0I/1iDFtU5OFCSiJAv2TZLLIrXNMjCjAKxE9VeN9RVPU0GP+dkg6WLld4wK+FW/LCUuNPRIXNM1g1t4/C41KowsCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+1DAvIrVyA7NWHIjSv1wiUnWZE0jFpDBRmOOLTuiiQ=;
 b=V9zqWPvDp17qjVhyQWU6y4uXDk7KgV8ubvR8wzpSANuxTGXe1PPDRONqy/R28ZS0hfz4c9bmFZqcjCgPYw5tdiDI7ZMWTwIZCGhgj871mF7VS2Ec8D1k+q4sz+uM+1a/8r0kFu4/MWiD9cB/bDEXvsXGhs8NJtLOwLf+7KehuXgUCu3jeskSNB6FIyO2PY8RRG8VftMPVi3gqGwXF2PdUnI6ASHA7Qf5tUUhDPq9svvsgOxYd/v75HLgXexgPJuOl85UI6Se9l25OJ7JJtBMm1yrJY7jvnLifYYMe57HzwkvWOv/QqPJ6e40drXE/BrWN+sUNY+VqWhO4zO3ZOgQlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 01:14:40 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 01:14:40 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] lttng-tools: Upgrade 2.13.4 -> 2.13.8
Date: Wed,  9 Nov 2022 09:14:21 +0800
Message-Id: <20221109011421.1257186-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0145.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::13) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BL1PR11MB5271:EE_
X-MS-Office365-Filtering-Correlation-Id: c5345ba2-bb65-4cd9-e632-08dac1efc6d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PCrO9vDOi28vLshuomlltoH3LPQdAcRaw82T3QlxO6vTwhNacGBM3fBzfHQQBwwDVTcvXHkCbwgi7BV1eMW25svhiQ1DFH6IuWay8rt4pMatg7b7yvkVHsf24/RYDc1dcAuCIR8EAjLpiFU7EAjCKNabA6bRE3vYB8yUN6NBxOWvLmrTvInSCVIBrfbyLDVMHDeyDehnjsNxwhFaU7DVIGNbPm9HBYDA2Wp33MVq5HIA62PxVo9qwZuwciPH/9oLDhe15mTktwTG+2Z7ew1TsRc5ahos/42nfOoe2jc3rnCJtWAjdFPDz2nf3ROTJPZuNXbe0O6XMOyGVrhdHe3td2K+DVTcizHcEeG2IHuZ4HN5I6vUUeNyqO9OF8PLbdX+UyeFDhXPWGIU9kJXslCileB7RMjXC5bM83px8biTxgor2OpV2FAfibWF8NsgyK883J8/4SMixfDUlhgAsl4sPyBVVpiom3c2i/ELYEMmz4DDXtDx8Tq4cgiqjSaiVhnz5RPc39SoYN0BWar4EpSE3u2JeLLKPxIcCOhfmmjdd82teNNDFhSRKNUMRNnn2FxfDSp1BaygBfukF8GtQFz1k6mAhLHtHbrULqBs635VuJ833tecDBBFCFKjqbqtUmjjUwL3+v12Xuwnb7GKYHdUAeubhSc7284CNSsvRthtczuAE03Az8F4mmXJeHp2wVXde9kqfB/kwZReSZ6vSynJwqYy+YlwXtBordlXM99mic3LZmOFion7pWibvkGgqFZ4v2eiq4jiMNl2eRkdbsMTr8nJrzrjFZrbudHtmeNg62A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39850400004)(366004)(451199015)(38100700002)(1076003)(83380400001)(186003)(2616005)(52116002)(6512007)(6506007)(6666004)(26005)(6486002)(38350700002)(83170400001)(478600001)(316002)(41300700001)(66946007)(66476007)(66556008)(44832011)(2906002)(8936002)(6916009)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?94MNlJmIaFt1UjGibS3br3N/4rJCTe691AjP1HU+8I7MUoV6DZtnsCEYgs8N?=
 =?us-ascii?Q?/vze7okFxNDhCtAq6BAhv6MsU0ghBmOHQzoC46F1e9nzRj6k/sS9+y1m4vbK?=
 =?us-ascii?Q?mmo17NinFASKVdJ8wutpuvLGyc0Gj9BZdD1rN7EZFzChxCekw2FIl0iCobMP?=
 =?us-ascii?Q?P+1xeE0PdkxpziAdggumCHzSwJolgHBWPiJeHl0aDNgClXO+L2JPB/oIs+Lt?=
 =?us-ascii?Q?68qkzJYYSqXg1fgRduMuhk+iUTo0BvRXohPQyDV3ReKw55GSWWcW8vIUczAF?=
 =?us-ascii?Q?lzPVIw5tHgo0hjVqZ05VMPpBLnLooTOphHDhjCTV2FiBv6lLWBASu/caj9b8?=
 =?us-ascii?Q?FSGS+ioEQHLX8/DPRktPh//8NXR2OorK7RMlrzzleXWFw6avwjG/qNgH37Ch?=
 =?us-ascii?Q?INGqSSagCxzIzdL/mEPFBEzE4KtSKaNjNRKQWoM5567U4cpP27MvEMHpxuzp?=
 =?us-ascii?Q?K3U1Bbtwh7RlVvZCv/pfcEYIIFv7ckn/N/u+CUQKCUog+uHDp8UwR0kSdT3z?=
 =?us-ascii?Q?ekcdloV8a5HHWB0cCgDPLLwNzqzMK4TwaydUQyI3jiIFc732trpqOQpIWTTi?=
 =?us-ascii?Q?H7CwOITtAusJ1AICiijr6hEo1M0NHL6r/YWXIFUVZQTv2L2vPrWxP9TOVeFD?=
 =?us-ascii?Q?twKa+Hy2hhMtDjf7NOSOO2lmEkUtf19jR8gvIx/z4PZEn7iEZ3iad2Q5XDbm?=
 =?us-ascii?Q?RXRwWbuS37sKQjCAGR9wcLAAer8C/ceUqJ3duYpmwgVDPejdX4uX0gN/1LwM?=
 =?us-ascii?Q?rG18rPuRMebu4s93QOTOhHHVfMrHd44tw1h2uckz4tWgX0IXWOFPzGl9R+Wx?=
 =?us-ascii?Q?dLFVyOpsBasAVNS/AGGKfY1bOSKtzkwLqv3r1FCMWoCDfcl04YiK/U2T3OVC?=
 =?us-ascii?Q?vhH4HZmHMcYn7K/I4Kbq/ExuxpMr/hgmuvChUT668CTgSI0sSM7dn0nOKmgR?=
 =?us-ascii?Q?5MnkRSJ4fBcvZDTnA37fsdip4VgmH0C9TWxrBTFKQY/qTVV58sHjlYlUxg6E?=
 =?us-ascii?Q?VwdEYLykjt+P2cDpvfPiT1jKotMYzrI21kA0S3psg41cRm7VH8YmvmJpTv0Z?=
 =?us-ascii?Q?lqoGkUGdGNMzngs027w0i6HasmcQPjl9dASAkisfwO2r8t6O9V+HrM06sv2m?=
 =?us-ascii?Q?ziVKu7AXJHcKJqurGgveNUNY4tfUavo51WOXL+g34aU/1SUMeOabRInJVVpf?=
 =?us-ascii?Q?4ejZEuJjUYZIqAXRp85UkbPZxvUK7cnvyQEl2Qi/5hrMXjrMcc+zEWok10fX?=
 =?us-ascii?Q?uW50nd3zrYU0Q0Bsb/4eqhAWkC4Aa6JPVcIbE3TXvOvkekh5BmZGAA36t3bp?=
 =?us-ascii?Q?eh81ot+pkAEBfC/D/5rUqYQQzHBbDYSaDMeFSyvRQnUfQLsDkqffqsWQ9X3E?=
 =?us-ascii?Q?m3iLQ0a929e3FJw4MfdSddpqMYHRA9e5G+Nrg/hiM9saaT2wVjMfaKLHck6v?=
 =?us-ascii?Q?F1VCLGoglTuWSW/Om/NUYVgP9/rGdC5twPACBbsf33TeH3PDsWmspg6jEVOf?=
 =?us-ascii?Q?HJlj8oAw9DGTJAlFmYoBXzgG8USzzaOg0SbHBUxYfXWoLHHh9EToUzKA96Q3?=
 =?us-ascii?Q?J6XOcxHu763e8BGdcH4g2nZA1gL5Ixsk78lBG8wIQiXHP18QmnmY/Omj0Oy+?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5345ba2-bb65-4cd9-e632-08dac1efc6d2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 01:14:40.4963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Gogi0Ym5OpJbfmMSW4kq+45JzdJYVrsKTfkYVjhNFRoH7z+dyOn11SWihXB+Ft7V1ZFkzE8J3oMbgazQnGgYDXcaca7GXV/dfAuIxqZihQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5271
X-Proofpoint-GUID: AimYM-6gCP2L4jvlRz1OSNYu1newin4D
X-Proofpoint-ORIG-GUID: AimYM-6gCP2L4jvlRz1OSNYu1newin4D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 01:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173006

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb}  | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
index 0ea4da05ce..a814eb79f9 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
+SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -113,7 +113,7 @@ do_install_ptest () {
         for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f -printf '%P ') ; do
             cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
             case $f in
-                *.so|userspace-probe-elf-binary)
+                *.so|userspace-probe-elf-*)
                     install -d ${D}${PTEST_PATH}/tests/$d/
                     ln -s  ../$f ${D}${PTEST_PATH}/tests/$d/$f
                     # Remove any rpath/runpath to pass QA check.
@@ -124,6 +124,7 @@ do_install_ptest () {
     done
 
     chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary
+    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary
     chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libbar.so
     chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libfoo.so
 
@@ -185,4 +186,10 @@ do_install_ptest () {
 INHIBIT_PACKAGE_STRIP_FILES = "\
     ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary \
     ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/.libs/userspace-probe-elf-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/.libs/userspace-probe-elf-cxx-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/gen-syscall-events \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/.libs/gen-syscall-events \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/.libs/gen-syscall-events-callstack \
     "
-- 
2.34.1


