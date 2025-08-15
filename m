Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D13CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 15:29:26 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.13])
 by mx.groups.io with SMTP id smtpd.web10.14333.1755271005708219742
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 08:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=YG/3TjzI;
 spf=pass (domain: ericsson.com, ip: 52.101.84.13, mailfrom: tony.rex@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmKdNuSCw7YUzPEcaY83BEPni86imKKv4L30dwqGsv8FMjM/T/IFjD0P096OXASH2nVBipunLe2lCcVz2JVNAr/TAQ+o3N3SW9cx7J3Au5XrjE2fDNLuuXmB35b6NvjH2HZ889UzUHxDQIch5lAXnJsHiAo2g2KgCr1BN9ijv/Pi821rA1I/yo5NhWk65vdfcD8mqNi3idMRFsTjAaHnu+u0YsrR2HeYR1XkKMcapT1vNtVqdh6v1xwwkqVL3gRrq3jRl4oxUiTjuupllVMd/FwAnvzIFzGvdk7c19M867ZhnfJ3+P/XgiTOUBlP0zw78bHL3PZB4X214H7/muzAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAP22XuIVRYuFDeQb9sagTClHqFRXceXyYi+GFxPgKM=;
 b=EzDmpycGT1INvHLZnWcOT56gfgN+9p7oHVDaMx9Y4KD4PMR+Z3+lijsMRKToxG48gDalrIZBNvTNElJ+UCTIQMSboiC09KVR79qjY8P6sQVfPZjmLodMVxJpku16ssG8rcuLZcb3DyOkPikZRL+McD+iFf959sjQ3uQPQ21jaeyfGAbwkDSnWfu12kIfmaIOG78oZRC9e3t6BNPJpSzjtN+eEVNBDh4MyBSRLjS094c722xMOLFhhTVVd7cuyuelkrvcw0ZaJFDndZNi4CiY0bgjM2AWsK3wVIehvQgzc1IA/hI5BRO6/Hrp1q8/qsMBCUwD9mboRZh9q7LcFEUZ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAP22XuIVRYuFDeQb9sagTClHqFRXceXyYi+GFxPgKM=;
 b=YG/3TjzIZJp8+F/mpKEfO+5gRvY5n4rT1yuaszCwKGBAF1gt964FBZv4sFqWKcvhc303q5N6Hmh5ZK4yigI+Z/s8Zk+YC7nyRciwV41M0RgNfdfPcOEQ0Jei+LbnLPvQN3CJ7pFNCEadibqx7+GgQ/H6iUFijJqh8j39dBdjrH84UwXm1Ut4DxaPKJTNMmY/NiI9SOhX1y22/sLFDuF+vtZUSKdANsPmZ4mrR1SyjLikteSBvydzx6V8ax0OcqJI6qsQxpM8X98YfQMf7Of8VLOrQDhoJUFcUorlt787VkC++2rH59zpcnDWg2G73F55Pm+XLfTxrivdstWSBFhdvg==
Received: from PAXPR07MB8470.eurprd07.prod.outlook.com (2603:10a6:102:2b8::17)
 by GV1PR07MB10166.eurprd07.prod.outlook.com (2603:10a6:150:209::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 15:16:41 +0000
Received: from PAXPR07MB8470.eurprd07.prod.outlook.com
 ([fe80::7a3c:6ab1:cc5f:be5b]) by PAXPR07MB8470.eurprd07.prod.outlook.com
 ([fe80::7a3c:6ab1:cc5f:be5b%5]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 15:16:41 +0000
From: Tony Rex <tony.rex@ericsson.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race issue
Thread-Topic: [OE-core] [PATCH 0/1] base.bbclass: Fix the recipe parsing race
 issue
Thread-Index: AQHcDUA2gbaZljQhkEy0FCsy98lt0bRjcqoAgAAwWXA=
Date: Fri, 15 Aug 2025 15:16:41 +0000
Message-ID: 
 <PAXPR07MB8470CECE924BE2127902BAF3E434A@PAXPR07MB8470.eurprd07.prod.outlook.com>
References: <20250814172348.3882586-1-tony.rex@ericsson.com>
 <DC2W6ED7YCUS.1V4VLCIHMFF17@bootlin.com>
In-Reply-To: <DC2W6ED7YCUS.1V4VLCIHMFF17@bootlin.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB8470:EE_|GV1PR07MB10166:EE_
x-ms-office365-filtering-correlation-id: 30295e7a-7689-4583-5c74-08dddc0ebcf2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZWdTd2htTTdTWm5kclJjc0RWWWt4VmVTbkx5ZEV5S0pFcXM5b2l3cW0wYXBL?=
 =?utf-8?B?ZEFKVDQ5b1BtZjBpSU1pQ0c5WDAveXVjZVh6UTF6eHJITWlacVNiaWlSQzNR?=
 =?utf-8?B?azZwRnN2UitpcFhLNzYzWjN1c0d0cTI3R09lQ1lRV1VTUjVieVd0RGdGTlc5?=
 =?utf-8?B?K3FMWW5hL3hzZWZneTRNWHZwcjN3Q1IyRkZxTTdMajB0K3JUek5mY1VnMmdm?=
 =?utf-8?B?dXNCajNubndXMDRsTVNiWTI3QXp0RkdxVmRQdCs1R0RNWnFGeEdjRkdMTXk4?=
 =?utf-8?B?QitFb1c3VDYxQXhVVk52QUFEdzdxVW4xV0dvZkVCUTRuUkRaOTdvVnpndm9S?=
 =?utf-8?B?QmQ5bzBmSmZpU2doUGNZb0NlRjdBcmRNZDNMdkt2bTNsdVJLRVRhQ2J2WTVj?=
 =?utf-8?B?OVl5dEJhc0F3UWF1d2NJa0VZR0tURzNZQkREOHlHckpqQXkvREZLaHpWa1RQ?=
 =?utf-8?B?a2V6OWw1azh4OHRQQWRzem1HdlhMdWU4ZVJSeVhUVnpMb3huZG56NUdOcDZW?=
 =?utf-8?B?SE1Ibk5FZ0xHTWVJcGlPaGVJUkU5aDY2ZVIrSE5GVW40Rzc5dGsvdDl4bllK?=
 =?utf-8?B?K3A2cnFDVkNxWXBGMG94N2paNlI2OWNkZUx6cUtPcHgwV3IrcEM1TFlQdmtL?=
 =?utf-8?B?akd2MU1iNjBnT0xOTEpvOXFQdW5FeDE2alB4aGlsbmtzMCtHaGNDUmRtbzk4?=
 =?utf-8?B?Vmx1ZWlJcldUemRlNFRRV2JFT043WkpZQVFUMzV3YTI4UWZEL20xQWtqTWc4?=
 =?utf-8?B?QXlqdUo4bG82TWkzVHQvMGt4ajVER1g0Yi81RUdlT2lmZ1RCU3M0VHp5eTIw?=
 =?utf-8?B?bS8xdUpEM1ovb091WDRhbG8xZmpibm5UVVhDMVc4Nmo0K2NLRWRwaEFLdlhC?=
 =?utf-8?B?YWNMSEZKeEZlQVovRTJxdDJzbHFWaTYyY1A0N1ZwczJBajdHYzFlaDY3VENj?=
 =?utf-8?B?RmhqK2prK0NIQnhiNkN1eURCUmJ3V3V1NjFrRWF2bXpSTFJFMkZBcThaMjNQ?=
 =?utf-8?B?bWZ0aTUzNmxPMGtyVmdzbW9DM3hhdmpjYmQ0WEMvbWtlbTRJaDVDZnRsemxP?=
 =?utf-8?B?SS9OTVFnRTBEYUZXL2NEby9kcDRDemgxa3cxUjBjcGlENUtnRFl1VVBFc1U4?=
 =?utf-8?B?d1JGWFpyaXgxV2RFZFJhTlcycHUyMW0zYW11ZzByZ3d0ZEFNc3ZQNW16aWZu?=
 =?utf-8?B?K1R2OTJ4c01waFBRYU9IRWpHckU4dm1FNzh2a0svLzlEeU5rcXFVejM2TWVR?=
 =?utf-8?B?b1JiZEd2YzVoQU0yVTBteWgxQk1LMHlZV0xjUE5Qc2x6U0REdnA0Z0MwYklP?=
 =?utf-8?B?ODFjMDBQNUlQWmVxaWk5K2lQNkFFSlhjdnZwU216MnN5T0tYMVpSb3AxdmlW?=
 =?utf-8?B?K3g0eFRHQTF6QmptTlpTSStUZ2RiQlowTTBHeGZrYkJ6N1hXMFF1S1o3YU12?=
 =?utf-8?B?MWdCblV1RnNlMmtMVjMwa0JpNWlPMiszbXd2Q21KWGRGYk9NbGUvdVVsck9G?=
 =?utf-8?B?blh3TU5VUFVsaEd1NithdkZoZ1NmcHkwbTNlNVJTaVgrVVBKSXk5dG4wNFNo?=
 =?utf-8?B?cExPeU9xcHpvNEJDODc0Tm55b09xRlprUVVzWEtxVVlNVHNkYk45YldsQXFL?=
 =?utf-8?B?Y2d5TjBnR25NMlUwUW9KNzJOblhuUXdKTVVGK0JoUXJKSEpJS0JsR3lYUTNX?=
 =?utf-8?B?WlVwQnJrTCtzSlFCQXN2SDdDb3dhQlR1d3BrMGhRQkhBNUlweGI4S2orQTlW?=
 =?utf-8?B?T2x0REVJQXliMGM0SlB0YWVkRlgrNXdyRG5NdERmVjIxdDdtcFlTb0cwd24x?=
 =?utf-8?B?RnNDRWpmZndRR1dSWGVxdG5KMEk3YVJsWjZZZVpLK2YrY0NsaitUelpmT011?=
 =?utf-8?B?eHgzZkN3dHdVN0t2OTRhYUxkdzM4M2haZFErQ0lLM2V6bkE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB8470.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Rk5JTm5Gazc5RzFDOHZ6RmtWVXpodGdtdjQ3U3JFT2hSdzR1SG8vQWZTMGtw?=
 =?utf-8?B?NFJIdnhkcnNJQkozVmFCOHVNQkE4K09ROVlnQUwzeUVXSnNYVnVweTFHU0Vl?=
 =?utf-8?B?NjRzdXM0bVIrNW81aG14THhXUlRyQkw5MjEvVWw4b1NHK2MxbGozMTZ6VWV5?=
 =?utf-8?B?OTBMYXU5ZUFZcVl6SHBWd29MNkhTNXNNSlJyZzlMUVRuV0FlRzUrL1BRSTkv?=
 =?utf-8?B?bWYyeWhFMFVaY2FRQVV5dENGOENJeExEV1ZMM21vL01HVDBNUURuMzl4TGhS?=
 =?utf-8?B?RTFrV3VEQ1N1dVNHbUxoeHdxdjhIUnFqN2wwTHNNL3lyUnlhWUhpQyt6QXVU?=
 =?utf-8?B?aGQzSHhPVlZzZHhBYi96MmtwckRESUY3QmRJTTM4N0FoaFpkMHpIN3N2OVJj?=
 =?utf-8?B?dlZSQW1iY3JpN0k1UGxheUVQZFdTZ3BEOXZPdzdHeEhrY2xGUk03WHhpM2V3?=
 =?utf-8?B?bnI4YVpxbmpGMVlMbTdOZTFabFNjU3JUY1VsMWVGKzl6TFpuajRxQW1ZcDh1?=
 =?utf-8?B?OEMrdVVRWk1KSFF2ZTJQeU04L3FoTHZQR0I4cTRDODNXOFRaZHJoMzFVLy9N?=
 =?utf-8?B?SHVCYlhWSjhraURYdUtURURmM0tLV3AvbFZZTmdUZ3gxVGtVREpjUnJ1MXRC?=
 =?utf-8?B?KzVtTHM5ME5OVUR4ZmR0STFsMlJCYmpWUVpqNDR0MnF2QTNXNzNGMVo0Z0dM?=
 =?utf-8?B?ME85ZElFcXBKd0xWeWtPRU4ySFhjNGRzOTdaZHFPR1FsYllkOENYV0NHVWY4?=
 =?utf-8?B?MW9Bc0hiTG1JRGFURlFsMGZmQjVoOS9SSldBZlZ2MWdmbUtFLy9YbmtQS2FT?=
 =?utf-8?B?Z2ttTHBObk5YZkUzZnMzNTJJUGJIVmwrSmwrcGttQW9FV1BnOEJtS2hLRDNY?=
 =?utf-8?B?QytldzNtWlV4dTNkaEN4dTVueFo1NFg3MExUT3NOOGw2b0w0ZFR0dTJFTThN?=
 =?utf-8?B?WUUwZWlNVkZTc1g5VkkwQm0vZHg2WXlyQms4SmtHYUsrYTVsN1ZFc0lpT1h5?=
 =?utf-8?B?UkJ5RVB4ckdvWmtLaS9ZVWlJWmU4aE9uVHpkNjZGbEQyRFQ3M1NDZHRzcVhQ?=
 =?utf-8?B?VzZmSVRLMFQ4WGxaWXdzSVdlckRZamlxbEFTdVU0eU9rUFdxclRrNjMydXo1?=
 =?utf-8?B?K205YURhNmNOWDBMdStqNU5RUmRwWU0rTW9QQkJhR3FGMnVjOTNobmMrdzM5?=
 =?utf-8?B?WTRvcG92eVNhamJMTjZLajlxUEwrR2tJb0RaN2xEeEduRGY5aThpOGpwNmda?=
 =?utf-8?B?cy95eGN2dnVwN0ljdUc3WHdwSHVXdFVmTTJEUktwUVYva0Q3MWcwWGVtbk1r?=
 =?utf-8?B?K1Bvc3pHVnk5TGxNeGYzYW5sREVkb1p2OHdoQnhXMWNETlRVRHFiek1iMHhm?=
 =?utf-8?B?RFFWMXIxTGE2RzFwTjdFRy9CSW5mVFN4SW5Wb3FTTU82VitESlltWHIrTUI0?=
 =?utf-8?B?RldmTXRjSmJtd0ZmNVVwNHhjTnFXc3FOL2V0S1k3bW9taHFPSVl0M3pyWGFz?=
 =?utf-8?B?UVJhTHhadkRYMnN3bGZtL2hydjdzV0hiL2RIL3hQQWd3Rmo3UndrLzB1QzBI?=
 =?utf-8?B?TklrWVAySDFTTElEZWsyZ2Z3ei8yNGs5L2FFL0dBVmtKTHZhYUZtZG1qM2Ni?=
 =?utf-8?B?eEdBeW5HbG81eHpDb2pwRlRMSG1TTy85UEZqbVJiVVFWYksvV0ROcEt2Nysw?=
 =?utf-8?B?ZXJMdXpQcVN2Nm1DdiszZG82NE1Vendtcm9GWDRmNGw0aER0NmlXT0dwR1Vm?=
 =?utf-8?B?TnZianlRSk1zNzNKbVdzcVJGbUNuN2YrbHhpMkUwVmtKdGVqS01MdXY0TVJ5?=
 =?utf-8?B?S1p3K1FYYnJRdFB4TEUvdng4TVZzaWVzQ1J5Q0hWV0M0RktyejNRLzE1VzJQ?=
 =?utf-8?B?Vk5GWStNN2h5TUh3RUhJZWpPL1VwVCt5aFJEaFIzdmxoR0lBRmgzNWlTanlL?=
 =?utf-8?B?TUNSajVNWmVETmc2K0Fxd3Rna3ZVZnpqaGk1NitTZUZlM2FXNUVlM0dPRkdN?=
 =?utf-8?B?dXI3MmwwK2MyRVFnT0t0VFBFbGVxMDl4RjhhVE9lN1FHVXNLQ0VGSW8yaXda?=
 =?utf-8?B?dDNYZGszem10UTVLM25ZREJtcE5Hd1kwZzAvN0tTRE80elFtb0VrMXk2dTQw?=
 =?utf-8?Q?4cDdVwbh2dYoOhAY5g2Tra/Fg?=
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB8470.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30295e7a-7689-4583-5c74-08dddc0ebcf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 15:16:41.3530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DvaMrgU8N1+BdfjhQIAkiQK7mbqA+zDJFxFWITAZBcs91AmDiVMq9CTMZeuNJLtyB9NXlPP+WeARPDQhc0VVRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB10166
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 15:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221976

SGkgTWF0aGlldSENCg0KSSB0aGluayB0aGF0IHRoaXMgaXMgaG93IGl0IGlzIGludGVuZGVkIHRv
IHdvcmssIGJpdGJha2UgZG9lcyBub3QgYWxsb3cgZmxvYXRpbmcgdGFnL2JyYW5jaCBhbnltb3Jl
Lg0KUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nIEBSaWNoYXJkIFB1cmRpZSAod2hvIGlt
cGxlbWVudGVkIHRoaXMgZm9yIHNlY3VyaXR5IHJlYXNvbnMgSSB0aGluay4pDQoNClRoZSBwYXRj
aCB0aGF0IEkgaGF2ZSBtYWtlcyBzdXJlIHRoYXQgdGhlIHBhcnNpbmcgYW5kIHNldHRpbmcgb2Yg
dGhlIHZhcmlhYmxlcyBpbiB0aGUgcmVjaXBlIGFyZSBkb25lIGJlZm9yZSBleGVjdXRpbmcgdGhl
IGRvX2ZldGNoIGNvbW1hbmQsDQphbmQgYXMgYSBzaWRlIGVmZmVjdCB0aGUgZmxvYXRpbmcgdGFn
L2JyYW5jaCBwcm90ZWN0aW9uIGlzIHdvcmtpbmcgYXMgaW50ZW5kZWQgYWdhaW4uDQoNCkhvdyBk
b2VzIHRoZSByZWNpcGUgbG9vayBsaWtlPw0KZGV2dG9vbCBhZGQga2VybmVsLW1vZHVsZS1oZWxs
by13b3JsZCBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2dpdC9rZXJuZWwtbW9kdWxlLWhl
bGxvLXdvcmxkDQpUaGUgb25lIEkgZ2V0IGxvb2tzIGxpa2UgdGhpczoNCg0KY2F0IGJ1aWxkL3dv
cmtzcGFjZS9yZWNpcGVzL2tlcm5lbC1tb2R1bGUtaGVsbG8td29ybGQva2VybmVsLW1vZHVsZS1o
ZWxsby13b3JsZF9naXQuYmINCiMgUmVjaXBlIGNyZWF0ZWQgYnkgcmVjaXBldG9vbA0KIyBUaGlz
IGlzIHRoZSBiYXNpcyBvZiBhIHJlY2lwZSBhbmQgbWF5IG5lZWQgZnVydGhlciBlZGl0aW5nIGlu
IG9yZGVyIHRvIGJlIGZ1bGx5IGZ1bmN0aW9uYWwuDQojIChGZWVsIGZyZWUgdG8gcmVtb3ZlIHRo
ZXNlIGNvbW1lbnRzIHdoZW4gZWRpdGluZy4pDQoNCiMgV0FSTklORzogdGhlIGZvbGxvd2luZyBM
SUNFTlNFIGFuZCBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBhcmUgYmVzdCBndWVzc2VzIC0gaXQg
aXMNCiMgeW91ciByZXNwb25zaWJpbGl0eSB0byB2ZXJpZnkgdGhhdCB0aGUgdmFsdWVzIGFyZSBj
b21wbGV0ZSBhbmQgY29ycmVjdC4NCiMNCiMgVGhlIGZvbGxvd2luZyBsaWNlbnNlIGZpbGVzIHdl
cmUgbm90IGFibGUgdG8gYmUgaWRlbnRpZmllZCBhbmQgYXJlDQojIHJlcHJlc2VudGVkIGFzICJV
bmtub3duIiBiZWxvdywgeW91IHdpbGwgbmVlZCB0byBjaGVjayB0aGVtIHlvdXJzZWxmOg0KIyAg
IExJQ0VOU0UNCkxJQ0VOU0UgPSAiVW5rbm93biINCkxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PTdiNzg1YmU2NDMzYTJlNGFmNmE2NDFjYzdmMDMzMGQxIg0KDQpTUkNfVVJJ
ID0gImdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2dpdC9rZXJuZWwtbW9kdWxlLWhlbGxvLXdv
cmxkO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIiDQoNCiMgTW9kaWZ5IHRoZXNlIGFzIGRl
c2lyZWQNClBWID0gIjEuMCtnaXQiDQpTUkNSRVYgPSAiYjY2ZjBmMmJkNTU5YTFkZjgxZmMxYmRh
MjQwZWJhMDdhMmVjZGQyYiINCg0KUyA9ICIke1dPUktESVJ9L2dpdCINCg0KaW5oZXJpdCBtb2R1
bGUNCg0KRVhUUkFfT0VNQUtFOmFwcGVuZDp0YXNrLWluc3RhbGwgPSAiIC1DICR7U1RBR0lOR19L
RVJORUxfRElSfSBNPSR7U30iDQpFWFRSQV9PRU1BS0UgKz0gIktFUk5FTF9ESVI9JHtTVEFHSU5H
X0tFUk5FTF9ESVJ9Ig0KDQpBbmQgaXQgY29udGFpbnMgU1JDUkVWID0gImI2NmYwZjJiZDU1OWEx
ZGY4MWZjMWJkYTI0MGViYTA3YTJlY2RkMmIiDQoNClRvbnkNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IE1hdGhpZXUgRHVib2lzLUJyaWFuZCA8bWF0aGlldS5kdWJvaXMtYnJp
YW5kQGJvb3RsaW4uY29tPg0KU2VudDogRnJpZGF5LCAxNSBBdWd1c3QgMjAyNSAxMToyNg0KVG86
IFRvbnkgUmV4IDx0b255LnJleEBlcmljc3Nvbi5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAwLzFdIGJh
c2UuYmJjbGFzczogRml4IHRoZSByZWNpcGUgcGFyc2luZyByYWNlIGlzc3VlDQoNCltZb3UgZG9u
J3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gbWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29t
LiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91
dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCg0KT24gVGh1IEF1ZyAxNCwgMjAyNSBhdCA3OjIzIFBN
IENFU1QsIFRvbnkgUmV4IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBJdCBz
ZWVtcyB0aGF0IHRoZSByYWNlIGNvbmRpdGlvbiBoYXBwZW5zIHdoZW4gZG9pbmcgZG9fZmV0Y2gg
b24gcmVhbGx5DQo+IHNtYWxsIHJlcG9zIGFuZCBpdCBjYW4gYmUgZGlmZmljdWx0IHRvIHJlcHJv
ZHVjZSBzbyBiZWxvdyB0aGUgb3RoZXINCj4gY2FzZSB3aXRoIGZsb2F0aW5nIHRhZy9icmFuY2gg
dGhhdCBpcyBlYXNpZXIgdG8gdmVyaWZ5Lg0KPg0KPiBUbyB2ZXJpZnkgdGhlIGZsb2F0aW5nIHRh
Zy9icmFuY2ggaXNzdWUgaGF2ZSBzIHNpbXBsZSByZWNpcGUNCj4gaGVsbG9fMS4wLmJiIGFuZCBz
ZXQgdGhlIFNSQ19VUkkgdG8gU1JDX1VSSSA9ICJnaXQ6Ly88cmVwb3NpdG9yeT47cHJvdG9jb2w9
aHR0cHM7dXNlcj0ke1VTRVJ9O2JyYW5jaD1tYXN0ZXI7dGFnPXYxLjAiDQo+DQo+IHJ1biBjb21t
YW5kIGJpdGJha2UgaGVsbG8gZXZlcnl0aGluZyBidWlsZHMuDQo+DQo+IEFwcGx5IHRoZSBwYXRj
aA0KPg0KPiBydW4gY29tbWFuZCBiaXRiYWtlIGhlbGxvDQo+IEVSUk9SOiBoZWxsby0xLjAtcjEg
ZG9fZmV0Y2g6IEJpdGJha2UgRmV0Y2hlciBFcnJvcjoNCj4gRmV0Y2hFcnJvcigiUmVjaXBlIHVz
ZXMgYSBmbG9hdGluZyB0YWcvYnJhbmNoICd2MS4wJyBmb3IgcmVwbw0KPiAnPHJlcG9zaXRvcnk+
JyB3aXRob3V0IGEgZml4ZWQgU1JDUkVWIHlldCBkb2Vzbid0IGNhbGwNCj4gYmIuZmV0Y2gyLmdl
dF9zcmNyZXYoKSAodXNlIFNSQ1BWIGluIFBWIGZvciBPRSkuIiwgTm9uZSkNCj4gRVJST1I6IExv
Z2ZpbGUgb2YgZmFpbHVyZSBzdG9yZWQgaW46DQo+IGhlbGxvLzEuMC90ZW1wL2xvZy5kb19mZXRj
aC4zMjg5OTMyDQo+IEVSUk9SOiBUYXNrIChoZWxsby9oZWxsb18xLjAuYmI6ZG9fZmV0Y2gpIGZh
aWxlZCB3aXRoIGV4aXQgY29kZSAnMScNCj4NCj4gVG9ueSBSZXggKDEpOg0KPiAgIGJhc2UuYmJj
bGFzczogRml4IHRoZSByZWNpcGUgcGFyc2luZyByYWNlIGlzc3VlDQo+DQo+ICBtZXRhL2NsYXNz
ZXMtZ2xvYmFsL2Jhc2UuYmJjbGFzcyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpIaSBUb255LA0KDQpUaGFua3MgZm9yIHlvdXIgcGF0
Y2guDQoNCkl0IGxvb2tzIGxpa2UgdGhpcyBpcyBicmVha2luZyBzb21lIGJ1aWxkcyB3aXRoIHRo
ZSBmb2xsb3dpbmcgZXJyb3I6DQoNCm9lcWEudXRpbHMuc3VicHJvY2Vzc3R3ZWFrLk9FVGVzdENh
bGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnLiAvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIv
cWVtdXg4Ni02NC9idWlsZC9idWlsZC90bXAvd29yay9xZW11eDg2XzY0LXBva3ktbGludXgvY29y
ZS1pbWFnZS1zYXRvLzEuMC90ZXN0c2RrZXh0L2Vudmlyb25tZW50LXNldHVwLWNvcmUyLTY0LXBv
a3ktbGludXggPiAvZGV2L251bGw7IGRldnRvb2wgYWRkIGtlcm5lbC1tb2R1bGUtaGVsbG8td29y
bGQgaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9naXQva2VybmVsLW1vZHVsZS1oZWxsby13
b3JsZDsnIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDEuDQouLi4NCkVSUk9SOiBCaXRi
YWtlIEZldGNoZXIgRXJyb3I6IEZldGNoRXJyb3IoIlJlY2lwZSB1c2VzIGEgZmxvYXRpbmcgdGFn
L2JyYW5jaCAnbWFzdGVyJyBmb3IgcmVwbyAnZ2l0LnlvY3RvcHJvamVjdC5vcmcvZ2l0L2tlcm5l
bC1tb2R1bGUtaGVsbG8td29ybGQnIHdpdGhvdXQgYSBmaXhlZCBTUkNSRVYgeWV0IGRvZXNuJ3Qg
Y2FsbCBiYi5mZXRjaDIuZ2V0X3NyY3JldigpICh1c2UgU1JDUFYgaW4gUFYgZm9yIE9FKS4iLCBO
b25lKQ0KDQpodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9i
dWlsZGVycy82OC9idWlsZHMvMjI4NA0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qu
b3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMzAvYnVpbGRzLzIxOTkNCmh0dHBzOi8vYXV0b2J1aWxk
ZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzE2L2J1aWxkcy8yMjQ3DQoN
CkNhbiB5b3UgaGF2ZSBhIGxvb2sgYXQgdGhpcyBlcnJvciBwbGVhc2U/DQoNCkJlc3QgcmVnYXJk
cywNCk1hdGhpZXUNCg0KLS0NCk1hdGhpZXUgRHVib2lzLUJyaWFuZCwgQm9vdGxpbg0KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KaHR0cHM6Ly9ib290bGluLmNvbS8NCg0K

