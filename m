Return-Path: <Wei.Gao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771AACDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 07:01:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37626.1782111673545300207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 00:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tIOsx18N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06332cfc7f=wei.gao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M6fxhZ835842
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 07:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=fPA/wOooU
	oji04iEPKcOaxl3e7c3rC3BcucrvWcsrRY=; b=tIOsx18NIDEvXURN0YzmnnOX3
	dmY3amtXqqR1lb2nszQpoLJyr3JT8uvI/Cavtg2ZywvPwHlp6OTphGDgV8zDyYfQ
	kdvxMqEhSB9DZhOdLfUSJm1CaeHUf1tos0yVerc85aCSdPbzNWX+6ByHFloU65Rf
	UyS3q2Cejthtbzcj4kd3lcCidl74G1MPjXJG1awLYWe6OmRDiq0QNKt/y3JdCZ8K
	OWwgO7UDkIEs7YirDb2Va026kdaVvCUIZ2oSnz+acWAtU250mzloGLND3zlwjl0d
	1oUdbGZZ/+rw0f5rgVSD7btH21WcgRvO0JgjbSOuRwmd+RA3P8HUY4DcbFSDQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012025.outbound.protection.outlook.com [52.101.48.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ewg2wsprb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 07:01:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avm8EJPKmHRXuaoCTnrLE+wFhUOXd2MTwV0jCA2sSq8m1eiEwwCsZwu1tGQzo6pT0XyWM2Ym35RXywgIz4G7h+UoKdD5ZEP2WPljGZBC62s9ZBDvUwZf+bEYSh+eW2PUOeLiYJI2zo4HZlmioLzIF2KaQhTHuwXjk9uRxIMVhP/9j4AtBH7/2iMPmZLL0Y6m6+6IRaY7pLGQ3rwPmcJNG+9/WXZ7kls5Ly7BfmlbWcGQg8fNVGn+h0uhExfmQXGAOlNDpaONus/nsCqC5ka5zGKspbTrQA3sbtKMz5TAD8mywloIleGbeIZVlvXxRmm/dwIZFGmIf8bLQeyTBCKbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPA/wOooUoji04iEPKcOaxl3e7c3rC3BcucrvWcsrRY=;
 b=wAn+0FXArVzcSWBCu3f/ncsO8VxaBOpXflcLF7Nw+08qUPPanJY1QrzwEiU/JoiXWPL8RRRntbjg6qzHhOK6CCudSi/2w7hZ6alTXqR9H1rv5i4coJne14D3APp865h+KhtnoZ/shCFQmN4dvpVS8x346jqz8gvL2mrGTZZEeO+ddegNd/wWlhySpRiQE+T8ZObap1yLst3itqVwzDgUMbpstSub8Df4jbhD1eRxOrhPS1aHxwZBNNaBBLKeiGvJLdLrLuW+sDhMCdZVYl8qu++DvPq+pER7MTFHtx8qJ/Q7vDyq44l8fGOmG/LYqG/74YXsEmCODD0SiQq+Mz4vUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6243.namprd11.prod.outlook.com (2603:10b6:208:3e7::8)
 by PH7PR11MB6956.namprd11.prod.outlook.com (2603:10b6:510:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 22 Jun
 2026 07:01:08 +0000
Received: from IA1PR11MB6243.namprd11.prod.outlook.com
 ([fe80::55b9:7dc8:2496:bca8]) by IA1PR11MB6243.namprd11.prod.outlook.com
 ([fe80::55b9:7dc8:2496:bca8%5]) with mapi id 15.21.0113.015; Mon, 22 Jun 2026
 07:01:08 +0000
From: Wei Gao <wei.gao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Wei Gao <wei.gao@windriver.com>
Subject: [PATCH] dmidecode: fix x86-only tools being installed on ARM targets
Date: Mon, 22 Jun 2026 15:00:50 +0800
Message-ID: <20260622070050.751030-1-wei.gao@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0181.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::19) To IA1PR11MB6243.namprd11.prod.outlook.com
 (2603:10b6:208:3e7::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6243:EE_|PH7PR11MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: b4382b33-6701-49fb-afc3-08ded02c0915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|42112799006|52116014|376014|1800799024|366016|23010399003|38350700014|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	i1ebCapm5fyH/YrncVpPrwQLATjzA0IhO2ekr6+HzpuOvyQWFNYg6qt+WjB1ANbSz7c5SzEH8QvjKXaCdm2mLpx3FTt4VNbzsqT115ms1LQsAlQ4RLq5vXGti2wmyxdE5UlBumcScACgi5GDgSAHVv0lrFB70yeI5f5/1teOFKKst8VB/F2kLxKYm7xjj5LXRdUg5ZO9M+6r0MSQvX1MNVRsNq9VaqIENficrkbtEVS6BESt9NCrrDhnsvfJyZmQ25nkZCESUF2u2oLGuOFm/gfKEnTaoYpqbYW4OMRXTWX6lLTqUsMjRplEP7UZN4EaT3ZyNS/i1bSUio6ktHziAVC+dN45RiZh8UlqyNvMu1rpCfISBYD8nTS4t5uJy4A0Q0RpfCqX4nVLGV1ReuhWTDuufHb4dA6Z5u9xV1VvsZk+7N4Ftctd08Cqqj5UhtSMBNKq7jTJ22kPbKepFp78/aRzyH4b75dorLPXkm/F3TsOa2WkjcnA0m+/QzYzLNeGbSdusw1U3zP6XNnhnri4nzHhJtgOmi/uguCFfN6wtP6E7A2w/LKSB/825FYV659jAkK66E5Wj42pzfH6X94M4IVOuEBJ/FX0jjJQsX5lprwzmoNwS1rgPrP9yvmrycVvyUHerE9bumJWno57BH4SfG1PCVqNwbV+HmsgQ88Eev7HsiacYW1OrD8K8ubLviQpB3cWeCUoWNKhJwHzkUJ+V/+2M3IvtNpdRhUPF2QQfv0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(52116014)(376014)(1800799024)(366016)(23010399003)(38350700014)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?buPukb0+4Wcnc49/Yc0BtNmZnMsAaeoikB6T9ZOCN5cRBMnWIoRUxn7yssNJ?=
 =?us-ascii?Q?1I62ucuOt1jfmrS377G1iZ6T2vBcTjUZJk7KVwrANoWMzbS9DnzbIKSJbjGr?=
 =?us-ascii?Q?ST2rGvG9OmHnCsrXxTYW11CE44y7LXG+rN8vzt5SsyQo+Blv/Vu0ZfG8F578?=
 =?us-ascii?Q?vgexqHQWKs6UaHfy5lLdOuNWBusJijnltmv7Nl6BSDYVkRfOznrjYezQLhzx?=
 =?us-ascii?Q?9OO8wwcK5N8oM1o1fiAfuiHWosCU2KWkYoWpMX33NI7hgwOjIWD50wuOxgMs?=
 =?us-ascii?Q?w3XMFgLRYs/FdKsaI4tavItEQeZ8l3wgqdaYjxjTSkE3I9Gr9Kc4g3DEnZM4?=
 =?us-ascii?Q?XB5zBswv4c43bzIEal+ZsXG+pdf67ieH3sdNbXxiR55CWZwbTLCjq1TcG/Q+?=
 =?us-ascii?Q?PaYCAzQxJ0zHMpBMDe8x+UYxuxVvHn37JDlk3xeKEdZ04zcKqo445zNG8L0J?=
 =?us-ascii?Q?FbHQVoLJK/Err+HVKFLyy0KJGamUX9vy4x+LP+cSsLbw34XiXJPKy02VinSK?=
 =?us-ascii?Q?lE/8a1Qnxansnjw5GOwUhbf8vTQqAUfrizkutjiN6KuR75j+QcUvhz7onxk9?=
 =?us-ascii?Q?n7VU8vThfFi3wwOy/oMGhODFMh/Dg0TWC8A913YjvunMjBrTrNoU14ocsBGb?=
 =?us-ascii?Q?TmFuMdnP7TXTiBkb+M82nyGcMg4Lo4ToXHBJvUTIwXM2i0v1k8C0TI2gVoSA?=
 =?us-ascii?Q?XJhdgPghhpcFzpSgDLC3rxl+OacpCkX4GfkESjtnd8xBS92gw5Z/bNXIzUKd?=
 =?us-ascii?Q?BDhWIMtbCnktDeycMFDoyEOTvwHiu6ubpF5yERKmW6cuY27n6nTHIFj5i3vB?=
 =?us-ascii?Q?HUmiBVeO74Y5v5S4V2Nn2QC9ep6w7FiIROFdxpmIr827qccrhC4Zgl+OgZNH?=
 =?us-ascii?Q?mUvwIAdNCEcNRgl+9QSWo3HU8wGRiw6a3HzLcxPw8UOg3BUaTrW0vMEuccrp?=
 =?us-ascii?Q?EJQISdnhheaA5yhTVfg1uv9iekFtUEM+DWWlIDmGnsNlINyFMqSlzkhSgjxb?=
 =?us-ascii?Q?g5MSPTWIFZ9sPSf7N6fascdQUkcycpyrEVv+LgEMVKjAcRJDEwTtHRUSR8dQ?=
 =?us-ascii?Q?1WIY306RF5fzrwP48vRFeDpMvWlM1PQgTHGDY3NCs2qk624RVOPt/I6Rf+Ry?=
 =?us-ascii?Q?/0IIkfFOErQeix0VZO91t3mPXWzsi6irnfgO8O1sJLpIQHY08NurNat0Guu5?=
 =?us-ascii?Q?CazgOv3kCQvrrIzPo8t7EN7s/H+WxuPoqmbbUbPp4e7cRba7RNCtkVpvOdMC?=
 =?us-ascii?Q?qpNZiK2erm+nmKj3S7lUz5ONmBQTLaiPDaJzOAjVJzHSXWyQD+Kh8zYg6ieV?=
 =?us-ascii?Q?w/IZNlvV/qqmvIGF3WazcirzW+lDFWyVsPsU1OM4wG89iI2N/zLRJblVqEDo?=
 =?us-ascii?Q?7mUNnqAqQwZgEw8Ch998ZKTB+h949CpTB/+n2IX0sA3VsD/pYGXFvkkvIqgG?=
 =?us-ascii?Q?cQUfr2Aquv7GFgVWZfIne9occoDbq8ycdDftgSTgDm/OIrB0LMiVLCsODxAb?=
 =?us-ascii?Q?cRDEOqYyMFy/h6kMGJIHNU+zr+JmP6ed1D34wGh+HEYciJCHGtCVrv62c2f8?=
 =?us-ascii?Q?k8IFIXci5CKWEjfKg/uD7YSvy7cGW6YhcacBk1JnlydBceV818F5YSDmS+zT?=
 =?us-ascii?Q?u8EctgmoIfmn6WWMUBcJzkq0xhWBcbCWQajPvwladkJ4sGv0erStgKLIrR5E?=
 =?us-ascii?Q?CFKLcTL2HjlIYty7nE3ZmJIBENgpQkmB7MhBfIXkMVCG0sEULWnGd1Y4bLjO?=
 =?us-ascii?Q?0j68AcTvGQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	CPb4ieUJpUO6gQSO5LCeU0kzdEvMZt6NH14haSy3mfIZ1k33GH7NVxWGxBM4nxVswZQ1GMNd5vtMSZhhrQZJsVf63YLHpuEkmI0BJjYttwUQrNb4CSKQnYjmrt6iRwEGcWN3Rx0PSEbjRY4ATFAwsf2ZwYY8+W0nFPAKoAhCT/ZzT6B4QMyfss6AtwOLNLpQwtKri6BIKk9Xe2vr2rUKhizDPSDWN6W2iH/f+8g2QIwaA2W5oHu3kpCTj67lmxPGrKiHAj6K7YGemieh/AnPguJFMbFXDrtBRTyrTKUI0Ob5EJcNW4MgS6LuOFwaOGVNvJKhwhdTSvZpvkXvna2ysQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4382b33-6701-49fb-afc3-08ded02c0915
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:01:08.6294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDNkHQ3a0mho9cFLl+CUgq2abf1KQUaVnymhvRrJJ0eEK12iFGl/N8V0vnkpnnrCUrQWMO26p3syamJ+XO5CAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6956
X-Proofpoint-ORIG-GUID: mEH4ciWZW837MRDcLev-pBlL7ISkBnhR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA2NyBTYWx0ZWRfX/DmM6VRNWJA1
 vNHIo14QuZRMphqOU+scatS0IiLcoxOBJfL80CFexA3wdA3VA7UqMfNttn2zgJiFfuEcFP+K8eB
 PE0N1RPt+cmPwpvRHin6mU/Oh0KDFVJjhKocLR4bkw1mtgieL7C2
X-Proofpoint-GUID: mEH4ciWZW837MRDcLev-pBlL7ISkBnhR
X-Authority-Analysis: v=2.4 cv=Xdm5Co55 c=1 sm=1 tr=0 ts=6a38ddb8 cx=c_pps
 a=fLgsFiGMcCN2bMhaTK1NuA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=LLQu1gvVoGSYrnOhuBoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA2NyBTYWx0ZWRfX1Y1+KCl9kIlI
 f9Egk1VkxEdyr9g1CajPyMQy/rbY29qiv6CCWcVqzJvpd/ovblFJUtQ/W7ms/GRZm4iAx5snGb9
 N7tif07WFXQJmF6yO6AkSUcbXwjWGWKYkqP4AnQvSYJ9nTxua8REu/wDGVPCUMAwLSYSZC8xeS5
 rjqwtj2BemrqXLrQ1Ju5ddB6dRK3vh318n0dgeTQmgXaH7jsI4GVWNDgMh44QjzoqXQeDv0rnW+
 EhZUnQvyYQVgjg6GTf9AXXDKeMLiCr8WwTJbM9uqi0HB5JsCFLeSFQmlOH79nFHmpHhXiZ9Zwjs
 UUna9w9S0ba0JWwGlXEoPud4cgFeKO8CyUuxm1NIKLMiGkouZ/iF1WxJlVleCPXyIrbZPlVXpXQ
 MJxNXS1rRN6YnNZqzdnSmmuDB++esLltEKvxrKPRt8W4CsFtDsuQx31//xi7EZJzh5ZPgwgADSN
 aDTTqoxj6E9TOo8Ei+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 07:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239270

The dmidecode Makefile uses $(shell uname -m) to detect architecture, which 
returns the build host's arch (x86_64) during cross-compilation. This causes 
x86-only utilities (biosdecode, vpddecode, ownership) to be incorrectly built 
and installed on ARM targets.

On NVIDIA Tegra234, running biosdecode triggers a flood of CBB fabric 
DECODE_ERR interrupts (23,568+ printk messages dropped) by scanning 
non-existent x86 BIOS memory at 0xF0000-0xFFFFF.

Fix by passing TARGET_ARCH to the Makefile's MACHINE variable, so it correctly 
detects the target architecture and skips x86-only tools on ARM builds.

Signed-off-by: Wei Gao <wei.gao@windriver.com>
---
 meta/recipes-devtools/dmidecode/dmidecode_3.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
index 93c3678d9a..5c70765051 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.7.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz"
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-linux"
+EXTRA_OEMAKE += "MACHINE=${TARGET_ARCH}"
 
 do_install() {
     oe_runmake \
-- 
2.43.0


