Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C837109C04F
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 17:39:22 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29193.1774460358818388785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 10:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=JJVvBl/6;
 spf=pass (domain: ericsson.com, ip: 52.101.66.46, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9YqTRnr89Nd7OBl/k/sXIlI7d3VZgLWJFgiJS3K1EUf2+1DGwujvUJFWDWyZu1wJF4jnbRefh8cz/LwdR7aSCuSDlozV/uQDFOuwGf7nXX2Z8k7+ieC8UKSnbRI1zzGrrFTVtFBIcEanzZvhFsFmLN7tMkMQZFL/i6bS55UenVgKtQKmv+GkC7F4rGCGFvCrLvG17Dl29SZBs9YCwxBGpc5NvDvjDG7LNBGsswuA/GIPq2yV5+yetL/uniGpsoIJvPqR6In8tO6Uey2pkOuZuXgK7BlzkEoKsmW9EZJ7RyQPg9yQCbD+KV0ZQPww+zuPN6+VvRSkBvuSpcM5KA5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8pVmnthEwUx+a6020IDRnUCO7OsrZuBjCKWg6EY6Ks=;
 b=caYu4v0iV5vBbibj2PW9yhpk//xmxzet2xw24zM0IJiJhi0TLTkQljg/GTsUmZXjZTLyS101MHmzNpd7IW35vGsw3v+XVu+WelXSVgo3D22x2foGiCQlPIAThmtPnqK002D7QMfV1NmTfdiXPj9nQcin3YX8c9lAbZqsOeuwL0QXupOkvWNJpeQY0DOxwttDg0MfhxYBkaxNXZ+X8+ANV757wyby12xszX9MH0jC3rWe/AjA/H64sh9si9i3o1jyN7kJqKEC9Rc2Xi0lf4jodcus+mwgPT4hSYqAlN6EC6QWw8gALanEWrY8pBoEMzW0n4TkqdmIHuJmaIR/0Rqrkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8pVmnthEwUx+a6020IDRnUCO7OsrZuBjCKWg6EY6Ks=;
 b=JJVvBl/6Mge1CtBN+U1xeZias66yf6f7uR2+MG6LNYNF4uBzraDl57a5rhEeQ1DWEAklP+RYTbtYVczOKoITVt9ptagWwK4BAb0LJ+9Vq7koEZ26Y2iBG3BQWiUbKIl1cPawShGxANuJJ9BPS1yw4l+VuhT6bCknKrGXeXSOwk1Uko17BK/a1a8sCcziCacSNNqlsarSoee+rBKRevKgFnPosrgPy3CRIIlUzcgoxVC9LI35tjPhU4VHlkXsby8lXqDi9oi19ZFd+IcIKbGxsNWuhN6wS6XjjPlWhUOjbqj7gLRUVe+tfUxaBC1nc6Ay9iL4gAvCzSt0DZZyHCUD9w==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DB8PR07MB6297.eurprd07.prod.outlook.com (2603:10a6:10:140::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 17:39:13 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 17:39:13 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] Remove SPDX 2.2 support
Thread-Topic: [OE-core][PATCH] Remove SPDX 2.2 support
Thread-Index: AQHcvHsoHsFrOFKv8EG2PMyWcgXBV7W/gtqO
Date: Wed, 25 Mar 2026 17:39:13 +0000
Message-ID: 
 <PA3PR07MB10721C5BB6F5C7F61B6E3D24B8A49A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260325171631.1048346-1-JPEWhacker@gmail.com>
In-Reply-To: <20260325171631.1048346-1-JPEWhacker@gmail.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DB8PR07MB6297:EE_
x-ms-office365-filtering-correlation-id: 26c7b285-26a6-4662-e342-08de8a956e45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700021|13003099007|56012099003|22082099003|18002099003|8096899003;
x-microsoft-antispam-message-info: 
 GCBPwNjhZ87mP35aU/7Jty9hdnQelrhI8yETgsykEofldu+Vc1g8Ufo08/Rn0DXgsuxcbw5Wv2Z0coaX9kPS9o4SmyQl+yALGCVGs3nSJsP2A/i9MagF/ZGV7ezgEQMn1ifII/4B5GP3RnLx02gBK9mSz5dA/YVGx9fTlhit0tYk5jFXehLPJphEyqekuGJKgPwizvu2cvCphKtCJjOi64OipjKa/UYBG/y/qeS3JY8IVHfYonDbk2MlV8p1V5QGtCdirYJm6jxJLxHtoXWKV3TwQQHAqoYfc6IOCJD9o/tVR1BnVb/oJMB5i1UAfg/U5hVlT7tp4UcGZb/B0AK0V7PKElJUhJXrJjPX/MHktcHKNFH/8+tFeL525f0iHeNxngWF4OwBAu8orMyvYHJGYRqiKmMSc1PAsIcz5eejBhwiwUd1vTpeVFFM3FAZYs2lGM8t+Pj0kgK2jjAohzDFvS7okxoPMIK+05wpoaEmbJ2kq5zjbr5vGh+9HBVsU2bz68OgF8ULXGQBucqJVKZ/8ImQFuKU3FYkF596SJJCP21gXXBQY5WDhrHb1XWGHbvtHpTKLngtworfu+sciu/yowdbaRV9XVCmVxzzMJY5yv6AVyuQekXArQNRc2/uUHZ+ox4DJF24n0TOaPpvJuFX80Sl1n90YoJ1N1SjTTAQ4lZ48SxnLhM+XT9uZPzPIS/v2EMuVPu/OQBgyVEYveBLBLUx1L8eF3UKU4tSKAz67Chh3qlcGskyFA/JFOLhyHCdcfiLYlGMMtc9DYfpHuJYMGERj/NCRlhHe+t7t5oKUSw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021)(13003099007)(56012099003)(22082099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ttqalgHhJoWg+rme9Te+uARjNGvONJ8lbIU41SN+ol84RGdGUubtfNfnl7n/?=
 =?us-ascii?Q?JsshbGOfD4O06Ol81pSqpmdZCEp0XSwLF/FlCeOTgcUIZnHMPvCQaiU+MebF?=
 =?us-ascii?Q?lxrm2RTLZVbuVVZWUPcjZOq4LMk2DNwmv2IgcCVaSwlJE3sF5GkyniOKARd5?=
 =?us-ascii?Q?1E3z2Z4RHePgO1kmDuSd44l36tzlcRWb1QmzACAofUEFbXwxg2Ev0TyTGEan?=
 =?us-ascii?Q?M93YUNy/cEWS7q9C1eD1fTiuTXmsaa0q2YzWXTJ8uAjL+7F9c3bB8aaD0uzP?=
 =?us-ascii?Q?EoBpFTuw+0bQura5PpKQ2TfFIoO1NNtsc1WCsf10Ndqo0S+x6dE1PZMEa4wa?=
 =?us-ascii?Q?QM4VWCGaruH+ej02eiKmoTnDGm9BR2xSoyoJakXcDc0u6wcdqTEMLYxr/LCE?=
 =?us-ascii?Q?09Sqi9nVTwg51PUVx/BW1CV8+EwhimMtWunO1oYUy7vdYM5vj4pOEcvAnWlW?=
 =?us-ascii?Q?w6kwuIuRyQVVihcb55vc/ZCjCQyEy9YJAOxrIJF1QPzK2ESCy2TNxPemMjkv?=
 =?us-ascii?Q?zMcmKgMZOopeIiGpMXGfCfN6HhKowqmDaadz9O0PIC5w0/bkZg0unTi9q8IK?=
 =?us-ascii?Q?L1VFHtgQ22tdLKrW/56yvwSydeaI+k4PiK0fPXafw0Ah2oTmw4BbSoEuKAmY?=
 =?us-ascii?Q?IR7cqbO0vFP35vOELIB0WB14cLdz3amTBVq+IvfJzEBaMEzj8caO7yXWqyKZ?=
 =?us-ascii?Q?UFLOkm1TC3gp/Y5yGV3Eezs5XIzPZZ0PSrQ0PIx/VerVTJ1NDhvB9Y/X0E5Z?=
 =?us-ascii?Q?IDBp+52NQ7rvdWxxUXNvaUcrLCGwWPHFd7dd3NF+q890Omd//5GT9TqbP0Jo?=
 =?us-ascii?Q?EVmJW+8FgK2Q8tYMnn+xAc/aUpFEkP26xQJNie1e8pTw+08WjjtV7kAw5xF7?=
 =?us-ascii?Q?VqpgrzFYiTT5DlwU9+0rCYeSSlpT5pR/Q6NlEJJ7FxqZdeN3MYHnU4tI4SxF?=
 =?us-ascii?Q?986twY3s/1frQlnxswTSArh1wkpbRORpKXi/n4w5mJgXhNRpXEYEBr3krzgv?=
 =?us-ascii?Q?5gkrWNkMmuRKvZvRqAOgkEcN09Anb8WyywrXgS6NTBtaFDKUSX5cHiADJUIV?=
 =?us-ascii?Q?f0Xuo2mUpxdIjgwCIMN3cMIea0Q+RV0jT2D06P162oEzV71klX6aOZ7dese+?=
 =?us-ascii?Q?2y0yNuHvs91HsqZCXw409crqcmE4w315MtCW6OlE2kPFWuObiD13+eFJncCb?=
 =?us-ascii?Q?TMai4mtFfzBsvvIsKTw4RLRh3CGfsmPK6AZ7ArQNhPytJEY8raxNaRAOKyEm?=
 =?us-ascii?Q?P/n600FS1KOrpJrnKbg9/14gELBjbI7UCdnBPsB2xJjL4QNCq83iqMT2x9jM?=
 =?us-ascii?Q?b3V3suzoP9ribOF0+If7Mtf1uj3kyui69tLU5yqWbo2gR+ZpuT/TFRfrK/CF?=
 =?us-ascii?Q?43x+sulm82Fae4MJ6aDYYVT0w7wshbPPbEkJeSogz0V5t8ULqv1hOFWZOW3g?=
 =?us-ascii?Q?C+BsaiP7mUJXk7flE+MIgohQfLt+UwkH/au45plFB7W+XQfvAtR6Qbh38VWe?=
 =?us-ascii?Q?VkbBmGgo+ZfRjmRYxQybpZrAuA4B2YmtrSVnddMDwjwVuyqrfkQpZHCfxNMP?=
 =?us-ascii?Q?vCnAO9yK3Vm72U1cGkVAl04r62Jn4fP5kJRu0fSvULLvw8zjJSF5Yz2BhvLw?=
 =?us-ascii?Q?J4yzKOKsIQ0IZUCVcOl5toZyGOVdabt2dVNQufrsRygzS1TVzOuClhUaEmNV?=
 =?us-ascii?Q?ltq3roaFzWd18r0xImQy7MGVhlbUAOxmOocrMlNCN26ifQIgyv3e5/bIxoFJ?=
 =?us-ascii?Q?REjjCDh8Y4UFTQZsoloENcrSZvcQAC+dc9HjXHeGGMf2TUoQPRxGm9dTLv+N?=
x-ms-exchange-antispam-messagedata-1: 
 7UYv93Up5LLA8L830h02oQsc3i3khgTw6cyeUReippfUyOy+/r0nPeKO
Content-Type: multipart/alternative;
	boundary="_000_PA3PR07MB10721C5BB6F5C7F61B6E3D24B8A49APA3PR07MB10721eu_"
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c7b285-26a6-4662-e342-08de8a956e45
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 17:39:13.7908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rbuvwlRtTzJelWtuFCCX8F9UAs9wAAk8CidF9cBL1nKKXXU9oVD6uwhoyUVHK3khyO8O9AXhv2aQZSA8D/gyW7ZHDRv9QSELqs6hJK00R80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR07MB6297
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 17:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233933

--_000_PA3PR07MB10721C5BB6F5C7F61B6E3D24B8A49APA3PR07MB10721eu_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Should I send my conversion script to oe-core as alternative or we keep it =
outside?

Best regards,

Daniel
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Joshua Watt via lists.openembedded.org <JPEWhac=
ker=3Dgmail.com@lists.openembedded.org>
Sent: Wednesday, March 25, 2026 6:16 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] Remove SPDX 2.2 support

Removes SPDX 2.2 support in favor of SPDX 3 support being the only
option. The SPDX 3 data is far superior to SPDX 2.2 and thus more useful
for SBoM uses cases.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 990 ---------------------------
 meta/lib/oe/sbom.py                  | 120 ----
 meta/lib/oe/spdx.py                  | 357 ----------
 meta/lib/oeqa/selftest/cases/spdx.py |  63 +-
 4 files changed, 1 insertion(+), 1529 deletions(-)
 delete mode 100644 meta/classes/create-spdx-2.2.bbclass
 delete mode 100644 meta/lib/oe/sbom.py
 delete mode 100644 meta/lib/oe/spdx.py

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass
deleted file mode 100644
index 1c43156559..0000000000
--- a/meta/classes/create-spdx-2.2.bbclass
+++ /dev/null
@@ -1,990 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-
-inherit spdx-common
-
-SPDX_VERSION =3D "2.2"
-
-SPDX_ORG ??=3D "OpenEmbedded ()"
-SPDX_SUPPLIER ??=3D "Organization: ${SPDX_ORG}"
-SPDX_SUPPLIER[doc] =3D "The SPDX PackageSupplier field for SPDX packages c=
reated from \
-    this recipe. For SPDX documents create using this class during the bui=
ld, this \
-    is the contact information for the person or organization who is doing=
 the \
-    build."
-
-SPDX_ARCHIVE_SOURCES ??=3D "0"
-SPDX_ARCHIVE_PACKAGED ??=3D "0"
-
-def get_namespace(d, name):
-    import uuid
-    namespace_uuid =3D uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_=
NAMESPACE"))
-    return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), name, str(uuid=
.uuid5(namespace_uuid, name)))
-
-SPDX_PACKAGE_VERSION ??=3D "${PV}"
-SPDX_PACKAGE_VERSION[doc] =3D "The version of a package, versionInfo in re=
cipe, package and image"
-
-def create_annotation(d, comment):
-    from datetime import datetime, timezone
-
-    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%dT%=
H:%M:%SZ")
-    annotation =3D oe.spdx.SPDXAnnotation()
-    annotation.annotationDate =3D creation_time
-    annotation.annotationType =3D "OTHER"
-    annotation.annotator =3D "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME")=
, d.getVar("SPDX_TOOL_VERSION"))
-    annotation.comment =3D comment
-    return annotation
-
-def recipe_spdx_is_native(d, recipe):
-    return any(a.annotationType =3D=3D "OTHER" and
-      a.annotator =3D=3D "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.=
getVar("SPDX_TOOL_VERSION")) and
-      a.comment =3D=3D "isNative" for a in recipe.annotations)
-
-def get_json_indent(d):
-    if d.getVar("SPDX_PRETTY") =3D=3D "1":
-        return 2
-    return None
-
-
-def convert_license_to_spdx(lic, license_data, document, d, existing=3D{})=
:
-    from pathlib import Path
-    import oe.spdx
-
-    extracted =3D {}
-
-    def add_extracted_license(ident, name):
-        nonlocal document
-
-        if name in extracted:
-            return
-
-        extracted_info =3D oe.spdx.SPDXExtractedLicensingInfo()
-        extracted_info.name =3D name
-        extracted_info.licenseId =3D ident
-        extracted_info.extractedText =3D None
-
-        if name =3D=3D "PD":
-            # Special-case this.
-            extracted_info.extractedText =3D "Software released to the pub=
lic domain"
-        else:
-            # Seach for the license in COMMON_LICENSE_DIR and LICENSE_PATH
-            for directory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVar(=
'LICENSE_PATH') or '').split():
-                try:
-                    with (Path(directory) / name).open(errors=3D"replace")=
 as f:
-                        extracted_info.extractedText =3D f.read()
-                        break
-                except FileNotFoundError:
-                    pass
-            if extracted_info.extractedText is None:
-                # If it's not SPDX or PD, then NO_GENERIC_LICENSE must be =
set
-                entry =3D d.getVarFlag('NO_GENERIC_LICENSE', name).split('=
;')
-                filename =3D entry[0]
-                params =3D {i.split('=3D')[0]: i.split('=3D')[1] for i in =
entry[1:] if '=3D' in i}
-                beginline =3D int(params.get('beginline', 1))
-                endline =3D params.get('endline', None)
-                if endline:
-                    endline =3D int(endline)
-                if filename:
-                    filename =3D d.expand("${S}/" + filename)
-                    with open(filename, errors=3D"replace") as f:
-                        extracted_info.extractedText =3D "".join(line for =
idx, line in enumerate(f, 1) if beginline <=3D idx and idx <=3D (endline or=
 idx))
-                else:
-                    bb.fatal("Cannot find any text for license %s" % name)
-
-        extracted[name] =3D extracted_info
-        document.hasExtractedLicensingInfos.append(extracted_info)
-
-    def convert(l):
-        if l =3D=3D "(" or l =3D=3D ")":
-            return l
-
-        if l =3D=3D "&":
-            return "AND"
-
-        if l =3D=3D "|":
-            return "OR"
-
-        if l =3D=3D "CLOSED":
-            return "NONE"
-
-        spdx_license =3D d.getVarFlag("SPDXLICENSEMAP", l) or l
-        if spdx_license in license_data["licenses"]:
-            return spdx_license
-
-        try:
-            spdx_license =3D existing[l]
-        except KeyError:
-            spdx_license =3D "LicenseRef-" + l
-            add_extracted_license(spdx_license, l)
-
-        return spdx_license
-
-    lic_split =3D lic.replace("(", " ( ").replace(")", " ) ").replace("|",=
 " | ").replace("&", " & ").split()
-
-    return ' '.join(convert(l) for l in lic_split)
-
-def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, =
archive=3DNone, ignore_dirs=3D[], ignore_top_level_dirs=3D[]):
-    from pathlib import Path
-    import oe.spdx
-    import oe.spdx_common
-    import hashlib
-
-    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
-    if source_date_epoch:
-        source_date_epoch =3D int(source_date_epoch)
-
-    sha1s =3D []
-    spdx_files =3D []
-
-    file_counter =3D 1
-
-    check_compiled_sources =3D d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =
=3D=3D "1"
-    if check_compiled_sources:
-        compiled_sources, types =3D oe.spdx_common.get_compiled_sources(d)
-        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
-    for subdir, dirs, files in os.walk(topdir):
-        dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
-        if subdir =3D=3D str(topdir):
-            dirs[:] =3D [d for d in dirs if d not in ignore_top_level_dirs=
]
-
-        for file in files:
-            filepath =3D Path(subdir) / file
-            filename =3D str(filepath.relative_to(topdir))
-
-            if not filepath.is_symlink() and filepath.is_file():
-                # Check if file is compiled
-                if check_compiled_sources:
-                     if not oe.spdx_common.is_compiled_source(filename, co=
mpiled_sources, types):
-                          continue
-                spdx_file =3D oe.spdx.SPDXFile()
-                spdx_file.SPDXID =3D get_spdxid(file_counter)
-                for t in get_types(filepath):
-                    spdx_file.fileTypes.append(t)
-                spdx_file.fileName =3D filename
-
-                if archive is not None:
-                    with filepath.open("rb") as f:
-                        info =3D archive.gettarinfo(fileobj=3Df)
-                        info.name =3D filename
-                        info.uid =3D 0
-                        info.gid =3D 0
-                        info.uname =3D "root"
-                        info.gname =3D "root"
-
-                        if source_date_epoch is not None and info.mtime > =
source_date_epoch:
-                            info.mtime =3D source_date_epoch
-
-                        archive.addfile(info, f)
-
-                sha1 =3D bb.utils.sha1_file(filepath)
-                sha1s.append(sha1)
-                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
-                        algorithm=3D"SHA1",
-                        checksumValue=3Dsha1,
-                    ))
-                spdx_file.checksums.append(oe.spdx.SPDXChecksum(
-                        algorithm=3D"SHA256",
-                        checksumValue=3Dbb.utils.sha256_file(filepath),
-                    ))
-
-                if "SOURCE" in spdx_file.fileTypes:
-                    extracted_lics =3D oe.spdx_common.extract_licenses(fil=
epath)
-                    if extracted_lics:
-                        spdx_file.licenseInfoInFiles =3D extracted_lics
-
-                doc.files.append(spdx_file)
-                doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
-                spdx_pkg.hasFiles.append(spdx_file.SPDXID)
-
-                spdx_files.append(spdx_file)
-
-                file_counter +=3D 1
-
-    sha1s.sort()
-    verifier =3D hashlib.sha1()
-    for v in sha1s:
-        verifier.update(v.encode("utf-8"))
-    spdx_pkg.packageVerificationCode.packageVerificationCodeValue =3D veri=
fier.hexdigest()
-
-    return spdx_files
-
-
-def add_package_sources_from_debug(d, package_doc, spdx_package, package, =
package_files, sources):
-    from pathlib import Path
-    import hashlib
-    import oe.packagedata
-    import oe.spdx
-
-    debug_search_paths =3D [
-        Path(d.getVar('PKGD')),
-        Path(d.getVar('STAGING_DIR_TARGET')),
-        Path(d.getVar('STAGING_DIR_NATIVE')),
-        Path(d.getVar('STAGING_KERNEL_DIR')),
-    ]
-
-    pkg_data =3D oe.packagedata.read_subpkgdata_extended(package, d)
-
-    if pkg_data is None:
-        return
-
-    for file_path, file_data in pkg_data["files_info"].items():
-        if not "debugsrc" in file_data:
-            continue
-
-        for pkg_file in package_files:
-            if file_path.lstrip("/") =3D=3D pkg_file.fileName.lstrip("/"):
-                break
-        else:
-            bb.fatal("No package file found for %s in %s; SPDX found: %s" =
% (str(file_path), package,
-                " ".join(p.fileName for p in package_files)))
-            continue
-
-        for debugsrc in file_data["debugsrc"]:
-            ref_id =3D "NOASSERTION"
-            for search in debug_search_paths:
-                if debugsrc.startswith("/usr/src/kernel"):
-                    debugsrc_path =3D search / debugsrc.replace('/usr/src/=
kernel/', '')
-                else:
-                    debugsrc_path =3D search / debugsrc.lstrip("/")
-                # We can only hash files below, skip directories, links, e=
tc.
-                if not os.path.isfile(debugsrc_path):
-                    continue
-
-                file_sha256 =3D bb.utils.sha256_file(debugsrc_path)
-
-                if file_sha256 in sources:
-                    source_file =3D sources[file_sha256]
-
-                    doc_ref =3D package_doc.find_external_document_ref(sou=
rce_file.doc.documentNamespace)
-                    if doc_ref is None:
-                        doc_ref =3D oe.spdx.SPDXExternalDocumentRef()
-                        doc_ref.externalDocumentId =3D "DocumentRef-depend=
ency-" + source_file.doc.name
-                        doc_ref.spdxDocument =3D source_file.doc.documentN=
amespace
-                        doc_ref.checksum.algorithm =3D "SHA1"
-                        doc_ref.checksum.checksumValue =3D source_file.doc=
_sha1
-                        package_doc.externalDocumentRefs.append(doc_ref)
-
-                    ref_id =3D "%s:%s" % (doc_ref.externalDocumentId, sour=
ce_file.file.SPDXID)
-                else:
-                    bb.debug(1, "Debug source %s with SHA256 %s not found =
in any dependency" % (str(debugsrc_path), file_sha256))
-                break
-            else:
-                bb.debug(1, "Debug source %s not found" % debugsrc)
-
-            package_doc.add_relationship(pkg_file, "GENERATED_FROM", ref_i=
d, comment=3Ddebugsrc)
-
-add_package_sources_from_debug[vardepsexclude] +=3D "STAGING_KERNEL_DIR"
-
-def collect_dep_recipes(d, doc, spdx_recipe, direct_deps):
-    import json
-    from pathlib import Path
-    import oe.sbom
-    import oe.spdx
-    import oe.spdx_common
-
-    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
-    package_archs =3D d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
-    package_archs.reverse()
-
-    dep_recipes =3D []
-
-    for dep in direct_deps:
-        # If this dependency is not calculated in the taskhash skip it.
-        # Otherwise, it can result in broken links since this task won't
-        # rebuild and see the new SPDX ID if the dependency changes
-        if not dep.in_taskhash:
-            continue
-
-        dep_recipe_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, pa=
ckage_archs, "recipe-" + dep.pn, dep.hashfn)
-        if not dep_recipe_path:
-            bb.fatal("Cannot find any SPDX file for recipe %s, %s" % (dep.=
pn, dep.hashfn))
-
-        spdx_dep_doc, spdx_dep_sha1 =3D oe.sbom.read_doc(dep_recipe_path)
-
-        for pkg in spdx_dep_doc.packages:
-            if pkg.name =3D=3D dep.pn:
-                spdx_dep_recipe =3D pkg
-                break
-        else:
-            continue
-
-        dep_recipes.append(oe.sbom.DepRecipe(spdx_dep_doc, spdx_dep_sha1, =
spdx_dep_recipe))
-
-        dep_recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
-        dep_recipe_ref.externalDocumentId =3D "DocumentRef-dependency-" + =
spdx_dep_doc.name
-        dep_recipe_ref.spdxDocument =3D spdx_dep_doc.documentNamespace
-        dep_recipe_ref.checksum.algorithm =3D "SHA1"
-        dep_recipe_ref.checksum.checksumValue =3D spdx_dep_sha1
-
-        doc.externalDocumentRefs.append(dep_recipe_ref)
-
-        doc.add_relationship(
-            "%s:%s" % (dep_recipe_ref.externalDocumentId, spdx_dep_recipe.=
SPDXID),
-            "BUILD_DEPENDENCY_OF",
-            spdx_recipe
-        )
-
-    return dep_recipes
-
-collect_dep_recipes[vardepsexclude] =3D "SPDX_MULTILIB_SSTATE_ARCHS"
-
-def collect_dep_sources(d, dep_recipes):
-    import oe.sbom
-
-    sources =3D {}
-    for dep in dep_recipes:
-        # Don't collect sources from native recipes as they
-        # match non-native sources also.
-        if recipe_spdx_is_native(d, dep.recipe):
-            continue
-        recipe_files =3D set(dep.recipe.hasFiles)
-
-        for spdx_file in dep.doc.files:
-            if spdx_file.SPDXID not in recipe_files:
-                continue
-
-            if "SOURCE" in spdx_file.fileTypes:
-                for checksum in spdx_file.checksums:
-                    if checksum.algorithm =3D=3D "SHA256":
-                        sources[checksum.checksumValue] =3D oe.sbom.DepSou=
rce(dep.doc, dep.doc_sha1, dep.recipe, spdx_file)
-                        break
-
-    return sources
-
-def add_download_packages(d, doc, recipe):
-    import os.path
-    from bb.fetch2 import decodeurl, CHECKSUM_LIST
-    import bb.process
-    import oe.spdx
-    import oe.sbom
-
-    for download_idx, src_uri in enumerate(d.getVar('SRC_URI').split()):
-        f =3D bb.fetch2.FetchData(src_uri, d)
-
-        package =3D oe.spdx.SPDXPackage()
-        package.name =3D "%s-source-%d" % (d.getVar("PN"), download_idx + =
1)
-        package.SPDXID =3D oe.sbom.get_download_spdxid(d, download_idx + 1=
)
-
-        if f.type =3D=3D "file":
-            continue
-
-        if f.method.supports_checksum(f):
-            for checksum_id in CHECKSUM_LIST:
-                if checksum_id.upper() not in oe.spdx.SPDXPackage.ALLOWED_=
CHECKSUMS:
-                    continue
-
-                expected_checksum =3D getattr(f, "%s_expected" % checksum_=
id)
-                if expected_checksum is None:
-                    continue
-
-                c =3D oe.spdx.SPDXChecksum()
-                c.algorithm =3D checksum_id.upper()
-                c.checksumValue =3D expected_checksum
-                package.checksums.append(c)
-
-        package.downloadLocation =3D oe.spdx_common.fetch_data_to_uri(f, f=
.name)
-        doc.packages.append(package)
-        doc.add_relationship(doc, "DESCRIBES", package)
-        # In the future, we might be able to do more fancy dependencies,
-        # but this should be sufficient for now
-        doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
-
-def get_license_list_version(license_data, d):
-    # Newer versions of the SPDX license list are SemVer ("MAJOR.MINOR.MIC=
RO"),
-    # but SPDX 2 only uses "MAJOR.MINOR".
-    return ".".join(license_data["licenseListVersion"].split(".")[:2])
-
-
-# This task is added for compatibility with tasks shared with SPDX 3, but
-# doesn't do anything
-do_create_recipe_spdx() {
-    :
-}
-do_create_recipe_spdx[noexec] =3D "1"
-addtask do_create_recipe_spdx
-
-
-python do_create_spdx() {
-    from datetime import datetime, timezone
-    import oe.sbom
-    import oe.spdx
-    import oe.spdx_common
-    import uuid
-    from pathlib import Path
-    from contextlib import contextmanager
-    import oe.cve_check
-
-    license_data =3D oe.spdx_common.load_spdx_license_data(d)
-
-    @contextmanager
-    def optional_tarfile(name, guard, mode=3D"w"):
-        import tarfile
-        import bb.compress.zstd
-
-        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
-
-        if guard:
-            name.parent.mkdir(parents=3DTrue, exist_ok=3DTrue)
-            with bb.compress.zstd.open(name, mode=3Dmode + "b", num_thread=
s=3Dnum_threads) as f:
-                with tarfile.open(fileobj=3Df, mode=3Dmode + "|") as tf:
-                    yield tf
-        else:
-            yield None
-
-
-    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
-    spdx_workdir =3D Path(d.getVar("SPDXWORK"))
-    include_sources =3D d.getVar("SPDX_INCLUDE_SOURCES") =3D=3D "1"
-    archive_sources =3D d.getVar("SPDX_ARCHIVE_SOURCES") =3D=3D "1"
-    archive_packaged =3D d.getVar("SPDX_ARCHIVE_PACKAGED") =3D=3D "1"
-    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
-
-    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%dT%=
H:%M:%SZ")
-
-    doc =3D oe.spdx.SPDXDocument()
-
-    doc.name =3D "recipe-" + d.getVar("PN")
-    doc.documentNamespace =3D get_namespace(d, doc.name)
-    doc.creationInfo.created =3D creation_time
-    doc.creationInfo.comment =3D "This document was created by analyzing r=
ecipe files during the build."
-    doc.creationInfo.licenseListVersion =3D get_license_list_version(licen=
se_data, d)
-    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.=
bbclass")
-    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_O=
RG"))
-    doc.creationInfo.creators.append("Person: N/A ()")
-
-    recipe =3D oe.spdx.SPDXPackage()
-    recipe.name =3D d.getVar("PN")
-    recipe.versionInfo =3D d.getVar("SPDX_PACKAGE_VERSION")
-    recipe.SPDXID =3D oe.sbom.get_recipe_spdxid(d)
-    recipe.supplier =3D d.getVar("SPDX_SUPPLIER")
-    if bb.data.inherits_class("native", d) or bb.data.inherits_class("cros=
s", d):
-        recipe.annotations.append(create_annotation(d, "isNative"))
-
-    homepage =3D d.getVar("HOMEPAGE")
-    if homepage:
-        recipe.homepage =3D homepage
-
-    license =3D d.getVar("LICENSE")
-    if license:
-        recipe.licenseDeclared =3D convert_license_to_spdx(license, licens=
e_data, doc, d)
-
-    summary =3D d.getVar("SUMMARY")
-    if summary:
-        recipe.summary =3D summary
-
-    description =3D d.getVar("DESCRIPTION")
-    if description:
-        recipe.description =3D description
-
-    if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
-        for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
-            recipe.annotations.append(create_annotation(d, var + "=3D" + d=
.getVar(var)))
-
-    # Some CVEs may be patched during the build process without incrementi=
ng the version number,
-    # so querying for CVEs based on the CPE id can lead to false positives=
. To account for this,
-    # save the CVEs fixed by patches to source information field in the SP=
DX.
-    patched_cves =3D oe.cve_check.get_patched_cves(d)
-    patched_cves =3D list(patched_cves)
-
-    ignored_cves =3D d.getVar("CVE_CHECK_IGNORE")
-    if ignored_cves:
-        patched_cves.extend(ignored_cves.split())
-
-    patched_cves =3D ' '.join(patched_cves)
-    if patched_cves:
-        recipe.sourceInfo =3D "CVEs fixed: " + patched_cves
-
-    cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar=
("CVE_VERSION"))
-    if cpe_ids:
-        for cpe_id in cpe_ids:
-            cpe =3D oe.spdx.SPDXExternalReference()
-            cpe.referenceCategory =3D "SECURITY"
-            cpe.referenceType =3D "cpe23Type"
-            cpe.referenceLocator =3D cpe_id
-            recipe.externalRefs.append(cpe)
-
-    doc.packages.append(recipe)
-    doc.add_relationship(doc, "DESCRIBES", recipe)
-
-    add_download_packages(d, doc, recipe)
-
-    if oe.spdx_common.process_sources(d) and include_sources:
-        recipe_archive =3D deploy_dir_spdx / "recipes" / (doc.name + ".tar=
.zst")
-        with optional_tarfile(recipe_archive, archive_sources) as archive:
-            oe.spdx_common.get_patched_src(d)
-
-            add_package_files(
-                d,
-                doc,
-                recipe,
-                spdx_workdir,
-                lambda file_counter: "SPDXRef-SourceFile-%s-%d" % (d.getVa=
r("PN"), file_counter),
-                lambda filepath: ["SOURCE"],
-                ignore_dirs=3D[".git"],
-                ignore_top_level_dirs=3D["temp"],
-                archive=3Darchive,
-            )
-
-            if archive is not None:
-                recipe.packageFileName =3D str(recipe_archive.name)
-
-    direct_deps =3D oe.spdx_common.collect_direct_deps(d, "do_create_spdx"=
)
-    dep_recipes =3D collect_dep_recipes(d, doc, recipe, direct_deps)
-
-    doc_sha1 =3D oe.sbom.write_doc(d, doc, pkg_arch, "recipes", indent=3Dg=
et_json_indent(d))
-    dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
-
-    recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
-    recipe_ref.externalDocumentId =3D "DocumentRef-recipe-" + recipe.name
-    recipe_ref.spdxDocument =3D doc.documentNamespace
-    recipe_ref.checksum.algorithm =3D "SHA1"
-    recipe_ref.checksum.checksumValue =3D doc_sha1
-
-    sources =3D collect_dep_sources(d, dep_recipes)
-    found_licenses =3D {license.name:recipe_ref.externalDocumentId + ":" +=
 license.licenseId for license in doc.hasExtractedLicensingInfos}
-
-    if not recipe_spdx_is_native(d, recipe):
-        bb.build.exec_func("read_subpackage_metadata", d)
-
-        pkgdest =3D Path(d.getVar("PKGDEST"))
-        for package in d.getVar("PACKAGES").split():
-            if not oe.packagedata.packaged(package, d):
-                continue
-
-            package_doc =3D oe.spdx.SPDXDocument()
-            pkg_name =3D d.getVar("PKG:%s" % package) or package
-            package_doc.name =3D pkg_name
-            package_doc.documentNamespace =3D get_namespace(d, package_doc=
.name)
-            package_doc.creationInfo.created =3D creation_time
-            package_doc.creationInfo.comment =3D "This document was create=
d by analyzing packages created during the build."
-            package_doc.creationInfo.licenseListVersion =3D get_license_li=
st_version(license_data, d)
-            package_doc.creationInfo.creators.append("Tool: OpenEmbedded C=
ore create-spdx.bbclass")
-            package_doc.creationInfo.creators.append("Organization: %s" % =
d.getVar("SPDX_ORG"))
-            package_doc.creationInfo.creators.append("Person: N/A ()")
-            package_doc.externalDocumentRefs.append(recipe_ref)
-
-            package_license =3D d.getVar("LICENSE:%s" % package) or d.getV=
ar("LICENSE")
-
-            spdx_package =3D oe.spdx.SPDXPackage()
-
-            spdx_package.SPDXID =3D oe.sbom.get_package_spdxid(pkg_name)
-            spdx_package.name =3D pkg_name
-            spdx_package.versionInfo =3D d.getVar("SPDX_PACKAGE_VERSION")
-            spdx_package.licenseDeclared =3D convert_license_to_spdx(packa=
ge_license, license_data, package_doc, d, found_licenses)
-            spdx_package.supplier =3D d.getVar("SPDX_SUPPLIER")
-
-            package_doc.packages.append(spdx_package)
-
-            package_doc.add_relationship(spdx_package, "GENERATED_FROM", "=
%s:%s" % (recipe_ref.externalDocumentId, recipe.SPDXID))
-            package_doc.add_relationship(package_doc, "DESCRIBES", spdx_pa=
ckage)
-
-            package_archive =3D deploy_dir_spdx / "packages" / (package_do=
c.name + ".tar.zst")
-            with optional_tarfile(package_archive, archive_packaged) as ar=
chive:
-                package_files =3D add_package_files(
-                    d,
-                    package_doc,
-                    spdx_package,
-                    pkgdest / package,
-                    lambda file_counter: oe.sbom.get_packaged_file_spdxid(=
pkg_name, file_counter),
-                    lambda filepath: ["BINARY"],
-                    ignore_top_level_dirs=3D['CONTROL', 'DEBIAN'],
-                    archive=3Darchive,
-                )
-
-                if archive is not None:
-                    spdx_package.packageFileName =3D str(package_archive.n=
ame)
-
-            add_package_sources_from_debug(d, package_doc, spdx_package, p=
ackage, package_files, sources)
-
-            oe.sbom.write_doc(d, package_doc, pkg_arch, "packages", indent=
=3Dget_json_indent(d))
-}
-do_create_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS"
-# NOTE: depending on do_unpack is a hack that is necessary to get it's dep=
endencies for archive the source
-addtask do_create_spdx after do_create_recipe_spdx do_package do_packageda=
ta do_unpack do_patch before do_populate_sdk do_build do_rm_work
-
-SSTATETASKS +=3D "do_create_spdx"
-do_create_spdx[sstate-inputdirs] =3D "${SPDXDEPLOY}"
-do_create_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
-
-python do_create_spdx_setscene () {
-    sstate_setscene(d)
-}
-addtask do_create_spdx_setscene
-
-do_create_spdx[deptask] +=3D "do_create_spdx"
-do_create_spdx[dirs] =3D "${SPDXWORK}"
-do_create_spdx[cleandirs] =3D "${SPDXDEPLOY} ${SPDXWORK}"
-do_create_spdx[depends] +=3D " \
-    ${PATCHDEPENDENCY} \
-    ${@create_spdx_source_deps(d)} \
-"
-
-python do_create_runtime_spdx() {
-    from datetime import datetime, timezone
-    import oe.sbom
-    import oe.spdx
-    import oe.spdx_common
-    import oe.packagedata
-    from pathlib import Path
-
-    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
-    spdx_deploy =3D Path(d.getVar("SPDXRUNTIMEDEPLOY"))
-    is_native =3D bb.data.inherits_class("native", d) or bb.data.inherits_=
class("cross", d)
-
-    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%dT%=
H:%M:%SZ")
-
-    license_data =3D oe.spdx_common.load_spdx_license_data(d)
-
-    direct_deps =3D oe.spdx_common.collect_direct_deps(d, "do_create_spdx"=
)
-
-    providers =3D oe.spdx_common.collect_package_providers(d, direct_deps)
-    pkg_arch =3D d.getVar("SSTATE_PKGARCH")
-    package_archs =3D d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
-    package_archs.reverse()
-
-    if not is_native:
-        bb.build.exec_func("read_subpackage_metadata", d)
-
-        dep_package_cache =3D {}
-
-        pkgdest =3D Path(d.getVar("PKGDEST"))
-        for package in d.getVar("PACKAGES").split():
-            localdata =3D bb.data.createCopy(d)
-            pkg_name =3D d.getVar("PKG:%s" % package) or package
-            localdata.setVar("PKG", pkg_name)
-            localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + "=
:" + package)
-
-            if not oe.packagedata.packaged(package, localdata):
-                continue
-
-            pkg_spdx_path =3D oe.sbom.doc_path(deploy_dir_spdx, pkg_name, =
pkg_arch, "packages")
-
-            package_doc, package_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_pa=
th)
-
-            for p in package_doc.packages:
-                if p.name =3D=3D pkg_name:
-                    spdx_package =3D p
-                    break
-            else:
-                bb.fatal("Package '%s' not found in %s" % (pkg_name, pkg_s=
pdx_path))
-
-            runtime_doc =3D oe.spdx.SPDXDocument()
-            runtime_doc.name =3D "runtime-" + pkg_name
-            runtime_doc.documentNamespace =3D get_namespace(localdata, run=
time_doc.name)
-            runtime_doc.creationInfo.created =3D creation_time
-            runtime_doc.creationInfo.comment =3D "This document was create=
d by analyzing package runtime dependencies."
-            runtime_doc.creationInfo.licenseListVersion =3D get_license_li=
st_version(license_data, d)
-            runtime_doc.creationInfo.creators.append("Tool: OpenEmbedded C=
ore create-spdx.bbclass")
-            runtime_doc.creationInfo.creators.append("Organization: %s" % =
d.getVar("SPDX_ORG"))
-            runtime_doc.creationInfo.creators.append("Person: N/A ()")
-
-            package_ref =3D oe.spdx.SPDXExternalDocumentRef()
-            package_ref.externalDocumentId =3D "DocumentRef-package-" + pa=
ckage
-            package_ref.spdxDocument =3D package_doc.documentNamespace
-            package_ref.checksum.algorithm =3D "SHA1"
-            package_ref.checksum.checksumValue =3D package_doc_sha1
-
-            runtime_doc.externalDocumentRefs.append(package_ref)
-
-            runtime_doc.add_relationship(
-                runtime_doc.SPDXID,
-                "AMENDS",
-                "%s:%s" % (package_ref.externalDocumentId, package_doc.SPD=
XID)
-            )
-
-            deps =3D bb.utils.explode_dep_versions2(localdata.getVar("RDEP=
ENDS") or "")
-            seen_deps =3D set()
-            for dep, _ in deps.items():
-                if dep in seen_deps:
-                    continue
-
-                if dep not in providers:
-                    continue
-
-                (dep, dep_hashfn) =3D providers[dep]
-
-                if not oe.packagedata.packaged(dep, localdata):
-                    continue
-
-                dep_pkg_data =3D oe.packagedata.read_subpkgdata_dict(dep, =
d)
-                dep_pkg =3D dep_pkg_data["PKG"]
-
-                if dep in dep_package_cache:
-                    (dep_spdx_package, dep_package_ref) =3D dep_package_ca=
che[dep]
-                else:
-                    dep_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spd=
x, package_archs, dep_pkg, dep_hashfn)
-                    if not dep_path:
-                        bb.fatal("No SPDX file found for package %s, %s" %=
 (dep_pkg, dep_hashfn))
-
-                    spdx_dep_doc, spdx_dep_sha1 =3D oe.sbom.read_doc(dep_p=
ath)
-
-                    for pkg in spdx_dep_doc.packages:
-                        if pkg.name =3D=3D dep_pkg:
-                            dep_spdx_package =3D pkg
-                            break
-                    else:
-                        bb.fatal("Package '%s' not found in %s" % (dep_pkg=
, dep_path))
-
-                    dep_package_ref =3D oe.spdx.SPDXExternalDocumentRef()
-                    dep_package_ref.externalDocumentId =3D "DocumentRef-ru=
ntime-dependency-" + spdx_dep_doc.name
-                    dep_package_ref.spdxDocument =3D spdx_dep_doc.document=
Namespace
-                    dep_package_ref.checksum.algorithm =3D "SHA1"
-                    dep_package_ref.checksum.checksumValue =3D spdx_dep_sh=
a1
-
-                    dep_package_cache[dep] =3D (dep_spdx_package, dep_pack=
age_ref)
-
-                runtime_doc.externalDocumentRefs.append(dep_package_ref)
-
-                runtime_doc.add_relationship(
-                    "%s:%s" % (dep_package_ref.externalDocumentId, dep_spd=
x_package.SPDXID),
-                    "RUNTIME_DEPENDENCY_OF",
-                    "%s:%s" % (package_ref.externalDocumentId, spdx_packag=
e.SPDXID)
-                )
-                seen_deps.add(dep)
-
-            oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_de=
ploy, indent=3Dget_json_indent(d))
-}
-
-do_create_runtime_spdx[vardepsexclude] +=3D "OVERRIDES SPDX_MULTILIB_SSTAT=
E_ARCHS"
-
-addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_=
work
-SSTATETASKS +=3D "do_create_runtime_spdx"
-do_create_runtime_spdx[sstate-inputdirs] =3D "${SPDXRUNTIMEDEPLOY}"
-do_create_runtime_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_SPDX}"
-
-python do_create_runtime_spdx_setscene () {
-    sstate_setscene(d)
-}
-addtask do_create_runtime_spdx_setscene
-
-do_create_runtime_spdx[dirs] =3D "${SPDXRUNTIMEDEPLOY}"
-do_create_runtime_spdx[cleandirs] =3D "${SPDXRUNTIMEDEPLOY}"
-do_create_runtime_spdx[deptask] =3D "do_create_spdx"
-do_create_runtime_spdx[rdeptask] =3D "do_create_spdx"
-
-do_rootfs[recrdeptask] +=3D "do_create_spdx do_create_runtime_spdx"
-do_rootfs[cleandirs] +=3D "${SPDXIMAGEWORK}"
-
-ROOTFS_POSTUNINSTALL_COMMAND =3D+ "image_combine_spdx"
-
-do_populate_sdk[recrdeptask] +=3D "do_create_spdx do_create_runtime_spdx"
-do_populate_sdk[cleandirs] +=3D "${SPDXSDKWORK}"
-POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D " sdk_host_com=
bine_spdx"
-POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D " sdk_target=
_combine_spdx"
-
-python image_combine_spdx() {
-    import os
-    import oe.sbom
-    from pathlib import Path
-    from oe.rootfs import image_list_installed_packages
-
-    image_name =3D d.getVar("IMAGE_NAME")
-    image_link_name =3D d.getVar("IMAGE_LINK_NAME")
-    imgdeploydir =3D Path(d.getVar("IMGDEPLOYDIR"))
-    img_spdxid =3D oe.sbom.get_image_spdxid(image_name)
-    packages =3D image_list_installed_packages(d)
-
-    combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages, Path(d=
.getVar("SPDXIMAGEWORK")))
-
-    def make_image_link(target_path, suffix):
-        if image_link_name:
-            link =3D imgdeploydir / (image_link_name + suffix)
-            if link !=3D target_path:
-                link.symlink_to(os.path.relpath(target_path, link.parent))
-
-    spdx_tar_path =3D imgdeploydir / (image_name + ".spdx.tar.zst")
-    make_image_link(spdx_tar_path, ".spdx.tar.zst")
-}
-
-python sdk_host_combine_spdx() {
-    sdk_combine_spdx(d, "host")
-}
-
-python sdk_target_combine_spdx() {
-    sdk_combine_spdx(d, "target")
-}
-
-def sdk_combine_spdx(d, sdk_type):
-    import oe.sbom
-    from pathlib import Path
-    from oe.sdk import sdk_list_installed_packages
-
-    sdk_name =3D d.getVar("TOOLCHAIN_OUTPUTNAME") + "-" + sdk_type
-    sdk_deploydir =3D Path(d.getVar("SDKDEPLOYDIR"))
-    sdk_spdxid =3D oe.sbom.get_sdk_spdxid(sdk_name)
-    sdk_packages =3D sdk_list_installed_packages(d, sdk_type =3D=3D "targe=
t")
-    combine_spdx(d, sdk_name, sdk_deploydir, sdk_spdxid, sdk_packages, Pat=
h(d.getVar('SPDXSDKWORK')))
-
-def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages=
, spdx_workdir):
-    import os
-    import oe.spdx
-    import oe.sbom
-    import oe.spdx_common
-    import io
-    import json
-    from datetime import timezone, datetime
-    from pathlib import Path
-    import tarfile
-    import bb.compress.zstd
-
-    license_data =3D oe.spdx_common.load_spdx_license_data(d)
-
-    direct_deps =3D oe.spdx_common.collect_direct_deps(d, "do_create_spdx"=
)
-
-    providers =3D oe.spdx_common.collect_package_providers(d, direct_deps)
-    package_archs =3D d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
-    package_archs.reverse()
-
-    creation_time =3D datetime.now(tz=3Dtimezone.utc).strftime("%Y-%m-%dT%=
H:%M:%SZ")
-    deploy_dir_spdx =3D Path(d.getVar("DEPLOY_DIR_SPDX"))
-    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
-
-    doc =3D oe.spdx.SPDXDocument()
-    doc.name =3D rootfs_name
-    doc.documentNamespace =3D get_namespace(d, doc.name)
-    doc.creationInfo.created =3D creation_time
-    doc.creationInfo.comment =3D "This document was created by analyzing t=
he source of the Yocto recipe during the build."
-    doc.creationInfo.licenseListVersion =3D get_license_list_version(licen=
se_data, d)
-    doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.=
bbclass")
-    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_O=
RG"))
-    doc.creationInfo.creators.append("Person: N/A ()")
-
-    image =3D oe.spdx.SPDXPackage()
-    image.name =3D d.getVar("PN")
-    image.versionInfo =3D d.getVar("SPDX_PACKAGE_VERSION")
-    image.SPDXID =3D rootfs_spdxid
-    image.supplier =3D d.getVar("SPDX_SUPPLIER")
-
-    doc.packages.append(image)
-
-    if packages:
-        for name in sorted(packages.keys()):
-            if name not in providers:
-                bb.note("Unable to find SPDX provider for '%s'" % name)
-                continue
-
-            pkg_name, pkg_hashfn =3D providers[name]
-
-            pkg_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, =
package_archs, pkg_name, pkg_hashfn)
-            if not pkg_spdx_path:
-                bb.fatal("No SPDX file found for package %s, %s" % (pkg_na=
me, pkg_hashfn))
-
-            pkg_doc, pkg_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_path)
-
-            for p in pkg_doc.packages:
-                if p.name =3D=3D name:
-                    pkg_ref =3D oe.spdx.SPDXExternalDocumentRef()
-                    pkg_ref.externalDocumentId =3D "DocumentRef-%s" % pkg_=
doc.name
-                    pkg_ref.spdxDocument =3D pkg_doc.documentNamespace
-                    pkg_ref.checksum.algorithm =3D "SHA1"
-                    pkg_ref.checksum.checksumValue =3D pkg_doc_sha1
-
-                    doc.externalDocumentRefs.append(pkg_ref)
-                    doc.add_relationship(image, "CONTAINS", "%s:%s" % (pkg=
_ref.externalDocumentId, p.SPDXID))
-                    break
-            else:
-                bb.fatal("Unable to find package with name '%s' in SPDX fi=
le %s" % (name, pkg_spdx_path))
-
-            runtime_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_sp=
dx, package_archs, "runtime-" + name, pkg_hashfn)
-            if not runtime_spdx_path:
-                bb.fatal("No runtime SPDX document found for %s, %s" % (na=
me, pkg_hashfn))
-
-            runtime_doc, runtime_doc_sha1 =3D oe.sbom.read_doc(runtime_spd=
x_path)
-
-            runtime_ref =3D oe.spdx.SPDXExternalDocumentRef()
-            runtime_ref.externalDocumentId =3D "DocumentRef-%s" % runtime_=
doc.name
-            runtime_ref.spdxDocument =3D runtime_doc.documentNamespace
-            runtime_ref.checksum.algorithm =3D "SHA1"
-            runtime_ref.checksum.checksumValue =3D runtime_doc_sha1
-
-            # "OTHER" isn't ideal here, but I can't find a relationship th=
at makes sense
-            doc.externalDocumentRefs.append(runtime_ref)
-            doc.add_relationship(
-                image,
-                "OTHER",
-                "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPD=
XID),
-                comment=3D"Runtime dependencies for %s" % name
-            )
-    bb.utils.mkdirhier(spdx_workdir)
-    image_spdx_path =3D spdx_workdir / (rootfs_name + ".spdx.json")
-
-    with image_spdx_path.open("wb") as f:
-        doc.to_json(f, sort_keys=3DTrue, indent=3Dget_json_indent(d))
-
-    num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
-
-    visited_docs =3D set()
-
-    index =3D {"documents": []}
-
-    spdx_tar_path =3D rootfs_deploydir / (rootfs_name + ".spdx.tar.zst")
-    with bb.compress.zstd.open(spdx_tar_path, "w", num_threads=3Dnum_threa=
ds) as f:
-        with tarfile.open(fileobj=3Df, mode=3D"w|") as tar:
-            def collect_spdx_document(path):
-                nonlocal tar
-                nonlocal deploy_dir_spdx
-                nonlocal source_date_epoch
-                nonlocal index
-
-                if path in visited_docs:
-                    return
-
-                visited_docs.add(path)
-
-                with path.open("rb") as f:
-                    doc, sha1 =3D oe.sbom.read_doc(f)
-                    f.seek(0)
-
-                    if doc.documentNamespace in visited_docs:
-                        return
-
-                    bb.note("Adding SPDX document %s" % path)
-                    visited_docs.add(doc.documentNamespace)
-                    info =3D tar.gettarinfo(fileobj=3Df)
-
-                    info.name =3D doc.name + ".spdx.json"
-                    info.uid =3D 0
-                    info.gid =3D 0
-                    info.uname =3D "root"
-                    info.gname =3D "root"
-
-                    if source_date_epoch is not None and info.mtime > int(=
source_date_epoch):
-                        info.mtime =3D int(source_date_epoch)
-
-                    tar.addfile(info, f)
-
-                    index["documents"].append({
-                        "filename": info.name,
-                        "documentNamespace": doc.documentNamespace,
-                        "sha1": sha1,
-                    })
-
-                for ref in doc.externalDocumentRefs:
-                    ref_path =3D oe.sbom.doc_find_by_namespace(deploy_dir_=
spdx, package_archs, ref.spdxDocument)
-                    if not ref_path:
-                        bb.fatal("Cannot find any SPDX file for document %=
s" % ref.spdxDocument)
-                    collect_spdx_document(ref_path)
-
-            collect_spdx_document(image_spdx_path)
-
-            index["documents"].sort(key=3Dlambda x: x["filename"])
-
-            index_str =3D io.BytesIO(json.dumps(
-                index,
-                sort_keys=3DTrue,
-                indent=3Dget_json_indent(d),
-            ).encode("utf-8"))
-
-            info =3D tarfile.TarInfo()
-            info.name =3D "index.json"
-            info.size =3D len(index_str.getvalue())
-            info.uid =3D 0
-            info.gid =3D 0
-            info.uname =3D "root"
-            info.gname =3D "root"
-
-            tar.addfile(info, fileobj=3Dindex_str)
-
-combine_spdx[vardepsexclude] +=3D "BB_NUMBER_THREADS SPDX_MULTILIB_SSTATE_=
ARCHS"
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
deleted file mode 100644
index fd4b6895d8..0000000000
--- a/meta/lib/oe/sbom.py
+++ /dev/null
@@ -1,120 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-
-import collections
-
-DepRecipe =3D collections.namedtuple("DepRecipe", ("doc", "doc_sha1", "rec=
ipe"))
-DepSource =3D collections.namedtuple("DepSource", ("doc", "doc_sha1", "rec=
ipe", "file"))
-
-
-def get_recipe_spdxid(d):
-    return "SPDXRef-%s-%s" % ("Recipe", d.getVar("PN"))
-
-
-def get_download_spdxid(d, idx):
-    return "SPDXRef-Download-%s-%d" % (d.getVar("PN"), idx)
-
-
-def get_package_spdxid(pkg):
-    return "SPDXRef-Package-%s" % pkg
-
-
-def get_source_file_spdxid(d, idx):
-    return "SPDXRef-SourceFile-%s-%d" % (d.getVar("PN"), idx)
-
-
-def get_packaged_file_spdxid(pkg, idx):
-    return "SPDXRef-PackagedFile-%s-%d" % (pkg, idx)
-
-
-def get_image_spdxid(img):
-    return "SPDXRef-Image-%s" % img
-
-
-def get_sdk_spdxid(sdk):
-    return "SPDXRef-SDK-%s" % sdk
-
-
-def _doc_path_by_namespace(spdx_deploy, arch, doc_namespace):
-    return spdx_deploy / "by-namespace" / arch / doc_namespace.replace("/"=
, "_")
-
-
-def doc_find_by_namespace(spdx_deploy, search_arches, doc_namespace):
-    for pkgarch in search_arches:
-        p =3D _doc_path_by_namespace(spdx_deploy, pkgarch, doc_namespace)
-        if os.path.exists(p):
-            return p
-    return None
-
-
-def _doc_path_by_hashfn(spdx_deploy, arch, doc_name, hashfn):
-    return (
-        spdx_deploy / "by-hash" / arch / hashfn.split()[1] / (doc_name + "=
.spdx.json")
-    )
-
-
-def doc_find_by_hashfn(spdx_deploy, search_arches, doc_name, hashfn):
-    for pkgarch in search_arches:
-        p =3D _doc_path_by_hashfn(spdx_deploy, pkgarch, doc_name, hashfn)
-        if os.path.exists(p):
-            return p
-    return None
-
-
-def doc_path(spdx_deploy, doc_name, arch, subdir):
-    return spdx_deploy / arch / subdir / (doc_name + ".spdx.json")
-
-
-def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=3DNone, indent=3DNone=
):
-    from pathlib import Path
-
-    if spdx_deploy is None:
-        spdx_deploy =3D Path(d.getVar("SPDXDEPLOY"))
-
-    dest =3D doc_path(spdx_deploy, spdx_doc.name, arch, subdir)
-    dest.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
-    with dest.open("wb") as f:
-        doc_sha1 =3D spdx_doc.to_json(f, sort_keys=3DTrue, indent=3Dindent=
)
-
-    l =3D _doc_path_by_namespace(spdx_deploy, arch, spdx_doc.documentNames=
pace)
-    l.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
-    l.symlink_to(os.path.relpath(dest, l.parent))
-
-    l =3D _doc_path_by_hashfn(
-        spdx_deploy, arch, spdx_doc.name, d.getVar("BB_HASHFILENAME")
-    )
-    l.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)
-    l.symlink_to(os.path.relpath(dest, l.parent))
-
-    return doc_sha1
-
-
-def read_doc(fn):
-    import hashlib
-    import oe.spdx
-    import io
-    import contextlib
-
-    @contextlib.contextmanager
-    def get_file():
-        if isinstance(fn, io.IOBase):
-            yield fn
-        else:
-            with fn.open("rb") as f:
-                yield f
-
-    with get_file() as f:
-        sha1 =3D hashlib.sha1()
-        while True:
-            chunk =3D f.read(4096)
-            if not chunk:
-                break
-            sha1.update(chunk)
-
-        f.seek(0)
-        doc =3D oe.spdx.SPDXDocument.from_json(f)
-
-    return (doc, sha1.hexdigest())
diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
deleted file mode 100644
index 7aaf2af5ed..0000000000
--- a/meta/lib/oe/spdx.py
+++ /dev/null
@@ -1,357 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: GPL-2.0-only
-#
-
-#
-# This library is intended to capture the JSON SPDX specification in a typ=
e
-# safe manner. It is not intended to encode any particular OE specific
-# behaviors, see the sbom.py for that.
-#
-# The documented SPDX spec document doesn't cover the JSON syntax for
-# particular configuration, which can make it hard to determine what the J=
SON
-# syntax should be. I've found it is actually much simpler to read the off=
icial
-# SPDX JSON schema which can be found here: https://eur02.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fspdx%2Fspdx-spec&data=3D=
05%7C02%7Cdaniel.turull%40ericsson.com%7Cb55ec66fdc694391aa7208de8a924852%7=
C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639100558059258824%7CUnknown%7C=
TWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkF=
OIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D%2BVln%2FHYRh1ohkoxiJBVP=
ujrZaQqIW99UUvXjgAqAR8I%3D&reserved=3D0<https://github.com/spdx/spdx-spec>
-# in schemas/spdx-schema.json
-#
-
-import hashlib
-import itertools
-import json
-
-SPDX_VERSION =3D "2.2"
-
-
-#
-# The following are the support classes that are used to implement SPDX ob=
ject
-#
-
-class _Property(object):
-    """
-    A generic SPDX object property. The different types will derive from t=
his
-    class
-    """
-
-    def __init__(self, *, default=3DNone):
-        self.default =3D default
-
-    def setdefault(self, dest, name):
-        if self.default is not None:
-            dest.setdefault(name, self.default)
-
-
-class _String(_Property):
-    """
-    A scalar string property for an SPDX object
-    """
-
-    def __init__(self, **kwargs):
-        super().__init__(**kwargs)
-
-    def set_property(self, attrs, name):
-        def get_helper(obj):
-            return obj._spdx[name]
-
-        def set_helper(obj, value):
-            obj._spdx[name] =3D value
-
-        def del_helper(obj):
-            del obj._spdx[name]
-
-        attrs[name] =3D property(get_helper, set_helper, del_helper)
-
-    def init(self, source):
-        return source
-
-
-class _Object(_Property):
-    """
-    A scalar SPDX object property of a SPDX object
-    """
-
-    def __init__(self, cls, **kwargs):
-        super().__init__(**kwargs)
-        self.cls =3D cls
-
-    def set_property(self, attrs, name):
-        def get_helper(obj):
-            if not name in obj._spdx:
-                obj._spdx[name] =3D self.cls()
-            return obj._spdx[name]
-
-        def set_helper(obj, value):
-            obj._spdx[name] =3D value
-
-        def del_helper(obj):
-            del obj._spdx[name]
-
-        attrs[name] =3D property(get_helper, set_helper)
-
-    def init(self, source):
-        return self.cls(**source)
-
-
-class _ListProperty(_Property):
-    """
-    A list of SPDX properties
-    """
-
-    def __init__(self, prop, **kwargs):
-        super().__init__(**kwargs)
-        self.prop =3D prop
-
-    def set_property(self, attrs, name):
-        def get_helper(obj):
-            if not name in obj._spdx:
-                obj._spdx[name] =3D []
-            return obj._spdx[name]
-
-        def set_helper(obj, value):
-            obj._spdx[name] =3D list(value)
-
-        def del_helper(obj):
-            del obj._spdx[name]
-
-        attrs[name] =3D property(get_helper, set_helper, del_helper)
-
-    def init(self, source):
-        return [self.prop.init(o) for o in source]
-
-
-class _StringList(_ListProperty):
-    """
-    A list of strings as a property for an SPDX object
-    """
-
-    def __init__(self, **kwargs):
-        super().__init__(_String(), **kwargs)
-
-
-class _ObjectList(_ListProperty):
-    """
-    A list of SPDX objects as a property for an SPDX object
-    """
-
-    def __init__(self, cls, **kwargs):
-        super().__init__(_Object(cls), **kwargs)
-
-
-class MetaSPDXObject(type):
-    """
-    A metaclass that allows properties (anything derived from a _Property
-    class) to be defined for a SPDX object
-    """
-    def __new__(mcls, name, bases, attrs):
-        attrs["_properties"] =3D {}
-
-        for key in attrs.keys():
-            if isinstance(attrs[key], _Property):
-                prop =3D attrs[key]
-                attrs["_properties"][key] =3D prop
-                prop.set_property(attrs, key)
-
-        return super().__new__(mcls, name, bases, attrs)
-
-
-class SPDXObject(metaclass=3DMetaSPDXObject):
-    """
-    The base SPDX object; all SPDX spec classes must derive from this clas=
s
-    """
-    def __init__(self, **d):
-        self._spdx =3D {}
-
-        for name, prop in self._properties.items():
-            prop.setdefault(self._spdx, name)
-            if name in d:
-                self._spdx[name] =3D prop.init(d[name])
-
-    def serializer(self):
-        return self._spdx
-
-    def __setattr__(self, name, value):
-        if name in self._properties or name =3D=3D "_spdx":
-            super().__setattr__(name, value)
-            return
-        raise KeyError("%r is not a valid SPDX property" % name)
-
-#
-# These are the SPDX objects implemented from the spec. The *only* propert=
ies
-# that can be added to these objects are ones directly specified in the SP=
DX
-# spec, however you may add helper functions to make operations easier.
-#
-# Defaults should *only* be specified if the SPDX spec says there is a cer=
tain
-# required value for a field (e.g. dataLicense), or if the field is mandat=
ory
-# and has some sane "this field is unknown" (e.g. "NOASSERTION")
-#
-
-class SPDXAnnotation(SPDXObject):
-    annotationDate =3D _String()
-    annotationType =3D _String()
-    annotator =3D _String()
-    comment =3D _String()
-
-class SPDXChecksum(SPDXObject):
-    algorithm =3D _String()
-    checksumValue =3D _String()
-
-
-class SPDXRelationship(SPDXObject):
-    spdxElementId =3D _String()
-    relatedSpdxElement =3D _String()
-    relationshipType =3D _String()
-    comment =3D _String()
-    annotations =3D _ObjectList(SPDXAnnotation)
-
-
-class SPDXExternalReference(SPDXObject):
-    referenceCategory =3D _String()
-    referenceType =3D _String()
-    referenceLocator =3D _String()
-
-
-class SPDXPackageVerificationCode(SPDXObject):
-    packageVerificationCodeValue =3D _String()
-    packageVerificationCodeExcludedFiles =3D _StringList()
-
-
-class SPDXPackage(SPDXObject):
-    ALLOWED_CHECKSUMS =3D [
-        "SHA1",
-        "SHA224",
-        "SHA256",
-        "SHA384",
-        "SHA512",
-        "MD2",
-        "MD4",
-        "MD5",
-        "MD6",
-    ]
-
-    name =3D _String()
-    SPDXID =3D _String()
-    versionInfo =3D _String()
-    downloadLocation =3D _String(default=3D"NOASSERTION")
-    supplier =3D _String(default=3D"NOASSERTION")
-    homepage =3D _String()
-    licenseConcluded =3D _String(default=3D"NOASSERTION")
-    licenseDeclared =3D _String(default=3D"NOASSERTION")
-    summary =3D _String()
-    description =3D _String()
-    sourceInfo =3D _String()
-    copyrightText =3D _String(default=3D"NOASSERTION")
-    licenseInfoFromFiles =3D _StringList(default=3D["NOASSERTION"])
-    externalRefs =3D _ObjectList(SPDXExternalReference)
-    packageVerificationCode =3D _Object(SPDXPackageVerificationCode)
-    hasFiles =3D _StringList()
-    packageFileName =3D _String()
-    annotations =3D _ObjectList(SPDXAnnotation)
-    checksums =3D _ObjectList(SPDXChecksum)
-
-
-class SPDXFile(SPDXObject):
-    SPDXID =3D _String()
-    fileName =3D _String()
-    licenseConcluded =3D _String(default=3D"NOASSERTION")
-    copyrightText =3D _String(default=3D"NOASSERTION")
-    licenseInfoInFiles =3D _StringList(default=3D["NOASSERTION"])
-    checksums =3D _ObjectList(SPDXChecksum)
-    fileTypes =3D _StringList()
-
-
-class SPDXCreationInfo(SPDXObject):
-    created =3D _String()
-    licenseListVersion =3D _String()
-    comment =3D _String()
-    creators =3D _StringList()
-
-
-class SPDXExternalDocumentRef(SPDXObject):
-    externalDocumentId =3D _String()
-    spdxDocument =3D _String()
-    checksum =3D _Object(SPDXChecksum)
-
-
-class SPDXExtractedLicensingInfo(SPDXObject):
-    name =3D _String()
-    comment =3D _String()
-    licenseId =3D _String()
-    extractedText =3D _String()
-
-
-class SPDXDocument(SPDXObject):
-    spdxVersion =3D _String(default=3D"SPDX-" + SPDX_VERSION)
-    dataLicense =3D _String(default=3D"CC0-1.0")
-    SPDXID =3D _String(default=3D"SPDXRef-DOCUMENT")
-    name =3D _String()
-    documentNamespace =3D _String()
-    creationInfo =3D _Object(SPDXCreationInfo)
-    packages =3D _ObjectList(SPDXPackage)
-    files =3D _ObjectList(SPDXFile)
-    relationships =3D _ObjectList(SPDXRelationship)
-    externalDocumentRefs =3D _ObjectList(SPDXExternalDocumentRef)
-    hasExtractedLicensingInfos =3D _ObjectList(SPDXExtractedLicensingInfo)
-
-    def __init__(self, **d):
-        super().__init__(**d)
-
-    def to_json(self, f, *, sort_keys=3DFalse, indent=3DNone, separators=
=3DNone):
-        class Encoder(json.JSONEncoder):
-            def default(self, o):
-                if isinstance(o, SPDXObject):
-                    return o.serializer()
-
-                return super().default(o)
-
-        sha1 =3D hashlib.sha1()
-        for chunk in Encoder(
-            sort_keys=3Dsort_keys,
-            indent=3Dindent,
-            separators=3Dseparators,
-        ).iterencode(self):
-            chunk =3D chunk.encode("utf-8")
-            f.write(chunk)
-            sha1.update(chunk)
-
-        return sha1.hexdigest()
-
-    @classmethod
-    def from_json(cls, f):
-        return cls(**json.load(f))
-
-    def add_relationship(self, _from, relationship, _to, *, comment=3DNone=
, annotation=3DNone):
-        if isinstance(_from, SPDXObject):
-            from_spdxid =3D _from.SPDXID
-        else:
-            from_spdxid =3D _from
-
-        if isinstance(_to, SPDXObject):
-            to_spdxid =3D _to.SPDXID
-        else:
-            to_spdxid =3D _to
-
-        r =3D SPDXRelationship(
-            spdxElementId=3Dfrom_spdxid,
-            relatedSpdxElement=3Dto_spdxid,
-            relationshipType=3Drelationship,
-        )
-
-        if comment is not None:
-            r.comment =3D comment
-
-        if annotation is not None:
-            r.annotations.append(annotation)
-
-        self.relationships.append(r)
-
-    def find_by_spdxid(self, spdxid):
-        for o in itertools.chain(self.packages, self.files):
-            if o.SPDXID =3D=3D spdxid:
-                return o
-        return None
-
-    def find_external_document_ref(self, namespace):
-        for r in self.externalDocumentRefs:
-            if r.spdxDocument =3D=3D namespace:
-                return r
-        return None
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/=
cases/spdx.py
index 83e4890d44..c563fd1011 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -4,74 +4,13 @@
 # SPDX-License-Identifier: MIT
 #

-import json
-import os
 import textwrap
 import hashlib
-from pathlib import Path
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runCmd
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
 import oe.spdx30


-class SPDX22Check(OESelftestTestCase):
-    @classmethod
-    def setUpClass(cls):
-        super().setUpClass()
-        bitbake("python3-spdx-tools-native")
-        bitbake("-c addto_recipe_sysroot python3-spdx-tools-native")
-
-    def check_recipe_spdx(self, high_level_dir, spdx_file, target_name):
-        config =3D textwrap.dedent(
-            """\
-            INHERIT:remove =3D "create-spdx"
-            INHERIT +=3D "create-spdx-2.2"
-            """
-        )
-        self.write_config(config)
-
-        deploy_dir =3D get_bb_var("DEPLOY_DIR")
-        arch_dir =3D get_bb_var("PACKAGE_ARCH", target_name)
-        spdx_version =3D get_bb_var("SPDX_VERSION")
-        # qemux86-64 creates the directory qemux86_64
-        # arch_dir =3D arch_var.replace("-", "_")
-
-        full_file_path =3D os.path.join(
-            deploy_dir, "spdx", spdx_version, arch_dir, high_level_dir, sp=
dx_file
-        )
-
-        try:
-            os.remove(full_file_path)
-        except FileNotFoundError:
-            pass
-
-        bitbake("%s -c create_spdx" % target_name)
-
-        def check_spdx_json(filename):
-            with open(filename) as f:
-                report =3D json.load(f)
-                self.assertNotEqual(report, None)
-                self.assertNotEqual(report["SPDXID"], None)
-
-            python =3D os.path.join(
-                get_bb_var("STAGING_BINDIR", "python3-spdx-tools-native"),
-                "nativepython3",
-            )
-            validator =3D os.path.join(
-                get_bb_var("STAGING_BINDIR", "python3-spdx-tools-native"),=
 "pyspdxtools"
-            )
-            result =3D runCmd("{} {} -i {}".format(python, validator, file=
name))
-
-        self.assertExists(full_file_path)
-        result =3D check_spdx_json(full_file_path)
-
-    def test_spdx_base_files(self):
-        self.check_recipe_spdx("packages", "base-files.spdx.json", "base-f=
iles")
-
-    def test_spdx_tar(self):
-        self.check_recipe_spdx("packages", "tar.spdx.json", "tar")
-
-
 class SPDX3CheckBase(object):
     """
     Base class for checking SPDX 3 based tests
--
2.53.0


--_000_PA3PR07MB10721C5BB6F5C7F61B6E3D24B8A49APA3PR07MB10721eu_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Should I send my conversion script to oe-core as alternative or we keep it =
outside?&nbsp;</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Best regards,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Daniel</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif;"><b>From:</b>&nbsp;openembedded-core@lists.openembedded.org &lt=
;openembedded-core@lists.openembedded.org&gt; on behalf of Joshua Watt via =
lists.openembedded.org &lt;JPEWhacker=3Dgmail.com@lists.openembedded.org&gt=
;<br>
<b>Sent:</b>&nbsp;Wednesday, March 25, 2026 6:16 PM<br>
<b>To:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
<b>Cc:</b>&nbsp;Joshua Watt &lt;JPEWhacker@gmail.com&gt;<br>
<b>Subject:</b>&nbsp;[OE-core][PATCH] Remove SPDX 2.2 support</span>
<div style=3D"font-family: Calibri, sans-serif;">&nbsp;</div>
</div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<div class=3D"PlainText" style=3D"font-size: 11pt;">Removes SPDX 2.2 suppor=
t in favor of SPDX 3 support being the only<br>
option. The SPDX 3 data is far superior to SPDX 2.2 and thus more useful<br=
>
for SBoM uses cases.<br>
<br>
Signed-off-by: Joshua Watt &lt;JPEWhacker@gmail.com&gt;<br>
---<br>
&nbsp;meta/classes/create-spdx-2.2.bbclass | 990 --------------------------=
-<br>
&nbsp;meta/lib/oe/sbom.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 120 ----<br>
&nbsp;meta/lib/oe/spdx.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 357 ----------<br>
&nbsp;meta/lib/oeqa/selftest/cases/spdx.py |&nbsp; 63 +-<br>
&nbsp;4 files changed, 1 insertion(+), 1529 deletions(-)<br>
&nbsp;delete mode 100644 meta/classes/create-spdx-2.2.bbclass<br>
&nbsp;delete mode 100644 meta/lib/oe/sbom.py<br>
&nbsp;delete mode 100644 meta/lib/oe/spdx.py<br>
<br>
diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass<br>
deleted file mode 100644<br>
index 1c43156559..0000000000<br>
--- a/meta/classes/create-spdx-2.2.bbclass<br>
+++ /dev/null<br>
@@ -1,990 +0,0 @@<br>
-#<br>
-# Copyright OpenEmbedded Contributors<br>
-#<br>
-# SPDX-License-Identifier: GPL-2.0-only<br>
-#<br>
-<br>
-inherit spdx-common<br>
-<br>
-SPDX_VERSION =3D &quot;2.2&quot;<br>
-<br>
-SPDX_ORG ??=3D &quot;OpenEmbedded ()&quot;<br>
-SPDX_SUPPLIER ??=3D &quot;Organization: ${SPDX_ORG}&quot;<br>
-SPDX_SUPPLIER[doc] =3D &quot;The SPDX PackageSupplier field for SPDX packa=
ges created from \<br>
-&nbsp;&nbsp;&nbsp; this recipe. For SPDX documents create using this class=
 during the build, this \<br>
-&nbsp;&nbsp;&nbsp; is the contact information for the person or organizati=
on who is doing the \<br>
-&nbsp;&nbsp;&nbsp; build.&quot;<br>
-<br>
-SPDX_ARCHIVE_SOURCES ??=3D &quot;0&quot;<br>
-SPDX_ARCHIVE_PACKAGED ??=3D &quot;0&quot;<br>
-<br>
-def get_namespace(d, name):<br>
-&nbsp;&nbsp;&nbsp; import uuid<br>
-&nbsp;&nbsp;&nbsp; namespace_uuid =3D uuid.uuid5(uuid.NAMESPACE_DNS, d.get=
Var(&quot;SPDX_UUID_NAMESPACE&quot;))<br>
-&nbsp;&nbsp;&nbsp; return &quot;%s/%s-%s&quot; % (d.getVar(&quot;SPDX_NAME=
SPACE_PREFIX&quot;), name, str(uuid.uuid5(namespace_uuid, name)))<br>
-<br>
-SPDX_PACKAGE_VERSION ??=3D &quot;${PV}&quot;<br>
-SPDX_PACKAGE_VERSION[doc] =3D &quot;The version of a package, versionInfo =
in recipe, package and image&quot;<br>
-<br>
-def create_annotation(d, comment):<br>
-&nbsp;&nbsp;&nbsp; from datetime import datetime, timezone<br>
-<br>
-&nbsp;&nbsp;&nbsp; creation_time =3D datetime.now(tz=3Dtimezone.utc).strft=
ime(&quot;%Y-%m-%dT%H:%M:%SZ&quot;)<br>
-&nbsp;&nbsp;&nbsp; annotation =3D oe.spdx.SPDXAnnotation()<br>
-&nbsp;&nbsp;&nbsp; annotation.annotationDate =3D creation_time<br>
-&nbsp;&nbsp;&nbsp; annotation.annotationType =3D &quot;OTHER&quot;<br>
-&nbsp;&nbsp;&nbsp; annotation.annotator =3D &quot;Tool: %s - %s&quot; % (d=
.getVar(&quot;SPDX_TOOL_NAME&quot;), d.getVar(&quot;SPDX_TOOL_VERSION&quot;=
))<br>
-&nbsp;&nbsp;&nbsp; annotation.comment =3D comment<br>
-&nbsp;&nbsp;&nbsp; return annotation<br>
-<br>
-def recipe_spdx_is_native(d, recipe):<br>
-&nbsp;&nbsp;&nbsp; return any(a.annotationType =3D=3D &quot;OTHER&quot; an=
d<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a.annotator =3D=3D &quot;Tool: %s - %s&quot=
; % (d.getVar(&quot;SPDX_TOOL_NAME&quot;), d.getVar(&quot;SPDX_TOOL_VERSION=
&quot;)) and<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a.comment =3D=3D &quot;isNative&quot; for a=
 in recipe.annotations)<br>
-<br>
-def get_json_indent(d):<br>
-&nbsp;&nbsp;&nbsp; if d.getVar(&quot;SPDX_PRETTY&quot;) =3D=3D &quot;1&quo=
t;:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 2<br>
-&nbsp;&nbsp;&nbsp; return None<br>
-<br>
-<br>
-def convert_license_to_spdx(lic, license_data, document, d, existing=3D{})=
:<br>
-&nbsp;&nbsp;&nbsp; from pathlib import Path<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx<br>
-<br>
-&nbsp;&nbsp;&nbsp; extracted =3D {}<br>
-<br>
-&nbsp;&nbsp;&nbsp; def add_extracted_license(ident, name):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nonlocal document<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if name in extracted:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<=
br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extracted_info =3D oe.spdx.SPDX=
ExtractedLicensingInfo()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extracted_info.name =3D name<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extracted_info.licenseId =3D id=
ent<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extracted_info.extractedText =
=3D None<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if name =3D=3D &quot;PD&quot;:<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Speci=
al-case this.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extract=
ed_info.extractedText =3D &quot;Software released to the public domain&quot=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Seach=
 for the license in COMMON_LICENSE_DIR and LICENSE_PATH<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for dir=
ectory in [d.getVar('COMMON_LICENSE_DIR')] + (d.getVar('LICENSE_PATH') or '=
').split():<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; try:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with (Path(directory) / name).open=
(errors=3D&quot;replace&quot;) as f:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extracted_=
info.extractedText =3D f.read()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; except FileNotFoundError:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if extr=
acted_info.extractedText is None:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; # If it's not SPDX or PD, then NO_GENERIC_LICENSE must be =
set<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; entry =3D d.getVarFlag('NO_GENERIC_LICENSE', name).split('=
;')<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; filename =3D entry[0]<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; params =3D {i.split('=3D')[0]: i.split('=3D')[1] for i in =
entry[1:] if '=3D' in i}<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; beginline =3D int(params.get('beginline', 1))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; endline =3D params.get('endline', None)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if endline:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; endline =3D int(endline)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if filename:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; filename =3D d.expand(&quot;${S}/&=
quot; + filename)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with open(filename, errors=3D&quot=
;replace&quot;) as f:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extracted_=
info.extractedText =3D &quot;&quot;.join(line for idx, line in enumerate(f,=
 1) if beginline &lt;=3D idx and idx &lt;=3D (endline or idx))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; else:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.fatal(&quot;Cannot find any tex=
t for license %s&quot; % name)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extracted[name] =3D extracted_i=
nfo<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; document.hasExtractedLicensingI=
nfos.append(extracted_info)<br>
-<br>
-&nbsp;&nbsp;&nbsp; def convert(l):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if l =3D=3D &quot;(&quot; or l =
=3D=3D &quot;)&quot;:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
l<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if l =3D=3D &quot;&amp;&quot;:<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
&quot;AND&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if l =3D=3D &quot;|&quot;:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
&quot;OR&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if l =3D=3D &quot;CLOSED&quot;:=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
&quot;NONE&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_license =3D d.getVarFlag(&=
quot;SPDXLICENSEMAP&quot;, l) or l<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if spdx_license in license_data=
[&quot;licenses&quot;]:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
spdx_license<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_li=
cense =3D existing[l]<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; except KeyError:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_li=
cense =3D &quot;LicenseRef-&quot; + l<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; add_ext=
racted_license(spdx_license, l)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return spdx_license<br>
-<br>
-&nbsp;&nbsp;&nbsp; lic_split =3D lic.replace(&quot;(&quot;, &quot; ( &quot=
;).replace(&quot;)&quot;, &quot; ) &quot;).replace(&quot;|&quot;, &quot; | =
&quot;).replace(&quot;&amp;&quot;, &quot; &amp; &quot;).split()<br>
-<br>
-&nbsp;&nbsp;&nbsp; return ' '.join(convert(l) for l in lic_split)<br>
-<br>
-def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, =
archive=3DNone, ignore_dirs=3D[], ignore_top_level_dirs=3D[]):<br>
-&nbsp;&nbsp;&nbsp; from pathlib import Path<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx_common<br>
-&nbsp;&nbsp;&nbsp; import hashlib<br>
-<br>
-&nbsp;&nbsp;&nbsp; source_date_epoch =3D d.getVar(&quot;SOURCE_DATE_EPOCH&=
quot;)<br>
-&nbsp;&nbsp;&nbsp; if source_date_epoch:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source_date_epoch =3D int(sourc=
e_date_epoch)<br>
-<br>
-&nbsp;&nbsp;&nbsp; sha1s =3D []<br>
-&nbsp;&nbsp;&nbsp; spdx_files =3D []<br>
-<br>
-&nbsp;&nbsp;&nbsp; file_counter =3D 1<br>
-<br>
-&nbsp;&nbsp;&nbsp; check_compiled_sources =3D d.getVar(&quot;SPDX_INCLUDE_=
COMPILED_SOURCES&quot;) =3D=3D &quot;1&quot;<br>
-&nbsp;&nbsp;&nbsp; if check_compiled_sources:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compiled_sources, types =3D oe.=
spdx_common.get_compiled_sources(d)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.debug(1, f&quot;Total compil=
ed files: {len(compiled_sources)}&quot;)<br>
-&nbsp;&nbsp;&nbsp; for subdir, dirs, files in os.walk(topdir):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirs[:] =3D [d for d in dirs if=
 d not in ignore_dirs]<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if subdir =3D=3D str(topdir):<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirs[:]=
 =3D [d for d in dirs if d not in ignore_top_level_dirs]<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for file in files:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; filepat=
h =3D Path(subdir) / file<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; filenam=
e =3D str(filepath.relative_to(topdir))<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not =
filepath.is_symlink() and filepath.is_file():<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; # Check if file is compiled<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if check_compiled_sources:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not oe.spdx_common.is_com=
piled_source(filename, compiled_sources, types):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; continue<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; spdx_file =3D oe.spdx.SPDXFile()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; spdx_file.SPDXID =3D get_spdxid(file_counter)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; for t in get_types(filepath):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_file.fileTypes.append(t)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; spdx_file.fileName =3D filename<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if archive is not None:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with filepath.open(&quot;rb&quot;)=
 as f:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info =3D a=
rchive.gettarinfo(fileobj=3Df)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.name =
=3D filename<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.uid =
=3D 0<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.gid =
=3D 0<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.uname=
 =3D &quot;root&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.gname=
 =3D &quot;root&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if source_=
date_epoch is not None and info.mtime &gt; source_date_epoch:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; info.mtime =3D source_date_epoch<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; archive.ad=
dfile(info, f)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; sha1 =3D bb.utils.sha1_file(filepath)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; sha1s.append(sha1)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; spdx_file.checksums.append(oe.spdx.SPDXChecksum(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; algorithm=
=3D&quot;SHA1&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; checksumVa=
lue=3Dsha1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; spdx_file.checksums.append(oe.spdx.SPDXChecksum(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; algorithm=
=3D&quot;SHA256&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; checksumVa=
lue=3Dbb.utils.sha256_file(filepath),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ))<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if &quot;SOURCE&quot; in spdx_file.fileTypes:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; extracted_lics =3D oe.spdx_common.=
extract_licenses(filepath)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if extracted_lics:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_file.=
licenseInfoInFiles =3D extracted_lics<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; doc.files.append(spdx_file)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; doc.add_relationship(spdx_pkg, &quot;CONTAINS&quot;, spdx_=
file)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; spdx_pkg.hasFiles.append(spdx_file.SPDXID)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; spdx_files.append(spdx_file)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; file_counter +=3D 1<br>
-<br>
-&nbsp;&nbsp;&nbsp; sha1s.sort()<br>
-&nbsp;&nbsp;&nbsp; verifier =3D hashlib.sha1()<br>
-&nbsp;&nbsp;&nbsp; for v in sha1s:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; verifier.update(v.encode(&quot;=
utf-8&quot;))<br>
-&nbsp;&nbsp;&nbsp; spdx_pkg.packageVerificationCode.packageVerificationCod=
eValue =3D verifier.hexdigest()<br>
-<br>
-&nbsp;&nbsp;&nbsp; return spdx_files<br>
-<br>
-<br>
-def add_package_sources_from_debug(d, package_doc, spdx_package, package, =
package_files, sources):<br>
-&nbsp;&nbsp;&nbsp; from pathlib import Path<br>
-&nbsp;&nbsp;&nbsp; import hashlib<br>
-&nbsp;&nbsp;&nbsp; import oe.packagedata<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx<br>
-<br>
-&nbsp;&nbsp;&nbsp; debug_search_paths =3D [<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Path(d.getVar('PKGD')),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Path(d.getVar('STAGING_DIR_TARG=
ET')),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Path(d.getVar('STAGING_DIR_NATI=
VE')),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Path(d.getVar('STAGING_KERNEL_D=
IR')),<br>
-&nbsp;&nbsp;&nbsp; ]<br>
-<br>
-&nbsp;&nbsp;&nbsp; pkg_data =3D oe.packagedata.read_subpkgdata_extended(pa=
ckage, d)<br>
-<br>
-&nbsp;&nbsp;&nbsp; if pkg_data is None:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
-<br>
-&nbsp;&nbsp;&nbsp; for file_path, file_data in pkg_data[&quot;files_info&q=
uot;].items():<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not &quot;debugsrc&quot; in =
file_data:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for pkg_file in package_files:<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if file=
_path.lstrip(&quot;/&quot;) =3D=3D pkg_file.fileName.lstrip(&quot;/&quot;):=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; break<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.fata=
l(&quot;No package file found for %s in %s; SPDX found: %s&quot; % (str(fil=
e_path), package,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot; &quot;.join(p.fileName for p in package_files)))<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for debugsrc in file_data[&quot=
;debugsrc&quot;]:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ref_id =
=3D &quot;NOASSERTION&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for sea=
rch in debug_search_paths:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if debugsrc.startswith(&quot;/usr/src/kernel&quot;):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugsrc_path =3D search / debugsr=
c.replace('/usr/src/kernel/', '')<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; else:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debugsrc_path =3D search / debugsr=
c.lstrip(&quot;/&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; # We can only hash files below, skip directories, links, e=
tc.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if not os.path.isfile(debugsrc_path):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; file_sha256 =3D bb.utils.sha256_file(debugsrc_path)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if file_sha256 in sources:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source_file =3D sources[file_sha25=
6]<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc_ref =3D package_doc.find_exter=
nal_document_ref(source_file.doc.documentNamespace)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if doc_ref is None:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc_ref =
=3D oe.spdx.SPDXExternalDocumentRef()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc_ref.ex=
ternalDocumentId =3D &quot;DocumentRef-dependency-&quot; + source_file.doc.=
name<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc_ref.sp=
dxDocument =3D source_file.doc.documentNamespace<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc_ref.ch=
ecksum.algorithm =3D &quot;SHA1&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc_ref.ch=
ecksum.checksumValue =3D source_file.doc_sha1<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package_do=
c.externalDocumentRefs.append(doc_ref)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ref_id =3D &quot;%s:%s&quot; % (do=
c_ref.externalDocumentId, source_file.file.SPDXID)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; else:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.debug(1, &quot;Debug source %s =
with SHA256 %s not found in any dependency&quot; % (str(debugsrc_path), fil=
e_sha256))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; break<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bb.debug(1, &quot;Debug source %s not found&quot; % debugs=
rc)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.add_relationship(pkg_file, &quot;GENERATED_FROM&quot;, ref_id, comment=
=3Ddebugsrc)<br>
-<br>
-add_package_sources_from_debug[vardepsexclude] +=3D &quot;STAGING_KERNEL_D=
IR&quot;<br>
-<br>
-def collect_dep_recipes(d, doc, spdx_recipe, direct_deps):<br>
-&nbsp;&nbsp;&nbsp; import json<br>
-&nbsp;&nbsp;&nbsp; from pathlib import Path<br>
-&nbsp;&nbsp;&nbsp; import oe.sbom<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx_common<br>
-<br>
-&nbsp;&nbsp;&nbsp; deploy_dir_spdx =3D Path(d.getVar(&quot;DEPLOY_DIR_SPDX=
&quot;))<br>
-&nbsp;&nbsp;&nbsp; package_archs =3D d.getVar(&quot;SPDX_MULTILIB_SSTATE_A=
RCHS&quot;).split()<br>
-&nbsp;&nbsp;&nbsp; package_archs.reverse()<br>
-<br>
-&nbsp;&nbsp;&nbsp; dep_recipes =3D []<br>
-<br>
-&nbsp;&nbsp;&nbsp; for dep in direct_deps:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # If this dependency is not cal=
culated in the taskhash skip it.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Otherwise, it can result in b=
roken links since this task won't<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # rebuild and see the new SPDX =
ID if the dependency changes<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not dep.in_taskhash:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_recipe_path =3D oe.sbom.doc=
_find_by_hashfn(deploy_dir_spdx, package_archs, &quot;recipe-&quot; + dep.p=
n, dep.hashfn)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not dep_recipe_path:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.fata=
l(&quot;Cannot find any SPDX file for recipe %s, %s&quot; % (dep.pn, dep.ha=
shfn))<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_dep_doc, spdx_dep_sha1 =3D=
 oe.sbom.read_doc(dep_recipe_path)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for pkg in spdx_dep_doc.package=
s:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if pkg.=
name =3D=3D dep.pn:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; spdx_dep_recipe =3D pkg<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; break<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_recipes.append(oe.sbom.DepR=
ecipe(spdx_dep_doc, spdx_dep_sha1, spdx_dep_recipe))<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_recipe_ref =3D oe.spdx.SPDX=
ExternalDocumentRef()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_recipe_ref.externalDocument=
Id =3D &quot;DocumentRef-dependency-&quot; + spdx_dep_doc.name<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_recipe_ref.spdxDocument =3D=
 spdx_dep_doc.documentNamespace<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_recipe_ref.checksum.algorit=
hm =3D &quot;SHA1&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_recipe_ref.checksum.checksu=
mValue =3D spdx_dep_sha1<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc.externalDocumentRefs.append=
(dep_recipe_ref)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc.add_relationship(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%=
s:%s&quot; % (dep_recipe_ref.externalDocumentId, spdx_dep_recipe.SPDXID),<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;B=
UILD_DEPENDENCY_OF&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_re=
cipe<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
-<br>
-&nbsp;&nbsp;&nbsp; return dep_recipes<br>
-<br>
-collect_dep_recipes[vardepsexclude] =3D &quot;SPDX_MULTILIB_SSTATE_ARCHS&q=
uot;<br>
-<br>
-def collect_dep_sources(d, dep_recipes):<br>
-&nbsp;&nbsp;&nbsp; import oe.sbom<br>
-<br>
-&nbsp;&nbsp;&nbsp; sources =3D {}<br>
-&nbsp;&nbsp;&nbsp; for dep in dep_recipes:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Don't collect sources from na=
tive recipes as they<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # match non-native sources also=
.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if recipe_spdx_is_native(d, dep=
.recipe):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recipe_files =3D set(dep.recipe=
.hasFiles)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for spdx_file in dep.doc.files:=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if spdx=
_file.SPDXID not in recipe_files:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; continue<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if &quo=
t;SOURCE&quot; in spdx_file.fileTypes:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; for checksum in spdx_file.checksums:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if checksum.algorithm =3D=3D &quot=
;SHA256&quot;:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sources[ch=
ecksum.checksumValue] =3D oe.sbom.DepSource(dep.doc, dep.doc_sha1, dep.reci=
pe, spdx_file)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break<br>
-<br>
-&nbsp;&nbsp;&nbsp; return sources<br>
-<br>
-def add_download_packages(d, doc, recipe):<br>
-&nbsp;&nbsp;&nbsp; import os.path<br>
-&nbsp;&nbsp;&nbsp; from bb.fetch2 import decodeurl, CHECKSUM_LIST<br>
-&nbsp;&nbsp;&nbsp; import bb.process<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx<br>
-&nbsp;&nbsp;&nbsp; import oe.sbom<br>
-<br>
-&nbsp;&nbsp;&nbsp; for download_idx, src_uri in enumerate(d.getVar('SRC_UR=
I').split()):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f =3D bb.fetch2.FetchData(src_u=
ri, d)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package =3D oe.spdx.SPDXPackage=
()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package.name =3D &quot;%s-sourc=
e-%d&quot; % (d.getVar(&quot;PN&quot;), download_idx + 1)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package.SPDXID =3D oe.sbom.get_=
download_spdxid(d, download_idx + 1)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if f.type =3D=3D &quot;file&quo=
t;:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continu=
e<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if f.method.supports_checksum(f=
):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for che=
cksum_id in CHECKSUM_LIST:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if checksum_id.upper() not in oe.spdx.SPDXPackage.ALLOWED_=
CHECKSUMS:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; expected_checksum =3D getattr(f, &quot;%s_expected&quot; %=
 checksum_id)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if expected_checksum is None:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; c =3D oe.spdx.SPDXChecksum()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; c.algorithm =3D checksum_id.upper()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; c.checksumValue =3D expected_checksum<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; package.checksums.append(c)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package.downloadLocation =3D oe=
.spdx_common.fetch_data_to_uri(f, f.name)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc.packages.append(package)<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc.add_relationship(doc, &quot=
;DESCRIBES&quot;, package)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # In the future, we might be ab=
le to do more fancy dependencies,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # but this should be sufficient=
 for now<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc.add_relationship(package, &=
quot;BUILD_DEPENDENCY_OF&quot;, recipe)<br>
-<br>
-def get_license_list_version(license_data, d):<br>
-&nbsp;&nbsp;&nbsp; # Newer versions of the SPDX license list are SemVer (&=
quot;MAJOR.MINOR.MICRO&quot;),<br>
-&nbsp;&nbsp;&nbsp; # but SPDX 2 only uses &quot;MAJOR.MINOR&quot;.<br>
-&nbsp;&nbsp;&nbsp; return &quot;.&quot;.join(license_data[&quot;licenseLis=
tVersion&quot;].split(&quot;.&quot;)[:2])<br>
-<br>
-<br>
-# This task is added for compatibility with tasks shared with SPDX 3, but<=
br>
-# doesn't do anything<br>
-do_create_recipe_spdx() {<br>
-&nbsp;&nbsp;&nbsp; :<br>
-}<br>
-do_create_recipe_spdx[noexec] =3D &quot;1&quot;<br>
-addtask do_create_recipe_spdx<br>
-<br>
-<br>
-python do_create_spdx() {<br>
-&nbsp;&nbsp;&nbsp; from datetime import datetime, timezone<br>
-&nbsp;&nbsp;&nbsp; import oe.sbom<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx_common<br>
-&nbsp;&nbsp;&nbsp; import uuid<br>
-&nbsp;&nbsp;&nbsp; from pathlib import Path<br>
-&nbsp;&nbsp;&nbsp; from contextlib import contextmanager<br>
-&nbsp;&nbsp;&nbsp; import oe.cve_check<br>
-<br>
-&nbsp;&nbsp;&nbsp; license_data =3D oe.spdx_common.load_spdx_license_data(=
d)<br>
-<br>
-&nbsp;&nbsp;&nbsp; @contextmanager<br>
-&nbsp;&nbsp;&nbsp; def optional_tarfile(name, guard, mode=3D&quot;w&quot;)=
:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import tarfile<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import bb.compress.zstd<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_threads =3D int(d.getVar(&q=
uot;BB_NUMBER_THREADS&quot;))<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if guard:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name.pa=
rent.mkdir(parents=3DTrue, exist_ok=3DTrue)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with bb=
.compress.zstd.open(name, mode=3Dmode + &quot;b&quot;, num_threads=3Dnum_th=
reads) as f:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; with tarfile.open(fileobj=3Df, mode=3Dmode + &quot;|&quot;=
) as tf:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yield tf<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yield N=
one<br>
-<br>
-<br>
-&nbsp;&nbsp;&nbsp; deploy_dir_spdx =3D Path(d.getVar(&quot;DEPLOY_DIR_SPDX=
&quot;))<br>
-&nbsp;&nbsp;&nbsp; spdx_workdir =3D Path(d.getVar(&quot;SPDXWORK&quot;))<b=
r>
-&nbsp;&nbsp;&nbsp; include_sources =3D d.getVar(&quot;SPDX_INCLUDE_SOURCES=
&quot;) =3D=3D &quot;1&quot;<br>
-&nbsp;&nbsp;&nbsp; archive_sources =3D d.getVar(&quot;SPDX_ARCHIVE_SOURCES=
&quot;) =3D=3D &quot;1&quot;<br>
-&nbsp;&nbsp;&nbsp; archive_packaged =3D d.getVar(&quot;SPDX_ARCHIVE_PACKAG=
ED&quot;) =3D=3D &quot;1&quot;<br>
-&nbsp;&nbsp;&nbsp; pkg_arch =3D d.getVar(&quot;SSTATE_PKGARCH&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp; creation_time =3D datetime.now(tz=3Dtimezone.utc).strft=
ime(&quot;%Y-%m-%dT%H:%M:%SZ&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp; doc =3D oe.spdx.SPDXDocument()<br>
-<br>
-&nbsp;&nbsp;&nbsp; doc.name =3D &quot;recipe-&quot; + d.getVar(&quot;PN&qu=
ot;)<br>
-&nbsp;&nbsp;&nbsp; doc.documentNamespace =3D get_namespace(d, doc.name)<br=
>
-&nbsp;&nbsp;&nbsp; doc.creationInfo.created =3D creation_time<br>
-&nbsp;&nbsp;&nbsp; doc.creationInfo.comment =3D &quot;This document was cr=
eated by analyzing recipe files during the build.&quot;<br>
-&nbsp;&nbsp;&nbsp; doc.creationInfo.licenseListVersion =3D get_license_lis=
t_version(license_data, d)<br>
-&nbsp;&nbsp;&nbsp; doc.creationInfo.creators.append(&quot;Tool: OpenEmbedd=
ed Core create-spdx.bbclass&quot;)<br>
-&nbsp;&nbsp;&nbsp; doc.creationInfo.creators.append(&quot;Organization: %s=
&quot; % d.getVar(&quot;SPDX_ORG&quot;))<br>
-&nbsp;&nbsp;&nbsp; doc.creationInfo.creators.append(&quot;Person: N/A ()&q=
uot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp; recipe =3D oe.spdx.SPDXPackage()<br>
-&nbsp;&nbsp;&nbsp; recipe.name =3D d.getVar(&quot;PN&quot;)<br>
-&nbsp;&nbsp;&nbsp; recipe.versionInfo =3D d.getVar(&quot;SPDX_PACKAGE_VERS=
ION&quot;)<br>
-&nbsp;&nbsp;&nbsp; recipe.SPDXID =3D oe.sbom.get_recipe_spdxid(d)<br>
-&nbsp;&nbsp;&nbsp; recipe.supplier =3D d.getVar(&quot;SPDX_SUPPLIER&quot;)=
<br>
-&nbsp;&nbsp;&nbsp; if bb.data.inherits_class(&quot;native&quot;, d) or bb.=
data.inherits_class(&quot;cross&quot;, d):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recipe.annotations.append(creat=
e_annotation(d, &quot;isNative&quot;))<br>
-<br>
-&nbsp;&nbsp;&nbsp; homepage =3D d.getVar(&quot;HOMEPAGE&quot;)<br>
-&nbsp;&nbsp;&nbsp; if homepage:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recipe.homepage =3D homepage<br=
>
-<br>
-&nbsp;&nbsp;&nbsp; license =3D d.getVar(&quot;LICENSE&quot;)<br>
-&nbsp;&nbsp;&nbsp; if license:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recipe.licenseDeclared =3D conv=
ert_license_to_spdx(license, license_data, doc, d)<br>
-<br>
-&nbsp;&nbsp;&nbsp; summary =3D d.getVar(&quot;SUMMARY&quot;)<br>
-&nbsp;&nbsp;&nbsp; if summary:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recipe.summary =3D summary<br>
-<br>
-&nbsp;&nbsp;&nbsp; description =3D d.getVar(&quot;DESCRIPTION&quot;)<br>
-&nbsp;&nbsp;&nbsp; if description:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recipe.description =3D descript=
ion<br>
-<br>
-&nbsp;&nbsp;&nbsp; if d.getVar(&quot;SPDX_CUSTOM_ANNOTATION_VARS&quot;):<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for var in d.getVar('SPDX_CUSTO=
M_ANNOTATION_VARS').split():<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recipe.=
annotations.append(create_annotation(d, var + &quot;=3D&quot; + d.getVar(va=
r)))<br>
-<br>
-&nbsp;&nbsp;&nbsp; # Some CVEs may be patched during the build process wit=
hout incrementing the version number,<br>
-&nbsp;&nbsp;&nbsp; # so querying for CVEs based on the CPE id can lead to =
false positives. To account for this,<br>
-&nbsp;&nbsp;&nbsp; # save the CVEs fixed by patches to source information =
field in the SPDX.<br>
-&nbsp;&nbsp;&nbsp; patched_cves =3D oe.cve_check.get_patched_cves(d)<br>
-&nbsp;&nbsp;&nbsp; patched_cves =3D list(patched_cves)<br>
-<br>
-&nbsp;&nbsp;&nbsp; ignored_cves =3D d.getVar(&quot;CVE_CHECK_IGNORE&quot;)=
<br>
-&nbsp;&nbsp;&nbsp; if ignored_cves:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; patched_cves.extend(ignored_cve=
s.split())<br>
-<br>
-&nbsp;&nbsp;&nbsp; patched_cves =3D ' '.join(patched_cves)<br>
-&nbsp;&nbsp;&nbsp; if patched_cves:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recipe.sourceInfo =3D &quot;CVE=
s fixed: &quot; + patched_cves<br>
-<br>
-&nbsp;&nbsp;&nbsp; cpe_ids =3D oe.cve_check.get_cpe_ids(d.getVar(&quot;CVE=
_PRODUCT&quot;), d.getVar(&quot;CVE_VERSION&quot;))<br>
-&nbsp;&nbsp;&nbsp; if cpe_ids:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for cpe_id in cpe_ids:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpe =3D=
 oe.spdx.SPDXExternalReference()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpe.ref=
erenceCategory =3D &quot;SECURITY&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpe.ref=
erenceType =3D &quot;cpe23Type&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpe.ref=
erenceLocator =3D cpe_id<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recipe.=
externalRefs.append(cpe)<br>
-<br>
-&nbsp;&nbsp;&nbsp; doc.packages.append(recipe)<br>
-&nbsp;&nbsp;&nbsp; doc.add_relationship(doc, &quot;DESCRIBES&quot;, recipe=
)<br>
-<br>
-&nbsp;&nbsp;&nbsp; add_download_packages(d, doc, recipe)<br>
-<br>
-&nbsp;&nbsp;&nbsp; if oe.spdx_common.process_sources(d) and include_source=
s:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recipe_archive =3D deploy_dir_s=
pdx / &quot;recipes&quot; / (doc.name + &quot;.tar.zst&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with optional_tarfile(recipe_ar=
chive, archive_sources) as archive:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe.spdx=
_common.get_patched_src(d)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; add_pac=
kage_files(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; d,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; doc,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; recipe,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; spdx_workdir,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; lambda file_counter: &quot;SPDXRef-SourceFile-%s-%d&quot; =
% (d.getVar(&quot;PN&quot;), file_counter),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; lambda filepath: [&quot;SOURCE&quot;],<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; ignore_dirs=3D[&quot;.git&quot;],<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; ignore_top_level_dirs=3D[&quot;temp&quot;],<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; archive=3Darchive,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if arch=
ive is not None:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; recipe.packageFileName =3D str(recipe_archive.name)<br>
-<br>
-&nbsp;&nbsp;&nbsp; direct_deps =3D oe.spdx_common.collect_direct_deps(d, &=
quot;do_create_spdx&quot;)<br>
-&nbsp;&nbsp;&nbsp; dep_recipes =3D collect_dep_recipes(d, doc, recipe, dir=
ect_deps)<br>
-<br>
-&nbsp;&nbsp;&nbsp; doc_sha1 =3D oe.sbom.write_doc(d, doc, pkg_arch, &quot;=
recipes&quot;, indent=3Dget_json_indent(d))<br>
-&nbsp;&nbsp;&nbsp; dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, rec=
ipe))<br>
-<br>
-&nbsp;&nbsp;&nbsp; recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()<br>
-&nbsp;&nbsp;&nbsp; recipe_ref.externalDocumentId =3D &quot;DocumentRef-rec=
ipe-&quot; + recipe.name<br>
-&nbsp;&nbsp;&nbsp; recipe_ref.spdxDocument =3D doc.documentNamespace<br>
-&nbsp;&nbsp;&nbsp; recipe_ref.checksum.algorithm =3D &quot;SHA1&quot;<br>
-&nbsp;&nbsp;&nbsp; recipe_ref.checksum.checksumValue =3D doc_sha1<br>
-<br>
-&nbsp;&nbsp;&nbsp; sources =3D collect_dep_sources(d, dep_recipes)<br>
-&nbsp;&nbsp;&nbsp; found_licenses =3D {license.name:recipe_ref.externalDoc=
umentId + &quot;:&quot; + license.licenseId for license in doc.hasExtracted=
LicensingInfos}<br>
-<br>
-&nbsp;&nbsp;&nbsp; if not recipe_spdx_is_native(d, recipe):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.build.exec_func(&quot;read_s=
ubpackage_metadata&quot;, d)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkgdest =3D Path(d.getVar(&quot=
;PKGDEST&quot;))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for package in d.getVar(&quot;P=
ACKAGES&quot;).split():<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not =
oe.packagedata.packaged(package, d):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; continue<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc =3D oe.spdx.SPDXDocument()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_nam=
e =3D d.getVar(&quot;PKG:%s&quot; % package) or package<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.name =3D pkg_name<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.documentNamespace =3D get_namespace(d, package_doc.name)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.creationInfo.created =3D creation_time<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.creationInfo.comment =3D &quot;This document was created by analyzing =
packages created during the build.&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.creationInfo.licenseListVersion =3D get_license_list_version(license_d=
ata, d)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.creationInfo.creators.append(&quot;Tool: OpenEmbedded Core create-spdx=
.bbclass&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.creationInfo.creators.append(&quot;Organization: %s&quot; % d.getVar(&=
quot;SPDX_ORG&quot;))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.creationInfo.creators.append(&quot;Person: N/A ()&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.externalDocumentRefs.append(recipe_ref)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_license =3D d.getVar(&quot;LICENSE:%s&quot; % package) or d.getVar(&quot;L=
ICENSE&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_pa=
ckage =3D oe.spdx.SPDXPackage()<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_pa=
ckage.SPDXID =3D oe.sbom.get_package_spdxid(pkg_name)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_pa=
ckage.name =3D pkg_name<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_pa=
ckage.versionInfo =3D d.getVar(&quot;SPDX_PACKAGE_VERSION&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_pa=
ckage.licenseDeclared =3D convert_license_to_spdx(package_license, license_=
data, package_doc, d, found_licenses)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_pa=
ckage.supplier =3D d.getVar(&quot;SPDX_SUPPLIER&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.packages.append(spdx_package)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.add_relationship(spdx_package, &quot;GENERATED_FROM&quot;, &quot;%s:%s=
&quot; % (recipe_ref.externalDocumentId, recipe.SPDXID))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc.add_relationship(package_doc, &quot;DESCRIBES&quot;, spdx_package)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_archive =3D deploy_dir_spdx / &quot;packages&quot; / (package_doc.name + &=
quot;.tar.zst&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with op=
tional_tarfile(package_archive, archive_packaged) as archive:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; package_files =3D add_package_files(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package_doc,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_package,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkgdest / package,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lambda file_counter: oe.sbom.get_p=
ackaged_file_spdxid(pkg_name, file_counter),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lambda filepath: [&quot;BINARY&quo=
t;],<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ignore_top_level_dirs=3D['CONTROL'=
, 'DEBIAN'],<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; archive=3Darchive,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; )<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if archive is not None:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_package.packageFileName =3D s=
tr(package_archive.name)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; add_pac=
kage_sources_from_debug(d, package_doc, spdx_package, package, package_file=
s, sources)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe.sbom=
.write_doc(d, package_doc, pkg_arch, &quot;packages&quot;, indent=3Dget_jso=
n_indent(d))<br>
-}<br>
-do_create_spdx[vardepsexclude] +=3D &quot;BB_NUMBER_THREADS&quot;<br>
-# NOTE: depending on do_unpack is a hack that is necessary to get it's dep=
endencies for archive the source<br>
-addtask do_create_spdx after do_create_recipe_spdx do_package do_packageda=
ta do_unpack do_patch before do_populate_sdk do_build do_rm_work<br>
-<br>
-SSTATETASKS +=3D &quot;do_create_spdx&quot;<br>
-do_create_spdx[sstate-inputdirs] =3D &quot;${SPDXDEPLOY}&quot;<br>
-do_create_spdx[sstate-outputdirs] =3D &quot;${DEPLOY_DIR_SPDX}&quot;<br>
-<br>
-python do_create_spdx_setscene () {<br>
-&nbsp;&nbsp;&nbsp; sstate_setscene(d)<br>
-}<br>
-addtask do_create_spdx_setscene<br>
-<br>
-do_create_spdx[deptask] +=3D &quot;do_create_spdx&quot;<br>
-do_create_spdx[dirs] =3D &quot;${SPDXWORK}&quot;<br>
-do_create_spdx[cleandirs] =3D &quot;${SPDXDEPLOY} ${SPDXWORK}&quot;<br>
-do_create_spdx[depends] +=3D &quot; \<br>
-&nbsp;&nbsp;&nbsp; ${PATCHDEPENDENCY} \<br>
-&nbsp;&nbsp;&nbsp; ${@create_spdx_source_deps(d)} \<br>
-&quot;<br>
-<br>
-python do_create_runtime_spdx() {<br>
-&nbsp;&nbsp;&nbsp; from datetime import datetime, timezone<br>
-&nbsp;&nbsp;&nbsp; import oe.sbom<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx_common<br>
-&nbsp;&nbsp;&nbsp; import oe.packagedata<br>
-&nbsp;&nbsp;&nbsp; from pathlib import Path<br>
-<br>
-&nbsp;&nbsp;&nbsp; deploy_dir_spdx =3D Path(d.getVar(&quot;DEPLOY_DIR_SPDX=
&quot;))<br>
-&nbsp;&nbsp;&nbsp; spdx_deploy =3D Path(d.getVar(&quot;SPDXRUNTIMEDEPLOY&q=
uot;))<br>
-&nbsp;&nbsp;&nbsp; is_native =3D bb.data.inherits_class(&quot;native&quot;=
, d) or bb.data.inherits_class(&quot;cross&quot;, d)<br>
-<br>
-&nbsp;&nbsp;&nbsp; creation_time =3D datetime.now(tz=3Dtimezone.utc).strft=
ime(&quot;%Y-%m-%dT%H:%M:%SZ&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp; license_data =3D oe.spdx_common.load_spdx_license_data(=
d)<br>
-<br>
-&nbsp;&nbsp;&nbsp; direct_deps =3D oe.spdx_common.collect_direct_deps(d, &=
quot;do_create_spdx&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp; providers =3D oe.spdx_common.collect_package_providers(=
d, direct_deps)<br>
-&nbsp;&nbsp;&nbsp; pkg_arch =3D d.getVar(&quot;SSTATE_PKGARCH&quot;)<br>
-&nbsp;&nbsp;&nbsp; package_archs =3D d.getVar(&quot;SPDX_MULTILIB_SSTATE_A=
RCHS&quot;).split()<br>
-&nbsp;&nbsp;&nbsp; package_archs.reverse()<br>
-<br>
-&nbsp;&nbsp;&nbsp; if not is_native:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.build.exec_func(&quot;read_s=
ubpackage_metadata&quot;, d)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_package_cache =3D {}<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkgdest =3D Path(d.getVar(&quot=
;PKGDEST&quot;))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for package in d.getVar(&quot;P=
ACKAGES&quot;).split():<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; localda=
ta =3D bb.data.createCopy(d)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_nam=
e =3D d.getVar(&quot;PKG:%s&quot; % package) or package<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; localda=
ta.setVar(&quot;PKG&quot;, pkg_name)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; localda=
ta.setVar('OVERRIDES', d.getVar(&quot;OVERRIDES&quot;, False) + &quot;:&quo=
t; + package)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not =
oe.packagedata.packaged(package, localdata):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; continue<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_spd=
x_path =3D oe.sbom.doc_path(deploy_dir_spdx, pkg_name, pkg_arch, &quot;pack=
ages&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_doc, package_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_path)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for p i=
n package_doc.packages:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if p.name =3D=3D pkg_name:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_package =3D p<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bb.fatal(&quot;Package '%s' not found in %s&quot; % (pkg_n=
ame, pkg_spdx_path))<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_doc =3D oe.spdx.SPDXDocument()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_doc.name =3D &quot;runtime-&quot; + pkg_name<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_doc.documentNamespace =3D get_namespace(localdata, runtime_doc.name)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_doc.creationInfo.created =3D creation_time<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_doc.creationInfo.comment =3D &quot;This document was created by analyzing =
package runtime dependencies.&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_doc.creationInfo.licenseListVersion =3D get_license_list_version(license_d=
ata, d)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_doc.creationInfo.creators.append(&quot;Tool: OpenEmbedded Core create-spdx=
.bbclass&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_doc.creationInfo.creators.append(&quot;Organization: %s&quot; % d.getVar(&=
quot;SPDX_ORG&quot;))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_doc.creationInfo.creators.append(&quot;Person: N/A ()&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_ref =3D oe.spdx.SPDXExternalDocumentRef()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_ref.externalDocumentId =3D &quot;DocumentRef-package-&quot; + package<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_ref.spdxDocument =3D package_doc.documentNamespace<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_ref.checksum.algorithm =3D &quot;SHA1&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; package=
_ref.checksum.checksumValue =3D package_doc_sha1<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_doc.externalDocumentRefs.append(package_ref)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_doc.add_relationship(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; runtime_doc.SPDXID,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;AMENDS&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;%s:%s&quot; % (package_ref.externalDocumentId, packa=
ge_doc.SPDXID)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deps =
=3D bb.utils.explode_dep_versions2(localdata.getVar(&quot;RDEPENDS&quot;) o=
r &quot;&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seen_de=
ps =3D set()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for dep=
, _ in deps.items():<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if dep in seen_deps:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if dep not in providers:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; (dep, dep_hashfn) =3D providers[dep]<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if not oe.packagedata.packaged(dep, localdata):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; dep_pkg_data =3D oe.packagedata.read_subpkgdata_dict(dep, =
d)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; dep_pkg =3D dep_pkg_data[&quot;PKG&quot;]<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if dep in dep_package_cache:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (dep_spdx_package, dep_package_ref=
) =3D dep_package_cache[dep]<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; else:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_path =3D oe.sbom.doc_find_by_h=
ashfn(deploy_dir_spdx, package_archs, dep_pkg, dep_hashfn)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not dep_path:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.fatal(&=
quot;No SPDX file found for package %s, %s&quot; % (dep_pkg, dep_hashfn))<b=
r>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_dep_doc, spdx_dep_sha1 =3D oe=
.sbom.read_doc(dep_path)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for pkg in spdx_dep_doc.packages:<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if pkg.nam=
e =3D=3D dep_pkg:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; dep_spdx_package =3D pkg<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; break<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.fatal(&=
quot;Package '%s' not found in %s&quot; % (dep_pkg, dep_path))<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_package_ref =3D oe.spdx.SPDXEx=
ternalDocumentRef()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_package_ref.externalDocumentId=
 =3D &quot;DocumentRef-runtime-dependency-&quot; + spdx_dep_doc.name<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_package_ref.spdxDocument =3D s=
pdx_dep_doc.documentNamespace<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_package_ref.checksum.algorithm=
 =3D &quot;SHA1&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_package_ref.checksum.checksumV=
alue =3D spdx_dep_sha1<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dep_package_cache[dep] =3D (dep_sp=
dx_package, dep_package_ref)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; runtime_doc.externalDocumentRefs.append(dep_package_ref)<b=
r>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; runtime_doc.add_relationship(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s:%s&quot; % (dep_package_r=
ef.externalDocumentId, dep_spdx_package.SPDXID),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;RUNTIME_DEPENDENCY_OF&quot;,=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;%s:%s&quot; % (package_ref.e=
xternalDocumentId, spdx_package.SPDXID)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; )<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; seen_deps.add(dep)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oe.sbom=
.write_doc(d, runtime_doc, pkg_arch, &quot;runtime&quot;, spdx_deploy, inde=
nt=3Dget_json_indent(d))<br>
-}<br>
-<br>
-do_create_runtime_spdx[vardepsexclude] +=3D &quot;OVERRIDES SPDX_MULTILIB_=
SSTATE_ARCHS&quot;<br>
-<br>
-addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_=
work<br>
-SSTATETASKS +=3D &quot;do_create_runtime_spdx&quot;<br>
-do_create_runtime_spdx[sstate-inputdirs] =3D &quot;${SPDXRUNTIMEDEPLOY}&qu=
ot;<br>
-do_create_runtime_spdx[sstate-outputdirs] =3D &quot;${DEPLOY_DIR_SPDX}&quo=
t;<br>
-<br>
-python do_create_runtime_spdx_setscene () {<br>
-&nbsp;&nbsp;&nbsp; sstate_setscene(d)<br>
-}<br>
-addtask do_create_runtime_spdx_setscene<br>
-<br>
-do_create_runtime_spdx[dirs] =3D &quot;${SPDXRUNTIMEDEPLOY}&quot;<br>
-do_create_runtime_spdx[cleandirs] =3D &quot;${SPDXRUNTIMEDEPLOY}&quot;<br>
-do_create_runtime_spdx[deptask] =3D &quot;do_create_spdx&quot;<br>
-do_create_runtime_spdx[rdeptask] =3D &quot;do_create_spdx&quot;<br>
-<br>
-do_rootfs[recrdeptask] +=3D &quot;do_create_spdx do_create_runtime_spdx&qu=
ot;<br>
-do_rootfs[cleandirs] +=3D &quot;${SPDXIMAGEWORK}&quot;<br>
-<br>
-ROOTFS_POSTUNINSTALL_COMMAND =3D+ &quot;image_combine_spdx&quot;<br>
-<br>
-do_populate_sdk[recrdeptask] +=3D &quot;do_create_spdx do_create_runtime_s=
pdx&quot;<br>
-do_populate_sdk[cleandirs] +=3D &quot;${SPDXSDKWORK}&quot;<br>
-POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk =3D &quot; sdk_hos=
t_combine_spdx&quot;<br>
-POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk =3D &quot; sdk_t=
arget_combine_spdx&quot;<br>
-<br>
-python image_combine_spdx() {<br>
-&nbsp;&nbsp;&nbsp; import os<br>
-&nbsp;&nbsp;&nbsp; import oe.sbom<br>
-&nbsp;&nbsp;&nbsp; from pathlib import Path<br>
-&nbsp;&nbsp;&nbsp; from oe.rootfs import image_list_installed_packages<br>
-<br>
-&nbsp;&nbsp;&nbsp; image_name =3D d.getVar(&quot;IMAGE_NAME&quot;)<br>
-&nbsp;&nbsp;&nbsp; image_link_name =3D d.getVar(&quot;IMAGE_LINK_NAME&quot=
;)<br>
-&nbsp;&nbsp;&nbsp; imgdeploydir =3D Path(d.getVar(&quot;IMGDEPLOYDIR&quot;=
))<br>
-&nbsp;&nbsp;&nbsp; img_spdxid =3D oe.sbom.get_image_spdxid(image_name)<br>
-&nbsp;&nbsp;&nbsp; packages =3D image_list_installed_packages(d)<br>
-<br>
-&nbsp;&nbsp;&nbsp; combine_spdx(d, image_name, imgdeploydir, img_spdxid, p=
ackages, Path(d.getVar(&quot;SPDXIMAGEWORK&quot;)))<br>
-<br>
-&nbsp;&nbsp;&nbsp; def make_image_link(target_path, suffix):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if image_link_name:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; link =
=3D imgdeploydir / (image_link_name + suffix)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if link=
 !=3D target_path:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; link.symlink_to(os.path.relpath(target_path, link.parent))=
<br>
-<br>
-&nbsp;&nbsp;&nbsp; spdx_tar_path =3D imgdeploydir / (image_name + &quot;.s=
pdx.tar.zst&quot;)<br>
-&nbsp;&nbsp;&nbsp; make_image_link(spdx_tar_path, &quot;.spdx.tar.zst&quot=
;)<br>
-}<br>
-<br>
-python sdk_host_combine_spdx() {<br>
-&nbsp;&nbsp;&nbsp; sdk_combine_spdx(d, &quot;host&quot;)<br>
-}<br>
-<br>
-python sdk_target_combine_spdx() {<br>
-&nbsp;&nbsp;&nbsp; sdk_combine_spdx(d, &quot;target&quot;)<br>
-}<br>
-<br>
-def sdk_combine_spdx(d, sdk_type):<br>
-&nbsp;&nbsp;&nbsp; import oe.sbom<br>
-&nbsp;&nbsp;&nbsp; from pathlib import Path<br>
-&nbsp;&nbsp;&nbsp; from oe.sdk import sdk_list_installed_packages<br>
-<br>
-&nbsp;&nbsp;&nbsp; sdk_name =3D d.getVar(&quot;TOOLCHAIN_OUTPUTNAME&quot;)=
 + &quot;-&quot; + sdk_type<br>
-&nbsp;&nbsp;&nbsp; sdk_deploydir =3D Path(d.getVar(&quot;SDKDEPLOYDIR&quot=
;))<br>
-&nbsp;&nbsp;&nbsp; sdk_spdxid =3D oe.sbom.get_sdk_spdxid(sdk_name)<br>
-&nbsp;&nbsp;&nbsp; sdk_packages =3D sdk_list_installed_packages(d, sdk_typ=
e =3D=3D &quot;target&quot;)<br>
-&nbsp;&nbsp;&nbsp; combine_spdx(d, sdk_name, sdk_deploydir, sdk_spdxid, sd=
k_packages, Path(d.getVar('SPDXSDKWORK')))<br>
-<br>
-def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages=
, spdx_workdir):<br>
-&nbsp;&nbsp;&nbsp; import os<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx<br>
-&nbsp;&nbsp;&nbsp; import oe.sbom<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx_common<br>
-&nbsp;&nbsp;&nbsp; import io<br>
-&nbsp;&nbsp;&nbsp; import json<br>
-&nbsp;&nbsp;&nbsp; from datetime import timezone, datetime<br>
-&nbsp;&nbsp;&nbsp; from pathlib import Path<br>
-&nbsp;&nbsp;&nbsp; import tarfile<br>
-&nbsp;&nbsp;&nbsp; import bb.compress.zstd<br>
-<br>
-&nbsp;&nbsp;&nbsp; license_data =3D oe.spdx_common.load_spdx_license_data(=
d)<br>
-<br>
-&nbsp;&nbsp;&nbsp; direct_deps =3D oe.spdx_common.collect_direct_deps(d, &=
quot;do_create_spdx&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp; providers =3D oe.spdx_common.collect_package_providers(=
d, direct_deps)<br>
-&nbsp;&nbsp;&nbsp; package_archs =3D d.getVar(&quot;SPDX_MULTILIB_SSTATE_A=
RCHS&quot;).split()<br>
-&nbsp;&nbsp;&nbsp; package_archs.reverse()<br>
-<br>
-&nbsp;&nbsp;&nbsp; creation_time =3D datetime.now(tz=3Dtimezone.utc).strft=
ime(&quot;%Y-%m-%dT%H:%M:%SZ&quot;)<br>
-&nbsp;&nbsp;&nbsp; deploy_dir_spdx =3D Path(d.getVar(&quot;DEPLOY_DIR_SPDX=
&quot;))<br>
-&nbsp;&nbsp;&nbsp; source_date_epoch =3D d.getVar(&quot;SOURCE_DATE_EPOCH&=
quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp; doc =3D oe.spdx.SPDXDocument()<br>
-&nbsp;&nbsp;&nbsp; doc.name =3D rootfs_name<br>
-&nbsp;&nbsp;&nbsp; doc.documentNamespace =3D get_namespace(d, doc.name)<br=
>
-&nbsp;&nbsp;&nbsp; doc.creationInfo.created =3D creation_time<br>
-&nbsp;&nbsp;&nbsp; doc.creationInfo.comment =3D &quot;This document was cr=
eated by analyzing the source of the Yocto recipe during the build.&quot;<b=
r>
-&nbsp;&nbsp;&nbsp; doc.creationInfo.licenseListVersion =3D get_license_lis=
t_version(license_data, d)<br>
-&nbsp;&nbsp;&nbsp; doc.creationInfo.creators.append(&quot;Tool: OpenEmbedd=
ed Core create-spdx.bbclass&quot;)<br>
-&nbsp;&nbsp;&nbsp; doc.creationInfo.creators.append(&quot;Organization: %s=
&quot; % d.getVar(&quot;SPDX_ORG&quot;))<br>
-&nbsp;&nbsp;&nbsp; doc.creationInfo.creators.append(&quot;Person: N/A ()&q=
uot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp; image =3D oe.spdx.SPDXPackage()<br>
-&nbsp;&nbsp;&nbsp; image.name =3D d.getVar(&quot;PN&quot;)<br>
-&nbsp;&nbsp;&nbsp; image.versionInfo =3D d.getVar(&quot;SPDX_PACKAGE_VERSI=
ON&quot;)<br>
-&nbsp;&nbsp;&nbsp; image.SPDXID =3D rootfs_spdxid<br>
-&nbsp;&nbsp;&nbsp; image.supplier =3D d.getVar(&quot;SPDX_SUPPLIER&quot;)<=
br>
-<br>
-&nbsp;&nbsp;&nbsp; doc.packages.append(image)<br>
-<br>
-&nbsp;&nbsp;&nbsp; if packages:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for name in sorted(packages.key=
s()):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if name=
 not in providers:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bb.note(&quot;Unable to find SPDX provider for '%s'&quot; =
% name)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; continue<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_nam=
e, pkg_hashfn =3D providers[name]<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_spd=
x_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, pkg_n=
ame, pkg_hashfn)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not =
pkg_spdx_path:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bb.fatal(&quot;No SPDX file found for package %s, %s&quot;=
 % (pkg_name, pkg_hashfn))<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_doc=
, pkg_doc_sha1 =3D oe.sbom.read_doc(pkg_spdx_path)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for p i=
n pkg_doc.packages:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if p.name =3D=3D name:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_ref =3D oe.spdx.SPDXExternalDo=
cumentRef()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_ref.externalDocumentId =3D &qu=
ot;DocumentRef-%s&quot; % pkg_doc.name<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_ref.spdxDocument =3D pkg_doc.d=
ocumentNamespace<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_ref.checksum.algorithm =3D &qu=
ot;SHA1&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg_ref.checksum.checksumValue =3D=
 pkg_doc_sha1<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc.externalDocumentRefs.append(pk=
g_ref)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc.add_relationship(image, &quot;=
CONTAINS&quot;, &quot;%s:%s&quot; % (pkg_ref.externalDocumentId, p.SPDXID))=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bb.fatal(&quot;Unable to find package with name '%s' in SP=
DX file %s&quot; % (name, pkg_spdx_path))<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_spdx_path =3D oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, &=
quot;runtime-&quot; + name, pkg_hashfn)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not =
runtime_spdx_path:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; bb.fatal(&quot;No runtime SPDX document found for %s, %s&q=
uot; % (name, pkg_hashfn))<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_doc, runtime_doc_sha1 =3D oe.sbom.read_doc(runtime_spdx_path)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_ref =3D oe.spdx.SPDXExternalDocumentRef()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_ref.externalDocumentId =3D &quot;DocumentRef-%s&quot; % runtime_doc.name<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_ref.spdxDocument =3D runtime_doc.documentNamespace<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_ref.checksum.algorithm =3D &quot;SHA1&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runtime=
_ref.checksum.checksumValue =3D runtime_doc_sha1<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # &quot=
;OTHER&quot; isn't ideal here, but I can't find a relationship that makes s=
ense<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc.ext=
ernalDocumentRefs.append(runtime_ref)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc.add=
_relationship(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; image,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;OTHER&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;%s:%s&quot; % (runtime_ref.externalDocumentId, runti=
me_doc.SPDXID),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; comment=3D&quot;Runtime dependencies for %s&quot; % name<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
-&nbsp;&nbsp;&nbsp; bb.utils.mkdirhier(spdx_workdir)<br>
-&nbsp;&nbsp;&nbsp; image_spdx_path =3D spdx_workdir / (rootfs_name + &quot=
;.spdx.json&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp; with image_spdx_path.open(&quot;wb&quot;) as f:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc.to_json(f, sort_keys=3DTrue=
, indent=3Dget_json_indent(d))<br>
-<br>
-&nbsp;&nbsp;&nbsp; num_threads =3D int(d.getVar(&quot;BB_NUMBER_THREADS&qu=
ot;))<br>
-<br>
-&nbsp;&nbsp;&nbsp; visited_docs =3D set()<br>
-<br>
-&nbsp;&nbsp;&nbsp; index =3D {&quot;documents&quot;: []}<br>
-<br>
-&nbsp;&nbsp;&nbsp; spdx_tar_path =3D rootfs_deploydir / (rootfs_name + &qu=
ot;.spdx.tar.zst&quot;)<br>
-&nbsp;&nbsp;&nbsp; with bb.compress.zstd.open(spdx_tar_path, &quot;w&quot;=
, num_threads=3Dnum_threads) as f:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with tarfile.open(fileobj=3Df, =
mode=3D&quot;w|&quot;) as tar:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def col=
lect_spdx_document(path):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; nonlocal tar<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; nonlocal deploy_dir_spdx<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; nonlocal source_date_epoch<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; nonlocal index<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if path in visited_docs:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; visited_docs.add(path)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; with path.open(&quot;rb&quot;) as f:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc, sha1 =3D oe.sbom.read_doc(f)<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f.seek(0)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if doc.documentNamespace in visite=
d_docs:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.note(&quot;Adding SPDX document=
 %s&quot; % path)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; visited_docs.add(doc.documentNames=
pace)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info =3D tar.gettarinfo(fileobj=3D=
f)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.name =3D doc.name + &quot;.sp=
dx.json&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.uid =3D 0<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.gid =3D 0<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.uname =3D &quot;root&quot;<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.gname =3D &quot;root&quot;<br=
>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if source_date_epoch is not None a=
nd info.mtime &gt; int(source_date_epoch):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.mtime=
 =3D int(source_date_epoch)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tar.addfile(info, f)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; index[&quot;documents&quot;].appen=
d({<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;file=
name&quot;: info.name,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;docu=
mentNamespace&quot;: doc.documentNamespace,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;sha1=
&quot;: sha1,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; })<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; for ref in doc.externalDocumentRefs:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ref_path =3D oe.sbom.doc_find_by_n=
amespace(deploy_dir_spdx, package_archs, ref.spdxDocument)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not ref_path:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.fatal(&=
quot;Cannot find any SPDX file for document %s&quot; % ref.spdxDocument)<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; collect_spdx_document(ref_path)<br=
>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; collect=
_spdx_document(image_spdx_path)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; index[&=
quot;documents&quot;].sort(key=3Dlambda x: x[&quot;filename&quot;])<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; index_s=
tr =3D io.BytesIO(json.dumps(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; index,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; sort_keys=3DTrue,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; indent=3Dget_json_indent(d),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ).encod=
e(&quot;utf-8&quot;))<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info =
=3D tarfile.TarInfo()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.na=
me =3D &quot;index.json&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.si=
ze =3D len(index_str.getvalue())<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.ui=
d =3D 0<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.gi=
d =3D 0<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.un=
ame =3D &quot;root&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; info.gn=
ame =3D &quot;root&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tar.add=
file(info, fileobj=3Dindex_str)<br>
-<br>
-combine_spdx[vardepsexclude] +=3D &quot;BB_NUMBER_THREADS SPDX_MULTILIB_SS=
TATE_ARCHS&quot;<br>
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py<br>
deleted file mode 100644<br>
index fd4b6895d8..0000000000<br>
--- a/meta/lib/oe/sbom.py<br>
+++ /dev/null<br>
@@ -1,120 +0,0 @@<br>
-#<br>
-# Copyright OpenEmbedded Contributors<br>
-#<br>
-# SPDX-License-Identifier: GPL-2.0-only<br>
-#<br>
-<br>
-import collections<br>
-<br>
-DepRecipe =3D collections.namedtuple(&quot;DepRecipe&quot;, (&quot;doc&quo=
t;, &quot;doc_sha1&quot;, &quot;recipe&quot;))<br>
-DepSource =3D collections.namedtuple(&quot;DepSource&quot;, (&quot;doc&quo=
t;, &quot;doc_sha1&quot;, &quot;recipe&quot;, &quot;file&quot;))<br>
-<br>
-<br>
-def get_recipe_spdxid(d):<br>
-&nbsp;&nbsp;&nbsp; return &quot;SPDXRef-%s-%s&quot; % (&quot;Recipe&quot;,=
 d.getVar(&quot;PN&quot;))<br>
-<br>
-<br>
-def get_download_spdxid(d, idx):<br>
-&nbsp;&nbsp;&nbsp; return &quot;SPDXRef-Download-%s-%d&quot; % (d.getVar(&=
quot;PN&quot;), idx)<br>
-<br>
-<br>
-def get_package_spdxid(pkg):<br>
-&nbsp;&nbsp;&nbsp; return &quot;SPDXRef-Package-%s&quot; % pkg<br>
-<br>
-<br>
-def get_source_file_spdxid(d, idx):<br>
-&nbsp;&nbsp;&nbsp; return &quot;SPDXRef-SourceFile-%s-%d&quot; % (d.getVar=
(&quot;PN&quot;), idx)<br>
-<br>
-<br>
-def get_packaged_file_spdxid(pkg, idx):<br>
-&nbsp;&nbsp;&nbsp; return &quot;SPDXRef-PackagedFile-%s-%d&quot; % (pkg, i=
dx)<br>
-<br>
-<br>
-def get_image_spdxid(img):<br>
-&nbsp;&nbsp;&nbsp; return &quot;SPDXRef-Image-%s&quot; % img<br>
-<br>
-<br>
-def get_sdk_spdxid(sdk):<br>
-&nbsp;&nbsp;&nbsp; return &quot;SPDXRef-SDK-%s&quot; % sdk<br>
-<br>
-<br>
-def _doc_path_by_namespace(spdx_deploy, arch, doc_namespace):<br>
-&nbsp;&nbsp;&nbsp; return spdx_deploy / &quot;by-namespace&quot; / arch / =
doc_namespace.replace(&quot;/&quot;, &quot;_&quot;)<br>
-<br>
-<br>
-def doc_find_by_namespace(spdx_deploy, search_arches, doc_namespace):<br>
-&nbsp;&nbsp;&nbsp; for pkgarch in search_arches:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p =3D _doc_path_by_namespace(sp=
dx_deploy, pkgarch, doc_namespace)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if os.path.exists(p):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
p<br>
-&nbsp;&nbsp;&nbsp; return None<br>
-<br>
-<br>
-def _doc_path_by_hashfn(spdx_deploy, arch, doc_name, hashfn):<br>
-&nbsp;&nbsp;&nbsp; return (<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_deploy / &quot;by-hash&quo=
t; / arch / hashfn.split()[1] / (doc_name + &quot;.spdx.json&quot;)<br>
-&nbsp;&nbsp;&nbsp; )<br>
-<br>
-<br>
-def doc_find_by_hashfn(spdx_deploy, search_arches, doc_name, hashfn):<br>
-&nbsp;&nbsp;&nbsp; for pkgarch in search_arches:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p =3D _doc_path_by_hashfn(spdx_=
deploy, pkgarch, doc_name, hashfn)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if os.path.exists(p):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
p<br>
-&nbsp;&nbsp;&nbsp; return None<br>
-<br>
-<br>
-def doc_path(spdx_deploy, doc_name, arch, subdir):<br>
-&nbsp;&nbsp;&nbsp; return spdx_deploy / arch / subdir / (doc_name + &quot;=
.spdx.json&quot;)<br>
-<br>
-<br>
-def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=3DNone, indent=3DNone=
):<br>
-&nbsp;&nbsp;&nbsp; from pathlib import Path<br>
-<br>
-&nbsp;&nbsp;&nbsp; if spdx_deploy is None:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_deploy =3D Path(d.getVar(&=
quot;SPDXDEPLOY&quot;))<br>
-<br>
-&nbsp;&nbsp;&nbsp; dest =3D doc_path(spdx_deploy, spdx_doc.name, arch, sub=
dir)<br>
-&nbsp;&nbsp;&nbsp; dest.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)<br>
-&nbsp;&nbsp;&nbsp; with dest.open(&quot;wb&quot;) as f:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc_sha1 =3D spdx_doc.to_json(f=
, sort_keys=3DTrue, indent=3Dindent)<br>
-<br>
-&nbsp;&nbsp;&nbsp; l =3D _doc_path_by_namespace(spdx_deploy, arch, spdx_do=
c.documentNamespace)<br>
-&nbsp;&nbsp;&nbsp; l.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)<br>
-&nbsp;&nbsp;&nbsp; l.symlink_to(os.path.relpath(dest, l.parent))<br>
-<br>
-&nbsp;&nbsp;&nbsp; l =3D _doc_path_by_hashfn(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_deploy, arch, spdx_doc.nam=
e, d.getVar(&quot;BB_HASHFILENAME&quot;)<br>
-&nbsp;&nbsp;&nbsp; )<br>
-&nbsp;&nbsp;&nbsp; l.parent.mkdir(exist_ok=3DTrue, parents=3DTrue)<br>
-&nbsp;&nbsp;&nbsp; l.symlink_to(os.path.relpath(dest, l.parent))<br>
-<br>
-&nbsp;&nbsp;&nbsp; return doc_sha1<br>
-<br>
-<br>
-def read_doc(fn):<br>
-&nbsp;&nbsp;&nbsp; import hashlib<br>
-&nbsp;&nbsp;&nbsp; import oe.spdx<br>
-&nbsp;&nbsp;&nbsp; import io<br>
-&nbsp;&nbsp;&nbsp; import contextlib<br>
-<br>
-&nbsp;&nbsp;&nbsp; @contextlib.contextmanager<br>
-&nbsp;&nbsp;&nbsp; def get_file():<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if isinstance(fn, io.IOBase):<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yield f=
n<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with fn=
.open(&quot;rb&quot;) as f:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; yield f<br>
-<br>
-&nbsp;&nbsp;&nbsp; with get_file() as f:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sha1 =3D hashlib.sha1()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while True:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chunk =
=3D f.read(4096)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not =
chunk:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; break<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sha1.up=
date(chunk)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f.seek(0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doc =3D oe.spdx.SPDXDocument.fr=
om_json(f)<br>
-<br>
-&nbsp;&nbsp;&nbsp; return (doc, sha1.hexdigest())<br>
diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py<br>
deleted file mode 100644<br>
index 7aaf2af5ed..0000000000<br>
--- a/meta/lib/oe/spdx.py<br>
+++ /dev/null<br>
@@ -1,357 +0,0 @@<br>
-#<br>
-# Copyright OpenEmbedded Contributors<br>
-#<br>
-# SPDX-License-Identifier: GPL-2.0-only<br>
-#<br>
-<br>
-#<br>
-# This library is intended to capture the JSON SPDX specification in a typ=
e<br>
-# safe manner. It is not intended to encode any particular OE specific<br>
-# behaviors, see the sbom.py for that.<br>
-#<br>
-# The documented SPDX spec document doesn't cover the JSON syntax for<br>
-# particular configuration, which can make it hard to determine what the J=
SON<br>
-# syntax should be. I've found it is actually much simpler to read the off=
icial<br>
-# SPDX JSON schema which can be found here: <a href=3D"https://github.com/=
spdx/spdx-spec">
https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fspdx%2Fspdx-spec&amp;data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7C=
b55ec66fdc694391aa7208de8a924852%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0=
%7C639100558059258824%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiO=
iIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7=
C&amp;sdata=3D%2BVln%2FHYRh1ohkoxiJBVPujrZaQqIW99UUvXjgAqAR8I%3D&amp;reserv=
ed=3D0</a><br>
-# in schemas/spdx-schema.json<br>
-#<br>
-<br>
-import hashlib<br>
-import itertools<br>
-import json<br>
-<br>
-SPDX_VERSION =3D &quot;2.2&quot;<br>
-<br>
-<br>
-#<br>
-# The following are the support classes that are used to implement SPDX ob=
ject<br>
-#<br>
-<br>
-class _Property(object):<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-&nbsp;&nbsp;&nbsp; A generic SPDX object property. The different types wil=
l derive from this<br>
-&nbsp;&nbsp;&nbsp; class<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp; def __init__(self, *, default=3DNone):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.default =3D default<br>
-<br>
-&nbsp;&nbsp;&nbsp; def setdefault(self, dest, name):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if self.default is not None:<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dest.se=
tdefault(name, self.default)<br>
-<br>
-<br>
-class _String(_Property):<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-&nbsp;&nbsp;&nbsp; A scalar string property for an SPDX object<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp; def __init__(self, **kwargs):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; super().__init__(**kwargs)<br>
-<br>
-&nbsp;&nbsp;&nbsp; def set_property(self, attrs, name):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def get_helper(obj):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
obj._spdx[name]<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def set_helper(obj, value):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; obj._sp=
dx[name] =3D value<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def del_helper(obj):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; del obj=
._spdx[name]<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; attrs[name] =3D property(get_he=
lper, set_helper, del_helper)<br>
-<br>
-&nbsp;&nbsp;&nbsp; def init(self, source):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return source<br>
-<br>
-<br>
-class _Object(_Property):<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-&nbsp;&nbsp;&nbsp; A scalar SPDX object property of a SPDX object<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp; def __init__(self, cls, **kwargs):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; super().__init__(**kwargs)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.cls =3D cls<br>
-<br>
-&nbsp;&nbsp;&nbsp; def set_property(self, attrs, name):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def get_helper(obj):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not =
name in obj._spdx:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; obj._spdx[name] =3D self.cls()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
obj._spdx[name]<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def set_helper(obj, value):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; obj._sp=
dx[name] =3D value<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def del_helper(obj):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; del obj=
._spdx[name]<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; attrs[name] =3D property(get_he=
lper, set_helper)<br>
-<br>
-&nbsp;&nbsp;&nbsp; def init(self, source):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return self.cls(**source)<br>
-<br>
-<br>
-class _ListProperty(_Property):<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-&nbsp;&nbsp;&nbsp; A list of SPDX properties<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp; def __init__(self, prop, **kwargs):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; super().__init__(**kwargs)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.prop =3D prop<br>
-<br>
-&nbsp;&nbsp;&nbsp; def set_property(self, attrs, name):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def get_helper(obj):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not =
name in obj._spdx:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; obj._spdx[name] =3D []<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
obj._spdx[name]<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def set_helper(obj, value):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; obj._sp=
dx[name] =3D list(value)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def del_helper(obj):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; del obj=
._spdx[name]<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; attrs[name] =3D property(get_he=
lper, set_helper, del_helper)<br>
-<br>
-&nbsp;&nbsp;&nbsp; def init(self, source):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return [self.prop.init(o) for o=
 in source]<br>
-<br>
-<br>
-class _StringList(_ListProperty):<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-&nbsp;&nbsp;&nbsp; A list of strings as a property for an SPDX object<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp; def __init__(self, **kwargs):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; super().__init__(_String(), **k=
wargs)<br>
-<br>
-<br>
-class _ObjectList(_ListProperty):<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-&nbsp;&nbsp;&nbsp; A list of SPDX objects as a property for an SPDX object=
<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp; def __init__(self, cls, **kwargs):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; super().__init__(_Object(cls), =
**kwargs)<br>
-<br>
-<br>
-class MetaSPDXObject(type):<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-&nbsp;&nbsp;&nbsp; A metaclass that allows properties (anything derived fr=
om a _Property<br>
-&nbsp;&nbsp;&nbsp; class) to be defined for a SPDX object<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-&nbsp;&nbsp;&nbsp; def __new__(mcls, name, bases, attrs):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; attrs[&quot;_properties&quot;] =
=3D {}<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for key in attrs.keys():<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if isin=
stance(attrs[key], _Property):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; prop =3D attrs[key]<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; attrs[&quot;_properties&quot;][key] =3D prop<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; prop.set_property(attrs, key)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return super().__new__(mcls, na=
me, bases, attrs)<br>
-<br>
-<br>
-class SPDXObject(metaclass=3DMetaSPDXObject):<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-&nbsp;&nbsp;&nbsp; The base SPDX object; all SPDX spec classes must derive=
 from this class<br>
-&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
-&nbsp;&nbsp;&nbsp; def __init__(self, **d):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self._spdx =3D {}<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for name, prop in self._propert=
ies.items():<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prop.se=
tdefault(self._spdx, name)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if name=
 in d:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; self._spdx[name] =3D prop.init(d[name])<br>
-<br>
-&nbsp;&nbsp;&nbsp; def serializer(self):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return self._spdx<br>
-<br>
-&nbsp;&nbsp;&nbsp; def __setattr__(self, name, value):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if name in self._properties or =
name =3D=3D &quot;_spdx&quot;:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; super()=
.__setattr__(name, value)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; raise KeyError(&quot;%r is not =
a valid SPDX property&quot; % name)<br>
-<br>
-#<br>
-# These are the SPDX objects implemented from the spec. The *only* propert=
ies<br>
-# that can be added to these objects are ones directly specified in the SP=
DX<br>
-# spec, however you may add helper functions to make operations easier.<br=
>
-#<br>
-# Defaults should *only* be specified if the SPDX spec says there is a cer=
tain<br>
-# required value for a field (e.g. dataLicense), or if the field is mandat=
ory<br>
-# and has some sane &quot;this field is unknown&quot; (e.g. &quot;NOASSERT=
ION&quot;)<br>
-#<br>
-<br>
-class SPDXAnnotation(SPDXObject):<br>
-&nbsp;&nbsp;&nbsp; annotationDate =3D _String()<br>
-&nbsp;&nbsp;&nbsp; annotationType =3D _String()<br>
-&nbsp;&nbsp;&nbsp; annotator =3D _String()<br>
-&nbsp;&nbsp;&nbsp; comment =3D _String()<br>
-<br>
-class SPDXChecksum(SPDXObject):<br>
-&nbsp;&nbsp;&nbsp; algorithm =3D _String()<br>
-&nbsp;&nbsp;&nbsp; checksumValue =3D _String()<br>
-<br>
-<br>
-class SPDXRelationship(SPDXObject):<br>
-&nbsp;&nbsp;&nbsp; spdxElementId =3D _String()<br>
-&nbsp;&nbsp;&nbsp; relatedSpdxElement =3D _String()<br>
-&nbsp;&nbsp;&nbsp; relationshipType =3D _String()<br>
-&nbsp;&nbsp;&nbsp; comment =3D _String()<br>
-&nbsp;&nbsp;&nbsp; annotations =3D _ObjectList(SPDXAnnotation)<br>
-<br>
-<br>
-class SPDXExternalReference(SPDXObject):<br>
-&nbsp;&nbsp;&nbsp; referenceCategory =3D _String()<br>
-&nbsp;&nbsp;&nbsp; referenceType =3D _String()<br>
-&nbsp;&nbsp;&nbsp; referenceLocator =3D _String()<br>
-<br>
-<br>
-class SPDXPackageVerificationCode(SPDXObject):<br>
-&nbsp;&nbsp;&nbsp; packageVerificationCodeValue =3D _String()<br>
-&nbsp;&nbsp;&nbsp; packageVerificationCodeExcludedFiles =3D _StringList()<=
br>
-<br>
-<br>
-class SPDXPackage(SPDXObject):<br>
-&nbsp;&nbsp;&nbsp; ALLOWED_CHECKSUMS =3D [<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SHA1&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SHA224&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SHA256&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SHA384&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SHA512&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MD2&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MD4&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MD5&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MD6&quot;,<br>
-&nbsp;&nbsp;&nbsp; ]<br>
-<br>
-&nbsp;&nbsp;&nbsp; name =3D _String()<br>
-&nbsp;&nbsp;&nbsp; SPDXID =3D _String()<br>
-&nbsp;&nbsp;&nbsp; versionInfo =3D _String()<br>
-&nbsp;&nbsp;&nbsp; downloadLocation =3D _String(default=3D&quot;NOASSERTIO=
N&quot;)<br>
-&nbsp;&nbsp;&nbsp; supplier =3D _String(default=3D&quot;NOASSERTION&quot;)=
<br>
-&nbsp;&nbsp;&nbsp; homepage =3D _String()<br>
-&nbsp;&nbsp;&nbsp; licenseConcluded =3D _String(default=3D&quot;NOASSERTIO=
N&quot;)<br>
-&nbsp;&nbsp;&nbsp; licenseDeclared =3D _String(default=3D&quot;NOASSERTION=
&quot;)<br>
-&nbsp;&nbsp;&nbsp; summary =3D _String()<br>
-&nbsp;&nbsp;&nbsp; description =3D _String()<br>
-&nbsp;&nbsp;&nbsp; sourceInfo =3D _String()<br>
-&nbsp;&nbsp;&nbsp; copyrightText =3D _String(default=3D&quot;NOASSERTION&q=
uot;)<br>
-&nbsp;&nbsp;&nbsp; licenseInfoFromFiles =3D _StringList(default=3D[&quot;N=
OASSERTION&quot;])<br>
-&nbsp;&nbsp;&nbsp; externalRefs =3D _ObjectList(SPDXExternalReference)<br>
-&nbsp;&nbsp;&nbsp; packageVerificationCode =3D _Object(SPDXPackageVerifica=
tionCode)<br>
-&nbsp;&nbsp;&nbsp; hasFiles =3D _StringList()<br>
-&nbsp;&nbsp;&nbsp; packageFileName =3D _String()<br>
-&nbsp;&nbsp;&nbsp; annotations =3D _ObjectList(SPDXAnnotation)<br>
-&nbsp;&nbsp;&nbsp; checksums =3D _ObjectList(SPDXChecksum)<br>
-<br>
-<br>
-class SPDXFile(SPDXObject):<br>
-&nbsp;&nbsp;&nbsp; SPDXID =3D _String()<br>
-&nbsp;&nbsp;&nbsp; fileName =3D _String()<br>
-&nbsp;&nbsp;&nbsp; licenseConcluded =3D _String(default=3D&quot;NOASSERTIO=
N&quot;)<br>
-&nbsp;&nbsp;&nbsp; copyrightText =3D _String(default=3D&quot;NOASSERTION&q=
uot;)<br>
-&nbsp;&nbsp;&nbsp; licenseInfoInFiles =3D _StringList(default=3D[&quot;NOA=
SSERTION&quot;])<br>
-&nbsp;&nbsp;&nbsp; checksums =3D _ObjectList(SPDXChecksum)<br>
-&nbsp;&nbsp;&nbsp; fileTypes =3D _StringList()<br>
-<br>
-<br>
-class SPDXCreationInfo(SPDXObject):<br>
-&nbsp;&nbsp;&nbsp; created =3D _String()<br>
-&nbsp;&nbsp;&nbsp; licenseListVersion =3D _String()<br>
-&nbsp;&nbsp;&nbsp; comment =3D _String()<br>
-&nbsp;&nbsp;&nbsp; creators =3D _StringList()<br>
-<br>
-<br>
-class SPDXExternalDocumentRef(SPDXObject):<br>
-&nbsp;&nbsp;&nbsp; externalDocumentId =3D _String()<br>
-&nbsp;&nbsp;&nbsp; spdxDocument =3D _String()<br>
-&nbsp;&nbsp;&nbsp; checksum =3D _Object(SPDXChecksum)<br>
-<br>
-<br>
-class SPDXExtractedLicensingInfo(SPDXObject):<br>
-&nbsp;&nbsp;&nbsp; name =3D _String()<br>
-&nbsp;&nbsp;&nbsp; comment =3D _String()<br>
-&nbsp;&nbsp;&nbsp; licenseId =3D _String()<br>
-&nbsp;&nbsp;&nbsp; extractedText =3D _String()<br>
-<br>
-<br>
-class SPDXDocument(SPDXObject):<br>
-&nbsp;&nbsp;&nbsp; spdxVersion =3D _String(default=3D&quot;SPDX-&quot; + S=
PDX_VERSION)<br>
-&nbsp;&nbsp;&nbsp; dataLicense =3D _String(default=3D&quot;CC0-1.0&quot;)<=
br>
-&nbsp;&nbsp;&nbsp; SPDXID =3D _String(default=3D&quot;SPDXRef-DOCUMENT&quo=
t;)<br>
-&nbsp;&nbsp;&nbsp; name =3D _String()<br>
-&nbsp;&nbsp;&nbsp; documentNamespace =3D _String()<br>
-&nbsp;&nbsp;&nbsp; creationInfo =3D _Object(SPDXCreationInfo)<br>
-&nbsp;&nbsp;&nbsp; packages =3D _ObjectList(SPDXPackage)<br>
-&nbsp;&nbsp;&nbsp; files =3D _ObjectList(SPDXFile)<br>
-&nbsp;&nbsp;&nbsp; relationships =3D _ObjectList(SPDXRelationship)<br>
-&nbsp;&nbsp;&nbsp; externalDocumentRefs =3D _ObjectList(SPDXExternalDocume=
ntRef)<br>
-&nbsp;&nbsp;&nbsp; hasExtractedLicensingInfos =3D _ObjectList(SPDXExtracte=
dLicensingInfo)<br>
-<br>
-&nbsp;&nbsp;&nbsp; def __init__(self, **d):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; super().__init__(**d)<br>
-<br>
-&nbsp;&nbsp;&nbsp; def to_json(self, f, *, sort_keys=3DFalse, indent=3DNon=
e, separators=3DNone):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; class Encoder(json.JSONEncoder)=
:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def def=
ault(self, o):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if isinstance(o, SPDXObject):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return o.serializer()<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return super().default(o)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sha1 =3D hashlib.sha1()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for chunk in Encoder(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sort_ke=
ys=3Dsort_keys,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; indent=
=3Dindent,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; separat=
ors=3Dseparators,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ).iterencode(self):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chunk =
=3D chunk.encode(&quot;utf-8&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f.write=
(chunk)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sha1.up=
date(chunk)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return sha1.hexdigest()<br>
-<br>
-&nbsp;&nbsp;&nbsp; @classmethod<br>
-&nbsp;&nbsp;&nbsp; def from_json(cls, f):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cls(**json.load(f))<br>
-<br>
-&nbsp;&nbsp;&nbsp; def add_relationship(self, _from, relationship, _to, *,=
 comment=3DNone, annotation=3DNone):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if isinstance(_from, SPDXObject=
):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from_sp=
dxid =3D _from.SPDXID<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from_sp=
dxid =3D _from<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if isinstance(_to, SPDXObject):=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to_spdx=
id =3D _to.SPDXID<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to_spdx=
id =3D _to<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D SPDXRelationship(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdxEle=
mentId=3Dfrom_spdxid,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; related=
SpdxElement=3Dto_spdxid,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; relatio=
nshipType=3Drelationship,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if comment is not None:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r.comme=
nt =3D comment<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if annotation is not None:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r.annot=
ations.append(annotation)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.relationships.append(r)<br=
>
-<br>
-&nbsp;&nbsp;&nbsp; def find_by_spdxid(self, spdxid):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for o in itertools.chain(self.p=
ackages, self.files):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if o.SP=
DXID =3D=3D spdxid:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return o<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return None<br>
-<br>
-&nbsp;&nbsp;&nbsp; def find_external_document_ref(self, namespace):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for r in self.externalDocumentR=
efs:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if r.sp=
dxDocument =3D=3D namespace:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return r<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return None<br>
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/=
cases/spdx.py<br>
index 83e4890d44..c563fd1011 100644<br>
--- a/meta/lib/oeqa/selftest/cases/spdx.py<br>
+++ b/meta/lib/oeqa/selftest/cases/spdx.py<br>
@@ -4,74 +4,13 @@<br>
&nbsp;# SPDX-License-Identifier: MIT<br>
&nbsp;#<br>
&nbsp;<br>
-import json<br>
-import os<br>
&nbsp;import textwrap<br>
&nbsp;import hashlib<br>
-from pathlib import Path<br>
&nbsp;from oeqa.selftest.case import OESelftestTestCase<br>
-from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runCmd<b=
r>
+from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars<br>
&nbsp;import oe.spdx30<br>
&nbsp;<br>
&nbsp;<br>
-class SPDX22Check(OESelftestTestCase):<br>
-&nbsp;&nbsp;&nbsp; @classmethod<br>
-&nbsp;&nbsp;&nbsp; def setUpClass(cls):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; super().setUpClass()<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bitbake(&quot;python3-spdx-tool=
s-native&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bitbake(&quot;-c addto_recipe_s=
ysroot python3-spdx-tools-native&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp; def check_recipe_spdx(self, high_level_dir, spdx_file, =
target_name):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config =3D textwrap.dedent(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&=
quot;&quot;\<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INHERIT=
:remove =3D &quot;create-spdx&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INHERIT=
 +=3D &quot;create-spdx-2.2&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;&=
quot;&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.write_config(config)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deploy_dir =3D get_bb_var(&quot=
;DEPLOY_DIR&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arch_dir =3D get_bb_var(&quot;P=
ACKAGE_ARCH&quot;, target_name)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spdx_version =3D get_bb_var(&qu=
ot;SPDX_VERSION&quot;)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # qemux86-64 creates the direct=
ory qemux86_64<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # arch_dir =3D arch_var.replace=
(&quot;-&quot;, &quot;_&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; full_file_path =3D os.path.join=
(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deploy_=
dir, &quot;spdx&quot;, spdx_version, arch_dir, high_level_dir, spdx_file<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; os.remo=
ve(full_file_path)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; except FileNotFoundError:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass<br=
>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bitbake(&quot;%s -c create_spdx=
&quot; % target_name)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def check_spdx_json(filename):<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with op=
en(filename) as f:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; report =3D json.load(f)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; self.assertNotEqual(report, None)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; self.assertNotEqual(report[&quot;SPDXID&quot;], None)<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; python =
=3D os.path.join(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; get_bb_var(&quot;STAGING_BINDIR&quot;, &quot;python3-spdx-=
tools-native&quot;),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;nativepython3&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; validat=
or =3D os.path.join(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; get_bb_var(&quot;STAGING_BINDIR&quot;, &quot;python3-spdx-=
tools-native&quot;), &quot;pyspdxtools&quot;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =
=3D runCmd(&quot;{} {} -i {}&quot;.format(python, validator, filename))<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.assertExists(full_file_pat=
h)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D check_spdx_json(full=
_file_path)<br>
-<br>
-&nbsp;&nbsp;&nbsp; def test_spdx_base_files(self):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.check_recipe_spdx(&quot;pa=
ckages&quot;, &quot;base-files.spdx.json&quot;, &quot;base-files&quot;)<br>
-<br>
-&nbsp;&nbsp;&nbsp; def test_spdx_tar(self):<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.check_recipe_spdx(&quot;pa=
ckages&quot;, &quot;tar.spdx.json&quot;, &quot;tar&quot;)<br>
-<br>
-<br>
&nbsp;class SPDX3CheckBase(object):<br>
&nbsp;&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp; Base class for checking SPDX 3 based tests<br>
--<br>
2.53.0<br>
<br>
</div>
</div>
</div>
</body>
</html>

--_000_PA3PR07MB10721C5BB6F5C7F61B6E3D24B8A49APA3PR07MB10721eu_--

