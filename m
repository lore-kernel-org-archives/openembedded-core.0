Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887A3FF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 08:17:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34255.1777969012368530751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 01:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nljeWwbR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9585136d0c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645715O8359265
	for <openembedded-core@lists.openembedded.org>; Tue, 5 May 2026 08:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2lBSQgLRBHLojoxby2vQ45GQ3gxt3uG8h0g0l7aw4fo=; b=
	nljeWwbRAZATMcEY6LBPKDhZPwsq/3o+6qr4I/nfjH1c1U+posJcL5FlLuHzany/
	KnzYihZDv/QRvjXRlIT7X7/MnqeCHj/iNb5HE+G/wDN4JYPFAKX0OQyiTq+1d0x/
	A8BIUb+tXWP7u4BHwdBS1rBIB5fHZV2mP25Q9MPdwpbm7q37m4JeDKdtog6tSYk+
	X3ud7J3ds0uNt8mh7DSTuPb5QQ+QL9qoKyeBxjiSx/AciJJgbUtPQJaX4jydxnpW
	qOZRoT2ofvW/7xViUsc7jFMdJF3qOI8plW3w4YfrXHFpwHugfANUtT8ZN3Cf5cIH
	hfIiHnEPMr3qUVoWLJVy6Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8t5u2xv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 08:16:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbITD6noQrMKTuC/jyvIWAGIyyf9eMHpXM0ZqPgbBCqf7gvj2yZAJTROGwkrK9xuId9PDNhyVSGvUmzBqNOeYFVQynuHO52T0tXbbfivAZRdLgTivf7enM52iGVpnx1axDTGaPY/11ydmkT8DzfpVCT0o5XOa60qxKwjkzYEt3XVhL5dQOHu1OIqMjAgHobu/iWFrU40dFtKO4WkfsLJgteNY+OWRFXKhHgJpX2iCh3FbeD9clKU+2BMjaJSWwWdnFtgyxsSGaJpbVfFtxHVO6y1fiWmnHqo+G42RMPSG/9+cVGgAu7t0K1PzvnOMaBvk0O3yptgidz3PGsgANrjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lBSQgLRBHLojoxby2vQ45GQ3gxt3uG8h0g0l7aw4fo=;
 b=nZ34yXarWs7X9ZsUzVaGTG97Vd6QpNfO9hwERx6zgilYI1d8c/I4g8PbwtIyE0EzLEKc3ObNNbzkq5dkajBqcoDu/gLNTPSW6e1qccQQMHV7T6kn1vGYCLKq67BfXnLZt2lJdk+6Td1iOp4XNGOhBPT9b3OQOwIn83dLyXxXcpuuPMjIR6Eb0pbN9WGj8TdbT6AwKjbrRtC/bKxp/EMMdzRVDNu6EuwuKz5uLWUjLpUgEVjmURcAtOsNZ/YICS/cjSkN7rPNcMQIkOb0VKlqt5LOzYSl/un2rr7ShK/Ncw/cQBFA+ZZnnnki1caVgu50MFmht8PqG/nH7HcafvFHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:16:48 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:16:48 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        mathieu.dubois-briand@bootlin.com
Subject: [PATCH 5/5 v5] rust: Fix rust build failure
Date: Tue,  5 May 2026 01:16:25 -0700
Message-ID: <20260505081625.849368-6-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH7PR11MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d33e6dd-9745-495c-ed65-08deaa7ea5c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	MjCTwXX4Qx9dd/gUIItZcA6aiG/0qM3jz5xeN76E4WpQfyAy4Wiwwpdp6d1eIhe0I3ORVhqp+bDp+LqMuAFyEzMOrEa7gSqc+3KaIs9e+fZY7scwTxkv1UR6DQxNnBxnVPN9EJwtkJ9/GGPeDyzaarXDXuUNQC+LOKH6K6fzK4GcK88e2qg/7DHvD5qyxUG5Wg+PcJEcIvSH7qaIOZctadeA+E+YHAjm2p/klcr0qoYc9TOL61gNPkoNRSzmK3Xb/1YFXacxJsGPzsF4YA+Wf7v5O6sdFy5hJKoVBgo3GqUrNF0Rep0/d8UfalfUbA5A84eqdJ8GfKDB6/xe75wMlLrERUtGRtxUERYvp6YeRBS2iPdboDizxRG/OobQZ90IbOLQx2AlT5bZ5lxG3I2G7id13BJ0ucCclCmrC8xRWpdglpXryMyljO4UInxxLXPXdcCrngX6YxKhMCgc3E7NNhgP/caNynAhfwW3I+fyKh7oQSXdEJtBMtSbE7oNPkZaBNp8b/KGqhJ4kwfTbk4oRc9l7/UM9MGY7SkWmAUqOC2qNJ8UQsjku3A/F8BdbMS2lb/8Yt126b1CJ39wgv+vxsIPr4dOiM6256VhhtnwhKozK2CdJVbcT30iSUbcDpYEbuMHCZXVyRV3qhdMDYXBe7djgo3jRIeVwCYXj76286Cle6EI9uFWfvYGW+U6SNpFfUYZcrUGhg2WWro3h/TA1tFV5FGccuIv7DUkX+eossaZZ/MAuIM0qNHEy98BJ1rV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jRLum4KW4PWpjR6VAp691rj3nJzxNK7M1AJ3SboDumeik9CufdX+06JjmJRw?=
 =?us-ascii?Q?/x5xQkzd69hWf7y13bW2LV3SIb+LcfJivmU4H3FggJlLBVoRZhtVb8s+adWJ?=
 =?us-ascii?Q?SBvuQB1S2HLX7MBrigQmcpHvr/UeTkLB5NAAJHCUPAYV3dqQGajR2rm/ij5C?=
 =?us-ascii?Q?P3UcHb0Gei93JCHK1vBYefyIk0PGAImwUX0r5AvIQ7FQHG2g2uNA1PCAKFp3?=
 =?us-ascii?Q?TD7oyrTlkybj/kATiaGPGtFh+qfqst3s87sZD+R1cAOOB22h5NN4oW8fKdvw?=
 =?us-ascii?Q?p1FToGuw4PpeCPKXu8TnveOVZ8UQZdNHaq8/4BFyyV2sj5lAnpeM9VST9or3?=
 =?us-ascii?Q?6gONbhZEItCGp99Qj1M+FAPO4YF95hnsNT4p3MSEQaqzf2+2KE5clvOW34mq?=
 =?us-ascii?Q?U5m6IuF4qHPbikSHhTCeP1w1Ej+HSOO+8D+o6prY1mKfdFmTUr8eQ47N6c6S?=
 =?us-ascii?Q?/RcRDy3Nm+7UrQMSiuVr//88bYh/TBpRNinRgfdJE4QhyKa/8rxbkLlMl/Po?=
 =?us-ascii?Q?nIGar1GUbAqvN4LbnwJ2v8UmZKODhIC9nAUtBySAvXDIhJ4hoiEWP/RS23zC?=
 =?us-ascii?Q?ZZDWq90Wox2znfPL3iwqrjqWE/+3H6NX+trQJsRBmbxmosO4Pnru8rJZwT5z?=
 =?us-ascii?Q?6E5twjpXRkB0DEG5Q+hxT0PhfMbh+qspgfb+9H0jSE2YNwhtqCike+NkNtSR?=
 =?us-ascii?Q?EqFqi/9miMwF1EFP2RZ/5W1l7Z4Y4mWNykJoSepsAoqGt8BmNzPAdBcEACRZ?=
 =?us-ascii?Q?U5EkdDzX6A+YfjtkfEHTVXPTuOvYbahTvz3EzqY1tqqW2MxfKcxZS/FSoQmS?=
 =?us-ascii?Q?sE9wuv1L3qtX5Sy4XTU1NUo4s45/OyL/YvZtLuUIJUH4ENvROjLLCFyQ3ddG?=
 =?us-ascii?Q?hnaUSYTw1oZVqHjx6NXkaqbHik8yOYRF0MrDA3JFY4QknzF4c1bQ4ZXC85A3?=
 =?us-ascii?Q?XH8+BEXESz1lbv87a2ObVHb7uwYB1BKqAyCXp6Vvo7V4nQS7b5tZYB9EHTfp?=
 =?us-ascii?Q?sC1cw+LCV9CRkqQJ/ig+qy99xyd3D4qdUsxjvC5F9o2KfZL4+oUJStTEL5K0?=
 =?us-ascii?Q?fwTWcTxaPtZn2pXIl0rv0I36zILiVot7rhZOib2tz1lMrp+CiOG4LIl6Bnm+?=
 =?us-ascii?Q?wPfgV6j4CYW0o7kCV5V4c3tdEK13sNKb5ei1Dc3OVoJ1rpY7rJFBlbgff1Ri?=
 =?us-ascii?Q?auI2YbJZ7N3hL+xV9doHIvfcE5ysmwWHD0Q0ZPOceW7JmWlD0b4z92tRCJOh?=
 =?us-ascii?Q?KNnNtejvt8/3Nt/b0GRPT11dXKgrNUVA4DLhKNSYFOTflquGP/XKtWbBLBfS?=
 =?us-ascii?Q?HX4grhm973NtGrXJyHirQHuTlIE12wPuHv8v9KLozIi8ewz5UB22O5chz/rg?=
 =?us-ascii?Q?P4QLYUtnjMJyVh+i3VdYt2XTiIUNoA7CeR1A19Rcn4UPe7qQQdlC1NCfIpQ6?=
 =?us-ascii?Q?7w9T7W4FcrDLMlPtD/7Eo1rGHYrL1SDme7hu8dCOc/HkCuymI4qCQQfuEfF/?=
 =?us-ascii?Q?TPXgjduVtXmY8ONjsZOkmwN1k/f4eFYyuoaRBMaYkqzVBSY8pZysIEc7S+1l?=
 =?us-ascii?Q?y0ReGautJ6rqgRPISIak44fCp4bsy3RtOm0/YBqtxXHtFnACDI1s/LZCl2LJ?=
 =?us-ascii?Q?PdZ9FX04EvGbOJCyPJDGiA940tVnwskMmyRZlLcLvwIa1n6nbxhSagdNBuWs?=
 =?us-ascii?Q?PCE8qOSTaki+geWOOkVUa5zqOVLqoZd4rdpot29Ig9Oagqb7nZEvmhl4A6Lf?=
 =?us-ascii?Q?6tn555OpAHXTWB/mFDmnWrWrqqzEhzbw3orRX0YMsU1bgo6dW3em?=
X-Exchange-RoutingPolicyChecked: 
	QFnphJSVrcQ9NOJ7/gSRsnm/qZWKVH0D+pHOqBaViviFTpVhwWomvcB4TGnnOuOZ39QON8Dq8AzubcOIEvjooTSeNFoYBLwRCxD3RygoF5mq31gYtyEf/WD7jsd4ZGnsi0M0+Q4Zv+DMXXDJHtoQW1fX2cVtFRCCQhqQZQuRW8wbuP56GTmV61WElGePmz/JUqq72wm7Diq1jM1TjzcFJZE6+nZ0HoKe5w9u5nQ3Yjf9gay/loPGayVCbPiJF+DWu86lYjopE+jTP+k2JiP3u3h/z246sWRY+/IqqGOwmUUN8cCU3hr49un38QA9ivYo/3LV9yN5bsjN0vk6rydQbQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d33e6dd-9745-495c-ed65-08deaa7ea5c2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:16:46.1127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EffQqUdDlOGNZD6nSEnw1jYSKF0GwIHAMphv85wzIWudOGOVU7RiCE5iioAOSQZE3I94mhaYBJW4FWoMD96aO2S/tr9ezf5xDCEoVmVYmO2WSEfSZqlPKYp45XM5AJr1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3NiBTYWx0ZWRfXymP7H85aFd7g
 z9y075dL585nanJYyQWqnGBOiEkSgpEDjjRC1FUezzjeZNuEtRJ5qaQKvKRc09nSmRfAyEjanwa
 UhKAUa8UY0TGEQlhc5pUB8P9u84tDOYB+efGqIW87OIhEIeSjpaO4pYoFNy8NeN21IHhWAuEVDv
 4EJJPTgH6SqfWEgxKmbyw/VrAQdosl6UfbMe22hp485NvxQWfhgJkH61EIjQbk5td2YUl38aAn0
 OPTo5KO2uyQFCqf7EwT/lSZZCUgazwiarprF7Rd6mwrrpqRcvOMzgIJR+iT7Kjs3V3ijhioeAj5
 tK68QZ59Yte7Apu+ts9X2XsPHIbs1DXF5NvqxwJoaQTGVz/dFwwV0U1c81UtCdHv4pibeD8JQDm
 bQSwYWJFE4q5xJRRAGQZOCkX68moVW5O5aS+mRnEcBM4JWptU8cg0Bf/kGBbsTf2a6FyHAMcGEk
 LFX9BLs6vtr/if9FGxQ==
X-Proofpoint-ORIG-GUID: K70LrLMrIH3ys4UdBZ_FJEmkaMbMOY22
X-Proofpoint-GUID: ctCmK1WNaX2B7iiVVsCFLgGujbDWv7CJ
X-Authority-Analysis: v=2.4 cv=BcLoFLt2 c=1 sm=1 tr=0 ts=69f9a773 cx=c_pps
 a=cRSuPULe8LMj8fTR+fkUeA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=sVl56ImUswJAfxa-z0YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 08:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236470

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
2.44.3


