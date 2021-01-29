Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.6755.1611909252569324719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XejiTCM3;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hy5ocynydLoo7KGKOFLvTDVxaQJ5exMmpUJlpYmcwc/TlSkan/nJq3/jBsOpfm+93MR+NtHyaB2n9FBGlmnQRq5WtMVNDg2HC3+RZT1kbmC3clerI76aoTLsyJP/+Q6U44vz2k/Y1+/ziFD18OFgWhmVoA0rinisxMCa3cv8khhTQNtTbPgvf6+zN2/x7WGhStBh2J+wyqCqUbwgx6ddr/V/bXz8H8T9aBORKpLBjs1KSE6zsTOmho6l/1rh4Whvd38tikcO/l6EBb8wzlC0igR7IQp14TWr0Q3/I4TA6/tEABiKfc6/FFCIuToOUAYuRdOv85zkFw99ulcgbnWL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzpt28Z0sz8MTa+RAWYcwvLjS94pdkqjJDR/2zfZrAs=;
 b=WVf74HxL5qDvkqs9CdcAtSSV28VzDGShnu8Y7nbVozTVSNS7mNywip3uJIZBG9i8tW8BgauWtyWUc9LQaXKSfkt8MsPQ1rYgghs7HSV6NhacTzcnkUtrc2sH3vwqNlikcDpzQxJt4xsYnhCKu8q24LwWRXDYcKZBc4PQhEMtBW0oebRUtfX+j5CyPaloVavPL4O8SgCAsh/9TdOjw7LR41JDVoY7qIbfhz1u8xjCTVTBw2B2+j2vM3PX0rlrrZUWcLcie8thGxsqyimtsVSBZCu6/IAp9KZU1kjNs+rl/pBjIYfkUHsbvcoIRYu7naz61Lft5bxRljGDXTxxVFWwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzpt28Z0sz8MTa+RAWYcwvLjS94pdkqjJDR/2zfZrAs=;
 b=XejiTCM3/25SAnfwESwfFdSuURwfge9YKIROOQe3DjUA0u8V51zLdpQXT9PbP7ueBHsWrMX6RfCyxod0ng46l8cTZg4K3o/8qrFkfBbM49aqSnmOlmwm4R/7ig4Q1UclIP0SD2dHdmTJ+3ExwwjAFOvk+Y/VB5nYgKwZgZjT7Jo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3474.namprd11.prod.outlook.com (2603:10b6:208:67::17)
 by MN2PR11MB4205.namprd11.prod.outlook.com (2603:10b6:208:192::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 08:34:11 +0000
Received: from BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c]) by BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c%6]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 08:34:11 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/3] bitbake.conf: use PSEUDO_CONSIDER_PATHS
Date: Fri, 29 Jan 2021 16:33:51 +0800
Message-Id: <20210129083352.13305-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210129083352.13305-1-Qi.Chen@windriver.com>
References: <20210129083352.13305-1-Qi.Chen@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:203:b0::20) To BL0PR11MB3474.namprd11.prod.outlook.com
 (2603:10b6:208:67::17)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR03CA0104.apcprd03.prod.outlook.com (2603:1096:203:b0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 08:34:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99d65bc3-0154-4768-9966-08d8c430a718
X-MS-TrafficTypeDiagnostic: MN2PR11MB4205:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB42057D173953103844E60FC3EDB99@MN2PR11MB4205.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RgWyh42dq7Ui0IuEPAAnmvrc8IcygLBhGMlCx59BGDzYkPh0g+BBR1jb1pNihXXx9hbZTcwJqWijGoVqEtVu6WIv3oEOr9hMnfxDdnkAE7ALPO5eEpNnh5ocAyVo8h7dy50Nmqt0uD1DFFQes4tbj1rRuHQQpEQTnn2/PCeDDwt2w7ynsOCw84/K5OxsXd87sX2TmQPiCGqLcOv3Py6MxK3JzSG+uGkb4qTzmbueyZ19WC1nBLgr1x+M2vx79VTQSR8tYIMqaYmoMWuYKWiG6XBWMhow5ZEJL8DHaadh42P+w2uMojlpGdZgx3XFE0rk8qlcrSLJYqMm8MQpJnR6XLneCgap+2ryQ7OtkdHEYkw3TW6qGp7LP9kFbp7aDOCZciaxiP/gfeDIO/MZpPgwTwBuK81bZ4WzA/QAjFt1vK1JA8wVyRe3sCf/XJVHk3wGdJkE8DhuPQfLQxlOXdss9yE/c6PpFQg7gTVTw3ofQGRqSTM4jvc0AaK6sQlKIy3jiPN1cg349TI+Zb/wik23ig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3474.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39850400004)(346002)(366004)(86362001)(2906002)(52116002)(316002)(6666004)(36756003)(16526019)(8936002)(2616005)(956004)(83380400001)(6512007)(1076003)(6486002)(6916009)(6506007)(478600001)(66476007)(66556008)(66946007)(26005)(186003)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?40XGjMwT4h/Uhkr3UI3AdkVGsUTz6z2KMZ+yt1R4+LWvmzXBsopYJgEAahio?=
 =?us-ascii?Q?qVDduZmB5hp8f3uF6sPvCpBj1wqT6XW3WOHEWVVuy7r7vQESQDABUtuOH8Av?=
 =?us-ascii?Q?SYlY/ud3ZxKq+bOMVCLOf0DGWrluXpzpmiLCmTTo7nZRFhKvd5uIgdP6jtHH?=
 =?us-ascii?Q?G3vZAINaeXdBt/Nwp0HsDJ/DJb+rTSOleoWlvnbN/OvAPqHM+mMfh7uF+/qQ?=
 =?us-ascii?Q?V2UM5O9xVF0ppMXwKdW1v4NRzb6EIYnNrKN8og8Qc1MX9Swkz1xbeMjD6E2+?=
 =?us-ascii?Q?iOrc4vTFRcHTXbKNDgQs1NZeTXx+yaAS0Cxitfq9OIH19GvuIxAFjFnxn6e6?=
 =?us-ascii?Q?iKwM+RpE+aa4us5Qp2Q7KGbmDf7kJ3CHYrbRdwWzuEBl8DxK5JV7+5LVFy3H?=
 =?us-ascii?Q?0wZ7XfKR/AjwvAQ1TbHQ+ine/SKt33zxXt1/C1RPv53kPa9nEeH/cuFQy7iY?=
 =?us-ascii?Q?kSVLJnoQh3Ho5PfGHrLG3S0a1hh6y6CBB7qMV1hP0yRycdcZWayRpFJp8Aio?=
 =?us-ascii?Q?b9TLpE6fr6RZ7iuSh5lSCkwqi/OYmBpvtBG59aCZJsIj09EVfkJ2+TFMwyal?=
 =?us-ascii?Q?QDT4u8/IVDC237/x+uAAeihNLHHZdABRMUItitva1fSebdqO1KpylbZ5J0zt?=
 =?us-ascii?Q?Sk5/7dTJ0cGi+9wJUFSGuIYJXyvgwhcW+9UgH/IkKDAzTaNjADkYaM33+oRG?=
 =?us-ascii?Q?LjqK89B2TvGkfEHoH+CeZSSOZt7suVrrWkIThMVjHBXfhZ1um11SUXJoHXBL?=
 =?us-ascii?Q?Xlc4s+KivVO44fl/n8G8KQRxkuoSm9B7OKn6uCtMPg8XjQ0Isor9eNpZh9CR?=
 =?us-ascii?Q?SAPOslHpLYDi3efZZHjzTNPUyqKd5ROZA7FWx9+dMzcK4siSBbTHMwesI9+R?=
 =?us-ascii?Q?XnmecduQ/I9UQJq9K8W5mxeLWJHH8OmNMvQJ8pq9PC1hBRcRw+ndupfCzXxj?=
 =?us-ascii?Q?b+2GamoPB6jvmnTJioGwdJWFo4yOxjojpPzEc1hxA6/5SEKxLwjTXL+EZfyE?=
 =?us-ascii?Q?2iccQHYtF1Az5Q7011Qg2bGRJDYXmHsph9zyyfMa+eUJam9GLyWjn11OmbW2?=
 =?us-ascii?Q?SzQRXqbE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d65bc3-0154-4768-9966-08d8c430a718
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 08:34:11.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KlYIU3bbFs4whCcZv5VPCMg0RGMECTd4GdeMqD0eu6ptLX1XNQkEs7FLv5MU105efjMVLoxDpKN9qtGIC4n8Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4205
Content-Type: text/plain

Instead of ignoring paths for pseudo path filtering, we use the opposite
logic to only take into consideration a few paths we care about.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/bitbake.conf | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fd31c3f18d..cae319287c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -687,15 +687,15 @@ SRC_URI = ""
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
-PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${RECIPE_SYSROOT},${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
+PSEUDO_CONSIDER_PATHS = "${D},${PKGD},${PKGDEST},${IMAGE_ROOTFS},${SDK_OUTPUT}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
-FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1 PYTHONDONTWRITEBYTECODE=1"
+FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_CONSIDER_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_CONSIDER_PATHS'))} PSEUDO_DISABLED=1 PYTHONDONTWRITEBYTECODE=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
-FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
+FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_CONSIDER_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_CONSIDER_PATHS'))} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
@@ -886,7 +886,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES"
-BB_HASHBASE_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR SSTATE_DIR "
+BB_HASHBASE_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_CONSIDER_PATHS BUILDHISTORY_DIR SSTATE_DIR "
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
-- 
2.17.1

