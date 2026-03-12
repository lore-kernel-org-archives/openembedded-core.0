Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4838FED2E4
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 08:15:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16608.1773303329149957786
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 01:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MjkOo7vc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753101834c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C6koDH1844649
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 01:15:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Dnzg8z65thd6xrffeFsV
	L/dBWiAgXI6OlZbLZLPUASg=; b=MjkOo7vc0Y00sAf1DDslT2fF2DurdwwqURN3
	NACErQMLqoviMMGPjrD1QAdPR2y1h+PxhCMG/0Qn2timYqI/QTaF++ho1j1/jFn4
	TA78vRpH9aSWYypU45RXwEVKaW9CV5V3fMhuWSvD0+X3irsArfwFz6qhIEMyN48u
	9S357b0AA38YeliWl9KBLoJP9XzKggpeEv1GK8EteIVhojKFDDZVW2sY+D9d0LEO
	iFn5TBa2xf0Kag4mwym3rhnljAdu8V6GnzrYXD4dAWhTjh8FL+hkaeO/EHVcrRK6
	4XHCXKbStiDXFQ3dORWybsWdwEiuiiWLIFKK7/VFr4vyGpbFHw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011007.outbound.protection.outlook.com [40.93.194.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6prehk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 01:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdiyFlN3JiD28Sv7WPajYn7sZ8uVpy2De5m/5d0WCTw1KnQEqAM1k6x0Jjiy01l6YlGrNZ6Xew8r7fySOaXirNdstGXoFIZBiRrDs0nvG6Df3wEqdg9E8kxTJXGpOsqVzwJe/DS3DwVg4rypPTSdpS3oT78iZ34YXHKOmmRnaV7X5XOqGO6iOqQuH2zzI5uaT8tfzaJ/HyuJ23sX7AXz9K91ZWjrGeUXpX8MZR6McmfiCjFjafcP3bbbrO7/lBtHY8W9SSDrfVbP5yLwdnCMHzHTTew9qmmzpUkOATxQUbuobx724OAAxdcvLdc2qqbmA//c5H2nsAmWAwrnFwg9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dnzg8z65thd6xrffeFsVL/dBWiAgXI6OlZbLZLPUASg=;
 b=wHFZmZnOg7swNVu52DIYBvMnzmtyRP1zE5S/YjtSotnVnAvQuE7bxww5eDrrDbGDkBPkfppeMct4Kc3tdhldzdUvUabnGeCXnc+osnlDTtoH8amW7BNsEfZsLCLDC1sBegvtBI6MT+YExOP7AG4BYy68okHlUhNedI9GhdpUSxQ6yLAcC26A3B1Y/v23VuOButdPjB8vNPIWDAJYyL3u/RJCogbLSeZFtoGF7APn3hCCxjUMa5FOZmIvE5Gp5A9zEPKQuvpDWBEuioLM0H9CUIQG+l5FZGWjmEyNKlGI1el/X6ExcogrrVpc2z4s1Z370c9Lmfi0eigfIRIwRCPTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19)
 by CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 08:15:26 +0000
Received: from CH3PR11MB7297.namprd11.prod.outlook.com
 ([fe80::d512:ca9e:d0b9:f229]) by CH3PR11MB7297.namprd11.prod.outlook.com
 ([fe80::d512:ca9e:d0b9:f229%6]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 08:15:26 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] webkitgtk: remove PACKAGECONFIG soup2
Date: Thu, 12 Mar 2026 16:15:05 +0800
Message-Id: <20260312081506.970978-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To CH3PR11MB7297.namprd11.prod.outlook.com
 (2603:10b6:610:140::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7297:EE_|CYXPR11MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 45cbb3ed-5ac5-4a4e-6059-08de800f83c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	fbVWRC3TJ/QoG+v7Uxan3A1JzJkNKAzZd8ceriGNtqQdo7k5LtGy6M8IjVtTjU/6hoMV7NEmuSds34H4iaVSZxNpYlwH3JnB3f6VI6R6+KSSxE6jPYIP3C0gTFKb+6cgaIyK1AJ+q1nUv1VBl19ema6oJc9cwytrKQJPN019clp9zUQJC0ApE5hc+9Z4HMjFxHd4O07+//s5y+vYGUhfMp9YRdLw5ThSfJnWSxbN8Z5sjGxBKSzrFKEr7b5CSdJJFTyWNVmrLaNY1A86n+G+FaaC79fcHLxGOWEhaFLplkfn1Jg1YHsuueKexe6iKXbYYpFwMORAqunu3mxNpbsDp37fYrd6T5PTKqyGrZSNW0I6x1ZtKh8lm4jJ2X2fKXdDnQm4CUfJAVRQs8O0ArSRd+b1hniqIWw3uDCXxOj2v4xHPPHcTu3c5Oi5ShF5Duj+8L2BRZBdUgTmV8yyUL9Gq0w1O+ht7+yU+SAdgnRN6kmYCuJ61B+htWGdY0qkivySWOmdtcrvr8GVf9IwxLie+YtxdDFRZeaA7jHz7MRwuqYjBFI4BELdDy2U9rEcFkTweu1ZHfO9tB/bqjhb9U4I3EWR2lSsxDrx4p8+oY/GSLVhlu46zuDThm0q0FcXA4Gs09eYH/cq+GzllMuVKwdZGs47nt7aoz6hVJEJvCn6RE+nOEWrFa4GJZ4bfooe7jl/r0JGrv8xL+y0Hmj8isSmSwR/IrK7uXzunrg4uMKWumGViJjAPgRvABD8ISCproyM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7297.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bqBXW9qZ4M/FlMRwkr7uWs32tAYNSmhFfNxrRGujDY856UIAQiOw2F5AlpRy?=
 =?us-ascii?Q?uqyLFsg8gfV66CCt3ExGOtO0xVCuz+mUqeodFfzH8iwCa5q8Up5OaIOxdAyw?=
 =?us-ascii?Q?yuodLi2AjTbRLG5P5MlTS+icbWWlHqUGBvnfYh+M67w8H2JQH0LTZLRDCbbT?=
 =?us-ascii?Q?uhVQ6N9/2+7gtvnvyxScu94iOj09s6g4dVrKFist+8dpX9u4kviAFiKmIaRs?=
 =?us-ascii?Q?5VaOrOZNtdz/ZE5VU00Fs/o3SA0iM0wF3BNPVkLpiy/3aZp5aSqPzCifaD9C?=
 =?us-ascii?Q?31xCjDWHWNE2GohmoYgUbfbTC2FKxfdyeoPMVnHjjBzH5w1Eu6fPbTwIpks4?=
 =?us-ascii?Q?QiPMLa8QBu9X6/vKmYtzE63lO5QVdxd+530DJehvQAqZaJPU5Wec2cwczn9e?=
 =?us-ascii?Q?SrLtHslGob5TBL1MSz1F+AAw9LEbXH/+BHcIB3BIjPpPFEQRX+AzJ/N2opEp?=
 =?us-ascii?Q?gigp2dL9W5maTnJMLkQNAetTwbS/9IDEZGGxDCsuBNYXeehltjN1oaaRmmTA?=
 =?us-ascii?Q?/VNi+nHbZm6T/uNKSJmRCz6I7BawlktvDtJ4Q0UzVhPsx60nvB16Ib52fUeR?=
 =?us-ascii?Q?YbD8qevFiX6pHdcTE5mUA5OrI/SkEAfFWIMnOXETQLJH5iq/CnnFuEPVI1u3?=
 =?us-ascii?Q?3BtsNEdlY1k7KAi7deAnw9iYR/TLgmlcfZfe6VOkoyNeox2rfqlkuF39FyT3?=
 =?us-ascii?Q?3+nxM5pyavaTxJ+Gpm0PaFKhY+pc9B+niucTx0MaQwCnXyxcrBljG1t3ucBH?=
 =?us-ascii?Q?evYSBghcRc8SEHSfjYrxvkzXcvYQw9yRezx8SoxQxwJ3OKRux2IzNWJ6dPG7?=
 =?us-ascii?Q?N1VF6sdhzzha7DB3tQ/E45Jnbk70KPBp/BILrxCGuQzJnvkan7BUzOGqpYCC?=
 =?us-ascii?Q?E0tqVKdmekbdxiALzv03kl8Z0Fd6t8IkuV9aCFnSjos95XUTCzTIP6G+UnM/?=
 =?us-ascii?Q?EgAhu1H6RKVjnFtWO9u7St7pLhjKYz04YKFV8oR77jU+jzplSfYHXVqne87p?=
 =?us-ascii?Q?po5kkvph6HDcGUTLAeiwi9Suq2xH1g4KTqBWsyga1hjXJiRINToiSAGI+5UF?=
 =?us-ascii?Q?sUygY8Ni7IRMkEmOzOSSnMJV92PHXH9/wajXRYIAvIhiKQX2THIRZRoLO6Kg?=
 =?us-ascii?Q?7L0l8Ymd6Fd4RZnNPNNn1PN0o78qP1y3xDLcEQdyeuw+2NDqd5TnLQtGedH7?=
 =?us-ascii?Q?LKV6BKMzMl6S8t7nm/wfSyZ5w4ulMMb+31fB3iWKzd7/ghJOZRvYO06DA/Z2?=
 =?us-ascii?Q?hi4sTiZ/3SUJTLBmML5cOJ24upjy64z/xyITf9Ohs25OBY7NttysRuMK01i4?=
 =?us-ascii?Q?rItcIB0OrB4z2hdXUAIo+C0GI5ZDLrLktWmyghULem8veakTsJfAajixo5AZ?=
 =?us-ascii?Q?XDiXVuVzUawrxjauMVnwMzB6rJ2RmBEhJNWNHVcyytUReN1v4jcQ4Qhc+As5?=
 =?us-ascii?Q?4w3yY9+GTRA5DD94jfsaVj3F9M3qNG6eZegmIT3Gvw9rxslBgdyJMKikW5dz?=
 =?us-ascii?Q?up3RzXvQYqjDr6lrEc9bS7d2zuJuGuF5Q5F4FAHPNtf4MljZrQ9Ez0TmIvgX?=
 =?us-ascii?Q?wgmffh5FHwlipklmMZnCLF8orZYakqSoeGS9Hh2qxMviocTtLC51OnMX0RW0?=
 =?us-ascii?Q?/20n/RuL2QetIYIUC35vLnAXhCp5m4Y7AkYJgumq/b6nm162KXv/QiMC2k2N?=
 =?us-ascii?Q?QR69JX9XndKePVrYVsub9rYK3dTexVsotDCPABZeZDCpGTOk1xc8l6a1BHpL?=
 =?us-ascii?Q?MC+23W0cqnS+LF5m9eTwMAAjBub7x84=3D?=
X-Exchange-RoutingPolicyChecked: 
	v/TMtnnfPSw2t/knWUDebxvEcwVmcRB19SbU7gQtBkmQaxgnuUMLlur94yyPpFLNLcdx5asUeIq8YBAKTIcrsn/CyMUzWJOjnO9PzbbDU1inCZLxvn13y2HKKISNuQUOvddtWvAYK1NdVgJrTJuPVWRndPp/bw6/XpP/WYxkyNrMHoyKQ/ggg6hbjTH86dCSxGDrED4PY2X61yebJbTc+WofEKrCCnMjD1VvIP3xpCjm+unhklVXNKaJazizdNBJRhGfNE1BXd/AltJF1jbx5Ts3NlXikectLlq8jyC4n9/FTiQWej0ooeD4QfbOBmAh7MfQNIaAhgj8LygrIgMexg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cbb3ed-5ac5-4a4e-6059-08de800f83c6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7297.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:15:25.9460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35gtbAYXOSfDyb+pOemzIr3gwLTK/A9Wkq+V5VS7/rof/fNtpugukv66Xdn95NhaFgGA41J2Bea3X/o5559zk9G8+22ulEaKoRBbH7X0EN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b27620 cx=c_pps
 a=4hG4CnY/eg4LDOVkUp5rMg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=LXCGm8LIAAAA:8 a=t7CeM3EgAAAA:8 a=7RHkHEC8GuE1N2Baog0A:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: jl9blrfR_8rgdeEOT9GgpjzqoZ9mXYny
X-Proofpoint-GUID: jl9blrfR_8rgdeEOT9GgpjzqoZ9mXYny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA2NSBTYWx0ZWRfX960kZSXNoCsp
 M4jvoO1WSbbPE8QyebRUTQri5nmNTtRlqcl70vpHNAxKnV/JBVDduAL+JzJyVJghMzlFqnw+zv0
 zKh6NL6EqhOki9G++027G3szugPgoy6Wgq49yIJK4TluNchOolcLW60m6gS4om02QIKFJjwkIBa
 j5mQC2/GrWznJnq3UDlEOWLDHyoQlVZ5Jtt3O5FfymCapNjk377YOkL/A2aYJCuNVZm67z0CSqy
 gAPDDnpd9JYOo6BJ7Kfooqy6CnX7ZbBpHYevVkc3u9YZC+am1nwM3KU9OyycL4j1YvF+KsQmyBk
 0Nq9H+OIleCfLAdu1TziwXRq0haUfRA9TsBkCrlCrhHd4siXCxSZKHaGIBlvkpYehxrhJ58BGCb
 p5bt/fwQSdGRReE7LP+HF+IbzlZq0cvXwCPVmxx1QgoXr43ilt0x8JSHzntQf/CcNMUKtRnkHkT
 GxDXcNXrO7ZG+gjILUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232929

libsoup-2.4 already removed in commit [1], so remove the soup2
PACKAGECONFIG, which may causes depeneds on libsoup-2.4

[1] https://git.openembedded.org/openembedded-core/commit/?id=94ebc5b798aed6eea642c5e2a4df24b386520636
[2] https://webkitgtk.org/2025/10/07/webkitgtk-soup2-deprecation.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.50.4.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb
index a1b0a72612..9891a5216d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb
@@ -73,8 +73,7 @@ PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
 PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
 PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
 PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
-PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
-PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
+PACKAGECONFIG[soup3] = ",,libsoup"
 PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
 PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
 PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
-- 
2.34.1


