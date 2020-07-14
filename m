Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.66])
 by mx.groups.io with SMTP id smtpd.web11.10595.1594688305854632623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 17:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RTjEc/Ib;
 spf=pass (domain: windriver.com, ip: 40.107.220.66, mailfrom: kexin.hao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZhYi+kmMAMGFHaVZi9G3DXPyFlDOfEUSDCsryZ5MoOzqil0lxE/HV9bB3+UQxKy9F1YPHh4f0Mn7m/IfFOaDlqJ+TS0IdgwDxO81nLDYQYXnelPoLrbilhOJq/luI+z5QI9nZqHL9ZZ3v2mMZW+TwqClxEHeG0EbQkX9EEcaLZevQsOSN6Zb51D231fE2plh7uYhSaRBH8AfshjVDC/kD+vyXGKD+KM6BKCbd6CAt3lAkIf4WZxUtNaApXX6s9Gn/OFZ3mKMVZpRGvNO1Sc04BHN0VTk35m6BmyyV4HilYyWEaQ3LeOlCSCqomwX7NpLJrDqEFyZIgdm/8+YEePEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXIHC3zxQjEexSNRlDPLgL0QujwLWtP7j2j3b8g7Q6Q=;
 b=hfLBFddN6mkpJkKbzy+wtjwBybSm4E/kYyvtZasBe01nOZrcm7iv19VvnYq2lQV3ZZaAoJsjlen4OQoTzMQhhYuUkgebPWvQMwkmeVUra3uiJVzIXCIgr/Il8DuFynEMx+CkfN4D29U35859wqv5ERf9tY64t8LfnhtGaOFGwHqxv6mGJc4zk3tv98Ys+tCadKXqQ6JNree6LyVY1Q3HgqIj5ihAylBdy6OUtt0XWxkk7hXSlfMUvM19mSgzub/hbSI2Su4r3Zh8VkT0RQWPPxhNhcVoS3jltERwrkFeaLteor+N8thaM9BHXxziT1wqTsflgC16eguC283uOyxgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXIHC3zxQjEexSNRlDPLgL0QujwLWtP7j2j3b8g7Q6Q=;
 b=RTjEc/IbQMCGtK7RHyHNe7qzobNI3i1WkGdr9csfPBYLZHNkIzM3zO9p1/PaqsfSHVuzP9T9TD6VTrgHhpnMGWX2t6/s35DiK/A8XMHC7xqmnDJmDQ1jWgWTcgM2XxHNrFSqg1F+bBpNWwdwJKdWJh2Q+5uYiPDJ2Z2I7ymOxxo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4314.namprd11.prod.outlook.com (2603:10b6:5:1de::32)
 by DM6PR11MB2555.namprd11.prod.outlook.com (2603:10b6:5:c5::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Tue, 14 Jul
 2020 00:58:25 +0000
Received: from DM6PR11MB4314.namprd11.prod.outlook.com
 ([fe80::cde4:6e6a:1eea:23bd]) by DM6PR11MB4314.namprd11.prod.outlook.com
 ([fe80::cde4:6e6a:1eea:23bd%6]) with mapi id 15.20.3174.025; Tue, 14 Jul 2020
 00:58:25 +0000
From: "Kevin Hao" <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] wic/filemap: Drop the unused get_unmapped_ranges()
Date: Tue, 14 Jul 2020 08:53:22 +0800
Message-ID: <20200714005323.15819-3-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200714005323.15819-1-kexin.hao@windriver.com>
References: <20200714005323.15819-1-kexin.hao@windriver.com>
X-ClientProxiedBy: HKAPR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:203:d0::12) To DM6PR11MB4314.namprd11.prod.outlook.com
 (2603:10b6:5:1de::32)
Return-Path: kexin.hao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp6.wrs.com (60.247.85.82) by HKAPR04CA0002.apcprd04.prod.outlook.com (2603:1096:203:d0::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Tue, 14 Jul 2020 00:58:23 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46a95c4b-3fa0-493f-339f-08d827910301
X-MS-TrafficTypeDiagnostic: DM6PR11MB2555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2555316AF612CFF440856616E2610@DM6PR11MB2555.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7K9lOCDvlaUrn/evdQCLRl/G80uDkAEA0846QRNc8MhNPO+MEUiIpDewxGLpf+DFvFQcPjP+Dsf7PkUo5xjV76RFDnN2u74LgFQwzmFw7VY+KFuFvZ5eYYLzx95RUDPEMo0eDe6LZq+hrDopDN4GlOpbsJsfsJVD1082P9np1pRTv+zY5v8N/u1wsrdEFpypMal0iGMsCaHZSlwXCVA0PfSMCRDX59uWD61PJzF0tatKlDTcAizqhXeamdjJTLQBdIiAAvql415TkyLlaW49Z4pbj7UnrdvrIOu1OC4iRvmNb6PHQV1mIEKMm4VtJNMzszyC9AJbJwkDjVwnwHWwng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4314.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(366004)(346002)(136003)(396003)(1076003)(6512007)(26005)(186003)(16526019)(316002)(8936002)(86362001)(5660300002)(8676002)(83380400001)(6916009)(66556008)(66476007)(66946007)(478600001)(36756003)(6486002)(52116002)(956004)(2616005)(2906002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	do6RMXvuM0V6oG/GaxHEtrzQd4Df5rW/0Y46B1LrhexmHGfWZnKz0G9z1Fj/fQqePsZRDuudivGV6e45gidTXDsU2+XX/0Sd57ONZekAZF5rrJ8AjeqqC4G0u6qclTDyggaxOq03wThikWEjx019I3BEjUuwSyRjAPU669Lb+VqWmF7ucIWzOqh5uMvgrCpThUhVwUMA3KMX3yrPN4gb2odnq2hJJn7WXrBXN1Lg+7EMJ1mqQuZcFtseOS/zpm5ftia0XGWLbqmkcoHTYQldh83Ybvb+EWtkx6DJJQhnHvWNe/AYqh5+Om/ne5uKvcDIsjelg/6opfCDwc2/DDM9L2t5jnYM3w2B6zfiBueqgqmsXzieAmzUfHfJzVYLyS9MU1onw2IvqghsQxZWAEqGAFqlPHign8QQM67zDDmclrktN3TOt1FOe9+b+qy5j/hLmSD0DoRhynHf6SQ0kqfBZx/c4qKlPru+9M59FeBS1i0=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a95c4b-3fa0-493f-339f-08d827910301
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4314.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 00:58:24.8725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GwYIIO3PC4DIVKP7b45IDrNlp19uX218yATLWEyRCEcofY8UVOpEtw3jKj13PGr8a5fqKUOCXwEqo10KT258tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2555
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This method is not used by any code, so drop it.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 scripts/lib/wic/filemap.py | 38 ++------------------------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 8cfed5afa80d..f8c6e09d017f 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -155,15 +155,6 @@ class _FilemapBase(object):
=20
         raise Error("the method is not implemented")
=20
-    def get_unmapped_ranges(self, start, count): # pylint: disable=3DW0613=
,R0201
-        """
-        This method has has to be implemented by child classes. Just like
-        'get_mapped_ranges()', but yields unmapped block ranges instead
-        (holes).
-        """
-
-        raise Error("the method is not implemented")
-
=20
 # The 'SEEK_HOLE' and 'SEEK_DATA' options of the file seek system call
 _SEEK_DATA =3D 3
@@ -258,9 +249,8 @@ class FilemapSeek(_FilemapBase):
=20
     def _get_ranges(self, start, count, whence1, whence2):
         """
-        This function implements 'get_mapped_ranges()' and
-        'get_unmapped_ranges()' depending on what is passed in the 'whence=
1'
-        and 'whence2' arguments.
+        This function implements 'get_mapped_ranges()' depending
+        on what is passed in the 'whence1' and 'whence2' arguments.
         """
=20
         assert whence1 !=3D whence2
@@ -290,12 +280,6 @@ class FilemapSeek(_FilemapBase):
                         % (start, count, start + count - 1))
         return self._get_ranges(start, count, _SEEK_DATA, _SEEK_HOLE)
=20
-    def get_unmapped_ranges(self, start, count):
-        """Refer the '_FilemapBase' class for the documentation."""
-        self._log.debug("FilemapSeek: get_unmapped_ranges(%d,  %d(%d))"
-                        % (start, count, start + count - 1))
-        return self._get_ranges(start, count, _SEEK_HOLE, _SEEK_DATA)
-
=20
 # Below goes the FIEMAP ioctl implementation, which is not very readable
 # because it deals with the rather complex FIEMAP ioctl. To understand the
@@ -485,24 +469,6 @@ class FilemapFiemap(_FilemapBase):
                         % (first_prev, last_prev))
         yield (first_prev, last_prev)
=20
-    def get_unmapped_ranges(self, start, count):
-        """Refer the '_FilemapBase' class for the documentation."""
-        self._log.debug("FilemapFiemap: get_unmapped_ranges(%d,  %d(%d))"
-                        % (start, count, start + count - 1))
-        hole_first =3D start
-        for first, last in self._do_get_mapped_ranges(start, count):
-            if first > hole_first:
-                self._log.debug("FilemapFiemap: yielding range (%d, %d)"
-                                % (hole_first, first - 1))
-                yield (hole_first, first - 1)
-
-            hole_first =3D last + 1
-
-        if hole_first < start + count:
-            self._log.debug("FilemapFiemap: yielding range (%d, %d)"
-                            % (hole_first, start + count - 1))
-            yield (hole_first, start + count - 1)
-
 def filemap(image, log=3DNone):
     """
     Create and return an instance of a Filemap class - 'FilemapFiemap' or
--=20
2.26.2

