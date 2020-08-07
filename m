Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.88])
 by mx.groups.io with SMTP id smtpd.web10.2508.1596790732304497574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 01:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=u+WpuZjn;
 spf=pass (domain: kpit.com, ip: 40.107.139.88, mailfrom: amitanand.chikorde@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PktYPo19PmaHDeTCDcq8ewg3+iioS/TGnhPUM9ZWJD72LxSs7ZY82C03tiycXnzcc7cXSpTJ8XGtdb6tt6emW2YyrSEwt0OJTc6ylSMI6DSYqoJVLHjhMdAt7bBeTDb+9FSvsn0NGcKfJGSeNnpsRRwrD63QG4SDHO8QM7bqnrxpHT1moQgq1QOtlz8OvSgkEYYiooVTM2BmyCG//OcpDHhhNEg3Lig39alBk5EzD8NHTVd8WuW/AtZr39RbhRI+SHBehNoWjhCOjAOQbSzrWDaq7F0xU6BZM5FBW3OYFkxpjgkaRgw0bb4a49MJhFRUfSpgOdnPqzvOaEjt7R8BPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B1MgKl+ZFpql+JN4SpZs/V2wlxAO4kNgT5ZXBGyY6o=;
 b=ABVuzyYmKpj2BAsjPAtYrDich1OSGufz1weVc3SGtk4pyohEPzFIh9wyy5QrP1obRmI8t47Yc/jnJ6KHEDhJtOUbQaYrrcozIGJwEAhYdAynVyngT/jYabmXx1WqZjFl81+rVXdcqd/9xYe2UcDrkX52E5JZfuaJAomafKULwPwRFUC7Xxylhn0C7ZuxDP6CYf/XapJ2lAmT7v7IvQzr20Nib2C2ehi4xskC25LlvlcZWlL3CbIkIOogBDa1EFhaKfwbkFzxhSNB6IZW9ITSHWKrf819IIFM2JxxZlZ1BR6xe+dfaG1C23tD+pqN2x+xmAUl87ifpUd4oxBE2CeygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B1MgKl+ZFpql+JN4SpZs/V2wlxAO4kNgT5ZXBGyY6o=;
 b=u+WpuZjnSrDA6txgLeH3F8Gwwcr54SV5ou79M2Kdu0kuT3MmfNAisOZritm1CVDWGvVm1wh7S7dufBRFMB42/dPAyFOpE5wT1CW4RKcCHFFF8FNI7dhyCkN+1L9ranQoER1o8FxSx5Pf7gyEoZsPyhxgVsME7aDDfaLfj0oiiKI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:57::22)
 by BMXPR01MB2712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:38::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 08:58:39 +0000
Received: from BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::94b9:9645:e369:6d94]) by BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::94b9:9645:e369:6d94%6]) with mapi id 15.20.3239.024; Fri, 7 Aug 2020
 08:58:38 +0000
From: "Amitanand N Chikorde" <Amitanand.Chikorde@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	aditya.tayade@kpit.com,
	amitanand.chikorde@kpit.com
Subject: [poky][master][PATCH] systemd: fix codesonar warnings
Date: Fri,  7 Aug 2020 14:27:50 +0530
Message-Id: <1596790670-25319-1-git-send-email-Amitanand.Chikorde@kpit.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BM1PR01CA0101.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::17)
 To BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:57::22)
Return-Path: Amitanand.Chikorde@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4042:261c:cec0:10e1:ffc8:3f09:9f09) by BM1PR01CA0101.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3261.18 via Frontend Transport; Fri, 7 Aug 2020 08:58:36 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4042:261c:cec0:10e1:ffc8:3f09:9f09]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4427948a-2637-4ccf-5bd9-08d83ab01263
X-MS-TrafficTypeDiagnostic: BMXPR01MB2712:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB2712A292BBA647BE32728761FD490@BMXPR01MB2712.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DyJEYkjv9sjTdPyc8fPhvbONIiHwwY2KfaYujVtQUwHekwaTVGzBs+tVH4/pw/yp8Jzz1tMbTFk0O/RihEvSXv1bu1W4yJc5MqS95rCjsXlLcgPGRffHoTmg+h0QGT+XjbPa4FtOa2rSLJiovaTbS01IU4jUyIJY+znPA6n9w3Hpxgt4viMUAYMzIA55JtgybpVGxA5SbGWTAJeHQYN9MGIZSMPFHilYhr2eC8m4rbcbSc9PyVSySi2DCxv1ENDyWJXRu0U70+ag31tz+niAuTNmueq+Cnk27o5V8S8Wpk9fQDAq8t42zUc4rS3C4gHtjuOS9A9Oag6JfMYpVQxvEbboWRp5nPLSXAC9+KwysbXauQEZ0TKvfJ8jTn1WRe+T
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39850400004)(2616005)(478600001)(66946007)(66556008)(66476007)(2906002)(107886003)(66574015)(8936002)(5660300002)(316002)(36756003)(69590400007)(83380400001)(4326008)(6666004)(16526019)(86362001)(6512007)(6486002)(52116002)(6506007)(186003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/f6c+ejMwX452eB9XHc1khT6SOrpe5pudgsPfFOQR/KSQEwphOjBEkfD5UXI9cWRA+2vsbKLdGRCxjPVAuHNETxcQNy6FObDF7lEKXKFRVHv/MqSPOtWkrArID5ASqFB1kwvkxH+Fz7RSn7y6777NK45tHUMpLYPaVWU/Au4TS+E19hkM8Vyr0hJ6tngfmOB6pYeICRwt8t7b/+UPl5aV1cJNqC2ZpOZjYMHWDoNNZQhpXQMA2V7ciXkJuYxDb6sO95q/ZzH2bRqiz9FcMELj5qD54NffUz9nx8PsCQPYOPLGBOPkrXFtDgJksZodnebu6r8fTFfq3VEvEFv630d+apeLb/iEx4ft+Z7ROGciy4j5tRX+hjDPpzyd7XTxR7uZ4AcM+b3H6vlSabk8WEt5H4/Y/o/uK4wEC8G8IsGqGFCTI0a2b28Qkc67UP1qeDop3JXLreIWNyeNnrj831Fx6oBC1OvTFUzAwRTZjllkgh+KwisA1v/jEO7xvepKMyidCDayJLxXb3kFh84BPX88xaEQ/uFzhqi/rRXxFf6f1P04cHHu1ycryM4v5dYbGBDKaH9lEChP/uUOoDbg0SHrm3nYkWagsqTbe0Wjhz6/djANguhQD+LxX2NKPIwNTuZwU7agl+zrTojOcVcgggTs6nGPbAXDbfceIpPicqvNWIRB9mtgt1otWkL0sZLGjegzZoqUJ2GRBsdIsNQpQi7Yg==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4427948a-2637-4ccf-5bd9-08d83ab01263
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3397.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 08:58:38.4993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/A4Qqgr1asC0hytg6oU7fVnRdAzxz1ZHe3KCfKE6PVvGUf8o1NtMwx4ROh2IThc6ma4AcfSSBKrAoi2jTr2Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2712
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Fixed below systemd codesonar warnings.
1. isprint() and isspace() is invoked here with an argument of signed
type char, but only has defined behavior for int arguments that are
either representable as unsigned char or equal to the value
of macro EOF(-1).

As per codesonar report, in a number of libc implementations, isprint()
and isspace() functions implemented using lookup tables (arrays):
passing in a negative value can result in a read underrun.

To avoid this unexpected behaviour, typecasted char type argument to
unsigned char type.

2. "seqnum" defined, not initialized & used in device-private.c
Intialized "seqnum" at definition.

Signed-off-by: Amitanand <Amitanand.Chikorde@kpit.com>
---
 files/systemd_codesonar_warnings_fix.patch | 106 +++++++++++++++++++++++++=
++++
 1 file changed, 106 insertions(+)
 create mode 100644 files/systemd_codesonar_warnings_fix.patch

diff --git a/files/systemd_codesonar_warnings_fix.patch b/files/systemd_cod=
esonar_warnings_fix.patch
new file mode 100644
index 0000000..ce79eb2
--- /dev/null
+++ b/files/systemd_codesonar_warnings_fix.patch
@@ -0,0 +1,106 @@
+systemd: fix codesonar warnings
+
+Fixed below systemd codesonar warnings.
+1. isprint() and isspace() is invoked here with an argument of signed
+type char, but only has defined behavior for int arguments that are
+either representable as unsigned char or equal to the value
+of macro EOF(-1).
+
+As per codesonar report, in a number of libc implementations, isprint()
+and isspace() functions implemented using lookup tables (arrays):
+passing in a negative value can result in a read underrun.
+
+To avoid this unexpected behaviour, typecasted char type argument to
+unsigned char type.
+
+2. "seqnum" defined, not initialized & used in device-private.c
+Intialized "seqnum" at definition.
+
+Upstream-Status: Pending
+
+Signed-off-by: Amitanand N. Chikorde <Amitanand.Chikorde@kpit.com>
+
+--- origcode/src/libsystemd/sd-device/device-private.c 2020-07-09 18:05:13=
.744127907 +0530
++++ modifcode/src/libsystemd/sd-device/device-private.c        2020-07-09 =
18:01:56.494621945 +0530
+@@ -560,7 +560,7 @@
+         char **key;
+         const char *major =3D NULL, *minor =3D NULL;
+         DeviceAction action =3D _DEVICE_ACTION_INVALID;
+-        uint64_t seqnum;
++        uint64_t seqnum =3D 0;
+         int r;
+
+         assert(ret);
+--- origcode/src/libudev/libudev-util.c        2020-07-09 18:05:13.6560495=
15 +0530
++++ modifcode/src/libudev/libudev-util.c       2020-07-09 18:02:32.5633864=
14 +0530
+@@ -171,7 +171,7 @@
+
+         /* strip trailing whitespace */
+         len =3D strnlen(str, len);
+-        while (len && isspace(str[len-1]))
++        while (len && isspace((unsigned char) str[len-1]))
+                 len--;
+
+         /* strip leading whitespace */
+@@ -182,8 +182,8 @@
+         j =3D 0;
+         while (i < len) {
+                 /* substitute multiple whitespace with a single '_' */
+-                if (isspace(str[i])) {
+-                        while (isspace(str[i]))
++                if (isspace((unsigned char) str[i])) {
++                        while (isspace((unsigned char) str[i]))
+                                 i++;
+                         to[j++] =3D '_';
+                 }
+--- origcode/src/udev/udevadm-hwdb.c   2020-07-09 18:05:13.612010318 +0530
++++ modifcode/src/udev/udevadm-hwdb.c  2020-07-09 18:03:26.243530163 +0530
+@@ -487,7 +487,7 @@
+
+                 /* strip trailing whitespace */
+                 len =3D strlen(line);
+-                while (len > 0 && isspace(line[len-1]))
++                while (len > 0 && isspace((unsigned char) line[len-1]))
+                         len--;
+                 line[len] =3D '\0';
+
+--- origcode/src/udev/udevadm-info.c   2020-07-09 18:05:13.616013882 +0530
++++ modifcode/src/udev/udevadm-info.c  2020-07-09 18:03:41.621625782 +0530
+@@ -73,7 +73,7 @@
+
+                 /* skip nonprintable attributes */
+                 len =3D strlen(value);
+-                while (len > 0 && isprint(value[len-1]))
++                while (len > 0 && isprint((unsigned char) value[len-1]))
+                         len--;
+                 if (len > 0)
+                         continue;
+--- origcode/src/udev/udev-rules.c     2020-07-09 18:05:13.624021008 +0530
++++ modifcode/src/udev/udev-rules.c    2020-07-09 18:03:03.227995790 +0530
+@@ -726,7 +726,7 @@
+                 return -1;
+
+         /* skip whitespace */
+-        while (isspace(linepos[0]) || linepos[0] =3D=3D ',')
++        while (isspace((unsigned char) linepos[0]) || linepos[0] =3D=3D '=
,')
+                 linepos++;
+
+         /* get the key */
+@@ -738,7 +738,7 @@
+                 linepos++;
+                 if (linepos[0] =3D=3D '\0')
+                         return -1;
+-                if (isspace(linepos[0]))
++                if (isspace((unsigned char) linepos[0]))
+                         break;
+                 if (linepos[0] =3D=3D '=3D')
+                         break;
+@@ -751,7 +751,7 @@
+         temp =3D linepos;
+
+         /* skip whitespace after key */
+-        while (isspace(linepos[0]))
++        while (isspace((unsigned char) linepos[0]))
+                 linepos++;
+         if (linepos[0] =3D=3D '\0')
+                 return -1;
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
