Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8303C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 04:39:15 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14098.1782794348624008516
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 21:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=PyflJn5Q;
 spf=pass (domain: est.tech, ip: 52.101.70.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftjG3Pwc/VpcwEyk6TlBzEplKXdV32Q2nifnLW9YnlXXu1b1ZxHq/lZB7QIMCZL6QClsKXcrl5KxLuP7kNr2JvMAZt3nKYGNh95HNu848S4C3onKhMMFFbZao4i6FOr6NsVnnW2GJik/XKZH9nsezIewStfa2UqmBo8OXCuQpwyxKkReNE5caIFhIVDmaTpW74anYM/g7ekXmmyutABxcdXaWUqD6D1yAvjbnDHwqpVPkREpVwsyJmi3oLDAyPpT9h6FrPW0wkE7dIg9MCvkYq0Lk13c5nSTiHMoRVUyOS6x9azWD17xpcdf2PERlplG8pi8+hoDRmJ2g/ribqvoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d06QAhHKVp8hyp/pJFyHCzrMfFUQY0vPbyrNqo0Yi5M=;
 b=TK0/ybOVHacgN9FsMliD7Lu/Kpn1Y8m9EZoV3Wr0xUaTzAkEd6gg3Yk1tFDHTiYI735svY2o95HIxh9iw4jq5lr+zSpe1x8uipGhN2/w0d7gThghI3Hj9dtFSBaSOhgIQeWXjQF0YI4zI8yqbASe777z35N+5rII9jTs8CIN6TrihcFhRTQ36qSPR5o2djOtkS2ZgCU0HctbqSHxDDsyGv2aWR1cafcjX5Pi9xHak/wtmakjSNzIPD4AILj4T/a9LLm1PIzJ/cgcTTU2Q6ecwgcVUaxwa3VAyv/GeUaVQ/qHk/YmtVTsbVZaBfztOrUq1ws8goWjgAixWqRCQa/bbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d06QAhHKVp8hyp/pJFyHCzrMfFUQY0vPbyrNqo0Yi5M=;
 b=PyflJn5QxsRJKoUuR75+/i709IzI9JHphewbrCxAS8bB22xDvP8SN/cd1hXnf0HNuL9IhEZ92aBR+CIhDkz4Zd+I1XzJ2UuU/fM8D4hTd7q//HrEjQK//FiVyT+gE1DnKDSnJ7IgDHECZO81O8QOHhKo6QHUVW9q2uvTg8dM5seH4aogs5IXhrRk0fwjxTyizi7UAnHqmGjplpTYq2qZ5kGxW3us/xMdjc8kQer7okGvNzTF2ncS9meL54Od1PIhHcKjbndi/pGgjN2jLjP3YwA2sED/yE0DFAKrgwlWvJiZ5IrK7+Csuz/UM7VuBOs00K72tAB3cWKoa48+CwlS+g==
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PAWP189MB2545.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 04:39:03 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 04:39:03 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: Jaipaul Cheernam via lists.openembedded.org
	<jaipaul.cheernam=est.tech@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Jaipaul Cheernam
	<jaipaul.cheernam@est.tech>, "yoann.congal@smile.fr" <yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2] curl: fix CVE-2026-5773 - wrong
 reuse of SMB connection
Thread-Topic: [OE-core] [scarthgap][PATCH v2] curl: fix CVE-2026-5773 - wrong
 reuse of SMB connection
Thread-Index: AQHdA7RZnqCNaZK1qE2SBTivFOXcJ7ZWjNuZ
Date: Tue, 30 Jun 2026 04:39:03 +0000
Message-ID: 
 <DU7PPF66507B2D74801DCDBE0149F5394B9F3F72@DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM>
References: <20260623074847.3424-1-jaipaul.cheernam@est.tech>
 <18BBF7650C0584E5.1138462@lists.openembedded.org>
In-Reply-To: <18BBF7650C0584E5.1138462@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PPF66507B2D7:EE_|PAWP189MB2545:EE_
x-ms-office365-filtering-correlation-id: 0b012e8f-ba0b-4f23-193a-08ded6618346
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|38070700021|56012099006|3023799007|4143699003|22082099003|18002099003|11063799006|8096899003|13003099007;
x-microsoft-antispam-message-info: 
 LzfQoHNmM9WnjH9p5XZXkny+FdS7GIiAGSf9PVk24wQBPf5RHB+wa2kRMUgT+TvPk/J44Zgcl411bMURT5U1YxXC48RQQfDVPRkeNaXjV1K0fWHlDnN6M5Sz0hhvyc42Uoqp6aBVZtk+0pACulg01W303uDjn0C+hrVby4mopsM7lhOCwx+c+NRiGkBnte9n+SMu+Q1h7J0lbaNQdQeSk5OM8nO6Fbp7NdYEhiACI9zncmwODy5V6xgowb1x8s+F2WC6R9gQUWkO3pdXzr9X9S1Sujsiu1gskMBhrPmnrTYDE3j13skan4TLnuBR2xBtlaFugcFbwtlGe7C7NuLyjYFZF1BI61IhzvrCsED2c1qFA5iV8SSYkU0XS+x2IYAvLbbaVnrJPtniuKSk3EJBr2xMQ7eAP+aTRTs7XG1wSnQkOflrv4h3QBsZrHKrtsXNZKqsYye2ao7hfh81+UoSaRVv/DOAs3n0v7CoUqoln6HGQJd5ySfUpTZfVCfEdjcCyfap7ZMAJNZlYF9/Q3AbfJi+6DxwegUcuc8FahF5eBm1kLuvNNAWqK2vp0kXOuzlWBUfWP3ohUA0jgchtR2zYfxhC5vfNlAuM9Xg+dKhs7nJmIzEI/rrvIbAlp9Qy4Y4UJmr6gV1nsAAq/qxKtKOw+GKXWXfBQw+T1rHiEVhjlI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(56012099006)(3023799007)(4143699003)(22082099003)(18002099003)(11063799006)(8096899003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?FxnOlZz4nsfpsAQBINdemoncJk6XFA434TMCzyER3iin1YnyuQoStbQa?=
 =?Windows-1252?Q?myqPdEziM61N3Qy914p3SGcWPJeK6BIg2EqI0AkBqlOtwcs1rQPFy6TE?=
 =?Windows-1252?Q?wt/xvDf6nbdA7hIqGGxxrBClPQxz1jdxb6GduAS0fFCO1liITyuq4zkr?=
 =?Windows-1252?Q?xg1U34oitcAeuWicYcjYqd7wVDAVHmdM7/88ROrOlGLjWSnwSh7dfP0U?=
 =?Windows-1252?Q?k9lAG92wviuRPhv0rJgDmXYmG70tBasnEm/mY1CSlbRh40aj0luDaxfr?=
 =?Windows-1252?Q?M3a3fpCo87yoilxZgVLzhOV6QJ4x+PbcD2awaIKBoFW/c6emDBJDTEMY?=
 =?Windows-1252?Q?Yz2X9A8C4FQZ64aVaTjU8fzceMQnAMGMJ2jAnI50EfjTKGtDpsKg9Jl2?=
 =?Windows-1252?Q?l/2c0gbv5ctVeXLxm9cS84g75kkAk3yOgFeR12c2p0R/d6g4g3OKyxoE?=
 =?Windows-1252?Q?QshAN70oIe/Wr/TVGu+NPM2Ti9aJDcHgywXmnCsGXpgH+Ig9YWGrxxQM?=
 =?Windows-1252?Q?luEDJ9suPg8nv82CtXSGhj/8JKIz+3ihLoOVcNQ2NtAuLvWfnp/gecrB?=
 =?Windows-1252?Q?smAhxCiQd9xJHFrXHqGNO1bUJnmzEZwdDiFFVA4PrH/daTDikTva8QlO?=
 =?Windows-1252?Q?fbvCSlF6g4aJCkZ8m3x0oNCV2PnOOggvrNTvFMju2uHzegmW37bLErHn?=
 =?Windows-1252?Q?bhc6PPU3GmihBKwYmbgpY8WtbJlHzrCJZ0dW7l50WFwNnZIJcCZTIsiJ?=
 =?Windows-1252?Q?FXWIifrdf+wlR9Z2CaDM1stEYB1pyJUrAQeqOodsqsYgVlVL2+DtexTN?=
 =?Windows-1252?Q?QputRdnUe/htQSSLTIZ12Wr0zMVR1uGk7MOlrLNEHXbygnvGFsDAuaGo?=
 =?Windows-1252?Q?lGa4wicGfrhWgRbNBU9xXw3A6pOQvN+wUZd+TQDeKQlV4EuVugZzr+n7?=
 =?Windows-1252?Q?9T8Hhj0MZfBdR8qS5gMWGqaASwbppZmvt393h5hFCplTptr5FvE+6JsY?=
 =?Windows-1252?Q?i8HC3X4u/zHrdhBR2KV/0WHoyWXEMH5N+wP+mf0NPTJxUO6MuZQi7/74?=
 =?Windows-1252?Q?5kTQHNfTmAVbo9Fab3yNCatuR+eNgsc8Nzjr9nAtVnB+xdoTW4XNM0Qd?=
 =?Windows-1252?Q?dS97fLDb/t/qX0782GT+I3PsHfQ4UKUNQXbYOEkNvDLasFdmbUIH4Bvi?=
 =?Windows-1252?Q?zPXO8d0J9OFlDTbLcf4OV7EN7IsVzT0DzYo21xKtaXygVEXtbLXsfL4V?=
 =?Windows-1252?Q?wP1IGHLPm/uayeDKRtI45z+ha1R2VdIeGrBBfXGm+iLBlLoM3f2zoOdP?=
 =?Windows-1252?Q?/A0JMufrIDfhMHdKpf4SrHI3dqsGGnMm6yK/2eE3a0Z6ZH1mEMH8roJB?=
 =?Windows-1252?Q?9i0gp+QkMHdaWbCfy4d1rJC+JN9ZiyrCUj/84UD/+SZRvXWQk4X6/dZC?=
 =?Windows-1252?Q?sq2G/69czY6kk01fDyD9bm90L8DUH06l8QxNVxo8w1SHgF7WEWxE1p4d?=
 =?Windows-1252?Q?IDisXXqXnM8L01sD6bEOKQSYz0lECC1EaYT6uncfzqtwijLS9/4OzPnq?=
 =?Windows-1252?Q?6vqIl6e9Mb6O6hjjcdnt8zmrk7QZ72ZKg0nBdtc4T+r7HTpFFQxixtI/?=
 =?Windows-1252?Q?GB8XSDT9jY3tzgvCJoXkES3lECYKsBtLEOv+PZPfXHuZSEYyKEMPiQIh?=
 =?Windows-1252?Q?lz2GHIdXDIqkZ5yv1qIgV2vUZNFarE+c5H2fW9a8nKkcTqYOv8NNRqNa?=
 =?Windows-1252?Q?8/ICyioouDzRzo+6EFxQFoFybbRGbbNsazWhrx2jdfBV1ABschOIpDyM?=
 =?Windows-1252?Q?HSCgWzIl9CoUa3ZmleiDKWdSHYWOdJFvt+jpRk6kYXQ1XPnK+ADejjfI?=
 =?Windows-1252?Q?vZmZBvtFNNi7gQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DU7PPF66507B2D74801DCDBE0149F5394B9F3F72DU7PPF66507B2D7_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b012e8f-ba0b-4f23-193a-08ded6618346
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 04:39:03.5598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2YyUpAKJagnVoLynDtuzV6PNAzE2jvXXNZEG7OdY3BSV3UM4KmmWmrO2qHif0kh4QtAzUy0t60vvzoizWzEN+dRc3Uk4HfJ1kH5C2WRVzMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2545
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 04:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239831

--_000_DU7PPF66507B2D74801DCDBE0149F5394B9F3F72DU7PPF66507B2D7_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I see that status in patch work shows Changes Requested but I didn=92t see =
any response on this mail thread .

Can you check

Regards,
Jaipaul
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Jaipaul Cheernam via lists.openembedded.org <ja=
ipaul.cheernam=3Dest.tech@lists.openembedded.org>
Sent: Wednesday, June 24, 2026 10:34 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [OE-core] [scarthgap][PATCH v2] curl: fix CVE-2026-5773 - wrong re=
use of SMB connection

libcurl's SMB handler marks connections for reuse (connkeep) without
verifying that subsequent requests target the same share. This allows
a second SMB request to the same host to reuse a connection
authenticated for a different share, potentially accessing data
without proper authorization.

The upstream fix removes connection reuse for SMB entirely in
lib/protocol.c, a file introduced in curl 8.20.0. For 8.7.1, the
equivalent fix is changing connkeep() to connclose() in lib/smb.c,
which prevents the connection from being returned to the pool.

Tested with SMBv1 server (Docker dperson/samba):
  Without patch: "Re-using existing connection" for different shares
  With patch: New connection per request, no reuse

Binary verified: Curl_conncontrol arg changes from 0 (KEEP) to 1 (CLOSE)

Reference: https://curl.se/docs/CVE-2026-5773.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../curl/curl/CVE-2026-5773.patch             | 41 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/reci=
pes-support/curl/curl/CVE-2026-5773.patch
new file mode 100644
index 0000000000..0a5fa588fe
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
@@ -0,0 +1,41 @@
+From 74a169575d6412dc0ff532acdf94de35a6c2a571 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 5 Apr 2026 18:23:35 +0200
+Subject: [PATCH] protocol: disable connection reuse for SMB(S)
+
+Connections should only be reused when using the same "share" (and
+perhaps some additional conditions), but instead of fixing this flaw,
+this change completely disables connection reuse for SMB. This protocol
+is about to get dropped soon anyway.
+
+Reported-by: Osama Hamad
+Closes #21238
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+
+CVE: CVE-2026-5773
+Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575d6=
412dc0ff532acdf94de35a6c2a571]
+
+Note: The upstream fix targets lib/protocol.c which was introduced in
+curl 8.20.0. In 8.7.1 the equivalent is changing connkeep() to
+connclose() in lib/smb.c, which prevents the connection from being
+returned to the pool. The effect is identical.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/smb.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 7c73cbcec..a1f5c9b31 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -461,8 +461,7 @@ static CURLcode smb_connect(struct Curl_easy *data, bo=
ol *done)
+   if(!smbc->send_buf)
+     return CURLE_OUT_OF_MEMORY;
+
+-  /* Multiple requests are allowed with this connection */
+-  connkeep(conn, "SMB default");
++  connclose(conn, "SMB default");
+
+   /* Parse the username, domain, and password */
+   slash =3D strchr(conn->user, '/');
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support=
/curl/curl_8.7.1.bb
index 14d63d6373..d026731751 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -36,6 +36,7 @@ SRC_URI =3D " \
     file://CVE-2026-1965-2.patch \
     file://CVE-2026-3783.patch \
     file://CVE-2026-3784.patch \
+    file://CVE-2026-5773.patch \
 "

 SRC_URI:append:class-nativesdk =3D " \
--
2.34.1


--_000_DU7PPF66507B2D74801DCDBE0149F5394B9F3F72DU7PPF66507B2D7_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
</div>
<div style=3D"font-family: inherit; font-size: inherit; color: inherit; bac=
kground-color: transparent;">
Hi Yoann,</div>
<div><br>
</div>
<div><span style=3D"color: rgb(0, 0, 0); font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 -webkit-text-size-adjust: 100%;">I see that status in patch work shows Cha=
nges Requested but I didn=92t see any
 response on this mail thread .&nbsp;</span></div>
<div><span style=3D"color: rgb(0, 0, 0); font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 -webkit-text-size-adjust: 100%;"><br>
</span></div>
<div><span style=3D"color: rgb(0, 0, 0); font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 -webkit-text-size-adjust: 100%;">Can you check&nbsp;</span></div>
<div><span style=3D"color: rgb(0, 0, 0); font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 -webkit-text-size-adjust: 100%;"><br>
</span></div>
<div><span style=3D"color: rgb(0, 0, 0); font-family: Aptos, Aptos_Embedded=
Font, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;=
 -webkit-text-size-adjust: 100%;">Regards,</span><br>
</div>
<div id=3D"editor-signature">
<div>
<div style=3D"font-family:Aptos,&quot;Aptos_EmbeddedFont&quot;,&quot;Aptos_=
MSFontService&quot;,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb=
(0,0,0)">
Jaipaul</div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Jaipaul Cheernam via lists.openembedded.org
 &lt;jaipaul.cheernam=3Dest.tech@lists.openembedded.org&gt;<br>
<b>Sent:</b> Wednesday, June 24, 2026 10:34 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
<b>Subject:</b> [OE-core] [scarthgap][PATCH v2] curl: fix CVE-2026-5773 - w=
rong reuse of SMB connection</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">libcurl's SMB handler marks connections for reuse =
(connkeep) without<br>
verifying that subsequent requests target the same share. This allows<br>
a second SMB request to the same host to reuse a connection<br>
authenticated for a different share, potentially accessing data<br>
without proper authorization.<br>
<br>
The upstream fix removes connection reuse for SMB entirely in<br>
lib/protocol.c, a file introduced in curl 8.20.0. For 8.7.1, the<br>
equivalent fix is changing connkeep() to connclose() in lib/smb.c,<br>
which prevents the connection from being returned to the pool.<br>
<br>
Tested with SMBv1 server (Docker dperson/samba):<br>
&nbsp; Without patch: &quot;Re-using existing connection&quot; for differen=
t shares<br>
&nbsp; With patch: New connection per request, no reuse<br>
<br>
Binary verified: Curl_conncontrol arg changes from 0 (KEEP) to 1 (CLOSE)<br=
>
<br>
Reference: <a href=3D"https://curl.se/docs/CVE-2026-5773.html">https://curl=
.se/docs/CVE-2026-5773.html</a><br>
<br>
Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
---<br>
&nbsp;.../curl/curl/CVE-2026-5773.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 41 +++++++++++++++++++<br>
&nbsp;meta/recipes-support/curl/curl_8.7.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 42 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch=
<br>
<br>
diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/reci=
pes-support/curl/curl/CVE-2026-5773.patch<br>
new file mode 100644<br>
index 0000000000..0a5fa588fe<br>
--- /dev/null<br>
+++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch<br>
@@ -0,0 +1,41 @@<br>
+From 74a169575d6412dc0ff532acdf94de35a6c2a571 Mon Sep 17 00:00:00 2001<br>
+From: Daniel Stenberg &lt;daniel@haxx.se&gt;<br>
+Date: Sun, 5 Apr 2026 18:23:35 +0200<br>
+Subject: [PATCH] protocol: disable connection reuse for SMB(S)<br>
+<br>
+Connections should only be reused when using the same &quot;share&quot; (a=
nd<br>
+perhaps some additional conditions), but instead of fixing this flaw,<br>
+this change completely disables connection reuse for SMB. This protocol<br=
>
+is about to get dropped soon anyway.<br>
+<br>
+Reported-by: Osama Hamad<br>
+Closes #21238<br>
+Signed-off-by: Daniel Stenberg &lt;daniel@haxx.se&gt;<br>
+<br>
+CVE: CVE-2026-5773<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/commit/=
74a169575d6412dc0ff532acdf94de35a6c2a571">https://github.com/curl/curl/comm=
it/74a169575d6412dc0ff532acdf94de35a6c2a571</a>]<br>
+<br>
+Note: The upstream fix targets lib/protocol.c which was introduced in<br>
+curl 8.20.0. In 8.7.1 the equivalent is changing connkeep() to<br>
+connclose() in lib/smb.c, which prevents the connection from being<br>
+returned to the pool. The effect is identical.<br>
+<br>
+Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
+---<br>
+ lib/smb.c | 3 +--<br>
+ 1 file changed, 1 insertion(+), 2 deletions(-)<br>
+<br>
+diff --git a/lib/smb.c b/lib/smb.c<br>
+index 7c73cbcec..a1f5c9b31 100644<br>
+--- a/lib/smb.c<br>
++++ b/lib/smb.c<br>
+@@ -461,8 +461,7 @@ static CURLcode smb_connect(struct Curl_easy *data, bo=
ol *done)<br>
+&nbsp;&nbsp; if(!smbc-&gt;send_buf)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return CURLE_OUT_OF_MEMORY;<br>
+ <br>
+-&nbsp; /* Multiple requests are allowed with this connection */<br>
+-&nbsp; connkeep(conn, &quot;SMB default&quot;);<br>
++&nbsp; connclose(conn, &quot;SMB default&quot;);<br>
+ <br>
+&nbsp;&nbsp; /* Parse the username, domain, and password */<br>
+&nbsp;&nbsp; slash =3D strchr(conn-&gt;user, '/');<br>
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support=
/curl/curl_8.7.1.bb<br>
index 14d63d6373..d026731751 100644<br>
--- a/meta/recipes-support/curl/curl_8.7.1.bb<br>
+++ b/meta/recipes-support/curl/curl_8.7.1.bb<br>
@@ -36,6 +36,7 @@ SRC_URI =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-1965-2.patch">file://CV=
E-2026-1965-2.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-3783.patch">file://CVE-=
2026-3783.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-3784.patch">file://CVE-=
2026-3784.patch</a> \<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-5773.patch">file://CVE-2026-=
5773.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI:append:class-nativesdk =3D &quot; \<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DU7PPF66507B2D74801DCDBE0149F5394B9F3F72DU7PPF66507B2D7_--

