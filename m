Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5E0C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 18:19:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.715.1648059549573323533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 11:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=grXh9j6m;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0081d1b37d=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22NCaMx2011328
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 11:19:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=PsSCem3ZOO0jPHRKulYbTSetXJes9S93q5U6WM/U830=;
 b=grXh9j6mUfQzuWaZVX/qxPIBbrW04Z22H90qtEJW7grJ24MhIFBU0me375BvBHxI4UWs
 zlCMLyC/h4m+G6DrdlN8ibg+FIFWvOVj9E5eIKMGL7BD0xEAa5hfhRpIXgVTe+EXz3LC
 j9Ra7w9dVr2OKY9NQiLWJRbUJd9OsYONjIyo0zJ3l56ZcY+F7iNeFmZk5Revh27ZvQFA
 pyZQSEqd87Tsa2evDeETyIGsQ87oAoymx0qR82uo9jmf1FqO538RA9oNRm8W86vWJJd4
 O03knhjC4Q8TT5q9ktmRIHnce3QHxltHtrF7/PQC+9nefhDgW1jvR/GopGubF68SboDS Xw==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3um3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 11:19:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHNqVB3dRCWxtWnfkwMS1JMiFvQAKiTcYC+BUG1A+aYOkJMIfUSu+hWG2wQ5M6MM7Mw2/CLy2AbsRAm6Cct0R5IoriJDv0a0mmMEPwYDmsOgPM3Khrtg+btqGvVMXehvwxe49I2vB6Fx6GwsJyEbVYgq9qsQiHFrYh21rbYyAk3HBwRGuLStonAiF8DLoUgy40qpxTtTVcls64HA8FR9tyZrOffpfHvjnmyzMHUSelythdut4zf3UnaV929PaFQXaFMIvtXtLaoUoludGjm8f/u+S+4vsEdn/P/AfY1UVSzLp1vJphkcrEwMcf/U12E5PFCb2NlqFqTsipwVoOd1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsSCem3ZOO0jPHRKulYbTSetXJes9S93q5U6WM/U830=;
 b=GMzI8QWNfSAw5mPvTczoD92p4zchpGG+jqETmX5em4LED1ILlxzBHDrzCbqfeGe/cPs0Lan85Tvsbg1J8wGNVdcV1MRkBhvgCdrU2Xn4VnWB8qTKcjtSzOew0ZcpRu5w6EPk5MD8wJ29xs/r9n5eKWmbjqXcdCIKq2ADKBMefP/hzN6Cr9pc5bKLHzfHlPDFDDeOjjadCil5C2sYFB+G1zYmN7oVI/3T2G46xK7VDkYNOtsd1wbtwm1ABI1ID01rsVx6Plmyfw74JtDMb+/dtcFoSvjQdh+hEy/48xsJUkmsrTKEvnRdBEhYfds03N01OleeYuEHJ/sqAGNeTr6zkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 18:19:07 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4%7]) with mapi id 15.20.5102.016; Wed, 23 Mar 2022
 18:19:07 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][PATCH] weston: use same distro features for weston and
 westion-init
Date: Wed, 23 Mar 2022 11:18:53 -0700
Message-Id: <20220323181853.18127-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0043.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::20) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ce9c93b-358f-49a5-75df-08da0cf99e72
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5070:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5070F6AEDEAA611243A627B688189@SJ0PR11MB5070.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ar1PyVzEGX6QrtuM3t3SLB/AV/mBx0FoE26sko3/XKUwDLOsKUEWXpsT9ct/0WdsOZW+4DbvoRZ/5hwVcBOOFbud4UC34YK+sCReiHgSr3Ik0dAVIQDuW80Wpjw0p+1IjKF+2wyQOjJda5+fP/7hsmvQ5C4aSHhAEPDH4IQ6K4JvDbH7wMjjCvOcROEVXFEuYQYIPeiIoR4kgF6xXwXzAg19WRyd7aLMQE/xePVrvGENXpOVTMZ+eztGS+PYaXZ+bTseEhlBBVXja1wAk8zvv5VkYLltutUE75pUQ7KjAENfxY1GkeaLGuXE0T80Z/tjXKLHehWSbB0Pok+hm465tSwRLSXpyNvs0EPk4mj9p8EsH4L60sn1roJW3ERNRa+eaCTcesntjRKtVOgH21pA20I02ZBC3trwMtNL/j2n4hudJ1oWgCfUZ6NM/UsC5aDg1eTM9dk1mq9aZEgbcg1w+UbLX7RNNSMVZIEZ8J7FH9l1SKkDls7X8KYQDaio1GLONV+lM2brIT+VzdxeMl1RTB1zTWU4LTogQW2b1gkvJ5JOOvScLb5vfWIPEfmo8A3fpyXPav8pWbG9Hmj4HBhq0KvbVRK0jQ4ztgtPVpFTNLi13+St7qFZvKX9t0PW6KTyxVVSeRHy8Dt4kKgKD6ohP4sTGt2kJ32czxkF0pp2veqckK0L3cDUNncCYzOsyTjrqvN87EhZANvUhVHiUlGaJg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(52116002)(6506007)(6666004)(6512007)(508600001)(6486002)(2906002)(83380400001)(1076003)(26005)(107886003)(66556008)(186003)(2616005)(38350700002)(5660300002)(38100700002)(8936002)(44832011)(36756003)(316002)(66946007)(8676002)(6916009)(66476007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vu/iSgDI/ASblMHslnbC4WCCn2ljOqUpHyKnD7LmYSdjIU82cC7A4rl5zM7c?=
 =?us-ascii?Q?5m1uRHOAHqXxE28M0j3leaDnaofCkpjoQtna4okATge6lNsSc4/MuqBTUiC1?=
 =?us-ascii?Q?rmLtipRXKEJRXr5UOiCSTgkzOyNiXkVU1Z2vkR0R6sR4vwGndLbn1IMmluAJ?=
 =?us-ascii?Q?SlsW2bytRxcR+WNJ+yqvJkXBeBNdwIyARtdbYrejUbaPSeD0saB0ewE7WmYK?=
 =?us-ascii?Q?EjWAZt/LQKzgx9RKzORgWo/hHR8TIEbHbEpDV66hXbEZqztKpe5tX8mcfuF6?=
 =?us-ascii?Q?2dGE8wHPkiApUb21tNOSAz1iOZZXYeXqy9N9y/A8rsjY707BThC2fUmDIXMr?=
 =?us-ascii?Q?GoMPp2DkEbsxlM04eEUgtBS4dBd8QZFg5VJcoZK6P0L0MahvrRD2x66UTKzN?=
 =?us-ascii?Q?q/UDQyOuqM8sPv1twtUTh4WBKg8NlZN8SVljbrPUYR+Sp8P3EVCu+3HrWJhf?=
 =?us-ascii?Q?Gp4JnO2lcoUSCkDhy9AXDCyCwSvNuu9rPgjsuNn2hJxrnLtQTCHcF4iLEgXC?=
 =?us-ascii?Q?oQRJFLGrInZvsLo9P8aNJ3pKh2Jbl9SD4cdqPRowkUWwI4jF66qLm7obAnsJ?=
 =?us-ascii?Q?RA5naFs/7fQJt86qH892UqheW7hhyBDtK6hZYO+P7o74llP4Fr8CZ+N+WgSm?=
 =?us-ascii?Q?kWqmC0wLSkJnakf6KORT9VwM5n7Il+JO+L0xK5ouxPBUka5aNM+S34Uns6Ee?=
 =?us-ascii?Q?EEcQrdyXkpKcCo/BXHGeYpwE+z8PKNp9WT8Dy8BWxtTYUybYeQ5YjFtU6Bm3?=
 =?us-ascii?Q?u44x7R6ESJJcnNS7VVpoUlszFl3/3BONskxR45UKtIaCtRG4Pi69FZNd1hYP?=
 =?us-ascii?Q?azvbFZ979IlleYOTJlNgwf0FT24WO/i5lPqLciwhDY5zU45JWlCrua4T5HhA?=
 =?us-ascii?Q?nNeLMsfQg18CLt4ZjD8Hxrg5iSd/4/JBhL2Xm7uPZlHbJ/b/rGJTd7KiZtwd?=
 =?us-ascii?Q?MQjbjXj1N8pqZnEOzFK4iZRu3xUcItfx9pbImEmiwtiQs9xycEfrdz0TI59I?=
 =?us-ascii?Q?vbV/8hmOazGy2GkiDM/z+W52wGqTbL3Xa9ZQfqMUIAQtnBq2wDL5/hroOs+j?=
 =?us-ascii?Q?JY5JVYeP8dDGLP1qxH0dmGnbiCPK2dxaqZsuws9aLHN0fCMR0XfsVXXRDZCA?=
 =?us-ascii?Q?x7lkJDk3SkhAKc+ctmEUs4jHJUJzyP7jHwl1zUsZK33TAW5zMUYeA5qUWdtx?=
 =?us-ascii?Q?Mz9HXtsNpuccwmpdFuOMwEuSqrriy88CuFDCX3FuvYwwa0FL+m7mjhm9TLJo?=
 =?us-ascii?Q?K6XKAuqLELGBFUcjKbim4Nkw77ELUnPkgujSRBa5Q6lqpLXS+KjIbDft8XTT?=
 =?us-ascii?Q?oXVj0YmYRZw/JgaJiRdY4p8WqMYxzwjpzynGPCiIh4E5bu2nSWUXIH8MrUxV?=
 =?us-ascii?Q?LQ2opa9jw9uOs4dEKTW31qsN42XQVsShtnoqAToX4rD9QySFMjYfSdvoC4p8?=
 =?us-ascii?Q?3LxCbeE0XC4esMZiL6oi/mvaDtRFknne3qXTdZTlHLbsJrJUasKRLA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ce9c93b-358f-49a5-75df-08da0cf99e72
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 18:19:07.2912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Bwgimmkjs1lInZ4T8HEZq/u3QvsRUdVIDp/oz5Q4nbmko6VEpVoH86qW/ymcdAwziE4GZnYazlqIZOPFdUTn7S0u+jOl7tv5QkLYb47nhLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5070
X-Proofpoint-ORIG-GUID: MDeCYKgMPkSoYz8cJgTl9mJyDVP1kPka
X-Proofpoint-GUID: MDeCYKgMPkSoYz8cJgTl9mJyDVP1kPka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_07,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=507 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 18:19:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163593

We want to avoid situations (like world builds) where
weston-init will build, but weston won't.  This could
cause "nothing RPROVIDES..." dependency errors.  We set
required distro features in a common include file.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../recipes-graphics/wayland/required-distro-features.inc | 8 ++++++++
 meta/recipes-graphics/wayland/weston-init.bb              | 6 +++---
 meta/recipes-graphics/wayland/weston_10.0.0.bb            | 7 ++++---
 3 files changed, 15 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/required-distro-features.inc

diff --git a/meta/recipes-graphics/wayland/required-distro-features.inc b/meta/recipes-graphics/wayland/required-distro-features.inc
new file mode 100644
index 0000000000..bb4a0e8ebd
--- /dev/null
+++ b/meta/recipes-graphics/wayland/required-distro-features.inc
@@ -0,0 +1,8 @@
+# distro features required by weston recipes
+
+inherit features_check
+
+# requires pam enabled if started via systemd
+#
+REQUIRED_DISTRO_FEATURES = "wayland opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
+
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index c34582137d..79f2340ae1 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -61,13 +61,13 @@ do_install() {
 
 INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
 
-inherit update-rc.d features_check systemd useradd
+inherit update-rc.d systemd useradd
 
 USERADD_PACKAGES = "${PN}"
 
 # rdepends on weston which depends on virtual/egl
-# requires pam enabled if started via systemd
-REQUIRED_DISTRO_FEATURES = "opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
+#
+require ${THISDIR}/required-distro-features.inc
 
 RDEPENDS:${PN} = "weston kbd"
 
diff --git a/meta/recipes-graphics/wayland/weston_10.0.0.bb b/meta/recipes-graphics/wayland/weston_10.0.0.bb
index bebe95f69d..8424b4d548 100644
--- a/meta/recipes-graphics/wayland/weston_10.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_10.0.0.bb
@@ -19,10 +19,11 @@ SRC_URI[sha256sum] = "5c23964112b90238bed39e5dd1e41cd71a79398813cdc3bbb15a9fdc94
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-inherit meson pkgconfig useradd features_check
+inherit meson pkgconfig useradd
+
 # depends on virtual/egl
-# weston-init requires pam enabled if started via systemd
-REQUIRED_DISTRO_FEATURES = "wayland opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
+#
+require ${THISDIR}/required-distro-features.inc
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0"
 DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
-- 
2.35.1


