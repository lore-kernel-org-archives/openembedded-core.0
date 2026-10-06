Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D51CA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 11:56:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43823.1791287791211701863
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 04:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CJMrMEyH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=47390850c1=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BRpHx462205
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Oct 2026 04:56:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=2oRLGiIYP
	xVV3pSLByrCkBIujMADxiVHCC9Z/MtRG5g=; b=CJMrMEyHsRtcvXyQJ7EJNuh+t
	coxeHiLd5XbLCmOyaONaDEN8jZWb+EYO4tcVMQ7FcHtftCev6MiTkBpGQxc6d9Lp
	HG2O1rp1bQZYeiXo3kDENRR4st9t0crkN3cm6b6I0CHK+91lrQIbEKMjvUo6jSmi
	t8CAL7AEqdfx4ny74ENrrtf1pN409jmPUo87vY/QqPpjoIMXrPvDszw+52f6DE3o
	NOII+/XGXsuwpZ/gMHAV8rm2VjZulW/zq64DSK8QI2FuLenNgU+58d6m7j06bcG2
	k9LjWuHJ+escNs96evovt9Ls+nSvFxYEnIvv/oZrsenHi66gEnDMePfGvjhJA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021077.outbound.protection.outlook.com [52.101.62.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h2w013rm6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 04:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4ZyJa9r3i+VRsaAuzjcqBYKnVUU5kFUrl8GYvoJf+fTooYIW/OiBVFhltL/hZDMRJV8MqnRpf9ixYGbdKCiQfDhQvoGYuFGBShath0Z/PEUGirhSqf8rPC39iE7xfjPxA/XrWZyxtI7SE29cGdtcOv7OwHygwjaDA/dh/7jMOSO2NWQULlf68+B5QbijsB3Q2xwu1TiOliHJj5zxvFUyMQuZWjHtZmuAEpjmSousdAfwNREG3duWiDesNJ5fGKRoNCkDn8u7mVIuapQDvyXzllK4uIxo5lv63+sOGLotl8RKAXGduahXupLyPXXlS+cknoJPJcXg7x+6rNMdhYCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oRLGiIYPxVV3pSLByrCkBIujMADxiVHCC9Z/MtRG5g=;
 b=w2gDwp7sOi+S4GogsT5oKlchlOmZJ5hZGPVjfaW5hUWI0XbZ0CQMmRYM1Q3dB8LRo0Atbu2Xr7o0nFU4ZU07sCoPH+FOO6G4u8/3ZaBENKa3V5Y5zw2ELw/C3pJpg7Bar7fopFDIiEQOaPzIDM+yFc75vQlp2TZyQG4jxAvzYS3Vzep7R5Zk9OYDEEIANgusN4hnmEWXOjL6xpsiww0pQKLnqCE+3M55XXuLHiyjY21I5kbu8trOrMoFtlIQI3wDGUP4N1XTJWmexE5kM9kFocS3VzY8PLnZRLFzuqzZMIhGIi56WnqJe+L+jaVjWJfGmN0uf0QzWQAQNuXtjRYDzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA3PR11MB106965.namprd11.prod.outlook.com (2603:10b6:208:620::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 11:56:28 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 11:56:27 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH] rust-target-config: fix invalid +v5 LLVM feature for armv5
Date: Tue,  6 Oct 2026 04:56:10 -0700
Message-ID: <20261006115610.1667575-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::16) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA3PR11MB106965:EE_
X-MS-Office365-Filtering-Correlation-Id: 1908bcbf-4209-4bca-6d23-08df23a0da5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|10067099003|11063799006|56012099006|3023799007|6133799003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	jpqKR/qHpTeGjq4fzbe5fDhWUpRI5/STIJ1XPh3jPz0DoZtydm+GK62OA02UtaQFubVMfgtdbSaJKifuklUN5b+WVSVoFCx0LBWW+teQbBLnAcXZFhiooMdBwNrXbWSTvUWAqTPFj4/K48E+PfMZo0KhNZ8FyX1JBHEw/5YPsbA3W23UmwfaS4uGVSAyGZko/VUJ4ARRR35c/EQSDc3JQMVuV57gRYnEvO9fZU2kV2rp9gBJiCJqDqk4fkod/8KaSXfL+8EhCYckXpGMBA1Fh8kIkhmK6K7Qmy9OH2nc4sW01Ikf2rm/1JIrbwDhX3G1bAcsmnhp51ysi++CVb+N4+lXJQuXqrBjcJQyvvls79z4LptPNw6Bh3QKBxIla859eflHwPFJiO5DnqOSpV6c6dvJdYooPyqmuGBBIvpwc8nHQAljdSH2JCI9Pj+U6D0LFqs8rb8aTs0T4FT6V0LfIyDrAJPtZR0z2S7MJSV7Kd51o9pLw+K6s5UM00S7LN8Jr4D4zbe1GBaw+X7npHDMyy3YkCxzlUESj5wddNHJewqHKVt3udUMJnW9H6Exp8VHY/txqd+xKHny/7gG/iBLrejaWLpxayJhVlPpg0yhJ50UiX9ISIHqVFoId228uZtxlsuJxtjYACDEcuQD7l99ESojM+5ej4Jr4nMafLz9YvookErK8oUAQwF1Lmi4TZRhbJ6YSgQG2kNbRWEmWDGKEEjTNBvzt0ew4yz2voZu0vM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(10067099003)(11063799006)(56012099006)(3023799007)(6133799003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ie2KLNklX1R83Q2neB9SyDcXwQJMFkZw/2zJPZujX2N1r+Eqg5Q6Jipml/9m?=
 =?us-ascii?Q?OUAsEZl0rd3OzP1+KaUfdfmcg0U42gtHqIVtKhDEWwJbQslbMrSZmLnPN2vh?=
 =?us-ascii?Q?gLm0dPpAQkNhBEWJ2K3BZ9EOn2jBq54JFSHL0EiSYSj49V1WC4xoWR1YRPoc?=
 =?us-ascii?Q?1Oiq56WYqN5oFT0/QeV48rjVmkC08gyxc76a7P+oeFV+x72zsMlTt3Ant5VK?=
 =?us-ascii?Q?hihm5P9drxLLLQ05rcFgZWpjT9x7l9z4MK5LCXMuIDQMwH3POIQ0w/TdeIdd?=
 =?us-ascii?Q?x8RJcTbz9F82g1iOeJUDKmhMn5g8YEeSKLVi3uuMdbo7MfVtnhX5Xz64Am0x?=
 =?us-ascii?Q?K5g0+w8Q+gDsSN6xK8Qo9wdaeQ0U3BPOkCAeCT/iYeFYATCcSXDNdcMhQ6Xk?=
 =?us-ascii?Q?AXOek1OIDurEfysvIvIG8vCKS9VXeDTtAzgIHKchKMfeYMHu46OPM3az7snG?=
 =?us-ascii?Q?j1lODU7wvmBnjnUv6WGpMMZ4tXBlbUlqWjyZLYXVd5etSiQBVrWvNg7O9Yxp?=
 =?us-ascii?Q?QV0/lRDYbjexxUsLPNAk+iYkYBRzAOhFjwQPv8yvnXrrzQdEyf0v8V7KUV1+?=
 =?us-ascii?Q?D75BVKyhyPsdMA+MMVlbx4f5cepJaGOxN4w87//Ket4ylTfG8CmfeLe3dnDD?=
 =?us-ascii?Q?LLhgRX4SbZUZxfthYafmGvV9oJ6H9lI5NhhGKJ+Tri8WsRo4S/9d0d4dgKyf?=
 =?us-ascii?Q?mdYR4q4wKnj0NL0dxMXDYmaqQE6nVbZeUh/rVzpfZja+IZ36SRYmFYGRkGp4?=
 =?us-ascii?Q?P2kmmJwohalru3KShIAj1FQrDSp5MpIxjxvpM1jY/WOtOI/lq5Dg2DUbuWgQ?=
 =?us-ascii?Q?nDSbMWYzCkRtli1PJQQkeRRHDuKsZnJko76jold2SP0MQB0WX49nVrsoetK+?=
 =?us-ascii?Q?p2VBE6OSu2SlPd2qlqzpXYalwzApgqC3BGlGQ/Qr68FyTzOEy4i68TjyH4RR?=
 =?us-ascii?Q?X2jJqysWQdGsibIBeWWdx3bI/qaHfFMBJjx28KRWQ3ZsCleBMNkeyLXsXkTm?=
 =?us-ascii?Q?IQVAxJ+wVU5M95TEMb/QLisWBvIlaJ41ZaAg6062Nu0n7ou16fFX3FWXQi7h?=
 =?us-ascii?Q?F/kBXhFC8UqMDV/1Ad9cgFATQsMZmXLVNU/2SAkUPjHlYtFKtiTZ5e81dLpv?=
 =?us-ascii?Q?v6X44+S6jwTEA/Tx0is6Zps++MvHnvN5mZQXwvrVtGM+1GMbg5FtDQzVfi3z?=
 =?us-ascii?Q?BEmnVR2vueddwcxsM/tq/HgyDtSy3XVxKoLmzE60ragHq0PnZ4ktCCp+Q1lX?=
 =?us-ascii?Q?jUw6kRtgVVOc2c6MbTrGvNLeLXJS49847AO7y9OpQvocEMV9D3QjjyZpQ7NV?=
 =?us-ascii?Q?UMtKX/+/wgzTDcdpK0tCOPS1jm6aK7i9Z6vQ24ycf2GTgn/4/u0JxCG/lriv?=
 =?us-ascii?Q?E/KzywfPv8Iub4A0eAMuB9nviE1NPkzA/uR8cjsDL2dAlEy2SYsgQXQLpCwx?=
 =?us-ascii?Q?tDJ8JuNNREuftVnH336cXMOMrS/BU7TExsUSpQNG9sskdFOZlz72tGyksrGL?=
 =?us-ascii?Q?wnugPmys6K8z/P6yd4cSVewOJjxUZ8KwydQrpyrSxwLIPGkriCJSvxG35N3I?=
 =?us-ascii?Q?YPnw01ag8ZVguh+c6kGv8ETTCuoP6OhzmzJnyHCrzQIMxHTXbV07pHVd+Wtq?=
 =?us-ascii?Q?gD6w+WP0L1H61XfictJbdsrY9ek3Fce5vmhQ1zO8zqry5+4wVfQCHcyXsaj1?=
 =?us-ascii?Q?nxHc5tqic71sVsR9aRmXNZfbufC5dYfl+wGQhMnVKpQliljti1/IT5nJLzHb?=
 =?us-ascii?Q?z21T2zPngv3/YZHiYf4Dv0RSRYUUcHY=3D?=
X-Exchange-RoutingPolicyChecked: 
	b8TEFM1LyBBrbnj2h8gaLIvneIdwVuqnvQEeYOQd095vEJVZ+McCFPcSFVl2wCBIDzHyuG/SHL3135qho1D5WHDVcbgMJWlyNPnywBdP7oSidFab38MtrsmyvEzYvWvrr5nwGOk1RxhRBfi4SXxUkfjwZQSUANGlLZknXmf1RNPEHDq/jQqSCP7avDqwwk6gfOqJdMEQivtNy+uxPBTs+3TyTpBxcSki/NUJDXr2U8NHWoEkCNsCfibIC2F/cAE0XmBhC3/cio6wsW6ODYyBacYEkt+WPR9CL8SSo0fi4eqFgObWg8DOkJJ08Ojn35M024+3DbLAf7ReCQcz/Btm9g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1908bcbf-4209-4bca-6d23-08df23a0da5c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:56:27.6297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hR1gaTs8qF++3/RJzCVDnHZalKHZnTBsVrWzGHlhY9f2va7vjbYL3VIjpSP2O2RXfPYdYQBghbh171Nq072rqNN065MvaNsm00zhpqdLgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB106965
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NyBTYWx0ZWRfX47GqFF+jPF+r
 h5oBwMwooZaTtDXYR/CHvBOBu0SBuXHO4OnLmeTk5IkpvupGvOLtfgQ8gWDO2pKbGwHaCC6sry3
 Hrv6gX2xUzHpN6I1a3pht2dvn+MPJjpN20QDIkGKfZVYPDT3VepB
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac4e1ee cx=c_pps
 a=Qy130IFfx9qnCPISBCfGtw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=NVbyMavnpuAfVLwEq1MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NyBTYWx0ZWRfX9049SEMbbkU9
 HPEey66XxPVl58/WW6q1B0KiK3qE4EDVTBsmwdPZtwxBEL3y+dx0Yen9oYwx7tJgXZRTL2qt9Nd
 MtblrXfUA5w7UorxmyvpNfqgBifg6/5dqVHy3tXof1AlJOcvvh0SXHoPuf6NZyClMjUjZKoLtmC
 JQ1uXhA6D0Ge3C/5QH0xbL1Q5yVuC8xg5STnAK2VTFhmo594P9t+NDAddybwOx0M6HFb6Ibb6Ei
 5ouExhuIAZeldM1vfFWNTaNjn0ZuogP6J3Ex1f/ueWAOy9x/fqFcY5dFAzQyNWg652DGYeb28tr
 hk81LpklfkLfsb/xpNidnbCeg2HW03WFUnabtwvrsChf/wcM5G/c4TS9CiXwEF5aVMQbjGjpCnT
 qOCtsiplJfjZFlS8AZKOYfSv4WHajTS0ajww2tltd8osx+g/V10vKc2tFBQ+7cgoq0MylVvAgXV
 umvofqLobM+iVvsaYlQ==
X-Proofpoint-ORIG-GUID: qDTZhomQHu41h_8HvaVEYWHADB1LLPjP
X-Proofpoint-GUID: qDTZhomQHu41h_8HvaVEYWHADB1LLPjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 11:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247285

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

llvm_features_from_tune() emitted "+v5" for ARMv5 tunes. LLVM does not
recognise "+v5" and silently ignores it:

  '+v5' is not a recognized feature for this target (ignoring feature)

This caused the Rust 1.99 compiler-builtins build to fail:

  error: invalid instruction, any one of the following would fix this:
  note: instruction requires: armv4t
  error: could not compile `compiler_builtins`

Emit the valid +v5te feature instead.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 1cba275b85..fee19a1a64 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -53,12 +53,9 @@ def llvm_features_from_tune(d):
 
     if ('armv6' in mach_overrides) or ('armv6' in feat):
         f.append("+v6")
-    if 'armv5te' in feat:
+    if 'armv5' in feat:
         f.append("+strict-align")
         f.append("+v5te")
-    elif 'armv5' in feat:
-        f.append("+strict-align")
-        f.append("+v5")
 
     if ('armv4' in mach_overrides) or ('armv4' in feat):
         f.append("+strict-align")
-- 
2.49.0


