Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3140CD6E41
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:35:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20634.1779888939569997069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 06:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gQNcUL0K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RCxt8h3067731
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/oIeJXGn3omnUjK3JUxl271M2lTKlApi1Dh3BI6brNk=; b=
	gQNcUL0K3MGKJtDzoBqZQTCBg/tGkGGROsbQpYQi1ifOyflu1HOHQhRer+EndbOp
	iIMwqjDTwirHmknne0BP/UPM5RIZmzviN9fTO3QklxAm3jAxZZPpWtrEX861sqHH
	cnGcmeo6PRu3/sNqW1gTdF8xwXLBWOB2Lsi4fGzW88viTo1FMlcCYetpTPqxdamV
	hV04BfYik45fHD7E1xg+8B4V4Yj22W5uWSaLykzhVVs4OaFUGWkUsdJAnA8ywF3F
	HzyQWRbAGPv/CajJMng3MemEubxj8MdliC8PXRRjscHwsvxftp9/THUrBsDxMG41
	n/YhFLSRKtS60bMuDvZQEQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376dytx-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIJBUadWcB8ZSA7J7XU2MkYURkXvC1vPHXh4sFYyaHamVQYbfKa1drYCvDjHWAQlzOHNH1p5aS5XuFQevZgr/gQyxMC/q9B5MP/95Au7uon5h28WXFUkNnN+isI0KA3Qnr0dvG6XikXLXT1CuIjZP0HllGMX2FdHL9uLxKAowghb5Xk8PtBmkst58ea7drsC9dYQefGbq+FbV6ufDB2xRgAq8Bz4v101LRfnkEEZ0/ONMScNcixA4Aiq6XloUrKOetk2/YoK7DJO5HFTIyD75a6/RWUHm70dJ8Nv8SoCKNmMNtX1VroHSq9XloDgIj0RRcj8Z+YxjpnDiqoBuDMsMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oIeJXGn3omnUjK3JUxl271M2lTKlApi1Dh3BI6brNk=;
 b=TmH+77RzIdBqqqWhq5w9knNEpBDM/M48Iy+7TOi+wPf3nOSuNDgJUCakSkW8eXW3gCJ/6Uwr2sr7Z+s21rvMnk3ptbSFlrprgdnssV79BefvNDy9kODKYUr+lQcYCio0FEkmMm9qws/p6QPEoyVq9yF3Bn4nWAdBS0T2S5k3Qa9uPhYvkBgDw3ZMNL1MFgD7OnhGS8Yqzirc79NNuevEqeb4KgzEN6FuQAX5OH0gBrrKR/gevGjWPqKaOFQm9823zG/dUX0Www187qUFTnvBWNyTNEr5+p0mqsQFWh3FuSyXQ7Rzknh84oyPUTZiUsZ/lCOaT6THc98CzoGDHMeEPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 13:35:34 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:35:34 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v5 5/7] gcc: i386: fix ICE with -ffloat-store and SSE [PR125308]
Date: Wed, 27 May 2026 06:35:11 -0700
Message-ID: <20260527133516.2337150-6-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
References: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c9e486-b8ce-457f-b488-08debbf4d458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|13003099007|18002099003|22082099003|38350700014|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	F7BIPPZ8WU7vFVHJfuVCwN4n/2duoJNkDK3BQCML6jTX0keHLJ2Fl3w7E/5/xGUZTnc9pf6D86NgCXwRKmLOLmQ59we6v7rPrX0qQSTuxG8qBzN9m1XhSMQWZ6RXX3YxMpCEKO9NvF3RVGnS4/HEW00SpwdUCRbgX1VtdFJfi2zT/qfG77Wm4DE3OBq6m9tfJv4fKPLEdRx2hBIAMGkTm3bDWhAUH3lNeGe9JY3Pnm+MBVKYnps0ZbpwLxU8eFAZkMUTD24yeomkswSwIvniz7qqgE2p6pW1cIGkmgm5LHGokBubph4/OdEJp4p1ZeTG//kv5V5q8QNfs3f6GaxivBEGSKuWkduMRNnzdoY0gd3XhCr5jmCzLxNvs4ddKqnh7/bFtGjngEZqVYHjuMDYVilxda6sZSCwbySKI4p6aB/FnxGognnGFfLWZb+S7wFql73CSJa/nH4W7qCTqNDSGbWd7IscXH9ATNQ46glUeg8F8aw4ESEX8FU9SnD3VvdydCQaQyxRkalC0GFNTq4pX3oczrdDq2vFBY9KENw5paAfPoIzrP5iAuWurtJRbbbL6ZAjcPU53FFmqoVjTiL/I1IN8ua49gbBS8oDkEw3zIdVUxFXQ3n/iCZ2yYkBM9aJvdw8KPZ5rCdAkz/BN38qu4a7Ag9AwPLk+enRBciyfLhF3nzzYmTgB4OgU28DvTeOz7WS7BnUipG0cSNkZlr0Qw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(13003099007)(18002099003)(22082099003)(38350700014)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j5XX62O/cUtp+3PXKkpwOBgbOP6f5gtWy0ANgp5ODQos3Tryiy0qo5ZLlum2?=
 =?us-ascii?Q?0tCBIZ/TGisoWqzNp43WiJoxk51BaKD4j3Eq5agyyyoNOfZXO/h2DfhzeiPz?=
 =?us-ascii?Q?qtd9jfcxbmaJOl+DL5+BFliZxQzRe/qwq61frpTNAJLPaAMK4SWNIGIdKvej?=
 =?us-ascii?Q?6Chj1Ok7NpYdowDhDTreWnIqSnrWSg5swF+toeOE70Kivwda/mE0/MOXHgB5?=
 =?us-ascii?Q?1e9CltW7LfQ2xAiBbte04F9ZLqBlTRZgHFeT+PwjAeMeMiA/QyN8y+5fRnC6?=
 =?us-ascii?Q?gi2x1sd265aP1SLkHOzElKWPltIlyV+eB1Oz9nsnSKMIIxtxaS0Ba2ca+PwO?=
 =?us-ascii?Q?9awjTxisUO/vXiLen+ZipFD82SDxnPImOEDQzWNhjKhlGO85RJ+kMXmt9/N4?=
 =?us-ascii?Q?JYPJ0etnkCLg+atLDjLZvRX7mL1mQHwstfCdYu2+HZi4scwUVQfD4FqrssLc?=
 =?us-ascii?Q?91jsWq+nRJ3n0b/GkzJb+GAZE5d6se6XYCnGlorYriFlHiKYLk34XuL5hdPS?=
 =?us-ascii?Q?cf7JRERx5dN12WcOYM34OqFO1OA+ukbGtJiy8ZzFPwoj2BehXXyZYWZgMBp+?=
 =?us-ascii?Q?2uhWf9xm11OGLnlFPJbuygZxmewelDXyCv5j5rzBGcjTOoKzMdKal0MJPrqi?=
 =?us-ascii?Q?e8k0ZQfpwwhSIHs9AyOO3KL3aR1y9d9NYb2YWdLtUflw/RFl2A/BEX96QtRd?=
 =?us-ascii?Q?Ct9qSxYyXNgDEqYJB46Gde+8c9OqAudqcqweurj3nQVNjNqK2JeSrVbAmdD6?=
 =?us-ascii?Q?JfCysJoxyg82V0A0c9mOq4uMz7rMYwN+E7FmXVeAvms7NwKApB2jBKYBBc2l?=
 =?us-ascii?Q?DJMtS8ZYXLPDuH/3KC4n2ecc+Sj711Gir2/YoMjfsB1K8xRqRfQAkhpBzCy4?=
 =?us-ascii?Q?teuGydfW0ziGlHfQhziYpZ1WbZkJ4h0/p0ZiEIYaQzoOniYbpxSypS6M2MFf?=
 =?us-ascii?Q?femJ7yVu2dhzESqhsfh7CsSuoq83gDCGPUuLvqggi4DDHb3QBTIUpdfF/3dI?=
 =?us-ascii?Q?56urlHOY0RTRMckaVC6jnHThonDWhjrC/m4qk3e5/XMECui/AncNlnU3vCJt?=
 =?us-ascii?Q?MTxW3qnf5bQGvSLE4c8+a62tSngb3pW3qlo/XgWjXIQPWzh8CVVRJgoItD/D?=
 =?us-ascii?Q?wLHj+5weRQ+j/naHUsee2GP16bbKkJG2RMJStE3y0JLnjMeSTEpi01FQxQUX?=
 =?us-ascii?Q?wVZalYtSvnUItOQPBIrnLFm8rZjtQCAWsx1HO6FNIkKzI7SebzeHvVbXl9dL?=
 =?us-ascii?Q?ddHbuR7q3ItitbX0p8vNUtHCumrydU3j9IRl7925eQMpKmcvG3LoJg9ykUKp?=
 =?us-ascii?Q?KwQyhGrTgvPOvAD6PYeeW8eGHF9M539NhuHTxpWSg9vymotja6QtyFPybyVP?=
 =?us-ascii?Q?5W8YOCVhnFlE0YgL8LGjEqDvSvw1K9l8U7fyA+Ndwme58VqxurkxYXEmF0Ij?=
 =?us-ascii?Q?OfCBQr3TkbVKNQV2PCGcPKdJRAaCpjSj827mHJbDILa9Bt4V9/7YEpLdi9w+?=
 =?us-ascii?Q?eLMJ88T695XkIB/Rcknz12Ml+A93fjMx3QXH3WtQI+8joNV5Fv0cxVHxdF1x?=
 =?us-ascii?Q?4KWxQw2RYudRg1W6bH4YDKXHlbNgZ5ztJhEk1DeA1klyZQVyvncvmrHyjS73?=
 =?us-ascii?Q?TonkFNvIozy1J+B1DaSNsEiI9pfAlWt3f7A8QC7mYHfM5JGXkBCfz3dHF4sz?=
 =?us-ascii?Q?krkqERciISjzkAB4ShPvioRn/ga1zmoL7QAT8xE5y1k6gBOJzrdWxYV09159?=
 =?us-ascii?Q?LllFUsjbYqGsxbviOkS391KOmStydaU=3D?=
X-Exchange-RoutingPolicyChecked: 
	M8cjHMIV7nxbxP1N+afP5coPOmZqAoYtwNA9BKr9VqfmiNyPwBvjGpEANR3ErGL3fGHNPZRiAuUzUYiqCloYSPRFkRFUQvbnTOR9HNhuZ/k3SS4wRoBevzxSAqIYXMbEpdZuKDlwDUdTz6zQv6jo/bO/w4sh0Fkndb59qssc1O81H0WNJgBYkkMEgmfV8wXr2QB2pMeRhA7IvXFL9pnVBoScplPEFXbFMjWYHEeTOCW8qNWs1A5XIepqgroQhfcDXYR0P02XCc9c0hYUp6XMyT5ZHw7sdfVmYQWDpaw7DyoS08zTfkxaymhvEfNNCRHezvNdnhJt06QDIlNWyB4lOg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c9e486-b8ce-457f-b488-08debbf4d458
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:35:34.3467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvuMAaF4LySWnwq2urgOvhlKdgr3FtIU9pTKN9gqjD8X0LRxuo/2zCP+qPBbQXKiJBFQLoWRXsU8dbhH69nsMD7F0QEAyYZHsF35uBMfI5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzMyBTYWx0ZWRfXzdC5wVako7ra
 ONe+gp8aG30E4rr75bYMA6rZlhm+Q71liZF61i1PcYZ3yfNdjCmikN5RpOtkOLm1uIqFy4ZTeMC
 Ao5lQ0PNms54Siz94txCg4tjNI22FnHwQ5FV47yQicjW1JtvnbQJ0D7fSffwwZrq7A2bgQ4qBW+
 9RZ9R06AvzfbpQM6uTtz9+C9PBfjsdpP2n/I6fP1tuvJzPSdh5EkgRPib1vb6H8/xm9BLq+BMvp
 vnPVL/MMkj7mhcQUZhVzYdGFjxXHfrY5QPjg2a+Jz9UTsu9o64rDSDo/2blS8RMZSWhQG3JNRex
 7y4uKYGaaKcMKb6ZJESyV1HnfQCw5iRAvUZjyEZZluLm+YBdvv91xnUZ6HOhxD7CYYV44bNxIlQ
 d299Ai4UfOQmX8X6V5uGq2bRvons2kX0WcgmuCIpaSuhY2HY6jBNt0OSfbtMoC0rYk6mWIEP6lw
 B/EJG9hCHJgF1d8KksA==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16f32a cx=c_pps
 a=YvmT30J82QCmV9938MlLOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=jlh4oiZtptqtEtrTLrMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9tOVz-OFAi9re1ECR3ojCBc2o4OOfCbJ
X-Proofpoint-ORIG-GUID: 9tOVz-OFAi9re1ECR3ojCBc2o4OOfCbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237666

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Backport upstream commit c96589414eeb0e46d9fe9cc1d562e048230b5f67
to fix an ICE on i386 seen while building piglit with GCC 16.
The failure happens during the IRA pass in extract_insn() when
handling UNSPEC_IEEE_MAX patterns generated with -ffloat-store
and SSE enabled.

Link: https://gcc.gnu.org/cgit/gcc/commit/?id=c96589414eeb0e46d9fe9cc1d562e048230b5f67

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.1.inc        |  1 +
 ...6-fix-ICE-with-ffloat-store-PR125308.patch | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.1.inc b/meta/recipes-devtools/gcc/gcc-16.1.inc
index 3a96228631..4598aff045 100644
--- a/meta/recipes-devtools/gcc/gcc-16.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.1.inc
@@ -73,6 +73,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
+           file://0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch b/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
new file mode 100644
index 0000000000..0ec8a91ffd
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
@@ -0,0 +1,89 @@
+From c96589414eeb0e46d9fe9cc1d562e048230b5f67 Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Fri, 15 May 2026 09:55:40 +0200
+Subject: [PATCH] i386: Fix up *minmax<mode>3_4 [PR125308]
+
+IEEE min/max are not commutative and in the pattern
+(define_insn "ieee_<ieee_maxmin><mode>3<mask_name><round_saeonly_name>"
+  [(set (match_operand:VFH 0 "register_operand" "=x,v")
+        (unspec:VFH
+          [(match_operand:VFH 1 "register_operand" "0,v")
+           (match_operand:VFH 2 "<round_saeonly_nimm_predicate>" "xBm,<round_saeonly_constraint>")]
+          IEEE_MAXMIN))]
+the first operand is a register and only the second one is register/memory.
+Now, the *minmax<mode>3_3 define_insn_and_split does
+   rtx tmp = force_reg (<MODE>mode, operands[3]);
+   rtvec v = gen_rtvec (2, tmp, operands[2]);
+   operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
+where operands[3] is the const0_operand, so operands[2] can there be
+a memory, but in the *minmax<mode>3_4 case
+   rtx tmp = force_reg (<MODE>mode, operands[3]);
+   rtvec v = gen_rtvec (2, operands[2], tmp);
+   operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
+operands[2] goes into the operand which must be a REG, so it
+is incorrect to split it into something that won't work.
+Now, I've tried both disabling the define_insn_and_split and
+the following patch, the former to the latter results in
+        movaps  a, %xmm0
+        pxor    %xmm1, %xmm1
+-       cmpltps %xmm0, %xmm1
+-       andps   %xmm1, %xmm0
++       maxps   %xmm1, %xmm0
+        movaps  %xmm0, a
+        ret
+on the testcase, so I think it is better to match it and force_reg
+(it is a pre-reload splitter) than change "nonimmediate_operand"
+to "register_operand" because it won't match in that case.
+
+2026-05-15  Jakub Jelinek  <jakub@redhat.com>
+
+	PR target/125308
+	* config/i386/sse.md (*minmax<mode>3_4): Force also
+	operands[2] into a REG.
+
+	* gcc.target/i386/pr125308.c: New test.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=c96589414eeb0e46d9fe9cc1d562e048230b5f67]
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+
+---
+ gcc/config/i386/sse.md                   |  2 +-
+ gcc/testsuite/gcc.target/i386/pr125308.c | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/i386/pr125308.c
+
+diff --git a/gcc/config/i386/sse.md b/gcc/config/i386/sse.md
+index 51d1e9b455a0..de092f4b9ae1 100644
+--- a/gcc/config/i386/sse.md
++++ b/gcc/config/i386/sse.md
+@@ -3468,7 +3468,7 @@
+      u = UNSPEC_IEEE_MAX;
+ 
+    rtx tmp = force_reg (<MODE>mode, operands[3]);
+-   rtvec v = gen_rtvec (2, operands[2], tmp);
++   rtvec v = gen_rtvec (2, force_reg (<MODE>mode, operands[2]), tmp);
+    operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
+  })
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/pr125308.c b/gcc/testsuite/gcc.target/i386/pr125308.c
+new file mode 100644
+index 000000000000..0a4dd7c8ea6f
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/i386/pr125308.c
+@@ -0,0 +1,12 @@
++/* PR target/125308 */
++/* { dg-do compile } */
++/* { dg-options "-msse2 -O2 -ffloat-store" } */
++
++float a[4];
++
++void
++foo ()
++{
++  for (int i = 0; i < 4; i++)
++    a[i] = a[i] > 0 ? a[i] : 0;
++}
+-- 
+2.43.7
+
-- 
2.49.0


