Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0718FC10F1A
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 05:56:31 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.53])
 by mx.groups.io with SMTP id smtpd.web11.30334.1715493381870120268
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 May 2024 22:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=tW6TIeGk;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.104.53, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVxAjIMQ1JPdU19mVtsJ9R77Umrnb6V8+SmgFpalVom5Ia7P5G4qhk5XVmDFxngX9IKIAz2+DMgKflCWxdTE11oDO4hfYM/32bMjBdGDQMmA06SN5JBhsbzAFen7ahR8qqA99cfZCjktuSB8d8ixbBGT4DrAyP5GQAStWZHF/j+raqSyEVlgGzWrViBpdR2WmtsckZ96tMUSHMDeJ5OaXBOW74dsTC7gG984JmzOGyh1t/58D2EJDe82k5jv6iqqSz3aoI60+lf+JRSJIwOnn4bIex5oblodcQT0ihXuAmparZI/Yi5juqMcItHfV3vfhBxqVZrzfsikWQj9KR8YXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pholptpW0gpBOVlYpyNrza0kjD0ZxiMbzcRmfM+2gMc=;
 b=KKRJTC5n893JcxcYr+7fmDBonxr6j87FDpQLpHbyH2QkxKK6H1tCa+LYvkx5EAahHsMqXVGeDEJ9bQA4ae1tcAjbDWl9BN4us3i+qdyMzrlJL3JH6rLd7T1jJvNcZfexSDqYP+NNH0xyzTYVTsKOFBmAaDcbU54reToB+oAjl88rkqxnSxly6l90XgYjQzMltRmcCQQY9M3sEms60MhMNgj8E7uyAV1TQ2vVUQCr+vROLsXvBzXdIo+xS5OUCXOmw1FSgkDammDNKM3hIgSmZj0NjG5UtgyiVovLgpZAYAO5Q5N78LVA+D3V9Q0VcUdixUq0W9QyD6Dd8qXP4ifq/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pholptpW0gpBOVlYpyNrza0kjD0ZxiMbzcRmfM+2gMc=;
 b=tW6TIeGkMuUiUP1Prz9n9p4Yx9/KZWCiq92AQqdoftVzfmcSJu0NW2fwpqvqg+L+Dq+afP7X6Y6L/K261EIn4+3WmQHYvPi+uShyz3tXGfiILEMNsWq8myw1/JVgfsBK9imlchTvwDmN89aNT1Jy8/0O34D62DEZrfVfywAAXDc=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by PAWPR06MB8714.eurprd06.prod.outlook.com (2603:10a6:102:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sun, 12 May
 2024 05:56:18 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::8a39:f1ca:58b6:ea8d]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::8a39:f1ca:58b6:ea8d%6]) with mapi id 15.20.7544.052; Sun, 12 May 2024
 05:56:18 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [PATCH v6 0/3] pkg-database and systemd-sysext image
Thread-Topic: [PATCH v6 0/3] pkg-database and systemd-sysext image
Thread-Index: AQHaooeBXCjGA7NLt0GpdG3HmzzpJLGSqvGAgABwPsY=
Date: Sun, 12 May 2024 05:56:17 +0000
Message-ID: 
 <AM8PR06MB7521A69A4518F33438941EE3BCE12@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20240510030937.3789910-1-johannes.schneider@leica-geosystems.com>
 <202405112307317b125d6b@mail.local>
In-Reply-To: <202405112307317b125d6b@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|PAWPR06MB8714:EE_
x-ms-office365-filtering-correlation-id: c7c0a1b1-297f-4743-fcdf-08dc72483db0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?ks_c_5601-1987?B?dzJ4NGg3LzNPMnF1QkxCNmMwVDBua0w4bWNxRWdIYkNKdG94Vkhp?=
 =?ks_c_5601-1987?B?WldtM3UwM1R2eDY5Q2luSkkySmtVZ2tUMGtEb1JSd1hZOVJNd1Y3?=
 =?ks_c_5601-1987?B?UU1kSSt2VElVN0xmMWdHdHNPaFlwb3dzV05FUFpXRmMvb05GcUhT?=
 =?ks_c_5601-1987?B?a20xRWNVbEJYTHRuUEE4WUR4bkYzbnZNdW0vSUROcnl2R1R6MzQ2?=
 =?ks_c_5601-1987?B?UjFVWk9CckNEU2JQdDFjbDFMVnVXS1k0TFFtRXZWRFlCVmxFT3RY?=
 =?ks_c_5601-1987?B?VUM2SHU2NHZqN0xvRnBXd0Z4MXJPc1lueWp4ZHNrbWNucGJ1NVR5?=
 =?ks_c_5601-1987?B?Z3huZlBQdUZlR1IrSXhENDM0N2lCYjBEY1lRdldNZjBmUU9JT1Ay?=
 =?ks_c_5601-1987?B?YjljR09ZQ0NpZlo3ckx2c0xheFdjRFVEZk9kWjgrVGU0U3lNbHB3?=
 =?ks_c_5601-1987?B?bHVzb0RJM3VxR3Y3S2ltT0g2aHh4ejI0b1BBaUxLaVVyMmFraG5D?=
 =?ks_c_5601-1987?B?NDZIWnNuWURvcE9ZWkNUeE1NNG5WOGxxdnpvTHM0WFR3cndXdVhh?=
 =?ks_c_5601-1987?B?dFlFUlNlclMvRGJDczBHdzBqZW9wL2NMUDBuSlpmWkowU3BmVmtD?=
 =?ks_c_5601-1987?B?Tk93WFVSeVUyclNxSlcxVGhiMUlEZ1pKc1BBMGxkbGdNbnlkOWpM?=
 =?ks_c_5601-1987?B?NHdKTnFoeDN6NkVBOGJrOFFFaVJnSGd1ZW4wQU5VdUJGQk1MTm90?=
 =?ks_c_5601-1987?B?dDArOEgwcFUzSy9SaVd1MlJpOTBUT0EvS25RY01nNzNtbk9JbTlT?=
 =?ks_c_5601-1987?B?YWVvSmpDYVczSkJJRXRwdGxjbW1hMTBUYWlOdjNMZGs2TytKSjJz?=
 =?ks_c_5601-1987?B?QkZkUGJXMTF1YzdUZm40K3pPT0Y2UzdDMnFOcWdGa0RQZFhYbEdq?=
 =?ks_c_5601-1987?B?aWd2amhubU1qM29PaFY5N0Q4VS9EVGlnbFhYckM2aGRQL1BlbjZL?=
 =?ks_c_5601-1987?B?cmtzSk9vcUVqeCtjbTRrb3dsVUIxRkhFb2FZV0FITHBudC80N2pK?=
 =?ks_c_5601-1987?B?cVVjNnJabTgzbWR5QUlTS2xtZHAvQk1TUlB1eFJ6VmRjRDZlMWE1?=
 =?ks_c_5601-1987?B?cnZqRGNmbmFGSjFnRURkRk9hcEJLblgxazZxTkdwcHNpWDd2WWdF?=
 =?ks_c_5601-1987?B?eTI1bEIwa1o4bWZnZ3podW90YXkzUlFUbXpqTnhxWkR5b0dPdDUx?=
 =?ks_c_5601-1987?B?SGVrV2YzWStsbDdDUFpON2RETDdIQnZjd0FURThUaUtySEh3SUJF?=
 =?ks_c_5601-1987?B?Mnowbkl1dGFERUxwVlNYZzZmS21lWnl5aTZKSVBucnRjSGMvaUIz?=
 =?ks_c_5601-1987?B?MFBjSnZzdDFNT3NRd1YxWTdpY0RlOGxSNW5zOVRGRzhLMnc0SEpE?=
 =?ks_c_5601-1987?B?WFVmbjRpb3N6a1lnSk93T2IvbEU3NlRQUlNheEtGYmdvUWxaeTlp?=
 =?ks_c_5601-1987?B?WWJ0M0xzVk9PbVNZUENaTGhTV004UHZZTTkzV2ZpMXN6TFZIVThP?=
 =?ks_c_5601-1987?B?VlRGZUo2RktZVXc5VUM4WGZVSlgyS3p3VnNqYzRaNE43ci9zSUhB?=
 =?ks_c_5601-1987?B?QWhXR0k4ZU1xQWtTOHJ0QU5SVExiZFAwUlVlRlNGSEl3WDVlQk93?=
 =?ks_c_5601-1987?B?d2xUeDJ6Yi9nS1RSZ3NzTkN3TzNpMWFoaXNBdC92azFsc1BZdlcz?=
 =?ks_c_5601-1987?B?cjFaZVVpUFd3MmJzTENPaDJuT3lrYmN4eDBtV3RaWFpneTdpdkJI?=
 =?ks_c_5601-1987?B?Y1ZaeWo4ZW5TMFdEYUptcDJWWXFQOWZTMnZpSUZ4WndrTTNlZ0Na?=
 =?ks_c_5601-1987?B?NXhOWGNvcDNOYitZQmNJL0t5NVZZSUtoRHljUFJydS9uam1iMWEz?=
 =?ks_c_5601-1987?B?OG53Wk12L3dCdkxIRCtYd1ExZVh3YzlSMnpHa29Tek9lTFl3YzJs?=
 =?ks_c_5601-1987?B?NThyTmhiRFBhRTVlbUJFR2t4bzRqenMrTUlaSXF3NUVqVHk3WElU?=
 =?ks_c_5601-1987?B?alNWK0o1YUxqZC9UK0FYQmtUOWFWRTMxMVBHdlVnb2hqREtISlky?=
 =?ks_c_5601-1987?B?UT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?ks_c_5601-1987?B?dkdOUzQ4TXpQZnNUZi9SWUNzWlVvRk5LTW12Um5UWWcrYjhibnV2?=
 =?ks_c_5601-1987?B?TmQxMjBlWkFTSVhLN253UkVYT2hsZTYvZkFQWldaSkRFaERIU0dV?=
 =?ks_c_5601-1987?B?RlBjbDRKOTJ2UVdiMFU4UWkzbldiY242em93Y3NxRjgzS1RZaEpW?=
 =?ks_c_5601-1987?B?ZytKcGFxR1hjTkZKOUVjZ2lINkVTWDVqNXd2a1NKSTRZWGs0Q1A2?=
 =?ks_c_5601-1987?B?eXQ4S1IwaEJuZHBFaDRpNUlUVWQ2MUh0WWhtNk1acnBDekRuMWZE?=
 =?ks_c_5601-1987?B?SkgrbkwybktuMzZpVk1PYU5WZWtLVGhIVW11YUZhVS84SFplVlZw?=
 =?ks_c_5601-1987?B?T2U5T2xTVmNzMVBjd1VML3Yyb0Qxd2RrMHFjTjBYTkVaLzFQZ3lU?=
 =?ks_c_5601-1987?B?V3hXR2VkNzdrYVdkZ2RmK3RIdTErUk1FMWt6dytkdFI4UENPOVdm?=
 =?ks_c_5601-1987?B?S3p3aXJldTQ5M0NQbmJWRFlXaUJFNlF0THM2UWpTZ3BiZTlvQUpQ?=
 =?ks_c_5601-1987?B?RlpZSU5ieFVPOGJzUHRSWklXR2JSQjh5eFMwR09tcldLb2RqMlRM?=
 =?ks_c_5601-1987?B?NVZaUkwzZUVPUVRnSFdqeFBjdnZ2VlhmRzV3cmI5WE9xVk8zZnF5?=
 =?ks_c_5601-1987?B?bzdJaEt5Y1kxaHdpZGd3TitkTUZ2eUthdkUxY3RKakdJUzFhMVM2?=
 =?ks_c_5601-1987?B?MTdXRzNBcXVvTVBjUzhMeXlvb1pKVU9iODQ1NnNRRnByN3RKN091?=
 =?ks_c_5601-1987?B?VDFFU2IxQjRjeVhxZGs3Y2JrWGkwdTFjNXVVQmxJM0djdFNGY1Fj?=
 =?ks_c_5601-1987?B?MDlmVlAwakUwNzhKWXZxcEZjMEtuSGNwbXgza2FxYlRGYlFvbStJ?=
 =?ks_c_5601-1987?B?T2JWbDlrdTg2Y0J1NHg0WS9ZaU1LQVQ1NnFBV2FhUTFTRU5ZeDlp?=
 =?ks_c_5601-1987?B?TmtiNzVzM3F3dXlaMzNXVVlrU1dQcmpnOFh2dHJMUDk5MWNTenZJ?=
 =?ks_c_5601-1987?B?cWpWTnlob3RNaDA5QUFCRmwzSzVtL004U3BjMEpENFp4ZzVJaDZj?=
 =?ks_c_5601-1987?B?SCtucHRmUHFRK1BtYVR0RCtpbkFrZWhXbjFxb0g5eVh1WWhZaWU5?=
 =?ks_c_5601-1987?B?ZDA3U01IRzdKQ0taSDBoYkxiSktHTDR2SGs0R1R5c0orQW0yRm5o?=
 =?ks_c_5601-1987?B?T3BjT25EUk1jY3ZqS2REeEFnaDNzYUptVDhzRDNzUDJ0VE1mOHBH?=
 =?ks_c_5601-1987?B?WDhCY3ltSStRMm14QkNZVXd1aXZzUEF6TkZzbnJBNUJUamxvL0V0?=
 =?ks_c_5601-1987?B?cmtMY2pzRFJJbGxCaTNMQUU2TzZzWUN5dzFNSmtucjdzU0kvdVFu?=
 =?ks_c_5601-1987?B?UGtqM2RIVlhpdkN0WGFXK2hLamM1ZWJpWmpnaW53aDRpNTM4a2ha?=
 =?ks_c_5601-1987?B?NC9XMnN1am9yMVFzMSthVEFtNHQxNEt3dUFxclM5TC9PYi9sckhk?=
 =?ks_c_5601-1987?B?R3dsemlxRGhWUElnK0J5YzBablMwU09vcjlnZElkcVcxTGozMGlw?=
 =?ks_c_5601-1987?B?RDByNUZ5YjY4UWhmSFg5UG15WW4xU2RHVmdkYzg5aHgvdGpGYVJZ?=
 =?ks_c_5601-1987?B?OVJWcHdQZkVMdFNtSWxSMWMxek5YWmFsc0dweURVcWlnNUZTSkha?=
 =?ks_c_5601-1987?B?NGtGVGYrNVhNRkNONlo0c0FFZkp6eEQrQmYzMmlSeHBvTUpOOXE2?=
 =?ks_c_5601-1987?B?MWxqZW5QL0lOK2F2S1FTa05ibWF4WXhsK0VvMkk2RnVnS1MrQUlT?=
 =?ks_c_5601-1987?B?czRiT1kwLzVBbzVXRERyelhPTDYwSnpublJRVUR5d243SURqWDZK?=
 =?ks_c_5601-1987?B?Ynp2Z0tpMjJCcFhwaDRrbURDSVM2bk5sU0lZenNucFdaVzhFaGRC?=
 =?ks_c_5601-1987?B?dWJuSjExaTcyR0RIWFlhclJWSVN2UTh5dEtBSU96bVpvcms1bWNG?=
 =?ks_c_5601-1987?B?a3ZVTDBPdEx5bDl6NW5jUnp2WThLOEd3Q0dEQVNvTHB3WTNuMUs4?=
 =?ks_c_5601-1987?B?aDhHNUF5amRuOEhyL0FWdVZXcE1LWG93YlJTQ21nNTZxMmlFNmlE?=
 =?ks_c_5601-1987?B?Ui9Fa0dqT0xYaVBTOUNkZlgzeFJPVENwcFZGZnlYRHZ4UjFKdTJ5?=
 =?ks_c_5601-1987?B?Y29sS2Jmdk1aTzYzbzJUNEFIUC8wb1FRVStFMEp2RFI2RU5OWTNX?=
 =?ks_c_5601-1987?B?RnBjbXlJRUIyZ0VyeVlKK0FXekpRajU2SHZXY0FEMmxIVzNsNGZP?=
 =?ks_c_5601-1987?B?MXRLZ1JWdmNkSjg3cnVvbm0xVGpTemQyaGhSK0k4SU4zVnlVc0pr?=
 =?ks_c_5601-1987?B?TWd3UUl1aWpzay85Ynl1bUhlWjlUeHg1NEZmdk9jUmpVNHRjS0Ey?=
 =?ks_c_5601-1987?B?OEVwUkFSa3dBSURCSjl5S1JacjUyVDdvNlFRaWRadXNoNmJLK0ov?=
 =?ks_c_5601-1987?B?bHZYNWpoL05Yd1dTNGJqajV2bTdhY1ZuOS9XR1ZRNUdERFZ5VTZS?=
 =?ks_c_5601-1987?B?c20rbFE2MlUzL2lqZzlKdnVjaHg4VlhRalovWGZhVlA4cGtNZ2Za?=
 =?ks_c_5601-1987?Q?v+8p5B1cNKtMpZHBE8w2va/YMP73zo=3D?=
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c0a1b1-297f-4743-fcdf-08dc72483db0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2024 05:56:17.7788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZlDjHerjaZWUdYLWXu2PdBDhhJ4yrMmpRK52Vz/ZWTX1Xso0Z1s+bo9RIShOHw8zyi02vYlJmRoDfCt5Vy8ZLlf2a/1T51fPCplbazg4wtd3Dp/Xq0lUWEigvZrGXTBh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB8714
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 05:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199208

SG9pCgoKPgo+IFRoaXMgc3RpbGwgZmFpbHMgb24gdGhlIGF1dG9idWlsZGVycywgSSdtIHByZXR0
eSBzdXJlIHRoZSBjb25maWcgZm9yIHRoZQo+IGJ1aWxkIGZvbGRlciBoYXM6Cj4gUEFDS0FHRV9D
TEFTU0VTID0gInBhY2thZ2VfcnBtIgo+CgphaGEhIHRoYXQgaXMgdGhlIG1pc3NpbmcgcHV6emxl
IHBpZWNlIC0gdGhhbmtzIQp0aG91Z2h0IGkgcmVhZCBzb21ld2hlcmUgdGhhdCBpcGsgaXMgdGhl
IGRlZmF1bHQgYW5kIGdlYXJlZCB0aGUgdGVzdHMgdG93YXJkcyB0aGF0Li4uICJhbHdheXMgY2hl
Y2sgeW91cyBhc3N1bXB0aW9ucyIKCj4KPiBUaGlzIGV4cGxhaW5zIHRoaXM6Cj4gCj4gYnVpbGQt
c3QtNDE2NjYxNCQgdHJlZSB0bXAvZGVwbG95L2ltYWdlcy9xZW11eDg2LTY0L3Zhci9saWIvCj4g
dG1wL2RlcGxveS9pbWFnZXMvcWVtdXg4Ni02NC92YXIvbGliLwo+IKanpqGmoSBkbmYKPiCmoiAg
IKanpqGmoSBoaXN0b3J5LnNxbGl0ZQo+IKaiICAgpqemoaahIGhpc3Rvcnkuc3FsaXRlLXNobQo+
IKaiICAgpqamoaahIGhpc3Rvcnkuc3FsaXRlLXdhbAo+IKampqGmoSBycG0KPiAgICAgpqemoaah
IHJwbWRiLnNxbGl0ZQo+ICAgICCmp6ahpqEgcnBtZGIuc3FsaXRlLXNobQo+ICAgICCmpqahpqEg
cnBtZGIuc3FsaXRlLXdhbAo+IAo+IDMgZGlyZWN0b3JpZXMsIDYgZmlsZXMKPgoKLi4ud2hpY2gg
bWFrZSBtZSByZWFsaXplIHRoYXQgdGhlcmUgbmVlZHMgdG8gYmUgYSB0ZXN0IGZvciBhbGwgdGhy
ZWUgcGFja2FnZW1hbmFnZXJzOyBhdCBsZWFzdCBvbiB0aGUgImdlbl9wa2dkYl9mcyIgc2lkZQot
PiBleHBlY3QgYSB2OAoKPiAKPiBBcmUgeW91IHRlc3Rpbmcgd2l0aCBwbGFpbiBwb2t5Pwo+IAoK
eWVzLCBpJ3ZlIGNoZWNrZWQgb3V0IGp1c3QgdGhlICdvcGVuZW1iZWRkZWMtY29yZScgcGx1cyAn
Yml0YmFrZScgbGF5ZXJzOyBhbmQgcnVuIHRoZSB0ZXN0cyAidmFuaWxsYSIgb24gdGhhdCBzZXR1
cCAtIHdoaWNoIGRlZmF1bHQgdG8gdXNpbmcgJ3BhY2thZ2VfaXBrJyA9IG5vIHdvbmRlciBteSBs
b2NhbCB0ZXN0IHJ1bnMgYWx3YXlzIHN1Y2NlZWRlZCA6LUQKCmZlYXR1cmUgcmVxdWVzdCBmb3Ig
dGhlIGF1dG9idWlsZGVyIGxvZ3M6IGluY2x1ZGUgYSBjb25maWcgZHVtcCBhdCB0aGUgYmVnaW5u
aW5nPyAob3IgYSBsaW5rIHRvIHRoZSBjb25maWcgZ2l0IHJlcG8gKyBzaGE7IG9yIHRoZSBkb2Nz
PykKCgpncnWprApKb2hhbm5lcw==

