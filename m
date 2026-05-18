Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C562CD4F50
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 05:56:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2309.1779083781611681066
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 22:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T202RIwa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598bf1d35=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5NVgx594548
	for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 22:56:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pYNqsrvbyVWqlDv5xl5yqlroVnvkU8tsH6hJx/bHHgM=; b=
	T202RIwadDRXiO0vo0NXFvmgjqAVgizBNS9sNbqea7AOO1svRsB2iJyTW9eitFqZ
	D5e+/JAmk0BbSnBXnxvu1AYQ6Uh3vXK2LZcMTeA1LYfyKaQ/uRDgDaHHNsf8OeLR
	tKoGOmfM8fvBcrcyzHF7Vx0bQybFpV+hRHqV0AAMrlShm0b1JdiLbf76cN/Tzj50
	ft0r+mUVT8sZEhpqYAcN1ZMAzekayRBE2Ft4TRium9HbtWTLKj5/uGLdZEz6Vi44
	zUGf+ft9rKb5Gn+f0qUONsIhUe8Ir2zKifENLSR6im5LfhM/CpRKovArYB6WbV54
	UeIFsyzxBtL2PG9VwlaMUQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1fp3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 22:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6zMr2cPt4kvADHU2tuTlysPmdG8PHFVFcJ4uIeNwx7Lwyh5CIfjEGHA6Biddw6hFI+7uaiADUvKTZj9cssJubtfpTGakFy3oEiWCZ8im1vNL3TA43eh5tyYhDPPb47+ElRd+A20XteEMjQjkJ0L4RAK6uZEeKHeJDFEi8YOoI106rhBXWhOOh9btzQiw2BAIRDocTNg1+f4TaL7uFGS2nw3H6MBbkDlIF09Ml4RX77xoap+YqXx8DlNnI1isg5bvkoPzTrVzALaTn8UHci2Yzn9WEui1eq3UMqZnbCINljkIIy4nP0555Zf5X+gTRhgSHMvB4ywCgCggqzPIbKAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYNqsrvbyVWqlDv5xl5yqlroVnvkU8tsH6hJx/bHHgM=;
 b=Oswuf5bSFGb1Ig0lCQbmbRJ0DLqWuPXx2AIgZoU/HoGbNk4N3otTJ4HbT78GU8zzgPe/H85yZcW6ULfqyRC2LJFQJEtxw1WX2bu6G27jBG6zg0v8ia8nIi1HWrZjGXSfVgQe6FiSocKLFcliiXwh9HefUMLMAPrcZkYyFWzne+Yen5/qqvRq26OOm+hpmCoHix7vPLMOwcS6IO/tE5vTZM62NA0nhqPblAjmUmLpZOf+eztZeJbCdyb3tPGJNT/q5qGGlSE3iiU9nCu1HMnwPRcNfrBW7hlT3rEtf83zWzNGAazwkZhkxHVzrZ2HTTPFyQxow8gqhGKEKWsvuGbmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 05:56:19 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 05:56:19 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V6 2/7] upstream-stable-release-point.bbclass: add bbclass for stable point upgrade
Date: Mon, 18 May 2026 13:55:53 +0800
Message-Id: <20260518055558.3982813-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518055558.3982813-1-Qi.Chen@windriver.com>
References: <20260518055558.3982813-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0186.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH2PR11MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: fcaaf901-6df9-4933-382e-08deb4a22dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|22082099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	WrElVZ2wwnRuDc5Mv0Eyk94nWM5BlPmKqHdKCjyW7x4SVYhljaOTIvbIwiU9kher9PYwfVoUKgqqHplBcE6/BA/97jLpoSKiK5x5FNP5ibcYV2J8Ezfl6D3QM4f1wSrYGJ21OothaLexKXcXR22Yju3W/X/ZPiYEQ6qld4hm746u+FR6fX9YACa8+NpHO31i0ApmJmfIzjZ7WITU36acsBral3zjhph8EcluGy5p+2blkmK7ci5rePTMGo5X1/6THT4PGiHljc79J5+HVXcf+PPVK9SH6ZhVa72YXX327u5jiS/AaRxrcvm0+ExYduW341RqM686aqceunS9OAULdSXoz9BNEOUG8MaAg3XtGssCzFJGV/O6LHcZrvROc7VIvaLVH/GRu/UoHsXDBXCAYc/3459ZXUyWrmtq9wRrrlqLu/3N3nLGWnjgGU5x7s/aBIvKqI5VHoWC7Q9SGLzvYoqc77fbu3y4n1Xr2zF9zIdzObxZfoAjXSSW5ggEnqEUYFjBLyppoJm08tD4d/MT6Hi7gUQZrj5MA8Qlxh8apwz8fz9BBXAwzt3Bb+2TVUmpu0Z2hFvO9zlx+FaPnHnH+qfHbEc9Luow9Wa0HeKWhy9UiLQA/GpPzXWhkljM17/nrDy8b1G9IirHtoSxjrlWHgaL9H1uXIxBKRCGPuzJEKpeLHyrfs3lyYZd2Bbjs1jtdfVYlk98QlSp7FbvchahV/GV/gBuQaTrgawZvLbKulcuYL3Ta6M8Z/WHBZFUIcMo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(22082099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w0vk6sElfoqWyqOp4idgkCLnS0RYyoZq8CToskSMQLpEhgMeYxZe37U6xZHO?=
 =?us-ascii?Q?Ia4Q4ZJsxOzjAtmUbcXy+TPCQ+a2SfstBKdEa6MCa94HmYYhf35p7jyckthv?=
 =?us-ascii?Q?n8XQiwStw5VFQvhn0ADgHDWQdkRSLpj1tHkC9ULxrN4G3oe7OpM5BpaXyFmg?=
 =?us-ascii?Q?VltlK8PWRBIxOdsHlx4w0vqY5N5zR6r3ALVED4ICAxvfABkVFMuurSMLiBPA?=
 =?us-ascii?Q?nXy561MdRpnIyIRxaaM+XBTjVOwA5+tem/7bnHnGWvRKkI4U8x0+joeTYaxs?=
 =?us-ascii?Q?2WVcEMiFOHYBAkVLEnibXehpbWH2NtmoNas0NkkedNk1AzztRISyn1r9uAon?=
 =?us-ascii?Q?3fi0JRBI0wby7BeujGmWub+51zdEy59LT7916tZBThGEYfF7aCagROdm1N/6?=
 =?us-ascii?Q?vcG+hEJqerprkU931e2fLtPChk7R9yo2e8hnGHE7FdAZ9/O6WI9xwXEwpL9a?=
 =?us-ascii?Q?r/S7Q4llt5/JlGC3jR0au74UQruErOgzzHEkp4Q/Syw4uAqYOo9yOWT5bqeG?=
 =?us-ascii?Q?bsM33zu5kYjg2ttq0XauO2xHANrbn2lSirs3APq2F/h7YSsDs1P1mfYRxRQt?=
 =?us-ascii?Q?0NY8R7gRg3CvpHLJR/RL5WR0+cPTptWFb8w0YJc6qBESRphWrALNF/9BnH3J?=
 =?us-ascii?Q?oLsLA2ynS44IJFHFNlyxsckkrnDsjUFrvsxo1wTAIYn/pVS2xwtJHQJiHPjK?=
 =?us-ascii?Q?xUXHdmgAEvSUyXmGjk4g9rpWIKnqMFAWk6PTVa72HEd6lMkzDcz2Rw5uyHie?=
 =?us-ascii?Q?oDaIWE52K7eIVg3NaGF4u8Xq8AxHXUGXaiZmml4KAIwA5jeHwdQpH3LU0Dbi?=
 =?us-ascii?Q?SZ6oD803PDT0mxDPNusJzJHkyON8njyhnkqVbmTGy8o1viCjGPh/EsWhmOnb?=
 =?us-ascii?Q?DeYexXCge65iq14hebF/vKAlHiQrPgUBFlbCs9Fen1G/PyP0VqujJtEBPZtt?=
 =?us-ascii?Q?7e26TEJh8a46Td/pGr+bSmHZLMeAVTBegRfz1IQXP4oai4HIkPAKU2RCsPer?=
 =?us-ascii?Q?rxfKZuYus5XwGGB+uaJAcLHserxlMUXt44k8lLuia3x58Rmp9UbjXC1+fG1M?=
 =?us-ascii?Q?zTr+oNyunIGLpetNhcuL0G08Z9OdZAp9RNHp3WL5bV2DgCn9572XZfQ3LPhf?=
 =?us-ascii?Q?4FbGX+OZbzwmmbSLQS7gPrUI3I1QncjPwkFsU2ZwHaW88b+ruIys/9OijC1c?=
 =?us-ascii?Q?t5/cCHpZdSYqPkG12HvZBmtJoC58tqb/rn7JFcMBHqUO5TrCWH13UEJQ7qjP?=
 =?us-ascii?Q?cwHC1gGQMW5W8TZF7ThvAlNohmg025WTGy7YEfPgavNPx/36sWhSrkut50d9?=
 =?us-ascii?Q?NqC+HNVHu+i4PdZdG/Vix+u3f8yJJgogheOXN413TNikyHtR2HLrrTo2M8jO?=
 =?us-ascii?Q?qyfYeRyWaIB4KMystGZaUhkEwZTEucZfvqivN0cMeyYHQJqt8nPINxb39vLz?=
 =?us-ascii?Q?He87mp6cEWUdIHMJ+oqCVLcMOdHye2eCWbcMc+r24yQbCzOPl4txmwla1mBa?=
 =?us-ascii?Q?B61aNAjRcMtkrffxfqMNOMNak8YT1rHqhO2Qm8mCycoWPn83vFAOQprbpuph?=
 =?us-ascii?Q?s1zzdYPR/1j2GDkosLTM2TLl9VecnuB/7sF8OeRX/QJkrOfCqhwJlejvhncH?=
 =?us-ascii?Q?pBGWnssLfuquP96LZA742Ci1Gvi34dGuBKsHsd6X7RF0TFtt7WZ9e7Iwnmpi?=
 =?us-ascii?Q?vpWj393KevDNFDeEGmobCM+Tfadc1sSZcu9cGlfLMPxT/kkrGAFHh0z0o/TM?=
 =?us-ascii?Q?+KKoFjOaCw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	tTG3zO3I11wQwql6F/kOdYmarqnD/ZS6XbB6hNVLXlP+7SZcT72pZ1FAl1WFs0DFXM3vTpExOsdbZ/1HDwJq//7ge1UjD04Bk8jZBm3mKkpZVfRmgpAUlJ0KZ45wtjI0UzvlcSNnn3C4dYUQHviT39dLhvctWMBJ3gxsoVF5qT2HlT8vgmApnV5FoZxGusG4qwhdpShG5S8rEt4XHAPIQIt8DsLW/7fRzO+JKs2SA8NGhR3xY4TdX+yv5VJZi2yUubXz3UKTerPeeIrSazgUvqL7yrA/5APNbPaeUnu53dKvXPMpBRE8AqyvIt20q9uG7soj8pCJtD5rWoleYHq5Ag==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcaaf901-6df9-4933-382e-08deb4a22dfa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 05:56:18.9221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAC9y4gik4zAN+rXqElGMJwwYd5F9wfkv6Bx/aRPz0xKLRl9Hf/mPKKZXuHpjeNIOyD4FynnWYszsOI/w06MQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: IJkFe4TYFQxMA9w3rZlq7HDB5qtQ5Qb5
X-Proofpoint-ORIG-GUID: FMdpVxiZTKXHLqjvLTyleVV7zaMRR5Gu
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0aaa05 cx=c_pps
 a=KKuy1w1gR68tVOnyqteslA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=iqG7azt2_bYMrk6mVzAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA1NSBTYWx0ZWRfX1dCZw4MebBk9
 EEHhy7FQVPND6JnmfgDPTVtD3QetyCI3e9lmS8NEVYEzQkFCCb5Faq3x0Rxd79m5s/f5BbNCvJU
 uimySqoVgIQrylfL24L+0C11s1QOQs+cLNyABuBz8sqDDHE8oiasA7YQ6EFcn7N0Mwrh1Sby7Bw
 dyXQKHf/TGROsKsxlkIv20szpneToP4NeI4oi04lJ37Nipf1hMIiUie4ds4hmGMaYZgUlyUZdvR
 /GnmhN70t2td4VDozMlyfahpgKSOAOdVp7N3MOIvzN1BDmzr08iK94/NHU1cOiLjquwwbbG5w3f
 mRDGwfQO780iCcC6zRq6S1TUPN8wC7K7BTxzXvDz0fHfZ+p+AhuK2o+sBxSN4ng5GwFpvZ0lUSI
 XmDcCR4tzhksHEGgSO/HRjjqzq28ZPHVV79PyYHDRDV3mfY3sHkiqWw7MnS9ncFIwEaA0YfDe7d
 MLCd83Mnb9MaH4zCgTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 05:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237196

From: Chen Qi <Qi.Chen@windriver.com>

If a recipe can do stable version upgrade and the stable parts of the version
is seperated by '.', then it can inherit this bbclass.

By default, the stable parts number is 2, which means the following upgrades
are stable version upgrades:
x.y.z -> x.y.z+1
x.y.z+1 -> x.y.z+1.zz
x.y.z+1.zz -> x.y.z+2

Recipes that have different stable version parts can also inherit this bbclass
and set STABLE_VERSION_PARTS. For example, systemd sets this variable to "1".

For recipes whose stable version part is not separated by '.', they should not
inherit this bbclass and intead set UPSTREAM_STABLE_RELEASE_REGEX themselves.
For example, openssh's stable part is separted by 'p' and should not inherit
this bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../upstream-stable-release-point.bbclass     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/classes-recipe/upstream-stable-release-point.bbclass

diff --git a/meta/classes-recipe/upstream-stable-release-point.bbclass b/meta/classes-recipe/upstream-stable-release-point.bbclass
new file mode 100644
index 0000000000..98fdb5b808
--- /dev/null
+++ b/meta/classes-recipe/upstream-stable-release-point.bbclass
@@ -0,0 +1,21 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+#
+# This bbclass is expected to be inherited by recipes explicitly.
+# If a recipe's version is separated by point and we know for sure
+# which parts of the version represent the stable part, then the
+# recipe could inherit this bbclass.
+#
+
+STABLE_VERSION_PARTS ?= "2"
+def get_majmin_version_regex(d):
+    pv = d.getVar('PV')
+    stable_parts = pv.split('.')[:int(d.getVar('STABLE_VERSION_PARTS'))]
+    return r'\.'.join(stable_parts)
+
+STABLE_VERSION_REGEX = "${@get_majmin_version_regex(d)}"
+UPSTREAM_STABLE_RELEASE_REGEX ?= "^${STABLE_VERSION_REGEX}(\.\d+)*$"
-- 
2.34.1


