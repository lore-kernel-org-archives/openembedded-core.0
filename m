Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A0BC4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:25:42 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43276.1784708736089901582
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=UaTWZhik;
 spf=pass (domain: est.tech, ip: 52.101.66.62, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpFQ2tUv7iZJrte04fdwlEIV9vB0SojjCF2J9F6i1PY8KGU5pgDcvlovW06ol1V0x7cIxo3wt0qPz8MhzauAGrZy1d3ioME7ID838OF4s0Bhb5FtxqBI/kdO/juNLuIciYVzUy+8SbSPlZ4ElddARCJzyT94HpFESbEO/QMdGT93575t6/UPoKIrT9PVtiJf3G46rGeaXV00N7MOAEQc9I0NeLbXAo7/WVdrnXB4U6ZMjPGUBfLrDmoRYeR2U2pt9uyayCH/iFBrLpvs5+RrrgvyVrv19RTYj0bJv3Inx8Qwi76XrlRXhrdDlij4UWRHlBjQ9FADlJ8epHwZf9w5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGb2N4ROKaRNi9wj/US+TD7P6Sdvc8XMNxTi3wiAGjg=;
 b=RcZ2zolAACyj3xbTc8tfyAaB+JwxuDDGHCHe7WhQIsC4u8t3UWoZg2tmxpiftJdiO3v/AqCrbcPgsT7cgQgrzBi4MT7c+e7Jsf0fxKjsCtRbuTS4UVBqhTfikHEhZi6pH3ko8X9mDuqeKHrO31b3fSqWeQB5TB/DT3SIEHs503espLB3J07phjzgaB3VIIdQ2BkkpRV5IzTMTqFJ+0vOkoUufJ172mHjEslIcO6myr93wGKVUvIWcXbLE4rPHK4uCDQ4yCi8ZNYMc00KT+TlYlfhZ7VGhlu/NqszGUG0AvpsX2txrZiXGCpGvNszJ7A3jUJ9t9rth8prevGjROuZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGb2N4ROKaRNi9wj/US+TD7P6Sdvc8XMNxTi3wiAGjg=;
 b=UaTWZhik0ZkZhgVn9cHSR3vrXN5Yz8B9iwNnHZneQ81XFE0jhLhvH/CXRfluDUhWgCCrbLBq4feQiWqHThI80MiNMo2XyGyAlM1q5wyH0FvoSvvQtN3VrrK2fJgveayxvKgZ4vV2ywau/UtFFb1h2/EkVgucpfwlDB/5LX0mey5yN1iT3eaUpOF3gcsj+nsHZI3ii0yDOlO7guFZr86mOTtCc/ONQza90UZeuWpBBEPuucpOHDScbcx4r9/pzBtpbLaX0b/qSZXHizkjUPNriTZn71EcOETrnYtSh8IQrKptPNagljECqB46SlWud/07LzQNmnj+cZ0c+WRspSZ3pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by AS8P189MB2420.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Wed, 22 Jul
 2026 08:25:33 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:25:33 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 5/5] wget: fix CVE-2026-15146
Date: Wed, 22 Jul 2026 10:25:16 +0200
Message-ID: <20260722082528.15618-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0434.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37d::25) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|AS8P189MB2420:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c9b678-387c-42cb-61d0-08dee7cacc45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|11063799006|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	oqwhNbLc+BmAvu4q2abQrkPtR/4VJH7SP9Hi2G3wvZb6BefsOApoUJFlodrOwsPAvROFTgVSK3Uf/YnbSUZ5wCrQHk74eur/pSyXq703B9pgX7B7IMctTp54l6KR/nCSi3Co6ezkHsJNNQwbviUiskQ3TazplLQ32apiIfMuuquyW8mjOc61v8A3IY08SJEOk8jmiZ8bXlkRqJMi8Bt3TCkSNTuxTXFffrwvRQifZybiEFsdbYEkjLmBzQClpb6fLEbsvB6yh4FlF0L0l31O2E1nexpFXp2+/7Rx1xtadHNpeMyZ8A6KHD9Gk6QBiDCeWHQz9UVrb4xtWgP5xOA8L5upLuqv1/Dceaq/Xu6G1eOY1nYJnPR0MwamNvuaoytOivJQtraUi4tGkpAmzwJGiDkU/kFYMVTxBbsPkadv+1QH2k3TuVAtrJ9D/CfGAiaPZP8/fegQEfwth9VNFshRt2nI7IeesU27ZHud+IQKg6Eg1on2QH8xK6pn/lLNlY7TX9DKJoF4VOOdi8BARLThaLh+sA71aju0kLBEZmoJLAEnoIXtBM0lTwPeP8WmuMksEwXfWWXjYG8Ta2mi1gDezVka+F5lh7D+L1iNRT2mA1jopOg/QlXhq6a2JZta6CF/3QbF9dxFXHsPDCNPAxOrppZf99TxjsiznB93EBe0ZpQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(11063799006)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cF52eglOU4ykj6rX4ubC8rN7pug15L3SAU5EMMVKvD6qSK1oW+zcSCY9zQ2b?=
 =?us-ascii?Q?9WDmY0PYiwlRC9vmdZSr7SqBWxBItblUq8FPLwHlo1yjYhKAWekGSf27hpYV?=
 =?us-ascii?Q?4CEiyMinV07JwvXfb07totscnQFuDZyRw+qmvSQJgpoWjftDA8wfDQ7FtdZc?=
 =?us-ascii?Q?9xAVwb/L1tWlJzhttZ1AMdPHcTBojCsWy4mk/yHlStg6gMKSZ4J7MRUf52vo?=
 =?us-ascii?Q?B85eg9nzkW05zmhEgzYotJxu2WuetwbaEoWo5OSEYZ5Z+Xfku4mxvK7uwyHj?=
 =?us-ascii?Q?uph+y/k+c2AfUUkQx+5WMaOpJ/PtvGXdcdtrc8hjhx11KcWwVl2LkfG302tH?=
 =?us-ascii?Q?Sb6t8VDWfY5f53ZiDfNzTihdTv5DAA5uPhHTmpYwtgZ5ufsoGe87FQEsQ7cj?=
 =?us-ascii?Q?PaLG5MR2FI1Ct8hFL9BixUcE+9altQYxUqR6B9DJ5n/ecjq3hG6nrP5+9Ibw?=
 =?us-ascii?Q?/X4V7s8AR0IRMSRKg6vVoZwtj38AJMM59/hbSI46Geji0qbk5AeIjbbRByah?=
 =?us-ascii?Q?EiiliHcWmMRk+DW2x1SF4wbUodDQuqEGSZ6TDBFqy8AFEzUbl7E63/A9j8ad?=
 =?us-ascii?Q?5Yx3JcIArINyka56cUsgfPutsctuxk19WNA4ILf87XFy1CwCREUjf0tZSrnW?=
 =?us-ascii?Q?lNR7wU8eb6Zd7fJJC9UPdwP/9J4QJg6IYSfXJX5dQNu/p08GR4e0vl2iUgnl?=
 =?us-ascii?Q?IUPt58oeOoVOQT+RnnM0Tw5/h0BpcjAf21nR/vdArd9ts6SIChLXMp7uTNvi?=
 =?us-ascii?Q?5XfnDq7xh/7vFQlZI0lYdqPofFg1YSUPTVfpYplwAg6rHmAvHpyTTvw9c2g9?=
 =?us-ascii?Q?UGjxAVDyW7ROKjNBpTiynDkT5tG4gS6kvE6u2cTvnvmbYbPeyUYf8rTl0sRh?=
 =?us-ascii?Q?oQCciv0jbwLE2kduEZNKMrIPOFH/GghNUf99ACEjp844YyfUdvF9FZEC1eP7?=
 =?us-ascii?Q?Z7d56/TZ7gikoPtak1iwMZbsonRU8MsUiB6/gO8reRl+X/JSXbwFoLT428Ef?=
 =?us-ascii?Q?5d2iv83iZgwl6wJbljgo/zNOxzDGBOTLkbMd7dJ6nCWX2piE3vhUmy+7isV6?=
 =?us-ascii?Q?2q+7kITT+xlmKK8182MWRqMJi3ZwWhL9voN5JowiSBC9tEiKSKADhaNdkoqL?=
 =?us-ascii?Q?eSCCv3XpoJWW+aFMG8ticR+hxtOOAmbZRr2XcdHBHLSTRmOysvlg7DL1C5bL?=
 =?us-ascii?Q?KKBovMsP+uZM3xzdQBlWI3b9TrnynLaulQkSvQQ/fIYfxTV0TSmsRuIDTwC4?=
 =?us-ascii?Q?biOLvPobqwhfGFrJ1kjjVsiCMZIEVjBS4xA3UMKlW830kOB/WCCDxoLauViG?=
 =?us-ascii?Q?WEF0smv+n2Vd1IDccPMOjn7Yv3a3dHnPtV7QIP8wAPQXk2FTlr7vEvUgUFfl?=
 =?us-ascii?Q?b7g0mGLjGacmoMlICnUd0uUsoFl42qgH6/Adzfx9wYatvHS9OaCfYW5jJ1Xz?=
 =?us-ascii?Q?WW5X7MmdPf2E7QPPJlQRc3a0SKP+ferW9fXHneM1aRlxxudTwBCL7UCOY0K1?=
 =?us-ascii?Q?x94TtP/ZRaXVw02sU+Koqg9yHZl/JwMjaiK2qQB5do7JKARLPshCtT4p513B?=
 =?us-ascii?Q?gA3Ix4NQ/tQ4C+WF+PrlASFN3lMGLQCqzqJkmBap3r/qy7cGNpxv1+pRMHOR?=
 =?us-ascii?Q?Aa0IPwGl9lDKWw1H1LAHnfW1HcSIsTguB3UQ5nrkGXuDITOsOwiycFCSzw2y?=
 =?us-ascii?Q?ndHzoyvzVnKjJL4ofY/E6+QjuwmMHEfrRwz41wDRGVHx12FOUw5AN6nyZnSx?=
 =?us-ascii?Q?zUuh4WuEpw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c9b678-387c-42cb-61d0-08dee7cacc45
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:25:33.0367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71VTKL6/hZK4kPtx6/RXFZjWqGlQ5uTCBPKhLWPMkU5q3mlKdXTufvM6B8DtkWC42e3g8/q72a1gYYg9j9qNaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2420
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241626

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
 meta/recipes-extended/wget/wget_1.21.4.bb     |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-15146.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-15146.patch b/meta/re=
cipes-extended/wget/wget/CVE-2026-15146.patch
new file mode 100644
index 0000000000..3c1704fffe
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-15146.patch
@@ -0,0 +1,122 @@
+From 89e62f8db81e8bc09cd6eb79a4f52ed75aa0253c Mon Sep 17 00:00:00 2001
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
+index d999027a..fd87578d 100644
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
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-exten=
ded/wget/wget_1.21.4.bb
index 24594b3093..8d9923e7b3 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -6,6 +6,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58470.patch \
            file://CVE-2026-58471.patch \
            file://CVE-2026-58472.patch \
+           file://CVE-2026-15146.patch \
           "
=20
 SRC_URI[sha256sum] =3D "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51=
df27525bcde04c"
--=20
2.34.1


