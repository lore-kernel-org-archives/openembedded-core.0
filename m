Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E803F327B4
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 07:31:37 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14951.1776756695867410040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 00:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=QfC4I1hn;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.28, mailfrom: zhengrq.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJdpunUWnR/n1OnO7ViS8Gjlg0gJlKt4QlCGqOKxmr5DOZW0y7yWToToGcjAqViZo4oKWG+m/PGiGV7eWdet5+R9c0gNF2JP9UGaWJnsDIv/l7s20pFNlK7Gw2i9fiFbHf24XN+W7ko2EAgXTFmG+RpVyNaIlPzWZqln7QctpZLADx4bjGcmB4/ugbaYDr9RqRPpQU2fbpZqClCO3NENVLGFKs6Qm+dhFTdAI/lmVqYzPsq/qM7XwrEr6hCdjl+DSk/YbXxOJZL46x0KtiIjdu03b3mEbMkpyHXTr7SL0sieV56lug2+5GQ1MtbsBK/+OW2Bb+P2tJrLFpLfMzCEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbPeo2qpJDY/eR53+fa9IRFzEHuLSGy0E9Ik/gKgQns=;
 b=AZDZduDM5SS/n+NpFugCfOdyRuVqEezEebAdg4u8898FSr5nUyaA0FLgWri5ol6/b9XuL/Ur7xbsrMmpebTLZqLs6VcvVX/123OdgQVe6g/NmxzsTBOrhUbh0KldmPbgs3QQ9yvs+tNuj0XXZlFBG5gHznV0JKftC91mz/z3aRvfFC3qvtK08Q7lLMqm09pdRyUtG6hwDH72dx7HM25pWrfTmB65CzMytVmjFa5uOyEoL395mLnbhqVLomvwR38JOz7i2igp/s71/g6Z3AhBAdAYw719nIY22c7hesQ56KNJH1Kaw0Z4m0N85l3CmxYnVEkyf3Pu/cLOkOSmDJdq3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbPeo2qpJDY/eR53+fa9IRFzEHuLSGy0E9Ik/gKgQns=;
 b=QfC4I1hnKvxm3QphU5gi6zGNopN0Mz/F0hProQ9L2sJDiW8igJgdU9s9EfYrcz7dkqlZDseEDjaBAlETi79M2YdT8A11B88hUanpxt2+VTBLnxe6qj8T291uNGC6/MVttYaKKtrhcEgf4Q+C1oMn9cFUd+uS7Tk0+xCa860YA0JbIMqGw7xZwxpROcFbQvUxJVzYwwtUnF7FlMRrF+Qdx1Ix3TUeuoxuzfH5j2lcn+fX7VKdiZU5EwlHKN3p4dsXWpGbi6Uen5KHIiCGewdyM7VzuF//ZoD7eNah7dVKQGgPfifQfwTgWIXlGvhg+buUW0ij+p590JmfOc+cjbzhRw==
Received: from TY7PR01MB14803.jpnprd01.prod.outlook.com
 (2603:1096:405:258::10) by OSOPR01MB12458.jpnprd01.prod.outlook.com
 (2603:1096:604:2db::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 07:31:32 +0000
Received: from TY7PR01MB14803.jpnprd01.prod.outlook.com
 ([fe80::a91b:a20b:4359:72a9]) by TY7PR01MB14803.jpnprd01.prod.outlook.com
 ([fe80::a91b:a20b:4359:72a9%5]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 07:31:32 +0000
From: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][question] sbom-cve-check: question about
 ${DEPLOY_DIR_IMAGE}
Thread-Topic: [OE-core][question] sbom-cve-check: question about
 ${DEPLOY_DIR_IMAGE}
Thread-Index: AQHc0GaemLzXb/DykU+XOV6zj01i97XoExOAgAEH0mQ=
Date: Tue, 21 Apr 2026 07:31:32 +0000
Message-ID: 
 <TY7PR01MB148030FA1EDD0435D3900E8CA8B2C2@TY7PR01MB14803.jpnprd01.prod.outlook.com>
References: 
 <TY7PR01MB14803D1141A848F97B5A907368B2F2@TY7PR01MB14803.jpnprd01.prod.outlook.com>
 <5A6DBDB1-9CC5-4D15-A3C5-5A230C2A4F71@arm.com>
In-Reply-To: <5A6DBDB1-9CC5-4D15-A3C5-5A230C2A4F71@arm.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-04-21T07:31:31.930Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14803:EE_|OSOPR01MB12458:EE_
x-ms-office365-filtering-correlation-id: a4c56441-bad9-4bcc-43b8-08de9f7802ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|1580799027|18002099003|56012099003|22082099003|8096899003;
x-microsoft-antispam-message-info: 
 Hlc6YB98qIVlgEfIUkgjWDAS+5kWh953XfgmA8Sz62GPpOvxw8ROnSxpG6AQsFyFVsCRq5ANHCRfOJamr8v8YKMJROu9Px/z2iPQlIOSSIvqvSeyCwVMyub5UkmP00JM7jyeKpr+LKEEAo5OIa8UEHjnPOxaQI2O6O/zAHpp1NW3KdZPROG++WzSE2e+h5/I3I3x6uhGdDfCJtSoYhHWWkqlIEQ4euvHTcySVodXwOmJvkDuodosEFOq+4hLWAQfFMINlimBQmKo52KB4o406xmI6jFWjc5xsl30V3+90CJXFh4Luc6R2Vioul0I5ItPM3UHuoqPQ10o/dS1eIvoPztvC6R/wlfnYgIVJwNF9ktrkyWuy29frwQLKed6zDPMDXap6rjWnUJQXMc+ihVtZ8c90BrwId+PA8KfA2GpySixggfUDOAuDUC5dKeFE9nLxCRexwFJi4LnaXbpO6AiQv/nrpEczKt5fumjR5t3pwpuGeKAvv2x0Y0SYu461TLTzNL5ynfBK0el7mplazDDnVdSpgnwiNSI6p4gIMyIaw8MccAi+aOB19UQYZK77jDfBRN3HQKWbM4tafKki+qAmADvyq4Ipj/7Dg/R6fHZFs9NbIFRFAuEpesHhQ6jCePLYWQ7W0j4sATT5jEdtjOmTWKijU1MuR7go+ZXYGCQvCGMIweDSdOkchNommY42zZpvJa6kPDIsB5QaZSuNDFU0CILEQ1+NDtOdJDSIBLwMVO24cSssw8IhAOir+GI8O59MZWtqKu8BCpf8glMfbDmDRZarPgvAu8ikAcAHp4+Wd4AGTJ/VXwxtahsoqcMxorU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14803.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(1580799027)(18002099003)(56012099003)(22082099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?MXZ0RXFWWm5jRmdoR2daQkluV0xVMUEveWdPTUNZb0pRNU1nbzJYd2ZSQ2pC?=
 =?gb2312?B?R1NjSGdzd1h1Znl0OG8rMVhKQ0NPRFF4MXA5MWI3YWpYZnAxK29OQkpqVzBG?=
 =?gb2312?B?RnY3RDZTeXNoRlp2VVZhZDZyNklJZ08rdElsbDZRZ3o0UlpDd3d0WlJ3Tkw5?=
 =?gb2312?B?SnBFbnVPZ2phVk8zeTdHMTFlTEI5eDV2RmhYRmYxd1c4ajJWY2FaZHN2Sm1I?=
 =?gb2312?B?WjlGTFEvM1hZaGFjQkFkcHh1NWV1Zm1wSXBkL2czbzBEQVROcjFEeml2UkZU?=
 =?gb2312?B?LzlKRUhtOXJIRlZLSGRvWXQrN09xTm1wNVh3bnVHSktjMXFIMStoNG5leXg4?=
 =?gb2312?B?bDlmR2E3TU5pQkNHbUd1WG9iakIxcHVyM3VxODdESUU0anhNZWpLbWo4ZXdW?=
 =?gb2312?B?czQzWnRaWmFjYjBRZjhIWnYzNjBEQjhNU3d0SkVnbEVsaHZSSytkcWVKNkh2?=
 =?gb2312?B?SndaU2pNVGFubWZYRTJoYVhTd1ZwU05qZHRwVk9McEFGbzNPVmQvZmNFcy9H?=
 =?gb2312?B?UzA4Z01OejBndXMveGZYMEZpVTcwbng3WHIwaEtBcDArRS9rMUlQdFY5Kysr?=
 =?gb2312?B?akt6OGMvZk5oeFJDS056RkZMdTlzOWpNV2RPK2tIeVB0cHRFdVBDeGtwRWhJ?=
 =?gb2312?B?SHFVZVZ0eDQ4T1NPVytGSVd5RkRqUnhxbUxFL2hER0VDdC82REs5U2hnbWUx?=
 =?gb2312?B?REkybVZmUFd0N3RMQ3pmZWxPWTB3a1hRQWxwakV6a2lmd3VhUXJxNW9wTGFi?=
 =?gb2312?B?NWhoZTdFYzRQamdsQUhlUldHbEFnUSsweWlYN0dHLzlOVmdlNGs2T1pNSlpm?=
 =?gb2312?B?RDlkQ3RuMkFERStlRDFhTmliRC9tY0ZobHJkWmM4Q3lEcmUwUm0xQ1U2ZWtp?=
 =?gb2312?B?TGEvcThDWGtGdUhOdHhTU2Naam5Va2FZWE5OQ3B2YXlQbjdBNUFJbFVoRmZu?=
 =?gb2312?B?eHZ0Sjdja29Ibmt6aXlLSHlvcjFmZjJBK1FiUnM0K2JBYmZ1cGc5RWJuSmkr?=
 =?gb2312?B?aE05dHQ2SGhZY1U2UkdZSFkrazIvaDl5OG10UHlXMFFUMTNZTlVqcm9QbEdl?=
 =?gb2312?B?UUtOY2RVWE15OEtNTU5qdVZiYWNKZ0dxTTNhU1E3eForUm5HaHhnNTRVeHFH?=
 =?gb2312?B?YnpDK3VjUnY1RnBvV00yaDA0SUlkSnUxV3lLc0YwSHVubTN6OUcxUHc2Sk4z?=
 =?gb2312?B?OWFab3JSSlJRK2NVNmd3b3dMaU5KQTB0WDdYVWg5ZVpMM252TCs5OWpLWUJl?=
 =?gb2312?B?V2ZZc2ZLS0JKZzQ4cjRNa1grZjV6RjU4MGMwY0IxM2lIOHZ0L1Z0QmdyWkE2?=
 =?gb2312?B?UkViTytHTWJSQm5WZzh0OG5IMXZxQ1Q1WHVJZmJCOXhwc2YxY1gzTzM0YTB3?=
 =?gb2312?B?TndsNFM4d0pOdk52bGVFaFYzVW1TOGhGc21QbWc4MDc5em80VktvakdrTW5j?=
 =?gb2312?B?czVZbkNsdzFzRGhIcmlhOE1ITTl6MWxFOHNkWEw2b2NmN3FzOVB3Q014emZP?=
 =?gb2312?B?NUV3K0hUR0NDSHNjZ3oyd2w3S0xtUWd5cnFyQXZrMVk1cC9uOFgydmdUU20x?=
 =?gb2312?B?SkpuTTk5SVp0WUZ5MExubE5DMFhaTUs5dHc5WGhwalJkdHovVTYwV3dLY3JS?=
 =?gb2312?B?WWluT3dUcUVqN2lUd01DNDgwZy8rVjcweXBPL00xaGFrSGF5TTZ6b3pnNkVy?=
 =?gb2312?B?NEZYVTVPVVBZUi9TM0lJTEhLb095WU1sT3VNVlhUeWZpMWF4YkpCSklOR25P?=
 =?gb2312?B?Qnd5RHlNVWI0WVdpUHZldXczUzJ2ZVNZekpHbmlyZWVxSjMyNXZqY2JnR2Rt?=
 =?gb2312?B?K3dVeVNzRkFtckVWcFFXR2ZxM3BEaUJ1UGMrem9KQWZDc1QvNzNSS3M0bzls?=
 =?gb2312?B?czJyVS9VTHkvM0FKS09SdEx5cUVFKzRjZ01SWFlERkwwdTRzNjZFdlhKNHlR?=
 =?gb2312?B?T2k0V2NsZHozckQ1OVZlbEhKTW1PczZ1dkFsY3VGdWlKbXVJTnlmbzhacDNh?=
 =?gb2312?B?WWxydlFDa3E2a25OOXdPM2hIZnBuMDRxUHFUR2Vwam5ZTkFwUjJQeWpsdm5p?=
 =?gb2312?B?eEsrNnhLZzlUYTVSS3phNDNtWFhmclN0OVJjT1V4TmNBdytRZ3ozMC9hT0RD?=
 =?gb2312?B?UHo1bFpiTS82eThXWDE2eFEzMXduWHJyTkw2Si9uMlh0L2VBL3NFVDBuZUk0?=
 =?gb2312?B?amdXa1lmdGF6UHR1dFo0eVdhbGNHUllXM3ZsdUpseVdDd3BQMk9Wem0vb2Er?=
 =?gb2312?B?VHVkR3NqcEZoWVlTTzhFMUl2WmJFVzlVY3QvQWhraW40c3NaZE1BYjdiWHRz?=
 =?gb2312?B?U3dYNGZpa3JmZXVhQnJWbTE5NUdZbis5TGVqN1VXbjA4WnBteWFQdz09?=
Content-Type: multipart/alternative;
	boundary="_000_TY7PR01MB148030FA1EDD0435D3900E8CA8B2C2TY7PR01MB14803jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	qfgkVoXTSZ/RJpocv8JwHELYXL7h+ryOF13zYe5SNqgXLIgzEtrrqQ2PsEVkrqXNm9Ylr6FZmQZEo0c3Sf6RhNJ8c1nx5J6m29bdMQHYIlE8CboB5WGgfUdQGGVOxOZVYKRCrNoI5VntIdKJBLn87YqY+qsoBqF1QYWq/evlAl7b25DKtKmz6RSRZovv00CDeMC05FFE9j8ZEcrq1l5pRyHdWOcosw3fvv3uUZm85mexvkbrm8fiJ6ZCZkJ79xxNxErLbtXu+mUuV+ASeJy0zuHGNxf15lTHbnXEIyKXpd9QoqYpEMq/uD9Ah8wxn6koYZupkk3SUu8pOlVTnnrx+w==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB14803.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c56441-bad9-4bcc-43b8-08de9f7802ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 07:31:32.6758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iZ/tOu1Em3Pf4+ZU7GoZjfqd4aSZL4/PC+AfbFpAkXJBrF6F8lmgxzkH1v99PgGBQ78rZMS62wFHYCT7dueAcwmVd7f/IQs8Bg5MT73G+PM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12458
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 07:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235602

--_000_TY7PR01MB148030FA1EDD0435D3900E8CA8B2C2TY7PR01MB14803jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUm9zcw0KICAgICAgVGhhbmsgeW91IGZvciB5b3VyIGFuc3dlci4NCiAgICAgIE5vdyBJIHdh
bnQgdG8gZ2VuZXJhdGUgY3ZlIGluZm8gZm9yIGVhY2ggcmVjaXBlIGluIGltYWdlLg0KDQogICAg
ICBOb3cgICJiaXRiYWtlIGltYWdlLW5hbWUiIG9ubHkgZ2VuZXJhdGUgY3ZlIGluZm8gZm9yIGlt
YWdlLCBhbmQgYXMgSSB1bmRlcnN0YW5kLA0KICAgICAgd2l0aG91dCAiYml0YmFrZSByZWNpcGUt
bmFtZSAtYyBzYm9tX2N2ZV9jaGVja19yZWNpcGUiLCB0aGVyZSBpcyBub3dheSB0byBkbyB0aGF0
Lg0KDQogICAgIEFzIG9sZCBjdmUtY2hlY2suYmJjbGFzcyBoYXMgYmVlbiByZW1vdmVkLCAgSSB3
YW50IHRvIGtub3cgdGhhdCBpZiB0aGVyZSBpcyBhIHdheSB0byBnZW5lcmF0ZSBjdmUgaW5mbyBm
b3IgZWFjaCByZWNpcGUgaW4gaW1hZ2U/DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCkZyb206IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPg0KU2VudDogTW9u
ZGF5LCBBcHJpbCAyMCwgMjAyNiAyMzoyNQ0KVG86IFpoZW5nLCBSdW9xaW4v1qMgyPTH1SA8emhl
bmdycS5mbnN0QGZ1aml0c3UuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpT
dWJqZWN0OiBSZTogW09FLWNvcmVdW3F1ZXN0aW9uXSBzYm9tLWN2ZS1jaGVjazogcXVlc3Rpb24g
YWJvdXQgJHtERVBMT1lfRElSX0lNQUdFfQ0KDQpPbiAyMCBBcHIgMjAyNiwgYXQgMDI6NDMsIHpo
ZW5ncnVvcWluIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDx6aGVuZ3JxLmZuc3Q9ZnVqaXRz
dS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+DQo+ICBIaSBBbGwNCj4gICAg
IEkgdHJ5ZWQgdG8gdXNlIHNib20tY3ZlLWNoZWNrLXJlY2lwZSBhbmQgZm91bmQgdGhhdCB0aGUg
c2JvbSBmaWxlIHdpbGwgY29weSB0byAke0RFUExPWV9ESVJfSU1BR0V9Lg0KPiAgICAgICAgIEl0
IHdpbGwgY2F1c2UgYSBsb3Qgb2Ygc2JvbSBmaWxlcyBpbiAke0RFUExPWV9ESVJfSU1BR0V9IGRp
ciBhbmQgaGFyZCB0byBmaW5kIHRoZSByb290ZnMva2VybmVsIHdoaWNoIHVzZXIgd2FudCB0byBm
aW5kLg0KPiAgICAgICAuL2RlcGxveS9pbWFnZXMvcWVtdXg4Ni02NC8NCg0KQXMgSSBzYWlkIGlu
IHRoZSBjb21taXQgdGhhdCBpbnRyb2R1Y2VkIHRoaXMgY2xhc3MsIGl0IGhhcyB2ZXJ5IGxpbWl0
ZWQgdXNlIG91dHNpZGUgb2YgYSBmZXcgcmVjaXBlcy4gWW91IGFic29sdXRlbHkgd291bGQgbm90
IGNhbGwgdGhlIHRhc2sgb24gZXZlcnkgcmVjaXBlIGluIGEgYnVpbGQsIGJlY2F1c2UgZWFjaCBT
Qk9NIHdpbGwgaW5jbHVkZSBhbGwgb2YgdGhlIGRlcGVuZGVuY2llcyBvZiBlYWNoIHJlY2lwZS4N
Cg0KSWYgeW91IHdhbnQgdG8gc2NhbiBhIGJ1aWxkIHRoZW4gdGhlIGltYWdlIHNib20gaXMgd2hh
dCB5b3Whr3JlIGFmdGVyLiBJZiB5b3Ugd2FudCB0byBzY2FuIKGwd29ybGShsSB0aGVuIG1ldGEt
d29ybGQtcmVjaXBlLXNib20gaXMgYSBzcGVjaWFsaXNlZCB0YXJnZXQgZm9yIHRoYXQgcHVycG9z
ZS4NCg0KUm9zcw0K

--_000_TY7PR01MB148030FA1EDD0435D3900E8CA8B2C2TY7PR01MB14803jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Ross</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; Thank you for your answer.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 12pt;">&nbsp; &nbsp; &nbsp; Now I want to </span>=
<span style=3D"font-size: 11pt;">generate
</span><span style=3D"font-size: 12pt;">cve info for each </span><span styl=
e=3D"font-size: 11pt;">recipe in image.</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; Now&nbsp; &quot;bitbake image-name&quot; only generate=
 cve info for image, and as I understand,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; without &quot;bitbake recipe-name -c sbom_cve_check_re=
cipe&quot;, there is noway to do that.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 11pt;">&nbsp; &nbsp; &nbsp;</span><span style=3D"=
font-size: 12pt;">As old cve-check.bbclass has been removed,
</span><span style=3D"font-size: 11pt;">&nbsp;I want to know that if there =
is a way to generate
</span><span style=3D"font-size: 12pt;">cve info for each </span><span styl=
e=3D"font-size: 11pt;">recipe in image?&nbsp; &nbsp;&nbsp;</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Ross Burton &lt;Ross.Burton@arm.com&gt;<br>
<b>Sent:</b>&nbsp;Monday, April 20, 2026 23:25<br>
<b>To:</b>&nbsp;Zheng, Ruoqin/=D6=A3 =C8=F4=C7=D5 &lt;zhengrq.fnst@fujitsu.=
com&gt;<br>
<b>Cc:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core][question] sbom-cve-check: question about=
 ${DEPLOY_DIR_IMAGE}</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On 20 Apr 2026, at 02:43, zhengruoqin via l=
ists.openembedded.org &lt;zhengrq.fnst=3Dfujitsu.com@lists.openembedded.org=
&gt; wrote:<br>
&gt;<br>
&gt;&nbsp; Hi All<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; I tryed to use sbom-cve-check-recipe and found=
 that the sbom file will copy to ${DEPLOY_DIR_IMAGE}.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It will cause a lot of=
 sbom files in ${DEPLOY_DIR_IMAGE} dir and hard to find the rootfs/kernel w=
hich user want to find.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ./deploy/images/qemux86-64/<br>
<br>
As I said in the commit that introduced this class, it has very limited use=
 outside of a few recipes. You absolutely would not call the task on every =
recipe in a build, because each SBOM will include all of the dependencies o=
f each recipe.<br>
<br>
If you want to scan a build then the image sbom is what you=A1=AFre after. =
If you want to scan =A1=B0world=A1=B1 then meta-world-recipe-sbom is a spec=
ialised target for that purpose.<br>
<br>
Ross</div>
</body>
</html>

--_000_TY7PR01MB148030FA1EDD0435D3900E8CA8B2C2TY7PR01MB14803jp_--

