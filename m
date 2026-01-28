Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AD2D3F065
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:04:53 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12616.1769606180323048006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 05:16:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=CWZUycn6;
 spf=pass (domain: est.tech, ip: 40.107.130.58, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUoBpFDSBiMrOFJLXGOB3vDyhsawIOjSDx+CFoP5qYI78psJZiqZO8hfwrFGqYJB54X+O9bfAu/Ha+OTY8cFPvflRvlO4e8EcYMvbeMKI3p5Ik1f6Z2AKquyLaigeAgJDVL2g0K6DMNIJV36gJ04GZVtQ3Mwsl29a4pu56M/vyKC+IuzeceOWB+idZ3CgByGezPs/3vRRBjaKrq5j01q/PjKXhv7EKulpPHcWWLJHGVPlsO8TqWfMrIRvgORrI/VgNAZVVxREKQKCBrXUfKbzY7fvcovRUm47jY2g+GdnCnJpRFxnMGDYQLIQHMHfgEn9lwhKIvAdqUtoJULPr88mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kjvj4WPYYMOAu0WlNWQm3+omEkmFpQxwyBT9PmnlX7g=;
 b=qkdUL3a4mz4Lx+nMaSHJ3uJeEMEjtucxcl37w9yPNTfIUXmpopB3dR0ET3jOGafqcpkGuStqlROaf/5TRBWM3Xe7N28GzwxqiQrkKQgJA7ivwEVDKPB946qwT1JRvVZcUNhScWLELvHTkr8e/SSzd7W4FNF1KffdoiSurh3YIvQtKL3hns5VWVdvRxm+lZjx/ojwDlLmt8trDP4DVkiQlWJCbvTmj3cit5wZGz6YaHfTox+NZ2K0LOQljqjXIglaXKTZCpNhLRjgh+O152/OJHMRmag4iQ0EOL2ggMEll9sKg/Bo/KbX+Gigv1lBvJt0AjIhH5FSYWMhB89SNMktoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kjvj4WPYYMOAu0WlNWQm3+omEkmFpQxwyBT9PmnlX7g=;
 b=CWZUycn649PsiO4V/7f8zpKDMPIelENYfDSwqJ7kNy3bFT7O0U8KDowdXJy+52Xp36bJGkglAlUcMRi51Hagk/tSfrCBPtW3v0gDK9Ry94WUdmvyD0UbJKgig161Fl1S3FXrIIBcdt+zALb+EJgO7Hqr6z5Om+M4nZvm9OHf6CA6w2i9U4ita4MgnArXSz5fSPNNq7etk/7bWqCD2SRPjJjEY47vRJwWgPaHFkWpSJ+Yh/IoQtc4TqRtbHVVCLk5uQaUkefrVUiNTp7nY3f0xxTV29DqNvWyiNvO+3kcHVImOmZ0GdsROxXaPoUWJ1eMuaoYEYpXwt4b5NXeEhEQ3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by VI0P189MB3424.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 13:16:15 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 13:16:15 +0000
From: adarsh.jagadish.kamini@est.tech
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][PATCH v3] python-urllib3: Backport fix for CVE-2026-21441
Date: Wed, 28 Jan 2026 14:16:02 +0100
Message-ID: <20260128131610.130399-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO2P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::6) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|VI0P189MB3424:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc84a9b-498e-4f44-c827-08de5e6f69f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pDpebjbB/CiyrHRyy5VWvq3dbjX4qHasxtJFGZJWw6rH1pP1+AOg+tFp9JF5?=
 =?us-ascii?Q?Sk4hdbRBLWXlh6wb5FO9mQFQ72SqlUEEoCg0BnhA129mV2ODEQ/XjERuXZnh?=
 =?us-ascii?Q?bDXgRohJSyhbmRaORb4BHhp1uvIYa38PhQNtxZYlg5dMXzCjthfHiFHQb04x?=
 =?us-ascii?Q?ufAsp+HP1//tuuigr6Nrwi/W+bjluOFa2P5OAlgtGaE4fxb42LFWazh0xPtx?=
 =?us-ascii?Q?iW7R33RqeF3+yb/6zMde02PTF0q9Qa+Z4z9p2fPty5LdmTf7XYupkC5Co2Np?=
 =?us-ascii?Q?qBLUpSNAySnY7EvqZooeYDm5l26FHr3mA596wYwixCcnxVZJ9kAf3Dt3b5vL?=
 =?us-ascii?Q?l7JNv49UyXNZsOxHLAE4HFbyYGE8sqGLypgvGRwCHXjHEzys7e9kSKltybeU?=
 =?us-ascii?Q?5y+uanmR7r0Lim7fT2UZ+eYCuRedk61tHHbvO3SKZaYvaEzAuF10FyzWPF/M?=
 =?us-ascii?Q?BQCXwx8X9RPqjOnTk5y8clUi2YHWbgj/sWst+AepnXURCCJR/p9GJHQ75eD6?=
 =?us-ascii?Q?kmuBad3ca6g26BuAh16GEKxGo9ac9E4krvL7iYeQKfwCMtpSpIdUSRJfe1Xh?=
 =?us-ascii?Q?hIt35g6XcDSYovqVKu0be5+uUU301vL1maYIPFK8vH8TECrelwdVfkcJK1Ht?=
 =?us-ascii?Q?aaYY99389asii/ikJ3sCu/bE5ev8s8bUwioPg601g57jZYGsFdj24lcYinN7?=
 =?us-ascii?Q?fv+DWLd2Mzx2zSjHqul5kRyP9XXrr2aSGqqrz5w3R2w5CXwyRjB8ooiR5Yxh?=
 =?us-ascii?Q?lBirftj320wEbZMyejTR6gEDuP4II/vzeZaC/DEOrk3so3wW3mFmrFbHjkRu?=
 =?us-ascii?Q?RuazeGjZWOhJALgzoyDLxlwUAlNt9rgbAHnfmobnIy5cXqEnF0JHLA1PzmBG?=
 =?us-ascii?Q?zCBOCn8M0Lq7WW9q3HlSmp8/tvWYdPXYSVfP5C4THWBCYgbmz1kqptgrAp1Z?=
 =?us-ascii?Q?1FmsnCVW7pkBs6X5V+STC0QIPxFcX8KOTYfkK4Fbqo/JnA9TYXXWZJvfLZyM?=
 =?us-ascii?Q?GiePgDKkNlXeG2pqXsfmdspnQ2jH5HiCDztPN2SGipnlnoQnX2eNHDzLBMyg?=
 =?us-ascii?Q?hpE7sxvtGCDnfVLnst1Aps+1XX1wdS0Bn80CxAq47wYRbGURmAlttBmaqZfq?=
 =?us-ascii?Q?p3KRrUMKF3RuUOl8ARFKBClVcKuEwchqeasgSsrK9A/18aDUm6OaLTQiRAUL?=
 =?us-ascii?Q?7jGdcRvJOv85LSLVwUlcpe9KoHYDIISfTs0SfZTp/OaDWL/gUzVGu4YHq6ZI?=
 =?us-ascii?Q?rffyei3VRgYgsIQtLelmwjMkp7KZD5cpvQWEwQtDzc1QJESh/qzvVJrEQCJf?=
 =?us-ascii?Q?qScG9/6qky3h9GJCBdfoFyKokbPuW+csoF9phsi1iJVAftBHGww/+6sKCckH?=
 =?us-ascii?Q?8C7Jiyui+PlIkt4EzYfHZzOoNr9lym4raD7Or7eoBM1GVhMcoEV5Dyo1FVpp?=
 =?us-ascii?Q?3h0V/XEZzIC3jhsDHrW9jHahxMf3hP2YEEFpuYD5nkrHBWxEgyAddfro1o1S?=
 =?us-ascii?Q?XunHMUt8xROSvrI/i/3QAOXkx5LZiFPFX4K3kMfPWUx9YXchR//8Hzogz6B9?=
 =?us-ascii?Q?D/2Yy70jDkRGytvNwau1NJHmJ2qMNQeSVq2Nq6/B?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XDP0I9pEcYCyY/kAlXU+cmp2DOdyPV+LjBoXVMDK6k6AlA/ENI6LsMEesy+W?=
 =?us-ascii?Q?PmNAX4vByyxI1IvgSxHN7CNhhCCHMOsmHHj4v2Mq07DGsB/UBV5yxvK7AFkX?=
 =?us-ascii?Q?BeRsh5VvpmoDdXxVen0giaQdz25/ugXdjPzgDcHlCMQWhMiE/wFHYo6zwi1b?=
 =?us-ascii?Q?fEkipJ74EZpL1XsaqaYrhQmRQYWm4tCPZvRF4HipPG1BCr3ZthhxggYCUtxz?=
 =?us-ascii?Q?vYboHqDJab3S+OffYgc72ji1GNNugZ2JAJRBBiYaAWhvKUWe3JR+X3scbsC0?=
 =?us-ascii?Q?Hkt1B/fkWXJburJlkI8YJruIjKFZWuAoPfFn6G0VNJAtEtOxidjx4Fwh6ySy?=
 =?us-ascii?Q?rW5WIQecXx8doZxcP/i2rONKRG854HIV4qLT+CRG4qjT3tyu+79i7glj4SvM?=
 =?us-ascii?Q?618jlU4+Ff8NHgZlTxIrrY/ms0iunJeQtmcGWIoxxyk/vV8RFrrpGJ0an+WR?=
 =?us-ascii?Q?ZXJW5m9ehqK6LwzQbGzw68HcDy27N0KCSrTMs9NBb1+wEbOJwpw255Y0shw+?=
 =?us-ascii?Q?Ff2MK4elW5xVQywAWu/+kxttaz5HmAEt++KJ6Th97C0FpodSSC3g3eLlMuvq?=
 =?us-ascii?Q?dwL0DIZNQvsrtXOrN5UrxJL1BqsBx4PVP9qj/SFzcpsdH4Tg6mF5afOJ7WmE?=
 =?us-ascii?Q?7qc8bmlbeJpQYzozTb4sXUvlZ/GuVKSGe56EdQwdj4bLAYFsUGsmPAahahr7?=
 =?us-ascii?Q?kOnKYm4rAfYEBNtg3oKgY3aW7Uev71vKLlYBJ+2mmJfo0ZJRvt/id8d6Lz1z?=
 =?us-ascii?Q?OYbl3uUo6cOTwWeRjFLUIXMcVOYJQVqz4oZi/Yc4an+uWYmPy3Tr+aezgG0v?=
 =?us-ascii?Q?CNFDoGW22T8PbIpz/ymwGya044STUCa/lr/3Fwz2SK5mDJHs1ooktHUQfc+/?=
 =?us-ascii?Q?csOTy93lIZv/O6iXneHNi5CuBDKRdyQc6N5x4hQWnWeiaVinfzboISeUUbpB?=
 =?us-ascii?Q?plFAIxofUyGEmcKHEHfpx8h+5g2NELXF381Q/xOytIkuOA91LM5H642sADk6?=
 =?us-ascii?Q?JeIcMEwVrgy2OYpyUisr54m4B0nzJ3kU4iGB0K31LcfvnISSZ/POVE6N4t9B?=
 =?us-ascii?Q?Wx1YpDxylTUHz1Y5z5f0aJXEnIgbF79ti72digF/VaAeg9HqHWPYipnG4rO/?=
 =?us-ascii?Q?2FG7YhE9Grg01Hv+CvNzSLIIntwk+4ZKl/ELqsMZG4pMM/1qTKCbL1CZqxxm?=
 =?us-ascii?Q?jYK/BbauZd/3cqqhDLZOEUjWquojB0gX1iRC8aWTLG3FnE6DV2pFhTqCPo4M?=
 =?us-ascii?Q?nyjgesQfFEUag6lZuACrkJTMbgsc77I07AXty+IoFZ8qKBtLlkE2qN0dHxhA?=
 =?us-ascii?Q?udy6bW8dVsPi+YYLxD0EtIURx0ky1h716JuplZTE1j4BQQiUpbzvtcXwsCZx?=
 =?us-ascii?Q?DhJ5ugHu9k++/ijECyF4AoJQGbsNuDaZZ0BiaBKoejZaWW2wdQFXk2sTBTvD?=
 =?us-ascii?Q?899jsYmPZoaT2oPh5/vIZMAdi+8eio7hISOMObzHw5WTYJhKDO+gcLWjpkp5?=
 =?us-ascii?Q?33ogKDU0Vb2oP1JUCVG+QOzy3iA6dapEsvSgaAyISn/Hapri6TFDWe2eq0Su?=
 =?us-ascii?Q?zT2vf2qCSNU3DuiRmNaSPFX82W+5Nw3OnU9NYxQ4UAJET5gSqqFk/cANWTVB?=
 =?us-ascii?Q?AKfwWL+bZY2uSFSjeBAsgWlmaX/twgRxrRZc3r5Ycp8/DIWuVV9xSrPIKfQo?=
 =?us-ascii?Q?J3CC68m2ptWtAx1SU8U1HLrXsenng9WF8HMsylkG1RX5Vrj1bHM2gocGAyDX?=
 =?us-ascii?Q?2hd/mfnlrbA4tPRjvKAckFEWCGZH768=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc84a9b-498e-4f44-c827-08de5e6f69f4
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:16:14.9193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkP1GKArdg1Eh1Oyg1YWIjCxphYSrRgdNKAOkskaA/++cdOBQGTwb1zRgItWfLk/3YlXja8s/srr0Izip9biBzV7RjWO0VleQWnssRhs/+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3424
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 14:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230096

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


