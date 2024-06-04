Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AB6C25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 12:09:50 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.53])
 by mx.groups.io with SMTP id smtpd.web10.19838.1717502983878835421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 05:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qA8KlN8+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qA8KlN8+;
 spf=pass (domain: arm.com, ip: 40.107.20.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bEnBnw8PbaScOTb/oLt5jFvOR6mfoZdMAH4Zqg7l/B9aot0kSbalu7m4bk/p7SLDdqrBdVCktDgc+GB/YnpXMnNkqPTeN82nglD2HbdKWkDdynD6QK+h+6uvUJJoirEf97EBs0ytiFtutfWQ7J0xjYszLge9jxndYUpTvkYLFDjxD5CL1WCKqksth3RsFL2bTh1G0FbQraVAgjfyfBiJ+vl7mmSE7TxIEYk6d5fn8EzQ8o0o3INiKCEQnGOVc2Gv9glMEb9jdnNlbiALvahfgVkk3AO/SZFdm51UMPMxSTV0qVEtF7jx5omQg1hPyTFFWFQFjON6w5r5DLiLcfTsqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRHt012U40T3TGTmbgepLLKUAHoJeOydUPH/UTzSL9o=;
 b=QVA6sk3iQrKR3whaIIN4+ATe3ndwHi4T3kI0ixRpuG1wr7RGy2qgHApQQdKamKGIVH/Aihtth3htxrRBrlYzXxXIBdDJQ8m3N9Ak7F2qSFT3ulRTdRVOXxj7n3Dr6mA2d0Kmh8mD23yewSyIusrhTKaG8dTkGrlVfqCqFTlWBvUtHyL+wWK/HFwbDTcKlAxv3exq2kln4WPVcH4dr5yiShGY+tbRqp2/5MOjRbtZlADwUf2ZcMiCxtzWf9qqYDjTuhps90V9wwWd3s+vaC9riOxXvYOL2i6Elc4xS3GnH0UtMi+wRCNCylC7fj+SaIfo8GLozD9hzFkgfChixpUfCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRHt012U40T3TGTmbgepLLKUAHoJeOydUPH/UTzSL9o=;
 b=qA8KlN8+9i9jHGmftkaiHooZ9JlkKTvbeIaTDXxQsRBWKmgDotVNXU4uMqv71zu2NLmj6MoxPDL0eV9RRM/2axsRu27DOIcLnyhzTFOGVrIP9GWHME2IdspXZZL/9L9z/D0iVoe6czdFWsYKctP7BSNL9RCmiiZ8lXakyNwQYro=
Received: from AS9PR06CA0289.eurprd06.prod.outlook.com (2603:10a6:20b:45a::29)
 by GVXPR08MB7679.eurprd08.prod.outlook.com (2603:10a6:150:6f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Tue, 4 Jun
 2024 12:09:40 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:45a:cafe::c) by AS9PR06CA0289.outlook.office365.com
 (2603:10a6:20b:45a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Tue, 4 Jun 2024 12:09:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Tue, 4 Jun 2024 12:09:39 +0000
Received: ("Tessian outbound eccca8f339e8:v327"); Tue, 04 Jun 2024 12:09:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 917ad2d7e40d3aa6
X-CR-MTA-TID: 64aa7808
Received: from f3d63bb6c275.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 91580EC7-99A7-4E12-82E3-D5CB491E0272.1;
	Tue, 04 Jun 2024 12:09:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3d63bb6c275.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Jun 2024 12:09:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYlg5/d6iDmM18jCRO7WmesSlldYlhbApFs1CXkZLAsBa6OhEi/p3U9X0WGtMi2aymZ6hzlbnAyOwsl7aOEZDxqy+pVXnK1ugm16xm/nbzsbWqCBcX3DQ0+W/wDchtWCvil9/OF4IuyOsvEDOkt+QLRYRzjv4nkvN1j1H0MRhwRtyUDJXqFmuALpYXLv88+L6Wy2zpD3uCxJ7jFhw45IVLt1qgQn7VHtIZBatKZqJhbhtUmeDlcMVUW+z2jrOfAFkSCo58lC2Jd2YWe2W1fCGujaPcnX/q/Mj2a2xcS85YyehL8C10a0mIrTHvE11vDixwt9SXaJ36Sn4PtNLsj/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRHt012U40T3TGTmbgepLLKUAHoJeOydUPH/UTzSL9o=;
 b=OYvRLqqm4daGn8cwWCoz57NyP4mInJ32+aVQ+uWwyF6ZIB1U1NN77mj2KshuiczFRio//kBEOQSd2VsHz90UGhDEX6aTrLSyrg45J0l8khp4zDxgAI8l5/87WAEkwPMsfAfQPT0p/7KbEM0wXvxD2OT5qDeBZBMTa5wYYrSdW6zKFhdFbtaNfifte17hW5GcLbht44v5z1/04yfpn7IC2IhGrPPKfSUgdElmPRZ3L00j2GVUNTutoKJbnZkwyAbzccITNJbUzJt2+ksQGsTxChWS+l2905fwh8LrCp2pgVhVoQ/DGrM6SOs8icnyq3onOLQzmt92kcv/AD5QAp0+oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRHt012U40T3TGTmbgepLLKUAHoJeOydUPH/UTzSL9o=;
 b=qA8KlN8+9i9jHGmftkaiHooZ9JlkKTvbeIaTDXxQsRBWKmgDotVNXU4uMqv71zu2NLmj6MoxPDL0eV9RRM/2axsRu27DOIcLnyhzTFOGVrIP9GWHME2IdspXZZL/9L9z/D0iVoe6czdFWsYKctP7BSNL9RCmiiZ8lXakyNwQYro=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10144.eurprd08.prod.outlook.com (2603:10a6:20b:630::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Tue, 4 Jun
 2024 12:09:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 12:09:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alejandro@enedino.org" <alejandro@enedino.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/4 v2] meson.bbclass: Allow early compiler
 tests to be bypassed if necessary
Thread-Topic: [OE-core] [PATCH 3/4 v2] meson.bbclass: Allow early compiler
 tests to be bypassed if necessary
Thread-Index: AQHarA5XzuesWVN58ku24DVXKHTqKrG3l/GA
Date: Tue, 4 Jun 2024 12:09:29 +0000
Message-ID: <07A133B8-E8E5-4BDC-B37E-EEEB77361F59@arm.com>
References: <20240522061016.1763718-1-alejandro@enedino.org>
In-Reply-To: <20240522061016.1763718-1-alejandro@enedino.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10144:EE_|AMS0EPF000001B2:EE_|GVXPR08MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: d03dcf6d-8df7-4be9-d1b4-08dc848f35e5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?f3KXLRSGra3TwMv+1oCn5Vq+rGYwNpF46Hch6ijsBgdkResDqAXoMkLZLu6v?=
 =?us-ascii?Q?H5ea9tyecKpLhJio2+9S/gi0M5nhRuqGStwhu3LNYbDGp900LzYUqx37gIAT?=
 =?us-ascii?Q?c68sZV2QMkKPHvyC8bM2YNujWV+y5B3PNvwFlEIAyNWEnWHyyuJ/4ujP2BJj?=
 =?us-ascii?Q?WkfXlZ3QKwhkJG/u0CD0aKBdgD3YDLMUyzm9ERzuFXkmjtsx2oM7XjLAKg7h?=
 =?us-ascii?Q?uNXxqaimPxb9/jCurK34TcufuuDSHNvYNYOIAwcv6v/uhdIKn3qyV5WhMPdU?=
 =?us-ascii?Q?FqTR1VH1cTmzaxPoANNcTfFUOJJFkPzNuQBX33wy4C6keu7wFN+xqbfxXrTr?=
 =?us-ascii?Q?4vPnkn+9MAeQtkt2wLw2b8UlWZBcaiK5vd9NiJHcVolyuDKZE6m7mYzUA0As?=
 =?us-ascii?Q?u3NgCb+ndaDVSchDNdOctP4hoJj/pVps0/E0D4mnIUd4wRzrJ3DzOiFKVqac?=
 =?us-ascii?Q?ImAxE3JXJdhBx9kVLZtkWLNiYQ2zZL/h6NisYD47RVx/I4Fkkta4kju0mVNo?=
 =?us-ascii?Q?zfUiyzTypkNGt8WjiuHkcEXWIbIbN6dVuLHaW3NfaItlLyDKaLxBB7Z+TAk/?=
 =?us-ascii?Q?J0SVwa6znQQjq4C7rLUkfrZAOY6erqhkdn7WQU4I3g3UlH6t0Eic22NNVsnJ?=
 =?us-ascii?Q?lVcfuPcHEFat7WJP46XtD5qMPJBrHv/AaP7wMT52vNfnrbBzwfXds+ypdDWw?=
 =?us-ascii?Q?/6E9S1uQ85LS4rizlusc3kp6MhhNsGytUejug/dashGtNfgsdQsewj7hspJu?=
 =?us-ascii?Q?9G7Q9zC0HRT1r9MzGz84RTmPEjCWgeS4Bf2Dfsfix9RHXGV2mAZauJ5lSAIm?=
 =?us-ascii?Q?hVKAKAX1DuY3IysoxBRNdW7paF5SpWbvvE9ZUxzB+ff4CKNxNwlcSXV4Ags9?=
 =?us-ascii?Q?hodPkdcQykKorxr1y6A4n/h8qh0HmUm50uOlQmN+ne1hG7d+ioUHyPgAj6XQ?=
 =?us-ascii?Q?v4S7USUV1uc8bWhwL+D/IzDYW6uHlL1nzFYrBcvoYtIGxoLSvIW9C4p8fxOY?=
 =?us-ascii?Q?WGASzXOSpPP1Tm4vVqfk1ei6dhJSBb/72nubC4GuaK3F82x9mp6BlHIzmgs1?=
 =?us-ascii?Q?yRkCTyikRRPh3Lw4b3gdp+sbbI4q4T9C9IOQbcfxEJ1DafM4KZkb8BpAafAT?=
 =?us-ascii?Q?y+PDUXjY1q6HjGTTgfEkUPo7MDw3bWvhXkXuH14Vb0UwZIDFsvxCE7qBeuKT?=
 =?us-ascii?Q?Miv0DmuzAKRVb1/taZyP+8HBTfz7kNrAERO/xT2bgfJwInVfXf/2NAsX8dzT?=
 =?us-ascii?Q?sk50TT/097xNws6+yQPizrOuZkIIeOmBKlupk7CUQNNUl3HibTUElPHSQHRR?=
 =?us-ascii?Q?xrc=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9937D4A08866E94FABC576E08307B168@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10144
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a4ae4fb2-c5e7-40af-4598-08dc848f2fa0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|82310400017|35042699013|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B+p+Sju63klaKbrcKaojV0zHh5L0MbdBusozC3AF1AuId+9fxxMBkFQzA3ES?=
 =?us-ascii?Q?I2Yi3+Vj4G4CKZtZdx8sHqpRh0kwrx6ItUX3D8MapUAKPjEglqrSRoISyomI?=
 =?us-ascii?Q?MO5xqlzSSNEnai4YKqzlF3umtKXexV4Jh1s46T1tI48XxENy3LarLOCXgu2d?=
 =?us-ascii?Q?LF6jHgv2crKKmGT13tDQimkf6yxyUBVKgIJLeVCsMghPpnG32MNOceYBgg/P?=
 =?us-ascii?Q?yhxqQ6qfPZ+70PZLNLwMzJM90s/ipmdofpnQqi8zGpjWXPadJLE6EII2U9rV?=
 =?us-ascii?Q?Jmtqjo9oGZAxhKTDPchXWeQV1+EpE6LIe2VozGvrkwiTCKdzm/PRwKzBolg5?=
 =?us-ascii?Q?JSTWZVQHMEq/pXTIqNYWOSJTZz3IUdXyxz0GWgV0u83JKiwyBob8g4c8cCF6?=
 =?us-ascii?Q?xCI2Xes0X6VKaudEkeyDJZaN/PbKJ4xgbRDcs6zpTiGEvnCTCohwzZWJHw58?=
 =?us-ascii?Q?FVCKGa9kT2ezn+Sk9RkvYWXKTaYRnP8d0Hqi9pkXEMQ4Ec4CtiUX2GTKzoCR?=
 =?us-ascii?Q?zPacRfVU+C1Whjo+PeW/ZWZ/6vQ8VGiLLPkEIx9voGhovh2dik65Jufo6+Ow?=
 =?us-ascii?Q?cqcnkvrVOf7M1wPqu+I6RMRTfE8aFU91HSf8v3/zdvxukWIJMqIaXmjX7UJG?=
 =?us-ascii?Q?UmxgBDLlIwLyQbdaURH6I+IcReH2oG43riJlbFiRhJawDWFrki50s4YP5TZo?=
 =?us-ascii?Q?khNPO33yfibG0n+cRrVPcnXGq6Ux+sNSVb4D8I0CxIOIC1dLk8875pbogZW1?=
 =?us-ascii?Q?+qluuYRotKwnaAgn1CTf6dtqYBb6YvjYv0ffbZiPe0DGpqU2jKcudvz2idmd?=
 =?us-ascii?Q?xQo4hTAt5kfvOwxN3iQddASrk/Y3wdy5p4MeGP0131OObDu3uHB+EgM82cjM?=
 =?us-ascii?Q?BtbjHo2kqUYbbtQD4HtujL1eX1U+6AnXMTmHxbU6WYjs/jNEBGcXwT6mMZ/z?=
 =?us-ascii?Q?FZ6mXdvQQNP7IDkx9eciImA0bwilU92wx3eJ4i7bKP6TPc3MDROnFgafU+2R?=
 =?us-ascii?Q?oOubXjJLqqT1WnHYJe05YKDA33f52QXnfOVIwN/9wiyKkA6edhM08BEx0SwS?=
 =?us-ascii?Q?aS6pRfknX4/syI7rbGNVzNn6R5fmVrKWEomq99ZWq1Jbb5YGuFPvhAHWPtl0?=
 =?us-ascii?Q?ag7piCnlcDzjgvCj39QD9EoeIpICYcIC0A+bbmEdYo8XWDZI0EyZvicBByh3?=
 =?us-ascii?Q?qSPnlx+PBlCna4HTGPkK4WYIpZBEMskM+j49ImTKIISDWh7CdCAHpZKHJgE1?=
 =?us-ascii?Q?OPpaTDj+ckVr+lWIqj2NxW3/Ax2wZoy5UWkcKV3NKpV/R+WwT6A/FvX/EHnT?=
 =?us-ascii?Q?SnM0Onc47QKJ8MJv50A132iD?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(35042699013)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 12:09:39.8742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d03dcf6d-8df7-4be9-d1b4-08dc848f35e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7679
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 12:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200330

This is pretty niche behaviour - is it worth adding to the increasingly com=
plex meson.bbclass?  Can it just be added to the picolibc recipe instead?

Ross

> On 22 May 2024, at 07:10, Alejandro Hernandez Samaniego via lists.openemb=
edded.org <alejandro=3Denedino.org@lists.openembedded.org> wrote:
>=20
> Setting skip_sanity_check=3Dtrue in the [properties] section of meson.cro=
ss allows
> early compiler tests to be skipped on cross compilation environments wher=
e
> sanity applications cant be compiled or tested.
>=20
> Setting MESON_SKIP_SANITY_CHECK=3D1 enables this behavior.
>=20
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
> ---
> meta/classes-recipe/meson.bbclass | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
> index 03fa2c06eb..492243c3c0 100644
> --- a/meta/classes-recipe/meson.bbclass
> +++ b/meta/classes-recipe/meson.bbclass
> @@ -61,7 +61,7 @@ def rust_tool(d, target_var):
>     return "rust =3D %s" % repr(cmd)
>=20
> addtask write_config before do_configure
> -do_write_config[vardeps] +=3D "CC CXX AR NM STRIP READELF OBJCOPY CFLAGS=
 CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED"
> +do_write_config[vardeps] +=3D "CC CXX AR NM STRIP READELF OBJCOPY CFLAGS=
 CXXFLAGS LDFLAGS RUSTC RUSTFLAGS EXEWRAPPER_ENABLED MESON_SKIP_SANITY_CHEC=
K"
> do_write_config() {
>     # This needs to be Py to split the args into single-element lists
>     cat >${WORKDIR}/meson.cross <<EOF
> @@ -89,6 +89,7 @@ cpp_args =3D ${@meson_array('CXXFLAGS', d)}
> cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
>=20
> [properties]
> +${@"skip_sanity_check =3D true" if d.getVar('MESON_SKIP_SANITY_CHECK') =
=3D=3D '1' else ""}
> needs_exe_wrapper =3D true
> sys_root =3D '${STAGING_DIR_HOST}'
>=20
> --=20
> 2.45.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199686): https://lists.openembedded.org/g/openembedde=
d-core/message/199686
> Mute This Topic: https://lists.openembedded.org/mt/106238394/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


