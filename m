Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA772C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 04:03:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43581.1747627403051484323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 21:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=72342052cb=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J3qUdh013056
	for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:03:22 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46psykh6ek-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Po3S0YcUl7ITMjHyBGBb//KQMcK4djy/4OnqhO+0RxDHqtM2wiXzIW53TSr6RD6bUSW+3MwnDKvlTP7sTYR//W8N9zwGJVsaWjqe3Hdg7Yrxb12V4tyFzTDSD6R2y2m/3otSnSrFTg4Udsj+RbU7YVjeUln8l3lX3Ue7cmOYZ5fWhyt3bqN4DasXg5jUw3yBnAGU7FOodJmGXY73ciTVPK832vbJ+X6hBFpC3q+OyWdIwW+Vlw7cit0uWiLqn6GgUZGNkyLDK5hm2BRfTEaRBxtrRmumNbRWLLJxW/g4kgra2L8gamacrSQt1NODeshrRONun583GFfGhfbG+xTc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSYihg1H+PN6Nm3K8X3A16i4QBQEsg+lPMnCng/df3A=;
 b=il7PCjHOCY9PKOglQtsZ0k8Cml6viTQOoXcW3OenVIKpoFGsEY3mJHaFGe0FReK7kCS6N6JcGAkXeFwx+ICpaOPldgj5GnmOgKFK84cnDJ1Q8nfe3G0eOuRz82U8RB6sEhjA25Mp+32w7c55oeWsmGK+PlXARzyxRZcq54JUvGeOdapk61luhBocAm9jnHs+quce1vsfajm5cHXEqfoygcVytqPSPceAqOP6K/Pd+eXOrPjvHVSiPL2YLLwmhyY0rcsateb1FryXgPAqDz9kLj/t3mTLzU9Ksa6F7g6snc39FW5AEFDt3GFktfEYnOXcU4U4wViihefCvWHbhiKcXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Mon, 19 May 2025 04:03:20 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 04:03:20 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH 2/3] binutils: Fix CVE-2025-1153
Date: Sun, 18 May 2025 21:02:53 -0700
Message-ID: <20250519040254.1275538-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519040254.1275538-1-sunilkumar.dora@windriver.com>
References: <20250519040254.1275538-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0108.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::23) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PR11MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c9b851-4f61-4f9c-0431-08dd968a1754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KW4syyUycf27KTMfiTdrougFIDxbLy9cUoHBDz0EzOaSsYaru0GMLrWFUhM4?=
 =?us-ascii?Q?KJuOS4JqSdWsD9uqtkGagrssvSRtJoEmANkcvjfqvT6F/mj1dcTam+2otyhW?=
 =?us-ascii?Q?h3dR068n09GfKesDG1iKeTOyX9kBnP3psOptt4gbqxU7ddcPTYXDMvDsHbxU?=
 =?us-ascii?Q?1AoXzMHJT/I6I5pdnms/fOZ3W+9+VfXZiMtBWww3X3PR7Aky/4267Yj6NKCv?=
 =?us-ascii?Q?WwKj52TgneqzOPk/aUzp5RUhSBWEONDdMlpHwb01fukVtQwnTm2wnhRU/g9H?=
 =?us-ascii?Q?Daa7wbpSdCGlKwpGDbT01OgPoVL16DTwAKU4TQmeAucgBUCa8IqckspZeLwf?=
 =?us-ascii?Q?vadCDfYnfo0nAu8uZc4GcJSm+Tg3RV3lpPAVEuzfU2exWfgxpUAYMaH191xY?=
 =?us-ascii?Q?ZZHCozGbblZE/2vVLSihPlWuC6W2LxAnIkn7a3QHyg57Y6Ww1C/YSswGp4Bn?=
 =?us-ascii?Q?GZidRJlcJJ827wdnqqf5cq6YDtmx8DjTzkq2U9UGnBO770EwjHxsT1A6RB81?=
 =?us-ascii?Q?rz/7jC32tkpb7Yq4Nol0FVEvmbmOC2T1UU4V0CU2SmjJNTpvoY19HArTI8sp?=
 =?us-ascii?Q?Ulg6lT9atg8nTkrFkQhJflAdd2rW0/cRhOsw0/YLwJi0qi+RoQPW4vuIL42u?=
 =?us-ascii?Q?Cl/ojp4ahhno/AsMUA14avylk2V3470zLE8UKjfPdMzmk/Ns9+BF6lR0b4Sf?=
 =?us-ascii?Q?Xygal8hb8ORRmaPf8g/QsGarxWxqmiCHNtY5gW2z+cPA8TZV6pgaDap4h3xK?=
 =?us-ascii?Q?D0rWcpx8aX/0KXlYqsyf895+aYocMLk3lSTGEQQL2fkKmsBSL6ZblWGsVpyG?=
 =?us-ascii?Q?EM1C9jNjxSwLDq0QaEqXGtqR2kPQMvAfw2x4DYm/BISmhNUajAQHta+CYCdt?=
 =?us-ascii?Q?RQlXd/QJna8Dt2snr+k1SdZmN1rp3KnwLKxF9FoW9SLcUR0ww8loNdlxmcPx?=
 =?us-ascii?Q?8CkTrF66znHowDu1m8pUXu7B+BwPgf6lDRtWcB4dURt4MUulG1Pv/qlDBE+T?=
 =?us-ascii?Q?1LFa2dtscgpQ9NsHxqIg4UpYCRyiCSaAYkLe71SxVispWwV5R8H1jP4/9KYB?=
 =?us-ascii?Q?RTZroZVN4fYj2n4RVXc8HoXoLc5zLIknWtXNcTVvzfGJP6x5QOyMRtFApQ50?=
 =?us-ascii?Q?eXzBYgOdPH9Qwg2oBOP/mxxLCHLexc27+sS2NJIXLqjUITnE1Pre7MNqXYll?=
 =?us-ascii?Q?w4pd5OJkIeM6Fgy7RU93lip+dIlJ5A0MESl5OZLsaOylRVMTyiDmtD/TWGpE?=
 =?us-ascii?Q?73hXUrMjWT8UteHh1ZiC4y5Ecn1djNaOcpD8jGcAe4yBimqfjOcrVumMw04Q?=
 =?us-ascii?Q?mIzxTwEGONcDBGAS72ONxFrjh2AOQHdZXIlvyO/xHUVZ9FsixL5Pe9eEiecY?=
 =?us-ascii?Q?I+S6b5BcmNGMk8p7UrNWvn/MwM0k3hhxSf+MT55NkgsbD13c3fEIxBJ9jsnx?=
 =?us-ascii?Q?1BR8DHAzRg8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cj0Ex64K9+7/se/w+bCuvofJtzWFrPdsV9lCYfX3r1/GX6/h0hB0HCWGxG7c?=
 =?us-ascii?Q?f1hgbpY26khNPwTCcwxOJoGxF5QgZHX5KmEH4SRU4qFHEsr/kYiDg3EqS2P0?=
 =?us-ascii?Q?nq+jrlRBxdf6ZfM6IjRu6RQQYJA+7nYw0NVyJSxDA4V9nnC5PAH1t5N8eMR3?=
 =?us-ascii?Q?qQsMWGV8+Yqq3QgFrpFPnCqltLuKHeYBgFUBB0YpofEVHzQJZ2FTqpbf9aHy?=
 =?us-ascii?Q?mnKQsQBUXdw981mSxoy2gSg9usYJ0l+1gfF2b3iDlHcXxHyT1g0jABiGD5sV?=
 =?us-ascii?Q?cWNzxuyqTs37wkQl8Z0Jh3YBTGUoqrVCl+lWTYos3GylxiFq096pSYM81ApK?=
 =?us-ascii?Q?vgf93M++M+kP2lXmokxip/uor+EkI2pTMmkZH/kty+mQJ0/LmgUq3o7muzu9?=
 =?us-ascii?Q?hgC8c21hKbLCiRnzs086fpfBTSFC1Xju5HxgQe6zZq+QrgeTOljTWgpuBlIT?=
 =?us-ascii?Q?54uuQPu3qZdIYIFGQwb2k27sg3AfHXSzKNXmUJAZF/qaI/tz+UlrbfaZyvjh?=
 =?us-ascii?Q?UCc7lTiKujB5o5cC1s03iRxEZg5rvkMgwXKC35EiO2ItPtaPByuugIrCq2bg?=
 =?us-ascii?Q?hML+tdF6N3uKFBJZjubm5tIG+wWRBi7A7WNEL2MRhr0dPSAgQIWYauwSMQ00?=
 =?us-ascii?Q?Isr5Ebc0FS9ILL60bseCB+kj0DAcEzSnQXbWZroGC8JVgBz6YeKEhQGkXnPw?=
 =?us-ascii?Q?br4Oygcw8NzV7aenN+aJ/gKqwM+iJTOpkuN+puRVAh+PnhdBIBRgT/viiBNE?=
 =?us-ascii?Q?KOe79bIvbuZUJTDNWGrfECXFwukUiqV75KP0a8BJ6fa3Q0dGMmfy2GdzcVIk?=
 =?us-ascii?Q?VsPuUbFrM57NWSKRYO8E3xGdwZx2nkJHgkQ9OSzFXJ+z+MIaJVU/gztdqrVA?=
 =?us-ascii?Q?0YES9ZUXlpYL5UTHORFhvBYsYn5jj6wABwVp8UjdFrh/59q12Dhic8TbZ6cw?=
 =?us-ascii?Q?e27P7oVYqbErs70nw2V/GjQPWIO9LE6kIpdmRT3d49aQKPaSYOkrxW1E1E3p?=
 =?us-ascii?Q?KGsu+3ZRpYJDC3gNHwQj06NwAX5HGUKtlefSeIcXhUNMIzLY+mDB7k/6AtS0?=
 =?us-ascii?Q?mNdMc5/YuPX5Gsj1ZR2gXiS5ZZgMxCZ68eT5OAS8jin0C0rBedNZdL+BX0ge?=
 =?us-ascii?Q?vp0yx5Fsmp4WqbeCols9y8WUvwnGwCKd+yzfeLV0KM7QUfbYnVtL/kzCPpdf?=
 =?us-ascii?Q?oGsx44AxICIGdD102Xw3uZaDTz6e8760xLN7a/9AGzV4s/n0FO0oyZkatJPA?=
 =?us-ascii?Q?KySInvqEU0V6oqW9PZSsOsTU6ifFkbUpBdl6wev5EfefbCPvs3RdDqU9JPGc?=
 =?us-ascii?Q?mJi70B4nR2i0yKkIR/RBXQl3I0dO546AfYsDbSJLHLVokknhGB8ZSPRjpgyF?=
 =?us-ascii?Q?XkvCk3rRFmZGAMg7fDMcf81K1FhabC4/UDH0Q3pJwxfIceTunjbWKQja+IU1?=
 =?us-ascii?Q?rPMm4mRruuI1UoFiBdZ88levBkQMgBPEGzfrs4QDGa5PKb8feOq9wa9tbO3z?=
 =?us-ascii?Q?cOHCbSyFF7ZfgvNq/2o4NeGhSZ7EdrH2ouXwQCSldGXJS8UQh0m7tdEj6rQ4?=
 =?us-ascii?Q?FCroiS30IOK/wacgFbEXqGzBJXnBpJag9zPapLFkuCcus9OPhGrl/CcF2jWv?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c9b851-4f61-4f9c-0431-08dd968a1754
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 04:03:19.9433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3JxAbFevWBKpZ9Ju47DYMmmySKWCfTFRt7AunAmNaiHEy8+OCH8L86QnA5DCweD5W6z56QE6J+P4oBUyrjibNAGYcNg4XSo7/UW4Cjuy/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
X-Authority-Analysis: v=2.4 cv=a8kw9VSF c=1 sm=1 tr=0 ts=682aad8a cx=c_pps a=oYCWE2dcp7hbP1SgTdEJ+A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=v1SXQY2iVesII6g1WEQA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zHeb-K_YCVfJMm3WX6vVf3Zej1HNzb76
X-Proofpoint-ORIG-GUID: zHeb-K_YCVfJMm3WX6vVf3Zej1HNzb76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDAzNSBTYWx0ZWRfX+Fzv0NP5CiTk CqwK/7k+yLoj3nPQLTNg1l+g0MrNfTQFLxMoVrsgN7GIGdD48wggrxehv3sCOKXo0jH9Zwh5Q5r qzyRpcztuNxKeEXbac1OUiPweNvZK9cJhGgSMSfClpsiCOrWDShSHta45PAEsu5SHhOIVA22/26
 bF2pqZbrxUfFxRAqL4CgkjPxxOeRb33eBYZMw7OLbbUem9X8gSqOvooK9kXVvWzXH8cEyKuhGz3 HzeQ3Ezqg3c8OM4XpJz2E8ay1+Dwq8M556hA4A6krUX1jyP+BYCgIs+pGi/03cs4rx7R1/1M0Hs rvFvDsh20Jif5yosXL+dNmBIDcA+x+zrVtNqAda4mux5y9ywwfUgkin2xlQa8dXAvN20JR5+end
 5CkN1XkB2ycJHaDyoCxqda9xJ23bKA4WqQxF8GXhpHrepjh4CaJK3hfUKtUnVXQTSdQixeKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505190035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 04:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216814

From: Sunil Dora <sunilkumar.dora@windriver.com>

PR 32603, more ld -w misbehaviour

  [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=31e9e2e8d1090da0c1da97a70005d8841fff8ddd
  [2] https://sourceware.org/bugzilla/show_bug.cgi?id=32603

(From OE-Core rev: 0ee82d77402dc63cacb17f2a88a59ff190ddf8bb)

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/0020-CVE-2025-1153-2.patch       | 840 ++++++++++++++++++
 2 files changed, 841 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-1153-2.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 6f41c616e2..f4f24c2ee5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -46,5 +46,6 @@ SRC_URI = "\
      file://CVE-2025-1181.patch \
      file://CVE-2025-1182.patch \
      file://0019-CVE-2025-1153-1.patch \
+     file://0020-CVE-2025-1153-2.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-1153-2.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-1153-2.patch
new file mode 100644
index 0000000000..2b473914b7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-1153-2.patch
@@ -0,0 +1,840 @@
+From 31e9e2e8d1090da0c1da97a70005d8841fff8ddd Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 16 Feb 2025 23:34:55 +1030
+Subject: [PATCH] PR 32603, more ld -w misbehaviour
+
+Commit 8d97c1a53f3d claimed to replace all einfo calls using %F with
+a call to fatal.  It did so only for the ld/ directory.  This patch
+adds a "fatal" to linker callbacks, and replaces those calls in bfd/
+too.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=31e9e2e8d1090da0c1da97a70005d8841fff8ddd]
+CVE: CVE-2025-1153
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ bfd/archive.c         |  4 ++--
+ bfd/coff-aarch64.c    |  4 +---
+ bfd/coffgen.c         |  2 +-
+ bfd/elf-ifunc.c       |  4 ++--
+ bfd/elf-m10300.c      |  4 ++--
+ bfd/elf-properties.c  |  4 ++--
+ bfd/elf.c             |  4 ++--
+ bfd/elf32-arm.c       |  2 +-
+ bfd/elf32-avr.c       |  4 ++--
+ bfd/elf32-csky.c      |  2 +-
+ bfd/elf32-frv.c       |  4 ++--
+ bfd/elf32-hppa.c      |  6 ++---
+ bfd/elf32-i386.c      |  4 ++--
+ bfd/elf32-m68hc11.c   |  2 +-
+ bfd/elf32-m68hc12.c   |  2 +-
+ bfd/elf32-metag.c     |  2 +-
+ bfd/elf32-spu.c       |  5 ++--
+ bfd/elf64-ia64-vms.c  |  4 ++--
+ bfd/elf64-ppc.c       |  4 ++--
+ bfd/elf64-x86-64.c    | 14 +++++------
+ bfd/elflink.c         |  8 +++----
+ bfd/elfnn-aarch64.c   |  6 ++---
+ bfd/elfnn-ia64.c      |  4 ++--
+ bfd/elfnn-kvx.c       |  2 +-
+ bfd/elfnn-loongarch.c |  4 ++--
+ bfd/elfxx-aarch64.c   |  6 ++---
+ bfd/elfxx-sparc.c     |  4 ++--
+ bfd/elfxx-x86.c       | 56 +++++++++++++++++++++----------------------
+ bfd/linker.c          |  2 +-
+ bfd/reloc.c           |  4 ++--
+ bfd/reloc16.c         |  4 ++--
+ bfd/xcofflink.c       |  2 +-
+ include/bfdlink.h     |  3 +++
+ ld/ldmain.c           |  1 +
+ 34 files changed, 94 insertions(+), 93 deletions(-)
+
+diff --git a/bfd/archive.c b/bfd/archive.c
+index 9f3fbce9..0f617276 100644
+--- a/bfd/archive.c
++++ b/bfd/archive.c
+@@ -749,8 +749,8 @@ _bfd_get_elt_at_filepos (bfd *archive, file_ptr filepos,
+ 	    case bfd_error_system_call:
+ 	      if (info != NULL)
+ 		{
+-		  info->callbacks->einfo
+-		    (_("%F%P: %pB(%s): error opening thin archive member: %E\n"),
++		  info->callbacks->fatal
++		    (_("%P: %pB(%s): error opening thin archive member: %E\n"),
+ 		     archive, filename);
+ 		  break;
+ 		}
+diff --git a/bfd/coff-aarch64.c b/bfd/coff-aarch64.c
+index 825963c0..53f539e0 100644
+--- a/bfd/coff-aarch64.c
++++ b/bfd/coff-aarch64.c
+@@ -876,10 +876,8 @@ coff_pe_aarch64_relocate_section (bfd *output_bfd,
+ 	  }
+ 
+ 	default:
+-	  info->callbacks->einfo (_("%F%P: Unhandled relocation type %u\n"),
++	  info->callbacks->fatal (_("%P: Unhandled relocation type %u\n"),
+ 				  rel->r_type);
+-	  BFD_FAIL ();
+-	  return false;
+ 	}
+     }
+ 
+diff --git a/bfd/coffgen.c b/bfd/coffgen.c
+index cc1c6557..3270cd2f 100644
+--- a/bfd/coffgen.c
++++ b/bfd/coffgen.c
+@@ -2793,7 +2793,7 @@ _bfd_coff_section_already_linked (bfd *abfd,
+ 
+   /* This is the first section with this name.  Record it.  */
+   if (!bfd_section_already_linked_table_insert (already_linked_list, sec))
+-    info->callbacks->einfo (_("%F%P: already_linked_table: %E\n"));
++    info->callbacks->fatal (_("%P: already_linked_table: %E\n"));
+   return false;
+ }
+ 
+diff --git a/bfd/elf-ifunc.c b/bfd/elf-ifunc.c
+index 42a3bcdf..58a1ca5e 100644
+--- a/bfd/elf-ifunc.c
++++ b/bfd/elf-ifunc.c
+@@ -139,9 +139,9 @@ _bfd_elf_allocate_ifunc_dyn_relocs (struct bfd_link_info *info,
+ 	  || info->export_dynamic)
+       && h->pointer_equality_needed)
+     {
+-      info->callbacks->einfo
++      info->callbacks->fatal
+ 	/* xgettext:c-format */
+-	(_("%F%P: dynamic STT_GNU_IFUNC symbol `%s' with pointer "
++	(_("%P: dynamic STT_GNU_IFUNC symbol `%s' with pointer "
+ 	   "equality in `%pB' can not be used when making an "
+ 	   "executable; recompile with -fPIE and relink with -pie\n"),
+ 	 h->root.root.string,
+diff --git a/bfd/elf-m10300.c b/bfd/elf-m10300.c
+index 24ea43a7..cf6bb13b 100644
+--- a/bfd/elf-m10300.c
++++ b/bfd/elf-m10300.c
+@@ -2646,8 +2646,8 @@ mn10300_elf_relax_section (bfd *abfd,
+   bfd_vma align_gap_adjustment;
+ 
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   /* Assume nothing changes.  */
+   *again = false;
+diff --git a/bfd/elf-properties.c b/bfd/elf-properties.c
+index ee8bd37f..a4591472 100644
+--- a/bfd/elf-properties.c
++++ b/bfd/elf-properties.c
+@@ -665,11 +665,11 @@ _bfd_elf_link_setup_gnu_properties (struct bfd_link_info *info)
+ 					      | SEC_HAS_CONTENTS
+ 					      | SEC_DATA));
+ 	  if (sec == NULL)
+-	    info->callbacks->einfo (_("%F%P: failed to create GNU property section\n"));
++	    info->callbacks->fatal (_("%P: failed to create GNU property section\n"));
+ 
+ 	  if (!bfd_set_section_alignment (sec,
+ 					  elfclass == ELFCLASS64 ? 3 : 2))
+-	    info->callbacks->einfo (_("%F%pA: failed to align section\n"),
++	    info->callbacks->fatal (_("%pA: failed to align section\n"),
+ 				    sec);
+ 
+ 	  elf_section_type (sec) = SHT_NOTE;
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 8bffd3c5..8e4e1e7f 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -5188,8 +5188,8 @@ _bfd_elf_map_sections_to_segments (bfd *abfd,
+ 	  && need_layout != NULL
+ 	  && bed->size_relative_relocs
+ 	  && !bed->size_relative_relocs (info, need_layout))
+-	info->callbacks->einfo
+-	  (_("%F%P: failed to size relative relocations\n"));
++	info->callbacks->fatal
++	  (_("%P: failed to size relative relocations\n"));
+     }
+ 
+   if (no_user_phdrs && bfd_count_sections (abfd) != 0)
+diff --git a/bfd/elf32-arm.c b/bfd/elf32-arm.c
+index 4ad7c354..b4a822f1 100644
+--- a/bfd/elf32-arm.c
++++ b/bfd/elf32-arm.c
+@@ -5053,7 +5053,7 @@ arm_build_one_stub (struct bfd_hash_entry *gen_entry,
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+diff --git a/bfd/elf32-avr.c b/bfd/elf32-avr.c
+index 20e03bd7..912f7533 100644
+--- a/bfd/elf32-avr.c
++++ b/bfd/elf32-avr.c
+@@ -2484,8 +2484,8 @@ elf32_avr_relax_section (bfd *abfd,
+     shrinkable = false;
+ 
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   htab = avr_link_hash_table (link_info);
+   if (htab == NULL)
+diff --git a/bfd/elf32-csky.c b/bfd/elf32-csky.c
+index 9479705d..edff65a9 100644
+--- a/bfd/elf32-csky.c
++++ b/bfd/elf32-csky.c
+@@ -3728,7 +3728,7 @@ csky_build_one_stub (struct bfd_hash_entry *gen_entry,
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+diff --git a/bfd/elf32-frv.c b/bfd/elf32-frv.c
+index 5b66b074..245db7c2 100644
+--- a/bfd/elf32-frv.c
++++ b/bfd/elf32-frv.c
+@@ -5617,8 +5617,8 @@ elf32_frvfdpic_relax_section (bfd *abfd ATTRIBUTE_UNUSED, asection *sec,
+   struct _frvfdpic_dynamic_got_plt_info gpinfo;
+ 
+   if (bfd_link_relocatable (info))
+-    (*info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   /* If we return early, we didn't change anything.  */
+   *again = false;
+diff --git a/bfd/elf32-hppa.c b/bfd/elf32-hppa.c
+index c2a7ad98..f1e67a06 100644
+--- a/bfd/elf32-hppa.c
++++ b/bfd/elf32-hppa.c
+@@ -729,7 +729,7 @@ hppa_build_one_stub (struct bfd_hash_entry *bh, void *in_arg)
+ 	 section.  The user should fix his linker script.  */
+       if (hsh->target_section->output_section == NULL
+ 	  && info->non_contiguous_regions)
+-	info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output "
++	info->callbacks->fatal (_("%P: Could not assign `%pA' to an output "
+ 				  "section. Retry without "
+ 				  "--enable-non-contiguous-regions.\n"),
+ 				hsh->target_section);
+@@ -758,7 +758,7 @@ hppa_build_one_stub (struct bfd_hash_entry *bh, void *in_arg)
+ 	 section.  The user should fix his linker script.  */
+       if (hsh->target_section->output_section == NULL
+ 	  && info->non_contiguous_regions)
+-	info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output "
++	info->callbacks->fatal (_("%P: Could not assign `%pA' to an output "
+ 				  "section. Retry without "
+ 				  "--enable-non-contiguous-regions.\n"),
+ 				hsh->target_section);
+@@ -839,7 +839,7 @@ hppa_build_one_stub (struct bfd_hash_entry *bh, void *in_arg)
+ 	 section.  The user should fix his linker script.  */
+       if (hsh->target_section->output_section == NULL
+ 	  && info->non_contiguous_regions)
+-	info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output "
++	info->callbacks->fatal (_("%P: Could not assign `%pA' to an output "
+ 				  "section. Retry without "
+ 				  "--enable-non-contiguous-regions.\n"),
+ 				hsh->target_section);
+diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
+index e2f88a11..1637e39f 100644
+--- a/bfd/elf32-i386.c
++++ b/bfd/elf32-i386.c
+@@ -4092,8 +4092,8 @@ elf_i386_finish_dynamic_sections (bfd *output_bfd,
+     {
+       if (bfd_is_abs_section (htab->elf.splt->output_section))
+ 	{
+-	  info->callbacks->einfo
+-	    (_("%F%P: discarded output section: `%pA'\n"),
++	  info->callbacks->fatal
++	    (_("%P: discarded output section: `%pA'\n"),
+ 	     htab->elf.splt);
+ 	  return false;
+ 	}
+diff --git a/bfd/elf32-m68hc11.c b/bfd/elf32-m68hc11.c
+index 5fc611f5..6f705718 100644
+--- a/bfd/elf32-m68hc11.c
++++ b/bfd/elf32-m68hc11.c
+@@ -419,7 +419,7 @@ m68hc11_elf_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+diff --git a/bfd/elf32-m68hc12.c b/bfd/elf32-m68hc12.c
+index 1be174c0..bdfb9ca5 100644
+--- a/bfd/elf32-m68hc12.c
++++ b/bfd/elf32-m68hc12.c
+@@ -539,7 +539,7 @@ m68hc12_elf_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+diff --git a/bfd/elf32-metag.c b/bfd/elf32-metag.c
+index de14dfe5..49f93cc7 100644
+--- a/bfd/elf32-metag.c
++++ b/bfd/elf32-metag.c
+@@ -3342,7 +3342,7 @@ metag_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+      section.  The user should fix his linker script.  */
+   if (hsh->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    hsh->target_section);
+ 
+diff --git a/bfd/elf32-spu.c b/bfd/elf32-spu.c
+index 881d4d8e..dd5d5fbe 100644
+--- a/bfd/elf32-spu.c
++++ b/bfd/elf32-spu.c
+@@ -4689,8 +4689,7 @@ spu_elf_auto_overlay (struct bfd_link_info *info)
+  file_err:
+   bfd_set_error (bfd_error_system_call);
+  err_exit:
+-  info->callbacks->einfo (_("%F%P: auto overlay error: %E\n"));
+-  xexit (1);
++  info->callbacks->fatal (_("%P: auto overlay error: %E\n"));
+ }
+ 
+ /* Provide an estimate of total stack required.  */
+@@ -4743,7 +4742,7 @@ spu_elf_final_link (bfd *output_bfd, struct bfd_link_info *info)
+     info->callbacks->einfo (_("%X%P: stack/lrlive analysis error: %E\n"));
+ 
+   if (!spu_elf_build_stubs (info))
+-    info->callbacks->einfo (_("%F%P: can not build overlay stubs: %E\n"));
++    info->callbacks->fatal (_("%P: can not build overlay stubs: %E\n"));
+ 
+   return bfd_elf_final_link (output_bfd, info);
+ }
+diff --git a/bfd/elf64-ia64-vms.c b/bfd/elf64-ia64-vms.c
+index 2f37e90c..b1eaaac0 100644
+--- a/bfd/elf64-ia64-vms.c
++++ b/bfd/elf64-ia64-vms.c
+@@ -361,8 +361,8 @@ elf64_ia64_relax_section (bfd *abfd, asection *sec,
+   *again = false;
+ 
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   /* Don't even try to relax for non-ELF outputs.  */
+   if (!is_elf_hash_table (link_info->hash))
+diff --git a/bfd/elf64-ppc.c b/bfd/elf64-ppc.c
+index 720d6ac9..7b798732 100644
+--- a/bfd/elf64-ppc.c
++++ b/bfd/elf64-ppc.c
+@@ -12289,7 +12289,7 @@ ppc_size_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+   if (stub_entry->target_section != NULL
+       && stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+ 
+@@ -12297,7 +12297,7 @@ ppc_size_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+   if (stub_entry->group->stub_sec != NULL
+       && stub_entry->group->stub_sec->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    stub_entry->group->stub_sec);
+ 
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index c3fb375c..a22d57d7 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -3706,8 +3706,8 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+ 			      || (roff - 3 + 22) > input_section->size)
+ 			    {
+ 			    corrupt_input:
+-			      info->callbacks->einfo
+-				(_("%F%P: corrupt input: %pB\n"),
++			      info->callbacks->fatal
++				(_("%P: corrupt input: %pB\n"),
+ 				 input_bfd);
+ 			      return false;
+ 			    }
+@@ -4679,7 +4679,7 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+       /* Check PC-relative offset overflow in PLT entry.  */
+       if ((plt_got_pcrel_offset + 0x80000000) > 0xffffffff)
+ 	/* xgettext:c-format */
+-	info->callbacks->einfo (_("%F%pB: PC-relative offset overflow in PLT entry for `%s'\n"),
++	info->callbacks->fatal (_("%pB: PC-relative offset overflow in PLT entry for `%s'\n"),
+ 				output_bfd, h->root.root.string);
+ 
+       bfd_put_32 (output_bfd, plt_got_pcrel_offset,
+@@ -4752,7 +4752,7 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+ 		 will overflow first.  */
+ 	      if (plt0_offset > 0x80000000)
+ 		/* xgettext:c-format */
+-		info->callbacks->einfo (_("%F%pB: branch displacement overflow in PLT entry for `%s'\n"),
++		info->callbacks->fatal (_("%pB: branch displacement overflow in PLT entry for `%s'\n"),
+ 					output_bfd, h->root.root.string);
+ 	      bfd_put_32 (output_bfd, - plt0_offset,
+ 			  (plt->contents + h->plt.offset
+@@ -4805,7 +4805,7 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+       if ((got_after_plt && got_pcrel_offset < 0)
+ 	  || (!got_after_plt && got_pcrel_offset > 0))
+ 	/* xgettext:c-format */
+-	info->callbacks->einfo (_("%F%pB: PC-relative offset overflow in GOT PLT entry for `%s'\n"),
++	info->callbacks->fatal (_("%pB: PC-relative offset overflow in GOT PLT entry for `%s'\n"),
+ 				output_bfd, h->root.root.string);
+ 
+       bfd_put_32 (output_bfd, got_pcrel_offset,
+@@ -5092,8 +5092,8 @@ elf_x86_64_finish_dynamic_sections (bfd *output_bfd,
+     {
+       if (bfd_is_abs_section (htab->elf.splt->output_section))
+ 	{
+-	  info->callbacks->einfo
+-	    (_("%F%P: discarded output section: `%pA'\n"),
++	  info->callbacks->fatal
++	    (_("%P: discarded output section: `%pA'\n"),
+ 	     htab->elf.splt);
+ 	  return false;
+ 	}
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 8af6898a..dba176cc 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -12891,8 +12891,8 @@ bfd_elf_final_link (bfd *abfd, struct bfd_link_info *info)
+   if (info->enable_dt_relr
+       && bed->finish_relative_relocs
+       && !bed->finish_relative_relocs (info))
+-    info->callbacks->einfo
+-      (_("%F%P: %pB: failed to finish relative relocations\n"), abfd);
++    info->callbacks->fatal
++      (_("%P: %pB: failed to finish relative relocations\n"), abfd);
+ 
+   /* Since ELF permits relocations to be against local symbols, we
+      must have the local symbols available when we do the relocations.
+@@ -14087,7 +14087,7 @@ _bfd_elf_gc_mark_extra_sections (struct bfd_link_info *info,
+ 	  else if (strcmp (bfd_section_name (isec),
+ 			   "__patchable_function_entries") == 0
+ 		   && elf_linked_to_section (isec) == NULL)
+-	      info->callbacks->einfo (_("%F%P: %pB(%pA): error: "
++	      info->callbacks->fatal (_("%P: %pB(%pA): error: "
+ 					"need linked-to section "
+ 					"for --gc-sections\n"),
+ 				      isec->owner, isec);
+@@ -15264,7 +15264,7 @@ _bfd_elf_section_already_linked (bfd *abfd,
+ 
+   /* This is the first section with this name.  Record it.  */
+   if (!bfd_section_already_linked_table_insert (already_linked_list, sec))
+-    info->callbacks->einfo (_("%F%P: already_linked_table: %E\n"));
++    info->callbacks->fatal (_("%P: already_linked_table: %E\n"));
+   return sec->output_section == bfd_abs_section_ptr;
+ }
+ 
+diff --git a/bfd/elfnn-aarch64.c b/bfd/elfnn-aarch64.c
+index 109517db..0f454d23 100644
+--- a/bfd/elfnn-aarch64.c
++++ b/bfd/elfnn-aarch64.c
+@@ -3272,7 +3272,7 @@ aarch64_build_one_stub (struct bfd_hash_entry *gen_entry,
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without "
+ 			      "--enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+@@ -9008,9 +9008,9 @@ elfNN_aarch64_allocate_dynrelocs (struct elf_link_hash_entry *h, void *inf)
+ 	asection *s = p->sec->output_section;
+ 	if (s != NULL && (s->flags & SEC_READONLY) != 0)
+ 	  {
+-	    info->callbacks->einfo
++	    info->callbacks->fatal
+ 		/* xgettext:c-format */
+-		(_ ("%F%P: %pB: copy relocation against non-copyable "
++		(_ ("%P: %pB: copy relocation against non-copyable "
+ 		    "protected symbol `%s'\n"),
+ 		 p->sec->owner, h->root.root.string);
+ 	    return false;
+diff --git a/bfd/elfnn-ia64.c b/bfd/elfnn-ia64.c
+index 7081ba1b..41d9e6fe 100644
+--- a/bfd/elfnn-ia64.c
++++ b/bfd/elfnn-ia64.c
+@@ -361,8 +361,8 @@ elfNN_ia64_relax_section (bfd *abfd, asection *sec,
+   *again = false;
+ 
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   /* Don't even try to relax for non-ELF outputs.  */
+   if (!is_elf_hash_table (link_info->hash))
+diff --git a/bfd/elfnn-kvx.c b/bfd/elfnn-kvx.c
+index ae5ed6bf..b752891b 100644
+--- a/bfd/elfnn-kvx.c
++++ b/bfd/elfnn-kvx.c
+@@ -927,7 +927,7 @@ kvx_build_one_stub (struct bfd_hash_entry *gen_entry,
+      section.  The user should fix his linker script.  */
+   if (stub_entry->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign '%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign '%pA' to an output section. "
+ 			      "Retry without "
+ 			      "--enable-non-contiguous-regions.\n"),
+ 			    stub_entry->target_section);
+diff --git a/bfd/elfnn-loongarch.c b/bfd/elfnn-loongarch.c
+index a7daea67..a8c4226d 100644
+--- a/bfd/elfnn-loongarch.c
++++ b/bfd/elfnn-loongarch.c
+@@ -1445,9 +1445,9 @@ local_allocate_ifunc_dyn_relocs (struct bfd_link_info *info,
+ 	  || info->export_dynamic)
+       && h->pointer_equality_needed)
+     {
+-      info->callbacks->einfo
++      info->callbacks->fatal
+ 	/* xgettext:c-format.  */
+-	(_("%F%P: dynamic STT_GNU_IFUNC symbol `%s' with pointer "
++	(_("%P: dynamic STT_GNU_IFUNC symbol `%s' with pointer "
+ 	   "equality in `%pB' can not be used when making an "
+ 	   "executable; recompile with -fPIE and relink with -pie\n"),
+ 	 h->root.root.string,
+diff --git a/bfd/elfxx-aarch64.c b/bfd/elfxx-aarch64.c
+index d1279adc..161c8a52 100644
+--- a/bfd/elfxx-aarch64.c
++++ b/bfd/elfxx-aarch64.c
+@@ -754,12 +754,12 @@ _bfd_aarch64_elf_link_setup_gnu_properties (struct bfd_link_info *info,
+ 					      | SEC_HAS_CONTENTS
+ 					      | SEC_DATA));
+ 	  if (sec == NULL)
+-	    info->callbacks->einfo (
+-	      _("%F%P: failed to create GNU property section\n"));
++	    info->callbacks->fatal (
++	      _("%P: failed to create GNU property section\n"));
+ 
+           align = (bfd_get_mach (ebfd) & bfd_mach_aarch64_ilp32) ? 2 : 3;
+ 	  if (!bfd_set_section_alignment (sec, align))
+-	    info->callbacks->einfo (_("%F%pA: failed to align section\n"),
++	    info->callbacks->fatal (_("%pA: failed to align section\n"),
+ 				    sec);
+ 
+ 	  elf_section_type (sec) = SHT_NOTE;
+diff --git a/bfd/elfxx-sparc.c b/bfd/elfxx-sparc.c
+index 6f5062bb..95b1928d 100644
+--- a/bfd/elfxx-sparc.c
++++ b/bfd/elfxx-sparc.c
+@@ -2680,8 +2680,8 @@ _bfd_sparc_elf_relax_section (bfd *abfd ATTRIBUTE_UNUSED,
+ 			      bool *again)
+ {
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   *again = false;
+   sec_do_relax (section) = 1;
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 8c261cf8..606c8905 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -531,9 +531,9 @@ elf_x86_allocate_dynrelocs (struct elf_link_hash_entry *h, void *inf)
+ 	  asection *s = p->sec->output_section;
+ 	  if (s != NULL && (s->flags & SEC_READONLY) != 0)
+ 	    {
+-	      info->callbacks->einfo
++	      info->callbacks->fatal
+ 		/* xgettext:c-format */
+-		(_("%F%P: %pB: copy relocation against non-copyable "
++		(_("%P: %pB: copy relocation against non-copyable "
+ 		   "protected symbol `%s' in %pB\n"),
+ 		 p->sec->owner, h->root.root.string,
+ 		 h->root.u.def.section->owner);
+@@ -1030,9 +1030,9 @@ elf_x86_relative_reloc_record_add
+ 
+   if (relative_reloc->data == NULL)
+     {
+-      info->callbacks->einfo
++      info->callbacks->fatal
+ 	/* xgettext:c-format */
+-	(_("%F%P: %pB: failed to allocate relative reloc record\n"),
++	(_("%P: %pB: failed to allocate relative reloc record\n"),
+ 	 info->output_bfd);
+       return false;
+     }
+@@ -1388,9 +1388,9 @@ elf64_dt_relr_bitmap_add
+ 
+   if (bitmap->u.elf64 == NULL)
+     {
+-      info->callbacks->einfo
++      info->callbacks->fatal
+ 	/* xgettext:c-format */
+-	(_("%F%P: %pB: failed to allocate 64-bit DT_RELR bitmap\n"),
++	(_("%P: %pB: failed to allocate 64-bit DT_RELR bitmap\n"),
+ 	 info->output_bfd);
+     }
+ 
+@@ -1424,9 +1424,9 @@ elf32_dt_relr_bitmap_add
+ 
+   if (bitmap->u.elf32 == NULL)
+     {
+-      info->callbacks->einfo
++      info->callbacks->fatal
+ 	/* xgettext:c-format */
+-	(_("%F%P: %pB: failed to allocate 32-bit DT_RELR bitmap\n"),
++	(_("%P: %pB: failed to allocate 32-bit DT_RELR bitmap\n"),
+ 	 info->output_bfd);
+     }
+ 
+@@ -1750,9 +1750,9 @@ elf_x86_compute_dl_relr_bitmap
+ 	  *need_layout = true;
+ 	}
+       else
+-	info->callbacks->einfo
++	info->callbacks->fatal
+ 	  /* xgettext:c-format */
+-	  (_("%F%P: %pB: size of compact relative reloc section is "
++	  (_("%P: %pB: size of compact relative reloc section is "
+ 	     "changed: new (%lu) != old (%lu)\n"),
+ 	   info->output_bfd, htab->dt_relr_bitmap.count,
+ 	   dt_relr_bitmap_count);
+@@ -1772,9 +1772,9 @@ elf_x86_write_dl_relr_bitmap (struct bfd_link_info *info,
+ 
+   contents = (unsigned char *) bfd_alloc (sec->owner, size);
+   if (contents == NULL)
+-    info->callbacks->einfo
++    info->callbacks->fatal
+       /* xgettext:c-format */
+-      (_("%F%P: %pB: failed to allocate compact relative reloc section\n"),
++      (_("%P: %pB: failed to allocate compact relative reloc section\n"),
+        info->output_bfd);
+ 
+   /* Cache the section contents for elf_link_input_bfd.  */
+@@ -2219,9 +2219,9 @@ _bfd_elf_x86_valid_reloc_p (asection *input_section,
+ 	  else
+ 	    name = bfd_elf_sym_name (input_section->owner, symtab_hdr,
+ 				     sym, NULL);
+-	  info->callbacks->einfo
++	  info->callbacks->fatal
+ 	    /* xgettext:c-format */
+-	    (_("%F%P: %pB: relocation %s against absolute symbol "
++	    (_("%P: %pB: relocation %s against absolute symbol "
+ 	       "`%s' in section `%pA' is disallowed\n"),
+ 	     input_section->owner, internal_reloc.howto->name, name,
+ 	     input_section);
+@@ -3429,9 +3429,9 @@ _bfd_x86_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
+ 	    s = p->sec->output_section;
+ 	    if (s != NULL && (s->flags & SEC_READONLY) != 0)
+ 	      {
+-		info->callbacks->einfo
++		info->callbacks->fatal
+ 		  /* xgettext:c-format */
+-		  (_("%F%P: %pB: copy relocation against non-copyable "
++		  (_("%P: %pB: copy relocation against non-copyable "
+ 		     "protected symbol `%s' in %pB\n"),
+ 		   p->sec->owner, h->root.root.string,
+ 		   h->root.u.def.section->owner);
+@@ -4138,12 +4138,12 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 					      | SEC_HAS_CONTENTS
+ 					      | SEC_DATA));
+ 	  if (sec == NULL)
+-	    info->callbacks->einfo (_("%F%P: failed to create GNU property section\n"));
++	    info->callbacks->fatal (_("%P: failed to create GNU property section\n"));
+ 
+ 	  if (!bfd_set_section_alignment (sec, class_align))
+ 	    {
+ 	    error_alignment:
+-	      info->callbacks->einfo (_("%F%pA: failed to align section\n"),
++	      info->callbacks->fatal (_("%pA: failed to align section\n"),
+ 				      sec);
+ 	    }
+ 
+@@ -4404,7 +4404,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+       && !elf_vxworks_create_dynamic_sections (dynobj, info,
+ 					       &htab->srelplt2))
+     {
+-      info->callbacks->einfo (_("%F%P: failed to create VxWorks dynamic sections\n"));
++      info->callbacks->fatal (_("%P: failed to create VxWorks dynamic sections\n"));
+       return pbfd;
+     }
+ 
+@@ -4413,7 +4413,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+      don't need to do it in check_relocs.  */
+   if (htab->elf.sgot == NULL
+       && !_bfd_elf_create_got_section (dynobj, info))
+-    info->callbacks->einfo (_("%F%P: failed to create GOT sections\n"));
++    info->callbacks->fatal (_("%P: failed to create GOT sections\n"));
+ 
+   got_align = (bed->target_id == X86_64_ELF_DATA) ? 3 : 2;
+ 
+@@ -4431,7 +4431,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+   /* Create the ifunc sections here so that check_relocs can be
+      simplified.  */
+   if (!_bfd_elf_create_ifunc_sections (dynobj, info))
+-    info->callbacks->einfo (_("%F%P: failed to create ifunc sections\n"));
++    info->callbacks->fatal (_("%P: failed to create ifunc sections\n"));
+ 
+   plt_alignment = bfd_log2 (htab->plt.plt_entry_size);
+ 
+@@ -4468,7 +4468,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 						    ".plt.got",
+ 						    pltflags);
+ 	  if (sec == NULL)
+-	    info->callbacks->einfo (_("%F%P: failed to create GOT PLT section\n"));
++	    info->callbacks->fatal (_("%P: failed to create GOT PLT section\n"));
+ 
+ 	  if (!bfd_set_section_alignment (sec, non_lazy_plt_alignment))
+ 	    goto error_alignment;
+@@ -4487,7 +4487,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 							    ".plt.sec",
+ 							    pltflags);
+ 		  if (sec == NULL)
+-		    info->callbacks->einfo (_("%F%P: failed to create IBT-enabled PLT section\n"));
++		    info->callbacks->fatal (_("%P: failed to create IBT-enabled PLT section\n"));
+ 
+ 		  if (!bfd_set_section_alignment (sec, plt_alignment))
+ 		    goto error_alignment;
+@@ -4507,7 +4507,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 						    ".eh_frame",
+ 						    flags);
+ 	  if (sec == NULL)
+-	    info->callbacks->einfo (_("%F%P: failed to create PLT .eh_frame section\n"));
++	    info->callbacks->fatal (_("%P: failed to create PLT .eh_frame section\n"));
+ 
+ 	  if (!bfd_set_section_alignment (sec, class_align))
+ 	    goto error_alignment;
+@@ -4520,7 +4520,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 							".eh_frame",
+ 							flags);
+ 	      if (sec == NULL)
+-		info->callbacks->einfo (_("%F%P: failed to create GOT PLT .eh_frame section\n"));
++		info->callbacks->fatal (_("%P: failed to create GOT PLT .eh_frame section\n"));
+ 
+ 	      if (!bfd_set_section_alignment (sec, class_align))
+ 		goto error_alignment;
+@@ -4534,7 +4534,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 							".eh_frame",
+ 							flags);
+ 	      if (sec == NULL)
+-		info->callbacks->einfo (_("%F%P: failed to create the second PLT .eh_frame section\n"));
++		info->callbacks->fatal (_("%P: failed to create the second PLT .eh_frame section\n"));
+ 
+ 	      if (!bfd_set_section_alignment (sec, class_align))
+ 		goto error_alignment;
+@@ -4554,7 +4554,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 						    ".sframe",
+ 						    flags);
+ 	  if (sec == NULL)
+-	    info->callbacks->einfo (_("%F%P: failed to create PLT .sframe section\n"));
++	    info->callbacks->fatal (_("%P: failed to create PLT .sframe section\n"));
+ 
+ 	  // FIXME check this
+ 	  // if (!bfd_set_section_alignment (sec, class_align))
+@@ -4569,7 +4569,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 							".sframe",
+ 							flags);
+ 	      if (sec == NULL)
+-		info->callbacks->einfo (_("%F%P: failed to create second PLT .sframe section\n"));
++		info->callbacks->fatal (_("%P: failed to create second PLT .sframe section\n"));
+ 
+ 	      htab->plt_second_sframe = sec;
+ 	    }
+diff --git a/bfd/linker.c b/bfd/linker.c
+index 0821db55..5b912221 100644
+--- a/bfd/linker.c
++++ b/bfd/linker.c
+@@ -2982,7 +2982,7 @@ _bfd_generic_section_already_linked (bfd *abfd ATTRIBUTE_UNUSED,
+ 
+   /* This is the first section with this name.  Record it.  */
+   if (!bfd_section_already_linked_table_insert (already_linked_list, sec))
+-    info->callbacks->einfo (_("%F%P: already_linked_table: %E\n"));
++    info->callbacks->fatal (_("%P: already_linked_table: %E\n"));
+   return false;
+ }
+ 
+diff --git a/bfd/reloc.c b/bfd/reloc.c
+index 7583b7fd..1fee86f1 100644
+--- a/bfd/reloc.c
++++ b/bfd/reloc.c
+@@ -8465,8 +8465,8 @@ bfd_generic_relax_section (bfd *abfd ATTRIBUTE_UNUSED,
+ 			   bool *again)
+ {
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   *again = false;
+   return true;
+diff --git a/bfd/reloc16.c b/bfd/reloc16.c
+index ff5412dc..a16d6b20 100644
+--- a/bfd/reloc16.c
++++ b/bfd/reloc16.c
+@@ -151,8 +151,8 @@ bfd_coff_reloc16_relax_section (bfd *abfd,
+   long reloc_count;
+ 
+   if (bfd_link_relocatable (link_info))
+-    (*link_info->callbacks->einfo)
+-      (_("%P%F: --relax and -r may not be used together\n"));
++    link_info->callbacks->fatal
++      (_("%P: --relax and -r may not be used together\n"));
+ 
+   /* We only do global relaxation once.  It is not safe to do it multiple
+      times (see discussion of the "shrinks" array below).  */
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 6ef9abcd..9b01cc37 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -4681,7 +4681,7 @@ xcoff_build_one_stub (struct bfd_hash_entry *gen_entry, void *in_arg)
+   if (hstub->target_section != NULL
+       && hstub->target_section->output_section == NULL
+       && info->non_contiguous_regions)
+-    info->callbacks->einfo (_("%F%P: Could not assign `%pA' to an output section. "
++    info->callbacks->fatal (_("%P: Could not assign `%pA' to an output section. "
+ 			      "Retry without --enable-non-contiguous-regions.\n"),
+ 			    hstub->target_section);
+ 
+diff --git a/include/bfdlink.h b/include/bfdlink.h
+index eac07d78..0d03fa70 100644
+--- a/include/bfdlink.h
++++ b/include/bfdlink.h
+@@ -868,6 +868,9 @@ struct bfd_link_callbacks
+     (struct bfd_link_info *, struct bfd_link_hash_entry *h,
+      struct bfd_link_hash_entry *inh,
+      bfd *abfd, asection *section, bfd_vma address, flagword flags);
++  /* Fatal error.  */
++  void (*fatal)
++    (const char *fmt, ...) ATTRIBUTE_NORETURN;
+   /* Error or warning link info message.  */
+   void (*einfo)
+     (const char *fmt, ...);
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index 878d9536..a61086c3 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -146,6 +146,7 @@ static struct bfd_link_callbacks link_callbacks =
+   reloc_dangerous,
+   unattached_reloc,
+   notice,
++  fatal,
+   einfo,
+   info_msg,
+   minfo,
+-- 
+2.43.0
+
-- 
2.49.0


