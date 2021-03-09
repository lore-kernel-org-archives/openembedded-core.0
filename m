Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.70])
 by mx.groups.io with SMTP id smtpd.web12.6320.1615282042379152271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 01:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=T5Q3T2eQ;
 spf=pass (domain: kpit.com, ip: 40.107.139.70, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kr6LhwQ3B0E6o+xcxXdobRzzDiCSsu5jhzv2OChIjSDTu9xdXXnMMb+8jBa3d4Kaqa9dbr0edoOse4ZMJARoOe7JCcH6QB2jeHthdt5idsY/6AMap+9shbf6aUZwKqFnAHnOazKSyyUd8hrtaNeJB5zRmqTyfifl4c0eMPPBXh9tA4zkhBTi7n4/K4y1XAXsbO4tAUMWmbuA4RRswnpEDxLqGNI0qDVvlaJWSsCRm1DeGKqWqgV9PiCLBq/niOB0mYd+pqe3kLHfn0xtAFIoyNnxuS8HdAe6Yah3d8B+UvV7AWhx9UWq8/iK2nU3BO6D1OzNUdm6qdDtCrSCrNpb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0VlzAQ9oiakQ2CZu+lUHZApGsiHop/cMargEieJONQ=;
 b=R9RAGUzQ3qD+vnj4Jya7umeGvkCRSYMQwj9O/l6e8ax9ghDF0za+bXoa0S69WwZ+Gz2LO6I2MI2HScqTQ86ZUVlIedgG46MvD0+/lxpsqHBsULOkygdEc+I6U0vGBEeQC7QiPohPBHB5jIZiWnoGH+B0qZEB3XlTEAK2Yl/VHxa/2sCsKS2/qyCMHO+IeY7NIxZ9jAipiJ1WIEStMKZ00AP28Y/iCo7IPel7Khn8fTkmgXSiAB7CfnM0Vu0daCrLAISsZPJihydAv2mG6onyXS0wOKQlCin72bREDku0RkS36NOEO6HjBGHgmHt39b20wMPfvPkkfQvW9lVhypi8rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0VlzAQ9oiakQ2CZu+lUHZApGsiHop/cMargEieJONQ=;
 b=T5Q3T2eQl0VOyp8znQbjwdhBuVLLKdsl/xGXMFPMUE6xbogA9D43wcFjeaB6gRyTcPBtI29lETLd5UwgPklq4hqobDBCKW5m5rbaIhd9Edq2ij/BPYGseCpawIzy8nsvwVc5uoB3A9PCmyEKwZyEUVeCZb//qR5pqFTnzSxfXrk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PN2PR01MB4969.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 09:27:11 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::148f:99ca:65bc:1277%6]) with mapi id 15.20.3912.028; Tue, 9 Mar 2021
 09:27:11 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	harpritkaur bhandari <harpritkaur.bhandari@kpit.com>
Subject: [poky][dunfell][PATCH] python: Add fix for CVE-2021-3177
Date: Tue,  9 Mar 2021 14:57:03 +0530
Message-Id: <1615282023-20441-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [1.186.38.155]
X-ClientProxiedBy: BM1PR01CA0131.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:40::25) To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (1.186.38.155) by BM1PR01CA0131.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:40::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 09:27:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 25215b8e-23bd-4d79-bcd6-08d8e2dd84ad
X-MS-TrafficTypeDiagnostic: PN2PR01MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB4969E593EF9CEB2325B19D96EF929@PN2PR01MB4969.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	miLNIl7T0IgarXrBtDeIzTtF0TP8iM2PzeMkwCvZpRkfkDKCGeTEqhttVHzYo9Kfpljr53YUAwS4iQZ8q3t9Mb8PNaVNIMv7i9jvGaYpSaYZzK60qAlWAgvizElHDAKZhQFAJotCLVPQnn6TtATsiA5ygOeX7GnhE0uzfJhqYBu9HLkIBQQEtcu5GPhjvhC3wLQqjo9gugs+RaLwmL4cA8EmI9dnSPIvbBskJmhBlgNMsXsncky0xi7FDoK663RCaFQfcJDgfo6CDuD8U4HIj3GXrzMBb3xjXjXsLxj+zd5LG5l/S8E1Teyc6LV89UJR2FZYN946/mJquoak9nKt8tnmGmB8uzQROzSS8BMZ8S5XARInzd7ER+nYmKOhZvCxLLC/TmkMWYKGSye6HKQ5LRVveKRZ51ROPMadHChX9+VIpKa3LvUg8wWi0I5QfCeWCi3sd7OdgUOGqMl1h9McmQtkWYQGE7GwubPLwT6dTsnSMIDUblYF8Lj2exmQGz2KM9nptgSdtpi9YFDRV0qaDpB9/tjvkgSYJ9hHeIHJ+eNV1/+8sKErGWC2rk+QHLFV+1j5pCwUNTzVdpvWKNUqu3hBDDzt7Y5FoqsPC9ZeHA6lvvqgIgv5x58iDHGBFO92nmZdw/Or8La9SI0oLvQGayPKjg/sQ3I6n7cSnmbsyMDiGNcAcRFmUfb7RlNoYHQZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(376002)(396003)(366004)(66574015)(55236004)(6506007)(5660300002)(6666004)(956004)(966005)(2616005)(66556008)(36756003)(107886003)(1006002)(52116002)(8676002)(66476007)(66946007)(69590400012)(86362001)(19627235002)(4326008)(26005)(316002)(478600001)(16526019)(6486002)(6512007)(2906002)(83380400001)(8936002)(186003)(36456004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?taFZYtIgM/60qJpRZz3AJPO89eVuLuzelFU9igfYQxVIiZeWcGTufIYCCwni?=
 =?us-ascii?Q?HZksaQK5v/c0SDVe1TnzZ0PpDuPxjjLT5nLTgetp16g8ALlrYmC5LRffgF4o?=
 =?us-ascii?Q?d/SQMJ3rikkb5UtLbbNU4woUp+R8tNZj2wlOgqVBuJsa8cfqC3RlIQZbAUVH?=
 =?us-ascii?Q?zBzlPC9aekVp8rQAN73Rh13i+4bX3jI1G4/nCUZlZSjxCbCFW9NQsGvJj56f?=
 =?us-ascii?Q?p8wBCjY3n1PXgmlMM3gbHHv1kG2r8PyRpPFvLZtypfxu6kBMrBhTk4ZmwXFi?=
 =?us-ascii?Q?4SU1p2F1TuUFU7o02nVLOVZDN1wdwqu25KJ7EXlWa9R7djLVJmXut3cElM4B?=
 =?us-ascii?Q?s909ZWC+Ju1suDh7CMu+JFldvB9fFFMg19Q72iObiPIqQkCdg5EcITURe6S0?=
 =?us-ascii?Q?tBYcKtabldPOeJ1CdK6QW5g6IyyAUiebxpaiA/4+2vbbD2830NBNeUaCu6zQ?=
 =?us-ascii?Q?nYyqNRolf8q2uuEhQPGZZdauOQv21N7DHvffkOCKgnUjyt+mbLY8nKieGLlg?=
 =?us-ascii?Q?C4wScZ9yiV/oBU4aW4ePgb/b2EbI+MQfCXCUPH/wxbUeslTYCT8aCII3u8Ca?=
 =?us-ascii?Q?8uLuKBOwT0yw0zOfiBx9pr9NsYdJnDCJByFed8/coNl5xSPznlNO7UTkF/4/?=
 =?us-ascii?Q?jBPc4vc8TZ9TG8HJ7CcopxPgcGhGlqB28bM/yXzgoq0w3Yu2zNthoyQnhdx0?=
 =?us-ascii?Q?X09orn4Z0ULvzl7Uv+8bxqF+Jj3NOXYHnjsK4tyS0t+WvT2y16c1U2xkPNbq?=
 =?us-ascii?Q?gi0OuJPlEfaLlffO1t2RSA1dr9zHT1x+8iEIEd2MpSYMHKRgBgzVc3osThi8?=
 =?us-ascii?Q?vZU7M74zM9v5xwFfgef4ojB6kp13DmprBr9yY1ttM2tS2WqAzMuXIwmZ2+NN?=
 =?us-ascii?Q?KLL+vi/SIkaRb29nRSizBuDYbHF94EjOatgg2VZINrV66okAj5K3PCDj52co?=
 =?us-ascii?Q?zpuEGSpToowbvj5Z0NPmkyfipuUc3CmocQZ1y5+BrvyhCkOCpOdigJlVw7te?=
 =?us-ascii?Q?dEHaEkEZAY+E9lHtVian32szLS/rjdWSTvDqpcL+bIv8O+BCx5wLtJGYjkML?=
 =?us-ascii?Q?Cx8gNoetATZZu13OZ5BpEUNLwmQrElAxidLrAFaqexQeX+IUN+He1Mwucq3R?=
 =?us-ascii?Q?eps2+/6/jdTnDntkV/duKDfOfL58K6BfIdRMx9cMVMGeeXZLwX1HjJpjDvCZ?=
 =?us-ascii?Q?4qAuluL0QxevPD0Ti4Bug7Hq8k7l7ZfTThLxOyKLoRYl5zirK5JR/XYl1GGN?=
 =?us-ascii?Q?QNIKV6RuUG5QLUtKdXeGElfUY4P1zm6WMiuqSQXyJjvXXiL1UGb60kyZiezF?=
 =?us-ascii?Q?2jq6KKCKftIyA3WEevYQOcI+?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25215b8e-23bd-4d79-bcd6-08d8e2dd84ad
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 09:27:11.6504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKavuuhCqeVPgW41pNR5u6qnugOhzkPpbUHM7Df9FbAakkObZ3x6O9FK9UWDkvaCwR2VsRbgM8Sp75DUD+w7iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4969
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: harpritkaur bhandari <harpritkaur.bhandari@kpit.com>

Added patch to fix below CVE:

CVE-2021-3177

Link: https://github.com/python/cpython/commit/ece5dfd403dac211f8d3c72701fe=
7ba7b7aa5b5f.patch
---
 .../python/python3/CVE-2021-3177.patch             | 189 +++++++++++++++++=
++++
 meta/recipes-devtools/python/python3_3.8.2.bb      |   1 +
 2 files changed, 190 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.patc=
h

diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch b/met=
a/recipes-devtools/python/python3/CVE-2021-3177.patch
new file mode 100644
index 0000000..f36341a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
@@ -0,0 +1,189 @@
+From ece5dfd403dac211f8d3c72701fe7ba7b7aa5b5f Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 18 Jan 2021 13:28:52 -0800
+Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode
+ formatting in ctypes param reprs. (GH-24248)
+
+(cherry picked from commit 916610ef90a0d0761f08747f7b0905541f0977c7)
+
+Co-authored-by: Benjamin Peterson <benjamin@python.org>
+
+Co-authored-by: Benjamin Peterson <benjamin@python.org>
+CVE: CVE-2021-3177
+Upstream-Status: Backport [https://github.com/python/cpython/commit/ece5df=
d403dac211f8d3c72701fe7ba7b7aa5b5f.patch]
+Signed-off-by: Benjamin Peterson <benjamin@python.org>
+---
+ Lib/ctypes/test/test_parameters.py            | 43 ++++++++++++++++
+ .../2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst  |  2 +
+ Modules/_ctypes/callproc.c                    | 51 +++++++------------
+ 3 files changed, 64 insertions(+), 32 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-4293=
8.4Zn4Mp.rst
+
+diff --git a/Lib/ctypes/test/test_parameters.py b/Lib/ctypes/test/test_par=
ameters.py
+index e4c25fd880cef..531894fdec838 100644
+--- a/Lib/ctypes/test/test_parameters.py
++++ b/Lib/ctypes/test/test_parameters.py
+@@ -201,6 +201,49 @@ def __dict__(self):
+         with self.assertRaises(ZeroDivisionError):
+             WorseStruct().__setstate__({}, b'foo')
+
++    def test_parameter_repr(self):
++        from ctypes import (
++            c_bool,
++            c_char,
++            c_wchar,
++            c_byte,
++            c_ubyte,
++            c_short,
++            c_ushort,
++            c_int,
++            c_uint,
++            c_long,
++            c_ulong,
++            c_longlong,
++            c_ulonglong,
++            c_float,
++            c_double,
++            c_longdouble,
++            c_char_p,
++            c_wchar_p,
++            c_void_p,
++        )
++        self.assertRegex(repr(c_bool.from_param(True)), r"^<cparam '\?' a=
t 0x[A-Fa-f0-9]+>$")
++        self.assertEqual(repr(c_char.from_param(97)), "<cparam 'c' ('a')>=
")
++        self.assertRegex(repr(c_wchar.from_param('a')), r"^<cparam 'u' at=
 0x[A-Fa-f0-9]+>$")
++        self.assertEqual(repr(c_byte.from_param(98)), "<cparam 'b' (98)>"=
)
++        self.assertEqual(repr(c_ubyte.from_param(98)), "<cparam 'B' (98)>=
")
++        self.assertEqual(repr(c_short.from_param(511)), "<cparam 'h' (511=
)>")
++        self.assertEqual(repr(c_ushort.from_param(511)), "<cparam 'H' (51=
1)>")
++        self.assertRegex(repr(c_int.from_param(20000)), r"^<cparam '[li]'=
 \(20000\)>$")
++        self.assertRegex(repr(c_uint.from_param(20000)), r"^<cparam '[LI]=
' \(20000\)>$")
++        self.assertRegex(repr(c_long.from_param(20000)), r"^<cparam '[li]=
' \(20000\)>$")
++        self.assertRegex(repr(c_ulong.from_param(20000)), r"^<cparam '[LI=
]' \(20000\)>$")
++        self.assertRegex(repr(c_longlong.from_param(20000)), r"^<cparam '=
[liq]' \(20000\)>$")
++        self.assertRegex(repr(c_ulonglong.from_param(20000)), r"^<cparam =
'[LIQ]' \(20000\)>$")
++        self.assertEqual(repr(c_float.from_param(1.5)), "<cparam 'f' (1.5=
)>")
++        self.assertEqual(repr(c_double.from_param(1.5)), "<cparam 'd' (1.=
5)>")
++        self.assertEqual(repr(c_double.from_param(1e300)), "<cparam 'd' (=
1e+300)>")
++        self.assertRegex(repr(c_longdouble.from_param(1.5)), r"^<cparam (=
'd' \(1.5\)|'g' at 0x[A-Fa-f0-9]+)>$")
++        self.assertRegex(repr(c_char_p.from_param(b'hihi')), "^<cparam 'z=
' \(0x[A-Fa-f0-9]+\)>$")
++        self.assertRegex(repr(c_wchar_p.from_param('hihi')), "^<cparam 'Z=
' \(0x[A-Fa-f0-9]+\)>$")
++        self.assertRegex(repr(c_void_p.from_param(0x12)), r"^<cparam 'P' =
\(0x0*12\)>$")
++
+ ################################################################
+
+ if __name__ =3D=3D '__main__':
+diff --git a/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4M=
p.rst b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
+new file mode 100644
+index 0000000000000..7df65a156feab
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
+@@ -0,0 +1,2 @@
++Avoid static buffers when computing the repr of :class:`ctypes.c_double` =
and
++:class:`ctypes.c_longdouble` values.
+diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c
+index a9b8675cd951b..de75918d49f37 100644
+--- a/Modules/_ctypes/callproc.c
++++ b/Modules/_ctypes/callproc.c
+@@ -484,58 +484,47 @@ is_literal_char(unsigned char c)
+ static PyObject *
+ PyCArg_repr(PyCArgObject *self)
+ {
+-    char buffer[256];
+     switch(self->tag) {
+     case 'b':
+     case 'B':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.b);
+-        break;
+     case 'h':
+     case 'H':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.h);
+-        break;
+     case 'i':
+     case 'I':
+-        sprintf(buffer, "<cparam '%c' (%d)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
+             self->tag, self->value.i);
+-        break;
+     case 'l':
+     case 'L':
+-        sprintf(buffer, "<cparam '%c' (%ld)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%ld)>",
+             self->tag, self->value.l);
+-        break;
+
+     case 'q':
+     case 'Q':
+-        sprintf(buffer,
+-#ifdef MS_WIN32
+-            "<cparam '%c' (%I64d)>",
+-#else
+-            "<cparam '%c' (%lld)>",
+-#endif
++        return PyUnicode_FromFormat("<cparam '%c' (%lld)>",
+             self->tag, self->value.q);
+-        break;
+     case 'd':
+-        sprintf(buffer, "<cparam '%c' (%f)>",
+-            self->tag, self->value.d);
+-        break;
+-    case 'f':
+-        sprintf(buffer, "<cparam '%c' (%f)>",
+-            self->tag, self->value.f);
+-        break;
+-
++    case 'f': {
++        PyObject *f =3D PyFloat_FromDouble((self->tag =3D=3D 'f') ? self-=
>value.f : self->value.d);
++        if (f =3D=3D NULL) {
++            return NULL;
++        }
++        PyObject *result =3D PyUnicode_FromFormat("<cparam '%c' (%R)>", s=
elf->tag, f);
++        Py_DECREF(f);
++        return result;
++    }
+     case 'c':
+         if (is_literal_char((unsigned char)self->value.c)) {
+-            sprintf(buffer, "<cparam '%c' ('%c')>",
++            return PyUnicode_FromFormat("<cparam '%c' ('%c')>",
+                 self->tag, self->value.c);
+         }
+         else {
+-            sprintf(buffer, "<cparam '%c' ('\\x%02x')>",
++            return PyUnicode_FromFormat("<cparam '%c' ('\\x%02x')>",
+                 self->tag, (unsigned char)self->value.c);
+         }
+-        break;
+
+ /* Hm, are these 'z' and 'Z' codes useful at all?
+    Shouldn't they be replaced by the functionality of c_string
+@@ -544,22 +533,20 @@ PyCArg_repr(PyCArgObject *self)
+     case 'z':
+     case 'Z':
+     case 'P':
+-        sprintf(buffer, "<cparam '%c' (%p)>",
++        return PyUnicode_FromFormat("<cparam '%c' (%p)>",
+             self->tag, self->value.p);
+         break;
+
+     default:
+         if (is_literal_char((unsigned char)self->tag)) {
+-            sprintf(buffer, "<cparam '%c' at %p>",
++            return PyUnicode_FromFormat("<cparam '%c' at %p>",
+                 (unsigned char)self->tag, (void *)self);
+         }
+         else {
+-            sprintf(buffer, "<cparam 0x%02x at %p>",
++            return PyUnicode_FromFormat("<cparam 0x%02x at %p>",
+                 (unsigned char)self->tag, (void *)self);
+         }
+-        break;
+     }
+-    return PyUnicode_FromString(buffer);
+ }
+
+ static PyMemberDef PyCArgType_members[] =3D {
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-d=
evtools/python/python3_3.8.2.bb
index a448b3e..fa0515a 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -37,6 +37,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
            file://CVE-2020-14422.patch \
            file://CVE-2020-26116.patch \
            file://CVE-2020-27619.patch \
+           file://CVE-2021-3177.patch  \
            "

 SRC_URI_append_class-native =3D " \
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
