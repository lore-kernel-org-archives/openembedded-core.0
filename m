Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34D3C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:42:18 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37558.1785926277664368637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=G7xHlW/I;
 spf=pass (domain: est.tech, ip: 52.101.65.53, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPTeutC1PA8crh0lwbWgz0CDSTQWCZjy1vAjofVs4itSrhQemPLiP+24XkdHGGhjsiKGrBJZFpVXtMVXjxm0zL0sWTD4L53aTtkb3zCzNMOjc0ogMTVGmx4YASHhCws4iNsj5Tc11CA7ka7Jcae/6KNATjyd7cbDokPqZG9b16YRsIkse7hXSNpAO5YjttQSVprBykYYrW05jVcggrYl0btLBPZRGPGcn2uhSJRG+MM04ewcmIaQ/NDl/uFN/E8y8BvVw6bPIjtwtTHq7hRl5fsyhnG6LvQ0e6vm3OaMUjr86J/KndWKxsl9QOiyb6TXexa/X0cwf5Y6ynr2vYEiaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oU3IRshle/axOo5O02TQt7gvTMLWlVv3AMUkdwVpJpA=;
 b=L2sFSyGDJrkze+zS9gIXoqXCq5XHiUyQMDKr0lp6WWh3LjPr4l8spM5xg2wmrm1CjZwAT7tcssynIzWHrCy9+GC6zGLu+br5F5jc4BA9xM3nDYFhWTx8DLmHC9rE2qrlmj8nE/ffYelPj226JQtV02Fpn17hPH6+lg2EFTII3HfNkNSPewKsKuffZu+CW4AIzYPCmQE7tpSremf3wkG/0K4tFqxry+JihoWcGMvPwVYZKESQiYxUYVwUoY8nqMMajvcIsgodFSo5umEx168lA212O0Q8UZyXMHYF5KFbLYCjI/L1q0hNmPBORKWTXuX4uWMAMrakh2XHkm1XQ6/IXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oU3IRshle/axOo5O02TQt7gvTMLWlVv3AMUkdwVpJpA=;
 b=G7xHlW/I/KmHaxbUHkf0Js4v8rByibIZDDhAGcbjO4e6BQbLKoTmXEEdW3NjVMCJw54jUPK8Wjnv/aOkb4y5QhpgT5LZTZVZHNY6Ub1XmH8FpAr9JrcgDQeQlaz+3ku7yxgYnM0ct13kDNf/Xkg+1iU7HIemF1cdiFb068mZY5HtALPvpNrwndzRl4j5vji+CfSBY8YtblzDdP0e4QMj6V+2ItYFqyiRVAhtppZJcefdBdvtSH163q3OXayaxHDfZUN4A9Ek8fWyK3h4yxWHi5im8UyCZePacOYVfJBIuJMOvAjzb4XC+RZTU9EiR83SN6waX89v/8FyICaBxvzQOw==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GVXP189MB3386.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.5; Wed, 5 Aug 2026
 10:37:54 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.015; Wed, 5 Aug 2026
 10:37:53 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][scarthgap][PATCH] thrift: fix CVE-2026-58389
Thread-Topic: [meta-oe][scarthgap][PATCH] thrift: fix CVE-2026-58389
Thread-Index: AQHdJMJYYE8CK30SqE+wSTD3DBrXDbaPQyze
Date: Wed, 5 Aug 2026 10:37:53 +0000
Message-ID: 
 <AS8P189MB16722C944EFDB4EECCAAF3DCB3D32@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260805100818.975113-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260805100818.975113-1-adarsh.jagadish.kamini@est.tech>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|GVXP189MB3386:EE_
x-ms-office365-filtering-correlation-id: c452d6ea-be0b-46f8-75f5-08def2dd9b42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|12006099003|18002099003|22082099003|11063799006|56012099006|3023799007|38070700021|13003099007|6133799003|10067099003;
x-microsoft-antispam-message-info: 
 hkzY/+cj1Wj5a1QgykoSY34FN1amZ9lQQwW92Sgluc2KvbgVFedNWtIKMld81A2pMB259FY9/a6NpPtQrvIFhZpmSPbI7A71RkQHR351Pl6Syp1JJx9Kjz+Ze6pOMvenAPktfb14Ed+rPyRCUWxtET0xhP81mPi8DrUJb1KfTgQ1EW16G8auDwPwseN+YEGeHvxVH/MwFs8C/gFDthMlcUxsf+NuwpcVw30hMBuE5/msFkgmUDCV8ZJLaZh1VK6O+N24HbVNn5Bw1GarlEqO4kwww45bqAf9DfiVjvCj8G0pOYCzYqnnqoaWHlJUj0LZ8jybKCriZhPBd2EOCveqvbRoMFu7/cm8vHC+jECLxgz4YT2ruXjE8UvdZNCGeeFkXxZmgbnUXY94xyzMUx4lvlmRdILnQ57UlxoUvEpU0r83IoZ+8/5e6vv4YJmXMzIvPPjg6g2aTLOmqM7SFJE/ABcEbm0EUv79Hy7PH7v7sf4ygaRDddoz6XDfkQNgR7EC91/uM6JMsf+VzEJUehxTgLlZ9ZByLt+Cnl1+gkGeqEczIjACWrBe99VQp60dyuUm46fflecJ6oCc391b/0HFrr2rVlASB67K3O4lAbhHxjttK+rHu6WGi8feug1U9fZhmJQ74tuOMyH3TRaei2w5mThwB9kgu1LzBMW9OeZ1Yn5Z36r258y4X6mXbJ1Cr+s9d+ZmYlGikMxzOcgGaq7d44tupmBBVB61aIC/QS4neDk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(12006099003)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007)(38070700021)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DY181qv+6RFzxeML9RPxeMy9x2rIeOD+PqGfufmcF07FoRUCCFBjm/1iiqMs?=
 =?us-ascii?Q?JIp22ks8PyT6pklUn1IvERTbmDo0GGsXLhVTxfLvv5Wzkv6PZ95+gwtkPJyZ?=
 =?us-ascii?Q?86iKamSPQrmvMhE16oi8nKVZbKh8BT1imRqpkQeiygqDfewDBIXAkp0gGGr5?=
 =?us-ascii?Q?9d51NgYx1IDbzFKpq9GVpAuz5fSYYhD90fsrxIwdIVHRTN9lORLxBqICd+Ee?=
 =?us-ascii?Q?ZJgK7F9WtIQtIOhm6vTONE4JB3hWpkhBQE8DB11JXJLSYxBdmQyNTlQXP2OM?=
 =?us-ascii?Q?C9YPyS+d2N4+uDv2DfDpRGa+USOESsjOTtKJnPvdEktZ3phHunjJYg/OoLZo?=
 =?us-ascii?Q?z16IhEi3gow/K3gPiwccNY5nSHc0DqO5uOD1mdWfudjmMAAW2PljchTXitt8?=
 =?us-ascii?Q?EkRYvHoOY76WWeUeEzo96fn2XlOVnidVT3hB8o+9jbktypcftbUCiEgO25Ai?=
 =?us-ascii?Q?463FPMqMgkUWWWeZzzW0g07/l8T560jAbwTVS7ZYHs6G7sncZrStWs8Z5qrF?=
 =?us-ascii?Q?IztnfRVwAs6/WfXruXg5nlu4mPBhQNt+4EmhSH16viGeLhUJ+e+nSPXL/TiW?=
 =?us-ascii?Q?mvyALnJxRaoWp032w0Vtvcfb7lK8uldJPUqqREn0Xxv29Np22KgzwOcxPPX+?=
 =?us-ascii?Q?lGut8Tf7ERKwJQN2hnAtAGoVi1ag9fdA9LLhdFY6pRDGAYZhoOCktWY2gwJE?=
 =?us-ascii?Q?Jyjy/3pEL0SAZQK64puJmr5Jh1HojcjBHzHuiP1IjvEX7i8eiSp/1TQnEvsT?=
 =?us-ascii?Q?hD0n9cvWyYKarT9VaD3apLFVl2GQ5SsDNqWteFI+W5ofgBeWWhAwhyUYClVw?=
 =?us-ascii?Q?54qE3dTHuPooYlNaCefcd7zPGLSHqWN7YpEpKkCu0hAZtL7eiHz8YbzaiyGF?=
 =?us-ascii?Q?5wV6v0H1KB9FwVWRMcUAHP31sh6LMjxvoFqQGyQhG1VQm6pHtAtdUzxh/MIL?=
 =?us-ascii?Q?9Uepz9bXg/GnnksdJ4pVhaJxkq4lILDK6fylkMiqrUVdacXggfTz+dc65VUn?=
 =?us-ascii?Q?/wZTl+1nk//bAD5VXRz23e+srNqODbAHl0G8/IiJjqgRdueWjBjPiX6edzFa?=
 =?us-ascii?Q?Z9TXreAhl7h4NDyBRaKk+tx/k8LNLA8br6QkdQVkaXqkd9k6T6FHhkzXw8fX?=
 =?us-ascii?Q?01x4tbzNAOdRL2LKVINE4mTzcqB7t1rZlq5MaAW8hoCdh45nwNZ26bsrsSUU?=
 =?us-ascii?Q?JOqckmMx+keL+WRWBqKLfNgpvMwQbY0nooXrZxUnntYqyB8HgbfbX5UnzFw9?=
 =?us-ascii?Q?mfoVQVNDNDQqxq2H6XApoOxemX4I10YI4CGDq5DZG6F0KCCz1SGfzvJ4NJ1n?=
 =?us-ascii?Q?g5dh4EaakkuZSKs+wkbdrtd+xlSTJiH+iCGePEsTlu7c4ITrPuechtnrJGmR?=
 =?us-ascii?Q?+rne/si2hrrPLttXjHJr/Xb+/9HqRT3Am3mAdyAD45BHeH76uaR4E45k7Yid?=
 =?us-ascii?Q?1KGJ+e20Kx1jhLBn7DwailS8ZeHvBe5J0sWx/SuyoPar9F7qrDm/pTIZZyuS?=
 =?us-ascii?Q?4UcDAQqcgUa17JFv+NuXg/KlQWtdMfRR6ZtdGoz3y1nnHWNF6ppJf/k1wd4F?=
 =?us-ascii?Q?6fW5lBezLasalhDC/zKUZFnNhPPlOwgyKzA3dpRNtWjFLzkPT9y9py9Q6nix?=
 =?us-ascii?Q?qpMkepu709f8u6ey2oQmWr55qA2IvNUCiRaeV9Poucq/iH5UaU00zHI32C0I?=
 =?us-ascii?Q?anNIV3M/NFAcen1zB1kmkuCPOQdl8edMGUD31+vHboH/gS5/I73p5Gk2j1B3?=
 =?us-ascii?Q?MUo5muYAyHjzYEwQLgCaWgZfBHq4dOE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c452d6ea-be0b-46f8-75f5-08def2dd9b42
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 10:37:53.9458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKcKGC2CCRk1tl0/PfXWRBSajK1lGtbsDmeWoc9cUR0c5X1yFHlw1uryDGjGtVn5c7z5NRetfvn34GO5fZ+wFbI1gzyk4ekEJyiClczux5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB3386
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 10:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242860


Hi,
Please ignore this, I have now sent the patch again to the correct mailing =
list.

Thanks!

________________________________________
From: Adarsh Jagadish Kamini
Sent: Wednesday, August 5, 2026 12:08
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] thrift: fix CVE-2026-58389

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
+
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


