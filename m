Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6919BC3ABC9
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 07:28:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9975.1746689313310897695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 00:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7223a9f982=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548702lW013434
	for <openembedded-core@lists.openembedded.org>; Thu, 8 May 2025 07:28:32 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46e430mvxj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 07:28:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IO5ROrVyMzY/8W7t4L6DyittV9HH0+aZHHgN96H/ogq/VyWEoLJGhS9BUptngcUZ66KqyB2LzQDDshemI2M0mSNbDDyLUlwTSZtIuD+i7rMklmYijZQvGzgIsMEU4jyRfGBaQoMW59MI9uL/wZdArQBoC4yq6i9ygkIOBddnGz3BvjF55fIfnuL0G0v2pnXzhtc07n4yVyQcFEOc5gpSZgnnmjjwpAJGEKXnBAn7znL7kAM/hfZZgdUVY19Lz6X8gcKdvZNlqgW/GtzeGkYy9CFuDA1QSb3zWGgYpim2CFC3PLTRr2q9N29s7w7XFMyGumpocAOnJAXf9AOW7iMaTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhDhpDUwLdbJKPFhsb8S4zVlW/cBRhixK2K1bXMJ6po=;
 b=muJMng4lQF/dC6O0MohVJEWxYh5r7tD7B/5DfWbJDSh6nb4+YokEWC735V8WeqfksTddRbR51iZyX63980NPyQs0nDFEyvcDcFyoDdsXWoW2LHbwaDIPoYKc58SyGPBFpwomHr+G1OX0W4Wuaxe2LHTs5d4cztPUI2I1gM4A2T+EM++BIEHnlM5v0Gw9fI0RAW0aedSoNPcr7xxPGu8lZqUWqdgyrzgdrMLyuuGO2aBBiKpEww8xH7JuulGbjc5gFCQMDNXiz018nZx+qe6tECaY13i4EO3GnIZkki+iS77JSyjMPRK5SFZwPCi4p0gEY+S/trYBPQdHWQbTvKPyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6653.namprd11.prod.outlook.com (2603:10b6:806:26f::11)
 by SA2PR11MB4873.namprd11.prod.outlook.com (2603:10b6:806:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 07:28:28 +0000
Received: from SN7PR11MB6653.namprd11.prod.outlook.com
 ([fe80::d322:da3e:6319:55a]) by SN7PR11MB6653.namprd11.prod.outlook.com
 ([fe80::d322:da3e:6319:55a%3]) with mapi id 15.20.8655.038; Thu, 8 May 2025
 07:28:28 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] coreutils: fix ptest build error with single-binary
Date: Thu,  8 May 2025 10:28:13 +0300
Message-Id: <20250508072814.106107-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0223.eurprd07.prod.outlook.com
 (2603:10a6:802:58::26) To SN7PR11MB6653.namprd11.prod.outlook.com
 (2603:10b6:806:26f::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6653:EE_|SA2PR11MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: c33b8bc7-41d9-493c-c924-08dd8e01ed1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rZlLCSxkbbOvMQcKPA8NMtEXE+prSbneuqTyPQ9VT2aKsDTl3HGHhw+7GXca?=
 =?us-ascii?Q?B382AAHM4zlkIs0g8VG3XZMpjGBEAKclMAVWY7voZCMM/12DcwfRJQeAAuCE?=
 =?us-ascii?Q?nxN2dqM7cDvgbbpml/VRIu/AP+B447pzQjyuZJc0oPk+D9epbVOfxySjK/rU?=
 =?us-ascii?Q?MomCs/rnWM0CN5CvfaNGP/Z3HbdD9vvkVPDDrmQgIfjTTN33t28EyoI5mwx0?=
 =?us-ascii?Q?6EJW1HWCZw//mO3bMWtKl5tAt1/ITPs8Ddj2O4TbPtIaC+jFXUaeDJFD2Z9x?=
 =?us-ascii?Q?57JR/TjyP/2S0AWgSCcN3M4bjLVZfj3JFqhGzBLrEBr93ZLzNpfPpBoC6qG2?=
 =?us-ascii?Q?Cr8AWDPPso/jmn41NB7qKP/sWY2iBw2qvL1QBP00hQmisnfsofX7t6ID8CH9?=
 =?us-ascii?Q?fLrmze0NSQx9pOeiyFZyIPbEZGGS9nH8UtdonVqOSXvKhjvTUbtyWMcoFTBm?=
 =?us-ascii?Q?pMFVRO0lH7G7lTTR5MDxQcxQRAPlI6DanTr4aMshi75wv3Cyeao0V6E3jznc?=
 =?us-ascii?Q?/XkQMy3qtTtxM9HX7WMGNP7xXMCqfAErwNBQcJjW+OlYtuP2QJXKy6NwF/GW?=
 =?us-ascii?Q?wyKsVjzHEDSuLX3bYfEdIUUlpu+fEa/j0RitvNH0rSfI2gwtrJdX+cEUf2zC?=
 =?us-ascii?Q?oFtjDAJzxq9I/TpBlGh0ve3IUTA06ER45UW5Qk6KPQozSI6WpxYM3P16kemk?=
 =?us-ascii?Q?ioY9AedjkXfmayaW/g+mOoR7BrfGXvQIqr9DcT4xZp7pL6xiSYVNRrYh6ejb?=
 =?us-ascii?Q?PsiZ4M96BxFpBXnuTih3LjymfBi2M8+aCmLh7hRlY+kTpsugv5JHZ/LcQZfw?=
 =?us-ascii?Q?DxdzQM/DcT6+fDVRJd4gEPNXxzwYlQoRTGAnAAh9Z8oKlbd6dyiiPx09ccGR?=
 =?us-ascii?Q?heryswbIcJqSyOIFqrZzoRXtiFoO3xCGCFIObbqPKJbYO9wNOv0QNLULADfs?=
 =?us-ascii?Q?SFMo//svjbjpmuBL9N/jkjb7SugOg0bgDC2sUxZDJ5zdCHIniCBOcPXy4V6o?=
 =?us-ascii?Q?U+9Kp95URzaV34qe0d6HM/Ck2quCuGBJqSyLd7FqrxU39SV3OOzAb2cAWaUB?=
 =?us-ascii?Q?2RMahNoRzUmSlWHF0WUVlqg+Q5guzS6HvMLypQ8bA6wjmgf0rG5ktRtjZeoA?=
 =?us-ascii?Q?g5BlMYwuTbk+y7eXNFb7rtx7/38cqxu5Rrl04b/jqmc0DMadXkXq4aHoTraJ?=
 =?us-ascii?Q?IB2kFy3Yy4TAC8jSuHxEFCQuWqVSBj2iaYolRnzifU2dCWL9f4Dv8I16JLi3?=
 =?us-ascii?Q?tPvKxNmc70rfcrUB5aG5HKVvmnOgyt5OmUYHF8diutwrP07MhHHBsbS6Ppcp?=
 =?us-ascii?Q?t35WHXMhByTVtXlQT5VeBhwPJg1QsY5mtTgjjIXxvPDXwhtFXsP6Zc/lK/EG?=
 =?us-ascii?Q?K+NdOT4NWDFZ6PaMc4VB4FC/hVwK8G1jvo+S0Uicrq1yBb6JYHIxwl5sBY+W?=
 =?us-ascii?Q?q66H3NkwouS+6XpX8B9A5wVgDjPLtacXsx1Hm3MpDK7Ek9EK8qNQYA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w5j2zkCF+QWZvd1vblPtYtZtNvCaEJflpL/d1JRFk5OAPuAadfnBGMYvH9JL?=
 =?us-ascii?Q?1wDZvCATwFGSCUPaDUArJkh8yK+VlJLWN7fezZP1qTjsB1kt8DKMmOtRGV9g?=
 =?us-ascii?Q?7eO+Nu+S8F35BImGy3qDueGn7D5cbghLOF3Q/dqsYW/9CblTtWBth1CJKF3w?=
 =?us-ascii?Q?qhr1GHTEnHWwMInJ/4NOx+EZbyn3X+qWBNAt2q6gpRgJyai/ZjQ6VyWSy807?=
 =?us-ascii?Q?3yPodYVMHboh/ocqnUgTngNnDHsZxn0rVSAki0MCgROxImEKTMBSuHaIEIaI?=
 =?us-ascii?Q?yLVxYpmsCe8yR39YNelvtZVDjuVgwCc8glUUM30AyN9U4VBW0eiFy7FrGh31?=
 =?us-ascii?Q?Eq7n/Q+0S2LUH/5YHDsxN7uV74z+gGiosElwZqF5tfGMm1+0/0a+aWaSLDU+?=
 =?us-ascii?Q?ti9Y5/ZkKuHeL4hpZJD4DCFeiWXSXCX4k2Zs6cAFwW/hgo1iJziggwONuSSM?=
 =?us-ascii?Q?nPPs6j8SpXiuFJtd9DatuSACoBYZn2MlDCgcYwQ88aqNy2ZEOcWfXiD79Tc+?=
 =?us-ascii?Q?gMZaLOTlr7Yfj0g88PeWEHEvxDebbZF4LgRGitLZHl/uAueSLT2k9QEPJ+oz?=
 =?us-ascii?Q?fKy4BIWusJKNVGM2dvNoaIICHasguvoc+3fvFa3Ol754OAT06ugqg7Xuyu2R?=
 =?us-ascii?Q?m4RJlOp0/SvoJnIl5cpsssrZyNRj4SaXD30jjjkpeGwLl9PbDVelpB5h9Y9v?=
 =?us-ascii?Q?9YuCZT+vMAroS9w7mL2iJE4i2G9riSEwPtsGRRYxeo3pWIida7ufuUza8MPC?=
 =?us-ascii?Q?JnC98kZoGBL3QaV+KNyka+pBZDauZ6Wlv5GToy49Y81U23mRc5/YjhiOrNCL?=
 =?us-ascii?Q?AFzVNX93uDcdhv8Od5NyiFIwh3xdbqi4RxQgfqCf9Y8ohP8hQgo4V2TytMcy?=
 =?us-ascii?Q?+3sRYFGIqPVUkXdXGkCmd1Y3/2llCwdw0jq6e4HDp9oVJexFhTqkGluTqVbJ?=
 =?us-ascii?Q?SuDxIH4aZGSy+V86QA7EMEUVvxDvPkcM/un5zTLfYq6ddkoOIQwsDzOBc1Y4?=
 =?us-ascii?Q?RCKQTTlkQjMvQl/Zv+/peyMx1Q+5fS/wfSnAaX4W+Gl2ofnrdNDav8WvseVl?=
 =?us-ascii?Q?JaWwbyGl53KcggT0v2OhStWNiGC/zHDj57Wh2u419RzOL767Qi7rDQZDGblc?=
 =?us-ascii?Q?djz2M48/uPSXHYvCmLN4gioy8cG6mPNPbJOxw1+3TX23HF+d2MQP7DpK107q?=
 =?us-ascii?Q?DI4cYGYOmuiOfi+XkzvQ+0ltu04PJaVaR3giCdkRlQ7c4k+Rqa2gxjTyb45g?=
 =?us-ascii?Q?yfzGxbg5NawYJKft8F7xDwaeG2rmRnlSneNaQMJ4UsrgpXVS8H7adFzADg6R?=
 =?us-ascii?Q?Sco9jMwIro8IakyKPgnUPMayzuDoCTs9a/5DP/hzLS519dRbcBE0YELOnpAr?=
 =?us-ascii?Q?aNn0gbFB2vWIdkabH04dspiuVB2SsFpyL4LKP1BlX40rf2IU2xav6VNRYarg?=
 =?us-ascii?Q?6qsD8rH73QpxFS/XuI2SAbhTBky6Sm7neSF5ygC7MPjBy8gyJxYvE5vLYAoU?=
 =?us-ascii?Q?bHKI9YRRXtVmn//KzJ6RUHswYEtKJdqeCXOZgwrSFl8/NiaKSf+Vv4HqiOD4?=
 =?us-ascii?Q?uZ6e2AIRNPgxvVDVds3QQXUSfl7/R2qRoRqza+M4EJ9Qpox1elSxz2uzSgRs?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c33b8bc7-41d9-493c-c924-08dd8e01ed1d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 07:28:28.2357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeGGZRlILgfNOFGjMFde5R/w1sURdozw2FbMibhrjhmAu16gwZ59uz3CLJHSSOmEvrsXDXYPkOssECtMPl08epjqrakLcf8VaZQZq8fa+lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4873
X-Authority-Analysis: v=2.4 cv=BajY0qt2 c=1 sm=1 tr=0 ts=681c5d20 cx=c_pps a=yneE0G6ieORTwLKR6pgPXw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=He4WCsfvbFp6HCH0cxsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SUi7a4z2p50RVs25_pUgPkq5KSg5qoc6
X-Proofpoint-ORIG-GUID: SUi7a4z2p50RVs25_pUgPkq5KSg5qoc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA2NCBTYWx0ZWRfX5DMcwr5/RzVi 8a7LkvjKOGLD+NItwpAr6Ja/uwNH+/DzTQTxj9NXRDfNvirwvm9vjDrk/m9/CuUHyYkv59Xn+a3 gwy4i90yTuklMsjNMV/wrCKX7KhpJ/HgRdVLZlDCjzSxxO1fe1juimiPFS/75r3MSgLkk7Cx3Dj
 zXgaLgG/mNCldQ5GaldHVbpYnANxDKCPGoG3LX+GlrzztXhn1ItGnVQDzaZdoVjYeWFVpgiMwd5 MvV/gsFtQYyhI10lARWEdM3/jh3ss2lPyjJBngkWANBR7n2m2Vpdpnvlfa6MAf6RE390or7+9md ig3JHUmkv0E2o/emPkJXAmaEngae53saVkw0KuewXFyCRpUoL2ARKTRlz4POcovdOllI3iPHlK7
 MejzaQlPhFHQq67buukAkpTN0dd+EOJvMYeeTKVDfG4YRGQ9dy/DPQ0ii4i/ILglXJ+hJl6j
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=802
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505080064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 07:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216144

From: Ovidiu Panait <ovidiu.panait@windriver.com>

When coreutils has 'single-binary' PACKAGECONFIG enabled, coreutils-ptest
build fails with the following errors:
DISTRO_FEATURES:append = " ptest"
EXTRA_IMAGE_FEATURES += " ptest-pkgs"
PACKAGECONFIG:append:pn-coreutils = " single-binary"

bitbake coreutils
....
ERROR: coreutils-9.6-r0 do_package_qa: QA Issue: File /usr/lib/coreutils/ptest/src/pwd in package coreutils-ptest contains reference to TMPDIR [buildpaths]
ERROR: coreutils-9.6-r0 do_package_qa: QA Issue: coreutils-ptest: /usr/lib/coreutils/ptest/src/pwd maximum shebang size exceeded, the maximum size is 128. [shebang-size]

To fix this, use /usr/bin/env shebangs in ptest files and get rid of build
host paths.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_9.6.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
index b876a8fdd0..fe2cf73d40 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -215,6 +215,12 @@ do_install_ptest () {
     
     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'single-binary', 'true', 'false', d)}; then
+        find "${D}${PTEST_PATH}/src" -type f -exec \
+            sed -i -e 's:${B}/src/coreutils:/usr/bin/env -S coreutils:g' \
+            {} +
+    fi
 }
 
 do_install_ptest:append:libc-musl () {
-- 
2.34.1


