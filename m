Return-Path: <adarsh.jagadish.kamini@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04297D44C4B
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 13:33:34 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35683.1768484012767352532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 05:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Gz11a9hn;
 spf=pass (domain: est.tech, ip: 52.101.66.37, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2k8ZCAqr35tD+qdWizJdmfKyChINfkO4R7IIWsS2enS+tKqkiojb8sWiBv1tNeuLzrhpExnjtJPUvMioJkmZadrdmN/jVXq7q9FaLmq0rX2CEcLxfXtooWh4lvHka3OOUtSTUtAXy9EvTh+BXXOWMAVMZ6/v8ITrD6iUwNSSo4TF2GehJJcQMM7g6V/nprrGODUncVmXtdUGw56kyXnwFGWTIWqlBITr6Aoapm8V66VuoZjIvoOdK36pGx+MXt6Ice6eNaUpvvXTqlzEDL0FCQTAeO1iuE/QXOK5I2+75zAKvTyDH9fZgg7J0IE1ikD5MaXnqYozSLHMioGZu7Fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1g7XKX8K1EMRRs2BbNobekOqMsag6EIy20lDY2rO6cA=;
 b=p7ur74DYZQA8B/SaFLJlRfEn0CR/X6VHMos1SuNqSPnvnORhsJ5cedkSYNHarSvhdJfVX9Cd0LtvAUjRiMY+gAfzQ4eYJJDorN06SdArr+H/5JA7GNM2Dh2zZy9raODq2fRQgCcaXVFvDpc/i740U61CsVUsFOIADpIqpPy/yrST33NWld5fPkXtstCj3F51xrm9LwMEZ89M5LMsGUe3mEmGREPr1hzdAmE+WI9MhQWhPRkhvk4rz/BVdSE4NA+CI7/TJniMOq/MAbj5sdlqecRCUrlStGihwvqV8F43vK+gj5ur0W744u/2QuvMwwDZX0XT849m7qF3S0UeCEM8RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g7XKX8K1EMRRs2BbNobekOqMsag6EIy20lDY2rO6cA=;
 b=Gz11a9hnhW449CROgcVJH3Wyffrk8ackRnhcBXt/pGN/1CPI3VU7JH0ZB2W0RWijgk71lO0qU7R4soRKU+iRQv1Mg/8BtMzMaSNhcvewsCP6n/dImZpNCLESMb+GRyJQdcOt1+z6X11KoLE7TW2PpozbGvGuq1POsd0szMYenL0EMf8TuZuTNJAHtYAWvwjn82KgQJYXc3r4rggHWapwAogeU7hAOsourJUSE/K8oi6AeZYyY4nN0TVOB+QDa7rD9DZKAXZdADPq3PqYQ3A0BGhZ5ePWy7WoyalnsMBvFxsOkh2UtuL6EHeu6IBtcDUlGJxKjdeAWDDcrvdkL2IkZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by BESP189MB3244.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 13:33:29 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 13:33:29 +0000
From: adarsh.jagadish.kamini@est.tech
To: openembedded-core@lists.openembedded.org
CC: david.nystrom@est.tech,
	Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] Backport fix for CVE-2026-21441 Python3 urllib3
Date: Thu, 15 Jan 2026 14:32:17 +0100
Message-ID: <20260115133246.405765-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0244.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::10) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|BESP189MB3244:EE_
X-MS-Office365-Filtering-Correlation-Id: 847cb461-d7cb-4e03-8e12-08de543aab1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EsmWk7G2TQ1etdZBlXbrJ+pbgVU5HbmORznDoERzGlZV+EDC31fo9ZZdYs42?=
 =?us-ascii?Q?RcLCiMeTQu5Tv/VYGpQjo7/tCTmrUuV3Hy+n6532EKNAC+imQ4M6Trn+x2cy?=
 =?us-ascii?Q?DgZ/nc2tHCxbMwLnDFfE2bQgTmK/oI8qlsfRRH1/ZaLrL9lj/seoqvE8JBlg?=
 =?us-ascii?Q?nWdON6WOWC6Cv9czncdokzKgrnNaM/Vt77dFcqVKwaL41sJayo/eO9aAxpYH?=
 =?us-ascii?Q?LrVQDUzVeWJnDqbDTsbLByD4IADxA0n9TcN4F1a+bG+pRILYUge6r/d8oUgk?=
 =?us-ascii?Q?tA8hLkXpKU+Ge1OQhRCJFOutXdD6gkUwXPM+2MjgKRRz1sjz6dX95QoQXYTL?=
 =?us-ascii?Q?Ve9bxCOIz8EFs4mUX2RzmpusTB9nkwvmXQyfgXxDjzn9qN4iWbVCyVLBc4D7?=
 =?us-ascii?Q?FkMhLNgSi4/pL4fRHi0YkJhYfneHfOcSJV9VGybL9uSljv282QKvuE1Bduut?=
 =?us-ascii?Q?L7flVSZCmN9wDrEiwQ/3LHewm5aRcsGxWpM6rGzooP7AbNpxu2FvUE4Pkoqr?=
 =?us-ascii?Q?Y98/J4Xm5whtKShjOhuZf1aLP84hrCl7QmY64svNy4XhMx7AIkA3xnF+T+FV?=
 =?us-ascii?Q?aH8Q6extLm59lS0wTU2lqehJBkAIn6dkMip/OqLbARkUvPTk9NmTGpjvAlqn?=
 =?us-ascii?Q?y6ASku+VtI+nMhsOOD3ET1XrBdvOMHcr0egkJCQB2EiIQc6opCM/5DsJGVq4?=
 =?us-ascii?Q?EZpzHKtm9B6I9gG7I2UwJd/rxFA54HIiEgJtBCe0B8yZ8878DEb7mRLXgLt9?=
 =?us-ascii?Q?w019eEcU0Lw48ctlHV1o1P7DSOoUSSWPkGMKxBLXRNvFW40qezf/fkxIGA2E?=
 =?us-ascii?Q?RAI8c6ytTFqvT8oOiGBwr+STgOPua+lECQndrXpsrsWojE0OJR3cAZWb6tw+?=
 =?us-ascii?Q?IOOq0cHcjrI5USlkIjNgLjIXuMwVST0NP+K6vWNs4WIAJg3dV7F7SNOxaCDp?=
 =?us-ascii?Q?a2k+vK5mr4Fy4cQcO9173JeUXGIuldm4Tbd3Bb+wZMSD8tvb6vPKugjLzFi9?=
 =?us-ascii?Q?2FYAVV2SYk2HLp+Z0JnjGTU1VEBMWvtvlxSibD4SFYBOVGUhJ0NZti8ptpPU?=
 =?us-ascii?Q?ZNyLoo7azhxgw3pqz8rjFK4OCsjT/7IqX7ROPCnYoJfule6xb4XKosRN5Yop?=
 =?us-ascii?Q?CxuPGl4J77oiFCPU9QTSeptJnqK0uAQhsl0JpvF5UMRRMbpNeTqvH9IGYoLU?=
 =?us-ascii?Q?wGULlj5wPFVCh21gtVcY4vUOx8E3NFYDiU/YMM0E7OPMBDJQQGMT1azrF/J0?=
 =?us-ascii?Q?S6gf/HaoCYX+50y/f5CANQOUidMhM1mniutneXVT8QIZhT1TSZEXmHb8GFrG?=
 =?us-ascii?Q?co+57Ooj8NsfkNGQLOVuHQkWu29O5yfct+ezKF8i+1i33kzOsW9WXf24XzhA?=
 =?us-ascii?Q?68L0wVqkhaTlGVoMfwUNtkifQ745wXFq5Y2Oe6zDDYUemasCC7Ehs9k3ej7J?=
 =?us-ascii?Q?Ex6ok1hnVje563IT0IZHKqsrrZI0E9/aP/f0rT7W4/WerUW3aZEwydMnYBXJ?=
 =?us-ascii?Q?BpoSOxIulpNU/HxmEZS9HYnalnbqeukoM5AH3buwFsesx0jwRZGav5Zjl5ur?=
 =?us-ascii?Q?S7kUDBWTh3qtwn/tPfg6cpqQTAK04r19WPxpEKtV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V/lNrDfzaco6/vUbaEq5Dm7ZbXrJL7D+00rL9gIW0HrAxt4dKJXf4tK2Nhu0?=
 =?us-ascii?Q?M0nVWIkOIrpvjMU2f3ghXS4CMJ+8p5mZGFSwGxDNaftJ1ZtfsBWEWu0cnA1b?=
 =?us-ascii?Q?3iUbK5kBjElQIPxBKMDDzxoYrnSopmgo2y70LX4F/WCIVN5eqkSurp0AbCau?=
 =?us-ascii?Q?9EZ/1KqP/NHLcfhcCB1XraLkxHYhO4kLmWbtfK0Qt6msIWirzTbrbdpsBxuM?=
 =?us-ascii?Q?ZlflMYqYUstoSvxfveS8f3iXmHK7BXpAgMJei9ceppcDAZ3ipxPTdo3vSK24?=
 =?us-ascii?Q?piMk9fh9FLVIq0ul+GRLiuSRPF+yyt7cdsce3gi2p4lS4HHCwA0od3XdNOwT?=
 =?us-ascii?Q?kqMBAT6cPMlYL9tIQ+yWcIi2UXjMzxD6nCcPkfs9w+ILsWVJluRbseu9ZQdr?=
 =?us-ascii?Q?9ifdf/QL0ZmAyYn3CnXmUlhrxRFOpPlx8ZE/aazX43zJG6xf8BkKNZ11S3jq?=
 =?us-ascii?Q?sk0/Lul4poLQRiLYv6XkNdq1I5R/WMvxIUd3YNwEkACjjYrduQqc5UGjqLES?=
 =?us-ascii?Q?buobGPmkmXH1fbf3Y4RzvtFe+VvWpcUH5Dt+W6JbuwWuaSHtdLOjq/L0sFfk?=
 =?us-ascii?Q?C3MTEnmF00t6kch3U/9u8UcutO1zEsBmWvmws5GTVgsADRP//PFpi8KCJxQJ?=
 =?us-ascii?Q?ZHxHRF9F8GX5W7poPOdzbMHVh2/n4t0sHzmI70naoBuRLGyPp7MNb5smh866?=
 =?us-ascii?Q?rObiYW0nhRtWYLqRUUvnTmKqHxf5HZUvLnCdGkqegwbzOFOVgqU+kA0rCtqS?=
 =?us-ascii?Q?uEqE0mKLH6Do2z+zCTweapZ3LVSmJvI1cqVBN+QGgdlpu9RzqNLmMEFTfC3Q?=
 =?us-ascii?Q?gseo27W2IfqUmVZntMlw1Fnkcq6AqZAh4uotrwyjWCMLcYc0tIJTJOB1qGGU?=
 =?us-ascii?Q?6rnO9vD8OFTKKI9qom0LXbtfd9hgPStxCol827+55eQkdhx0/zQVk0S6OoMy?=
 =?us-ascii?Q?BmQyzTzU8q5YbuR+7QWIr3/dE9SmvtYfsPXHUm6+MWgxggHqecO6VF6GN9WH?=
 =?us-ascii?Q?OieSpmk8uYc2XYPWmcKwf6137WqEBYGLysGb4LHHstOqoBZZxk/tcWNKcO8b?=
 =?us-ascii?Q?ddwCpRHyk+JXdmP/cw05pT7fvnx40CQLSMay2faoBljKs/g8CbrQO1f/JeiI?=
 =?us-ascii?Q?srRl1vtyLhdJmcxppeAbApi77YWEL2axfifAsCytmQgfwuNpVH0MfsBWzp1v?=
 =?us-ascii?Q?TGJYwUsKJ18zlxN/OX2xf0No5lAna9BniowmbX0GAc+CkevsAgrlnepQKGZt?=
 =?us-ascii?Q?RM6I80fqWsRANG1RYnGOwAS/+5A9cahe/ZHqEkZFz55blFrnsikhk3zMe9cT?=
 =?us-ascii?Q?DJsQmZX+xcUndQsTAU3haWyE1re/9poO9m6JNOAGAxh0B/E7nGq4NH785UpH?=
 =?us-ascii?Q?qnFQxAUviZv4vWLVMtr9O0Jt7LETbs5bFxl0Rp2PqqIUcXqvhbduuMqbVbEQ?=
 =?us-ascii?Q?vKJLeoihTMpwV3PbODxgZj77ZWnXEmuQDhLlS2YDx7pGOKlTcXgUiIo7RlIT?=
 =?us-ascii?Q?ZKhNZQYYWnJeITfnycyRc2cU5UnVTx8DR/rjOYST45+K2KsObqEIMla/1VCW?=
 =?us-ascii?Q?xmwEadBiCFAf7JNz94Z94TDAJ5ePz6x20ytLNVlu7zWRKrBO//RiEz72kqV4?=
 =?us-ascii?Q?kK6EdexBNuM8nDZdslB/hFNrXxXDUd0CZ5hgV2l1BcRrYLTMEfuhYOho1voe?=
 =?us-ascii?Q?f5292XPqUF23biwxRZImxyf0VKugy6Vvu+McSYOPjz/EdfIzbBWitMT8b0ra?=
 =?us-ascii?Q?iZjtuMfOPtW11O1FEqnuXcc42dzBj/MRgC5eIt3JcSFOLOFntbBPUnnig4X2?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	tKcn//3e606hqUPG/cObJ9Trw8pFSWoLqkAdV8eTPo7eTrWrrKel/z/R
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 847cb461-d7cb-4e03-8e12-08de543aab1d
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 13:33:28.9654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1FU2BasB5+bDIXF+RL61+tDwkADdElAhdzB06FkbvcYmXAwV/bcs3N6puaNrZNrma86foOzQKLxdAGeDb3KkTRXmZyh1Uw9+sUhT7711o8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3244
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 13:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229410

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
+Subject: [OE-core][scarthgap][PATCH] Backport fix CVE-2026-21441 python ur=
llib3
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
2.44.0


