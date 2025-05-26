Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9A8C54FC6
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 03:31:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21946.1748230284817310844
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 May 2025 20:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7241a8af5b=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q3TihB007042
	for <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 20:31:24 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2073.outbound.protection.outlook.com [40.107.100.73])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm105p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 20:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAjxPYA8Q+UNuXpzvrJZsmaRoyw3GXTfgh2wGwD+qlxj54S7JXa1lUpDmWGIic8cQT4jMSYSTuRZTJqh8ZIcYb6CfjaMByl8avht5H0SKSa9lKYVZJmcExO22jHAO+kwpSIPpP5jQJ1YaRIS+TJCkvWd1Er7d3MiHt1BbyXKXja8/F8Blui6ts4+dX086t+lxUnZLITgC1HavFwD5RNPWD3FmMttZA8t3WKFZcy2LaFf420fEjkuIupH/IPdFQT08tJBSKNBgPxV6YvlVZmu6B56fdzsIe9aRouRe9FglRDAfdSqrpGetnf7POUlbZDenZY4HaB04dSOFkvVgQddSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x76Ykr2HrVmQxxfPlrgpjM3KYt0qLcx/5Jy64kQLu0w=;
 b=DKNjRiWhgxCkvNR2CS7UfVf8Cowb4NwtUq9CE5VDKN00AI4grTfOp8Q79933lKIn3CvjOF5uEDjdB8Nmzcexbtds8ruWDezejfpgadUK6iselztPN8YJhlSHPfqKFMkfNr+zz2PbKM4pb/ita8zah4gUnsLYg7VNqlkCrrGhAwOWxIGF4ewEVZp2ZgD0tXnlTv2l4LSSxvhgcNpD/wvpCV0lkbDpnEwWK8RDVdpgBxYrnIuwRbti+CNiw/sQ7eNnFMp6wuLn4w6RXww1r+RuOHWpwYmzs+nlkGNkYSqAD1mXLSBWuzrf6Q9zNb4LV1QymtNN+UUabQeIKTYBbWzAxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BY1PR11MB7983.namprd11.prod.outlook.com (2603:10b6:a03:52b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 03:31:20 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 03:31:20 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] diffutils: upgrade from 3.11 to 3.12
Date: Mon, 26 May 2025 11:31:06 +0800
Message-Id: <20250526033106.61772-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0170.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BY1PR11MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f39c97-0053-4b91-5f37-08dd9c05c83c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8JGxzz/e3UBvpIVz2vzqR550VPtxNTCLKDSwgQg3snl8xdvfDR2RCCluDRwR?=
 =?us-ascii?Q?UPbn/B6q75zDjYpD4nEoMv4VVFwQ1Nb2u8RbBxw3JdVBNOztcAeFgnWFoLAP?=
 =?us-ascii?Q?4YS+xwJsxdvyG2ea2diHgS8vUa9cB8iYrWdS2BiQLmLzKpvFwE7oKcIx1Hhk?=
 =?us-ascii?Q?9N1MqVZ9D7SEI0HykPYyuOqduJ5jmBVOgyMzEOtB2XvGoHD7cqBEA1giQ4wG?=
 =?us-ascii?Q?5DI3OGb1Srd3MjkOEzXWC8N+YJfJ9O/NVKlM0y57GjfTnkZsw7zNerYt3cZN?=
 =?us-ascii?Q?DFGLGGEtEE5U9XyiYMwxwOe0FDKtaB3tM9UGkC0rjWWuowuRVaZbkho7/6j1?=
 =?us-ascii?Q?c4CvcaTTXAU2YHd6siuUbPG3tEdhoETTEoStuh4VRqWdbpAgih9KevOldh7P?=
 =?us-ascii?Q?PrGbcd6Cck027I+hm3txlyGXBwmFRTWZlE1a3nJwvnZ2CPBVyERpKlhzto+v?=
 =?us-ascii?Q?oMHQt/F2F4PL2ua6PU+LwyJjumt7HJncMvYyd9pt1Eh/uOr7EmCOUBDa1LLT?=
 =?us-ascii?Q?Fm/jMrxOBzK/yaG5OvfStXOb8rEOn4gCZCTtUXUEVN/dFGdrcxjYJEEFZ251?=
 =?us-ascii?Q?H/C/oGDXqdo4H62LPoxJkVhu1S8fZKvS14UPaaDZC/nOrOJHWZgXqyX5kmTT?=
 =?us-ascii?Q?Eu5Qk1KVCmAj/o7YRNzlDrIhrdIIt4nDsAycUCQ039xeoUBWDQxRsh5Zt6Y6?=
 =?us-ascii?Q?rvwUrUMkccvRhUPA6lbMPMSEhm5dk7BVnq1NIKXy/XnuwYs0+FeDq+Nhqk+h?=
 =?us-ascii?Q?2RqbLaEv1Mph/Igy4A+gsBH9YSJ3HP6P2NeM6wlQ+5To5KFSNS0fnuV0QoDv?=
 =?us-ascii?Q?mEwsy6djJsvTUdgEmU85SfVCr2mayYtrrC0B4SKXHrdHkxCcQL8ok/jJ2Jw5?=
 =?us-ascii?Q?MZT/Dc8PeC5hpw7dD3V8Rz/iuau5axrCA78GWgT1Pn7b3a06d7b7v3/Ljrkp?=
 =?us-ascii?Q?JiD0nhytC5ReX9uScnM6KInDG9pxS67fc+jKaT22A5NPwSBb3BUmvfrdOTAc?=
 =?us-ascii?Q?injkX6jioRoP48yYaDlZluGxmBIEBisgrKUtkRycEaAU3co7sQBlYKK8R8Dt?=
 =?us-ascii?Q?IHyXBaK2mzwiQXenT3L+5IjdtiQ+3GOaGiI42RsJkRXMS3N2kz+vY7wOO3qt?=
 =?us-ascii?Q?L5XiVJS5rLu0ILJzRzrk5DjkDtoMuk1ETWF2VVGwrODg0BTSa7fxJHn7pFT9?=
 =?us-ascii?Q?N2Ry7Ku4a/mpPGEymCI6DeLDpRggzD/AGe6HmECMMr2muZJmirp574L84Nol?=
 =?us-ascii?Q?5ddu92w3P8kUnf/6mjwUTBxvTMavajRNanuLK8OuomqZbBw83ftBHlMt7q/k?=
 =?us-ascii?Q?IyWZqpkpDPgvXwG++QgWsxr0zYf9eytWjyjeiurraf4NPRWu5QVwXFj9Pafk?=
 =?us-ascii?Q?UikO0nTR8fJXOkcNJ5691iklB++AtJNVbfONYTDnKI+qXGASW8NkSPIYFEqV?=
 =?us-ascii?Q?Xzb8iv7b9h+EWie0C5tS9gufeIuxls2+jc1uhRx8jpjqY8NT4QHxgKyY6Ume?=
 =?us-ascii?Q?+GUtotLTzb5GG00=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K7BfshQoje8VUBFSoASIZ2aPUwTL/v1IUXsZESf6ltmn9eYIXbG74yuxuuIe?=
 =?us-ascii?Q?Ob3JoKw4Kd009PtrGB9NUpPLe1jicumOyvX020BZOuD9+6XCmx/rXqb334/W?=
 =?us-ascii?Q?a1Uftk+OIg5Oa1KOOOR7pwF60U75Yfdlka/+sNcOvLWlylXhGkjfumeMs3uR?=
 =?us-ascii?Q?tF8FhnokfOrU7+GOoMhoecn+yod9ZQNIzvt/VSzxGhP8JhfMD+VeBqmDf5lk?=
 =?us-ascii?Q?hdwgpusdlQjHBpXx1zyQ6m/6r70bGrAZpeEzya7i4B0WiB2cUkciV1RMUR7D?=
 =?us-ascii?Q?CdO7KluRpcIWSOO+Mq1nKshIK7xUXejMiM0nlXKC1IgM3hMVrq2KARV0InVc?=
 =?us-ascii?Q?7MfReK1yRAaRrVr+vnDaQY8Zsj01OMkRy+/eJWO6YzV+Dj3Zn5/6tTkjknPa?=
 =?us-ascii?Q?Z0vFoBge7ozbTInMijiD1ch42zx99GGGGttmy+vFAxeZNJsO6jyu8SZOUoc9?=
 =?us-ascii?Q?fznn6TyzFG4PvVBRktDFlHNXNnB6eykdXFrfQkoIlGmO7HKkOTvgKVZuDD31?=
 =?us-ascii?Q?OLMesaytKxwYENorXJDWUlPmYvOtTh5bg+1213VoCeQYHvgkJrQcdm0ku88f?=
 =?us-ascii?Q?3IIP0NUowjrL3sE9XNn5kaJrU50EJ8TVuKY2T91Ray7E+60B/jmrp3Ic6Dhi?=
 =?us-ascii?Q?l/eZEHH1HXnsHpM5SASEedfl6Jb6Za+5zkcZACeQK3hXxccTjYpfJWf3Z271?=
 =?us-ascii?Q?sBc9lirih+xJNVbqDVRr6puXiKtSimD3ostRybuCGaqe9mDfAVE+isyCqutl?=
 =?us-ascii?Q?N23BcnJUxBf/1OKEcaSi2rfPiaiDKk+pv34qBI4WhIleuA98o2Qj/WSPEyHL?=
 =?us-ascii?Q?vKw2SwH4eAnDS4E+fKqq72+3n+YRbl45xIWuk5WbEnNhTr9hgs+bUW5edXXC?=
 =?us-ascii?Q?j2f9mkstcOFoaJPh+AD4EQB5cA6QRxCQFUJJlSegBdx+FrhGoWEDYYOLVEXD?=
 =?us-ascii?Q?NHR+UKFyXC7EeDi+wBxV7s6su4GeQBxcH0iRnOwTSJNFK0V3T9X1x1YlLRmJ?=
 =?us-ascii?Q?Iskpnv7+Z5vEASqUs1Kw9ZTcxD2iajGzwJFnPGBO4fd7PGC36Qi3pF5hmTXG?=
 =?us-ascii?Q?TzKqksjk384v3wPorx2GT/e7rAuol7WwMCFSju/Ebihmz69d0rlZdDNFI+3I?=
 =?us-ascii?Q?JwQOeIFEzwrHnIUiMAY8VUbj6oOjDWdc8zWKSJgvegNXDx1+yF2RBWphxdO0?=
 =?us-ascii?Q?CsQYwnWc43ZwHDpFsdCdKWYrc+LuHoZ6BBOjLN1TP7Rz+MtCpycibXpJKqcD?=
 =?us-ascii?Q?ePDuDoqhYxFt4OYAD+4UIjtyVmyA4mCUOmfXvc8hD4D76gUxC6RHOo4eonJZ?=
 =?us-ascii?Q?0RdHg1Hk+fVRpiySYZDuDQ4jW+E13dIwSI7zeHx9RWYCaoW3rcH4wTxxVeNf?=
 =?us-ascii?Q?prP38NxF35ZvbXx0aOa7+QZeKfOFdXyGbGkSCZK1f9up1pxTJ2/AlvLGo0Dx?=
 =?us-ascii?Q?udJavyyNLQV4K3PYqovMwMGWaAw4Zs5mTYl5dR44Nn/uHBDyO2uzfQfhcLKL?=
 =?us-ascii?Q?3aDZIhTJNT+J7PgzoFhW3uCwB5JQDFgEXLEuaQ3T0w00GP3czoYGAFlkKz4s?=
 =?us-ascii?Q?TYaJIDqJ54Lod4aszWIWkhXThEH1+0F0bV4PRFcR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f39c97-0053-4b91-5f37-08dd9c05c83c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 03:31:20.6366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6QG7rNWly7O+2U/pG8DMwuIoK99n/yg89PJXwHHYkrRTRdbt3xCxKwnWxCFaIVSUyErAH9KATZdjZAVPBwb2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7983
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=6833e08b cx=c_pps a=+cOD0p+YmxD2LG2ddZnc7A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=gORUgnq0jNHOHTdulKcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDAyNyBTYWx0ZWRfX49rDRp0zulAf xWSgw9//gZNl20M24qJptpZ+xbXRVN3AqK+xv5asYVOA/PwSkjAFaxkOhWtrhaobfgwSwDhlgKZ LLJAHpJ0P1MsAAZqE/gaUz7LID9L9z877Z/4fnggptsLweB9G9CJ4D2fRGWM3ro+9HZmlWUJOar
 J5Lf+8HcidO5pbnHXcRVLfvzxE7QeYyMz9ovPrCgcWZQQLGFCdMdlaWVgoAFV9FmrjCGA3+VU+B JD4IyrKXGNmSyKmevS5iFmTC2Mv2bRc72omW0md6pq4Pcz1lluGmdM1lAr/D/WJ2rymKySt2el9 AW+2CbMDytuBZVHLqlNsqGpIliCm8KzKx1dpP2lJUE5aVnTlTcFsHiuaASwBorzz1L/qbIH10zU
 5pcCV9PM3XU1MSWnd4i6CUj4MGW190j0ThxPMiGlgjOoF8xGv+XwBComJjzZoBurppULtgc1
X-Proofpoint-ORIG-GUID: zXrf_ceQqDBx9v6yKE70R1Xndm19EgbU
X-Proofpoint-GUID: zXrf_ceQqDBx9v6yKE70R1Xndm19EgbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=828 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505260027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 03:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217253

From: Chen Qi <Qi.Chen@windriver.com>

The following line is added to fix cross-compilation issue in do_configure.
  EXTRA_OECONF += "gl_cv_func_strcasecmp_works=yes"
The error message is as below:
  configure: error: cannot run test program while cross compiling

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../diffutils/{diffutils_3.11.bb => diffutils_3.12.bb}         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/diffutils/{diffutils_3.11.bb => diffutils_3.12.bb} (90%)

diff --git a/meta/recipes-extended/diffutils/diffutils_3.11.bb b/meta/recipes-extended/diffutils/diffutils_3.12.bb
similarity index 90%
rename from meta/recipes-extended/diffutils/diffutils_3.11.bb
rename to meta/recipes-extended/diffutils/diffutils_3.12.bb
index a4badc044e..d00dd772ad 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.11.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.12.bb
@@ -8,9 +8,10 @@ SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
            "
 
-SRC_URI[sha256sum] = "a73ef05fe37dd585f7d87068e4a0639760419f810138bd75c61ddaa1f9e2131e"
+SRC_URI[sha256sum] = "7c8b7f9fc8609141fdea9cece85249d308624391ff61dedaf528fcb337727dfd"
 
 EXTRA_OECONF += "ac_cv_path_PR_PROGRAM=${bindir}/pr --without-libsigsegv-prefix"
+EXTRA_OECONF += "gl_cv_func_strcasecmp_works=yes"
 
 # latest gnulib is no longer able to handle this - I dare not try to fix that maze of abstractions and generators
 CFLAGS:mingw32 = " -DSA_RESTART=0"
-- 
2.34.1


