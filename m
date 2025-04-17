Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69896C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 08:23:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web10.3862.1744878205144620638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 01:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=e9iuwXsA;
 spf=pass (domain: ericsson.com, ip: 40.107.20.46, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VM+yBI2C5FSiXnmUYXQLsS0Ykw3zoS9MksqatupiXvY1xsOUl5HkJEFxOsPhomAGj4PpWfNsWs2N2xg63IzmQPF0qSXK9v9An//hABsfCxfCOxPQ8T7QhK6oVb22ktZsusfdLLYXtOfgNazkA7HDxD7OrPf7xnjWigVXze+uAigFYXVBT05+HlJyjh4+vFN2GBeNedMFEQHmj+zAZO+tcdV0SwzHAgxVx6IE865tzAs5KhUNpnQKBWn0ppweIyqEOrFTCJzn+9hhVIZYVKeFo/lUB5gcoCv+bX2DcDrJkbcG/UmXnVfCFDtf+aqkwqlI4LfnnENffvoteXNZMqk8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZv8pFKodBDTwU1pJeekMRekmWy/cEBgO++n73Ws1VY=;
 b=L4Qg6ZzZ39w6gG0VXE3slCuQob6qa6T4VFp/h9MxMv9CtE9TX8st/hiw17Q9JQoZiYtAxVVgEykDCtJaYEaUzzuJxXrFBgoUDrGLNX1YfiAFhShq1yGKOfBuCOrBDHK3mWd9Bb1up+uD2BvuYNC77dVNwQtc59zqmnjh/phUgVanYQg5b46WIUmGm7DiZUt3JCnx/0Bs+5vOaUwVCJgDQAwdxkaSd27DDjLyxKh8gzGshHGoGg40NZ9SfHPqCKL5NznUQeiKEBAY92w1/YWIp83orXxlc0cRUEr56uV/Hkmvr2pQWS5tBRt8UJwaGQxXDPzUPxS6/VB0iurXDc+v1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZv8pFKodBDTwU1pJeekMRekmWy/cEBgO++n73Ws1VY=;
 b=e9iuwXsAMeGodk1caDGyA0svCset47CD9j7UNR8/zdAhHVR4JoQT4R2lXE7IimmXWf+5q8Kq9+On0iATadhjX2/HLjrBHeiECl40Ku9EY7MBTSZYZ/yMtPRYWyPFC+gVriemwLZr5L3RZ8hzNgrYqn+O9TSMrzygQco105Krxj4HXxHN/6Tbt4HwpfxJcA/z1CNHzHUE7z9h36fLoTr4Z+4j2Px+DLHVEP4DpPOMOVdjxKUpKiUa2AVSbUhE8h8JvN4kABgi01cDIXZ5mbFdHt4KOy+02vDXarwiCQ3PZ2h7meiN1iFo/zOwFhjrzCPH9mNaAjGqlHEu287LMnFP7w==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by PA4PR07MB7118.eurprd07.prod.outlook.com (2603:10a6:102:d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 08:23:22 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%3]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 08:23:21 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "rybczynska@gmail.com" <rybczynska@gmail.com>, "steve@sakoman.com"
	<steve@sakoman.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>
Subject: RE: [PATCH 1/2] linux-vulns: fetch kernel.org CNA info
Thread-Topic: [PATCH 1/2] linux-vulns: fetch kernel.org CNA info
Thread-Index: AQHbrtvv9aD7i8zO1EWwHSBO6aB4ALOnhV+AgAAAahA=
Date: Thu, 17 Apr 2025 08:23:21 +0000
Message-ID: 
 <PR3PR07MB66665E52BB9A9FA5346387568ABC2@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250416142859.909037-1-daniel.turull@ericsson.com>
 <20250416142859.909037-2-daniel.turull@ericsson.com>
 <AS1PR10MB5697D4A4094FABD080D8543EFDBC2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697D4A4094FABD080D8543EFDBC2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=832947d7-9ed7-45b7-9962-557510413fae;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-04-17T08:11:24Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|PA4PR07MB7118:EE_
x-ms-office365-filtering-correlation-id: c6fe0709-5ec7-49c0-4f55-08dd7d891daa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TzdvdVk0VnlHMmgwcFZoSTRuYVNWbURtTnVMRGx0eHFwUFdEMkNPSFYzaVNC?=
 =?utf-8?B?ZndvU3o2KzZyRmdXbXNWMUVnVXFySEg0a0pPVmNJVGpqbzBCV3B0NFdyR3J1?=
 =?utf-8?B?emMyOGlCaUR1eXhBeEJQdm1saFpWeTNZQjJ5cDRpNEthN0NiY1phQ2J4TWNU?=
 =?utf-8?B?RU5HbHFtMS94TWx6d09VN2I4V2plWE03Ujd2RmtmN2hTL2lBMlltbjg2a0Ns?=
 =?utf-8?B?cTdXU3dhYWU4UVB4a1hhc2hqS3dJRUpxOU9LdWFmOWZwdTJyVVRBeEJQQzJz?=
 =?utf-8?B?aWExMGdLcXNOVFhuemFuK1pwZTBVSXJJdktSV20xdVRqK0t5QU5iNmVHQytj?=
 =?utf-8?B?eUcyMDEvTWlHbFZPaUg2WkI5TEhWUG1QbVNsdnNndDJDWGVqRFlVRlQ4YnlQ?=
 =?utf-8?B?Zzd5elo1djluM0lReWFvWmJQTjlVdFpwWmxWSDErbnN2ZXc3VmRsc0ZyVHJP?=
 =?utf-8?B?NVF2d05nMWx5L2dBSzVqTktVNDJhQnBZUjZoWVdzOWdJb3lreEVLRUtNc0Fv?=
 =?utf-8?B?TGFKQ0xIQlg0YkIyaU0rOUVyRzJjc0tWRnBUZERteDQ0bGYwYzlzSXRJSU5Z?=
 =?utf-8?B?cURIVGsyZ1lyVVZEQzMvR2phaUtZdVRxdWZpdjUvR1FKckNLNmJyQ1BnZ2Fn?=
 =?utf-8?B?QXlIdFRpL3VzUDY0VXZvaE1FUktOcTNINklmd2F4OHNCUVJvZWU5U3NwUXNZ?=
 =?utf-8?B?ZGpidUFPTzhzc2Z6ZnNxR3NzUHA3RUpSZXVqdlgzSk1LQjdKQkdzSjFZWmJH?=
 =?utf-8?B?UGptQ3JjOVdyY2x1Z2pCM3dIVzhKOVZmSzRkWUI3MzhDMkcyMXdudHMrUE9a?=
 =?utf-8?B?QlVYKy9WbS9lRDBZb29mMXM5ZW5pajY4dTZ3ZjB3TzZjTlRJWkJmclZ3UDNx?=
 =?utf-8?B?YUJQTlhCd2RQd0llRlE2cEV1TjBqczMwNjVjMlpsQjc4WFJDK3lpQWhvRFp4?=
 =?utf-8?B?UjdkemswbEtJNHpXYWJmRUx5KzFGZUwrWm1yZUJoZDFHelVtalZHL3BFd1VT?=
 =?utf-8?B?NEo1UTJtalNiMjFEK09yVjhLaGhRYi9hT1djU2FYbFduaFpMZ0hvaW40amVN?=
 =?utf-8?B?YkRwcGZnQSs0OWtWVnBGSnJNZkNGbFBoczZZOWQzS3lvRnRmYm1QaG5MS2Z3?=
 =?utf-8?B?YWE4bGJrSGxSUVZOdXB5Sk9nOHFtSkIzRWhWUEwwaGpacGFaQ2JzaVdYU2xV?=
 =?utf-8?B?b0VLMjRSYldtemxkWVdUQ0dpQk5ubDhBbDliUis0aWNpYnJLTEZhdXcyTGY5?=
 =?utf-8?B?a0lxQUl5dXBvUUlubEw4Zm1acDc4ZGZsM2ZFNUtITi9GTnltTnJkdnc0c3RS?=
 =?utf-8?B?aDNiL3NQNEhRTWdqcnI4MzN5bnJ5Q0RDcGtQOHdrckxuSGdhMENWSnVoWC9j?=
 =?utf-8?B?MnhIa2VmaGRtb2VaWXZEUE1RMDNjb3JUM21jelBub1c3NllCa2F3UEt5bEcy?=
 =?utf-8?B?bDJZN3NHMUxEcGI0UnZGZjJhUndUKzBDNlpvdVp1UHhrVkFMKzNvM2Y3TXk0?=
 =?utf-8?B?Qi9rdjRzSTRwYVFteEtoS2ZYaWpaL1BvSm5HUnphSWFwWnFtWHZWaCs1aWdx?=
 =?utf-8?B?VWswTG9wMWhmbzBqdGszdytzR2lKQS9PUjJoRU9Ob1VSSmRmd090cVg1QktF?=
 =?utf-8?B?QkpEdlJWeDhkcDBsc1g1TWVOK2UyTkFWZ3kzNjdiVTRzeFFNOU5WclhUNkNy?=
 =?utf-8?B?em9oZ01wd0lwaUNlYXJ6eW5kN1JmMnltTFRabFM0a1dGbU52aXdONlpzTlZu?=
 =?utf-8?B?ZmJHYTg0elVjSEo4cUR6NnhDblRXYm9RanRhYk9vZnA5dEFrOUlaVUhma1pI?=
 =?utf-8?B?TXpMNnBRVmFBTFNRdXp3L3JYMklBL1Vha3FoUjVmVmJDSi9CSi9aeFBBQm51?=
 =?utf-8?B?N1BHYmlnalRVc3Z5a09GeWc5a1FBSFpqUEdkdW80dXQ2K0pGVncxazRhRFg1?=
 =?utf-8?B?d3BVdzdLWmlSTmJYclRGZnFKWE12SlRGQy80ak9hNXRwblQrQi9ZVVIwWU9a?=
 =?utf-8?Q?f7MS0UACCvy4jyfsuKH9mtjUyWASBI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NkxkMUNJaGFBMXNteGNmbHBhVkJNckUzajk3TVlkdFEzM2ljakdGeFpIZkMw?=
 =?utf-8?B?MDdNQmdJWGEvcW9YWDhEV21TeFhEdFBxWk1waHAyVG05Q1ppZmE1YUZkWmNR?=
 =?utf-8?B?UDRDVlNKOUJWVUVTanVWUkRsWEdrZGtCZEVCZEdwWFp6U1pPWksrSk5XN2tr?=
 =?utf-8?B?OU9YSnE5Q3lOVEtoU25HY0hHVXVqeW9MOThtS0lMS21BbHkxNDFEUGxialZS?=
 =?utf-8?B?Z0pwWFFGNmo3eFI1M0JnTXM3M0NMMVR6L3pGMkorK0w2QmcvaVNDeVIrTnhj?=
 =?utf-8?B?bFo4L01TMjIrRFV1WGNkNDlIS1loZmxMUmVqNS9xSjc3dnNDbllZdjllVnJH?=
 =?utf-8?B?anhlLzVTTGlHTjBUYW9VQnpUYUExa0pmL1lpWDdpYldoc1lDa2hLT3hKU0JW?=
 =?utf-8?B?T2xjUStlNTk3b3psYk1zUFlxVEMxQ1dLd1U2MDc4WTBxTzdVWnFTck5SVGxz?=
 =?utf-8?B?Y3lOZzA1TmNzVkRvTWxncGtvK3BnUkR2R3JpZW00MnlSVmpCZE1RZGZBN2Qz?=
 =?utf-8?B?Z0pqN05OT2NhaEpTSlNXYWwxcVJ1SVBNZjQ1NzFjaWJnaEZjZ2lVQ2hxTjhO?=
 =?utf-8?B?WGNVcmVrM2ZzaEw3TzFDR2JXT00zSkM5TC9mQ2R5OHVPWUJFdWtXWDN4Q2lC?=
 =?utf-8?B?QWdXRWU3Uy85OUVtSjBvWFVKcEtjRWtETmtudlgyQ3BaQndxcm9lRDBteUw2?=
 =?utf-8?B?VFVkWUF3d3R2dkhicEYwZjQvMnRwUU8wdHdGWnRycnBLdzJidUtmV2Q1Y1Rv?=
 =?utf-8?B?Z21rZTRhVjZtckg1Z2ZuaVBMdFdCcjZoZUhhbXFleUF5VGlObm1yN2NiSU94?=
 =?utf-8?B?VGxOaG9COTB6WTVjYVoxUzAxTW9mK1E1bDBmTlNiOHJYWk0zVE9xanlwa2Ey?=
 =?utf-8?B?aVZobHV3UXY2N3o2ZkNFcFdyZEluRlNrMUhzNCtuZEhzQmRZUWEyM3J3OEVr?=
 =?utf-8?B?Z3FwckdGdG9LS1dYZ3hnY0tPY2FkdGxHTGVLT0Zvd1ZJeldvd29ZZkt5WEc3?=
 =?utf-8?B?UnVteUpFVDdxdFo4QzErQ3Rpam1maDRpTFdIVVpzZ1FMUmQxM0pua2JCV1Bh?=
 =?utf-8?B?ckZKSG50SnU5RmdtcVlWbU0ySjR5TUp3d3hyZE1rVER1MUtPVEo5eGZ3Ykha?=
 =?utf-8?B?d0d4OWhiQ1RQVEpzeEh6RlJiOFNIU1Izendxa0VnQitHQTdyWFUrbmY1ck1v?=
 =?utf-8?B?dXVKeG54QmxLOWErMkpKOU50azJSVWRwb0VlZUhvaVlIMFV1ZUZ3aC9zWndn?=
 =?utf-8?B?V3F5ajJYSENyMWRaTHBBU1VmOXE0TnlSNkpQMzhNcWl2dWhlZTg4TjlBZUxP?=
 =?utf-8?B?eW5kQlc4b1FSa2hNQzJpcFNUU3prMTVBdk9PRlplb3pXRHRjNDdHSjRUT2pz?=
 =?utf-8?B?K0NQa0Jra3MwSkdvMDEvUTdKcFBlRTFaR2lickU1VnRPWVpMUTJ4QmJpOFNn?=
 =?utf-8?B?ZjM5U3o4blJ5ZFEvbFgwamw1WlZCcllWSVpxc211eWxxRUNmUVI1M2k2YUIy?=
 =?utf-8?B?dlJCb2VKb1BjRVFhZEtGVzh6Qjc5MVpQRlVVeGMzb0xTMjAzeTVhZ0JDTlBv?=
 =?utf-8?B?bzNWOGdXRDRmcjIwQk9XMEF6QnU5dEd4VTBFcWQzU1hibFpIRkp3bFNtOWNZ?=
 =?utf-8?B?Z2ZSWnN6SFNOa0NDejBjaG5CUmJoWDlxV3hLbzlsTEp1QkhYZyt1ZWdDUlJo?=
 =?utf-8?B?VEkwQ3JsYWVEd29jYUU2d2VQWENXdTFpRmE4WWZDbzhQTVRrUG9lZEJCMm1N?=
 =?utf-8?B?QU1ILzNHdTl5VzJZUEY3aUVPRXhUcTMrZUp4YkFQUUE4R3ROTXgvSlcvblBJ?=
 =?utf-8?B?R0VrRnZNZFl3M2ZRZ3FqOWFucStJNDBteE90cXp1eUc3ZzJYdVlGVG5nbDl0?=
 =?utf-8?B?Y3p2UGlWNFBUMzdsT0lwd0wwdUp5bDdvamg3Q1UvaXRhckxGdGs3eEd3RWZv?=
 =?utf-8?B?K0V6RlpCYVhidGhRTEd5ckp5ZFR2WmZKcm02WGFGY1pNQUxjMEJ6amF4UENh?=
 =?utf-8?B?bXVmSzBlSTE1VEhCcUxrY3FkYU8zU2N0VmlBUTl1NHR3bDBUVVFRdzMydkVa?=
 =?utf-8?B?ZEo1UEJiWlhMM3duYjhOUm14ZDQ2cUlvdlNJNmxxUW9lSkxlMW4reXlpL2s2?=
 =?utf-8?Q?5+CxSBBMYIVMxbZ07nJzw5QFq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6fe0709-5ec7-49c0-4f55-08dd7d891daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 08:23:21.7924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EaNvNV+xultOQnal+6KmynKJjZpTKDFu9BHpqk3byZo+U8o2+fWqtNVjEhNEOMAgEtZ4XjBtkRbYlLws7fQLHsZNTsfgiuS0sVHXsrdmdCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 08:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215042

VGhhbmtzIGZvciB0aGUgcmVwbHkgUGV0ZXIsDQoNCkknbGwgbG9vayBpbnRvIGhhdmUgYSBzaW1p
bGFyIGFwcHJvYWNoIGFzIHRoZSBOVkQvRktJRSBmZWVkcyBhbmQgc3VibWl0IGEgc2Vjb25kIHZl
cnNpb24NCg0KSSBoYXZlIGFsc28gbm90aWNlZCB0aGF0IHRoZSBhdXRvcmV2IGRvZXNuJ3Qgd29y
ayB0b3dhcmRzIHByZW1pcnJvcnMuDQoNCkJlc3QgcmVnYXJkcywNCkRhbmllbA0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTWFya28sIFBldGVyIDxQZXRlci5NYXJrb0BzaWVt
ZW5zLmNvbT4NClNlbnQ6IFRodXJzZGF5LCAxNyBBcHJpbCAyMDI1IDEwOjIwDQpUbzogRGFuaWVs
IFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogcnliY3p5bnNrYUBnbWFpbC5jb207IHN0ZXZlQHNh
a29tYW4uY29tOyByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnOyByb3NzLmJ1cnRv
bkBhcm0uY29tDQpTdWJqZWN0OiBSRTogW1BBVENIIDEvMl0gbGludXgtdnVsbnM6IGZldGNoIGtl
cm5lbC5vcmcgQ05BIGluZm8NCg0KW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBwZXRl
ci5tYXJrb0BzaWVtZW5zLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBz
Oi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQoNCkhlbGxvLA0KDQp0
aGlzIGFwcHJvYWNoIHdpbGwgbm90IHdvcmsuDQpETF9ESVIgY2FuIGJlIHNoYXJlZCBhY3Jvc3Mg
YWxsIChwYXJhbGxlbCkgYnVpbGRzIChhbHNvIHRvIG11bHRpcGxlIG1hY2hpbmVzIHZpYSBORlMp
IHNvIHRoZSBzeW1saW5rcyB3b3VsZCBiZSBvdmVyd3JpdGluZyBlYWNoIG90aGVyLg0KQWxzbyBB
VVRPUkVWIGlzIG5vdCBzdWl0YWJsZSBmb3IgcmVjaXBlcyBpbiBjb3JlIGFzIGl0IG1ha2VzIGJp
dGJha2UgdG8gYWNjZXNzIG5ldHdvcmsgb24gZWFjaCByZWNpcGUgcGFyc2luZyAoc28gZXZlbiB3
aGVuIHRoZSBjbGFzcyBpcyBub3QgYWN0aXZlKS4NCg0KSWRlYWxseSB0aGlzIHNob3VsZCBoYXZl
IGZvcm1hdCBsaWtlIE5WRC9GS0lFIGZlZWRzIHdoZXJlIHVwZGF0ZSB0aW1lc3RhbXAgaXMgdXNl
ZCB0byBkZXRlcm1pbmUgaWYgdXBkYXRlIGlzIG5lZWRlZCBvciBub3QuDQpUaGUgZGF0YSBuZWVk
cyB0byBiZSBjb3BpZWQgdG8gZm9sZGVyIHdpdGhpbiB0aGUgYnVpbGQuDQoNClBldGVyDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZGFuaWVsLnR1cnVsbEBlcmljc3Nv
bi5jb20gPGRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEFw
cmlsIDE2LCAyMDI1IDE2OjI5DQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IENjOiByeWJjenluc2thQGdtYWlsLmNvbTsgc3RldmVAc2Frb21hbi5jb207
IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSw0KPiBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5j
b20+OyByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnOw0KPiByb3NzLmJ1cnRvbkBh
cm0uY29tOyBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4gU3Vi
amVjdDogW1BBVENIIDEvMl0gbGludXgtdnVsbnM6IGZldGNoIGtlcm5lbC5vcmcgQ05BIGluZm8N
Cj4NCj4gRnJvbTogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+DQo+
DQo+IEFkZCBDVkUgZGF0YSBzb3VyY2UgZm9yIGtlcm5lbC5vcmcuDQo+DQo+IEl0IGluY2x1ZGVz
IG1vcmUgaW5mb3JtYXRpb24gdGhhbiB0aGUgb25lIHByb3ZpZGVkIGJ5IE5WRC4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+DQo+
IC0tLQ0KPiAgbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21haW50YWluZXJzLmluYyAgfCAgMSAr
DQo+IG1ldGEvcmVjaXBlcy1jb3JlL21ldGEvbGludXgtdnVsbnNfZ2l0LmJiIHwgNDIgKysrKysr
KysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQ0K
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL21ldGEvbGludXgtdnVsbnNf
Z2l0LmJiDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvbWFpbnRh
aW5lcnMuaW5jDQo+IGIvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL21haW50YWluZXJzLmluYw0K
PiBpbmRleCA4MDY1Mjg3YzE3Li5lYzQyN2ZlNmE0IDEwMDY0NA0KPiAtLS0gYS9tZXRhL2NvbmYv
ZGlzdHJvL2luY2x1ZGUvbWFpbnRhaW5lcnMuaW5jDQo+ICsrKyBiL21ldGEvY29uZi9kaXN0cm8v
aW5jbHVkZS9tYWludGFpbmVycy5pbmMNCj4gQEAgLTQ2OCw2ICs0NjgsNyBAQCBSRUNJUEVfTUFJ
TlRBSU5FUjpwbi1saWdodHRwZCA9ICJVbmFzc2lnbmVkDQo+IDx1bmFzc2lnbmVkQHlvY3RvcHJv
amVjdC5vcmc+Ig0KPiAgUkVDSVBFX01BSU5UQUlORVI6cG4tbGludXgtZHVtbXkgPSAiVW5hc3Np
Z25lZA0KPiA8dW5hc3NpZ25lZEB5b2N0b3Byb2plY3Qub3JnPiINCj4gIFJFQ0lQRV9NQUlOVEFJ
TkVSOnBuLWxpbnV4LWZpcm13YXJlID0gIk90YXZpbyBTYWx2YWRvcg0KPiA8b3RhdmlvLnNhbHZh
ZG9yQG9zc3lzdGVtcy5jb20uYnI+Ig0KPiAgUkVDSVBFX01BSU5UQUlORVI6cG4tbGludXgtbGli
Yy1oZWFkZXJzID0gIkJydWNlIEFzaGZpZWxkDQo+IDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+
Ig0KPiArUkVDSVBFX01BSU5UQUlORVI6cG4tbGludXgtdnVsbnMgPSAiVW5hc3NpZ25lZA0KPiA8
dW5hc3NpZ25lZEB5b2N0b3Byb2plY3Qub3JnPiINCj4gIFJFQ0lQRV9NQUlOVEFJTkVSOnBuLWxp
bnV4LXlvY3RvID0gIkJydWNlIEFzaGZpZWxkDQo+IDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+
Ig0KPiAgUkVDSVBFX01BSU5UQUlORVI6cG4tbGludXgteW9jdG8tZGV2ID0gIkJydWNlIEFzaGZp
ZWxkDQo+IDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+Ig0KPiAgUkVDSVBFX01BSU5UQUlORVI6
cG4tbGludXgteW9jdG8tcnQgPSAiQnJ1Y2UgQXNoZmllbGQNCj4gPGJydWNlLmFzaGZpZWxkQGdt
YWlsLmNvbT4iDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9tZXRhL2xpbnV4LXZ1
bG5zX2dpdC5iYiBiL21ldGEvcmVjaXBlcy0NCj4gY29yZS9tZXRhL2xpbnV4LXZ1bG5zX2dpdC5i
YiBuZXcgZmlsZSBtb2RlIDEwMDY0NCBpbmRleA0KPiAwMDAwMDAwMDAwLi4xNTg3OTBmMDgyDQo+
IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS9saW51eC12dWxu
c19naXQuYmINCj4gQEAgLTAsMCArMSw0MiBAQA0KPiArU1VNTUFSWSA9ICJDVkUgaW5mb3JtYXRp
b24gZnJvbSBrZXJuZWwub3JnIg0KPiArREVTQ1JJUFRJT04gPSAiUmVwbyBmb3IgdHJhY2tpbmcg
YW5kIG1haW50YWluaW5nIHRoZSBDVkUgaWRlbnRpZmllcnMNCj4gK3Jlc2VydmVkDQo+IFwNCj4g
K2FuZCBhc3NpZ25lZCB0byB0aGUgTGludXgga2VybmVsIHByb2plY3QuIg0KPiArSE9NRVBBR0Ug
PSAiaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L3NlY3VyaXR5L3Z1bG5zLmdp
dC9hYm91dC8iDQo+ICtMSUNFTlNFID0gIkdQTC0yLjAtb25seSAmIGN2ZS10b3UiDQo+ICtMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFUy9HUEwtMi4wLQ0KPiBvbmx5LnR4dDttZDU9
Yzg5ZDRhZDA4MzY4OTY2ZDhkZjVhOTBlYTk2YmViZTRcDQo+ICsgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9MSUNFTlNFUy9jdmUtDQo+IHRvdS50eHQ7bWQ1PTBkMWY4ZmY3NjY2YzIxMGUwYjA0
MDRmZDlkN2U2NzAzIg0KPiArU0VDVElPTiA9ICJiYXNlIg0KPiArDQo+ICtTUkNfVVJJID0NCj4g
ImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgvc2VjdXJpdHkvdnVsbnM7YnJhbmNo
PW1hc3Rlcjtwcm90b2NvbD1odHRwcyINCj4gK2luaGVyaXQgbmF0aXZlDQo+ICsNCj4gK1NSQ1JF
Vj0iJHtBVVRPUkVWfSINCj4gK1BWID0gIjEuMC1naXQtJHtTUkNSRVZ9Ig0KPiArDQo+ICtTID0g
IiR7V09SS0RJUn0vZ2l0Ig0KPiArDQo+ICtLRVJORUxfQ05BX1JFUE8gPz89ICIke0RMX0RJUn0v
Q1ZFX0NIRUNLL3Z1bG5zIg0KPiArDQo+ICtweXRob24gZG9fdW5wYWNrOmFwcGVuZCgpew0KPiAr
ICAgICMgTWFrZSBzeW1ib2xpYyBsaW5rIHNvIGl0IGlzIGVhc3kgdG8gZmluZA0KPiArICAgIGlt
cG9ydCBvcw0KPiArICAgIHNvdXJjZV9wYXRoID0gZC5nZXRWYXIoIlMiKQ0KPiArICAgIGxpbmtf
cGF0aCA9IGQuZ2V0VmFyKCJLRVJORUxfQ05BX1JFUE8iKQ0KPiArICAgIGlmIG9zLnBhdGguZXhp
c3RzKGxpbmtfcGF0aCk6DQo+ICsgICAgICAgICBvcy5yZW1vdmUobGlua19wYXRoKQ0KPiArICAg
IGJiLnV0aWxzLm1rZGlyaGllcihvcy5wYXRoLmRpcm5hbWUobGlua19wYXRoKSkNCj4gKyAgICBv
cy5zeW1saW5rKHNvdXJjZV9wYXRoLCBsaW5rX3BhdGgpIH0NCj4gKw0KPiArZGVsdGFzayBkb19w
YXRjaA0KPiArZGVsdGFzayBkb19jb25maWd1cmUNCj4gK2RlbHRhc2sgZG9fY29tcGlsZQ0KPiAr
ZGVsdGFzayBkb19pbnN0YWxsDQo+ICtkZWx0YXNrIGRvX2N2ZV9jaGVjaw0KPiArZGVsdGFzayBk
b19wb3B1bGF0ZV9zeXNyb290DQo+ICtkZWx0YXNrIGRvX3J1bnRpbWVfc3BkeA0KPiArZGVsdGFz
ayBkb19jcmVhdGVfc3BkeA0KPiArZGVsdGFzayBkb19wb3B1bGF0ZV9saWMNCj4gK2RvX2ZldGNo
W25vc3RhbXBdID0gIjEiDQo+ICsNCj4gK0VYQ0xVREVfRlJPTV9XT1JMRCA9ICIxIg0K

