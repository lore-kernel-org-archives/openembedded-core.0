Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC97CC55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:21:38 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37123.1785924508715532015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=m3xQtUBk;
 spf=pass (domain: est.tech, ip: 52.101.65.57, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjwtwE98BQPtRC7rfc8dPPsOeSP7Dhm+UhqwXokNMUU0GZR8WZ8JPOS1TMrUSMowJ77W0T+1+a09J8krlgfonC4lh4nYg5R+krMk5jwH3tGvjpioV/albz5yHLZBODVws6lPie89ljV4GlIWbSNvjSvMoy0jltTQM/MYgC9edGtIFXibYyKMc1X7SAvQAN+PMpCFmOU0/zEoPrXLPem9cYOSGXak8AayrQy0kqjehI0FuBzRozBHKWeXfIBOo9zUNwmHDo6YSFDRWveuqB8K+3+nnnGTP8BRYv2Shmw9R4OxapvA2CmS8lZ9TaLMaOvsYmcN+8r+L5Z5HGL1R9Sv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPBD41pSssrRMfzvZyVGh3JB3+Ft9ZHAYU89xp3qhwA=;
 b=l6lr+NZQry0RdRdO6J0qebeIzPYAJ5CvgjapFy2OIH3LGgS+o1Z/AHHFmNN6YJVLEVgESWXEAlcQL4ZQf0Yq5msmlWn0pIrjOfW1lNve0EcAjvFOJtBD0n4lxnl5vkTqFhgt8uEkboXkRbLhtHlsCasIIQwVFpz0cOm3PsrTEORrfP5CpmKbuP/OLUzYeJOLG/Upiw5mb6XKzLxFJj0VT23vn4Wow+7I02TqZMmyYi9w+NSSow5dW/+OroqsdaTPvlwxiz7qT6Dm79/Evzl/NZqI3OCUpT6HzYQY6oWhodZZFhaERd3IkfmuhP2HKaVaeXv8u43p8YnBjByk5PZu9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPBD41pSssrRMfzvZyVGh3JB3+Ft9ZHAYU89xp3qhwA=;
 b=m3xQtUBkYCq2k/GhYwIftalTg1vC2M0iPjoaiMfZw1uGHr1YzWfOMJTrKKyHGnnKRsCNRMte5pFbeyJn7drvUKBXcesif075ir+KaCn/azgwhphP1qrP1ZeUej/eFvrIoQUSKtSw2UxKhr+aE0sMtn8xKsMsnCYBogyM19idcMHGxgKTE/GrbJqrmFEc/hKtXz7G3kGSJjKALfX667vw7u2Q/iy8ZVJIUrJW+dXiAJQMP1rpJDOIJQwnXd9285k5qeBEarqqURP5AcVVZXuUVSrer69TlIEFJBIb+LmPbPBsEwxuWaeyc3DRJ1p5si3Y8sTuZKztOmtpJNC/dxcTZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB9P189MB2122.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:399::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Wed, 5 Aug
 2026 10:08:21 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.015; Wed, 5 Aug 2026
 10:08:21 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] thrift: fix CVE-2026-58389
Date: Wed,  5 Aug 2026 12:08:07 +0200
Message-ID: <20260805100818.975113-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DUZPR01CA0331.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::24) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB9P189MB2122:EE_
X-MS-Office365-Filtering-Correlation-Id: a73a1504-dde6-48ca-cb25-08def2d97a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|11063799006|56012099006|12006099003|3023799007|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	Kup+hZI9Vf7gDdFJ3iWJZFVyBByTlAGPYQmg6JRZ628vzdckFgzAVJcYYC+ac9YZ/9LUj0y156KGgCUM4+1pvqWT7STKTzBKkYfbRKXyQVQREDkdOnPCUohlPlOhSqHuIj9JppxydH87d7TBqc1OG4MfAc3+SsQ26lFaA32c9lc/BDhCY7nzW4f9Lc1HFlHPI+wSMku0RhVSaFI2iAHwuBX/3ChDwJq7oLZZWoDf9Ws2el1oObkHcw2IjtOQT8X2OMGsmytWJEKqxNkhfQWxht7lZ6qKnshcDMLKXnX7NfuEKFyJXxg0P3f7hfSGDS3uyDdV32XctsXrUDQ2p64BH/lpfMjwYeYtWxHnE9rtEkogoeVttIO6VOB3/W4U4+N4aOo/FXHFk5JabNjvdM5RCyLcSefv8sfn7ANtMq13E1YqnCP6nn4/rQe7piqQBULZojC4d4151FezZCbccMNgfzcJvMBM2/bXbhD66gHmc7gs9SOPCxScNFDcF4hAUwDpxq5BLXDy1beEU/VY4ku6Rxued6B6g9oi8XShgkJvryuKlpZ6Z5uXkkr7wfGW7CdA6qYmMzFa3+rW3WW11GW0bZUh8x9KHtrPvUpgD5zEfrd5QNX2hOyvXfNWMBIwQVrlV77ZMxph2KYclDJqQaGks9M/m0DbQxovVpxpbdysb+4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(12006099003)(3023799007)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QXHVWTnTRKupSNpcyDOuhH8P+aj++f3YOr8oRRa4woUJVUroyGkAAWP9NnEx?=
 =?us-ascii?Q?qfu15Il40jo8+WO6jqtjQnnJ+AYj/hDR+iSgTrmVJDviJR4xGO/xMFrjALIx?=
 =?us-ascii?Q?UV3RJ6/1b5YYv0cDaAtuAsd8wBWCaBUgtMVCJZHd9lNd0DTkedxjpDmVY8pP?=
 =?us-ascii?Q?bbqu4MhHBmIbpVU0aMkvccwvSyVHUVW9FXlZlBdCAUGlvqT+vvdir8NXn6e3?=
 =?us-ascii?Q?KZtojsJH7Ya53yiUl/rXtGr5WOpG4vxMO58nv8/cfB/eyDp8o7r9MCgob2sW?=
 =?us-ascii?Q?3m+OmdAqUuzyN/HuJs9rnqgQ6aEw0xj87nJl+CHF7flP3aYAv5exAiAMOX+z?=
 =?us-ascii?Q?81f7fjtFaEOJed5NfUY1+0500w7NQe05R3qPwrCUjzucJJJMbThAxqmZ9e6r?=
 =?us-ascii?Q?hCPIUgo/zAhEj68wmvnc6UcIgOLPj4FXIm7RY0a85nQNoopj1rjONWhQ2KBE?=
 =?us-ascii?Q?3MEkxoQDKGYF3lLuIujP5nJ1q0StDfRQbWr1uNrayn8zDERJtWHH4sYuX5Fa?=
 =?us-ascii?Q?uxXFbSrfpdmcZWVn9kOe8QEJLBcKWNPTerWj6GKgPiOGBvJ5t3vg5EcvAFqz?=
 =?us-ascii?Q?WZbLmpxTwgwRT+Vd+zdWj1mTy6mTKSWzKSZojUyO2t81BdZ8/TzlOVZKq4CU?=
 =?us-ascii?Q?yUCQz9oA0d/EVkTuW4pVVYuuNcIP5kEWREaVDAC1Rk9Oh6bR9zfCdOzhd1Ps?=
 =?us-ascii?Q?GPBOCy/K50xISVZQ8kn3Cbx7J1XFvYezzgfRxwPB0gL135S1qedbv+N4kSde?=
 =?us-ascii?Q?WGtIjFY80Uqd52IxCY1VJnMimftVq8XrXASskzhc3PRlxhdrJmtl0ugt2H7K?=
 =?us-ascii?Q?3kmOCGi7YtmNlC2p/H77Mc/Viv7cDkfx2M3iW9jtBEbOdBCWjfZQx0grG9mY?=
 =?us-ascii?Q?sRMxcJkR1/S6TX+TuUBBcQdF12I6L0drLBLavh5ii+v88it43gf7uOyKAvgP?=
 =?us-ascii?Q?jF0VM9/1NnYlgqvOtpBZ4rW2BjfAe1VWjN6I406WcUZXsadDOKFrub+T4HEZ?=
 =?us-ascii?Q?0VMi/5UpjB41MOuyZ5OFGL2Yf5gYyYLzGD5jm3JyVM4oKl0TtOE2xgP+QcsW?=
 =?us-ascii?Q?a/VsBs6r25K0noT7qHH/jmZ8oqRlxfOHwM9UVUgN6Uru8nND9AiNS99KtLcM?=
 =?us-ascii?Q?T5KtpMLsIJrjbojH4W0TxeuEk2M43+kmxpfAiSV9eqdHUWXUn8WsYX+sLKMe?=
 =?us-ascii?Q?+pH/iK5JpkqmxpuAaDCBYt+OxPk7dFaZPO+oXc3VD+gxuQVBI0919OlZZBsz?=
 =?us-ascii?Q?GAPkfJGNPlue99Xi6Hycj2vMbd0MLYU8sneARJeWJro+NWMOx5aNgXeB8BKD?=
 =?us-ascii?Q?Igi0BxBKygDDIjbH5go8dvvPlzA6K7aPZXBlBF2D0x+kkOwT6idoZe7IiVmZ?=
 =?us-ascii?Q?Tp7L/OdDMujWSSkU5zGhvc0YnL+hDoNTaRb7pHc3Lz/cypFFX10EMMiV55d/?=
 =?us-ascii?Q?ECoXpyK6rbJhC3znPY+8xhqDm8c6489Sy89ds9o8N2uBs+wLHxA7URemK/1J?=
 =?us-ascii?Q?YaNp+1/C3+wiRL1G025UppCaUzPHs5Mu1/6pOYORvfTFBjmksUxsG3KIsSHt?=
 =?us-ascii?Q?BIOdwcdSF8sancLwz0ccAwKlCBaxoE4AehrdiWIX2uXIKsnfq9AecwzSR+J5?=
 =?us-ascii?Q?clkBOtDX8Hman/aJQif/RN/L0i9LBmswwMWF8LTQxjLob+ABqI2CCtbR+gIO?=
 =?us-ascii?Q?O8sLjaOlwYO7PGvB3XL9NpYZRDq5no9OqDV2j5VR8ADwjxXT5/biEVmDDjwN?=
 =?us-ascii?Q?0YLIvNH5HocqbpznOzEgSS+zfeVTAu4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a73a1504-dde6-48ca-cb25-08def2d97a88
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 10:08:21.2011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oM2UIK9a8451IV8JVcZIiDkQlnKW4nMVr7noVXSZ19fuw/XVBxRFFPx4LdFcw03Iwo9G2zEtY3k4xyIJRYlB+/9hARuiA30nPOrh3RtXng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2122
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 10:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242856

Backport patch to fix CVE-2026-58389.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58389

Upstream fix:
  https://github.com/apache/thrift/commit/0ab16e3a83637711f4e0f788c205f6657=
6fd0a55

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
- Note on CVE relationship: The patch series that was submitted (https://pa=
tchwork.yoctoproject.org/project/oe/list/?series=3D48481) contains
CVE-2026-43868 fix, that introduces the preliminary container/object size c=
hecks in the Rust client, which CVE-2026-58389 further enhances.
---
 .../thrift/thrift/CVE-2026-58389.patch        | 93 +++++++++++++++++++
 .../thrift/thrift_0.20.0.bb                   |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-583=
89.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patch
new file mode 100644
index 0000000000..558969f9ce
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patch
@@ -0,0 +1,93 @@
+From 0a95520b91c1da608e5530f4299c3b4ffb4b550c Mon Sep 17 00:00:00 2001
+From: Javid Khan <dxbjavid@gmail.com>
+Date: Mon, 29 Jun 2026 19:51:49 +0530
+Subject: [PATCH] enforce max_string_size on non-strict binary message name
+
+
+CVE: CVE-2026-58389
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/0ab16e3=
a83637711f4e0f788c205f66576fd0a55]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/rs/src/protocol/binary.rs | 61 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 61 insertions(+)
+
+diff --git a/lib/rs/src/protocol/binary.rs b/lib/rs/src/protocol/binary.rs
+index 596285fb9..38f528571 100644
+--- a/lib/rs/src/protocol/binary.rs
++++ b/lib/rs/src/protocol/binary.rs
+@@ -137,6 +137,17 @@ where
+                 // is the message name. strings (byte arrays) are length-=
prefixed,
+                 // so we've just read the length in the first 4 bytes
+                 let name_size =3D BigEndian::read_i32(&first_bytes) as us=
ize;
++                if let Some(max_size) =3D self.config.max_string_size() {
++                    if name_size > max_size {
++                        return Err(crate::Error::Protocol(ProtocolError::=
new(
++                            ProtocolErrorKind::SizeLimit,
++                            format!(
++                                "Message name size {} exceeds maximum all=
owed size of {}",
++                                name_size, max_size
++                            ),
++                        )));
++                    }
++                }
+                 let mut name_buf: Vec<u8> =3D vec![0; name_size];
+                 self.transport.read_exact(&mut name_buf)?;
+                 let name =3D String::from_utf8(name_buf)?;
+@@ -1227,6 +1238,56 @@ mod tests {
+         }
+     }
+=20
++    #[test]
++    fn must_enforce_string_size_limit_on_non_strict_message_name() {
++        let mem =3D TBufferChannel::with_capacity(100, 100);
++        let (r_mem, mut w_mem) =3D mem.split().unwrap();
++
++        let config =3D TConfiguration::builder()
++            .max_string_size(Some(1000))
++            .build()
++            .unwrap();
++        // non-strict: the first 4 bytes are the (positive) message-name =
length
++        let mut i_prot =3D TBinaryInputProtocol::with_config(r_mem, false=
, config);
++
++        w_mem.set_readable_bytes(&[0x00, 0x00, 0x07, 0xD0]);
++
++        let result =3D i_prot.read_message_begin();
++        assert!(result.is_err());
++        match result {
++            Err(crate::Error::Protocol(e)) =3D> {
++                assert_eq!(e.kind, ProtocolErrorKind::SizeLimit);
++                assert!(e
++                    .message
++                    .contains("Message name size 2000 exceeds maximum all=
owed size of 1000"));
++            }
++            _ =3D> panic!("Expected protocol error with SizeLimit"),
++        }
++    }
++
++    #[test]
++    fn must_allow_non_strict_message_name_at_limit() {
++        let mem =3D TBufferChannel::with_capacity(100, 100);
++        let (r_mem, mut w_mem) =3D mem.split().unwrap();
++
++        let config =3D TConfiguration::builder()
++            .max_string_size(Some(5))
++            .build()
++            .unwrap();
++        // non-strict: the first 4 bytes are the (positive) message-name =
length
++        let mut i_prot =3D TBinaryInputProtocol::with_config(r_mem, false=
, config);
++
++        // name length 5 (=3D=3D limit), name "hello", message type Call,=
 sequence 0
++        w_mem.set_readable_bytes(&[
++            0x00, 0x00, 0x00, 0x05, b'h', b'e', b'l', b'l', b'o', 0x01, 0=
x00, 0x00, 0x00, 0x00,
++        ]);
++
++        let ident =3D i_prot.read_message_begin().unwrap();
++        assert_eq!(ident.name, "hello");
++        assert_eq!(ident.message_type, TMessageType::Call);
++        assert_eq!(ident.sequence_number, 0);
++    }
++
+     #[test]
+     fn must_allow_strings_within_limit() {
+         let mem =3D TBufferChannel::with_capacity(100, 100);
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.20.0.bb
index ded6800bbb..fa01e72ab4 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "https://archive.apache.org/dist/${BPN}/${PV}=
/${BP}.tar.gz \
            file://CVE-2026-48144.patch \
            file://CVE-2026-43868.patch \
            file://CVE-2026-43870.patch \
+           file://CVE-2026-58389.patch \
            "
 SRC_URI[sha256sum] =3D "b5d8311a779470e1502c027f428a1db542f5c051c8e1280ccd=
2163fa935ff2d6"
=20

