Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21F0C3601E
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 02:49:49 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web11.41499.1744598987651517456
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 19:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 14 Apr 2025 11:49:45 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO sniperexo1.lge.com) (165.244.66.181)
	by 156.147.1.121 with ESMTP; 14 Apr 2025 11:49:45 +0900
X-Original-SENDERIP: 165.244.66.181
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO SE2P216CU007.outbound.protection.outlook.com) (40.93.138.31)
	by 165.244.66.181 with ESMTP; 14 Apr 2025 11:50:34 +0900
X-Original-SENDERIP: 40.93.138.31
X-Original-SENDERCOUNTRY: unknown
X-Original-MAILFROM: jaeyoon.jung@lge.com
X-Original-RCPTTO: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXZ8cyA/yMwINlHlFKXCeCkU2mrsCfXKPCEIhdjZn0c1fkHeu55BG1dzfFFTvvXfIZbF79yoHE8xhYLCzcROWLTeuTYDR1uIo4un3RJ5qBOkd1GLs5ue1suIvwBDYUaJ1FHrsH+sLM6WEKjX1F5C6J4IEciHPnSEvhf4DCE1tKBxa51QNHZyRzBJRCFxoNxbZcG6iLS9fONVCGgjAVRv7CLDgrSl3T3KQlJne9Sr/E7RiFZSPXjTJKYdhB6SIeugvIQFOFECCBAOiSiir03ufIZAjpc8GdxNRS33HE6bN5qX58qKHe8uHA6PGH2qWEKV32i3DSDBH4fP+laGHxCskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7XkXd/3J5bAllYBdhSoOVTgyikBAufBNTl/aq0Rylg=;
 b=CzdgFoCxsr7XV+hmfZVmAVvO0jj8aZupWgcN3Ip9UURZ4mEYBaCa7RBxd81IdG9nnzDvbvGLwFK6MN89T7I8jj81NgKapIyZDLX2uU9IprqunynRbAJHjPdmzwGIuVhUY+HX338+uHYYXPA26F3xs/HaE3chrJUIaqJ0bU+7+y9pUOojc25xRPCsRnExhLWwlB4QniHKV41Cjk043UM1CmDpFAaxTUtkSGrKzYsqlie9zof9mho2ohBJuAoWoi7laVZ/yAJ7N0twilDmoGTI2pt793Msy0Q1VMurIXDF4eHE5Pa+p5ueXxZ5vEx/TxUXwGzTzDZvKHfhPuUJFy2tqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lge.com; dmarc=pass action=none header.from=lge.com; dkim=pass
 header.d=lge.com; arc=none
Received: from PU4P216MB1517.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cc::10)
 by PU4P216MB2011.KORP216.PROD.OUTLOOK.COM (2603:1096:301:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 02:49:44 +0000
Received: from PU4P216MB1517.KORP216.PROD.OUTLOOK.COM
 ([fe80::64a6:48aa:a1cc:5fb2]) by PU4P216MB1517.KORP216.PROD.OUTLOOK.COM
 ([fe80::64a6:48aa:a1cc:5fb2%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 02:49:44 +0000
From: =?ks_c_5601-1987?B?waTA58CxL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKL+sKbyxx+BQ?=
 =?ks_c_5601-1987?B?bGF0Zm9ybbCzud+9xyC9w726xdtTVyBUYXNr?=
	<jaeyoon.jung@lge.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	=?ks_c_5601-1987?B?udq1v7yxL73HwOUvU1cgUGxhdGZvcm0ov6wpvLHH4FBsYXRmb3Jt?=
 =?ks_c_5601-1987?B?sLO5373H?= <dongseon.park@lge.com>
Subject: Re: [OE-core] [PATCH] send-error-report: Respect URL scheme in server
 name if exists
Thread-Topic: [OE-core] [PATCH] send-error-report: Respect URL scheme in
 server name if exists
Thread-Index: AQHbqgK/wRkBAPVQ3EqxpSd81bVdArOdTdeAgAUtYF0=
Date: Mon, 14 Apr 2025 02:49:44 +0000
Message-ID: 
 <PU4P216MB1517E0C0BCEB5202225A5B669AB32@PU4P216MB1517.KORP216.PROD.OUTLOOK.COM>
References: <20250410102401.122070-1-jaeyoon.jung@lge.com>
 <CANNYZj-y_UpumftTEKm0s7otVFiCRc21us3p5EmKe5go_hhhjw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-y_UpumftTEKm0s7otVFiCRc21us3p5EmKe5go_hhhjw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lge.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU4P216MB1517:EE_|PU4P216MB2011:EE_
x-ms-office365-filtering-correlation-id: 4c0d4683-612e-4197-ab1b-08dd7aff0304
x-ld-processed: 5069cde4-642a-45c0-8094-d0c2dec10be3,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|38070700018|13003099007|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?ks_c_5601-1987?B?QUlXaW1YOFhIbG9EbHFZNVBpNjdSTkpNRFpIZ1p5NWRLSVFKME0y?=
 =?ks_c_5601-1987?B?WHB5TjNZaHdvQUhQVkwxQ0I4TVlqM3l5YTJzeHpINHRKbzJ0KzZt?=
 =?ks_c_5601-1987?B?ZytDNHRwcWxDbTI0aFNvWmMxb2xWRnhWSUNwZmNRUW5pYnJaOTBi?=
 =?ks_c_5601-1987?B?OG9wTHpsTmpPeWNHT0tGSHZQcndnM3RXR1RGNGQrNXlmWEVSZFVR?=
 =?ks_c_5601-1987?B?enhDQ0JtdWtORTg3OXlyTThkMkxjcXd4Q3d3TmxGdmpaZkl6eGx0?=
 =?ks_c_5601-1987?B?eUlKdHVpZzNZV2VYS2w1YUpQbEJJSmFjVkJ6Sm9mU2ZQK0luelRX?=
 =?ks_c_5601-1987?B?TEFhc2g1Z2R4bXByOUx6ZEc3OWhOeFJvUWwrNHF5Qi92SEhtTHRn?=
 =?ks_c_5601-1987?B?NkNMME9Ccm9QQ3RaQk01T1d3NkZsQWJQalhPRFZRbnB0N1pYOHdP?=
 =?ks_c_5601-1987?B?V2h4dUxNZTNIS01jV2p1UFV0dzIyRysxdVJ4dXhmSk5FclRRL2VP?=
 =?ks_c_5601-1987?B?M1JNZFhqb29scngxaVFSdlB4MW5GdlQwNjB5Y2lIaklrTTk5ajFt?=
 =?ks_c_5601-1987?B?SFVNb1cyQ0lTTmFkVXEwUU4xbER3cERPZk94VTdQRlh3a0xxNVpi?=
 =?ks_c_5601-1987?B?bnhtT3NuMnVGMU5yRFN2cHhoUjB1bWlIZnNoMGJ2UFFvUi9pQ0Q5?=
 =?ks_c_5601-1987?B?OUFrK2xCVCtYLytTT2IzaUFRZzBQRTBKdUliQytMS3ozejlnSjV2?=
 =?ks_c_5601-1987?B?R2dWRWc4ZmY0eVNJSjljQ3NDaklsZld1L1Z4Uk5yWEJRMzhPREtw?=
 =?ks_c_5601-1987?B?WTJRbitHOVRma1JMdmxGamhMZUprb3hoWlJjTGF6cnZJU0ttTkUv?=
 =?ks_c_5601-1987?B?T05GTlNEVUlBVlZROWRDajdJMnVYdGlDb3pYbGk2b3FWa2w4aTln?=
 =?ks_c_5601-1987?B?cGdEMjluVHNJRS9tSkxhM2RVTTQyUWsrOWF5RVpVZWl3dlVWVTd3?=
 =?ks_c_5601-1987?B?dFphNDZjK2FVVFFpakE0MkwvNXZDdHcrblpiSUdHNXQ4MTdGSm4z?=
 =?ks_c_5601-1987?B?YUxHdnlvRTRuOWV4Nit6ai9heFlqZm1DRnFRdG85TTZoNkJQbGZo?=
 =?ks_c_5601-1987?B?WWlkbXZvZmdIQUkwSm40bStKZDhVdUsvTTNWb1Z2MjNFSEw5aEp3?=
 =?ks_c_5601-1987?B?MFE0SWZZT0xtQVhrSklXZ3pwczJ6aUNpeC9oS1ZNbDltaVkrd1k0?=
 =?ks_c_5601-1987?B?M2p6L1QrclM4akZwMXFMU0lXWElGZVBzN1RLVVBMYVNkNnRPQVBO?=
 =?ks_c_5601-1987?B?U2oxd1BacE4xQlhxY2ZhNEw3Y1REMEhiUGVJT1ZIckk1Yk5XWHZv?=
 =?ks_c_5601-1987?B?b3M2MGU4TEYvY0NmT214SHRZamxmaHJjdGVZTDAxZUFWT0MzQTB4?=
 =?ks_c_5601-1987?B?VmdlNzVqTnJlQ1Z6U3dSSU1OYUdjalNTbEFWSGExc213bjdsdW54?=
 =?ks_c_5601-1987?B?eVVQeWZmYWdkb2NpVHVXaGFpd3grNGhmUW5Cd080R1pGdG96czFU?=
 =?ks_c_5601-1987?B?emZjOUNrbUFDcytmUnh3NlFMU3B3Nk9UakYvaTJwcDJIWEcvM2tF?=
 =?ks_c_5601-1987?B?YkdtV0hXRTFiN2Z1djdsb1p4N2VtVHJOOUJHc1ltU2pkdUhCQ1Ix?=
 =?ks_c_5601-1987?B?M1kzZkpRVXVhSjZsRFJUMFp4YjRSWFlhdlg4VzMyZlV3dUgxZ0pF?=
 =?ks_c_5601-1987?B?UUMxYUVUQTlHdjdqYkRXZU9qdEtBTDUvNHRYS3hOUm1PN1JNSkcv?=
 =?ks_c_5601-1987?B?ODlNdEpLRmRLWTVKUUNGNmxKYks4eWVaYi9iOERIQUp1R0ZOZmhO?=
 =?ks_c_5601-1987?B?V3dUSGFHZE5Oc0RDM1ZRSnY3elVocjd1cnlSK29XSUdiTUs1K1JO?=
 =?ks_c_5601-1987?B?YkcxdGlUbVJpZ29EeTZ0bVBURTJrQzI1NHZuSGFETVlKZGN3UFJO?=
 =?ks_c_5601-1987?B?VXNjZVhaYi85U1JMN3E3aE5URnB5MnlYWmtMcTNKdjJqWURkbUcz?=
 =?ks_c_5601-1987?B?UWZXaU1BZU9zeEd4dGR6Y0tQMkttU1pheEkzYVhJQkQrYytjZ1hQ?=
 =?ks_c_5601-1987?B?R1M2N0pNUjVEQ1ZWeUszT1FjZTljWDFEMnNVdXRiWmlZdCtjNzJt?=
 =?ks_c_5601-1987?B?djB3OCtIUFIwRy9XZmprb3dsci9zbUVoU1ZRNnhaYklVNCtEZjNQ?=
 =?ks_c_5601-1987?Q?Bv79Lxe3r7qOxqM7UHFj8MXqzynCg?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1517.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(38070700018)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?ks_c_5601-1987?B?NnR5SmVCZmg5YnZoRjJuT3FsYWdjNkhITnJYbXloUFhtUnNLd1lD?=
 =?ks_c_5601-1987?B?UWNVVlVaalAzb2xaWEdQdFJPd0dqSGE2cFVGb3EzUXBmMUNhRUYx?=
 =?ks_c_5601-1987?B?dVZXL04vWVg5V2Rqd3BtUVkxUytSNDcrSWR0WTY2dnZoNlhkMzJG?=
 =?ks_c_5601-1987?B?WjZ1MWRQMVd4UUlqN25BaE5SMDBCVWNDRWlOSDd2WERNbiszK3M5?=
 =?ks_c_5601-1987?B?MFZEYkg3VENPWVZBR3lIMWdFRnQ2SmZXVitDQ05HZmczZm41Vm4r?=
 =?ks_c_5601-1987?B?ODdMdFI3dlVhb29mdTV4YWl3M0NxVVdHWXJjejRSTkVLbE9EN2Rp?=
 =?ks_c_5601-1987?B?K3I2RjU3MFBZQzY1eXcwMnd3TTNtQkhkZjhnUWNRMEppVjhRL0Fm?=
 =?ks_c_5601-1987?B?RDV3NGIraUtXUGtGMzZjblhCVGVqSUo4ODlTTHNvMmJPZmFSYUFo?=
 =?ks_c_5601-1987?B?VU1ON0paWm83WnEyZjR0MExRRVZwQWRsbWhGeXMxb3duVkhBU2Q0?=
 =?ks_c_5601-1987?B?b1ZxYVJQdS9yQ291Y1JZMlA0UkluZnB4akNINHZqMTdreXVmYmxl?=
 =?ks_c_5601-1987?B?THhSNUJ0TmdPaWlmUll0NmN1VkxOYjJxMEkxUUh6a1RXdWhIRUVQ?=
 =?ks_c_5601-1987?B?RnpFZFpuYzBoV3dRdDFEcUs3WVhqMkYvNnB4RHI2blhlSnRXUkZW?=
 =?ks_c_5601-1987?B?aHF0bStpMHlFOEZ5aUZ6d2Q1Z2tpMEI2aWxSVW1rNVRNa0c5QmRQ?=
 =?ks_c_5601-1987?B?MXY2NFBsY1YyQUxpdGhWeURCbzhxeWo5TmNvaHprTEFJMlp3TVF4?=
 =?ks_c_5601-1987?B?YTByVUM4WWJ2KytjNC9BTjFMN09uSGlodmU2eWErWXpOTlVham53?=
 =?ks_c_5601-1987?B?VmNHN0lrT3RtV0hKWGh0TkRqV3BsTWFFWHpJU3dWSlBjdTVHKzhv?=
 =?ks_c_5601-1987?B?SHFRQnY5ek9EQUZNZk9LMHptcnE1R0JzcFRYeDVIdk1oVDFmOERP?=
 =?ks_c_5601-1987?B?cWtna0QyTDVyeFUybG5qOUtCVlVtbnlXcEQrUUtWajRaT3ppN3lx?=
 =?ks_c_5601-1987?B?elQyVnlESEN2UWx4MVMzQVVScTg2VDU1S1o3V0RJMjg3UEFGODE4?=
 =?ks_c_5601-1987?B?a3ovNzVEazlYWGF2VTAxekgzbitoSEw3UUZZZGVsOEFTTXhqc0gw?=
 =?ks_c_5601-1987?B?bWIzaTZJMWhQUURBUFNZczhzcCtULzhXTkNrUXNFQldqYlVSSlRL?=
 =?ks_c_5601-1987?B?Y0V0N2FlZnpzYmN2Z1BqVmFnb3VHc3FaZ0M2YTN6aURWNVdLZTFQ?=
 =?ks_c_5601-1987?B?bFFnLzJVWWdEWDNKaENFdm5pQjMzZE5DOGJvVnRhaFFNOW44UTVS?=
 =?ks_c_5601-1987?B?dVFhS1d1UW1FZnRKNFpmMUY3aUdQUXp0VWNzMTlxeS9SaHhjUXhV?=
 =?ks_c_5601-1987?B?Nkh5L0c1SWtQdVdXbktIR1ZjVFF1UzNTc3drVzl1elBsSTF6Q1l1?=
 =?ks_c_5601-1987?B?clArS2lzc3N5dy9jR0hKbmZDYjRDVG9ETnFoSVFob1BieXQ3ZDZn?=
 =?ks_c_5601-1987?B?TVowa2pxMzQ1ZUhXRkgvTFMzRjRuVlRnejNGQUZleWIxRTNMWk5O?=
 =?ks_c_5601-1987?B?MVdkankzZnhyd0Y2OXpxSTdhTmtaY2JMMDJObUVWWjBJOWhCV0Fq?=
 =?ks_c_5601-1987?B?UXAzdzRSYXRhdnIrcXR4RDhPVk1jUHZ0VHBPUVhQSS84RVo3ek9N?=
 =?ks_c_5601-1987?B?MkdON3hNK1BOWktZU3BQQVU1Yi9pNENmMXhsVWJlUWJtOElySkx6?=
 =?ks_c_5601-1987?B?VXllS1B2aTU2MXRidXBlTFVKSG54UUZrZEZ5V2prOVZtWVBwRG1Z?=
 =?ks_c_5601-1987?B?TnowdXg0OWtRRlpoeGpnUlVNMzR1Z1h4bHp2NEEyUTcyQ2o0MXp5?=
 =?ks_c_5601-1987?B?Skl3TUxtKy9rejJGNGdldDFBTDVWMkVTc2RQbFZiQlZTNHIvYkJN?=
 =?ks_c_5601-1987?B?dStzM29haGhVWnlDS20yenEvZkdwcndTdkZkc1NBd2k5bk5rMlhn?=
 =?ks_c_5601-1987?B?Z21XV0pyMEwvQW0rWWRKZ29NRlpYMjlUYmgwU3VTRENmS0NSVHpW?=
 =?ks_c_5601-1987?B?UGg0VlJ3NzFsOHZuT2pwUVg1cy9neGpZZWordE9vWTE4QTRvM3FF?=
 =?ks_c_5601-1987?B?eWxUcU5qdWkvUlQyOTJMa1dwanRJSVJzNC9tMzNUOHFMWCt2aW1a?=
 =?ks_c_5601-1987?B?disxa25USG1JS0oxTzR6aVdOaVZqMyt0enJlRjNrUW5jYzN1ZzBX?=
 =?ks_c_5601-1987?B?QTZKSXRFdU9JV05STWNBL09DNnpwMDFXYXN3OWNtZzVBQjEwTExY?=
 =?ks_c_5601-1987?B?U1hMZ3BaUitSNFYvY1BOR3kxbHVqL0NvdlRCZnEvakZVV2hkdEcx?=
 =?ks_c_5601-1987?Q?nklnLmgtXXBu+OSkKzjIjqcWQE3s90YR/rm0B2vP?=
Content-Type: multipart/alternative;
	boundary="_000_PU4P216MB1517E0C0BCEB5202225A5B669AB32PU4P216MB1517KORP_"
MIME-Version: 1.0
X-OriginatorOrg: lge.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1517.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0d4683-612e-4197-ab1b-08dd7aff0304
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 02:49:44.1814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5069cde4-642a-45c0-8094-d0c2dec10be3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2ndomQNm9v8I7pMkLQIDXPqsClaKR3KWQ3DObzfB4Erw+208qHdn2XKwjQkQf8qDlMW73hko/AcdV/fMRKsjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 02:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214790

--_000_PU4P216MB1517E0C0BCEB5202225A5B669AB32PU4P216MB1517KORP_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

VGhhdCdzIGEgZ29vZCBpZGVhLiBJJ3ZlIGp1c3Qgc2VudCB0d28gcGF0Y2hlcyBhcyBhIHNlcmll
cy4NCg0KDQpCZXN0IHJlZ2FyZHMsDQotLS0NCkphZXlvb24gSnVuZw0KU29mdHdhcmUgUGxhdGZv
cm0gTGFiLiAvIENvcnBvcmF0ZSBSJkQgLyBMRyBFbGVjdHJvbmljcyBJbmMuDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4NClNlbnQ6IEZyaWRheSwgQXByaWwgMTEsIDIwMjUgNDo0NCBBTQ0K
VG86IMGkwOfAsS9UYXNrIExlYWRlci9TVyBQbGF0Zm9ybSi/rCm8scfgUGxhdGZvcm2ws7nfvccg
vcO9usXbU1cgVGFzayA8amFleW9vbi5qdW5nQGxnZS5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBzZW5kLWVycm9yLXJl
cG9ydDogUmVzcGVjdCBVUkwgc2NoZW1lIGluIHNlcnZlciBuYW1lIGlmIGV4aXN0cw0KDQpUaGFu
a3MsIHRoaXMgbG9va3MgZ29vZCBhbmQgd2lsbCBiZSB0YWtlbiBpbnRvIHBhdGNoIHRlc3Rpbmcg
cXVldWUsDQpidXQgSSB3b25kZXIgaWYgd2UgY2FuIHNpbXBsaWZ5IHRoaXMgZnVydGhlciwgYW5k
IGRyb3AgLS1uby1zc2wgb3B0aW9uDQphbHRvZ2V0aGVyLiBJdCB3b3VsZCBiZSBhIGJyZWFraW5n
IGNoYW5nZSwgYnV0IGluIG1hc3RlciBpdCdzDQpwb3NzaWJsZS4gSWYgeW91IHdvdWxkIGxpa2Us
IHlvdSBjYW4gc2VuZCBhIHNlY29uZCBwYXRjaCBvbiB0b3Agb2YNCnRoaXMgb25lLCB3aXRoIHRo
ZSBvcHRpb24gcmVtb3ZhbC4NCg0KQWxleA0KDQpPbiBUaHUsIDEwIEFwciAyMDI1IGF0IDEyOjI0
LCBKYWV5b29uIEp1bmcgKExHRSkgdmlhDQpsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxqYWV5b29u
Lmp1bmc9bGdlLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0Kd3JvdGU6DQo+DQo+IEZyb206
IEphZXlvb24gSnVuZyA8amFleW9vbi5qdW5nQGxnZS5jb20+DQo+DQo+IElmIGEgc2VydmVyIG5h
bWUgd2l0aCAtcyBvciAtLXNlcnZlciBmbGFnIGNvbnRhaW5zIHRoZSBVUkwgc2NoZW1lIHN1Y2gN
Cj4gYXMgaHR0cDovLyBvciBodHRwczovLyBpdCB0YWtlcyBwcmVjZWRlbmNlIG92ZXIgLS1uby1z
c2wgZmxhZy4gVGhpcyB3aWxsDQo+IGFsbG93IHVzIHRvIHVzZSB0aGUgc2FtZSBjb21tYW5kIGxp
bmUgb3B0aW9uIGZvciBkaWZmZXJlbnQgc2VydmVycyB3aXRoDQo+IGh0dHA6Ly8gYW5kIGh0dHBz
Oi8vIHNjaGVtZXMgbWl4ZWQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphZXlvb24gSnVuZyA8amFl
eW9vbi5qdW5nQGxnZS5jb20+DQo+IC0tLQ0KPiAgc2NyaXB0cy9zZW5kLWVycm9yLXJlcG9ydCB8
IDMwICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9zY3JpcHRz
L3NlbmQtZXJyb3ItcmVwb3J0IGIvc2NyaXB0cy9zZW5kLWVycm9yLXJlcG9ydA0KPiBpbmRleCBj
ZmJjYWE1MmNiLi4xZTk3M2YxY2IyIDEwMDc1NQ0KPiAtLS0gYS9zY3JpcHRzL3NlbmQtZXJyb3It
cmVwb3J0DQo+ICsrKyBiL3NjcmlwdHMvc2VuZC1lcnJvci1yZXBvcnQNCj4gQEAgLTY1LDcgKzY1
LDcgQEAgZGVmIGVkaXRfY29udGVudChqc29uX2ZpbGVfcGF0aCk6DQo+DQo+ICBkZWYgcHJlcGFy
ZV9kYXRhKGFyZ3MpOg0KPiAgICAgICMgYXR0ZW1wdCB0byBnZXQgdGhlIG1heF9sb2dfc2l6ZSBm
cm9tIHRoZSBzZXJ2ZXIncyBzZXR0aW5ncw0KPiAtICAgIG1heF9sb2dfc2l6ZSA9IGdldFBheWxv
YWRMaW1pdChhcmdzLnByb3RvY29sK2FyZ3Muc2VydmVyKyIvQ2xpZW50UG9zdC9KU09OIikNCj4g
KyAgICBtYXhfbG9nX3NpemUgPSBnZXRQYXlsb2FkTGltaXQoYXJncy5zZXJ2ZXIrIi9DbGllbnRQ
b3N0L0pTT04iKQ0KPg0KPiAgICAgIGlmIG5vdCBvcy5wYXRoLmlzZmlsZShhcmdzLmVycm9yX2Zp
bGUpOg0KPiAgICAgICAgICBsb2cuZXJyb3IoIk5vIGRhdGEgZmlsZSBmb3VuZC4iKQ0KPiBAQCAt
MTM1LDkgKzEzNSw5IEBAIGRlZiBzZW5kX2RhdGEoZGF0YSwgYXJncyk6DQo+ICAgICAgaGVhZGVy
cz17J0NvbnRlbnQtdHlwZSc6ICdhcHBsaWNhdGlvbi9qc29uJywgJ1VzZXItQWdlbnQnOiAic2Vu
ZC1lcnJvci1yZXBvcnQvIit2ZXJzaW9ufQ0KPg0KPiAgICAgIGlmIGFyZ3MuanNvbjoNCj4gLSAg
ICAgICAgdXJsID0gYXJncy5wcm90b2NvbCthcmdzLnNlcnZlcisiL0NsaWVudFBvc3QvSlNPTi8i
DQo+ICsgICAgICAgIHVybCA9IGFyZ3Muc2VydmVyKyIvQ2xpZW50UG9zdC9KU09OLyINCj4gICAg
ICBlbHNlOg0KPiAtICAgICAgICB1cmwgPSBhcmdzLnByb3RvY29sK2FyZ3Muc2VydmVyKyIvQ2xp
ZW50UG9zdC8iDQo+ICsgICAgICAgIHVybCA9IGFyZ3Muc2VydmVyKyIvQ2xpZW50UG9zdC8iDQo+
DQo+ICAgICAgcmVxID0gdXJsbGliLnJlcXVlc3QuUmVxdWVzdCh1cmwsIGRhdGE9ZGF0YSwgaGVh
ZGVycz1oZWFkZXJzKQ0KPiAgICAgIHRyeToNCj4gQEAgLTE0OSw2ICsxNDksMjMgQEAgZGVmIHNl
bmRfZGF0YShkYXRhLCBhcmdzKToNCj4gICAgICBwcmludChyZXNwb25zZS5yZWFkKCkuZGVjb2Rl
KCd1dGYtOCcpKQ0KPg0KPg0KPiArZGVmIGRldGVybWluZV9zZXJ2ZXJfdXJsKGFyZ3MpOg0KPiAr
ICAgICMgR2V0IHRoZSBlcnJvciByZXBvcnQgc2VydmVyIGZyb20gdGhlIGVudmlyb25tZW50IHZh
cmlhYmxlDQo+ICsgICAgc2VydmVyID0gYXJncy5zZXJ2ZXIgb3IgJ2Vycm9ycy55b2N0b3Byb2pl
Y3Qub3JnJw0KPiArDQo+ICsgICAgIyBUaGUgc2NoZW1lIGNvbnRhaW5lZCBpbiB0aGUgZ2l2ZW4g
VVJMIHRha2VzIHByZWNlZGVuY2Ugb3ZlciAtLW5vLXNzbCBmbGFnDQo+ICsgICAgc2NoZW1lID0g
YXJncy5wcm90b2NvbA0KPiArICAgIGlmIHNlcnZlci5zdGFydHN3aXRoKCdodHRwOi8vJyk6DQo+
ICsgICAgICAgIHNlcnZlciA9IHNlcnZlcltsZW4oJ2h0dHA6Ly8nKTpdDQo+ICsgICAgICAgIHNj
aGVtZSA9ICdodHRwOi8vJw0KPiArICAgIGVsaWYgc2VydmVyLnN0YXJ0c3dpdGgoJ2h0dHBzOi8v
Jyk6DQo+ICsgICAgICAgIHNlcnZlciA9IHNlcnZlcltsZW4oJ2h0dHBzOi8vJyk6XQ0KPiArICAg
ICAgICBzY2hlbWUgPSAnaHR0cHM6Ly8nDQo+ICsNCj4gKyAgICAjIENvbnN0cnVjdCB0aGUgZmlu
YWwgVVJMDQo+ICsgICAgcmV0dXJuIGYie3NjaGVtZX17c2VydmVyfSINCj4gKw0KPiArDQo+ICBp
ZiBfX25hbWVfXyA9PSAnX19tYWluX18nOg0KPiAgICAgIGFyZ19wYXJzZSA9IGFyZ3BhcnNlX29l
LkFyZ3VtZW50UGFyc2VyKGRlc2NyaXB0aW9uPSJUaGlzIHNjcmlwdHMgd2lsbCBzZW5kIGFuIGVy
cm9yIHJlcG9ydCB0byB5b3VyIHNwZWNpZmllZCBlcnJvci1yZXBvcnQtd2ViIHNlcnZlci4iKQ0K
Pg0KPiBAQCAtMTY0LDggKzE4MSw3IEBAIGlmIF9fbmFtZV9fID09ICdfX21haW5fXyc6DQo+ICAg
ICAgYXJnX3BhcnNlLmFkZF9hcmd1bWVudCgiLXMiLA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIi0tc2VydmVyIiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhlbHA9IlNl
cnZlciB0byBzZW5kIGVycm9yIHJlcG9ydCB0byIsDQo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICB0eXBlPXN0ciwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlZmF1bHQ9ImVy
cm9ycy55b2N0b3Byb2plY3Qub3JnIikNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHR5
cGU9c3RyKQ0KPg0KPiAgICAgIGFyZ19wYXJzZS5hZGRfYXJndW1lbnQoIi1lIiwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICItLWVtYWlsIiwNCj4gQEAgLTE5NSwxMCArMjExLDEwIEBA
IGlmIF9fbmFtZV9fID09ICdfX21haW5fXyc6DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBkZXN0PSJwcm90b2NvbCIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhY3Rpb249
InN0b3JlX2NvbnN0IiwgY29uc3Q9Imh0dHA6Ly8iLCBkZWZhdWx0PSJodHRwczovLyIpDQo+DQo+
IC0NCj4gLQ0KPiAgICAgIGFyZ3MgPSBhcmdfcGFyc2UucGFyc2VfYXJncygpDQo+DQo+ICsgICAg
YXJncy5zZXJ2ZXIgPSBkZXRlcm1pbmVfc2VydmVyX3VybChhcmdzKQ0KPiArDQo+ICAgICAgaWYg
KGFyZ3MuanNvbiA9PSBGYWxzZSk6DQo+ICAgICAgICAgIHByaW50KCJQcmVwYXJpbmcgdG8gc2Vu
ZCBlcnJvcnMgdG86ICIrYXJncy5zZXJ2ZXIpDQo+DQo+IC0tDQo+IDIuNDMuMA0KPg0KPg0KPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2Vz
IHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMyMTQ2NDApOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIx
NDY0MA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9t
dC8xMTIxODg2MjgvMTY4NjQ4OQ0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3du
ZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW2FsZXgua2FuYXZpbkBn
bWFpbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+DQo=

--_000_PU4P216MB1517E0C0BCEB5202225A5B669AB32PU4P216MB1517KORP_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">
That's a good idea. I've just sent two patches as a series.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Best regards,</div>
<div id=3D"Signature" class=3D"elementToProof">
<div style=3D"font-family: &quot;Malgun Gothic&quot;, &quot;=B8=BC=C0=BA =
=B0=ED=B5=F1&quot;, AppleGothic, sans-serif; font-size: 11pt; color: rgb(0,=
 0, 0);">
<span style=3D"font-family: Calibri; font-size: 13.3333px; background-color=
: rgb(255, 255, 255);">---</span><span style=3D"font-family: Aptos, Aptos_E=
mbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size=
: 12pt;"><br>
</span><span style=3D"font-family: Calibri; font-size: 13.3333px; backgroun=
d-color: rgb(255, 255, 255);">Jaeyoon Jung</span><span style=3D"font-family=
: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-=
serif; font-size: 12pt;"><br>
</span><span style=3D"font-family: Calibri; font-size: 13.3333px; backgroun=
d-color: rgb(255, 255, 255);">Software Platform Lab. / Corporate R&amp;D / =
LG Electronics Inc.</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Friday, April 11, 2025 4:44 AM<br>
<b>To:</b> =C1=A4=C0=E7=C0=B1/Task Leader/SW Platform(=BF=AC)=BC=B1=C7=E0Pl=
atform=B0=B3=B9=DF=BD=C7 =BD=C3=BD=BA=C5=DBSW Task &lt;jaeyoon.jung@lge.com=
&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] send-error-report: Respect URL scheme=
 in server name if exists</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Thanks, this looks good and will be taken into pat=
ch testing queue,<br>
but I wonder if we can simplify this further, and drop --no-ssl option<br>
altogether. It would be a breaking change, but in master it's<br>
possible. If you would like, you can send a second patch on top of<br>
this one, with the option removal.<br>
<br>
Alex<br>
<br>
On Thu, 10 Apr 2025 at 12:24, Jaeyoon Jung (LGE) via<br>
lists.openembedded.org &lt;jaeyoon.jung=3Dlge.com@lists.openembedded.org&gt=
;<br>
wrote:<br>
&gt;<br>
&gt; From: Jaeyoon Jung &lt;jaeyoon.jung@lge.com&gt;<br>
&gt;<br>
&gt; If a server name with -s or --server flag contains the URL scheme such=
<br>
&gt; as http:// or https:// it takes precedence over --no-ssl flag. This wi=
ll<br>
&gt; allow us to use the same command line option for different servers wit=
h<br>
&gt; http:// and https:// schemes mixed.<br>
&gt;<br>
&gt; Signed-off-by: Jaeyoon Jung &lt;jaeyoon.jung@lge.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; scripts/send-error-report | 30 +++++++++++++++++++++++-------<br=
>
&gt;&nbsp; 1 file changed, 23 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/send-error-report b/scripts/send-error-report<br>
&gt; index cfbcaa52cb..1e973f1cb2 100755<br>
&gt; --- a/scripts/send-error-report<br>
&gt; +++ b/scripts/send-error-report<br>
&gt; @@ -65,7 +65,7 @@ def edit_content(json_file_path):<br>
&gt;<br>
&gt;&nbsp; def prepare_data(args):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # attempt to get the max_log_size from t=
he server's settings<br>
&gt; -&nbsp;&nbsp;&nbsp; max_log_size =3D getPayloadLimit(args.protocol+arg=
s.server+&quot;/ClientPost/JSON&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp; max_log_size =3D getPayloadLimit(args.server+&quot=
;/ClientPost/JSON&quot;)<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not os.path.isfile(args.error_file):<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log.error(&quot;=
No data file found.&quot;)<br>
&gt; @@ -135,9 +135,9 @@ def send_data(data, args):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; headers=3D{'Content-type': 'application/=
json', 'User-Agent': &quot;send-error-report/&quot;+version}<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if args.json:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url =3D args.protocol+args=
.server+&quot;/ClientPost/JSON/&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url =3D args.server+&quot;=
/ClientPost/JSON/&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url =3D args.protocol+args=
.server+&quot;/ClientPost/&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; url =3D args.server+&quot;=
/ClientPost/&quot;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; req =3D urllib.request.Request(url, data=
=3Ddata, headers=3Dheaders)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
&gt; @@ -149,6 +149,23 @@ def send_data(data, args):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print(response.read().decode('utf-8'))<b=
r>
&gt;<br>
&gt;<br>
&gt; +def determine_server_url(args):<br>
&gt; +&nbsp;&nbsp;&nbsp; # Get the error report server from the environment=
 variable<br>
&gt; +&nbsp;&nbsp;&nbsp; server =3D args.server or 'errors.yoctoproject.org=
'<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; # The scheme contained in the given URL takes prec=
edence over --no-ssl flag<br>
&gt; +&nbsp;&nbsp;&nbsp; scheme =3D args.protocol<br>
&gt; +&nbsp;&nbsp;&nbsp; if server.startswith('<a href=3D"http://">http://<=
/a>'):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; server =3D server[len('htt=
p://'):]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scheme =3D 'http://'<br>
&gt; +&nbsp;&nbsp;&nbsp; elif server.startswith('<a href=3D"https://">https=
://</a>'):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; server =3D server[len('htt=
ps://'):]<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scheme =3D 'https://'<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; # Construct the final URL<br>
&gt; +&nbsp;&nbsp;&nbsp; return f&quot;{scheme}{server}&quot;<br>
&gt; +<br>
&gt; +<br>
&gt;&nbsp; if __name__ =3D=3D '__main__':<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arg_parse =3D argparse_oe.ArgumentParser=
(description=3D&quot;This scripts will send an error report to your specifi=
ed error-report-web server.&quot;)<br>
&gt;<br>
&gt; @@ -164,8 +181,7 @@ if __name__ =3D=3D '__main__':<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arg_parse.add_argument(&quot;-s&quot;,<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &quot;--server&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; help=3D&quot;Server to send error report to&quot;,<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; type=3Dstr,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; default=3D&quot;errors.yoctoproject.org&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; type=3Dstr)<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arg_parse.add_argument(&quot;-e&quot;,<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &quot;--email&quot;,<br>
&gt; @@ -195,10 +211,10 @@ if __name__ =3D=3D '__main__':<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; dest=3D&quot;protocol&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; action=3D&quot;store_const&quot;, const=3D&quot;http=
://&quot;, default=3D&quot;<a href=3D"https://">https://</a>&quot;)<br>
&gt;<br>
&gt; -<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; args =3D arg_parse.parse_args()<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp; args.server =3D determine_server_url(args)<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (args.json =3D=3D False):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print(&quot;Prep=
aring to send errors to: &quot;+args.server)<br>
&gt;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#214640): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/214640">
https://lists.openembedded.org/g/openembedded-core/message/214640</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11218862=
8/1686489">
https://lists.openembedded.org/mt/112188628/1686489</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kanavin@=
gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_PU4P216MB1517E0C0BCEB5202225A5B669AB32PU4P216MB1517KORP_--

