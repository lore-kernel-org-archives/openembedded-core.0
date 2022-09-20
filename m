Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31330C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 03:07:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.7624.1663643264388381942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 20:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sx3LKRr8;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6262f964ba=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28K2vh32018918
	for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 20:07:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=hnZM3+2zKuFuwFCT4ALG5KT2Z94mn9E9ajNdi3ZuOQo=;
 b=sx3LKRr8ZqTzTJJpP+/6Q6SL3IorRLEiK52/RbumdR14pm2s415khF8hkjEuriy9zzSP
 qeTEUd4UV+ToerR8Qcg0tea/zR8VcM6x+0wg3+stKzzHQIkcUCpT4W9xGQAN+XEuKJfc
 wz2PEgYIDfOvBTLynQYD1n0rQaA9Wz4D2FlIy0ub6nFJHoCkep4WivpQB3jhMbtm5ibZ
 t8YqiFSvFVk64fyiAz6QdXRAWkj88GfrNxZqC3gPaL2H8Dnd+pTMPJD5xujwtfDq6wf+
 j+ilHUdmSNq+1lwADxzMYlWdC+d+y2wFbIO653uLkebnyk1t+kTzrZYmobSxn+B1wzb3 gA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jndrkhw6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 20:07:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1SJbjpy17B+91ka9B+xQKxPrS3jHli3MmmuQGGqF2PnJKa+C9HXVBPCDaprmD02lGVAzif5JiNsyLbsJR5+6q3G9p5qTKOby7ipMXS/sQqkG7Hy2Wa2PTTa5fJ0MsGmWaURsEFs+2Nx74w63GkVKkziB2dazCBRoIBCf24stDLHKlOM2twwGJuDumRfBR/hHLF3QulpMYmItuOqF7Lhj7hsaQmURpLGdNnGPDop6KiENIEz+SEkmzOor03yKfPFXnXCsAtBANX6OXmQtpYyz5cv56GAInB6hCCOLdWkIx6foMBpzudOAhpnz3Hd32xfekSUA1iA9NFQ9eYYnfX2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnZM3+2zKuFuwFCT4ALG5KT2Z94mn9E9ajNdi3ZuOQo=;
 b=NI8cdUG9ZEvs3BTV+tq4HwcUXCinnfJcHLYptJFxEoX2QFyRUn7VnUNlXEFt6Vf4PqTs1xkFjRiVk1hdCLhJBZSijgOksGKf08ihtnKDl15DQ4DKNhclJpawXhvknlEP3Lne7WOdnDYA8DRluiWTkF1eATkD8nsnwkihtVzIjjmvYLkNgYe+4gkkdH19CNyF046JQGaRyD6O/yURToyTXrUrqPRp8jTExiNhmIwDBLvsJ8/Fr4BuymtD9NBxBVeAcMh6ah77t260FX394WDi2lrGWx2cV/2Tf/FLWtYakM3viJHlDDdaCeqJrPWT59PZHHiX3Iajfcacs89gp4tPxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9)
 by SA2PR11MB5003.namprd11.prod.outlook.com (2603:10b6:806:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 03:07:41 +0000
Received: from IA1PR11MB6218.namprd11.prod.outlook.com
 ([fe80::31e2:9f90:e4ad:3370]) by IA1PR11MB6218.namprd11.prod.outlook.com
 ([fe80::31e2:9f90:e4ad:3370%7]) with mapi id 15.20.5588.018; Tue, 20 Sep 2022
 03:07:41 +0000
From: Xiangyu Chen <xiangyu.chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] ltp: Fix pread02 case trigger the glibc
 overflow detection
Date: Tue, 20 Sep 2022 11:07:27 +0800
Message-Id: <20220920030727.846814-1-xiangyu.chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0298.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::25) To IA1PR11MB6218.namprd11.prod.outlook.com
 (2603:10b6:208:3ea::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a15d0f9d-9a8d-4467-49eb-08da9ab547f8
X-MS-TrafficTypeDiagnostic: SA2PR11MB5003:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uFRzEsdC0WZK8a6FpzaHAd+sYbT0HhQm5nNs7XvISJtueDS2zs63H6b/rt2Up29RBBPB73ZyNnolke9ZRp3urYwWu180Y/tpU8Lp/8661qZUiLVndM2w0XbcckJ/BRvyiknIUn81oYDHGf/Up7zucfJOb66UuoAWUu2NyaUcj8EUAk2WogAfAg7nG99yaHN0cTlI+XTtjWrfkP9rz0gIGulvQqrqRwMm5y/sDUjFGRaJtRan9gjZUMcAdK5Sfb0/LgzaNDuohMWBnb7gY+ooyL0qKhRXTaBlHZX8Pv/d1AgzIx6fZMWy4zIvJC0Qs5rrmFHHKz2lBdzO7EimoJPXn7cws+WCDRQa2CJzejIqs8API8l3Wx6bE0DPe4W8afQ9p9goQDNGwY3k7p9xIjBUv3j1SzEW0s8BgZNmeN+MzHwc7wbe/M4DVCJi7M7mCciFzRGQqup4a+T30ojylTfuXNUQWUxrdU6hbImf1YcHPaulnJJxxmH71qmqP1Oz7Ux0YqxNqnQFiAK/2Yf+XVHMoJOApKTqPEh5QxfurLUBYfCD9Udd8/GivK9kxIXMrjZ5utw4Omre+eBlbpdXB5T+ZvZkuA2Pa9vC+v32ibI4hgk0qY5K4/1nf/qS8uA7K40tq5+nDcLw38dSVw+OeZ378zEsZuqQYpKw9e++aUekxY7/chXMD9KQxxprkWZT6KfgtjWBdDug+yHpTHmqvBReWoV7rKz0FOvzxKTkAaF9hsYSRqPkPslp6igDv2Mg8jpkZGIfWRkOcs53QZ87NnHR9nyMHsHKe8DC6QN+y9CeBjQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6218.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(396003)(136003)(376002)(366004)(451199015)(38100700002)(6512007)(38350700002)(26005)(6666004)(6506007)(8676002)(2906002)(2616005)(44832011)(41300700001)(52116002)(186003)(5660300002)(36756003)(478600001)(86362001)(8936002)(316002)(66556008)(66946007)(66476007)(6916009)(83380400001)(1076003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xdCjpoCBzUsS79C9dxGwJnzASpndQ5VhiGrXDqSz3Z5WEsqd9QyEftV4bJ/Y?=
 =?us-ascii?Q?5YvKG6x+vHb2CqM6Sw2+K2/ylA3H+IHSPY65+uY0oaTzlUeq8E1scizuD4UK?=
 =?us-ascii?Q?g1pUo0eUenTrL5xIprAbRlACbQxiyHS0C+3vamdESf5SNAifgMZzfJnU+Zii?=
 =?us-ascii?Q?5PuI5JZaTPgefDtQwmF2qIVhsTxK+1FSyQf8aZ8GesLsQDovwZ7oxj9rb3Z8?=
 =?us-ascii?Q?j5CpCjy8Dj+jm4txxPGlKwH+IQFZp/9A4szn7Zprh97CPS7G4Sbczaw+2Xup?=
 =?us-ascii?Q?sL8g974At7xDv480fciAh2Bt/MGgMsrgSxyQFxVadKh48GyuUsOCIsjOtGA+?=
 =?us-ascii?Q?teqHtmMINIcr7P2ZpfY7JvI0kX8Jg44SoOBZhSqDH2w6GtB3O0GJokOVRn2S?=
 =?us-ascii?Q?Wvp4fRFadeP9+TXHWM+KxZbz1O6ce50QRrb3XJSLeHEZk1+lZMgsK4PwHsiY?=
 =?us-ascii?Q?9Usl4g4lbJNumcps6spmE0aVhdmc4K94ZbDAAXyc9HkgJ0GG37GnvNYyyO0k?=
 =?us-ascii?Q?FkAhyEIjl+ZIzKwf5tZyam4+VFQ0ZwycQeJ+Mdr7uXc7+IWNqhu5HhizSNOd?=
 =?us-ascii?Q?0lLR3YpgzCpAAWscE8atEgLMJdAFMvcJ5hz3JSQmMBdi5eV2k46OA68BXA+m?=
 =?us-ascii?Q?HGWyhDU14TVXpJSS2VJV3dTuwyQ3o3pGBl/lEY9btUgEKIk23F/wLya7oK0l?=
 =?us-ascii?Q?FZT+FovyyL4GwV7UeJgCjsLCd/tHehjul7HcCxZKl/StHON9LsWO7x31ymwJ?=
 =?us-ascii?Q?HmGQvPvsr5ACOOtt9t7nyI8/rvqNPLoA5/j14B+4J9z60BjJsd7Rou5MRaj2?=
 =?us-ascii?Q?aF45i42t4Ow8w8gL2UU0/Tzd79saJp8bytZmTyw2ht6AgjvkthS6expBpXAs?=
 =?us-ascii?Q?2qcdOy555o417i2P0bi9ccg06Ec7HahrhoUs4Cf8vxVkkqDgYBIxzCHB+hO2?=
 =?us-ascii?Q?t8THkJEuE3Xw4OtLm5rn7izyiVvGY132xEblzK9R5ksKOwoIi7DI1P/9eXES?=
 =?us-ascii?Q?IRN8k/jKboG41vFvTQNHydKbrQkLaEdL5HK966o9NONn/Zzmk4LwerXnyI2G?=
 =?us-ascii?Q?xTjBnSqOQElbeXFTjgRcioY193cBtUpuidLyZx/6ifZmZZp6sUYJQFg9Emrt?=
 =?us-ascii?Q?AZQzupxnO63U3RvqesMPOo6esxcTohCyt0/hpgRTw1Jw7mDZEjbMRgBqGAvC?=
 =?us-ascii?Q?41s2/6W1CZ55WHHhyQgvI0szN9AqBiYLcRs1vJ6IWzhS1PlDnGA4HagbnXxB?=
 =?us-ascii?Q?9rE4hE2PTgPPdvhRmUI0RQeenlaDkOoJXJHNVZE3PxrxovTDQxWgZKnqGozc?=
 =?us-ascii?Q?SnI5atEb4MNNUBzOWVrHbH3y4/LNDTZhgfw/KdRRAapEOnWiM9cjOZZxN0eL?=
 =?us-ascii?Q?3p2mjpYn/iPp/x5U3Ir4EhgVJFxkd8DemSLnQESpao7aDzro3CzACb5L/IKm?=
 =?us-ascii?Q?vw+cUGCHlaR67A/OWmhYLduaOx5mxcXeFHrPMYXioQZEw+cAMy1riKJZMBiJ?=
 =?us-ascii?Q?dJmPnU/dpGP+4Oe3JRnzExOrT0Yn5zegwgku5CZeIBhtoD7xZWATcJIM3p9R?=
 =?us-ascii?Q?UEtsht69Ciac1JTxzZ/q18GfNLhlamTIqSIL3buwnZg60x2inzECcNczoRt/?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a15d0f9d-9a8d-4467-49eb-08da9ab547f8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6218.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 03:07:41.7478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hW3OzWLpkG+2yOz6Z5sPSF6xBJAW+vZBN8UhOoi/0bTgt7zrnwGpBK4rYN75g+Ermnx0Sao4Ypp3E+60EWJUe3rPWKhJAWdjpeeXhQXDn5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5003
X-Proofpoint-GUID: Ab62MunijwmulKPLzEbD-yoPzU7lB-E_
X-Proofpoint-ORIG-GUID: Ab62MunijwmulKPLzEbD-yoPzU7lB-E_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 03:07:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170886

Backport a patch to fix the pread02 case trigger the glibc overflow
detection.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...er-to-avoid-glibc-overflow-detection.patch | 58 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20220121.bb     |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch
new file mode 100644
index 0000000000..94dd418f36
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch
@@ -0,0 +1,58 @@
+From de988c9b5605a711b306c4203545b8d761875177 Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Mon, 31 Jan 2022 12:00:46 +0100
+Subject: [PATCH] syscalls/pread02: extend buffer to avoid glibc overflow
+ detection
+
+Test started failing with recent glibc (glibc-2.34.9000-38.fc36),
+which detects that buffer in pread is potentially too small:
+  tst_test.c:1431: TINFO: Timeout per run is 0h 05m 00s
+  *** buffer overflow detected ***: terminated
+  tst_test.c:1484: TBROK: Test killed by SIGIOT/SIGABRT!
+
+(gdb) bt
+  #0  __pthread_kill_implementation at pthread_kill.c:44
+  #1  0x00007ffff7e46f73 in __pthread_kill_internal at pthread_kill.c:78
+  #2  0x00007ffff7df6a36 in __GI_raise at ../sysdeps/posix/raise.c:26
+  #3  0x00007ffff7de082f in __GI_abort () at abort.c:79
+  #4  0x00007ffff7e3b01e in __libc_message at ../sysdeps/posix/libc_fatal.c:155
+  #5  0x00007ffff7ed945a in __GI___fortify_fail at fortify_fail.c:26
+  #6  0x00007ffff7ed7dc6 in __GI___chk_fail () at chk_fail.c:28
+  #7  0x00007ffff7ed8214 in __pread_chk at pread_chk.c:26
+  #8  0x0000000000404d1a in pread at /usr/include/bits/unistd.h:74
+  #9  verify_pread (n=<optimized out>) at pread02.c:44
+  #10 0x000000000040dc19 in run_tests () at tst_test.c:1246
+  #11 testrun () at tst_test.c:1331
+  #12 fork_testrun () at tst_test.c:1462
+  #13 0x000000000040e9a1 in tst_run_tcases
+  #14 0x0000000000404bde in main
+
+Extend it to number of bytes we are trying to read from fd.
+
+Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/de988c9b5605a711b306c4203545b8d761875177]
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Acked-by: Petr Vorel <pvorel@suse.cz>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ testcases/kernel/syscalls/pread/pread02.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/pread/pread02.c b/testcases/kernel/syscalls/pread/pread02.c
+index de2a81fff..fda5fd190 100644
+--- a/testcases/kernel/syscalls/pread/pread02.c
++++ b/testcases/kernel/syscalls/pread/pread02.c
+@@ -39,7 +39,7 @@ struct test_case_t {
+ static void verify_pread(unsigned int n)
+ {
+ 	struct test_case_t *tc = &tcases[n];
+-	char buf;
++	char buf[K1];
+ 
+ 	TST_EXP_FAIL2(pread(*tc->fd, &buf, tc->nb, tc->offst), tc->exp_errno,
+ 		"pread(%d, %zu, %ld) %s", *tc->fd, tc->nb, tc->offst, tc->desc);
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20220121.bb b/meta/recipes-extended/ltp/ltp_20220121.bb
index 8a13dcf9d0..4ae54492f3 100644
--- a/meta/recipes-extended/ltp/ltp_20220121.bb
+++ b/meta/recipes-extended/ltp/ltp_20220121.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://0001-metadata-parse.sh-sort-filelist-for-reproducibility.patch \
            file://disable_hanging_tests.patch \
+           file://0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


