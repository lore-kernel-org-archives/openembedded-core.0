Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.57])
 by mx.groups.io with SMTP id smtpd.web12.10578.1594688307877602900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 17:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RALDz7XN;
 spf=pass (domain: windriver.com, ip: 40.107.223.57, mailfrom: kexin.hao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOyIL7+uiTBrDBG5dHLyph2GEK74oyVQgBfJ1WyuHilErhLn6xnoLP6ONC5l5Mp4jpFOKffz9sI0Zs624W37Wj62u+zMUOYYTkSQY4ms86Y8V+plnrxrApFypjA3MOADdTWWbqd967EmDw2li6QagC6BKi8Nc4X78oJZoIoEzylCeappIPcEBaZrlYnzUIlpkVysvvCstkkEdX19tN03XFkugoeONDz9sgRJvqcjWDjeGaBeh28RGqq1f71bFOUU3A1xsjd0PwqJGDZj3Z55NdIoIo49ahf24iUWPdUH5SQRPsVEhZLZlkq/3EvrBiLisfQ4rsghA4hMhfX3D+BBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fXX9ml03Zmq5KLuNNU5+S3BAlA7fL/xtporEHT0Fng=;
 b=LGc4iJ/9HW4Hs5+MrCM6fvZqhwjTlYOxcYV6x/2xvsqT0QHASu8guw2BBWFc1X0+90O4vkDyHA2HnSlOlamqI41QdOWZWF3oTY/WFrZMJbXa6PcgqY2XCp3hKdJagsBB/jrl7B1cRAkASaePNpV9p4ZJl6VCmnGDVHBuj1dFnIbnKnJ+Iui3Wpe+hB16JIzL94A1ypvEJNtVgn72tA3eLTfY0amO7poYVYIbbb2IPqP3NESpes/Pscv/CHcGSoWp7AOz0AA3EPLUTrqJcGVePkTCzj0qLhSatzogpyUqfS5LSn0zgxgvvQnpPoWjy47b+AVbUyaKAyPThA4RFPyMqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fXX9ml03Zmq5KLuNNU5+S3BAlA7fL/xtporEHT0Fng=;
 b=RALDz7XNZ52hDMRKIi64w09nStlDTLaXiNFa/Ch/L/F64iPT+Ru2c3SllG9h3mJP/YijbkThLhThUVodwVDWL0w0lamiPZq1XTZw/ynfDPKR0MkDslKD20A4Qbw+LUU4mEl9UCP2Cj5frHWCZfxCSGlU5R4Y05/Pu2rkjNQpr7A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4314.namprd11.prod.outlook.com (2603:10b6:5:1de::32)
 by DM5PR11MB1740.namprd11.prod.outlook.com (2603:10b6:3:112::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Tue, 14 Jul
 2020 00:58:26 +0000
Received: from DM6PR11MB4314.namprd11.prod.outlook.com
 ([fe80::cde4:6e6a:1eea:23bd]) by DM6PR11MB4314.namprd11.prod.outlook.com
 ([fe80::cde4:6e6a:1eea:23bd%6]) with mapi id 15.20.3174.025; Tue, 14 Jul 2020
 00:58:26 +0000
From: "Kevin Hao" <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] wic/filemap: Fall back to standard copy when no way to get the block map
Date: Tue, 14 Jul 2020 08:53:23 +0800
Message-ID: <20200714005323.15819-4-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200714005323.15819-1-kexin.hao@windriver.com>
References: <20200714005323.15819-1-kexin.hao@windriver.com>
X-ClientProxiedBy: HKAPR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:203:d0::12) To DM6PR11MB4314.namprd11.prod.outlook.com
 (2603:10b6:5:1de::32)
Return-Path: kexin.hao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp6.wrs.com (60.247.85.82) by HKAPR04CA0002.apcprd04.prod.outlook.com (2603:1096:203:d0::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Tue, 14 Jul 2020 00:58:25 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d032e272-4b2c-4750-e0fc-08d8279103f6
X-MS-TrafficTypeDiagnostic: DM5PR11MB1740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1740718FFFE8C5DE22D63679E2610@DM5PR11MB1740.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZB4/UQXB/KNHOPVSbT2RdKfeqp9v2YDaGGj3vmD4QTv4hXv4m2XWc0s26j2xcIu10QIcmiDUIcXgrYHe2TEwE8hgCcam9hE+PFsr9KENmPI3b6V9Sx5pp+WdIyuZTEBV5sPA6yVbDIUkuhNWy9tsNA5xriZgG+FZZZGxs3FdPjHGd0HChKVjPacNhCW15Lc3tspaJLMTrC8CnOsZYAYzW0SZZ4sJC92thRHHh8q/Og0yLbKS6CVJkQegxeXqu38kqkqSASaDQOob8FShayY+NYM4+GTutCDIf1F4wOHze7sSXlM7AIjXSfz8Hy+WIGGLU16ekRSJjzrQ0ptVPllvJ0DFWDXJFNV8U3pMpBXrYTULit2gOcIlmt4huByEhn/krtPOabDIiMJ+HWSnV5CGnQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4314.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39850400004)(376002)(396003)(136003)(346002)(26005)(6512007)(186003)(16526019)(316002)(83380400001)(1076003)(86362001)(5660300002)(8676002)(66476007)(6916009)(66556008)(66946007)(8936002)(478600001)(2906002)(52116002)(6486002)(956004)(2616005)(6506007)(36756003)(43043002)(15583001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2bPd6GSwBQ/9Q9fFgvIAYPGKKUWYpa9DdzSwLgXPsDwOqPlZc/V9kaYpIcBj2LjfOrxGttJ9toni46jM/k9czFkw1MPZQn1XaTpTgwO5h9+VMF4ltuJOb8Q9peUxIE7rgpbFvEAGasWMcwNkYSu08nejGDhrdNyDlWmMqi4wzs7mG1FIMTAt6iX/OoIsoWxkkOrpxd/hXJcGdC0FHFhP57iOYj2Vw/tWmRoneTsjSk/UinoIgiZNPh1T93A9CHx8CAtYIsRg4yx2zUMNOH/V+TDBJrerpH1QoRuhNvntuJynY/2Yg6GE6ay9tStIcytWH5+R7kLUuDZYZNbi0xF0va9BgFjK7ZiMZPzH7FxVN21eURBXCOJc5Qx5DJJaxI3CvrGzL1bJlRfAL/86MBFAcBZkYIQc5GmmMtIuCgxSRmDVqotfzjfZq3SQk1htaWqRS9gaHrqmons0yg/Pm/odOTbFa2pxmxIckHk1XDEmMug=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d032e272-4b2c-4750-e0fc-08d8279103f6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4314.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 00:58:26.4786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZVB87HRAUKDsEKsr7N1BlmkDqkARliq/IrPVuWnEOf6Dq6mFA+C6FjU68/Zftcx9pqOdHNO7SLKM++bTTlJiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1740
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

For some filesystems, such as aufs which may be used by docker container,
don't support either the SEEK_DATA/HOLE or FIEMAP to get the block
map. So add a FileNobmap class to fall back to standard copy when there
is no way to get the block map.

[Yocto #12988]

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 scripts/lib/wic/filemap.py | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index f8c6e09d017f..4d9da281720c 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -469,6 +469,29 @@ class FilemapFiemap(_FilemapBase):
                         % (first_prev, last_prev))
         yield (first_prev, last_prev)
=20
+class FilemapNobmap(_FilemapBase):
+    """
+    This class is used when both the 'SEEK_DATA/HOLE' and FIEMAP are not
+    supported by the filesystem or kernel.
+    """
+
+    def __init__(self, image, log=3DNone):
+        """Refer the '_FilemapBase' class for the documentation."""
+
+        # Call the base class constructor first
+        _FilemapBase.__init__(self, image, log)
+        self._log.debug("FilemapNobmap: initializing")
+
+    def block_is_mapped(self, block):
+        """Refer the '_FilemapBase' class for the documentation."""
+        return True
+
+    def get_mapped_ranges(self, start, count):
+        """Refer the '_FilemapBase' class for the documentation."""
+        self._log.debug("FilemapNobmap: get_mapped_ranges(%d,  %d(%d))"
+                        % (start, count, start + count - 1))
+        yield (start, start + count -1)
+
 def filemap(image, log=3DNone):
     """
     Create and return an instance of a Filemap class - 'FilemapFiemap' or
@@ -482,7 +505,10 @@ def filemap(image, log=3DNone):
     try:
         return FilemapFiemap(image, log)
     except ErrorNotSupp:
-        return FilemapSeek(image, log)
+        try:
+            return FilemapSeek(image, log)
+        except ErrorNotSupp:
+            return FilemapNobmap(image, log)
=20
 def sparse_copy(src_fname, dst_fname, skip=3D0, seek=3D0,
                 length=3D0, api=3DNone):
--=20
2.26.2

