Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.73])
 by mx.groups.io with SMTP id smtpd.web10.4648.1610768856358667157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 19:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pLQqG2WJ;
 spf=pass (domain: windriver.com, ip: 40.107.94.73, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLUEmQNm6svHTGh9MeoJq5VOq9uG01cAmNhjW60BKVJk+mxD43bSPcPzOVH7XCniAQa62o4bqEpXPbvVYiG8f/jOnmArQ75C2OJFu2KP5TW91vKwfaom5Hff4xCTxts5g8iC14Vau1/NM+uoPLjJHhyZH5YJv29qhpmDj/PPgCPo8186CSMVj4ilfT+Td1E22x5bTuf+skbl/DIRd2sx1LW96EVw+GE7P1QWHlq3uijZk8fp24zIpT7E0qnWfkbs3hRZYiCRNdSBIfvHCDzuK17wSpDntZicwZJzVMDhnxWGxF7GPUAeNL9a7Zk34ZB+Av913PC4LYCZ46Qj6Eo0Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjLeLw5PBd3UW9aMjFJdHHXrNJSn04ZXqWFpn/3I2h8=;
 b=INb0qXEKUAq3qD//v1fmKU/vXPiX14dj5NqKQZL4Wbv4XJteOiiy0LyAYvCI7B6AOU9cPsidgWw3fNTrXcxfb7QeXqFQ+OLGnaEgE4lt0G64aKyykCaPzsz3f8FsCj7nr38E/IBkvsKf5SyxdJxiFhYdKa6IUxiq18OhoBoCjhkd8+nzR/6lIR8OpMOvocd0MSLDNSvVAYF/4qZLEyF2swnVZvL+OEW9JU/s1Zt3WCvs+XpV4kQDwTQbuyyPZlnf6YPWRWgc7RLEPWwd7lDrBoKtwbfGNQTrPWyroh02/cKh+8Hg1fLzaPJTVjgL8sxW4FJVWXkEAnSoYuCdjdgbhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjLeLw5PBd3UW9aMjFJdHHXrNJSn04ZXqWFpn/3I2h8=;
 b=pLQqG2WJO1CjtxBHK6f68ERNs8R0MiJ0i6tslejIWylhfHp2R/VBqkFM85QLi6QYuefBb0basb6HDPe0ZCKdFXDHOhCzWoGxQz+ua9W1rGJ/5Wy97TppMFEAsTVIn4NDM15eQDP94YdOPn7micLZU2QY5Q9AAw9riA1OZAuaV/U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM5PR11MB2012.namprd11.prod.outlook.com (2603:10b6:3:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 03:47:34 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a816:b4fb:846e:9417]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a816:b4fb:846e:9417%6]) with mapi id 15.20.3763.012; Sat, 16 Jan 2021
 03:47:34 +0000
From: "hongxu" <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: [PATCH V2] dpkg: add nativesdk support
Date: Sat, 16 Jan 2021 11:47:19 +0800
Message-Id: <20210116034719.30846-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <4221b98b05e228a26d42acd2dc1db9e992e3b41b.camel@linuxfoundation.org>
References: <4221b98b05e228a26d42acd2dc1db9e992e3b41b.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0019.apcprd04.prod.outlook.com
 (2603:1096:202:2::29) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2PR0401CA0019.apcprd04.prod.outlook.com (2603:1096:202:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11 via Frontend Transport; Sat, 16 Jan 2021 03:47:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0448ec48-1024-49a9-1703-08d8b9d17547
X-MS-TrafficTypeDiagnostic: DM5PR11MB2012:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB2012A2723371AE90C207650D94A60@DM5PR11MB2012.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mER6PN3CZqFv3f2RXAY6vpuK01MZIEYOhvvA4IT6MjTmOEDH7jWhgRyn/ao8UQDmHNibgYk+Cn89LXbGb5nos08OmpZWvJveZ7qS+rzgfVDdLfXGPw2Df7z2r1B8tNCpB0916qPSzJG3rzPah++Zuh/lxptq4HK6nCuo2OxT8qZz6jYQ20+UuuKdXkXul7ALrmlyvifE2+EoHLsTLgO2VypNlV36kngdcZsx93sNcjJTkfkLbAf7dYSz/xq9ELpmuJaVET/duagfSV39znFdRyPMND546nDR+CVRICbLkeVk4H4ScOw81Ascctck0eDCdVe/Xo3HALCw1FqtlIPxZWN7IT+hAtO1Gn6tpRxe1wqiOxcVgBg5J1ldOH8QBTK9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(376002)(396003)(346002)(83380400001)(16526019)(8676002)(52116002)(5660300002)(36756003)(66946007)(186003)(6506007)(6666004)(956004)(44832011)(26005)(2906002)(2616005)(1076003)(66476007)(6512007)(8936002)(316002)(478600001)(6486002)(86362001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?0WgVPBXB19l+RSbX1iV4SbCjw2mWey7mVSA8T/60XWvyWlkzs9xFFbz6CK6t?=
 =?us-ascii?Q?UNcGzmWK1vmQdHTQOhtkrzb4pB6l+iexqmZUtxzbZ3jw70Q8wWa8NCSZoNA9?=
 =?us-ascii?Q?1ct7J1maW0p4Jp3hHcXpgIqWScbg9+uNjJZWO781eEoU96v2iPv+utftAWhh?=
 =?us-ascii?Q?lrOsUm5yGxewyVcP5gQIU0b+uDP4SgBS4p5wCaNWZ2OsYj53lyaG5WHZ9PyN?=
 =?us-ascii?Q?qeIjWYKsmKzhfKUPg2/wK/1aCj1AuxLWmjg4vcsJtL3LNNGo/YIJjpehSBCo?=
 =?us-ascii?Q?m+1MtVhq0Bc507LReLkRpCLQl7qfRqMoSV0Ay83f8YWvpJCcUeR+/WXl7szM?=
 =?us-ascii?Q?4fp6PHo8FHIRj4kRbfM8MkI0fmsRVFv6dPFM5bWEqxUDlEgUEyJmJ920HV8g?=
 =?us-ascii?Q?znBgg8qT1frxMQnWK5iz+hG6LSnepFIlZwEu1lN+UZ8lghUSEksmrF5Y7z4i?=
 =?us-ascii?Q?wsxuWyq67AB/yJroR+GwWVfH4tpIyGAQnYASdGW4TlDk+rHGqqRJkzQ56W6l?=
 =?us-ascii?Q?29mX+K+CeyVFmLukjiez0+rutLCWGE/tUkc8k6LEC9n5q4kNmfY1JUlldUBJ?=
 =?us-ascii?Q?Yb9sWjc2eUyr0dvhADoZ57qwXeWR7fnTa9meld/HgJJn/KNyRDOh2CBuWf+q?=
 =?us-ascii?Q?bYthxD7fVGdH2kmwZdN3zs+jTeo68/el0+s/gLQmirUfsTwpWapx1OimvF4j?=
 =?us-ascii?Q?I3FPDW+KsRYmkFJ5fWcxl/FGtvl2qVOYMIjiZIU+s+jofbpTdTLEG6RRQ7xU?=
 =?us-ascii?Q?NaKVir0cHBiuf5MUHkmu8GwVozFvAcc/Jd5hq3YybZ0wHHWzWI/6UDFF+Ghz?=
 =?us-ascii?Q?kCzjmOWLlEyNlpB/6KFjnMIRlmRVWYnpgB5saWccJql6BTYDofJJJj1nL+1w?=
 =?us-ascii?Q?RWmAiAsn134b7VvxZAi+Eugyy0V+MklwZy1U2tR4vwXZ22TVM0srlzhE/B4D?=
 =?us-ascii?Q?kIe6B5jAWYx6+LdJFOtQxasY3cNhAig2HULhdTv8k5lXcLVUCKYe30qIjupj?=
 =?us-ascii?Q?dWWR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0448ec48-1024-49a9-1703-08d8b9d17547
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 03:47:34.1690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlPZd22gZC6sPB33tYappAAhJ6Iify/rCRmdCPfPa/xkMqISpdyUIFLtiumrnaRSMxnHVwMWyR8RmqnFuJuOkStsEdOpLB7e02iRSHK04Qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2012
Content-Type: text/plain

From: hongxu <hongxu.jia@windriver.com>

- Add nativesdk support and override EXTRA_OECONF and PROV for
nativesdk

- Replace ${bindir} with ${STAGING_BINDIR_NATIVE} for perl-native
shebang to fix QA error of shebang too long in nativesdk build

- Conditionally (except musl) add ldconfig to runtime depends to
fix the following issue on target
[snip]
...
dpkg: warning: 'ldconfig' not found in PATH or not executable
dpkg: error: 1 expected program not found in PATH or not executable
Note: root's PATH should usually contain /usr/local/sbin, /usr/sbin and/sbin
E: Sub-process /usr/bin/dpkg returned an error code (2)
[snip]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 04fe85c4a8..3419aa56bf 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -26,6 +26,7 @@ EXTRA_OECONF = "\
 		"
 
 EXTRA_OECONF_append_class-target = " --disable-update-alternatives DEB_HOST_ARCH=${DPKG_ARCH}"
+EXTRA_OECONF_append_class-nativesdk = " --disable-update-alternatives DEB_HOST_ARCH=${DPKG_ARCH}"
 
 PACKAGECONFIG = "liblzma"
 PACKAGECONFIG[liblzma] = "--with-liblzma,--without-liblzma, xz"
@@ -46,14 +47,15 @@ do_install_append () {
 	if [ "${PN}" = "dpkg-native" ]; then
 		# update-alternatives doesn't have an offline mode
 		rm ${D}${bindir}/update-alternatives
-		sed -i -e 's|^#!.*${bindir}/perl-native.*/perl|#!/usr/bin/env nativeperl|' ${D}${bindir}/dpkg-*
+		sed -i -e 's|^#!.*${STAGING_BINDIR_NATIVE}/perl-native.*/perl|#!/usr/bin/env nativeperl|' ${D}${bindir}/dpkg-*
 	else
-		sed -i -e 's|^#!.*${bindir}/perl-native.*/perl|#!/usr/bin/env perl|' ${D}${bindir}/dpkg-*
+		sed -i -e 's|^#!.*${STAGING_BINDIR_NATIVE}/perl-native.*/perl|#!/usr/bin/env perl|' ${D}${bindir}/dpkg-*
 	fi
 }
 
 PROV = "virtual/update-alternatives"
 PROV_class-native = ""
+PROV_class-nativesdk = ""
 
 PROVIDES += "${PROV}"
 
@@ -93,7 +95,8 @@ ALTERNATIVE_${PN}-start-stop = "start-stop-daemon"
 ALTERNATIVE_LINK_NAME[start-stop-daemon] = "${sbindir}/start-stop-daemon"
 ALTERNATIVE_PRIORITY = "100"
 
-RDEPENDS_${PN} += "${PN}-start-stop"
+EXTRA_RDPENDS = "ldconfig"
+EXTRA_RDPENDS_libc-musl = ""
+RDEPENDS_${PN} += "${PN}-start-stop ${EXTRA_RDPENDS}"
 
-
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.18.2

