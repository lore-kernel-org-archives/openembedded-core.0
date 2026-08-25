Return-Path: <kazuyoshi_akiyama@jp.honda>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CA3C61DB6
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:44:14 +0000 (UTC)
Received: from mx0b-006e0602.pphosted.com (mx0b-006e0602.pphosted.com [148.163.140.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19032.1787654647493841068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 03:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jp.honda header.s=PoD-DKIM-Selector header.b=O5tsWNaN;
 dkim=pass header.i=@jp.honda header.s=selector1 header.b=CIPcPOmd;
 spf=pass (domain: jp.honda, ip: 148.163.140.78, mailfrom: kazuyoshi_akiyama@jp.honda)
Received: from pps.filterd (m0469178.ppops.net [127.0.0.1])
	by mx0b-006e0602.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAi5nC892169;
	Tue, 25 Aug 2026 10:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PoD-DKIM-Selector; bh=+ir/yEq1xwSKUx
	zMaVCuM4n+3MonaZCvRowvCEivrlQ=; b=O5tsWNaNtFle/+wtAeOihoJ+BRgA70
	K/iEZL8Xd+OeEOOp/XchtALsPyiw1mOPJL+qxmPp40gl/GvEctZ8/vAZGlY5060x
	AoELwjSlLh2QVQLqYLXmpt1GmvmWvFN3esMb/4VvAU7uANh5lI0k3iSYC3MNpq/J
	bp5RzvlC1I5DbDYjh3kzX1eSo5gHFkDFMDtYpdyVdkrVrkhL+MJbseFo5zjT9yZs
	S6dpd7xUdMwMzuaG1zbRXSbsPbO6qwiV5tu7BsTrcJh9QSxat6enSQzVU3VP/ahg
	PlAorlWa7JLAVOS7IdhjZQAV0zYzeAu8KwJ8+Tj51O+qJmPM39K3rwmA==
Received: from tyvp286cu001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	by mx0b-006e0602.pphosted.com (PPS) with ESMTPS id 4g939pryx4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 10:44:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flV+rpd+VlbIvVCqPV/+w3mDMYGuZZgFbFlQv/HPHfj34B8rZzO9Vp6ORukSxCZTLtM25fnVKtXytBnMjK06hmkz8K8MkYmKFL0WAfm8fCDvdYSko7C6xQNjLLnyk9t6vRxb+rOCXCVn9qXHUx7ERQWkNNAowYsRS4TqwNntVNBOYchyEUSsnlwZtVe6P1UunZfTzYEFIt0skqw0R3CnoHseB2WwCpAP+rjjOrbT6cqQzGwzPase+9KY8RHeu0zIMEK10BKpLB/i84f1zBBXKzNn7LWAc2f33+VqfeAkvg5NpeJ+SLe64KnDkCeyd5x1/r8hsmhzgkwfwxWKUC/hBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ir/yEq1xwSKUxzMaVCuM4n+3MonaZCvRowvCEivrlQ=;
 b=eGFNIlmjACWGlgAghTc6lXfZapTiCdZRR6zzkisyf/EnoYEIGEs5FaNVBJ5XtXbDZezBpicdQtmNZ85ty7ZfwnjGMh1ZkLafkI/GhO2v/nFnqKf7ttq5SJH7i6TQ9AKkjXJPhesh/jFGIs3nqRn8rZLMWo3nQrdWYyKxCE+C8zGriHe1IC3dUbh9Ca8fFD8sfijyVI6zNyR+TluXQmvpcJ42XXs8E/aL5XSVfRDs0a+xLlXVi+CtS7cN/whxHrfGnsRF8FcVEIEUH08dAoo7gz/fzvU1cClejNy5lGwrU8i8j1kkswdFoCuNDjYrxDUwNKM3shGazqQBJ+945d3yQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jp.honda; dmarc=pass action=none header.from=jp.honda;
 dkim=pass header.d=jp.honda; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jp.honda; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ir/yEq1xwSKUxzMaVCuM4n+3MonaZCvRowvCEivrlQ=;
 b=CIPcPOmdp1QyW48JNQuLygnRBGW3SR14neJ1yLeyMvXZd9ziT7EdmVUT+bzYDjty1m7pSs+rUjrc1PrwdDxW9LTvG90N415OAUWiqHPIKheYGRnvJ+Mgc08XePaHZO8VxJTeg5qpOxeM4AN1VLxXct9QAx0j5QVHTIXHnsF+la4oY24+wy9+y/D391fjhSVQFe1thzbymKncHm6ZmFPys7Tgf3873oyzROcAnFZ/u4CXFtApzI3PbU251/+i5eYeSrOK4icQnRnZmugd6buGQBM6Or0nxb/sfCjZQFaoEJPpUOjvncgLmy1i2CeDGF5ISJoc+rsCqey1Z5f2UU0rWA==
Received: from TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:108::13)
 by OS7P301MB1895.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:462::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 10:44:03 +0000
Received: from TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM
 ([fe80::c99f:2932:2161:d608]) by TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM
 ([fe80::c99f:2932:2161:d608%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 10:44:03 +0000
From: =?iso-2022-jp?B?S0FaVVlPU0hJIEFLSVlBTUEgKBskQj0pOzMbKEIgGyRCT0I3RBsoQik=?=
	<kazuyoshi_akiyama@jp.honda>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
        "stondo@gmail.com"
	<stondo@gmail.com>
Subject: [PATCH] spdx30_tasks: Fix duplicated revision in Git PURLs
Thread-Topic: [PATCH] spdx30_tasks: Fix duplicated revision in Git PURLs
Thread-Index: Ad00fbBy+DxqmyIcR1yoAPM9Ap/mEw==
Date: Tue, 25 Aug 2026 10:44:03 +0000
Message-ID: 
 <TYYP301MB1158B7A88A133C646658C16AEBAF2@TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYP301MB1158:EE_|OS7P301MB1895:EE_
x-ms-office365-filtering-correlation-id: 528366a8-d5f9-4a59-e103-08df0295c7c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|10067099003|56012099006|11063799006|18002099003;
x-microsoft-antispam-message-info: 
 pvkS7WZRPRtgNrBQOx57UX7r9AuKvKjYA3OzE/T8v4Ig8JkN13rO+bRBxbTVBjhhVSiR2VGoUNFQJEKJ7xvElLwiNjDTDdnZQsiq0HDzVEv1M0Pl+u2go+6x5Vcz7RZGipzeGUmIa6ORiCVxD7MSS6ZtmxoWLfKvL+AdazfCgGrplr/JXzevlJu4+ILploNFx4DrsGQpb96wDykzLgbr3iqU/dHLeiySPYZF2dRfXySoaxLy3vJYsOyI9CXCWtKMyIB1u7h9khLBPbqT6khUfYkOpO478urbPzBlC7YXJv1pzEVvkWCHfJkiJUTZoPP0pQhQgXxxmeYT1jT1TOoU3H8e26z8z3+Ve10tIxCOTKhh6jSse8mUZF+99PAmSbR6SjjKS8bxNqiq4+B6uJ8rxoPHXdxR5TZc5h9ZHcHsbKH+J8fm1r9JU0YM/koxnrcUZF7tBHBAk6Uy1JUUH2FNTMthHp0w5H0SxPMIYveygwTtdOCoTi+x28WsQe/h7fkd7Pz2CxggFbxJt1vn5/iNibkHm1v6Il4RLqR5aVrbQKKsdtCGSpBtg43IC1lXAwrDUWRGCP0/W6lYg7cam3er13/+TaiDWtQ/uFUSfmwVi4rGUKaYoPyF279lLTeLkVvZflAA9WqX7qhBlrHITP953ubrBrd/Isfbe3ALZZFafQdJeXE0KS5scCsvxhjktiz38tHlNtZfsGqf4pi+4gfIPOkMH2x8qKahdC6ypp/UZGU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?aFZRNjlHcDUvQ01DQ2h4VmIvdXN2azJxaDhESWgrekEzZGpmT1M5Um1Y?=
 =?iso-2022-jp?B?akRFeFhvb3FnTUxUQmUwaTRrT2tXTGhDb1htZ2h2d2Y2QmZVUExIM25M?=
 =?iso-2022-jp?B?UXNVcWxZQ2ZuTVZNcE5WdTBvWk9paWlhZlAwQ2o3bkQydGFlSm1pVmNO?=
 =?iso-2022-jp?B?a0x0N24xU1BUTFhUWmhlSVdIK0dhVXBDM2ZuVExIWVF5Z2pzM2ZoSXdS?=
 =?iso-2022-jp?B?SEYvNDRLSCtvRFEzTnFBUnlrZ0E0aS9Wd1JOUW5QdERjRHVLcTNKOXUy?=
 =?iso-2022-jp?B?bHJOR2ovWmkrTlUxZStVWFBXa2lFVkJiNXRWRHdoUGI2SVgvWkxXamFp?=
 =?iso-2022-jp?B?OW5PTlVLcGFMcFZsemhkelhjbEJ2RHpraDNGcHpNNDBxWkFtYUZ6V0NR?=
 =?iso-2022-jp?B?dWZySG5mZDBQYmo2Ylc5aVpIbzIyaDBrUDV3RkY1Nk9ucmdEbW5TN0cr?=
 =?iso-2022-jp?B?NlovYzVJSGdDTWh0a3o2cW5hRkxXUWRieU5mN2RCMGgrZzE0eFEvb2o1?=
 =?iso-2022-jp?B?elhxckdJOExERnhNUndKK3VqbnNpZWNwWTh1dVRGSDRPVThDbTRCaGdT?=
 =?iso-2022-jp?B?R1VIMTdhZ0V0cWxXSG94eHhxWDkxK3RuZWcxbmxwcUJKbmNqYVQ5RnFs?=
 =?iso-2022-jp?B?R2NyajcydEZWZTc2U3JrZDB6cEx5ZG5uN2czT2JGRG80eDJJT0RwMnNk?=
 =?iso-2022-jp?B?aUhVdXI5dlcwMWtGZC9EUTBjaXBZK3pHc0xacUEzUnJWRUJQNkNreVc5?=
 =?iso-2022-jp?B?VGRKdk0xL0RSUGFESVFyWjNqcUxFQnc3R0VZeUZ4LzVpN2VTK2puWGha?=
 =?iso-2022-jp?B?aEhOMUxWb0tmM1V2anVTZlVkcGdPRkJpSmg4YkpVZHlZZmpNR1hxSXEz?=
 =?iso-2022-jp?B?UlBTSXptUnlhTG1oN1gvQnByTnlLaDdxaXFoemloRjJ3Q2dpTG5hUCs5?=
 =?iso-2022-jp?B?d1ZWL3FsR0czRnB6TUUyUjRjQXl2ME84QUVlUEJ2YWt6Yk5waUlpZTdW?=
 =?iso-2022-jp?B?cFBNaEExZDRqTDdKRytPT3RGWk5lUm00WmlBNyt5eERKMy83VzhNTTMr?=
 =?iso-2022-jp?B?cFV6M2pDZDVCbnJRNm51YWFlYnJxNzAySTRKU3pvT2ZYYm1heEFaU09s?=
 =?iso-2022-jp?B?SXFodnduNGh3a1lqdFVvVGw4T1hlZ0pRdlRydnVWWUZKM0lxdzVCM0Ry?=
 =?iso-2022-jp?B?UkNHRjBGVjJSRXQ4bG5xaWVHSlNYT0liQVlXaENNQkFzK1d3TDRNYlpz?=
 =?iso-2022-jp?B?eDFjcGJiazFxMmFyMnQ3ZE5pQlJxT3p4Q2xnUDJ5bU1Qc0Z4MnovSnhq?=
 =?iso-2022-jp?B?K2dQdkltRG5HYlJzT1EzeW1GYkNFQ2tKd1Y4eEE4eVl5Y05kR2psaVlz?=
 =?iso-2022-jp?B?YkQycHNwOExvRVhzdWZSLzhqRzZSeFY5M0tmOHBreXM0bmhiUlQ5THl4?=
 =?iso-2022-jp?B?VjZYb0g0cEloMnN0dGIvN3kzY1F1TVptUEdyWmlNV3M4NEsyNmxwaTJ5?=
 =?iso-2022-jp?B?a1M5WGVKRjNsYWpnVUxMQ2tDalEwL1RUWlVSRVdFK1ZFTU5iSWdQZk85?=
 =?iso-2022-jp?B?VWhGN2VrYUlaNithSXhvMlZtWERuS2I4Snk5NDZNLzJwSXdvNnV2UjZO?=
 =?iso-2022-jp?B?NDFFMmNiSmxDTk5HczgxL0t1T0cwVG1kS0kvQ2pPOFRlYTRJNS9rSWZL?=
 =?iso-2022-jp?B?L0JVUnpZWDhscnVURHk3dWl3eFYwS0F0YkRKZXFvZkZ2VkJETTJCTUk0?=
 =?iso-2022-jp?B?YStaNHhjWWlmaW1JdnluQ1B5MlNiWmROS2tpWHhUYUhIcm9RTG9kQVRK?=
 =?iso-2022-jp?B?L1cwN3pTSEhMNXNkMmxwTmx3TzZib3dTUHhHY250OWtzL3VDWGliT0dW?=
 =?iso-2022-jp?B?YUFrL2ZVdmtpQjRZSGFBN25lRVNVZTF3bDhLT2JnSitrbVZIQkNJZHVG?=
 =?iso-2022-jp?B?TXU3S2ZaOWdJYTVjQlJGVTdLTFpkK0lYdzFPTDdmMno1cUllZ2FLRlQ4?=
 =?iso-2022-jp?B?N0piREd1dkI1ZXJXSmhTZU1odVZLL0RsSFRSeWdRTnVraVEvWHZKTG5G?=
 =?iso-2022-jp?B?NUdKV0c5bUtKVTJUdGpBMWNkOENPOG03OXYvWFprT0I1MlZFczZKRFAv?=
 =?iso-2022-jp?B?OURDQlZwWWM4dFJxWm50MmhLODd4TWdpb0M0V1lCWDZvQTV0UWt1amt3?=
 =?iso-2022-jp?B?TERwK3F1aFBXTTh3RXo0bDRpUFA5Y1lLTTRUVVpFZ2dTa2ZKZ0tMNERJ?=
 =?iso-2022-jp?B?QktHazc0a3dnZi9GNFZrWEF4ZllRRXFCTmdUSXI3VE5Kd1R6UGo4c3BU?=
 =?iso-2022-jp?B?NzZuVmJRVnBHZ0krb3lZOXpoME5UUEdlNnFyQVg2aVF1eGVzQnljdzdv?=
 =?iso-2022-jp?B?SVlrQWxPV2YybitHUGRWTTI2cW8ySGRyemVuSkVMVUx5azVGZVJ0SUFN?=
 =?iso-2022-jp?B?czlqQ21wTUxHTXc5Mi9uRUJlNnhERkRqMTYvVXMrdHlONDF3VENjU0Ny?=
 =?iso-2022-jp?B?b1ZEMHVLZElkdjR0S2JVUzExcFRFVzZ5UFlTUT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Go66vEJS/cuxmT5Rm0dmvrjMrJz8Vxi9X4RuqFqWSJE62oVYpX3M+AxWhBbIUuN/VKldSRP2hMWBuQ9UjkzswesQy8jUiu55f/xQ7fUWuCxF81pKcAyRfQLUD2dq12MDOc7EQinB8T/DHy3/KHIRD2BvFfjNSpPRI/7gGVvQxk4AbEcmYKjrYUsfvYnqvnx7hJDrlozZbNrYRNmLQfj82TuSOra8SGze/SQ2zL7/aClGHIVV4H7Pi2294PsDfem+yGqKZ+ThpVpk4ohRNev10oRDUIK/8KvJFS2O6fJemmQ8b2KRgHDjHctag363ySMHCDt14w2jT8uv5cqTIixg6A==
X-OriginatorOrg: jp.honda
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYP301MB1158.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 528366a8-d5f9-4a59-e103-08df0295c7c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 10:44:03.4696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cc138ffb-9c4d-433b-b211-d4549ae62e8b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l2KBMG/Hr3ywrYi0LtmDr5qoevbS5mqc2jicUSli9YDXB41WLQxH0Uv+CWbdsWC7Ppd4qZlUMxJvvnZuGhuMwhbNjGcTFuD7BK3tNmi8OKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P301MB1895
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 10:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244226

_generate_git_purl() generates invalid PURLs of the form
`pkg:github/<owner>/<repo>@<rev>@<rev>`.
purl-spec only allows a single `@<rev>`.

oe.spdx_common.fetch_data_to_uri() already appends "@<rev>" to the
download location, and urlparse() leaves that suffix in parsed.path.
Therefore, the parsed repository name(`{repo}`) includes `@<rev>`.
So, need to strip the revision suffix before splitting out
the owner(`{owner}`) and the repository name(`{repo}`).

While here, replace str.replace(".git", "") with str.removesuffix() so
repository names that contain ".git" elsewhere are preserved.

Signed-off-by: Kazuyoshi Akiyama <kazuyoshi_akiyama@jp.honda>
---
 meta/lib/oe/spdx30_tasks.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index dac02e3784..b2f208e1f6 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -379,11 +379,14 @@ def _generate_git_purl(d, download_location, srcrev):
=20
     for domain, purl_type in git_purl_handlers.items():
         if hostname =3D=3D domain:
-            path =3D parsed.path.strip("/")
+            # oe.spdx_common.fetch_data_to_uri() appends "@<rev>" to the
+            # download location, which must not become part of the
+            # repository name
+            path =3D parsed.path.strip("/").partition("@")[0]
             path_parts =3D path.split("/")
             if len(path_parts) >=3D 2:
                 owner =3D path_parts[0]
-                repo =3D path_parts[1].replace(".git", "")
+                repo =3D path_parts[1].removesuffix(".git")
                 return f"{purl_type}/{owner}/{repo}@{srcrev}"
             break
=20
--=20
2.34.1


