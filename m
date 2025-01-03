Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F01E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 09:25:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.27084.1735896308549373395
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 01:25:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=30983b852f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5038Xc0m018516
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Jan 2025 01:25:08 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43thqq4rf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 01:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnYbpNpLhiLqzY68nLjaqx909Un6UwvTW9h2+axwqmjWRlf23bMGOPp6r9J1jMi36X+9HgMYMDYfASyFhk5jQVGdcHQ7hPiqgCA47GsvfwDc3apX/03DkbHmwgF0BxZCxtaHdLdOLVocD0OVLdXcVZ4QDBXNwxmbN6mdoandMsV9jnEF+vc2FpO6A2Z1I9N6nsbUETwcG3th4zaMZ64mC8IW3gvc7K+YBa/U+UrN06IaHt8uf/IqGOr8v3b5E2vGWR7wYXoA5Db3URn/G6y+0fWGttFTjhf8fRkMQlFT1GNqYzny87b5lDxWGDhYxITvnkjl7m4Df0IVd0BDj29+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RMbA2s2WS42YDJLNdilP0a/67PcUUG4coQi8pvtH4A=;
 b=FW4kvegY6zHrJBwFm/6/UwZMv5ThEUad6xRGZ4LMbQB5zw3B/tNZ4XYHrhYKGpjn4QQDhZE10mFimwwhZi5WZJVfvjvho2/MYeK5+LPHbXasiVwdGvk8UaQWgO6YZp3IQs4FUkbuyPP4hXvN1JcePvARtj3111Pu9bGlMC7BefmGbmskdxiKlh++JwZbi74dZUvHaYC/nZEll2laqiUYjldx0xAKAYHE92ZEwMA49g61nyuwXH8+oHm4pmbTKkC9VYBLNSeH4Nw71bdTqxZArRUU5EVrdCypbLNtmPZL3fcqrZ6y6HMQm0+Ks6L3lXd6kMkndL/tRtKG8ruNDpZfDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7520.namprd11.prod.outlook.com (2603:10b6:a03:4c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 09:25:01 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.011; Fri, 3 Jan 2025
 09:25:01 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] libpam: set pam module path to ${base_libdir}/security
Date: Fri,  3 Jan 2025 17:24:43 +0800
Message-Id: <20250103092445.566172-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYXPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:403:a::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ac0c56-7c29-47a6-788d-08dd2bd87fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lqMMoW7krMTGwXgxCupLBOat+u9GcvgqjWhQNpUYA975/W00gYRpeivuKnWX?=
 =?us-ascii?Q?K86W7cVEJPGLyR4+pAdNuxd0ZYXDZKhiom29VSr3y0UGkcvWxkbwhrvqpstB?=
 =?us-ascii?Q?rLLOD6Lwi7jt63GPedhscl2kovIrSuh6tck9ANswm/VEQe2jUtLV75SsYgjn?=
 =?us-ascii?Q?oSBd/h9PA/15MDcNWNpifvWKX2UL77ODnsY/fscV8oaQS/wXFTBcYKlYY0Gs?=
 =?us-ascii?Q?e0Ig6EvTSvvpla8cR9l+9cfYDw/6pdCI6WSvvD2mTUA2bVf4LxaFejB9WEhv?=
 =?us-ascii?Q?QunQcChOpItZ/rDaEsLcUi2QQsT6NZv5hy/+c7sZITh0sP5hs8c6ChQqjEzA?=
 =?us-ascii?Q?KmurtlSN3FMsLqihs4pGpnLQxfaBpuOLUtdQlCk8MeKXTsSdvqlT4C89uH+D?=
 =?us-ascii?Q?zyhOZDGIIJW3e4k1Zp9u/U/ERL3ZIojcsX10AvO932Mp0h3PYduEmqQmkRhx?=
 =?us-ascii?Q?0ILvCOngfZ/wncRPRsGQeTkLbWFyfH1KZvdD2ER0Ul3tqMz3UP4MB2BGbyJc?=
 =?us-ascii?Q?uDSboTEPe9aeVE5R4EyHMjT3WwfqiHrtvW/pyEUrP8XrDA5gxgQXtPvf+KJU?=
 =?us-ascii?Q?E7fdL+FSo1o2jPqilrpTGL4Lc/cNmx99uHu5tKEwEZ1qSpXa/n4wHBpNQ7sm?=
 =?us-ascii?Q?xr59wFpshLxnv/bQQ+H+0bXF9dLPjCiuZz3bDKF4is2+zuoVYzQRZVvkNPOx?=
 =?us-ascii?Q?M67Pdp2j2e1J7PRoydVa66tylS32CsvL2OnY0U9DLmfi7DjKi6KwR5OS9/xP?=
 =?us-ascii?Q?cHhZGeEMaZ1NsPd6Iq/Gk2xzLGCs4H1Mzq34Zqa3cFmA7KUe0/ClCBB1qoY5?=
 =?us-ascii?Q?McZV+kQdxFiKHigD2vdgdiwlCDoDOhA1fjUAM6hZaQ2+wIn7jxu8XeMbNQpG?=
 =?us-ascii?Q?xRWqS2tpEWO0eDS8RWuQBKCsne7INiUh2vbh9aucBu+ezbX4uvmFISqsbADN?=
 =?us-ascii?Q?4lQsgZvaiI+JeX4SXE08fV4mss/u+/R5Kd2zS3Rhg6RmdVtFBHNozpUA91DY?=
 =?us-ascii?Q?wKmcIMYasw+DsfMXNGCuGhVsI5XEHNDBGlHqg2tLprHlqClramc6+v0KRUsC?=
 =?us-ascii?Q?a4Etvw0Dn74Ycw0asKYgSHmfkzSyECTlW4fVJMYyuYafmHX1Gq/OHnskmO+G?=
 =?us-ascii?Q?6FjpDdqQ40lmZUbp3KzOflX60NRIE7jFmr6FiBFkLBheYggR2uwU/dEx7MmT?=
 =?us-ascii?Q?EjgSDuUQ7nqWZ1Bn8Y79ibeAuLmxRIIW0vPESCpZrrynD4aag7YQKJ3gfF7M?=
 =?us-ascii?Q?nP6OjqodjFxzGbyEA29pf9xPuQpGGdRJZmgdK3sP+QRZQbOtMOBUyF0Tj22o?=
 =?us-ascii?Q?BKgTYV5kWVaWVpPKm5Z9fwcO5EIyEfV0U5YQuo4zEL5tc/7J4V+Zfy5dtmgu?=
 =?us-ascii?Q?IVqZ0H+BHSOxBLihFFeeckk0dbnD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aJnAmht0OcCE3c2ODDzWjfx2sMBxeEROpC/ZWFEiF1vA+4FhbIT6efjXRevh?=
 =?us-ascii?Q?jEDg5gDFzG04hucucazQ/3yqIp1SH3u6iB/IZI0VgKBcL07vSdrkRKfw6Bru?=
 =?us-ascii?Q?wxzdGKHQXhWWl/Fu5W6pzVHI/s1j6LLWl3w2XYDJs0dHYp1ei9ApXoRhfI1b?=
 =?us-ascii?Q?TcxXJqDbNxLkOLqG+20Pr64mrRtIjPfgMX7Bb9c7QWhLmz+ysPDNdWASCYF/?=
 =?us-ascii?Q?PAnbY8fMjmLudOWxaFeC98jgB/eLpRGgRnBmGCve5ZxiILRL0thzytnCHFt8?=
 =?us-ascii?Q?FTPT5P7bNR6d3+AgafJG555KHigHDxLJyUZYXLe5EoTH1apPnicLkGT5PzqF?=
 =?us-ascii?Q?LPW8mn9lZb9bROM7ppGLQCoDmVvIknBG4xyTPC3PD7vviEAaQIJNMSDrmOJk?=
 =?us-ascii?Q?8JHNtFKSnYiNyREGUEakbEXMo26Fef0UxFYq4Z09nQpPGUjpSUXp1SzGjRwk?=
 =?us-ascii?Q?wkGIQ0pVhDwBb6uVICu3IgHDuW3TO0/ZEqRI6grswZBf5na1y1rv6e2JxgrN?=
 =?us-ascii?Q?IwP99NTP9JqHlON45vC8Ndx7CVj9nQxM5RxfzkohMff0YJUa93ID8wJ76WP5?=
 =?us-ascii?Q?haRny+2tkTeE+dS/7HJIkOmMQKo4Qw/S/A9DSQ5WdoTxQ7UB5IKrseqKa8Sv?=
 =?us-ascii?Q?+/Vbr7udT0no0rn7f0ys2RBXn5tEGFdT5IWIiEzj/Cibyobz7sWa2MGn4/jX?=
 =?us-ascii?Q?dV5ginuYw5GF4+JoljWsfOWjd/B5K8gzSzJO+dfrOyaCiYc3+BbwtOQ2oonc?=
 =?us-ascii?Q?kAt9PMM1m/xT1WBqi+MVXt4e81a5qQT4Lcmr8Zr4gr4rcIHg8Opnq6FkWCrX?=
 =?us-ascii?Q?wLquwH/k79BagMYVWzHIIMuIcZ4e/cVLIgbnO+pdkrD52G3tUqckhjcgZXee?=
 =?us-ascii?Q?ea/8S12nIea3aKL0QYSQEDU/oN7PRiMXqVpuowmYfSoquQtutEj4llvCVW6T?=
 =?us-ascii?Q?on6GdoQTb1YDrMTRcR9P6IrSSnV0BXWK/xO4yM8A4dqD7ejjOMlQp30klcKK?=
 =?us-ascii?Q?NXJc83IF7K6UZIFpYe3IkLVkir7wnp4BtUV/Z42N9yZ7Z1iQA4R3CxvoQ2EK?=
 =?us-ascii?Q?rxRi/UtSIEJ3A5kWBgtJ4hucl9I4hufozCIe4nAGfgfPyDEgPhgIZwiez/dg?=
 =?us-ascii?Q?g0onZ5ASrp1TrVxSI0fo7vaaTZeFkhfvhc2AylYSrQEajOPgXeHE5/iINYrV?=
 =?us-ascii?Q?iaiH9qvssrMrEOPGRyYNkv5gk0h+nY5yZYIgeuhodgZhDta9Ney4Q7Pgj41w?=
 =?us-ascii?Q?OpvrqwdOGp9QaluM8EJOMuVQJbqySg1PWhlfSwZ8PFNwYt1t6d/mcvUJpY8T?=
 =?us-ascii?Q?NiNCBu4rU2yCBdAgvbAkJjtxbxAMlIzVkBsupJ0FYv8DV23WF98l0MUU/Sa/?=
 =?us-ascii?Q?5FFCCSYPyjK/2KbgskuFD98qmG4xOuDp8JbzEHBhOf/aKiyQalgFzCWRACds?=
 =?us-ascii?Q?xRRewU2o8V+PRoUIeXM2ZnDOBjeiMB0PsZCAoH9ngddIdwc6QxYu8j1RTZ/J?=
 =?us-ascii?Q?J+TeTJqTDi4/KOQXwnVCxyFihNrQ+o6qJzbblpOAN6nY/6MPIM67IR9ihn2w?=
 =?us-ascii?Q?VvVHWPcF5bfwZqS8oIp8lOjd8tCR9W2CmkPIOZRo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ac0c56-7c29-47a6-788d-08dd2bd87fb4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 09:25:01.3829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0Xg5n7jFIbnj9KdOFNmGyaAyPlT5K2pMNVGwe11YMBRRMs3e3HiCVLyye4X5aV7cLB+FL0MMrLteBLN0YoBgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7520
X-Authority-Analysis: v=2.4 cv=RoI/LDmK c=1 sm=1 tr=0 ts=6777acf3 cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=GcyzOjIWAAAA:8 a=t7CeM3EgAAAA:8 a=Tt3KEgD1KPp9yqgMz28A:9 a=Chkcx7g74zAA:10 a=ar1jwvS_AuAA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=hQL3dl6oAZ8NdCsdz28n:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Lo42uPhZVwPgwbf49lde0AU98FkY5Jyt
X-Proofpoint-ORIG-GUID: Lo42uPhZVwPgwbf49lde0AU98FkY5Jyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501030082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209327

After upgrading to 1.7.0, the pam module path is set to
${libdir}/security[1]. But from the pam.conf(5) man page, the default
location seems to be "Module location: /lib/security/ or
/lib64/security/, depending on the architecture"[2].

Many third-party pam modules still use {base_libdir}/security as the
default module path, such as pam_lastlog2 (from util-linux), pam_cgroup
(from libcgroup), pam_cap (from libcap), etc.
So currently if you don't use the absolute path to these modules in the
files in /etc/pam.d/, they will not be found:

PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so):
/usr/lib/security/pam_lastlog2.so: cannot open shared object file: No such file or directory

This change only affects sysvinit without usrmerge feature enabled, and
has no effect on systems using systemd.

[1] https://git.openembedded.org/openembedded-core/commit/?id=00eb730291f9630eb70480d37ed48fbadecc547a
[2] https://www.man7.org/linux/man-pages/man5/pam.conf.5.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.7.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-extended/pam/libpam_1.7.0.bb
index 53839e8cd3..1be3c9e2bb 100644
--- a/meta/recipes-extended/pam/libpam_1.7.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.0.bb
@@ -29,7 +29,7 @@ SRC_URI[sha256sum] = "57dcd7a6b966ecd5bbd95e1d11173734691e16b68692fa59661cdae9b1
 
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
-EXTRA_OEMESON = "-Ddocs=disabled"
+EXTRA_OEMESON = "-Ddocs=disabled -Dsecuredir=${base_libdir}/security"
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
 
@@ -45,7 +45,7 @@ FILES:${PN} = " \
     ${libdir}/lib*${SOLIBS} \
     ${nonarch_libdir}/tmpfiles.d/*.conf \
 "
-FILES:${PN}-dev += "${libdir}/security/*.la ${libdir}/*.la ${libdir}/lib*${SOLIBSDEV}"
+FILES:${PN}-dev += "${base_libdir}/security/*.la ${libdir}/*.la ${libdir}/lib*${SOLIBSDEV}"
 FILES:${PN}-runtime = "${sysconfdir} ${sbindir} ${nonarch_libdir}/systemd/system"
 FILES:${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 
@@ -105,9 +105,9 @@ python populate_packages:prepend () {
 
     mlprefix = d.getVar('MLPREFIX') or ''
     dvar = d.expand('${WORKDIR}/package')
-    pam_libdir = d.expand('${libdir}/security')
+    pam_libdir = d.expand('${base_libdir}/security')
     pam_sbindir = d.expand('${sbindir}')
-    pam_filterdir = d.expand('${libdir}/security/pam_filter')
+    pam_filterdir = d.expand('${base_libdir}/security/pam_filter')
     pam_pkgname = mlprefix + 'pam-plugin%s'
 
     do_split_packages(d, pam_libdir, r'^pam(.*)\.so$', pam_pkgname,
-- 
2.25.1


