Return-Path: <benjamin.grossschartner@urbanandmainlines.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E63CCD181
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 07:17:26 +0000 (UTC)
Received: from PAUP264CU001.outbound.protection.outlook.com (PAUP264CU001.outbound.protection.outlook.com [40.107.160.61])
 by mx.groups.io with SMTP id smtpd.web10.9778.1726643844394142970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 00:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@urbanandmainlines.com header.s=selector1 header.b=Se7MiLxJ;
 spf=pass (domain: urbanandmainlines.com, ip: 40.107.160.61, mailfrom: benjamin.grossschartner@urbanandmainlines.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhEdrJKKnMlOSoRjePakssEHQWb76drh7gBsdppWCPcIoiKC9ISV78+fFSiE2QyWUR5k5aLt9QkKfM898xPn0EXW7emi/DlJQ0ymzoSpdMV08xGovRJ2MWYeBB/l8MxCu/dH9rdfPnbt1JjM1WvqNFZFWUxTMA4fDAYVm2sne1z1Yij9DnSf7cdujYBQP5pBxZdMJgpkjELUoWDbB170V8pQ/nccmSWNQ0dhgmP3zMRs9IjDXLMlzNDP21g4rh5H3+cI477GofKjP3HQ5H2msz/mVQoWUPtr5i4lz5xpZIuuYDkmpn2Mr79spdTIqXraUbLUMqT+avg3d4vodXJsxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59I6nag1mlS9f20ttHqIRIOdLOFmf3SYoSjhgfjZzdQ=;
 b=g2Z3AGo9yVroxEuOrHcg6fqV8xNRH3TPNO9VldBC0zpFYmPIDaG+yrkmBqGuxh9ZylL3yj4NDGLzr8B0Tql9OtNN8UkHWMY3A0DQJZ/Qb4wEfv/KYgyJnHHAB43wG/tyBcDRphSKIuVVLdy4wS9TJHtdCHUjl2OtzxV3eQpGcRz7x8L56kNKBhxJr8qio5KvO+gTL8d2M8fNCf1pDkguEpilDbRqTl9KxM743gekI0s/4LxQUHQLroHhqsmpY6yWowTptQX6NTiGh8ZIjokpS8LPnvZeZy5eZFIYS6qiWOP5yVxQMPCHsFVF/ohiiw2xpZd5A985vdE48q90WzCb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=urbanandmainlines.com; dmarc=pass action=none
 header.from=urbanandmainlines.com; dkim=pass header.d=urbanandmainlines.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=urbanandmainlines.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59I6nag1mlS9f20ttHqIRIOdLOFmf3SYoSjhgfjZzdQ=;
 b=Se7MiLxJLyL5x7j7/XH65oGTVNHq5mWX7f0meBrK3C6QtttYec0x0sOGw46JVHPBOe/QP5bSWooDCC4V/wadOsVKouKy84U+WW8pHaH4PZfsWM3mMw1w++oQVN3ptSOSXNjiIbkMyE2PKNaNFTk3EjyjkC6exnwqyCNe9+siOuX9Chg3n10WcH/PYYvHyFyqQUZ7kHvpCn/GGiw2F/p9NwvAwRCdJWPddfO1ZrXmsBg910GI0aDcZLUQ2F0b2tz3Jjaa1F5ZniQK0P7nDmji8Bhn5CoxGtyke0QMCNfNd2QTqs0pDIO3s7s/PpJ/U4AZw+kvjHk/J6IHu5r2eheIFA==
Received: from PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:164::7)
 by PR1P264MB2205.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 07:17:20 +0000
Received: from PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c294:6708:a08c:f02a]) by PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c294:6708:a08c:f02a%7]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 07:17:20 +0000
From: GROSSSCHARTNER Benjamin <benjamin.grossschartner@urbanandmainlines.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] security-flags: Re-enable pie for power pc
Thread-Topic: [OE-core] [PATCH] security-flags: Re-enable pie for power pc
Thread-Index: AdsJjdLACekEwn2sSIqyHgBwhE4NGwABpIiAAADsQmA=
Date: Wed, 18 Sep 2024 07:17:20 +0000
Message-ID: 
 <PR0P264MB35955734C67DAEADB05F2F95F8622@PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM>
References: 
 <PR0P264MB3595982976989FEC3ED89B43F8622@PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM>
 <CAMKF1sro50RL831B_q2Uzv97i7iTnvp3EehJDoPWU8gGS3j_qA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sro50RL831B_q2Uzv97i7iTnvp3EehJDoPWU8gGS3j_qA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_Enabled=true;
 MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_SetDate=2024-09-18T07:17:18Z;
 MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_Method=Privileged;
 MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_Name=NEST-CORE-01;
 MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_SiteId=f33c7791-13ed-4c20-878e-518e247895dc;
 MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_ActionId=12c58b4d-dcf9-4212-8fc5-3abffaf40828;
 MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_ContentBits=3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=urbanandmainlines.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR0P264MB3595:EE_|PR1P264MB2205:EE_
x-ms-office365-filtering-correlation-id: b61bf97d-80ac-46d9-163e-08dcd7b1ef3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?U1hwNzJjeThGRXQ1cUVacHZCYk9iRTM3bnVaWVB5U2d6NTE0ME9XNkJ3M0JD?=
 =?utf-8?B?MXk2azR1Z3NKUmQyZG9tVW9tMFppaUtuSVEzSWpjWllnNStiR1NkeDZZUytV?=
 =?utf-8?B?bDZoS1hjM3o2R1U5bEx6TnByRFM2YSt5RGFDQVpnTXdkNmpnUjhtVFZicC84?=
 =?utf-8?B?MVZVOXBmaEoyaGtIckw2TUhMWlMzeldYL1VkVUN6bFpQeUJjS0pqUUVkb0Y3?=
 =?utf-8?B?US81ZXhiSVc2M2IwdkxKOXdhZUhBT1psQjNsMDJnTi9uYllMNTdNWkNLWG95?=
 =?utf-8?B?bFhVN3BLTnEwKzc2dVFSbWtiZ2hSQ1FWdFF2aWljS1BSalYvN1hOL2d5NE1p?=
 =?utf-8?B?R0RUaDZpbGtTUkxQWmF6cmgrK29xVncxVFlPZ0JhWEQwZHZXMUpWSmc2aTBS?=
 =?utf-8?B?SlZVbUtGTnpQT2F6ZWNiSG15cUhSWUxoMFhscUx4MWhrVXJUODdFMTh1S2Z2?=
 =?utf-8?B?K2phVWppMmJKLzVsRmR1UHYrN0dxb0xvOW5UYXJpYURwWEFEZGZtbkplNHpE?=
 =?utf-8?B?RlFvMHdSWGYyOXNXTHVxckZDSU01SmRqaWhzeUtVSXdKZEJ4Nm05TDlwdmlt?=
 =?utf-8?B?alpoN1E5RTBOUjZvRzhDc3FxTWlCMXpwUWJjaTBnNXBvTjFlTmswejdPdHdO?=
 =?utf-8?B?dWdXOFI2WW42c3VYanlGZkxYdmdMRERTLy82aytUaVBCZWFQNHVDVWUvQW1I?=
 =?utf-8?B?K1pJYlV5N0xwNDZxL2kyWXFOMk5hbVJEWHdHRnpscG13aWRhQVlhL0pTelJT?=
 =?utf-8?B?WmlPeGt0elFyanUwUjVuNFNEUkFJeFdPaDVtU0lqb2MrN1RjZkFUNXVkL2ZJ?=
 =?utf-8?B?UndGQkRySzY1Tjhwekh6d1VrTEJubWcvNWc2eVNFUlBtNGRXTGhsbzZpemx0?=
 =?utf-8?B?aklNYmN1bTFyRkFFNkx0K0ZxZ0JCZjByZmdRSXJ1MTdFeWdmNlluRE5Yb3Nv?=
 =?utf-8?B?TjdOb3ZVV0JtRnpGZ053NEJmTUMvVGFPbTJZQVBRNE1RZS92djBJSjRuYk9C?=
 =?utf-8?B?eTVlVnAyeFRRTmtGa1Y2dG5IY1l0amRqVDBYSXUvdm5kcFVUcHRLUnNuNEUw?=
 =?utf-8?B?NWhzZXJJQ1dlTUJBcDRGT2JVSDVTSHFwcFBnWHducTg0ME1uZXZhVThCd3ow?=
 =?utf-8?B?eWRSQTZSVmVoa1NUVVdiTHpyRGdJZE9mbG5PSm5EbHRLSi9QL3puS0x6WFVo?=
 =?utf-8?B?Y2VONThrcGVSWkFYYVE5T1pvUDd4UzYxaWtyeDd4YjhNdk9jTXZGVUNnaFUy?=
 =?utf-8?B?dlZsTnZENGF5QVNzb0RkS0MzU3lubXR1NHZmWGlPa041eUNtRGJpdVF6Nmxk?=
 =?utf-8?B?ZmxKZW01OC9qV3BPRmZ1OEFIZjBpMFd6UndtN3RoKzRneTh4UGNPeVMxYWxk?=
 =?utf-8?B?MUpBc3QwYmpVWjRrNlFhb1JvTTVvN0RDZUR0YnVHZU9VNy9VcUdsT1VyL1F4?=
 =?utf-8?B?VHFBS2E2ajZObCtuOEN0SEE3V2VFbWJIMVFiTTBIQ3daN3NnN05OdW1saVhK?=
 =?utf-8?B?N1BZRXZTcGQ4UTBPNnY4T3JkRHg0QnZNVk1GTWd2SVYwMnA0STlTcmFVbEFF?=
 =?utf-8?B?M1NCY1FLQ1NOTTFsTi9jME5iSUVtSzdTZzZMR1VmZE9qVk4rbDR6RmV3emlG?=
 =?utf-8?B?L0VoRnRJdkpYZ2tBYkQ0WWx3VlpabG9nNnhReDhTbUpYeGVGdm9Ob0V2ZVc4?=
 =?utf-8?B?Vk1HbENGZWJPYWpFaGZ4aTdnWlV2amhDdk1EWGFIbThWUDg2Zko1N01NTFV6?=
 =?utf-8?B?S1ZWbmp2ak8yUE8vdkRlZ0hoN2hoLzk0eWtPNlVYaWRSQWxUd05RZ0xyajc2?=
 =?utf-8?B?YzIzYWFUTU9iTk9WUk1yZz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SlE1Q0JVYUJ4L3JZSUQwRTYxQ3c4Slo4c21EYWw4TklmTHZkb3Bsdy9Sa3Ey?=
 =?utf-8?B?MDFZMUpPNko1WER0Z3lqRC91ajlhTWtyaHNzRmZsZkttZlRNSy8zR3pMTHho?=
 =?utf-8?B?azd2MElidkRGSGF0YlVqeTlIK3BkWFNoclc0N2N0MnZ5RTkxY0JWZGtlT0JK?=
 =?utf-8?B?UFFlNTdYS0d0RStqZDhhSi9GTitVbHVqUjhKWnZ2M0pBTXJsMmYrNUtYcDho?=
 =?utf-8?B?aG1Jc1RJdmUwaXhKUUtCeGhHM051L0R6bmhaUHRjWTIrNzh4OHhjMVJjc3c3?=
 =?utf-8?B?MGNSNHF1MnNnYWl6OUpVMitrVTBMNEtVMXduYyttU0tkZ1ZsRGk0ckhWQ2Vk?=
 =?utf-8?B?NU5qRjk1ZURXck1Qd3dQSTQ4ZlFIcXQ3eTA5cnAydmNaTE9WclEvVGVOcGdV?=
 =?utf-8?B?WEsrS0xvTzFkYzFnMUZiVXBqM3VaaHZyeVhTZkkzVkFRTVVoS1J3RHk4VXMz?=
 =?utf-8?B?V1o1U1hxckRJSFlZRERPdGVNTmc2S3IvRjZjTmMzUGdObThLL1ZhRHRXTzJT?=
 =?utf-8?B?YXBHMW9FQ2ZqdFlBNmdDemxKVUFHZFBzL3pCUk9XWUtGaG52RE9SM0VGUlg3?=
 =?utf-8?B?MlhIejV0VVhjRGs1NkhNUll5S2YyUk50bWVYbWM3SStMUTdQaU5pb1o2Z1pm?=
 =?utf-8?B?Q3pGZHB0dFRDQkVtYVlPK2NkdStJZnhsZ1g0M1NqbTJ3MTBoQ3RVNlhTRHV5?=
 =?utf-8?B?TXZTY1BNdCt0dCs1VldYTzdCNmlacHBEYTdhMVdrUVp6S3ZiWWRTRFJCYnYw?=
 =?utf-8?B?ZTZlNDFGVWtOeHYzMlV6dzVTS1luTmIyVzB0MGNZUTVmU2p4L0hpbCtKU0ZI?=
 =?utf-8?B?ZkRyUGdZRUZMeUt3ZVVIRTJsazdRd1ZsTi9IMWRjdU5hL0JLcFNrQVVEbHlW?=
 =?utf-8?B?OWNxa08xUlVJQXA1dmlvWUJDV0srNTVlQ05QbXFhRFA5VDIxUzlhWXd5aWUv?=
 =?utf-8?B?MU0xM1pPdW1hR1Z5Ump5TU55Q3YxMmNuSjFTTWtWMjN2QzVRSVNOZXM5bjNo?=
 =?utf-8?B?S3k1dmFoL1JIUUxweGk1T2g1bWxlakVZcGw1OWNDWEkrbUFGQThrOUFscmtz?=
 =?utf-8?B?T1ZtNExTcHkxWklvL0J2N3EzSE5BZnJMaTlIak5wQWF1V0M2Y01sSmZCZUhu?=
 =?utf-8?B?ckJWMFE4eDA3ZFNoT0wwM2xLTkwyT29vZ2N3U1pHd3hXY0lRSHhNTXYvbmdh?=
 =?utf-8?B?RUFYUDR4QXF4RGhKbmo4a20yc29BRTljUEUxY01SUk5zVzZSM09MMEhmV2dT?=
 =?utf-8?B?TXd4TGIrT1N0RzNwdUp2TE5VWGkwNlA2S0xaMUpNRDF3L2FtWkxDdEMwVzBt?=
 =?utf-8?B?dzB1NkYvZXB0Z2VPbWxhSHR5STk1MkMzc1NEWUtoYnlWQWIzS0lUWmJaa3p3?=
 =?utf-8?B?SE54Qmh2SktLOUlvRjNRSHpsNEFlT0djaW5Gd3ZqQW9CN3JEenFtOUhXUUlS?=
 =?utf-8?B?ODNkVGtRTDZuM0JlNGFQaUFKTjg0RTE0d3kybExLdytzU0tqSjFFZk5Fcmhr?=
 =?utf-8?B?Rlk4dThXZ2d1WDExRVVqZzRwYU1UK2xXRG9pdnljYkxJU21ZbnBYWnJCQy83?=
 =?utf-8?B?aVVnRFEwUTJPQWFrV3haWXNSWk1OSkY3T3FiQXgyZG16eWFtTENlWi9jeGMv?=
 =?utf-8?B?U3ByZU0xME9PTVN4Y3VmcWRZQUZUUTdZaEI2d0VBOVpsZU4yVUxEK3htbWlK?=
 =?utf-8?B?NE03YTlDaHg5VmxCNk5vVmN0cmFicEZQeWI2SWh5NE4rUi8xQTY1bmpya3Bs?=
 =?utf-8?B?MlR1KzlsbDV2UzFRZ1NCZWRrYkFOc1A1YWY0VG1hY2g0eUZLZFl6aHdXSDRJ?=
 =?utf-8?B?M2tBWDZSdUxlV1k1K0x6MTk5REwrYkRZRWp3QlFxTGJoRUs1c2xGS2VOeGR4?=
 =?utf-8?B?ZFcybGlzNGt6MGxGeXFXZnZ5TUh4YmoxM0RQeXNycGZNUlVIck1vUEZ1SG55?=
 =?utf-8?B?RS8vQ2UvUitucCtHcjJ5RXFEa2JCZkVoUUVYN3JaUWV1ZHdsSG16cWNuaHU4?=
 =?utf-8?B?SzZ2dHRTSlJZYUpXbSs0T0RINVFabStKbGFOOGpkMHg2NzJodEpTSndTeHVY?=
 =?utf-8?B?SVphY0RkMEFQd3RjMTlZL2k0aWhoODBvSzNxQkRKZnhyR1ZHbGwwWFJBSWJC?=
 =?utf-8?B?U1Z2Y0pHM0VWZytIUG5sTTB6cTY2SklFbzE4SENLV0ZVd1dqeGxwdDVuc29W?=
 =?utf-8?Q?4xZbyGvMfmkXMGJxO6YRL8xoVp+ROfv8p0/H379uQ5fh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: urbanandmainlines.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b61bf97d-80ac-46d9-163e-08dcd7b1ef3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 07:17:20.2047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f33c7791-13ed-4c20-878e-518e247895dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5B4b0vlKIcfe2CBWGyFquo31Gzg2PWpEbNd6geizDN+7L7ZIrHarWXa9xXOQmQU1MwH25F/7greLBxMR4HPersbPsBol2kLajY4Z6ZawjVUXp+GkxhIk8pOF9BpRsoz0K3VgPnGtTFR/g+qaJqyvBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 07:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204635

Q2xhc3NpZmllZCBhczoge0hpdGFjaGkgUmFpbCDigJMgUHVibGljfQ0KDQpUZXN0ZWQgYnkgYnVp
bGRpbmcgImNvcmUtaW1hZ2UtZnVsbC1jbWRsaW5lIiBmb3IgcWVtdXBwYyBhbmQgd2UgYXJlIHVz
aW5nIGEgdG9vbGNoYWluIHdpdGggcGllIGVuYWJsZWQgZm9yIGJ1aWxkaW5nIG91ciBvd24gY3Vz
dG9tIGltYWdlcyBmb3IgcG93ZXJwYy4NCg0KQmVzdCByZWdhcmRzDQpCZW5qYW1pbg0KDQoNCntI
aXRhY2hpIFJhaWwg4oCTIFB1YmxpY30NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IA0KU2VudDogTWl0dHdvY2gsIDE4LiBT
ZXB0ZW1iZXIgMjAyNCAwODozMQ0KVG86IEdST1NTU0NIQVJUTkVSIEJlbmphbWluIDxiZW5qYW1p
bi5ncm9zc3NjaGFydG5lckB1cmJhbmFuZG1haW5saW5lcy5jb20+DQpDYzogb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFU
Q0hdIHNlY3VyaXR5LWZsYWdzOiBSZS1lbmFibGUgcGllIGZvciBwb3dlciBwYw0KDQpbWW91IGRv
bid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHJhai5raGVtQGdtYWlsLmNvbS4gTGVhcm4gd2h5IHRo
aXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlm
aWNhdGlvbiBdDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBPdmVyYWxsIGl0IHNlZW1zIG9rLCB3
b3VsZCBiZSBncmVhdCBpZiB5b3UgbWVudGlvbmVkIGhvdyB5b3UgdGVzdGVkIGl0DQoNCk9uIFR1
ZSwgU2VwIDE3LCAyMDI0IGF0IDEwOjQ14oCvUE0gR1JPU1NTQ0hBUlRORVIgQmVuamFtaW4gdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGJlbmphbWluLmdyb3Nzc2NoYXJ0bmVyPXVyYmFuYW5k
bWFpbmxpbmVzLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0Kd3JvdGU6DQo+DQo+IENsYXNz
aWZpZWQgYXM6IHtIaXRhY2hpIFJhaWwgLSBQdWJsaWN9DQo+DQo+IEZyb20gZjA0MDE3YmY4YmMw
YTQzMjVkZTllNTEyNTFjZDRkNmRjZGMxZWNmMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4g
RnJvbTogQmVuamFtaW4gR3Jvc3NzY2hhcnRuZXIgDQo+IDxiZW5qYW1pbi5ncm9zc3NjaGFydG5l
ckB1cmJhbmFuZG1haW5saW5lcy5jb20+DQo+IERhdGU6IFdlZCwgMTggU2VwIDIwMjQgMDc6MTE6
MTYgKzAyMDANCj4gU3ViamVjdDogW1BBVENIXSBzZWN1cml0eS1mbGFnczogUmUtZW5hYmxlIHBp
ZSBmb3IgcG93ZXIgcGMNCj4NCj4gcGllIG5vdyB3b3JrcyB3aXRoIGdjYyBvbiBwb3dlcnBjLCBz
ZWU6DQo+IGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTgxMTcw
DQo+DQo+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdyb3Nzc2NoYXJ0bmVyIA0KPiA8YmVuamFt
aW4uZ3Jvc3NzY2hhcnRuZXJAdXJiYW5hbmRtYWlubGluZXMuY29tPg0KPiAtLS0NCj4gIG1ldGEv
Y29uZi9kaXN0cm8vaW5jbHVkZS9zZWN1cml0eV9mbGFncy5pbmMgfCA2IC0tLS0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhL2NvbmYv
ZGlzdHJvL2luY2x1ZGUvc2VjdXJpdHlfZmxhZ3MuaW5jIA0KPiBiL21ldGEvY29uZi9kaXN0cm8v
aW5jbHVkZS9zZWN1cml0eV9mbGFncy5pbmMNCj4gaW5kZXggZDk3YTZlZGIwZi4uZjcxM2E5OTQ2
NSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3NlY3VyaXR5X2ZsYWdz
LmluYw0KPiArKysgYi9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvc2VjdXJpdHlfZmxhZ3MuaW5j
DQo+IEBAIC0zMSwxMiArMzEsNiBAQCBTRUNVUklUWV9OT19QSUVfQ0ZMQUdTID89IA0KPiAiJHtT
RUNVUklUWV9TVEFDS19QUk9URUNUT1J9ICR7bGNsX21heWJlX2ZvcnRpZnl9ICR7U0UgIFNFQ1VS
SVRZX0xERkxBR1MgPz0gIi1XbCwteixyZWxybywteixub3ciDQo+ICBTRUNVUklUWV9YX0xERkxB
R1MgPz0gIi1XbCwteixyZWxybyINCj4NCj4gLSMgcG93ZXJwYyBkb2VzIG5vdCBnZXQgb24gd2l0
aCBwaWUgZm9yIHJlYXNvbnMgbm90IGxvb2tlZCBpbnRvIGFzIHlldCANCj4gLUdDQ1BJRTpwb3dl
cnBjID0gIiINCj4gLUdMSUJDUElFOnBvd2VycGMgPSAiIg0KPiAtU0VDVVJJVFlfQ0ZMQUdTOnJl
bW92ZTpwb3dlcnBjID0gIiR7U0VDVVJJVFlfUElFX0NGTEFHU30iDQo+IC1TRUNVUklUWV9DRkxB
R1M6cG4tbGliZ2NjOnBvd2VycGMgPSAiIg0KPiAtDQo+ICBTRUNVUklUWV9DRkxBR1M6cG4tZ2xp
YmMgPSAiIg0KPiAgU0VDVVJJVFlfQ0ZMQUdTOnBuLWdsaWJjLXRlc3RzdWl0ZSA9ICIiDQo+ICBT
RUNVUklUWV9DRkxBR1M6cG4tZ2NjLXJ1bnRpbWUgPSAiIg0KPiAtLQ0KPiAyLjM0LjENCj4NCj4N
Cj4ge0hpdGFjaGkgUmFpbCAtIFB1YmxpY30NCj4NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0N
Cj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+
IFZpZXcvUmVwbHkgT25saW5lICgjMjA0NjMyKTogDQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjA0NjMyDQo+IE11dGUgVGhpcyBU
b3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwODUxNTc1My8xOTk3OTE0
DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtY29yZS91bnN1YiANCj4gW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0NCj4NCg==

