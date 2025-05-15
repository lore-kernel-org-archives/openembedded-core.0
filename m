Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235FFC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 14:24:35 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.73])
 by mx.groups.io with SMTP id smtpd.web10.14074.1747319069257602551
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 07:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=KOdehz05;
 spf=pass (domain: ericsson.com, ip: 40.107.247.73, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WosNCKWaxiY3t6VhK21tEgR8IL6Bs8S/hxgUez2lI3kFy85TGLROdGg87BXobKmZdReyWlkbj3yewUDYVQg2+oPxzFNnwxpSlANPrkdcTzipmttBIT9Md+LzopC4s3CMvCWa9NA6YhUII9vMbnaYyN1xeByOEoYru3SXJJx/eNoQA1BziGRecXPHs8wjRaH/F0vG4L8ce61K5SY7GVc2NHbpZWdmM9nSf7Hdh4kV7OYYjWznkrdjeUXZbnmMk8qc2AsPkE+Resel8qoodFSfiJ1oHJPpdKP8C6FGwHbUqSSWuW/nF5/3LjpX1QRfFsXgzFeLF8+tEnAhs6vTkW6EcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ioXeh2xXnMJkTXE1kprSYSma65F2M/7tYmdqaepKCY=;
 b=dgqg1vTKWepX49cGCprbGz36sJnu2193GC6lfLXnnu4Vh17szeFsArVR1XPOHE5tpCJyx6OTPDFtFWHwURnJORVNF9lsU7wavHcBNiy/BtGZXpTexZeBeXg2mK1ytg+O18kqPcVV0PpmZ5mjg3SPhmhlPZtJeHuuHFJjgm2/L1OVK0d4nXfGaN0MhQUVwHtN5ecIF/ovKrDXx1dTHxa3e09cdl0hhpz5FZtK7kMkc+1sAx9dsyWzHBmw4rtnb203ozN8ZSYX7PyvP3j01QtlatyLlWXHCglJ0FIx0/DCzYvRAcOy3gJTykCuwA3k53pkR0o8Itztc2EqDIGH9rjd1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ioXeh2xXnMJkTXE1kprSYSma65F2M/7tYmdqaepKCY=;
 b=KOdehz05VTGRQFvL+6nw1krwrTHk5IZuuGCgl4/Qhi2PdM5Eo/ECyM5tkZAD6qsoXfGqq5HMFLgtRxjm4PFH9IAz2IYMcsWxCaAWXpwE79ayDY3mR0hQK335rFHmMjP72s5DmLmahZLq2xltJ0ta1b4/d6yHcU6cf+cMUmPVsOXlxOWx6A9Zp8YxOmxAvnY5LaBq8E3cXcZyhoLaT+BDY5kYHVWpIzZexqhiXHjTgeb7DHP4MMUnug6QSwzP5YHnMDrydn5icYuESx4yLJr4DIU7zgLjS1xUwGTpGejhcKU3wAhjx2JFQ1B9CIPSOhcIASltSMLrBXOVbnXeQPiGTQ==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by PAXPR07MB8675.eurprd07.prod.outlook.com (2603:10a6:102:242::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 14:24:24 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 14:24:24 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Quentin Schulz
	<quentin.schulz@cherry.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Joshua Watt <JPEWhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
Subject: RE: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
Thread-Topic: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
Thread-Index: 
 AQHbxNVCY7B1PC0uk0ynF6zYbWHdwbPTmyoAgAANXoCAABISgIAAAJoQgAAEeYCAAACkMA==
Date: Thu, 15 May 2025 14:24:23 +0000
Message-ID: 
 <PR3PR07MB66666F329CC63C6FC7B44A938A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250514125706.495571-1-daniel.turull@ericsson.com>
		 <20250514125706.495571-2-daniel.turull@ericsson.com>
		 <07ef3a4c-265a-40d2-939b-d3843662df38@cherry.de>
		 <PR3PR07MB666678F2C4E5BA67075D490D8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
	 <d3de733ea61431156cf005cf3533d2bf4c733bb1.camel@linuxfoundation.org>
	 <PR3PR07MB6666EF14AE5F8BE55787B29B8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
 <1d1da24017b74ea7861d208dbbe3daa03391b898.camel@linuxfoundation.org>
In-Reply-To: 
 <1d1da24017b74ea7861d208dbbe3daa03391b898.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|PAXPR07MB8675:EE_
x-ms-office365-filtering-correlation-id: 1794100e-a82a-4247-d4a0-08dd93bc30df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?b0EwYW1LNnBSb3hkZzRxc2I4a1NmTUZnelEwVDFKZWxuTllrVzdTbGkveUpx?=
 =?utf-8?B?MmhEcmZyZzFUQTRyb3NBZkFXL0pFQ1FGMkVWR1NONVpQNmg5SktMaDAzdVVO?=
 =?utf-8?B?bmU2bUJaZ1Vmb2N5SnhvSDNnTGdGckxPbDlsNjBaaklKUnpXa01uTWhveDZN?=
 =?utf-8?B?cG9XSVRTLzV0c1FnYitqS21qcW94VFdLaDY0L09uVHZsQmhRL2tLOUd2bldD?=
 =?utf-8?B?VTZGVVNuSTl0YVIvalFvdFZ3RGV2ZnRHaDc3ZGQzaS9TRmlWQUhmNklTV3Jv?=
 =?utf-8?B?SEVIZ1N6L2dTZkdkMWQ0OHhTRXFGRnhBSFp6cFNwc3lZNGZ0Zy9DQmVhR3ox?=
 =?utf-8?B?eXkrY2daSVZhZU1oMGJ1SGpPa3grNWdWK3Urd3hYVDJlcnFkYitzbkVEZUVL?=
 =?utf-8?B?R2Z1MksvTTZoeXNJTjVIWVYvaDRjWEg5di9TYTZtOGJzN1daZ3N3WEs4S21Z?=
 =?utf-8?B?WmhsaTRWdkttWkdxdElpNnI0eld0RFptRHhwMXlrOWJJTWdlZ1Fyb2ZBU0xy?=
 =?utf-8?B?VGVKMzNIZ1BXNE9NbC9kNXY0a254azRDTjgxbTVBU3J6aExJdFIybjk4NlJU?=
 =?utf-8?B?S0h5Z3Y4V3oxQlYxcXUvelQwZU5YVnk0MGovZlpNdm1PMEVYNUVFcTFMUTJY?=
 =?utf-8?B?Z3l0Vnk0bzBkLzRxaUpwK0pZYW5JK0J6NWtzSEJ2a1VTS0dZYjZmNGljaG5y?=
 =?utf-8?B?QSs4aWQ5VUhuNVo4UmhYaUswcjU4MUZuWUFRU2cybzAyQmFBY0xYUTRzaTQ0?=
 =?utf-8?B?a3hpUlMzUDg1dkJjR2dHZ2lucXB1MEdYMXNERjA3TWM1S0FYSlZ2b3NKcXc4?=
 =?utf-8?B?SkN3d0lyVVNLZjFKZDhucC8wakxOTlZ2Skd4dXlkN0FyS0dMNnY0K2RNc09a?=
 =?utf-8?B?emtWMWs4R1B4TXZvWURpZmVPb1lHTkVKMlNXaFd6WkVUd0tscnNZVWROZ2da?=
 =?utf-8?B?T1pQK0p1OWwwaVJaZlNOamQ4Q3FEY3o1ZnhITVlUbEJOSjNkLy9ZTVRWZklY?=
 =?utf-8?B?ek4vcDBDSzJWVW51ZnRFdzNoYTRmNmU3Y212VWtiSENBcUJPTEx6MVcybXcx?=
 =?utf-8?B?OHBreWZJNTZwYzZNamVxUkQzeXA0RU45ZVByYWlXOFpQeHhiMTZyY25zcFZ3?=
 =?utf-8?B?bnJxTEtVaytlSldiM0RRMGdVMjlLYU9NSFBSSTIxUXlqNnFxQnhwL2dtS0do?=
 =?utf-8?B?R0R5V2Z1V2VxbzFOSlNveU9hSWhEM2FFOHVHanIyUmhRTmJ3ekRJNUtzeXhX?=
 =?utf-8?B?TmxkREkvblc2WklrTjN5MjdHaXMxM1ZEcjNlcWo4VzhiY2NIZ0JoTlZrYTZH?=
 =?utf-8?B?cTBoRHFMYnJGY0lnWThyNmhzN2FsMGZKVHVQSWNYOVF1cFhLc3RsTzczaGRZ?=
 =?utf-8?B?L0lTK0tEU1RZYnhCT2hWM2lvaU8rd29nQ1VnWSs2SWJrTTBXQUNtaEZsL3M1?=
 =?utf-8?B?a0hNa0Z0Y2FWNG5LTHFzaGl6bHdTU2pTQ08vMDJkQW9rV1VHc2JSamtLcXJC?=
 =?utf-8?B?dGxCc2pRaC9VazVPMEt3b3hjWFhKbHZ3dUdvRVlvSlVZM2k3Z1VibW9FU0Y1?=
 =?utf-8?B?YWdIMUdnS0dIYXpCVEdJTkFTb3lESTM5MFB2Qkd4akc5YmwvZmhSalFXTjE1?=
 =?utf-8?B?ZGU1VkxQSVFWa1RGdUI0ZTNobkVyOWk4LzBlSDB2RTh6MW9IT2JVaXo0V0c0?=
 =?utf-8?B?S0I4VDJSY09TR2N0QTY4WHczSlZ6RW5VYitxMmNBUS84RTNWWXU1azR5UmZB?=
 =?utf-8?B?WXhmOHBraHl0QzY0NDVHdGVzays1ejlUNFlNQ2pKbEtHdWtGOVlJWmdEYU5V?=
 =?utf-8?B?TmxuTGZZUTRjYm5ieDhFTWd2UkFNMnR6d1lDSWpUdkNRa3JKTHdEZkJPNXVy?=
 =?utf-8?B?QldlaGxuaDE1dU5PelVxWUVRbng5aW53OFJoZ0E4MHZMUUx1THdzd2h1SXdX?=
 =?utf-8?B?U3FZTTFEL3FpNzFZcVJ3WnlRVnhaWndIdytpTWpsY3dQc1BaNEcwSS8vbnRu?=
 =?utf-8?B?MHpsMWlxNit3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?czV3cVhTZEE5SUx3dVVBNGF6QjJkVTBiTVk2MXQ4cjF0Yyt3UExNYWFBcmlP?=
 =?utf-8?B?bUJUdXZiQkxxc09BcUZBc2pqODlEN0lrdXY4NmtITE94Z005Q0VPOHJJYmZi?=
 =?utf-8?B?a1FUc25lMXVhMmpob05oNG1WVWZOQU1LVjRSbDdpbExOdmZJRFRZemxQTDZN?=
 =?utf-8?B?WjIyMWFmOVJ2YUpmVVFia2FWQktRM0FUcWZOQ01iRDQ2dUp2elNYS3cwTjFH?=
 =?utf-8?B?UUszWWFrL3d2TFhFdFcyMTU4OVZzZW9pTTNiY3kydmxhMG5CMjEvaWZ5cnlY?=
 =?utf-8?B?bFFFZG9PVFdPQ0wvYWFsdUpRL0lQSlVja2JURXJWU0ZDMDVGZVFqUU9PSVNM?=
 =?utf-8?B?M0N3ZUxMNlFncloraXlmbm44THdtK2o3bGlpQmhkZnNBZGFqaXhISVhBMzFT?=
 =?utf-8?B?cWowcm1kN3JFaERPdW9OSU5BR00zdmkxelVRT2FDNGFWdG9iWEgzTG56cHhP?=
 =?utf-8?B?MzFXK0ZEOC8vbGN1dzAxcHVhYVo5MU12M3RiWDh3cFNRUHA5Q1BldlNCZ1Bv?=
 =?utf-8?B?S1kwaDNhZHY1dDl2Q0EyUHpwYzM3Mk9YZjVGMkV2WlQ5em1tRVRabWl0NHBT?=
 =?utf-8?B?WTJXbG1tanJZUXJSV2VmcVl1emRtemZJREczVG1nVnpmRmRWaXNyQkdiTjhj?=
 =?utf-8?B?OTRtd3V0WExtMjZVcVNkNXpxS21CcWFTTXZzYWVpQURQVVRIUG11VTF3QnYy?=
 =?utf-8?B?bVMySXJDekw1RzZTS0xIa1VwYlFsMVkrcUFuWWszOEI1RU5nM2NPNjBMQ2lx?=
 =?utf-8?B?MWdwbjBvQjRWamdNU25OQ3RpRzlZbWRTQ1pqN1lZSlQ1b3EwOXR5Z2E2cGxy?=
 =?utf-8?B?aW83T3lQbXVCaWhDVkxMb2Npd1hyNTZWMHlCaDdScldrYjB6OUYvL3p1ZUVJ?=
 =?utf-8?B?SStSN3JXU1N5VUJTcjNjdVpvUGhuN1hqaHFUeWtNckg3c2V4ZWp1YysxdkQy?=
 =?utf-8?B?U3NscDFiemN4aFNxK0x0V3pib2JmM1JuUXNpMmExR0l4SnNRMDhEK2UrY2dy?=
 =?utf-8?B?NjdXc3pwRjY0cVk2d2NZMGx1NXB6ZUpPRUFzdE5EZUNTTDJsdUVTTEkvSmEx?=
 =?utf-8?B?K212SGllMkVuVEFIdFRoejF1bDN1eFk0UHBOTkEwbGFmaWdCMWd4QTYvQjgv?=
 =?utf-8?B?MnR5QUhMMzVXeWpzSUhGdnpLbEtiejZkMXovZi9weERFTUJ2SS9GMWVKSjlI?=
 =?utf-8?B?N0RoY1hUVkgrOFRLWW01aUVGNHpMWW9GRU5yS3FvVDVzQVIvaGZQc083M2t5?=
 =?utf-8?B?OUkyL3kwY1VNeWFYK2YzcXgvODdidG81Nk42NkRMSnFkOE5vTFdHQTFJc0RN?=
 =?utf-8?B?bkxpaFlxL2F5OXN1czdvNHdMcHpyK240M0Z5czI4T203b29RRUhYQkhZV3FD?=
 =?utf-8?B?TjVUVFZjSWxhbUhvUTZBSXhTcnprc3JZT2paYlNxUWxUeURPZWpRU0ZmYzB1?=
 =?utf-8?B?N1NudUtndEhjODdWK1lERFJDU3BSR1NtMHBRWGYxT2Q4ZytSemQwMTIvWTVE?=
 =?utf-8?B?Q3hCUDRWV25HQ3ZudjlYRTU5dWVtTWp2dTJsYXN0ZFZSMTAzMHNUVXNkZXpI?=
 =?utf-8?B?UlM4MGQ3N2o4MVFuWWtoa2RWN0F6bXc0V1E3VnpXdFNyQVJ2UDQ5aWJpWll6?=
 =?utf-8?B?ZUZKYkJzMTNvMkF2NDRJenBBT21UV0dzZVJ6bGhrbldqeFVSQVZPRElEa0RC?=
 =?utf-8?B?UUI4YzdJU2FGelFiQXg2R3dmYmlkWHhSbHdkMmZ4dk1jS3JpcFRiOVNwTlV1?=
 =?utf-8?B?bnM5KzhpTVQza0RLb0MrT1pqam1YdVFuNXpQa3IvNmxXMDg3K3F4U2x2V3BR?=
 =?utf-8?B?STNyOHJVL2FKMUFHaDlreDRiL2drWUQ1ZXFkblhaMXdIMkNBNVFnS29sR1Uv?=
 =?utf-8?B?OXg0MGRlMVBJM0VacHpURkhoL0NKUmNTdXZvMmI1SGEydklkOHJkZ2dHckFN?=
 =?utf-8?B?TVhxY2l6SE5XZmlMbTNQYXJaU1M1ZGphOXlqKzBJbzdPdWsvSHdYVE4vNzNY?=
 =?utf-8?B?dUhFekVkWUNMSEFrc2NrenNaOHo0aXM4amlSUWszTi9PdDVxbjl3Z0VRekNL?=
 =?utf-8?B?emRDTUF3WHBWcU9JaXFBK1pQVjJqbWRGdjhjWlRTWFhudWxtNnhvUHhoVUZa?=
 =?utf-8?Q?NY5LguNr3MwGvqL9qYcssjG7H?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1794100e-a82a-4247-d4a0-08dd93bc30df
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 14:24:23.9560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PULNoj6jmKBMPdPzXvci2UBhYl9muZyEcEwDK2S1yKRHQpWPtCf5OMaXsvxdsTmQ9zUv+lpgDnqIUXwjI8dpOHANNzUDX7o8LtNT7uRM63I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 14:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216687

VGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlIHBvaW50ZXIgUmljaGFyZCDwn5iKDQoNCkRhbmll
bA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgUHVyZGll
IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwg
MTUgTWF5IDIwMjUgMTY6MjINCj4gVG86IERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxAZXJp
Y3Nzb24uY29tPjsgUXVlbnRpbiBTY2h1bHoNCj4gPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT47
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IEpvc2h1YSBX
YXR0IDxKUEVXaGFja2VyQGdtYWlsLmNvbT47IFBldGVyIE1hcmtvDQo+IDxwZXRlci5tYXJrb0Bz
aWVtZW5zLmNvbT4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjQgMS8zXSBzcGR4
OiBhZGQgb3B0aW9uIHRvIGluY2x1ZGUgb25seSBjb21waWxlZA0KPiBzb3VyY2VzDQo+IA0KPiBP
biBUaHUsIDIwMjUtMDUtMTUgYXQgMTQ6MDkgKzAwMDAsIERhbmllbCBUdXJ1bGwgd3JvdGU6DQo+
ID4gVGhhbmtzIGZvciB0aGUgcG9pbnRlciBSaWNoYXJkLiBJJ2xsIGxvb2sgaW50byBpdCwgSSBj
bGVhcmx5IG1pc3NlZA0KPiA+IGl0Lg0KPiA+DQo+ID4gSSB3YW50IHRvIGhhdmUgdGhlIHBhdGNo
ZXMgYXMgbGVzcyBpbnRydXNpdmUgYXMgcG9zc2libGUgYW5kIGlmIHRoZQ0KPiA+IGRhdGEgaXMg
dGhlcmUsIHRoZSBsZXNzIGNvZGUgd2UgbmVlZCB0byBleHRyYWN0IHRoZSB1c2VkIHNvdXJjZSBj
b2RlLg0KPiANCj4gSGF2ZSBhIGxvb2sgYXQ6DQo+IA0KPiAuL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kd2FyZnNyY2ZpbGVzL2ZpbGVzL2R3YXJmc3JjZmlsZXMuYw0KPiANCj4gYW5kIGhvdyBkb19w
YWNrYWdlIGVuZHMgdXAgdXNpbmcgdGhhdC4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQN
Cg==

