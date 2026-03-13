Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFB6106ACEB
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:59:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19253.1773417586924280774
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 08:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pa+LM4R9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D6lXnC202299
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 08:59:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=7Y7C7YmYjCd/8fPcRSlrXq1MXHNxThCEW5CoOzltxO8=; b=
	pa+LM4R9aKRVHZyscwn7aIzXXN/yyQzs2JSd/U3a69sC8zXjtT2C0YkzJaQID6iB
	mRL0+VHBqXtFbID37vXizDHqMe4eH508kz5SOKCmh2eMaYpTc1el6EyYTjJPOaw4
	hbqplp8uAicD6IAohHJp4DUzgTTiQyQtsj3jjbW20TLlyKUlpo/87iHV3q3AJUI4
	Fi2AjN6EUebplOPa5y3SdfQtludiSjis1IcHN5t8j9dgSIWrpVMi1Han9sc1RVI0
	2qGaQNIUOONt4ORJ0BOLAYuY9+Ir+j4bYuF5QC9rCJKz5GaxevbnjlAKClE0lIQG
	kTEkAQhQReOZ+/2MhmuMAg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012062.outbound.protection.outlook.com [52.101.43.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6taa9v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 08:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRlqutH7P89kqQ2dJbcqQs3KuLitSa8WQoBpjstOuH+qWWP7O6NscdnBnj+RNc7WRXEJ/v7NshrWd9wCI7d/IU3lVomsLTw3TxP2f9b/o34Ye6lWeGGGWTOznDKKXWhFX76pkBydxgLTBW8Db83sVU8mnyauOpDUJbQW80CVXFWEIrC95zE4gTs5WYy3y+4mBoSZJOcjUqAOsKIg274tcgebBNLsOTKSrX1vJgVAXOgG6HqPEu+5l+GE0E/CsVd43Za/kkMHn5xkC998kx/Se60+xNmF+uoGDSb3UZ6Pf7OKQf/xCEMP5T7dEmNrQ4SUIAnZaQGpxH1BY3z3uFqOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Y7C7YmYjCd/8fPcRSlrXq1MXHNxThCEW5CoOzltxO8=;
 b=eLRez0h0rUiRtO/Fuqv+2ZvhBmJrtJuPtRhHm1rAP7IDYxD9migj4TDgxPrlK4gS3JctPyNGpyricFtvg7eGqxYXdrTAN9/s0Ox9BAGPOfOijfi8qEwKsoAFx/QbwQ4j+2nkr0YgdLmZBTpfKcD64j97Z2AFVZRTmlpAarewvNV3a3XMVnxB6DsqxTtntEIFVg8yecdvJpJqr08sVaVThHmYZg57WfGcT/BPjZqmAIbVClT13WvbCZemrlZNHGKuKDbJH7Wn0N9hAIJw4QNW/o9u9ELR8AjA//JhxzWq2b/qM7yu8JWMDNqj8tDGCt2te1Jfe8nkJikqL99Q9NBdmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 15:59:43 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 15:59:43 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 01/14] kernel-yocto: Enable rust in kernel
Date: Fri, 13 Mar 2026 08:59:07 -0700
Message-ID: <20260313155920.2347101-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bdbb024-ebee-46d1-d73d-08de81198a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	UJPXfmLuqDyzyZQA1NQ+eC4PR8hrzFQW/UvQanXk66bjzM1obVLqsbKt0WKFIb2SrgSCwgTGX9s3r5OT5BdN4lWhv6eX+v10/XLCEstNN404S5x7XGwzBUjMUZWqVyTjHw01RuLxmhqEhq1hl4isOVcJBGCHwNJ2Ye1H7PVF6oe1OeeVMfZzMfX9TW/bD74zQRD5pnIn01Jplw68QHcoECFjYDZTiKkX1Oa6WW1RlwZxWqm3s6dJw35quWHes4OTzYOkK8k14CQ9yzK0E6azWvnSYp2BCEpNOM3MN5yHox99qlQpjLEdgmusv8eW6dH0J/W5rdL4IuO5Kd+ud85dnCOR82friVo/5GVsKJ0KjXjbGuT29f+nyGnzbMxOY3fUPJ5pcrIpCS8OGz05stD97zsgzUO0/abIcQ4f+eVmsFjOJEtYNlb0euNH++bB91fsgu1f7G7iW3g4VtLnJPM7ifpVFkGxEdKPQoZds7ZpGe/VYEx0gOHsmnV4C5al7guCmQewTjQeKjDKEAQejLAXdelQpuqzwPMH6r0g2Jvn1PJjbj0WpWyID29BCiYtjTlJrq5cV+9pa3N5hsjnqAR3AXPVBaaDK1euKe+S5PVzwdsGKkx0jmxcQ9QI/JoxWsm1YzjAPjtqCQuzhAPJTcNS5OoMh0w4ufE0sSG4/me1fSZc6whlzQkQ6PwcWUJsagYe6ytZV18mubhVZ83T2iYWWV5itzPFDyTjKvE6f9ilN1TxNDS8JlygQczKe22Rg2lKy6mrohFNyTcUe1dJUTRd+GX2ZfM/ttlVIYHFmvCF1zE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?flvkVTyf5mYBRu4+shvzdp9R/U7CsXH+S44Ccs2nMUwTm+dJ3D6Ph5RuaD+7?=
 =?us-ascii?Q?heDRCWYg+HRz7eRjRVX/RFHs87SrE6r/mmREGlFo3j+cmsZ3LE9TMM2f+Wc9?=
 =?us-ascii?Q?nvX5Kq4HmFpZi9RIrAjy5tE/aPGofUc2a8hvnlB6gLi2XDzYP841jansbs/2?=
 =?us-ascii?Q?X35iCx7RlLc5mh2PlBxj8Vj9nkILJ8F+gWEuUIe+Q0EVjIEbkBAgbichRmjB?=
 =?us-ascii?Q?JAdIcirbUlnNsvS/orvp8D/QOA4Vl1Z5gku/OL2JypRLRHzmkrX7ZiHnyB8N?=
 =?us-ascii?Q?1/BOymsg0eF9VXK16brMJkySw3bmcuRwHhLYBQXSXJ6VEcySWjWWlqAvlaS0?=
 =?us-ascii?Q?41Fx8cvsA1V8zcJnW8MlMYWoTGAQ/hL33mdsNmOKmXHHbNGG/jlWfLxNENqZ?=
 =?us-ascii?Q?Hy1GSKZxntXkxGOfuyGPHcG9hWk0e4OAnQURolFje8DXRJ69fDQ9zB9ELzeX?=
 =?us-ascii?Q?dLVaC0/+JxhKdBYtwHo1CgPEC3Iz8xsrnqFYeXprR4C9UaZnQQS8ptzVrZu6?=
 =?us-ascii?Q?dwXNGWPkfolkdWSi9j4KrJlSKgQ5//5Hj1K+uAEj6/h7IxNYsxdZMs2UQgJb?=
 =?us-ascii?Q?3zoVvKCO7WldkmlD14+1+HGFZcNY7TvGhtR2SQz9iU8tXo2L2IyyD+DjgQbs?=
 =?us-ascii?Q?R7EYwans0Oy1THTqabHWGPfK/MPlklRIyM1xWIBlgw4MKa46Glq5HvjWdlVe?=
 =?us-ascii?Q?fhaiWFHdVdfB450LRcS9UaGvr1WJUislxFgANntNJczzhtn3dkCGAWUQUX7R?=
 =?us-ascii?Q?kN4KsmQRB/3FUlo63CcHyrEhnSRBqpzcQxTT863WCW8fEronE9O/bgMDc4SO?=
 =?us-ascii?Q?MzWePNzuj+m5UA2ArfG1jOuaKXYKSpX1SIbOA+YqZ8bRRCRZu0iEK8AuCJAp?=
 =?us-ascii?Q?iVvZgOn2CXibTb9Bzt61tlDsfurfGkObyMVz1ViydJ7oYVrsJxY40PfZSLwt?=
 =?us-ascii?Q?hWgf20jOSf5npVyQeXfUluD1y4nzd3GDQ9g7AfMAG4GZFDwvvG0onVmdGLV0?=
 =?us-ascii?Q?cLaRjzb8tC0GlTlYbdyQkE4OJ9+D6iZw6LUuhjNKtVDGgkJbDN9aBmasRcb7?=
 =?us-ascii?Q?zniXgpbdBAOgry71yfRHPhhNvY+w6M26La4aBztJC24jYKvKZCccQSChNL24?=
 =?us-ascii?Q?n27bWGKX4/LCz1DyRE2ItcPGprPC/2UIZD3WofmNH1cZVpiuEF1H8olyqNFe?=
 =?us-ascii?Q?+A244o9CFKnqhAFxq14Zgw3vAiQNQ795wvtx8AIxto1lg6mqCasMGJ5pW7Fk?=
 =?us-ascii?Q?WXBlIgfI22N/mNbtp0/SpFH+l+qjEddYDOVAGIpLcp1lTXnBKCJxbfsvDPrW?=
 =?us-ascii?Q?+mN/wsNomgOZOPwOSYS1IcgQ21PraHfwYml3LATDncM2tLCcBDdK6Z/VyIXX?=
 =?us-ascii?Q?rnIQPRdjVKdIzS/20FJidP/6JfP8U/TisDXygll8eKelrYExYZIRIgvJEXTP?=
 =?us-ascii?Q?S5r4bINzb4pDDXJrt6S8gXm4gwo4udWr/c9ZdIsrhQohmQoMp6fkIQcRsW0U?=
 =?us-ascii?Q?VORd2dJu9+/Zutvu4buWmOgTx+huAEX7+64horvhqIDdP2xwgDEYPNK9ml9y?=
 =?us-ascii?Q?Hqp3QMbX6IY320e1pufnSIDskk/QnDzWd8DfDWZtQRGyjMErWS3bYByGRYji?=
 =?us-ascii?Q?uNVDnLAWl3iVotdCgy9Il7jwvHPwq5J2fDR22+whrmh+GYXP72EbYRDzFa5R?=
 =?us-ascii?Q?blIrDcdknVzjDaWYCsaC2vJwkIZ4HGzumkJcft5KMpGz+XjN81qdTglKOLhD?=
 =?us-ascii?Q?1ejgtDQNHZRL3vbFsP3Ehi3bIYEKl38=3D?=
X-Exchange-RoutingPolicyChecked: 
	LtP38ACCqd10VXsWtdn6YzklqrGicxdxma3KUiHQsSZg/tB3AQ0kKJaAo/JGW36sWIyQNdOf39T5WK9TF5tqT44VP9z5TE67FnJYcJSL5UUc9ikIkl+louAm7M3YPGmd8+DNvXZMgbzvE8LrVXxUS16S8+sGrbVnjzCSVROmAixKj9/dPHjohcs2lhFP/jfI9MAWdyN3D5TyjyhP86g7r4I3J/UXIgN81MiqiUjnl/oh15LO830LC0k1TDTCqfqieotO6hlXdtgqZB1Zyw2lc/i7/H5UvrO9SFoVvMYHxKCr25EvZCtRyv9n6qRUeNGsxNLqST1mmbyB+e5rRHvp8g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdbb024-ebee-46d1-d73d-08de81198a47
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:59:42.8551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hs3pOoJmbGBt8RMik3SvmeLdieJ03vPHBPE1lt/NxRu6xO/V9Zrm9d7XF/Wug6MWYZjzLe2WXkX2913AcPWdu+oTeCZof10LsCAbW31sUjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: KmKTLOf8msC3nY9SZqy_HoQ7AS_WNXim
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b43472 cx=c_pps
 a=qMfGPIaByV4ZnHoTJsbowg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=F1PtkKe78JTNANsRMOcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VzAc4CDz6FcdHJrI_kRFAu6CLgXUT1ep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfX5V7UFTNOc533
 3srgg7Lwm5jMFlnhXVxdj+ss9P0us8PzOoSs+wW+IBOH2G8eXVY3X/0eihXeab6vJaMmP7J/tT4
 lbNKv8rOxVbAbT4kT5ovZrXNvxlBn0asWM/bScC7ttsPiTotrmvbgfiHm4dTnHZL3FyB2Py1VSa
 nuw4VAvzp/9PC0q0dbv8+2s3A4CvLnSQo0ARI7lE9wq1yxK8cJot84uFu3T/7nOQjr0oX0rxUd3
 9zyy3YsC13LzR3WJzVRLDOeHQEcHZeru8oYf5nfcbctDBWgvbLLt55EPQRotgLFIAJe+tazjg8D
 1OCSf35sc2Mpq033DZCJ4F8SxotjTxncgX5K82r8r6LCMvnNEQJWtPchMQpL1GZvfMlTCeCP38W
 BdJUBPAFFFCaoDjdkqG10WikeNfLqq2bWEuDP3gagUp0F/PBLjT4d6ZFLWsUYpD8uHOWAyypAv6
 hCm+PX097yfCEKW3R3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 15:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233047

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Allow enabling Rust support in the kernel by simply adding "rust" to
KERNEL_FEATURES in local.conf or a global configuration file. This maps the
feature name to the appropriate kernel configuration fragment located
at features/kernel-rust/kernel-rust.scc

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..a77f2214c2 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -269,6 +269,9 @@ do_kernel_metadata() {
 	KERNEL_FEATURES_FINAL=""
 	if [ -n "${KERNEL_FEATURES}" ]; then
 		for feature in ${KERNEL_FEATURES}; do
+			if [ "$feature" = "rust" ]; then
+				feature="features/kernel-rust/kernel-rust.scc"
+			fi
 			feature_as_specified="$feature"
 			feature="$(echo $feature_as_specified | cut -d: -f1)"
 			feature_specifier="$(echo $feature_as_specified | cut -d: -f2)"
-- 
2.49.0


