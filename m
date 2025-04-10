Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1764AC369AA
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:40:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34791.1744292432908882653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A1BJf4021255
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:40:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1q18p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:40:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lyv+Xq1A/PRv6ywfi/idp9wQhKx7fvWG13c4YF67D1fuZsOH+dhK4i2Mk9+VbuAQxwChkoAxs4SU3+UbcbkKi2hokfM6jeUCx8eSuiuQb5BVsi28+pcYWEUYEyyxX2tsCKe4rT32iICaaqh1nAK+f45mL5RDlW/bk8mxt5n6JYki9bdJBfVuZUC3BEvNjxBtAcyJ2wefaPf8D8HMMbhNBE2PsM3AAJQ8c246PdkKafZpdAxiafyaF0aVqu+Zsaqbyfyr/tSNJZqH10Ffqmj0Vt0TY7RbTqT7C1oe7Ez6iGNeS77fmuaWLzJ9q6b42Uupx2xpNszKt8zSnfgGLWTYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNwLMol7uxb4k7e2JTCjlfog65C8AeWQeBQB9YHpbFw=;
 b=CaRccNom1Qnc40P8V8rNBA4eccx+IVDc/Z5qRL7aBUVROyZTyaRBRarD4imMVhz9kkdSQBVQycyiriIH9gau/ju77gi6AlSgE82DeZxhyrIQpAMtZwX1MB5LoXucFf8P04tFX7TLnYZEyEzhV3r3jMPA0vTUDK5SAyzdh0PIfmBYcuzz9YopUzxNcOKJ2AXtWf8hkks/M9t+gg7ZmoIU7Jgsyjc+8+dcezQjNS7CYS7JTLt0+XfANEL1/34cyN2Za/ks+xXvyKH/3/mbZoVDIuRr4U7BGeYGg5EDoIAuwidkprGUKGr1m1lC3+xuCmVesS3hDZLqxT/9wZsba7JMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 13:40:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 13:40:29 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 2/4] nativesdk.bbclass: handle PACKAGE_WRITE_DEPS
Date: Thu, 10 Apr 2025 06:40:19 -0700
Message-ID: <20250410134021.1299595-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410134021.1299595-1-Qi.Chen@windriver.com>
References: <20250410134021.1299595-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e73ed34-4772-45f8-4002-08dd783541ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5xdzJvcsg5NX5nEFfNBbZwM0Qe2gQ1HUVdu0yVdw6mSMB4o+toOaaFJprO1O?=
 =?us-ascii?Q?wr3pBTg1fd5nzT2tY6FXJA1nx1oF2DcRpQuSuFLPWMQb0IbmiYGyHu8WcWNx?=
 =?us-ascii?Q?e0aJ/A1L49WXKKWPoGd/AFlmbdRZViyCbcNkdbUZbf5JufaYKcdomjA1avEa?=
 =?us-ascii?Q?8JL+g68p3csDEqx3ACwUXFk/rRCgXVhaoWmpBWTTTvCUY5LKGVLBrWJZoBS1?=
 =?us-ascii?Q?OUF6sIei+qWZF4pLaGtuXt0WGD6I8l9KfXKDfEKhcd9v1ZA9CkHmNGTjPugH?=
 =?us-ascii?Q?U6xvCLJB/QkJ6MzqJqygOOf+5jxkmb8yUh24GBZLrWWLsbD9Z+iw2ZrBZJsb?=
 =?us-ascii?Q?RkoIfOnA0New6owiq5AFoE0u/f/lHqj0gxaPZt2vvLFvO/3c0qx5l7ZZVhw2?=
 =?us-ascii?Q?RbSaE7z1iRYWc/K/Pd57IJg3pAxwDfV5u9PBcdVe51b2Dl888a6lHLcLNuQD?=
 =?us-ascii?Q?9pZTo09KqVgA+z7NGbqFFc95y4lcsIAAGeyEDY11LQrZvOgh2vvhZQ4w0hRx?=
 =?us-ascii?Q?6sbLeJ1/9bYJvfq/sTiPx7l/uM8x2w/uPY1CNvzWHkbvodRzEvwPiOUCWZXR?=
 =?us-ascii?Q?6La9UtiEyI7nUm44EZZMFpUyJXg+MauVItJj8iBjx7E3NBgt+23/xHe0qlHv?=
 =?us-ascii?Q?yp+zJHDVyzyaWSafVbg4+vrlKUKd4zeJbB2BkOCY2iCAOJinBImphTGSsA2K?=
 =?us-ascii?Q?zDfm1jzekxbN52b1d5n1i7r9kvh614DdYTOfwZvzIpF76DcvgiqduxC57vqt?=
 =?us-ascii?Q?gOmJozJENzoAM7qh7dfskXHZJWIEKWoaZyLO89z0scDlHW7GK5ugxtQVW5pN?=
 =?us-ascii?Q?tr/q5xMWDL2TL5puQnx6p3U7cwQwKzQR65Qbte5CDnAG5CDbbAKSzIAeChxx?=
 =?us-ascii?Q?MA4w0eqXr4ZDjBFeWBw8KyXEIiFAX/CI7N+rvuIIZ+GEnFUj+M2vrXRkfr2O?=
 =?us-ascii?Q?8cSXdaYYDNxu1YvHyaUWy3Xwn+NYIkVMpYlSIFdKy6M8gIIqhYd6dmRNGnzy?=
 =?us-ascii?Q?sqWO5Ydr86eysFt9CyqJOigycnu7FTHSkYY3NOgZ3gZ0B8Yi1iEfhrAq1GMQ?=
 =?us-ascii?Q?sfnXv9aNYmjkN/gv8bwh3Xku5ic88sq5ZqxnVEsXRpjIoDaxxV60zH/wcftw?=
 =?us-ascii?Q?MWCLcVjd3j/RODnpH8v85QtneJtu2vEbckEvoz7hVmPpuzV6w5JguF+2X5TE?=
 =?us-ascii?Q?eWbQjvr7ygs2xLIvmuXzXXKi28FEns+zGb6AMKzdCJZQPqYIxqQqEyO2TY/w?=
 =?us-ascii?Q?+Lh/tlN0VrNEFBAinUO5Uo1LeigTL6V1bcZLU0JuqdWF1IunFq55MJJAJcPy?=
 =?us-ascii?Q?XLfWDmSkkyejPt7Zdy0dE9ANr7OEgHLxy+PKolx6IBEZFaBpqovBGA70kof8?=
 =?us-ascii?Q?WTRKqr89rJ6GkjNetAMznHdOiJNpsuwlEOhIM5DJfjirht0vUQnhPYaLxmSG?=
 =?us-ascii?Q?gfLz7xFxKh4Pk/U7bDlst5QfP7aPQUqaFdGJ4PUjwWG75mXAL3zj+g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Hzt066s75G+ZogKWq1b0Fp1c1/ITtqTwX8T+v6wZ+Ev0n8nGLO5C1YDG2PV4?=
 =?us-ascii?Q?WIQIXsM25si3Pq9qfz/K1F5acjaydv1cnM/DA1JrLW5Z4t3VXfxrtToFCF8j?=
 =?us-ascii?Q?cd9vgd9paKRnhIDLkdR4TJeB5dfv4Wq8UXkJIe0pV+BOFmtIi/Y9M071Hboj?=
 =?us-ascii?Q?w0wUGkvRDqCuIRwHMaUTywpZxcE/wOtQ+UTooF6P5L5L+jxQFkh8/3h2RYH9?=
 =?us-ascii?Q?xlhuPl0vmOrr7bTRpBVj6aPPuwbWMZ6ilpwNqXocdVemDwH4jtYnrboJQ81z?=
 =?us-ascii?Q?BvZZWqzxgC5Nne6Mzje07k/6lZtuczTMcN54plGXMzGc0e1z+otPvPBPrgEw?=
 =?us-ascii?Q?eN5cEL4820CAsEcPsuXpTc00fNOp/iPsYpS9jnCBTXXYTMmbUA8nmHdnHYyU?=
 =?us-ascii?Q?2pj+VePGsMz8mK+yIOeq2MbIYUzZ6GEIKe5eaBA09Yq6DD1JRvIeIi4Cv4x7?=
 =?us-ascii?Q?YE8GBAsQAdZSBEWG8YHjwRSV/2ueDpBFYi0W6XjE8/n1jTZbNvYHkjwhLIg5?=
 =?us-ascii?Q?Tg8CVhHFsTcrUU6i8/zQW/5fuAS91LZC13zrrNTALPODUbvv9rXZTVyPz7Ab?=
 =?us-ascii?Q?DBea/uGChIoH30PC41bjQgszse5Bsut+GiNWN+IuF6566I5luxMoLZfCPfA8?=
 =?us-ascii?Q?CHnuaodeB9X/0DgGrA01H5tSKG8hXLA8iwLiqh+1zmX1mAyUOyhbBXld8eyz?=
 =?us-ascii?Q?/OCGvnhH4DTKJKkyyq5hZ822GIoICtjS3XrZ+zsMqw4/la6yEIwVnonkqhY6?=
 =?us-ascii?Q?oU+jUKel0KFH9svPkUyE6Fqx2Cs1QFhNjFhFAaudgfFgGTh7sFtobO4ITXN+?=
 =?us-ascii?Q?hSVhcecnVxtD5iCtjAQpFk/fh7RCylnioP/4NDvtGyogxdr3BtxPEuCSACyQ?=
 =?us-ascii?Q?sLwNJ+64+X6oX3eUgcvsgM/EQgd1NwImU3DaTO7QGoY1AZ+d9/FQwf42ZW0K?=
 =?us-ascii?Q?17Pme+pIyVfJReFMf50yiML0sJL0N0p6XDB6E3EVjAyV6SrwP7Iq6PBaa2Hv?=
 =?us-ascii?Q?q7n+tQIp+reRxV+tXustqe9g0ACwEYWSIKAhk1Fr10mvCiet3f4riIQvyBE+?=
 =?us-ascii?Q?C/n3hkh+0AsmI7212hdQxALDPyKc0sNiOulaKkzpNIv1wkmk0ehMJuTczi/t?=
 =?us-ascii?Q?A7FYLvNcBAaOYJ7YtK3c6LsdCzzOXdBAl78B6L+pA2uRm0JaeQqRJVqea2iG?=
 =?us-ascii?Q?j05Or9aJNPvzltvf/US+eBFBFyxTQPzZC5CDZdpNpItpu8aGLuSSQcyXddX0?=
 =?us-ascii?Q?EdTsr1iPfXvFyGuCS5x+unag+RuQjjDCRTx58VSUNaUeQKyP2sK0ZIvAIFw5?=
 =?us-ascii?Q?nUYqE2Tcy9lkmp/WpvctZQcy6FLdggE4P6DxVfmutXmZkKydolNJsZiNuYde?=
 =?us-ascii?Q?JS+5ircHJTG0PzshzatIWFPcYphkPW6oRyVK8L9xQqWrjDszATQ2pJowXEaO?=
 =?us-ascii?Q?cpxFsrhLY8vIQJ3Je93BaUvRF2Dn2YhGLnjaXi2oKkEM62R+qyrNo4+9oqDr?=
 =?us-ascii?Q?SC0B3bVmc/6k2+9+TtXX0dzm5XLhQi3MaEaKUwiekXJnmTtxsvpTR42k4Mh6?=
 =?us-ascii?Q?aCwQ4OSRiuPo6UL8cIT7DCcUPisXgwdNC+m/KWBdNWK0wCU8oV/rMvr8UIdq?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e73ed34-4772-45f8-4002-08dd783541ac
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 13:40:28.8806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZ0tXb1TgtabLtaLRufZ/IdmE7I21HoScuc6VhpxsiY0bB0Izatr7CRDq35VdBMr2FrHf98QtCmdGtih+8710A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f7ca50 cx=c_pps a=DnJuoDeutjy/DnsrngHDCQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=i6GXUCRvfqvi2kUFSWoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: UTBafJBNr-xhsC-RLFczUC_TQwHG2qaA
X-Proofpoint-GUID: UTBafJBNr-xhsC-RLFczUC_TQwHG2qaA
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214671

From: Chen Qi <Qi.Chen@windriver.com>

We want nativesdk packages to depend on correct recipes introduced
by PACKAGE_WRITE_DEPS, so do the same mapping just as we do for DEPENDS.

Before this change:
  nativesdk-glib-2.0 -> qemuwrapper-cross

After this change:
  nativesdk-glib-2.0 -> nativesdk-qemuwrapper-cross

This can fix do_populate_sdk failure complaining missing of
nativesdk-qemuwrapper. Error message is like below:

  NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
  NOTE: Exit code 127. Output:
  /xxx/lib32-core-image-sato/1.0/intercept_scripts-xxxx/
  update_gio_module_cache-nativesdk: 13: nativesdk-qemuwrapper: not found

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index 4e57349aa0..7ecb4c12c1 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -104,6 +104,7 @@ python () {
     clsextend.rename_package_variables((d.getVar("PACKAGEVARS") or "").split())
 
     clsextend.map_depends_variable("DEPENDS")
+    clsextend.map_depends_variable("PACKAGE_WRITE_DEPS")
     clsextend.map_packagevars()
     clsextend.map_variable("PROVIDES")
     clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
-- 
2.49.0


