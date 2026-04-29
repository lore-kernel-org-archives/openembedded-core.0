Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27B4FF8873
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 06:16:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5392.1777443356722910237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 23:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dxrZ0mgD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9579970def=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T4hm0F3687161
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 23:15:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=AP6XhXlXF4Y0L0oA66zLnts1PpGu/yMdUesxzty3NGQ=; b=dxrZ0mgDwovr
	eYKbgeTcjvHNbuuJ5C2q/h7DLtXYCnRdTop6esnxwRfaybkPSbXMOl36owCkrpDx
	cpnjwIT5+NWygkc9HoGFgodUxxczoMtUieMCmIS/u2/hiJi+Bm93LMp0ZnaoVqio
	sMe6iRpuiMu83pfQU53iE/3lwH4X1xMrJjRRt7ouz/Dr8onY1QcNBA4uVe07Ptvl
	4Xhu4H7D6Q2OXpShcoR3r+FqQlrpbP8amkN6t3cmLcyw7f4LmeNQVdE2M1N9NnEJ
	tf18S2NWUI202zlWMWsR4hLQAskZ5ipxxuasizgPtxR1v2mWsdlNFzQbD8uyhzqI
	tCCxtjl7+A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drrw2vaqr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 23:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hny++jGgIFo4hrN/oiVX/1Naqjv46f1aLBxlpR1jCrO89QJMMtYC3v90ZAXauStSw01uGUQNKkgSeTkAkKIYnbatcyVetamk41FdGlM/kfBdurKYQhUokvgH0kvQmVnWou7Af1S31gGM3f++ahsWV9S6EgoqkodbrcMuV2//WJ/k+PTsHyttGda/XubtTk7AkecKIibqFjviSQnLQmYOqiB4yYrsnx7LZQMBLG4ikDu+7b68/qvM8Gn559NPu6PSNhaNlc6eQO4oGG3b9d9tMVjCCgc049fCRDyLaXdqbGOvx1fh2SXXErzpsBaXX0y+wb+KNhAdd/OJA+BgyBisLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AP6XhXlXF4Y0L0oA66zLnts1PpGu/yMdUesxzty3NGQ=;
 b=cltTrAfKfqwgdmAlRcg4fq+xXfn2hrCXmYDD42wK7jm/NBNnS+6xFMkIakWwabj3LY737Q+pmkTYtTv7GowKDK1thfgjw5olLrMvFl4h6xpITBIWB8DAdDH73GjbhRpX2BXRK4KgB1f6wP+BFYWHVh+fYxsC2w2v3zNr/JxWZF04UU51wBy2Xp05XIuezdazhK6YiDH0rA5e6TnmiFUuO4RCT5pW8xsfUCBr684ZMooGnRhmv5Y3ZcPDPr1M+1c3rA/BXWsMbMPKzpmLjDDj1x8Rp46mWUQuq+vqbIpC23b/gjxccw8uygu+j0QuqZVe5a8X3TCHIQUPOry8sq0l6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 06:15:51 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 06:15:51 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 2/4] libsoup: fix CVE-2025-32049
Date: Wed, 29 Apr 2026 14:15:31 +0800
Message-Id: <20260429061533.858115-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429061533.858115-1-changqing.li@windriver.com>
References: <20260429061533.858115-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:196::13) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5bfa31-14d5-487e-05e0-08dea5b6c30e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	E+344I3XCm0uw0ITbWAnK4zk9oFgiWGi8Q2MlaFMnkA/Tx4wDYBRJLsSBoOp9w3NxWoa7YcAFuygr2hjDBHt5r8axUbg1n2XZP9OVR38sya1p9KDxdmoa/I7sgKn9lKmXHL18ubEQqGiqD9+6tF8GrLr1Kp0Capv9biX4FUsiR1XJPe5BhN2801/gKGTWzOOFB86RTELFOkFsaHDb5Tl6WMPSkMfRd1MY5k7Bwe1GzLkZC0tTbJyAaSWbezP4tu+gP/uMpUO6MhPl6dm3JuKBoYL4B4jbiOg5O0KUKVA6PRYtYd3/SAPg4XIb4jNdIti2ahre1d13nKsWNlAOSll7P45OoHvudecY1WZqhoKl28OS6oWx0xWAyjWpKyKghbD9VOwik5hv6o0z+p/4N8D+RHzR2h82W07l4t4yCXYvGEXa71ffdjFBo+Iw77zeo4xKcrF7DrURSKii2DYaQjxK+HBe7MeIjG5sQrFUzer+jJ4MN8iffkSeiNl2Y9hnWb2zXKqgYCQtfBJpE+48f+O8JWK51OIQWxIG9DQTOmWWUTpnhaR8+cAgy5+K1Bkt3QkocDeW/03Cp4tXllYe4mm3om+5e0RfKUqAPa88rMP6pcjp7liMGQcTmXi89SA2A296bPsilvYyRMI+LwIF297Ihc9tr1PWXw0eIqRzgKxIaBG+CuGTg48bxwB2qmFsxwRWDTTm6DPWvXCW2t0aBsRUEbUYnE1lpXGiLSGwnGl/voWWWYPQfyybz9SWWW553Nz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WRaK+jZYZ52jnR3VoFJC/ov3t/FeExWmbsyJMt/cYvaMdX3SoKdWqGNoT83x?=
 =?us-ascii?Q?Nes94PcbXtFFf/Vs40Qa4QX6/v+Wt2Qm1dM9MPceMDDvHY1W7CpJmN7mFAPR?=
 =?us-ascii?Q?bFbsvutzSKr7ivzpY6ryFZgITiN7jLhsBs+rDFLEt/9/1gEM4+YjL8py8zQn?=
 =?us-ascii?Q?YCDiy0D6oWdC1FnUgoSFCESCrWWSh7M6YHOHPzDZsDcmoUNLz/6UeVrPXgOa?=
 =?us-ascii?Q?W9oK2oQs7xGmnx+3ZLP62VM9bd8rql37ZoMFZ3HNy6SmSUc0BVvXvWQJiMBV?=
 =?us-ascii?Q?chKxoQyeToZVJUz8S1Klh2mBQywwLZqdn0dBMusV8s7KPB/mZElzRgi0SzQG?=
 =?us-ascii?Q?GPZfugI7pND9MEIs9XPELUoYS6I/HF0B0CectYlm8NBtk783CYuklB2G16go?=
 =?us-ascii?Q?Pg1sx8hGDYMnX8yVjVNS8xbCFDmXhgX9Ycq69YTN26Tclih6TOoLThWgsfLE?=
 =?us-ascii?Q?ZJod0YOgqxU6XJQwpHay9Vu85XXV4ciBCbAfCbRQhEfX5A1uMzPGxNssyOA9?=
 =?us-ascii?Q?MsFtnvhQkNcsvHvfvYKECJcAKge20pU4soCjFQqN7Oq4XB6OqlSolhTtNuc/?=
 =?us-ascii?Q?03OnB19Yq2RdT3xmJnvqyFig1RJRaezYTpYfuy7sudKsD5sylSLahCM6mHHw?=
 =?us-ascii?Q?u0QS1Uu1//yVqa2iJ4nZFih25dFIw6oq+2pw/FnawoUfkUaAQqOsHtTGtlD/?=
 =?us-ascii?Q?AhZsiRjgjE+LUhfTaaWrZ3P2qB4IN0YrzMqeoyTAv9rr6I3q5TFmTpBu1UtM?=
 =?us-ascii?Q?p+k7cjtc3dHv97nmZIFaR3SUw7Bx5aYxalqSurTCeWPFxvKY3wT2+j8HFc8w?=
 =?us-ascii?Q?pPzGaxfjiCUlMjvafM+Oc506i6UV4bfN7+VVinDQCPmEvKmEt/EBfvlDujMC?=
 =?us-ascii?Q?OA6H7RBQFi1GlLb6bD/L30cWp83SsA97XcychH2qZkc5oFW7n4Pek+p2jn6N?=
 =?us-ascii?Q?IGXb/CQWoIdhrS0pTvaWKXn6+nWSBaOfjBG/rsekf1YFUiHheOLSqUvRe6GW?=
 =?us-ascii?Q?snATTSGPTVuWxJonUTYduUgtm7SNPtkzdkEFapYxp67vzILV+WnCjBfzd9Ds?=
 =?us-ascii?Q?TuUl+x+edaFJv2Ie02QinBx/cE1UkHAqvbR+7zXpGJPPgeHFC+XTDNuQDrOY?=
 =?us-ascii?Q?tHpmT6qPd+8hdS69Faa5mmLwO9Ge/hNJUpbqYZYF7ZOiN98mU5WO+pB3z6JF?=
 =?us-ascii?Q?L3mASwFcJuAcHlfrUvnOzMdv5dQTMLweCVScrYwKqUSAuXCoJu3hhnuy+b0+?=
 =?us-ascii?Q?6XiGd2cip36vSaCTUFpo9A9x2xqGmpSicyxlqjpXDhtvzFXHlM8iybYf3EeW?=
 =?us-ascii?Q?tolczCxC+Os+OGERnGnYhzcTrcoiUdJf3ZJD05ay4sBpXbTBhyElvU9RQcdr?=
 =?us-ascii?Q?CnX8VFf+nMQ47wSGEXJh86AyeaTNFZmGGRsjYlMiNwX7D6W8Tfl0sdcyLlK4?=
 =?us-ascii?Q?eZjJwPpKbV+5SEOV91IRUWChiN77aqu9RezaFALI31rOHuKekDrO45xUdwtl?=
 =?us-ascii?Q?sqe/HbzlmH7VjIrqxuU84aCK21/n4Dwe3ZcKzFaDArz1Uap0MpIiHzrQRh1b?=
 =?us-ascii?Q?53PkyAxoUlNyE7U0Ae1h5p/SLbCTc8E+dUc4vOSNnRF3WNXqAHRQfZFcWsqn?=
 =?us-ascii?Q?GnNkHJIO2/UonKrGtrfHJpwmotFpVt6MuZsJorC5JxE9VsuVbWXMYL/M7VIM?=
 =?us-ascii?Q?66ft8ibmSpSkz6zhaFjiJThmd6VmRzMaEtOZ9ENPd5tlhju5Ni53vdFVd5O+?=
 =?us-ascii?Q?VQ2ltzS84nXEIM46aUMKIuSnsydkqwE=3D?=
X-Exchange-RoutingPolicyChecked: 
	VPBfqa9KeOlvEKc9YFYlK/3W/p+YaA64GFc5nF1VeccUtzK9Y05pi1SwHf4LeyXQ+edFgnjXUQMf6nYL40yjA3ZtJKzNe0/0fYzLeXx+SPjXOFEV1hhXuZptbyb2hUegEi3W2GznD+w/mQRR5t7W7nU1x0PUuN+KhIqDxV5SIdppjSzSeIsS8koE0E0xLvbmhQ+3V1rGo2J+T/tlmObcm7TOMDAWaHBJ+vlmuy9o1yh7N7ueTW5Gpd4wCJrmpj7fs9exHKE3S9b1cz4OBMsw17Xssgiqu/nkQPHaC8vSE7/eiKfvE3Gi2ltbgJI3fHxvwHgb7GuDIK3aQJi2w5QprA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5bfa31-14d5-487e-05e0-08dea5b6c30e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:15:51.1768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOKquozjAWoD3uhVbN/wuQrpPN8sGofnSyifLWd1OC+/xlLfKOs4y1PFD96C30LhqlRHIpXo7cljfEp5iqGQFNscsskNmkAXk39qds+loGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-Proofpoint-GUID: 2oGgXUhnJVgKXr9DwXzx_tuCZOQqpcwN
X-Proofpoint-ORIG-GUID: 2oGgXUhnJVgKXr9DwXzx_tuCZOQqpcwN
X-Authority-Analysis: v=2.4 cv=Pu+jqQM3 c=1 sm=1 tr=0 ts=69f1a21c cx=c_pps
 a=+9lCAQqCkh6G/pz+5LnHJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=vggBfdFIAAAA:8 a=20KFwNOVAAAA:8 a=Lez6CERpBNXRBGNPCzgA:9
 a=cnOIiujR4QmY3nRb:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA1OCBTYWx0ZWRfX2TIMOm4X/czx
 PybbEf2mu4e7a863g3t6WXy7tpmM5qDf6BEi+mzeR+eVkSuakwOX5AETgi5G7LiTwCQCXQwDTn8
 VkhumsBL9wVlYuXbyyr+FPATVPG2KwLCSvy2L6PQIIAxsaVAH2D4YqBs1QfX5gWucRzcMKsoMZB
 OpLKegMXIZGaz3G80gNOGOltunG7auTHLvcT618m1ffeuB2FbmXdenVUonEHQYddOjC+8J7pCwT
 t9guVmpdFd48fz6mUQ79WVfum+X9dp5XmKPRRhf1cHOBtNvciz03JBvxKlnaickADkR4K8ONeGI
 ODcgYGSRr20QksdglLb5QT0JfSPyUTbYfVznCoZdUQkNXRRYfYZgSnGvyeW+ewFulk455O8FZml
 fdgs9XRYmVONuX1gFN5xdcT4gE1Uob9MKDylw/r/Dd1qU+padBVI3ftpVTAR2s1g7nO8bfRQ7Yw
 EUKb1tJ0jFLlciDv7Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 06:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236078

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/390

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup-3.4.4/CVE-2025-32049-1.patch      | 229 ++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32049-2.patch      |  34 ++
 .../libsoup-3.4.4/CVE-2025-32049-3.patch      | 134 ++++++++
 .../libsoup-3.4.4/CVE-2025-32049-4.patch      | 292 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   4 +
 5 files changed, 693 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
new file mode 100644
index 0000000000..0772c759dc
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
@@ -0,0 +1,229 @@
+From 176cb31003252a69d3fc7908e8f505c0ee006b7a Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 24 Jul 2024 15:20:35 +0200
+Subject: [PATCH 1/4] websocket: add a way to restrict the total message size
+
+Otherwise a client could send small packages smaller than
+total-incoming-payload-size but still to break the server
+with a big allocation
+
+Fixes: #390
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/db87805ab565d67533dfed2cb409dbfd63c7fdce]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/websocket/soup-websocket-connection.c | 107 +++++++++++++++++-
+ libsoup/websocket/soup-websocket-connection.h |   7 ++
+ 2 files changed, 110 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/websocket/soup-websocket-connection.c
+index 5eb8150..19bdd39 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -84,7 +84,7 @@ enum {
+ 	PROP_MAX_INCOMING_PAYLOAD_SIZE,
+ 	PROP_KEEPALIVE_INTERVAL,
+ 	PROP_EXTENSIONS,
+-
++	PROP_MAX_TOTAL_MESSAGE_SIZE,
+         LAST_PROPERTY
+ };
+ 
+@@ -126,6 +126,7 @@ typedef struct {
+ 	char *origin;
+ 	char *protocol;
+ 	guint64 max_incoming_payload_size;
++	guint64 max_total_message_size;
+ 	guint keepalive_interval;
+ 
+ 	gushort peer_close_code;
+@@ -156,6 +157,7 @@ typedef struct {
+ } SoupWebsocketConnectionPrivate;
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -670,8 +672,8 @@ bad_data_error_and_close (SoupWebsocketConnection *self)
+ }
+ 
+ static void
+-too_big_error_and_close (SoupWebsocketConnection *self,
+-                         guint64 payload_len)
++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self,
++                                          guint64 payload_len)
+ {
+         SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
+ 	GError *error;
+@@ -687,6 +689,24 @@ too_big_error_and_close (SoupWebsocketConnection *self,
+ 	emit_error_and_close (self, error, TRUE);
+ }
+ 
++static void
++too_big_message_error_and_close (SoupWebsocketConnection *self,
++                                 guint64 len)
++{
++	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
++	GError *error;
++
++	error = g_error_new_literal (SOUP_WEBSOCKET_ERROR,
++				     SOUP_WEBSOCKET_CLOSE_TOO_BIG,
++				     priv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ?
++				     "Received WebSocket payload from the client larger than configured max-total-message-size" :
++				     "Received WebSocket payload from the server larger than configured max-total-message-size");
++	g_debug ("%s received message of size %" G_GUINT64_FORMAT " or greater, but max supported size is %" G_GUINT64_FORMAT,
++	         priv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ? "server" : "client",
++	         len, priv->max_total_message_size);
++	emit_error_and_close (self, error, TRUE);
++}
++
+ static void
+ close_connection (SoupWebsocketConnection *self,
+                   gushort                  code,
+@@ -918,6 +938,12 @@ process_contents (SoupWebsocketConnection *self,
+ 		switch (priv->message_opcode) {
+ 		case 0x01:
+ 		case 0x02:
++			/* Safety valve */
++			if (priv->max_total_message_size > 0 &&
++			    (priv->message_data->len + payload_len) > priv->max_total_message_size) {
++				too_big_message_error_and_close (self, (priv->message_data->len + payload_len));
++				return;
++			}
+ 			g_byte_array_append (priv->message_data, payload, payload_len);
+ 			break;
+ 		default:
+@@ -1056,7 +1082,7 @@ process_frame (SoupWebsocketConnection *self)
+ 	/* Safety valve */
+ 	if (priv->max_incoming_payload_size > 0 &&
+ 	    payload_len > priv->max_incoming_payload_size) {
+-		too_big_error_and_close (self, payload_len);
++		too_big_incoming_payload_error_and_close (self, payload_len);
+ 		return FALSE;
+ 	}
+ 
+@@ -1363,6 +1389,10 @@ soup_websocket_connection_get_property (GObject *object,
+ 		g_value_set_pointer (value, priv->extensions);
+ 		break;
+ 
++        case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		g_value_set_uint64 (value, priv->max_total_message_size);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1416,6 +1446,10 @@ soup_websocket_connection_set_property (GObject *object,
+ 		priv->extensions = g_value_get_pointer (value);
+ 		break;
+ 
++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		priv->max_total_message_size = g_value_get_uint64 (value);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1628,6 +1662,26 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+                                       G_PARAM_CONSTRUCT_ONLY |
+                                       G_PARAM_STATIC_STRINGS);
+ 
++	/**
++	 * SoupWebsocketConnection:max-total-message-size:
++	 *
++	 * The total message size for incoming packets.
++	 *
++	 * The protocol expects or 0 to not limit it.
++	 *
++	 * Since: 3.8
++	 */
++        properties[PROP_MAX_TOTAL_MESSAGE_SIZE] =
++                g_param_spec_uint64 ("max-total-message-size",
++                                     "Max total message size",
++                                     "Max total message size ",
++                                     0,
++                                     G_MAXUINT64,
++                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++                                     G_PARAM_READWRITE |
++                                     G_PARAM_CONSTRUCT |
++                                     G_PARAM_STATIC_STRINGS);
++
+         g_object_class_install_properties (gobject_class, LAST_PROPERTY, properties);
+ 
+ 	/**
+@@ -2111,6 +2165,51 @@ soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection
+ 	}
+ }
+ 
++/**
++ * soup_websocket_connection_get_max_total_message_size:
++ * @self: the WebSocket
++ *
++ * Gets the maximum total message size allowed for packets.
++ *
++ * Returns: the maximum total message size.
++ *
++ * Since: 3.8
++ */
++guint64
++soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *self)
++{
++	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
++
++	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++
++	return priv->max_total_message_size;
++}
++
++/**
++ * soup_websocket_connection_set_max_total_message_size:
++ * @self: the WebSocket
++ * @max_total_message_size: the maximum total message size
++ *
++ * Sets the maximum total message size allowed for packets.
++ *
++ * It does not limit the outgoing packet size.
++ *
++ * Since: 3.8
++ */
++void
++soup_websocket_connection_set_max_total_message_size (SoupWebsocketConnection *self,
++                                                      guint64                  max_total_message_size)
++{
++	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
++
++	g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
++
++	if (priv->max_total_message_size != max_total_message_size) {
++		priv->max_total_message_size = max_total_message_size;
++		g_object_notify_by_pspec (G_OBJECT (self), properties[PROP_MAX_TOTAL_MESSAGE_SIZE]);
++	}
++}
++
+ /**
+  * soup_websocket_connection_get_keepalive_interval:
+  * @self: the WebSocket
+diff --git a/libsoup/websocket/soup-websocket-connection.h b/libsoup/websocket/soup-websocket-connection.h
+index eeb093d..922de56 100644
+--- a/libsoup/websocket/soup-websocket-connection.h
++++ b/libsoup/websocket/soup-websocket-connection.h
+@@ -88,6 +88,13 @@ SOUP_AVAILABLE_IN_ALL
+ void                soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection *self,
+                                                                              guint64                  max_incoming_payload_size);
+ 
++SOUP_AVAILABLE_IN_3_0
++guint64             soup_websocket_connection_get_max_total_message_size    (SoupWebsocketConnection *self);
++
++SOUP_AVAILABLE_IN_3_0
++void                soup_websocket_connection_set_max_total_message_size    (SoupWebsocketConnection *self,
++                                                                             guint64                  max_total_message_size);
++
+ SOUP_AVAILABLE_IN_ALL
+ guint               soup_websocket_connection_get_keepalive_interval (SoupWebsocketConnection *self);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
new file mode 100644
index 0000000000..6f00fabfdb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
@@ -0,0 +1,34 @@
+From 81eb7cf7422878f0b78b833a3b741f734502921f Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Fri, 20 Sep 2024 12:12:38 +0200
+Subject: [PATCH 2/4] websocket-test: set the total message size
+
+This is required when sending a big amount of data
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/4904a46a2d9a014efa6be01a186ac353dbf5047b]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index a0b8334..827b041 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -567,6 +567,11 @@ test_send_big_packets (Test *test,
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->server, 1000 * 1000 + 1);
+ 	g_assert (soup_websocket_connection_get_max_incoming_payload_size (test->server) == (1000 * 1000 + 1));
+ 
++	soup_websocket_connection_set_max_total_message_size (test->client, 1000 * 1000 + 1);
++	g_assert (soup_websocket_connection_get_max_total_message_size (test->client) == (1000 * 1000 + 1));
++	soup_websocket_connection_set_max_total_message_size (test->server, 1000 * 1000 + 1);
++	g_assert (soup_websocket_connection_get_max_total_message_size (test->server) == (1000 * 1000 + 1));
++
+ 	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+ 	WAIT_UNTIL (received != NULL);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
new file mode 100644
index 0000000000..29fb0d7ddb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
@@ -0,0 +1,134 @@
+From 25616e1a958bc1503cc24d6845a6e80ffc287727 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 8 May 2025 16:16:25 -0500
+Subject: [PATCH] Set message size limit in SoupServer rather than
+ SoupWebsocketConnection
+
+We're not sure about the compatibility implications of having a default
+size limit for clients.
+
+Also not sure whether the server limit is actually set appropriately,
+but there is probably very little server usage of
+SoupWebsocketConnection in the wild, so it's not so likely to break
+things.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/server/soup-server.c                  | 24 +++++++++++++----
+ libsoup/websocket/soup-websocket-connection.c | 26 +++++++++++++------
+ 2 files changed, 37 insertions(+), 13 deletions(-)
+
+diff --git a/libsoup/server/soup-server.c b/libsoup/server/soup-server.c
+index 6b486f5..c779f7d 100644
+--- a/libsoup/server/soup-server.c
++++ b/libsoup/server/soup-server.c
+@@ -186,6 +186,16 @@ static GParamSpec *properties[LAST_PROPERTY] = { NULL, };
+ 
+ G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
+ 
++/* SoupWebsocketConnection by default limits only maximum packet size. But a
++ * message may consist of multiple packets, so SoupServer additionally restricts
++ * total message size to mitigate denial of service attacks on the server.
++ * SoupWebsocketConnection does not do this by default because I don't know
++ * whether that would or would not cause compatibility problems for websites.
++ *
++ * This size is in bytes and it is arbitrary.
++ */
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
++
+ static void request_finished (SoupServerMessage      *msg,
+                               SoupMessageIOCompletion completion,
+                               SoupServer             *server);
+@@ -937,11 +947,15 @@ complete_websocket_upgrade (SoupServer        *server,
+ 
+ 	g_object_ref (msg);
+ 	stream = soup_server_message_steal_connection (msg);
+-	conn = soup_websocket_connection_new (stream, uri,
+-					      SOUP_WEBSOCKET_CONNECTION_SERVER,
+-					      soup_message_headers_get_one_common (soup_server_message_get_request_headers (msg), SOUP_HEADER_ORIGIN),
+-					      soup_message_headers_get_one_common (soup_server_message_get_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),
+-					      handler->websocket_extensions);
++	conn = SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCKET_CONNECTION,
++					  "io-stream", stream,
++					  "uri", uri,
++					  "connection-type", SOUP_WEBSOCKET_CONNECTION_SERVER,
++					  "origin", soup_message_headers_get_one_common (soup_server_message_get_request_headers (msg), SOUP_HEADER_ORIGIN),
++					  "protocol", soup_message_headers_get_one_common (soup_server_message_get_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),
++					  "extensions", handler->websocket_extensions,
++					  "max-total-message-size", (guint64)MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++					  NULL));
+ 	handler->websocket_extensions = NULL;
+ 	g_object_unref (stream);
+ 
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/websocket/soup-websocket-connection.c
+index 26476df..cbb1b72 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -149,7 +149,6 @@ typedef struct {
+ } SoupWebsocketConnectionPrivate;
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
+-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -1612,9 +1611,10 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-incoming-payload-size:
+ 	 *
+-	 * The maximum payload size for incoming packets.
+-	 *
+-	 * The protocol expects or 0 to not limit it.
++     * The maximum payload size for incoming packets, or 0 to not limit it.
++     *
++     * Each message may consist of multiple packets, so also refer to
++     * [property@WebSocketConnection:max-total-message-size].
+ 	 */
+         properties[PROP_MAX_INCOMING_PAYLOAD_SIZE] =
+                 g_param_spec_uint64 ("max-incoming-payload-size",
+@@ -1662,9 +1662,19 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-total-message-size:
+ 	 *
+-	 * The total message size for incoming packets.
++	 * The maximum size for incoming messages.
++	 *
++	 * Set to a value to limit the total message size, or 0 to not
++	 * limit it.
++	 *
++	 * [method@Server.add_websocket_handler] will set this to a nonzero
++	 * default value to mitigate denial of service attacks. Clients must
++	 * choose their own default if they need to mitigate denial of service
++	 * attacks. You also need to set your own default if creating your own
++	 * server SoupWebsocketConnection without using SoupServer.
+ 	 *
+-	 * The protocol expects or 0 to not limit it.
++	 * Each message may consist of multiple packets, so also refer to
++	 * [property@WebSocketConnection:max-incoming-payload-size].
+ 	 *
+ 	 * Since: 3.8
+ 	 */
+@@ -1674,7 +1684,7 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+                                      "Max total message size ",
+                                      0,
+                                      G_MAXUINT64,
+-                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++                                     0,
+                                      G_PARAM_READWRITE |
+                                      G_PARAM_CONSTRUCT |
+                                      G_PARAM_STATIC_STRINGS);
+@@ -2164,7 +2174,7 @@ soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *s
+ {
+ 	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
+ 
+-	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
+ 
+ 	return priv->max_total_message_size;
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch
new file mode 100644
index 0000000000..6f391e98e2
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch
@@ -0,0 +1,292 @@
+From 3c87790a4ba141125e6ba165c478f0440e8e693e Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Fri, 16 May 2025 16:55:40 -0500
+Subject: [PATCH 4/4] Add tests for max-incoming-packet-size and
+ max-total-message-size
+
+An even better test would verify that it's possible to send big messages
+containing small packets, but libsoup doesn't offer control over packet
+size, and I don't want to take the time to learn how WebSockets work to
+figure out how to do that manually. Instead, I just check that both
+limits work, for both client and server.
+
+I didn't add deflate variants of these tests because I doubt that would
+add valuable coverage.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/4d00b45b7eebdcfa0706b58e34c40b8a0a16015b]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 214 +++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 197 insertions(+), 17 deletions(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 827b041..ec1324c 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -543,16 +543,9 @@ test_send_big_packets (Test *test,
+ {
+ 	GBytes *sent = NULL;
+ 	GBytes *received = NULL;
++	gulong signal_id;
+ 
+-	g_signal_connect (test->client, "message", G_CALLBACK (on_text_message), &received);
+-
+-	sent = g_bytes_new_take (g_strnfill (400, '!'), 400);
+-	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+-	WAIT_UNTIL (received != NULL);
+-	g_assert (g_bytes_equal (sent, received));
+-	g_bytes_unref (sent);
+-	g_bytes_unref (received);
+-	received = NULL;
++	signal_id = g_signal_connect (test->client, "message", G_CALLBACK (on_text_message), &received);
+ 
+ 	sent = g_bytes_new_take (g_strnfill (100 * 1000, '?'), 100 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+@@ -563,23 +556,174 @@ test_send_big_packets (Test *test,
+ 	received = NULL;
+ 
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->client, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_incoming_payload_size (test->client) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 1000 * 1000 + 1);
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->server, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_incoming_payload_size (test->server) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 1000 * 1000 + 1);
+ 
+ 	soup_websocket_connection_set_max_total_message_size (test->client, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_total_message_size (test->client) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 1000 * 1000 + 1);
+ 	soup_websocket_connection_set_max_total_message_size (test->server, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_total_message_size (test->server) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 1000 * 1000 + 1);
+ 
+ 	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+ 	WAIT_UNTIL (received != NULL);
+ 	g_assert (g_bytes_equal (sent, received));
++	g_bytes_unref (received);
++	received = NULL;
++
++	/* Reverse the test and send the big message to the server. */
++	g_signal_handler_disconnect (test->client, signal_id);
++	g_signal_connect (test->server, "message", G_CALLBACK (on_text_message), &received);
++
++	soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++	WAIT_UNTIL (received != NULL);
++	g_assert_true (g_bytes_equal (sent, received));
+ 	g_bytes_unref (sent);
+ 	g_bytes_unref (received);
+ }
+ 
++static void
++test_send_big_packets_direct (Test *test,
++                              gconstpointer data)
++{
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 0);
++
++   test_send_big_packets (test, data);
++}
++
++static void
++test_send_big_packets_soup (Test *test,
++                            gconstpointer data)
++{
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++   /* Max total message size defaults to 0 (unlimited), but SoupServer applies its own limit by default. */
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 128 * 1024);
++
++   test_send_big_packets (test, data);
++}
++
++static void
++test_send_exceeding_client_max_payload_size (Test *test,
++                                             gconstpointer data)
++{
++   GBytes *sent = NULL;
++   GBytes *received = NULL;
++   gboolean close_event = FALSE;
++   GError *error = NULL;
++
++   g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy), &error);
++   g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++
++   soup_websocket_connection_set_max_incoming_payload_size (test->server, 0);
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 0);
++
++   /* The message to the client is dropped due to the client's limit. */
++   sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++   soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
++   g_bytes_unref (sent);
++   WAIT_UNTIL (close_event);
++   g_assert_null (received);
++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++   g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_server_max_payload_size (Test *test,
++                                             gconstpointer data)
++{
++   GBytes *sent = NULL;
++   GBytes *received = NULL;
++   gboolean close_event = FALSE;
++   GError *error = NULL;
++
++   g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++   g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++   soup_websocket_connection_set_max_incoming_payload_size (test->client, 0);
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 0);
++
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++
++   /* The message to the server is dropped due to the server's limit. */
++   sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++   soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++   g_bytes_unref (sent);
++   WAIT_UNTIL (close_event);
++   g_assert_null (received);
++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++   g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_client_max_message_size (Test *test,
++                                             gconstpointer data)
++{
++   GBytes *sent = NULL;
++   GBytes *received = NULL;
++   gboolean close_event = FALSE;
++   GError *error = NULL;
++
++   g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy), &error);
++   g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++   soup_websocket_connection_set_max_total_message_size (test->client, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 128 * 1024);
++
++   soup_websocket_connection_set_max_total_message_size (test->server, 0);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 0);
++
++   /* The message to the client is dropped due to the client's limit. */
++   sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++   soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
++   g_bytes_unref (sent);
++   WAIT_UNTIL (close_event);
++   g_assert_null (received);
++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++   g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_server_max_message_size (Test *test,
++                                             gconstpointer data)
++{
++   GBytes *sent = NULL;
++   GBytes *received = NULL;
++   gboolean close_event = FALSE;
++   GError *error = NULL;
++
++   g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++   g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++   soup_websocket_connection_set_max_total_message_size (test->client, 0);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++   /* Set the server message total message size manually, because its
++    * default is different for direct connection vs. soup connection.
++    */
++   soup_websocket_connection_set_max_total_message_size (test->server, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 128 * 1024);
++
++   /* The message to the server is dropped due to the server's limit. */
++   sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++   soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++   g_bytes_unref (sent);
++   WAIT_UNTIL (close_event);
++   g_assert_null (received);
++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++   g_assert_no_error (test->client_error);
++}
++
++
+ static void
+ test_send_empty_packets (Test *test,
+ 			 gconstpointer data)
+@@ -2064,11 +2208,47 @@ main (int argc,
+ 
+ 	g_test_add ("/websocket/direct/send-big-packets", Test, NULL,
+ 		    setup_direct_connection,
+-		    test_send_big_packets,
++		    test_send_big_packets_direct,
+ 		    teardown_direct_connection);
+ 	g_test_add ("/websocket/soup/send-big-packets", Test, NULL,
+ 		    setup_soup_connection,
+-		    test_send_big_packets,
++		    test_send_big_packets_soup,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-client-max-payload-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_client_max_payload_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-client-max-payload-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_client_max_payload_size,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-server-max-payload-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_server_max_payload_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-server-max-payload-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_server_max_payload_size,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-client-max-message-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_client_max_message_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-client-max-message-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_client_max_message_size,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-server-max-message-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_server_max_message_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-server-max-message-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_server_max_message_size,
+ 		    teardown_soup_connection);
+ 
+ 	g_test_add ("/websocket/direct/send-empty-packets", Test, NULL,
+@@ -2217,11 +2397,11 @@ main (int argc,
+ 
+ 	g_test_add ("/websocket/direct/deflate-send-big-packets", Test, NULL,
+ 		    setup_direct_connection_with_extensions,
+-		    test_send_big_packets,
++		    test_send_big_packets_direct,
+ 		    teardown_direct_connection);
+ 	g_test_add ("/websocket/soup/deflate-send-big-packets", Test, NULL,
+ 		    setup_soup_connection_with_extensions,
+-		    test_send_big_packets,
++		    test_send_big_packets_soup,
+ 		    teardown_soup_connection);
+ 
+ 	g_test_add ("/websocket/direct/deflate-send-empty-packets", Test, NULL,
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 6be31806f1..fc4a286dcf 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -47,6 +47,10 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4945.patch \
            file://CVE-2025-12105.patch \
            file://CVE-2025-14523.patch \
+           file://CVE-2025-32049-1.patch \
+           file://CVE-2025-32049-2.patch \
+           file://CVE-2025-32049-3.patch \
+           file://CVE-2025-32049-4.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


