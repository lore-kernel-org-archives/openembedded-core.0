Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8BEC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 21:34:06 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.78])
 by mx.groups.io with SMTP id smtpd.web10.2475.1716500039979568936
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 14:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=XdDB8UKm;
 spf=pass (domain: siemens.com, ip: 40.107.247.78, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYGwspE5R9kGKxEurHupaNI2DxrTMG3GUcOFttp/GzAwjeXomPEsN6kCgOSHq+2fVajx1SNy0Zp7tDNGHLYnxrS9Lnae17gYTTu19GCFgGFoBwz3r7aKl1CZpdVCh9uAHYpeKr5Kztu7HgUAMvl8VuxWHEIhKL/4zGXfhTAxnxnsABgChO8ImbZEypf5cpzCsHbeKlWO98lukWw1D90C4nC8Eiw+pwf4nPEvg8w7WYY7BZMD/myr12MMwdOs8o8lOX10nRrOznLd/p5Ah/9qpixqtF95/dtsCa2/4L2zDsAu3SUS6Eal9oXIFXs5fnwMr8Gn+mGI6M7RZRNr9mJhbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUIoFCbrtgJJYjh598Z4Kq2m2ArdnIPBIJQSbOeZdt8=;
 b=TUreszr3jgScPbxYC2+OlZ3JKbRWybyMAwqYKbFYHBPMwo1hB5FnBNgU4dGbhNtyrrolZks3zVt1tfk5FvRAAtRxPWuBGI55QnOE2eLgWqagdbAMezE+WmJg1vDmakiX7kCLfpwRt1L94AGi2qzwG+qS7hVUAMpPz0bIO8EzGMochr9ykpjvMh7p9xKJiJWXqXlQVQ5bjoubVAgZ6gGISbQ3oEoIzvlSBHLa8/Wf0B1R1Z68UVgncnL3YeVRxXfU0sCf+MKe3gP91aJu/LEL9f+BL6I63GgCFzVemEXG4baTBCEMOkeF1f3H4Kef2vhFciPJlPvHhvKHbAZsL/QnTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUIoFCbrtgJJYjh598Z4Kq2m2ArdnIPBIJQSbOeZdt8=;
 b=XdDB8UKmoCotTK2VV0Mk64UJERemI1Gfv5mdgOEXpiOwz+/yHNI9sFiATnxzu519YBbNyGKuwc9ASitDUmLNQJLK/zlqq1K84hT2KfrGhzqWzT3aVejn92r7AD/WrWyGkAQvoiiNGDsAaj6wWmsbcxH4D3ek6z7cOSfrBq/nYv6AduyiiIjTnod1dii+WFv69T5nG2/wS34cRyQrzPU3+RrlYSkjHd8KO7Tds2k/bVtvLdLwys3vMkpFbwsiMAv4BGtPUAfFAmdeqlOUS/6vDOyKmfC5T9+lfS64D3yYVMTPBfT/iLPl5pYZws9sL3cKXov2h6mCKCb+4LtrP1yI4w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB6561.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:81::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 21:33:56 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 21:33:56 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Steve Sakoman <steve@sakoman.com>, "quentin.schulz@cherry.de"
	<quentin.schulz@cherry.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] scarthgap backports
Thread-Topic: [OE-core] scarthgap backports
Thread-Index: AdqsidQ0tv3Ttld1QnygjFI3/SsJxwAjbR+AAABwgQAAD9R/sA==
Date: Thu, 23 May 2024 21:33:56 +0000
Message-ID: 
 <AS1PR10MB569731BB547B9ABA28D2122DFDF42@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <AS1PR10MB5697A571F24C68195FB82070FDEB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <f0452dbd-636d-474d-b87d-caf6c0680843@cherry.de>
 <CAOSpxdbW=mH6Uy_hGOiG6N2ioDhjJJNPsh_MirkkYWhfoUuGCg@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbW=mH6Uy_hGOiG6N2ioDhjJJNPsh_MirkkYWhfoUuGCg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a2d51978-ecf4-4abd-af4a-bb148f32e6bc;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-23T21:31:45Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB6561:EE_
x-ms-office365-filtering-correlation-id: df3992f6-3f1f-43e0-91fb-08dc7b700d07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ejRKcVJUakgvd1IxRGZUaG1JZ1RseThNZEhZeUNKQkpPQUhIZVF2QnlzWkhw?=
 =?utf-8?B?dE5zOVk4TS9xVW5FRVZ6VEhWYzZ6SFJHNXF6K1RCdHkrTnVYWitkSXJ1YXVB?=
 =?utf-8?B?UVhCVmFGbzZRQTd0eTBhSEZ5NDZpalFRbEtETWYrZHBIMGtadXNVR0Q2NmlU?=
 =?utf-8?B?SzZPdjc2dmhqWlI4UTUvbE5zQzNhZzU0amE4bm9MalhlcjJsZSs0cVRWWGRu?=
 =?utf-8?B?Nld1aHJJY3dGcTVvaXcweDZmY0ZZRU1tVGZsYVE1eWdqZTRWcFpmNG1HOE9k?=
 =?utf-8?B?dklLWm51VjE5MTU4TEpWNjZnbGxuSUxBMTgvVTB2cDJVUUVhQjZ6eVpIL0JB?=
 =?utf-8?B?SGZYUUlaTVJnRFM1elp3RmJXRzdMREtnVXFHN21IcFA0enNSYmV4TEtNMWRn?=
 =?utf-8?B?Q2JibUZGMmFnOHlUT2I2ek5WVmhEU1JZZXpkekJINXhkUW9INFRZS1k3ZDcr?=
 =?utf-8?B?TTlscHk0V013aDY2UjZuKzlvQ1ord3VZbjVERHlWdDZSd00rc0JQVlR4Wnhi?=
 =?utf-8?B?Yys1NitvN2VkWndFZ014dDBUMHBHSUprVzdxQzZrNTdDLy82RG9uWTNaOGxC?=
 =?utf-8?B?bjdXN0FXWThUdmJLR3d0b2VrZWV1WHlveElwVU0xbEYrN2J3cEpBNy9SRktV?=
 =?utf-8?B?SU9BMlZOOGpJUjY4dEd4cjU1WE9mcC9OcjNlaWlFLzZMYS82aWkrekZoOCt4?=
 =?utf-8?B?Q3ZnQTEyZDhMclY0ejVpb0RMelhIYmJpWFA1ZkNYRTBndWtBZmJwWkt0VXg3?=
 =?utf-8?B?MlVWdFFJYWYvclFvdjJrMjV0azd0NUg4MlFPUStHc1RRM0JZM0UwZk1MdExq?=
 =?utf-8?B?WjJlVmRkTUJERXVzNTY0T1JNQVJ1cXlFWGFaMkNMalV1QjliRVJFNlpEOVVR?=
 =?utf-8?B?ZVVYOSt0ZzUxcHZwV09VLzJGTTdDUDhSQWVubWdlR2RubFAvWFg5cVZMRzNh?=
 =?utf-8?B?aWVnVUw1TlJwcDhGalZhc0FaYzlkWU44YnU2UHhETlBGN0hvMkRpUE9iaE1V?=
 =?utf-8?B?M01tUWJnY2RKWGRmQTFMekhDcEJ5cjEvWnMwLzh3Q2FhdFpENFFtbVA0SWtO?=
 =?utf-8?B?VjNHMGVVM1BlUk9NYzlDdWpmLytkYWZsQm1obHBVN1R1NG5Gekx5V1pDeXY5?=
 =?utf-8?B?N1FiSVdkM2pad0pzSTBwelpWUEZWSHBlT0p6bGdGRmxGZVl6aks2S0l3dStR?=
 =?utf-8?B?eVQ0WEg4QkNaVDR1cGRvblNPazdPTTluMVpDTDExcVFrODRvU050SytEVEg2?=
 =?utf-8?B?MlJKN082OWlkVE1sRXVWQm1nSXk5NVNlRmRxNzJwL2UvWlB5NjEyTjBrQ21D?=
 =?utf-8?B?TVcwbXMvTWxLck1CSTRmQ0ZINUFUc00za1VvL01OSEh1ZTUvN0RVVDhZQWs4?=
 =?utf-8?B?c2lwMFpJRVh4LzVrUERidDJyS0k2ZVlzTEljYTBMbnQ1MG1mTWU3aWZhTGI1?=
 =?utf-8?B?azliaENNT0V3ZW9RWFdrVERJVXdhY2pvZnBBbUlpRHhXM2dJbUp4SnlIaU9u?=
 =?utf-8?B?SlVpNjJRTkNtUzNhSHFpanNhSVErclVIcnNXSHlaTS9TM2NhTExjK3ppVllP?=
 =?utf-8?B?VitSZWpDUnNxT3Z5dmgwSG9LajVjVlRxUzF5emMveTdLcCtLMVhSVm42VVov?=
 =?utf-8?B?Y1BGOUcxenR0TWErUS9TdEYvdytNWm54bEdvSUlTTXZuVnc2bjNkZjdHN1JV?=
 =?utf-8?B?Ym9yQnpjQUlZWTEzV1JwUG1nOTJ0anZpTndlelBORk1rZ3lKSGViTWxTN0lz?=
 =?utf-8?B?am5SenY3TnBQeU5ONzJxT3ZxY2ZzRFJFb0FmcWs1UnhTZ284WmpsYVQzdlk5?=
 =?utf-8?B?MWtkc3BIM0lBRS9hdDludz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bGdqVVBVZHpNQXlPWUFXbE5ZMm1sbTAvanhzMlRUK3AxZzZEekRwMkhiVlpV?=
 =?utf-8?B?a2RNQnU0TjNzS1M1QWNmdXhSbS9oVHhjVTQ0Y2FyRjN1TVlvbmtUNUZjeEJS?=
 =?utf-8?B?N1E2VWNQSFY1TE8zeXJWM0VqL09wbElURFVycnZKeTRpc1grdEhEaHREVXRN?=
 =?utf-8?B?ekVLd2NiMnhGWFhsaXRqd2lkbHF0b2REdkJGQ3k4QVA0amdCWFlDalQ1S3Av?=
 =?utf-8?B?S1lOZFBQSkJqaXpXQVRmMzdiM0E5eGc1OVJUODFZNm9hVVh1alg3MWxsMkJF?=
 =?utf-8?B?NDg3MTM5TCtLQ0N3RmlxTndENkVBUE56SG1NaGtlMElqQ2pyZU5panRPa1N0?=
 =?utf-8?B?b0doa3RmbjFKMHJ1R3FKS0JPbExmZ2djNnF4RS9CcVZkRHQxTjJqZnViVWpv?=
 =?utf-8?B?VVZwdDR6a0V5ZDN3Z1RhZlZmRFRGekQ3SVdtWXZpSzBPckcwSHk5RU5BelhU?=
 =?utf-8?B?b0pPTHp4aHZ4YVpVWmY3OTFUQmVBMUtsMlVyTlVxUHhhU0xLM1pzQU4wSlZt?=
 =?utf-8?B?V1VpckFDVkJPenQ5bVYwTEdVOG1ObTlkRnhqYlhUMXR2ZnA0VEwwbjEvVnpU?=
 =?utf-8?B?cGtlbVJZQ0hZSGVZTXRydHlKMTUwUE1uaE1lSXprVUtZMXE2YWNaencxTXdB?=
 =?utf-8?B?dGpnWGJlYkw2aWpUbVR0dkF6ZW1TdjJpeTV6d0JyUDhORjJvWXdIcklqNHpM?=
 =?utf-8?B?aTR5T3FBVlZsa0lQTHY4NGp2UHU0bnNSS3Z5bXhzZ1RJSDlMNHVIODN0ZVlO?=
 =?utf-8?B?ZFh4ZXFXdTVTSDdBNXk3RlVTYUdwR1pROTEyUEc3SFpWRVc3TkxjeVZZSW9I?=
 =?utf-8?B?emdpOUxTNW9oc1FsME5VTGJJU1FyNS9KaS92dnh4YWZmeXdRTEhyQ29FcFUr?=
 =?utf-8?B?SUNZcmZJVDV1WUZielAydU1NcFJ1Z3NqdVRGTFh2SUViYk5EUjRLaTNrVnVz?=
 =?utf-8?B?c2F6N0tGbWhnTk9nNVQ4V0c5bDFkRWVWZEtDalBQTkpIQXdGT2NXV2p4NFJw?=
 =?utf-8?B?eExqdCtZS210QWdjdktEajJ0bnZuVTVxNjRCS09pYUNYNHhuVHdMT1RiSzVB?=
 =?utf-8?B?elEwL2kxVmVQM1crNC8rVnNCMFp5K1ZSRTlyQVpXVDVWUnZrRStlZ09SQ2tv?=
 =?utf-8?B?MnJtTU5MOWQ4U2M5UzZUSU1XZ3BXZi9zcmltN2hnc2dpNDAvaHBMRi9jaFhO?=
 =?utf-8?B?NWxadUJJNHFsSytvbStIeFdMR2d0Q2FEMzFPZzRqeHgrY0pGVHlFR1RlNE9s?=
 =?utf-8?B?Y2Z4S3NkOXgrT1kyTTVwNTVlWTZzWVN2NGFKTFdwMHY1amxTbS9VaHd1NmdN?=
 =?utf-8?B?aFNCdm9iZFFlZ2ZrRUZJdmp1bDZsZ2RoYzRrelRkMTdqYmFEYXQ4YU0wZ3ky?=
 =?utf-8?B?RVg2QnF3bEhVU2t4RVRVRTlHWmZKSVZxNUJ2bnNiWDM4WlY2U0RhMGp5Z0Rj?=
 =?utf-8?B?V2t4R0FaWFFiVXl4aGlqMlhwcTlUZy93bjdHS2FGOFplcmY2UlpLd1lMNThU?=
 =?utf-8?B?SlNiQkNoTVp0Tll1YkxZNmwyT3Q2eEZ6TUp5aHliMWlvRUVVMkhIa0FBdzRL?=
 =?utf-8?B?dUVjUi9GN1pjNkJEQzB5YUNiOC9UTVBJZ3pWblBENXVXTElaSUdjdkdsM01C?=
 =?utf-8?B?NFdPWElmYWRPUC9OSENIZ1p5RFk2Y0s0YkJ4MzMxNnZnc3NMakIrelBaZnAw?=
 =?utf-8?B?b2VacEVTckIxK1IrZ3pabHVKWWprbmJ6NDlub0NsNHpjaDZjS2N4ZENTMmV2?=
 =?utf-8?B?MGFvMnNTd25xdDhSU25iMGhPRGk4Qjl2ZktkWERGbUo3RXh1QlY5cWFHMmNz?=
 =?utf-8?B?amtoYklCWXU3MUhESzQyTG1DV21LdDZ1Zm1Jd3dVRmgxZGFvMi9SN1grTGJv?=
 =?utf-8?B?c3BmYmlGUXRUU1N0UGV1TXd6dzRUOFRUeURhamJRYkJ3MzZtZndOR2RmT1ZM?=
 =?utf-8?B?VVNFeGtxaEtnOThKN3cvSXh4RTQ0QkIzUXR5c3FnNlNYNng1QVRNZHBOYlZV?=
 =?utf-8?B?UUFKbVowRG5KR2tpeGNMYjhhcG1ycjFSamV3R3I5NWMyUldZbENXd3kzWFpj?=
 =?utf-8?B?U2ZsTzM1QXJYeU5SVzdJNWVJZVhETVU5cllJeWNJUnNISnlReTM3cEJUOVh4?=
 =?utf-8?Q?dM6x69LiT2pz6WZb6H90V0sNL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: df3992f6-3f1f-43e0-91fb-08dc7b700d07
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 21:33:56.4520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pyr+vreXqsAVRU2N3lLBjOwGwE9FC0jiQAPK1QauQHnSzNjtmhi+to2tlSuIn2z86dSxrJrQNMTBwp23NPpRHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6561
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 21:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199821

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNh
a29tYW4uY29tPiANClNlbnQ6IFRodXJzZGF5LCBNYXkgMjMsIDIwMjQgMTU6NTkNClRvOiBxdWVu
dGluLnNjaHVsekBjaGVycnkuZGUNCkNjOiBNYXJrbywgUGV0ZXIgKEFEViBEIEVVIFNLIEJGUzEp
IDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gc2NhcnRoZ2FwIGJhY2twb3J0cw0K
DQo+IE9uIFRodSwgTWF5IDIzLCAyMDI0IGF0IDY6NDbigK9BTSBRdWVudGluIFNjaHVseiB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cXVlbnRpbi5zY2h1bHo9Y2hlcnJ5LmRlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gSGkgUGV0ZXIsDQo+ID4NCj4gPiBPbiA1
LzIyLzI0IDExOjEwIFBNLCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3
cm90ZToNCj4gPiA+IEhlbGxvLA0KPiA+ID4NCj4gPiA+IEknZCBsaWtlIHRvIHJlcXVlc3QgZm9s
bG93aW5nIGJhY2twb3J0cyBmcm9tIG1hc3RlciB0byBzY2FydGhnYXANCj4gPiA+DQo+ID4gPiBU
byBtYXRjaCB2ZXJzaW9ucyBpbiBzY2FydGhnYXAgYnJhbmNoZXMgYmV0d2VlbiBvZS1jb3JlIGFu
ZCBtZXRhLWNsYW5nOg0KPiA+ID4gYWRjMjY1MWE4ZTkwMmFmMjRmZWU2ZmYzMGE3MmY0YjdjNjNi
ZWY2ZiBsbHZtOiBVcGdyYWRlIHRvIDE4LjEuNA0KPiA+ID4gMDJkZjJmYzYyNDFhYzhmYjBlNzhm
MmZkZmY5N2EwNGU1YzU2MWQ1NCBsbHZtOiBVcGdyYWRlIHRvIDE4LjEuNQ0KPiA+ID4NCj4gPiA+
IEZpeCBDVkVzOg0KPiA+ID4gYmRmN2I3NDYwYTQ4MTZlM2Q0NDcyNjQ3MzBhMjgxNDIwOTY2N2Zi
MCBuY3Vyc2VzOiBGaXggQ1ZFLTIwMjMtNTA0OTUgDQo+ID4gPiA2NTczOTk1YWRmNGNmZDQ4YjAz
NmY4NDYzYjM5ZjM4NjRmY2ZkODViIG5jdXJzZXM6IEZpeCBDVkUtMjAyMy00NTkxOA0KPiA+ID4N
Cj4gPiA+IFZlcnNpb24gY29ycmVjdGlvbjoNCj4gPiA+IGM5NGU0NjAxOWE3ZDQ0M2NjYzQ3NjNi
YTE2ZDg3ZTdlOTdhYmU5NzcgdXBkYXRlLXJjLmQ6IGFkZCArZ2l0IHRvIFBWDQo+ID4gPg0KPiA+
DQo+ID4gSSB0aGluayB0aGUgbW9zdCBlZmZpY2llbnQgd2F5IG1heSBiZSB0byBzZW5kIHBhdGNo
ZXMgd2l0aCBbc2NhcnRoZ2FwXSANCj4gPiBpbiB0aGUgbWFpbCBzdWJqZWN0IChzZWUgLS1wcmVm
aXgpIHRvIHRoZSBNTCA6KQ0KPg0KPiBZZXMsIHBsZWFzZSEgSSB1c2UgcGF0Y2h3b3JrcyB0byBr
ZWVwIHRyYWNrIG9mIHRoaW5ncywgc28gcGF0Y2hlcyBzZW50IHRvIHRoZSBsaXN0IGFyZSBtdWNo
IGxlc3MgbGlrZWx5IHRvIGdldCBsb3N0IHRoYW4gYW4gZW1haWwgcmVxdWVzdC4NCj4NCj4gSXQg
YWxzbyBnaXZlcyB0aGUgY29tbXVuaXR5IGFuIG9wcG9ydHVuaXR5IHRvIGNvbW1lbnQuDQo+DQo+
IFRoYW5rcyENCj4NCj4gU3RldmUNCg0KT0ssIEknbGwgZG8gdGhhdCBkdXJpbmcgd2Vla2VuZCwg
YWx0aG91Z2ggaXQgZmVlbHMgbGlrZSBzZW5kaW5nIHBhdGNoZXMgb24gYmVoYWxmIG9mIHNvbWVv
bmUgZWxzZS4NCg0KUGV0ZXINCg==

