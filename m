Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FED2C021B9
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.137])
 by mx.groups.io with SMTP id smtpd.web11.1143.1739286064813401053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=EcT9AsIG;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.137, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4qb+zwd2sef+gpiFJuXm19DK8/Bjradf3Vcx5W9U//eo25KaBX2ESi6SL9ictYdIvZ+3pNkx+3wv+KneYNtbdNZwg05YXLiTsDzGoZi20DW/H+Atas9LeSW62DYPpmRjCTF+eWzinOgVj8bUgEnFOAOlviCRVBKIul+w7ilLdVcusfopm11UHlCwfSsPJODzHBZcJ7/gS0uycbgoAT1BJN+pE7389VXDAzNHcL23d4OrnMXQHaMvbU7kAy+D3NjkWEMD/zhDafIocHtDKgZVrgT7KW+OBwqhNDYC7EAgyrWdMS1ZDzWT8NepR1sUMsn6ma1J9EV9Wi01fJsfS+9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vib4ZnfRd//pyhroFh3BHTJOMrIvSczOw4mNcNjCFi8=;
 b=BDU7/ZtbmGoYpWo0a0LkeZhfCgVHc9VI358Ig3SmDlGNGtq2ukmuPhXbf031hPQl5fR6+HmywSxWR93N8dy7m01sjaGO9T74+o8VdztA1wM87wWnu0obz8BlL+lKRk8QPlmaOwF5cso5WBzaU8P2ddW+5i798xsD3Pe9rCHZEhQsOtyc1i9Bs86TpCJ1jDG+nd1q0o7w7YA2rZM22PuT3CnNJ7s2+Bytm/h3aZwCRe8Ht9NIZpX0IVOuh3Ngd4M4bnftoTr1yfEJTunF+LClSS/x33yXCcI3zC8sB7rQnfKcC40AxnzRS/AY2ZR1F4zPgwy1pEkYo0aJXCmnR931Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vib4ZnfRd//pyhroFh3BHTJOMrIvSczOw4mNcNjCFi8=;
 b=EcT9AsIGr8xbnifh0LPotmCSEM3qhSFWt6Nszw1oabd7Lq5I2wuEwl0bF0Z0BSuKHkPZoy5sNhRy9fnGP6h48DdyUXfbqovgkHY8opegj8c/3oBbKfa/4cMW4US5QhEEKCNfiEHQaav6zPtByx3Jp2alNGXvFReYotxtsAxGmyNk1hjy780BvcrWx+ZXyUUpb218bKwHJDYywPdK3HHdIded4JuZJqltEVdkxgr9cZgfKdwoQp+dGkYGdHwfVcgk7I0sh/h2vUIVCXXxIlfUBkzw4KRnlm62dAlus9XPgw4sxdcHiWTPNIiorAJOCYsdXzDtd8MgHxwqy2jr55g/RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 15:01:03 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:01:03 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 22/30] python3-cryptography: mirgrate to vendor cargo class
Date: Tue, 11 Feb 2025 16:00:26 +0100
Message-ID: <20250211150034.18696-22-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AM7PR08MB5399:EE_
X-MS-Office365-Filtering-Correlation-Id: 90aed476-ab3d-4e5c-82d8-08dd4aace340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kC8Ra+HwwALT6OGB8/QFNBfQv6BqDT3LcMbY72jLgoZoXW0wHXBBIk8UjGbP?=
 =?us-ascii?Q?D35nk5Ivw32SE+Jbn9NIcMl7iA9MyKAoGnwS6IzMc9S+k/WufKCi4JwZA3sv?=
 =?us-ascii?Q?4NZbVyJ7D308sXChOVKdJaucJTWnhvsLYS0MbF+NRYK18UPoAeeolLWlsJfM?=
 =?us-ascii?Q?dMfTlr/YEoHiYubuJAJhZJgWVXXozMuDobGG2JhOOum4XHwqIz+DYYm4hnXe?=
 =?us-ascii?Q?3qoUboAS8G9u9p6yeh8/rFHGIJpx/1ZOwk3+Cw7y0afVjGlGTJUx3/ZMzNGc?=
 =?us-ascii?Q?EIyHhikHkG7KYIu8uqkjxeKry9KbOrVTPSD48HswhTW21oQ9QM8rASEWSuiE?=
 =?us-ascii?Q?V2XmpEFmdYTjnVud7gEVKtX/OBoz9vhEDaEbaMuEmy/Iye4PHRnitnvqpDK2?=
 =?us-ascii?Q?BNA7qMHdJ1ZNrCI6QlAHswrbPjNXGOaw3c7d1GUIoQCxg+CvsJE5T/VVdzo/?=
 =?us-ascii?Q?wsO+H8yk740a4U4XfrKlpSaEwhxGAU8DWDAZIa3oWWWLEFv8sq051BaogjXq?=
 =?us-ascii?Q?MkDwfdKeZpvFKC3qfRuBFlahyG0epiH6iN7k550ZGXUUm3vkG5M9iMk8WaBt?=
 =?us-ascii?Q?lbsp3eduFU4DLys22Y5KlQ/NpJk8h+pczud9NtgNate9nD1GaqTPJ5NdcWp6?=
 =?us-ascii?Q?uxysN4QxflBQml8hpReVM/YgLx5t4JyTGLBwuV/7wmXZXb2Gpm7b/eYfayeX?=
 =?us-ascii?Q?zID1qQYxJJOH/kDrIF2jxbtOJsIKnMjY2F2g2Nk1fheLviOHq85nbAQBDbhG?=
 =?us-ascii?Q?MMr+BwG0wdWosBt4IyAVTbexMAepmGDjzZE068AI6s9fDXQ/xc5wmcTV7TpP?=
 =?us-ascii?Q?rXDYocWonSvu7Iwo4Iw37IOEgT6fIXg1lqaOWAkCJHfq8ibTMFR3WHw7JxgK?=
 =?us-ascii?Q?EBl6z5vAlH7fglU/xw5e7EkVMUUHtwOhPCv5rtYG2ZdmU1QAgPro/+0Yit3H?=
 =?us-ascii?Q?2VGB/SYZIZpCA4bxJcWoYG9qLlOsZvQTS3zlCc5RPskrEc69uxodD0UA/kc8?=
 =?us-ascii?Q?CtiABnB0uL/PLNH8IjgfWLv/Lk6vGv/xX+cK6WGsyNbTNr79V/JcKd4nJQMX?=
 =?us-ascii?Q?sY9ezH0rlsBqXySBj+Qixgayz907YHwKctFQM1lHpAtSaSAGYCG27903sOrq?=
 =?us-ascii?Q?+Y0x+hXjVgJK4THY9ibF7PJymglcGFrqJvdZxqu5gdcGzynwufvNDVk5DWfS?=
 =?us-ascii?Q?WqENOOLKdsSdXufD3N6N8HyNe1PUeJR+buJoUqPlwVDxAa0CvrbdP/FRqW3a?=
 =?us-ascii?Q?MKHKAqxWgokoCLG4BBiVeCInL/kU4030EoCOP0I96+wkLv9IIJlre5nRzPTr?=
 =?us-ascii?Q?nFoWPtuANhD53hpPUO7HIA74vM7tbOhbSqZeoR7Nh7b+dyITcmZVqIEjf2uL?=
 =?us-ascii?Q?u8e3Q6XdRNud1qfoulbZ7QWQcqFjwSaQyGJJQlFeFlIcdmGGGPzyf0iVVdxZ?=
 =?us-ascii?Q?upjkbrJHihHmkjOzZh6RnulyOgeTaY/h?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UJRwUQI6J8DS4+Vt/afb3MVKBDS7Wo6rTNd2id99n9oITz6dZOhLxVtKpLvj?=
 =?us-ascii?Q?HkLQo3DARddFsiRm1KoGr+jPUaOP+nAYU4t3dpTUh1T8WffaehaloLRtQLaF?=
 =?us-ascii?Q?DzywlM5fXXywq+mnqwQz7lx9WacdYcTRDsagEFuvKMUVoP2OVGQCoXZ1B+WV?=
 =?us-ascii?Q?FG7l6l+BoaiyZQNA8tHXMwTXB2IymO7jIkyeslrfQqlxdrTw9xFPfXNjVzo+?=
 =?us-ascii?Q?OHUu/fsxIBY9/hGWzR3ghP63lWr49bZhi9fzopkLMGNt3fiuykp1w7LRxA+B?=
 =?us-ascii?Q?irT5xrzN+YzObJhCudjvhTLV9NZZ/oMAx2GFk/LCjRkwFuLj2ddelGdvTf7Q?=
 =?us-ascii?Q?Ox3U1hB2ZM4gvn4zYJRb9g2GjKCGvkbbQzzxExel0/uELqIFoZLANw6+ao6S?=
 =?us-ascii?Q?nHKMXxmixfOU01lyOUbPMM1d/aJUTopvkIW4WxFEXWRvFGQHip9yEt8gnqIo?=
 =?us-ascii?Q?eHNTzFUMiD5SEjTzv/LuiG5/UYQ0YaMFpKC6wkXT4KY4jV5+nP4/LOSr3H8I?=
 =?us-ascii?Q?2Pb9x2QrD/9qhW3q9lK9LedKuM7HGTZsRLK0Mgwc+5E9fIjNNAThMMKd7CCK?=
 =?us-ascii?Q?JaDilxsvVz3yThBILOp36uHe5namgrCOr1+gO7SkMUgfKk26LHiXOb3FV6cj?=
 =?us-ascii?Q?hs9bah63p6kqtnZ6Cbjsyc8HhVQqKiHqOqLNhwNuvYXJYbFmwpY8H2FT2E4U?=
 =?us-ascii?Q?0fW1Y5YAFuCS+uiYzLimQmh/NulVCh3c08KiZWM4Wk6lPZ6RF6XGLNyeV+Rw?=
 =?us-ascii?Q?24jET0dCn+/IK6WJJsBWwcFE/aL/UG3ECYd5idgcjd+5ghA+cnPCKnT/RytV?=
 =?us-ascii?Q?+Q7EZ2I6dWwDsGWuZLFAybED26MKy8Ia735U4DQfxeKDhCXGec6OxeN9Wolm?=
 =?us-ascii?Q?qRemIaw9d4YUSwgBYaA28+89L3z2JNhuR6IqmLIdT+q1/VeHaL9WYSBuO3eq?=
 =?us-ascii?Q?5EgssKxIY88/6QbVSH5lGTmOFQfq83mq2zjftPc4utluxG4n7TH17fkM80Lz?=
 =?us-ascii?Q?LwR4si0OPbAHZ80eSoo5+IsBTj7YqNi4oQyEt99Qp4yqbTX7yPnvWj5v/OUS?=
 =?us-ascii?Q?m9Mjcw7L4BczX5sjxwX+gKoB6/raz2oF9sTPxQDSPOUNmIje5Y54SDwtqpV6?=
 =?us-ascii?Q?ItFJvra64ZRH+IhxBNSZQU5hPQJ197IvuiDHTojdC72qChJNxo6ROLLYfOXJ?=
 =?us-ascii?Q?y9nwonO5tsvAwEGkVHG+5QlCbyXeLW1tr27iRwH9QS1inY/BcxpN1Z0fbPjL?=
 =?us-ascii?Q?VSiSHPDpl1sS2vq/940b6cGZnum+mILmxzxpYjA1ejZ0JNq/spzom4AdZQdP?=
 =?us-ascii?Q?ghEbFP60z2jIzQ8EARWLRnQiDh4ognHqLMD2kVT8jKwtpbSh8Iiux/7t7Ohk?=
 =?us-ascii?Q?iEYXsrvxz5aqK3oiusnEZd1vA9hwrPAIEOnsE6qWNK+RZCmoATSJ8fP2lBOK?=
 =?us-ascii?Q?TTCW2zqapT+R+UZ5DFR3t+lWyAYt1ps1Ih6jAKPpTgVLTEkUleugNZoycm0C?=
 =?us-ascii?Q?heUMw5IWkOKtXX7+jWFM/ORfUW+m+AzD/YsSEJ1JvtiVxDLSQCxylub5cNHF?=
 =?us-ascii?Q?0j3bo2ZWWXGC9pG/6YMqMxLRE7eff8SqYcjAJFypR2hTVMlVCY6yDPhGLR6x?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90aed476-ab3d-4e5c-82d8-08dd4aace340
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:56.6331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXnWz6ng59nGzGa2oOgnHsXrO0vwg4e9nRyus4k69wyhWw/uYgEKIAQqiCC3zaLDnDdtipxF1ChcRo84ndQTLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211147

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 .../python/python3-cryptography-crates.inc    | 76 -------------------
 .../python/python3-cryptography.bb            |  4 +-
 2 files changed, 1 insertion(+), 79 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography-crate=
s.inc

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b=
/meta/recipes-devtools/python/python3-cryptography-crates.inc
deleted file mode 100644
index 18f346aed4..0000000000
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ /dev/null
@@ -1,76 +0,0 @@
-# Autogenerated with 'bitbake -c update_crates python3-cryptography'
-
-# from Cargo.lock
-SRC_URI +=3D " \
-    crate://crates.io/asn1/0.20.0 \
-    crate://crates.io/asn1_derive/0.20.0 \
-    crate://crates.io/autocfg/1.4.0 \
-    crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.6.0 \
-    crate://crates.io/cc/1.2.1 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/foreign-types/0.3.2 \
-    crate://crates.io/foreign-types-shared/0.1.1 \
-    crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.5 \
-    crate://crates.io/itoa/1.0.14 \
-    crate://crates.io/libc/0.2.166 \
-    crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.20.2 \
-    crate://crates.io/openssl/0.10.68 \
-    crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.104 \
-    crate://crates.io/pem/3.0.4 \
-    crate://crates.io/pkg-config/0.3.31 \
-    crate://crates.io/portable-atomic/1.10.0 \
-    crate://crates.io/proc-macro2/1.0.92 \
-    crate://crates.io/pyo3/0.23.2 \
-    crate://crates.io/pyo3-build-config/0.23.2 \
-    crate://crates.io/pyo3-ffi/0.23.2 \
-    crate://crates.io/pyo3-macros/0.23.2 \
-    crate://crates.io/pyo3-macros-backend/0.23.2 \
-    crate://crates.io/quote/1.0.37 \
-    crate://crates.io/self_cell/1.0.4 \
-    crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/syn/2.0.89 \
-    crate://crates.io/target-lexicon/0.12.16 \
-    crate://crates.io/unicode-ident/1.0.14 \
-    crate://crates.io/unindent/0.2.3 \
-    crate://crates.io/vcpkg/0.2.15 \
-"
-
-SRC_URI[asn1-0.20.0.sha256sum] =3D "2d8b84b4ea1de2bf1dcd2a759737ddb328fb66=
95b2a95eb7e44fed67e3406f32"
-SRC_URI[asn1_derive-0.20.0.sha256sum] =3D "a200809d0138620b3dba989f1d08d06=
20e76248bc1e62a2ec1b2df5eb1ee08ad"
-SRC_URI[autocfg-1.4.0.sha256sum] =3D "ace50bade8e6234aa140d9a2f552bbee1db4=
d353f69b8217bc503490fc1a9f26"
-SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f0199=
f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.6.0.sha256sum] =3D "b048fb63fd8b5923fc5aa7b340d8e156aec=
7ec02f0c78fa8a6ddc2613f6f71de"
-SRC_URI[cc-1.2.1.sha256sum] =3D "fd9de9f2205d5ef3fd67e685b0df337994ddd4495=
e2a28d185500d0e1edfea47"
-SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee582e=
bb74b53b4efbf79117bd2da40fd"
-SRC_URI[foreign-types-0.3.2.sha256sum] =3D "f6f339eb8adc052cd2ca78910fda86=
9aefa38d22d5cb648e6485e4d3fc06f3b1"
-SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D "00b0228411908ca8685dba7=
fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
-SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b5d=
30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.5.sha256sum] =3D "b248f5224d1d606005e02c97f5aa4e88eeb230=
488bcc03bc9ca4d7991399f2b5"
-SRC_URI[itoa-1.0.14.sha256sum] =3D "d75a2a4b1b190afb6f5425f10f6a8f959d2ea0=
b9c2b1d79553551850539e4674"
-SRC_URI[libc-0.2.166.sha256sum] =3D "c2ccc108bbc0b1331bd061864e7cd823c0cab=
660bbe6970e66e2c0614decde36"
-SRC_URI[memoffset-0.9.1.sha256sum] =3D "488016bfae457b036d996092f6cb448677=
611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.20.2.sha256sum] =3D "1261fe7e33c73b354eab43b1273a57c8f=
967d0391e80353e51f764ac02cf6775"
-SRC_URI[openssl-0.10.68.sha256sum] =3D "6174bc48f102d208783c2c84bf931bb759=
27a617866870de8a4ea85597f871f5"
-SRC_URI[openssl-macros-0.1.1.sha256sum] =3D "a948666b637a0f465e8564c73e89d=
4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.104.sha256sum] =3D "45abf306cbf99debc8195b66b73464=
98d7b10c210de50418b5ccd7ceba08c741"
-SRC_URI[pem-3.0.4.sha256sum] =3D "8e459365e590736a54c3fa561947c84837534b8e=
9af6fc5bf781307e82658fae"
-SRC_URI[pkg-config-0.3.31.sha256sum] =3D "953ec861398dccce10c670dfeaf3ec49=
11ca479e9c02154b3a215178c5f566f2"
-SRC_URI[portable-atomic-1.10.0.sha256sum] =3D "280dc24453071f1b63954171985=
a0b0d30058d287960968b9b2aca264c8d4ee6"
-SRC_URI[proc-macro2-1.0.92.sha256sum] =3D "37d3544b3f2748c54e147655edb5025=
752e2303145b5aefb3c3ea2c78b973bb0"
-SRC_URI[pyo3-0.23.2.sha256sum] =3D "f54b3d09cbdd1f8c20650b28e7b09e33888148=
2f4aa908a5f61a00c98fba2690"
-SRC_URI[pyo3-build-config-0.23.2.sha256sum] =3D "3015cf985888fe66cfb63ce0e=
321c603706cd541b7aec7ddd35c281390af45d8"
-SRC_URI[pyo3-ffi-0.23.2.sha256sum] =3D "6fca7cd8fd809b5ac4eefb89c1f98f7a76=
51d3739dfb341ca6980090f554c270"
-SRC_URI[pyo3-macros-0.23.2.sha256sum] =3D "34e657fa5379a79151b6ff5328d9216=
a84f55dc93b17b08e7c3609a969b73aa0"
-SRC_URI[pyo3-macros-backend-0.23.2.sha256sum] =3D "295548d5ffd95fd1981d2d3=
cf4458831b21d60af046b729b6fd143b0ba7aee2f"
-SRC_URI[quote-1.0.37.sha256sum] =3D "b5b9d34b8991d19d98081b46eacdd8eb58c6f=
2b201139f7c5f643cc155a633af"
-SRC_URI[self_cell-1.0.4.sha256sum] =3D "d369a96f978623eb3dc28807c4852d6cc6=
17fed53da5d3c400feff1ef34a714a"
-SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3=
524c3cb8fb653a3023f6323e64"
-SRC_URI[syn-2.0.89.sha256sum] =3D "44d46482f1c1c87acd84dea20c1bf5ebff4c757=
009ed6bf19cfd36fb10e92c4e"
-SRC_URI[target-lexicon-0.12.16.sha256sum] =3D "61c41af27dd6d1e27b1b16b489d=
b798443478cef1f06a660c96db617ba5de3b1"
-SRC_URI[unicode-ident-1.0.14.sha256sum] =3D "adb9e6ca4f869e1180728b7950e35=
922a7fc6397f7b641499e8f3ef06e50dc83"
-SRC_URI[unindent-0.2.3.sha256sum] =3D "c7de7d73e1754487cb58364ee906a499937=
a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[vcpkg-0.2.15.sha256sum] =3D "accd4ea62f7bb7a82fe23066fb0957d48ef67=
7f6eeb8215f372f52e48bb32426"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/re=
cipes-devtools/python/python3-cryptography.bb
index 69329ec954..8b69f13ff0 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -18,9 +18,7 @@ SRC_URI +=3D "file://0001-pyproject.toml-remove-benchmark=
-disable-option.patch \
             file://run-ptest \
            "
=20
-require ${BPN}-crates.inc
-
-inherit pypi python_maturin cargo-update-recipe-crates pkgconfig
+inherit pypi python_maturin pkgconfig vendor_cargo
=20
 DEPENDS +=3D " \
     python3-cffi-native \
--=20
2.39.5


