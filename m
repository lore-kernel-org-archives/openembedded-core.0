Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2159CD49C6D
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:47:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5930.1769759188547263291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:46:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=oHfp0YsN;
 spf=pass (domain: est.tech, ip: 52.101.70.20, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrzZFCrCOCfn11Rz0HpK2KvszqruVDYUDKtoD/q+BmmMTXdhEMDI6O6hV1vaCAU63/NLgSojTTTAIf1xeVNBEF2tPJaOr5XoeSjIfJuFx8QD/ueKRxCKJ0RnceqF8Iq4luT+yHwz2UrypakKBoDQlc7IC+c6QlCCQvJ4xp298LegjcM/mS5pJWIKVbBW0CC0uRzXFebKhTxC7uHhCREZil/vH3OTQqKMR6/dO9nbYbwpiVyDTF65N7ReDhjfOUF8qITtx6q5W+Nnngs43u4OsWX9fVPZdHbeIyLDtOIL8HRGiulBX5ERBTAGjTA/lUDSrjIJm6Ceqk+lxAy+PzKfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FSKKzXYPLzEEHaTNuHKu+uHavGhAPWM64eV8ce7JRw=;
 b=qO22AhWyRolQplSFHX7iEzDwJ+e321/neG1xZAE7RV2Xe7A089sXMXCKEiymN2qb7x/VIgV0ygoJx3x7ebhtLSS1lZ/CqsBL4vvFzsWh7X/UHF2y/Y4nwqoH02PlKy5yuVycEkvnoG6+juzsNsITB+ootCYWciBpMRhT7UicawYVj88stpEpiKx+qbgYVKkqBDF0C2IBmMS4YsVj1ThQvgWKBkXywmHMoTuy0fBBLaLrfZvbmJcPZ2v8gnu804b5VSAelEmm7Nkmp7vNioUXp2L6XK5acMXgj4CXGnrboNXG3CjMTBjwJ3vX2Pq1ODY5TyW8lQtMcD6Itoe0edNxww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FSKKzXYPLzEEHaTNuHKu+uHavGhAPWM64eV8ce7JRw=;
 b=oHfp0YsNNEuo5oq64Bo2QIPVGphlUp3SgkX+U8Y6HNmglOP8UODuY1VttBP3QGHVNYAuzBMZg/8k/Q4wrbyyLiT83W3hRrydWRn92hNBKm3AzV0pVaDNIiJUYMSNYZ9lhu2LZ8GaGgwgCk/WtzVHlIbJ1/EmcQlTewTAQjWvOFNbohjNwpeooMbBMPydvDxn33qut8xSsmrz7KzZlA/rFE62w/mX3d1Aas7F8kaUKJrowQ5carTAt4DvbM7bTgp4P84Nam6XPm2eXcec0V32zeNW4CuSxgniotY2eO950pTMO5lax8H4gCCaMerc5gvEw7EpLZ+M9TK59lzR4VK9Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV1P189MB2977.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:25e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.9; Fri, 30 Jan
 2026 07:46:21 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 07:46:21 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: david.nystrom@est.tech,
	Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH v4] python-urllib3: Backport fix for CVE-2026-21441
Date: Fri, 30 Jan 2026 08:46:07 +0100
Message-ID: <20260130074615.226142-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0342.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::23) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV1P189MB2977:EE_
X-MS-Office365-Filtering-Correlation-Id: 5038811d-dfa9-4cf1-a6b8-08de5fd3a91c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DhMSN1f5mgfoGsaMCx0T5ux5EqIoE5BAlih9tqV0UlAFJDW3uxDnxH/HSYKS?=
 =?us-ascii?Q?RMlKiXgJOp+dL0gGtaRnXOBrk/xbunJEAoQHE3qFj0GuLvSMwero90tRcdmE?=
 =?us-ascii?Q?prfQoED3tPePVcmgySgFzF33A3UfKNyVFZQoE3qf5bgdNIiPnoajypQI2jwW?=
 =?us-ascii?Q?0x/6vw0QqUqFumLXQJse5jdJKqUBcpniGJq8BIBF+dUM4xGRdLW/+MRV4UP1?=
 =?us-ascii?Q?zbY7SzCZk/7lIUJOcB9vXq6XeYXVyBub9ajKVJfiRNOky0ZajeKy8xDIzWeS?=
 =?us-ascii?Q?cfBrkKydH9LrkT0Nz+MSFyf4Yrz+JFoSrw36+QFQ8rvPPa0D0vbFKVeATjMt?=
 =?us-ascii?Q?ZNfXNVdm1MvMVFQwANPcWbe+pF1zrnN5I413ofgbkbuRafGKT7Co1ybuZzOr?=
 =?us-ascii?Q?3v+xlhSTzw9I/G9dBgQYhXCKkb/Tvr5Xfg5HXph5972tDfzDAUEVdSDjQMJU?=
 =?us-ascii?Q?Obk7pKLayR41yRSGF+xiAjTbBMIfUv2MYErb3v3KSj89zZRBOvAXTspVYGmT?=
 =?us-ascii?Q?NglNA8/5qhaImIdNOCe3GYFPHKqvi4W0s3DC++XbwXqcfGBfeKvurKSledQp?=
 =?us-ascii?Q?Eihgx4DR4R9XjsbqwZwfcRKCkHcCNRoPsQfr7G/TXBoCAPxmabxnsNK+SkuR?=
 =?us-ascii?Q?Te+gIsUzXbHE4Cd2uWlFeJcSmwMXFDCI/9N+jf3wt60IPh6He6vpD3uhu3aK?=
 =?us-ascii?Q?fv4e57HFZgApnTbw+0yemww2PwFPITrvqqz0mVmNcQ7FslCmL8PVE1T2SWv/?=
 =?us-ascii?Q?X1XcMuhl1GXKSLSiFFGn+qyuGeuE7ACI7rU5kcNoCs36PyQf3dnPT9UhPnBR?=
 =?us-ascii?Q?v/qMAwINWcdUVaGCGLAYtPjoYe4DpcN8hdo0F+kuCpbRH+/s3Gwjy5RBk0AR?=
 =?us-ascii?Q?7bdZKPTs4+nLhFjf7kZYDGk+gkiOhBY9TtXC3WRNBZ2MXI6GvoqrU6YDDdkc?=
 =?us-ascii?Q?XJzUqHYHYG+Fb6G+OaiT/Z/36P7ccXilw+YIvYF+XFqiHaENq+xHZ4mU4t8d?=
 =?us-ascii?Q?OX2dsSq5xJlT2aZfoi50HtZVOrbDii2whnX97u2dUtOt+JpcmUz2cbj0ZmgK?=
 =?us-ascii?Q?36gqNvrYrupKlTiM0w+ZKqnK90bG5vJWqTiY+9RrmMqxEQoT4SZehy8246vk?=
 =?us-ascii?Q?YYJjSTA/tMwBq2SR6QyjhgXuoBKIU+LlywCSwiGazrhUYqAZRtMpHC+PRa1d?=
 =?us-ascii?Q?dFrRNdE01HQbwuAHjiHgll5JwveJSjuklZcs7/aT0EDKCOSdQNNuEPT87BP1?=
 =?us-ascii?Q?rG4BI4QsxQzksWkHKMc6wZJi+Y3+wb6WRQZ55FPX1H0y5nyPX863vh9BGHGI?=
 =?us-ascii?Q?jfqAOK59cbmsNkgb9Czac5E2OtiqcSFF42tUQaezyDFypzA7fDhRFK6gltWi?=
 =?us-ascii?Q?Ez8GnZpJMbd8Dlq7IShs/AwybsorZzsMKpaaupU0AEyKHKXE4O7xXn3Q5+C3?=
 =?us-ascii?Q?87vyIsRFcMC3D9m3m3LOWi8Hplc9HzyB+MwC6KHr6VsZHa3UvzmWWIZL8G53?=
 =?us-ascii?Q?daRdmQXdN3o7bwJEsvsxJirNWbLmXuDMkaaZa2fdSP478MEb/f5eeRiVojS0?=
 =?us-ascii?Q?naZv8goLvfYDOHjED2UNr1Df0rbpg1v6GZqKq/0O?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fJAJ2gn9IClSe4NBWzf7EWgPRgg24kZnLMvtxoOv0LQm31Y9Y9F/muTMC46y?=
 =?us-ascii?Q?b9R2ZsVVKExDBwAUZ5Z7v83dz9iYgtMKru5J3x/rA1lG3D3hsQ6+8prjlNw+?=
 =?us-ascii?Q?Z7ZYwAV90wKjiIcOuNqchN3DRKnw99drkQc2ttCTcSk/ODMCPTAoIEYNABGd?=
 =?us-ascii?Q?pimJ7DU7F82UDjqijC2d45WehADXzzMrSJFUHB6jRzhPddKGkrBGaQ/gzJLg?=
 =?us-ascii?Q?pOnvKT9h1W0yXyQ+YKY9ZgKmV/u5MdJDW0Fq440LcQRX4z9wFYbJuQeFixEC?=
 =?us-ascii?Q?cT/s57Q9sX4pPSO5cpBZVWKhBfxHvB8hfrXDMgOxu0Nod07IlyoZu/lNVJ9i?=
 =?us-ascii?Q?I5I/sipimVBmEr5TRNMYQdvbfvdCpUrMQ3rDJqzvJLhSRx+/oriAen1ONnIC?=
 =?us-ascii?Q?3r+Vg16Q8L6FDHkw6uvCsdaViBF8hnH4Iw0aHxvJL9qiILKNYlZSpbBm5aak?=
 =?us-ascii?Q?9k7HOMX8/Koz8OT+Px24NZfKRkCXZkKQiXsD0WsvIJHFS6Wc9lp0W3NGFEzZ?=
 =?us-ascii?Q?vIMS484cTj6fVvxd8+txZ4YVKcWE+pjsgbp9nmgQDAU3vmcEgO6JfLly2Ihp?=
 =?us-ascii?Q?rWMRwywc6bz8CqUrM/Sza+73tuvMG72WrPMSJLRYrV1/T0ftJ9HJiP/fKs1t?=
 =?us-ascii?Q?wf26NR5Fjk+Ai5P1sFGgUYtvwRdpoc1VnQaOJB+HVemlADH0bemi6QgZ7gOo?=
 =?us-ascii?Q?qzqWHjSUwEdsN0phv4mIiwOeWVQ+haAVdlaHKvwSojsSX9riFRmIkHmVHwxr?=
 =?us-ascii?Q?CuZrV3Igp+lhR2yvfu+RproK0rx6MwkHRgFAfwYCX5f/TjQbDrBLQ93oKpYl?=
 =?us-ascii?Q?zWqMuHaUjynqOxh/Kt2Zf5FYGZClx1J3b2ciM1Bh+D/9/QZ5keCj21Hg0dG1?=
 =?us-ascii?Q?bfy6bdQaqTsDJIFUAKXc0G9qzowe0vcxWgBjhrMy85+4Z3YHQ00viiXczjaI?=
 =?us-ascii?Q?bvZ2S6C5eA8oEJsO1seP96W6myVSMjmtwiccBhNXxlOBSAkLHyiSZKrVR+Sf?=
 =?us-ascii?Q?pHQXMTtcg1BwKOr2ebB73kpuPWwYU9x+D8b6fkVB0QnipH1P3UXiJvaEe3cR?=
 =?us-ascii?Q?0Sw0y6K40sge3lD89Ox761odUuud85fpn/V5KhGDUa8Knia7eAhfqcs0uQEb?=
 =?us-ascii?Q?h/uEY4WwxqL/hyVtCwVpOLo8qVLplusv8A8/3jBCktef1bWXF8hfuwd+XbYR?=
 =?us-ascii?Q?7SeKtI1SLLuadf+/8n8TtJh1/h++f64Hk+WB+efODk5087zVQ/tLTwh/YTDI?=
 =?us-ascii?Q?qpbmZrkEsA25aSoiPhcgE+UQ49aE2h4xFT66r38db5Q95IL5hQeA5jekMgpq?=
 =?us-ascii?Q?mmcxzPI03i7xkfLzGp4dvpCz6zoEB6W0x/ai3rJou3MQ+dZyTtq59n78NHTA?=
 =?us-ascii?Q?WyOxBTkZnriAGkZUOsVp8sHmEeZgt8p+X6iAyZHuMl4bfe8XtTRNYq3d6aXk?=
 =?us-ascii?Q?4fR2beEgwrhQqEXbrJaOfR2MLu2Xk2Wdyhk/mB4XGWHL//sannLSVkpm+V1s?=
 =?us-ascii?Q?Jl7zMWg5o09qi8wojBOam0TVclrhSVtalTm/n+HpY4MvXGyY0JMmGNV9DTIH?=
 =?us-ascii?Q?MEYWSR0RXlcy3gVgEOqdywJLcj90NI5hCo4bPo+oyHzVQf7+4FncQYH0RmzC?=
 =?us-ascii?Q?8VEB1sL+ky/X7YZndlGhsjwydUt7XrfzLsMXJN+0sSJ1yQSlaM5GSfMLNQeB?=
 =?us-ascii?Q?tqXMpZOY1bs6mub0E/b4rWZ6pKju7ecDN8b0bFUWJNgJBjqsu4kFcHQ51M4y?=
 =?us-ascii?Q?G9c90um23qiJsdGX16Nrf74S+nPj4Tk=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5038811d-dfa9-4cf1-a6b8-08de5fd3a91c
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 07:46:21.4410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMdiu5bT0AffJZIA76bTos/eszU4bvOWKJyOmky8XrbVb2QNQ6tpsOEn1u3xfi7KsnKaFyGKwPVHRMhlkZgvOpkh9Vi6A9whTGrsszV8vlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2977
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 07:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230182

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report : https://nvd.nist.gov/vuln/deta=
il/CVE-2026-21441
Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../python3-urllib3/CVE-2026-21441.patch      | 105 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-2=
1441.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.pa=
tch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
new file mode 100644
index 0000000000..16af67af31
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
@@ -0,0 +1,105 @@
+From 686d2bdd4affd3c86e605f54a72afe53c920f72f Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Wed, 7 Jan 2026 18:07:30 +0200
+Subject: [PATCH] Backport fix CVE-2026-21441 python urllib3
+
+Original commit: 8864ac407bba8607950025e0979c4c69bc7abc7b
+Original-author: Illia Volochii <illia.volochii@gmail.com>
+
+Bugfixes
+--------
+
+- Fixed a high-severity security issue where decompression-bomb safeguards=
 of
+  the streaming API were bypassed when HTTP redirects were followed.
+  (`GHSA-38jv-5279-wg99 <https://github.com/urllib3/urllib3/security/advis=
ories/GHSA-38jv-5279-wg99>`__)
+
+* Stop decoding response content during redirects needlessly
+
+* Rename the new query parameter
+
+* Add a changelog entry
+
+Fixes CVE-2026-21441
+CVE: CVE-2026-21441
+
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/8864a=
c407bba8607950025e0979c4c69bc7abc7b]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ dummyserver/app.py                           |  8 +++++++-
+ src/urllib3/response.py                      |  6 +++++-
+ test/with_dummyserver/test_connectionpool.py | 19 +++++++++++++++++++
+ 3 files changed, 31 insertions(+), 2 deletions(-)
+
+diff --git a/dummyserver/app.py b/dummyserver/app.py
+index 9fc9d1b7..c4978152 100644
+--- a/dummyserver/app.py
++++ b/dummyserver/app.py
+@@ -233,10 +233,16 @@ async def redirect() -> ResponseReturnValue:
+     values =3D await request.values
+     target =3D values.get("target", "/")
+     status =3D values.get("status", "303 See Other")
++    compressed =3D values.get("compressed") =3D=3D "true"
+     status_code =3D status.split(" ")[0]
+=20
+     headers =3D [("Location", target)]
+-    return await make_response("", status_code, headers)
++    if compressed:
++        headers.append(("Content-Encoding", "gzip"))
++        data =3D gzip.compress(b"foo")
++    else:
++        data =3D b""
++    return await make_response(data, status_code, headers)
+=20
+=20
+ @hypercorn_app.route("/redirect_after")
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index a0273d65..909da62b 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -646,7 +646,11 @@ class HTTPResponse(BaseHTTPResponse):
+         Unread data in the HTTPResponse connection blocks the connection =
from being released back to the pool.
+         """
+         try:
+-            self.read()
++            self.read(
++                # Do not spend resources decoding the content unless
++                # decoding has already been initiated.
++                decode_content=3Dself._has_decoded_content,
++            )
+         except (HTTPError, OSError, BaseSSLError, HTTPException):
+             pass
+=20
+diff --git a/test/with_dummyserver/test_connectionpool.py b/test/with_dumm=
yserver/test_connectionpool.py
+index 4fbe6a4f..ebcdf9bf 100644
+--- a/test/with_dummyserver/test_connectionpool.py
++++ b/test/with_dummyserver/test_connectionpool.py
+@@ -480,6 +480,25 @@ class TestConnectionPool(HypercornDummyServerTestCase=
):
+             assert r.status =3D=3D 200
+             assert r.data =3D=3D b"Dummy server!"
+=20
++    @mock.patch("urllib3.response.GzipDecoder.decompress")
++    def test_no_decoding_with_redirect_when_preload_disabled(
++        self, gzip_decompress: mock.MagicMock
++    ) -> None:
++        """
++        Test that urllib3 does not attempt to decode a gzipped redirect
++        response when `preload_content` is set to `False`.
++        """
++        with HTTPConnectionPool(self.host, self.port) as pool:
++            # Three requests are expected: two redirects and one final / =
200 OK.
++            response =3D pool.request(
++                "GET",
++                "/redirect",
++                fields=3D{"target": "/redirect?compressed=3Dtrue", "compr=
essed": "true"},
++                preload_content=3DFalse,
++            )
++        assert response.status =3D=3D 200
++        gzip_decompress.assert_not_called()
++
+     def test_303_redirect_makes_request_lose_body(self) -> None:
+         with HTTPConnectionPool(self.host, self.port) as pool:
+             response =3D pool.request(
+--=20
+2.44.0
+
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/r=
ecipes-devtools/python/python3-urllib3_2.2.2.bb
index 620927322a..f6ac8f89ca 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -11,6 +11,7 @@ SRC_URI +=3D " \
     file://CVE-2025-50181.patch \
     file://CVE-2025-66418.patch \
     file://CVE-2025-66471.patch \
+    file://CVE-2026-21441.patch \
 "
=20
 RDEPENDS:${PN} +=3D "\
--=20
2.34.1


