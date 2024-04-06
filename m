Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B826CD1292
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 04:41:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5339.1712378514393815128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Apr 2024 21:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dH0TyRzx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48263ef7ee=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4364UJCd007148
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Apr 2024 21:41:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=SERByuskF8Vwi3v57oaxdg0ejxEIJRCx0nD6r1XsRwQ=; b=
	dH0TyRzxsJ47EzNazvWtEu0scCtP4XbCs2HcW0RN/odtURDbNhfYQktRbVbRjASK
	lnkyQQLot6JJS3GBv7PSQfsLCfcu9crMtHEsn4oPRF3YP707qYxqm6nV8IZKfedU
	Rmng8g4IyOdy0q836zp0vTaudbHLA+LJZZWI5j1Isff1OVPz4ro64ImzaZUauvtV
	HP54n1+sy275aupbl2KiONvff8hjdX68Dezrlw1StxWVZD38CvxPdkM2sOAyECgy
	Yut2mCscITVqXC7zEpXKikdUPjYi/tO/M6xzokGlQCePNSl+gmUK0oKvxF9nrDeH
	Gr3TsVJEk+eIu/XbUnhjTA==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x9eqej9p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 21:41:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1FGynDp6kD+dCKQ1D3aBTEKCsdGARaN8gqnYyhzu4XduUwe05xkhwqZrpvVjh0QplQanZBZn823iFuFG5M0oClG3Oc5Pr3vmbgFYgNNCRw4rKkAq8Q/3f5TIB3Oa8YNv4pgIrfklZx7/S9hvixVXW3yntxCQnqnEbmBqak97WQXyHKniWCAJ6/C7VIvI56/72W2jTgrFGYpOYGDjwM4lTAYukXFoHgyb869uc/ldmpESTu8rPTD3rWZXRlhP4Kcd+h9FiREVZ5COiikZHgca4vP3saG3+HN98tG5k57OfvZPFBjVZHu8bP80ioijEjCGcIFeQQ8dcJN/+8i3DidNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SERByuskF8Vwi3v57oaxdg0ejxEIJRCx0nD6r1XsRwQ=;
 b=fPFGqMbHKm+0y2rFQPN9vrfeIxunk0oX3/8cZlVt5+B/Ep2xnNRVi7coSiO7nGl26yf0m0bNYcARXlPZ8gvrsk3MRG/08bOH73jT3AQ7ILcaupFZey+/ivw33QExUr+o0bizwHISNMq5AQKaubwt89Kc6V/r/glzCN+qJo9yjnBRP/jYhsGsJzfp/pwNn/EdvjGFPbOqjkMWLxo0z7Xui51wvHI+ygbGpXNbAzSvKrR8CF/6ryZEJ2jCbp013Vvq6fD25R0nOSdlm9BvPJAXVk2oniEh2CGBJIrc2ANKdtU5C92ZRXMvKPsS+DSe083cL/DbqwUmbHGT/oDyGNbe1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Sat, 6 Apr
 2024 04:41:51 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%5]) with mapi id 15.20.7452.019; Sat, 6 Apr 2024
 04:41:51 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 2/2] ovmf: set CVE_STATUS for CVE-2014-8271
Date: Sat,  6 Apr 2024 12:41:29 +0800
Message-Id: <20240406044129.84784-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240406044129.84784-1-Qi.Chen@windriver.com>
References: <20240406044129.84784-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::18)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA0PR11MB7837:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aCnOd7g7yIn1TjORP30zh41P2Keqkb0/GWIwmZlYriO8LEs+Q2WIb9SctmYi7+rRPYJ68VilmuHQmWZ5sAabR3KdDTffSMgigJec/J9M1zFoBCKS+IhRnOCZi+fFlhhTrCJht3Qu90/ZrXANq+CCM3DC8sPWZ9u22E0BVkDx9ftnaVv1v3yX/HFoYBSz1MPAxUJqEuhf6545A1Lk9IOjERozBB5lv4bAlQFBzTunOPgs+NB4i1mkLuFFqtpAgtzZSOGxxUuxcOPbvgM/Petn6f4qoO8Wo+h0TyyVvpG8ru7o5u6XoKfkj1gw5xF8Gt7PVV+Q/Ai4KJ2ZSZiQ/lXe1rUiy7HC342g2Li+UkfbRHMDXjbhi3wJxx47+921REsRlCv6YYlD8L8ywzPFHEJy2RwIuPqp/cZQ0NmqBrfJYr6uAhdhFUdCrwg1J0QCPhpYyWmQJlRcZuQkotmB+0AV9l+u3RWQ0JTydOQSjF/3th8KVXaDiIdXyT6oZnccKiszkb7GEKrvyMAxBJUhGRGR44S1e7bl+IwTsWcvwvfvG9cmEv2ul14UQGmt7CLa2hwS9YwoQi3cd//gVoESGwgRceFgCYzukYo9RQpn5eAs2hYyIVurq3406hd891H5t5hmuiAqMj4kJeTrTEoCJnSTB8fuDYM3PuOLiECbl9DrNc75hvXkp9uQtZGfyMNhR3LD6nyv/Q/rjQdwmqfASNHijyTnMqsmaKWE4+SR3qzDzto=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x4LdCnCmYYvt9IZ5SHlTfZw/vaEm6jONyQF6kaLrP/fer2O0QTYeJG+23vhv?=
 =?us-ascii?Q?B1XPl1zaPufPPslYXS/H8th9GTbAMl2EgtBdcfBMoNB0j0bXtMExIB14Uxl1?=
 =?us-ascii?Q?EWU2llEhgu1AFHG6UwmjQjqqcuRbkjuQH7nTQx5E5mr6JSiWLljuPYYMUmcH?=
 =?us-ascii?Q?url3fkxwKX25AL76bLFLe4+q2/nRgeLJQh/vDRjSsBqIYi2ezH8t1y9D6YuO?=
 =?us-ascii?Q?6DxMzNP7QSURmo8nLIdacFR2JqYpbqDkhD5NJx7eFFgxKhT97zrkIAfny150?=
 =?us-ascii?Q?AHxDlIhWPFmyz59DzuOVh/uUekyKjWJ/++4lFf6vALVhMlScdVYpM4g0Agmv?=
 =?us-ascii?Q?aY9LGbVBJKu2aiEmh7c1tJAC0frOfY1iFa5dRAkwkrVWiFV9IMSn4bc6n111?=
 =?us-ascii?Q?2xr7xGBIRdU95oBrvRR/vcBZN4g9wTjoRvbJX0XNbUYLGGtOJH1+G6+ER8PY?=
 =?us-ascii?Q?Jkm1PHyYL4w0xsMFs2IFjFiclXiw5rcPSaTsqCqJgb7AA7f0M5/Yp/kFNxSz?=
 =?us-ascii?Q?1XYNFUE5KstovdEm1QyKS1AB20v9ZPQCOZQ9wJ3100UTKk/8B0OQ/YuVRCoi?=
 =?us-ascii?Q?kGQiC315p3jKsaJXqDUDwZLuFddGH9bleOsnxdEmUXfJ3IDucjbIYldBlgmF?=
 =?us-ascii?Q?KRytZEhvA1ermueoHNrE5i2WBl7MBEBsI2LYaiFNbiLAMBUDpUcQXckud2dW?=
 =?us-ascii?Q?pSd9Rm1l1HGMADJR0EmS81Rvk2bUrhGWfCL0WIXDLFutHwYGglqre6DAQ/NF?=
 =?us-ascii?Q?gIUzh3vzxsT4aeqe16x1Is2pf9Pgl3XkeI5Gx/8NZaZsdpJFTF1zdP6rsMPr?=
 =?us-ascii?Q?pLf/INYJBz8am2BJkM5190T1MkkvSRJWmkkEtY+9GtQ9M/1E7Z/B4SE5AEGV?=
 =?us-ascii?Q?4tYiZV8oNsrwSLjr7s0/R4zzkxjRscVaRdhYK9QlDym3O4W8ZCIYobuUxoj3?=
 =?us-ascii?Q?b6z0U7tbsTEc3aR1A7Y+dzfQBaqb70u88ulmGj+N4YS7J7h8Wf8Xy/hVorAY?=
 =?us-ascii?Q?tlkKPCXDP97NMx5HRe0c3yr/T5TolIOGdN3d21Yal1nlZxnI+cXk3FnzR4l9?=
 =?us-ascii?Q?fzt7IKZ5L58trY4ZktGsdFgFfD88x/k2VZFPSOuR13lZLev8JNrtNyHhy2uZ?=
 =?us-ascii?Q?CkkU3Oxy8IkxYAO3AmT6JJnpgdMViOA8AWB0kEiDW+jbpJQ+d2YQjCx8jTe0?=
 =?us-ascii?Q?jh1XHq21hCFfAWJj8RI04/iOcKuHQbHp8tgiMynu8ScLPIlsUTJNxzdWtQF6?=
 =?us-ascii?Q?iUTLslxYS91TY34Uc0AxOGpCu7RAoxqxZgrFoctvdszHq2Y0ctOmBdGwT4ln?=
 =?us-ascii?Q?2YI2MamWpv/3sW1mJoNYKHdl2YcsFTzYYCWE31yahAhq+yZ1SZITtYu+fvmG?=
 =?us-ascii?Q?dz94ipbnfCDIf7mF8/ZoC61xJ9xkebOOx/yXLCwY1MCWhMLcmqEHM0PDL7e7?=
 =?us-ascii?Q?UofK63XoLMIujFH2Zyg42q/9AD8PFN1e5iMfISCKr74J3W+h35oK4Ibva46/?=
 =?us-ascii?Q?rzKVhZxH+4f6NsKu/SGuf03JG8vRrZyFACPIxKSOUNooCwCXsQT9zVPomgP9?=
 =?us-ascii?Q?UFVfxdXCgC/8KyJWBNEkk1RCuSFBtgrWAlSazZ6O?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afecf505-7751-4d55-190a-08dc55f3e045
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2024 04:41:51.3224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55BU4yd4mMbpEvqaeEDWuieanfcao3IgtPsQS3snk88vRJtt6DdVKVXV20Ymj/o3yxEtLmZpTMpV0b1BoXSnPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-Proofpoint-ORIG-GUID: WOqr9_Yv1M0jwjNSQQH56pH09fdVbQab
X-Proofpoint-GUID: WOqr9_Yv1M0jwjNSQQH56pH09fdVbQab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-06_02,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=873 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404060033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 04:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197988

From: Chen Qi <Qi.Chen@windriver.com>

CVE-2014-8271 has an unusual versioning, svn_16280, which breaks
the version comparison and gives us warning like below:

  Failed to compare 202308 < svn_16280 for CVE-2014-8271

The fix has been there since 2014, our current version has included
the fix.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 5b1353b8e8..f98cec8035 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -33,6 +33,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 CVE_PRODUCT = "edk2"
 CVE_VERSION = "${@d.getVar('PV').split('stable')[1]}"
 
+CVE_STATUS[CVE-2014-8271] = "fixed-version: Fixed in svn_16280, which is an unusual versioning breaking version comparison."
+
 inherit deploy
 
 PARALLEL_MAKE = ""
-- 
2.34.1


