Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9F7F531FC
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 06:38:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12886.1776148700397877287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 23:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X4A9LE8j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85643df1cc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E4nP5r4061097
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 23:38:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=eJ/4BWvzN9VNo8cayYNTrSCGvnGTQ6tVYKyQCLo3k3Y=; b=
	X4A9LE8jx6y85Fe7yW3lil15BpHXJaSHdJHDNuJbgJNrZdc+Am38Ni1qGKWRhrxl
	a3tmfVzCwTg6zL4Z8yX0R5Oue9MijmFa8HXIVmEharfhMOCvT6UMZVSgMvvWiTVh
	6DAod+hPLknrK/rAtVMA8zrug6BO79/YXHah5WMV/+GOK3kNVFJLt7qtHb5iYs2s
	L02ANnbc0CPCcGCCm5BXoD9kHLv8JXrT+62/T9pem8Pz2juwOd3I//rtKjSuvJYR
	QxeBSsYMX+NFAa6VNQ/8ynkSgq8nKHt/2BKJgPtg3QXibPlKQ70BZLQzwOyEBzeV
	NQR5oBRTg1oCqubQ0QBfZw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh86m8c6h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 23:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MY3JQG6oca1Q3VL6Y96TMrkJyS3GNhuO+zbA51cJs3YL5Di2XRYKKYhyocFXLX2JAqJeiY2HqDwhgl+l8HLWK4nbyUcAoZ3M8L9oj8Q9Wzwe8jvsAnx+HlGJ48uIvJEFoRu35dnuXBZWbdbTf8iWdp6zhWCt8ougBvpBo4Msy7olWKzJk5gOo5lN6oEX+VK/8cr7VnE718XCrhAk1a+JsjME4XfIhS56g7FL+wOjZKFIyVX3DLPkfMyf/yBCYTHNZN1qkISF0Z5jSYVt9ya0ggviNGuCknSEkZeKYry+EAuqOH9GKw+7WvN1pAkUZV/2TM+XVsJ5vNcjUhFJoxBl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJ/4BWvzN9VNo8cayYNTrSCGvnGTQ6tVYKyQCLo3k3Y=;
 b=CwCrHSUpJAtahIg3Wlt83dI7pXbdz1S8Zv+jdwFaDPr2tDH/rczYNh1QhdLpqickzZDIbK/Di/NXicFGfP3SikWCMVNuMMdZd3VCF15qjpqLAX1Jf3Ux/SFcOGic7FK6seV0ecOZRpbuYiPkNMyivb7GdK9beWrd9A/RVyHmcl+dIq3ecWWhdrgJ+zCs8h6vPmD2Bzc0yVUkrb7DCd9oxDjXrvhl5t0kzyvzSn1MIG10/BDqjpfaQTyYiau7q7ik+DpWmFhQlUsnuje0guv6kIcnSt7M3RmAaJZfqBxrgmdy4UmDFqFT0bILJt26GffD2NqmloT1AiWDqCJuQi5/2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 06:38:18 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 06:38:18 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 5/5 v4] rust: Fix rust build failure
Date: Mon, 13 Apr 2026 23:37:50 -0700
Message-ID: <20260414063750.2315189-6-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260414063750.2315189-1-Deepesh.Varatharajan@windriver.com>
References: <20260414063750.2315189-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: efb1c51a-c1ae-44bd-0a29-08de99f069de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	zMG8XrkkNvar0NcjCiEJne+Exo3AjlTiBpp3LZqqn8DLDZiw34PDoS9mHAgBVRrO/rJz8Nv8PhRUqkOrRcJebEeU/9bHfdKp6fwu8I1cIhsWYrfe/pg0ymo7pKW/Mbw5hfXG/6Vb5y/6YFzs1ivzWhVjL4uXMTrUQHtxZO7HHgbuL1csDs0T25yZ/ZBG1VU6yxB9083Ri7NqhC2En5+6SzL6HZQTU/eF8+kSAC0IxE2EGPp6vTwk+NvAHuelLLuWPATAvkeOJNyOOzrgimHXRDBhQhAMubjQvl4B1JOVToLq2jKwnux1OpDT76xD1gsfxYi1tV45ByhAPDbzEecsEcVekg71iLnao+l5GsvfuQwADU7CHtE+x62WsebewtxpKfzRQZkbl/9aA/HC7DrrGltv7iE2hD5NR4LO9liCS+eMJk4tlZIqMgUq51KebL081BJledus+HUeFTNOlVqi/Jfw1DHABwlTP6B9ub5fusHr8ghwU/yjNdjyzFSL70G+qwxm+yP9k4SG1bRdSfEXihUxnsCBcY3ow5tpnalMGO3FquvO09mkWyT3XkmV4pRdcM3ESK0lhGN9gme7+haLoBRdsObt6b8sW7/FNDZ/J0LaSuGLoyKgrFBiJD56DihgwSMvtNW5NfXlTeLOMxB9ltVGFaJ+oxRBDJQ+mSi8gQI28Jg6TqZkw1Zn9bZXLKTaYB3soPoHgv4yNag1nCu7zWBY11PmPULdkDEnoAID4751UGZb4r/AOExoeIF4WDTBqa0XTKPgfgbXdq5hpFN04qS4l/VNbac98VdSErGJB98=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4nH09FP3QLp3AWhFR7UvCC6iKTFlVxc8vHtT41kFhHhoqkEiYN4O4PIcvJ/z?=
 =?us-ascii?Q?TI4TJNXm8A7KsEWm7u7C66RLN9wpCHxJJgZYAioagih9ozi1HZK/Lxo4l+VE?=
 =?us-ascii?Q?+3U8E+RaONebKowS0U0O1l0BH9b4y4NzA68yynz/o53gLFrnWl0TFNEB3/zm?=
 =?us-ascii?Q?JaGx9tcEvcNGrD8Fy+z6JTm0JLXCFXVZmTdMSeazCbgQ47lOmDmTwddkQKrw?=
 =?us-ascii?Q?lvu5HecyfaNNZiKqxGX5uoyk+iEkcmHAkrQORbbVSYh0cMKZmnpR2bGzqvdQ?=
 =?us-ascii?Q?INqVMfmmWUm8eIyL7ZLsqtBpeObja33xe0ZYpNb3+Aod/piUdUGQz4yyA1tH?=
 =?us-ascii?Q?9cSLyXdOCsbO4h7J+8zXNJza1lDzMvl/TXec1XDFuE2nGkFji7NpFxpeyBlO?=
 =?us-ascii?Q?F51Amz8A5c3uhahucdOfWPYXy5PwEvGEuUxUROXafunhzp3yT2YeB0lUsLBV?=
 =?us-ascii?Q?wsq+nD1LCH8wS6atmwd71sPF1ZhmmIxMMX6HN2g/to2KDCOta15r6UZ5kUib?=
 =?us-ascii?Q?gfp6spiYdPqYuv/TGdvcDMiNY8kHBBoqTjzQYog3ZMY07jvlBIjXAWlbtRCH?=
 =?us-ascii?Q?ujfheU1nTjRLw+JTI403FTzA99OLgDAPFcCvNDJi84Nb8hSrvRYvHVnhcxO3?=
 =?us-ascii?Q?8MWBDMOnEyO/cq0b3IbWU4BXlRLR0HXbr98ddecgw8acKgr6ZvUqZxvmDDO7?=
 =?us-ascii?Q?U7hzPuTigWFLnE+bikaB8SqQ16lLcD1FmY7IMio16TFPVOHwUNahu4dk3zVi?=
 =?us-ascii?Q?WtLenDBCtgWTzmYjnKazbYh+StJjPn1xPi8Qz2LsOKTWA1IAhSPlNAahAxSa?=
 =?us-ascii?Q?JmNB53DEugN9sSWw3QjejFcBewZ0Wbb1+zOyyUB5xcpQ0zP6t6vUHLTp646d?=
 =?us-ascii?Q?U8o+0L2qyJ97w0t+2WmDgu/QZHGJEAfzYAA18oZ04HeseNTM5eMAy741fpiS?=
 =?us-ascii?Q?pMS8JCq1lqDQnOjkJfSZc0k8Tyu++ZQ+zzM7E+NedqkQvAulQFLM9lUQT/vZ?=
 =?us-ascii?Q?dqc8/FogGu1Ajc8+kibQCAemRxrlBagh/jwOi+ebtzBAHnopKP1URY1hoPjH?=
 =?us-ascii?Q?8b/pCdIEQ8TDv/8zroSP2TafFFvx/RdF31vDfHQnQ4yGyPwXac9wpfWR2l+h?=
 =?us-ascii?Q?fWdZnQsmPZjvEKYrSqawAIqwD/KAggbx3vgHJriFGPQQWTZRy91cJsBtdsLl?=
 =?us-ascii?Q?0X5xV7Xdpn5pt7h/defO4F3xqc13QwGIyTbkJYbqDFqyW56K2fFFpGp/wRGC?=
 =?us-ascii?Q?3wcUmgztlIxN4an851kju0MbsMbUTjvrOfaQVdN4ZtFu+7/R4qlRptcAEfeT?=
 =?us-ascii?Q?Hucwi3ls+xvVgdoXimOLpe3ridXjcipC5qxL1zAH1QoqGPb+2XHiNSkOn0Cr?=
 =?us-ascii?Q?Uayl8YWVr5GoaLXBlGKqYqyATON+j+mzh4iDlO7zAlEhnVGyTO1zD2ArPKij?=
 =?us-ascii?Q?EjBU0CGl10Yn7daa8oFliumgUsSJbqtJ3IeDfWh2FZxnbMVMby3fM9/KGT9s?=
 =?us-ascii?Q?T3NB0MXd/OFtLNoPFYgvIyj/+r5RfxqcNfIIB87NK/FvYLi9fg7W65DVYMZl?=
 =?us-ascii?Q?WFFTavQo1RVL8prRQAxmJEsztUKU0awCzRqL8tw4AdLJ0z5d9q87E8chwiwG?=
 =?us-ascii?Q?iGs2edphqZlnLdH+vMByh8DTAJysKCmqyfWKEFUoLEb66EkzFzI1w1lPk437?=
 =?us-ascii?Q?JBpw9ucJDq/sPxg0B0F7hoa35IxlhDb7IBg4Q1ZQoVbkVJKIYsTIFtncv7zT?=
 =?us-ascii?Q?bRFadsEXceRCyRNXlC+FneD5AoQ2e3hy95TT6oblOvA6OZNbOryu?=
X-Exchange-RoutingPolicyChecked: 
	kXOL15DYFmoZZntzuSxGvipfZa33wp9Echp3MAoghdjH1K8BrfOPgfVcAO+EVlfQx6cXEeLyM6VWdcniytcShoom7nvVglVcA4EDxrFQcxbV7V3CDPYrK9L4Z3fiBEF2MpcGcbObQt1L59RdEaA/v7y5nyoureX5BffwUoF0Rby9PARChXn1WAqeU4QqXpYNOth7opDdHe6NsVdNZuGmDM4JfCTB0Tz4XZOHPG9OpExJKTEH8DR+nMK0m1UN6ILzqHGjxDKvgOfQ1oBtzVGSgfdhaPoiufY0xF53Yvbxj8qMzjsJUmg8HXfZE3kOMFLlAnLFB8hNKQP4UoIKvAo7PA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb1c51a-c1ae-44bd-0a29-08de99f069de
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:38:18.1295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BKyzmj7/ULeVrpmlUxJP3/ROIyARJtuvubyOuJNo8L91/0YDzGf1HikiLupRwjiqCkGLkioSjaHbhsVtkWJV+f7I/8sdW204P0GIAmJ02kk3K18+YQtukv8J9/upWcP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
X-Authority-Analysis: v=2.4 cv=Q5riJY2a c=1 sm=1 tr=0 ts=69dde0dc cx=c_pps
 a=COQGWIG0gBNyFO/LkKr7KA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=sVl56ImUswJAfxa-z0YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: v1HqcgQDARRnWCMl-PeYSCj3YHu6pMIu
X-Proofpoint-ORIG-GUID: v1HqcgQDARRnWCMl-PeYSCj3YHu6pMIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MCBTYWx0ZWRfX8mwmdc40h+C6
 EB46+3zHIeFMsrLZjbsBSh4XLWE1UbRLPnqwE/0Qc16W1+bG1s4Uv3i6CNEoRI1pBmkDkzNN+EQ
 IGY53IHnwJHUZU5Z3khOxtN2jJGnrZlLhcRVTQ6u5hxP9gbNmno/f4O+AkpLl5QgoPrND0sQXTl
 ZTQpwgblAQ342Q8oSZOHKzIfax9EECWW06gY9VYBoHDzJ1ckpIUVLvVtYwbuyYby0mqV8+YMimN
 aP16O3xCRubwKxVXzEzPy1/1KA8oirFVe154JZ9ansvZZiBy+xNVdXhvJoqUjFxxIn6TBrrEhY4
 JMPdO42KkIuqdkWT7Q7fjdai1hG6bpCnPxBgM8Qqkc9rfqezt287Z1bX2HF+jN1kxAEoVORBRyw
 ymyIBwOP5ZPns3h4aN0gVT+OefEsHqpHYMHruq2TgoX1is3InRWJ+ocDr3n3XQ8DvGNn+euuFqf
 Pmwl+J2sFW0y3deNoRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235141

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Target LLVM tools are installed in the sysroot because they are needed
for llvm-lit to run tests. However, this leads Rust to pick up a target
llvm-config that cannot run on the host. Overwrite it with the native
llvm-config so Rust can execute it correctly.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.94.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.94.1.bb b/meta/recipes-devtools/rust/rust_1.94.1.bb
index 3eb2a36406..e4a9f20e27 100644
--- a/meta/recipes-devtools/rust/rust_1.94.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.94.1.bb
@@ -238,9 +238,10 @@ rust_runx () {
 
     # Copy the natively built llvm-config into the target so we can run it. Horrible,
     # but works!
-    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
+    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} ]; then
         mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
-        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
+        rm -f ${RUST_ALTERNATE_EXE_PATH}
+        cp -f ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
         patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
     fi
 
-- 
2.49.0


