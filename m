Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53883C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 12:31:45 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19362.1787657047128184455
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 04:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fU1UG/9C;
 spf=pass (domain: est.tech, ip: 52.101.65.25, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJDIvZF12BnftlvT3LyEtIqSH3tgAq744jtf/Bc71jNsPA0sk6iiJCVoI5N3wvkFsWSHpGqSVholzuwKdseDcLg8DtweFA4CPPunjP8GgCcWtpdAPBjtWFAnIkt8e3S5XlOflxqr2imO/96IWaw49BMRErwSzPCpVIql4SWD2A/gwWbzBgwTMRAg2PFArWoA0/J8zXtDHUJ7dC4EVOl6sdTedN//hvr8NFtFQPYshT7jBYTFxL8/ZK4SYTJdA6gYmB2FEbJ32pq9eGvLaYkAZ9Cd9w3eYdbHDvSML8kBeXHsd1jPLegdNs1XjAFtqsaTjP8pnGavd5PR/nK0mUhN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHjlaHGMcdTYiJDV4h/z67PzpRixjQdwGCiIa2rdIPc=;
 b=K5HT9wyBQfP07999KMSoSdXwDGXx949XuwELchpOar0+rwzDspTsfMgbKuPFTSszCVHc4VPZOk6nSyzKGwq6hofIGnIM0gNWGkGhtgYZZuoDzF8S8W54IQCO2G3FUp4drXFBW89ytvohlux2721BH5mkBI3h2Wo/lpavOU4Q6z75Z2NqpOKP7lT83MPjK2sea0PmcpWQIOUjqrJGWQfVbYxaLqlrxYgmKMKP6bKjdkhGNKahqlQklnHuNYRTng7yl8KIEqKYVMH6XLY8rOq4cTlPYLE6y5Z49itmqMMINLwSB/whNILHxBUwsCpf7kVhzUpy0d0Fe3Ta/67DJA+9iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHjlaHGMcdTYiJDV4h/z67PzpRixjQdwGCiIa2rdIPc=;
 b=fU1UG/9CUaxT6VFwydh635k/rDksjIEzJEkfUx96Yi7LEOOgAhL+lqs/8Ua7Hfndl97lzjkzrsuYJhA9BQJU7jxNgV3+A7bFlubtdJo9HlmL0Rj8ZIyTD7G2FOJ95sC/NO+/tyXjlaq73TlYoB3P7LzFpnqJI1krtQYbdhet4B7H9O7T6+fIYGMkwyn9RDvG14dlhMCe9mmxTEDiSTIGb896XeexqcLS6IJyMZk5mZQv/wnOMpqL58e6+X8B2cmApLALsRG+tQRYPusxxpalChqyUl8cWBy3HT5yZ+XsylGZ4k6x+ViSeQw4n7agZ+oOk7/3CXsKQqZOHt4slmIsYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AM7P189MB0727.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 11:24:03 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 11:24:03 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2] gnutls: fix CVE-2026-33845
Date: Tue, 25 Aug 2026 13:23:53 +0200
Message-ID: <20260825112357.189078-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0254.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::19) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AM7P189MB0727:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b37a0ea-a2d8-4958-4c43-08df029b5de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|13003099007|6133799003|10067099003|56012099006|11063799006|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	91plPeWzMQzxEW7RGzRYUWHJq5RLBtHBFgoAuxoLPkrKqmMfFwNr/19eHs1rAHDaJi+lEZmsz8eCZXmj8GrvewvHD8YpIpfMHdq9pUKTNsa5e4zsspAn867tz2yTdsY9xr3ihtN3OyWLBhr+NB8/nQtCiP+BwU4DdEW2EDYoh57G+RWxYaWJxU+lgSRgWhbfHv96nWiKZkg9o7GB31x3oVidvgksgkDN/2a0HzbGVfqUK1cA1eY1BoJ4KYdR846sQSsUt15qEpfPu+BXG/RFoYmbYE+IRQhr3N3XTNk/awgcmFcHbn7htM8mUolPbIz/UZAC/G9B186E71Hj1XIsDyeqgWBkCAxoq8sfB9gO7i0MFizb6QSTj/YZ8tNGgKHhrWvP4H3EDkOuhspJl0p8PNRkK1kPUr2WjFBMnsyZPG1IOIpcaIyFRTEMg+DP1u3iPO9ZH8a3PuBmK5wzLxkQiYsHLRZbzSrEKkXHoz1Y11g7Oig9jT4rAaFoVQQhQLUBrgz+3AOFVtRGhZXvoO2He4Lnn+ZiZW4sXOUHPoBd7DQ//FX0mrNFbpav4ee4U8ye7kHldHoWWfpw8l5AMAzB84EZUw2Tk9zaZZIHxsbXFLt0k43/hs/oVJCg90qhQ3ra9fC/E3MaRjTwV9FSc/qICVaz9Uob8q+AB7+oU5SDyy0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(13003099007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VbPtXtXI/UeAjAsqEAeqrqt9ANnY1zb5HV6zXU+c6DM6FDdcMcNP+E/pNE9G?=
 =?us-ascii?Q?EBi1YjOoqQx9AujIoSAkI513WP+XZM0lmSfv7Qqny1XwcGhXKsPJsJc52Oy7?=
 =?us-ascii?Q?1vFSbZbLA/J5G1VOlvzDDQILamvh4ZuldH1hjR5jkiThFuUwcKFb6PpJ9KTO?=
 =?us-ascii?Q?Fxsu2328nZx9L1s6GdPRN64FZ0UEy4N1os/LiQRME1IzRGL6QQ9Q5kFcjAPR?=
 =?us-ascii?Q?U0yyiv1HP6a6427+GjekUtMVUNPBMvT7r35LJqtegrYkMCTCRzdyWdOVNC5D?=
 =?us-ascii?Q?419VMgUcPwrBWyu7W6iZA0XzNy+APj+NhpY7qu6r6jNrHnfwkDer9hHwFeec?=
 =?us-ascii?Q?UmtAP6WReu8EiGCjVZtvoP5euULan3PfZiwUM98Qg3RCRKM2tPQJArSqM+Ii?=
 =?us-ascii?Q?QJ98Pp4KqB7BP6h1NwHGhbYM9JA5CCYF1KFyztQu0BpOmWgPoYun8D5ryL6t?=
 =?us-ascii?Q?O+SNlPzwLzE0VTN0IZljfa+YxDWOdV7FBB7zoXN/K58ouzdlkyOh+kMpzwCr?=
 =?us-ascii?Q?jmWg4PkgtnmWHnDg1BACeQMaiVj2zgQT5ApybWw8dHescZtUcNWnIwpKKpjt?=
 =?us-ascii?Q?MDeWSwr3I20B8NSdmiokQJHIeLObpUGHqnB3PfvpBo7GsHcM9CfU+GgnBBch?=
 =?us-ascii?Q?hOFj480TsgmpJq9bo/bTtEOq0pteuEnnZHoDNdls5oB7rHUowcyxPm/C6+YC?=
 =?us-ascii?Q?iHtot219Utd+1r532fxweT6KUMDNrHsXICC+w+VrFwWw5kzCcEy0mhtSsznM?=
 =?us-ascii?Q?x2lKZQ5xiTWGuCKl2T1GIjGyrW8VaXwpDDbtYNG8bnNZYp7anL8E1G0qCt0M?=
 =?us-ascii?Q?nC7njkkTiLKXZLaG5jMF1aSlg/MFEo9oEnBD5XK0zW0cdJdkDLEt+f5THIeN?=
 =?us-ascii?Q?zIOjGHwxeEMLXvi0A41i6NxYH+QgZAIKxSQL4JftYNzzqK5AHfaOLu8MbqLz?=
 =?us-ascii?Q?5WsWoODBcgmUfQatMwP11K5+F1gM3XKYw+Y6AGVCht8pV06zGe4t3mWAb6dC?=
 =?us-ascii?Q?fJCoqQUngPiYIqWRIhvCRN7Jw3TliidAwlPzJoPcSSi6tG8f8URb4uqLjErA?=
 =?us-ascii?Q?19vETvle9/x/ifwWAOIIs0PTfkPUiOGO4hSRoDlTvaVf/J/b4ANyxuU9avlD?=
 =?us-ascii?Q?JjBXKpPbjNuwT7/DnHKb0giKEQs+KXvII4eH8okkrLfFm8NBoh7M0eylOYHA?=
 =?us-ascii?Q?6vjQLcoiRHVQzxaBz3aJeO2bcBmFN9cQaR9LjZjzYil8MSnhm0fARZeLe8kR?=
 =?us-ascii?Q?fXGU+RuDgSrQuPvFaTkCjzN+FiqQU/UDIvzhZU8wBoQ8aAiQC/YCeHGCbLcu?=
 =?us-ascii?Q?IKnKfaAFVmN2r+Labm3/I8pLMEcNL+lpRPw4Q8wm0mzUQXRhEVzqj+G5fV2y?=
 =?us-ascii?Q?6HJhjRYe/rcCugo2wrrmbysSuysIlIX+GY8rTxJJhL7AB+xX4u8Y7/tBVbd7?=
 =?us-ascii?Q?XMZDLri2Rf3kDc3SV8tPFYgJBcvCwkgB9ishnopsPsxQZolXa51ZfsksqXdi?=
 =?us-ascii?Q?8D7LytdAciT2umlfAw9DT7alqDFVWCtqZP9N1m3hqOs7BLXyMESsV18NkCIQ?=
 =?us-ascii?Q?oVeohMUlz4+2tSUBaOedt86uQQi1vGV728Z+iefCs04dMEAKxTZ7Uw0g1zNj?=
 =?us-ascii?Q?5drzHZ6ZuwLpqqpVIWzdGhjXmUuAvHiYhxLt00+ygJf1pRbOOliLLXq4zmMR?=
 =?us-ascii?Q?V/SGaLzgQIX0FNGhwcwUvM53heJrFfjxBHeeY2JDLthXA+UlC+dpOSCOMKIC?=
 =?us-ascii?Q?RNuLrhoTALwKgl4oaTSwdSm7Wv3F50Y=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b37a0ea-a2d8-4958-4c43-08df029b5de6
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 11:24:02.9617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DScHYK/Bbd+C8X2Shx2nLfgmfM+o0ZdP/fbnQ/Jo/ksked5ksV+ewDrhKFvvu+NUPYKPGZCUVNaAlRbV7ZGZT7LuyZwA2U6Tp/3t3f99o7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0727
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 12:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244232

Backport patch to fix CVE-2026-33845.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-33845

Upstream fix:
  https://gitlab.com/gnutls/gnutls/-/commit/e5b72c53c7d789d19d1d1cd10b275e8=
7d0415413

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../gnutls/gnutls/CVE-2026-33845.patch        | 166 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch b/meta=
/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
new file mode 100644
index 0000000000..004d3082c5
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33845.patch
@@ -0,0 +1,166 @@
+From 490bfb28002fc0253010243ac387c756014c06e5 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 23 Mar 2026 15:09:43 +0100
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
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/buffers.c    | 50 +++++++++++++++++++++++++-----------------------
+ lib/gnutls_int.h |  4 ++--
+ 2 files changed, 28 insertions(+), 26 deletions(-)
+
+diff --git a/lib/buffers.c b/lib/buffers.c
+index 09779a8f3..02cc222c4 100644
+--- a/lib/buffers.c
++++ b/lib/buffers.c
+@@ -919,10 +919,7 @@ static int parse_handshake_header(gnutls_session_t se=
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
+@@ -936,9 +933,10 @@ static int parse_handshake_header(gnutls_session_t se=
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
+@@ -1002,11 +1000,10 @@ static int merge_handshake_packet(gnutls_session_t=
 session,
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
+@@ -1040,20 +1037,27 @@ static int merge_handshake_packet(gnutls_session_t=
 session,
+ 		}
+=20
+ 		if (hsk->start_offset < recv_buf[pos].start_offset &&
+-		    hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) {
++		    hsk->start_offset + hsk->frag_length >=3D
++			    recv_buf[pos].start_offset) {
+ 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+ 			recv_buf[pos].start_offset =3D hsk->start_offset;
+-			recv_buf[pos].end_offset =3D
+-				MIN(hsk->end_offset, recv_buf[pos].end_offset);
+-		} else if (hsk->end_offset > recv_buf[pos].end_offset &&
+-			   hsk->start_offset <=3D recv_buf[pos].end_offset + 1) {
++			recv_buf[pos].frag_length =3D MIN(
++				hsk->frag_length, recv_buf[pos].frag_length);
++		} else if (hsk->start_offset + hsk->frag_length >
++				   recv_buf[pos].start_offset +
++					   recv_buf[pos].frag_length &&
++			   hsk->start_offset <=3D
++				   recv_buf[pos].start_offset +
++					   recv_buf[pos].frag_length) {
+ 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
+ 			       hsk->data.data, hsk->data.length);
+=20
+-			recv_buf[pos].end_offset =3D hsk->end_offset;
+ 			recv_buf[pos].start_offset =3D MIN(
+ 				hsk->start_offset, recv_buf[pos].start_offset);
++			recv_buf[pos].frag_length =3D hsk->start_offset +
++						    hsk->frag_length -
++						    recv_buf[pos].start_offset;
+ 		}
+ 		_gnutls_handshake_buffer_clear(hsk);
+ 	}
+@@ -1113,8 +1117,8 @@ static int get_last_packet(gnutls_session_t session,
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
+@@ -1125,8 +1129,9 @@ static int get_last_packet(gnutls_session_t session,
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
+@@ -1313,9 +1318,7 @@ int _gnutls_parse_record_buffered_msgs(gnutls_sessio=
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
+@@ -1331,7 +1334,6 @@ int _gnutls_parse_record_buffered_msgs(gnutls_sessio=
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
index 3ad011742e..81c00eca3d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -37,6 +37,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-42009_p1.patch \
            file://CVE-2026-42009_p2.patch \
            file://CVE-2026-3833.patch \
+           file://CVE-2026-33845.patch \
            "
=20
 SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf=
470bea012b8e51"

