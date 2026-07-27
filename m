Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8E9C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 15:45:54 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34069.1785166401268852433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 08:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=u4qFHoAl;
 spf=pass (domain: est.tech, ip: 40.107.130.56, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcdRAZ9UPF5YYok1zhtGpr2jC2cqFje50qmjum6rXnypIS+zNtIbc4f7gPejYZNFm0PcjyHUaULv1rX8nQlerUU9Cb0Let/gEgs5Dye1k+6Ac1LeWWRi2YKPI6x+RSn23cYu9y9hvoZ91FMM75S07fR2p8XkdDCJwfL6eskjDahSzAF78R8p3rW1cGJqtHg4WahwjELennMaKc4pQ26s0KfWZ7qg0cJZLp8gk9AoV/fPvqH5nSkk6XzTjddMDzUCKm9kuusZGOpxQ0H6x3IwQZDddlq30Qrzr2P+8ieJ4I3xJPjlzsBp3tWfXqa2Uf9+gOxNClW0/pQMmimIg+nLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oAPNaQQZGfZjj57tPI1mSC11PDB6sE1Co66YvUl4BA=;
 b=SWR6d7enQidDFZDNPPhX8oluA4ocK12LP872GEdIYMsJY5x33f7Ot3WDXoNr3kgLjT8qZH8MvM5hwZP79lzj0J42YT8U3dXxOZEKrpzJhRz26wlBfPYYnH21zSf8REqJAGLHM/40Utx7/9EDwLF7W3/jMF2saPn8mmLUaPGgwXdW9z/IR4/B3mE8qym4HZrBy0A1XJPPYTyZLnqNT6Gof7XB9GIo0d/ykKbgHw/kKlV8p3FuJXokrzGshgoDK2pdn+7LtzLlUtbOIxrad1h1iDCX60GECjMNi5kHpqwjI/rGRMBh7OoA8rP14OzEuQiIGWGcZcruPVQ6qP8HNIvXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0oAPNaQQZGfZjj57tPI1mSC11PDB6sE1Co66YvUl4BA=;
 b=u4qFHoAlyUU3zG8zzRgQrh+SDDd4Tt+7+j5+zTEu2jWqlbI8HlZog41zeRqEBSKfrVM/hT835Jn0rHxmCZciUv4U2IJmuXFLRkQmhAPwRQ2NWpwjblR5UuUnYmT64vwWcfO8/dfSCx6115+ztx3DMAX92hp5UNXjeEq58UjJWOlbnbAhBj0f61VHrCeTuc5et7HkVMjXR9dPzB1hMFYcH2FEm2mz3xOlSbzPTn+8oWNbQyK9RQv0ZxXddR9kMDY0CyF/Ik6wGetjeZh0idJfvmc8yWFHFb8jDKZwaH2k6aEVXHW4yk/w1mk5Kf0GqFG/9F+ytJlySpCsDJJsjGrD0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS8P189MB2295.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:549::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.9; Mon, 27 Jul
 2026 15:33:15 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0270.009; Mon, 27 Jul 2026
 15:33:15 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] gnutls: fix CVE-2026-33845
Date: Mon, 27 Jul 2026 17:33:11 +0200
Message-ID: <20260727153312.1704911-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DUZPR01CA0329.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::28) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS8P189MB2295:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d2b42a-b9d6-4536-dc04-08deebf4601c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10070799003|56012099006|10067099003|11063799006|6133799003|12006099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	iQpRCzYpJWnuC86M1O9tk8wbKUxHmIJaM6Ki3FQrjZqpR2z/H4uVZyKhmeD4cpMHpqoHHcNZ/J9KKTnxlOJmjd+y1n36CprwhdRm4SOXNh4XitDoq70AUiRoJ3O7mRLqozue3dGCwUGrql0gyWcgAgkJYLqbKI/PqYnxQcDyeOn48CjRoJUoXgYGMFyrXbYYmN+qKPaNO9Z5qFtYC4oTZl51EEmSsQtP/bmfR221V+UdgZ9TiJt/N5b1SPHeIiHQfOuUhITR+Kzvfwd1W8Wm5oUgMhf+/EbnPyFOVfL8avF/Qdqxuky+I2LkHJ4Z30zuRh4cwXKWS3eIEHOrKmTAB11g0Rcdfxkzs+pPMoiV42uaUsvkXG4V+X4G7i/uv6dU1She9oY5IZWpPxHT57QZ7ggsoxQBdw8jmt/pGHtCRAvsndRhzevYMapRba0BKUBeQgzF2ippOtY90U8YaXHxSqWRtqm6u0DvdFi0qcFBNKwdTBpKYOxaVMO+WTV7L/8ZaoD1hR+rBdpVjkFCnwWS5Q0LoG4A/e+52lgakGv3B8Fqhx0Hpq455KNDNXwupoyf/iA02xDXJxHV/pwcqbNmaVZLYHAfUj28iAuN/7hpZ+HSi8KRwuTMdcgvbAyDVYThq1W3weAT45AxhBLuoJzfvzIPlgRUWsg5SfoT5E5m8ls=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10070799003)(56012099006)(10067099003)(11063799006)(6133799003)(12006099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wPlVamnLfXC0mlFHOUNCUo3Nqrz6wbNfYhhCB6YoUTdAk+3TfduX2MwTV61h?=
 =?us-ascii?Q?xBwpG5PQhlb9BNjyo6hwbiCj6/UrkPTwbb1nRGQdjnOtY3j8duwXTCwfxI7X?=
 =?us-ascii?Q?fz3564V42wUJa24GMj8T1Yqqe63E61U41WXijgjCQh947HmHrkMcMwJnmNHJ?=
 =?us-ascii?Q?7YwWq3y/sKk73QPfj3/ezYLzzeiM2bxPqo2bKbBVpoIP7MIv4PbvtGX5V3xQ?=
 =?us-ascii?Q?XHcRpT6FzlSgYHyQWtewyZyVwe0Q3zY83KMgqGmZiBwbhvDtVeN5Hs6KWHSd?=
 =?us-ascii?Q?wEIBiLB42v7KvH9oNyAAPtXj6B/1VrSDUOFbzUCvVwdUmnQ3YML0DJlCjGeX?=
 =?us-ascii?Q?8IExx6ZWCn0i2M8Wsm8iEJVBefCuMnPuyAQ8wYgOwV5P/Of8HlKnclscFUap?=
 =?us-ascii?Q?G1aUN5Td4J8mKqvZedTchzV5BuS4e5iMTcsuMa4JNNWq6bwzbx4QvPAqA73p?=
 =?us-ascii?Q?DCFvklXuAunNu5EB13wRLsBC7GYtA0lAG+caaCMBEXSkbroJTd+nknH4YPoR?=
 =?us-ascii?Q?d+iSwojy6urwysAr0sydTfbSXHQdOb/U4F3YbTToRx/E+nklr/7Qve23aBXb?=
 =?us-ascii?Q?DuRLUS89hOTrJoNkte/GjWMiFM4+jx0C5Q55GeJw8sphEcdFo1Mps7HssZRu?=
 =?us-ascii?Q?BB5y1jSdJeFqDv1sl3NOfQBqLFxmkUxOk5rV6MoI4jiKn6dTKQTrA66PoUHL?=
 =?us-ascii?Q?a6CJE5DRUk6Xqnk0XrxbqbKgjZR1pthOivOLjDOZ4MyCtcJVf7ohqWm+J95m?=
 =?us-ascii?Q?7X6+4rie7auCS7VGwkc2qac8xVZ7jXuXmuOsmEtPgeleaWj02kZ+udUYSPdG?=
 =?us-ascii?Q?u8TGG6olS+IUrSpid3FVqAZqRDAJMcZ8za640lLaFfcQR8sDd8UfhWZp6vaW?=
 =?us-ascii?Q?AMx70RT6blazz/HJNHN/Wqtstd5iSZNmW/u5dvTqTIEzwGK4WwODEnTglUDw?=
 =?us-ascii?Q?MDdv+AtdGxmrcbWJtu5kk/ZiJK5nNEsZHoY3wlgRrvK1EimO46G6eXnbN4zb?=
 =?us-ascii?Q?rJaDZHyy7Isybx6gj2TT2+kFexA0qVr2o7xpYOgpOL9yFV8h9kL4yit/hDa3?=
 =?us-ascii?Q?t4haoILGMqsvRGhkbFxNreE7feDVCYcSsEhkvkvvVzQ2XUrqFpig7oKY6lil?=
 =?us-ascii?Q?MZ9fHzy9alaOKH0r1IohAjGjvLfNU1KRZYloVmkEyblRE/s0s/wxG91DwqEc?=
 =?us-ascii?Q?p7pcp5og0m4IjYQg2L+JVv1u/8zzf0Mrebbi3ti0hAWo8Vsqr3MUY4HqpCoR?=
 =?us-ascii?Q?EH+G3RftBiaKyv5fQ5TSTE4D1047HMlNEmSg1VmJzdL/9jOUJePqNAx7EezO?=
 =?us-ascii?Q?ZtSNkF6O2gk2/I/GhWaIc9k1dYs/VgJd0gTMtl37ixbRJtZmPfCnhb8Wy2UM?=
 =?us-ascii?Q?JK9Eb51lDlu5xuwVMeJngZMNfzVHVwt9GhLVaCSwSRh+CQ5potWdpCDVlouQ?=
 =?us-ascii?Q?2VzB5/fx1kh2FnCx/HSRrrE/4xs2aTLNZXPeijfXMzLE4E+ZR4fr1ab9YAMR?=
 =?us-ascii?Q?JbP2Bz1fZvkWCRzlso1DWCMScGgeSJu7zxzGDe9hENSSdHQs9FC0vjCxVRBB?=
 =?us-ascii?Q?RkEYSkZMob82/JmXqRKOdgGKID8WzqEM3wu69s3WVm2zxUoZzoHuQQiKTVcY?=
 =?us-ascii?Q?zZzwpCXjbqGlhenM/u36KTpT7EHK/6muPCSB5UIrcaob1wRB+y1j/3hSNlGJ?=
 =?us-ascii?Q?Lrb2q3Tr9Ad0uJSDPrbmzXO+WmjJwczIvO2An0Vdz4mFp66uiPssbPiPugIG?=
 =?us-ascii?Q?BaIaucl1+c/XeF4kp4Snd9pDvQnXhD8c12YdUe4mWZqr6XqkP9Nmz36vpK1e?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	KpRE1I6UQaDCNGeWwZa1hS88CzJL72uJ5MlZ2n81FQKc1IEB/OFnectU
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d2b42a-b9d6-4536-dc04-08deebf4601c
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 15:33:15.1561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syum2BW1JIsv2lkOlbvcfficMxMKi860jtsK9/8QLwYzJtleKWyRPi02zV6Txs9ngXotlPg2PolanTWRiCcIVhFEWw7l1/RG3ZdKqZt2pF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2295
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242100

Backport patch to fix CVE-2026-33845.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-33845

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/e5b72c53c7d789d19d1d1cd10b275e8=
7d0415413

Tested with ptest:
Before: PASSED: 371, FAILED: 0, SKIPPED: 15
After: PASSED: 371, FAILED: 0, SKIPPED: 15

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../gnutls/gnutls/CVE-2026-33845.patch        | 195 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
 2 files changed, 196 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch b/meta=
/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
new file mode 100644
index 0000000000..d81ffb7ef7
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
@@ -0,0 +1,195 @@
+From 9679a9c8ab1694b78c7cb285d29da904e3f3bc45 Mon Sep 17 00:00:00 2001
+From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+Date: Mon, 27 Jul 2026 08:58:02 +0000
+Subject: [PATCH] buffers: switch from end_offset over to frag_length
+
+Instead of maintaining an inclusive [start_offset, end_offset] range
+when reassembling DTLS handshake,
+track start_offset and a relative frag_length instead.
+
+You'd think it'd be a no-op, but it fixes:
+
+* 0-length fragments triggering completion if message was 1 byte long
+* a remotely triggerable underflow and an ensuing heap overrun
+
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1811
+Fixes: CVE-2026-33845
+Fixes: GNUTLS-SA-2026-04-29-3
+CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+
+CVE: CVE-2026-33845
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/e5b72=
c53c7d789d19d1d1cd10b275e87d0415413]
+
+Backport notes: adapted to the stable branch, no logic changes.
+- lib/buffers.c: the local fragment-size variable is named frag_size here,
+  not frag_length as upstream; renamed accordingly.
+- lib/buffers.c: merge_handshake_packet() has no recv_buf alias in this
+  branch, so recv_buf[pos] was expanded to
+  session->internals.handshake_recv_buffer[pos], which changes line wrappi=
ng.
+- lib/gnutls_int.h: applies cleanly.
+
+Assisted-by: kiro:claude-sonnet-4.6
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/buffers.c    | 57 ++++++++++++++++++++++++------------------------
+ lib/gnutls_int.h |  4 ++--
+ 2 files changed, 31 insertions(+), 30 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 672380b05..2d77e7590 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -923,10 +923,7 @@ static int parse_handshake_header(gnutls_session_t se=
ssion, mbuffer_st *bufel,
+ 	}
+ 	data_size =3D _mbuffer_get_udata_size(bufel) - handshake_header_size;
+=20
+-	if (frag_size > 0)
+-		hsk->end_offset =3D hsk->start_offset + frag_size - 1;
+-	else
+-		hsk->end_offset =3D 0;
++	hsk->frag_length =3D frag_size;
+=20
+ 	_gnutls_handshake_log(
+ 		"HSK[%p]: %s (%u) was received. Length %d[%d], frag offset %d, frag len=
gth: %d, sequence: %d\n",
+@@ -940,9 +937,10 @@ static int parse_handshake_header(gnutls_session_t se=
ssion, mbuffer_st *bufel,
+=20
+ 	if (hsk->length > 0 &&
+ 	    (frag_size > data_size ||
+-	     (frag_size > 0 && hsk->end_offset >=3D hsk->length))) {
++	     (frag_size > 0 && hsk->start_offset + frag_size > hsk->length))) {
+ 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
+-	} else if (hsk->length =3D=3D 0 && hsk->end_offset !=3D 0 &&
++	} else if (hsk->length =3D=3D 0 &&
++		   hsk->start_offset + frag_size !=3D hsk->start_offset &&
+ 		   hsk->start_offset !=3D 0)
+ 		return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
+=20
+@@ -991,11 +989,10 @@ static int merge_handshake_packet(gnutls_session_t s=
ession,
+ 			hsk->data.length =3D hsk->length;
+ 		}
+=20
+-		if (hsk->length > 0 && hsk->end_offset > 0 &&
+-		    hsk->end_offset - hsk->start_offset + 1 !=3D hsk->length) {
++		if (hsk->length > 0 && hsk->frag_length > 0 &&
++		    hsk->frag_length !=3D hsk->length) {
+ 			memmove(&hsk->data.data[hsk->start_offset],
+-				hsk->data.data,
+-				hsk->end_offset - hsk->start_offset + 1);
++				hsk->data.data, hsk->frag_length);
+ 		}
+=20
+ 		session->internals.handshake_recv_buffer_size++;
+@@ -1012,7 +1009,7 @@ static int merge_handshake_packet(gnutls_session_t s=
ession,
+ 		if (hsk->start_offset <
+ 			    session->internals.handshake_recv_buffer[pos]
+ 				    .start_offset &&
+-		    hsk->end_offset + 1 >=3D
++		    hsk->start_offset + hsk->frag_length >=3D
+ 			    session->internals.handshake_recv_buffer[pos]
+ 				    .start_offset) {
+ 			memcpy(&session->internals.handshake_recv_buffer[pos]
+@@ -1021,28 +1018,34 @@ static int merge_handshake_packet(gnutls_session_t=
 session,
+ 			session->internals.handshake_recv_buffer[pos]
+ 				.start_offset =3D hsk->start_offset;
+ 			session->internals.handshake_recv_buffer[pos]
+-				.end_offset =3D MIN(
+-				hsk->end_offset,
++				.frag_length =3D MIN(
++				hsk->frag_length,
+ 				session->internals.handshake_recv_buffer[pos]
+-					.end_offset);
+-		} else if (hsk->end_offset >
++					.frag_length);
++		} else if (hsk->start_offset + hsk->frag_length >
++				   session->internals.handshake_recv_buffer[pos]
++					   .start_offset +
+ 				   session->internals.handshake_recv_buffer[pos]
+-					   .end_offset &&
++					   .frag_length &&
+ 			   hsk->start_offset <=3D
+ 				   session->internals.handshake_recv_buffer[pos]
+-						   .end_offset +
+-					   1) {
++					   .start_offset +
++				   session->internals.handshake_recv_buffer[pos]
++					   .frag_length) {
+ 			memcpy(&session->internals.handshake_recv_buffer[pos]
+ 					.data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+=20
+-			session->internals.handshake_recv_buffer[pos]
+-				.end_offset =3D hsk->end_offset;
+ 			session->internals.handshake_recv_buffer[pos]
+ 				.start_offset =3D MIN(
+ 				hsk->start_offset,
+ 				session->internals.handshake_recv_buffer[pos]
+ 					.start_offset);
++			session->internals.handshake_recv_buffer[pos]
++				.frag_length =3D
++				hsk->start_offset + hsk->frag_length -
++				session->internals.handshake_recv_buffer[pos]
++					.start_offset;
+ 		}
+ 		_gnutls_handshake_buffer_clear(hsk);
+ 	}
+@@ -1102,8 +1105,8 @@ static int get_last_packet(gnutls_session_t session,
+ 		}
+=20
+ 		else if ((recv_buf[LAST_ELEMENT].start_offset =3D=3D 0 &&
+-			  recv_buf[LAST_ELEMENT].end_offset =3D=3D
+-				  recv_buf[LAST_ELEMENT].length - 1) ||
++			  recv_buf[LAST_ELEMENT].frag_length =3D=3D
++				  recv_buf[LAST_ELEMENT].length) ||
+ 			 recv_buf[LAST_ELEMENT].length =3D=3D 0) {
+ 			session->internals.dtls.hsk_read_seq++;
+ 			_gnutls_handshake_buffer_move(hsk,
+@@ -1114,8 +1117,9 @@ static int get_last_packet(gnutls_session_t session,
+ 			/* if we don't have a complete handshake message, but we
+ 			 * have queued data waiting, try again to reconstruct the
+ 			 * handshake packet, using the queued */
+-			if (recv_buf[LAST_ELEMENT].end_offset !=3D
+-				    recv_buf[LAST_ELEMENT].length - 1 &&
++			if ((recv_buf[LAST_ELEMENT].start_offset +
++			     recv_buf[LAST_ELEMENT].frag_length) !=3D
++				    recv_buf[LAST_ELEMENT].length &&
+ 			    record_check_unprocessed(session) > 0)
+ 				return gnutls_assert_val(
+ 					GNUTLS_E_INT_CHECK_AGAIN);
+@@ -1302,9 +1306,7 @@ int _gnutls_parse_record_buffered_msgs(gnutls_sessio=
n_t session)
+ 					&session->internals.record_buffer,
+ 					bufel, ret);
+=20
+-				data_size =3D MIN(tmp.length,
+-						tmp.end_offset -
+-							tmp.start_offset + 1);
++				data_size =3D MIN(tmp.length, tmp.frag_length);
+=20
+ 				ret =3D _gnutls_buffer_append_data(
+ 					&tmp.data,
+@@ -1320,7 +1322,6 @@ int _gnutls_parse_record_buffered_msgs(gnutls_sessio=
n_t session)
+ 				ret =3D merge_handshake_packet(session, &tmp);
+ 				if (ret < 0)
+ 					return gnutls_assert_val(ret);
+-
+ 			} while (_mbuffer_get_udata_size(bufel) > 0);
+=20
+ 			prev =3D bufel;
+diff --git a/lib/gnutls_int.h b/lib/gnutls_int.h
+index 54d3c9f67..283f25c07 100644
+--- a/lib/gnutls_int.h
++++ b/lib/gnutls_int.h
+@@ -479,10 +479,10 @@ typedef struct {
+ 	uint16_t sequence;
+=20
+ 	/* indicate whether that message is complete.
+-	 * complete means start_offset =3D=3D 0 and end_offset =3D=3D length
++	 * complete means start_offset =3D=3D 0 and frag_length =3D=3D length
+ 	 */
+ 	uint32_t start_offset;
+-	uint32_t end_offset;
++	uint32_t frag_length; /* used exclusively in DTLS reassembly */
+=20
+ 	uint8_t header[MAX_HANDSHAKE_HEADER_SIZE];
+ 	int header_size;
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-su=
pport/gnutls/gnutls_3.8.12.bb
index 468b4bdd40..4219a650de 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            file://c99.patch \
            file://CVE-2026-3833.patch \
+           file://CVE-2026-33845.patch \
            "
=20
 SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf=
470bea012b8e51"

