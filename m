Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891DAF9EDD9
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 13:57:39 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82861.1776865548765118536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 06:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=ZK1Ld4mA;
 spf=pass (domain: est.tech, ip: 40.107.162.9, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xw/HZeJumLZehtMVBRJDwVBCAdxkZPPUcbTsuCMvyuFfOPMhW1IofLA8hz/JW30WSV5+DELC/HullolYGUwqUfCYYxg/6CWbqjMh7clCkKZd+9z71QdR8/gu7LCHOUXN+g8OYPjbLX/RUQ8IDPIusab3qrNW/0pUHkBOk2JqqPEyCs4rnteYlqPGREOh85cWqfhffiIMCqTrRoqPYq1eqaZqBDSSe7tXa/vNPtiy5FqEb+96AKXN6yEcYK652U6oDL6G7rbLyoD/WyFE4DwdAjJVvUw+0+9RWMriNqk2E8gJNiAM+83ChRTGMJxcOhMfPwKujraJKDlpVz5TKWOdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJcibLnrZFBJrpMBaaq/aEbzZOPv5c2XfWD/kJBmKuM=;
 b=J/doEljCMRL/rnBe1jhFgNMJvB27F7IkQ8uyINtAlKQ3kVeFV2VrMpOqMOri3YPq4xlu9M0sTftJT+kL6r0+CazBUUA946OmX1r6DO0a5VARqiB2UuoIlJnTRFKUG2oUvLVWM6e457AkfXtj9lg7PeV97dfPriyQaUsU6J+3SjvtJTlUrgwwRkEr4O2+ywed969b0/3v5HaAdTe0UCHk7Bc0xVDOrcb47zcKUujOsEhLQsYwM3IwdRON6mfQo4eJq0d5x4Rl1LIWKzk6htvYXpnBxR4rLqQJFPGXHid6htfhjPSV1nDk0bq1u7Vh/1fZ2S/ZQUAq+qiHSyL5ty1djQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJcibLnrZFBJrpMBaaq/aEbzZOPv5c2XfWD/kJBmKuM=;
 b=ZK1Ld4mAdKzFqNHil+v1MizNoAgWWE6EPxQHulpK3O+kt+kq/UIk0R0QZJy5/leJjpTj3vME8ea9eZPzN1mVzDyaVYmGUQrgfGlgjoC+cJBfj+EHLvZh9wV/IjopKE3JoRN/cD5YA+/3z10TzhgO9pwlBdDmwqEJJ9SgJ2JND5uLeCtw3ZWc3kOtMqo0V/WGSjF4EUDxUxc0eXkl2XRgHCHqNQrChPX6LUYC7+djTo/FAKHoU8yTuNDpcABWX2YUekPOx+4Gbht517CiNPtMz4+zp7qG/Ogv5pi4lbPOiBXP/1By64A72fodx01VcyPVYo9b6hcpXsPRrvGH8kMRrw==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 13:45:44 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 13:45:44 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 4/4] binutils: fix CVE-2025-69652
Thread-Topic: [OE-core][scarthgap][PATCH 4/4] binutils: fix CVE-2025-69652
Thread-Index: AQHc0liHqhJgTnMsoEiRlt+tbs73XrXrF8TI
Date: Wed, 22 Apr 2026 13:45:44 +0000
Message-ID: 
 <AS8P189MB167256874023C8229D7D82EBB32D2@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260422130413.386573-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260422130413.386573-1-adarsh.jagadish.kamini@est.tech>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|DU7PPF66507B2D7:EE_
x-ms-office365-filtering-correlation-id: c093b6d8-8a36-4f4d-2931-08dea0757385
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 47++AcRiJSms8i310QEFiBgb771/Av5X5Nkmcp2piWOxg5WqcBzltxme0cYz7m4gHCGSyejuTgHXWfw40tYVBj82KpkpXbJpx64ogWeHh88ljWz99gfHRYOnXjRkwpW9zoUOauha0kcacPqU+3/iVluKTGDVgyVllzcOpuxWxwFAAiV2lBp6npn6gM6NpX5L56IeqrpkO3iYOXlH9yEq2SMpSdlJi4QwjWKDbGxd6xX73/kfilhUezbPVYDS9PmwZ4WC47VvvDIvoS4BBe1Z5xvPvQn3g4x61IumxH0HyM1ay41BT1isuW9m+RZl6xHAg1wuWgo9C233RQeFDLrWeXJBSKUTV7/KBAi56aF/s6j1MxRDi4gR/65Cw4S5BZShsCezKiRBT1G5vSDHDDcuaJli5/88XKeB5F9l3GiD6MRh0g6R/QDkHqiADrOYLHyxIDkK48RS8wam8YQyAmviPD2zBDWpjDXIdySEzTJEowv7tEIXzwg78jPZxTowCZI6uvhyuzUkqxSD7z+7NQCLdvrnE+gW0UdW0rHVFm2kdY2xY90A7wy8QEwvYAYA4H/D8FOWEU62qNOozYu7s5h5U0prL72TOv89FL/6fBgvWOyvXs0tQez0RBgSez/r6tbBmu5jFTuRfTDSfHVyuq9S1Jci8rXfsGEExX+gaZkPXtCt5FvCtbvw2ORNeosDnclzY414Fd9Xx/Swe/JnxMJbOd+OI3HHOIQJSfY3Z+xOOBLUI1zSj/Pp+SZNoYpJxL6l
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?IEw+leoOeQMHy549eg7miFAAA5ugvo8hCk0L5T1G3ZFy3Hmo8YkZlBicBp0Y?=
 =?us-ascii?Q?iO9bFwWdipcMDLBI+2r8iI8/X7lFeaWS5cEGP5pzmFQ+Owvl8mrG0BkebAdX?=
 =?us-ascii?Q?rJzTCLoIen/1n3PZHydfBRMSi++vby9MELsltuXuRi5h5mYO7+uM3eXTcrCS?=
 =?us-ascii?Q?XSu6FY70iIhMi5t3xWb2faARbUD62QspOB1rfuBmloNs/g/ZnBfqEmVjR6Ew?=
 =?us-ascii?Q?EbdX2mlK4keOiIDQ+rCkaqxhGE3ABaTBswlsT1sqBSlxD3V9TRxpwWcRdxTq?=
 =?us-ascii?Q?5/PGXZxlpFnWHVNZEt31FUL9Q6k0TJN4sXuNi77urvoyFPg0a9s/uhyu2VCl?=
 =?us-ascii?Q?5jAburHhwW1L+97dbrMhYV70TQDPX5qiH+SETkIV5r6xAOFI8918lyWmVGUr?=
 =?us-ascii?Q?buQ/anVRj36A+OnwqhMtJ9ygZbNTCGLxi7loVNuoIAXYTRuVhMHy3y4Vlwsi?=
 =?us-ascii?Q?0Tav/D1cyO2HBmDToXGngZGAo9JYtw01LeomLD9UnDo3Wp51avFd925d45x8?=
 =?us-ascii?Q?6D4OpSWAu0aN6J3pVqrUDOd72AqLD6ZvSW5D1/Her0B4O8plci+3E3UW0FUG?=
 =?us-ascii?Q?q3sXks4rDySdObR9YspBz05kSADP6myoVuzKCIubzGJ1H+7bCWQOewghrqd0?=
 =?us-ascii?Q?rfKOQCr9tFQGV/xJ0uudM8fEPsbe0vi7GgZwxFiMeH9STynpRxC0JAlZCvtP?=
 =?us-ascii?Q?oI3gQX/se7HfrQCIAOBMlOytzwTYcr4gTPEg90mpiSbI5dxZciz/HiQmM1qh?=
 =?us-ascii?Q?7FLH4RqxnjXRx0tCi4PdnBNKTXF9SoxwNucxqIFM1w+84p9gOR/Puif/PDsd?=
 =?us-ascii?Q?aAjSlDkDbfBKMLkvcj0AFVSFgdnv5f8l5C0sMreOVB9T5ZHRnlxEl1zpW2fL?=
 =?us-ascii?Q?gnvSSn1GTcEvjonsM1rnx8OrMnB3z0M+3YWpuvxfp0zX74dvCAe7Jrky/7N+?=
 =?us-ascii?Q?JWF7LJwa9jTb14EuO7EoZT9k2OXMq0he02jp2SlQLN0UK4wQQA+hV0Do81Zq?=
 =?us-ascii?Q?EuZZVAZVKCYHnHZ4smqQ+DuXu9qkfJa4VzzdcjTCHlYRTiqPTEolcq7plka4?=
 =?us-ascii?Q?9CtiuFvDjlsBZdX0GQNOoMaJvpv/N55KVvDMPrlr00EqpQ53WPeeom92wSl6?=
 =?us-ascii?Q?w66xm7kVoiXoIvfEwDLy28Nkfg8K3EMtxaa11JPQqAD8cfwtx2yMiKgOzO1O?=
 =?us-ascii?Q?rFdxlBQE7tQkM4F3I/wKLjog/ycLJNLRCPkwGDJh7ydDiUf04R/RaQ9PDm+c?=
 =?us-ascii?Q?5mf9XNPR9qv2HHWGtIhScVoN5ohkUQPYMZ5Jq3uX3KOfF9IXFcU79mxY9rgK?=
 =?us-ascii?Q?L89vyETD8xN6YYra0zb4iUJsAGW3R5aWAipR9xO/ArF35RSZjuukQHQ6lA5y?=
 =?us-ascii?Q?Ra0Qv8n1ag8qQcOmuvXecV0IWeuqkln9ACzy9v84I+qTnTb/iotJlcCezQkG?=
 =?us-ascii?Q?vMdB+UZhnaE2eFxXW/7M2FBL9AhmqZ2Z7bxnrpacVkGOthhSyPk8vcqgvRwt?=
 =?us-ascii?Q?ulCAJcT0STwLGVCSJadceyevqI6wxbr2c+yf+d6kXAKYy+JIgmdUrIsfh+xX?=
 =?us-ascii?Q?EX+vxGqFAAQ9LpmnfKZAXdOOfI9cvZSLbLVDW8aSJI3NgfkSdaSTfjK8/1Uh?=
 =?us-ascii?Q?eMQIsIzgOKyWjdv/a2bqGTEDujBh1JX2fHskANWeqWwLMKN05zhWClsz4zq0?=
 =?us-ascii?Q?IvxznVkyEoGa7/tpIq19f4rqzI1TKdnwT/Mpcus5neNz0eFA5z81zxmlGC22?=
 =?us-ascii?Q?K6g13lbVnNkrl/AvjMW8NEUmbIcdEZs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c093b6d8-8a36-4f4d-2931-08dea0757385
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 13:45:44.2723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2HP6dKdEg57+JSNcljLv1SRBBVVH7xvhKVaB3gmbedihx0okJTi57Pb7zx03dXDg2BmVtkJabdlP8Sr6DlZ3EX+Rwhj9RJbSdFiQqbRaFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF66507B2D7
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB167256874023C8229D7D82EBB32D2AS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 13:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235726

--_000_AS8P189MB167256874023C8229D7D82EBB32D2AS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Please drop this patch for CVE-2025-69652, this doesn't apply for binutils =
2.42

Thanks!
Adarsh

________________________________
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Sent: Wednesday, April 22, 2026 15:04
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH 4/4] binutils: fix CVE-2025-69652

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport upstream fix for CVE-2025-69652 [1].

[1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D44b=
79abd0fa12e7947252eb4c6e5d16ed6033e01

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-69652.patch    | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69652.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 8a92807f30..8768451303 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -74,5 +74,6 @@ SRC_URI =3D "\
      file://CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
      file://CVE-2025-69649.patch \
+     file://CVE-2025-69652.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
new file mode 100644
index 0000000000..c0c7c99c2a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
@@ -0,0 +1,41 @@
+From 5a2f57ab03067f6622c19983e1e31207bd2293a6 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 16:04:44 +1030
+Subject: [PATCH] PR 33701, abort in byte_get_little_endian
+
+       PR 33701
+       * dwarf.c (process_debug_info): Set debug_info_p NULL when
+       DEBUG_INFO_UNAVAILABLE.
+
+CVE: CVE-2025-69652
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D44b79abd0fa12e7947252eb4c6e5d16ed6033e01]
+
+(cherry picked from commit 44b79abd0fa12e7947252eb4c6e5d16ed6033e01)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ binutils/dwarf.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 2462e6540a7..0d88ea94619 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -4248,9 +4248,11 @@ process_debug_info (struct dwarf_section * section,
+              break;
+            }
+
+-        debug_info *debug_info_p =3D ((debug_information
+-                                     && unit < alloc_num_debug_info_entri=
es)
+-                                    ? debug_information + unit : NULL);
++        debug_info *debug_info_p =3D NULL;
++        if (debug_information
++            && num_debug_info_entries !=3D DEBUG_INFO_UNAVAILABLE
++            && unit < alloc_num_debug_info_entries)
++          debug_info_p =3D debug_information + unit;
+
+          assert (!debug_info_p
+                  || (debug_info_p->num_loc_offsets
+--
+2.35.6
+
--
2.34.1


--_000_AS8P189MB167256874023C8229D7D82EBB32D2AS8P189MB1672EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please drop this patch for <span style=3D"font-weight: 600;">CVE-2025-69652=
</span>, this doesn't apply for binutils 2.42</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Adarsh</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Adarsh Jagadish Kamin=
i &lt;adarsh.jagadish.kamini@est.tech&gt;<br>
<b>Sent:</b> Wednesday, April 22, 2026 15:04<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
<b>Subject:</b> [OE-core][scarthgap][PATCH 4/4] binutils: fix CVE-2025-6965=
2</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.k=
amini@est.tech&gt;<br>
<br>
Backport upstream fix for CVE-2025-69652 [1].<br>
<br>
[1] <a href=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitd=
iff;h=3D44b79abd0fa12e7947252eb4c6e5d16ed6033e01">
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D44b79ab=
d0fa12e7947252eb4c6e5d16ed6033e01</a><br>
<br>
Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&g=
t;<br>
---<br>
&nbsp;.../binutils/binutils-2.42.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;.../binutils/binutils/CVE-2025-69652.patch&nbsp;&nbsp;&nbsp; | 41 +++=
++++++++++++++++<br>
&nbsp;2 files changed, 42 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-6=
9652.patch<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc<br>
index 8a92807f30..8768451303 100644<br>
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
@@ -74,5 +74,6 @@ SRC_URI =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2025-69647.patch">file=
://CVE-2025-69647.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2025-69648.patch">file=
://CVE-2025-69648.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2025-69649.patch">file=
://CVE-2025-69649.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2025-69652.patch">file://CV=
E-2025-69652.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;S&nbsp; =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch<br>
new file mode 100644<br>
index 0000000000..c0c7c99c2a<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch<br>
@@ -0,0 +1,41 @@<br>
+From 5a2f57ab03067f6622c19983e1e31207bd2293a6 Mon Sep 17 00:00:00 2001<br>
+From: Alan Modra &lt;amodra@gmail.com&gt;<br>
+Date: Mon, 8 Dec 2025 16:04:44 +1030<br>
+Subject: [PATCH] PR 33701, abort in byte_get_little_endian<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PR 33701<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * dwarf.c (process_debug_info): Set d=
ebug_info_p NULL when<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEBUG_INFO_UNAVAILABLE.<br>
+<br>
+CVE: CVE-2025-69652<br>
+Upstream-Status: Backport [<a href=3D"https://sourceware.org/git/?p=3Dbinu=
tils-gdb.git;a=3Dcommitdiff;h=3D44b79abd0fa12e7947252eb4c6e5d16ed6033e01">h=
ttps://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D44b79abd=
0fa12e7947252eb4c6e5d16ed6033e01</a>]<br>
+<br>
+(cherry picked from commit 44b79abd0fa12e7947252eb4c6e5d16ed6033e01)<br>
+Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
+Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&=
gt;<br>
+---<br>
+ binutils/dwarf.c | 8 +++++---<br>
+ 1 file changed, 5 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c<br>
+index 2462e6540a7..0d88ea94619 100644<br>
+--- a/binutils/dwarf.c<br>
++++ b/binutils/dwarf.c<br>
+@@ -4248,9 +4248,11 @@ process_debug_info (struct dwarf_section * section,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debug_info *debug_info_p =3D (=
(debug_information<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&=
amp; unit &lt; alloc_num_debug_info_entries)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ? debug_info=
rmation + unit : NULL);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debug_info *debug_info_p =3D N=
ULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (debug_information<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&=
amp; num_debug_info_entries !=3D DEBUG_INFO_UNAVAILABLE<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;&=
amp; unit &lt; alloc_num_debug_info_entries)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debug_info_p =3D d=
ebug_information + unit;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert (!debug_info=
_p<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; || (debug_info_p-&gt;num_loc_offsets<br>
+-- <br>
+2.35.6<br>
+<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8P189MB167256874023C8229D7D82EBB32D2AS8P189MB1672EURP_--

