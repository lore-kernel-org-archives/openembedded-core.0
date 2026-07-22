Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AADC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:19:32 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43330.1784708355035351193
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=O6+lvEtd;
 spf=pass (domain: est.tech, ip: 52.101.65.64, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgAhvyGt90S52B0S24bCFO3VfPpR+9RDKuQekog1Om79OianS+opXNqVqDOoYP3HL4UhiG8o4Eikyf3y0F114yTZSMSQ5dvryb5r3MZL1/SDdTqVRbM6rgqghUK31VFsNYipIHIPmtdkqJJJoQ4OrwLQmY+iJQxqGcmo1t6tHiZQ9R+L24ghcbwM45lClRNBtX5P8jqTsHdQjbU58haeCo3zDDAzP8e4lykoT68l4iNiW8bQ4MqqjW6LOs46hw5brMjeWnBo2q7QQA06QJkx0fdXAYQo40nv7GNBQFiRhqfIFHzwoe0+q9CKHhQ+r5PxJVIcWC19yuwSrjgW8FohHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b18ZUBPBSsHbl8TnU+E5HYcWuwIu+iBdmKHx/GpWz3s=;
 b=Buiu9N3jpeTsTWOqP9C7EkQoBwGD0O77sNplbZHTExMYC27xc97oM+E3xWRg0sCScuPtxaDI9Hh+wgeZ5Qi6vJmSKFZ087O2xIRAKMThlSL7jYypKDDfPAXVDHbqPxvUAQQzWQonWpcBY8iCrE4XUII2ZlFN9T05pi3UzsSVR0UFRzspExfKreRfNkzaDHijtT1rOkl6G2tNIs/PybhLat76rC6qS3oizvaKX0gvVf4I37sVBwnSsXqkZYXCbllZsn0OJ4/Aavg39ZFvMPlYg9Zgltqyb8DX4WwUWp6I5fJr9J+QFruQF2mdh9QG+LGj5+W/dRItiSCf8A7VcjIf8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b18ZUBPBSsHbl8TnU+E5HYcWuwIu+iBdmKHx/GpWz3s=;
 b=O6+lvEtdawjlvfIODyu3NXYKX8V+GK04rJAQoshaO6PqvB9ZEuWBYYWXug8v02gqWgIxu7iUuI+3UANGqtnpyAZVjVirB7UtQxs2s+qbjM+n3x0b5Hupe5RIyfHrdM75tDV2TnOLLv+Acc0PFD7HaP+5ZxL5gTFY5zvYJHa8x23pT9uMBl7t4VR7fKVAuEylgbrO5/XhxT+CsoKFetUYeFNinAvBgq7QwJTaYpKX4nd+rIHEBIigbbdVP6r4V9t7mMEGthvYPqINHGbfRNDkVsrpFs967ktlu5U0NL4fAEUSufG88kHz7qvNsGgxLMYTduVePv9U1KLibxoHpc4XOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by PA1P189MB3492.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Wed, 22 Jul
 2026 08:19:11 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:19:11 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] wget: fix CVE-2026-15146
Date: Wed, 22 Jul 2026 10:18:56 +0200
Message-ID: <20260722081906.14967-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0255.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::20) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|PA1P189MB3492:EE_
X-MS-Office365-Filtering-Correlation-Id: 66744e83-0a41-41c5-d0f0-08dee7c9e8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|10067099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4fiyrvCXASXPbANWUFEOO8jZBwvs/6Mjxsotb4aA5sOUpyKBz6xUa5GmyGAfrqBefVV87bPldIjw6d7D0XWlsezspFeAYEp+1Kol9oxfE3ElgVhQBNakLhtUUFPnYrNvbkd0iukcQaaw9LFnSO5sgJCfmQrbOMQtgbvz+cogNkXnElJ/AMEJrxHEAUhiY/jhetwKYxBbOADojczdOeWohBik6qzq9UOZOqfdJjE10qX+cxhsj4925S45S0VaNTYEO9F19xTO/E3w/esYOQk8aDzHJc1vkZW/vdha89FSoWhQBsXeseq/wD320vBgY0p3gbedE40qeB6TXAjG+pX+ckZJvcPDrmdUABdxE5QMSZZ/muvMN3aaf2l5f+p6xdPdjFTLB/DUIYHRJW+/gp/fijVHBZl6EChJabTEXfkeS5IzYQ9Crs0vI316ilrAGdpx4hJ++LVcw6TwMSoi7lV07+s4tssGC4swDL1ERkMp8c2h1O7jMTN+d0oQP6aACZTI0pl259j1OnzTOroiUyqByL42k672XdsE+Do24XPcxYsBHT6HHIH2ubE/ZPLicF6XFaibZdRpJjdacZ4vC9e9ksuoe5EEaWpyqI9zQgSe/dXJSgf3BuN8mHDXn4GkiMsTYQVbYPpxmDNxnAdPNfAsFO5jgXkjJGaPNO4d9jm4UGU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4Brusup2uxgvmuyADoVgRTFu/1sfysz9ocSwGQeZFPPcJOYJ3/aXYnN45xld?=
 =?us-ascii?Q?zxiTjgO8J50Rg7nHI8+PJMpQII4p85IwqOCO1hlShcHD1oopnN2OAaMoWub/?=
 =?us-ascii?Q?wXu10X7UHAjXPgdMlMW5R4IOObJt1ZO/7C+4/I79w0+WVvi+37qRqSEyNTYb?=
 =?us-ascii?Q?VWMqkhVYifSqt7SMTK82OY2W4VoOWc2Laxig7SeOCZCHv5YMtTcGdVqvCSKg?=
 =?us-ascii?Q?iaCtB52MZk3MH1oBKXJ65sZIzsHIS5Yw4mBcJyD2r6HGEfPMKD1X6No6IMWX?=
 =?us-ascii?Q?rxkgzs8BFcR41ca0rw3ugVhVweLLeQi9Xr2yf9hB/0do7mOEGz8gFdh7Dvd/?=
 =?us-ascii?Q?jr4LSj16SUOuo+AxOtuhZ72BcrpgbsnFfJLsFnBeVswJUrm1MUCXfdF5RP4S?=
 =?us-ascii?Q?oEICDsowUPpWUfSw0Fc5GlRZCwDZmy6WHh2dCUkAtkpgiI+0GuSwxwxKACC8?=
 =?us-ascii?Q?QToz1MBT6+fhs2gMVKpFJOUIXFDlhv+CrbGU7E0AfQG2x2u6uJ2dUVqIpcMo?=
 =?us-ascii?Q?d4XtBxUbXCiW+K83xsGX266zigckZYi138BQ7czos9Vqa9cCXAecNbhXKhy/?=
 =?us-ascii?Q?edXKIaLqWJAXYyMk1GsXbWIrfsgtn3RUssWduEwhJs1ZDKRPpnjZ+OQf+K/q?=
 =?us-ascii?Q?RkWmR4qQrBWUvns2LiA0zQEgfAfBe039/rq9RVPpAGUG4W3adlwiUyYbJ0w4?=
 =?us-ascii?Q?uH0g9vz7dTQHhEJy/u1uOdsFKm7PHDTJbDBpGAtUKc0U+SMslmscypKxYEvr?=
 =?us-ascii?Q?s//8fMZrlsgPzJtd66+Rv7QjiBH9ftGqRctQB3ev2mka0tSX0zktQ0Z0pCKe?=
 =?us-ascii?Q?KDobGjkKW4bYrVO1kZKoa7d6DD0HxwfDllKszeVZPco490TRUAAZpX4W/mvT?=
 =?us-ascii?Q?IHljO4V2hK0w6ka0m6ptZlkXGmxmKZJOdwMQHw9CG+pisWpTW5H1K8h+ZsfB?=
 =?us-ascii?Q?8AHw9kujYsHfl1OdL7QtKJ3uw9z2DDxjNC+0gIPCSQ8WgfYE69gY/eBmz9T3?=
 =?us-ascii?Q?SmbnbO1TlW4vvRIhU6NRIyfbKbUFYdB2cyQu2Y/B6G1FTeZmkFP01eVknsV0?=
 =?us-ascii?Q?ic1FlsslVrbA2YfbtiZyZ6EO8ML/SS3YxpMJVXIT/c/0ckq84e/RAdSqaNJt?=
 =?us-ascii?Q?JVken86GdKZyNA8KMrFVSujjMleXGkKaS+UNudCJReyBs1m/KgGFhbLUOV/S?=
 =?us-ascii?Q?fPSqDNXF+8hx89j4HGaHjunIbkUKOEaER1Yx07X6fW4hsGCwv05EymXHK1OS?=
 =?us-ascii?Q?H0itQop4VeOGcIRTlm4bh3Z/lsgKaB6aVnSFMTrDj2HOoR4P221uePbzZlaX?=
 =?us-ascii?Q?5WA8kouPIFJsQkFKscT0K2qZR89WD6FfRln8/oClmPBNU6Ckz9r72V9GZO/u?=
 =?us-ascii?Q?Hvfpu2L6sJ7UraEsHRarjMbl1Z1Sd0Rw0qU3et4M1KKc2T/rIlmiOG8qhnbb?=
 =?us-ascii?Q?4wWnG3sM6ujfg5ZUg4rociGxE2bTJNiaI2NOZts5bnCqO7SqqmK9prjUmR5m?=
 =?us-ascii?Q?1fMkoaZ4IMZ8wYEhkvi3ua9L4WmSWCDMARNZKMhesoctx/NBTe4UCfiAYtb5?=
 =?us-ascii?Q?JMdeMgu0oLp/h53jVg2I3tGGoDbLnRT9GpOsdimtAICohaYKlQohT76Y933v?=
 =?us-ascii?Q?KnDlrh/EQcugUiZuC11XqVCW7eHHw1Y3p5yACrz3OHUCngvNDSXgwfb84pdV?=
 =?us-ascii?Q?a7VfQCkVYwutO7srNFZCdLtZ0C822uYoz4v9CqAo/VExlExiVZ7K6rvRuTDa?=
 =?us-ascii?Q?9vRms/4C+w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 66744e83-0a41-41c5-d0f0-08dee7c9e8db
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:19:11.5058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s99OuEv4L1b/jKjttnoW5aXUL706L7kZiBQgvMYGU+h9OBj0raOXU2rsHf05M2Q6WyMp9Ev81l9XSoWwTabR7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3492
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241613

From: Amaury Couderc <amaury.couderc@est.tech>

Backport patch to fix CVE-2026-15146.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-15146
  https://www.cve.org/CVERecord?id=3DCVE-2026-15146
  https://security-tracker.debian.org/tracker/CVE-2026-15146
  https://ubuntu.com/security/CVE-2026-15146

Upstream fix:
  https://cgit.git.savannah.gnu.org/cgit/wget.git/commit/?id=3D4f85853f6418=
63d5915786a8413e1a213726a62b [nvd]

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../wget/wget/CVE-2026-15146.patch            | 122 ++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-15146.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-15146.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-15146.patch
new file mode 100644
index 0000000000..a48b230cf3
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-15146.patch
@@ -0,0 +1,122 @@
+From 17e1d62264c07da2fd748f0714043b856d0925d8 Mon Sep 17 00:00:00 2001
+From: Acts1631 <acts1631kjv@proton.me>
+Date: Sun, 5 Jul 2026 17:22:55 -0400
+Subject: [PATCH] ftp: validate PASV/LPSV response address against control
+ connection peer
+
+* src/ftp-basic.c (ftp_pasv): Reject if peer address doesn't match adverti=
sed
+  address,
+  (ftp_lpsv): Likewise.
+
+ftp_pasv() and ftp_lpsv() copied the IP address and port advertised in
+the server's 227 response without checking that it matched the peer
+of the control connection.  A malicious or compromised FTP server
+could therefore direct wget's data connection to an arbitrary host and
+port of its choosing (e.g. an internal service unreachable from the
+attacker directly), which is a server-side request forgery.
+
+ftp_epsv() was already safe since it only extracts a port and reuses
+the pre-filled control-connection address.
+
+Fix ftp_pasv() and ftp_lpsv() the same way: capture the control
+connection's peer address via socket_ip_address() before parsing the
+response, and reject the response (FTPINVPASV) if the parsed address
+does not match.
+
+Verified with a fake FTP server that returns a PASV response pointing
+at a different loopback address (127.0.0.2 instead of the real peer
+127.0.0.1): before the fix wget connects to the spoofed address, after
+the fix it rejects the response with "Cannot parse PASV response."
+Legitimate transfers using a correctly-addressed PASV response
+continue to work.
+
+Copyright-paperwork-exempt: Yes
+
+CVE: CVE-2026-15146
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/wget.git=
/commit/?id=3D4f85853f641863d5915786a8413e1a213726a62b]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ src/ftp-basic.c | 40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+
+diff --git a/src/ftp-basic.c b/src/ftp-basic.c
+index 8f7d19c1..9c7bba1c 100644
+--- a/src/ftp-basic.c
++++ b/src/ftp-basic.c
+@@ -623,10 +623,19 @@ ftp_pasv (int csock, ip_address *addr, int *port)
+   int nwritten, i;
+   uerr_t err;
+   unsigned char tmp[6];
++  ip_address peer_addr;
+=20
+   assert (addr !=3D NULL);
+   assert (port !=3D NULL);
+=20
++  /* Remember who we are talking to on the control connection, so that
++     the address returned in the PASV response can be checked below.
++     Accepting an arbitrary server-supplied address would let a
++     malicious FTP server redirect our data connection to any host of
++     its choosing (SSRF).  */
++  if (!socket_ip_address (csock, &peer_addr, ENDPOINT_PEER))
++    return FTPINVPASV;
++
+   xzero (*addr);
+=20
+   /* Form the request.  */
+@@ -677,6 +686,16 @@ ftp_pasv (int csock, ip_address *addr, int *port)
+   memcpy (IP_INADDR_DATA (addr), tmp, 4);
+   *port =3D ((tmp[4] << 8) & 0xff00) + tmp[5];
+=20
++  /* Reject the response if the advertised address does not match the
++     control connection's peer.  */
++  if (peer_addr.family !=3D AF_INET
++      || memcmp (IP_INADDR_DATA (addr), IP_INADDR_DATA (&peer_addr), 4) !=
=3D 0)
++    {
++      xzero (*addr);
++      *port =3D 0;
++      return FTPINVPASV;
++    }
++
+   return FTPOK;
+ }
+=20
+@@ -692,10 +711,19 @@ ftp_lpsv (int csock, ip_address *addr, int *port)
+   uerr_t err;
+   unsigned char tmp[16];
+   unsigned char tmpprt[2];
++  ip_address peer_addr;
+=20
+   assert (addr !=3D NULL);
+   assert (port !=3D NULL);
+=20
++  /* Remember who we are talking to on the control connection, so that
++     the address returned in the LPSV response can be checked below.
++     Accepting an arbitrary server-supplied address would let a
++     malicious FTP server redirect our data connection to any host of
++     its choosing (SSRF).  */
++  if (!socket_ip_address (csock, &peer_addr, ENDPOINT_PEER))
++    return FTPINVPASV;
++
+   xzero (*addr);
+=20
+   /* Form the request.  */
+@@ -842,6 +870,18 @@ ftp_lpsv (int csock, ip_address *addr, int *port)
+       DEBUGP (("*port is: %d\n", *port));
+     }
+=20
++  /* Reject the response if the advertised address does not match the
++     control connection's peer.  */
++  if (peer_addr.family !=3D addr->family
++      || memcmp (IP_INADDR_DATA (addr), IP_INADDR_DATA (&peer_addr),
++                 af =3D=3D 4 ? 4 : 16) !=3D 0)
++    {
++      xzero (*addr);
++      *port =3D 0;
++      xfree (respline);
++      return FTPINVPASV;
++    }
++
+   xfree (respline);
+   return FTPOK;
+ }
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-exten=
ded/wget/wget_1.25.0.bb
index b773081753..2b00aaefff 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58470.patch \
            file://CVE-2026-58471.patch \
            file://CVE-2026-58472.patch \
+           file://CVE-2026-15146.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb=
726ac9d0da3784"
--=20
2.34.1


