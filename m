Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A198BC3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 11:00:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.58353.1721991624342850786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 04:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79375b41bc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q5ADQT014772
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:00:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40kca1sh58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:00:23 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46QB0Mod024139
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:00:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40kca1sh56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 11:00:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1+fLSQvXBi0VCkgBGLXEbrHjlfLJtyxD8kJHsfRlblHNAapJmBWfdgxnxV++MZOJ80mzXiE73NzwVIv8H+yIuP04Boim73Qqy48GytYoqZIUl4WXt5aRRhGCmXQUTuihLdK8x86uKMmgsZFd+OlLIAl4WE5UNdtekAtWl5uGwEXWVdiHLbpKckJslD5vbuGYPB2HTzUKzT+amHWc+JcJKkGt0r5K/YwNoujzuufpKD/MN/nUqYeLnpqemwvLdG1etzvSasCurS4ejBCvbz7/UMMipvN6nk4TvM3tWTwHnJJ+kP0UMbyt4Y8hzmjj6FOxLx3vewjE3A2i3wIoJaKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOQX3xTpbt11M8Ym9C1jaPsMb7hDkZho+LUwTO+awE0=;
 b=Zpfv2gSZ0nn4NSfIapezZe5HLXg606l/bi5RFbT2uzJVOBmZUCqadcA7ZV9cFMq/5O6XHFqBhAuQpAPxQBpSSQZVG5ppHhFXxfg5OIlLJp+4hUnXswjJPaNJjw2FRF9/g+l7qzwW15QqEVOgu3Zx2G6zfU3ZfGN5ZWB1st8RwjNKjE1HHqVKwlENkrl7EkRbmtciqQTC2ZwQNAt3lVFMttdtEGB/ShQBAaEGwJmjHYlrDfbA3K3SZ1s6kjCPjbP74PSVIZzTeQWl5cp4EW9/bUvSHC3vKsApafPtIkDZHWHjlAeXWOpykgaV2VSBE/QsP1TZEhK9zb9H07JI50qwUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB7406.namprd11.prod.outlook.com (2603:10b6:8:136::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.29; Fri, 26 Jul 2024 11:00:21 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 11:00:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Subject: [PATCH] rpm: fix expansion of %_libdir in macros
Date: Fri, 26 Jul 2024 19:00:10 +0800
Message-Id: <20240726110010.1551967-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0095.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f0d91e-8ac5-439f-476d-08dcad622463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Vtmdc0I3jMqIu6LPVbPbO+qNekcXT3RgcaK2kClv2Bo2VnuIAFRWQH1ykoRx?=
 =?us-ascii?Q?TUi7b3ulN3ER2gj5P4nzJHf1ocolprZv4H1SGiYMf4CDDOm9Hg3Bmyp8mbPG?=
 =?us-ascii?Q?6fIR/9V7euFKDBLCA6273HSHrE5hPa5ckS30814wGL+c8IFJx2jGMBovZ42K?=
 =?us-ascii?Q?ZvEznkBGGVh2LBIuU3vawRGd4Mdpw24N0CfQdiKGs1CZbY+x+3aaPjuhby7f?=
 =?us-ascii?Q?zDieOfAyEkh9mrD0AWT0IL6aSSJE9nwtZCcm+BiEsh7OSkO/78g7fiFEU45D?=
 =?us-ascii?Q?G5lovh2eoxRltzEa/DH2mIF7hy2JoZWHDXFxiw/OIepY6sbCD8byI6EegeJn?=
 =?us-ascii?Q?Z73QFXpDFcMlrGZst+Siqrw6rMN3ZLmEkO3NeqR0f1bGRIoG3pz1ccfNHENL?=
 =?us-ascii?Q?47b1IGWyy9xjybzhehjdlDu6Nc/RtFgYltnwU/pZwx58a6UZkIUe8PSCT2oL?=
 =?us-ascii?Q?PCnGl7A62Q6gKmfbsusiZQ7W9wDjyF2rxF77RKzW4uIRYvWUTVDiUrrye1wj?=
 =?us-ascii?Q?+q+Q+6BdtxDXSEGKwOy/imtle14EQmgMGKbnMEWyXwTa1gY3LGjrJW+vppaY?=
 =?us-ascii?Q?MePqHs6+4viw/AW0RsFPMBiOQaoZQTtztanY6hh0falBDRyE7sG57Kqe0q2p?=
 =?us-ascii?Q?oJENc6oyHv3BAWQ6WonvYQVhmjhaQp0pEXQuhnN0KsB85niwTqYN12BoNcAX?=
 =?us-ascii?Q?poOZvA/Zmxwvr4/MRa4swNuzutQWycLRSo517FW7YnkmTARUqXe5dozCZsTc?=
 =?us-ascii?Q?T5K7kUkl5fJf91GkDqrzEmuMYQnqbKzVCAwWma8QfXydaVI9jiwcN6pBYRnW?=
 =?us-ascii?Q?UiLVS8/Rz11PrpgHdmIRB2aWAoLK8IDrBPazOX3jgMiqdCgNuU0ynspi1zBx?=
 =?us-ascii?Q?tUSukAB6n7gGZE4aIwjPVy6I9PQgRmWHJSWWDVNI3hZ0Egps/Cc4MsuZ3zqf?=
 =?us-ascii?Q?DMCm7wpFk7R7ZbxIQdlUXCox2dJMXlgfQZEP5ByLZ+nBa5zoJqaJVPh+fdHA?=
 =?us-ascii?Q?yEuXhxw/ZV+2NCCok9wfFLQLrBYiWRV6hABxylVOBnXFCLRuZp33IkjG6aIA?=
 =?us-ascii?Q?isbIT3xFHJ9M5Q5HF+2C+qA2QW+uocxmcE4BcyGymAt5+Y2BLbL3uHqvlMHY?=
 =?us-ascii?Q?Ejk7rOxdbcLK2RPU1PUgA9KkP3hgOGTziichhEDv4s48t/jqiCTVljWpeoBz?=
 =?us-ascii?Q?FiLvuh+g8R6NNF6hjFxj1y9EeviVtD9wayPJ8hBtN5BzBl8zHtm5X+d5555/?=
 =?us-ascii?Q?kaPVFkAg2w9PHxyGB9NZmdOpAGOhEOaia6q+651urCjG2DNQeTlbLIY92tGD?=
 =?us-ascii?Q?TqyXJbV/OLuG9nqpwbX/K22lfCHsbTdz4e/U6JRVPCPa8r0EWZHg0qbEyo7Q?=
 =?us-ascii?Q?lm6zXKg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9yL9/yPF9SD4QMe9GOO+33P4EF4iiL0HfTFFzEQDMaFz8fpMnpe+S4MkmMxQ?=
 =?us-ascii?Q?6yfyqzlQzhTpUvcg86d4k+O/W6GXPAj7Am28rnRJiEgEcojz7e3Q60a7fC+w?=
 =?us-ascii?Q?wBEuVLHNrjeP37mEvwVpabhcOZIphVDI3aesnYNGzgoE7RoWpO2MuDnRb8N3?=
 =?us-ascii?Q?X8ap72AlhZoC2uSRufvYsT7re35SCFRsgzEPi/owdzRlBRoPaDjyXiAfwG+N?=
 =?us-ascii?Q?PW7J9V/5f0DOg6ZkjzixgbHiCXHjd8fy0uT16MjpTLaCjuSy4T2EJzba+Eqy?=
 =?us-ascii?Q?Lgn2Vjo6A7SjHWmL5Y0luPGB66Yp0hUbhMAtpSjJTPV/L43grckJtwO+Gmwv?=
 =?us-ascii?Q?FfeTnmvsTPTMwEA+Ik9rSYoLdxvQqFRH1DRHx3+zPhnbl42JuP25aeUbndhp?=
 =?us-ascii?Q?sS+OKJTIu5FvIdmQ2VZHk4KjRWakKoa5rOCm2cHIl6onx8pHiiCmP0X7ZBsR?=
 =?us-ascii?Q?pVnlyXleRZzmP+cebRRFGw78ktsIwQkk2npXJf24S/lq98KAtOegT/Lj/WfK?=
 =?us-ascii?Q?JSuSG2cA0WqP2KKnFtL+khZ4HlulOsyegHRUSMFZvculPrktr+obcWbwFlW8?=
 =?us-ascii?Q?b0tpcVb55oj6wlb7VAjuBKHIGJyi3qPbgzgqfb723GcVixP1Mj2eU7RM2W/D?=
 =?us-ascii?Q?6Ev8YNfMvGxZkGPdtxi4hOxeH0bC+ZX9zbIOtCuHHOWneXpN7E/WcsxujxRw?=
 =?us-ascii?Q?zW9iV7VkMAwiGcY2PJS/ZuyS+xh+W5P8N6RpgYL9ZHlSnDA8gmpHScZNemih?=
 =?us-ascii?Q?V2koH4ygPL7JZtl14OjbB2dxOvHJOfDFfK5Q9Iczd2I7KC/rDjj06AnI2S+d?=
 =?us-ascii?Q?tw1he9o2ZjkBa2TExGFnihBhLQdPxNZ3qdn2iKIvQE2kzRjFD3CmwXmpqpTI?=
 =?us-ascii?Q?DTag8IO9VzoTQB40xGoOkAMZAsR7RXC9IRx6gz42axmBHFce5TBwF4fna0fc?=
 =?us-ascii?Q?5hs++z6FR1HTmHl8zsAWTMZ8OaMGDpmm4S7sTBwYSwp6yv3xOMjbQX+nxEU+?=
 =?us-ascii?Q?oVEMFyhvgUqrYigDLGit/Cq8DVRLxpEjhHQCxIdLnJbhurflSvRMlwY7M2DQ?=
 =?us-ascii?Q?LoYNXS/Pk4Ll50U6SffJLIwjLGi9SEJPr/1z3QTBJtktTl06Q6G5tSmq6rIY?=
 =?us-ascii?Q?CRKD25lms4yYPLzXrMIyzaxX5Bg3umd3GDBocqv/aoppvqkylVgBWwJbkYpl?=
 =?us-ascii?Q?Z5DORTqU5w2RBtkqECGrbE/4QWxSk7fwVtrZf3uvS9OeweiL6z0Q2CAb8ZSv?=
 =?us-ascii?Q?I+XzFuX8pTEKBcu2mugYjanuIVOi2XjcsM0y1MoO24iYM1+2L2PURRCs20TA?=
 =?us-ascii?Q?9RM/QPNjSgCigej2zBEj4DfgXPsiw6/5Q9LWXk6KLudBJhTUHG6b/1PWxx4s?=
 =?us-ascii?Q?ic/aYZSvtXrcvkgLOybS50Pm9loIxDgseolu/gLWry3uonmjo2h8fK8gnddx?=
 =?us-ascii?Q?ZHAGMSoGqZfb7WMIgH/lOntl0kB5KocPo7sWvAsmCUJNDivti6HHJCj/AMPY?=
 =?us-ascii?Q?1mXeUy6NBz41kdZwu5oOcplV1ah2C5U3O1KHLrOwxzQ5uyeX0bZ4PDjsL+Ze?=
 =?us-ascii?Q?yeUO15GBpzkL/B20/73G7yg8p7kmfAQZiHDG2lzq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f0d91e-8ac5-439f-476d-08dcad622463
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 11:00:21.0286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9/VKjugqPeuBDmy6Xp/5xRIqOfLhZ7d5Ww1pDW5d4rV1imtHYcn0Ua0FvQiyWbDzKS/V5pIpg0Z28z04/E09w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7406
X-Proofpoint-ORIG-GUID: HcfSjdb2HsHhC-59jsafirhrzczdY9CI
X-Proofpoint-GUID: qHxJtKC5FcogoUVw_rhjULWyLmLgwsGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_09,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=864
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407260073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202522

There is a patch in oe-core[1] to avoid hardcoded paths in macros. It
tries to use libdir to expand %_libdir in macros.in. However, in
upstream commit[2], libdir for macros in CMakeLists.txt is set to
${prefix}/=LIB=, which causes %_libdir to expand to ${prefix}/=LIB=
instead of the correct path in the final macros.

On target:
$ rpm --showrc | grep _libdir
[snip]
-13: _libdir    ${prefix}/=LIB=
[snip]

This also causes %__pkgconfig_path in fileattrs/pkgconfig.attr to become
an invalid regular expression when building rpm packages. This results a
warning in log.do_package_write_rpm in all packages:

Warning: Ignoring invalid regular expression ^((${prefix}/=LIB=|usr/share)/pkgconfig/.*.pc|usr/bin/pkg-config)$

Set libdir to ${CMAKE_INSTALL_FULL_LIBDIR} instead of ${prefix}/=LIB= to
make sure it is expanded to the correct path in macros.

After the patch:
On target:
$ rpm --showrc | grep _libdir
[snip]
-13: _libdir    /usr/lib
[snip]

[1] https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
[2] https://github.com/rpm-software-management/rpm/commit/d2abb7a48760418aacd7f17c8b64e39c25ca50c9

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch | 53 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.19.1.1.bb     |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
new file mode 100644
index 0000000000..1bd83e7bef
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
@@ -0,0 +1,53 @@
+From fea9cea49aa0844de14126e54d05b91ba619427f Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 26 Jul 2024 17:18:30 +0800
+Subject: [PATCH] CMakeLists.txt: set libdir to ${CMAKE_INSTALL_FULL_LIBDIR} in
+ macros
+
+There is a patch in oe-core[1] to avoid hardcoded paths in macros. It
+tries to use libdir to expand %_libdir in macros.in. However, in
+upstream commit[2], libdir for macros in CMakeLists.txt is set to
+${prefix}/=LIB=, which causes %_libdir to expand to ${prefix}/=LIB=
+instead of the correct path in the final macros.
+
+On target:
+$ rpm --showrc | grep _libdir
+[snip]
+-13: _libdir    ${prefix}/=LIB=
+[snip]
+
+This also causes %__pkgconfig_path in fileattrs/pkgconfig.attr to become
+an invalid regular expression when building rpm packages. This results a
+warning in log.do_package_write_rpm in all packages:
+
+Warning: Ignoring invalid regular expression ^((${prefix}/=LIB=|usr/share)/pkgconfig/.*.pc|usr/bin/pkg-config)$
+
+Set libdir to ${CMAKE_INSTALL_FULL_LIBDIR} instead of ${prefix}/=LIB= to
+make sure it is expanded to the correct path in macros.
+
+[1] https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+[2] https://github.com/rpm-software-management/rpm/commit/d2abb7a48760418aacd7f17c8b64e39c25ca50c9
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ed847c09a1..385b5040c6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -84,7 +84,7 @@ function(makemacros)
+ 	set(sysconfdir "${CMAKE_INSTALL_FULL_SYSCONFDIR}")
+ 	set(sharedstatedir "${CMAKE_INSTALL_FULL_SHAREDSTATEDIR}")
+ 	set(localstatedir "${CMAKE_INSTALL_FULL_LOCALSTATEDIR}")
+-	set(libdir "\${prefix}/=LIB=")
++	set(libdir "${CMAKE_INSTALL_FULL_LIBDIR}")
+ 	set(includedir "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
+ 	set(oldincludedir "${CMAKE_INSTALL_FULL_OLDINCLUDEDIR}")
+ 	set(infodir "\${prefix}/${CMAKE_INSTALL_INFODIR}")
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
index 0802f26295..9330323797 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.19.x;protoc
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch \
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
+           file://0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch \
            "
 
 PE = "1"
-- 
2.25.1


