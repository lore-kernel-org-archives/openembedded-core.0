Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972F6CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:44:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18520.1760453082550157571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UrXAWbcs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382047737=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59EAhUfr3483883
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:44:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=v3LYSeS7obmo4+UmzI3SnA4fjc5rSHJhZM3+VZNf0YA=; b=
	UrXAWbcseHamot+8480222vOobhTm4xgmyGh7BIBjyVHjq2zrk/jPATPBRXVMRsq
	IgMUg2ntjLIjzisA5XXMDzbP+5CJ8CEzWmBnkkvqB/N08h5gtcHweS/YzQnzjemp
	PqlK1HdqHMyNqnP5Tu444XrLNsS+3OiilIq1awiqjyYOvXvl17ae3v4jymdgT9fZ
	0ydx9nquR3G1wsj3w1gC7m3vB1pOytPZYGO5iIiBGyqTGuZ6fSULtTLMz2pDANOc
	TpaijLklsKd902OPP4zTEPLcHmHbulgGDhZtE89kZI3e92o5Aq2QjU3kgqZ0pijK
	nvG2jeMMl49j5See6JYrCw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1k3wa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xP9EwZ9SPJVkLy6ryGD77PDQ8UMXhSu19fFHWrM4BTebasStJ+/xVLlVPRuw9NcquPkLB/0QXQqhEz4PtElMOJpRwlfa/TpgF+4xGPHWUBJSbe1sqwMnEqpo5q2uqcSkp/urGPrhQOF/ZkKxrdsfwb9zUsf5r3vzU42ACIxRBnFv7OK5x8XkSZYataWzugKJ/Ha0izrUr91i6XGtO5jiB4hp2YIT3lC7jmMRmH92FaaAjq50nDMh7kaPT+ltayRdRl3xFnrHiW0KWTrUkPRRVRiPSesOqBpYINSoFchOdYeIMq/g4OkBxo8EFQBvhNTcB02W+IyZOXCdS9EkEzT4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3LYSeS7obmo4+UmzI3SnA4fjc5rSHJhZM3+VZNf0YA=;
 b=HGmegIUhrqv5sgOBo9DgkiPKbetMtxQ0NLFX4caAfcjfAAvVgWRXO+IvIYGbnvR8VMbCIysjJu3+7GPIs7XjEpPMyMlu2X6Llplw1FU8zso3m6lsgP1RheMnKGxKUpwG9+NuNkFjDzQV4ak6UqZ4QXNOiofYeboFbgoxgjnDuk+lpulq/4AWynPDhgkM+oql46iRL052wkW9Mc/q+VqbNMfWPePYn/qXI9w1qkvRg/VhM9WXcycRs2s3NJhbrvMhmXq0V15qYLGKGuze8O4PQy7N5g0B7UVbq2siCRKlu2l4rQYSyWZzlnV4ioO3spYtREjrJ0Wgh/601U4LhjcHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Tue, 14 Oct 2025 14:44:27 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:44:27 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH 03/11] glibc: nptl Update comments and indentation for new condvar implementation
Date: Tue, 14 Oct 2025 07:43:39 -0700
Message-ID: <20251014144347.536537-4-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
References: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To CH3PR11MB7896.namprd11.prod.outlook.com
 (2603:10b6:610:131::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ab394d-3b35-4452-3835-08de0b302cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Supbxq+D8RLqNv5xLEIu7BFmpGoQQznHzcIbNx+VLOwmYwVyV5Lf4hdCOF8Q?=
 =?us-ascii?Q?17JIQCw40Q92zqUY+lc7Osz4evOMs+T2r6H3vc6JEp7Jrd76N6HXzdF3rsBI?=
 =?us-ascii?Q?G7r7Yc5squL2k1ZugsixnO5nh2DopxTKgABr+mEX8T37h/iFB2pnmk4r0EcO?=
 =?us-ascii?Q?fhlFOc69p2hGH/Rcg4M4xUhgWzY5+e2g6/Q4AR0YT43caxQLlpsHDquK/Zsa?=
 =?us-ascii?Q?tFGHBFmvgua0qr76RPRMtajoTB0XOyroFPbxswQjoOGG7CrVucX1+hbb8Dme?=
 =?us-ascii?Q?Jv4JasT8TvAN9y6auuCewnBzJ9rKFGdqO+/63/suYewUvulAvX86P+Toz9nb?=
 =?us-ascii?Q?bSPu2EZtwvR/xXLkSN3TX5VhN3Lfh770z75SzaKNrIE4RgJjPzMFFFoZic5H?=
 =?us-ascii?Q?UzHDv5HXVfjyuD2z9I3b1ngLmT4q778w0xKsGRDFleVHaiQKqTBQP9cfHN2f?=
 =?us-ascii?Q?XfEMNez3oP9N36WTuZqTm+rmPGD9zx20gUziAN73vxs0aePaVmQn+amUHAVA?=
 =?us-ascii?Q?4D59gBAV07sKGxJoG1l9E81PKqzL+uQbdkIvzD0QwtiMraY7jAx4wa3cmbTI?=
 =?us-ascii?Q?WU6n+WxSAXMoIwap/3x1t4tX8cjJmw0MH7AF4hOR5Z2iQCIIz6MFl/nbQ0hZ?=
 =?us-ascii?Q?ye7vyeejIo3K4UdlTJ9gOSwyW+bPsiPojPoPbmuO9FXK6ez104yLslNmcSo+?=
 =?us-ascii?Q?f5bXvp5kiq7FNomsmu1oBrszhTXvPGTJCz1NHAcoGKnGfgG8FSdSNOZY54t4?=
 =?us-ascii?Q?6+DkeiATR7phkRjpBClEVKY1kWKSE19GqtLllxZBNnAJXMveCtySA+uWZw25?=
 =?us-ascii?Q?0BuKdWLEJ5vA5IBt0UULOBt1aX9tMu3KaMd7HpZK/LhVwOgr2wE9WY9/i4WX?=
 =?us-ascii?Q?bwvi0bEsn8SsTihH4LA5rH9O9F+p8zA6e7kj+qiHzZOwzjXCoVRP1zrbJ8HO?=
 =?us-ascii?Q?GD4ZXyva7JTZ84zWPqqaOr4Cxe0fs2DS5RbsFI5i9e9T/uaiY2uq/J76wfbK?=
 =?us-ascii?Q?VQsjHW31E1twd4P67goz9cgxNAK2aWSPMPicWkYMxsgH91vWzuPc7AlvVTf3?=
 =?us-ascii?Q?vy6kD3BkPUL5KBEtb1CUM0nsQkbS2y+rX3txgTCWHFk2aGIiTjjQA9oVCT8j?=
 =?us-ascii?Q?ntcL0RPKAfHMuBShqfZX8yT2oIxwAhRh8YZvT34RXS32bdR/mnG6JlmZuymL?=
 =?us-ascii?Q?8zCfvYxSnQ1Aw6w9apNKz4kKRpWhHEAtclgRLzbkOsYw0F9Erg6qqo+WLssf?=
 =?us-ascii?Q?3D4ZuWt56VTGwsaPHCPm4WFp3tkjvnvTQXJ8kNu/BZ4jGmJYXHh2ImhfCagj?=
 =?us-ascii?Q?8A2YdnepcCK/hWXOsP24qv1spAEEA0vUCDB8UXk8mmVSlHBNOw5WmTim/T5+?=
 =?us-ascii?Q?RxitTxRJAsOk5+2pWr1u53vndTU1/8o0my5biaHu90tIEKGk7EdMTk0TFYmC?=
 =?us-ascii?Q?AjaI4ITeI0ReW/T96nFnfiYsEoNHd3NbuI2zJHVeYL5iaXObYog9Rg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZciwGTIRLGRMDwfnf0euJqRLadFTDK2BHFw3klXX5JHJAw1LJZbKbT1zOP1T?=
 =?us-ascii?Q?ASRjv0rZL3mpihFziugAZrYHYS9cj770syD/p3Ggy/w45x463ae9DgVk/G4S?=
 =?us-ascii?Q?OdXs848leAjxTL/5BYV0g3taZYPNSjKbkls2W/bA5gYi0FgxBE6onwn4yeKb?=
 =?us-ascii?Q?A2Pw4OwHFQc0FonscrDGfBDsg1RIda52PXtnsn90+vTYZOmVocfDKJtRHb4Q?=
 =?us-ascii?Q?vOO407nHmRTZHhkv3L0/ilVfa5iuac0KDO7TALvqaSpJapurBT6tvzn1gS84?=
 =?us-ascii?Q?/gwWGdqR82D0zmdeoBohPGB5yU5NzWQsc6dMD0DPSyYFOZ8vdg2sxwsA8T5Y?=
 =?us-ascii?Q?toje9mKnEzEHbVmgDYpDSMpMLua3D3zxHdzYymaJHn7jo0xaCnQ0UvD1/kCo?=
 =?us-ascii?Q?05EPwSd+NCo3BJtUpfAgFz7WcQsSfZeM7/ti7dNHJo7gbJCacdZ8IJbuCQ+V?=
 =?us-ascii?Q?C9LAZRg4aI5tdMlPVfBFBLzRJgWHofoCVCQfRDnr9MegIGtP2HM3ogJlrIhV?=
 =?us-ascii?Q?xuc9WsmSYzMtyIBaINEQxDsH4Es4Qu131JSLjglIj8Y9/+lI0LiajywnEo4p?=
 =?us-ascii?Q?VjQCABeh5VFjpv0OEsVYkoToQI3+lXpyq/8SEGZdOup9lLKnYXXLRnCGNnWR?=
 =?us-ascii?Q?qUyhbLaeCkKm0WXHPPVa3c9iXse+aiJlkwg5d+Q6I+hFoO2MnxbG9zD6wjEE?=
 =?us-ascii?Q?CLGp2YI4iibtdbKKuzJO7ypfPBLHH/gFRVEEGn4prjpaFQa6i2XjJC+HIxuy?=
 =?us-ascii?Q?vMIkdOEL3MJnNIt8ESOVQRuNTciDR20DdZtK2MFQRiSg9vxNn7Q7jb36hPmv?=
 =?us-ascii?Q?pL2kScyk+ebh29/apEG2f07yf2FrH4cEOJkhg6slOaYzDNjlXGTWCTHWHdeM?=
 =?us-ascii?Q?eH8GNlsg9odripvO2gqCE2uYvowCtRFVUjgpjVxX7LkBp/gzHF7p0q5RsnfA?=
 =?us-ascii?Q?vM4BlG5oD53DijlmtS3f68NqffEDv7RlWP75uFDOruxboVmjFeolbRgHZR1K?=
 =?us-ascii?Q?Xyx3K2kz+nXMKC4zVwN51tlAB/mPX4PvZYQ0tvOgR11a3A9CTUNv8ojCAd05?=
 =?us-ascii?Q?IWH0DBxhcrJg8KcVuamWT3klov/DJGWNNuW8P8BjIisN4BFJ6Q79okEoMftt?=
 =?us-ascii?Q?L7qkb0k/WaC9QtzUVpN+Ivk4csNd9ae4rznMpwR/KOomuKjdeFuBzp80WKL7?=
 =?us-ascii?Q?oPaLCGoYSyeUMeOqFKF+G/iXsHxdU0/lruOO3tDfmlVbQNM8tan5b1Nrdr3s?=
 =?us-ascii?Q?BUXYMwpzlGxd0SrYOti7OXYhkyoz3ccZXOkaqcqF/lsSmmk9qXUfRue8ylIB?=
 =?us-ascii?Q?n7I6zF4M/t/t3HuTuDK63iY2RLJBDtrqtuOXiCvI3bnpaHRP491h9SzgkDD7?=
 =?us-ascii?Q?LYdKOBZUFO1+ZPT2rJlx9IbgqrqJ/4gah9Q796GEB9Hza82iF1K7MMsc7hnO?=
 =?us-ascii?Q?g4L2j1PfuM/Mp6mi6l9zxCz5IwjWX8SlsKt58E2swizyuviIlvZaWClIezjW?=
 =?us-ascii?Q?0oAIw3ihPkqLEHdSfoWLeHiYihQnagmOZlEm2Jd+4qZf5k8ztbV5H6pBvjzJ?=
 =?us-ascii?Q?OiTOgWYtn+Yb4+wAB3ROZhOnA2LjtSQgfAFuxYmn9AkQX5bg8lMKLV/CWrbo?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ab394d-3b35-4452-3835-08de0b302cf5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:44:27.7321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3/JZadRlGLEIfXkjI90mc+0kBLOvUGN8JOlvS3AW+SBsC6pBXmn8FvTkV1qw2dBjOlj6YcOkbdnmgI7XVKDDzgK5KEL8g6lmXstTyM/AEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExMSBTYWx0ZWRfXxjhECM0lrRlx
 nn8ukwNGbZRP4IOqHbaO7nHPM934dZ5yl/wxcsCUA17h4SQ1NRglRxBvqOfrOBuDBnY6XxGypgL
 oogR96d4nQrTBbPzPN6tzD2ZLt8FfmG7PD3i5wxQkXd3jl+wLxDuXAxSPtMlQSkazt0PdFNVs1N
 4/ZiajjLyQvtNIPkIeF8vATcm8gwKYoJKH9Lq5TEdOVqbEtYC6LbwPfVLbcCOMxFCRIJ0C0aKj/
 y9ceUqxIPhFBmXeSjPisPWtUjQmYmAW62xE/wEsR7hKPtuEMQW/F80iPPuTvOlzCxeJL7mltzRU
 EDUkhz7zRayoy6jlv5LBJ3w4EDk9e2QbjZtSSTX+Bc2Hrg777ox4ur00YJ+eBHJtnIufZPGAzrn
 Fo5CTZWYkZhqnC9e4de0SZ5PE34Rww==
X-Proofpoint-GUID: ANaUv13Zuu8oDg0n7dMH7FGtCLIZ5jAM
X-Proofpoint-ORIG-GUID: ANaUv13Zuu8oDg0n7dMH7FGtCLIZ5jAM
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68ee61da cx=c_pps
 a=7v6vjeP3yXOm/Y6ajRpg3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=uzjaQC1v_Til1Q9DAxIA:9 a=1-8MW9jiqbIA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510140111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224823

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=0cc973160c23bb67f895bc887dd6942d29f8fee3
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002275.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-2.patch          | 145 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-2.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
new file mode 100644
index 0000000000..a9ed702170
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
@@ -0,0 +1,145 @@
+From 306ea7810f5f6709ef3942a7be75077203b5d201 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 04:27:19 -0700
+Subject: [PATCH] nptl: Update comments and indentation for new condvar
+ implementation
+
+Some comments were wrong after the most recent commit. This fixes that.
+Also fixing indentation where it was using spaces instead of tabs.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: 0cc973160c23bb67f895bc887dd6942d29f8fee3
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002275.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c |  5 +++--
+ nptl/pthread_cond_wait.c   | 39 +++++++++++++++++++-------------------
+ 2 files changed, 22 insertions(+), 22 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index a55eee3e..350a16fa 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -221,8 +221,9 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      * New waiters arriving concurrently with the group switching will all go
+        into G2 until we atomically make the switch.  Waiters existing in G2
+        are not affected.
+-     * Waiters in G1 will be closed out immediately by the advancing of
+-       __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
++     * Waiters in G1 have already received a signal and been woken. If they
++       haven't woken yet, they will be closed out immediately by the advancing
++       of __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
+        which will prevent waiters from blocking using a futex on
+        __g_signals since it provides enough signals for all possible
+        remaining waiters.  As a result, they can each consume a signal
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 1cb3dbf7..cee19687 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -249,7 +249,7 @@ __condvar_cleanup_waiting (void *arg)
+    figure out whether they are in a group that has already been completely
+    signaled (i.e., if the current G1 starts at a later position that the
+    waiter's position).  Waiters cannot determine whether they are currently
+-   in G2 or G1 -- but they do not have too because all they are interested in
++   in G2 or G1 -- but they do not have to because all they are interested in
+    is whether there are available signals, and they always start in G2 (whose
+    group slot they know because of the bit in the waiter sequence.  Signalers
+    will simply fill the right group until it is completely signaled and can
+@@ -412,7 +412,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     }
+ 
+   /* Now wait until a signal is available in our group or it is closed.
+-     Acquire MO so that if we observe a value of zero written after group
++     Acquire MO so that if we observe (signals == lowseq) after group
+      switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+      store and will see the prior update of __g1_start done while switching
+      groups too.  */
+@@ -422,8 +422,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     {
+       while (1)
+ 	{
+-          uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-          unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+ 	  /* Spin-wait first.
+ 	     Note that spinning first without checking whether a timeout
+@@ -447,21 +447,21 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 
+ 	      /* Reload signals.  See above for MO.  */
+ 	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-              g1_start = __condvar_load_g1_start_relaxed (cond);
+-              lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++	      g1_start = __condvar_load_g1_start_relaxed (cond);
++	      lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 	      spin--;
+ 	    }
+ 
+-          if (seq < (g1_start >> 1))
++	  if (seq < (g1_start >> 1))
+ 	    {
+-              /* If the group is closed already,
++	      /* If the group is closed already,
+ 	         then this waiter originally had enough extra signals to
+ 	         consume, up until the time its group was closed.  */
+ 	       goto done;
+-            }
++	    }
+ 
+ 	  /* If there is an available signal, don't block.
+-             If __g1_start has advanced at all, then we must be in G1
++	     If __g1_start has advanced at all, then we must be in G1
+ 	     by now, perhaps in the process of switching back to an older
+ 	     G2, but in either case we're allowed to consume the available
+ 	     signal and should not block anymore.  */
+@@ -483,22 +483,23 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     sequence.  */
+ 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-          g1_start = __condvar_load_g1_start_relaxed (cond);
+-          lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++	  g1_start = __condvar_load_g1_start_relaxed (cond);
++	  lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+-          if (seq < (g1_start >> 1))
++	  if (seq < (g1_start >> 1))
+ 	    {
+-              /* group is closed already, so don't block */
++	      /* group is closed already, so don't block */
+ 	      __condvar_dec_grefs (cond, g, private);
+ 	      goto done;
+ 	    }
+ 
+ 	  if ((int)(signals - lowseq) >= 2)
+ 	    {
+-	      /* a signal showed up or G1/G2 switched after we grabbed the refcount */
++	      /* a signal showed up or G1/G2 switched after we grabbed the
++	         refcount */
+ 	      __condvar_dec_grefs (cond, g, private);
+ 	      break;
+-            }
++	    }
+ 
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+@@ -536,10 +537,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+        if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
+ 	 goto done;
+     }
+-  /* Try to grab a signal.  Use acquire MO so that we see an up-to-date value
+-     of __g1_start below (see spinning above for a similar case).  In
+-     particular, if we steal from a more recent group, we will also see a
+-     more recent __g1_start below.  */
++  /* Try to grab a signal.  See above for MO.  (if we do another loop
++     iteration we need to see the correct value of g1_start)  */
+   while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
+ 						&signals, signals - 2));
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 15179899d4..732cb96f94 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -63,6 +63,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0026-PR25847-1.patch \
+           file://0026-PR25847-2.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


