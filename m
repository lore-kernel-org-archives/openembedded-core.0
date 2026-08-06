Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDCAC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:30:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17141.1786015814933244586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Tcc1YUML;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2678a3d1c4=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763lpeY3722307
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Aug 2026 04:30:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=X8pxqr+tl
	+k4FEif2ZHVdnD3660d3V3w68r+gdrh2Xg=; b=Tcc1YUMLASZCOyUgnSpyAdV5J
	0DzUNO6jX94QOfHRihG6LX4xbBLrHnS1+SGLR3uB/OHK6qqG5DFocv4BzY9VoKs/
	zgSoQcmE8R+nNoFPjGkqpP8b8H1HHwmwXVjgA9cMWA8OiVWJh1CPJRCvkOt6TDdJ
	9tjRPotbZjC85zklYC745aSfHDNm/ZU3In7AiFs82A8LjVwKgtCCt5ercS+nYR/l
	Reaxta4YmWf8upZLcSAqqsygmtEzVyinUtHwFlvZPKD40e3pRG35V02ytyQl1nOK
	K9X7F8VObQw6gPgOK0UbUhKCvMzdemfhrtLWK69pVKLrTO1VInc/bSaAUh9vQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsgah8kd0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 04:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9Tt3npaDy9Pe2xfl+wIG3p9Jx18fo8ZB0LS4/kWaAIMWL7vvRsxPQV4QqeDpAU7bPCf295VLAGp9o25VdGFhTgyk4+6A0xv9NM54jGCeEaf+Kz5J8DPagSlwCoH5X/nsPtJ/WPwF2PDIQ8WKOiGaNhmc2HZcppDVtuG3xDNUUPdWPlGfrY2M46zhRZ2wFZ1nAAUE9pLRViTyMB3ls4wApbqogy7ieJ36VGTqzdme4V8ynmNMXPIVaf0/foeVDmhyOq9l54bVJ2YauN2tKrEisZuEHh+JbWpXeEn8hVoqrvJ1tMHmp/v3yjgPYohth7X6jpEX4mZmicU71q4rkNFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8pxqr+tl+k4FEif2ZHVdnD3660d3V3w68r+gdrh2Xg=;
 b=jm13BuCagPXp7OyU2EqPIUNVlsYxqQl431bjjiUaGP5aNaBRyRfjPEtLPkvFa2bJbmPIY+lFf+S6/tfFcZGjFEm3ehpjXyfp8of6NQL0FQ5QQ3c5zXitJFa/jXPYUsSTonesx58Lh4gdSS5Mlb8vLjNoboN7zy+a4xG8VyAjYdVkP1TzhMxpedgngZO2mRb3C0bJmEhADzdwFv1x3ViA5ipLl35F/9ZOfW7vLK/Pztkb3S/aXcd6XyQsU78cHSPwGnD5ulcUxTjnwTC4Af/1I7xtqRvBZ9BsckYqKfjTC+lDFRXAl8DtMhmdnUR+OwRCbHptvpBQdybXfTMj9qqyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SJ0PR11MB8272.namprd11.prod.outlook.com (2603:10b6:a03:47d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 11:30:02 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 11:30:01 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        richard.purdie@linuxfoundation.org
Subject: [PATCH] clang: Exclude intermittently failing ldm-merge-struct.ll test on arm64
Date: Thu,  6 Aug 2026 04:29:45 -0700
Message-ID: <20260806112946.3248286-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SJ0PR11MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 32707913-5b84-44f6-1cf0-08def3ae0dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|52116014|376014|11063799006|56012099006|10067099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	hHNxhSaWZ1oPE4wTy7wN2FWbGpM170tx9/TWoJSjinwqeauI7vs6pFfZ58uVbEqgGEdYYwC6e5TqRRzXSz/DBgJfpsA1NJJ+lPi7xej+nFYSMAO7ZmQC4lbMMkk7a2vbbaLGjyaMAWs8EGxRro4HF9ty+zpU9x5FBvH5UUDsbCycLX9YYT7FNJw3ZDhSK9wNVFkO+lxyuVQyq6ko4KrvgWsz0DFIsYlWhVw3Af1geUHJ98gS0fjh69e099YnI4ba9PHzKE6QIDEu1MD8/Dx+lm4Ens+D23bXRZBv8GyCy7Aeb+6Uu5Tas6e6sR5iDAFHDuceyYixRsmz3/6HEzqrKoJsO+CVFm8recrmtxH0XWLY5AqcZX6h1WGCG4WXWtQtEh5/sJrl4PFsWg+luXStqVqvgay2zmjIkPq7hSHMuRW5ToSU0FVlo6BKIQPqPkKXPeUymgcZLt6X03oOuoBSxpcrZFtoIQvCDujVL/OKiNsGgVArdhLd3NCI1ykUmb+lov17uwBiNzQKXxptIcGYHWe2mS+6qvp8WXT0WC5I1f+ZUTuT6a27UTlLbnQD2GSNhKd9o5Hsk61gfFK9nX/Ujzn2R6OCvLY0deuWk5xYI+UTF5ZLMcjQN46ld1tvS7fM7vmwnuIRZ8mN+06DlYy3x6mMnvQ9Kn7KzyOGVK/zO22xUxSXzbD/P5nK8Ml6Y5MCmFG8qwms7bFtwe1LxWpdig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(52116014)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qsoxX7fmGYSHvbf8K1FK2AIN33hgrA2fmWxaLuisEWcAcatRvvZ9gpT4tUtA?=
 =?us-ascii?Q?Rak2ADRdGGEns5OBfO2+AkuDfbkgPRY56zmbdhwZQFsdUFFjFfUyTWlIHejA?=
 =?us-ascii?Q?XS6hGqyMmleEYY1hcAVstDvFka/+tEXa/H0GYIAmGPOnxwu1Jy+kBUCgvZeJ?=
 =?us-ascii?Q?dykHwF101HhUJhns4u7dfqbZ1ZqX08VD64p9z5fZRTmfbX8N5nZSBjcoqZn1?=
 =?us-ascii?Q?HnLJzbFq0Pj5G+QxXLme7qfy8mlqzKa+K4Z7U1TF8vw3TV25o41TbS7RGnOn?=
 =?us-ascii?Q?LApatp9E4PVNyHwVv8NJH1ZZq+NMrZLtS+TIMn1KawZ9IVOJwC0tys+8obPJ?=
 =?us-ascii?Q?z1+I18A2wgsvNAICTeGfMuadoBJYPlKwakxEsGEfBUg1okG486hA0UIrmwTn?=
 =?us-ascii?Q?EvlFrp4yzXTIsPC+jHTiB4otaB2GFZArE6RaHwY0QpW8zKyGTPB0HRlFH7JR?=
 =?us-ascii?Q?FxEO9zS8dFZA4fMnieRlib3C51ll9IZh+wRSIlw5KDaKqtreKa7GZYNVL8w9?=
 =?us-ascii?Q?i+UdkhJ40ZW7nOqzduyXr0xSYwx4/M52fWWXQBs9D12Dq6I9SYxa0GVbA4fL?=
 =?us-ascii?Q?JniZ035ciKfXqLodfeGEddFgKi44375drA9fuA8kRsKMsNMV4FPivSimkxff?=
 =?us-ascii?Q?isLy0xE0rp688fsv6DV6nAgnoDm7gRLRHTDur1dr/IBcC856udE2m5XjyVUu?=
 =?us-ascii?Q?sjQnF91VqYreWKhin3adrqAnxtq/rGuK/3AiMtM2Ek4kRx4ouA8TBNV/uG0a?=
 =?us-ascii?Q?EbEm09Md9mVcoZa6kTlBjnZ8a1Go1sYdorrHujcOf3mSn8W/3HtP6rg1oXR/?=
 =?us-ascii?Q?AtgBHkxKB60vHedKWgovuhEPEA8Y8VaQxef1ickBD3mfK6e8RXi6g+9Jxvvl?=
 =?us-ascii?Q?ne/+kd/X8wJ1i2WVg3gbK6KQLSoKjq/WXtxBS8qZOCDKD1jPEmswev9MthZ/?=
 =?us-ascii?Q?6tL/BfL/D/oKtGf+rluz3SzPw34f/Y2s+OJoqrE6NvZX437UvcJpvNtq6fHs?=
 =?us-ascii?Q?A+BPUCYpMbARB54Z1xXJf8ZY5THYl0+gAcsWj8ohgh2MyXwZ0Cmc5uGb74lo?=
 =?us-ascii?Q?IV3GKVTHwJ5fLrj0yqR/5K2QQQlIyEiYIaq4asJiJ4Kv1SVLriP7FmM0MLVl?=
 =?us-ascii?Q?afBybtvVXDkkvOYlSdWWRuA/gL3aHrlTACyp7QGqMXHeJ0fQptrRMQqBRDwn?=
 =?us-ascii?Q?Bw9XohEQpAOLUCw5PF9xEdz+Jxh8eN5aoyUm47UE2j5K4DWwd/uPfv8D+GQW?=
 =?us-ascii?Q?+UDuDhBMEKQWaQc8TTGI5y7JwX66bGy5mvRWekpzxD0BOp43/E9w0PK+vADp?=
 =?us-ascii?Q?kHu73fNXKkAPsfarz2obha67yjzWDK62OM/o0KpJ3BYHpPZ7GeMa4o3NZU5D?=
 =?us-ascii?Q?104qUTp402neWauVTWPH/ltzlPaGKVweafHSyNZRg2+KnJ/znfF5EhKLJSv4?=
 =?us-ascii?Q?pt9ItyXAbDQwu5MeMpD1PP7NPrf3AsQOtTAppmY5SO0PdbKyurMq9nzxcCXh?=
 =?us-ascii?Q?dGpvBoqSgItE6EdxeWFDoWEQ1t31DNODDL76y9hGf/IXKKC18P9ud0fBoLKg?=
 =?us-ascii?Q?gR084fFwzNQkMQOwPzOAf8S4Jvc1vn+bS5uCgElVOiZ7irSy29zxr5pq8PsV?=
 =?us-ascii?Q?ymSpzHuDJyA6TZ6T2oKrQsIBgfB/E4LVL1L96dgcCRUr2ZASw7fJC4n8t3le?=
 =?us-ascii?Q?el9GHL6OvYbQ+1Tdh3xXdJ1BQl6eFWvc2Ncbl8dRR9FxY0hIrpZgLpa7kaeo?=
 =?us-ascii?Q?0J00cIjUV+jDNEks5jxkXfQk4Hq3oxuM0im/EsqwhN6UNuouZFJ4?=
X-Exchange-RoutingPolicyChecked: 
	gU2Vi8uQpWO9PqMq3M+WTG3Kn2d1h8nuPMxASXvwGUyRzlwiVx4WVal1aw7y+3REvJpAaw+Xu0SZb5QPDZ/pfK8YF1K/aowFscSn2HT//RBHLDKImAL7cQHmfZhMDy6mtoIXXgtLCe0KMeUjzReF3wPS3kLmeG2mUiAINXKAXdkDNsBbHW9iQzpgbEykFwHKjuvyykT5+Zsx64lxWvVVDgeMhvjz3Gal6KagnElwDTf3UsfsFK4z7C8D4U7wlwS7i/BOQk/dinBOC62KH3G7LPLs8O5PMqloEeh26DfRc+bsMC5HqLSDF7iII59QV+eDEquXwJ/JUfTgVp30XOILxA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32707913-5b84-44f6-1cf0-08def3ae0dd8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:30:01.7953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBKSbSCQaPOmoJpjl4pVycqknKzcfSaC3IARtqfTTzLUzCVU8GLHHw8fWrw/KMWnjusyDmBCaKF7Q5iCDLXPn9IaaDoNiAeTYFKE+XZtsfP2zAVPDkRNLLYIPYet7Y8u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8272
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cYTiaHDM c=1 sm=1 tr=0 ts=6a747046 cx=c_pps
 a=3NFNipLq04N0pvkhkOyhzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=p82r1lKfBYhifx5CZx4A:9 a=zZCYzV9kfG8A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MCBTYWx0ZWRfX2SQpe/9XdhwK
 ylQOthjh/1XgMOMPMuSQP4XKs9O7DY51c3IsGOOiq1iUjVDcmPSItsCbN8Jcq0wUwZ+f6N4Us7g
 fbG4f59H+fky6PiMtmfhD9PcJMacnwvrTI3FUAz6cTM/R4w3YmFhQasY4rVhzSabRClXAc75fCZ
 q5uyCt1PYHyRqrLR8I+52hbqAdR9lxUuTx3R6QQqXjQSmQuIUmfjYCf0xFfC/cyiCePfUCctESZ
 LdxULX4GBlw+7npPOJAqz1DRBAygsfHYuAf53J5OfI0v1MI2aTjWB9XmVQo3fDjl/qfassh5/6s
 hljycMcDoNuLSqT4OoVwIIUjZIbFd3ckc9EKlKdTnfmRm+1RskFGga+eIy74/p29VGTxUHsgHaS
 wKE2HDQO6PkWO24rQ1ghKv78Fog6t6ZJ/XRRo42k4D2CrSFp6D7MGG7P3xM9uHrpvKXZULCtGCb
 1vW+Zl+dqKcp0lhBEgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MCBTYWx0ZWRfX99INopumh8iQ
 lo9rR/O7cMjHgMB8ysm+Irpo9qCRKp1LJxyKfdYwR4+uue4R241OhNvIaqoi3GH2yPmSn4BQWrY
 5KFraWqBLajas+X9ixKih3Fxm6ND2mRARNg9LxJICJvj6PLq+lxz
X-Proofpoint-ORIG-GUID: uFzAAFlZg62kJ4dOze6XxFkaY4VDYKbn
X-Proofpoint-GUID: 5ObvcfzAcHTwkF95JxcQe8v4l_UCxLAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 11:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242931

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/clang.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/clang.py b/meta/lib/oeqa/selftest/cases/clang.py
index d2b8dbdd13..fe59821aff 100644
--- a/meta/lib/oeqa/selftest/cases/clang.py
+++ b/meta/lib/oeqa/selftest/cases/clang.py
@@ -121,6 +121,7 @@ class LLVMSelfTestSystemEmulated(ClangFamilyBase):
         "CodeGen/Thumb/frame-access\\.ll$",
         "CodeGen/Thumb/frame-chain\\.ll$",
         "CodeGen/Thumb/ldm-merge-call\\.ll$",
+        "CodeGen/Thumb/ldm-merge-struct\\.ll$",
         "CodeGen/Thumb/pop\\.ll$",
         "CodeGen/Thumb/pr35836\\.ll$",
         "CodeGen/Thumb/pr35836_2\\.ll$",
-- 
2.49.0


