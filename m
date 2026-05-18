Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18964CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 05:56:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2311.1779083785825534887
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2026 22:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KXLziHIy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598bf1d35=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5flMi625877
	for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2026 22:56:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=h5a4TInFqd8yF4Jbz65UwUUfshjZUuu9jGauKZ/4BI8=; b=
	KXLziHIy/gH72GnWjxLVmskOjVTi+OsraXJBpvBbsBTdSFylDF9Ed+htjp0+6N3r
	5lRwjT0IazfOHZu+eUbCcrOEgvXJsvyWP+FwuBfAQ23dsHh9VZJjGfTkFo/ke9Cy
	1X3w+aIITBkm/G0dYtiFM6t6Nf18XcGNJU8L+mxN98UJ4qp4Rlkqihek1RMlZKbu
	xX7uddzFvh3Qj52YJOrNzLx4ZmXhXpcwbOBi8DCABX7NN4YsEJT8GpTTqJ7hCzrL
	59GmLsKzACZFS/cm12da6dfnYT0lTJ1FRtRjTUpTQ8zuLM2xhUzLof0vgzyqLpO1
	xfJkQP06+HERmzMq90aSeA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1fpb-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 22:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jd273zWA0JxZiBrI+WdDYQWDrFYlD72IAAVXq4JniGvp53wv4z3T+la0O2X43FEWoCeFihl6bdShwOM4Qtpx4fkAk9o3zGUScbbdDtxnGNMfg8UWpoGUTbNjpUoneFgurQHy/RxrdCdJm3EP3gX7fw4Bx5s/VDgC82lfDI0q3CPV5hfymp0ojwt2MFemkW2uSkhnKLSM0r1sTKttOSgjcLSRpaYtuu55qSyAkesMdzpZlyJKmXOYh8H7GwkeRDgpuA3m4ijZzvdce4IlIk8sCuArD/i0RWQ5IzN7Ce7kPYVmSBM1xMf27uN2B94tcIscZm4Qp7VD+NjC/IDhf6kWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5a4TInFqd8yF4Jbz65UwUUfshjZUuu9jGauKZ/4BI8=;
 b=kowxPBwy9Ew85m9GySskKafOTGkZbKEHDLxbOCqVQGiYPC/Fc4TQKJ3dff4xvYXPbMfKRlFC09vp76pLToXyJ8cCogTqedfZqhNTYasie/oSwNA8opfsMqc8S1lciRJUARCQuzLLpGmB2+xGBbQvhOf+uBQLmiqJBN5JGVgxCllTISb6SOUSh35E/x7pwhpTpw+fxr1d/CAJUSzUmByUXrUGetm4EGydNQsxkytJ1UzumnHWhI6ckZ0ybkirYMOLHOHpwENXhaW+8m2xyszwXFoh47cDv27AkQulqQ/ehpbWc9Sd9z2hhVWcGiU0CjgMAcQ3FxyWL3UaO7tdCDXgfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 05:56:21 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 05:56:20 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V6 3/7] vte: inherit upstream-stable-release-point
Date: Mon, 18 May 2026 13:55:54 +0800
Message-Id: <20260518055558.3982813-3-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: ae14e3aa-9b48-41e6-dac3-08deb4a22f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|22082099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	eDCLv+HudxE1p6jxeCWuuU0hLDmYaFak1rbsuTqUtH8LpcyKmqGUmz19vmFFWXDCYFSakN5qiofbBg9YsRc4/o6Y6vS+jOfTxN247Sqkce8eocf01Nbws5V6/c5QVEPb5A8DTokktL6f7yy0kUX2Gy50zR3zl4j4dADRpicfz5tk0v6RbhRsIzQhlVGsWbPmYG+jijAIeuVV28ZWOrDb84n1Rg2Fy+3DMdh5dC4gDBS9ToBQxNgD/qZROfn2OnPBSWxfGYqHAesPQVcj/xWrOpNNIw6XguQIKhu8DNJI4x8/TeZdogdQAWNMFlLtELbfKxmypXK8alxRePhP3zVVHp+M0/2P8+/Frxbhr7Z2wHLuUIiDveesODJKIGzpIwMZhaNHoqKVbfiC1gixfvzPKKxt7CW9hA5aEeqYIZ3josC5kUdceAnZNQdTQoE0MFND5V2ONsKdc4rk/KN0VIw48CPw6Ug3dwkUAwhVvBUESQS4oEzpx4cCENRMVrGZ5blzY1++o2RSonz7YVm5Kwv0uvbCh6VUlFb7UTXBZs2NhbJlpT2HBBJkMnjy1V23/uekxzswXib1xeIX5Yt2gX09png70H0dqTPwOCr+9zoBNfUkTB33vW0LXeqeuCiFghuwBDRoEBKnW9HZV/QNarFqdJ1VGpaCZ+93jqHqiqGNgSzpFEnIX50UXg+PGYB+j9qlykB6yuBpccOZjtEci78g2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(22082099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?of644tRSgOd6C03wo4saeDk34Ebu/g2FwRB8KHbdLcp5PoYuzutB3npwXG4X?=
 =?us-ascii?Q?zzY4yf/1wszaczCfUiqk9OHLtEOes8M+RWQXWkFr9KgBfYYk4Xmc5PathDZ4?=
 =?us-ascii?Q?wBX+MprxhYTs+UI37BYtPkyfjUemktywDCapI37LrtJmYzgEOTvZmE9Y3drS?=
 =?us-ascii?Q?vIECdml846vM9JvSWzCRh+FD8+kyyMHhlkjUCpB1kvu6c9clfqjQkA/i7lI7?=
 =?us-ascii?Q?21Y3wk/tcMGEs6QaOa7/mnU3lmQVm13I2oT1VNeX6aJdCidjiTI6wyHB1gUk?=
 =?us-ascii?Q?FJ9/vv+tMTpTq2HqUuesDbG7qrqrxLfg9THiPJpA9970LfGCvuZKKw5LG+gb?=
 =?us-ascii?Q?ikqSJBUKZmNvgdZ5wOggMqWJwL4IKz+gx/VA6R1BR+YJN3vx5KEkZsHedqWx?=
 =?us-ascii?Q?xhReEct1OiRsqrgAQ4dWPdYAuj/kWXSXR6BPmOFqXo3+6vOh6CSlvmgrBu/3?=
 =?us-ascii?Q?UwLdSGmF82d6XA9PRS0AfnSyv+DfLqvL5SBDg9JIp3vo997RVGeqL3KGdxDT?=
 =?us-ascii?Q?jUBSuyHUwmTgp0Aix3chPB9Qhu0ROVKLCnY0NMhU4r2ezkm0YDVwval+nciW?=
 =?us-ascii?Q?Zk9IyZAct4R/aJaeHVRGhVZFvf6Ca+nnIUEHgEaPQbFv0KLMhf2JL6vlvzJk?=
 =?us-ascii?Q?u9rxfomvGjjvrUMJfRj6mFA5QxMDGFau5vRdAY4U0b6LeG/+7u5hLZHguUTx?=
 =?us-ascii?Q?H/afSRXsTpa+SZao/bQCC3imaNp383X74o8CaK6PHt4NRCgb1tYou2EkKKQ9?=
 =?us-ascii?Q?fg1VFr3oi4pKOXG1fQs7WTBCFsIcXmVWmfU3rvo2dI1WCfSRDH4W6eqwUIyr?=
 =?us-ascii?Q?YrAl99jqk86PVGaCwPpYBw758Z2+6LER+X6h7IdTDA4i8iHZE/AjCKcMj2Vr?=
 =?us-ascii?Q?6CTTJ0dDTkcoK9MJAnY5FuZ7nwwIkN7Los4PgQiH4V7mXakCAs2nRE4JS0Em?=
 =?us-ascii?Q?s894pyMSulmnFUxyXKX324Nlnziq9BaOEiWpqfAz3bXptJhwHMZPgurblBd5?=
 =?us-ascii?Q?MTEyTncjU4ovNtLmlxkZSGe2EpqJFbgDNxFWHyvLlnPvnEdiTxH1jGxZvCNj?=
 =?us-ascii?Q?AprQFUykbp0l1EOwabgAUpC2CAVcc3/2rmUMWmVqEauUOh36kVrEjeB901w7?=
 =?us-ascii?Q?o52ET5dsBvqwjLnCnW6eiap0dbnjEYhgsHFgWtKlrlx74rqV/u4MLTGOf1oI?=
 =?us-ascii?Q?Cb5nyJkNL0GLF9kMcP/ZH8rVkx7WHrdL7/C6cPi8dxz97Pt4Ig1NuP+0YbtN?=
 =?us-ascii?Q?cdwbfN9tywe+3RXygWIj80YuQ42hdryF2bAD0EBMhtrLZFOTpKkdjtzJFKuD?=
 =?us-ascii?Q?krXp+tNEjGLnuZDcJuzu+igepg5AR9sFUwPUTcJA1QoxdoSM50IjFddzKbeB?=
 =?us-ascii?Q?OwDVRKnncRlU3H/HxesTFctiV7ty0eU8+iNSpGkycHomW2ObJaf+9rsh3x68?=
 =?us-ascii?Q?0MAsjvH6FzrHbptLBye9CFZ6zDA1fFbjAMa/E3krgVUUY0ND54hiIX7qFCun?=
 =?us-ascii?Q?FGqNdqOciBXFXDZiT2F1yfXffYsVhDvSDv15RNEgfwjOlEfz/VJkASrtkY9q?=
 =?us-ascii?Q?1OEdstKfXK2LOez46xnx7sl6Nwm+Kqa6TLZ3odCvQPvVBApqwnRYrBUozQq5?=
 =?us-ascii?Q?LerM6aEKXbpqYM+lkWDqSiAAwR48jcraZM2bvlIZAOcdbCCZbFB5PP5Lpd/e?=
 =?us-ascii?Q?0eSQziOOd497QWJNWmZimX1+/0kza3O+OpFB6J/X6qEqPkdD1ekjmRF5O5ZB?=
 =?us-ascii?Q?d7Lj5RHbDA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	rPf1oEC2HkNF2MtgJj7BigA4F2YcribKs5sQH6NFKdW2fREI8s5G2lIwKFPDNBY8vjpTTCL5y/w9UboqPhHsDJEZ6e453hpgGwjVjYZ5TCmMrIBm1IlPmBM9CjxL/qZpcjwXdXOud+Yopnqci7g86/Os9JYIll39N5dxA1BlmiKQe8wQoIXhQb/H/b+3UPRx0gLkf3xBaUDZAX3PW+CY/IibfEfJma5fa8V/WvfUyfJX9oXK0Q1bcrNp6mqT7hRZku+tc9AwvMMglxPx1v44a6RDBtrtileD0pBnRBXbKgDD/rBCqMDaIifuYlOS2vR8Frbr+s1Yub1mc7w1IrIQ3g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae14e3aa-9b48-41e6-dac3-08deb4a22f68
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 05:56:20.9065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYW+LBhwlISG9UysZ9Z+ums2an0lZYEy2XkgqvK1J87JS/n+bmuDEnM0yEpZlaSRj3a0kSWJvQeUJEmW/daLCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: opPKdJEid1LzvsFs9jXQna3KKIP-KZ6G
X-Proofpoint-ORIG-GUID: d3aqxjaYyQGU12w_2zqnAmQQvEJUGV9-
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0aaa09 cx=c_pps
 a=i69ZgmgbQZPDBD2C4G6j1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=_0aN1pf_025NAIwbKcUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA1NSBTYWx0ZWRfX6h2pGoMvs0df
 Bi3EfSjXtYz4B65xE6WhTYZvtBx9+Q1l54bCCvTAdvhDhXhdaEeYRJa1tKFpiZEenAQfBVTjGX8
 dR2l9ylNReuL2mM3FM3vDSFYCEbzyt3s2gJRAt5v9C45rAQiuuujU5qltLke7sl35FjShdruEJ9
 3SBqV98xsuPBYDlWQnpjoVJHcTxvnPDBy341xRoudqarVORP4bLZe+ox1N3yUj/gnz4NmVpDzGB
 UgPP6r6jhw7gOPyhUquWYj4MURWqj9YzURaNFOr70Y0qJJC5lV3QQQh/TaKh36VneReJ/p9C51J
 NykVTPckeqsVM5IDCmj/BOd6ggurhIWM1HqdsyKtEJonQuz92AOrUUxbLBYYcMvwo+d4y/TMsi/
 /8AdIutjBMIWySEiszw8i7gi3ps3sdY8lwj3fsWoR16qMniQe1E9wDENxuRaBzyocC/Xb3EwCqy
 E2kuqqvE3I2omVPn5/A==
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237198

From: Chen Qi <Qi.Chen@windriver.com>

The last version part bump for vte is a stable upgrade.

* Evidence

  Its repo[1] has remote branches like:
    origin/vte-0-76
    origin/vte-0-78
    origin/vte-0-80
    origin/vte-0-82
    origin/vte-0-84

So for example, 0.82.2 -> 0.82.3 is a stable upgrade.

[1] https://gitlab.gnome.org/GNOME/vte.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/vte/vte_0.82.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.82.2.bb b/meta/recipes-support/vte/vte_0.82.2.bb
index d5dced4ce6..839475f32c 100644
--- a/meta/recipes-support/vte/vte_0.82.2.bb
+++ b/meta/recipes-support/vte/vte_0.82.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "fastfloat fmt glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native
 
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala upstream-stable-release-point
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
             file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
-- 
2.34.1


