Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.1574.1606875723955470272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 18:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FqTK8tH5;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iICLYYxhgEIn1Zcjix/x8NPu//KpLVVJoMvu5YynEli3f8YPtIPIMsM0hC0eQ02BejzUGA/tOsZPRM4pO7WRj73LhoyFv60EdwfgDAqWq+weBuvze+h77kElpM6oF7R2V7HLNWsATdRnquMRJy/7q/8rIbXi5FuivfYm4q/uDYMh8JJHYHnd2KXwfZ15JRfHTEuEpaXFQR8ez9Yy/TEj5Zhks2HYiiH3RtZMcDu756/6dnmh7Og/pdGEltaCwrjoC991wSy3HYcjmA9d/z7qJC1x7ztJ4COMkSeEea6CcMucU6hnYvI/Vcb7q0rXYec37HqHabvOiloIoA0ieC4tiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+KY8NaUe290sQ5DVxN3I7MRauXeYS/X0w0mY8YfrDs=;
 b=FC8F71PH4N4Jnxb3CQGLhpqKpraGi1h/cAphU0d88yE5hHO1P43mRDfJhaUq7rbEmzFi2CIJbEH2xooXycGwzwkTGa1OIeAbH1GAtPRMBDfohmEUCtS6vBBdlEuMVBaesb0VN3c9gcVHDd6laa60yyx2/QP45CxN5ti32XKwlj1gfAgeGnaaNTb1yEUmiDbcfVX8IERJcUkYsgcC1oq1Sw0KGJaiz64kylDrjrBNbawJIhaXXcxMhLsGPPZ66X5w3gVwVAG7iDvmJwv2u4vXZtr6ExTKnktg+prkZz0zb/FuXPlqeiO/uakrZLtjlCQHjSaC3dk7qmNulC0UQq7pFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+KY8NaUe290sQ5DVxN3I7MRauXeYS/X0w0mY8YfrDs=;
 b=FqTK8tH5G1YE1deE0jemANlGMNpBp4dtq6izKqJvEoLn46owhUbf59/UBVzlLo5wvtyXccRsfYNj9TtXNRTLJcXcrwKExP0fhpRx7WLibSGNQEK+L8+w7ROW+bILBvkDkn2L9gLcrh8qrnEjnKLYHIpumxgwyywI+b5/11cjM78=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB2573.namprd11.prod.outlook.com (2603:10b6:805:53::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 02:22:03 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4%6]) with mapi id 15.20.3611.032; Wed, 2 Dec 2020
 02:22:03 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/2] systemd-systemctl-native: capable to call without argument
Date: Wed,  2 Dec 2020 10:21:44 +0800
Message-Id: <20201202022145.31476-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202022145.31476-1-kai.kang@windriver.com>
References: <20201202022145.31476-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0184.apcprd02.prod.outlook.com
 (2603:1096:201:21::20) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0184.apcprd02.prod.outlook.com (2603:1096:201:21::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 02:22:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a157ca13-cfee-4da6-dd11-08d896690e32
X-MS-TrafficTypeDiagnostic: SN6PR11MB2573:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2573F3390B798FA66A48DB7F95F30@SN6PR11MB2573.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a9zK/sbcqFBPOAiXw/PjQTVlafJELEorxZlo2K7beDYqS4uLGO7aPQoNF2yhWV0ShlqTNEq+MSH48UUmNL2pbGZGSgVqkSKy5YjxWkt5aUduS0z1lPZs7xPo7/wf+6iP+TG5NGVFAFI8e15S5GiR0ZLW/Ft96dsxA+vkgVOMjzb7OWleY9N+NTbD09ZmQUk65dcC37mz+4sbFuXI583IFKtWUdPlE6NuM0bFyedkW9VNVu6XsjX8mzzXpj+LDJqzQUw7/IjQOck1CGtYU13bHuByPQ6auKcEdQXpWfpP1Kc6k+Qx1CSmal1qQKEsSHzQzeeCSrYiGwzmiVvqvqyZlg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39850400004)(376002)(396003)(6486002)(8676002)(2906002)(316002)(6666004)(8936002)(52116002)(1076003)(5660300002)(6506007)(6916009)(83380400001)(6512007)(9686003)(478600001)(956004)(86362001)(2616005)(66946007)(66556008)(66476007)(36756003)(16526019)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?TbJE0ixxKuUxb37OOpqcGB3uoJhfSb0ikYCrQ3THgEo3ObvyeAsrqktzVv3X?=
 =?us-ascii?Q?UvY5aMh4mygb1N2XcAkLr2OFGbx7IaYO/5XDQjeVDBE7EMsEU6fdNilHUxp6?=
 =?us-ascii?Q?TDRXGMCzkCdiJbW+FCeVXV3zyu4B0/68h2N97A0APAiQKsbVv9NouuFXkUgv?=
 =?us-ascii?Q?Z0g5VvdRMdaV1nNOZBnyxbXha7ip4RtjpqNGqb9IAZbt/X3s9/icmoypZzCj?=
 =?us-ascii?Q?4Sw1oMa5+f7LEwHGMLW6Mg6z4J70/0IG966ehCldcsvWHVeTB04HMCyyUFbZ?=
 =?us-ascii?Q?SAI7CQmj3e9+js4pCNnq9g1s9ewXs/GqTo4IgU9cO1VjZI9/3E2GP7sVEvTA?=
 =?us-ascii?Q?5KMzOScw7fcAwrbvE2DtRcnEABI64eKU/yFsYiypnbFJgCoSVJaH/aOBkG2Z?=
 =?us-ascii?Q?f87dVM95UO/bU+ROY9CzgWsC8a/Es4lv62pBu0JmPrlcobfrkmZmMSW/bSZi?=
 =?us-ascii?Q?MPvzkpwLelqr9K2mx2ZLe9elT4zTvttzzbXUdq1po/zqNyHGAXO/PTzxDl5B?=
 =?us-ascii?Q?8azlTYyGQn5MBaZuWKCvpBqfKpAsDv0yAyRZRHnxBU3cy5zc74HpkpZH2Ffi?=
 =?us-ascii?Q?7g3X2yz46maODEejImXyoCLbvYQ1uSaNzYbx+jxb9tphZlb9CAgFs8wmx2AI?=
 =?us-ascii?Q?D+mvsNzixuUXlYzl7J+rCi247xfgBmpKbzl1DTn+KIRCGYvhtKtBL7GSOJfX?=
 =?us-ascii?Q?UHFx05/v6OxsiL8qPNiPCg5DbRSabeMTe2PsWhfNSRQfipnhFT2+FjoJ3kbE?=
 =?us-ascii?Q?XmcUGalyyohs3MyhC3SOjeqaJ7VOabNZ1XdlXVBhQYnOFJ3WGehd38W8+QBj?=
 =?us-ascii?Q?0wrrJZVpIh/kDXFlEBbdWjbpqBkNBHrMSzWukGbU1U4aB+Kn3f7fMldrt+5y?=
 =?us-ascii?Q?O9RkASoLfTSI/y2VwpxNpfKU+X1diMtzEgO5NIsO6O9RBflxK7TiBCB2mfpI?=
 =?us-ascii?Q?I4sH69T7SljD4T/q64PWiyIC5iNIEpPeLea9GKRhpqQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a157ca13-cfee-4da6-dd11-08d896690e32
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 02:22:02.9670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRgaAUR7GDgXIK2ls0X3OjkZmFpskvw7qd1g2GHWBY5kWi7A9Wg7vc2l/7mV7jFpCyDyZAXGmYXkxJJUMsusYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2573
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

In systemd.bbclass, it will replace criterion command 'type systemctl'
with 'systemctl' without any argument to judge whether command systemctl
is available. The change is to fix install/remove package error in
container when command systemctl exists but not callable.

Make native systemctl wrapper prints help mesages if called without any
argument to follow the update.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 990de1ab39..de733e255b 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -282,7 +282,7 @@ def main():
         sys.exit("Python 3.4 or greater is required")
 
     parser = argparse.ArgumentParser()
-    parser.add_argument('command', nargs=1, choices=['enable', 'mask',
+    parser.add_argument('command', nargs='?', choices=['enable', 'mask',
                                                      'preset-all'])
     parser.add_argument('service', nargs=argparse.REMAINDER)
     parser.add_argument('--root')
@@ -300,7 +300,11 @@ def main():
         locations.append(BASE_LIBDIR / "systemd")
     locations.append(LIBDIR / "systemd")
 
-    command = args.command[0]
+    command = args.command
+    if not command:
+        parser.print_help()
+        return 0
+
     if command == "mask":
         for service in args.service:
             SystemdUnit(root, service).mask()
-- 
2.17.1

