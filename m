Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web08.8226.1603265575758210525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 00:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jZjhBFw1;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHYTgA3IlvLN/cs0V9udJSmyCKCyy0AcXPnj1j9HJbFILmnaEVqCHCqQwAJkQaaufqIjbKJQkLKpOVH2Ct6G0fEbW2jh5Qh83MH9vZBUB+2g3KRVsSGt5vTT0Ypk8DjBlOKp/y+EyH0gSs5ZappErmxcHFN5Gx1vwO1h6IYzDzJffO2GeaT4nXdh61jgV0nSp9htkURml9ugbRmYBO/3KCDv0+xvJRBxBO8vMWWdSa/2j0w1Yz9yvW8v0DCG6oZtGd+EHxcK3SCQDJ+z53DzWoY0He4vo5csS/F5uFmfMH7PXNqm2erGMVIMwdI5pO0i9/PZUygM55eD2Hd0GqZ/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ncy+EhtPzBi53/+mqTSUiBgw7Lvz4xMTvG99K4epyE=;
 b=MjEDoPKRjVpyYYKR1HcY5sagEnHfYbJsTHV+9FI8JnrikQTXpXK39fHa6QA2F29goqNYzG/2ABK41uYxFIH/1/slu9ZjqzC1LgqC9wDbn0dnR0wgDssthlY6vZy2BsQvb2n9+OnReiR3SHHk/XmBwwtJ4cN/qsbWSXdPf5WWfhz0d7/Cu+65kuuv+ne9HnWqJ15I/GTgoPrRyyRkUASGNAb2bFk1IF7cjmbvnt44Wj78uMTd5NkH1nDGOlvTRQtzHIwrYQSkrXyjbajQSGm1xPpPxn0rcDDeFMPbDC7HV7mJm4sxlsNO9rNuQz3jTUM9koQNGzcTT7IIMqqenwZmbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ncy+EhtPzBi53/+mqTSUiBgw7Lvz4xMTvG99K4epyE=;
 b=jZjhBFw1irzGDjfDme+HsIKbF/lp0qSXzzZnSj0DKsL6qsvYuG0kCYuk7z4XL4f2D0I/TbfEgP3H51fNaM9WGzyjvhe2OYh2p8vRuQzyPk7Gv9r/rGKSiCQFpsLVQDKg8tRLCuTKltff1jNQ4JUeUQbgoKw6DDn+oHwnaSLv94A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0070.namprd11.prod.outlook.com (2603:10b6:910:78::16)
 by CY4PR11MB1831.namprd11.prod.outlook.com (2603:10b6:903:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 21 Oct
 2020 07:32:55 +0000
Received: from CY4PR11MB0070.namprd11.prod.outlook.com
 ([fe80::74f2:e272:9be5:b864]) by CY4PR11MB0070.namprd11.prod.outlook.com
 ([fe80::74f2:e272:9be5:b864%5]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 07:32:55 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] meta-environment: fix site-config files identical for multilib
Date: Wed, 21 Oct 2020 15:32:33 +0800
Message-Id: <20201021073233.40046-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021073233.40046-1-kai.kang@windriver.com>
References: <20201021073233.40046-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0153.apcprd02.prod.outlook.com
 (2603:1096:201:1f::13) To CY4PR11MB0070.namprd11.prod.outlook.com
 (2603:10b6:910:78::16)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0153.apcprd02.prod.outlook.com (2603:1096:201:1f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 07:32:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe72219b-3d1b-45c0-8f88-08d8759386c3
X-MS-TrafficTypeDiagnostic: CY4PR11MB1831:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1831EFFF8B7558A19AA9DB27951C0@CY4PR11MB1831.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zhOZMZa8X4KgkSAnsAu5uZ+sEjAEQ+HIQtACGIxWUpW6zBpP8g92XiENoUO+r1ffGzYjBYNxEZNduFrCsk1xDMU+3PUHZn0GfwR565eJKO2VU72mCUIQQ/2KSifeHkZ4RHmZHrMzgMUGgl7WZlAbPhaO4PTyw7lUcV4Us9y4Z4IeHcEPCVF4g6bTPR4uNtSJpi79w8iou/tFjZG2ApM/7JK0hi3OnhK3808sYWpnObJakI9YWCbCvtL4jE4XU/PV+96BVZWLxckOurarpc0kJ2n3yJSPCNa4Il3JZoxp8EStqCJGIjDXv5W2xWZtcNIb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0070.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39840400004)(396003)(346002)(6916009)(86362001)(6512007)(478600001)(1076003)(316002)(5660300002)(2906002)(36756003)(9686003)(26005)(186003)(8936002)(16526019)(956004)(8676002)(83380400001)(2616005)(66476007)(66556008)(66946007)(6486002)(52116002)(6666004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mwQJwU4+6j6/Gw6NUWN0ommoDJEs3AIXakiwBXMnX6v/AKEzZgwDmQrp2TyhaolUyNno2EgRaMfwvgb1avYP671W7X/hpoTA52yspSlf+vt5vazs/I+1gcCQPcBp1otM7s8UtP1EN16G+0PtzOEse0ptC1HpNMZGmafHX22PypzdHD+MlJ83sMBU6Oiu/4kDMe6UleCSlHNJ80gZn/yrU9ykvAEOuKsSdrSKcTCwrpM1xtYTTcNYgeBPuC1wYgtg7gu0DpttcHrKBW3IEevvuagmTfO+A7Ek48KO/DAvWWHMNBWTDQOrzGxcTdYDgPT9leayKBh6UvThuvOwRIMr+aJfd4oRxLYczo//N+ZlLOS7EI/Zoqsg/L+YTGt/lkScGKnub5OVFwDov28zUilHY4kxWik5XBBlQKJQelsJG4QFApOTkLxydYklAeT4PryEmrF5PGcYG00h0ZBZIwxzT+dzdfK2UoaIzne5ILIs7OjqMTmpkPQ2coIT8rHeEeM29HUn4znBOwh2Lh9T1rwCEsEBWMqkLjS2zvK6s/EWdz8oALuF2s4LTddiw/+rlBme3fp5stuB5918itlSLhbIQNQKFmaMCnmnaFVFqc1dbZa3Is5K0HdFHvSOpZy4nii8/dWpf04C60351w+jWAbBmg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe72219b-3d1b-45c0-8f88-08d8759386c3
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0070.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 07:32:55.7049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q91g/ojwcXOhJgESFaPi3fiwc2N08sAfmoOjn42PU99qvsRkfmfmp3p53UrupIQaaRc0yvwE6t7BidIoSI/MLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1831
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When multilib is enabled, such as:

require conf/multilib.conf
MACHINE = "qemuarm64"
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "armv7vethf"

the site-config files created by meta-environment are identical but
should not.

HOST_ARCH is overwritten when inherit cross-canadian, so it fails to get
right site files for meta-environment. There is a Yocto defect #10255 to
handle it. But multilib is not covered.

Save multilib related site files before inherit cross-canadian and
construct site-config-* file for multilib correctly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass     | 47 ++++++++++++++++++++--
 meta/recipes-core/meta/meta-environment.bb |  2 +-
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index db1d3215ef..8ce6489d10 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -163,16 +163,57 @@ TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DIR}/${MLPREFIX}${MACHINE}/${targ
 TOOLCHAIN_NEED_CONFIGSITE_CACHE ??= "virtual/${MLPREFIX}libc ncurses"
 DEPENDS += "${TOOLCHAIN_NEED_CONFIGSITE_CACHE}"
 
+def get_siteinfo_files_ml(d):
+    siteinfo_files_ml = ''
+    variants = d.getVar("MULTILIB_VARIANTS") or ""
+
+    for item in variants.split():
+        localdata = bb.data.createCopy(d)
+        overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+        localdata.setVar("OVERRIDES", overrides)
+        site_files = siteinfo_get_files(localdata)
+        siteinfo_files_ml += item + '-:' + site_files + ';'
+
+    return siteinfo_files_ml
+
+SAVED_SITEINFO_FILES_MULTILIBS := "${@get_siteinfo_files_ml(d)}"
+
+def extract_siteinfo_files_ml(d):
+    mlprefix = d.getVar('MLPREFIX')
+    if not mlprefix:
+        return ''
+
+    siteinfo_files = d.getVar('SAVED_SITEINFO_FILES_MULTILIBS')
+
+    for item in siteinfo_files.split(';'):
+        item = item.strip()
+        if not item:
+            continue
+        l = item.split(':')
+        if mlprefix == l[0]:
+            return l[1].strip()
+
+    bb.warn('Not extract siteinfo files for multilib variant {}'.format(mlprefix[:-1]))
+    return ''
+
+
 #This function create a site config file
 toolchain_create_sdk_siteconfig () {
 	local siteconfig=$1
+	local mlprefix=$2
 
 	rm -f $siteconfig
 	touch $siteconfig
 
-	for sitefile in ${TOOLCHAIN_CONFIGSITE_NOCACHE} ; do
-		cat $sitefile >> $siteconfig
-	done
+	if [ -z "$mlprefix" ]; then
+		for sitefile in ${TOOLCHAIN_CONFIGSITE_NOCACHE} ; do
+			cat $sitefile >> $siteconfig
+		done
+	else
+		for sitefile in ${@extract_siteinfo_files_ml(d)}; do
+			cat $sitefile >> $siteconfig
+		done
+	fi
 
 	#get cached site config
 	for sitefile in ${TOOLCHAIN_NEED_CONFIGSITE_CACHE}; do
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index da1230bead..af9b8ca162 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -49,7 +49,7 @@ addtask generate_content before do_install after do_compile
 
 create_sdk_files() {
 	# Setup site file for external use
-	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}
+	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS} ${@d.getVar("MLPREFIX") or ''}
 
 	toolchain_create_sdk_env_script ${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 
-- 
2.17.1

