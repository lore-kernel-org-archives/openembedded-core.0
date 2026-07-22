Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32E0C44533
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:22:42 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43358.1784708554557569841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jp0OFClk;
 spf=pass (domain: est.tech, ip: 52.101.65.65, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjB4gmujWEUqbhqW/DjJNwkR3hjUSqagVFfUTOzpHWIy8YhtaQJCU/EVjFYtPMHquTa+zWVRKcyYsZAvLkQQcFnmpCWvAeSihal+Wq8P8NDn1tjt8C2EV8oLlx9D0v4iJJ1VRwva/6KFsquGqXF3gZQZ7/StdjMqXlT2UAkyzmXIo3bYiKmjVT8gFqF06nsCJ/O76QJZ7waS3dwVYpRjNqVLM9BPonv/iSkkwmULXVINWvwob7ENlrrpoFnOgcU146X2uz2f/gIxXMaATgzeq0wWs5e3Dh4yCvp0NG/Q3mlHOycxZFIjoyAZaHBBpP0QLdqyqDLeWX2TiGf86yd+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b18ZUBPBSsHbl8TnU+E5HYcWuwIu+iBdmKHx/GpWz3s=;
 b=sUcbhqUnY/afmspvYCyec5+yCfona9c6jRN3yLJGQSPVS1ZIVde1N+/nZ5wiFDdbOdCimfEO7W0tt/lquKIlaW8uBfY/VlkZEdKkvss9rOIypmDoUDf/Sg7ZceztROWx9XRTBmSn3cj6Ek9jkE3AQZ0/fuh2y+AzOStNwd12C0HCF6YgGyDyqySQbjjYsk7zfZ7ET/g8tVCLqqENFgNLWnaKLRElgzpTWxUildGiUXYmNGspoLED2A+hdLtx8cuF8iUA/4+MGdiAd+7jR3PExGt0mdpN+F02AiC1hcmKLPxNcPw8gx/LsLquOhpKDyXntfjq1NWaaOXCkkKiFGgW8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b18ZUBPBSsHbl8TnU+E5HYcWuwIu+iBdmKHx/GpWz3s=;
 b=jp0OFClklyJ/RMLcoK47f5p3HAdXS6AD4kvZ3U0JklBgaSoyx3YH/yH3z+Jc0c3pkOUiit+GDAcGaERU4GzznQuAN6i/zwC3+Epc+6PCHy+mbSbilF1S3QVuXKpmhiYAzLA1G3TyG3bHCZ3aPxwuFrfTgdQ18bIQ1l0g6a73lC2t8m9YONxpI0S4+VnTHzyVB+ert6rRjOGBcynrDqiRVntWnYZKYXrvZKb9bfygYYrc0P7I/arOux9kX0wa/6FWjRROFvqu3cilaolNxx9gJGsA/NUQXTcZwWFrslfqlTb4k5JWf8O8CUuEFZSJahq7y67zmf7bSwU6hDRNVigmxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by AS8P189MB2420.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Wed, 22 Jul
 2026 08:22:30 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:22:30 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 5/5] wget: fix CVE-2026-15146
Date: Wed, 22 Jul 2026 10:22:15 +0200
Message-ID: <20260722082225.15296-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0173.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::27) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|AS8P189MB2420:EE_
X-MS-Office365-Filtering-Correlation-Id: 0caa532f-6f31-4692-851b-08dee7ca5fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|11063799006|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	lhrGAzCatJzyAX+OrLSdk4RRkZaemDun3JgiTfI8xW927g2K+tQiXO9zzNkzCl8TtHepo7gZn9OAJL8+ydVXjmHp/oVC3UfdKVu8aUp3KWMAOSDsEwtSb1JnIYEKV2ghjPIqT53HoLs5YuiTvlCTdRYAzNaCtbo4LYxvmT2gUaZM9T2HGa/7A2GP67OyFYEq6LTTQPgqwOOv8x+Rji7B9NLKxhnLAGzjssZqQAFzmnM6ypvfLvdRZYx6/oOyuTeu4yB59IbWlJFgnCmxd91/GJ+C1NJxZV6d2ULVNUCBL/co0aH2m/RherfjOawSgWY4XVZSQ3p2e8jjVEgxHzUDL5K2b3kplFQwBoHq2vcg96oyQQqZHe4RuzUotOc0EHks82v7Gt7sELCSsWlK83n3Wu1upSbrJtGSUBrPTNzudvHUa09U9tb1Ex0FL+D5m33F8FLc5ElrfV+DvnCUendnFU31Kg+08TeHnq8gXo8m3MtzaH2Bddzz2Kdt9mM+jogEw82z+n//M3vpglKSq1bs1IC/UWjH6Ly7V6QPoUU+qsYRtmu8NEfuQ790AkdNLwvjMwJyZjQg4U1TrvBd6kpcYjo1ppBbQJFZzceWtx9d6K4uxp7HFXj+ZjnptkwPO1SkOHI37NJRuJJzz20+YmzuCocDEgKgbYZjv8lFbVLYMwo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(11063799006)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n8khwad4cHEjRaNfvq9ixl9ofbC5zemMmGrV8clNwAZY0GtE0OjCXjY4XEuf?=
 =?us-ascii?Q?TW6DNkHE/Qgd6wwD1U8HvOeQXJfdEBtwgjoroy8WE7K0nGffMKHsm94GZMIs?=
 =?us-ascii?Q?K29OxXHBWkfJXtzLixZogJSq+Gzv0wqRRWY/jrrjqoRTbsFEXbCFi3t1TiQF?=
 =?us-ascii?Q?8QFixThfxe9LpxKXWBcRPvbIZ9lRRcjGFkqEAZRJqryIsQiCZpArq6oFd8v+?=
 =?us-ascii?Q?B99xG5nr0yJNg7r87tKeDe7QM5yyTwXN0GR9vxCHqPx2nAkm6FVDrhPHIFT9?=
 =?us-ascii?Q?eNcy8Wz02FQXVtkHJhGlyz8ILpUfW2PfTyrwyprhQ7bPLPb+bVInQiZouzwA?=
 =?us-ascii?Q?QtXm7UFDjjFsAm1JC1cLg/Z0receACCWcKC71g8r9kvb6jpZzUsCCbfQKREx?=
 =?us-ascii?Q?xjO5tSmOJGN6fPObFRA4Z12Ho1XC7zSieBse/B5ulTpC5xkFVQ0cRhy4a6zp?=
 =?us-ascii?Q?6ocJoD+iHvLoUBcpZU0M4Hh9SEx2ONIaNBoIpUzXamFV9LQig7z9jl/mlyRl?=
 =?us-ascii?Q?G2JJXjmI1cbCpKTdIPfvvNhPuBaG1fEv6SRprLMg0UCjwrbiz73P6xSHlKtQ?=
 =?us-ascii?Q?Dv8XFmSoaA3mAwrIQxlW5vv4EEdZrc0gQYFHBTSzdHZ3Vg133Zkes1tqHBu2?=
 =?us-ascii?Q?uyc1dKXgQTNPRKKKVjYH2KT+UdOPAOXSOW+Ixj/E2Ge/U1CrYZ04Pn9v1T0b?=
 =?us-ascii?Q?W3U1zZbNdxCF4fTjoAtkBjTG3pN/3k7sSxMJJzNbYlUIuLH4OkpawFi1/FEE?=
 =?us-ascii?Q?07n+1oPz8cnLg2rawQw+biH6pcFoOnU9ObU8oOG8fFICbXIXZzlo294TYWhv?=
 =?us-ascii?Q?iO6lI7SfJ7sQ/miCmW9IwhMbI6x1LSOcCIMWsFv7QYrJj+B6UtIBYhuFV9DQ?=
 =?us-ascii?Q?E2RmkXnZDEtfJzcKLEB9/TiH25jtJY9d/+1KyjZseHFjBUN4baPCBj4fbzlP?=
 =?us-ascii?Q?+IL1mzzWLq7qLC5xQuYy36a4PQYEZAzuIHSSNE0dU4CS7TLId7KxX1iZVmGb?=
 =?us-ascii?Q?pu57FGy7LzsiraimSdND1zLuPKGkxwkj9YHDp78Pz/JP3/nWqL8o4WrNmqDl?=
 =?us-ascii?Q?1aOG9Pj57nE4urlNpMf9dZlI3CB5Hnmr7NJsCrDscXDzSfDKPwSDSlV98Sqg?=
 =?us-ascii?Q?v4uEDCd/KE9mUFaWflEu7hE+rnrZH6WNbpTqoN6lpEZ2Cylg/YMx2qYBeIAF?=
 =?us-ascii?Q?TA8ZbhvtEEIn1AX00nJYpuJDYG+d2mifRkVmeveT8luoNfTBAMKmWs4XNgoc?=
 =?us-ascii?Q?dHqAKuY40ZIO/4onz0H0QNY/Eqnaz32La7HCysPuIeDtGRmeiMZRovWs+RMe?=
 =?us-ascii?Q?6mBz43RWqJB+lmO8BpGggDqZIyNSIwZLrxjCjylT1x6bUgJ2aH/JK4a9PI1S?=
 =?us-ascii?Q?JSqX+K2sFSCW10CnN28gecC2RHwAAMObdRwIs53iXNAad98XlaPnmO4KkJP5?=
 =?us-ascii?Q?+W+S7VqXAsjBuL/X3aoZRKYZSd+7SOX3MevQtMLKy1qI8hupnos2WIts6P4/?=
 =?us-ascii?Q?ZvPAIx0KFs/y4chLc5Bjl/JTHgE+1R5sevwlxegPs39AynXU/HGbKUq5UNdF?=
 =?us-ascii?Q?9Q8HaD7o64p0W9smUb8nPu183HpuzCFRYQS60s1R90MG9WC9dr4V83z/4AU/?=
 =?us-ascii?Q?wqGdD3x71iqAj+VKDk3Kt+PpA6JQZ2xbJrKxyfidgcdIMsEz4oz4obfpZAnN?=
 =?us-ascii?Q?lVSZh54o+Eb5mZO5Tl5aAdE5KzsPEK/tXmPQmRm2D3hQU9bKcjamdeN465w+?=
 =?us-ascii?Q?tt/8ZCDXDA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0caa532f-6f31-4692-851b-08dee7ca5fa8
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:22:30.8240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nClhyYfoY+z8NgsUl3Brm4yWqmbCqnwCD2ZEQvsaGTjg9W6FxfibbAPtdH/LPoYtx8qFCLLVkXVbib/AGjwokA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2420
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241619

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


