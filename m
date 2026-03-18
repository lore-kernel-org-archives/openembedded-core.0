Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08193FCD0C1
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 07:31:08 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8661.1773819066950275663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 00:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=zDwdRhC8;
 spf=pass (domain: siemens.com, ip: 40.107.162.11, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FckKoYzpuq4gPVkJWqCUIWp4bharZhJsOYJ7SHtRrMCuJGe4JhiaRzxZj94aAu5zDL04iNadCeIXoAPQPW1AmPKR91wyZJ4g1Giqv5H0S696OeROjRZLa91ds8if+jEqe303bApYSzVsEsxOUoCfg7Wf2rpJoDa2trvocznP5gv70Vyf42fA+7XHX3AeI/0QWeO8ZakAYtuYaIiPZn3M25vKQ+6qQO2UyYXUBP5VoUusqcdg+WAOpk/xC+cUnKHHYB2LksodYVbl1ZyO2TDPj2H2OpZVfHQXZXvuPapMMJNjPq3bmOI216OeRGUB1/pwgRmQaWEJ+3/mhK6IWgQdsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rmggAMKRM6HFkiTEP73PQwxEm5IR2mav6o+jrNcJbE=;
 b=QkeJW+2j2PVnRERyoXCZ20oasEVkeuxjjhklDoI/Cg/MAUuhd31C2nOp0oS+b3ObBuvteoBRpwI/+ufBn0n6Yodnfgqzf5jsBSGPELFfyA47+Sfmp5zR9x7nH2VjjhJxoNMzxxczq1s20t8wMGp1x95yeX9hsWdyQeDDk2eYl5mts84kX+jsBT+cfwT/VYXuXshe4u9j/ddL9431T1n9G0qzj/PrNzKwZjRkrgwlj2BBhH+ULt96Cin9Z/aEOxJe8zqBZ2jdwr8NsOg/v6vK/6fGCGbI7I7SsonmA38vyz7SnvrhXsOhmE/wZnQoPJvMR3Ns3L5h7Ww7ZT1E0euO0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rmggAMKRM6HFkiTEP73PQwxEm5IR2mav6o+jrNcJbE=;
 b=zDwdRhC89uNXQwO+g6y0hIJpnwsPfcE6f6dkY43HcSXmytcncMZhRP7HsA7owgxKusmhEyMy6q2jMIksYuSAiIWcSVp0vzApjvujqvU3HeoESRWfThoFT7wlFOejXwPIlHWlrbFq//5Y7GG2o3dnCh8OEGnFHtlSAUHpXb8SGYPosqo8VMTaqHmBPb5bkwsmZdJYyaMvxKiiBtHugjOLtSLPk7AouSB+luEnXyEzEEZpCs04LKtJZfsg5s0Yl/VQuJ5h/HhGmlffb6D96U3fZCE82aK1RSX/1BEQxEsiSvftbonHTut3YsPybhHjyqirmfzyjx3X+uaLpuGyathz0A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS2PR10MB6686.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 07:31:02 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 07:31:01 +0000
From: "Marko, Peter (FT D EU SK BFS1)" <Peter.Marko@siemens.com>
To: "hetpat@cisco.com" <hetpat@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>,
	"vchavda@cisco.com" <vchavda@cisco.com>
Subject: RE: [OE-core] [scarthgap] [PATCH v1 1/4] cve-check: encode affected
 product/vendor in CVE_STATUS
Thread-Topic: [OE-core] [scarthgap] [PATCH v1 1/4] cve-check: encode affected
 product/vendor in CVE_STATUS
Thread-Index: AQHctpmOnZo0ZDhVCUujwD22poJ5MbWz4gJw
Date: Wed, 18 Mar 2026 07:31:00 +0000
Message-ID: 
 <AS1PR10MB56970E86A59E00B8CA3F389DFD4EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260318053906.26606-1-hetpat@cisco.com>
 <20260318053906.26606-2-hetpat@cisco.com>
In-Reply-To: <20260318053906.26606-2-hetpat@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=02211f1f-7979-4330-9646-2299942f0bd0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-18T07:19:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS2PR10MB6686:EE_
x-ms-office365-filtering-correlation-id: f05e71ac-7574-4f54-d2ee-08de84c04e09
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|55112099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 VIAvK7tbd4syRdoar0I7+i9RzncY+xKnPOhuMJVDdPYPW0T0nXvsoBHekVFmRHwFFtLjB3tVGxjEiekmwPxOgJhdZtoqOORXONsclXJbetDF5MS9S8Zpfx0pQnE2d+V8klFONazkPWZarpnSnvunEcO9gJ6a1cm/afPglU7jj/TqcoLSOJhS+bRWIv4QmIJV7ybWopJX+ShVAV6NKzlN1HwliIt9woWHZaxeg+2bt+Dqz2XdbDbUjZ7d/LPAbHMTLOzPUo+Bky+zq8enZW1GjEVAznN7N7ywQbQI9mrmA/xAWB0vV/zNNJO8VhjoNYhxwaxggcmiKS6QsEYubAu51c+m7YaKhzG+w/d0avqojN4NWnv71iVn0RFnFejXNiwUKuJqfS2gLyjP7RpOgwXs8A5ELqi6hL7o4pDSwOu9AkpURcHIIEM9jBL9xVbcnbBX0m2svgjPBvVyN/UAEPx+//0UYEVIMFafaiJOezBkDYflucAZnKYssSPzGbZJ9URN/mXTef5g5WWiJ40/7RbnKRNl62vh+ms17IWDo6XAzQelp5uVBhxl18ERXvRsAHqhWfNhowwb6kfwGHqjkVY0/ZAakZHwWX25qhZVS+HPwo+877PqpCANG1c1s7pezOAEQaIwB0U0Ta1vflSp/GTnLQpxaIx8f3IzgEZfjo5INivo5nOscmi6gsVpwa04BLfNOau6ZnvdLrZJ2yH3KLrbQq7cG3ZqroIhEdbTXFScc0e+9EyGJ7qtvxq8gzCgqGGV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(55112099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?t/9srocK0jnPEtfhKvLzIrGyPceC7bZWK2GiMueagEGWywcJlgdr6vwxj1vt?=
 =?us-ascii?Q?O4vlKXF1OxiKBc6XR7NR3HU3wjLRl8fQhnghRjtSsyc2Au9f0B7/uRDKzPgX?=
 =?us-ascii?Q?NQ5htfiFQUJHdwhtUGqJQG440vAisG8W+deGRVdrtBzkl4g5YHYcAqH2e3Zv?=
 =?us-ascii?Q?jJXLAas7Mf52tatY0yhZGYeNAxa7qPwYEGRQM1nZhGbFlhV972XKZaum2VRk?=
 =?us-ascii?Q?ecRQxPiFUgoEhefMQKjrR1vAVPBknSYuUNsh1Flct4at/vbp1zonP5QXpk1P?=
 =?us-ascii?Q?x6x2nAus1OP8rWlPTLMQ+3KeHL4J0q7p7R7ykaBfYMBOU7Dvq7sVNYNvDcFG?=
 =?us-ascii?Q?3XI8I8uXaggaEViD2+L627Ticpc+0HrEhpFPl1UBmj+nl8NFmKa+abGGHSZ2?=
 =?us-ascii?Q?Xdq0OREnUWUHbJo8YP/uuZfYx55sdHjK28rMsuwGvIyNnjFiwC4LIYYpV8Ju?=
 =?us-ascii?Q?sib+zvxf2hrAXfOUsiECAzNW14T4H6D4HUV00qcIsB3FLfYUJ3f8eE9jxf2x?=
 =?us-ascii?Q?wloG30d9Vw2g1GizBVrTjTS2UlMV0frKuVl0Tpi9Jg9LxrH/r2dqEehTbOoC?=
 =?us-ascii?Q?8wLeIoiu0YULYIW5i8fmULtkDKbt+297JZOUyYeWElfxL7PEk0RWy9I+K7vg?=
 =?us-ascii?Q?QlD1kjPf5sBi7Fir07iRxru9qqUqhoPnec3R7bpLxXxgFiyZinDv2WPmsSpf?=
 =?us-ascii?Q?E/8W0kwXOwdlVB2l9+/2Cyu+GHyrGYmBUxwBWMszwm+3xUnvqej9fsbDDdwR?=
 =?us-ascii?Q?C5E65Vfpy5z5g8VIZaXiwHA8SeLSGe0E2hhy8Dn+ngKYmgxPLG/GSG08c7IQ?=
 =?us-ascii?Q?G07Hw54OFFm0ClgLl5c9wPaSSfxfvpzdxbBE+dJ4t14sXXFCqK68vucSKvtn?=
 =?us-ascii?Q?Ckx8m6JCNC/hHJ91iP6wBHJL42bNMrAna+7Crawqei3wzL3CyWbsjxt206wN?=
 =?us-ascii?Q?MOoHTTgEbv0E0RqgHkv8NLeRQMEdKyapiebWdLmwkShbZ6W6VT+iuMt97dU1?=
 =?us-ascii?Q?cyk/If5bXSdu5alHXvzzQk1OiXjKWQ2Shs5V5xqhhkM7SL5Mw8Ca3EDtL92g?=
 =?us-ascii?Q?1Up/ZLZ0g3/KG1yeuykz/7RX1IcgYcszumFkp4Jh1XQRbVMirzSw59ue8NEX?=
 =?us-ascii?Q?JCYezWTy3VV1uEJtHbQx13JdqacRrR+7mEq3LkBLHzzcK1A803cshkEIClsK?=
 =?us-ascii?Q?f8qssdsGcqBrUPROiMEe/5ukV5Tw8f4mz6LRrFMrzxdGLc2TS8NWOKW05uxY?=
 =?us-ascii?Q?Rwn7/PTh40WwoOqRAhvTYdyzs6CA9bhkAjecj6oHqEkdb/e5UaBpLyK7Noje?=
 =?us-ascii?Q?im3gmcoiAAnIPM138utXt6CihzsW8HVQvSvlZ7RjFNZsc4Brzj37iinzLtg+?=
 =?us-ascii?Q?LwrzVXsOZoMgKORpPcsZK28go2rNMzhi9YBDxkbdNEklUmQ3XU4QJL33woe7?=
 =?us-ascii?Q?53BuPDttkl8iTlxZ4cuPcE1iMZC6tp481bZalDmj4+t+Zmw6+H+EnwKwNo6F?=
 =?us-ascii?Q?m2tuR352WXKpPoYmJHS5KyP8gsB/FmKmkYGM1NikaQnzs6Q9YTfzXMveR4HB?=
 =?us-ascii?Q?vs/qzuQBaCm/lyd2q4FxogwS1W9s1BIFgVrQsY26wvyVRRvD6pkLUVN6abWi?=
 =?us-ascii?Q?Jr+3iMKus6uBlAvgryMexLo30P5yQcpolsRgKYWAuRHHNFZJyGZW4fsayk08?=
 =?us-ascii?Q?jFK2YI08Ay6BfZpHOe9sycuD9JHbrHRKF6uPzetLr72pjMST+p6BJn+f1YkC?=
 =?us-ascii?Q?sg+DUiwpTQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f05e71ac-7574-4f54-d2ee-08de84c04e09
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 07:31:01.0219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VsxfXClGybZGAtXiJJf5rnw/zaoO+6qOnyhSqawrxBBdXUaCGqwGvoyGb9F0WjbclG8v8wxCe9F6W7+E9zX8zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6686
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 07:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233365

This commit needs two additional fixes:
https://git.openembedded.org/openembedded-core/commit/?id=3D3c4d8ca41ac0b42=
9af92bf0ea84f1dfd0cda9e1f
https://git.openembedded.org/openembedded-core/commit/?id=3Dcc33dd9176726cb=
4b2d2f142ed1bc655da8e0a9f

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Het Patel via
> lists.openembedded.org
> Sent: Wednesday, March 18, 2026 6:39
> To: openembedded-core@lists.openembedded.org
> Cc: xe-linux-external@cisco.com; vchavda@cisco.com
> Subject: [OE-core] [scarthgap] [PATCH v1 1/4] cve-check: encode affected
> product/vendor in CVE_STATUS
>=20
> From: Marta Rybczynska <rybczynska@gmail.com>
>=20
> CVE_STATUS contains assesment of a given CVE, but until now it didn't hav=
e
> include the affected vendor/product. In the case of a global system inclu=
de,
> that CVE_STATUS was visible in all recipes.
>=20
> This patch allows encoding of affected product/vendor to each CVE_STATUS
> assessment, also for groups. We can then filter them later and use only
> CVEs that correspond to the recipe.
>=20
> This is going to be used in meta/conf/distro/include/cve-extra-exclusions=
.inc
> and similar places.
>=20
> Backport Changes:
> - Discarded the changes to meta/lib/oe/spdx30_tasks.py, as the
> commit history for this file diverges from the base commit
> itself (9c9b9545049a in the scarthgap branch).
> - Additionally, the changes do not introduce any major features
> and are primarily focused on code restructuring.
>=20
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit abca80a716e92fc18d3085aba1a15f4bac72379c)
> Signed-off-by: Het Patel <hetpat@cisco.com>
> ---
>  meta/classes/cve-check.bbclass | 24 ++++++++++-----------
>  meta/lib/oe/cve_check.py       | 39 ++++++++++++++++++++++++++--------
>  2 files changed, 42 insertions(+), 21 deletions(-)
>=20
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index 3f4704fb4e..de5ddf6f04 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -316,8 +316,8 @@ def check_cves(d, patched_cves):
>      # Convert CVE_STATUS into ignored CVEs and check validity
>      cve_ignore =3D []
>      for cve in (d.getVarFlags("CVE_STATUS") or {}):
> -        decoded_status, _, _ =3D decode_cve_status(d, cve)
> -        if decoded_status =3D=3D "Ignored":
> +        decoded_status =3D decode_cve_status(d, cve)
> +        if 'mapping' in decoded_status and decoded_status['mapping'] =3D=
=3D
> "Ignored":
>              cve_ignore.append(cve)
>=20
>      import sqlite3
> @@ -500,11 +500,11 @@ def cve_write_data_text(d, patched, unpatched,
> ignored, cve_data):
>          write_string +=3D "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDP=
E"),
> d.getVar("PV"))
>          write_string +=3D "CVE: %s\n" % cve
>          write_string +=3D "CVE STATUS: %s\n" % status
> -        _, detail, description =3D decode_cve_status(d, cve)
> -        if detail:
> -            write_string +=3D "CVE DETAIL: %s\n" % detail
> -        if description:
> -            write_string +=3D "CVE DESCRIPTION: %s\n" % description
> +        status_details =3D decode_cve_status(d, cve)
> +        if 'detail' in status_details:
> +            write_string +=3D "CVE DETAIL: %s\n" % status_details['detai=
l']
> +        if 'description' in status_details:
> +            write_string +=3D "CVE DESCRIPTION: %s\n" %
> status_details['description']
>          write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
>          write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["sc=
orev2"]
>          write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["sc=
orev3"]
> @@ -632,11 +632,11 @@ def cve_write_data_json(d, patched, unpatched,
> ignored, cve_data, cve_status):
>              "status" : status,
>              "link": issue_link
>          }
> -        _, detail, description =3D decode_cve_status(d, cve)
> -        if detail:
> -            cve_item["detail"] =3D detail
> -        if description:
> -            cve_item["description"] =3D description
> +        status_details =3D decode_cve_status(d, cve)
> +        if 'detail' in status_details:
> +            cve_item["detail"] =3D status_details['detail']
> +        if 'description' in status_details:
> +            cve_item["description"] =3D status_details['description']
>          cve_list.append(cve_item)
>=20
>      package_data["issue"] =3D cve_list
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index 7c09b78242..767d1a6750 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -132,8 +132,8 @@ def get_patched_cves(d):
>=20
>      # Search for additional patched CVEs
>      for cve in (d.getVarFlags("CVE_STATUS") or {}):
> -        decoded_status, _, _ =3D decode_cve_status(d, cve)
> -        if decoded_status =3D=3D "Patched":
> +        decoded_status =3D decode_cve_status(d, cve)
> +        if 'mapping' in decoded_status and decoded_status['mapping'] =3D=
=3D
> "Patched":
>              bb.debug(2, "CVE %s is additionally patched" % cve)
>              patched_cves.add(cve)
>=20
> @@ -227,22 +227,43 @@ def convert_cve_version(version):
>=20
>  def decode_cve_status(d, cve):
>      """
> -    Convert CVE_STATUS into status, detail and description.
> +    Convert CVE_STATUS into status, vendor, product, detail and descript=
ion.
>      """
>      status =3D d.getVarFlag("CVE_STATUS", cve)
>      if not status:
> -        return ("", "", "")
> +        return {}
> +
> +    status_split =3D status.split(':', 5)
> +    status_out =3D {}
> +    status_out["detail"] =3D status_split[0]
> +    product =3D "*"
> +    vendor =3D "*"
> +    description =3D ""
> +    if len(status_split) >=3D 4 and status_split[1].strip() =3D=3D "cpe"=
:
> +        # Both vendor and product are mandatory if cpe: present, the syn=
tax is
> then:
> +        # detail: cpe:vendor:product:description
> +        vendor =3D status_split[2].strip()
> +        product =3D status_split[3].strip()
> +        description =3D status_split[4].strip()
> +    elif len(status_split) >=3D 2 and status_split[1].strip() =3D=3D "cp=
e":
> +        # Malformed CPE
> +        bb.warn('Invalid CPE information for CVE_STATUS[%s] =3D "%s", no=
t setting
> CPE' % (detail, cve, status))
> +    else:
> +        # Other case: no CPE, the syntax is then:
> +        # detail: description
> +        description =3D status_split[len(status_split)-1].strip() if (le=
n(status_split) > 1)
> else ""
>=20
> -    status_split =3D status.split(':', 1)
> -    detail =3D status_split[0]
> -    description =3D status_split[1].strip() if (len(status_split) > 1) e=
lse ""
> +    status_out["vendor"] =3D vendor
> +    status_out["product"] =3D product
> +    status_out["description"] =3D description
>=20
> -    status_mapping =3D d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
> +    status_mapping =3D d.getVarFlag("CVE_CHECK_STATUSMAP",
> status_out['detail'])
>      if status_mapping is None:
>          bb.warn('Invalid detail "%s" for CVE_STATUS[%s] =3D "%s", fallba=
ck to
> Unpatched' % (detail, cve, status))
>          status_mapping =3D "Unpatched"
> +    status_out["mapping"] =3D status_mapping
>=20
> -    return (status_mapping, detail, description)
> +    return status_out
>=20
>  def extend_cve_status(d):
>      # do this only once in case multiple classes use this

