Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91216CD6E5D
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 03:09:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12170.1780456141696870900
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 20:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UpyjQS8O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0614d64c3e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6532042W3174440
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jun 2026 03:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=4D0zUuCH1V+UP4/7Z1rs
	0htz2SN8ov8A9A1JFj3nIUM=; b=UpyjQS8OtIrW5S0DxyfUg4wPv6RE90urEbQI
	TZhPs7bi1e7k02/JMC4X8hi4yyYIvM2MWzAQ97Gd6m6+23LydDG/AMRGrJTawFIQ
	em2m0VGRy0vw35LR1zUpZUJzjP9UjJUOgyGBKtKLwb3cK/BUF6jlZcui/3cZUY6C
	gR5CnjPRIbvT9km3Fhd0aDjYqfoaFmoYrbYWKt2el4h8NXRy3Ix/BRvuBzfb9J0n
	tLKBZhoVluLsIj6AGJQEFH0K1G2sRitMQezKnIVAJr6b90rYZT+4GPm9Au+uWMAg
	0BKjEfHokMTixHhkp4q7JaBEY0eTorX26FvRLV5YFe/by+73KQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013070.outbound.protection.outlook.com [40.93.201.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efn4063r9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 03:09:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Udqjf2W/uAb28OLb3eHiOV7YChnt6ygvTIkiEOQMOmm0l840Rn4Gcfdc021iGFW/cVccydE8HIYnc/9pChzpXKaRHZPqfDX3ZKd43UdPplun8CUNxo1Xt9aikG0wHV/xs8scGiVs9tY07ukpT7M2M6JYvJtW7oledWuLXvQxVp/H8nhD5EPIXd2MAddVgBvHSBmQNMWICH1Idf7bi+s5hTM4CxPo0cyyhR0p8TrrDkTlmRiB3quvj7Wv5U0xs/SaTULzN5PceWEIPsIbAMVIHCSyDz2A0cpyrRAQZmaPS70Ak5tf4KYzzOghZRwFiDgQRPKYY5GNfMPgxfgGqS/q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4D0zUuCH1V+UP4/7Z1rs0htz2SN8ov8A9A1JFj3nIUM=;
 b=GjodGku2+B63B/h5yCdJ5wJ0u4fOEDzGF9u8JHDQ5irZDe6r1F/VlHliwjzN1+WnAUo6yUvSK7+GFGUoow9cXr6PepW/Rfw6un9uzmfh5twWP4VC9yXPuV9651d4iUB3AIWsVX3W3bFYwMifbs5WF4wsEB9uOYpXPhdP8IbHazfd7kDySL9J2oOUxVhZw8qI04XqeaEG1cD8k1ve+8paWQ1xIZ19VnBWWdI7O22S47PZm54cM+zb/o5rYJqQmOuiGUuoGsL6+pwEfvwQmZ5zYTqmQVgx4VJytlcY8YBmuqDooDoQS0jyJXQu/7h1Fjea+zovMdyFVpA15QMP6UzMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 03:08:57 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 03:08:57 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libxi: upgrade 1.8.2 -> 1.8.3
Date: Wed,  3 Jun 2026 11:08:39 +0800
Message-Id: <20260603030839.3700805-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV3PR11MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 96827b03-0f32-4ff7-7a4f-08dec11d7385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|18002099003|38350700014|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	TWc+is1k+75nrGBzLMKDcTe7WXq/NJNTdVq9b8/O0DG1bmyLGFfI1rU+fwXSx0m86X0Q/okXUZJXrC3bAffxwH/fmwDDVOe3i7M9kgYcPdDePvsBQCR/a3eUNU8iVK+yBJ6nnLhGK2qFsaSV3syfb6B57e3OAXomZJt5OBwxACxU2qWi7kd9BQpW+/sVEr00MjLAAXd7PpusodxT4rJd/PKvpxD91TBq7K9cmWAFjrKNZYCLH7kpZI25ny1J5boAjATfIM3/eGC25hJNSHAkSj+2mp6VU3BRPjKx+lIatlH2sHcaV2eRpHOVicm+A1+u+mf5vKI3Plxm27+zEQbyJoo9t3va9n3mOSzef1RZdWfHsQWY9S5Sv2W0Qknd7o/T2iEFpotXtuktBJMS+ev89+0+O2cv+oV4dHo7SexL6MPG6cJE8Km65ss9VRMq3S1FCjE2Xn6UcjUV/ZMiQZvu+aPrwdX1wvPlnXx7nesjBJtY7vA2xLd5XePJ0sgsx+83jIfZ8d4MicmtEtNDb5grk75jEyfBI99ijV2ZliAXNCkXTqcIdtZ/c82j/Cza+EtkYIPogGUNAcs1+D+qNe0fEXcUEXUCpBnsIg/H+/dALpFpdbSGzBrf8oVpeKySmDuZ3ESnKkyojWD5Kv87A2PTo62cdHVFHuDVWLR8g4euEDgC7OKFXwKhA/G8VEK68kZjSYMcz3t1QAoRjjbGQnPRdEPKpS+BYNLbufssA4UZyGE0R/Js6pfpuOAWV1sFu6Vh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(18002099003)(38350700014)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5cb0iVuBU3sNvKFnL9MwAA+8e063fYdJAlDbe/yNZHKeeb71e2POdt/xjEcd?=
 =?us-ascii?Q?WswFWLihUeEfhgYAGH01uNWxNQ/OIugksI1LmYopk/OjZ5nImfOD+HhdidMN?=
 =?us-ascii?Q?+lJm8YU42pvVehOHmmCpP9/hVZP1R1qCNHoV0o3u/7s4lj0396ZrvPkLTAyt?=
 =?us-ascii?Q?i1+nzE7EZce7Clqjx1mVjuj0gEa5Rw0u5PiiaGCbIGCr7O0UYgM7NafJrDPx?=
 =?us-ascii?Q?mb/DFE0VGSEg1mhA4JBTRtG5JhAo6stz9DvT+s6oQHsHYLiymguXoiz0vTzR?=
 =?us-ascii?Q?2u5wfntNMYiYO6aHYz1sNghFuvcht1hPgssyP5eEjqsnHzTHDOinINrc+Ozh?=
 =?us-ascii?Q?cr8Hoy1jSlPNNy+1ttk8Ipvd85HzXr300MRVrF3eT+pnNdYFvuatVTLzut1u?=
 =?us-ascii?Q?vpqQXYLLSzs7HI0Xs0S6cUmHcgh7IbHmePBvb104iV4Kl3QQ9Xx46LvUl0Eo?=
 =?us-ascii?Q?uzjSp3/E57ATqj4Uec/OKqC+NAHx3V4VAsz4y6TXeFh3f8ShKY9iwMuW3LY7?=
 =?us-ascii?Q?ekSFNh3tVnh81wrMn5FO0goXmpiskOzi9kYXwszF813bEsLwcAKhk5zsb8AT?=
 =?us-ascii?Q?EKR3kVVUoQwiyadOLoFcTNe2ExuXwpFv7Rq2U3NkEOxua31e5+oUO6AVLRnw?=
 =?us-ascii?Q?wQC0mLUmN2cHXNGQJaSnpicbmFi5Q/ttlnZL2naSK2AtdXNbMGyQ82DThCqM?=
 =?us-ascii?Q?vLwr+pPQdUzxNNHE5KB9968PNcwor3RYlcZ1hCWTw7ozUSjW+X9O6VoAE6qy?=
 =?us-ascii?Q?x6I+XocbrgNFwsWSK9J4eyXq37HLMBxrK3MRaIbbwZmVvAIp+BOMyW8xpJx3?=
 =?us-ascii?Q?uXZas/hBZAgLfIRElslB840bUzwMwFyjTqP3PArfupwwxo2q3k1T9lmIAYd4?=
 =?us-ascii?Q?0feEKjChwy6cGiAjiiCyjCtjEAgQipmhGuIqJL2Y49UPw7kWpYYJOmuC36hT?=
 =?us-ascii?Q?hwGtP2YpLEbGDqWoXGCYu7/0tguLMmobc8PD7NAacNEjAGYJpdp/0dAEsmhH?=
 =?us-ascii?Q?Q1oja3uKwRWkiymEi0HeMEXv7UeLti3CC8wHpSoImCKp0zd0kisawKp2p0oU?=
 =?us-ascii?Q?hsYbS/omFWz3E/4iJHX0B1asgsECwUBZ3xFAs2NmUsgJ97fMjzQAMZr1yQzE?=
 =?us-ascii?Q?IbEbEottWPQc5YIo0zFWXCC++G9ZfuJvV/p1evev2N4SK/XCO2ByaKduDeT/?=
 =?us-ascii?Q?fEmK36PZw/FRKTdgf+LKdX4HyFTdaO3eFA6loJKae7Dufp+CFW6miU9HVTr+?=
 =?us-ascii?Q?vczAhK2nJQOvjg2YeR3jT/3618Kh7OPMMWuGlAZljpxE7IINRJFJPHhk7gT1?=
 =?us-ascii?Q?H/zZQd04hFHy1iKSGutmrPoZBy+R34agb5rp/Q2z0JN5ktlBRnAo51/bmmPq?=
 =?us-ascii?Q?OXenV0KVqpGYZTRqTUvBBIzUhAispyLOCsMC8wmLv04qkcVhw/1Grvk9bLg6?=
 =?us-ascii?Q?tfkuZkhAwLKR8Q4rBUKcX5R8IA4jALTlLCSbx8aNaf4SPBXYFmoinP1wbCI1?=
 =?us-ascii?Q?uFu40gPTEarbxXPIL05wmS4w8TUMlIDwLB1sHIivlWJCuznO7/7qI+lbWuhW?=
 =?us-ascii?Q?96H7dXvTXgj82DfEqMY83xjUKtSEDoXNM90KEudb1ARNxt+N8xmj6XzZiLb6?=
 =?us-ascii?Q?emMkWMhbb8qOSGVAMiemjeB90dUOxGI7OS70AUDLm8L93+httgeyaormprLx?=
 =?us-ascii?Q?HfOcF6NE3jAYcHZRmbnkZ5BOfkEC/m4j3VJY8ipf9r774NNx0qbq6FCQ6msV?=
 =?us-ascii?Q?/XZkGj6hHEGTWdfXNEksRyOIfWXLgd8=3D?=
X-Exchange-RoutingPolicyChecked: 
	buboH+L3p6x+pXxl28pqqrHNb8RHSDgSnTbhuz/QN+YykKKJyINZdVvnfYHBUiuTzMuogftpL+1ZW74AwTE9T4uZoGhUA9uX4SV0zA47vnCkN+mOmABlMk5t/cgZSZBW3ErrDFq0SRSsm4yMFTVInDZdzCQ+tGYxz2FupwDH0YbA0CWVJD+rT9C2xjGbDqucrHYoG4L2FST9ATirQ6HWZzsxBU38mahuTks1uEebA8u+gdxnvEf+Br4ipHMr613LeK0Du75xwyqSmEjzLsyrWAPyOUCQS7Ty3QwRCcyRlosvcVxMwIc0sKuq0pQ+ciMr1wqHqK2eifKbKOv4SbHmeA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96827b03-0f32-4ff7-7a4f-08dec11d7385
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 03:08:57.3217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlSTs6aAk6BBgwQHouTj3A7v+nYW+lhzzBEA+XT3dH00zPNWGH787umyRW3mLf+TRyVFzvY2MRNH0S1zp0KlIjJXyC0p7qPTvBWLZLbTKb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8602
X-Proofpoint-ORIG-GUID: JuusLSWpLrWKqaRRZ_aHvDAPDSdK8MVk
X-Proofpoint-GUID: JuusLSWpLrWKqaRRZ_aHvDAPDSdK8MVk
X-Authority-Analysis: v=2.4 cv=GI441ONK c=1 sm=1 tr=0 ts=6a1f9acc cx=c_pps
 a=IOfmNx34m1n4z7i1CuCPOA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=qfmRXU2aEKk_7j70DG4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAyNiBTYWx0ZWRfXw5mu+fB18f0P
 SK4MD5dxXFtqSQpF9ratrRAB/THb7pQUuFkAhNfwB+4oRQxWXY+NqVG26K0JckTWCw2/b1PIrYv
 UVSQZM68dco0ghzg8pi73vQvGLnj1J3bK6liBKbDY5Z1vaJLt387dJz0pYhZ2KBswYktBRGiIlz
 /QN3xWRT8uGGUz5QEhVRp/8ub3Bja4di0ZJ15gOkZE8aa7r0e6qc4ymvNM4Eyi6CGuFzJnpKZLJ
 mH75sdSilOcBHotkf9qrwFkr6N09Mx+9JUWRi3ZhAmeO4wIuni8UVgQCO0nMm2pEblX6cP7JCK+
 w9YokIu6XmkXncuHg3B9XzVzx+bWIxi2pQG9+AgeEpbPQ9W31XfFNiAItx4FHFQtqqQbY1RhtOE
 oEzfiDxbJ+hAfyrqLnr8hkZynQ2uy1120xaRaDtkx23zaRqQJPF4EC7dnLorlhpTd6jQi76OsBo
 STsnL85NGjnkS/AJKyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 03:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238075

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../xorg-lib/{libxi_1.8.2.bb => libxi_1.8.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.8.2.bb => libxi_1.8.3.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
index 2a86f5fcf0..d7e778610e 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
@@ -18,6 +18,6 @@ PE = "1"
 XORG_PN = "libXi"
 XORG_EXT = "tar.xz"
 
-SRC_URI[sha256sum] = "d0e0555e53d6e2114eabfa44226ba162d2708501a25e18d99cfb35c094c6c104"
+SRC_URI[sha256sum] = "7ad60056f01af4f786cfe93b3a7707447711626fc8da2637bec71a90409babe5"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


