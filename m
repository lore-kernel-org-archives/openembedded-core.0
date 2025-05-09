Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5632C3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 09:38:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10446.1746783481895045893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 02:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7224021966=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497XIMN024027
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 02:38:01 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3f0ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 02:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BM6KYyj5yXaLTjNwZ6+dFSSdZrqziGhhXXpWLBFX5kKV5TcotIDV1gwi3eNKwIv5w0jvh8vPGVmT1O82nGExdriS0Eh1oyTYwI9V6Fd0x9Q463WeaIE07SjWEYK3jbWK8tPGH55E9QsAUjGpaiDS4dyKSJYpTp6qf/fzbBs1yh2FzDgE60rkkl7tA8DqDnNonTnBYXpdfaTAhU2eMT92LCSLVsLCV6LiUNPzWXeKj1xvIwmBau2Izm747usJ07u+3TuaNuxwyy3MbF7mA+gAkN/lkU01BB3rB1o3+MPxLlPLheCE/80ULmznhoUCMRKmfDJk4lOsD9PPc2iAuFvTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ykvoZamAqvWmKMr+2GB7fokyDdkvh+nI8iZ7AxjZx0=;
 b=BLRc/dMUOehFvqjTJulYhJIjuRMXkTxX8phToOuqfWfq7SKBDH8aN+YTmMmXePlrA9C0szjkLATkAdzdvaGstmhGgTYtu9sJ5jcxN08jel4I44HkASmhMio5pWIf9taNlVlGcXYw0s3xSlTgtdyb6s1qZpFRZkAD0NUWTSc8Agh5hGjZpPjwgf84L3lnVNj6H16pPAbhzasBlBzafOwJxoPrlJB6xSWVJIghOlxFoxG7m5v1bHLW2nlkPgbW6TOGf6Btnzb8xw6Wtd8XJTAer43cLIW+5pt00X2N0Qz0NWBWbrU6tFklsRyNisr9Ctd360vIk4DI1EZ1MxAplm4MPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB6649.namprd11.prod.outlook.com (2603:10b6:510:1a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 09:37:58 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 09:37:58 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: add fips support
Date: Fri,  9 May 2025 17:37:40 +0800
Message-ID: <20250509093740.1367372-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 662b64bb-3c59-4fd0-c178-08dd8edd2efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7IFCokZ0Sy8DY8RC22HNfvzOv8mVOmFg0PKU4SI5SIXULOqIpaVEtXJe23AC?=
 =?us-ascii?Q?tmyeBju2OsSROzptMN8VvUIXlWh6RezB29H69I+eW3TfLyh5Z2ZC562xrqL1?=
 =?us-ascii?Q?xtx55KotKX40y1L0afpm6J3ufpsKtld0+tODqsX66IfSV8wr58m4SvNWIbzb?=
 =?us-ascii?Q?OYHjRHgjBh85Kcnz7K0rZt2F0JH0II36AQZjWggm573pd863ZZaZ2TEUzpiq?=
 =?us-ascii?Q?JgB5aFtIWmHbGPSCIC+f+B9qrQYj6vb3nA8oZta0T+HMUiHj4mOzX/Lwos9j?=
 =?us-ascii?Q?7AagAj03MEo6nrqsndCdt7lpH17kQMUOiziVMn7GjIbYOLcjq+c+ocPoWdGr?=
 =?us-ascii?Q?UM8A/7NIPRP6eb3EesfyhuJX5eXKKuorPThjRZFEH5iLJ2F48yF5dVHrmcur?=
 =?us-ascii?Q?nALZHSMLSPOrtgtjiQJOJsX3d997XUnR8xcOv/keAxE0bs4PVhS0u5kQGmbd?=
 =?us-ascii?Q?Gm4lpBOMhIT9On5MlHR9oYvnPFLRumNcTsK6wP7cpVTGXxApRswmL7AQtO+w?=
 =?us-ascii?Q?S3HAThjBzLqjKwaDoufbp/JwJQXlZcPjiwqQxgUP+3DWBGdZRqZ898fPKozX?=
 =?us-ascii?Q?W6s4UGk5WlFYnIfTxNiLYngW8JYbYsyujkCBBf7S9yHRHAsWnvEJFrl3/8Uz?=
 =?us-ascii?Q?1Gz5VpMyyW2F52Qwk3+8H3pms3vvYOdKTxmfeamBMSzAvB/bURkVtTOp9fAj?=
 =?us-ascii?Q?jLc1FiLNMgXy2Uy7EKIQ6ooRJhexxJewc9Zc7NaSCPJreOjAHZP6TzEalW7e?=
 =?us-ascii?Q?jHMWlXcI+wvxWCn/UKNu/Qqyhg0dkbn22LaUd4ibihKkxxurWiNebWUfu7Bu?=
 =?us-ascii?Q?3o4KFxBe/jTW6byYP6skhQMy90N84MS+bcN46ZA0ane/VfeOZRaQp/5Bjoae?=
 =?us-ascii?Q?xARAlnc3p0vqavEXJMGvsjVXZdZs8jsRg3tO5vVBmi5vLWTK3ITR4RvmfxK/?=
 =?us-ascii?Q?gArSCKAslGHu4U507HEM3pAG5neuIXJmzE/Zz4pCXrRg4ULyWDaKzcnkL337?=
 =?us-ascii?Q?i8ENaiZk3ExqtsKMMb1BDHtCS2ky4hpQe4nWnKKMZwsX6Fs/mG4WgsuRbxNj?=
 =?us-ascii?Q?Y6xfSFG/koiXxAGdD/FWdv9pXYlcPxF5yF1IpyLHZ4bQt4x8IcQnFa47dV4i?=
 =?us-ascii?Q?JrSvhD2oQVfkAJx9KqpuPR2Nm6CA2mLGZ9wEl0Z4/QZRkEN6c1AnwPupia9V?=
 =?us-ascii?Q?I23V7xyV0hrRdB2k0GY+M7YlaT+2Jnp6Bv1gsE9P+n+WSu4HJgqqjdO6sULA?=
 =?us-ascii?Q?ojA+eFbO3wUa8CYGaDgzsTV8J9aLByxEcOYYuk1uMDbNDB9otL1j0ab2knIW?=
 =?us-ascii?Q?SVIaKi2wuhSP1oYfBF5VALSuyl21dAIEkTXYzt4kgnNVp5F4LAncyCYLQPPq?=
 =?us-ascii?Q?Jd9zNrT+vqa1bwpcvxfjkGhry6mh17e5TKxT2alX2D0i4G74xnn1ojzoZwuy?=
 =?us-ascii?Q?drrBrzW6x7PSOvoXQJXISomw3qEBL+/dQDSX0vZnnF5MhwqPyWjcDQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e7yumC9NpTgfhwiDPcaLC8klA3zJI38leuewZWDyjhB0C/Bc/vWITxs1cK5Y?=
 =?us-ascii?Q?M/mLWD7KyJpY6QAet9hs19loSdLCJgU5Z6Ru4FqVVffbPJaVi9+/VfZkVcwM?=
 =?us-ascii?Q?q53SCDTCtUhY+H5xj1xvT9O8R+aRFVxGdaMVxQTEs7JoWPOyY5yQwtuSgOW0?=
 =?us-ascii?Q?Ce47nPMHDJF57kSpKONw86kmtZ0N+XYUeDJTQmhpab3Bh2SDwSS1hqIaza+J?=
 =?us-ascii?Q?ZPNHheH1l/Wx/roZ/z2DNEBIdPnC4PZnnZ1jAnOloXJSN3yMb3wSRc1qFwKk?=
 =?us-ascii?Q?w+fVaiTuJoENAHeSx8Ei6ptkXcgCZBmfSrgKCm/BzAJF8mSgF0C2YFytvsIq?=
 =?us-ascii?Q?IQx1qmNd4/8DaQcns66htSN0iJO0NuRp6k+xPVEL/JE310tViPb3h34ydA8F?=
 =?us-ascii?Q?nQkBmyTLBSpVKdp2hjzhuBGe59eQhfWR+9PYGIDHw7wgP1c7MffMMVMK1vS0?=
 =?us-ascii?Q?AMQH4QarrVdJoswARPQQ1k9bOPncoeUoLYW+blHMYwrSQ0axePnvW4iuKJ9I?=
 =?us-ascii?Q?p51oc7Gi/1KnrY+00GCFuCDJwuNMh5MBMf/jgQbSLAW37AVdDoGcpuh75z/E?=
 =?us-ascii?Q?+aDfVJmEVW2P5Npf3RdmHziv2pVFgMMe4G9BVxUwMISgl8aCD3HnztyaLpge?=
 =?us-ascii?Q?v5l1kJYPRRMbnZF6qL9g0cUVpK3LGSGfIwlrf1t0DTu75V9BG12+E6zk+5sL?=
 =?us-ascii?Q?LJaj2Rgr2SuGcT/BTrEnZzdE0da7goz23KT0XLGLHAsvVkrRdkWgpA1La4xn?=
 =?us-ascii?Q?CpQcJLKqMLEIgw0aqsH7oneuAE+eXprXTbLMgbdKsVqJXlKlby82YZh+wkg7?=
 =?us-ascii?Q?RmSCHuh8LWflMhc1zKWR6iYE1xUHe0ZDF8VXx7FmikKZwE+Cq10OeUNIJz7o?=
 =?us-ascii?Q?fUPjJWvdRYhRnmpYv4tin2mhoCAdz452ojw8qbAFQFvRBQvc4orXdgkM74kD?=
 =?us-ascii?Q?MeGW/OKfm5KWEXv4xPlhrO/rS2DOfg1hCkL8JoX3YVWfOd43AI9CFNXXmd3D?=
 =?us-ascii?Q?iE5GJ8sNwA7EMirmuc/m2w2W7o6Nr0eNe3WX+n6KOZlbJZJ0DVl+9IyIxDXM?=
 =?us-ascii?Q?dNRevBau1CgM9nuOAkl7KZGv9g1TrjqlPeIptMO6vwZZDcwbwcjV3r49FcQs?=
 =?us-ascii?Q?/3dzt2/P5NDkypGI4I+BXIPc+sNSd76MxnEMaIZcFnQ6n9P2djEjJvBFAhDn?=
 =?us-ascii?Q?M/SMy0siouNWjnd7Dng9GqRySc7bBPgqYJZvfoweSOzjD+keA/SSaj4sHvfi?=
 =?us-ascii?Q?FRNcMrj1YP0tlzyOiytFLyoynkLHiv1740pmWDVKDjglcW9/7QrwB3GFtJKu?=
 =?us-ascii?Q?dgFo/c7bVn98af1tJZw4OMm/wkCm4T2M5tZzwQgccrIGLRdPH+wp88zXb8eA?=
 =?us-ascii?Q?GSPytPgz1u0uxr5fn8qtbHEeZyuxFuYvpgbEo4jmrtB4K/aK2oOJ3KsrF94R?=
 =?us-ascii?Q?rJAMlzXIFHboGOXIlCW1uPSXWEwkyRdaPoHS5Yi6mD22+cNZObnHq9+jApoL?=
 =?us-ascii?Q?5SBUhq2XiH+cOBkd6lA9eWf80mJ0Z7sc/Rem9bUBffGRTsOOnrocu2PCdwXF?=
 =?us-ascii?Q?CkkD4HzOmG0nnfq3RfSCkEg0+j8jyG9wT6aGn2jc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 662b64bb-3c59-4fd0-c178-08dd8edd2efb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:37:58.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkbDwGmqh3guI2aDVqaxHK8e7br/Cj7oxpU76Mse1UoO0F+26HCqw2go28TuqJNPP6t/i34I1HrTAImxs80a1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6649
X-Proofpoint-ORIG-GUID: FkJXItINTo4qSQ1AydCajIr_lXmMgqvD
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=681dccf9 cx=c_pps a=9T78G36u1E64A7MtQSounQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=X0CuYVNeYqOLpcntE54A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FkJXItINTo4qSQ1AydCajIr_lXmMgqvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA5MiBTYWx0ZWRfX22luAu307KpW KBLCSYISq5r8H/3FZFkp8No4fJW34oORk8ZV14mjzenOoSfnhz6EOOutCTRPAktHueDkU64iKGL WpLG/TX1EIacaG2kyDc6G97RdP1n+mLBd5hPepvwlBSC/srurPhbQ7FKHFFBv5wQJpw81+rM+tx
 jt6tMSTXtGqoQ2ZUsApRH6Q0rpE6qccsnh4bDSwVrfTPXKP0mv7INmPT+4o7tyd6khSky2NFvog szcaxJ0fqzmGnBp9pJmp7e5dzR4CmZiyltXSGFmgXKg3sxKYJX65+U1Q3pqJhqhdwKxe+lzgPMH irBhCQRW69XGVglFB7rjDRMTbLIAonOeOmt/0c4FJ87CDijHpYH8SRbq223lGqaq933NyvNL+Zn
 jmYy1xLfADFYDSTBkmVTm6RWAasFSUDpFi+Le9rFH1aYTA6lAuZbghULzY5wBbBLzTmhmNVk
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 09:38:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216189

* Add PACKAGECONFIG[fips] to enable fips build.
* Split a new package openssl-ossl-module-fips for fips.so.
* Add pkg_postinst_ontarget for openssl-ossl-module-fips to ensure the
  config file fipsmodule.cnf is created on target.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../openssl/openssl_3.5.0.bb                  | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.0.bb b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
index 865e04deb2..fdb304c73c 100644
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
+	# Generate fipsmodule.cnf on first boot
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


