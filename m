Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE6AC88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 10:27:07 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36591.1789122423886028783
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 03:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PcnKJ9Ig;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PcnKJ9Ig;
 spf=pass (domain: arm.com, ip: 52.101.83.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e3fY4+6Yi1gHaVs4HHvfsCmceLy0GRQ3FezvRatf0+5+EZaNEJJD14dddH4Rex1T03TXGapTgptRi7laL7glsQBJxmMPpfPumpWNkCH32TmMqtj07BtQJhivMPd9fHv3Iwn9SOXLL8MpXbebjW/GSTQpl+E0x6QX9YPECDH2JiI8GOTMT37wQEAQ8Qvh++STOCVLWSu4F/M41WTkiGaeuHuV6zXrartu0d6UnlItDmh2+egh5JvW76SxzkYfG6+mZGELMrPo+LEGmG1VjBWNaKnWR4BqK9B25o3FGmPaQio/ZhURUZdFiC3krJsI+O38rzviP3DuZdZQSzvqIdutPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsxvKex/Xanyttnl8sfqigvTfmf/8tzryOjNs7FuPvs=;
 b=SH3FXY8tG90wgdoRn5mhkH9I//PdT1CChLzbjFYpT2r5tna7t4Dgof7Oy6JUzuv1Ri6wD7lMfhTbnRzm82iRWH3IMNzgAYgTCMtJ15xrgY4CxXgcmpR8771/dwljtDl/Ij4QGIeX44ci4yXl2IF05NQ6/Px+YgNBXrPQJihPujL9jc4+XPgH67fstFS+U9qoIMLoJsGDSTePWiNfFpTjYHsemlhfWjMWLM8iP3RvBpVfszWILnJetQB1n1kmn8qV4sr+yKo6YX3CHmD89H9fdRyU+8iqAFok2ogX76yllqsrXKv6+8Z+LbpzAo92qCN9+wvB5hFBAsag/7azj/LrUQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsxvKex/Xanyttnl8sfqigvTfmf/8tzryOjNs7FuPvs=;
 b=PcnKJ9Igj/GmjrXXoxXTKrnyEc4zRpcqKugdX813hMFcZnXcnJkU7Gqfp6NoYiPFUkO5SqeIUBYBdipi1V/cfdrGyjgBwtzawcFLwwaV5wdfwgkC+Dn8dw1F6LB+Y5NnAEDzcG7fZnHHKiUWSufLGqviKuDPvYJnBtaGATDJi3U=
Received: from AS4P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::17)
 by PA4PR08MB5917.eurprd08.prod.outlook.com (2603:10a6:102:f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 10:26:57 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::46) by AS4P190CA0028.outlook.office365.com
 (2603:10a6:20b:5d0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 10:26:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Fri, 11 Sep 2026 10:26:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFBF7TbzCLy66HH5vZq4aJBvSyNfhyLuzo61ItPmHnSUhWeOEhbHhHgK+F3xG4PkRqr4xzceZrfVgg4aIXpwI3/xvk8lHugHN4U2fqr9FyqL1ociUe54cgIJhEEn07EQqCeLZElOqvC5WDcI9OXsqWDrfqLTQUTYL+6rSnE7jBgBN+Zl/50thzQPMQEd2cq9Jc2FNQfmDiLygI3WPEsfSIDUWu/u4isCJPc3+SXVbf0DedCLe4sb0c7G3wDfkkXWy5Hb1R36CTnJ/5FSdhdkJEwdXnid3LdRqC1g0aiadVSCACS4YuIvdOYDg8SbduUfJiDFrRKDFgqdxZZG0bdpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsxvKex/Xanyttnl8sfqigvTfmf/8tzryOjNs7FuPvs=;
 b=L9hQyLeV9XDabaLvaLwGsNgzFTtLnL+ayQ9nNfN6kh6OHp2KfIl1kik8oooBSVBtT0dbiC2yxXqxbP0FCmecwyV8lBmSA4+RK6BlWmcQ/pB2qYyQbXQPEr97w5gYia9Vf/7ly8u3+T/WHOTZhvSUfjxhVmuBEsJoTLAb6f9h4N0NOSmKs9U4If5yKXcdOJaLMIr4gWt3b7sm7qB1rxOus2LqWxUu64Fm9Pk9dgoQndr3DhIWgNH8HJNGOzzyb8VZfivpNBzqkBTS8T7mRtAnkTFgjrdcTd2t0xTK0c4J+PCjVyPIuQhcFUJ29OTwrJfT86eZAG0NrA8zk88+NbI1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsxvKex/Xanyttnl8sfqigvTfmf/8tzryOjNs7FuPvs=;
 b=PcnKJ9Igj/GmjrXXoxXTKrnyEc4zRpcqKugdX813hMFcZnXcnJkU7Gqfp6NoYiPFUkO5SqeIUBYBdipi1V/cfdrGyjgBwtzawcFLwwaV5wdfwgkC+Dn8dw1F6LB+Y5NnAEDzcG7fZnHHKiUWSufLGqviKuDPvYJnBtaGATDJi3U=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAVPR08MB9676.eurprd08.prod.outlook.com (2603:10a6:102:31f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 10:26:22 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0428.004; Fri, 11 Sep 2026
 10:26:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [AUH] python3-hatchling: upgrading to 1.32.0 FAILED
Thread-Topic: [OE-core] [AUH] python3-hatchling: upgrading to 1.32.0 FAILED
Thread-Index: AQHdQbqAH05cjzhiH0O+BZkAWUyT9rbJLHcA
Date: Fri, 11 Sep 2026 10:26:20 +0000
Message-ID: <A116B54B-95E1-4A79-9215-7285F321F819@arm.com>
References: 
 <010101a08f3ee807-cdacf650-dad7-42bd-8ee1-67678698347f-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101a08f3ee807-cdacf650-dad7-42bd-8ee1-67678698347f-000000@us-west-2.amazonses.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAVPR08MB9676:EE_|DB5PEPF00014B9F:EE_|PA4PR08MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d59d68-0317-44e1-68a3-08df0fef34ba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|4022899009|23010399003|376014|366016|22082099003|18002099003|38070700021|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info-Original: 
 z2VBo/ROQLO3KR1s2Mw/NBbFeXpMGh4FNNIz3ghaqE4/h5bWwt3c5t37UN3Ue6hBvLWWZPgitbRc1HDkfInFUVcoVazj76f2XklxKT2Z2UsunOCaO8xMt5a/7+g1ioXgQ/elGzidGCwW3QXg8lK3QySX+USF0PbT8O9kTVUilOhKuJQ8f9r282gsjN2KqRf59l0qNbYUMAOtYIUlR6ZVKQ0sIvIOWUGl1i5O6DT9nyOintic+L94tBMGZbpn9wtx7VnxHU/jGu2ezdseGXkCPff/b5kM+rEgdfeFPrvjJ4/rCnx72Dqt/xQdxVx6KOb3Uq1f0wW2JE9nAvv9LNJP11t4tI/nLZDG+rn4wqw5D9zOjW6vmpE80Lxi4NS8y4nGKiOjDgmpUz2O3tIax313bA3cBhJHNPhaEIqp4RMQVygnkfGAY3khC+FPltbA/XGI0LWHnct2JspwDp32djDIQHHMFA6WPzvM7NIgGqEetfhx8MVkLWrGtDxWJOR3KSPzZ3+arr18QmNX0838AgTd1GqJAYmWstf69w0YpZD+2mgHfBRA36tt2pXSWtuT3aWKEL91wp+5nFotIugbwpOlc8m+nKem+q6yAP4RVf+Y0qScbD/VH24HlUuS1lNHqptF/cdMrJ112fvzGjPREmE0Lix8ecSCLezpZ1l6amO/voA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(23010399003)(376014)(366016)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <210C435913C65343861538B94FCF2A71@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 V6mGfJODsso7bEr6yxLYg8FihhKq1TsUQ5IH3ljx7vlJYupFUy4ZZzYjziQXzPmRZelv7T7Y+skzMGX2pkshZmlgpz4gZbWQ4YyMFUyzgW+zJ9hRy5Qb7ZU3Tzzo5fAJpeB49ULsMf3SJR8SacJzKxy5PKyilwOVXVMd22TlNHM7XqGRI2O5y3gEqbnkhU+dCOh3LHpIiocl0moN8W3MpDiWy89sE/2VK6x7p/n9kRV8f/84MJtLrjG6iXH6WNV+uZ0DZl3/PYppxxO9wtbyJWYobhgBAG4lLWyevNb5ELOYkxMhBHQ+V63aaIUcphtyoQSc/WYWgQhT9onmLVAgrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9676
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e19f74c1-3086-4877-5e16-08df0fef1f7d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|14060799003|36860700016|35042699022|82310400026|1800799024|23010399003|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	o6M1ZOVL9EueaYUdUBmrCtxSba2bU7U23+XrG/DSDmxXfPDVqJBJRjZVcpTtDB8PfDTNwPp422qpl00ZnkB5ad7w7Aj25DWNdT6bTAOoAr4U0ntAgtTKXkPDmlaEStZ+Da8fF/HPGtlIAnzv2LkRHybk85HjyOztXwCRYqc4x8fq5qWqGRbKKNP9qA+t9DfsSe05xVduXMF6Pa9DI/ChryfqYGdgMUr752Fj0vl4+9Dp7KNNGt2jayBI/5LuEBtWNRyW8DP2sov+HQ/N0G6ls2BG9ejSbizg5A5NeRrCL2xtHvuL/3tUwpyLXNQ4F36HhNutMZVwBGOjZIkSe16mO2mtRSZigD3pQI/QTwqD7RN+1j+GvApwmYrywiWn/19mTlJlSUG8NrhK/Q/vVT6n2GNxPTf2761qBmPhvBTYb1Mzo6+fFhm89GZ+bhYsfFKBZ5DpB611xAy8kXijWrzaHhEjrq0g/6aXg73QSRcHx2sfWVL7xDELzUk/INRUBd1wGEXrk2+jxvsZ/9Z20IVHxzQ+wG+gp86S9vm8oRY4n99jfMTjgYLSFd36uDoiowjLFrynAIo9qdyXZ3gbX3ndSnQvMfs2NSNrQjR0ddLMnwkseFCAJ22LesCyHVehAp0WLkjWY4BJQBidg46jNX61wg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(376014)(14060799003)(36860700016)(35042699022)(82310400026)(1800799024)(23010399003)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2WiY7JiTHwNo1LTWhrZI0JID8dOARYVp/MfdLUCacrorFioZyWTvt07yn9rwCeNypZUyIq/2hpDK1BHBdsHOCdvZVxhS9Y0lmgIj979Nw/zCAo178ZfYrHepuOibofnvCqoJBsWU+Vah15ZaurlmTy/TR2rqaT8uJHS5+hAYwdlWahoScRK3+oskWmIZJnz5L9MpwaYBensUurn6YVALDXaiYC+zsZVDBPEEI98zeNba039N9tnnI27HY0LMvGrqtWYxpNoXi5xcFUACvQzgf3kDL9J5Ku9bKUZ5EV6O+QCOE5FeNkohrkUniM5tryd1ETVDZuWHsKsGo3DSAUIwnaIBafcuj0eeZaegLJVlqP5YbQsl43nr6raU9w0Nhp+9w+fF1nMtfnxaqSHgRTIWy9ta7sqx1xKUe+YJBt0jCJixrlKTsYyw2XS4qNa8oWy0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 10:26:56.5780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d59d68-0317-44e1-68a3-08df0fef34ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5917
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 10:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245628

SSBoYXZlIGEgd29ya2luZyBwYXRjaCBmb3IgdGhpcywgaXQgbmVlZGVkIHRvbWxraXQgbW92aW5n
IGludG8gY29yZS4gIEFzIHN1Y2ggSSB0aGluayB3ZSBjYW4gd2FpdCBmb3IgcG9zdC1yZWxlYXNl
IGZvciB0aGlzLCBpdOKAmXMgbm90IGltcG9ydGFudCBlbm91Z2ggZm9yIG5vdy4NCg0KUm9zcw0K
DQo+IE9uIDExIFNlcCAyMDI2LCBhdCAwNzo1NCwgQXV0byBVcGdyYWRlIEhlbHBlciB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8YXVoPXlvY3RvcHJvamVjdC5vcmdAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBIZWxsbywNCj4gDQo+IHRoaXMgZW1haWwgaXMgYSBub3Rp
ZmljYXRpb24gZnJvbSB0aGUgQXV0byBVcGdyYWRlIEhlbHBlcg0KPiB0aGF0IHRoZSBhdXRvbWF0
aWMgYXR0ZW1wdCB0byB1cGdyYWRlIHRoZSByZWNpcGUocykgKnB5dGhvbjMtaGF0Y2hsaW5nKiB0
byAqMS4zMi4wKiBoYXMgRmFpbGVkKGRvX2NvbXBpbGUpLg0KPiANCj4gRGV0YWlsZWQgZXJyb3Ig
aW5mb3JtYXRpb246DQo+IA0KPiBkb19jb21waWxlIGZhaWxlZA0KPiANCj4gDQo+IA0KPiBOZXh0
IHN0ZXBzOg0KPiAgICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtcHl0aG9uMy1oYXRj
aGxpbmctdXBncmFkZS0xLjMxLjAtMS4zMi4wLnBhdGNoDQo+ICAgIC0gY2hlY2sgdGhlIGNoYW5n
ZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlLA0KPiAgICAtIGNvbXBpbGUgYW4gaW1hZ2UgdGhhdCBjb250YWlucyB0aGUgcGFja2Fn
ZQ0KPiAgICAtIHBlcmZvcm0gc29tZSBiYXNpYyBzYW5pdHkgdGVzdHMNCj4gICAgLSBhbWVuZCB0
aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0t
YW1lbmQNCj4gICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0ZSBtYWlsaW5nIGxpc3QNCj4g
DQo+IEFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUgc2hvdWxkIG5vdCBi
ZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsDQo+IHlvdSBjYW4gZmlsbCBSRUNJUEVfTk9fVVBEQVRF
X1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQNCj4gYXV0b21hdGljIHVw
Z3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuDQo+IA0KPiBQbGVhc2UgcmV2aWV3
IHRoZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQvdXBk
YXRlIGZhaWx1cmVzLg0KPiBBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczov
L2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRl
ZCUyMFVwZGF0ZSUyMEhhbmRsZXINCj4gDQo+IFJlZ2FyZHMsDQo+IFRoZSBVcGdyYWRlIEhlbHBl
cg0KPiANCj4gLS0gPjggLS0NCj4gRnJvbSA4NzJmZTk3YmY2MDk5ZmQwN2QxNDU5ZDMyOWI2NGM2
ZGYyNWQ4YzVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiBGcm9tOiBVcGdyYWRlIEhlbHBl
ciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+DQo+IERhdGU6IEZyaSwgMTEgU2VwIDIwMjYgMDU6NDU6
MzMgKzAwMDANCj4gU3ViamVjdDogW1BBVENIXSBweXRob24zLWhhdGNobGluZzogdXBncmFkZSAx
LjMxLjAgLT4gMS4zMi4wDQo+IA0KPiAtLS0NCj4gLi4ue3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzEu
MC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjMyLjAuYmJ9IHwgMiArLQ0KPiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzEuMC5iYiA9PiBweXRob24z
LWhhdGNobGluZ18xLjMyLjAuYmJ9ICg4MiUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMxLjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzIuMC5iYg0KPiBzaW1p
bGFyaXR5IGluZGV4IDgyJQ0KPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzEuMC5iYg0KPiByZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMyLjAuYmINCj4gaW5kZXggM2Fj
YWE4MzYzOC4uZTYzYzZiYTNhNCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMxLjAuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMyLjAuYmINCj4gQEAgLTcsNiAr
Nyw2IEBAIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nDQo+IA0KPiBERVBFTkRTICs9ICJw
eXRob24zLXBsdWdneS1uYXRpdmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNr
YWdpbmctbmF0aXZlIHB5dGhvbjMtZWRpdGFibGVzLW5hdGl2ZSBweXRob24zLXRyb3ZlLWNsYXNz
aWZpZXJzLW5hdGl2ZSINCj4gDQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmI0OGFkNDA2OGE0
ODJlZDcyMzliM2E4MjE1YmM1NWI0N2FhZDMzNDVkNThkZmM5NGU1NTNjNWQyZDQ2MjExYiINCj4g
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwYmRiZGU0YTUyYjA2YzM3ZTNlY2EzOTVmODVhNzYyYmYw
ZWYwNmZlMzc0ZmQ4YWU0MjlkYzZiZTEwMjMwZjVmIg0KPiANCj4gQkJDTEFTU0VYVEVORCA9ICJu
YXRpdmUgbmF0aXZlc2RrIg0KPiAtLSANCj4gMi40Ny4xDQo+IA0KPiA8Yml0YmFrZS1vdXRwdXQt
cWVtdXg4Ni02NC50eHQ+PDAwMDEtcHl0aG9uMy1oYXRjaGxpbmctdXBncmFkZS0xLjMxLjAtMS4z
Mi4wLnBhdGNoPg0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUg
KCMyNDU2MTApOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS9tZXNzYWdlLzI0NTYxMA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tdC8xMjExOTQ2NDYvNjg3NTg4OA0KPiBHcm91cCBPd25lcjogb3BlbmVt
YmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTog
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIg
W3Jvc3MuYnVydG9uQGFybS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

