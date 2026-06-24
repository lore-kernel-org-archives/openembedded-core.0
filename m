Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968D0CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 06:43:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1266.1782283427311276196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 23:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fozNoHRP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0635d06bfc=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tUJu1541260
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 06:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=hCmOhIQpS
	qjinzkCKHbRtrIrGwtVQ9ssaqhs0teEcTQ=; b=fozNoHRP4CrFdR+UQXZKyuziq
	q4WaH+jaHGWf0b4EJzbQp2obBxnP9piVYMD4K7TQ2kWOfoiUoA9YAWaGmYKFTnt/
	pHUAF/cagBxkKKVxsz+7eYqzFhMdBK2AjTPYO1VNONnl5Vct1B4RM0KI97Th1RCD
	Jj/ufKiP3zTRaIJEqx0YSCcw4yMKaLeI9wF96To3D/oZ3YgOcQce1c7itWw7ef6L
	yvTMv7tgXS6P58V6sNTh9KgYtmR8oEhZYVNHP3LuLUsQX/VBtjxiDe6vru4VHWAD
	kYB8IZ42NlUwKvxhBJA6sN6Dtv5Y+2eTJf6l/tHoJadkptMoaUsL81pmuOlyg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ewg2wvs5y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 06:43:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5x0UQlYbWXQtHEKOeWjR+sSjGuIpGYL1PitrOuvZbZyD74XGEZtzwGZvaYrgdx0LmBGooACFSP6K9GkJVn3hcjkEshxYlnmz0bAVF105aMaRIy+dn2fmR9gqJR/cUDx3KGJZRu6p3FtGCc7oCzkJcMOAomjLP4V7jYr6RM7kP/PRVxqi+GgBwfdYyT6ekAtEIx5BfYfRcrNtEhIXUMHSbjmf4/xe6O6qY2pME8mGULZ2fvegXJJduu5RpOnWNzuRcq0Gqm5EY1bcOE7OGadrPiCL3QPu+1BmKas0bK4bcrZO4ViArndWsWNQpiP0npR6/vlBfHCQ/GcWzZqVZmd7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCmOhIQpSqjinzkCKHbRtrIrGwtVQ9ssaqhs0teEcTQ=;
 b=poFpO8ME6Kx+xiJ0caerk0NoMOzwawnnJobTFRwNrB494UDEP8vlGYf6J9LLgJkqYNBcQldUhBKJ20T8ljjNx9lDuZF8/eYgU2Jm2TUx/2uAiazKas9Z+iI1RDpLWK5CGKH8ZGn8nGTjVz/HqRRQ+ymptGIQm8n2Ui0w60KErPHLMKINhN0+g69FV1yv8EHsFkB8n1kIp6v/h6F72ckAAy/lXVHtMuYYdjFRMCN8TWQv994z4fYA1InSZs9IVb9jOp8YR1OX2Yzk8mvlRUnu+QwKtzrHZ+u1lnTV10OwZ87d6ANb7vg7K5qCW8xqNnwf83r7GGsLyHW4qW7kTfhbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Wed, 24 Jun 2026 06:43:40 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 06:43:40 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Hemanth.KumarMD@windriver.com
Subject: [PATCH] sanity.bbclass: warn on .cargo/config.toml outside the build tree
Date: Tue, 23 Jun 2026 23:42:24 -0700
Message-ID: <20260624064224.2998388-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH7PR11MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 896d9021-25f2-41be-4e6f-08ded1bbed6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|52116014|18002099003|38350700014|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	OsidiVyTRsDS2DzWFuvGxzxCNkiXw5xtPbyoMuntzAqD9/ppRbWroIzHE7jScu5s+GNoC2t3JBhpSR7ppkb84gi7jzWs3rSDvPLpdAMX7TX1FCZKXArTCxsXrwJ6xOi703kKc7cnvaRdBuRwGeFSEnlnKKtHPAygGVJ6Xm/CY3Xh8+PH9mcYhFK6bhbcdmvulPR/oWfNOVYnoVYjj4fj413GoeGMdJwCbddW35gcsUguqyfCTUaZAJAqw7juln2CmsNxR75CmsjOh0prg/fxcqA8bwr3LSacJzDBKhGebXDgbkAG/10DCZYZn9pzEzXysKTyEwKdztujJ4KLT3dGgXCli7iI9TXYIhziS3A0bhRYcLTXdtnxGd48kwtht2BFfr5DiEel43UNoM1tuD0Q91HQpWYKGSpr+DtDOjFIulo8exe472OxHEABq3tNYEnv9PfIorFYl/Re1mnxqGt5zD2Yj0XUJotdwWTvjRTONp9OaRNwfwY011DPA7faI9Ktqg/jRg5u7u0J8E4eAEzN9pn6YFlR+R9Vk53mdxmLfCQ58LQco0pjQC/Y2StadeaFygvj93suRt7HmAcoGZOH6R1VhdXW+Kb+h7Ix6i5euDGaN9A4ZXN0D6/ZBt80AXJvq+1Kwe4PzbOxaQC7/yJVqVsN/Ha0p8aRjgS5ssRAIHQF81YzPPyQT9aVE2rYYAVQ1kjDAjEUpyIV+iW/bKPLZHU//ya/XomOr3bcwhyLvyg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(52116014)(18002099003)(38350700014)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vZU9Emzz2vHkW9uB18WZOMwvjgZFZEssX8obXNnnf8DBXXPZ+DfZU55uCn1r?=
 =?us-ascii?Q?7H6xkmUWjLJSe401tw1ctG0rfzXQGBLG80qt7g8wBJ0AVJaWlGaszm2Yf67g?=
 =?us-ascii?Q?hWI6c73KQQn9BvLX9tK8ppVZhyowfJOvt3RhxNHFE3OfBBt+4gC7uI0SjkJC?=
 =?us-ascii?Q?2zn+vdt/wHNMJAVixfNXmiLaFwkoMFcfy9+/q3OxWlVYPllD1S1wXFURxlEE?=
 =?us-ascii?Q?U+ghgrzsNmK6dvJv01Ok8DjAZDGP9468y14D6YGxc9cIxywpf5StQw6we4Im?=
 =?us-ascii?Q?NUhHOuhpsLY3hcvP4Vm7Cc3KL4KQbjQk+5SLDzhezzgI4KHaW1BXGB/OMfWZ?=
 =?us-ascii?Q?7oHLq51Jar1b1DEg3Y27KuHaxPh6hdWyU0dFrldQqyCPAl+XaPmkRWzbZa64?=
 =?us-ascii?Q?iEpvcfgcVQjqteotilvX/nPq9r8HIOsB0qECqhUHNbc5+hWoUlwq5XABRK5u?=
 =?us-ascii?Q?jg68WT5yZ69WkfBuhDiByNsJuOzzWJRLi2ovKLebhCOlTOmhGRjvtTOywiOS?=
 =?us-ascii?Q?+VjXdyxm7PEQWiLvEOJtZukfp1LaenF2s6HD11SpsLaND8Y9qb2l+9JZfTaa?=
 =?us-ascii?Q?Rpmx+3iyC2+nU7v9/8twJl63VYF4FqXkjqnnqF275fes1B0r/nzp3K0cHSlm?=
 =?us-ascii?Q?7NsJu9BNmOMrDQsW79UvwneTDR0+ml0BpiHtOmPpo5EuSZQLOd+KfthNlHYP?=
 =?us-ascii?Q?dZ+KPAXkB68aclBAt+5++2RQpNgRMV0xNdLUHYgiXQ/bdZZxaQle1FHUKHou?=
 =?us-ascii?Q?jO/4pKRihKrAT5jI4EA3hrkK+QK2oJAWD6QuB2Y6ggYB7OIiNxpO6c6iK9BZ?=
 =?us-ascii?Q?yxrmv2tmN1n9hun1AnpbPXilOwawFvYE8wBB/jmI4NYUAH2HO+6vNd7pNt3W?=
 =?us-ascii?Q?RtXE2MF8hITrM5XQK1xQZKLNs1rzVtjAI9SXQQyqNxM+yr3MSyrapCeeotCh?=
 =?us-ascii?Q?NWoSyPlQ6WMeLHPi1+eOIpwN4FIiAzjzLq06NBOankVC06xQMk9n5qjMq4DD?=
 =?us-ascii?Q?XjOO/Ef54n4clMFtnAiz+j52WRdNaxEUfSpe5alvOdrPxi34yq+0d2iUfB29?=
 =?us-ascii?Q?wqmY8CU82q/u3btJCrjON4lAgwHFvHv2CFPu5ctSHLSbOWr0nU+kbGgStIbb?=
 =?us-ascii?Q?0UGqzuCwGA588ijWFm3WflFoJ4BVlXa/PvgCf30EEf0v9efIPvethezUYvm7?=
 =?us-ascii?Q?YEgJIurj7FTCj+mqSBWSkeCyezjrE+tnQ8VVMzocy/no5mC4zHlqS+gnllUA?=
 =?us-ascii?Q?arftYuUkswVTbp/FxPflAu+budGQhMomenxe38dat9UX1NID6asuwBQ91Hjl?=
 =?us-ascii?Q?M4RDEZwtRFuOLZ45ZVwPF6tCuQ6JY9nSbBFTwrDCGnQ84I9Y9AacgxytQb1v?=
 =?us-ascii?Q?PGEzRER2LbwDuLP68/BUv/RfZolIL9ywJT4b5iGIxhpyBesKtsyByLJCbAvJ?=
 =?us-ascii?Q?kDDTQhf3jKUJt81tvlqAXd9wPv+IThGT2FIRTwj1gLHkMFnHaEEMcxG5a8/h?=
 =?us-ascii?Q?KaA/Btsph1aZNTZAJPliDr5P2tZ0uOw88L7/bFzKwPLLFRtLRbmp2H+Cl6YT?=
 =?us-ascii?Q?Qh5x3YgA2AKYuSlN2KRkm59Du8bSgd4HNexa2VWqplzCpOr65xSmKOgGzoh1?=
 =?us-ascii?Q?ltpQF393/ohFi09vnkV0hJ/qhPJH176WY6MfKaQDIq50Pws9D6ZPaW/72vRC?=
 =?us-ascii?Q?2/rGWXBJxBsuZSHkuaKIHYWfhpzJwYlFmgbB/4dCdNF4iz+dEggSaHTq6cMl?=
 =?us-ascii?Q?ncyAvtewR1AQzUyPY7y0B3ed4gCepv8=3D?=
X-Exchange-RoutingPolicyChecked: 
	Gdv7ObrzP4zDiuHgft9Fic2CM4/wHWcDzTH+DP2KGZc/OCTRDtXTy9EkKsy9c0iVVBzp3QVzlI4+PeUixNJ1B/GkZq5vwpXGz8bit3RD+pLHtI18M1bUFz9Tvytidzr9JJwRGySRtXv5A50YPvu/5ZnUHI19COLNfNfor3UpfZF7gdlPEz4g4a4V9y2Wd0vqy5uDFew7wUJulTUkb6WSV+AN5ebBMLrXXRYJQt2YuRxrxJsawIA5jJAddfIp1pICdMc0ZrD+HXnilpEglUu6gugCiMWzSfG1MdCAn8dXovd33hkD6ma8Bzdg+SZazNMb0q6C6VJe1mv0vxiembrrjg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896d9021-25f2-41be-4e6f-08ded1bbed6f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 06:43:40.7511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0S9wdBJqfjPF6KKgYJY58jLsBO2coepHD/G91knuf9+qrdcbQTUgef7zCONpsi2vN5z082E/R0RTt58Cwtpu2rUwl6DCdE2B1jFhOtHwtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5861
X-Proofpoint-ORIG-GUID: Ae7E6qDPxZ9ec_fOLGz14H693pQLN6s2
X-Authority-Analysis: v=2.4 cv=Xdm5Co55 c=1 sm=1 tr=0 ts=6a3b7ca1 cx=c_pps
 a=3RjCkzAZQHL7PUncwJf+GQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=6l6b2v__q5i8A1H3Te4A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Ae7E6qDPxZ9ec_fOLGz14H693pQLN6s2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1MyBTYWx0ZWRfXz6GbYlnf7CD4
 vyNVyWrRA1+0HDhmSiwuEsTRTlcNe66gOCLzoiV2oDSosAiQ16LPJnqtyko6a5hC/u4b1Yk3io/
 TGXUwbHCst01YcfCztUI69W3NrA5GrmhuEt/cU9HPGrKYMOWmp55
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1MyBTYWx0ZWRfX8zKC1qcxei9c
 9MQOazYZlWRSQWwXvdj23/8iGS03X9nHFZmp7EanO6PgdLCR9xnVFxcjq/HS5XXacM65Rlzq43v
 vI9jhWUu0vQbws0rU7SvA/SPUHUCsstJkj1z+IICuK/xiSxvUzLr1FVRViwgdllC1duZ4sRDoee
 rFs7pvjKWCQpNxhKXTHYIjqCjZPbJWZRIsBg7IITl2jVCwijdKDfWGYwhB7rAlwfnqyP4DA8cBh
 VWugpMSrhZLbf4mm9618pCY6hjccc8/dKCBLvGsZNFqKAhdLZgxP7iCNs6ofDjnVKgHMMyPrPay
 6XAg7qgIEa0ujJ6NxkJZnlQl7xel3GReLs8vaBqvaup5P+xvAtzbnVoSjz4ceAL0Ddk+PPipbXG
 Sv/UKmYYxQEhbIyUMNpRUF8Lh5XR4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 06:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239474

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Cargo walks from CWD up to the filesystem root merging every
.cargo/config.toml it finds. Any such file above TOPDIR is silently
picked up and can override Yocto's linker, registry or compiler
settings, leading to build failures.

Until cargo provides a proper fix upstream, add a warning so users
get a clear diagnostic instead of a build error.

Upstream meta-issue: https://github.com/rust-lang/cargo/issues/9769

[YOCTO #15637]

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/classes-global/sanity.bbclass | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index bdfa7f059d..c67c7b8f03 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -854,6 +854,38 @@ def sanity_check_locale(d):
     except locale.Error:
         raise_sanity_error("Your system needs to support the en_US.UTF-8 locale.", d)
 
+def check_cargo_config(d):
+    # Cargo merges .cargo/config.toml from every directory between CWD and
+    # the filesystem root. Warn for anything found in ancestor directories
+    # above TOPDIR that Cargo would pick up silently.
+    import os
+
+    topdir = d.getVar('TOPDIR')
+    ancestor = os.path.dirname(topdir)
+    found = []
+    last_ancestor = None
+    while True:
+        for name in ('config.toml', 'config'):
+            cfg = os.path.join(ancestor, '.cargo', name)
+            if os.path.exists(cfg):
+                found.append(cfg)
+                last_ancestor = ancestor
+                break
+        parent = os.path.dirname(ancestor)
+        if parent == ancestor:
+            break
+        ancestor = parent
+
+    if found:
+        bb.warn("Cargo config file(s) found at %s which is/are outside the build "
+                "directory. Cargo will silently apply their settings during the "
+                "rust/cargo build and can override Yocto's settings like linker, "
+                "registry or compiler settings causing build failures. You can "
+                "either remove these file(s) or move your build directory outside "
+                "of %s to fix this. "
+                "See https://bugzilla.yoctoproject.org/show_bug.cgi?id=15637 for more details."
+                % (', '.join(found), last_ancestor))
+
 def check_sanity_everybuild(status, d):
     import os, stat
     # Sanity tests which test the users environment so need to run at each build (or are so cheap
@@ -873,6 +905,7 @@ def check_sanity_everybuild(status, d):
         status.addresult('Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__))
 
     sanity_check_locale(d)
+    check_cargo_config(d)
 
     paths = d.getVar('PATH').split(":")
     if "." in paths or "./" in paths or "" in paths:
-- 
2.49.0


