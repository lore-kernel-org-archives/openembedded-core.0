Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019BFC25B4F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 15:47:17 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.45])
 by mx.groups.io with SMTP id smtpd.web10.15250.1715096833521384560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 08:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XX9A5VXk;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XX9A5VXk;
 spf=pass (domain: arm.com, ip: 40.107.8.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CA04sY63xbZAP0Bk/0UJ/wT9Rdc1o0dw7vnKACMt7kkLckftvcZ7GJoTKFP50J7i5J9iRffE0ePni/2BoePFdlBWfsmq1XaRmEWQFP9RG1sqwnv/dvt1qOpQ/n3HkI5cb5ohtizuBOfoBSoW/MhWR4LuWZmMed/NSmr7ApM7JJ01AnZOUUqviBh5iblqm6o9Ism5kFtM7cTzP+SlfHwk1XxqXyXhbK/kQq36zdprvxYtRi9Y/++Ge/IEOy2wfAPwsr76Vzcn8/Gn2c5PzX1dm92YzSC6K26xxEBrr+fsXCARXkZHXfGbPS3AZIqvwUbJ5ykvRftyJ/vC4j3xuP2uBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/IXmuv+pT3KSuJT7HSx89TgdLeXbtfcK5SOxhQkczg=;
 b=CyKuypzgSCxQ2U2EZdrfKwnecEfpHDbk2XI9CjVS7D/ZZS77YpOWIRHnQHfh33HUspxngfMNMyqfzhg6PdDuRum1wKG2Go8ffSy5oO9CAuEKVVfmmo/MFoXE94gM/RY/irrGcdKLjcqEYEoa63QfG1AMoMJcohFROCUXoerrIf5eWuMQtrH8HLATrwZ92W1cFtDcwts+9PZjRwdOCq0x7zYluYgUNSj8gt4y+ku9aQ/fH74WStYor2k8BlqC+v17F8at7e/wqoGYxvuPKb4rwjRfRY1TBmtg2Nk4+EEnMycCISasYvLiwabOnhOP4lPMVbPG3Jao8iZVhJv7la/92g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/IXmuv+pT3KSuJT7HSx89TgdLeXbtfcK5SOxhQkczg=;
 b=XX9A5VXkPhKKQMlU5GJ01/4M1fl1uzI029sSC32AjQvJ9QqHaGXN3y38wNfcsmIJ+KfF1UG9aEL/is5OewsdYjbKIXT25mLk7OCwn3DtIeCSueg4zeAG9MZFoqt8ZaIDreSuV/DqsVLA589iP6lKDeNi7ttxwzSCw7zsPlYKyYM=
Received: from DU2PR04CA0009.eurprd04.prod.outlook.com (2603:10a6:10:3b::14)
 by DB9PR08MB8724.eurprd08.prod.outlook.com (2603:10a6:10:3d0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 15:47:06 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::83) by DU2PR04CA0009.outlook.office365.com
 (2603:10a6:10:3b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Tue, 7 May 2024 15:47:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18 via
 Frontend Transport; Tue, 7 May 2024 15:47:06 +0000
Received: ("Tessian outbound daa456608199:v315"); Tue, 07 May 2024 15:47:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5133362217c98ca
X-CR-MTA-TID: 64aa7808
Received: from 0b82f11c865d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 98B6526F-E39E-454D-A648-CA87EF394C32.1;
	Tue, 07 May 2024 15:46:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b82f11c865d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 07 May 2024 15:46:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVXQQ4DBNyaRQmJLN27HHrH0vbaFS0LOX021qDgkOjhjmqWBtzlgOl78B1z6JOyViZShHnK3FEtpGrNKev4WduiA/05srzXaSUmpXvVuS6Mw7iAFZXT64eAFX+8uZ9lo3gtZ1/TmbJqw3FlpDLRRwil/h1xTUcTxckDkzpGCZ8b0UKyESwtxjgQy0cfqk8uT1lZhG+Va4ZzUuPEbbAQTxw25hJwXJLsW2OxTGtviFsCQhXhgopcIHPNtG0c/kq/ABKuYY/Y7r/gOKbomoCivpFih47l2DQ4U/gGj/p+Tjv8Z1pswUOJ37KBzILebeUANOGvWO0lR/8vy2pEAxPR9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/IXmuv+pT3KSuJT7HSx89TgdLeXbtfcK5SOxhQkczg=;
 b=j+xlA2qV9/BVMWiNOY7J3/tFvR87N8lcAxSUlw6anQdA7rULDbM0pC/YdMBFJVxbqZGNDKUN5I5kARHfGjuOVWesuuHMNwmhuYGj5edue9VTpmAsP7sfELZWpa5NUwpHK3V721mO++sCUP+GW9vPk58thd2hD1acqovkX4o8gvxDInXTrXxQSJUADnECfzSS/u0loOjM/D9AZWrh4hwLygqCZA5Z5ZfwvEruf9PhlHsfkO+W6nglBFNq1Fr4T909Ro6I6PyTr1KB3AgYB+lKAwaSOMzoXPFcZ0OBxYAkZWwLevjfmDz+JSRyKUAoG5S7guouz0KYu4VLB89TQ6vXfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/IXmuv+pT3KSuJT7HSx89TgdLeXbtfcK5SOxhQkczg=;
 b=XX9A5VXkPhKKQMlU5GJ01/4M1fl1uzI029sSC32AjQvJ9QqHaGXN3y38wNfcsmIJ+KfF1UG9aEL/is5OewsdYjbKIXT25mLk7OCwn3DtIeCSueg4zeAG9MZFoqt8ZaIDreSuV/DqsVLA589iP6lKDeNi7ttxwzSCw7zsPlYKyYM=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AM7PR08MB5302.eurprd08.prod.outlook.com (2603:10a6:20b:103::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 15:46:54 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::bbc3:7fff:f224:c584]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::bbc3:7fff:f224:c584%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 15:46:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4 ->
 2.80.0, 1.78.1 -> 1.80.0
Thread-Topic: [OE-core] [PATCH v2] glib/gobject-introspection: update 2.78.4
 -> 2.80.0, 1.78.1 -> 1.80.0
Thread-Index: AQHanHwq3o9YIJa6xkieUqjnpyfnG7GL8ooA
Date: Tue, 7 May 2024 15:46:53 +0000
Message-ID: <C300C299-DA24-4A7D-9B40-B3809E44EDEF@arm.com>
References: <20240502103252.1102710-1-alex.kanavin@gmail.com>
In-Reply-To: <20240502103252.1102710-1-alex.kanavin@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AM7PR08MB5302:EE_|DU6PEPF00009529:EE_|DB9PR08MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ccb8e02-a300-4e73-6b71-08dc6eacf290
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dUhoU1hlVlJKNlp3MFRKaC9WZ3JWRkc1SFptUFUwL0dXNnkrbmhBWXp5SUZS?=
 =?utf-8?B?L2NWM3pWdUlyVTNCeEhlYVMzNWN2eHU0ZmZKWDRLd256SlVSZ002MXBYUWVR?=
 =?utf-8?B?K2x1bmFJS0ZFQmFFUVBrOForZHdOSWRPK0wwMjB6YmwwY3BOV2FUY0dFOGxE?=
 =?utf-8?B?azJSYUYreGhvYVhGR01wNzlTUm9rL3hjRTQzU1VHbGhDL2Ewd3VUeVROOWFK?=
 =?utf-8?B?YURXS2dXVkE3NDRqazB0aVE0YVhHM1JEY2hycC9VQzJUU2lvVk84cFl4K0RT?=
 =?utf-8?B?dk5DajVaVnN2RlRHb2ZMU1VSOWtFMWNsQnNTV1ZvcTh5M2RMejhMYk9qVSsy?=
 =?utf-8?B?cWNvTm9GaFF3TEtldkhBTUh0M25tM1hyUGk1SDRTT0JNMWpIQldZbWkzQjFs?=
 =?utf-8?B?OE1vMkxKaWhGZ3JrVUowRFpsUU55dWwzbnl1WEVoZjRrM0g0dGtURGZYaTd3?=
 =?utf-8?B?T3VzVkpuM0dFM0ZRMDN5eXFzMmJYS0hRSE5WcGorS1Q5ZWcwMDFxR0luSElS?=
 =?utf-8?B?TzhhYmduazZybXRtZEo5b2F4WEQvZTBvNkgxc29pUnpVb0ZUZkdvYUFGVmxF?=
 =?utf-8?B?RG5Nc2M4N3p4bDdiSEpoVU85RVRtLzRMV0xQYnhwSlBBcEgydCtsbEE1YnBU?=
 =?utf-8?B?NUdQN0NEeXlMSE4wNmZvaGxoRjAyb0pIUTM4TXNNU01LZ1I3MkxMcjBETnUv?=
 =?utf-8?B?OFMyL2I1V0wxQmRYb1N2cS9reFlxcG9QaE5yL3BocC9OVDAxZlpCa0JoUU03?=
 =?utf-8?B?R1kxcGh5ZnY5d284Tk01YmRzRlVmbFFSNXlzZnJpTnNiYUt1aWZ6dWJvNU1O?=
 =?utf-8?B?VnRTbGJVRHhLclRNTFJ3N3hMZlhHaVlVMDFQZlFYSXlxb3hFVW44Q0hJZUhy?=
 =?utf-8?B?OTFIQ3BWZTZvWFRCaFlGQXlxSlVuWXZNYWFMWlVKcGhsZnBhWnR1akcyNWNI?=
 =?utf-8?B?bTA3WGNqN0RMSi9hZDdlM1FyVWdYT0ZFWVZ1T01CVG0xYXdRdEExTFNLMkhk?=
 =?utf-8?B?dFh3b2I3ZnVrby9iczlIRUxyTTFNYTB0MDlEVHVFc1dzNFRnRHQrZVZFd3hm?=
 =?utf-8?B?N01wSmZ1Um14bkZ4aksvSUc2MmlVTEZldCs0V2JYaE82cDhMd3lVbGs2TjVu?=
 =?utf-8?B?QWs4WWQ1MnJlYkQrcXphRWJZTzg5bmJUdVVDVy80RFF1c3VzOHQ5SDhwMHFI?=
 =?utf-8?B?VnB1NHpkRGN4WXBoUDNEeUdSd3BTNmZqK2RsRzVMNk81anBIQjdYS0o4enpD?=
 =?utf-8?B?NjFxYzhvK0NJZWV2eW1yWFdpV3RQaERCdkdHdGpzY280eWwyR3FQQmc0cjNj?=
 =?utf-8?B?YVE3U0VRdWlqVitaanc4MzJFajQzbWllZFhVUVU0NFRnbkN4TnRDclVUbU9N?=
 =?utf-8?B?STc5MVYyVHFFcUd2Y2Jxb0ZwWktud2t3RHZwQSthaXZmOXEwYUgvaGlGZ1NU?=
 =?utf-8?B?Y292azhsRG90QjlyZkxDTzN0Nk1IUml6cVlNYUVWeFlsVVQ5MkdrRm93WHM2?=
 =?utf-8?B?cU1UZjFtMk83L2ZCbW84aWVMYUtnZTNZeVB2VHB0MVlJa3lHeSswOE1pZTRN?=
 =?utf-8?B?ckNKQ0VGNzU3ZVFBN0dPRyt2RmRqRk1MRVZVVXI4bHd1dzFwaVljVnpKd2w4?=
 =?utf-8?B?U0dkYVRialVDamppZXpkaWRNZTJVNHdPbHBveGE2TzFyNHJ3WjJmcjNlSHNq?=
 =?utf-8?B?blRRUXY4VnpPTGlWRmNDRVVCcFE0Z3RVcEpZWXY4c1ZPdmVaaDQra1dhNndv?=
 =?utf-8?B?bno2c1JJVHV1TE1oemZuMWxmeVlOaDhhMFhadjB5bEF4YWltOFQ4dHlXZE5n?=
 =?utf-8?B?b2NnbHlPeVRsd092WG5Rdz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A718622349B9547BF421FC6403EB25F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5302
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8c2309cc-079e-4bd5-4645-08dc6eaceb20
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|35042699013|82310400017|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aHN3azF5bjBUbFVQRTlVK2ROV3plN1lVd0lMQm9MTHZ6ZVBEdVZyTHRMOXpU?=
 =?utf-8?B?L2UrV2lsL1RQb0lyL0tWbGpMTmZyK29rMVVobTNObTFQSS9sbk91ZDQwNDhV?=
 =?utf-8?B?YmZ1TmlRVW5BOHVmVkZsUVFhVmVlVzlwNDdHS0c1S3UvYWt2UmY3Y0hzdlda?=
 =?utf-8?B?ZU5sUUY4dEpRZElob2huK2k3Tk5SZENkckZSS3JRZWlmeHBFRHh3d2syQjVh?=
 =?utf-8?B?cm13aTRwUmE3aXE4SmV4c1FTbHN2Z2NLQnE2c0dSY083aVIvK0hJTjlmb2R3?=
 =?utf-8?B?RGJpVHJDT1VvV25HUjQvUXJhdVhJY3huR2N3UlI5R2VxYTVqRE15dFlZeWhk?=
 =?utf-8?B?RGxDc0hxbXJNWmlOQjV3K1ZNeU5Qa0RpUVpKUEM3WmZaeDlHVnUxek9qTEJB?=
 =?utf-8?B?VUFtSmJ5dm9EaS9nOW92M3hQamRMcG9SOCtZU21mTmtsREtMaHh2MUM2WUpD?=
 =?utf-8?B?dGpIOFhUZ1RPUWgzWDlZZEtvVUxkSm16cXJ0ZHJmbVZFaFRYZFR5WUt2dGtS?=
 =?utf-8?B?UWs3bER4ZDdTTEx4b3lBMzJ4aGhYY0xKOElpVy91Q3BnTFVlcmk0Q2xadS9C?=
 =?utf-8?B?Q1lNdzNqSkFJUkIya3FxZ2swQm52QjNQN3RPVVVSTGdEUlN1MTgxRkFOa1J3?=
 =?utf-8?B?VjRiTEh5Z1I4Wm9keE1oejNTczZyZ3BudTdpMENVWDN5bUY5OE5RZFVuUVMw?=
 =?utf-8?B?ZlNVa0FDbVduVkVrbWdpMTc5aDJiQmFuT09Ea2xxaTcwaE5SNTV1SjM2OHQr?=
 =?utf-8?B?emtLa1NNWjYwampXd2k5RXJDajU5ZkpMTTY2eXdBWWtTdTluYVVXMTZick8r?=
 =?utf-8?B?Q2x0djkrWVBUZW1laWVWZkxZaUp3WjFlWWltK3NYY2JBWXJwOGQ0YjRpQmJS?=
 =?utf-8?B?cVBXTEtGYkpUOTBDMlJGMmhPazY1alBiVUR6dEdBdG5tTEk0bHI0bXcyZkw2?=
 =?utf-8?B?ZGFicjhCd1orKy94YWo1SjIvcCtNN2lERXVXZThEUUdUVkpYbnh5cE12OW43?=
 =?utf-8?B?UG9iMGNBTU8va3JodlpVZjBGM05mdWQ5SFlETnNKUkRLbHZTdzIvRHgxV25K?=
 =?utf-8?B?aVJkYmc0RVAwUXFzN3ljd1NMQmhHRmswRlVBbC8zK3ZoRUQ0RVRPSEdHUVFV?=
 =?utf-8?B?dDgvZHV2V2xybkxxNExjK0xuMXpnVElUdFpsamJndlRDcjF6T2ZSWGE5Tlho?=
 =?utf-8?B?TTFJUHN4L04xWTVhb3JQcFRWdEk3ZFYybDgwdUZFeWcwZjR2N3BMcHlWYXh1?=
 =?utf-8?B?UXdlV0NaelpoY1VJOHUreGsycHJuT3c4endERDU2NGJmOFE5RE81VjJ4d2hZ?=
 =?utf-8?B?R2NoVWFwYlBUeWdKM0tOMWRWZHZJYlFidTRGb3JRY3hrSFFMTWVGN0wrUVRv?=
 =?utf-8?B?UEMwN05KaWtOM05HdEdoR1dSeHN5azFOd1hpZzJOcmYxejIwaml6Y2JCeU10?=
 =?utf-8?B?U2NzWEt1c2NzZWh6KzBiZUZtdm9PZXFLOS9yNEVLMVRCUFhsYUxPWGVVREFl?=
 =?utf-8?B?WDFKSWRtN1BYek0vb1BTWU5YWXV3NzEvTXNwN1dDcEFRREtEOWhKU25rK3E2?=
 =?utf-8?B?MlFRRExFRC9JNW8vR2w4MjRKdE53WUhHb2orWk9Ma1h2akhaak9iNk5scG40?=
 =?utf-8?B?WlQ5V0svVlFScnZybkZNdlpMamNSSjdLWDZIcXIvMzZOMi9HU2NjcXlmQWFP?=
 =?utf-8?B?cXNoMWRxeE5KL2lMWjV3OU9TdmlVWURObEtKdHRFa0xlbFVXWjdTV0ZlNVNK?=
 =?utf-8?B?TzBLaEdsUzJ5ZHJnTUgyempWWWdQUGhRZENpd08vbVd5c0JmL3pWQnJOQjB5?=
 =?utf-8?Q?V5oiVtowER0tmXBDHgNDN/FQpzUj/LLHy4YI8=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(35042699013)(82310400017)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 15:47:06.2749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ccb8e02-a300-4e73-6b71-08dc6eacf290
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8724
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 15:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199098

SGkgQWxleCwNCg0KVGhhbmtzIGZvciBkaWdnaW5nIGludG8gdGhpcyENCg0KcGFja2FnZXMvY29y
dGV4YTU3LXBva3ktbGludXgvZ2xpYi0yLjAvZ2xpYi0yLjAtdXRpbHM6IEZJTEVMSVNUOiBhZGRl
ZCAiL3Vzci9iaW4vZ2ktY29tcGlsZS1yZXBvc2l0b3J5IC91c3IvYmluL2dpLWluc3BlY3QtdHlw
ZWxpYiAvdXNyL2Jpbi9naS1kZWNvbXBpbGUtdHlwZWxpYuKAnQ0KcGFja2FnZXMvY29ydGV4YTU3
LXBva3ktbGludXgvZ2xpYi0yLjAvZ2xpYi0yLjAtdXRpbHM6IFBLR1NJWkUgY2hhbmdlZCBmcm9t
IDc3MDkzNSB0byAxMTA1OTAxICgrNDMlKQ0KDQpBbnkgaW1hZ2UgdGhhdCB1c2VzIEdTZXR0aW5n
cyBwdWxscyBpbiB0aGlzIHBhY2thZ2UgZm9yIHRoZSBnc2V0dGluZ3MgdG9vbHMuICBTaG91bGQg
dGhlc2Ugbm9ybWFsbHkgYnVpbHQtdGltZSB1dGlsaXRpZXMgYmUgbW92ZWQgdG8gZ2xpYi0yLjAt
Y29kZWdlbiBpbnN0ZWFkPw0KDQpSb3Nz

