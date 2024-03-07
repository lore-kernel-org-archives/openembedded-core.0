Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACAEC54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 02:27:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14037.1709778455546425349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 18:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SFuRtfB4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=379604a212=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 426H4PZ7016198
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Mar 2024 02:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=pNHbolOPY8jCHw7dKGdV0Pjyp4o0q7F6Rql713Plpmg=; b=
	SFuRtfB44dGNI2m03RSImV009YAymB6U1Ei0qCUCznUfgthIHNMkUmpm/itbZD5N
	q8BHqH2ruIlfJZrx6qND34z47nTUBS3HVxqo0X4heGJkq1FmhkHHA65bPGz6BDyc
	MkVLjG9To5ZZ1OfTATndFwCoqyPN6bm0dHSSztPr6dhd4oD9YI28z4nhU4G0G1za
	C1q1H+HaSMV3oAp4VG398M2kP16lLRm3llde2bhntioJP52iTqa3cgGrJpY7MrTB
	kHB+vYavvuIm4RPF5WpAQJqD7RK6zLmkIPGmXRlt5kCfv+6GmQRpOzVpuPED9Ean
	2m3zEd7qA6jYwYUi8Anc1A==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawvpk7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 02:27:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jaR64F3cOP6FeKz8afVzt1aPj/yTjwdZqinmVJb6dndBsD5PpOb0bnaGpNA18dtV98A8A45nWJdTdoK4fL16vUvYIvpmZUTty3t/yhWGIoOa7XAefJKaJvmCOqmRRUF8PIvorBJj6cesUuqgV8uzfo+3sH5iTTgh+rKiQHpTPmb2U4XGlz4j4/CeBCgd8UEZmRB6merFN40qN4/nVJmaSwZgg7Y3l0GCigwM7rFdAldBKDquDRlSObRs2L4e2aWxo75SX1U51h4HLWmFNrr0qgulJ33GHP1Rs9lK4jjXeb0sV39ti0UrPi+whREJw84lFhUn4KnGJvdOXNWAJIm33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNHbolOPY8jCHw7dKGdV0Pjyp4o0q7F6Rql713Plpmg=;
 b=kFAYp2fhtwBMUvhxT8K6hXTRcPLMIF/Kw1kMo8HlXKd5O6JM0+5bZbUNbxSPsqq0W1f7Cfqej0xlIDDq66wsqAWMSthkq9IjghMrcU4w9ZzLWYrw29u7gxeeLWX7RG/J2+Mzxx+WghV4TtHJgn3qVi6Qw5c/ryrWGneFMGIZZ+UBF6mypyFpvoY7tVgMGVXiOH4QxQKwYYY9RyYD1BkEwWS7HWJ/ePccoXCu5oi1RzTn+xtA6wte/b8aQzSIryccyuG3rfcLUaTKS4QTLjOWnp1NTjfdxzkV7tB9fsaEMJCFU4KYujWzZFoOVizVGP74lRWSWkOoz3/2ivzlMdX9RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6; Thu, 7 Mar
 2024 02:27:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Thu, 7 Mar 2024
 02:27:28 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] systemd: remove systemd-bus-proxy settings
Date: Wed,  6 Mar 2024 18:27:08 -0800
Message-ID: <20240307022708.2061916-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240307022708.2061916-1-Qi.Chen@windriver.com>
References: <20240307022708.2061916-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: fff90bd7-465c-418e-3cd7-08dc3e4e21a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SIYhr7Dr0+EzueDN1Oa7e3JODz0bZYBY9GOvoVvqHBBk0De9EDqUyVdpEf7NuawzbYOhcOAYVYw8qx1pTUFbV5XQ62bD2wCQ60cEXVh0yz+tA4XTnLsPxkfefiI7NpncjFSNtMKIFIfmwu/T4YJgwY8mAfYR5C01bVC98qRd7wgB6RcVjVvk/FD+geoKCdTkWdWYtv/9pDJwZ3+hg4S8ibCT6Cc5h1r77pU8c0TAkMmVZ/MTKtxQzhbFhzw99QqD4fqauToEAuslaZ/+Vt3bR57Hu1izU5eCEf5SgsYAPhFbIEFGVN1Ch6yYpL+r50/Ou9h/chxrNw4jMl7w+ctN8eCh+3JbGyXAPFEPuNhfoY+i9Rvud+ALsSBpqEbX6ETPSTUVv2fLya5fPhrs8OuqEtxy2HaayKEkKCjPR3YpYhwZqwQGlxJkSyDf+eqdsUDOjZCASjNBqfQtFptBS0Lygkik5E/jzk7KTXzihbQq7RlM8q67H2temh9NeV+SKUUe0RbTCt6IHZB4ePQmZBWjvX2LSlv2ZIHzep6a1KbDLMlh31ruDuwn7Fd8JM+5wN2Ga9a/TKg9JwDQgfHEXoO3mLHsgVcuHcXvm09PL9/hjrOALx0MQz71+DrmQ6GhTTiYgTKp+L1QhID17F2pegvNOusjmBX+Mz8Ouqdy6AgT7uIZjvuKJHdni/f4MCuPLvpIb9/zS3+8t6SZcfPRYs4GcQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GBzazGAvUCsd5Eppgvq/z2aDIutbbVEoHaRX+tyRob3JGk0sFVSI8TXeIBnu?=
 =?us-ascii?Q?TFSdR8Pwv1wtFDzaiMkbflI2dosCJMqHWP95DbcWRbF+X8OLQLAEJ8l8PFiS?=
 =?us-ascii?Q?4k9VrLwqYORh2QIDfepYdmZlPs/8aXqJaEtBpIgRtuQHbifOY2SP+oWDvC7O?=
 =?us-ascii?Q?oVK42b+Vk678iMCN78g1JykbnyqXbysXRd0F/iyL8pI89vTcnGvDGkVSrhuu?=
 =?us-ascii?Q?XkDNjj3q024pOGx1l7iuT73/G/BSjRVIwIjIWe9Kmm8Hr1sxG/QjPbUU0pXS?=
 =?us-ascii?Q?crdImHs/l4Fm8RZMpJ8xd8GxoTjjJFXGse7q8b+T40IFWbFAuTrEPdyfvjDF?=
 =?us-ascii?Q?tx0MtgMSoP51atdQMQ5Agp1iXImrKkh2kCpX0tPxs1SpeNssOtMT0FZm82v5?=
 =?us-ascii?Q?MpzwKqchMRe6i/WVr2zbswy9Z/9LpBR7oEZ4ckYVbH90f7RI2nkolqc8DFkx?=
 =?us-ascii?Q?SuYuMTwgsbBOrOrWVTjSmfKCqrEwxL63CPQtVHoMsbmADH/AdGWhs7o/pu9T?=
 =?us-ascii?Q?fU3IRbsyyz2/kPd81meG445Mz/Z/F9zNMBf7+94GtRV9WUNpCjRoKAssb+hI?=
 =?us-ascii?Q?TR1qpHbNrU8RqJJKgoGM9/JBwmfWDviZ0SvgjCAAo5iSsF5ejVKpixywiDft?=
 =?us-ascii?Q?1G8uVln0fYWOtbjo+06FbYQ9Js4aOQCoqI4+1KHmaBMYGRZQp8LYFGihueLM?=
 =?us-ascii?Q?9eDqzDOUeFiuI/XdhR2WHm70yeuEdICI0hhDeP7ubVQ8dZlUwKhE/U+6xdE5?=
 =?us-ascii?Q?gYv2Jc7AEZM9msPduWLYBapcUHIay2Fh8mXaSLXH1P9zJhm8jrb24SUbUD7V?=
 =?us-ascii?Q?GGA8kpcR/+kklOmGXI7brkbVar77ygVhdhsLLXSBcnX8gOweWvRAE+I0pjIU?=
 =?us-ascii?Q?+IKsayas2+MXlfFUOEgloNrEFWzC9fJwQ5/Ui9k0cEyJdiWXvqsY/BmwIqUm?=
 =?us-ascii?Q?eLbn9MGAkSspQSXm5T8MstfqAnRbhBg4ZYPFX8sBRqUTUbaj4HAwUgDQRCxS?=
 =?us-ascii?Q?HhxKQ1F1Hid4PwUTF5IJKpw671Gme8ei1JRONiZ1r2jW94UHAB25gFs9Xw0D?=
 =?us-ascii?Q?13PXSta3E0A0OHhXgZqdBOXmlQtXkSfo6GCo+fFlyKY1NEdN6NCKOtRRn8zc?=
 =?us-ascii?Q?5W0iSi8MqgTWnDha/E1jLLlFKs7weNVE/pb1S01Jwd3YWIdh4MIYm3awJYra?=
 =?us-ascii?Q?7Hp21fE77vfK3nAhMXrY9QrnNF81eYIo+hjS+ZXvkwzvcoVcJo3ceNPTiyfN?=
 =?us-ascii?Q?/EpnmKNDtVXROhzZLk2dCDXlnTCyUnczLXDGV+VuqQ631407Xt4GWaWHvj9+?=
 =?us-ascii?Q?JQOypSwxtFUmYlead9zWCKC4LcwgSHtBdS/dGEyWu58vM9AM64j37RWrRGfT?=
 =?us-ascii?Q?rxGTlOjTptx4TTs+A2yvvPRpJQksoWmXOv/Wr1MRa8GheUO6rrB5cSNwcf2d?=
 =?us-ascii?Q?dl8AqUY7hCieLbqH+4vJLSPmklp65hbcjqwQr49O3wlQXgZyJ2RdRfsVJ6cz?=
 =?us-ascii?Q?kCADdaUSJCmIbBzTyyEvcwhhCtoTy3jfwkdaFV6Z2/ya6sfpwmW6GHRpKm4a?=
 =?us-ascii?Q?/+EwG/nW0BmsDDODe37PI6NGzqtSH6BLeXQ6xWc5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff90bd7-465c-418e-3cd7-08dc3e4e21a8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 02:27:28.4380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWO5x50+0iSrAet0KD7gGzBx/5lQoma/spJAUQWxga3YCRzBG16V6wK4TsbM8v/ku9Q9qtn4UlnuAJKBfOBcrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8256
X-Proofpoint-ORIG-GUID: 8h1NbF_mkZ6WV-3Izob1Syeouud9vpQJ
X-Proofpoint-GUID: 8h1NbF_mkZ6WV-3Izob1Syeouud9vpQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_14,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 02:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196762

From: Chen Qi <Qi.Chen@windriver.com>

systemd-bus-proxy was removed since v230.
From the NEWS file:
"""
  * systemd-bus-proxyd has been removed, as kdbus is unlikely to still be
    merged into the kernel in its current form.
"""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_255.1.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
index d6fa99a5f8..0f09c56fe2 100644
--- a/meta/recipes-core/systemd/systemd_255.1.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -437,7 +437,7 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
 "
 SYSTEMD_SERVICE:${PN}-binfmt = "systemd-binfmt.service"
 
-USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
+USERADD_PACKAGES = "${PN} \
                     udev \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gatewayd', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote', '', d)} \
@@ -452,7 +452,6 @@ USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--syste
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /sbin/nologin systemd-timesync;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'oomd', '--system -d / -M --shell /sbin/nologin systemd-oom;', '', d)}"
-USERADD_PARAM:${PN}-extra-utils = "--system -d / -M --shell /sbin/nologin systemd-bus-proxy"
 USERADD_PARAM:${PN}-journal-gatewayd = "--system -d / -M --shell /sbin/nologin systemd-journal-gateway"
 USERADD_PARAM:${PN}-journal-remote = "--system -d / -M --shell /sbin/nologin systemd-journal-remote"
 USERADD_PARAM:${PN}-journal-upload = "--system -d / -M --shell /sbin/nologin systemd-journal-upload"
@@ -591,9 +590,6 @@ FILES:${PN}-extra-utils = "\
                         ${rootlibexecdir}/systemd/systemd-resolve-host \
                         ${rootlibexecdir}/systemd/systemd-ac-power \
                         ${rootlibexecdir}/systemd/systemd-activate \
-                        ${rootlibexecdir}/systemd/systemd-bus-proxyd \
-                        ${systemd_system_unitdir}/systemd-bus-proxyd.service \
-                        ${systemd_system_unitdir}/systemd-bus-proxyd.socket \
                         ${rootlibexecdir}/systemd/systemd-measure \
                         ${rootlibexecdir}/systemd/systemd-pcrphase \
                         ${rootlibexecdir}/systemd/systemd-socket-proxyd \
-- 
2.42.0


