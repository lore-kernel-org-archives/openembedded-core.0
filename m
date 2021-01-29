Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.52])
 by mx.groups.io with SMTP id smtpd.web11.6755.1611909252569324719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gJoLdR9G;
 spf=pass (domain: windriver.com, ip: 40.107.94.52, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aueUGqKDDTvYgb5W00OlcZ5o1XP0qFETHq08CplfdXD0wKLwmDKERufRauq71iUHyYUJHfmSQko3vZAsPhfj9qQsbRiRlGdutwxJQvYgS3KVSGNIjY7Id4PeiYHwFJZ2eeHvG2bEaYqZwFXBu9iY9hqto2WYnUX7/0FFhivMQqR4oRlhjQt5eqn8KVqS9IPergJkG4k2oacccbnqiTBGOoyFI1OP4GOjG3KCdC4OTtBFIehtDWkDNQfX7JQ1JelPDuCMeEoq/FihJDCqjRVYeFNMJOWIBbsASzOikZNNWxxsFL6cUHZ28xqGfZwM3ZGWIBsFTnatINKRYJgTGtrsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWII5G349Q2KpCL9oljPU3E8E1p7b82d15lkXXzqwY8=;
 b=V2YGneoUYzEBshD91VuBloK9bLSgdh6D0gP2XJFcUNZy95EFQC/GRbqxi1N4zgAqxeVO6SMCShNN36KbXlYTDa7mCnNh6+ScbpWKllIzP0+9EW8FNcZyGOLFlVQdIzotyqtG9cNfJVaUmLQQLElb+P7D+L+BTPSpmZEMZ9T/WDLwSbI5Rmk7WphjptAXlFzWe3UqbkbxNqNO0CZScjYr49mhbyYEo98teq7+NVwuQfz5AjF1trOsT87+Co9xlL/ly/oh5IPLaMsi4M3sw5hmFgp75Ysk46vdmbk8XGMQGz/MqlOQ4vwoOuESFGzLozvMXsXz2X352MG/ozgq0lUiqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWII5G349Q2KpCL9oljPU3E8E1p7b82d15lkXXzqwY8=;
 b=gJoLdR9G4X0AcZVquZkBUtRiLMtIlK243kTBQ9mpVznc+DJF77ZO2vWe/C9dU9Od0O3EZf/cfu4+cPAIKRStd9LIXky3/UNjY42qJ7/hfjHRcnSP0b2QqFtx0pX8ScAhEnqQ+1k/doJXd6YDQ0ZeBDodMOhOqsna/OVZ2C9cWSg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3474.namprd11.prod.outlook.com (2603:10b6:208:67::17)
 by MN2PR11MB4205.namprd11.prod.outlook.com (2603:10b6:208:192::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 08:34:10 +0000
Received: from BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c]) by BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c%6]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 08:34:10 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/3] pseudo: use PSEUDO_CONSIDER_PATHS for path filetering
Date: Fri, 29 Jan 2021 16:33:50 +0800
Message-Id: <20210129083352.13305-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:203:b0::20) To BL0PR11MB3474.namprd11.prod.outlook.com
 (2603:10b6:208:67::17)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR03CA0104.apcprd03.prod.outlook.com (2603:1096:203:b0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 08:34:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c82026fb-ed51-4115-285f-08d8c430a62b
X-MS-TrafficTypeDiagnostic: MN2PR11MB4205:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB420587CFB18A9AF90FE7911AEDB99@MN2PR11MB4205.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6vgp4a51aGhoDdr0gS17BVunREavU+XhkyKlSZwRS9o6cla7eHz2PHiWxSxXcsje3AwLUVuVSaSFyyeKzfi6idTz+Ny37mJFaWDrGpgIqKJyDNIsnP7kOZnmeCp21OhTFDODHF0Lf+E9VWqyKtrzExe7vzrjpyCK/as+rKNc5dBqHYn6un26G7DMyuEWPAHYboZ69ZGcqmVQCmuYWX87Va7q+WNzrWuFGiyJNEFjjhe77G27S3dwliznUMYgQl7iy6IJwGFq7ywLursVVRiSfHaTtHG8g+Uyw1V+qOGXGS15JddoNSvNUWdL5Nv/aWc6Tt7HyiB6Cm0gx/PPQKikFFTML5U1+Du+JiRAJwlmS17s3d9ZCnqA8b3Wo7kCgP59dZXX4j5LndSzbHoFP4yV/w3CPRDwE0CdHc6iNeNnJnDHzCtUpOCU8pUUm7cB7jvC+ZJmdXJ1Xrpykn1JUrCRb2r9VRGHhRQNIHxXkwDdsDRwlGt1+TQpJBTw/Y5LFGMO/TXQENsLOXCo70u8O63L1w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3474.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39850400004)(346002)(366004)(86362001)(2906002)(52116002)(316002)(6666004)(36756003)(16526019)(8936002)(2616005)(956004)(83380400001)(6512007)(1076003)(6486002)(6916009)(6506007)(478600001)(66476007)(66556008)(66946007)(26005)(186003)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Seh3m1wZWe/gRjCmEuMjQXKqJeI4ClhpwpdSfYdCnBDyrnkzRtIDmuQ0VwD5?=
 =?us-ascii?Q?SZdNZnSSzTvgFkY7d7570aWyJGXJNdUyxgMflGiQhD1E7a1T160CMQMPVS2G?=
 =?us-ascii?Q?bco+28cZtArDVr1wL/2dRkE7Kjq96uiXFDVXckSW14EeGOT7446otzGqo5Vh?=
 =?us-ascii?Q?LdAlh4ANzqvfa2ZNe/9FMhoaxOSBY43e1wkozrqVvJjeJsHBx5E57z+4M2dU?=
 =?us-ascii?Q?IQ8wdkylQkGO9BgXwCei9AIYxLvhc6ngYlGgbt/SGRkf434NdF/FrEaYFWy2?=
 =?us-ascii?Q?bzVPIv8w6dgwbcvMR/Wv8ECkJqmcwB+B1tHAG51xl6Fl4ULxeS/MS4FW96AT?=
 =?us-ascii?Q?7j83m6KxmSS/0yBSJwnkdglWZo2JD4KTDb5cJjMHW1hU4KK1+yq0Ybt+mJx6?=
 =?us-ascii?Q?nbe/9RT/XCkO4hq1hVWekDGQxxn6Me4JhzzhzB3ylewSWhKiLjwzZ/NccY9M?=
 =?us-ascii?Q?zNzTDw+ZOsS2fOjeAWRkuBQ50nRCVV5wovKZU+Rdf0z6MdjpTO4UubTYOMqp?=
 =?us-ascii?Q?Cs7dSSX9tg1mv/QbYvkg3qwsv6SLVnTD6nA3Z5pQ92j6fFbtzp+zZi7WK5Q6?=
 =?us-ascii?Q?CeLo+8Io9wXfbLA/gFH9SCgnIcH3GW+oeseqJkNlsvDZN+eZjv6psJbZffb3?=
 =?us-ascii?Q?VwXHsW+E9TcVcp5oZADMqs2Pk6CVIEY5EAUZG83T05zuUf7yRWpGaHNCQn0S?=
 =?us-ascii?Q?OkI735KustrDzHy2+WrR0IAmYftGyJUwFDa+ZW8WXCk9KrPuG1iEjC2I8s8w?=
 =?us-ascii?Q?HRDoOC3MgFeeSRMLG2gG/jT9IzT6BXJRsYD6e7a5yGKxhCnpid/IYwHVRrMi?=
 =?us-ascii?Q?uk0oSOKRgM6EauRrWA90QkDcZaajTab5rUwK49GPiTz+QI9hLNikplPHEN9C?=
 =?us-ascii?Q?yv4m1Ft6m0tjUoYgJJwS9PnRbQ/dv3dkoH89DP11JuWja9kbXAcF2SzT5MsB?=
 =?us-ascii?Q?3mRQtgJ2mOKfC23SilxlYVcRnK+acRrSwjMwi6LoK9KhNLPrtLSaAF9G64xE?=
 =?us-ascii?Q?WbbmnWeK7LeysHLK/hLEG8T7pBkxUAthdYNGQ1YpdKp8Uopa9OGdEB8hCpxp?=
 =?us-ascii?Q?qusdj6n5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82026fb-ed51-4115-285f-08d8c430a62b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 08:34:10.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSHD8NrgPMSIVhgll2blYYxukZZyocF2rQfcrQcvNVclFlDR0AT3aiArZNLo5ApQkaAofYY7WTu1kWTuAJZa6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4205
Content-Type: text/plain

Patch pseudo to only take into consideration paths we care about.
Use PSEUDO_CONSIDER_PATHS to hold the paths. The behavior of this
var is the opposite of PSEUDO_IGNORE_PATHS.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...DO_CONSIDER_PATHS-for-path-filtering.patch | 55 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo-use-PSEUDO_CONSIDER_PATHS-for-path-filtering.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-pseudo-use-PSEUDO_CONSIDER_PATHS-for-path-filtering.patch b/meta/recipes-devtools/pseudo/files/0001-pseudo-use-PSEUDO_CONSIDER_PATHS-for-path-filtering.patch
new file mode 100644
index 0000000000..e17a2f1459
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-pseudo-use-PSEUDO_CONSIDER_PATHS-for-path-filtering.patch
@@ -0,0 +1,55 @@
+From 683c6e39e214b34b6ecc77684ebfdfef38a2b1e1 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 27 Jan 2021 18:31:26 -0800
+Subject: [PATCH] pseudo: use PSEUDO_CONSIDER_PATHS for path filtering
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ pseudo_client.c | 8 ++++----
+ pseudo_util.c   | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/pseudo_client.c b/pseudo_client.c
+index 6310b99..5ac0702 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -1543,19 +1543,19 @@ int pseudo_client_ignore_path_chroot(const char *path, int ignore_chroot) {
+ 	if (ignore_chroot && pseudo_chroot && strncmp(path, pseudo_chroot, pseudo_chroot_len) == 0)
+ 		return 0;
+ 
+-	env = pseudo_get_value("PSEUDO_IGNORE_PATHS");
++	env = pseudo_get_value("PSEUDO_CONSIDER_PATHS");
+ 	if (!env)
+ 		return 0;
+ 
+-	int ret = 0;
++	int ret = 1;
+ 	char *p = env;
+ 	while (p) {
+ 		char *next = strchr(p, ',');
+ 		if (next)
+ 			*next++ = '\0';
+ 		if (*p && !strncmp(path, p, strlen(p))) {
+-			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
+-			ret = 1;
++			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "considering path: '%s'\n", path);
++			ret = 0;
+ 			break;
+ 		}
+ 		p = next;
+diff --git a/pseudo_util.c b/pseudo_util.c
+index b6980c2..065d975 100644
+--- a/pseudo_util.c
++++ b/pseudo_util.c
+@@ -43,7 +43,7 @@ static struct pseudo_variables pseudo_env[] = {
+ 	{ "PSEUDO_BINDIR", 13, NULL },
+ 	{ "PSEUDO_LIBDIR", 13, NULL },
+ 	{ "PSEUDO_LOCALSTATEDIR", 20, NULL },
+-	{ "PSEUDO_IGNORE_PATHS", 19, NULL },
++	{ "PSEUDO_CONSIDER_PATHS", 21, NULL },
+ 	{ "PSEUDO_PASSWD", 13, NULL },
+ 	{ "PSEUDO_CHROOT", 13, NULL },
+ 	{ "PSEUDO_UIDS", 11, NULL },
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 29fa9152e2..ca9dc96c99 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,6 +2,7 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
+           file://0001-pseudo-use-PSEUDO_CONSIDER_PATHS-for-path-filtering.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.17.1

