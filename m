Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B82C433F5
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 02:41:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.2970.1642214463265778750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 18:41:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=h/29D1NZ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80149e1e03=kexin.hao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20F2alXq003928
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 02:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=oWIYimyfC//K+t+hHhJoAEvRzSOiG91YVFb4ZM1ICik=;
 b=h/29D1NZDTaYJToKba719OYJ01F/8c2j7+fGaZQjQBuPJdpYTf56Kmr8XFdkFMQjsaoP
 Yc1IJzI+f+XrlfOjdtp3TsHkuBeBCqGMIA8Y8G1PBIwgbtTXbZEmI/0hrX6o1u2WvZhs
 +sDaVYZcwWaaR/atChon6wk6cKkdVzoz2dYvlCce8sksLZ4xvDvORmWxdmMfmC3gYLhm
 ORMQKcsztFP3Uovn0/wJkoQdzxYGqdw/Wwo+fvG2kTGbq5EdskQM1MIJuil/gU3gtst3
 D6Kq8hWwQkipyuGgvdH2lmmLNTi6Rxyh2vE1UoG0PPiiRtVb1DUpR4J76udepKWe0F9M eQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkn87g0dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jan 2022 02:41:02 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20F2f1m0012744
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 02:41:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkn87g0ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jan 2022 02:41:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaEaqUlYXf44mFenhagCmM0HoTsRMIqnWLCmXsw0mEOkE2RdCfO912EbfeA+XA7uJ9je16htM7mhDCowsnyKXuJwtHe1RrWU1sj3vAt5AINM4wVP2xeGFkCkPjudSfPs108NvFNotiAuy3SxEagRPyc7r/c5JF5uTu3kmPTTeEx63JF1vR6B9CmuaJGzlnvaoT7SLKkpYU1A3Ljik2YddGXAOcTc2htv/QIW7HQfnO9rdfE+B18oG+WXsXkFDsoANiruwuSQVk0/IxcqSWtY8mKwDN13IrsTKzCzV1kA80uIf03niT7zlDbxy4l5bppE4h7Tr521i3nh4/0tPTXvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWIYimyfC//K+t+hHhJoAEvRzSOiG91YVFb4ZM1ICik=;
 b=Jg0Ji1laduMsZkvEJ0CT3sTdhkN4yMwQP78Rx7H11wgUTYrnfuOcosAKWgmelgzOQVAUogGkDpY7K54re5vYUVmtRBsYNXmsj7OFjROte2DtdbjzVhfjgjizjZFOVlxedJ6Ji1q9FbWYU9/Pva17RiM7sFvh+tc4sraHHiHnxhDBjvELEcAxPtumm2ehxq3gx59g9CGPOCmFE3Irz12Q2dRaivMruCvXEDv2iX+XJcjiTCJcHLQWdj7Bn7TQ0Rx/V507juqIUMXbkkpUd2Ls0ECKR+ghBnmZd4UtXN1u05c38qWgpJGi49lkaEDv7hyUvf458X4K7Xt8238dH5VfjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by BYAPR11MB3445.namprd11.prod.outlook.com (2603:10b6:a03:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Sat, 15 Jan
 2022 02:40:55 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Sat, 15 Jan 2022
 02:40:55 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>, Randy.MacLeod@windriver.com
Subject: [hardknott 1/2] tune-cortexa72: remove crypto for the default
 cortex-a72
Date: Sat, 15 Jan 2022 10:37:46 +0800
Message-Id: <20220115023747.1154635-2-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220115023747.1154635-1-kexin.hao@windriver.com>
References: <20220115023747.1154635-1-kexin.hao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0212.apcprd02.prod.outlook.com
 (2603:1096:201:20::24) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89432713-3bab-4aff-6609-08d9d7d073e7
X-MS-TrafficTypeDiagnostic: BYAPR11MB3445:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB34453DB1BA44CB8EEBFAAA85E2559@BYAPR11MB3445.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ltx/PsjN/1qOCVF5A0iLwAQG+qEvWsuHHmA2WTpMdlk7xXrTCkl6fKnxKPkrwx8w/UmIp9Pu1fCySdcYfwXFDojYb+x/P0Ldq4exa2IOukv53cibbM9mIJO+erT87j42M6ifka/t97hveA1fLmQJ4Jznj3scV3JzzRdSxTJejFawVNs8L/zisQQRMGoF/v0s267q28xxTEFAfAMfFx5/lxAhnPrc/H6JHjpBC7QqLnWcFPcviWKX3enrtCoxxW5LtkPu1szg4mU+bvIB9Tg65lm2vIgXy1mOT4Mgp8YGSninREVV949sK8M5eYdZPAPzSDYAOCdAxqKyeLDFXvqBWPO3ENcYTC/tBolDdfHNLPwyOIYgfSv1t1Xdph82xwdfaVo/sWy2YnKcqeNDhZqtmZ0BFQLGEjUcRYcDgZAVOz8EW+hL0cmiOuBDYLr3m8EPmxkYI0gCDpXAhe2uHFUypPBRFYAW1KxGHUdGC7+wEZXUcuuUmB1+EivwIyN02cAqecqm+8UkTYflKr/6f8MCF/A1zCmb3VAyrFU+FzazT64cb+8s//vEETK9cuf40ojWSt04mCoeFlI3r1RYs2nreJBS5T3qK8iOyo6mFJud4zsdIk9Xg3OUr9S57oqnEYAuWiK5Xi8OXgMRy+K1bmxGfk7Kfj+cus1NG3g0LQpLA8hn91eObaQzGLUQbem3TaRp8R+nWiDmzLMnW810hEYsfw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(2906002)(107886003)(36756003)(6666004)(26005)(8936002)(6512007)(186003)(83380400001)(316002)(5660300002)(6486002)(8676002)(6916009)(4326008)(2616005)(66946007)(508600001)(66556008)(66476007)(1076003)(6506007)(38350700002)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1B7/kBf2QUrJ9jOnqN40GxXghLmzv3br52xAR5hyKH6mDAcTs+chpkqbCUlc?=
 =?us-ascii?Q?CWC5IRZpLGd5qiUs+6vRwWU0Otmc+dIyfuBN8ocmXLU/hzAygyXLSjdfhZ2e?=
 =?us-ascii?Q?kx89z1nBt24w4m8zmev7msc4T4OpntZAi2U2nbiG0bEWw4dL2fNQcBn9aJjN?=
 =?us-ascii?Q?pPZqEz0P3MOETN2/UhXs+kNIivVo1GhCypEFivrQqO+XWUEvt7fWYc7AKMpj?=
 =?us-ascii?Q?5hfgiHQMQFZ7BzKks4S1Syg0yQk9Oq7K8G+DAOQSi2KpkHoXNhF0Poawxhm6?=
 =?us-ascii?Q?ADxtbJIZlOmUXwRa9z/5PJfGFWurNdWQuuIY/ZIBpxxs+ZsLNLm2QgFhXprI?=
 =?us-ascii?Q?Qbub4Q5nGeycfLkHMPADqE5M+2mV2aBYej6JO7er2aoR/u1Ea/2YRBm/e9EV?=
 =?us-ascii?Q?gZHZCAIDG86aqKUucwHtPPzNZBv5nOMA6MPTWLNtJfseFNe+zC5ruB+iAvnS?=
 =?us-ascii?Q?YTv7JiaBTwNg+zntu8FbidcEqQo7HzbKRPqSXJ1M2l2wwRKS+F9vsXIyD9JU?=
 =?us-ascii?Q?BTE+VGu2mDbU5UBpOATs2LYyC3P1RA+NgQzCSGZMZ04yNQxtyzo4HRbrlaoY?=
 =?us-ascii?Q?hUttkHY916lKAG2ldWqKyeIlH657LJb0AVBqSeNXKdouvYJCZ0lZe4tsETeV?=
 =?us-ascii?Q?LwBl8u5bNJIdShKwH9kCMtkpSE/d3ZCs8Q4DHq/b8CaYySd29h3xj1DqPpcs?=
 =?us-ascii?Q?+JWTPULgDDnm0YC8N3qadnBj6KKMpAS2ACihJ7gBvW77iEqD8OeSRVFFMo8J?=
 =?us-ascii?Q?uTYHsZ2eZxk6HjgEaZsPuuXNBg2DDoMX/N9TvQmzShk08bFjUIZtw/gvoD5/?=
 =?us-ascii?Q?Z5Z1u7FJt0n2tsZD3dPcShurazV/l8lo0jwPkkcRyXRUjwRUwat+0ih2uiUo?=
 =?us-ascii?Q?MNkcihxwyaMkKkhmJLMHRgVulgP2H/K+CBwSa6j/4R8S+cZglT6vZwLuTKbE?=
 =?us-ascii?Q?d0ic3rWOkOWqn3gEDNFzkOLgsup6deOMGOWfxErmAy3JSvu3sf6p6ocXvLxa?=
 =?us-ascii?Q?cTiEyd0qzrxuKoTys2x5jUBui9EZve0/UHCBRgQxuAL+0vt8CDEgdOrYMP+P?=
 =?us-ascii?Q?YgS0shoEXjVcr6JSjAoZ9N390HQ6EQF8rHchNF//TQpiXuinRX1NmrHgSy6f?=
 =?us-ascii?Q?9SDM7Y+pi9XMLFIrNOyKo3ytM584+EULeXjbC3fVOP24ZFKbE92yAyOUmwR2?=
 =?us-ascii?Q?VFTCU1Tday90hzjS4J29RQ2yY9qI8OIty44w4CaS4GXZqshM1E3WWaU0ijwH?=
 =?us-ascii?Q?qwoe+qeNDQuWVSBmdW4sFjab7C9ToMtBefvrE4KVz3qdZUmUIcF7WTcMzM02?=
 =?us-ascii?Q?NnZUzS+v7GPTuBYed8Cg+Z903nKMJ/DpE8lP7pRvOuJKAB21FeADynpLNvKx?=
 =?us-ascii?Q?cnesxUHhIVf/EoCavUTZKcWn3n48OT0dHnZ0SMshc6sD3zQR2D7DNK+/RpHI?=
 =?us-ascii?Q?mBzlD25Fi8i6H1nT9XIWQhDWWNbip2P/hUYPxibksz0RPW+7wsd0N9u0nSAz?=
 =?us-ascii?Q?i/jNcomz/eNg36SX0KsgMR+zWQqBKXij4Fc5aec57cAAOpisuc4IkzuE5LPf?=
 =?us-ascii?Q?7rBiaw8evM5hYhW2PFYHnfkc1r5GUK2AqpF7AUmTScjmJ20GduJs29OLAa2w?=
 =?us-ascii?Q?od7WJi2/t0ZKO9NDtMWEoRE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89432713-3bab-4aff-6609-08d9d7d073e7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2022 02:40:54.9083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8CgX8uI0eaPtcTPq2ackXRRI0b7nNFOu317Pf3NUmoK9xNDVr5oMojcqjFnFlsWO+mfB5mNn2TEMKfFJ8v4gAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3445
X-Proofpoint-GUID: lqU1qkQhFEDqIljt4pMM4Kai6MBhWbp-
X-Proofpoint-ORIG-GUID: snonngUK7H_40HJlsKpEooiLdTGwk9gC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-15_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxlogscore=657 phishscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201150011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 02:41:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160596

From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>

The cryptographic unit is optional for the Cortex-A72, but it was
included by default previously.  This breaks building systems that
lack this functionality when using tune-cortexa72.inc.

To correct this, add a crypto entry in the tune file.  Since CRC is
optional for ARMv8.0, do the same thing while we're at it.

For platforms that had been happily using tune-cortexa72.inc, a slight
degradation of performance will occur using the default.  To correct
this, simply add:
DEFAULTTUNE = "cortexa72-crc-crypto"

(From OE-Core rev: 2568d537087adb0b592aa250bf628a7b48c3a9d3)

Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Signed-off-by: Jon Mason <jdmason@kudzu.us> (rewording commit message)
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Kevin: Convert to the old style override syntax]
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/conf/machine/include/tune-cortexa72.inc | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index b3f68ab6e3be..7608a20c43f4 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -6,8 +6,16 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa72"
+AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
-TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa72"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
-BASE_LIB_tune-cortexa72               = "lib64"
+ARMPKGARCH_tune-cortexa72-crc         = "cortexa72"
+ARMPKGARCH_tune-cortexa72-crc-crypto  = "cortexa72"
+TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a} cortexa72"
+TUNE_FEATURES_tune-cortexa72-crc      = "${TUNE_FEATURES_tune-cortexa72} crc"
+TUNE_FEATURES_tune-cortexa72-crc-crypto   = "${TUNE_FEATURES_tune-cortexa72} crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS_tune-armv8} cortexa72"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72 cortexa72-crc"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
+BASE_LIB_tune-cortexa72            = "lib64"
+BASE_LIB_tune-cortexa72-crc        = "lib64"
+BASE_LIB_tune-cortexa72-crc-crypto = "lib64"
-- 
2.31.1


