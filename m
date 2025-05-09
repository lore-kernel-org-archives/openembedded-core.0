Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65918C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 14:55:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.743.1746802521080829009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 07:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7224021966=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Bo6vu018852
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 07:55:20 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3f97h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 07:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhSsIWn0ntGdN0uh9PogMxGm/P9qNazlmtMdhMOx9wdpGA5zQ/G0EOIrPm7Sy5t8CyJ4lmJyFDbJzPy5FYQflGNQ3fTedZN4OIPmGbGpT0HXlofy1MHA7FLamwLxu/Q86bqaJQWrl/cMInKENGJzEuSf9Es/bjU7o7EuM/IYO88criyetsifFYFBSByTLEm0Wz6NVOY03erzCyPvQLzUUgmlr9UC8vphLOJW1FxHg2MgT9KnG6SKFXKdwW0p8CUwq5qHYZvuI+EjwpMBqXJPXVrqsSwFH+UCoWWY3dgJXW3V7R56MmqE9u/sgMXF6GluTVEgKxK2vhQanEyemEzDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRzAU98Zew5FLmGCJdDo7gibyA/eqFV4tRfHoF1y4Ng=;
 b=c5vCLlCZBVw7nAVsMn5XaozNoBPZ+syPf/EkPqRvwnvI6n5wDHC3hpNyhfq40saavZohps0lgFg7X3hcOlkIjvFo3LUWBLyfojikS1qbt3See1LlOaYu5ZBkSK0bnQVM/0qQzbNpqF44DwuIX5ohrfg7hKe8GaVhcnVH0ZMG3WNG+aq23GrM2KoPdjpR+xkQc1T6bUtsVe4TMmtPqGgxZOtnNuBJAINEBeVqig5nxp81haeILh/JfDOCgV/DjeMa6LtjS/J6DNnkw0SbFiq6t/NN9s4bePsEx4vL+2uMMpaOshD/n9c48Y0/sAwEqG4gaq/09NcVxriqE9tSRywTsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BY1PR11MB7984.namprd11.prod.outlook.com (2603:10b6:a03:531::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 14:55:15 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 14:55:14 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] openssl: add fips support
Date: Fri,  9 May 2025 22:55:00 +0800
Message-ID: <20250509145500.1833799-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BY1PR11MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: ad319596-f7b3-4d7b-4d9c-08dd8f098189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8NIXpgjWHwAoOUA3MGYj9sVB7V4KMas1oBTvTviPu2deLPLMH7YwWu+3pLUD?=
 =?us-ascii?Q?Mwr7FaFjOWzM8eiO6NcKGadf1bXytPc9cRELxtXEQHGFMhaEppG2c/XrmEWW?=
 =?us-ascii?Q?k/HeZuhEGLkZR7NH8dfVLTUCy5CdKY2TYjG6iFI9CYTRarjN5bsrqiYEJXsj?=
 =?us-ascii?Q?tXhiAsHLO1MXSsUsJ9aoW9j6UZa0meHXWnUxtMSU/RHtOyhBd8aVFEcO4vL5?=
 =?us-ascii?Q?Hq/KOFoUNyugYES6xz3EZ/pZ4+PunTFqfzw8+ICbsTsb+2X9GepQmH+0F/GM?=
 =?us-ascii?Q?9sXVn6uDn6vBhG0epc2lS+QyxNaPCXfcNcqP8U3ClGn1ZlQSfDQCS1OYfs2L?=
 =?us-ascii?Q?E5K1fSPOg75RyIasDm1g0Lk9136T2aD4SbC4yGn1lsgdwCif9fEcdNiU1PHe?=
 =?us-ascii?Q?QIgSiIEnTy0eVCjOGJHlOeJvbzCxFINY65+WiHA3znFyPkAyaAa3HbkfVuLi?=
 =?us-ascii?Q?G2dHCZobQD6dwuK06lKM3Z7bUp9yW7AFDzt9FEQaHdh8YAKsqEZX4YhCj2tA?=
 =?us-ascii?Q?b69/BYXjBd4Rr1SysEUhLJma+uN2/iLtxw0a3xpww8cUgah4rhGklS9BS4RT?=
 =?us-ascii?Q?vKxbjUkg5vl1WeOHWCCKTBr7PEhf9BToDO8bUEXuDg6x9hv9oQAwsvwd8YRa?=
 =?us-ascii?Q?94BbNYv1bZNTDZQf+1UMtHF7X35O9b5lV4EGcp4T0cfkBnPvd9kc+FS+kHiz?=
 =?us-ascii?Q?P5xi++Fe2mp1mB4vxZsaPMXnGnYvAkhSnJ51eUvG3QLrKzq+d5mpoCV9d7jW?=
 =?us-ascii?Q?BmdVWaAgzvxFusxJBaYphZd9BG6fmGtuWkeGz4Sv1Rn44v2xsdZMf0kpNQ6S?=
 =?us-ascii?Q?PmTybmDQmhIw5m3rfRgmhtLIBFziBeKD4BfmmntiZZKbBwMtWvVGaKgOhMMX?=
 =?us-ascii?Q?Ar52Bb+FKnGAwexG0NzubXx8eIzLbftRhkrncDpEvGJ1G3dAz4GWgP42QOUg?=
 =?us-ascii?Q?WMZq+TudtaPY2r4DBhqgEBrey1PsLAiWLp37FTTebaf6+rfKLmpZk9+pAwZa?=
 =?us-ascii?Q?yEmwnGcTSi3SDJ/vKrABahdG/Gk68DI8rajgysVfZKiublXrphfdKAdhPQN2?=
 =?us-ascii?Q?f4I21fFND+I1Qfhmj+1QGm7gE6gGKRkKuK79P71h0p2oVPzY6uh2dnCZz+/V?=
 =?us-ascii?Q?XclnrkNmdFQNqk+bpWixSJaHDynNYFjl3ppbfqTYEP6Q7H+uzet5RJqqEb/4?=
 =?us-ascii?Q?toQ9KKYnbpxCM9LtDPNRz9HYIS2SjVGxo0QTslVO7Si2F0rfvjbT2iNu2pMf?=
 =?us-ascii?Q?yGedkCzGv7AXunMIiRITLF+sct8MxdaCzoRgm6cCufoe9I5o4/Ah/HsHY/ti?=
 =?us-ascii?Q?8nu5udIuNpMs+PR3W7Vx7CeE1k90w3KHFujxx6SiYSh2/ujvOYb8rsKuST+B?=
 =?us-ascii?Q?XiVsPT2vX+nF95RtSngV9A07uoeAH0iKqxBLGF0aaEJ3Cd7Ux88ASVpiRLKF?=
 =?us-ascii?Q?lrZmPYQlFzp8uzaeEzGP1a9hdWQlIW6f/CWI3EwtlE47Wy1l4zeXiQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YKKz659sOJMpKUeLqpaoTHPUCdA6XUyIMj5PDpFb6/hkhl+PuoiXu2B4z3mT?=
 =?us-ascii?Q?ZUff/DiMVqWXfUf1Q1ffiMp2m2ppakgdffheqKda1l+A5Xkk4FnmU/7Unht+?=
 =?us-ascii?Q?pC8wp3VK4GhOnDuC84UTP2Soyc4A8KDX7JqGKkG3Dglz33EZXlKhEzgsemAU?=
 =?us-ascii?Q?i/UhLxG9tZatW0oogMEB8JuyzXMH7rpuOsaqwzlVrow1xYDI9LCjFCQd6G+q?=
 =?us-ascii?Q?5hm9t2y5snN8xltwCgMDxFBaWmJcfR/vnedz3e46CRkkSXYRWTRzeoPrfdS8?=
 =?us-ascii?Q?kwVV7WlFRBx1yjJsMlIlzX3mNO5hFjDOY+XG1eTMPZmVfuV+x6Whtliff2tW?=
 =?us-ascii?Q?h3e/aKBJThsb58nPBpzKcxxsqYkZIpmi4zB5Rk50oSyF7Q19I7gMjMCb83fM?=
 =?us-ascii?Q?QfXi7G301NowXQJ+LpUbXwVDK0NO/D2Jnv5Wh/hBKX6UZLZC1uX5l3M60Paf?=
 =?us-ascii?Q?YqcjUOXYCgc6duZPtrqBXxBcQ8LcvuiviMbre+6uWd9mPnCIa7QkSmZ4k5ru?=
 =?us-ascii?Q?ytsJcJ4Yi6yiMdfdA+DgbMZDZwYRrPoJmhnx7eMDLxVJyqKkM0eVt/+qCqh8?=
 =?us-ascii?Q?YBj7uP2qx+uI5A98AGShCDigRFhSeqDsvKUK9ImLxml6havFGiNf1vb+aZzJ?=
 =?us-ascii?Q?b7pUL18F5pObQVZ/Fy83oWLLShfSi5PJRGzW4UnX5ZBlo/0FfdDO7+LHv5Vg?=
 =?us-ascii?Q?B8iH2BB28Ugfs2x1v9doi+/H+r++COIwsUTSQDN0PlJgjHiVhzhjq6rdC4jX?=
 =?us-ascii?Q?50/VgdKPZhT2XdR45yqvFwt2AL0+TAdGEqxKUEWMG3xrw6A9tf93j4Oq5Yak?=
 =?us-ascii?Q?0o0Ny/N+hC4dNsQo/dObSVWYx+i2wATrD0rgwAoPjH/ArUyLOWOtcTfwsTgl?=
 =?us-ascii?Q?Ry3Cw/5mhBkvxvi8UpA5dK5QRGLEIAFUCfz6Ql4dRnNnKhY+vB7MIm/qs/vu?=
 =?us-ascii?Q?21wVV6FOXl5Gord5M5gkuwNSMIvN3+ZwKwh2lHc8hERGSjw0bgN8TW1j4Wvh?=
 =?us-ascii?Q?n0E9riHf/8XNBY2YmoNe9Ta6MqWrJJHw77q+KJ6GfmnbxINeejvYAQ28ZmEC?=
 =?us-ascii?Q?/0Pqi/DkRZ90GFUTSZz1p9dDAHCJT3LIIz6bBMR+nwKp8WihmJ1IhFyKX8nF?=
 =?us-ascii?Q?DOqEj4Otx6F9/iD/+GVJ4AIcDjVLje0FLSiwvewR+aq4uWy1RctGhh61ASAF?=
 =?us-ascii?Q?dDM61mdDp5pEz8aujQbHZsrgAdEw+3eQSb4Xk10WKPGscb/f6Q/YDFmihRfk?=
 =?us-ascii?Q?UA5DuBBYR0BkyI6t3VoZiXq1IlQqTdmxdGUieP334bnsWAJk91r8cX2ihZ+f?=
 =?us-ascii?Q?wDyuF1DE6YrnsA3O72z+vF9uXgTHw/7Z5R0eAQT4HdZFmafXfb3XCvfN0eWj?=
 =?us-ascii?Q?VsId8XKvQ9/DsrZRqkoDDQfNKiqx/CVTzPkdU/+iTmgX1Lr9SRBH4VUnu1M8?=
 =?us-ascii?Q?PNn1ibmRZhkCJ1YBMrxmsBCFDqVtD8AIbXOjSCNVyDb941l8UAya4clGn3bc?=
 =?us-ascii?Q?5qsxRCeWGqGUyste1fJJyuHAENmorMr8ZDCP9XR2M5tztpaYDD4B0sxxj050?=
 =?us-ascii?Q?03AMhl9cbeQ5Og52YtumXc4AhYijsfjsDw3BZi3X?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad319596-f7b3-4d7b-4d9c-08dd8f098189
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 14:55:14.8970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xh77Gw+k6H6hiy0QwC2iU3efJTtDmIh/Jn1tSjTk5iHniTXV+W1NSjYbqwUef2/PKZUE/8VXJLXFxGPuH6eKUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7984
X-Proofpoint-ORIG-GUID: VIg0HTGfdvnRe8_030u-WvLKzCqi9_Df
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=681e1758 cx=c_pps a=OxY2RB2sa7x8oI2LU21LDQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=X0CuYVNeYqOLpcntE54A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: VIg0HTGfdvnRe8_030u-WvLKzCqi9_Df
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE0NiBTYWx0ZWRfX60xjhgtwxnJ4 0Fh2ffrbdBnn+wWlFUA0JxU6QpiYkJ/+yqMke6Ta/Cxz3w691TbywY7L0I6p37qI2Sp/H5wq1oX b5UQUtddDDCi3GlruB2B1QCPO6+Vtrv35KBOl1T6LLFKBH0ujFb8vyKMOsyhZaiecDc6mbQB5Wv
 FyMLKT477WtMoacF9q7BFXMSVjgyK2VkphwBYL7rV7ds0QJhdqe7DgZZr1LweoZpCn0C++aWIYy axZrpBiWS5NZcQsrkXdyFSAQMQiHOBImtKqhGNJamXOb/oZnAdWSG+kazOG7ITP8JLXsq/uVm/S y9wNLnIFBGhFRvYqDrz6LcwNnG2Bak9CHrf3pItAyA+qIKabV1Q5YhE7zAgMIsp+/+YKSKycwRC
 Qc9uIKFKlrSullaeGlng/oEpSdTY3GpRtnJ1aF1ocLKPNubanHPCf85maBpotlFCR7e0lqhp
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 14:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216207

* Add PACKAGECONFIG[fips] to enable fips build.
* Split a new package openssl-ossl-module-fips for fips.so.
* Add pkg_postinst_ontarget for openssl-ossl-module-fips to ensure the
  config file fipsmodule.cnf is created on target. This is because we
  should not use the same fipsmodule.cnf on different machines.
  The 'openssl fipsinstall' commandline in pkg_postinst_ontarget will do
  the following things:
  1. Run the FIPS module self tests on target.
  2. Generate config file fipsmodule.conf containing information about
     the FIPS module such as the calculated MAC of the module.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../openssl/openssl_3.5.0.bb                  | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
index 865e04deb2..fddc4dbc81 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
@@ -31,6 +31,7 @@ PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,crypt
 PACKAGECONFIG[no-tls1] = "no-tls1"
 PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
 PACKAGECONFIG[manpages] = ""
+PACKAGECONFIG[fips] = "enable-fips"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
@@ -154,7 +155,9 @@ do_compile:append () {
 }
 
 do_install () {
-	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install_sw install_ssldirs ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'install_docs', '', d)}
+	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install_sw install_ssldirs \
+	    ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'install_docs', '', d)} \
+	    ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'install_fips', '', d)}
 
 	oe_multilib_header openssl/opensslconf.h
 	oe_multilib_header openssl/configuration.h
@@ -172,6 +175,11 @@ do_install () {
 	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-3/certs
 	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-3/private
 	ln -sf ${@oe.path.relative('${libdir}/ssl-3', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-3/openssl.cnf
+
+	# Generate fipsmodule.cnf in pkg_postinst_ontarget
+	if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
+		rm -f ${D}${libdir}/ssl-3/fipsmodule.cnf
+	fi
 }
 
 do_install:append:class-native () {
@@ -229,12 +237,18 @@ do_install_ptest() {
 	ln -s ${libdir}/ossl-modules/ ${D}${PTEST_PATH}/providers
 }
 
+pkg_postinst_ontarget:${PN}-ossl-module-fips () {
+	if test -f ${libdir}/ossl-modules/fips.so; then
+		${bindir}/openssl fipsinstall -out ${libdir}/ssl-3/fipsmodule.cnf -module ${libdir}/ossl-modules/fips.so
+	fi
+}
+
 # Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
 # package RRECOMMENDS on this package. This will enable the configuration
 # file to be installed for both the openssl-bin package and the libcrypto
 # package since the openssl-bin package depends on the libcrypto package.
 
-PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${PN}-ossl-module-legacy"
+PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc ${PN}-ossl-module-legacy ${PN}-ossl-module-fips"
 
 FILES:libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES:libssl = "${libdir}/libssl${SOLIBS}"
@@ -246,6 +260,7 @@ FILES:${PN}-engines = "${libdir}/engines-3"
 FILES:${PN}-engines:append:mingw32:class-nativesdk = " ${prefix}${libdir}/engines-3"
 FILES:${PN}-misc = "${libdir}/ssl-3/misc ${bindir}/c_rehash"
 FILES:${PN}-ossl-module-legacy = "${libdir}/ossl-modules/legacy.so"
+FILES:${PN}-ossl-module-fips = "${libdir}/ossl-modules/fips.so"
 FILES:${PN} =+ "${libdir}/ssl-3/* ${libdir}/ossl-modules/"
 FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
-- 
2.48.1


