Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CE5CA5FA5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:05:00 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7507.1790849093234134496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=MIUMlEgX;
 spf=pass (domain: est.tech, ip: 52.101.66.44, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIBufxikrtXfJkx7RM2akaCf871aN33CRovfu2HDvqasCHJM9wnYfLdpJBFsl6FKurqmqXsirspj+LHvt6BOQjEO/SBVgpS6dhzHgrnQLT/W5KVYikvh1D/acdaBnLMysyBrPzb4CB56GNlByob5GT/kejujDBRJTgPVnTcne7RtHFNZSw2sR/yCFfZNPV3b5ZQKJfet5ngr3eIoVTKdBpvKtLBFAhrAy0nnkV1mVFTnInTN3aRFxVPap++K/O4XH3mvzENIVUm3LxvYpsd4l1ICbA5Sos3TYAsPuHsxR6kFQGx5XrjgsB3iocUniGXc4hB7FcE9GDwAFwJXqoI1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpDsaEhn7YYBpR339RgcvfIlTBJRRBEJOL2xMX4sOG0=;
 b=sqXRXPYgyFFn+ySTGpRc7lnnunAchKM1lW2jo2Li6RknzWtPf1jtwqRzOpSfPMSVH9H4/JTA/G92KH5WrLo+Nju8RkwstlZ7UWcYcAqa4V0FCwcwt/CnP+7g7yAapC6tDnljqrYaN6qAKDG83ayJzcTcBB5urU72Owa4vOUfz8EvYVyuTgC2aTJCnA2y/1tnfiKJKqsF19IsYAxajm5R1PR0I/gR2VSw2upbFSMHB30IlpKAJ6cxSorU2BO+nv5TtuZh1OCFtJmTU3tD2V0lhMay5NVkSm83TMUkIa2n3oQQh45ZFKTxH8pqqnf0jD1baPYlQnsHm0ns+f9nIUV5UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpDsaEhn7YYBpR339RgcvfIlTBJRRBEJOL2xMX4sOG0=;
 b=MIUMlEgXP5TcIKsEjoErUAqoWiCV2mxGMHu0EZoVD5Y6v+JjHAjBZJgIjTiobxTUNssI97FIekLd4DcgqD3r+e8PoEZZlAvao3W8cRYq6j1MJnN3BQFFgRj6PkMHvdy1GdDfmQtbVpmuaefQygneMOjjknyXWBFAVY+UJHC+6oYS1VNDaiLFFWOEtYokhvMNt29ArwC8OphEm5LZ299vB3nZQqyCyVths0n7wl6QvVV1u8GWMvFzL22CHb4ahePK/TLp9Js972OVQvqcclv1ZOWRqQU8XxtLDflisECexCy/BQ5aEFRHZlxSX16HglUZ19AdCvFxirkH0sOFbj4tvw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2980.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:264::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 10:04:46 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 10:04:46 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kea: Upgrade 3.2.0 -> 3.2.1
Date: Thu,  1 Oct 2026 12:04:44 +0200
Message-ID: <20261001100444.9447-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::26) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2980:EE_
X-MS-Office365-Filtering-Correlation-Id: d36db779-3c8e-4b60-780f-08df1fa36c10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|10067099003|18002099003|6133799003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	mkqW0IgnVohzltrf53zz7+5+0mtBvny4uwbnLKQdXh8Q7rQI+TFXryIpSLYSvpQ79ovrl9VXC1ZHJhXwKLg28cM1dnQJVFmrRnzucjEjFZCE0V0Gd566dZKF/+NBpVAXneQX2byiHv/MuIJqCQ3/QfEpKi4RPNyD9YUO/Xl3IL0JQcFrdRE2XhgyVI2jHnBVq70jGzVfZ4XQfwHGjlasWgJIG1z2+yYM9S1Ra8gGD4cgRu4nby9a9M+0Kbg8YKoulCPa8hJ0yI9VSfwIgpOBTyetQGhIfX9sckL5T3LXPi1pBDETa6P4R21P4VVY8xYFRgtDG/TJv9r166fp7u485/VcjnRODpuwPzdrxzdhJVun8ibu6m4c5l+9ZadZYpMbu/+AMNI7etcCLfB/9uz97dY8FJDAmAi1K48AauqCVk0vtc7D8oZ7Km8PU74iouwfsixqDZtmo5mPGKcPAZjDEa426Vda+nMxAfJJV7qTM+sEY4zCcDIwqju/u3F9xWI8CEVgxhQbiTwYBc0df4d/+Rdr8uvqee2UfIXaBZTEicZuhFv+gacsL43LnnIHhi/75hOk4m8hs3hVbjKfzY5dw6X8bHroTZhlMC7Q88aszTEdj4Os5+NUEomzIMHo5ms5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(6133799003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z7HsvhuhLmBgEIpQQeZBabhOdAnh0FN8y2jgbgAmxYBILsnC/PFiGb7/1B9T?=
 =?us-ascii?Q?HMknPmiQbei/12bgkuwbm5CY7yRz5dVXnU9aRaFB1omHb9nx4yn+bs5L4VH8?=
 =?us-ascii?Q?lGed76OC7Wfd0EyMeHZYD3jZwXKNZQMD0+KhXvatWII5+PAkguxSRlNZ8rbn?=
 =?us-ascii?Q?CMu7z2OhPqNItQsD6rZkLBemluciWIKcLGLZhSrTNi8du/SJhwkMVS7r+2m6?=
 =?us-ascii?Q?wZNK5t5R7+TdkD2TVsp9WZvFQELpsf172ArAfYRsdLx1FQMJ+b6UMrfEYtcc?=
 =?us-ascii?Q?w7/bzAPEPnXvi4t4xHGm+3LyMyXQfDQWaV3jb7aHh+KvlFal4LPdI0Vp1isr?=
 =?us-ascii?Q?2qZ/Q+mfWfYgbbycP01dwT+Del3gIGJjbIS6WOwka/Rdvwiis8oUcLFyaxce?=
 =?us-ascii?Q?0j+Z2gyMn781xVLpRRoMa7KHJgM6AolayS8knrZ3EWhRCUmfIy2/cnkJPhik?=
 =?us-ascii?Q?HLEnUvVyE+tD+GQXEWjbrD/ErAeanqEAY5KBZ4cwwpNRim7YYgxxog09+Fs8?=
 =?us-ascii?Q?ArGpThbSj9tVHYfS2qW56YYYRtIdd1LseaM4IhVQWghcb1jaUUQqpOZBOjj2?=
 =?us-ascii?Q?9/fxnPC6Z4QfFSHq9jXCZkLC0aXhbB97yG/44d6ULUpeHFHeNnJ8G7UnY6kU?=
 =?us-ascii?Q?VLvcNivpQaW2tMHk6HSlIwZxqzqJppOfKoZTEl+Wc1gqTlpQCQh0BNkr2Ggn?=
 =?us-ascii?Q?+s0L8Mh17wh+mMrwHs70Jwe85FC7JHcQU3ODRsVzSjhih2edU3WNMfNza22j?=
 =?us-ascii?Q?6BXkbSd+mVXXtwHfFUaATOeFyJXD9FJggJFIluRoMTGWVGrTdwN07U5ALXd3?=
 =?us-ascii?Q?/Wm2deHygnojpOO5Bw60hENoUPlVn3mH2s3s8zmX6ojpdIaE/o1eoWZga9Bt?=
 =?us-ascii?Q?quChtTWvyvW8I8YTrVA9J0oNc2XMgcXNvHwUIKIeb3i/kqw2HSQEMESww8wO?=
 =?us-ascii?Q?YREEiYydGa5x3Dn6vWYxgFGLG4b4gohGcgs3Bb2uXMnvphezYzp7Py0CH2NP?=
 =?us-ascii?Q?bpBa6d8EX2GGSUdxqFjycv6LXBhicAEyuESIld9Y0XkFy9FhRfQWpNMDi5Du?=
 =?us-ascii?Q?HgDlAZ4qMjLbFrJp3n34ToKMVjcVt3osAHKzBsB2eb87Makt/qx34eXv+5Ta?=
 =?us-ascii?Q?UyJiFNrQhL8cS+ol4lqMKSt6W29CSZ41T/gPksyZ/zbRxr8kYhyub60IRIjs?=
 =?us-ascii?Q?NzWsvM3Cbutk1Lyfvq/u2wad8HUkc7QoI0icpIKCjpKQudqkrshTGKpVMnk/?=
 =?us-ascii?Q?ok7a46Fu0vmusihwAvtbyOK1ZHA7FaMmHIHhGmNsBSaopKief7iCBsp9LfMk?=
 =?us-ascii?Q?atqcEIT5VqcMyYh+9hlgMneXkRwCyPr3bLjJVhWBoOqPwDqLlMCcbFqSLKGq?=
 =?us-ascii?Q?7Ha7aW45upvA0FZCI42o8GlckjQeQ/sPMvxqIIl6snbhEM9Wx8xB+iEbRMwq?=
 =?us-ascii?Q?qTkjIvwxVtptN1mqWEZagiuVARLIxwJzzcmx+AIbjylZHGmWzw6keNPeP/LZ?=
 =?us-ascii?Q?UVicUUqqcRdAf9N7y7jymBNmIXZpHLpYCI8XdDmGVO1TIfifGef5dlVDqN/b?=
 =?us-ascii?Q?VksEe+8I3YtwPSZCSUlNtziGCNsnCfT/30Yppe4tBH0diyqNWOYcTYPuM8en?=
 =?us-ascii?Q?vKF8a/t68vLYtOT4jQXEPnlw9OG8N7o3/lw8GAbQaA5TQhdOx2XH7t0bKyL4?=
 =?us-ascii?Q?FtvDW8Uf4aCJQUYi6BOtus1X6zQbbMaKqTXx39u6jYKY8IGOOQbylUXp05nZ?=
 =?us-ascii?Q?YmNljtVjgw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d36db779-3c8e-4b60-780f-08df1fa36c10
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 10:04:46.4805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFEFNJ96Jue6A7Wsxhzn2nWm239EMT5RuovGcPBJQy8+82KxhVccMO5jUa1DMyzBG+HWe2P5SqALBWX7YYG9Lg8wFkpMXQ9N9+0EM8RX6p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2980
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 10:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247024

ReleaseNotes: https://gitlab.isc.org/isc-projects/kea/-/wikis/Release-Notes=
/release-notes-3.2.1

The following summarizes the changes since the previous release:

```
2511.	[bug]		tmark
	Related name change requests (NCRs), are now
	sent by kea-dhcp4 and kea-dhcp6 in a single
	message to kea-dhcp-ddns.  This ensures that
	kea-dhcp-ddns processes them in the order they
	were received.
	(Gitlab #4806, #3005)

2510.	[bug]		tmark
	Modified kea-dhcp-ddns to avoid starting a
	transaction for a request if there is already
	a transaction for the request's FQDN or ip address.
	Prior to this it used the DHCID to guard against
	concurrent work.
	(Gitlab #4805,#4585)

2509.	[func]		tmark
	Modified kea-dhcp4 and kea-dhcp6 to avoid
	scheduling unnecessary DDNS entry removals
	when renewing leases.
	(Gitlab #4804, #4794)

2508.	[bug]		fdupont
	Made lexical analyzers more robust with null characters
	in input, e.g. in server or agent configuration files.
	(Gitlab #4795,#4739)

2507.	[build]		fdupont
	Added OpenSSL 4.0.x support.
	(Gitlab #4756, #4673)

2506.	[bug]		tmark
	Improved handling of special characters
	in values written to memfile lease database.
	(Gitlab #4787, #4393)

2505.	[bug]		razvan, fdupont
	Fixed bugs related to out of bound container access which can
	cause Kea to crash if -D_GLIBCXX_ASSERTIONS flag is used at
	compilation time. This affected perfdhcp, host_cache hook
	library, kea-dhcp4, kea-dhcp6, kea-dhcp-ddns and kea-netconf.
	Thank you to Joseph Bisch (joseph.bisch@gmail.com) for reporting
	this issue.
	(Gitlab #4783,#4741,#4708)

2504.	[bug]		fdupont
	Made parsing of DHCPv6 relayed messages stricter:
	now truncated RELAY-FORW and RELAY-REPLY headers
	cause the whole message to be dropped. Thank you to
	Qifan Zhang from Palo Alto Networks for reporting
	the issue.
	(Gitlab #4752,#4560,#4735)

2503.	[bug]		fdupont
	Set the broadcast flag in DHCPNAK responses to relayed
	DHCPREQUEST queries as required by RFC 2131 4.3.2.
	Thank you to Florian Krieger from Frauscher Sensor Technology
	Group GmbH for reporting the issue.
	(Gitlab #4751,#4424)

2502.	[bug]		razvan,tmark
	Corrected MLM_MYSQL_FETCH_FAILURE to 1 so MySQL
	selectQuery and host lookups detect mysql_stmt_fetch
	errors instead of silently ignoring them.
	(Gitlab #4754,#4658)

2501.	[bug]		fdupont,tmark
	Fixed an issue in debug-level logging of dropped packets
	that could cause the server to crash under heavy load.
	Applies to both kea-dhcp4 and kea-dhcp6.
	(Gitlab #4750,#4755,#4719,#4748)

2500.	[bug]		fdupont,tmark
	Removed spurious DHCP_RECEIVE4_UNKNOWN and
	DHCP_RECEIVE6_UNKNOWN warnings sent for instance
	when a command is received. This bug was introduced
	in 3.2.0 release.
	(Gitlab #4749, #4674)

2499.	[build]		razvan
	The library version numbers have been bumped up for the Kea 3.2.1
	stable release.
	(Gitlab #4811)

2498.	[bug]		tmark
	Improved handling of special characters
	in values written to memfile lease database.
	(Gitlab #4787,#4393)

 - Drop 0001-Add-const-qualifiers-to-OpenSSL-X509-pointers.patch as change =
is part of release
 - Refresh the existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-qualifiers-to-OpenSSL-X509-pointers.patch | 49 -------------------
 ...se-a-runtime-safe-interpreter-string.patch |  8 +--
 .../0001-mk_cfgrpt.sh-strip-prefixes.patch    |  2 +-
 ...er_unittest_support.cc-do-not-write-.patch |  2 +-
 .../kea/files/fix-multilib-conflict.patch     |  2 +-
 .../kea/{kea_3.2.0.bb =3D> kea_3.2.1.bb}        |  3 +-
 6 files changed, 8 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-Add-const-qual=
ifiers-to-OpenSSL-X509-pointers.patch
 rename meta/recipes-connectivity/kea/{kea_3.2.0.bb =3D> kea_3.2.1.bb} (96%=
)

diff --git a/meta/recipes-connectivity/kea/files/0001-Add-const-qualifiers-=
to-OpenSSL-X509-pointers.patch b/meta/recipes-connectivity/kea/files/0001-A=
dd-const-qualifiers-to-OpenSSL-X509-pointers.patch
deleted file mode 100644
index 987890f4ff1..00000000000
--- a/meta/recipes-connectivity/kea/files/0001-Add-const-qualifiers-to-Open=
SSL-X509-pointers.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 82d28b1be73bbc00e73e59d0c59c51a1e76519a5 Mon Sep 17 00:00:00 2001
-From: Simo Sorce <simo@redhat.com>
-Date: Mon, 27 Apr 2026 17:49:56 -0400
-Subject: [PATCH] Add const qualifiers to OpenSSL X509 pointers
-
-Added const qualifiers to the X509_NAME and X509_NAME_ENTRY pointers when
-retrieving subject and issuer names from TLS certificates. This ensures co=
nst-
-correctness and maintains compatibility with newer OpenSSL versions, which
-return const pointers from these getter functions.
-
-Signed-off-by: Simo Sorce <simo@redhat.com>
-
-Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issu=
es/4673]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/lib/asiolink/openssl_tls.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/lib/asiolink/openssl_tls.h b/src/lib/asiolink/openssl_tls=
.h
-index 57c3323..52a969b 100644
---- a/src/lib/asiolink/openssl_tls.h
-+++ b/src/lib/asiolink/openssl_tls.h
-@@ -175,9 +175,9 @@ public:
-         if (!cert) {
-             return ("");
-         }
--        ::X509_NAME *name =3D ::X509_get_subject_name(cert);
-+        const ::X509_NAME *name =3D ::X509_get_subject_name(cert);
-         int loc =3D ::X509_NAME_get_index_by_NID(name, NID_commonName, -1=
);
--        ::X509_NAME_ENTRY* ne =3D ::X509_NAME_get_entry(name, loc);
-+        const ::X509_NAME_ENTRY* ne =3D ::X509_NAME_get_entry(name, loc);
-         if (!ne) {
-             ::X509_free(cert);
-             return ("");
-@@ -209,9 +209,9 @@ public:
-         if (!cert) {
-             return ("");
-         }
--        ::X509_NAME *name =3D ::X509_get_issuer_name(cert);
-+        const ::X509_NAME *name =3D ::X509_get_issuer_name(cert);
-         int loc =3D ::X509_NAME_get_index_by_NID(name, NID_commonName, -1=
);
--        ::X509_NAME_ENTRY* ne =3D ::X509_NAME_get_entry(name, loc);
-+        const ::X509_NAME_ENTRY* ne =3D ::X509_NAME_get_entry(name, loc);
-         if (!ne) {
-             ::X509_free(cert);
-             return ("");
---=20
-2.53.0
-
diff --git a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-s=
afe-interpreter-string.patch b/meta/recipes-connectivity/kea/files/0001-mes=
on-use-a-runtime-safe-interpreter-string.patch
index 20a68e5e564..e3ab78525b4 100644
--- a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-int=
erpreter-string.patch
+++ b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-int=
erpreter-string.patch
@@ -1,4 +1,4 @@
-From 312f5b7e8286c306502bed348fe5da765c20f98d Mon Sep 17 00:00:00 2001
+From 8f832387e2e31683dca5df092c464ad655a417d2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:02:49 -0700
 Subject: [PATCH] meson: use a runtime-safe interpreter string
@@ -44,10 +44,10 @@ index 5fc5ee9..6485ce2 100644
  if PDFLATEX.found()
      doc_conf.set('HAVE_PDFLATEX', 'yes')
 diff --git a/meson.build b/meson.build
-index f3ef0ea..11a41cf 100644
+index 4e9ce4b..3cd8987 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -648,9 +648,13 @@ link_args =3D []
+@@ -655,9 +655,13 @@ link_args =3D []
  # Also, Meson might use it by default, but might not use it on all system=
s, so lots of variables...
  # EXECUTABLE_RPATH =3D f'$ORIGIN/../@LIBDIR@'
  # HOOK_RPATH =3D '$ORIGIN/../..'
@@ -62,7 +62,7 @@ index f3ef0ea..11a41cf 100644
 =20
  # Add rpaths for NETCONF dependencies.
  if NETCONF_DEP.found()
-@@ -769,7 +773,13 @@ report_conf_data.set('CXX_ARGS', ' '.join(compile_arg=
s))
+@@ -776,7 +780,13 @@ report_conf_data.set('CXX_ARGS', ' '.join(compile_arg=
s))
  report_conf_data.set('LD_ID', cpp.get_linker_id())
  link_args +=3D get_option('cpp_link_args')
  report_conf_data.set('LD_ARGS', ' '.join(link_args))
diff --git a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-pr=
efixes.patch b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-=
prefixes.patch
index beee04e1593..38703edba91 100644
--- a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.=
patch
+++ b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.=
patch
@@ -1,4 +1,4 @@
-From 97599e59234b8d79748eb7b1cdd451c91e94152f Mon Sep 17 00:00:00 2001
+From 9389b17972f09a6629d5a5fe5d869df6614c3109 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:31:39 -0700
 Subject: [PATCH] mk_cfgrpt.sh: strip prefixes
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_un=
ittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files=
/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 22a26f345dd..2a0db44e61b 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_=
support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_=
support.cc-do-not-write-.patch
@@ -1,4 +1,4 @@
-From 39281b6199b1307b6b70f3163a70ab9ce4f445d0 Mon Sep 17 00:00:00 2001
+From 98e5871081dec4953d7f92992a8167feb4fe8fa1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 15:57:03 +0000
 Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write buil=
d
diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patc=
h b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index c1ac4854254..e78e7792626 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,4 +1,4 @@
-From 5180d1866b99125d3353f76151e84644a5791e3d Mon Sep 17 00:00:00 2001
+From 414842987006bf8f1b6e447901360c230966a908 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 14 Oct 2025 01:37:35 +0000
 Subject: [PATCH] There are conflict of config files between kea and lib32-=
kea:
diff --git a/meta/recipes-connectivity/kea/kea_3.2.0.bb b/meta/recipes-conn=
ectivity/kea/kea_3.2.1.bb
similarity index 96%
rename from meta/recipes-connectivity/kea/kea_3.2.0.bb
rename to meta/recipes-connectivity/kea/kea_3.2.1.bb
index 38b24eed1f0..3e98e334335 100644
--- a/meta/recipes-connectivity/kea/kea_3.2.0.bb
+++ b/meta/recipes-connectivity/kea/kea_3.2.1.bb
@@ -19,9 +19,8 @@ SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.x=
z \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write=
-.patch \
            file://0001-meson-use-a-runtime-safe-interpreter-string.patch \
            file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
-           file://0001-Add-const-qualifiers-to-OpenSSL-X509-pointers.patch=
 \
            "
-SRC_URI[sha256sum] =3D "14bf695d37b65b9b1bf550fea5d0adaf9806c50e5419ef2a17=
6a4b8e9aade3df"
+SRC_URI[sha256sum] =3D "3478220be62b3aa361a2c7f97d5d2989b934f7864e82d4bd17=
056e1e208b9735"
=20
 inherit meson pkgconfig systemd update-rc.d upstream-version-is-even pytho=
n3-dir
=20

