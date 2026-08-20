Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CAAC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 14:13:32 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8088.1787235204207597209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 07:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SWBUl6Tg;
 spf=pass (domain: est.tech, ip: 52.101.72.40, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fbi9ClibE6BBlehsCX6UP3rQ+zYlhbsu3I9XK5mpFbnrYlkdn+W1L8GO0LN9pfKJiNTU006IZKgFv7JIDGG5HEyXwMPJYmjs3iOejg3KlUb8KtGoi/2BAA2v2dF5ht4V0oc5UEKLXhRKGW5VVeYd+Gcnu35F8xgPTRcosokNGS85v/YR0Yhg5otJtG0+NJQGFeCdoczGo5MW29mRtuM6mIKbnQQBN/ZurizhI1MuAnKVStbWEToH1BGc7sDu1C7RPcXnL0zbKV154zLwUanMxKH6UCyYLaVqaINd9pvMte8LkzGhfhZOyViRpH7L8dtzcyUdI95eXmAE0NsnEPwCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7iKScSS0rVGr9S99O6a8f31r9Ay+oO6ThzHAswssTA=;
 b=st6MJJ9FkhefsKRXZ/j5ck3lvXpAU9bDOXWBfkvz43arX7IsaBmTfmQqB9BonWFHS+2SNKE6EbVI96AtU/3j/pFspts/ee/56oimv9KNFQh5W2g67nCcPBjRqwxk5IpLmJh+6E9kZutkFrK3eSFKXIeHBWfegHXPbXZwMYy3WNGMvapoLH7nvVhsfIB1e0X31F4XBF3xjyb6o0O8HpZw+y3JFlF5USZc8BvHKi2ljm+kd1pdf1/TmL3NFCgmndLg4Yzv5iXp7I6+EbcWB0Xg2xMimbqdsP1yIMzIofielbneYyy/C/O9Qyf4AHvw/5sK1AJGmxDeE6evoEGsWB9mJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7iKScSS0rVGr9S99O6a8f31r9Ay+oO6ThzHAswssTA=;
 b=SWBUl6TgJihnTYt743weDqXuNlaiDirNLY/Nb3xPbWpZs84Bh1HhTnRvwSR1efiNzN3gZWN4HdWiaA73IxItHSI4aPnAuaVzrEMv1oVBjX62TYVPanwyxU3T/wSM5471Gb8nmAyaMWqi2+qNpQPxpsw3GcGHDN07+FQnNy2smG/nwFgHUmgVq6HiHWA/uU4SmSHutmIYVnl8d72bf4egzCyWWzO2MPN2vov4z4Ajp0rt3v1GkcsQ8r0bLLrOGdJ81pN9mh9v2S/hg48VOEs+0aQawePqBq075NDSWx4VhqlnIx84IACy9BbIY+y6Vni8FyKm5Pxo5f+7ipAEVvQgiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by DB8P189MB0620.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:128::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Thu, 20 Aug
 2026 14:13:20 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0360.003; Thu, 20 Aug 2026
 14:13:20 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] Fix gnutls CVE-2026-33846
Date: Thu, 20 Aug 2026 16:13:17 +0200
Message-ID: <20260820141317.937328-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0029.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::29) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|DB8P189MB0620:EE_
X-MS-Office365-Filtering-Correlation-Id: 24de7481-0eed-4d33-2150-08defec52fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|13003099007|56012099006|10067099003|6133799003|11063799006|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	t5UTX+wdYcM5PfPOj7jFSeZ0gwQmAvSqkhQztlsKMLli08zyxi/F+hLiRCNrb8gAQ/5Ifc5C/DOd23uyXyOy3SYbnGQRLK/KMrLU37W7mT3glLYWdn5rrXSUmVHhXbpwdrdaqcGQPeC2KXF90KmL8ZKwtgP3pQy671SndqU25tqslOOxawzngsPZwyy9RLZbiihe9vf8XFATY9+zwNdLQQAz3UqnvsSZ+uUC7SQMNf0jiQz242xjNMVqFGqoS23vrBRaSjR0nNZVciG3HbeR5sjkfroEnHDdE5YkezbNe9/n5InijiGKqrcsgitwtU9TO8fYCx1ZUceveRkMFnn7mSl26O+SBAlSGfNrQD7pvrKJI8B0LFCeEXJ1cDpO7A6DOt+AjbxgH3bLegzEZUtQFyX3xQdtcpYaXxa0JfXytBHrHiPYVIy+zMN+iQptAYcHtHj2KPfwNO+ASnja1BKridbGsufDD1v6gBU/SyHlCwFeP9yVxFNePp3lu+SDc+vgW7jIHTZFAq7nXVOXI5OqwbwUNHN/sGXRMPrwvsGobM3xmADEp128zKZkFWLpOMbYX5/bccQpKNyuT9OfyryG5NTmG5yNxXHaXPNRkWFk6Rv8D9jeyKhV1y8UpQuSidryJLjwEjfoi+nOedKcvQG5jlhuX9BEBvGM40PsTp3/NeQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(13003099007)(56012099006)(10067099003)(6133799003)(11063799006)(18002099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kJ15Nzyfzda7bFvmxrZpemSmnF3gjAp9yvAGzP/n0lCcPHG8hb3/+Wr5IbDc?=
 =?us-ascii?Q?ChbGBXXMCQJvG0qzAnRXI6PFNI0INc1cWmOMTeXOMX0Emz5myO6n6xvjCtO5?=
 =?us-ascii?Q?jLm0/ut87+hCfdBcP/NUX30L/Uz/GW4Csg4P0fcWQa3tJaQuZbdoDy9FKs5H?=
 =?us-ascii?Q?qAmz4afPR/AzuGD0zIOOj/+MbQ7y3t/OzEOypPK7fIATz9ddAeRfutuURsH8?=
 =?us-ascii?Q?EHq9eNP5hN6oEvaQHdNYHf5ZKGCdux1c0xrUGi66brRMnEMfiKjhqES75TVI?=
 =?us-ascii?Q?VSpmifDvwOg+141MQmjUgV+7G8Njt90YZhPMTnbp9rXSqN2PsGiqu72i3Yl0?=
 =?us-ascii?Q?7cu5DKEe2f4KqZNbkQVwjORVkjhcO62aRC+3KfW9Ns7vZlnlVEh6gyS57b80?=
 =?us-ascii?Q?IaTAaqA8leJrwHVhlR0fSsnkmQuopMOWGEBYPqgLLdsAZnyRjZ9EsjWMt4QC?=
 =?us-ascii?Q?5lzlp4eRfUX1R1xFTW6eytM9iW9+vPFe7kJFiRCtf+JBbaPFuEs2IxN+W83u?=
 =?us-ascii?Q?VW4rMrQSkW88QTkxDEE3rEpeokmNYZMiLlBNKXm/6aMm32GM0WX3znCAyDHh?=
 =?us-ascii?Q?dQPOFgtu4gMtIheBnOhnAtQnb5+ulXbB8bRJBoxRq7clnNvEMzwkl8OUq9ur?=
 =?us-ascii?Q?NmuDcIPL1vZKnFc8Z611qTG/gqnjN6OxFz1hZIEKN8nef66mXi5khrsSVGze?=
 =?us-ascii?Q?FVoUJ0C4n13KMQkfumyQwLNx6LQunrkqZBj3zYhC1RR8C8LXlQBm7DAYl0oE?=
 =?us-ascii?Q?XJoLVhoUwgmFp10Snv8S+Y84I09lYo47sEeEwm1PPEkbct1k5dOYIUjviSSZ?=
 =?us-ascii?Q?mbSER89n83N2U84nZ19aNfxF7Qb/4uZlIfhJqYuZ7wxPKXWwRLKfppfQZrkg?=
 =?us-ascii?Q?+X/mWe+cXrLo2OEEouSjlbjn5cRw+NakzqkW+0wnf16r8Q6QU+vc4FcSFEIJ?=
 =?us-ascii?Q?GuGkCD4WwRLl0lK5rxY1QtY9uxMy19FETEBIBLo7wKFpJovWy8ZkXjGYN8n1?=
 =?us-ascii?Q?wdUxoO2AVa+vjBFbLVnHo36tv9ex/cwoDvNMNacXNhzXMR8t6GdD/b6Hdwz9?=
 =?us-ascii?Q?epsaCanscporeE6i8x6Fl97CTW6YYkyfAzMnSdSLPAQFcTEjkRkxfogdUkok?=
 =?us-ascii?Q?bhl9RF8y8aikNhNoqxJ/JxuvWr9YbrVoDqS9iAWKl6MyN7amqqXBVPzkcGiS?=
 =?us-ascii?Q?pJvoP1dXmJgYslC0PZTXR8gg0wzrmqTX3qh2HiY2VZWOgcrGtdsMyqOU6U8R?=
 =?us-ascii?Q?a88ZtcBFCBQmR2T7FyL3O/EB6Q8WwX04flF2Z0g/aHzrIrlk7phUDAQpX61C?=
 =?us-ascii?Q?8ciDKNp8wLfrV6inKar6ukKOh/2oaApjiX1oKjd4qsuzgtOY7FaZdpknf/wT?=
 =?us-ascii?Q?irol58OTt6ToEKvAfXbC8oFTq/FrPnIIaZfWO/jVwnw+6Dv3iV5OJG841mmL?=
 =?us-ascii?Q?jHJd9605101rsZBX76myDZ7i87scdyfGWHAoj050Ksa8In3AOAkN7pPscL8C?=
 =?us-ascii?Q?EWrtu+6Fgb3Ctg+T1SGwcXmqLg5GykiKBWVRieFWU7fNGsNDNKH52/yyFvcB?=
 =?us-ascii?Q?QP/jZpu122/QUXlsZYWUboEmlCcHchSk0y2HnkXCx2Djba5fTOGAXZSer8wZ?=
 =?us-ascii?Q?9cn/yfe7rV2qFXFZyd44v/VUhLVR8R7/T+LErF7QnBIDAJKzFp7GEqLavdMn?=
 =?us-ascii?Q?54UB1d2HMnCOp4tpYMpm0lOKmHj/fPTMOlcQWO0azy0YZ7izVibgKOlrHENz?=
 =?us-ascii?Q?/BZ5fntdPQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 24de7481-0eed-4d33-2150-08defec52fe2
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 14:13:19.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: coS2WY5EZKbPGnMpvPHESgV+3P2SQ7O3NSoibNT557XbWAAblQ7J6h6QQDSwftgPsFBea8USmFy8p0dCtwnh4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0620
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 14:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243866

Backport patch [1] referenced in [2]. The difference in upstream and the ba=
ckport
is skipping of intermediate patch [3] which essentially just aliases
`session->internals.handshake_recv_buffer -> recv_buf'.

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-33846

[1] https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df=
3d383d1ff78
[2] https://security-tracker.debian.org/tracker/CVE-2026-33846
[3] https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb=
1bf4cbd1fc0

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../gnutls/gnutls/CVE-2026-33846.patch        | 66 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b/meta=
/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
new file mode 100644
index 0000000000..81c928c872
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
@@ -0,0 +1,66 @@
+From f83c50305b4186075aeea26c7d8d64fdad95f381 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Fri, 17 Apr 2026 18:21:36 +0200
+Subject: [PATCH] buffers: add more checks to DTLS reassembly
+
+Previously, gnutls didn't check that DTLS fragments claimed
+a consistent message_length value.
+Additionally, a crucial array size check was missing,
+enabling an attacker to cause a heap overwrite.
+The updated version rejects fragments with mismatching length
+and adds a missing boundary check.
+
+Reported-by: Haruto Kimura (Stella)
+Reported-by: Oscar Reparaz
+Reported-by: Zou Dikai
+Fixes: #1816
+Fixes: #1838
+Fixes: #1839
+Fixes: CVE-2026-33846
+Fixes: GNUTLS-SA-2026-04-29-1
+CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-33846
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/65ab3=
3fa54e34fba69d793735b7df3d383d1ff78]
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ lib/buffers.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 672380b05..2934fd366 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -1009,6 +1009,27 @@ static int merge_handshake_packet(gnutls_session_t =
session,
+ 			&session->internals.handshake_recv_buffer[pos], hsk);
+=20
+ 	} else {
++		if (hsk->length !=3D
++			session->internals.handshake_recv_buffer[pos].length) {
++			/* inconsistent across fragments */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++		/* start_offset + data.length <=3D hsk->length <=3D max_length */
++		if (hsk->length < hsk->start_offset + hsk->data.length) {
++			/* impossible claims, overflow requested */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
++		if (hsk->length >
++			session->internals.handshake_recv_buffer[pos].data.max_length) {
++			/* we don't have this much allocated, overflow guard */
++			_gnutls_handshake_buffer_clear(hsk);
++			return gnutls_assert_val(
++				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
++		}
+ 		if (hsk->start_offset <
+ 			    session->internals.handshake_recv_buffer[pos]
+ 				    .start_offset &&
+--=20
+2.47.3
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.8.4.bb
index d27d2cfa74..92f302cd88 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -45,6 +45,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar
            file://CVE-2025-14831-9.patch \
            file://CVE-2026-42009_p1.patch \
            file://CVE-2026-42009_p2.patch \
+           file://CVE-2026-33846.patch \
            "
=20
 SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44c=
dfa7f36ebc3a9b"
--=20
2.43.0


