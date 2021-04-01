Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.47])
 by mx.groups.io with SMTP id smtpd.web12.7695.1617313209843449659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 14:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DGb73X14;
 spf=pass (domain: windriver.com, ip: 40.107.223.47, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+VONsZ+GtxO45cDJEpzh21BP4vMCeNVRcTudD2ih+p48aBB4AmvQsZbKY4J9XLPoOEFOuhpdyVeEKO5kF0bHgsmOKVgMRi+W+6hfutT96kKfV32st1PLookXN2Dm3EDuyut6yBO6ZdUBRgQ2IkV4fAIiPrtEpXjdnNpEliD4+1SJXacudt5bHXKzZj8ro8goUYYKMyR14ci+oyAyiXActxDfBTgOPtBe++bRtoISZvH7Cy8yjvR/OmZEjhimX7TPYxsjyUMF9L2P2JLy7+8CdAoSK5A44oGKaGECzd4JjcGUdpXA3IFPmaGKPiYwkiqDwk5A8x42QggPvwHe2bmuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ierxwwKWU84b1VjbtFebBVKVH2D/Jm+Gdg4Q+kttdMc=;
 b=F9/Jtaroorl38/qgDkjBvjgFTFfXeohxozvF2rAqsfljyXtfRaZMG3eQuin5tnfEOlAdm6zTXIICbt5f0fgD/jVHEBh8SPWgrMMO6aVxXFhHlFLw4KDX06l8YkVnQMOhXHeJ2+n+n7cvVaHOJ9z66F9gbf7DI9vHyzQ+VJllvfW7fmNmOJVO2rfO5C0bNBKw1xdCnmnBIuuEQmMjpoFZwS9L7sXLmLutFty6rfUdFI7RmEcznNT3EmGAGINOxFlsq0UPz4bsLjpZbVshCca8qvFUJ2i0Kkl5awvCXdqQpeGRZnRL/n+BxKWrB6h/vLlmkLjFeUspNsmQYAAYbtmG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ierxwwKWU84b1VjbtFebBVKVH2D/Jm+Gdg4Q+kttdMc=;
 b=DGb73X14KQdanXXJCNXNoz0RydxZCq3qOIQ3eQYe+3G03mhzeGgQRXO3irWnP0LXwRHroNb4zBKtiQI08BIJnlqsT3673QzwA8nDvlzSO4Fr6uJoH3cB1MBK/qAd5DtN/4ySeht1BHAZapna4bOUlyn2B4I+vZJ4hIuIlyECT3U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2655.namprd11.prod.outlook.com (2603:10b6:805:62::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 1 Apr
 2021 21:40:06 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 21:40:06 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: Skip failing ptests due to load variability
Date: Thu,  1 Apr 2021 14:39:27 -0700
Message-Id: <20210401213927.134980-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: SJ0PR13CA0213.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::8) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR13CA0213.namprd13.prod.outlook.com (2603:10b6:a03:2c1::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.9 via Frontend Transport; Thu, 1 Apr 2021 21:40:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3e3d363-429e-4130-b14b-08d8f556b708
X-MS-TrafficTypeDiagnostic: SN6PR11MB2655:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB26558F27C6CD84692ABC7253807B9@SN6PR11MB2655.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nzSnqdb5a2QKrl+Sy17FS84KZwIOcOyl6+khxVjreoQ9TL8+2Ptu+jqSJFZBZ5w13qZagYTEWC7ZCmh6xdsIerlVdEUAG3IsBXY9qnpeYznsL8ichkf20IgpBZ8VQC83HFGADmz/EKE/IPtcKiX/IxwbqZGdSsIYTP+67G1H0kzDg+uD47q5qgZFAFDinkAdpkdpKXPhH4gLIm1CXsA7EMVJy6DTZ5i4aAS3GnFIiEUMJ6v6X1+XXHEG2v7LMQddAPHZoP+OI3ele3BbsfEpXFJdzjp4lJ0xZvCP1aXJ3S/nrhSFd+EA1wv8A5tav1OTF1JDeKv+gJrH7TTF6o+C1GewoWHt9b3we8rpEBKuz11dp+KH00Fe5wCKQmlHYHBEIaFjCW6nkRhgXd2JtaVDnG296kuMlgFdSdnU4hPgchjGUOVeo1crWKRF3hCkTmgiVcRA5218wN7/pVUE08VDXVRUfb5EmPguXflBr56l1oB3Jq3IMhgcRAtfcPPK7/fnUdTUe2CdbNO/B13T8VH7t7GSgDu0xa5732Yr8i+ho0SRO9eZ4OiEK8VXiPkMJ0wYoNXqIJUZnPMA0DM3W6aljkvmD1oGxkVU5H+eLsVF+U+sDFXsl42rahTr/tJeyUhV+sk3qJKdTylgcBPQtTha7F995xSrc8s+jbLwrRobAJVnT+VhPvFPeCNAQAFgpEm526LG6mKkkbM2yIwvdR5aq0hNbuVHAhUDI69rdx2DoH0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(366004)(396003)(346002)(5660300002)(6506007)(1076003)(36756003)(6512007)(66946007)(86362001)(316002)(66556008)(66476007)(83380400001)(8936002)(2906002)(478600001)(186003)(16526019)(52116002)(6486002)(8676002)(38100700001)(6666004)(2616005)(956004)(6916009)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/I31eEGZ+VWhqSQCvSwUrY/jBboLHA5eS89RGNW9i3TQqhVdJtL1ta7KZxju?=
 =?us-ascii?Q?LXp2FGAUhnIqciv4wFiJPsj0U2w2jB0YJQ/peTdJtLEHmALWz/YABLCMvR0v?=
 =?us-ascii?Q?+wmNEu437f6zNxINKfmeKY43EK/cku90MGjN/9/lnZnn5+DIa5O2YB+zbiLh?=
 =?us-ascii?Q?Tzq1oYKfkloN7Zvx0CdQLTYv+Nob8CmRFEOwWMXaZsIpb4FAnNV4jJlyFPZl?=
 =?us-ascii?Q?3dYEP5nG3xJZOnEmrh8ODs9Q9xVyfG/ntdXdreDX9MHneyDkUeviS/L8JkoK?=
 =?us-ascii?Q?WhweBxbceQEPyYO2y78TpjYbT5VlLlm3A7zSc90h0/aqkOk3t0Ze1OHvc7xe?=
 =?us-ascii?Q?2tsQrmUBSKyMJy19gPjYrwYsxBTSfSnOj6NBnViJ682hsXZQgjsZB9iCKgV3?=
 =?us-ascii?Q?t9mQZq4vdIxckQl4EUJK17lZI9xfNO+CpJUzTphQOuTF+Hj//QPkowjgSWai?=
 =?us-ascii?Q?BG9GJFRxWCPgPuEZw7LAzEFppL1YDDSxqPmIY/8aQ67qq9FWXRcBxamY11Nb?=
 =?us-ascii?Q?QDc+eDXrbaUJ2bw+/qVYMA3LeXpY+BfR2mEI89W8cKy5cBH2HZm677jYAh5i?=
 =?us-ascii?Q?u2gKbA2TQ4+kUEHqmmmSS67mV63DqWLX+kC50RGR9X6lhcHkaFpmpBHTmSVx?=
 =?us-ascii?Q?5gsrF3ECgoLj36N0e4pBAhBgfKmar6yMbfnnNgEqo1wd3trIb8c4Bdq/OQ7A?=
 =?us-ascii?Q?oITkfcUKCCCOzhkjmgZE/fXfSra7EkFIELubR5qms2ol8qejtjobvJHmtljT?=
 =?us-ascii?Q?gBcQRxF1qfTumt0Q2htUAQIKRf8cQsbmShdtQqqQeBxhqTgrqHvWhRk1hfoE?=
 =?us-ascii?Q?LTsUZKDvMUAuP86ZCP7x1LhIX0JJaYfxBtUsTufeN3Qx7vNLxIKeZ7OQyQ/V?=
 =?us-ascii?Q?NZfwPS9uTVPePAQhIwPl44zHBvjoxrfaymuVe9dS9u6LVTSZi91v3/gtRoK4?=
 =?us-ascii?Q?Ck9opTdwcj/o9yJGB3sTIct1j3amVL/RPD3/E2vn5vPWw8PXyZNLLuTSwpO7?=
 =?us-ascii?Q?pcjNkeB/S0FLt6+nRRIr1aolmCI7AG1lOOB/llSjXLFpPRMzZoBKXJKCov0L?=
 =?us-ascii?Q?By5wWqUAxNiok0r6hLOiGncI+20AJPfD38UYrXrT6XuUi63m4BnbaArwyANg?=
 =?us-ascii?Q?r3CchTUc/Yo1UrEh/gzOoUpgMWSLsTF+xSAVzR2TPXpVCVrsTJU70FUzElN/?=
 =?us-ascii?Q?pTzM7Z1+5Pridx4mU0XbRFVaW7ml1nQwAk/0T3mI9HWpfOHzcsACEm/pf/SN?=
 =?us-ascii?Q?6Y2yM3sA35Xtu7/hc7bJImI7fSbhJpEWn1euoxJPyi0A4+4EJJTLIygSWinN?=
 =?us-ascii?Q?NVcsYrWjk/X1jUND/o0OdjUP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e3d363-429e-4130-b14b-08d8f556b708
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 21:40:06.0544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZXrFoajfJtgsWuxkdnXo+ErUx4+TfEv+zV40Rh4/FgsQWJz9kwEW2H20X3ybB8XFcWwMy6r6UDIbaSxhK2Jow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2655
Content-Type: text/plain

Skip tests until load issue is fixed,
most commonly seen on the arm64 builder.

[YOCTO #14296]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...sts-due-to-load-variability-on-YP-AB.patch | 53 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.9.2.bb |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
new file mode 100644
index 0000000000..a49d603d47
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -0,0 +1,53 @@
+From 0b25b66d4f54bd74615c9ff10f3fae8f0d1c548d Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Thu, 1 Apr 2021 13:08:37 -0700
+Subject: [PATCH] Skip failing tests due to load variability on YP AB
+
+
+Skip these tests until AB-INT is solved.
+
+[YOCTO #14296]
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ Lib/test/_test_multiprocessing.py | 2 ++
+ Lib/test/test_time.py             | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
+index fd3b430..cda29f6 100644
+--- a/Lib/test/_test_multiprocessing.py
++++ b/Lib/test/_test_multiprocessing.py
+@@ -568,6 +568,7 @@ def test_close(self):
+ 
+         close_queue(q)
+ 
++    @unittest.skip('timing related test, dependent on load')
+     def test_many_processes(self):
+         if self.TYPE == 'threads':
+             self.skipTest('test not appropriate for {}'.format(self.TYPE))
+@@ -4715,6 +4716,7 @@ def signal_and_sleep(cls, sem, period):
+         sem.release()
+         time.sleep(period)
+ 
++    @unittest.skip('timing related test, dependent on load')
+     def test_wait_integer(self):
+         from multiprocessing.connection import wait
+ 
+diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
+index 3258298..adcf407 100644
+--- a/Lib/test/test_time.py
++++ b/Lib/test/test_time.py
+@@ -474,6 +474,7 @@ def test_monotonic(self):
+     def test_perf_counter(self):
+         time.perf_counter()
+ 
++    @unittest.skip('timing related test, dependent on load')
+     def test_process_time(self):
+         # process_time() should not include time spend during a sleep
+         start = time.process_time()
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3_3.9.2.bb b/meta/recipes-devtools/python/python3_3.9.2.bb
index c5e47eec4f..fd1172335a 100644
--- a/meta/recipes-devtools/python/python3_3.9.2.bb
+++ b/meta/recipes-devtools/python/python3_3.9.2.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
+           file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1

