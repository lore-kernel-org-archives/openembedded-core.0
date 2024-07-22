Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85408C3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 21:15:17 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.64])
 by mx.groups.io with SMTP id smtpd.web10.29589.1721682910739010597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 14:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=B8cWlTDS;
 spf=pass (domain: siemens.com, ip: 40.107.20.64, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9wklunC49/ka+KhNfjONgUQEzfXT+o7cuRAzIiB+ci/hO0Q+t/F9pB4aykHMK9g3Uc6bJrORszdpZgIv8p1dVGUI+uSV2ueYAItoi0G37sXThQ9tr2Etiv652pH6QOT79+TNoODPjtJV2QXZfyEa1dU5tYAxvglhB5QKwPBFJnnmcxtSNXBqbgIFOgDi77XvCbca+hXLTQBZ4bWx9NsU5xoAtKCck+SOhcSeo8UhWF8AUuKoqqjWZtzg9ZHfNB+UlJE/VJH9q8FNdeuT35O6OickkpPJM71TJSqopMRL+VvnkS6HWU+Y4vdF0h5Rs0AmS2BaxzEgEFEnuUFlwbAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djqvjw8J+MXqFChjnT7svfuAo+EOd/fpd3zfkNxjBcc=;
 b=GZ6snni/Xv3i4WdWJoCTNLL4xiG7DNOJzlYofFa7E7H4kaxEFQIg03P375QuXYc+V6VkWtvX2dm0C07EgvdS7xrqtHFiwCOODFKS6vUNOeDbU9dvnnmyuwfW98xZAh/sEp7mGJtabQqrkTMx9ez3eBjT0pCddA4mIyQx1zeUUr9TrjLaNzAMie5gnHnhRjOr1Fu0PQv67eRQSij0HBMMmEDlTL0WlZl8KOe08agFOpy+SGV1kAgrizK3rfmFCkOBwHTf58vhXSszGbfMiMD/QuCy3W+sd6afp9VhDXOlwdUHVxjbjsGZn5FilOhvqs3xWbejVfqpfwy6VnhytDLPUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djqvjw8J+MXqFChjnT7svfuAo+EOd/fpd3zfkNxjBcc=;
 b=B8cWlTDSOzBegonQ0khkA+oteZCGp2GN+B9DdO2Yx0yWXpMeU+1IsmKOGZ98RHNt0mh0gTIhV1l6PlbTOUxfwh9KOHuH3aE/Xk904aanOXlp27dlGuXUQWnefuJKRWp/GbrP3iOHMY1ArSX6VPPWVPNVAgh0d1rMroLJbUrT2pvBmtTo+inzRgYhP37Oi+vFXmwFHDKmLre1BdisiZt6WYmerR2LzVoryB5JVQCoWZThdhyvyOO6Up22qtURBfQVaF4UR2w+jTtihfcxv0geOcqztndFpHSas5vuouE4TKXTw4eBhce3JIEEWzydlKatTwC9Vnf2b8ehQEeVj72Yfg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6433.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:56c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 22 Jul
 2024 21:15:07 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 21:15:07 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Marta Rybczynska
	<marta.rybczynska@syslinbit.com>, Samantha Jalabert
	<samantha.jalabert@syslinbit.com>
Subject: RE: [OE-core] [PATCH 1/3] cve-check: enrich annotation of CVEs
Thread-Topic: [OE-core] [PATCH 1/3] cve-check: enrich annotation of CVEs
Thread-Index: AQHa1qCiQth0lize10eRaXjJoYxxjLH6fa+ggAF1joCAB1JUIA==
Date: Mon, 22 Jul 2024 21:15:07 +0000
Message-ID: 
 <AS1PR10MB56970A238E5052AF17FFE54DFDA82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240715102003.10122-1-marta.rybczynska@syslinbit.com>
 <AS1PR10MB56970CABA311ECF1A76C7566FDA32@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAApg2=TFYV3aVGNeK=PiWVPRTw86RA3NxNLOaB_z5LTU9-4G3g@mail.gmail.com>
In-Reply-To: 
 <CAApg2=TFYV3aVGNeK=PiWVPRTw86RA3NxNLOaB_z5LTU9-4G3g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=bedacd9b-c396-43ae-906f-9fcf826a2ddd;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-07-22T20:54:57Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6433:EE_
x-ms-office365-filtering-correlation-id: c0c51b71-c0f0-4e9c-f743-08dcaa935cea
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YnBRT081eWlROXh3RHZ6dGdqYmwvRnpzUjZPaFd1aSsvUFU4cVFOMHEwN2RC?=
 =?utf-8?B?WnNOVkw5WmJHUUVFUEMwTkJsazM3ZHdXTVN5SDFOSlY2b0d5aXVNRU4vRFVt?=
 =?utf-8?B?L2txRTVNSzg1UnNzRk1tYUhRc3NDUmRGc0dZTVNWY0tSWGNtNlpDbGU3Y1ZV?=
 =?utf-8?B?NWlaRzMrY3NSOEdZY3hYdTZwTjAxazlYcmY4RHE3QlE3TngzSk11em1UL2xN?=
 =?utf-8?B?dE5rdDZqRVFqc2lidjl4SkNCS0I3NGJYNmY2bUg5MVZXRVZ1SGJvRnVpaDdJ?=
 =?utf-8?B?N3RsMm5HTUVzaUY5Z09iVjg3dUQ4Z3BUVjhIYko2MHVTdUFpWkhUaWNqYlpU?=
 =?utf-8?B?cEZEdTN0SE1VQkFZYmFBZjJGTFdhWmU1aHdXK1JMRUJ5NXV6U1U4ODROTFVs?=
 =?utf-8?B?dExUVWJMWFlBTWRjckNxdjlZcWl3aVgydE5xVEVnOGxCbHhsQUc4bFZvcXJr?=
 =?utf-8?B?YXpNU3Urd1JUcjBmNkZadXZsZDlHNHlHK0Z5RE5MclJHa0hzcXhiNGpxZ1hV?=
 =?utf-8?B?YkozNWQxWm9VdFcyZVVRZDcyeUVyMG1KZDl1L0l3bzNqdHpkVGJJVkpJRkdh?=
 =?utf-8?B?WURkakJtRUlHTnA2QnUyVzZ6OVJzaUhtUXgxdkEvbnJ6MFZlY3FBWW9ibnVM?=
 =?utf-8?B?NmU5MWlobURiR05FSnlGaEc3TDB3eFZmYVlnaXZ4UHhrMHJ2SitGVkl1eXRk?=
 =?utf-8?B?UXZjbGh5NUNMaU1GT2dYVENEQ29nQmxncy9NVUtNK3NVdnY0SSs0MFBocDJu?=
 =?utf-8?B?Z1VMcFdpeUIzY3Q4bzRLWWVNN09nWXBtcy8zS1Z5Tzl6WUQxejMzMXVPeGVY?=
 =?utf-8?B?ZTN0SWg4UjhsdFpxa2lZL2VWODlwYW8vTWJPNlpIRjN4WjNLS2gyNGVMRW80?=
 =?utf-8?B?cHBKR0R5aFZYSDlyejVGSjhyRktvYzEySkdhM01HMHBhbmY1bkFHMmRuekY3?=
 =?utf-8?B?Znp1Ym5PdjZZd2pGdGU1OGpXcnJabEV5NER2Yi9IS2MrY3BvbWpGMFpIZVFU?=
 =?utf-8?B?clhaT1F4WjFMd2loYXpJK2pKVitOZjQxdFpyZTVJenFoamE2L1BjQVdaaGpI?=
 =?utf-8?B?ZDNnUGZUUmJ3VFR3bnBaSDYxYWIyb1dwQlFDYU5DNWNweUk3aHZIemdrWHhF?=
 =?utf-8?B?NHhtT0FUKzlYZmFUMm82ZTJhWU5GTmRnNTBCbmZGVGxxdlZ6TXhlblNSTUVm?=
 =?utf-8?B?SFJka1FXVURMdTA1azErbmxDWjVJSDFBMi91TjNGb29FYVRIOUdMbGF2SzBV?=
 =?utf-8?B?Tlcrb0dvKzZjMGU2QXBWTVplQmRld0wyYUl5TStuZGp5WW9jQzJVN0hiVkhI?=
 =?utf-8?B?c2dwUm1ZZVBXVFdOS1p6ZjYrMXhFSFNPcFE3ck5GeVRYVDd4QzhJWnJOTWhV?=
 =?utf-8?B?KzVMc1F0dW5iUXUraHdIWGtwdExCOGNmR29BbEh2dHpwQ1lFWkhFRGhyMi9r?=
 =?utf-8?B?Y3Y4MVBuL01pR3cxUjdVbFRlSE1JSGg2ZUNabVJjdkxMUllPdlZuZ3Roaml4?=
 =?utf-8?B?Z1VwM1Z6dlNPV3h2WjVkcUVIRStwb1dtNmlnbFVWU0xlOEdGa3hTNW1zQy9U?=
 =?utf-8?B?QXRDaEVTS0VxVDdvWjRWSkpEQU5BeG9WU29PNzJ4dGRCL01STjFwVVlMKzl5?=
 =?utf-8?B?ZllLbUlsb1gyalpabEVSQ3A1YTRuVEhZV3MyUUVzcDNKR3BJWU15RVVNbXN6?=
 =?utf-8?B?Vmcyc2ptdnFSdUd6bHZOS0VueFI4R3haTVZyRkVFWVBlRk50MUZWeThSNWpa?=
 =?utf-8?B?QzBMWVNoT1cvcm10cTVIZFg3dEwrS1dIbDFuTnBTdVczTlRUaUdCeDYrUzNt?=
 =?utf-8?B?czRpWktPU24wL1pKU3U0eXpMZUM3RFpvNUJIR0U2R1RJbU0zOWUvbVBCL2Ft?=
 =?utf-8?B?Y0E1WEFQd1dJOVd3VW1vNkdsVXkzclllcUdueGhmVHdIREE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RmJXcjFxVzlHZzJSQWQ3RG10R1hYSkY4Qk5wZmtFTFFKbDY1dmQ5U3QvZmVZ?=
 =?utf-8?B?NjJ1Zzl0cjl3NzVoaXZGbzdSY0hpbHFHaWxmajh6bzhVdUFNelhtZnRiVDZa?=
 =?utf-8?B?MjYvamhOK01ROEdod0pQSmd4TDBVYkEyNVllQ0gzdVFUNWFQbWxydTdscFo4?=
 =?utf-8?B?L0tobkxlTFh2M1kwWlBQa1FZSFRpRDVvOUg3RVlOYW5PWHV5a1hZQnkxSS9Z?=
 =?utf-8?B?Szd4VTJPbDFkT09QbEJvcmtTZ3ZRa1hZRHFOOUZySTdmcWl3WXRMWjV6T1NX?=
 =?utf-8?B?VDhmUDlYQXBsUDZoeTNTUDNtYXkrZ09lR1NiNlFzUGcwZFQrT2pYNGtUc3M4?=
 =?utf-8?B?RkRzcnNqeGpERzRkM0E3bDNtcVZJSkRPWGJabHMxcGhUUE1yWmVwUXB3aG1J?=
 =?utf-8?B?WHZqaVlLQzVXNkFiMTZGdFB6MDlOOU1tWDk3d0J3UUJzWGhGelRzdjZoT2cx?=
 =?utf-8?B?OExtbG82TSsrcTB0TkU2V09KbFkrNUVVSnp4S0NucTJBNFhocmlBWUZoY1Y4?=
 =?utf-8?B?UGdwWGhCalU2QUU0Ty8vRytUYnZKVzl6Skc4OEdXczNNb2t6TnAxY2JPdXBl?=
 =?utf-8?B?TTdXQ3gxbm1OdTAyQzlWbkpmUVIzMXRzUW9KQjZnQWdIb1VGT2RYang5R0VX?=
 =?utf-8?B?KytINTlaUldFVGtqVGpDWUwwSHlDNlowaTlrTmNvU2llUzVLZ0hJUjh2K1h2?=
 =?utf-8?B?L2U4QmdyNG1RbERKSmVCcU4vVnlibE14QTdaZzVWSEd0a09qR0dTUGhQeE1E?=
 =?utf-8?B?K2hKZjJzQ2pQbHdaRGEzcjN4TnUwejZJbTFvSHpHbXhiU3JXMUNUQ0pXeklr?=
 =?utf-8?B?RGZKZjNKUStmTFl2a0JiZ1ZVTi9JNHdwOEE3eXV4eWpoZUZOajBwakp1L1Zi?=
 =?utf-8?B?bzA5TVVsb2lhaHN4VkJuV2d3c0lOTUNLZ3R5U09UaEk2dFVRMUVUZm00VDVG?=
 =?utf-8?B?RHhZRmQ4MVFZaWNLQjVuaTdPaWpoMW9QMWhVL1A4blp4Q0RIWEJiNmxNdE5W?=
 =?utf-8?B?Zk1OelJsWlJkczJoeXJSbnd4djdpbmlmS1pVOEwwTUtZb0I4T2RjMUtVL2k5?=
 =?utf-8?B?eDl6ZkRWL1NrcnEwSFE5WXRZVlc3c1B0K2JEaWNVOVIzV0N2R0Zud3pCajlE?=
 =?utf-8?B?MmxCemJqVHZMU2dTMER6YVNyYnlSY1dDdEJRNm42cWZKVzgrOWRBMzZpRHlO?=
 =?utf-8?B?dnlBb2o4RlJDa2xMTXJkeGNOMi9LdmIyelBQOGt0ZGNuMHFsb1AyVHU2dGZD?=
 =?utf-8?B?VU9uT0F4QkNEWng4SklGOVRhV3lCbmNsSjk5RktkMURPYzdFNlAzSXpTWlJh?=
 =?utf-8?B?MURtblM1UUYrd2J1b0ZCOFhNSEZZV0w4OTRJOHlkSExrR2l1TVBJeVJBelRv?=
 =?utf-8?B?cXV3eTM2N3Y0WmZVTUhsY2NuR3lZVEY5OFVFeW1pSEJuQ2pMcHRKdjBuUEo2?=
 =?utf-8?B?Lyt1QTdpQklUeW1BS0NkRkhrRzhHQTBCK0dscnFwaUM2dGcvOE45RE12bnNB?=
 =?utf-8?B?TFArdXNueXRuaUk3M1hHVjU4ZjU4Yk43TTRIblY2NWJxN2lNMzBBdGovMU1D?=
 =?utf-8?B?bGxjSXpvczJqOWxMUDVad3FDdkhDcGxTWnUrYnZEMDUweDdQVUxkenJ1VVBY?=
 =?utf-8?B?QTYyeTladkNSRGFMRTdUUkVzQ2hnQnN5RE9tYmxpaWRTcHdqWllBSkUzN3U4?=
 =?utf-8?B?NXRrQjMzTHRTU0lUcVZlVW5XYnRWd1NZVlRpZmZmbHhhYk1xbzBweVhKUmY3?=
 =?utf-8?B?WDUzZitHUHB5UUVXckpLdmNvTmN6NmxRdGhhSWM0NGhoUWNlcGNEVk0xL0hS?=
 =?utf-8?B?Y3h1VHZKVFZwR3V4Vk5vc0FqSUFoLzhxR25CdGdUMk1IdUtVOGpuTEcxQ2hj?=
 =?utf-8?B?TTcvL211TlNGZ01JS1ZxMXNCcE9tNzdhek1HNjdmWVZ0S3V5UURwVEh0OVBB?=
 =?utf-8?B?azg5Tk9jZTYyLzUyRTZ1aEUyVVM0ZW9JN2c5YzBQeUxJV2FqUE1vaytveUtV?=
 =?utf-8?B?SUgrd21rdUY3VFAvNDlod0hxQnk1YU12ZE1qWmFZRnhQaGE5LzhER1NxMnlI?=
 =?utf-8?B?WUxWeGtSR0FCMnRHd2J3NGJOaGtmMGZtbFVJdXlkSUZiZWJOMVgvL0lkeDdm?=
 =?utf-8?Q?rE1WgTDwZOAZ3en2lpYdi+tS9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c51b71-c0f0-4e9c-f743-08dcaa935cea
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2024 21:15:07.5446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DwgjkIDd3Av/o+CPI/PR5RDRzN4MyQd7iaFIh+MnHm07dEYWZ9wv2kkG2IUTgaQEaVQpsd/bV+agD5uiIS72rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6433
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 21:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202324

DQo+ID4gSSB0aGluayB0aGF0IHRoZXJlIGlzIGEgZnVuZGFtZW50YWwgY2hhbmdlIGluIGJlaGF2
aW9yIGhlcmUuDQo+ID4gUHJldmlvdXNseSB3ZSB3ZXJlIHRha2luZyAoTlZEKSBEQiBhcyBiYXNl
IGFuZCBvbmx5IHZ1bG5lcmFibGUgQ1ZFcyB3ZXJlIGNvbXBhcmVkIGFubm90YXRlZCB3aXRoIENW
RV9TVEFUVVMgb3Igb3VyIHByZXNlbmNlIG9mIENWRSBwYXRjaGVzLg0KPiA+IE5vdyB3ZSB0YWtl
IHRoZSBDVkVfU1RBVFVTIGFuZCBDVkUgcGF0Y2hlcyBhcyBiYXNlIGFuZCBhZGQgZW50cmllcyBm
cm9tIERCIG9ubHkgaWYgdGhleSB3ZXJlIG5vdCBhbm5vdGF0ZWQgeWV0Lg0KPg0KPiBUaGlzIHdh
cyBhIGxpdHRsZSBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gdGhhdC4gZ2V0X3BhdGNoZWRfY3Zlcygp
IHdhcyB0YWtpbmcgYSBwYXJ0IG9mIENWRV9TVEFUVVMgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUg
cHJvY2VzcywgdGhlbiBhcHBseWluZyB0aGUgTlZEIGRhdGFiYXNlLg0KPiBUaGUgY2hhbmdlIGlz
IHRvIGltcG9ydCB0aGUgdG90YWxpdHkgYW5kIHRoZW4gdXBkYXRlIHRoZSBzdGF0dXMgaW4gdGhl
IHByb2Nlc3MuIE5vdywgdGhlIGVudHJpZXMgaW4gQ1ZFX1NUQVRVUyBoYWQgcHJpb3JpdHkgYmVm
b3JlLCBhbmQgdGhleSBzdGlsbCBoYXZlLg0KPiBOb3cgaXQgaXMgZXhwbGljaXQsIGJlZm9yZSBp
dCB3YXMgaGlkZGVuIGluIHRoZSBjb2RlLiBJIGRvIG5vdCBzZWUgY2hhbmdlcyBpbiB0aGUgZW5k
IHJlc3VsdCwgZG8geW91IGhhdmUgYSBjYXNlIGluIG1pbmQ/DQoNCklmIHdpdGggY3VycmVudCBt
YXN0ZXIgSSBhZGQgZm9sbG93aW5nIHRvIGFueSByZWNpcGU6DQpDVkVfU1RBVFVTWzIwMjUtMDAw
MV0gPSAibm90LWFwcGxpY2FibGUtY29uZmlnOiB0ZXN0Ig0KQ1ZFX1NUQVRVU1syMDI1LTAwMDJd
ID0gImZpeGVkLXZlcnNpb246IHRlc3QiDQp0aGVuIHRoZSByZXN1bHRpbmcgYnVpbGQvdG1wL2xv
Zy9jdmUvY3ZlLXN1bW1hcnkuanNvbiB3aGljaCBzaG93cyBhbGwgQ1ZFcyBmb3IgdGhpcyByZWNp
cGUgcmVnYXJkbGVzcyBvZiBDVkUgc3RhdHVzLCBpdCB3aWxsIE5PVCBjb250YWluIHJlZmVyZW5j
ZSB0byB0aGVzZSB0ZXN0IGVudHJpZXMuDQpCdXQgd2hlbiBJIGFwcGx5IHlvdXIgcGF0Y2gsIHRo
ZXkgd2lsbCBiZSBib3RoIGFkZGVkIHRvIHRoZSByZXBvcnQuDQpTbyB5b3VyIGNvZGUgY2hhbmdl
cyB0aGUgYmVoYXZpb3IgYSBsb3QgKGluIGEgZ29vZCBkaXJlY3Rpb24gZnJvbSBteSBwb2ludCBv
ZiB2aWV3KS4NCg0KPg0KPg0KPiA+IEkgYW0gbm90IGFyZ3VpbmcgYWdhaW5zdCBpdCwgSSBhY3R1
YWxseSBsaWtlIGl0IG11Y2ggbW9yZSBhcyB3ZSB3aWxsIGJlIGFibGUgdG8gaW5zZXJ0IGFsc28g
Q1ZFcyBub3QgaW4gREIgaW50byBvdXIgcmVwb3J0cy4NCj4gPiBCdXQgSSBoYXZlIHR3byBjb21t
ZW50cyBvbiB0aGlzOg0KPiA+ICogdGhpcyBzaG91bGQgYmUgZXhwbGljaXRseSBkZXNjcmliZWQg
aW4gY29tbWl0IG1lc3NhZ2UNCj4NCj4gWWVzLCB3ZSBjYW4gYWRkIGl0IGhlcmUuIFRoZSBsb2dp
YyB3aWxsIGJlIGRvY3VtZW50ZWQgbW9yZSBpbiB0aGUgc3RhbmRhbG9uZSB0b29sLCBiZWNhdXNl
IHdpdGggdGhlIENWRSBkYXRhYmFzZSwgdGhlIHVwZGF0ZSBydWxlIGlzIGV2ZW4gbW9yZSBjb21w
bGV4Lg0KPiAodGhpcyBpcyBhbHNvIGdvb2QsIGl0IGZvcmNlcyB0byB3cml0ZSB0aGUgbGlzdCBv
ZiBwcmlvcml0aWVzKQ0KPsKgDQo+ID4gKiB0aGlzIG1ha2VzIGdsb2JhbCBjdmUgaW5jbHVkZXMg
c3BpbGwgaW50byBhbGwgcmVjaXBlIHJlcG9ydHMsIHNvIHRoaXMgY29tbWl0IHNlcmllcyBzaG91
bGQgYWxzbyBnZXQgcmlkIG9mIGN2ZS1leHRyYS1leGNsdXNpb25zLmluYyBmaWxlIGZpbmFsbHkg
KG9yIGF0IGxlYXN0IGFkZCBhIGNvbW1lbnQgaW50byBpdCB3aXRoIHRoaXMgc2lkZWVmZmVjdCkN
Cj4gVGhpcyBpcyB0aGUgcGxhbi4gSSBkbyBub3Qgd2FudCB0byBwdXNoIGEgc2VyaWVzIHJlbW92
aW5nIGN2ZS1leHRyYS1pbmNsdXNpb25zLmluYyB3aXRoIHRoaXMgb25lLCBidXQgbWF5YmUsIGFz
IHlvdSBzdWdnZXN0LCB3ZSBhZGQgYSB3YXJuaW5nIHRvIHRoaXMgZmlsZSBhbmQgdGhlbiByZW1v
dmUgd2l0aCBhIHNlcGFyYXRlIHNlcmllcz8NCg==

