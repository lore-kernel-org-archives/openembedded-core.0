Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82897CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:11:22 +0000 (UTC)
Received: from mx-relay33-hz1-if1.hornetsecurity.com (mx-relay33-hz1-if1.hornetsecurity.com [94.100.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37944.1781856676022001665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=q6PSVfQg;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.43, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate33-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=52.101.84.99, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=db3pr0202cu003.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=5VJV+3VZ79tRfitAujbwMAaZQcyPaZqQHhw3Er049/k=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1781856673;
 b=mtk7+yaNstbbwb9iF/htk1ih2JbSUkUoE2wK0znn9ZDG74aMj9Vf6eA+gFTpvEZeOLwZIvPJ
 r8lk8D5+hPhDKGtZ3vCV3e9+rMh59tNoSJy2wwHQfiMVTbyMh2Hrth6gVeIqK/WjEaQm/nYI8DE
 GLnhHQNgUrVSR3bemBnHIntxP4l+Rq8tzn53mqiJJEP8K+3CpPIQjqpqYfLpM2Jm/ELBwm4K/iL
 qOWjB9F5M0/Q7lxwY+PpCqawlVFzQw4h9jleNx5eaoCirCm36rwhBcJiKtDjo/MDZOXj5w7iGDA
 D7E1bDkHt0ladCZLE5I5iojScGINwHUxyJwtwA2I3cmzg==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1781856673;
 b=DIRa13MtpNULha2rV+5LYias3OO9e0BAAgSUkcpB81Bgz97yO/kLRxUim19vpB8WLQWX9J7r
 PPgrlch9QqDXHnworye5OiL8F3EUN2QyVF7z0j7Ue7sV4VeU5MBW6iu6+BPlKLkCAwP7LgMmCZa
 Rm0pMJn+N1HvXPXVnQLVi1VX4FHj65gwFZhEJ8kcNnJ02AS3NkDK5IGgUiJp27cAFaM4vxfW/kV
 j9YECyGr/OZtLwpjbeczluw4oSVF37gv5QLRnz/g4WJ4Oz72shSkmx7wQiMzITwg9W8JylKwkCY
 WNGFb4VzaA0Ly2UGg36UO/BKvDOYCCXd7lau4My+jlo2w==
Received: from mail-northeuropeazon11020099.outbound.protection.outlook.com ([52.101.84.99]) by mx-gate33-hz1;
 Fri, 19 Jun 2026 10:11:13 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/k7eIC8Lr1KQGI3jsiaUNMOnvRLYbQpu+CYswjO/C97M3lDkW6bCJIHSJanljULg/SkNmicb4AnJJd8k3V7XM1Y0QiXb3i4IHXCKCDo1jeYBwkuGH6oGWb4WQgZV/OAvjnsIcoi/Z5G8yg/YMJHFxHXNBG5C1NUdX6UzYP5A7DBBf4LFLE509TlLRTyw9dArbd+zRPJvMms+VeTug/P228y3kQOCHlMc/wWfZOlvoOr0d6dj1yRx+dvYgs05Rg4cxAtsqeacCWIwO06WXeG3XTWnmNjKYBhPg22ysTeaBWTWMfiP/vOl4p9t6a22rCiWf2aHwbNTw4VeLZW1nFesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VJV+3VZ79tRfitAujbwMAaZQcyPaZqQHhw3Er049/k=;
 b=dpA/XCrF3rMJ11f0m0YwemshNthqhiL4POvM9X4dG6TeOz976sfD1Htni5k4VHV3Jtj4pfzZ7/aePVTP0WRX4+sbCGu7uAG2182enD5F+2EwqJ92iQgMpXmtW9eh56I4G/WMMIc+/LsOhyHAwRX6UyyKtESmUL+nqEuLKH5nTXhsLq9gb46z4FA3UDHuwt35r3x6cecH4Jqy7sJPym5bD0Yg5pzY6pvghCHQ+P1BmCaEqQj6BtMerf1aMOYe11gP80y9dYK05TcP5fAzB1Gkx1QI6T20jfLslVkq0e8C6DOcCgw+ci6MfdkQqAKl+pz8ur9I+ZhR36ZEkp3g20liRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VJV+3VZ79tRfitAujbwMAaZQcyPaZqQHhw3Er049/k=;
 b=q6PSVfQgmVSUsg1IBHa3MiHmRcGNMqE3kq8PDlZXZZ+j0WSB1ZpdnWXbokzwtPWMK215wxiHB7GOwl5d1gpSA+9dgzUch/tfEX6uJW6UIBa7gqQNnP8zcVl0Q04c3LMyEOuCQ8nltakWa+muKd4LRJlhO+4VU5weQQjI4wj6R1C9gYsvUoQl76tP3hoCoBqC4ubhrDPK7YWt8XCoIi2VEQwOf3J07HWGIfu/7tBf5c4XPZ3m3kqS6GTSQGqK4q0ih9A7U8r5AuGEOJq2nFSciYdKW0aNDlGlcGmr2Jlau2FR0htFGP4XVgFVzOtcHFqdj2ATx677ceyqGD3v99T13w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AM7PPF74E3CA3DE.EURP192.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::654) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 08:11:04 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 08:11:04 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	Theo Gaige <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH v2] expat: patch CVE-2026-45186
Date: Fri, 19 Jun 2026 10:10:53 +0200
Message-ID: <20260619081053.796111-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <238113>
References: <238113>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0102.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::17) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|AM7PPF74E3CA3DE:EE_
X-MS-Office365-Filtering-Correlation-Id: 589c8ec6-e72a-4005-7906-08decdda4f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|376014|52116014|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	Uow7Zcq0KFq9/hrOI59yyM9IMMlopUVhewKNo4d2/OPjfcdE1d001elZPrT7jjfHAtzHXSO4m6xvFDZgQpQkgaasaUtYYMV58Ti3J7HWiRA0puXL1ibum8vK2DB7+NUthwqwn0wJ4DbOoupTmXzXaQ6jV+zA+dm6zOumddjgnxnHMxoLgzr92M+NpxH4b97UnxLOtPo5AzUvA1UrR5IH73A8Y+iNPCuPQCxngEosOaiZkQNluaXAdGA9AY/c4QcTdEdJ15ZkdLuaTISYXK92cR5hdFkJddnL0IKIiQEnORCBBnWPIZsd2ZxEWYqAWAs9h1VnTP9X3s7z3p1W5xgx/bkI8PW1IjtaN84QmzK0TUBWRQxUPG6ziKOUVYEV3dWymq/JkyPhKPM1kNKsLFbgyus1yFRMxp5GcSV3D4yoJucSH1bIDVRCh3WXajZ/lu4qlHTagsSxvkAGzA5zF9ppEbiEuV0v/iNs17s1s4fJXHw1uPuIyQE7EJWEN1FyQDJxSXAI1POrMIZxnqbhDOKvmFh2Ig9G+/rFRXfThvzEVLXZ5bztgEvQCgObJl1qMt+Cr7c6ibRioRieHstyiDciGrZ/Fmkvm6WPJFta9Vt6NxT1PsRrY6L8wYBHH8w+3PVw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(376014)(52116014)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t/ltJof5/dA6dWaVprmFQaVD/pJPwZduPvEPxCkIDlN6Mthn7qfmKSLINBqP?=
 =?us-ascii?Q?x44XgZ/lD2+xmqXpkHdsl7a/sZaVKn7kw8ix7CRD8A4yBGtbBKrrfnrRG1aG?=
 =?us-ascii?Q?f7D3AtsA8iwB/RQB6BLKqDbSUiNxmTUm/IsERptI3quzBqprLtGaalR3z0US?=
 =?us-ascii?Q?8Odm5PkjYZyZw6P1C8mzbUxqDNSG2E0KAXLHQduGJLRhLT5tEXXv+eE4/iDy?=
 =?us-ascii?Q?O789x9g3ixYQsdUGWpB75k7UqztzOito93Airwa0wKTlI/xY+RIfZAqRIXBG?=
 =?us-ascii?Q?h42ka2h2HIy03ycs4wnxSSQWIH3Q6bh8+S39vu5toFGLi8EaikOMxpz22vQA?=
 =?us-ascii?Q?NN9kspoJE9o418aF+d8Uqo4uFhFcNPJR7gu0ssIkF5N8yAvSG/e8k/3f0myt?=
 =?us-ascii?Q?fwvUWaYQM4s/+H0y6MRO3droa9BKA57iSxeEzuAR9mYXCGHdzgfXvgcP4+FQ?=
 =?us-ascii?Q?GFAw6gkbOnq97aUg008Tt7g0Vt4ufJHUTcw1/j52kJOS4LMsSZ/sUYLdjC+v?=
 =?us-ascii?Q?WsObniHDn8Lt4KLw9n9Q/JX6pP3ZX3BFEddTb5AO6VX9HAV4EVNe3DhS1WIG?=
 =?us-ascii?Q?Wfj4KIdLTEMoNuK4Ib85zZ79WmDHpTO1RFDVTdnefl/cMktBKLcUexcnM2eC?=
 =?us-ascii?Q?43Uwv3LAGaUmmOzs9rEXEXWUj00u0Wujl4V2AyOdqtPlZYOOP+ADPbYUz7Ii?=
 =?us-ascii?Q?0DGaD4BFnHaFU8MwYHon2bkdd9JqIVyHAtJsj5aI9KOFFIp9zbzRKyya4p2i?=
 =?us-ascii?Q?JXIta2wU4vjppNlYuy9xOF5mzXAHg87B7VBe9iywAytS1wLkaGbnmPPAcJ+J?=
 =?us-ascii?Q?bGz6nkc4vkPagT8BNlSjyYkFefzrtwQP6u5zHrqDMi17QFJiuDth+HbfUWPG?=
 =?us-ascii?Q?WQFCP8NDl6m0B90jjedJ0MfnrYEIOF4bnzC5jW9ZB2ArlyxomHVTjlUHOCK7?=
 =?us-ascii?Q?RKmiyf1Yy+ibuGBnDzAHtV6ul9r8wZQ6GufIT7iTOfhxUMcspuEiJ3WVsc+B?=
 =?us-ascii?Q?4/M4Ji1cAa/ZRwYBJO/mUAJz8pT386lS/98t9LizFn079wSqJWJt4UYxLUSJ?=
 =?us-ascii?Q?gBLfM/ba2upeawxUz5bN3i5WKeYJ+PQjg+yH0qq8BLjQlrgFg+YWVS0ytb8m?=
 =?us-ascii?Q?gaccM4qgN44cHkrPd0qwi0UaYS4pAZM2+j/r9IQJcyqeX1DzMrt1+ot+/4fj?=
 =?us-ascii?Q?UJCTYnxfRD0ocpdF+sKgRYA7ILa4lnkSGolq+5tHsJ/pbCn8NOTTuMvGJwuw?=
 =?us-ascii?Q?ZtXyMKQ8Oe6tGHXMdKccDSgKuHQmX28fJsoWV54+qk8UT9s7ckTL2dN9iWMn?=
 =?us-ascii?Q?0vV6QrFs30NmEp2k8a1QbfZr1mMvf2k3i6ZXYXJ6wNMRpJwfWElHPwSfNXps?=
 =?us-ascii?Q?9n/dCri5nQsmfNv+7Q3RVNsbTZg2Lr92EguXhNDVx1QszYjOFR472+PUKQgi?=
 =?us-ascii?Q?6sNFZeOX3Qxp3LotJ5ASbFzTmXJaMX4pXpYFA4ox7EsvVFHsR4JC/ABCWbEU?=
 =?us-ascii?Q?hjU9v9TXpLtbWwIAvmOom92R6BetjPu6KOHwqGqW/zkusLvk8trp54RYdDWZ?=
 =?us-ascii?Q?eu1nOeDnIYLi1FoEJblSFVSQpn+YvS8IusVYkPU8iOBWiqw0fiLQp1MZ7LRe?=
 =?us-ascii?Q?MKpQQunMWQuqsnjcP82GgRAZKP8tJtAuzN+RFzPkpcajna31BuPVC2WE/vFw?=
 =?us-ascii?Q?DRwtnwnXJt9Oi2T9eaFcKnMBIAk6s93SBb6sKueKeCuP5WsLhXlLVVfpS2HW?=
 =?us-ascii?Q?Xkfr/ga2u4N98fjrvoh7EpKHjpgmryM0CYsP0vduF6hwQHygHHvkcYVPFfzG?=
X-MS-Exchange-AntiSpam-MessageData-1: +szCqWOqmPO7jg==
X-Exchange-RoutingPolicyChecked: 
	mLzUH2euatqNrgN4Mda3ZJ1VR8Za0qR8bGiDpJ0YD2gnl6/d6ysuIKlxYO+tpMlvxZLMOO3UWTDdSy7suGWTphoIlpCVpnIisEPFk8QC9a5yS+UpSQdtkwaeW7qC+tfiY4G8vzrplEDSnDFS8oBaG6KMkFtVD801bqcmW8BB+zHsPcl4sMl7IqNGvRByB3ljafLg9sMufXzN5UfkPFNAYN4OYzFSH/1drjIQuWk3nFUqRVDGNDF5k2xnNXcmkN8Jb7dwWIYvTurt84Uskr5on1HnF7N4aJ6HBPWx6yTqExhuXwYiIe8pTxlp9G7KKWAFqmDUZD/ZN2OUBf1CwT0ZoA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	uK4HNPZbzm1EHblshcb/NUzsqBsSEwJb6R9ZUUP7X//NRHNgPCFJ78LgzX++K7Z7zy/poE4ppXi1IuoSZtQDdeeQ6IIbsKHgrTws8h6lnj4IuxfpdiWRr6EI/c5bdddqo4NJaSrm/R2a1d0UlCsZYU0argM46nsB+r6Sz/EATlBvUm4UM0C3A7fFxmHIMFH9uv8e0B96zhcIA1Zn51jhU/HL3HZWINZEatpQs7Kch+wpnufxE9Kxlb5AjmRlVpgEdNLF2MWkYJuNFKY+Nk6rKmz7O1Gmut2nOgY8x2VgJPSmn9PxjwEyAOJAddhzFTlDm0qgCo+7IblmLntur+H0vO7gDORr3RduSGaY7n6WQkwe+3w7Ouea/kFHrh8KLSDpLXSllfUHa6072BXubjbp2l6mvhKEYOLiCwzuPAs15Vzbyeguz++FeNTLpBySF8pZv8OIkxDf4TiaFdwiTmdK8yyXiXJIPP2iSGIbvxBSzy2OV5kwUrxdvG5K86Zmmtr1ptGfrpjedtGIP6rfXLym41HKSeC/Kg0iHoxhYpYwL1/Mda2VFgH+E2VrwLSxSCud3uEkFUMykEbiyLdB6Crw3xq8q/MpT3w/+jUdOl3qe7vPHHebkqP2eGPAI/oCMmFg
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 589c8ec6-e72a-4005-7906-08decdda4f0f
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 08:11:04.7614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6QkfVsih0OivRv48m3gfcwDMBtQDrpsv28xzi1cy8iWyj6wvsKoWJH2FuU9ml8YaWc2KmEC8ihkB1b3zQPqdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPF74E3CA3DE
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate33-hz1 with 4ghVfP0C9qz42cJD
X-cloud-security-connect: mail-northeuropeazon11020099.outbound.protection.outlook.com[52.101.84.99], TLS=1, IP=52.101.84.99
X-cloud-security-Digest: a5a41ede4f8c0da5a1ba3a872ce9b180
X-cloud-security: scantime:1.342
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239134

From: Theo Gaige <tgaige.opensource@witekio.com>

Backport patches from [1] also mentioned in [2].

[1] https://github.com/libexpat/libexpat/pull/1216
[2] https://security-tracker.debian.org/tracker/CVE-2026-45186

Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 .../expat/expat/CVE-2026-45186-01.patch       |  70 ++++
 .../expat/expat/CVE-2026-45186-02.patch       | 318 ++++++++++++++++++
 .../expat/expat/CVE-2026-45186-03.patch       |  46 +++
 .../expat/expat/CVE-2026-45186-04.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-05.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-06.patch       |  87 +++++
 .../expat/expat/CVE-2026-45186-07.patch       |  52 +++
 meta/recipes-core/expat/expat_2.6.4.bb        |   7 +
 8 files changed, 644 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-07.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
new file mode 100644
index 0000000000..787006c0fd
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
@@ -0,0 +1,70 @@
+From 3020144133b2d860c44f4eeacf72e5f2843235a3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Berkay=20Eren=20=C3=9Cr=C3=BCn?= <berkay.ueruen@siemens.com>
+Date: Fri, 13 Mar 2026 13:26:45 +0100
+Subject: [PATCH 1/7] Make "counting_start_element_handler" count default attrs
+
+(cherry picked from commit 0802a5892030610144b736dec6e2f63e8600fe85)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/0802a5892030610144b736dec6e2f63e8600fe85]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/basic_tests.c | 8 ++++----
+ tests/handlers.c    | 2 +-
+ tests/handlers.h    | 1 +
+ 3 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 023d9ce..d6edb16 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2439,9 +2439,9 @@ START_TEST(test_attributes) {
+                          {XCS("id"), XCS("one")},
+                          {NULL, NULL}};
+   AttrInfo tag_info[] = {{XCS("c"), XCS("3")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("doc"), 3, XCS("id"), NULL},
+-                        {XCS("tag"), 1, NULL, NULL},
+-                        {NULL, 0, NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), NULL},
++                        {XCS("tag"), 1, 0, NULL, NULL},
++                        {NULL, 0, 0, NULL, NULL}};
+   info[0].attributes = doc_info;
+   info[1].attributes = tag_info;
+ 
+@@ -5496,7 +5496,7 @@ START_TEST(test_deep_nested_attribute_entity) {
+            (long unsigned)(N_LINES - 1));
+ 
+   AttrInfo doc_info[] = {{XCS("name"), XCS("deepText")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("foo"), 1, NULL, NULL}, {NULL, 0, NULL, NULL}};
++  ElementInfo info[] = {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, NULL, NULL}};
+   info[0].attributes = doc_info;
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+diff --git a/tests/handlers.c b/tests/handlers.c
+index e658223..9ff7b35 100644
+--- a/tests/handlers.c
++++ b/tests/handlers.c
+@@ -137,7 +137,7 @@ counting_start_element_handler(void *userData, const XML_Char *name,
+     fail("ID does not have the correct name");
+     return;
+   }
+-  for (i = 0; i < info->attr_count; i++) {
++  for (i = 0; i < info->attr_count + info->default_attr_count; i++) {
+     attr = info->attributes;
+     while (attr->name != NULL) {
+       if (! xcstrcmp(atts[0], attr->name))
+diff --git a/tests/handlers.h b/tests/handlers.h
+index ac4ca94..11d45eb 100644
+--- a/tests/handlers.h
++++ b/tests/handlers.h
+@@ -88,6 +88,7 @@ typedef struct attrInfo {
+ typedef struct elementInfo {
+   const XML_Char *name;
+   int attr_count;
++  int default_attr_count;
+   const XML_Char *id_name;
+   AttrInfo *attributes;
+ } ElementInfo;
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
new file mode 100644
index 0000000000..fef531a439
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
@@ -0,0 +1,318 @@
+From ba12af3b3ffd98b9e31c3a01a20d392c89aa974e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Berkay=20Eren=20=C3=9Cr=C3=BCn?= <berkay.ueruen@siemens.com>
+Date: Fri, 13 Mar 2026 13:27:31 +0100
+Subject: [PATCH 2/7] test(attlist): Cover duplicate attribute names
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+(cherry picked from commit e569f47181c43dca5d262089e541ddf9a9c09927)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/e569f47181c43dca5d262089e541ddf9a9c09927]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/basic_tests.c | 282 ++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 282 insertions(+)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index d6edb16..907a458 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2462,6 +2462,279 @@ START_TEST(test_attributes) {
+ }
+ END_TEST
+ 
++START_TEST(test_duplicate_cdata_attribute) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one definition is provided for the same attribute of a given
++    element type, the first declaration is binding and later declarations are
++    ignored.
++  */
++
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc attribute CDATA 'expected' attribute CDATA 'ignored'>\n"
++        "]>\n"
++        "<doc/>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected")}, {NULL, NULL}};
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_id_attribute_1) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one definition is provided for the same attribute of a given
++    element type, the first declaration is binding and later declarations are
++    ignored.
++  */
++
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc identifier CDATA 'expected' identifier ID #REQUIRED>\n"
++        "]>\n"
++        "<doc/>\n";
++  AttrInfo doc_info[] = {{XCS("identifier"), XCS("expected")}, {NULL, NULL}};
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_id_attribute_2) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one definition is provided for the same attribute of a given
++    element type, the first declaration is binding and later declarations are
++    ignored.
++  */
++
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc identifier ID #REQUIRED identifier CDATA 'unexpected'>\n"
++        "]>\n"
++        "<doc/>\n";
++  AttrInfo doc_info[] = {{NULL, NULL}};
++
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 0, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ATTLIST doc attribute CDATA 'expected'>\n"
++                     "  <!ATTLIST doc attribute CDATA 'ignored'>\n"
++                     "]>\n"
++                     "<doc/>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected")}, {NULL, NULL}};
++  ElementInfo info[]
++      = {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl_2) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ATTLIST doc attribute CDATA 'expected_doc'>\n"
++                     "  <!ATTLIST tag attribute CDATA 'expected_tag'>\n"
++                     "  <!ATTLIST doc attribute CDATA 'ignored_doc'>\n"
++                     "]>\n"
++                     "<doc><tag></tag></doc>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected_doc")}, {NULL, NULL}};
++  AttrInfo tag_info[] = {{XCS("attribute"), XCS("expected_tag")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 0, 1, NULL, doc_info},
++                        {XCS("tag"), 0, 1, NULL, tag_info},
++                        {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl_3) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text
++      = "<!DOCTYPE doc [\n"
++        "  <!ATTLIST doc attribute CDATA 'expected_doc'>\n"
++        "  <!ATTLIST tag attribute CDATA 'expected_tag'>\n"
++        "  <!ATTLIST doc second_attribute CDATA 'second_expected_doc' attribute CDATA 'ignored_doc'>\n"
++        "]>\n"
++        "<doc><tag></tag></doc>\n";
++  AttrInfo doc_info[] = {{XCS("attribute"), XCS("expected_doc")},
++                         {XCS("second_attribute"), XCS("second_expected_doc")},
++                         {NULL, NULL}};
++  AttrInfo tag_info[] = {{XCS("attribute"), XCS("expected_tag")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 0, 2, NULL, doc_info},
++                        {XCS("tag"), 0, 1, NULL, tag_info},
++                        {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
++START_TEST(test_duplicate_id_attribute_multiple_attlistdecl) {
++  /*
++  https://www.w3.org/TR/xml/#attdecls
++
++  Test the following statement from the linked specification:
++    When more than one AttlistDecl is provided for a given element type,
++    the contents of all those provided are merged.
++  */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ATTLIST doc identifier ID #REQUIRED>\n"
++                     "  <!ATTLIST tag identifier CDATA 'identifier_tag'>\n"
++                     "  <!ATTLIST doc identifier CDATA 'ignored'>\n"
++                     "]>\n"
++                     "<doc identifier='doc_identity'><tag></tag></doc>\n";
++  AttrInfo doc_info[]
++      = {{XCS("identifier"), XCS("doc_identity")}, {NULL, NULL}};
++  AttrInfo tag_info[]
++      = {{XCS("identifier"), XCS("identifier_tag")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("doc"), 1, 0, XCS("identifier"), doc_info},
++                        {XCS("tag"), 0, 1, NULL, tag_info},
++                        {NULL, 0, 0, NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++
++  ParserAndElementInfo parserAndElementInfos = {
++      parser,
++      info,
++  };
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserAndElementInfos);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ /* Test reset works correctly in the middle of processing an internal
+  * entity.  Exercises some obscure code in XML_ParserReset().
+  */
+@@ -6325,6 +6598,15 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test__ifdef_xml_dtd(tc_basic, test_empty_foreign_dtd);
+   tcase_add_test(tc_basic, test_set_base);
+   tcase_add_test(tc_basic, test_attributes);
++  tcase_add_test(tc_basic, test_duplicate_cdata_attribute);
++  tcase_add_test(tc_basic, test_duplicate_id_attribute_1);
++  tcase_add_test(tc_basic, test_duplicate_id_attribute_2);
++  tcase_add_test(tc_basic, test_duplicate_cdata_attribute_multiple_attlistdecl);
++  tcase_add_test(tc_basic,
++                 test_duplicate_cdata_attribute_multiple_attlistdecl_2);
++  tcase_add_test(tc_basic,
++                 test_duplicate_cdata_attribute_multiple_attlistdecl_3);
++  tcase_add_test(tc_basic, test_duplicate_id_attribute_multiple_attlistdecl);
+   tcase_add_test__if_xml_ge(tc_basic, test_reset_in_entity);
+   tcase_add_test(tc_basic, test_resume_invalid_parse);
+   tcase_add_test(tc_basic, test_resume_resuspended);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
new file mode 100644
index 0000000000..2afe6dbebc
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
@@ -0,0 +1,46 @@
+From 852ab610685b45c62017556c38096d941c154963 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 20 Apr 2026 13:44:43 +0200
+Subject: [PATCH 3/7] tests: Define .attributes the first time around
+
+(cherry picked from commit 05307d352a5aa858cdda57ec53a53b597b3a4a82)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/05307d352a5aa858cdda57ec53a53b597b3a4a82]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/basic_tests.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 907a458..b0178fc 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2439,11 +2439,9 @@ START_TEST(test_attributes) {
+                          {XCS("id"), XCS("one")},
+                          {NULL, NULL}};
+   AttrInfo tag_info[] = {{XCS("c"), XCS("3")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), NULL},
+-                        {XCS("tag"), 1, 0, NULL, NULL},
++  ElementInfo info[] = {{XCS("doc"), 3, 0, XCS("id"), doc_info},
++                        {XCS("tag"), 1, 0, NULL, tag_info},
+                         {NULL, 0, 0, NULL, NULL}};
+-  info[0].attributes = doc_info;
+-  info[1].attributes = tag_info;
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+   assert_true(parser != NULL);
+@@ -5769,8 +5767,8 @@ START_TEST(test_deep_nested_attribute_entity) {
+            (long unsigned)(N_LINES - 1));
+ 
+   AttrInfo doc_info[] = {{XCS("name"), XCS("deepText")}, {NULL, NULL}};
+-  ElementInfo info[] = {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, NULL, NULL}};
+-  info[0].attributes = doc_info;
++  ElementInfo info[]
++      = {{XCS("foo"), 1, 0, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}};
+ 
+   XML_Parser parser = XML_ParserCreate(NULL);
+   ParserAndElementInfo parserPlusElemenInfo = {parser, info};
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
new file mode 100644
index 0000000000..f4c7733c70
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
@@ -0,0 +1,32 @@
+From 89c6acdcd919b64014b180fadec46b0d25760832 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 13 Apr 2026 01:34:03 +0200
+Subject: [PATCH 4/7] tests: Make counting_start_element_handler enforce
+ complete attribute lists
+
+(cherry picked from commit 4176aff73840711060913e0ac6aa1168d8ba5c8d)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/4176aff73840711060913e0ac6aa1168d8ba5c8d]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ tests/handlers.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tests/handlers.c b/tests/handlers.c
+index 9ff7b35..5e72e8b 100644
+--- a/tests/handlers.c
++++ b/tests/handlers.c
+@@ -155,6 +155,9 @@ counting_start_element_handler(void *userData, const XML_Char *name,
+     /* Remember, two entries in atts per attribute (see above) */
+     atts += 2;
+   }
++
++  // Self-test that the test case's list of expected attributes is complete
++  assert_true(atts[0] == NULL);
+ }
+ 
+ void XMLCALL
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
new file mode 100644
index 0000000000..480f941cb6
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
@@ -0,0 +1,32 @@
+From d352c83afaa3945c964aba74cb60a00822af96d3 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 8 Mar 2026 22:14:41 +0100
+Subject: [PATCH 5/7] lib: Extract a constant for upcoming reuse
+
+(cherry picked from commit fb35f2d2040d114f355bae8a7450942533237530)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/fb35f2d2040d114f355bae8a7450942533237530]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 9bc67f3..8d3e8db 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7708,8 +7708,9 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+       newE->prefix = (PREFIX *)lookup(oldParser, &(newDtd->prefixes),
+                                       oldE->prefix->name, 0);
+     for (i = 0; i < newE->nDefaultAtts; i++) {
++      const XML_Char *const attributeName = oldE->defaultAtts[i].id->name;
+       newE->defaultAtts[i].id = (ATTRIBUTE_ID *)lookup(
+-          oldParser, &(newDtd->attributeIds), oldE->defaultAtts[i].id->name, 0);
++          oldParser, &(newDtd->attributeIds), attributeName, 0);
+       newE->defaultAtts[i].isCdata = oldE->defaultAtts[i].isCdata;
+       if (oldE->defaultAtts[i].value) {
+         newE->defaultAtts[i].value
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
new file mode 100644
index 0000000000..d39eb91f2f
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
@@ -0,0 +1,87 @@
+From a2c8ddb3d6f4df7af64e05bed4b3a4edeae33fd0 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 8 Mar 2026 23:05:49 +0100
+Subject: [PATCH 6/7] lib: Introduce ELEMENT_TYPE.defaultAttsNames
+
+(cherry picked from commit 7f0f1b9e70d937072d2e9e37ae9edf27784cc080)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/7f0f1b9e70d937072d2e9e37ae9edf27784cc080]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 8d3e8db..4a29c18 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -388,6 +388,7 @@ typedef struct {
+   int nDefaultAtts;
+   int allocDefaultAtts;
+   DEFAULT_ATTRIBUTE *defaultAtts;
++  HASH_TABLE defaultAttsNames;
+ } ELEMENT_TYPE;
+ 
+ typedef struct {
+@@ -3844,6 +3845,8 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+                                          sizeof(ELEMENT_TYPE));
+     if (! elementType)
+       return XML_ERROR_NO_MEMORY;
++    if (! elementType->defaultAttsNames.parser)
++      hashTableInit(&(elementType->defaultAttsNames), parser);
+     if (parser->m_ns && ! setElementTypePrefix(parser, elementType))
+       return XML_ERROR_NO_MEMORY;
+   }
+@@ -7549,6 +7552,7 @@ dtdReset(DTD *p, XML_Parser parser) {
+     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
+     if (! e)
+       break;
++    hashTableDestroy(&(e->defaultAttsNames));
+     if (e->allocDefaultAtts != 0)
+       FREE(parser, e->defaultAtts);
+   }
+@@ -7590,6 +7594,7 @@ dtdDestroy(DTD *p, XML_Bool isDocEntity, XML_Parser parser) {
+     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
+     if (! e)
+       break;
++    hashTableDestroy(&(e->defaultAttsNames));
+     if (e->allocDefaultAtts != 0)
+       FREE(parser, e->defaultAtts);
+   }
+@@ -7683,6 +7688,10 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+                                   sizeof(ELEMENT_TYPE));
+     if (! newE)
+       return 0;
++
++    if (! newE->defaultAttsNames.parser)
++      hashTableInit(&(newE->defaultAttsNames), parser);
++
+     if (oldE->nDefaultAtts) {
+       /* Detect and prevent integer overflow.
+        * The preprocessor guard addresses the "always false" warning
+@@ -7719,6 +7728,12 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+           return 0;
+       } else
+         newE->defaultAtts[i].value = NULL;
++
++      NAMED *const nameAddedOrFound = (NAMED *)lookup(
++          parser, &(newE->defaultAttsNames), attributeName, sizeof(NAMED));
++      if (! nameAddedOrFound) {
++        return 0;
++      }
+     }
+   }
+ 
+@@ -8458,6 +8473,8 @@ getElementType(XML_Parser parser, const ENCODING *enc, const char *ptr,
+                                sizeof(ELEMENT_TYPE));
+   if (! ret)
+     return NULL;
++  if (! ret->defaultAttsNames.parser)
++    hashTableInit(&(ret->defaultAttsNames), getRootParserOf(parser, NULL));
+   if (ret->name != name)
+     poolDiscard(&dtd->pool);
+   else {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch b/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
new file mode 100644
index 0000000000..26c829b522
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
@@ -0,0 +1,52 @@
+From 0e4829f4be500ce687b37ec82f9650b86c8419c7 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 8 Mar 2026 23:06:29 +0100
+Subject: [PATCH 7/7] lib: Leverage ELEMENT_TYPE.defaultAttsNames for attribute
+ collision detection
+
+.. to resolve quadratic runtime behavior
+
+(cherry picked from commit 4cd4eb0683e04cd45a2ffc81a08ca2a2663994b5)
+
+CVE: CVE-2026-45186
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1216/commits/4cd4eb0683e04cd45a2ffc81a08ca2a2663994b5]
+Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
+---
+ lib/xmlparse.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 4a29c18..b3f0b73 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7177,10 +7177,10 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+   if (value || isId) {
+     /* The handling of default attributes gets messed up if we have
+        a default which duplicates a non-default. */
+-    int i;
+-    for (i = 0; i < type->nDefaultAtts; i++)
+-      if (attId == type->defaultAtts[i].id)
+-        return 1;
++    NAMED *const nameFound
++        = (NAMED *)lookup(parser, &(type->defaultAttsNames), attId->name, 0);
++    if (nameFound)
++      return 1;
+     if (isId && ! type->idAtt && ! attId->xmlns)
+       type->idAtt = attId;
+   }
+@@ -7227,6 +7227,12 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+   att->isCdata = isCdata;
+   if (! isCdata)
+     attId->maybeTokenized = XML_TRUE;
++
++  NAMED *const nameAddedOrFound = (NAMED *)lookup(
++      parser, &(type->defaultAttsNames), attId->name, sizeof(NAMED));
++  if (! nameAddedOrFound)
++    return 0;
++
+   type->nDefaultAtts += 1;
+   return 1;
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 151720a9e3..da9419dda9 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -51,6 +51,13 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-32777-02.patch \
            file://CVE-2026-32778-01.patch \
            file://CVE-2026-32778-02.patch \
+           file://CVE-2026-45186-01.patch \
+           file://CVE-2026-45186-02.patch \
+           file://CVE-2026-45186-03.patch \
+           file://CVE-2026-45186-04.patch \
+           file://CVE-2026-45186-05.patch \
+           file://CVE-2026-45186-06.patch \
+           file://CVE-2026-45186-07.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.43.0


