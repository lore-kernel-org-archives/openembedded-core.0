Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.92])
 by mx.groups.io with SMTP id smtpd.web11.8816.1624871864317912234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 02:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=iBlWXdTa;
 spf=pass (domain: prevas.dk, ip: 40.107.22.92, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnWuTAxWPxnt1DS/0nvRWIZf03RMK2G+gEOTHHHL1UIyI7NFZXhJ9qQ8w2mzoSgqiZBrWcWKdOMOdGQjBSljAw10mmojviQPecOnS5ez83u5eGRxGGqBdDQKTS8TwxDlRzqbqtvK8EvvYqel4Hse63NjKtcBjY5vQEflyPgGvFqVRpBPvtlycIUqY7TBLDTtR/wRwe1SnK7Nj5LjVUfCix+Mq+nHQyvxJU2lEO8MSDnFAad8I5CC/BmHRZRI1UUAixEzftXDBxtETlc/6SPxxTKOWM8co/teJxfDelWdV6h53KqE07tUSJfVp1Io1JljSwrJZ81Qo4jlWgmhAJFizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5n32wjV7tl0VzJqkXoxnxyOrPIzFPz1Ddmt545mWWo4=;
 b=Gm12HjL1FQfC4tM2feUe4SC7UZw+kutAvFqJrTUXCNJIk2/CTVv5tNP/JkVze1Ps3oXEUe7pT737xYjY4l6J+p4AZ0ONO7J3aBiwf11qJJF6tLGjIeb8Rmx146tzQqwczcvMQeIfUFGQCZonUG4oZ4fz2bVBl2L8FczQB/LsQXd8u2VBXTYL25GX5giD2vv1rvs73lCdQeq1aVm/CO7PxIB1q1XytK94gCRPi4TwytMo4uXEM/7QzoX7cF1syWwywqvjaTN8ikpYoBavn0Iv9BpV8LwzVBbMgCDZzYmQLYM6OUU6XKD7/tZZ4w9i0EF0qrM63GA9wVHkG+8Y69JqmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5n32wjV7tl0VzJqkXoxnxyOrPIzFPz1Ddmt545mWWo4=;
 b=iBlWXdTaOvHzHetO9dDtfwWc5WOEeehyGvlt6QNACvsH2N6QhUdW8LMmp2Nq6JGHYE6qH9V7qJuWK8234aVVvPkEd0Aqx34b4zrSaUSCAzWyW9ZDLK3GDSKk9/OcVkvz/Cr0QKnDnfRJjFtm1vaFeJtfmIDc0IrJu+2Jv3KxAzE=
Authentication-Results: ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM8PR10MB3986.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.26; Mon, 28 Jun
 2021 09:17:42 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc83:36a5:db02:3dbb]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fc83:36a5:db02:3dbb%7]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 09:17:42 +0000
Subject: Re: [OE-core] RRECOMMENDS "masking" unsatisfiable IMAGE_INSTALL
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
Cc: Alex Stewart <alex.stewart@ni.com>
References: <5d6b6934-bd33-04e5-cf55-ce09895bbd6c@prevas.dk>
 <599d48303a40d8c4db4d0d380d4cfcc5f0c7acfb.camel@linuxfoundation.org>
 <6f831e07-bfc3-8803-07a8-39050f92b3f6@prevas.dk>
 <6413b9648787dc0ba529241cb62bc5e031654d22.camel@linuxfoundation.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <d2bb69c7-1466-d265-4f81-adbd69ebb512@prevas.dk>
Date: Mon, 28 Jun 2021 11:17:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <6413b9648787dc0ba529241cb62bc5e031654d22.camel@linuxfoundation.org>
X-Originating-IP: [80.208.64.110]
X-ClientProxiedBy: BE0P281CA0015.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::25) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (80.208.64.110) by BE0P281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:a::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.8 via Frontend Transport; Mon, 28 Jun 2021 09:17:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2223cb3e-f295-4a2c-1ea2-08d93a159509
X-MS-TrafficTypeDiagnostic: AM8PR10MB3986:
X-Microsoft-Antispam-PRVS: 
	<AM8PR10MB3986A8D54B29F9B1FC9C924D93039@AM8PR10MB3986.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5s6gkhM+RDPLV3WCq4wLSb9hkFIYaFhNVskjKVQfdIGz+9v8hY2sJMqZ2qupkx1iChHWtxjTzPFKtIvmetqTiGsayGz7mPgz+DO9ZhGAKj0yO1huENsfpEpJGWIQ/kuHSM6ATEQhQfNO5vVsZMEplR7ZR6qmdr6Llt7vF1+1SOxkCCZVPuL64NqxjuCChr3WEfZf9RbANgKj5qMmtzfkWxm89vA15FJFJDUcMWfRwrDDT0X3mrW/2WSFTqwfXYQvX7C2Mwz1Xx6qekB6ZyaSOyhlgp33OhC6/bV7yTnCBSBky03eKDi6fhESYTJH6tKwTXVR3w+GLm82xEVPR8/CrxfLOFziNM+dHNIeUfE++ItgCF1OvU/YCHGN9w+JA7fwG/1fN8oIxEuCxmcivSfBgPnexZbMk15iPWPZ0fYsPLXdZGO8Mhxa2RaPGy/yYHUtXQ7StR4sEkX97msQyTj72Kgw2yakaYh1D8TkGX7aGAkYlsRYTC+WH/0kmk54dUkWwTjOrJHwIhGSSpWUBSNddCMmb8JBX8Hu8tmbrfla2cy36DLNE5EOVIq5qg1iMCwYfuiM126qGtATwvvuwL01qx+QB5w8FnEY17szyGSc3cbsPRxFDi4YegW+NsrddVppb2A2umFIVa/ZTnTXA9Rj2KW71UNeGTAM97YUQ2aOtY/swOV/uw+Pb7DbHCtVMFZadiEUMSYM7ObwdMb+/McaPS/vfCU/ZaB3+YMBzDjGgNXQum1BtBHDmpGdS8tU6DWIv764UEE1h8+rJZUG0Hn5ag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(39850400004)(346002)(136003)(36756003)(6486002)(83380400001)(2906002)(66476007)(5660300002)(31696002)(66946007)(66556008)(186003)(478600001)(86362001)(16526019)(26005)(110136005)(31686004)(38100700002)(316002)(956004)(8976002)(16576012)(38350700002)(52116002)(44832011)(8936002)(2616005)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d1FsS0IvaXcwTUhoT1ZXKzdRMXA4NmNCZU1wbjV1THJCTFdGekdtYlN6eFc3?=
 =?utf-8?B?NTY3MG1uVnEvc0w2dDZnSmNBZDJKL3ZaOEVSNVB2amExODZHR3RvSVovVEda?=
 =?utf-8?B?ckhHRUhRanNGeWNabWVQbDlnbEFVQStjY3o5Uk8zNVh6aUFCWFJrQktxNnl3?=
 =?utf-8?B?aXlRUXF6TGpxOTJQclRadnlpcUdQRmhWRmpRelRyUVhMT1grMGJWcnBRaG1o?=
 =?utf-8?B?VVJMNkR4dnFVL2JFV0hNdUtMT1NMYmw1V3UxaVZFV09RbDgvTytleTJ2cWlS?=
 =?utf-8?B?UmRSN25MeUFtOVNFZWh3bDdzdHhUQ3poQlJncGRVUlFvNlBMaC82L0UrbS9H?=
 =?utf-8?B?ZzJZY2VoY0dkaGlEdjN0Q1FRQ2dkNHk2TUVJTGJVUDl4cks1ekE1bFJrQkgw?=
 =?utf-8?B?NXZsVysrbEk0eXdhK1JXSU1UaFcyUmVrVDVQdEQ1b3VWZ0JRRHlBZDhpWXlJ?=
 =?utf-8?B?NmRoVHRXR2g4TkdWbUJMRHV1VGpJa1ZBZ0FTQXZsUWxITnhUZ0lSK1hZcHpi?=
 =?utf-8?B?VVhWcHZVVkM5dW5LSEJuSmV4TnRZYy9Yd3liZ09MQjFQOWxVcnYxdnJidVhR?=
 =?utf-8?B?QzFjeU9iK3JvbHp4aDdtVXM4OGNqSGliWHlKODVtU0lWdVNvTkF6MW5ycjEv?=
 =?utf-8?B?ODRLcUk5ODEwRFRkcTllZkFBRDkzRi9WVkcxa3g1dWJJczVxWFg2MlRlaVRx?=
 =?utf-8?B?RmtmcEtGNWNDWFM1c241aFpFZ2xXaDRDZ2tjUkIwWlhCSFFBd0V5cDZ0L2d2?=
 =?utf-8?B?UnpOcCtUMXhvS2oydWVVbVg4TTdQU29UMEJkaVM1Y0swVVVHSThXWVhOdVcy?=
 =?utf-8?B?dG9aRzZRV0ttNEZORHZ6cFlzbnFaVm5iQ0ZQTHErYkVERUh3U0NFV3I5a21v?=
 =?utf-8?B?YkN2dDRuVzZ6QlNOOTNpL1FnV1hPSlhhL0tUYjNwdlJJdXMweU9HY0hLTFlN?=
 =?utf-8?B?c3JPZ3JGOE9YV2t2cVg2Qkx4Z3FFaTQzZ1FKa2JtQnpMZE10WmdyblVUS1pG?=
 =?utf-8?B?YTFvcFF1bUc2YUFvSUxWL0lkNGJKbUZ3MWxEcUhBTTUxYmlCWmx1QXZvcnor?=
 =?utf-8?B?N2RxcGE5MGorYzdtcFA0RTdZbHhFOEJZaFZFMDYvMi84MTZpZk5yNmxZakEw?=
 =?utf-8?B?SG01WmVzWFpSRkVOT0RYMUFDUHRWNWtRaFFzK2M4VUxQcEpPdmhWYjVhZm5Q?=
 =?utf-8?B?UkRlT3M0Wkxpc0lnK0tDZWdHc0l0UndocXFDZW5tazlVN0YvMjJTV3MyS00w?=
 =?utf-8?B?S0lpZ2lGemFMQWNxNkFSVWtjZFZFYnlBWXBWakZaK3J2QzUvOS96VUM1WUZU?=
 =?utf-8?B?NWJnY0dIc2ZHcmxhRXpkcFg2dDQvY1E4a0pPM1dpQXlJUFo5SWtYdDZJelpK?=
 =?utf-8?B?Y21TMWZJUC9XWlF0a1FoMkZiYm85TG1oYUNMdzZBZ0RHWEU5OTdoUFV3MnBX?=
 =?utf-8?B?ME1WSVBIZVp2REFWaHV6L0owYm51MHhnay9ha1ZDcWtOVW5jK2pCSVllS1c2?=
 =?utf-8?B?Yy9Gd1VqQ2ZGUWk2b3lVV1hJZy9TYjIrbDlXSUFCQ21xN1QrYWtUUEEzYmZM?=
 =?utf-8?B?ZXI0eVNIY0c5dVpDQUxHZHhLcmtXdzltRTFBQ2dWWTl3dkNIckQ3bDdaenEy?=
 =?utf-8?B?Z1BHVTJyMnFxMGk0WklUcUdBUU1Da2F6S3dCTjNXYTdvUmxvU2hGdHNRUGs3?=
 =?utf-8?B?QkRDYUlXdXB1ZTRjdjRKWU9yMVlST1FVUldVR0hVR0xMbmVFUFJpNTVLVHFs?=
 =?utf-8?Q?eIPFgx9+RbA/1CYYXKYPBS7yAK6GLg0Nbj2W3SP?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 2223cb3e-f295-4a2c-1ea2-08d93a159509
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 09:17:42.0851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHkunG1GzUGr/eFzprAWIrINMPvlT8aOeGKjCWANJYgzonZZSK2Txs0w4EjSRIR5z5qIIQDg+01YSC5IyI/AlywHRaS/yMmvqp9NiTrQLs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB3986
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25/06/2021 18.13, Richard Purdie wrote:
> On Fri, 2021-06-25 at 17:45 +0200, Rasmus Villemoes wrote:
>> On 25/06/2021 14.16, Richard Purdie wrote:
>>> On Fri, 2021-06-25 at 09:37 +0200, Rasmus Villemoes via lists.openembedded.org wrote:
>>>> I noticed that if I have an image recipe that says
>>>>
>>>> IMAGE_INSTALL += "kernel-module-foo"
>>>>
>>>> it fails as expected when the kernel hasn't been built with CONFIG_FOO=m.
>>>>
>>>> However, if at the same time some other package which happens to get
>>>> installed in the same image says
>>>>
>>>> RRECOMMENDS_${PN} += "kernel-module-foo"
>>>>
>>>> the image build silently succeeds, obviously without any foo.ko
>>>> included. This doesn't seem right. [I'm well aware that the RRECOMMENDS
>>>> line alone works as expected, this is about the case where both the
>>>> above lines are in play.]
>>>
>>> Which package backend are you using and does this happen if you
>>> use a different one, particularly swapping ipk and rpm?
>>>
>>> That might tell us if this is a package manager issue or a bitbake
>>> metadata one.
>>
>> I was using ipk. It seems to work as expected (i.e. fail the build) when
>> using rpm.
> 
> That is probably a bug that needs opening against opkg in bugzilla then.
> Added Alex to Cc: (opkg maintainer).

Indeed, thanks. Alex, do you have enough context from the above, or do I
need to do anything explicitly to file a bug?

Rasmus
