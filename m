Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3094EC87FCF
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 22:23:34 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.51])
 by mx.groups.io with SMTP id smtpd.web11.15988.1754778207662847238
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 15:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=y2c3tjee;
 spf=pass (domain: siemens.com, ip: 52.101.72.51, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R95xpMsRDRzN9ZVLy8f30kqo1ScELnJmyXzqEEVqPiDbKG/EluaKFgDMb8oaw2Nuqnjq7i93yHl6j9rBcIiQXyUrRtTAKXJbv+3NIIL6eBNX7X5siBub+C0nJu75yWrpcrJZ/zFYRqoXk7EOTqu4m0yWY6iinijCaAO4oUlCxqyh77qPsxTodEi07Sjl4SWVoVqHa+9TRGS37Osx84kdW+LAq3TKNeIIC9vLpS+3GeZp++eoV+vRGXI2mAHFB+5NyQ+NT4vZNNPXaGN4y/lbsp8x+0Y2+YptyzgKc9KrlhUb9IBfULVG62EqtGtnkVKIV04AkXrXAmStHp8SXLvBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWZtm+dUQfA32gzj1ZbBmIa96I6bRuQqJxDg3PatDUg=;
 b=uN4GqOTcQ6JJNI/aH5PSWyKEhnn/T8J08ar0KXgeoyxlDz5IZ8/pfs3JMAiTau99zBlhkmK0cLuhPPqB9WQGPhobL7M0CcMVIRfsYAeoWQnpFz28qKAzgSr5ctQb3eDTzQyhSMDUNciLJvDNvCFhcaZ2C2tX+4VEDbybLeKAsGz0iRwjWX11T7W/QWiOIsFKC6OBakOVABlyOEgiWKI+eMPMDcdafZ1E1f+/uDUpT3tvC/jslzJi974b7PU2bbf0fR5+HayrUKn+RtwkQ6CJOBzFIyTUD/Tk5H/KUxIcSPRAf8DLnCjRGj3A6WMkZGlmMX09Pta307s0a7mte2lodQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWZtm+dUQfA32gzj1ZbBmIa96I6bRuQqJxDg3PatDUg=;
 b=y2c3tjeeLOrAnAqX/MzpV9rqDFI0ag7BidspboWHOF2Av3AzKWp6xMYg1hgcB7UR4vcPsVmPaFxjQbsnLuMyUyxGvvRp1ekkEooG7n2X/gU7PBcT1gEbdSgoKPd5Me7eZu/nNW4mUmRoYkYUOSP0/Cx3ABfBOLOUhlmev8MWtKEztML5O8lT2Ib7/8aKTCM4seCoTu5fflMRYMlPKSGbAFj8BQ0aQKqV3iPT/1ZYkk6eg61mYIDyqAgyrKBcDbBQUOg2wNTFvyvSqWKRHp5nGljXUI8XIPsLPq4hyrHcOQjuHO4cwI00ZtWl6cfhDrStK+cYMfsw2mhzCYOlXsEOQg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB7036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:30f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sat, 9 Aug
 2025 22:23:24 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9009.017; Sat, 9 Aug 2025
 22:23:23 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>, "steve@sakoman.com"
	<steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][walnascar 4/6] glibc: stable 2.41 branch updates
Thread-Topic: [OE-core][walnascar 4/6] glibc: stable 2.41 branch updates
Thread-Index: AQHcCTw3sAKzpznqf0S3Nd0MSmF257Radr+AgABtViA=
Date: Sat, 9 Aug 2025 22:23:23 +0000
Message-ID: 
 <AS1PR10MB569777F976A148A856172E1FFD2EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1754750560.git.steve@sakoman.com>
 <af3e5e432d9bf1e5811ea92f3e29c0874b6b9405.1754750560.git.steve@sakoman.com>
 <CAMKF1srEOsPHQf1wnJNWrUWqB22UJ6iGrFrxJdYeOVwEAhF2yg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srEOsPHQf1wnJNWrUWqB22UJ6iGrFrxJdYeOVwEAhF2yg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d2206a77-4406-47eb-a2af-4f833a3f02fc;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-09T22:16:38Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB7036:EE_
x-ms-office365-filtering-correlation-id: 8c42eec8-5f2c-48c0-c2b0-08ddd7935aa0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RERNNUFLR2pCZ2FETFArRGpaMGhEbjBlUGJJekdoamg0SWJ5SDR0Y1VLdmZK?=
 =?utf-8?B?R2VzdzBQNlhQY29GcEtZSVZBTWk0Y3AyeUNlUStKUHRXQTg0ZVBEMFVpaE0x?=
 =?utf-8?B?S2JKd29YZFRxUVc5YzR1M25Ca3h1VlltV0o0cFhwTzltVUp5SGlKcDZVS29T?=
 =?utf-8?B?b2dJdkpRZFIvQUx0Z0J1bVh4cUwySG4vWUQzU3JOMVB6ZklEMnFkZ1NldXVG?=
 =?utf-8?B?dVZQY3B0d0RiS251U3RNdm5OVGMwTEdUbnJ2dTBhcHhjMlczMHhjYktnTmFo?=
 =?utf-8?B?NlF2T09SQ1ZuRkZyQnFFMEpTSVptaDdDS1VobkhTQVFtQzRWT0dlN05MQ0di?=
 =?utf-8?B?aWhSeGp4NnRLa1NmRFJEOTRoZWt1d1ZFN2t3RmxpYWNTNVZsS01LNzRrVC9x?=
 =?utf-8?B?WjVQVnc1dWhzcnd0Ums5VEpWZldCNGFrMVA1RHh5YkxiS0lVZlp2OFhoa2Rk?=
 =?utf-8?B?WGVOZ1BBYitXZlNtOXBpWjZuOXVUTW9zV1NoWUtyTWZCMVNERVV0MWUxY1RJ?=
 =?utf-8?B?RUkyV1VxK3dPNzJJMUk4Tm4yM3NuOWdtZUc0UXhOM3RmZUt1ZitVQWppZ3Fy?=
 =?utf-8?B?Nk9mektMKzMrVDgxcmpQQWpEcXZIWHhhVHpjcXQvSkpaa0hWYVl6VnJkMjZV?=
 =?utf-8?B?bWVwSFVOaHBxSCt6bGhxVnVNMGN1UWpzVkQrVmloMW9tYit6c0dMMjJwUXFm?=
 =?utf-8?B?MGFudWVZbTd2Z0pwR2xJbDBXeVdVaGxBbzJBZ1Iwa2ZXak9CWWpGMkNvQm5v?=
 =?utf-8?B?dUdsVUFjRUJ3NGRZc0ZsN3VtWTNVdzhya2R0cXdNOXBjRlhKOE9zZ1QvUG9a?=
 =?utf-8?B?Zm9HWmtFMHNSOTV4R3cyMm9LSkN0Uml6YW5RWmhrclFQcTRuSW9FQTlPSy9t?=
 =?utf-8?B?SjRDK0s4QjV5bXRCS2JsYWFPUmsrMEFhaFRFZVFMUVBjWjFXbG9hZUErYm5L?=
 =?utf-8?B?MEVVZGZWUGgzMWF0d1JqTVZTRVR2cENhMVhVRHhLdkhuc1VtZlBKZVJMc3pZ?=
 =?utf-8?B?K0h1WFBxQUtjUzFUcG1zdSt5Q1pIZjB5dkdqcERaMmJGSENldHR5bENMQW1x?=
 =?utf-8?B?TkhWbjRUeERBenEwK2Q1SnYxbk1NT3loRFRoN0RuSmZRQVFwMUkwdnJPdlFa?=
 =?utf-8?B?L056anQvaU03Z3EvVWF2T2dqV3lzeTJ5Z1JoZjc4YTBFTTRHNkZvc2tWcGt4?=
 =?utf-8?B?a0N2WkIwZnlPemZ6WkpYTEI0bWdiRXVMNmRZQmVlZ0NrNDVVTWV2K09HMlM1?=
 =?utf-8?B?UDJqWWxmMytRR2NhZUZvQnl2M3J1bk1tVHRaaDV5eTNDWEFGYS9HeE05OU5l?=
 =?utf-8?B?a0hWajJsVWZaU2huMlgrSTM3Um1GRnRwYWIrdXA4MndXMFpkZVk1OS9LSjVu?=
 =?utf-8?B?MDJxWXdHU2Q1UmdINzVuQUhucXVFUEk2Mjd0bmFCNTZrZWw4Qmw4WEtLYmY1?=
 =?utf-8?B?RmZIVlkrZG5uc0hFU0tjejRYYXMrRHRnU3VTejJCL1FwU0lsOHVtOVdWUU1T?=
 =?utf-8?B?REFQczBtU295WEU2TVU0S3djS3BaZnBoY0E3d1VDdzk1emkrcitXdTU5MzZh?=
 =?utf-8?B?eHRFQjdQUi9MbTJZeHJrZERmVERwSlRuQUZkS29IS1NIamRNNXNoUjczckx6?=
 =?utf-8?B?YTQrRTFzQU9rVldJdXE4VTFDaXlhQWIrZEV3L0FwZWdiOEFjdzZ1V1VrVllM?=
 =?utf-8?B?ZnVOT3EwK3plVFVHQ3A5UEdRdlY2WTluS0g0cTU0TW1mcHVoY2JnL1F6WUx0?=
 =?utf-8?B?bTVwTllCRGVadzR3TnRMc2FqeEhTM2ZHZ0EreXFDZ2NaNU5HaTNZKzc1Q2VF?=
 =?utf-8?B?c3RGekZsY0IxQmxnbFJ3YTN3NG1LUUQyTDV1Y2diSElXMkZJeFFsMHZ2UEEw?=
 =?utf-8?B?cWllRkljYnUzSUZUMzdLQ0lGcmNDdHFsSXh2VzVaZFd1RHllOFc1bHE1ZWVs?=
 =?utf-8?B?L1dkVTkwY3RQQnR2QUFUN2ZNdmY1Mkp0MjhFSVZTdi8zNHQ4Uyt1MmkxQ1du?=
 =?utf-8?B?Uzk5dUphSjZ3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RlJuczFUeG5TbVlIQzhGQWtwd21IV29SQUhtMnBuL1A4a2YzWitrRkxqN2pK?=
 =?utf-8?B?U0c0Yi9Hdml3b1JoOFhtQUdNVTEwWElTM09UNlVvUndQREk4NHZ1dkdrZmVB?=
 =?utf-8?B?dFhHV0xzWW9NR0k3ZDREWXZCNUs4cjYvVytPN0dVMkZmK01ob3VLWEx2NXJM?=
 =?utf-8?B?QTlCWUFQK0FOeVFhT09rL3dONTFQN0k5NVJnNzRLZFc0ZFdhUFF1UXpsYjN4?=
 =?utf-8?B?YW1rSSt1eXFhcHBjdVdzS3FsWXFMK2YxM0ZJSDF1QUdIT1N6c2NlQmpvSWpB?=
 =?utf-8?B?QStLODEzRW1tdzJPTUJRRS82SC9hbUFjTUpIVytlSkw0YnJGQVZPakJpczBP?=
 =?utf-8?B?aklSbmhIS1BKS3JRblMwalgvcEZxa2E5TnhqTFYvL0J0WnpJKytyanJnQ0p6?=
 =?utf-8?B?anlucmJwMDBxVUdMVnppK1VzSW03N0MrelJLQU5vK2FmU2dNakNveWVOVXdV?=
 =?utf-8?B?UkdRVm42Q3NEVzhLaWYwMG84STN2L200ckcxd3Rvdlp2WmpxUnowenl6OVM5?=
 =?utf-8?B?SzU1REo2TVNNWDlMNWQ5UUJuU3BiS01jZUxEYy91RXpVZm1VTG5Ld3J6ZEli?=
 =?utf-8?B?VjloN2JONTROd2hRekg5QkNGYzFCaDhteHJxRFVvdEJoTFRCSTFRbStaalhM?=
 =?utf-8?B?UUV1akZPUVA1SWFCcnRabnJxcTNZYkdvM1c0V2NmTzRkVlpxanBzQjc3NWNq?=
 =?utf-8?B?R2NxSXp0TnZ1MDgrK3E3TE1GQkpnZGIzbEdwakZSUUV0Rk9aRU5rU3JGc1pC?=
 =?utf-8?B?UVFGbjQzcXlHcnJ3WFVqWjZMR2Zxek1aSkh6Y1JKbnA3a2V1YWJ5TkkyRzNz?=
 =?utf-8?B?bVhib05LUUJlM0tCaFFUZDlITUdpQksyZkdsTHdJNm0zSWFtZ0tRc2R1dUdp?=
 =?utf-8?B?TUJNQnJkbldsZ2Q4TEhFSkQxOFcwQjRCY1NLbjlZN1Y2RDhiRm5wMlZCNEpl?=
 =?utf-8?B?d0IrcXZnTEQyZUx4OU54N3FmQURHa2tDRmp3QmpPc0J6RE1Ya0lLSDRWR3hG?=
 =?utf-8?B?dkNEcmZyb0dWTDN5UEM0ZmFrdGRlWkw5cEtZd05MWTlFUEFPMmpiKzhzaHJE?=
 =?utf-8?B?R3VwRmc3NE9SeG5aU2RtaUtPRjVaaUdYLzdKU0lUSnNRZkZwTU9VY3hNSzZ6?=
 =?utf-8?B?SS9tVzVOK0RRMkFGWUI2YWprT3o4RS9ZVDN0RzlnWHVKUGZUdFdGYWFpNUxM?=
 =?utf-8?B?SEFvSmtzVzdOWlczZmhjWUh0aFpXaXo3bnJ1aFVCM0NCZWpkQWVwdEhHWXQ1?=
 =?utf-8?B?Y0hCNEV0OGw0ajNjTEQzSy9rdGg0ZURBRHdSb1NaMlNhRDNKZzMwZnZTbkNz?=
 =?utf-8?B?VVU5bnlpWEx3ZStOdjlqeVdtT09JWmNudmpMalBRUlJLcEptbjQycDh2d2tN?=
 =?utf-8?B?a01jWGl4Z1ZGVWxJVG9PMXNzSXNBa2JhUEZYU0VUWGphUGZCUDBqQnZzcnpx?=
 =?utf-8?B?L1RoRnBoSjNoMFE4SDVJcTNqTUhCU2xVd2I4VHN1MDRjUG52Y3l6RzgxTE5C?=
 =?utf-8?B?VGVrTXRta3NJMFN5RzBZQlFTbDFpN0o2M3FpNngraHA4TGVKcS9JRG9NQ095?=
 =?utf-8?B?MlhyRW9oZWErMk41NldzM0FoN3BJWjFWWkE3ajE1MUxCUFBXWUIxUjBHcVNQ?=
 =?utf-8?B?Mk1nKzEwNDVGa0QrekZOZVJMZUU5RTdOWVFWdUtsQi94VWZpZkVKTGF3dHE2?=
 =?utf-8?B?M1BLQlYxaDJIN1dBM0xMZDZ1NFNYRlY1Qk9XM0lEWE12dmpnL1hRSjZxYkt0?=
 =?utf-8?B?OS91Zm5zczZramFnR0lQTWV2S1RZak5RK0k0aC84Ym1uKyt6S1VZVlZmdjcy?=
 =?utf-8?B?ekFGL2dBdGp2VERrekxNRXNwSEl0aEc2ckRkY09oTGxYYi9rODNFUkZZNTN0?=
 =?utf-8?B?SlRDR1R0dkI5K281TVh3eld6YXg1UWJnRGlpNk4vdDJERmMrTGs2amYveHpH?=
 =?utf-8?B?WVJ3bVR4c1VsM3FPMFdUOXZ1eThoOThhT0lpZGtKR0VpTXEzb3c5aEZtT2VD?=
 =?utf-8?B?WGdBNi9oeWFRT1JjeHgvSDhiM0E0YlE0YlN3TWc0aHVGaDM5WUIySk50OFhQ?=
 =?utf-8?B?WStjaXVRR0NDTW52WlVzSVMvU2FrOXJkZ0dwVHR3RG9VVW5CMTZIYVUwSHRx?=
 =?utf-8?Q?ayYGvo0M6cfEN4H/SVvk7K5D+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c42eec8-5f2c-48c0-c2b0-08ddd7935aa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2025 22:23:23.6547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q6wr9V5CnDH3N4irQX4Sh8S7zh7jKiHXx4NrEzr5EMyMkGXWjAgDDv1Zepfl9zK7XEbrK0SMD91GGJFBr5CQAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 22:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221692

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgS2hlbSBSYWogdmlhDQo+IGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU2VudDogU2F0dXJkYXksIEF1Z3VzdCA5LCAyMDI1IDE3OjQ1DQo+IFRvOiBz
dGV2ZUBzYWtvbWFuLmNvbQ0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW3dhbG5hc2NhciA0LzZdIGdsaWJjOiBz
dGFibGUgMi40MSBicmFuY2ggdXBkYXRlcw0KPiANCj4gT24gU2F0LCBBdWcgOSwgMjAyNSBhdCA3
OjQ04oCvQU0gU3RldmUgU2Frb21hbiB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8c3Rl
dmU9c2Frb21hbi5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gd3JvdGU6DQo+ID4NCj4g
PiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4NCj4gPiAk
IGdpdCBsb2cgLS1vbmVsaW5lDQo+IDZlNDg5YzE3ZjgyNzMxN2JjZjg1NDRlZmVmYTY1ZjEzYjVh
MDc5ZGMuLmU3YzQxOWEyOTU3NTkwZmI2NTc5MDBmYzkyYTg5Nw0KPiAwOGY0MWFiZDlkDQo+ID4g
ZTdjNDE5YTI5NSAob3JpZ2luL3JlbGVhc2UvMi40MS9tYXN0ZXIsIHJlbGVhc2UvMi40MS9tYXN0
ZXIpIGljb252OiBpY29udiAtbw0KPiBzaG91bGQgbm90IGNyZWF0ZSBleGVjdXRhYmxlIGZpbGVz
IChidWcgMzMxNjQpDQo+ID4gMWUxNmQwMDk2ZCBwb3NpeDogRml4IGRvdWJsZS1mcmVlIGFmdGVy
IGFsbG9jYXRpb24gZmFpbHVyZSBpbiByZWdjb21wIChidWcNCj4gMzMxODUpDQo+ID4NCj4gPiBB
ZGQgQ1ZFLTIwMjUtODA1OCB0byBDVkUgaWdub3JlIGxpc3QgYXMgdGhpcyBpcyAoYnVnIDMzMTg1
KSBjb21taXQuDQo+ID4NCj4gDQo+IEhpIFN0ZXZlDQo+IA0KPiBTaG91bGQgd2Ugd2FpdCBmb3Ig
V1JUIHRvIHJlcG9ydCBiYWNrIG9uIGdsaWJjIHJlZ3Jlc3Npb24gdGVzdCByZXN1bHRzID8NCg0K
VGVzdHJlc3VsdHMgb24gbXkgc2V0dXA6DQogICAgICAgQmVmb3JlICAgICBBZnRlciAgIERpZmYN
ClBBU1MgICAgICAgICA1ODQzICAgICAgNTg0NyAgICAgKzQNClhQQVNTICAgICAgICA0ICAgICAg
ICAgNCAgICAgICAgIDANCkZBSUwgICAgICAgICAxNDUgICAgICAgMTQyICAgICAgLTMNClhGQUlM
ICAgICAgICAxNiAgICAgICAgMTYgICAgICAgIDANClVOU1VQUE9SVEVEICAyNDMgICAgICAgMjQz
ICAgICAgMA0KDQpEaWZmIG9mIHRlc3RjYXNlIHN0YXR1czoNCm1hbGxvYy90c3QtZnJlZS1lcnJu
by1tYWxsb2MtaHVnZXRsYjEgRkFJTCAtPiBQQVNTDQptYWxsb2MvdHN0LWZyZWUtZXJybm8tbWNo
ZWNrIEZBSUwtPiBQQVNTDQpucHRsL3RzdC1nZXRwaWQzIEZBSUwgLT4gUEFTUw0KbnB0bC90c3Qt
bXV0ZXhwaTggRkFJTCAtPiBQQVNTDQpucHRsL3RzdC1tdXRleHBpOC1zdGF0aWMgUEFTUyAtPiBG
QUlMDQp0c3QtcmVnY29tcC1icmFja2V0LWZyZWUgTi9BIC0+IFBBU1MgKG5ldyB0ZXN0Y2FzZSkN
Cg0KUGV0ZXINCg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFy
a29Ac2llbWVucy5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU3RldmUgU2Frb21hbiA8c3RldmVA
c2Frb21hbi5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJj
LXZlcnNpb24uaW5jIHwgMiArLQ0KPiA+ICBtZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliY18y
LjQxLmJiICAgICB8IDIgKy0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYmMvZ2xpYmMtdmVyc2lvbi5pbmMgYi9tZXRhL3JlY2lwZXMtDQo+IGNvcmUvZ2xpYmMvZ2xp
YmMtdmVyc2lvbi5pbmMNCj4gPiBpbmRleCBhMmNmZDBmMzA4Li44ODFhOWNjZTJjIDEwMDY0NA0K
PiA+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjLXZlcnNpb24uaW5jDQo+ID4g
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMtdmVyc2lvbi5pbmMNCj4gPiBAQCAt
MSw2ICsxLDYgQEANCj4gPiAgU1JDQlJBTkNIID89ICJyZWxlYXNlLzIuNDEvbWFzdGVyIg0KPiA+
ICBQViA9ICIyLjQxK2dpdCINCj4gPiAtU1JDUkVWX2dsaWJjID89ICI2ZTQ4OWMxN2Y4MjczMTdi
Y2Y4NTQ0ZWZlZmE2NWYxM2I1YTA3OWRjIg0KPiA+ICtTUkNSRVZfZ2xpYmMgPz0gImU3YzQxOWEy
OTU3NTkwZmI2NTc5MDBmYzkyYTg5NzA4ZjQxYWJkOWQiDQo+ID4gIFNSQ1JFVl9sb2NhbGVkZWYg
Pz0gImZhYjc0ZjMxYjM4MTFkZjU0M2UyNGI2ZGU0N2VmZGY0NWI1MzhhYmMiDQo+ID4NCj4gPiAg
R0xJQkNfR0lUX1VSSSA/PSAiZ2l0Oi8vc291cmNld2FyZS5vcmcvZ2l0L2dsaWJjLmdpdDtwcm90
b2NvbD1odHRwcyINCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xp
YmNfMi40MS5iYiBiL21ldGEvcmVjaXBlcy0NCj4gY29yZS9nbGliYy9nbGliY18yLjQxLmJiDQo+
ID4gaW5kZXggN2RkZjdmOTEyNy4uOGE2NWU4Y2U5ZiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliYy9nbGliY18yLjQxLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYmMvZ2xpYmNfMi40MS5iYg0KPiA+IEBAIC0xNyw3ICsxNyw3IEBAIEFsbG93cyBmb3Ig
QVNMUiBieXBhc3Mgc28gY2FuIGJ5cGFzcyBzb21lIGhhcmRlbmluZywNCj4gbm90IGFuIGV4cGxv
aXQgaW4gaXRzZWxmLCBtDQo+ID4gIGVhc2llciBhY2Nlc3MgZm9yIGFub3RoZXIuICdBU0xSIGJ5
cGFzcyBpdHNlbGYgaXMgbm90IGEgdnVsbmVyYWJpbGl0eS4nIg0KPiA+DQo+ID4gIENWRV9TVEFU
VVNfR1JPVVBTICs9ICJDVkVfU1RBVFVTX1NUQUJMRV9CQUNLUE9SVFMiDQo+ID4gLUNWRV9TVEFU
VVNfU1RBQkxFX0JBQ0tQT1JUUyA9ICJDVkUtMjAyNS00ODAyIENWRS0yMDI1LTU3MDINCj4gQ1ZF
LTIwMjUtNTc0NSINCj4gPiArQ1ZFX1NUQVRVU19TVEFCTEVfQkFDS1BPUlRTID0gIkNWRS0yMDI1
LTQ4MDIgQ1ZFLTIwMjUtNTcwMg0KPiBDVkUtMjAyNS01NzQ1IENWRS0yMDI1LTgwNTgiDQo+ID4g
IENWRV9TVEFUVVNfU1RBQkxFX0JBQ0tQT1JUU1tzdGF0dXNdID0gImNwZS1zdGFibGUtYmFja3Bv
cnQ6IGZpeA0KPiBhdmFpbGFibGUgaW4gdXNlZCBnaXQgaGFzaCINCj4gPg0KPiA+ICBERVBFTkRT
ICs9ICJncGVyZi1uYXRpdmUgYmlzb24tbmF0aXZlIg0KPiA+IC0tDQo+ID4gMi40My4wDQo+ID4N
Cj4gPg0KPiA+DQo+ID4NCg==

