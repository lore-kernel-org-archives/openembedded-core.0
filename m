Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAADCCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:35:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17797.1761219312841659043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BDTGnCms;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2391a0ea00=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59N5o2rM3260338
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 04:35:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=VhMLVYvhO
	qTYDE4bBOb8bOvPolL9ylN2KLvTxQo7k2E=; b=BDTGnCmsLP260c841wiT0em2l
	HEtdmSK7Q4Zi/GzYzA6q4W62ScFbTqrfkGSRwaD1E0dfemqj7wQrLHyn7tyB2jQg
	wpJfUrG7QEBTUgJq8AUlamxDO/gBtFd3gXA3n6khOUHYEX2j2hpYAgxiQmFCaLhX
	IlNBFhNp6eQPcPPmo9rESMA8GZADxYBPIL92ro9zvBQq8LOu8jr6La1W2p6mRNGk
	PI5Shc44pZC/58gGKmKHpFtq0rA013iR/BwhjokFSUYkatgffhvMWHnzkGulA/HQ
	m+HBi72F/m7OPq0tLykfpPVsMSTxSyW6KNUIVNWBnzGPSfBTZCwayGG71OJ+Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012018.outbound.protection.outlook.com [40.93.195.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49vadj5mq2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 04:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhEKWRkmYDOsyaRyFryF+nhyv/CHBtGIGI9JCZ7P27XheoiW9ccp9bSUW1f7Vx+dKu/19oZYTNk1dQB0aFYSD4l9CWHXOWF7FBduZnx0g333lE5EfKHy/yk87YB60G10cW8yIrwiH2oTPZNdNOGGnPnBuhjvfpxKemv1YNTWwIe0mDXN71IaEQWYsaZAOriRwAYV47G3i1XpN0Xj3AKidafo48eJKjlo302FRosfjhWv8d81tZySrBB33zUVDm+0xiZLdMTRiXE8zQ+h4Z2LJ6baLCdmZJ/Hyca/P8Pjb/gEZzAvjaBP/G9lmDSc6Vw2iEi/56KvLofCrjDg2LTKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhMLVYvhOqTYDE4bBOb8bOvPolL9ylN2KLvTxQo7k2E=;
 b=UUKMPHW7CHuhpk3tiZ1wF6QVaChCZBJK9vSOFbWLTgLl3KMroasZDCa+idlSecJr/pyyeSG1RLqjRe4qBO6wwFc/mMcYTY/vctEy4CN65Hk+GyC0o7kd6yVdCeG5W59owqwAY5HzYCFC5EONc8+04INl4PZMVVNt9UcJYy9JcYdTPqYEJbwRjDH8tHZgJR4fz6jtfG4bhUGVSklkYBidHCnn4K4FNJx6lo+u4f8Sc5OnfyUFnPQwbSQU5dk1iggh0dBQsv0xonpJhEEy4LLpXD1ImIU7413lik5cXU82U36F4/6+LhtB0bVQLEQ+GLtqY4K8x1CEG0/FHw2L/fdKPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DM3PPF2DEFDE2DF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 11:35:10 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 11:35:09 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] conf/bitbake.conf: Remove debug flags for native and nativesdk builds
Date: Thu, 23 Oct 2025 04:34:44 -0700
Message-ID: <20251023113444.882980-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::30) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DM3PPF2DEFDE2DF:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b014d1-c3b4-4a6c-980d-08de122838d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pdJfW7eK7r9dKVzreRg1+JZTsnqeQMzKOVmAarLuf7TPuH2JXBVeNmKIdslk?=
 =?us-ascii?Q?LIdo3ZM3D8+lMwbLlVKKC2T4VWRNbDtv+iKVdOvBPuMOLhHYT4cBJEMWKYTu?=
 =?us-ascii?Q?kEs8lpxmgc6ZblfwdUxnCeMz50KdsnsTnq2uO2/SclnWcSHWd36x0+4qNJ4s?=
 =?us-ascii?Q?gLCTUvvs25hgl/e3y7DRAL26fSonMqko5sl3WrTlIDeFbDV+ZOxso2XPXc0R?=
 =?us-ascii?Q?HtQAOfF2RP/XG6BicBKMKPoE7ehMAkszV8Sc9yhKuqX6C0AbmIl7jV4Evk5t?=
 =?us-ascii?Q?GVTH7mn0GAEMJfjdQq1rt+tUYTfz2jaIbrZmlhrw7UQmsepLTZWWvTQX/3y8?=
 =?us-ascii?Q?GBIvCkCILtV9LyAYwRXv3P2UDHVfG6N8RmgnQsuXLD/DnYyGfxyRZGW4a/xW?=
 =?us-ascii?Q?iIh56dYhuthh8Q2eMaY/ksL/BRgmPvLYZqfPw8GUlMf5cMouUD//pyDGlY4q?=
 =?us-ascii?Q?uc9CtxbAY6SJRL0O3VP0uB+/V7YyEOaGKQN6Xpp+Zmu6dQfIa2iWxaH+8CBe?=
 =?us-ascii?Q?cVNG8CBz6Z2KG6ZAiXqMx6fXtQrh7s1PpLk+KgxM+UO8EDvc/WZ+pwlaXxUy?=
 =?us-ascii?Q?nq4LumYhwbhHEAXqFsDWkeUK4M9wyIxIJWI2v8C8pD50RQ4KV1e1G7NLGob4?=
 =?us-ascii?Q?bzuP9du+MBC5e+rNEkKvmPzcYjgCvmP01WoAVA4V+aEVuecsbNvI2Q85obww?=
 =?us-ascii?Q?7WWejJuJ5ZIP8V8QF1Jax2TrsBSz+o0T2eUoRelAS6epd5qEpj/U1ARWiRjd?=
 =?us-ascii?Q?4703N3sFWo8pJbzD5Gyal3KE08WxVNf8mUKrIPKC+3tk4Sv9maHOAFEW1iDj?=
 =?us-ascii?Q?iWuHeZO/e2udmrx1treEWJCYkvy/G48MjvC3u+sRQa7N48mKNvonp4t3UEVj?=
 =?us-ascii?Q?cspVxbK3rDOMfMQ5qDq4745eYXkDkeBS1rKBYByTkebBA0bfRK7ZCy9nNtsC?=
 =?us-ascii?Q?rrVE7Um1MHRA8oRIrmWpgvcJxjKfnYWXnLlzLIMiUiEFly6oHSpqpLvCJtj4?=
 =?us-ascii?Q?LwV0VKx4bi+pFA7iZJBduWLUqBjJUEWHyW4W0NAgTPZRn30GYqtRjxjHeoTi?=
 =?us-ascii?Q?qBv6GaGej5mF83R5fWo+DTV9M7yZWnYwFoNk/MyCqhEYxvw6CsRc+hDagdyD?=
 =?us-ascii?Q?U4NdzW15LZWEBTHyZwTTrTWJYfWpwx6VKyiTB2xpY+x6mWBAd8U3sxGmG2MT?=
 =?us-ascii?Q?1+lCEflwAdLkHhudj9UBAylkETDuXTgJtphmsl4ap3OhHJ0IycpBy9Y10GUe?=
 =?us-ascii?Q?TPlAdf4auQxECq2WhyNtnXmg+YSXLcYEjX7uwFooWwj5xxDbZPfR5CgXTee0?=
 =?us-ascii?Q?HY3Ap/QK3IJLRATcmL7k2h76DoLyiH0tvcxNAkG6OpUm4Aw5K1oqutFPQ1Cm?=
 =?us-ascii?Q?a1KcM7AjolknuXr1IFnM9j5YgUvh6/L08Um61AmO/QaRSOmbnTZy32t8dwgz?=
 =?us-ascii?Q?Dwv5MgW+0TtlssSKkr3bgSNWPL9sOQf+T+YN79oibOORmnwlKIDEUG/4tUUT?=
 =?us-ascii?Q?48zSb2k1G0091GsSdZGvKpYs+XQSXQ2Phe/3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ut8asArC2/LJ7cYdTLk0r5iOomVeVBe6Zv0UWWWLU7FxBVDX5UQvNqN3SBwk?=
 =?us-ascii?Q?h/xRTOGf5inVZvgGvKviBNbqjz5vOJYi4f4+uzBgW5AJSYvDbweCAFVDdKwO?=
 =?us-ascii?Q?Tf8na5oNSYwElzhxyuXT+NLgrG/Ridvd3Ex+CpWjpMGErDrjW+m9NBCx1WBA?=
 =?us-ascii?Q?IFDhgcwW2o3LBoKWaeZuIfOcqO1ACgmZTH97Mr0yyWq3TrzaNs6xc4akQCin?=
 =?us-ascii?Q?jKwUDZB0q/qDERIq1IXwrICh14ycWl5X+5Q4UzcmkKL3qb2daWuhkU2fyz+7?=
 =?us-ascii?Q?+gbWCxHYIhu/0Fogz6X1IY5BjniGjK2C/s+FpL2BgOGy8E3MH4OCE1jc4vHo?=
 =?us-ascii?Q?/wW1L5oJtpIEuBG4TahQq7ZFYa8ivq6hgeDSPl24p+PESS57mfrPaCUp/GW9?=
 =?us-ascii?Q?naCN0pqrWDmOrF3fGIu6j/GGgyypRCoCXIQ3CjCp2mHo9/uW0CpHcRrambrX?=
 =?us-ascii?Q?yP2ZzQhyuZkYmb8BbiB0JkubV3RYXIMK4yx4cn1SwwNu+GrVtuOM278dn3+h?=
 =?us-ascii?Q?wrvYPPshAOJf/FCdSPAVQ4OVacZ2XaVi8TuOw9Jhf3CLnUjkSQdwsVMGMtzu?=
 =?us-ascii?Q?2i3JpCAH8TTBCdyVgiQ/p3KYYGFFKP21ekzp7qFQkrZl6pux3zxk2IHFe10H?=
 =?us-ascii?Q?JiSHTxClsFyXrZvS5Gl7hNu5RGykRoqVlfNbElucJUZfR7GSTQpJZqVG7PUg?=
 =?us-ascii?Q?eewI/luipN7Xcl73fO9zpvHfQmDSy6Psghr9kb6m8bcacXfUuzuW371Cuzax?=
 =?us-ascii?Q?nlKx1TlBdW+r1DkSxYS04SEztii6fcw6SAPFdTtdJrsUQUxVHOCjMSTc7EVS?=
 =?us-ascii?Q?GMNNOFTse0jwE4qSG7ribKZ1TFh/8vM4yVgGqM0C7j8XXJgZbvj3heCmmL9G?=
 =?us-ascii?Q?dJf8cAnTLmLpU/dO422+UzZvs9gtFo+aub2F3uwaNDuY9nAGIjrdGVuMWGDF?=
 =?us-ascii?Q?Ik1H3EGK5wEHoIPPdWWyVDtv5y3pkz06SQzxooK/12EUDrwQU+WO+4qFBFyl?=
 =?us-ascii?Q?9KjeiqYuGdZgSSuZJ3oEVpig6prZju2jmI1AmGlIjzGHKVbGraYs8+jdYhRe?=
 =?us-ascii?Q?EAWXax28E1kBlKrV5L0JBWL7i6aDdP/fDgsNARbxmGIFRRm07fI9+6oBxho1?=
 =?us-ascii?Q?gxOMmwRmhqFMCIbLXDG7Lr9ZjZkIqxbBPjnf3xh2EE55WViamPAnE7Ea8uKB?=
 =?us-ascii?Q?nxxJo+O2U77ayk9NhKhDrj6E686H93R1K/gVhMS5WS6CrlVuyheiXwWsdrm2?=
 =?us-ascii?Q?4m2iNeasiGiKLdsBsPOxDSWRlHHXRjXNhrZ6GeRMDBxywJzz1+RJ0/ynMMGt?=
 =?us-ascii?Q?yqmsb5nnV4uDGrTqeNLek3TlccBuOmCj1jqVBAACyXfqzZVAquPGtQK99vPQ?=
 =?us-ascii?Q?40T1AhQKqwaH4LZdvZqoZWYd6eTUAXPXRQQXbucO11sXo1fbA+lQq7bXIBmE?=
 =?us-ascii?Q?OWw8Nu5C1uXl9dbtgcd9OcS2AJVf06YqUTRIne3qknF6vcURx8t3b/2DAIzi?=
 =?us-ascii?Q?l14tG4/f1bTi28yYHBthPj5HXjrnLnAbimnntgLd3AC1lIsWOvU3fIINE2ut?=
 =?us-ascii?Q?rvryxl/fH5X8hzfJWaeS11/zWPzp8x5VhPom4zPai1IekyvL87ikNhJKodhX?=
 =?us-ascii?Q?CAumjAaRh03JbjUdvV695a4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b014d1-c3b4-4a6c-980d-08de122838d2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 11:35:09.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QI5r4K+pPL5xwo6hcADdnhj5uV1PGoWuF466W1IZsZZ5OViab4JwfEpAmQYNbTVdY3kGOQDaM1S7sbUP4FEN4Tt3e2bN0hSe1q+HOq2qV1tDyvAQv88VWaUz9TWUr1Ch
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2DEFDE2DF
X-Proofpoint-ORIG-GUID: 1xtKff65i-xoUyU7LxFlkmdRog-rrSG2
X-Authority-Analysis: v=2.4 cv=K+4v3iWI c=1 sm=1 tr=0 ts=68fa12f0 cx=c_pps
 a=QNQPV3WJHVGG3OZWPlqtww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=ovIIlwWKQKC8nqqUUMYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwNSBTYWx0ZWRfX71Y0Ub7kCpFd
 uHrvr8n5YRAFKQSNH/zBL7wBOSE+MgqOlhWnIk06FCiRPLoxQuTV+Zsjy5c4ws5yqLqxxxHGw6t
 MsBVTweSx2JH0DpMiFqoEFa5ZCINGbCsPsdCfK+96oopdsrY69MSO7783lqTj0JI5oVFsjDH7UX
 N6GYq3sItnxuVTpdNRJ4230YOnHG+cfMW4fqbWStrceoNAp+GtmFc9Z/pSAgtkNHYcYTC7nsUMC
 ER64Gwnfw7jzMxeLYKbEZ9KTmH8qRd2wo07N1ztnzf/KNeeeHAlvkaxt9LVfGy05UmT4Nffp8Ia
 qLdUkQcqImA1hb58XvvKx0+lJQ3pzG7D5ljj1xrIq5/7QId+pigPzLMkteL2biQIAUjCMrZbdCP
 dagyG8wyNpamwOyUafQ7kBm6fLkkZQ==
X-Proofpoint-GUID: 1xtKff65i-xoUyU7LxFlkmdRog-rrSG2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225244

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

The native and nativesdk builds were previously using the '-Og -g' flags
during debug builds. This resulted in increased disk usage and few linker
memory issues due to the large debug information generated.

Since native and nativesdk components do not require debug symbols,
update the build flags to use '-O2' instead of '-Og -g' for these builds.
This reduces build size and avoids memory-related issues during linking.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5406e542db..d8f9f6c312 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -663,7 +663,7 @@ DEBUG_OPTIMIZATION = "-Og ${DEBUG_LEVELFLAG}"
 SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
 # compiler flags for native/nativesdk
-BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O2', d)}"
+BUILD_OPTIMIZATION = '-O2'
 BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
 
 ##################################################################
-- 
2.49.0


