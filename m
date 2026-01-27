Return-Path: <adarsh.jagadish.kamini@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B541D2F030
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:47:40 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11058.1769521653315474584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=W1jRx8Xk;
 spf=pass (domain: est.tech, ip: 52.101.66.55, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOdAF0n4EOB5IkxpXvaEf/HABet+ytFBJKm54012FmW3GfVoPDjfwfktO6ExlNcpWFkcqz8p7GBQl/pMvg6yI1TaN+olAbvr4qyrwB/rtPK+ueTFlLcesGkx4dotumwr5yNBg11wDawL7YJJbjfA0NszMjRgYGKoIV63LUnQQMN4ewpvheAiGpsmTR7mYkQr6w/Z00Rxb6f8rG3ALmqZ2h1a00A7Y6bLaI4GD4G+/GMLlsdSo/LX0Z8t8fPfvsbIBVMqHu55n4E50SKG6yyhxqcJwAOv1wYfJNKi7A7va/P3AzpJz5+DXQ8DZipogF0vrVxzZOX8H3Hz55KhrClxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0XOKVqdXQhyG4kEhrSwv6k8Oe7hDbSaKhP8KC0or4A=;
 b=a1PFQmOKdX5q4paiVWrc6HUaVxnKkbrEzI88+MafV/MABGSZi9RgDxsmlsyLPB3fIOb4/zxBiv5L35gPdbuj3kA6xKG06Y2FOFTG4zP1XqW4rrvr0I6PSO+Sm3bltW2YYb0ueiR5eAMvh0sph3UJ6Yk7lg4lSh2iNyPc9cYVCv4ywUnQebXu8bLhyaQEb6cMaS787uv+5g3pLP9MfpkSMtZP/gmFo8rOMGNP1fZ3+DVuMhb7ugfLI5VN+vpU7oswPS+wdPU9x1WNlFXzfGoLuoE144VCFsjSuOgfJudIp+Jk9PhK+mxqfYJ47t3jMUoiKGL7MeiYg0j3tA+ph27VNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0XOKVqdXQhyG4kEhrSwv6k8Oe7hDbSaKhP8KC0or4A=;
 b=W1jRx8XkjW1dceOjitruGqLHlK0ptAy0JqpTlY9Rx9S2NfuEUndkd9rFcADiOr/bC+u6It1vbWe1jFoAgXcxk0yKV2m8JaG/4yqrFC/t4Lduh+cMrb+Aa0jj7Hst2lKbrO+sPQN6hm033PYBRZD5CjSpmvlGuEdk5pgr7NVaJBjFacuweC3zR9O6xihy5R0CEynNYXw+7W49tK7XpOkVyKgP9czZsMGOg82NUkkm6dX10tFM9bLOJo9CdZDlotT/M3uqojKggtOCue8wpqfZepHGl4gF7k7nAjaPKBJh87JeJqWqRgtHwaGbbtOxBqnZPo5CDgvDAa+efIW47JU6TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV2P189MB2910.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:269::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Tue, 27 Jan
 2026 13:47:26 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 13:47:26 +0000
From: adarsh.jagadish.kamini@est.tech
To: openembedded-core@lists.openembedded.org
CC: david.nystrom@est.tech,
	Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] python-urllib3: Backport fix CVE-2026-21441 
Date: Tue, 27 Jan 2026 14:47:18 +0100
Message-ID: <20260127134721.76918-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU6P191CA0070.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::18) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV2P189MB2910:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e4fe93-0da6-4a23-e3bf-08de5daa9b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a/MS9jdAzV1aNruCwJ6bM/6oz0iL/DUojdIJb9Yt2zq/EulOJN/QIlZLSxVo?=
 =?us-ascii?Q?MEeeQB9Yzys+99GaEtFy0gK7SNvV1zuBanCcKqUiW5Sj8niR62t0kiWV5uWa?=
 =?us-ascii?Q?AjDcz9jac8Rk8uSjjUP4obt33baJpgK5wzf1MobUUKNDGocf+WIyvT2zA3e9?=
 =?us-ascii?Q?QV1zN/cyJOid1ztvWc+/bECMc4K87ERgcVRmRdqU3rJcFSiTG2yHrEAeWy2r?=
 =?us-ascii?Q?GoHwxphzA4U9VwZtLTiWomG84AQCM6UOBesJaW8yJ3r/m7cauT7T8xnNQfOr?=
 =?us-ascii?Q?y0CpN2XqOZsPe6BU/2AXYAedJh3YJIwdZHcoMRGu2+hnm4e749l/BXFfEVGF?=
 =?us-ascii?Q?sKobpD4SZnmd4TRPNxrgARAOGd6ZaSDPN8vdKuxBeBq51zXjNoqQBrlN0Ang?=
 =?us-ascii?Q?3HXE6filqj/iFQF9jy3n6MlG31dPg6v5mfBBhZItaLnqODJf95sl1n+JMWTF?=
 =?us-ascii?Q?t6AdTND6g6MGAf6n5J3qyaylqW/GIiSZhV2ko0/zBv0A8vlTFK3xs10MCM/y?=
 =?us-ascii?Q?/qd7Fb+Wc5pBNb3JGtBjbcm6Pc34rr0pBRDhlCeRB8gx6NuIQF3+Ewv2A5GV?=
 =?us-ascii?Q?Wy7yjQOnuIGo2rd0ydTVjfRiAtd+ZpyAcEyI6MAnqDTY6vaijPvketZ9uzIr?=
 =?us-ascii?Q?vidYGAnbugGViwln4rYTOgIa3K8ja60QQ7p6M3TCnJBoGuRw+lKq459KrfvO?=
 =?us-ascii?Q?wLVIeYDBUhPupEQSwXwUgNNTquRnEgvJUSIgzXhEjI8Hhusc7kvIBCIuOQIs?=
 =?us-ascii?Q?Qgh3CydRp1inEA6r1kx+ffBjMVk5lofXMp9Yq1ti3xq96ydyLFilti81rqhQ?=
 =?us-ascii?Q?vwh7GBZln+9fqHuLg/ZZCosROG+P4VIZd46jDN7pp0memJ75N3W0+ORdS30+?=
 =?us-ascii?Q?HVOjhTk3NOAry/mjKo0DoVKAAf6pcHCEHElLZOGtIbR0MQt+rq24orbmC06w?=
 =?us-ascii?Q?14zvjx+JHwECo4/ty2BjPpo6oWtoUg4VB2C7Aw8MiI10WtIkIFAx7hda2wwt?=
 =?us-ascii?Q?OJgN/eP1NsZy231lRohBdvRXVOJWSC95M2C7wcLJeSAAhdO5YtlSPZfu200U?=
 =?us-ascii?Q?ju2AkBgobcL5WbFUQhE42BDxoLWHGLSiBncDSeVFMcJzGAXSdzGwamOvKd5D?=
 =?us-ascii?Q?K8EdbotF3y8dxOvrHfYJPowLBdNqgB67aEEL508cdcrIdR8+GHj9LPOBsEMi?=
 =?us-ascii?Q?qCPkrjQAIUZ7yty9318C3ZxaAQxhgK4lmH/u3Ri2cUO+NEuu6yW0/Zn0zsag?=
 =?us-ascii?Q?KzZ23R6wyv8slEbA8O1Lwq/pkE8pBzmog5RuqHBQMa3erl3Az4lzZesb/4p6?=
 =?us-ascii?Q?zmv/sGLj5LAfiax5HckFftUi58moBgJ0c/gVsohEAzvuAanvp1T4xcsLoh7N?=
 =?us-ascii?Q?stJ7Jz66pOKcT6xY/0NHC0TIWh22AA/2bQRqXvCceWprWavT4ToJDbcnzGjT?=
 =?us-ascii?Q?dKhlm+Mdt20INpxNsz0GOZBHZ9L0mDE9wV1+sJbYpur/tezmKq8yh6Vrblhx?=
 =?us-ascii?Q?dECf1agbpxdfiXmOtwuh8ydBijF1PzEoXg+BHH5+YHJ+me27PcwVE5rZIboC?=
 =?us-ascii?Q?fM36EGyrc5LrepTjKULv6qozBU3x5LQztnJ6igjB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h6DHVsR1WA1NnZUt0iuVi+vPtIdkjP1Y1TAHr1WRXld6ylUeDmiYmeCu6DTi?=
 =?us-ascii?Q?V6kmXllxRB+ATRdwu8h0V7Rp3cXsHj+2k0gQ0r4sQdUvurHKuWRyeojpfD7K?=
 =?us-ascii?Q?faAHJWpbqSr3frfKIBkS5EGGtuTynOE9hXvtwJhoSa9yXnMVxoERqGekUw9s?=
 =?us-ascii?Q?OUJ1EWGK0x4d2fZDLtibvdcXqc90kI/0TI57YAmO/nlbOQU+gYDdv98E9xMc?=
 =?us-ascii?Q?1sjkWRwtgIluImKLIRcCAuu4CfPtGH1jvCCIzmvRiHKD/MKI/RIixTlcxTSC?=
 =?us-ascii?Q?kzvAx1vnlMcA0s+3yF9d9BeoQA5vkOk4aZ7IAYMQVl5Xh4WOxDsL7uAOEEHc?=
 =?us-ascii?Q?Puea4mRAKgQFECUctzTkFR3Ji9kBsATVzWJFSv1a/wQ0GU1LC4dNqCVVJ6ul?=
 =?us-ascii?Q?nMsebFnm+vVhI06oXbIKwPtBAG+3yree15jYEmPnU0yjB30ROM5c3/y79AWU?=
 =?us-ascii?Q?+onL0TFU+Wd3DGtpjdKndOuiUTaniYTxWR92Y8GWv7417NhmLBwchEPoiwQK?=
 =?us-ascii?Q?falbzOlfyWhxXVPBeMNh+V2c8sZjN4s+4EXdU/UMQobo7Yzeeix+H8nFedh6?=
 =?us-ascii?Q?VCSdysxaAsZRc6Xmh/cqEPNqIYfZsNEi9tYN/OrK0jgw2kaJcMy9PH2cSoWh?=
 =?us-ascii?Q?F1uIEu82BOLbyyFZjYJD35Vo1l6k1HtkUPcukgDvvcLwrb8FalA+xk1U5nL8?=
 =?us-ascii?Q?RIc9G1UwgYusIA/9nDCEVbb8DvAzBdZj6fhnaDCg5/wTjFwNFDU5myDY0f+M?=
 =?us-ascii?Q?TjlJ0sb+5QI+AeZty8J9HwR3T8OMQkJgSQ5xwXSQdjiozDyDQbXFNvJkOc9S?=
 =?us-ascii?Q?x8PcxZTHoeZttep7x0QFyROOVEdSe7t8BTs2Tn6tQfDHQvLCv6HH7XodO4zx?=
 =?us-ascii?Q?6BLmDSga+QFnN2Ha/0ALg1UcAur2W7vZ6ERLNVKsxBFgDcBqTwww/yubhORc?=
 =?us-ascii?Q?eV6G0xjblVPepFBq5fdCa6K4ihkfa4+RtPIbWZLwFIZndFZV7dwP9V+dDIUs?=
 =?us-ascii?Q?Wy4uOmBnfOPgRJUe7c3AAJgvkJhsZb7AiXI8jxMYr/FENigqXKfNfykq8QzR?=
 =?us-ascii?Q?C/a9UX+gW5qqNpKnvzWmL83Qhte2O1U6+TS2CN6uSxOsZybgkquu3xczgLN2?=
 =?us-ascii?Q?3GkNWB54kZbdO0rUpxM7PVkb4Kupwwvi5HxvyhUUl4lxl+/HhRy8sTDKgFrx?=
 =?us-ascii?Q?OCN7JRG/6+uQtieWAfkO2yFqgqhF+MiBXdKTJE90VQF8EIqFV6C08ve21LsS?=
 =?us-ascii?Q?yQVh42f4UZjN2xDDkqdSBs88WFg703OcQWjVXknwHW+580wnIhQRNfWwt5hN?=
 =?us-ascii?Q?XoX7f/yvXFFALrc1DJ2EENUr91lYusLS+vL1E2eV4T0oOIld4mHYQ9Cc4rdJ?=
 =?us-ascii?Q?ioqrPIiYTFv73F49XJYo35kkPzhyz7glo6SHgSml04ig2s7tBJxPmrA7KP/c?=
 =?us-ascii?Q?hWQI5ILD4lD4i3QhPQXc2sobUyG6VseSF2YLdOgUo52ttuaErxZZnNSiRFs1?=
 =?us-ascii?Q?LS0YkQhGsjSKk1KyvqJlafHuQ7uLE1igY23tUdlG5b0K2293AAny8Vk3mrbE?=
 =?us-ascii?Q?Pn4u4JnzpAtk8LUBrOPlnDDlTe99j3vmFjmGq3Vkk+Vr7K5NgDcy9d/d/4AJ?=
 =?us-ascii?Q?n8eZ/XkZAiNBYF3IMP7/WHROAXzQKq8aKOsiaeZ6g1u2QC/McIkcnowAuHHQ?=
 =?us-ascii?Q?k22TQupGvWCukauvSFKLd6ldP4mZaBov6vTnSTD2sYyM7+82cuD4CHVOVpji?=
 =?us-ascii?Q?a41Gq4kGJ/T0Zgj4y/XAJpGdQgDMZFQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e4fe93-0da6-4a23-e3bf-08de5daa9b6f
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:47:26.7713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOyo+fFjIPm2X2XnOq0+wXBiMz8ZBKRA0Oufqd5nvfQhcY+wiciwaXIwcoWlgbiubPx8AsxfTryjBlxPisxYVO3ZjYkX5g9frxpl75MCMoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2910
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 13:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230043

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

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
+Subject: [OE-core][scarthgap][PATCH] python-urllib3: Backport fix CVE-2026=
-21441=20
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
2.44.0


