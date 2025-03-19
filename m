Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E2AC35FF1
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 06:40:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1907.1742366432469626272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 23:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51732a5c16=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J5Z20b003235
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 23:40:32 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d92juw6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 23:40:31 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52J6eV0Y032001
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 23:40:31 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d92juw6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 23:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOP+0+7J5ByrU7aU02tk35PinISyAl9EvFrL1HSFq0AP5A34tVc2L36nLgfT0oBhdFPiSok3OWdogHxKokYBJzZ51hYDGLGvDDoACpdaEbaO9LlT6f4zbXC5hgThgueK3dKE3EsJ4imed8BuHHbg7FqHQfA+/A87vV5678FucHLPwSemOFiWAWE9Ztu3Rql5HH4ohkDq2+U/YqF8PG70Xjnzx7jgOtIlGud9hhWVML6F8uUAC2CxC4ClvYlwxrQXnICwEpnonF9dHijgC8P2kX5Ev7uLxNskg4vTp2FN/5GIyn0En4kWiFQCxH1VbMGCq9pdo5Al28j9wzbu3k+kNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbeJYcreVdq5ccqM0tlU9s+SsQBXeoyTHYheXOKwLpw=;
 b=KQax6xc2KiAVdJIui8+I2nW/ukYGUfiQM4mWD6xaHq0G8N3NAXCBtG5+GgP0nDoFBBnqm3QXeRJr9xyt9nski/J0TzD6AXwAthDoE1ZLfCTnGb2NGu6pVLL25+dqprbl8dZofkzEd33e+cKQmWTeh0XhykvdSWI9+tb9sbp/l/k4Xu51ZHeJ/+oLwzDCBTq+tNfBnJBEpGAM1meY8zwUZklmyXdz/QVHvpUwaxSxedEAJPEvoQJqineKAwIkcAiv7K05Q07Qf/poppXdQQCkLXiNzu9DTjoXVK3Oo75xpcVvtmeg5p463yTNyP+QOHtNUOWwF3i5fgwH50D0rYRzeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by BL3PR11MB6313.namprd11.prod.outlook.com (2603:10b6:208:3b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 06:40:28 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8511.026; Wed, 19 Mar 2025
 06:40:28 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com
Subject: [OE-core][PATCH V2] systemd: do not delete systemd-getty-generator
Date: Tue, 18 Mar 2025 23:40:16 -0700
Message-ID: <20250319064016.1119702-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:510:5::26) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|BL3PR11MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 573300c5-1e64-430b-7477-08dd66b0efb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nimndzvUW2/NSimIcB3lFVED08wBd41RRFPV/iPYhC+7a67tw64IXgz4zMus?=
 =?us-ascii?Q?A0pafhyVuzlm1cCg/PICv4Uxvura288nxTTlXwtLYkcrGY9Y/lW6BJhIh/LR?=
 =?us-ascii?Q?0eES/OY6n9yc/0GyEM5/60mP2Agn44OJOCQvl1U7Mtv0VH+85fBZRM4UVKlH?=
 =?us-ascii?Q?C5AJ6fM0TOllShZczkrKMy2nsZUNdEAn82IB4n60iNCt7vQxPEpDKmCyRemk?=
 =?us-ascii?Q?F1xYor0OW0LKo0YZ2gDNcL8Yh7QmxYI7z2hil+/0pXa5bRJTkc60vmhf167N?=
 =?us-ascii?Q?NawPm1Qg1jcow1qoWFx9InsOffkiONL+123t3h9ts2IVZPdDfJiOfVwqFbjs?=
 =?us-ascii?Q?30tXEA71HIXWgvBNAjLdE7eWJd6lr6XL0T7ijSb6r9W+m2JHhD7wCg2H3AKz?=
 =?us-ascii?Q?/zQQhRzl7rbhq/q3Z/2F3+essgCZ6ZSiBGS0dNlzBJhrYe+9bA59Fu4YvrbL?=
 =?us-ascii?Q?WBjYxOXoPD1r19g3YT0qx71dO4ameC+8SCqOFRsW+VMZB4Y1Pf5ZnFpVmdH+?=
 =?us-ascii?Q?v3IZVlYFpJvqiBQ54Pqd6KLFKta/rOTKhhAuSnyyEakjxH++NV0U+MCLR+zu?=
 =?us-ascii?Q?j19FbWgeXHIPH52KbptK+yCeCeBIG+pC1pDP8g5ezEwiQ0mNM0iv6rrPeoYj?=
 =?us-ascii?Q?fVXkARXM+H1AbaeCo89iwZ8ovixGEiHyvOVGyW5bROKY9iHHvmH9getpmj2f?=
 =?us-ascii?Q?ka+JKcqK9Al98WRr1L1+wSv2tBde1IXtZYJcxRy71kwN3d2/rF00oiSBC3RR?=
 =?us-ascii?Q?g2zNK3q4fNicLeUEUn4GlRekpAQuGfeF8d0m4AYJJyGDHR1kA9YtqLBxjLsw?=
 =?us-ascii?Q?Fthb3mycfgUF+mfHj4IMqUfhVFHfAu9ecNIUQ9naI3DdPkdY7vJJvuBfz3vI?=
 =?us-ascii?Q?v6kxBsJdEjzYGNwnDu8DOGpvrDFA9igdK+oPElyGz7dsDMmtLOSqSW+dvsj2?=
 =?us-ascii?Q?7HS9MzSINp7oZGJVkeaQ9VYnPFPszTmSGzoJUMTn/UrMyyuQMQ3tA3HIumNa?=
 =?us-ascii?Q?yKb2tanEjXroBlE4uxiidPmObnutiAl8Cxh6RoobWYb739USTKjfwVtfzawI?=
 =?us-ascii?Q?pLm/+8f5XpG0ELz2WPia7gfk/m2M7NiTE2iDZM/6vco0CuWQufvJy81qSAIs?=
 =?us-ascii?Q?HftbX25iUBaKfQpvSx+kc8SbpsSBqYic2GsC3iPBefViX/IflxRZG7VeYp9s?=
 =?us-ascii?Q?AlUBnYb6LBS8WwmumyMqk28EQoO1urZgQSbYGZXF9Q6s6bwbwaEBMF+tjAuN?=
 =?us-ascii?Q?BES3GgQmkkhmZ6/Atg0Wda273hOeh440zL6zozphNyZzAY/qHWpCJ/YtRySd?=
 =?us-ascii?Q?NscA07ooriePGiiX+X3V9iJdwK/9k+Rf52jjf61xfPbJgUS9xkt6IjLrxkhx?=
 =?us-ascii?Q?oFc9yNAdJRBku78bsvzq50/xNQgIUO25eLKSMOx28KTczCAMYA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TfVloxSvTOFJoC1MfxmSnxJdySs1OUUQHeeupc9Tc6ZbpK7RxnfY0zlNmzsC?=
 =?us-ascii?Q?OOoYN9uIkbtgexLGGgRFyn2zyR8OaUq2LzWE4ul48e1mMNv7d9RmrxO21ZCo?=
 =?us-ascii?Q?Fl8ux24+7FkT6xx3LohZnFvGAwj4wiCDqjMim3GUCQvuB7pseOKgiU+zMA/M?=
 =?us-ascii?Q?6maXQc921sYdrsf5ThGpuKpRLlxAGvFb3oKU3Z/Jsy7J+Lz+IUs6yXc5favC?=
 =?us-ascii?Q?RZe6h6wM4ON/rqNns8L9A9z90Zwd+xr74MMxhKjJlGHF4CIpZ+SxdfdI9sRZ?=
 =?us-ascii?Q?c/+yQBmQuz6xMHpiC6iXUedrsBBd1QUaE5+kToE8bK03keiCdHxICo00N21D?=
 =?us-ascii?Q?aFC1jVn+X/HHqsLvennoboheMCeVSxl3TCYUfA0X22xxn3gHSsVRsOgbP7JA?=
 =?us-ascii?Q?qkL0scn44UclE8J1Z1GwY1kpQxM7Pld5E4u6eWxmNux/hHZOsfJczJPyDQKo?=
 =?us-ascii?Q?GxweQiZViWipAOplM56uKib1EGlRb/CZN5CbBFA3dRfwB2yoS/zI5o2+yU20?=
 =?us-ascii?Q?fHny3TkzvKnBX5MQVkJxm1WWs/EN0fzfr5Zfxu5VLrEgAlswZhAWq+gobd7J?=
 =?us-ascii?Q?zcGtqa8VvMVN6f4VXlzVnpra17sdZ7ACsAEpSw3glvH8cegFyA42fv53kNly?=
 =?us-ascii?Q?KJ74e7JO3gF2tUGQ1iP6jIGZKKVJt3e97lERuqqKdkqI5hiqkB48DheaeOuo?=
 =?us-ascii?Q?aJDcrnWccnVXKOaj/uCl8z7A19Ha1H0KJ76EZ6O7qt9QMLgXZDkiB8WoPm+j?=
 =?us-ascii?Q?KFBfQ8DyUfRzfw7pIPz82grCyFy7LQVoTpsDaeUpU8BwwhUfXywfZo2Rb8sd?=
 =?us-ascii?Q?+2d7CFhrHdDaXhUJ06ki7mIEoaqBloveb57RZx27L3hylMXakW9hgEzxEgIT?=
 =?us-ascii?Q?wC4wpOkgnMQEFXp6ydl2BdPnhlPoLhFt3iGSi2KvD96xeh2twn8ly8RSN5B8?=
 =?us-ascii?Q?psVYIwDYL85OwMD0xtn905PBStb8yhe2bQj28h69gsvd/SPagYAH8bAga8Ku?=
 =?us-ascii?Q?k3OiOPcaiUzYlv71rcJtF7Rs6mJ4UB/hDpory1C9lyYYAzB6ohHE2j8sMZD/?=
 =?us-ascii?Q?amYG38ik8A2TFHG3g5ESayC+i7AqqxZJ4dlmMYUasgKYJHNQ2F4PjyE6AQBR?=
 =?us-ascii?Q?sPaJLpyolAEJK/kfLHmFJWwLYxlsmMfVbcqZVP4r7cljF6Ob/nbmTz9J6m/L?=
 =?us-ascii?Q?m1UfGd23LglBi/i1jSsCKAxEt6JKEABbYu6TATVUbPLavCx8PxTIyF4SIhRy?=
 =?us-ascii?Q?V/xNn4uKbH/LjKi8FHyLuHo0TjumVT/wkZp8Ovk/yUlqET/KlTGNai9CMb18?=
 =?us-ascii?Q?BykXcZKhxhffZOBzFE2Jp2nN1Od+qxg7hwNmbeab8o7C4WX/q+bZplpyECX/?=
 =?us-ascii?Q?Of2H3ZLzYSfKE2iSQc1QLmSx6NJwL7Dlj3CCgDhOYn69iP+Za+z1QxM4yj+K?=
 =?us-ascii?Q?eHwZX0TeQkcvZ/r552mUJltJ1TMSHHYILcR9AQYlseNkgzkMwf9BCRvrcb4Q?=
 =?us-ascii?Q?AN+n/peIlgPmZ9Bt7T8zbBS1rS3phRdXE2Gc/GhuCrq818HvqPRAtM+uNYRT?=
 =?us-ascii?Q?gkdIYZ1ebPXgwfKC54s5D3vjroQzvjTs4BXIWMIRnywWi9oxwJ2x137tJ65w?=
 =?us-ascii?Q?rw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573300c5-1e64-430b-7477-08dd66b0efb6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 06:40:27.9911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDF1DZ/8LYtEctk6PmIohTPBvjzS0OwgBPc+Nmvdo10bzwfTwzIRVafX2T1sapN9b6DprIxVIY+5+oi/Ohv8Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6313
X-Authority-Analysis: v=2.4 cv=QdRmvtbv c=1 sm=1 tr=0 ts=67da66df cx=c_pps a=di3315gfm3qlniCp1Rh91A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=pXsYQbS4j7a2ELMgHnYA:9 a=-F0DAKMyZqAA:10 a=YaWxdbyzcwAA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: FocxiW9xClpd0T4bAjW9ZtnNP2lFYBjM
X-Proofpoint-GUID: miZJEMusP1BEGo_UX_7YeESYtQdIEuon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=502 impostorscore=0
 mlxscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503190044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 06:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213264

From: Chen Qi <Qi.Chen@windriver.com>

Some BSPs don't set SERIAL_CONSOLES. They need systemd-getty-generator[1]
be there to work. This generator has been there for a few previous
releases, we don't see any problem it brings up. So let's keep it.

[1] https://www.freedesktop.org/software/systemd/man/latest/systemd-getty-generator.html

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_257.3.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-core/systemd/systemd_257.3.bb
index 64fb8fe69a..edaa2f33e3 100644
--- a/meta/recipes-core/systemd/systemd_257.3.bb
+++ b/meta/recipes-core/systemd/systemd_257.3.bb
@@ -288,12 +288,6 @@ do_install() {
 	fi
 	install -d ${D}/${base_sbindir}
 
-	if ! ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'true', 'false', d)}; then
-		# Remove the serial-getty generator and instead use explicit services
-		# created by the systemd-serialgetty recipe
-		find ${D} -name \*getty-generator\* -delete
-	fi
-
 	# Provide support for initramfs
 	[ ! -e ${D}/init ] && ln -s ${nonarch_libdir}/systemd/systemd ${D}/init
 	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${nonarch_libdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
-- 
2.48.1


