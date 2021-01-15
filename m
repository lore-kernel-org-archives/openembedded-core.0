Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.82])
 by mx.groups.io with SMTP id smtpd.web11.1801.1610703952164923422
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 01:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pJQn3SDk;
 spf=pass (domain: windriver.com, ip: 40.107.237.82, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCJ+6lP1RqEk4nm8X0g8Wg98gz6PNhMkKES3HVyeCeKgCuLZpT/1HMU0/GpBI0ZZBy/Akx/uEg24hwgE9Ov2o6XQ2SFbJ+MJaKZcWDM3H09i8qjsnCr5uVWy7uh4o14mlz3h+iAvYCtkgbhJgluf2Ilj19yIw7BRF8hFw86s/Mv4PRH7CoxlGJqdp+cCfQ43gxAIRH44D+kDe7CzaQxy38Z1nD33lfeILDFNZXG4vNMpDFDLarR11zRaQhkZfVSdkn57fAQsrWkn4futfoabrrStJULP+MxC3379V3eWT3fuuli4zzQIUEZra69Gv85qX5QQkOmQynnDrbZzhRM8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOCD2kY1Qn9GM8e4NCwRVSYZCoIc9KnB4nNyY7ebqqU=;
 b=PhN1T9GJnl644BWXVh6mfgYJXRgcx3X3CX2gm7FvHNsVWn6X79kBw2Xg/9Wvv8NRmyFfNMxAQ+mfrQ4kp/x2XQ/GAOb1nIhH7Bq2U1X70T+6BfQMhgDt6RWPpDry+XpSaIDXHaRp4dnGGSMGNG0qRE2ubhKGgdnnkMCcvmSrA6rDEop0no0UbrMp2ho8a19J9T+hs7xPECn46T5b3NPlzDcIhswnmCrnkFioxPPGojRmwacH6DLYW1kNrrKHHAGIzHjiWsLbXZN+BUgdB/392MXvfFia/YctKigEPEsdL0PVdVtD0gRj4ejN8sXrGq/LQMd24mFPqTPwy/fLri75Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOCD2kY1Qn9GM8e4NCwRVSYZCoIc9KnB4nNyY7ebqqU=;
 b=pJQn3SDkSViiNAqZLoRGOJ63QEC0J5oYo+DBdSqinvFtVv+TbsB0s2+NHb4jH013nYkPN/d8N11i69vJOldymGBr7U+kq5jIR1Nl5toyCTC/2I7MUwa0vcVaaO8gjgooHWrCHYLmWvOXQsdYZWY87ilAABoK4Df67HQFLLpXsGc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4369.namprd11.prod.outlook.com (2603:10b6:a03:1cb::25)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 09:45:50 +0000
Received: from BY5PR11MB4369.namprd11.prod.outlook.com
 ([fe80::2d75:bcae:f805:57db]) by BY5PR11MB4369.namprd11.prod.outlook.com
 ([fe80::2d75:bcae:f805:57db%3]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 09:45:50 +0000
From: "hongxu" <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] dpkg: add nativesdk support
Date: Fri, 15 Jan 2021 17:45:34 +0800
Message-Id: <20210115094536.18651-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:203:c8::17) To BY5PR11MB4369.namprd11.prod.outlook.com
 (2603:10b6:a03:1cb::25)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HKAPR03CA0012.apcprd03.prod.outlook.com (2603:1096:203:c8::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.7 via Frontend Transport; Fri, 15 Jan 2021 09:45:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82a7e854-8ba9-4ca4-2260-08d8b93a572f
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5040:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5040152D8B4B973D38A4662294A70@SJ0PR11MB5040.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N3KwxtIPIiagOpRzYqDbBN6amvla066HaNitao4T+BROOzVyBk47MCEU3Gmpr33zTDiFy4yxn94PtHiRgcmXaboUCTV60tjG2FnWERaoWWkhNwjqurWJ3P9AmEcj0mQubSSTbHQ6JMTi3p79JhKyMnSgc7FVyik5baJOhBn8owr60dQT2ZVcu7xwrHdNLkpwLTq5QLaJcEseNYG7G4Ll5twhKejOpkZB0B3g/ieurNqG5sEE1OX4Y9QvWPp/ouZXtvH14k2N9VkKbDgNv+olIDWMu0pqF5luXCVzzu3/wAMJ8KmdIlWE8Z/FyQ/jv3dWEnO6C7J1pzqNuP7K5RmpsMagszIIWjKgNd/HIqm5bww0o+cEfGLX8ffdc3Fy/mvO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4369.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(39850400004)(136003)(6512007)(66946007)(36756003)(316002)(956004)(66476007)(66556008)(6486002)(478600001)(186003)(86362001)(8936002)(2616005)(44832011)(83380400001)(6506007)(16526019)(8676002)(5660300002)(26005)(2906002)(1076003)(6916009)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?SG0Nm0FXkTDOArqPpVSQyz89CvmHPHN+11yozAzqHlda//20gGOkFjh3hQZJ?=
 =?us-ascii?Q?ZgV0TpLZTEu4lb+FuVghal2zdnqioqk9jH13dfaT6KgOub/aBCVBAL6A+mJ9?=
 =?us-ascii?Q?Yx2RiIzb//zmSbmiBfF1OPZVfRp3WhzKu16PXgrcS44ZVlLRagUzfmsGspR7?=
 =?us-ascii?Q?nXf0CeyADOQFJo4atgfh0LtRY95nop5NMyBj/WnFk9PwYgz1GVuMztQSBCAj?=
 =?us-ascii?Q?/2zBiIfUKo1QYaGNWHQRPTyXfBPltJGRq1I5gNcLAoRa4is56ZWkQX1bXqky?=
 =?us-ascii?Q?yMi9DnH4Sg3sN36PuTHPBTlsyjaPDylllH9iPbdD8dMmPRt6f3ZqHs+wEVDm?=
 =?us-ascii?Q?IFQv9HdgBkGOaTNojJZwmm8SsO6AGKnQmnCU5weyVMLf2eumNzerziV+PqYa?=
 =?us-ascii?Q?uaIjjnHZsBgFWwHpNZQBGxdeUkD/XbU4QJuYqBmY9sqIwypaOK/Gvl4CDS1t?=
 =?us-ascii?Q?OauotmrIqOD/8/lK7oYRGFKF8aDNjI9oeNwmb+J4J/jS8roxykNDqlml1IOb?=
 =?us-ascii?Q?Lc5CZZBf8YBF7b+sorh9MLw9a5ZRqF6CM04KWaWmeTgVqu85Iwfl8FRxZmKS?=
 =?us-ascii?Q?ApAdgHIqunq/PTAa0M9gFI0guNjPG+7UEGjSOdPLixl5GNSDVNv716dYaCJi?=
 =?us-ascii?Q?8DjY4bf97gi64/iOkvTEHtURq1+kd1KmfUxYeUsnI4mE3sQd4l52X7zjKYiF?=
 =?us-ascii?Q?IxvgM8dib6vvi/657OzVmvy250JJl3hEV072/lbyfepdLvs71KRvGV2v/n8Z?=
 =?us-ascii?Q?1mOj95RiWsMI4L2/WkZpBW6XZujEOOUgaCjFddvcvRqo3x+dbPthurxI7Fo8?=
 =?us-ascii?Q?C+90prUZGPhml0+vq6eMWv34Hs4NBc6vPuTEn1qGvm/A/qwnTwCNfc7x+Q5j?=
 =?us-ascii?Q?DrBibWcF9eWcmtvc2FfDM0UrZdyxR9Ga9x4VgrA+XZTgGefRnUcug8Vr1Dso?=
 =?us-ascii?Q?9ht3NwRV8e7dLBwsYZX0gdBmHkE9uiiTtc4yDYwg8UH39yppoKrwfQv/FVfv?=
 =?us-ascii?Q?JIIs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a7e854-8ba9-4ca4-2260-08d8b93a572f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4369.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 09:45:49.9590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwYLS/2UAsIurHCoXh93IO0cPSAE1iB6yGcsKFI9gDpHuojo12j7CvQ+QYIrkSt0QqhrJ7QzIs/h42xofR9QnD5T4GNXrgONTgWemIDPMsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
Content-Type: text/plain

- Add nativesdk support and override EXTRA_OECONF and PROV for
nativesdk

- Replace ${bindir} with ${STAGING_BINDIR_NATIVE} for perl-native
shebang to fix QA error of shebang too long in nativesdk build

- Add ldconfig to runtime depends to fix the following issue on target
[snip]
...
dpkg: warning: 'ldconfig' not found in PATH or not executable
dpkg: error: 1 expected program not found in PATH or not executable
Note: root's PATH should usually contain /usr/local/sbin, /usr/sbin and/sbin
E: Sub-process /usr/bin/dpkg returned an error code (2)
[snip]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 04fe85c4a8..3325159299 100644
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
 
@@ -93,7 +95,7 @@ ALTERNATIVE_${PN}-start-stop = "start-stop-daemon"
 ALTERNATIVE_LINK_NAME[start-stop-daemon] = "${sbindir}/start-stop-daemon"
 ALTERNATIVE_PRIORITY = "100"
 
-RDEPENDS_${PN} += "${PN}-start-stop"
+RDEPENDS_${PN} += "${PN}-start-stop ldconfig"
 
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.18.2

