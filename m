Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.47])
 by mx.groups.io with SMTP id smtpd.web12.4306.1596098527862285339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2020 01:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=B2gqSmPR;
 spf=pass (domain: kpit.com, ip: 40.107.139.47, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gigyHiNTXG83cCgfpQTa+yuPFzC1kOkkIgTLkLF/qwDpZenuhTeQoAZLCxY40EbVHy50uJPnd1p6GL9Tpzt60dmwzYf2n+w7Qm5bdfYG+im3Cpt1LjlbNOKdJsNQxOqj/2DSqVRPzcPYMShKs/2BkAZfkEDumg4noHmTstXKDZ0P9C1PwakLZkRlTkN/DMw9ssF63c1aAkVM05qfT1b8k66T03oqJWQ4ultEkG+cgRDEvsd3MGK59mGHG4ni9RNrexC1E2QTt7wJV1asTqzyo4wOFOxyuVyowrf+ttOJgx/WPN0DD6rKLiUvXNX4OPoqtFzBV47iU6rZZ1IcBpeJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmeTrayQYVzfE65lklCjOXqXSjlYln4K1y9rvOGizkg=;
 b=QrhBv3BGtDOGDf0kz02lA69eh4yBZxcRnLh/F+Ix1VMsLb9CkTFIDX35Gr91EvCg4QlFogCR1W3RDtiAZqJ0wMk9qcpfZGOfnIJGwnKS3RoOBNV0cFPuJaFW5L8AGIO/fB/0FyZe6L6NKA4FevuiiveQynSbDdAoIIx8vR2h6DVNCGOC8mvBFxx9NKbCh3UKHCF9YEbaLFFLmUUZ7MQG3GRECxJrFxxOZl8ND8RaI7T67WRlaP/4nxyupCOnRT+xjy/n5s29atqUilbtN0XoZDHeE5kEO15s+JDKNPeCZwpVXctpLkfucqCcKYdoo/QU2KsEOi1Sv2Ao8n2LJbt+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmeTrayQYVzfE65lklCjOXqXSjlYln4K1y9rvOGizkg=;
 b=B2gqSmPRCvdXv6E7dEO2pjc31EbxlojdEfsYugL1IC4WRH5RrkMuzDW7UWfadGDmRlNpK7/PBvFGB0vVfda4FVuLf3dsEL8fvRWC+CMmeGaTZbKIkBZbHJSpI5vMaPUkx+rS8qyu89gkaN+6GPriIncfC5kivlgEgITbHNZjgSM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:70::20)
 by BM1PR0101MB1716.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Thu, 30 Jul
 2020 08:42:03 +0000
Received: from BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c872:e85a:d42f:a3f1]) by BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c872:e85a:d42f:a3f1%4]) with mapi id 15.20.3239.018; Thu, 30 Jul 2020
 08:42:03 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	Rahul Taya <Rahul.Taya@kpit.com>
Subject: [poky][zeus][PATCH] libpcre: Add fix for CVE-2020-14155
Date: Thu, 30 Jul 2020 14:11:51 +0530
Message-Id: <1596098511-12536-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BMXPR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::20) To BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:70::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2c9e:a8f5:cdad:2ca8:49de:63fc) by BMXPR01CA0080.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:54::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 08:42:02 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:2c9e:a8f5:cdad:2ca8:49de:63fc]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fde6a256-5633-43df-d65f-08d834646e65
X-MS-TrafficTypeDiagnostic: BM1PR0101MB1716:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR0101MB171689271D182F69B963938387710@BM1PR0101MB1716.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FanOWOdaETpOj+FCoAnHAArricQ1XphSMON6AcYJDZqnJNFua2bo+f3VW+AJ4lSqJ5eqC1d5YUoJvpB9eCDY1EMlF6EFvQo5TVKaRYtisptarwjS+Ux0BeSAQB/rSuGkzOW0lfpPh3VIEjqc3pPIriHWd+7OCKbxVaa68ENYdnnsKSBLHUXL+llw7IZ6TQzGaXxETfGQgJqiph96lZahA2YklN87JIf4Lk/8WjY23eJwYQTGKGBE8awMwprrpIM8AyNByuYnwf6RlFjiCra4Xj5DyYtM78jbHSXFKvDMW2Goj8FLgPiwmS8Tb+q8rkq7dysB1uLWa22m8IkG7W4Oh0YiZEeB/sOD48kGyh0R4coVgEMTZy2o9qjABKT1AhrSvO3Gjnt2Gbp2rpK/8HHhXGaPsHLKouOc32KzRYc3L2ywtN9NNCu24I+4s4aNmrEgG++A6DvUEWO07LPc3r2a+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(396003)(376002)(346002)(136003)(366004)(316002)(6666004)(86362001)(16526019)(186003)(8676002)(6486002)(83380400001)(66574015)(6506007)(2616005)(69590400007)(66556008)(36756003)(52116002)(6512007)(8936002)(478600001)(4326008)(66946007)(2906002)(107886003)(66476007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	WE0fPEd/qOl8US9N/xO0kJcNhBBoznEaT9eOkSdNgMTGZ8j82rbbqPn+Ur7TF91OBgl2Z1YDIK7TiRK0ZDxBgIIs3JolVtAgGq+I9mfmpfxHAJhABW0kHNIJ/wN7YRtiwYOc7NQT1rqJva9kJzmMATQlTCLRV/+2GJkGKXruBBBZ7ChJPegxYIykZlE+3gCSVEG6//vSQNykj9st4XxpK4fGt0Q76Ss5c+xlONp9n2RfJh87LsTu7VQuuPay/hdGzRZvKnXGvdWIO2gNPN3qs3RTqBQYkFW3kfP1h2WodTh3jt7OBDybryVQRdA2CDP48jCH61gBoR+ZdK3wOjHceArzikRKkYD2J9FkP9rDJAHimABQ/amjMD/OkQWNTQYPuleoGJf7IMVp+RgCAIFEZAoj2Y0cwoDAWGhlHiJmhEeEC/j4TUQJAJ6ZDwJeqWJF95Sh3/nnvRaAkQdjmG9+KZ7361N7neFV4+/wlte4uBmpIy9S+dwL6GcLVxgxJ/fS8qQmGgpXRb6CnWNmcHg1nEEzq9rIGkYNV4yTV1h0GcGwC+UaUKGTuvnfUQYZIbaOOGTPDtyoqpu5CV0PPJ4x2LAPzmYme8JvcXkRpRzdQmYN7V2G5utontIy1RxRMb7WCddt/BdU8S+JDXQuSde0dC3GWgbP5/5AImA4/UXRvWuzyGLuJTxb02P8t8rQpSJDXwx+ONOAnJMTPVTgpQG3rg==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde6a256-5633-43df-d65f-08d834646e65
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB3665.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 08:42:03.0924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bysbQILtT4Jdqfq7Wkp3FXnCS0bW6nNj4KHZWE0TCP3ETAtVFSsgsAAc86CX2eMtp39tG7vpPi4voZlFCVCwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1716
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Rahul Taya <Rahul.Taya@kpit.com>

Added below patch in libpcre
CVE-2020-14155.patch

This patch fixes below error:
PCRE could allow a remote attacker to execute arbitrary
code on the system, caused by an integer overflow in
libpcre via a large number after (?C substring.
By sending a request with a large number, an attacker
can execute arbitrary code on the system or
cause the application to crash.

Tested-by: Rahul Taya <Rahul.Taya@kpit.com>
Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>

Please Note: CVE already fixed in master and dunfell branches,
applicable for zeus only.
---
 .../libpcre/libpcre/CVE-2020-14155.patch           | 41 ++++++++++++++++++=
++++
 meta/recipes-support/libpcre/libpcre_8.43.bb       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2020-14155.pat=
ch

diff --git a/meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch b/me=
ta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch
new file mode 100644
index 0000000..183512f
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre/CVE-2020-14155.patch
@@ -0,0 +1,41 @@
+--- pcre-8.43/pcre_compile.c    2020-07-05 22:26:25.310501521 +0530
++++ pcre-8.43/pcre_compile1.c   2020-07-05 22:30:22.254489562 +0530
+
+CVE: CVE-2020-14155
+Upstream-Status: Backport [https://vcs.pcre.org/pcre/code/trunk/pcre_compi=
le.c?view=3Dpatch&r1=3D1761&r2=3D1760&pathrev=3D1761]
+Signed-off-by: Rahul Taya<Rahul.Taya@kpit.com>
+
+@@ -6,7 +6,7 @@
+ and semantics are as close as possible to those of the Perl 5 language.
+
+                        Written by Philip Hazel
+-           Copyright (c) 1997-2018 University of Cambridge
++           Copyright (c) 1997-2020 University of Cambridge
+
+ -------------------------------------------------------------------------=
----
+ Redistribution and use in source and binary forms, with or without
+@@ -7130,17 +7130,19 @@
+           int n =3D 0;
+           ptr++;
+           while(IS_DIGIT(*ptr))
++           {
+             n =3D n * 10 + *ptr++ - CHAR_0;
++            if (n > 255)
++               {
++               *errorcodeptr =3D ERR38;
++               goto FAILED;
++               }
++            }
+           if (*ptr !=3D CHAR_RIGHT_PARENTHESIS)
+             {
+             *errorcodeptr =3D ERR39;
+             goto FAILED;
+             }
+-          if (n > 255)
+-            {
+-            *errorcodeptr =3D ERR38;
+-            goto FAILED;
+-            }
+           *code++ =3D n;
+           PUT(code, 0, (int)(ptr - cd->start_pattern + 1)); /* Pattern of=
fset */
+           PUT(code, LINK_SIZE, 0);                          /* Default le=
ngth */
diff --git a/meta/recipes-support/libpcre/libpcre_8.43.bb b/meta/recipes-su=
pport/libpcre/libpcre_8.43.bb
index b97af08..60ece64 100644
--- a/meta/recipes-support/libpcre/libpcre_8.43.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.43.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar=
.bz2 \
            file://out-of-tree.patch \
            file://run-ptest \
            file://Makefile \
+           file://CVE-2020-14155.patch \
 "

 SRC_URI[md5sum] =3D "636222e79e392c3d95dcc545f24f98c4"
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
