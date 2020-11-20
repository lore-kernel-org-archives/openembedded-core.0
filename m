Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.57])
 by mx.groups.io with SMTP id smtpd.web09.480.1605892629838063916
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ctOtp2en;
 spf=pass (domain: windriver.com, ip: 40.107.223.57, mailfrom: stacy.gaikovaia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NORWL/EG1602b0ECv8blGXGwwFDuvQOBf+QlgQuciigW4Xiv71U3OXmPpTSAt+Oh7jrVpJtmCdyhreCqLc54jBIMtjh7lhpopCmfR30HdKt781oYirLVWK8z4jQ8lXEDB4gnDoT9lvO+E8AMdXofqim22IfFmoWtiwTKKuWmyXsXdt7JfC23Ep8plp9BOIgnX4Zjzrov1NyJKlQLBwF09j+SvHlX3DeIT7erhzpay0nFTH2+LNfaPvEGWrVJgTIH1f0NkpEVBDm+ji5g4F764qwBi28IOkxNtVZjdIbnTUStb8VIphxyFnSdFmb6LVCU7MUAqkVSLvCoaKcrVpM68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mijLBVNlrO7Jw4e1pNCmKRMn2SOMFGXhpFyKpYc7/gM=;
 b=SJFvTWZ5my2Jze5CELA1B2CYla29SWGRwlW4ze6iYGTsyPg6tW9waz+8xeWTV5sMrvJzVqzpbp3JyWlmHa7mTc/JypjGH/+a9miwQQuXFe77t0L6qyh7wPPkm0MduvJZG4PDE+10iZUyYP7XgaTDUHYDcnpvVcU6S+n/tij7CzqW2rDnjAHfplLs31H7MLlCrThu9oxotg2H49nJIu8Z29dR7jZSYqBodAo2TSq9iGqnKfa3bz6EwZiCHaEdJiPUdGJhwHuX2ppTGEZ5qR0oxiP6mMnOcg1+SQpHeu0kiMCqrITPVvvGEckaLct0zQ8FAM7efNfHyCTztWWvvSaUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mijLBVNlrO7Jw4e1pNCmKRMn2SOMFGXhpFyKpYc7/gM=;
 b=ctOtp2eniXHbv6Jfh7qg09k6J22RBKT8p5boQlUDagx1tcgoR+nFY0DwjW9X2/mmHw/Z/dQqaQ7KDIO6yXs74EtA2JUj1J5rUe68e4810jYnq6xRsTubiPPxyZFKauI+jjkUYPOvKjLnyJEIcfKwq6ROu8aYSDmGlBqPrMOoV+s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3127.namprd11.prod.outlook.com (2603:10b6:a03:91::32)
 by BY5PR11MB4497.namprd11.prod.outlook.com (2603:10b6:a03:1cc::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Fri, 20 Nov
 2020 17:17:07 +0000
Received: from BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::3cdc:2026:1e0d:62f9]) by BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::3cdc:2026:1e0d:62f9%6]) with mapi id 15.20.3499.034; Fri, 20 Nov 2020
 17:17:07 +0000
From: "Stacy Gaikovaia" <Stacy.Gaikovaia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: CVE-2020-27619 fix
Date: Fri, 20 Nov 2020 09:16:56 -0800
Message-Id: <20201120171656.193107-1-stacy.gaikovaia@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BYAPR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::20) To BYAPR11MB3127.namprd11.prod.outlook.com
 (2603:10b6:a03:91::32)
Return-Path: stacy.gaikovaia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR06CA0007.namprd06.prod.outlook.com (2603:10b6:a03:d4::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 17:17:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3b58d3c-b4a9-4176-7aeb-08d88d781bac
X-MS-TrafficTypeDiagnostic: BY5PR11MB4497:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4497984C73E803EA36BBCF57FDFF0@BY5PR11MB4497.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:192;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+pO34J7EeP+8Sdrvrh4/M69aZXTJ6mcXQAJOKHAEVrb50/Vxm3SRds8U+HJzI576CXEokmGU6OY0EMldGJEL27Hs5Vw+HJgs+riouSY07lr5rcW63mEhEFAH/O5ln1CHbTYgYc5oGEAobx6Jt2u0LMbOUXhrVna7Yf3vQAcvJRcYDlheMnTl7jSg8zeIiytf91fWc++HQ98xv0r7a1xzzVg92ibMx9ZyLQpbY0Po224m4k/MFjc+m023hqFJKV+M0f/h2vzyVITSz+GyidTriY1KRXmzv+6ZcNdNktbxFNM5NMORzGLekhn7kzQ0Or4lDrv7ilkcUnnwE69Dwvu8anVzhrWZHhBvRYXyozYU0QC3Q4T8dpJ8D8PVZrASQqJcVs4/51r8azMuBVftcrLhsw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3127.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39850400004)(83380400001)(26005)(316002)(8676002)(956004)(66946007)(2616005)(6916009)(186003)(2906002)(44832011)(36756003)(1076003)(66476007)(66556008)(6506007)(16526019)(6486002)(5660300002)(478600001)(86362001)(6512007)(6666004)(8936002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	lkBNCQ9NxoE2cdXp3IObBO7iJMCvoTREdRnoBCj23tuMHXd9yTfX1sK2H5AXgGWVwEtxx27eItVLznEJ+45r6asqBmP4WNze+vniNHEz9sMBX4j6fpksfOz7G+t7wztw+B3OGpaxZNX8mseLsnhl8AS6Qnzzxnv4PDryCcw3vM7ui48amx3hIbUzhz9lglN0b5niEMQFddZ1qQbbHOcC4wSJGiZwKAI6vN74OoxDOfg8H095wl49xl9NknEzfl4ibs8KssLJDT3XesjEm0da8gZ8nBF5z5st79FDTznwZQ8hPvugTmJi+U7A42rZpPx4nuUJICtFt2DoHHMBe+kZ8YzLa8kAzaiGZZaR6v4gvmQtLRpZ+NwXmopX7OVQC0UGNE7g02415AHihJdjIm2aqieW5lCHEUEJyEisg4EiOIDIKjHC/t9X0xjbPfJUplcrJDdfcmZUlRR/4F/TQtaujWjJbEY7DajXoXNcfhZjLu0o3IKSzZfsFMY8AdMOHhfSPXHubLVvPPMBin0ntNoYO2cnOZRgV2SePolW89yCNAALkMxDfVMWNp79Jo6qIlnktAhaeZktnN+fkpNq4GECms4gDvRmbfGQgkPVjmUEl/XC6+jtd6zt1b8i8wGtAP6hVzHiuW5hruqCcMdbIPu1VA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b58d3c-b4a9-4176-7aeb-08d88d781bac
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3127.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 17:17:07.5344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ublepsFeJJLSmpxQQQGCsPjT17Fs1e5HUawt6agF7O4Ph6nsclEX/jlwv4sCO9aQf2hgI0w8WG1HcuLrKbnBqfmMToKogC7fjZf4emRFe78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4497
Content-Type: text/plain

From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>

This patch fixes a critical CVE in Python 3.9.0. It can
be removed after an uprev to Python 3.9.1.

CVE: CVE-2020-27619

Upstream-Status: Backport

Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
---
 ...ger-call-eval-on-content-received-vi.patch | 77 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.9.0.bb |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-bpo-41944-No-longer-call-eval-on-content-received-vi.patch

diff --git a/meta/recipes-devtools/python/python3/0001-bpo-41944-No-longer-call-eval-on-content-received-vi.patch b/meta/recipes-devtools/python/python3/0001-bpo-41944-No-longer-call-eval-on-content-received-vi.patch
new file mode 100644
index 0000000000..c51d0730a7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-bpo-41944-No-longer-call-eval-on-content-received-vi.patch
@@ -0,0 +1,77 @@
+From e912e945f2960029d039d3390ea08835ad39374b Mon Sep 17 00:00:00 2001
+From: "Miss Skeleton (bot)" <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 19 Oct 2020 21:46:10 -0700
+Subject: [PATCH] bpo-41944: No longer call eval() on content received via HTTP
+ in the CJK codec tests (GH-22566) (GH-22579)
+
+(cherry picked from commit 2ef5caa58febc8968e670e39e3d37cf8eef3cab8)
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+
+This patch fixes a critical CVE in Python 3.9.0. It can
+be removed after we purev to puthon 3.9.1.
+
+CVE: CVE-2020-27619
+
+Upstream-Status: Backport
+
+Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
+ 
+---
+ Lib/test/multibytecodec_support.py            | 22 +++++++------------
+ .../2020-10-05-17-43-46.bpo-41944.rf1dYb.rst  |  1 +
+ 2 files changed, 9 insertions(+), 14 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
+
+diff --git a/Lib/test/multibytecodec_support.py b/Lib/test/multibytecodec_support.py
+index f9884c68eb..98feec2f60 100644
+--- a/Lib/test/multibytecodec_support.py
++++ b/Lib/test/multibytecodec_support.py
+@@ -300,29 +300,23 @@ class TestBase_Mapping(unittest.TestCase):
+             self._test_mapping_file_plain()
+ 
+     def _test_mapping_file_plain(self):
+-        unichrs = lambda s: ''.join(map(chr, map(eval, s.split('+'))))
++        def unichrs(s):
++            return ''.join(chr(int(x, 16)) for x in s.split('+'))
++
+         urt_wa = {}
+ 
+         with self.open_mapping_file() as f:
+             for line in f:
+                 if not line:
+                     break
+-                data = line.split('#')[0].strip().split()
++                data = line.split('#')[0].split()
+                 if len(data) != 2:
+                     continue
+ 
+-                csetval = eval(data[0])
+-                if csetval <= 0x7F:
+-                    csetch = bytes([csetval & 0xff])
+-                elif csetval >= 0x1000000:
+-                    csetch = bytes([(csetval >> 24), ((csetval >> 16) & 0xff),
+-                                    ((csetval >> 8) & 0xff), (csetval & 0xff)])
+-                elif csetval >= 0x10000:
+-                    csetch = bytes([(csetval >> 16), ((csetval >> 8) & 0xff),
+-                                    (csetval & 0xff)])
+-                elif csetval >= 0x100:
+-                    csetch = bytes([(csetval >> 8), (csetval & 0xff)])
+-                else:
++                if data[0][:2] != '0x':
++                    self.fail(f"Invalid line: {line!r}")
++                csetch = bytes.fromhex(data[0][2:])
++                if len(csetch) == 1 and 0x80 <= csetch[0]:
+                     continue
+ 
+                 unich = unichrs(data[1])
+diff --git a/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
+new file mode 100644
+index 0000000000..4f9782f1c8
+--- /dev/null
++++ b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
+@@ -0,0 +1 @@
++Tests for CJK codecs no longer call ``eval()`` on content received via HTTP.
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3_3.9.0.bb b/meta/recipes-devtools/python/python3_3.9.0.bb
index 8fe60ea016..c31e7c8607 100644
--- a/meta/recipes-devtools/python/python3_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3_3.9.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
+           file://0001-bpo-41944-No-longer-call-eval-on-content-received-vi.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1

