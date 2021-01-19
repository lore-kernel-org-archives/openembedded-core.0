Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web08.9280.1611048234720859363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 01:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Z9iPGERR;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAGkxxoYCv8GwuoVl3gEQenyRo0q3lGQjG8VSBLKsVYzgjLoFgsKGN0365Rc55IF/uAEKQDwFghkrzMKpC8uq8RsMfqRilGYqtxsAyVfYrGqzo5F/WmF3gEua6kZa3BQw9kiRtZj1pRW2xmBrIOaeGRSEVfHZDbFJbCDbGWJ/iBGmMVFBBLI7b01arEKkz9BNGdvfigk0H2UrLzIVlkaXgcUWLpDayewxxIL7jQBJS/F5TB2TkqLp9kmOhQzbl1PIoJf83pbuACBmdD6b/jLQPB3/04k+g7bB8+z0pGODvyMO8jEPa0lbRpd+CX7AkhRUGnVQEX6BQnDswxsmTmzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6ilHzSHHlVGRbtz11JYN8aCu80IgUsqVlOAYQsuyBQ=;
 b=jnzMfEaQnKZzQcevDHB1CioR1JP0m39T4mGOPwilIE94wb7RBoAKB1QY8TYCEAcrFiCqcduuk1w9rw/yxzvzw4uqjUWrki+ZlwbYnKwokI9dXZ89k6c1QzvqtzjqoBNZNhN6Gh46NDTyQQd+TMUuQgawzDUycD3OEpjXAjKRP6aDU92/7EwhFl2WS3SLn9u3EWR9DBjFuRG0uHHD14YZzGNHftZHyL0Xugq9wwxWzixZ/fQpGG9KSvKyFQ+HvY0B8U9+KMimzFgpOquHm8FBnrFb3ehyZYIbyjaGZ/92/jUBD+zXaLGU8OoPZdA3/BqZTojc7FtFq2c/ukdW/avMcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6ilHzSHHlVGRbtz11JYN8aCu80IgUsqVlOAYQsuyBQ=;
 b=Z9iPGERRvgznTZqHlMhosfXELJ67c15Q+TnpoM5mwrJoBUcfsW3JJJNuyHCfcWZt1Zif1RfU50kj59fkpIpcEWvxMRcTYdRGniDoym6OqjODjrXvmBH9Js1hE7MKzR2syXHTOgfiHT5M7KtU9kA/WNQ9hQMv7esGJeDLUhFcd2w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA0PR11MB4541.namprd11.prod.outlook.com (2603:10b6:806:94::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Tue, 19 Jan
 2021 09:23:53 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3784.011; Tue, 19 Jan 2021
 09:23:53 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] ccache.bbclass: Use ccache-native and disable ccache for native recipes
Date: Tue, 19 Jan 2021 01:23:44 -0800
Message-Id: <a5b3282048df4c786dbda9feec303ee414c55627.1611048144.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611048144.git.liezhi.yang@windriver.com>
References: <cover.1611048144.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR03CA0122.namprd03.prod.outlook.com (2603:10b6:a03:33c::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Tue, 19 Jan 2021 09:23:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d8a941f-c2c5-4385-1497-08d8bc5bf053
X-MS-TrafficTypeDiagnostic: SA0PR11MB4541:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4541DA28D8C21058B9986ED7FFA30@SA0PR11MB4541.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dJnVZiTkqEa0Dl+bCygClpQM+2uX3yFMELGMm87MJK11vIoAIEsCk8+jlOs9+XkSfhQWjnj/HDnphtOW+vD7ziFGkAShML3+9iaoF98rKyOka0y7iVbCHX2IJUOk500opf5Ml/XoHtNLzmgQDiReVPFghSqzWFvR9Fq6gpl//hjANzi7N8ibde+pLDz9DMSf+qjSrOlkDvK+CichmNrk7UQNOG5yy/fbB9MHkFXnOWfHJj/xpnJUf8o5wBmvWCvbR7RnBrAI4OQYk0cIDTmfWEUVlu2+NXG6++XkpdABA7vw0avGVvzC7Mbk0d03dAhutSZYppwFP9w7O8JV/MdHJ2+azLqtpyXIKOTEtLz06zGmdcQCqKsMP44Xv+cbgxIqIaCwgKv2s9qavJ/5ggYXjA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(6916009)(6666004)(86362001)(66946007)(66476007)(2616005)(956004)(6486002)(6506007)(66556008)(83380400001)(26005)(52116002)(186003)(5660300002)(478600001)(316002)(16526019)(8676002)(2906002)(36756003)(8936002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?v3zwtzeCeahbEeKe0p9ZK3yOU0rFXKsih+iz9zPPAb46yig3uHBlMkpyMVwm?=
 =?us-ascii?Q?DUfn1EsrFZy0amtbe0rc2Gq8KYDHuUljZUtm4JHKBAc+dvIBeaov3iMsa2NG?=
 =?us-ascii?Q?lHm8zFrxYjz4DgBZQnwO1fcZ4QrJqqnTk8LEz28hFFAJ9KfdWaWx4FCfxiwT?=
 =?us-ascii?Q?aJ2/44rEqPho7dbELscf2jKSf2yDGyzXe5uEHOAi2q2kZNQsIlkGoOc0Vhk8?=
 =?us-ascii?Q?2IsPOz2QNi+YiWVaW0L7J4bP6Li2udgIZM4GnXl7kstEePg3PnzSuBLReNw7?=
 =?us-ascii?Q?bR7CQytBRnhKz14OwC/qt5ioFn2UWsRniVVcbh7oyNoC/0UKw1M+WOUCD/gb?=
 =?us-ascii?Q?YFGlUVLLKwOkJSi1LH2Y7EwVbwz1hk5HyQocVITSkYslh2sgHg/kE/hVYknd?=
 =?us-ascii?Q?/RFhiwjN5DWM1FU3atB7N7vjAyGial0AqdLBjl4gwvzuwfa1g6XKn67l4TAT?=
 =?us-ascii?Q?+K9PjxicTq0NOvRD1/W0FVrHk9gAc7iKUghzQhs+dyR+oQRr2WYEuvAjJDDK?=
 =?us-ascii?Q?pQFgiCcW6u/7fOg9h4SWxCbcLdokPLaehbQz08EhqhJv3vO+AlalkRLbL38f?=
 =?us-ascii?Q?bo9jfoLTgOizOmMI1aFLroFkgbYRMMnPT2F3h70T8r5S6YhWRXchixKyU1ww?=
 =?us-ascii?Q?7gh92Yn68MIRU6CLicAOkIxKCkfdrIpM2YXWSHZKZBNjfoAA1wFdsKTsHhhy?=
 =?us-ascii?Q?n7MfDu7aYQK/MNZ0qsmtENj5OD4r0fqOfxyIq7YDTaPifHeUfT7q6y+p2ees?=
 =?us-ascii?Q?TjCbSPBLE9DtuZLtLFf6NpCIni46AhulzO5oM7+ewWOeAUSWDQn1Aes2U5nX?=
 =?us-ascii?Q?z0EDUk+k39vavvxBpVN50SSNdw8o0XZC8jOJAgDsFnvJHNQFakGjtV8H+mnr?=
 =?us-ascii?Q?RowS9cnk+JSN0pm6gZeIPwk9haQtUhTa67tf9Rp6U2zxETSuFFnmRP/OMU6L?=
 =?us-ascii?Q?1qJI0SQItGSVly3G2LUqgZZwnTNogzBI8Bom0ruPC6dhM517NveqV+ppsTju?=
 =?us-ascii?Q?18L5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8a941f-c2c5-4385-1497-08d8bc5bf053
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 09:23:53.3987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdHqG7Odhjb3+yunAjkzuoDgZjiDtqrDfsTjXT0isdyh/rwGYWizMu7k8gcJF97zPbBs2cuiDNANJ6Mco9Yrnbq5+5pnrBWrtkd32O3cE8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4541
Content-Type: text/plain

Since host's ccache is not reliable, so disable ccache for native recipes and
use ccache-native for other types of recipes. We need disable ccache for native
recipes is because ccache-native now depends on cmake-native which causes
circular dependencies, and it's not easy to break the circular.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/ccache.bbclass                  |  2 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index fc4745609ce..4532894c574 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -49,7 +49,7 @@ python() {
     """
     pn = d.getVar('PN')
     # quilt-native doesn't need ccache since no c files
-    if not (pn in ('ccache-native', 'quilt-native') or
+    if not (bb.data.inherits_class("native", d) or
             bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
         d.appendVar('DEPENDS', ' ccache-native')
         d.setVar('CCACHE', 'ccache ')
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index e91f0bd18f6..fb0a5ebfed4 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -38,13 +38,14 @@ class ImageOptionsTests(OESelftestTestCase):
         p = bb_vars['SYSROOT_DESTDIR'] + bb_vars['bindir'] + "/" + "ccache"
         self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
         self.write_config('INHERIT += "ccache"')
-        self.add_command_to_tearDown('bitbake -c clean m4-native')
-        bitbake("m4-native -c clean")
-        bitbake("m4-native -f -c compile")
-        log_compile = os.path.join(get_bb_var("WORKDIR","m4-native"), "temp/log.do_compile")
+        recipe = "binutils-cross-x86_64"
+        self.add_command_to_tearDown('bitbake -c clean %s' % recipe)
+        bitbake("%s -c clean" % recipe)
+        bitbake("%s -f -c compile" % recipe)
+        log_compile = os.path.join(get_bb_var("WORKDIR", recipe), "temp/log.do_compile")
         with open(log_compile, "r") as f:
             loglines = "".join(f.readlines())
-        self.assertIn("ccache", loglines, msg="No match for ccache in m4-native log.do_compile. For further details: %s" % log_compile)
+        self.assertIn("ccache", loglines, msg="No match for ccache in %s log.do_compile. For further details: %s" % (recipe , log_compile))
 
     def test_read_only_image(self):
         distro_features = get_bb_var('DISTRO_FEATURES')
-- 
2.17.1

