Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7917F10A62DC
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:07:11 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49092.1774534028842510734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RyG3siuT;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RyG3siuT;
 spf=pass (domain: arm.com, ip: 40.107.130.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kR6VGl5KCZhm4N6+sVZVLyv9NNCzQ2K36jXCAFxxU6TapsUj3H6uMmQ2kTVtjNlRPqP+arjZ95SbRvFf9WR/Mws++j3iIuAOteYv471bJPR5CM2bz8KZz86brLXF+f2leg3xJf3JD236xnKETWEiwgQHThZTTi02PFoQk0Px+w004d9Wka2vYvWj/xnHCRx9INUeJ+H+0oOCHSjNn5xJ9buVAvFZ+N3SPWdjju5O5Bw/TiiIowxM1dgPJy1tTL9f6zcSv9CaYQTzFz62tMiQ3qgvuz2T8s3oh3u0loiPFPpxsiKj6mMxqkPDbG2tFG/9G/6y1WWuYXP2o2IJTHlzfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4aSvG9dC338OEevAcJ03YSq2jIfHB87utq6L/yMJto=;
 b=MNqoPTjtWEmPjWhH5nHyQfWKLk5jjFuDZhET5xEv8ibh+BEc65DpTGv98Dm2RlzgVxQED/kNuInkMZm6udZCvqz23bAuPz8glBTwtPSk9owz0dzisHWWp2BRQVvenMKQQovITtqla5fHQciA54p1iLq1VdsTOvyKrUISy41k2r4cBiY/zAuhrbx5ZQWLz8vYFVoOXXNybU/O+MKVGUZQjNRuz0P6v18/b20tds1ibyhfoEuXKyu04PHKCEbCA7t5wTBL1X0EiiZwORSPh5IyPUK0woMv/hqVNJmvdT8TrYLjWl8V9fnVH6zwb04LENlhwW9HOKn7tt+VSC8sr/a9lA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4aSvG9dC338OEevAcJ03YSq2jIfHB87utq6L/yMJto=;
 b=RyG3siuTpJe2qvk2JYvwD8f+3KCCncptIdveM7GzP+541qd2eP0h6pC6gSxt51nA571pFZWUlodkKOVP8AtXBGQuSITqZx3TCH/GBDwB8Im2ak+WIIVgWcfQoyoKY1gAod6yJJpO+tyxffBbuCm2A68zsxC49oUG7asYnUOu2vw=
Received: from DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) by AM8PR08MB5683.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 14:07:03 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::77) by DUZPR01CA0035.outlook.office365.com
 (2603:10a6:10:468::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Thu,
 26 Mar 2026 14:07:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via
 Frontend Transport; Thu, 26 Mar 2026 14:07:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmNBLoY9wUgH+biZpFDc5r3WYryg0rkgM1XMjSCDnwlHbMoYS+3yLQ2VcShip2EYVzPTYBnMhGbjw8eEKuI12L6nhEsQRC5h2rc6dmV1c9xlpKsyTLym2qq+iksmpsxXVaFzS0TGPK+MA3DgAYZxUJoV9mYefZxuYLeiOgEl9G3CCQb2ohg4WBdIBhqVva8rQKQxjDO92uvAfpNN9g2r5nWzApbfY/oflcvzIly0zvZAWlNxTnfjHRDbJYaSwYF7xyHAxBEhl/0Zs/jsrQRJhqVMyLNfxanM0nqc5buMGxbziwajO1aUVobnD1acAZLP8+IzFmtWdM0j6HLvZm8PSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4aSvG9dC338OEevAcJ03YSq2jIfHB87utq6L/yMJto=;
 b=JsiAIErMoQukUcKCnrw/R4fk6wgQghW32dK7zULBdon4tBTgu8rulBHyxPK7qo5dBAjPIyvexi45sHJljiyRCVGQ+DH3JS/8Rp8+yT6/oewT+Xb9xOgP8asys5NAfkYWQ0JuZ6LsO25MB+Zn/0OwPPIzpUsP4FAZcR228SnPyicVjB04gLt2i0UMwp6uo8pAWUW5bESm1TlBADgBbIWWBw+ZqahyYiK+4AHa7sTxX8dsFQ3DX3FBMC8qWAAWniW+6RSI/qi523kF1e55XUJM2n1kKQq4oQXr5N9+Ld7PHG1fRRWNmlhQ/zajcHhOSPYGRrQGC+/w3oj3F6XmHXAb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4aSvG9dC338OEevAcJ03YSq2jIfHB87utq6L/yMJto=;
 b=RyG3siuTpJe2qvk2JYvwD8f+3KCCncptIdveM7GzP+541qd2eP0h6pC6gSxt51nA571pFZWUlodkKOVP8AtXBGQuSITqZx3TCH/GBDwB8Im2ak+WIIVgWcfQoyoKY1gAod6yJJpO+tyxffBbuCm2A68zsxC49oUG7asYnUOu2vw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10476.eurprd08.prod.outlook.com (2603:10a6:150:155::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 14:05:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 14:05:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "careers.myinfo@gmail.com" <careers.myinfo@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH v2] libsamplerate0: Adding ptest for
 libsamplerate0
Thread-Topic: [OE-core][master][PATCH v2] libsamplerate0: Adding ptest for
 libsamplerate0
Thread-Index: AQHcuq2js/8R7Kkj30OGv5xS1f7V9bXA3e6A
Date: Thu, 26 Mar 2026 14:05:58 +0000
Message-ID: <5401DB48-76E2-46F8-B045-14C0F4848C88@arm.com>
References: <20260323092210.1947308-1-moins@kpit.com>
In-Reply-To: <20260323092210.1947308-1-moins@kpit.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10476:EE_|DU2PEPF0001E9C6:EE_|AM8PR08MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d08850-2c8a-4483-50db-08de8b40f409
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 LkgG/HZueEXj42asHv3iJ242JUfgcoJUPcFxt4gfPtLQWH8i1kJrRdLwdcX6WL379TvyZJIDAbpbl9n6gEe8gY6Gvdt7fwJknb4YQLPLB451iZGXI34m7ltxYJEucqd/56biuCsRmpdkK1H/+PhjUgBXIko5GB+11YPHSHyb7oJTDEt1aZG775MKJBuTTUgIo+xJjow/nkEDgJVNrXwJukby8QydjzFCLwnQH+pjBJDZ1ydiaRVoB1SaAn7q2CP1doyJkATFsixBD1v8aPPGnFzjh587T1H00xEFpzxyeEXFqH2wXPvf+kb9MfCLv+vEzlUN863VlH9QfyNx8RKB3Bo/6ERbbhYcBPlSVhqSzYAGraoCVeYY7in+7TAtQDA9K4s59SfoQZdLn1VgLI03ljzQmPxeTgKRlozkRVQIEMXX6woewxX6A0norTwLBMd35s8FZJuHpNSVbepc1oSJ2hsBpRj6KR0dQeIdHYfy6IxRQrVQ75UTfKy5v8Xg0rZIpMmLvTULjXysazGeIs7RMI+o+kMiSSX3YChxvtv+Y+KaxVx6nhw6TYT2AFAOqRCM6hqV9wGs5eR7q2+yKoafdaF5cxox0aujVOKMpYMXcDeghY69KHy4OFhP99ex82wpfRrGolNiNl2BJOYmJn0zQEdrlAjE9nwSOEet37ZRrBWA+EI6YlTQ4rL7r6WgA1Yy8uBkkPozQaU02Ak7e/yd4/4ZgX8Uy8dfdXepiwiQ1pOonc+Ij2mjRJPsouzx5GX3Fm7vfoT6B00nme+MtTRznHiHCL2t5fAE9UweWL2etCU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B25EDEF57DE8A34C96D7E2210383FE8E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 aoO4GOfTegM4XLoI6I8ZJV9+hh7e6n72RyXQS5wDrBxG+//X6oMPTSjUfRQuW8lAyImQ8FCJ6X7igjHsy0aslb3ngEU7ghLfsgvjI0enUpn33b1nP2HG8kb6GyE/jmparuu1+ch1zTjh+Go8gv7Wrfejko1YtX02Eb+Kaqe65fOHNIBPXGW5faP13sM+xmjkXeryHPXVT1Gs1J+yXjQ1GRDhU9kBloDRp1K9j4KQBfHzo2fDFQeSrAF/JIAs8SneLoG3lFSpHCC28uRFLpC8om69zUrgsKAO7WTpYOqG1Pbgpvu+WtLWmfXsipf23B8r/z5Hbl2/klIcHoHE2fMKnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10476
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	574daee6-be1f-49b3-123b-08de8b40cde3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|376014|36860700016|35042699022|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ch52Gex2q8QoG+HRgm7PsINitbaTbtQF2BU66yzHKQpqL0gl+GLsJmUJJqqrwl4CyT6t0qtlnE8jGrtkfLUBrUQP4iPHdr1SpWT3wMMDMb7SUQ9BUeSEKLYXTv7ckQ3eo14LenALXXC8mEp5ESk8n4guxCsdKR4KKIZRt5YxVF5i8P26dTSiyKIQFtz9cBtDT3SQmPm+zGrdc47VS58jYnZofbhbaa3FZblRvEHW6z0Ylm4h1GjTPs6LIG/bCAbKcy0xGKDH8EXw3JLcfeHRClH/pCzktW9WYKu7ejD2fNcReIK95DhnGKs4/6lV0Ao9pJhXi/IE1VpQogcuFnD3sql2IYtN4hZH8CXAoXV71bizOhH7LMrvWugVPcnp9t0R1LNHJfkWn9fdHghBMIZEpLLwwfr+YX7FhQJBWpGgcy3M7zk4hc4db5Gbx06vhk5vjpThoZfPBRkaGbM7mSEIhNWKuI4epCoojuFIa5tox+rdMu3rbQud9/d3vnqmvG8lvEQmuWytXhy2aPGTb6T8ro1i8zhKpZ67v9tniqPvTnt9JdW7NNoGsP8OVqiHOAAcrlkYkEWU/EdREexoO3ozSks+7qKZ2Z4AKsxx8rb4fNeqMCpGoGxRfWp6TKe9VUZsjGJikPI2qaNU8l0C82towUzIMSHqj9mbgF8wOSSbpjhbtUeiOsUnCmnvzB2CLIErlISwFF4Rmdx9MLawzLc9xQ/VXNTIiQopOtxIoEpOGH3MLQSrl3SmUI2UTA9mYi3fWIKA/TJg5OWG69HUYrCHmA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(36860700016)(35042699022)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zN0fscmJmVeMyYLLIjgnmRs+zKJ3BnDrQttSj760yf7que6TaurHGo5OvjdpNxLpmGfi4OTnMRW/znzm3tMH2zVS0gdJZmB0tpeXdN8IwKVbG4xmQjjZ0Fh579DDZoS5uQHk6vJ+uArNmkbFr9eEMm3EybzeUI61GxQg8Q64q1bZaytfHTOyYcQ75h9VJXtCCDK7JYtE+P2n3wU9x3j8H55TFbexAqPrTdChuSJGuMOxyRIqfDWHJ4f178BZ8ksR1W1L/8JScRknv+n2rGLRs2gNkzazNz9fQusGo1/yRhw7mmuoT6YH/wmGKhjx3FJXS4e3cskwYkXYxn99gCobG427YwrvDLvjohucDrtXMfYdmctAGsS89cyk5fkktSc2kbuUKwgwygDRxRH9Wi9x9RpfqNnkEh7fGZ/Nszo0zheTXRoWEYz9XdgG5SOTEKYF
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 14:07:02.1155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d08850-2c8a-4483-50db-08de8b40f409
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5683
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234003

SGksDQoNCj4gT24gMjMgTWFyIDIwMjYsIGF0IDA5OjIyLCBTaGFpayBNb2luIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxjYXJlZXJzLm15aW5mbz1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQoNCkZpcnN0LCB5b3VyIEZyb20gYWRkcmVzcyBkb2VzbuKAmXQgbWF0
Y2ggeW91ciBTaWduZWQtb2ZmLWJ5IGFuZCBpc27igJl0IG9idmlvdXNseSB5b3VyIGFkZHJlc3Mu
ICBJZiB5b3UgaGF2ZSBwcm9ibGVtcyBzZW5kaW5nIGVtYWlsIGZyb20geW91ciBAa3BpdC5jb20g
YWRkcmVzcyB0aGVuIEkgc3VnZ2VzdCB5b3UgbG9vayBhdCB1c2luZyBgYjQgc2VuZGAgaW5zdGVh
ZDogdGhpcyBsZXRzIHlvdSBwb3N0IHBhdGNoZXMgd2l0aG91dCBoYXZpbmcgdG8gYWN0dWFsbHkg
c2VuZCBlbWFpbC4NCg0KPiArZmluZCAiJERJUiIgLW1heGRlcHRoIDEgLXR5cGUgZiAtcGVybSAt
dSt4IDI+L2Rldi9udWxsIFwNCj4gKyAgISAtbmFtZSBydW4tcHRlc3QgXA0KPiArICAhIC1uYW1l
ICIuKiIgXA0KPiArfCBzZWQgJ3N8XlwuL3x8JyBcDQo+ICt8IExDX0FMTD1DIHNvcnQgPiAiJGxp
c3RfdG1wIg0KPiArDQo+ICtlY2hvICItLS0tLSBFeGVjdXRhYmxlcyBhcmU6LS0tLS0iDQo+ICtp
ZiBbIC1zICIkbGlzdF90bXAiIF07IHRoZW4NCj4gKyAgICBjYXQgIiRsaXN0X3RtcCINCj4gK2Vs
c2UNCj4gKyAgICBlY2hvICIobm9uZSkiDQo+ICtmaQ0KPiArZWNobyAiLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSINCj4gKw0KPiArd2hpbGUgSUZTPSByZWFk
IC1yIFQ7IGRvDQoNCklmIHlvdSBqdXN0IHB1dCB0aGUgdGVzdCBiaW5hcmllcyBpbnRvIGEgc3Vi
ZGlyZWN0b3J5LCB5b3UgY2FuIGp1c3QgaXRlcmF0ZSBvdmVyIHRoZW0gd2l0aG91dCBuZWVkaW5n
IHRlbiBsaW5lcyBvZiBjb21wbGV4IGxvZ2ljLg0KDQo+ICtkb19pbnN0YWxsX3B0ZXN0KCkgew0K
PiArICAgIHQ9JHtEfSR7UFRFU1RfUEFUSH0NCj4gKw0KPiArICAgICMgICAgVGhpcyBsZXRzIGxp
YnRvb2wgZG8gYW55IG5lZWRlZCByZWxpbmtpbmcgYW5kIGluc3RhbGwgdGhlIHJpZ2h0IGJpbmFy
eS4NCj4gKyAgICBpZiBbIC14ICIke0J9L2xpYnRvb2wiIF0gJiYgWyAtZCAiJHtCfS90ZXN0cyIg
XTsgdGhlbg0KPiArICAgICAgICBmaW5kICIke0J9L3Rlc3RzIiAtbWF4ZGVwdGggMSAtdHlwZSBm
IC1wZXJtIC0xMTEgMj4vZGV2L251bGwgXA0KPiArICAgICAgICB8IHdoaWxlIElGUz0gcmVhZCAt
ciB3cmFwcGVyOyBkbw0KPiArICAgICAgICAgICAgYm49JChiYXNlbmFtZSAiJHdyYXBwZXIiKQ0K
PiArICAgICAgICAgICAgY2FzZSAiJGJuIiBpbg0KPiArICAgICAgICAgICAgICAgICouYXwqLmxh
fCoub3wqLmxvfCoubGF+KSBjb250aW51ZSA7Ow0KPiArICAgICAgICAgICAgZXNhYw0KPiArICAg
ICAgICAgICAgWyAtZSAiJHQvJGJuIiBdICYmIGNvbnRpbnVlDQo+ICsgICAgICAgICAgICAjIElu
c3RhbGwgdmlhIGxpYnRvb2wgdXNpbmcgdGhlIHdyYXBwZXINCj4gKyAgICAgICAgICAgICIke0J9
L2xpYnRvb2wiIC0tbW9kZT1pbnN0YWxsIGluc3RhbGwgLWMgIiR3cmFwcGVyIiAiJHQvJGJuIg0K
PiArICAgICAgICBkb25lDQo+ICsgICAgZmkNCj4gKw0KPiArICAgICMgICAgaW5zdGFsbCB0aGVt
IGRpcmVjdGx5Lg0KPiArICAgIGlmIFsgLWQgIiR7Qn0vdGVzdHMvLmxpYnMiIF07IHRoZW4NCj4g
KyAgICAgICAgZmluZCAiJHtCfS90ZXN0cy8ubGlicyIgLW1heGRlcHRoIDEgLXR5cGUgZiAtcGVy
bSAtMTExIDI+L2Rldi9udWxsIFwNCj4gKyAgICAgICAgfCB3aGlsZSBJRlM9IHJlYWQgLXIgcmVh
bGJpbjsgZG8NCj4gKyAgICAgICAgICAgIGJuPSQoYmFzZW5hbWUgIiRyZWFsYmluIikNCj4gKyAg
ICAgICAgICAgIFsgLWUgIiR0LyRibiIgXSAmJiBjb250aW51ZQ0KPiArICAgICAgICAgICAgaW5z
dGFsbCAtbSAwNzU1ICIkcmVhbGJpbiIgIiR0LyRibiINCj4gKyAgICAgICAgZG9uZQ0KPiArICAg
IGZpDQo+ICt9DQoNCldoeSBpcyB0aGVyZSBhIGJsb2NrIGZvciBpZiBsaWJzYW1wbGVyYXRlMCB3
YXMgYnVpbHQgd2l0aG91dCBsaWJ0b29sLCBidXQgYWxzbyBhc3N1bWVzIHRoZSBsaWJ0b29sIGRp
cmVjdG9yeSBzdHJ1Y3R1cmU/IFRoYXQgbWFrZXMgbm8gc2Vuc2UuDQoNCkluc3RlYWQgb2YgY29t
cGxleCBmaW5kL3doaWxlL3JlYWQgbG9vcHMgeW91IGNhbiBqdXN0IGRvIHNvbWV0aGluZyBsaWtl
Og0KDQpmb3IgdCBpbiAkKG1ha2VmaWxlLWdldHZhciAke0J9L01ha2VmaWxlIFRFU1RTKTsgZG8N
CiAgJHtCfS9saWJ0b29sIOKAlG1vZGU9aW5zdGFsbCBpbnN0YWxsICR7Qn0vJHQgJHtEfSR7UFRF
U1RfRElSfS8kKGJhc2VuYW1lICR0KQ0KZG9uZQ0KDQoobWFrZWZpbGUtZ2V0dmFyIGlzIGEgdXRp
bGl0eSBpbiBvZS1jb3JlL3NjcmlwdHMgdG8gZ2V0IHRoZSB2YWx1ZSBvZiBhIG1ha2VmaWxlIHZh
cmlhYmxlKQ0KDQpSb3NzDQoNCg==

