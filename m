Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3956C54FCD
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 23:52:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.709.1785369121900263820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 16:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MkUPByVo;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2670ca2d30=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TNo3Td2695291
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 16:52:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MfgyRssN+UdYrwV1SraStVNFPJX3DlPW/QUr//Ar+pY=; b=
	MkUPByVoyCkm0foNIxPAOwJf3wTPmvpsjfCYmoWV9AUrmcqneimDAsKwSR85Gr5T
	Un+nvccM2PAGM4BmE2jZjrwSi6lEZlwkOag/u6RgwiHDZdE69Ww4XMIhe1kPz5En
	W8XGNLJ77o+rcyrU2SjPZKsIsuZD/SsG6/mDZfBLj0jNBlu9BGjCK5+3AJVj6cXM
	Gj1aw5NR1xMYIFlgYmhfMPCzIs8L0pjezxuAAz1LAuh31nfvqVDF1O7gtCXfsT+o
	gRGOAw6j5CB0lsUXqPOFc7Cj1cvYDoNlAb4iYQDO7q2url58y6/LCcbswCIPp4qC
	ELEhsoz4QHvCFY4xoTLYbQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fqugmg03b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 16:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6JylIugcD2UpewIf4UyD3INbxJ/koLmYYg8g5E87kHjaP9/2SzMD473ai/2DoJrqRlVKysLG07EyCvLeuwlOaB1xl7UHWnea8DgamueMBRftAiEWuZL42UiZ+gwncLDoGfA6gz20u7fPRU3TFg4IQ9PNpjf5brg7KoFKE2xwvH2l6C3UAyFOl+yrO1v1dJfds+9fno8vBLerH59rDzO1qLRXauJ/VLdR2t79xAYgnAs6EVcQC+pgXqDLs9MlM0Nv3mHTvdPtbB7iWd+Tj5qayLp43gkBpqHN5kbvSjxmI46V5/JljNMoWQLAPX6vKdR09fL3ZL+8pXGMCTnMxUL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfgyRssN+UdYrwV1SraStVNFPJX3DlPW/QUr//Ar+pY=;
 b=ydv29FGnJwX5wNiDnr9YRlHJcOlMMHsIhKBXuJQ/t4in6MTCZoW0H8yPhKuC+CwZ9Qhf1LTHP/U8piTUYGbtplizRQei0BHVeeFKvPs4lbEyKf5ZiJ/LH2spvy4IeXvhDfVA0HLFoNxC9et6qbXG7SDrRxE8sxbvmGnVm8dA8AH9KiDfl68h5OnOV9NeFLDLQ7u98ZGCVC2ld26jTXeOuALT88m75/Bf5daHeYWxFx8Wi3SnZ27DpjEi72KdAvMrU9T1yGnn659O1kYlPvLMSofH4qQ6OnYqGiGigbFZLau839DmY5gnR7s8cw1ZFbQcqNCYYCZ4y6yJM4Pk6s6e2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN0PR11MB6183.namprd11.prod.outlook.com (2603:10b6:208:3c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 23:51:58 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 23:51:58 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v11 5/9] lib/oe/package.py: Don't redirect stderr
Date: Wed, 29 Jul 2026 16:51:36 -0700
Message-ID: <20260729235141.1067679-6-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
References: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN0PR11MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d97437-e800-426b-960c-08deedcc60a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|52116014|38350700014|11063799006|56012099006|10067099003|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	lcr0MowIcbXYPE+H1+yi2t2Z5Rkjw9io8cfEC6TDaNM5g9Uc3vdFc79xiymi5FR7hdnRd+nWBm3mwNEPCrzodRk6Hc0u5Nw9MRuG7RmGZ0YInmt4/tIHlsBWftl7zDLeOir7hg3RejpRJAxPrKhjgJsmwoUvpGwN1QWNxF363CyP9UlE1zfgk6qI+Ld6eIpDm6s3H1yezoW9bQzJFDzqoxQYKkhBd2YVrW1UmBolLGI2jx+lTtVYaTf7C+QBq2s94CE7Y2m+7kqdJy9zCk8ZUbtGQrDpZb3A3e6M98PpS2pWuS4TL/speUg7xwFSo3jmzbH25zP8Y8WqV8rvENxcXH7R+frfZkrd1kHAGHIIDal6DZUMqm62jn1ul0CFVUDhFzU4Aexj/B/vXYDZP5WfgUW0/4eNNI1MwdA1kr5DQ4BqMgoYLlfNuET3e90xoUgONU0q2baS0RWIp+dQiX618YhkkdYXhfbn+vM7+3ZL/7BhgATnhyv9VnKmjnBim4IsLPM6ElxXrw3OZurf4camfBwcGmqYBlrBi4lM1S4X17wX0XvtknzwzAJEmSzGezZ9cLsKu3gmmlq3gohu4jlwS8R/svyiWLPE8IUspWGWqmQr4nqIMoRUkPaqwuFVYLdrTSsG/ObsV6uJ2N6EHtOYRmfoYI51P/BdYP4G/2TsLMDgGcc22v+jyFnRlp0ivgmb+LtuXUkyQb5/3Xrq9DyBidyfXcIHC7GG7q7wKg27bYE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(52116014)(38350700014)(11063799006)(56012099006)(10067099003)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ExVuBqfkyFD9a5pGNnHQShbnveb9xpDpXFYmysrgOIzpAym+CHfcHE14+grq?=
 =?us-ascii?Q?8BCKhn9+TI0YWGjH7+WMzlkIx9Kl1ukFKP4geLe+vARcul9ku5eo+pVYci2T?=
 =?us-ascii?Q?FAdfH7oHpF16c8uklkW+hp32bPpPc8rhFrIRj3vOQD97ZHQ6lm5tmjAZRxFa?=
 =?us-ascii?Q?SyD8/pA/gFsTlmdp0mqVmofWuetW/ZIsZ3Aa+Q0XubDJlbbWeu3go7kHEBo2?=
 =?us-ascii?Q?hu5jhgXHfI9kWJpKPOA7xBK6olZiqbxhtw7WZDIUXuBZXQgOXkS53yX11tgK?=
 =?us-ascii?Q?cKTqVAQfgsrme7ryNBqscdIA3nmXipAcICdTLOeMhqZ1Aed32eQ6rcsEOyGi?=
 =?us-ascii?Q?Pk0jpIHdZ2YEhQ6OTXqFc0FlgXndrdWAeu3IFaoeUbs9o5MeRvGaVLggfjmJ?=
 =?us-ascii?Q?Es9s9Ry7t5qVcmxbOS8Xu0BMrT2AqetTtz6+C/OYcMzYV6AYCdGzsZIWsto3?=
 =?us-ascii?Q?ZFqcc2XOXXRWIeJTm2YcXfwjxNc/wBl5IUc8UXWyRBDHsWE78gnW7ygOXnds?=
 =?us-ascii?Q?AHWcSgF3mtEPGaK9yiUzzbfHx28XMXjagd2WBKPvJzlg+ZNwLeh+FV5pjyos?=
 =?us-ascii?Q?TYbHK2YAfkYyh6/q11lwf0Q8tNEYOKMj2WcdicBcBeyc0nOmDl/tAIreUmLm?=
 =?us-ascii?Q?oxFaT51KZyWmcl1ap64+mH8dmQ37yqrI0KKRILf+CpkzIBYLD4IVm8Xg2bpK?=
 =?us-ascii?Q?YTPExja0bIphmHupyOxZo4xQf1e+2HY9jx9flNOSMgLwk1ZTWNAS916pd0kh?=
 =?us-ascii?Q?phXIUe4tWnMEyLIzFGsgghaQ9fbcYpdDmoBy32Pok1QU7DFZ4vHeZDWsaLPw?=
 =?us-ascii?Q?LqA7zzJnU5Iq3VfaXaP0RDPTPHbl0iP96G5U/NJllepSzal9w3zNEXx6cBxr?=
 =?us-ascii?Q?jAxH2Yjx84Tx/oW/VsvOwaKiba8wiy7ttPVOXc5k/6T+4vBtnPaf2y9WLiD8?=
 =?us-ascii?Q?bs5GruCDgGVBNm9PNuRvMPYzTo4Lv55uU+ZDJWEOBlaeIJk9gRVJCusqVRye?=
 =?us-ascii?Q?3VXKo3t7F+dz9Oz0kBp3EOKyX1cc4HNH+6AQsWl6I02L+qK3ADNg/SZcTtuk?=
 =?us-ascii?Q?gSZDaLekO3RBNsofsEMO8ozV2Vs+AGZJz/WhaB5xzNiijhtNjWbVKsykrxT+?=
 =?us-ascii?Q?eLT0naBTJHfQ3s0mxKBB1v7M3quXbGjnBZ7xzcJF6g2HZMMv0/BXkiHI+mEP?=
 =?us-ascii?Q?j1YTFPDqur4caWEAyE9J6pu4BEL/OJV8yZKDpX2ag3YSAZ4pKykHK0yujTku?=
 =?us-ascii?Q?n5jHIMmFofR53RadjHHfd7sGYrmf/WlaJOsbfLj2eTjiw+HlGYC+J6hPgPpU?=
 =?us-ascii?Q?I/fjQgsjAc1ZyZaX6A1C6jHP25F+WDzIiKVhZ/9liNwf2+qUNwiqT7qQxEXp?=
 =?us-ascii?Q?9rApGIxrf+L6fnvd4bl36UbQ+IJEjDActWNzlYaMKrLJQaDXC723K2JtLQI1?=
 =?us-ascii?Q?zp9XOXLwmRuND4VXoDhunARHxKIOuqM+jND9jk3w7sMGiDNqb8eQcvOmdgl6?=
 =?us-ascii?Q?5ydhc6W2qNt/M6PLZDTO+w6E2I5y84iLGozPA5upoiozhGcai4EjqDI5eyiM?=
 =?us-ascii?Q?3OEZOZBWTrvPE3NCuw+BMKMFmfEI372+xNto7dcRbsLgnF8rHPLerPZHNF+4?=
 =?us-ascii?Q?bST4zPhIFOhHoO0mGOKCuZ3b1mvYOTihI4G8XfRJXSH9arUbtHXXNqlk5+aG?=
 =?us-ascii?Q?u3uw++5JPk/0EWOXtx46aMejCn6Dk9/Zy0hJUgN7VrbOToY6dfw9xZ85ryva?=
 =?us-ascii?Q?sZG6463fGCvDezoA45GQ0ONK0x7GKb8=3D?=
X-Exchange-RoutingPolicyChecked: 
	mFR9iZZASMydqodGLdzX3jo+N1193tzL9EU6UdGIJfc6m6yXcNEaKiib56KFDjPzj1JympPWWEDbLKj7bJUixWr3mQXQQJw4DVMYYFoTshPDaF6xcoGJxbVLGHz/HL6I7aPLSsiw15zIZGYfYbooY5s9ElidXz+36DwB9SAfxLoyRZBafs2K318zdj6bC2FHgx6fkbpPW21oqaQQAuq7diWPI5CSc9uRECJMEepQf9XTy6tZHVnBtcadTnv8c5xgHeOE2Wll7vkac9eLiunmGglu+jhftF4yjLKXitua23x8X0oBjKoVf3VKCN/3IaHAzauaI2eKQLMVHZ/qiKIdDQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d97437-e800-426b-960c-08deedcc60a7
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 23:51:58.5833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99w6pBkYOVwGZCLIhYxtlvcW+nS7Ll2cf6WyCD0b4E/iqITcCirJ6zn+v65zaG/RWjZ6dx2+lZaLoWJ6FIYCzUfSc0WTTJ3A61coqYu3sNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: kYCuYN_dXsm9-4joD58sOCQqxoYSj5fw
X-Proofpoint-ORIG-GUID: 0X_EQHqaBtWwbXZbMMLnvJkBsmnbwyQM
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a6a9221 cx=c_pps
 a=utU5wDo5Le20VJoxH2NzxQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=gZyeYKPtWqWysoXHKEgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfXyMxz5fe1FG+F
 Iy+8ZKRQPhseeFFcrokYjEWlF+VhE4KD/5+msuKUoxL1UV23eFSJuaLf/S0A3DmfY9QaV2VRPEm
 yx+hDE0cdJUJnqG5Xc7ZSYBCsWNaMM7AXYrxEyceCb963Axx6xOW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfX1aTF1ZNIjKBE
 I86imKBCKGl6PSx201qcyrk3LBGHK0kA/fneLmbTYdb/D/o6qTaIrBkS2oXUgt8JCxYdMQz6QR1
 6S212Bq8y7+1a8lpDlnXQL0pX7D6m9mBceo6KHsk1cIOcD03HKcK0Tg0wd2h3t54Qm+yZyQC7ld
 mxCckiET0134hMpICLBnCeyCvywLhULNKRkLAHGAgaGHhz5jWTmfhfRZisCrYPKAFYjHixpN+GA
 BTs8GpRJFmMMr8YDey7giO1yY3sgj2uWyIHBZi1SoHnQWeJsNrIA3rIveR1+yypiO5bkj4higMC
 VwTD57SB5ypT5bfgFU5Yf2xgPK9dgfYNj0J6oU+r/EyB5FbZcA0WMkjEpKzL3DDpSrw4PvuY2uX
 UsS+SDloC6HLd9gPfN/+hVR0lAQJQSkIqjOPgjon7kbQSY8/eSzuIgYLZo04COVmPEUFXRUNuhE
 8tNk5jI5CuqO+K/hC/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242302

This can make the debug easier.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index d210b4a73b..d6617cbac3 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -291,7 +291,7 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
 
         return provides, requires
 
-    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles, stderr=subprocess.STDOUT).decode("utf-8")
+    output = subprocess.check_output(shlex.split(rpmdeps) + pkgfiles).decode("utf-8")
     provides, requires = process_deps(output, pkg, pkgdest, provides, requires)
 
     return (pkg, provides, requires)

