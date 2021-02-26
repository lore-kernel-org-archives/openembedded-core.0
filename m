Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.62])
 by mx.groups.io with SMTP id smtpd.web12.3872.1614305693504286028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 18:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IIpJLKwn;
 spf=pass (domain: windriver.com, ip: 40.107.93.62, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0u/2jcgCoFdJWP6fIMiHCMz4zaT3mHnDbLsNMgi4vFE3R5fsMhk3Y8qRG23GR9EY4gSkA6Dsgj8zN/4IbzBxET+etV/Ot87oFahsTsbY1I6bWy1z8n/ew5YjMQcXn4c9JDxywjLJkSwiIktLHISXvsFxpUgNPzaJ7fyuZ0WHxKggZAPS2cydA+9Qc/H92F4CY6U/yKjitpnwlLkRUftgb04I+ffWzJg8Pz1iEkAaqLLpmM/AuKbQAn0f22Do5/nE3tYG3ufjje1rYXjx2la6D4L0cN9qsO2ygxU8VNHpjNcBqT9cYLboNUfT+GiyzyId1pmvDkoVUvLnUjoPRVsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MpDgeD+N7Gz/4Yvouf78LMXf0v4Vm4bW5wmva5aTzc=;
 b=c+amcvtGo+TFv5jaOPMB/+av3naJswIFn2nz0+amGssxJa6E4h/ICFYwi1kMgCmfSQq5t8MW/bVW0c5f2W4MdsvF1zq8YvYHCUd+idc42gvQHdtjd876YLp8O0fW4HFZHKfmPYYdLnS7b3zyyWhqqrUHINT5RH3VacVaFBA/i3s0sLW8hYuXjLx6lNBzospQyjXgXyY6mOFpfY43lPhd47tkm+kQwA9dR/YXpsuqL9oRH+eOOziisQPRQUfk4/vXt2Hlky82RXg8CjpkGv3QXRKCJ39ylzN0eSffbYou1aqM1acjwlESLCeI8loCSSrxgIRxlKP/yIZfFBOSQdD2zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MpDgeD+N7Gz/4Yvouf78LMXf0v4Vm4bW5wmva5aTzc=;
 b=IIpJLKwn3HzPHXPxnTjnjTHP7a/cHmpiw+Vnsj7LDlMpOLV6Ydm5lvemVnJXP1QjlCaHge13jzimFdntBflHf+MY+XOvyIW4uEgkIGi7tr/78X48/3d8ovvNzW6QRp0CuFgr+eSlpz2dXwelmIW8LsJeRPj1ZJ7FsUD6wqSBnlI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4543.namprd11.prod.outlook.com (2603:10b6:806:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 02:14:51 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%9]) with mapi id 15.20.3890.020; Fri, 26 Feb 2021
 02:14:51 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] valgrind: Increase timeout duration 30 -> 90 s
Date: Thu, 25 Feb 2021 21:14:37 -0500
Message-ID: <20210226021437.4623-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BL1PR13CA0453.namprd13.prod.outlook.com
 (2603:10b6:208:2c4::8) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BL1PR13CA0453.namprd13.prod.outlook.com (2603:10b6:208:2c4::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Fri, 26 Feb 2021 02:14:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eea9ab0f-a898-4689-d679-08d8d9fc4c97
X-MS-TrafficTypeDiagnostic: SA0PR11MB4543:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB45430AD8EEA924DA226F9973809D9@SA0PR11MB4543.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E9lhTDiQMi0AvjpTlvrnQytHrS3TG/8Ig46s4wiVjhgMsKw2uwucBvNxofZPwSZQyGQkdw0cmvOL/svChwBNT3KXNGENte5/bN/9rZa5LKXWdojdw/V6PSUQxrmjBwe+30Xo88ZyGBmEsmrRYBeh0XcwPc42HXhJT5lJyDjb5Vovv198JMFBod0vhbhCo5Zn9UtpRpO+LLcOs5WGIBiTRgH8BwOOOuIMO6W0usjqSfD27XZIZ4w+CSHWDXWTct8Lm0csuQFPIa6l9Yxxwv7tHNhankNPEO8KYIEUKnD/FUo9r3mQP0Uy+3NgbR2j5EQypHMwhe4AhyEiJSKiuxiGFeKftw/fcvovSPnipVMoGU70QOTqXOROzRpKHVLt/Pr4tkvMTSwxVi35rd9CsakOf/qANzT0vF122KF4OxJEkkY+sLEQjsg7Fxa1KP5uXm3oMMT8wtL8vc8+P8xMzfRg+WhIcwEbNqzMuoYY/40hQ3Z1+ZQJVU+rmjSp8+7o3Ed9huQhM5NWE1EsTy2XjaqJGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(376002)(396003)(136003)(86362001)(316002)(956004)(26005)(2616005)(52116002)(66556008)(6486002)(6512007)(8936002)(66476007)(66946007)(16526019)(2906002)(83380400001)(186003)(6666004)(6916009)(1076003)(36756003)(6506007)(5660300002)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?cr7B5JN/S8zl2LqfC8K8Hp3TV7/n/Y4vknlFgjo3n9ka/e4jp65SBLtW1lKE?=
 =?us-ascii?Q?h2bxAFBnu/X4GK6lCBA8RKNJnnrrzmuzj3ml4crzcyRkc2b9q750ly+REPFZ?=
 =?us-ascii?Q?X4bPoco5YhYSdRwXf2LLrKssZl1xhI2fYTIfY1BLevzOYufPLjTSvZr24UH4?=
 =?us-ascii?Q?l4cBbC26hyjZeOHesYnYHzzW8dUHJpmbzF9Tjh4Z1R5lop7M1mTBh9nbaHo0?=
 =?us-ascii?Q?lA5KZ9/1Oif6bfEl6sfUESg3VBGVisdEY7XhK6opePQ1r2ap822alubNZAYD?=
 =?us-ascii?Q?WUtrUBKYmrjWnlnJzsXjtJTP2GFP7Cle7/v+2T9kEt2wQC1B5JEPyzW4W5kP?=
 =?us-ascii?Q?lSG8GqdlscPH6xsZtY53Lfmv2E0QAsrXUfrgCSiCwCX6pqXSuFoB++pfF5dT?=
 =?us-ascii?Q?d4DI1KcbGwMcNO8xR8Cne2ANAzquE/KWWEycTBjpjo1/KtQCG6Jb+2rK0f0n?=
 =?us-ascii?Q?KPZRLMel4SZAQIafSEDNX1syh/Bqp7dzyCiuMx2CHrDKfl5ChoGz+2nGAsrA?=
 =?us-ascii?Q?fkXZIsdZGUXVdB0nHKEYDswLYsZ/eUlk5qWyk7aVl2xA/dgJf91jqYZyySAz?=
 =?us-ascii?Q?2WlJgjC1iLRXQ/U3ZgkWsom/EmxfbEHqAgn3sM1SgF/cBAjXeWGrfNGDJu0L?=
 =?us-ascii?Q?yzO37Depc/jePWmTbkSX8VjaSp+/VkMHTOLaaNEjIPlBkhonOEv3T+6qN/6N?=
 =?us-ascii?Q?CL0ncQfbErnuXoc2+7p9MNrkd7cIvfP8UhqLLL4d6amnWNCEDMSa2klWwU4/?=
 =?us-ascii?Q?Z09VmY3IM/6hddzr0Ez/KpG/UgRQDdY/y8P1U7ybzYMNr8QnPA2Rub869IZX?=
 =?us-ascii?Q?VU1+mfV+V5u3qHUPoadD8BS9RViB9NSBAwquAOvjmDXMs46FHosKyC20no76?=
 =?us-ascii?Q?l1WCi5mSoZzaL6Lthq5Y+SBsih1Br9OqLOvdKUWYnvxBpa0IViuHlW91F5Vc?=
 =?us-ascii?Q?G/IPzLSIg7Mc7YoGfIzvHMoZmhK5mDDzW3BTwBdBhzkbciPXc/hFuU62xTkt?=
 =?us-ascii?Q?bDF4MjnOTGzRdVeUOkR2FyMYa/X0qDz2oYXWDOxAgZZqmd7bVik3c8qzzO/e?=
 =?us-ascii?Q?bCX95czgYIlvPhl626kh8wp2tSy+qRRrj//XE+LF6vP+eVT15r0XobVV08ZE?=
 =?us-ascii?Q?c3XhrbSz7z/z4CDtn9jv+deGhPtPwLivsvpF/Xff8IM4hz5c70y+fqUx4SWS?=
 =?us-ascii?Q?kLzWvPvJ6nSP98HIqzValIMp6MYs9Ldvf/mZstcg8EgSgkqh5jpDgDVZkuUM?=
 =?us-ascii?Q?xmaoxQDNAGFsFIWfBFO6DlHid/FNh+n4GCDXdqJfhnle/LJoxkwbK7BFJFBg?=
 =?us-ascii?Q?aX9S52Dsvi0xIhXgPWJuXAuE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea9ab0f-a898-4689-d679-08d8d9fc4c97
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 02:14:51.6096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uDm9SSYQ+NokMZW7O1/2rw7h3RzsVyGu+GfwcfB/rBOHokIaMc7D6m2B1Sziz8fXvy9BZjzwtTmvhLIMRejpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4543
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Attempt to fix intermittent failure of `drd/tests/std_list`
Locally tested to take around 45 s on qemuarm64

[YOCTO #14228]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 ...Modify-vg_test-wrapper-to-support-PTEST-formats.patch | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wr=
apper-to-support-PTEST-formats.patch b/meta/recipes-devtools/valgrind/valgr=
ind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
index 7985308e41..0c399ef52c 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-t=
o-support-PTEST-formats.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-t=
o-support-PTEST-formats.patch
@@ -19,6 +19,11 @@ Upstream-Status: Pending
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Increase time limit to 90 s.
+(double of the expected time of drd/tests/std_list on qemuarm64)
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
  tests/vg_regtest.in | 75 +++++++++++++++++++++++++++++++++++++++---------=
-----
  1 file changed, 55 insertions(+), 20 deletions(-)
@@ -66,7 +71,7 @@ index a441f42..cb05b52 100755
  # Since most of the program time is spent in system() calls, need this to
  # propagate a Ctrl-C enabling us to quit.
 -sub mysystem($)=20
-+# Enforce 30 seconds limit for the test.
++# Enforce 90 seconds limit for the test.
 +# This resume execution of the remaining tests if valgrind hangs.
 +sub mysystem($)
  {
@@ -76,7 +81,7 @@ index a441f42..cb05b52 100755
 +    my $exit_code=3D0;
 +    eval {
 +        local $SIG{'ALRM'} =3D sub { die "timed out\n" };
-+        alarm(30);
++        alarm(90);
 +        $exit_code =3D system($_[0]);
 +        alarm (0);
 +        ($exit_code =3D=3D 2) and die "SIGINT\n";   # 2 is SIGINT
--=20
2.29.2

