Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDDDC36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 02:22:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4395.1743560549862571931
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 19:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6187fc663d=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5321uWuO017022
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Apr 2025 19:22:29 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtf2g3p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 19:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKYbf/+Mzf5LazkgS4tOqk8hHh5fxyj8onniXKBqPHmMkD2C8WMhqZ8N5qaaHcTHgtGInEkJGKBes295mZIeGSBR/fenZ7zYPqT9zmUNNtObrz+wx0NnFTzTDHLiwv4HOi6AyJ7KzCTjZaS+UPAI9QK9+ldFThDVCi/nUC9h41Z8wWQCPlkqsEhtr1KOfpJRSw8SR5Y2U9vybA6xNQs+Yr7fQuB+WMhhsip9WNahMDh92RT359xgTyVVaNVztVBhtzUYTiCyBvFYzVWAG9B+hF053XWHVoCG9GRHu9UpPduDmNmYyixf0TmThr9LW1HG9L2i/9wXqpZajMv2hzxUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akm8v1vAvv90hbLZZgLsQxJTn1IFo58aCPzY5Amo3SU=;
 b=WpmwxMBUJ2h9HJnXffEeI9MYsmJ1R8fCiUdaOTFwEycwjaWnNQUWtUzmZmLCK1q0afgOd3MuRYRAPKf+nYpOTXKpESmg4rc915eCIi+VYTxfK0wDmxOBXOpg/GpMa/FZvc1yMtKQDVIhF0GXPC4VlEwZ7+EpOYxY2Qg2mmH9nrQAnbR9uMz5RlHSGA2ke8eOvuABFSrZCLpOgph8nYDfPEX42vDim4c3LDxsGS0bEcn5Dne/c0b+NftCEK9/wgjiUPU7xrwqcqMEkmwBYGQGamQ7phRo9I2zGZO3kHZ+aZM7N8JpA5MIanbtD02qCtgactVpZiDx9c/BLaVdbF4eTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by BY1PR11MB7983.namprd11.prod.outlook.com (2603:10b6:a03:52b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 02:22:24 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 02:22:23 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] glibc: Add single-threaded fast path to rand()
Date: Wed,  2 Apr 2025 10:22:08 +0800
Message-Id: <20250402022208.2193349-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=y
X-ClientProxiedBy: TYWPR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::12) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|BY1PR11MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 9911fec2-1726-41b1-e9ea-08dd718d3430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LuZv9TZuTO8nwruNMECQ0+6xzOsT8iv5k+3jJu7DVgDWFzYHV4RgwnCGi7mU?=
 =?us-ascii?Q?j9jMXb3iPRbSDLH/N7zv+rWzO0tIf1C6GoQwyPEVmHnz8BZgK13ndZeCuyc4?=
 =?us-ascii?Q?VAq8iFKPO0i5kzsNkt1zhIplGrghp8HFZzwsNoxUvrVcF/SHJWTxZUWdCSOL?=
 =?us-ascii?Q?4ZH+UAQcbiaUFx+caRWCGpaB+n1apeb98HhxFhtuCekr/aHUITFi+2erf22/?=
 =?us-ascii?Q?Y1bsYPDH0pQOjb457zkhRqmGzt20FqtoUEOC6K6q1EhQHFOce9h1p6kQoKjn?=
 =?us-ascii?Q?tXFl2mygAXadGgelHU8og7S48toMFkmCvyulQUt88BJXmikrfVcFG50PDAi4?=
 =?us-ascii?Q?Tgl8xTXnVqj7J/A+QAfZ3cvZcVw8e87KJsbePHnJTSLnb5g0I7c3385Iwmcf?=
 =?us-ascii?Q?dH1kIhkquAvUbkib8yG3Bqt5WVtkNLL3S6JmetrxinTfLHwNOcvoqWrklITx?=
 =?us-ascii?Q?+rR1RlxtYQkEzraG4m8ADS3t7TwcUbwrDawtTx18q7/L1Lsl5jPHJGgzpCae?=
 =?us-ascii?Q?bTUn4BJ1nZfmtgbzPSJsCDDCT34drWuGpe90d34na34SyW1Q9QU9dktPpEM3?=
 =?us-ascii?Q?Z7ME7nF5/zR76AWFu59iKu8g6lOBppdX3KxsfjhNF9W/ieiHEMdjacQxBaX8?=
 =?us-ascii?Q?XQGA2hUXN5c8pPUyhBPY5DyqLzNJN7N+QZjmhP5pQWYbqDNP+dHdskr7l5Zt?=
 =?us-ascii?Q?H3UcI697S0pH2EXMe/3b3VfqekznyiG3lZ1PTbsvtvsJNNRl3xUzbnxemNAe?=
 =?us-ascii?Q?7CFnLQzdKuaTOKG9FVpWz8sL9B2fFGRHOZMizjfm5ARujxTTGuuFFsbdm8Gp?=
 =?us-ascii?Q?cBickCB6n7VaOjrZ5j9u63xlEO8Gw6+jJHWq6Nj2YUPtolUKldVx5McDR6/f?=
 =?us-ascii?Q?4E6NBhW67W4iZLlbxVFpJy97vI7GsLahEgZfra9VVo+UVrFOVAc3S7mBgDzS?=
 =?us-ascii?Q?kikYA9tDIASSv3hnxDA6sXjPTGs2FH7fuS1Jm8+ZjMi9RbiOEELpIbSDmS0E?=
 =?us-ascii?Q?hxKACtuqJ7mIF0EIVT7ITEZ8V7UcGkm+cdwTz8KYS/khH+aasDrfIgAOkbII?=
 =?us-ascii?Q?Ltk2xWHIn+VtjuQxC6hriLdXYg6FvjEH6qGgqUuVou/spgLUSfPs6KmMvoAc?=
 =?us-ascii?Q?CZX2wCqCfGr3x8dEkUadrmm+ZU+oxgEp0Uf26GlNGmodRthxxHvjXOF4a75d?=
 =?us-ascii?Q?k8dHj5WIwI5Qsira3B0OODOcHcRj8ZSNOv1LE36GaZoxknKhgGnr1Jg0Vkpe?=
 =?us-ascii?Q?JkpkJw9hdrDA44QlINoq/M8pCFCZrjhTM+IxbtQzrO6Kqmiihxa3npyvcq45?=
 =?us-ascii?Q?B2Bj6HAlHw4wYIpnWowUH/211Ye3A2XQzRHihzkuUsIkZGvd4rPVvXtZwR8E?=
 =?us-ascii?Q?O5bbw/p62EBknjnwg0FiPjidVv2BxLKVWlVxrvovRYRPh5ywLASMpn92fySY?=
 =?us-ascii?Q?V2CkiNN3RknCSws2+lKfKP6h59hc8GnT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GtTtTw1FBlrfrn3c9Wlt/RRYRmxNkuWAN7N8AIGayBQdIYEEfWrF5z5ahasG?=
 =?us-ascii?Q?5zsTb+vERlH9bwBLrx0XSWqtiNqjWopE0aCwJ0JWVsr6YAiF1dZrWRQXytfQ?=
 =?us-ascii?Q?AuEOzGIQZbWKQOiYeHjwpnfXAMAmtpE2T+Q2x9fHAcE73tv5W6GlvSsYlc/n?=
 =?us-ascii?Q?Dd+CyAZN12mrigBVku8gW2mqKX7HXWbQpPXIOuqtuCD9BHcLDuDdBtsqnwO2?=
 =?us-ascii?Q?FOyOFytc6ybWY9sprnUPoQMEBatABqWrn1zCW6to4cZbeMJ++goZgl313NV4?=
 =?us-ascii?Q?keVE47S/8oBr0NMsWtmBtiA8scVFjEXfiyvowX66TfrWwla/znOkS7JS0tA9?=
 =?us-ascii?Q?j9+WtSSPm0qt+KKd68C5veeU8IqU+rsN3NdxYjP6/H+lHYS4nUIzju1pWZlC?=
 =?us-ascii?Q?+xVkff6gS52Bs/Sat1Ilm/v0gzasOIuJavta2rkIDRz8HZi6RaMHqSmVw8SZ?=
 =?us-ascii?Q?IACAAvcyyJaD03+AErNEBbQ2O7o0ON8J9qf2kdWZNuRl9JqsGPyGZf9RHAhK?=
 =?us-ascii?Q?B1JpHUOJRcWqCboG26F0zdW/Qmj3cjwpG35Tu4lf8jrw+eXcB8awNj9mUAcN?=
 =?us-ascii?Q?RMU3D19qKR2TBB+4NjNixp7xZ6UsEwGxXklfaFdV0vpadn29eQngKr26lz1t?=
 =?us-ascii?Q?lIpJejAyuHXPGT0YkD1fJ20cZwppVhkVSIwNcEGn/LOvRYvCVnr/4aDVl+Fz?=
 =?us-ascii?Q?2yftiWE1SGTYRH9+ifOjiNvgPG1pnznTIiSUMLtjCcDJp448PGu0RfGhqFyG?=
 =?us-ascii?Q?wyWNWf0Q1dzI3RiRATf2YzjqFXOwQqMzEHDlSn3c/nQwGHlDiwpL81EZA9t1?=
 =?us-ascii?Q?b4yRnxJ+u8cWDIA2iA3fPWQSin+W4MomOXECyF+J+CvOfH2GidSLmmcv1buY?=
 =?us-ascii?Q?n+Eol7HFm5c28XB6jKG2/qt0wEhY84EMPXs5NQItN3YtmlJ8BGery+k7uksy?=
 =?us-ascii?Q?lao7R/jBgnXcb3BnYJJ+RUyowdVwoNSyrZU5OWC/L4zOmNup/lOpFybpGyU4?=
 =?us-ascii?Q?qBJm2NR3qorzd1Flx/zKVoNPpRzX2cNQD4QR98KFfmGmy7W0oF8XNAHf3rxR?=
 =?us-ascii?Q?zaN0Q9nBJ+VSLT9E2Mb0mRELZhmOfwwVZhRTKOdU+ZGyXixySkKa/Rwygdep?=
 =?us-ascii?Q?f3u19mC7kBjs1igO+3w0MpfAZ9Bj8Q1lCBtb5k02hAiydpaG5ThLiI7DcTW3?=
 =?us-ascii?Q?2Ok2un6yz1ZuAh642CVtPUfNOprvF03ZC+C4js036uoO8pOCgAgrDsKW5F/9?=
 =?us-ascii?Q?4ntYqfcRhA6L78TMr9C/PQIOPjIk8J7QYL67MH5z25FXNBtMyDY9+9gbfKRw?=
 =?us-ascii?Q?r57xbR4dVm0tay6bfuvIW6p4+5iVJPKmUW6vXnZOOWoebXBn3wFaDCH3SFcz?=
 =?us-ascii?Q?i4rKkZO46Dh/2sDVemqVcvkLXESuqF6KZBvJkDCcw4Iq0gcWM3J2HkUMyene?=
 =?us-ascii?Q?NpeDv9jt2VMKihiNj5ATBqlXejV9d9qvx1DU3pAyzvhxwi6Ga9hJRv0Me+xn?=
 =?us-ascii?Q?iZLKJd0SsWQeSrSqF4Au0s1q3+AIpZIRXL9ZbwibInc6g9B8VWlwTyYIKZUi?=
 =?us-ascii?Q?D2WLW0kb6MwAnT9OL07VgHzx8ScSxhiw6xV4n15lb3IBpVS4xvwxK7itB7cB?=
 =?us-ascii?Q?tw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9911fec2-1726-41b1-e9ea-08dd718d3430
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 02:22:23.8413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9drof6r/n+7YBVKKlNo1wjmfU/UC6fNkWs5C222X4QHU1BLXdl83G238BpSiSvQYunFm+cgFRl99N1b2/Z1iHnCWTYxXU724V1mT9KrryM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7983
X-Proofpoint-ORIG-GUID: TJt8NNggUx6kykAlWzfuSAkAqEWY7DIh
X-Proofpoint-GUID: TJt8NNggUx6kykAlWzfuSAkAqEWY7DIh
X-Authority-Analysis: v=2.4 cv=fM453Yae c=1 sm=1 tr=0 ts=67ec9f65 cx=c_pps a=l9lnEPKonMfu/vbXsUzXcw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10
 a=XR8D0OoHHMoA:10 a=H5OGdu5hBBwA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8 a=SyhLxLj4qa9Tua9mRCwA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cvBusfyB2V15izCimMoJ:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_01,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=757
 lowpriorityscore=0 mlxscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504020014
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5321uWuO017022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 02:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214167

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Backport a patch [1] to improve performance of rand() and __random()[2]
by adding a single-threaded fast path.

[1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dbe0cfd848d9a=
d7378800d6302bc11467cf2b514f
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D32777
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...dd-single-threaded-fast-path-to-rand.patch | 47 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-=
threaded-fast-path-to-rand.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threade=
d-fast-path-to-rand.patch b/meta/recipes-core/glibc/glibc/0001-stdlib-Add=
-single-threaded-fast-path-to-rand.patch
new file mode 100644
index 000000000000..736fc51f3874
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-=
path-to-rand.patch
@@ -0,0 +1,47 @@
+From 4f54b0dfc16dbe0df86afccb90e447df5f7f571e Mon Sep 17 00:00:00 2001
+From: Wilco Dijkstra <wilco.dijkstra@arm.com>
+Date: Mon, 18 Mar 2024 15:18:20 +0000
+Subject: [PATCH] stdlib: Add single-threaded fast path to rand()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Improve performance of rand() and __random() by adding a single-threaded
+fast path.  Bench-random-lock shows about 5x speedup on Neoverse V1.
+
+Upstream-Status: Backport [be0cfd848d9ad7378800d6302bc11467cf2b514f]
+
+Reviewed-by: Adhemerval Zanella=C2=A0 <adhemerval.zanella@linaro.org>
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ stdlib/random.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/stdlib/random.c b/stdlib/random.c
+index 17cc61ba8f55..5d482a857065 100644
+--- a/stdlib/random.c
++++ b/stdlib/random.c
+@@ -51,6 +51,7 @@
+    SUCH DAMAGE.*/
+=20
+ #include <libc-lock.h>
++#include <sys/single_threaded.h>
+ #include <limits.h>
+ #include <stddef.h>
+ #include <stdlib.h>
+@@ -288,6 +289,12 @@ __random (void)
+ {
+   int32_t retval;
+=20
++  if (SINGLE_THREAD_P)
++    {
++      (void) __random_r (&unsafe_state, &retval);
++      return retval;
++    }
++
+   __libc_lock_lock (lock);
+=20
+   (void) __random_r (&unsafe_state, &retval);
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
index 8373db2c4f41..e4e2a766d70d 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -53,6 +53,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bi=
nar.patch \
            file://0023-qemu-stale-process.patch \
+           file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patc=
h \
 "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
--=20
2.34.1


