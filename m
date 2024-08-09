Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189F2C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 11:04:55 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.82])
 by mx.groups.io with SMTP id smtpd.web10.81641.1723201484609480933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 04:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=H+2/ADwM;
 spf=pass (domain: siemens.com, ip: 40.107.104.82, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnZXATLHpJzj4EmM6277HZpSRn9brFj9iDro5pX/ZnJBWbZjG03slFHAufEpv/zze1q1YIt/uq7e2fL3zsh8yKu4/fXP905c+bXqhwQkqt4wwVftBoqsCbzxSMk2N6FddzCaVCNJElWVXTu0WDEPR3C8xA6EwAKZnH7RUHwN+thDbF3iC1Y6OE6ygHLIPxCdqV7jj89O090KVpaxhFYOf75E3E/5rjzHx6KoY/TOvpldJ9oNK/GCk84vY1ys1cymPn2Ej7pGoepxIYLL+A846o3Mm1J6XzhyGqxqErP2UfrJRc7GSWwraeyx512vLmifafoZoZRyZ+Nbyf8gBsqhEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0T7Xe6Mc6lFgQIvX532VkYwd3vR/Vo+uptELyxzU2s=;
 b=WGUNa+gzFrQfnd2gA2xqGgKuhplQKPTsrzhlBGNii2tJof2ez/5jNl0fTs4Tu2vh6L04KCZjmAzF736Yak8IkTEvhXFCTeEYmqg8Rv+WbMAXriaF2PpgM23ij4vF5j67k7h9imUEDPeI5VuCTWj97ONt0UdZknHsNGTKZSBy74KiYjYUambduGW7z4b7Lx7/lUoXobPIJpkVyRHwsEcvkM5+8dtyiSKCv+w2+wNHUpJGfyYzY7If6PRuh9FONX2/KsQCYPDxBCyv1n/1Bfm+SRbC8Osu1oa7p6iIo383shDFIySDc+1btXuUE0ZdWXfkkWhRft5delgBsSZLn0K2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0T7Xe6Mc6lFgQIvX532VkYwd3vR/Vo+uptELyxzU2s=;
 b=H+2/ADwMGUwOPzTBvWUHBr4QeR3uF7s6+98zWHRZzQMZDhQryUoAL89Oter+t1cX4DR1fDwuSMzjQzzfxvSxvG2jezZZ7jC0Y7OAjOpm10TKPxYwGC3vBGASWiSjZ9ebi3XIzRYQFdT38nn2IQ6r4RnGgNpK+frT2QA0IoqldiW+Kru+Yc9P3NVTn107AKUAUdrkMXOlHmCb5ZfppcwwhC2AHvFGHiCURYD2LAaG2XCc5EVlAkbbghOiJiyvl9qmDNMumz8Agf7CBJcAzNKF91lxq7m8BrKXIwb3wNEAIUr+G3lB142XrnwzYR/kXlvvnSRut9zKHTk4xDV8yeTQCw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM9PR10MB4071.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 11:04:41 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7849.008; Fri, 9 Aug 2024
 11:04:41 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Marta Rybczynska
	<marta.rybczynska@syslinbit.com>
Subject: RE: [OE-core] [RFC][PATCH 1/2] cve-check: encode affected
 product/vendor in CVE_STATUS
Thread-Topic: [OE-core] [RFC][PATCH 1/2] cve-check: encode affected
 product/vendor in CVE_STATUS
Thread-Index: AQHa6iS5WMvAXQQOR0OfKkS2qc7kdbIeevFQgABDEYCAAARocA==
Date: Fri, 9 Aug 2024 11:04:41 +0000
Message-ID: 
 <AS1PR10MB5697B88DE0702D3F25A399BBFDBA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240809062339.15465-1-marta.rybczynska@syslinbit.com>
 <AS1PR10MB5697F5AC1D5981DC3523D59BFDBA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAApg2=RkZYdrycdS0_JMYJOHhb=7OpjZXH7wjQj0oBZYrQiBkQ@mail.gmail.com>
In-Reply-To: 
 <CAApg2=RkZYdrycdS0_JMYJOHhb=7OpjZXH7wjQj0oBZYrQiBkQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c2b9320f-3a89-44e3-a990-36f9e18c5eec;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-09T11:00:31Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM9PR10MB4071:EE_
x-ms-office365-filtering-correlation-id: d19b9825-c1f1-4660-e4d1-08dcb8631184
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZFZuVU1Ccmc3SWJzRXlqVDdaRUNkb2NHTjJ2THdSOHMyK0lkUlV6VTl5VXhv?=
 =?utf-8?B?TWgrVnMzOU95Q3lwdzhHMU03aEErWTcrQ1FGRXhNMnI5U0E3blhyWU8yUWQ5?=
 =?utf-8?B?UkoxS0lLekR6MXpFb1VpSkh5OGhJTjhKdE81WEJYd0g2SStqUDYvR2dTZUs2?=
 =?utf-8?B?ZEJBRWdTaStaUWxwL3Rsa0VhSGhsNHZPZUx5a2ljSlVGOWYyY21jclRpS2RO?=
 =?utf-8?B?ckovSFBPY1N3RjQ3amw3cUZPaHdub0JlUC96T2szSnFyTHVhaUJTekxWeGhH?=
 =?utf-8?B?bFlMNmYwTWc0SFdqaGYrYmVFKzJBK21neTRpQkR1b1BEeExLalB2ODhUQVZx?=
 =?utf-8?B?QTZmNlR3N2poYXVYcFVNbzg2dmxtVHpUdHRiMUFzTmJwL0pSTStHTi9hcHF4?=
 =?utf-8?B?VndUOVp0aDlUWVpKNjZxQlE5ZjAxT0ppYWVQYVhCazhTMXhabGxidmtSVyt1?=
 =?utf-8?B?TzVvTUlJd1N2SldxK1l0cS9IZExCSm5aSmZzWkUvREZFLzFtREZOSjlIV3ZD?=
 =?utf-8?B?c1k4RTRGcHREN0lRb1RKUjhnVUJVNk9qcm5ta0p0OTdrUEZVWVRjTWdycWlV?=
 =?utf-8?B?bzc2SUNNUEFqOC96U2lLZEFrdHJ6UUxnQ3VBSkZsc3NKOCtVWnRuUmhtQkxC?=
 =?utf-8?B?a0VqVEg4OCtxbkVSaDNPT21JZzlZRlJUMXFYcnAybjhJVmtPOXhOVGtORG9K?=
 =?utf-8?B?aVdraC8vTnFzbGJvVjBlaUF3YkhOUlhkc2NTMHlsQzQxZ3pLejRvWVVsWVR4?=
 =?utf-8?B?TEhTM1NITHFqcGoyajI4QkE4dFRqeWNtVFFOKzdhT3c4SlRrNWFBcWRaV3VG?=
 =?utf-8?B?eGZvdUlBdmVuRGRVVE95c04xb2xWYnN2ZGhiaEQ1UzcxTEkvdEJOcTlhMEZK?=
 =?utf-8?B?OXBxUDJRMFc4NGRGUjB4bGxBQjl1ZXU2bFBEWk1aSkwwY0g4V1dMam9SSEJ3?=
 =?utf-8?B?aWsyamdmT2hqam4wN2NxOEN4KzcwNEM1YzlTMzlkUGF1S09ZMHhaalhvOW5R?=
 =?utf-8?B?Q00rc2M4NFVBV2JIUWw2M0dDbHMySC8yVjdLQ0o0aGNRVm5tZzN5Z0lKNVFm?=
 =?utf-8?B?b3V5eEdYTnM0WEZBdmJ3R3BTL1FZZ25vQ2p3RWFSd0dtdXNOeVZRZkgxK0pB?=
 =?utf-8?B?cXFkTGdLbERlVzJJZGRhcUNZT3NFOU40NlNkazdqYVo1N0ZGa1dzODZNVmx6?=
 =?utf-8?B?UjlkRHhKWjRQcExsVm4vcjl5ZDhLNlV2bHlpUEJKVW5XclI1NVpnM01UMUhY?=
 =?utf-8?B?MVlBejJZd1VaL1pJZmlRZVlUeitkL0pweG9BcmpTRmxxV05Ja1RCUkdWeWhx?=
 =?utf-8?B?Tjd2VThYSlVLWE9zVTEzZUx6ZmNJUEtxOWRXRUVHdVZVVkZjaDBYMVl6ZXJX?=
 =?utf-8?B?ZlZxVjVITldhNDR4bHdrVjNCNEFodDR6WEtOYWtyeG9kQWRIczJtMXBWR3N6?=
 =?utf-8?B?b2UzTVRyVjVzUXovcEVmRE11ZnZ5ZjkzM2hLREJOb2dqWEVtVzhuVHRDSjM4?=
 =?utf-8?B?bFBNQjhBYjZWQUdOYmI3RTVNdklkRGVmR3JhM3RZYkZuWHlmR09SYTdmamI3?=
 =?utf-8?B?Q1VIQmdtWG9ISWRoWUVIL3oyZEQ4bUpyck1hMjllMHRvVVgwS0tZZkU0ZWlC?=
 =?utf-8?B?djQyQ2hNMEZNbWpaWjhrdFVKUWI1Z1haaXdYbU1NMzhzMEh5SWxGOWNVZWRX?=
 =?utf-8?B?SXlFOUFkcW9tK0Q1azBOVFpJMGt3THlYR21zZHd5RFNBTVJueFpmYVl4RVVZ?=
 =?utf-8?B?eGZtbDlaTzUrcVlldjRvWXVLQlJGYjVCU0hmNGF2b0FWNkJiUm1YS01yM1BN?=
 =?utf-8?B?VEVkdkxkcGRsSUhoYzMyUT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U2Y1dEZkQk1jRE5TaERyM2RETGhNOTdubEFPY3BYSnJGYUVnZS9hZldYSDJB?=
 =?utf-8?B?WE9SWHJzZ2hBWDRidW9IL0NrU1hENDRIM05hZjlOMnFkdlBHc05qUWlrdkEy?=
 =?utf-8?B?M0hZZWtXL0hweUovUFh1MHVxUEpjUFdNbHMzYkNoMDlDNHp5bXloSkFGbmZF?=
 =?utf-8?B?VDRTWmp1aGVmOHNkU2RzMW5TUWNoc0NMaHBCc2NHYXd3SjRkNGJiSnNuQnc0?=
 =?utf-8?B?ZlRKTHZaK3ZCMFFFQitMS1RBL2YrL0JXbkZ3bU9sY21nbXh2VnRUcUI5MnE3?=
 =?utf-8?B?MWZsQW04VUh5dGpCaU9jUUE0OVQ3eVhYc245UGRGUzU3R1hSSUxaelpRYTN3?=
 =?utf-8?B?ZkZPWGxNY3N6dm12eXNYNTkxdTVVam1paHRvSDh2dkl5S3p6VVVIdElBcUhW?=
 =?utf-8?B?bmo5TVdzRE54L0MvNllYNVg4bTdSVEsyQjlEYW1EU291ZGtnM3QxbWcrbVVU?=
 =?utf-8?B?dzU2L2s2YkVlL0xUY0U2ZklrR2ZxM21mSENxNjhzOEEwYnI2ZmNaREJnNzZL?=
 =?utf-8?B?V1VVZXZxdVVsTlpRaGlISDhIWjFoeWdBMUI1R2I4a1p1THdGL0ZQR3VuWDFo?=
 =?utf-8?B?aVdHSUVWdVpFS1hFOVh4NWpqdHZhUWx0M0ZuY2tremF6NzYwdTBwMDB6cnd0?=
 =?utf-8?B?Mko1ZytLWGFXeGtrczJ2M2JtS1FacXlCWW11ajhwSXZTZWljaldPSUNDMTZy?=
 =?utf-8?B?L0xkaGNXYjVXQ1RMQnQ0aE1yeHhYL2IxK3h2M0xNc1Q3QksrZUttREgwajNp?=
 =?utf-8?B?OTl6QUN5a3pqVWNBdER5RUFNYURBTHU1WStITy9vZWNrbmhkZnBoSlhFWDNB?=
 =?utf-8?B?Q01xQWl6cVJ0dVVnTzZubE81TVpjN0ltcHFvL2pZVHoxM3FXNW1tcDJQZ3VG?=
 =?utf-8?B?ejdZcGFYbWVDa2JTYm5iS0QvZ3JYNDQvc21RMXRxMlNXczVpYTc3YjhLbEJO?=
 =?utf-8?B?ZkU2U1hSYUhaalJaN1VTSGdERkk2TXNzbkhsem5MNFBhWE5IRFZLUThMR1Iv?=
 =?utf-8?B?TkZ1bllOU2JCM3VEUHRxaEtBR2Z1akpmY3FtMWJPeFV4bXBMWW9RWlpkeVV0?=
 =?utf-8?B?OHg4a0pxRmk5UjF6RjVvdUozRlFtd1FZb29rbXlXdXhoeTdKOVJCM0I5YVZK?=
 =?utf-8?B?Rno3ZFlUZVZIeVpVRGF6Q2hNQ1NLd2VDSFVFZnJ0SVcrUWY3dytJR01EM1dG?=
 =?utf-8?B?bllDdUJWd2pJTVNsM2xkb0I4cFI2UWt2akNneEpjM1F6T002SGdwTTNOUUxK?=
 =?utf-8?B?NkxIak51cnBJN0dSc3BQOTJhVVFiRzhyZGRBbk5lemNhMEZBb2pMM0VuRVRu?=
 =?utf-8?B?OHFzRnVRdWlFTlNURmIrd0EzOGo0U3pkNEVZSkYrM3NBb0Y4OGlqTHF0ZDJW?=
 =?utf-8?B?WVBFeHJIYmczdlNxeFczbG1zWkdwRmRybTBDVmE0RVlJaC95RThFS1ZwYnB1?=
 =?utf-8?B?amJPbUwxdmpFYkxoNU0rTjNNZXJSUGhKRVNRdm5kWFhhK1JYNXhzNkRSTGpT?=
 =?utf-8?B?cEdwZEI2RzdqNFI3blg5U212dDVBb1RjNWxodTY1VzNpc3NqaGRkQnZvMVB6?=
 =?utf-8?B?ZlRMeWQ4ZUxwSFVtWFJnZ2wyRWp0enBPU2pOV3AxanR0NVVEVG9QSExta2Ew?=
 =?utf-8?B?UldZNXNQSDE5Ym1FRmFJU200d2oyMmJxcWt0elg3TW1WR1ErVXdDd1RuNng0?=
 =?utf-8?B?SlFlZVZaS2JSUDhYWDZjbDQwSFFMcGJwZGJHWTBPNDM4Z2IxZEFYeEtTSGxX?=
 =?utf-8?B?ckVva0dseVhCRzBDRU1veVFQSm5oSEtGM3ZxRjhSQ3QrMFNyR2NObm04RlU1?=
 =?utf-8?B?WlFrMjd4N0VlWm9mMnBSc2pPYWJVZDUrdlhxUi9JNldjLzIvMUQ0QXpSaHB2?=
 =?utf-8?B?cnpMcXFmNDZWaUUzY2V2UWhxbjMwKzdKL3kraWp5L0xWa0lvb29EdXJyYVRI?=
 =?utf-8?B?Q29pSG9PV1Z5dTdJYUpxTmdzN2J2OWlqRlplTW1Td0tMOTV5SkNDVFUyaXRS?=
 =?utf-8?B?SmF2K3lrV2hYYXVITzFQSWdtM2g3WS9nRUVjVlN3Zm9lNDlKOGVnMFE5VTk2?=
 =?utf-8?B?WGxqMUVpYkplTFgzU3laNDJmYTJWQmJGUXZCa0g4dkIzZGNrTW5TLzR6Nm5z?=
 =?utf-8?Q?Dp9MipKSlt1N+PIHSynDnWJBW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d19b9825-c1f1-4660-e4d1-08dcb8631184
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 11:04:41.4885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1o8l5Lzdq3Dp6GrNxcnP9llsfra3LxN2HMeLJaiUgQj4LspYfYlfZ6DRvaXCe1RuPd0ru60MuTSkRTsHN7HLmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 11:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203164

PiBGcm9tOiBNYXJ0YSBSeWJjenluc2thIDxyeWJjenluc2thQGdtYWlsLmNvbT4gDQo+IFNlbnQ6
IEZyaWRheSwgQXVndXN0IDksIDIwMjQgMTI6NDUNCj4gVG86IE1hcmtvLCBQZXRlciAoQURWIEQg
RVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgTWFydGEgUnliY3p5bnNrYSA8bWFydGEucnli
Y3p5bnNrYUBzeXNsaW5iaXQuY29tPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtSRkNdW1BB
VENIIDEvMl0gY3ZlLWNoZWNrOiBlbmNvZGUgYWZmZWN0ZWQgcHJvZHVjdC92ZW5kb3IgaW4gQ1ZF
X1NUQVRVUw0KPg0KPiA+IE9uIEZyaSwgQXVnIDksIDIwMjQgYXQgOTowN+KAr0FNIE1hcmtvLCBQ
ZXRlciA8bWFpbHRvOlBldGVyLk1hcmtvQHNpZW1lbnMuY29tPiB3cm90ZToNCj4gPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBtYWlsdG86b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiA+ID4gbWFpbHRvOmNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIE1hcnRhIFJ5YmN6eW5za2Eg
dmlhDQo+ID4gPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gU2VudDogRnJp
ZGF5LCBBdWd1c3QgOSwgMjAyNCA4OjI0DQo+ID4gPiBUbzogbWFpbHRvOm9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+IENjOiBNYXJ0YSBSeWJjenluc2thIDxt
YWlsdG86bWFydGEucnliY3p5bnNrYUBzeXNsaW5iaXQuY29tPg0KPiA+ID4gU3ViamVjdDogW09F
LWNvcmVdIFtSRkNdW1BBVENIIDEvMl0gY3ZlLWNoZWNrOiBlbmNvZGUgYWZmZWN0ZWQNCj4gPiA+
IHByb2R1Y3QvdmVuZG9yIGluIENWRV9TVEFUVVMNCj4gPiA+IDxzbmlwPg0KPiA+ID4gLcKgIMKg
IHN0YXR1c19zcGxpdCA9IHN0YXR1cy5zcGxpdCgnOicsIDEpDQo+ID4gPiAtwqAgwqAgZGV0YWls
ID0gc3RhdHVzX3NwbGl0WzBdDQo+ID4gPiAtwqAgwqAgZGVzY3JpcHRpb24gPSBzdGF0dXNfc3Bs
aXRbMV0uc3RyaXAoKSBpZiAobGVuKHN0YXR1c19zcGxpdCkgPiAxKSBlbHNlICIiDQo+ID4gPiAr
wqAgwqAgc3RhdHVzX3NwbGl0ID0gc3RhdHVzLnNwbGl0KCc6JywgMykNCj4gPg0KPiA+IFRoaXMg
ZWZmZWN0aXZlbHkgZm9yYmlkcyB1c2FnZSBvZiAiOiIgaW4gQ1ZFX1NUQVRVUy4NCj4gPiBTaW5j
ZSAiZ3JlcCAtUkkgJ0NWRV9TVEFUVVMuKjouKjonIiBhbHJlYWR5IHlpZWFsZHMgOCByZXN1bHRz
IGZvciBvZS1jb3JlICsgbWV0YS1vZSwgdGhpcyBpcyBub3QgYSBnb29kIGlkZWEuDQo+ID4gSSdk
IHByb3Bvc2UgdG8ga2VlcCB0aGUgb3JpZ2luYWwgc3BsaXQgYW5kIGNoZWNrIHRoZSBmaXJzdCB3
b3JkIG9mIHRoZSBzZWNvbmQgcGFydDsgc29tZXRoaW5nIGxpa2U6DQo+ID4NCj4gPiBpZiBzdGF0
dXNfc3BsaXRbMV0uc3RyaXAoKS5zdGFydHN3aXRoKCdjcGU6Jyk6DQo+ID7CoCDCoCBleHRyYWN0
ZWRfY3BlLCBzdGF0dXNfc3BsaXRbMV0gPSBzdGF0dXNfc3BsaXRbMV0uc3RyaXAoKS5zcGxpdCgn
ICcsIDEpDQo+ID7CoCDCoCAjIGZvdXJ0aCBwYXJ0IGlzIGltcG9ydGFudCBoZXJlIHRvIG5vdCBr
ZWVwIHBvc3NpYmxlIHRyYWlsaW5nICI6IiBpbiBwcm9kdWN0DQo+ID7CoCDCoCBleHRyYWN0ZWRf
Y3BlX3NwbGl0ID0gZXh0cmFjdGVkX2NwZS5zcGxpdCgnOicsIDQpDQo+ID7CoCDCoCBzdGF0dXNf
b3V0Wyd2ZW5kb3InXSA9ICIqIiBpZiBsZW4oZXh0cmFjdGVkX2NwZV9zcGxpdCkgPT0gMiBvciBs
ZW4oZXh0cmFjdGVkX2NwZV9zcGxpdFsyXSA9PSAwKSBlbHNlIGV4dHJhY3RlZF9jcGVfc3BsaXRb
MV0NCj4gPsKgIMKgIHN0YXR1c19vdXRbJ3Byb2R1Y3QnXSA9IGV4dHJhY3RlZF9jcGVfc3BsaXRb
Ml0gaWYgbGVuKGV4dHJhY3RlZF9jcGVfc3BsaXQpID49IDMgYW5kIGxlbihleHRyYWN0ZWRfY3Bl
X3NwbGl0WzJdID4gMCkgZWxzZSBleHRyYWN0ZWRfY3BlX3NwbGl0WzFdDQo+ID4gZWxzZToNCj4g
PsKgIMKgIHN0YXR1c19vdXRbJ3ZlbmRvciddID0gIioiDQo+ID7CoCDCoCBzdGF0dXNfb3V0Wydw
cm9kdWN0J10gPSAiKiINCj4NCj4gQSB2YWxpZCBwb2ludCBpbmRlZWQuIFRoZSAiY3BlOiIgcHJl
Zml4IGlzIGEgZ29vZCBpZGVhLiBIb3dldmVyLCBJIHRoaW5rIHRoYXQgc3BsaXR0aW5nIG9uICcg
JyBpc24ndCBhIHZlcnkgZ29vZCBpZGVhIGVpdGhlci4NCj4gV2hhdCBhYm91dCBhc3N1bWluZyB0
aGF0OiBpZiB5b3UgZ2l2ZSB0aGUgImNwZToiIHBhcnQsIHRoZW4geW91IGFsd2F5cyBnaXZlIGJv
dGggdmVuZG9yIGFuZCBwcm9kdWN0LiBXaGF0IHdpbGwgYmUgdmFsYWJsZQ0KPiBpZ25vcmVkOmNw
ZToqOio6c29tZSBkZXNjcmlwdGlvbg0KPiBpZ25vcmVkOmNwZToqOio6c29tZSBkZXNjcmlwdGlv
bjo6DQo+IGlnbm9yZWQ6Y3BlOnZlbmRvcjpwcm9kdWN0OnNvbWUgZGVzY3JpcHRpb246Og0KPg0K
PiBidXQgbm90DQo+IGlnbm9yZWQ6Y3BlOnByb2R1Y3Q6c29tZSBkZXNjcmlwdGlvbjo6DQo+DQo+
IEtpbmQgcmVnYXJkcywNCj4gTWFydGEgDQoNClN1cmUsIHdoeSBub3QsIGl0J3MgeW91ciBwYXRj
aC4NCkkganVzdCB3YW50ZWQgdG8gcG9pbnQgb3V0IGEgcHJvYmxlbS4NCg0KS2luZCBSZWdhcmRz
LA0KICBQZXRlcg0K

