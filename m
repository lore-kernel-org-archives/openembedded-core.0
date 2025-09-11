Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D94CAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 09:13:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41820.1757582035383414330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 02:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MEaPPWRi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13497fdc38=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58B66LUt2770439
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 09:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Gdx3tKQjy
	tifrOnl9lDW83rjShQ8bu/LfvTv96mVWV4=; b=MEaPPWRi1e4/NS67hl5twmKRs
	2OUkf0lFV5SWKmWYLuonJr95oDjmCxhbokvHzDbBn3fgK86bmYBqxjj3+SVnlr4q
	IzssULSa0oIpBvbNLQQA0/G7Oml2AtTkwlsMi5Vse5KtULpm8JtQgWfsxO/sSlNY
	NqN1xN840PQhMxXzMxi7XCqz9CDYNq/571t3VTot2JLqj4ygIMlN3RjHRh1U/XcX
	bC34Xg+60YxOB1h4639BFpLlROqSvWB/yljh/8cifbCoD89WOn2zdY6hNIYr4tCi
	MhhiKaCguWobNmoboTllIGqr4KOIGy3lWVCVEcYQiL/AjidOJl84CO8blmXzA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490a5w5pbm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 09:13:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FaDOQeliiyw/4hO4mqawQQQbBgZ3uf2lZ8zQ/YkdQQuw6klpI5J2a+pL0Pdu5VJbHNePoY+8dLUvU8RbyJmUo9srIgW1mqRc5U0xHZc6rDRSpgNjD5UFykOeoZdtlLZqI8JyiJbeo+UojJHgAEJUuQ/o3RE73bRg8N3cqZs1H6WLVhDxa8iW3b9nK2v0DydMq5oN3nU2HycM7xq7jTgtiWeXFsPuipZvlbvmYxDO0i2DRFu8Jfa9+xnQZlxZh/xRAf14APJpnIE7Ry0ltxw47WFWQhDFCNKuEtq2Nv0uCwow3NFswyIJFyencUx9a7pP7UFk+oT59LiYprPKeWtgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gdx3tKQjytifrOnl9lDW83rjShQ8bu/LfvTv96mVWV4=;
 b=qX1PSv7q/4gmwv/JN30S+GrYFgX64YAmhmNPcWlZphvvo7IlilWVu6VleTkahsSpIE+EakV2QfgjftqdjwZGT5e4OUGDZb2hgRoQSRASWzNo+/HUXXgTr9Hd8ZbSpodHthN9S4ByGB8CfwM+I2hjaIUGh09L/arpDrtXv2X6V15Ek6mpbXxmEF5nXFAAPVd7+TkQwbIwHWS9nr24PAK93I0m7Fqy8CJUCeMeOkz85Pnrzsxmn+CuWxpNp/4e9H33/SM2Mifo1Z56eiUfV2CepnZTBguYM2dp+b6Z+v7PNpxTy0riauMNQmCD9NPgp+Dhdqcq5GwCvam5rqzcFQkK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH3PPFDC3198517.namprd11.prod.outlook.com (2603:10b6:518:1::d55) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 09:13:50 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 09:13:50 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] binutils: stable 2.45 branch updates
Date: Thu, 11 Sep 2025 02:13:25 -0700
Message-ID: <20250911091325.35653-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::30) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH3PPFDC3198517:EE_
X-MS-Office365-Filtering-Correlation-Id: 077c670a-6ad9-4ae5-a334-08ddf11385b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?A546qBHPCBSCZ1B4+yL55/E9FI06TnB1fLC9OAX5nlKorz5L62FVPA4T9//8?=
 =?us-ascii?Q?7LW75ImYYOA3yoMLtcDzHKrPcRdGmpFGKoHrvTp7T/k3kshZLAYAjXWlxhea?=
 =?us-ascii?Q?czeC82uQehcs9WstdkCrA8YYOe/+Lx4Qr8EYK+x7QCtDsoJydJaZNrhB1PIb?=
 =?us-ascii?Q?oGedu5kItoIiyRdChqbP8THXAM1SOp2fYOivdZgp3C+mEF6yXfKhwrJuVafP?=
 =?us-ascii?Q?5lWGVZU0EGWQMkkwBjbZDjtTdUoBIhl8NuOmun6UdEaw7LWyTi1q/AAdy6n0?=
 =?us-ascii?Q?kXVFUx5Lmk1AhbLtmkiZ4cTijTtRa0qo/GSXjY5wy5mmzEhlxW6L9gajQ+nV?=
 =?us-ascii?Q?U/j5jDGY4DHzecXk5xcLUf4IEzxLqhpoc+OTJ+oSLM1WKcuctsq4Tnz/X0b9?=
 =?us-ascii?Q?Fvf6Wun43LFlNgH+hIaNMn/pIg7rQWVyiRqBbGJ6OoXB/QROv28gT5T6uvz6?=
 =?us-ascii?Q?q/+yh+VwuPi5O5KQEmtQqeu8GNq/PyW8IztDQ5Zpj81jVBDbsGPKzBeHSUyn?=
 =?us-ascii?Q?Uvhnk0n1/pF84zaTy0g69OfpPzYZVWWccHvoxRpC2UWeO9Gdg25FH99V/v1b?=
 =?us-ascii?Q?lx2IQQtXk5sOXIaCxxMUS8OuztvPfsRGqMac4jcdF1QbP0ojtSWoZcKRui5I?=
 =?us-ascii?Q?ojg81iT3gPmYr5iR6sPQwgXpAcBm0I8I7eLvVpTeeztje2Zwz0mhZ8nRKs9u?=
 =?us-ascii?Q?IBfJQrD/jpeuLFOAqj5SERA8MJi6lfSZsLHze8zOIyFaDqJ6MFD9F5MDKrty?=
 =?us-ascii?Q?dyckpG38U3d9XsNbg1mfrlrCJPtvsifCf0sUTNZoReB7EqPWpERlOOYa2iGg?=
 =?us-ascii?Q?MnNjaJ91gUVy1q63h0i/mUEFvocIPdNSfsBsirMVlMPoCi+IAaSJpSaoq9t+?=
 =?us-ascii?Q?z12z6wCWxdJbqyFpTNGciVujravayx4Xrv4WFnH2jXWkx9/0c0Yz9jV6G4og?=
 =?us-ascii?Q?0dsq3FMWNRzko+GwQ4/xq08KXdYkvAfz03o3Jn0pV9paXXCWRYFaPc22jmlp?=
 =?us-ascii?Q?GF7kJrg+eMk1sUwD7QpFKDNG5gn0yUU2cElEstnmfNlP5/D0LJcyXHQMHFM4?=
 =?us-ascii?Q?u7ULNvsZaql62CLakMPLp1SB74rfL/6O8ALx4PFpxc1g+bDHK736SiULHbcV?=
 =?us-ascii?Q?xemk4HSh1jD5yu6q/MDhDXeqX3cMMgSO2VbbCK6Xyjb7XsNxrfZdFXNOlj4T?=
 =?us-ascii?Q?AqJ6awxjJ8osHM7kcvAD3hc5A1UuVhn1w5+krvjbJgi+19j3Bjw/ymeH1VdK?=
 =?us-ascii?Q?SqBwd8RA41bE6BVOzWuN3xSSyTS5Df8aYqImcPeynb1EsAvG0dEkt2qMkIFy?=
 =?us-ascii?Q?Kq6W39vYtHE0Yic3wn3bES0u/Y8+8MoeELDNzPAcWHDmaBvUaul+/R8zXAIz?=
 =?us-ascii?Q?usRwzA3ikXJJAPsFzna09/uVfFMvO1j8qfPuUxjO8Hi9n1mADJXMiZbLLz4E?=
 =?us-ascii?Q?3c9Cf0KVFUJZ+FgOIekFFU0DZhLbr+Vf3S6qKCeUppTUPzdxjaGK1g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5k5+M0JWZbPJxZHz5ztyoBGgKAXHx4YfVtRia1YSiORFCqkKzkjEze4O5rkP?=
 =?us-ascii?Q?MhSaU+ty39rvp/tG2n5Og0l3K9a77TQPsrj38jKQoEyGknbbPRPSSzbJDLm/?=
 =?us-ascii?Q?/DOk0WIjs5rEn+6qWWSmf7OewxKapQ6RYnwIV7Hs9Y9cyW/ABK25xuuUMeRc?=
 =?us-ascii?Q?HrOI7BFgTUVqeESIfM05NEVj3junCPZl93vGiVEKc+VTcuKkiyC+odu/sMQ/?=
 =?us-ascii?Q?Zy193hEtOkLS91U4HdoejOMKrG76XTuK3Pt99urhWyWYNPMWEjscdZEBmn/d?=
 =?us-ascii?Q?W4PvLhckjNzJON+VDsQewRDqB6VctqREgxgCyPbQJOrzocaHldBYFOp7OjMn?=
 =?us-ascii?Q?ugnCbzHS2ZnCZZbyx3l0lV3FjDhLMF0hW7JEvWFF4R+GRdQw0W0S7gDZzdqu?=
 =?us-ascii?Q?T/0gwCJt5B+jVPvusW1Lfx1weqVpkNdDvOcSCxDHk7hkQEWFxfDyVcO9olac?=
 =?us-ascii?Q?g5aPYyzsX7203GSNWAeVLeRS4p104Pp7nZCtkBWisVHqhuLbcK8BFAgx5jSO?=
 =?us-ascii?Q?csLAe9JYqZHANqgWnZxyldSUeUag2lDkWCGPfyT3n8gJDlN8l5I/WWbad7a+?=
 =?us-ascii?Q?QkXssNEyzfg008H0LPql55lWpSJsArV+iJ3wIS5lUICJhNPu1fLjOG9owPDQ?=
 =?us-ascii?Q?kBeR6OaZ813h3ewTLP9iKRlf04ATzHXG8b4le3uIC9Qq4SJWswJPXOqfWPnl?=
 =?us-ascii?Q?WuWlF2it6eKTqiQCii8wVWbxzpydqjoYvqt0kQRezmYDAJcpz/cdyezwzaJG?=
 =?us-ascii?Q?oEIKEERBFGQ3fN/EYDSmesBv5cAp670jTAsM3v3M8I//rns+g2w79Fb/bAAl?=
 =?us-ascii?Q?jpwkkMmZnHK6Kza4apd0SckFSldSSsCOo2bnxsUTICESZYfGIsEIflkbbPWT?=
 =?us-ascii?Q?Rukx3vtPDSpYffqog/O1z098Lz4jawcjhWL3vHjfTUFntDJpUzW3Icon76cy?=
 =?us-ascii?Q?5+wMELCrWAUlzZPhqxfz7G3GbfVxKzt34ksTFg2KOWx53ZiY68yVXIFf1ind?=
 =?us-ascii?Q?PD4SBEkPvoIWdbIP3W7XjZ2MkD24/pq7MK3jMAs7OuoNr/nQdtd0zgoSH+h/?=
 =?us-ascii?Q?z8Y8We7rokz8obWfKunt4/gGGd8V6qRM/lEnXVJ9eC751bZe0OppVPCYYgtC?=
 =?us-ascii?Q?kt5bWpx6DiHKFnyfiIBEhsf0yMHhy5/U3NMZkL77ufVIHCB09PlK4j/xCabD?=
 =?us-ascii?Q?AIgfDB/V7F+NMURd4mvUOpHBLk84fryvYpFi/YuDjWoDXR/gACDwKAPYw2w9?=
 =?us-ascii?Q?3UZxHE179Yw8SfEXuSm5T6Gv4iBM1hH5rE7p9wHa4DCMSJ1saKPGAsTpnuxK?=
 =?us-ascii?Q?zjpttAPc/AEXPX39Yn78nCv9cPWwJouf4Q8aPxb6vYWFhGtUW5oyphPfw0eW?=
 =?us-ascii?Q?t90OMIddFJ7KDDvJMRkgTweca9fjbmsYhaoCKBvkzDrxnhEF7zNz2vRUIZUn?=
 =?us-ascii?Q?dC8odLhSfDxcqMs0OLfpkoqhCZTk65OlFMC/rO3crqLknkZwq44TNbWYagpH?=
 =?us-ascii?Q?IRrh9aYFJKsGLT0R7EOeotq7CJyg67+GAV0tdqYGx9A6b9mhGzkueJEOcoln?=
 =?us-ascii?Q?qgylncP6XepyC1D11uDh8XYyH9iqtKtapsQiiRpMBMUI+Q4LxbJxA88uzwDO?=
 =?us-ascii?Q?M2HsdW8Obt5qz0YA+kqo5MU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077c670a-6ad9-4ae5-a334-08ddf11385b7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 09:13:50.7823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6xHnkfCYl++q++jLo4PVKulNjE+MWzZzwdLWelH0AnfbgYaXk5CqmjwOmU5z/yMnqsht5jgyI6gaAM8GhT/q09rK+9DcTDN/8i9/8sM9xnIHJGpDhfIB7HitRNakcnL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFDC3198517
X-Proofpoint-GUID: IzrGtbir1lGR_BYynkT-f_RvmFI9C2Ft
X-Proofpoint-ORIG-GUID: IzrGtbir1lGR_BYynkT-f_RvmFI9C2Ft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA4MyBTYWx0ZWRfXwtvbBGZHjXmg
 /6GqdSdQ2LuaAG9S4lfMB3VrtV8WzkVjNVHQtgvwuhG1HVgvxo1/4VNhX3vST9vhPDL/cYe7iBU
 UOKNpi1tOJlGD+i8LaX5NNrV9pqgvdF0y5Ojl8tvsTt/FzJ48rRagMmPO9/1poMRg7QL7efa7H/
 yZDmwt1OHLU9KUMsV3k2fO7mBb8uF//mHdTQpGT9fY7Z+82bRO27RkU/dMbZPbV026d+nVmANRa
 4br9JNxVLmDxkNw+cQtq9cghD6FeZAGsXHf5fWBx5jI31NJMs87kbtuKwxWeievvshBJhys7+vw
 73G2a5f5XFx1Tm7MO1ET9P30z+NykMV9O0GWHHve/90sPZwKAUsMOKNOrIiKng=
X-Authority-Analysis: v=2.4 cv=AMtZH25w c=1 sm=1 tr=0 ts=68c292d2 cx=c_pps
 a=F4q/CHviOwOXtz23f/c62g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8
 a=QqXjj80mqlQoAIsdkKUA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 09:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223265

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on binutils-2.45 stable branch are updated.

316da476e61 visium MAX_MEM_FOR_RS_ALIGN_CODE
b58f54a9bde strip: Don't treat fat IiR objects as plugin object
a71a4df76e2 strip: Treat "default" output_target as unspecified
96114b5c147 strip: Don't check target_defaulted in input BFD
2b2e51a31ec libctf: link: rejig lazy opening to not need weak symbols
ae8c1b4241a libctf: don't run tests requiring deduplicating linker unless one is in use
e54a1de9515 libctf: exclude always-emitted Solaris symbols from the symtypetab
32830073ea0 libctf: get libctf-nobfd.ver from the right place with Solaris ld
404cb58a92f libctf: do not use mmap on Solaris 11
99f48156dd1 LoongArch: Fix symbol size after relaxation
d45e8bff0b4 libiberty: sync with gcc
b09f71c1c46 Re: resbin: don't pass NULL as printf %s arg
72d7cfff264 PR 33229 nds32 gas segfaults on gcc output
879eabba0fc Fix more unused variable warnings
29996106c19 Fix unused variable warnings
5541a7e7712 binutils: drop unused note_size, contents, old variables
f4290b25097 bfd: drop unused elt_no
2a07e06e269 Re: Re-enable development on the 2.45 branch
ad8cf343ab5 Re-enable development on the 2.45 branch

Test Results:
                                 Before  After  Diff
No. of expected passes            315     317    +2
No. of unexpected failures        1       1      0
No. of untested testcases         1       1      0
No. of unsupported tests          9       9      0

96114b5c147 strip: Don't check target_defaulted in input BFD
The above commit adds the newly passing test cases.

PASSed tests changes
+PASS: binutils-all/x86-64/pr33230.obj ( --strip-debug)
+PASS: binutils-all/x86-64/pr33230.obj (--input-target=default --strip-debug)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.45.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index c69b4298c8..9c82f65eca 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -21,7 +21,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 CVE_STATUS[CVE-2025-7545] = "cpe-stable-backport: fix available in used git hash"
 CVE_STATUS[CVE-2025-7546] = "cpe-stable-backport: fix available in used git hash"
 
-SRCREV ?= "2bc7af1ff7732451b6a7b09462a815c3284f9613"
+SRCREV ?= "2f028c6bb163a045db95439fb92e1dcbc919413c"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.49.0


