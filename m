Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABE5CD4846
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 04:27:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3422.1778732863880842739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 21:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NSZd9ckM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9594c54527=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E3e2tA3138360
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 21:27:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=r0i/FG9Dx8AtThYUI5HoQeKP8/h1wa860hK8ecnMG9Q=; b=
	NSZd9ckMlqaDkRAVUCryRD/Pje6uAl1OOuRSc4qsFKp8924T3GE1HiXmIFT64fqH
	OTWEAiYYszecomrRlr4ZoPZqBpsIrqoCdfvW27ANYJruqo0pgsgjb4iKG6nxhJ5Z
	G/ZRnIJGd3+1Cw/71ur+eOkhIGH/7tFcn4cqsN5NFiV/bDWaqpnWSrtH/sm0TRNk
	9JafXjLJYI46jkk4SEpH5TOk0AhA339LsDodrD/H2yOgl+T2dtQB2WmwzDsQ1lLY
	Vo4iZP6NIEq8FIc+zY6IieXxp6U9no/gwQAxypmT1M7fwzPLFDOG4mvqZp8ZfhvR
	oESWj3mm9tTXCdrMti7U/g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftb9s52-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 21:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzy7CO3LL07eHf4pOS5SKNWMk++2TRrzhTpvTqeyt38EqUo128wG74VHX+CHpVpnDmSr+oEGdjrsoKz3hIRSN7qEjRmfAbRs+MwkFJbxUZmXwPXOwH7CVh+rlhgvprdC4afI/fn9UEQtyeZk9lIxCJtj60jLM5QlbeonygaDpR6gz4VTGUfq8oi+58uWOszrRGh/Vg0eMRf3A+tr3FqWoVc2JAOZ0Oe9zfdkyxY0JwU5nO+64zrIFYzCE6o3aa1BWahDRn1R5C48WprWxmwj8auDvqxkGCyhW91Mw4siEDjacZNH32DA2yXVYjOoaGH67z8eG9ogfZCyvWIrC48pNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0i/FG9Dx8AtThYUI5HoQeKP8/h1wa860hK8ecnMG9Q=;
 b=XC8v6XHZ6CzM+ZNdnVVKZ5yk97I9++utBEMA0B7NfZGHkOXWoSGHGn0rt8AFTD+XRdjO+VrQyKsMlQfkmALTQJcnJjn8UwA8o3NhzM8BD46XCaNTm4qE3oDYQhos1SkRbJz6xxxIvV4OnVkr0uJ513VLpHP3qhV5yv1eUxBZlMCLAClqgsvoInLPT/Vy7wA1O6389FvKHcGCxyfxa35njYjULcrjDi/04Wak55s92r5lVY4aN+crBm5tpgiVrsUpFbV2qCltU2xyKHtkt0UXSSCTQNKuRV+LdSVnTvXOEUkl1ZohGuk5ejLV/Si83AvfdGpi5+YzedD2AeTk/1Y3Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS4PPFD667CEBB6.namprd11.prod.outlook.com (2603:10b6:f:fc02::53) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 04:27:09 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 04:27:09 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Daniel Turull
	<daniel.turull@ericsson.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [OE-core][PATCH V5 1/7] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
Thread-Topic: [OE-core][PATCH V5 1/7] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
Thread-Index: AQHc4pivOTgwapHFn06Ei6BhV7xNuLYLso2AgAACXACAAAIogIABNVhw
Date: Thu, 14 May 2026 04:27:09 +0000
Message-ID: 
 <CO6PR11MB5602AEB62C2B5C3C73CB782CED072@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
 <CANNYZj9EA+69R7FCj4WH3MB0q9kCv1HQdCU800uomD0hCt3K2A@mail.gmail.com>
 <PA3PR07MB10721F47BD61474678F5A4A1E8A062@PA3PR07MB10721.eurprd07.prod.outlook.com>
 <CANNYZj9RyQrfr3BULHanuaUSsp2WgfTjFEb3tfzvXwfyPYALZQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9RyQrfr3BULHanuaUSsp2WgfTjFEb3tfzvXwfyPYALZQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=e73b9747-2315-4985-9bb0-9426aaa3b44c;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-05-14T04:19:06Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DS4PPFD667CEBB6:EE_
x-ms-office365-filtering-correlation-id: 896084e9-387f-49e3-a995-08deb1711014
x-ld-processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|11063799003|38070700021|4143699003;
x-microsoft-antispam-message-info: 
 NPuTmPcBsnyiB5pdSK95FzdtQUGR78rUvxOg8zoVGlAG0awq5irQcNOPaY1uZkMDkdGkJQVIVa8PrZNKW8a769kUVkye1U6qgqDhlTWMmkBJ1S6LOz1VZsHVaUU0gSI0JjxVVU/LE/Nk5XiUN3iww8SjTv+ssycZr9ggoWbbVEBJJQGX/N0ie8fq1sR1arwlJhl4DIsfl0LWfDdNgQoqDUdEU2IBhDb3TGj6WYkffw3nGhv5hExG8/KnguXj5cVDYj/0B3dPuqx7JU45797p9KKUMqLcPGvNiWEOAHAVJhHGpPCJDoSrJ1EMm6Z7rwOwKJZUEbCCWWLblN1jfoY7/yXlFF2ZA2UvHIhpPAaCuKXEKQS0UdoLLMxi7uGr50D5JtbrqRZyEMJu1PXcaiv3t+QI2qLrjY5u7vkIZkFT6sGEQ7eAt+EiRjk5CZbklugs2uo1wp0kioyKmxw3L1K7WsmumRJXPs2+5wKbE6YpqoUtut2own/fRhIF0vsrVz9dGAgBQl2svg/f1idaBkQmIV44B7IoTD3IMuhbONJfWmhh6A0rofQLw9MtYBvMCRzYKUjgNV0wTGhJha1+FMoJQTvzXhd72T0eOZPBbaeT7+wkePiNAzKQjL7B1fPp3PcKoNJ/njdRSZ37i4mQoapi1GZOI4baQmIjf8QgkjhZfELBqxq5w8s8gE1CYNAhXhIWPQkpnPmp8SeUtz1NzOvYoZPvS8GTpTjMPF5WMCYGKKf2CKtTvPnZojxJ+QtHBg/X
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(11063799003)(38070700021)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UWVFbEtORUVPNlo0eWVnSjBpWUlwQ01DeEwzLzJVZkg3ZitVRGNLQ0xmQVVi?=
 =?utf-8?B?NWVVSzFoR0o4SUd6WlhMc3J6MWpGQkJVU2htQnFwZXBleVhSaVFRRXBHWDd5?=
 =?utf-8?B?MkhlbkM5TXpNbFN0YWRhM05GdW5pOW1jZlYzcnlHR08vSEpRUWJXeVNMNDMz?=
 =?utf-8?B?V1JXbUI2akMrQS85WVdIVzRjR0xUNHVsdG8yYUFoK3QzcUZaY21lWTkzQWNS?=
 =?utf-8?B?cXR4dWVLWEVzQlFoQTFvU3I0Qy83MkR3V1dYT0trYkFSZTRBUzNjbmRqWEYv?=
 =?utf-8?B?dXpuaVFtcWhQNUlIRWJ6THNLMFd4cFJpQ1BBY0Fza1VXc3ZSSWtaRm50SWhm?=
 =?utf-8?B?WG83Mi8zYmRXUWxTd0R2NEdBbmZwbk90aVNIbDFZdlJ0TlIxOHdDUGlxMWVp?=
 =?utf-8?B?cWZJNzlYWG5RSGhvNGc0OEg3Ukw4R3lsU1dENWpqRmpJOEpUNXNjMVpQSlJQ?=
 =?utf-8?B?clZISWhJYmlqbDFlZ2NkK2hFa2VQWjMwcnZJT2YvYm50WFNKYkhJMFlrSTdL?=
 =?utf-8?B?Y1lzUXhLeHVpbHlYV3FjTHBnSlJRYTZBUTVmb1JtQyt1UVl5T0wwemxUTzlJ?=
 =?utf-8?B?Tk9KR3RiM0ttM0RaMkc5TUZZdzBZekloek9PSmZEODZGK0xmdURkcjIwRkhT?=
 =?utf-8?B?SFVrbW0vditFWU5tMXc1Q2NOVnI3T3JQZkM3Nm0yMytBOEd1ZUh3azh3NDI0?=
 =?utf-8?B?T25DOUVtSkFLTDFDTVJ3MTljU040eHJHTlhJSzhhckhYZ3NUQnFQRjB4bTg0?=
 =?utf-8?B?Yzd5d0ZvQXV0YWtPZkhVcTE5UHI1aWpRWElUbWpJbWNHemxVenVvaVlKczJh?=
 =?utf-8?B?QzRUWG5Sa1d4YUhFTXBGYm4xNytuOS9PamFlUzlRN00zVDF4T1g4WWlYenRE?=
 =?utf-8?B?YWhNU1dYSVBCcE1WVG0yQmpSVnpFTFJEVW4vOTc2MmhBeXNKV3JMdmZSSU9M?=
 =?utf-8?B?RFBabzkwRlN0SHFpUFRTa05rRmxxWktLQ0NQTnllOC84a3AzSE8zaFMwWlpB?=
 =?utf-8?B?dGFqeENEWmNLNDVBZytsYU80ZG5lRmluRHFwa09GSGU2dnJOUW40VlI1Z0xS?=
 =?utf-8?B?ZVk2ZjF0TGNvajdKbVdiNUNra0MwbjdJbXEvQTJuaWwxOTZzRUNOQ1d3cExD?=
 =?utf-8?B?WmVDdVJUelJoNW41Qk9GWHdqMkF6OFB0dms2OUNFcWtKUDQ2WlAyZ0gyVlRh?=
 =?utf-8?B?VE53NlhuVHpCQ0tuZFgzb3g0aWJnUS9OUXM2emQvT1ZENjZEUGhnRUVKSnhR?=
 =?utf-8?B?V1FhNDNNV2Ixd2pmSWxUWHJ3NVd0a09WZGdhbThkUDVYekZxOG1GaG5NalBT?=
 =?utf-8?B?b1NtSXVlb1RhZC9LL1hpOThGanJmMXZaTTR4YTVWTk43TWRYUXlBbWZYQ2JO?=
 =?utf-8?B?SjdUSmxLNVJJZjM4ZzNISEk3RG9tMzIzajVJa0NOOHRZQUd5MmtyTitKcXR6?=
 =?utf-8?B?MzVDeXROQnRyYXJra3Vha0phMS91US9LcmpoRHNHNFpDdTZST1lremMzMW5J?=
 =?utf-8?B?aFIwQjQ3MzZkUVpHUklhbTl6QW5zTVVJbTNtYjZoT2dTcjMxZmg2YXBuLzVk?=
 =?utf-8?B?M2NrZlU2WU1IMitWampISW5NckxxTG9NYitDUlBsZ2pZZy9XSEFWM2F4MjVm?=
 =?utf-8?B?elpBZWhKMTB0SEk0RTlSNkhzOWtNejIyUEVTWURxYjgvNnNjY2RKeDFuSzBp?=
 =?utf-8?B?QW1PNXRjRjFzRjRZVGR0V2ppMk5MQXpSaktNWTNTZU04WExqQmRjRjE2M1NN?=
 =?utf-8?B?OEd6dFl2ZVhRcTZ0eWplcENJc1dUckVyTHlpdmxNYmhjZSttNG14TmVucURr?=
 =?utf-8?B?NFVJSjEvR0x0b2c2VGQ0eS8vN0hYQisrZ0tET0VqNjlBc0F3ellyRkE3RVh1?=
 =?utf-8?B?WFMrN3gyS1Iyb2pKOXhXdzRES1RGV05WdzFsSTNwSHlZN1pQNnprUFNRNWsy?=
 =?utf-8?B?eUtxY3Bhbi9Yd2FXazZuV242WHRRWUJPU0NCL09uTW5RSjlySDRmaURxdHRF?=
 =?utf-8?B?WTVCamlBY1pSNVcrUmQvVTlGMzJIbEJkRDg5K1JpdVp2RXdQcUIva0pISUE0?=
 =?utf-8?B?ZzFSSDhSS3lDL0lZb25vMjJWanpJcFBKTy8vNDYvb1E4RCtzZ1N3MHNZZWYv?=
 =?utf-8?B?MDVja2Z6NThyRDRKZTV1SFJEOVlHa1EyNDQ4b3dzOHBUTkhET1RITmwzdlVj?=
 =?utf-8?B?T3E2dlp6c1NnQ2pRZkJ4UkM4T3ZCZVcycUo3a0tSNXpsWkkyckZNYzY2V2dF?=
 =?utf-8?B?NER5VGRpWE94dDZOQjVPOUZlMVJTaFR4aE1DNURyY0JCQks5MUJXMXd3aUdr?=
 =?utf-8?B?WSsrM3ByMnlGcHozZHFtS1BZeWQycTBSUm1lRzA4aE15UGFRTXIzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	rsv84IIcq3UvjGrcpaBtD6zup/hyJiMetmkS4nqIgiV3VqCAp5rSu4SOdw7nWJ9ZnzseZxt5RXRga7fo2pzRjq23T4hdm/4Rlon2eub4Is1EUZs2IeTeRXqSnIMb2M6A7dj8iMXi2PpAnmlXYchUfM+kGQPobZQ46G6TlmObwk1t6oyhd3ayzAYJZcyCzRPNoIBEU85Cbaugl+JBAqeyAiADPAPNog7N0Fe1g+63pWbjxi0gagUR1eF2N3C/wLqP64BpJbkaDJo8BYWaPRDz9BoyeuS7rs583yaPQ4onslnIA2wk5sFWNsqeEOtf6ehDiJN1CJMrAtqpxD/Sazoc7Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896084e9-387f-49e3-a995-08deb1711014
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 04:27:09.1932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1U2hyv/Mq8pXKgr2+k+xXIzSrdZd6MCNKF2P6dTK+IEsmWw5gzHt6/zYsh9EwoQK0ngKf489VfBV8u4UrrK/ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFD667CEBB6
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA0MCBTYWx0ZWRfX8Y3klh9+DO3N
 y3Q7xda4W8wVOCMNt8i3/x/mMYirQa/UpP9TuzmXPolgLb565/lyRSGN7uZmYKL0G62WmORJlzj
 H+cBxA5bK/Q2hHXO/Mk+VBMHoHFc2WFIvRxQbQDScr5FMYqjB1scfKiH55elzG3dsVs8eFNcH01
 +Ijw2fUjKR74SFuD2JFNln8dJ6bBN/cQ7kGHiftzrS+uZRAF7JSxNczHEgY2mg5e2CfjdTB8sM9
 6I2EitWZfzTcqSYt1zIQzcdHw07+NhUjYm4LJ6R/xSx/AVBqsO7ato7qWNZGcekRuJ96+DLPF21
 DBUftmcXcUM2TCSkfTVM3SEOwhjWMPZaEypIJIVVajW3fCRYnBJvBKi0lF7wlrBfwK7quhOl9sU
 GvKgaLYt7nVP+xO4kuazf8FoR8nkAzrCqf4iCn6iUlo5PTkMX1urr27O+sTA9zi6JgmGnnib0pC
 zk+CitolMr0ERbnw4Hg==
X-Proofpoint-GUID: TCvABy9HP6AiPpEsqF-ng6rOfPpPVFZf
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a054f3f cx=c_pps
 a=zLftBE+EtYxwi/BgDV84wA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=0FD05c-RAAAA:8
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=PI4YrQu5FRbpXd8dZIsA:9 a=QEXdDO2ut3YA:10
 a=l1rpMCqCXRGZwUSuRcM3:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: twzbN-q8YE5oymUP7apG2VJ0O4uM8Vf6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 04:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237015

SGkgRGFuaWVsLA0KDQpJIGRvbid0IGhhdmUgYW55IHN0cm9uZyBwcmVmZXJlbmNlLiBJJ2xsIHJl
c3BlY3QgVFNDJ3MgZGVjaXNpb24gYW5kIGlmIHRoZXJlJ3MgYW55dGhpbmcgdGhhdCBuZWVkcyBt
ZSB0byBkbywgSSdsbCBkbyBpdC4NCg0KTXkgbWFqb3IgZm9jdXMsIGFzIHJlcGxpZWQgdG8gQWxl
eCBpbiBvdGhlciBlbWFpbCwgaXMgdG8gZ28gdGhyb3VnaCBvZS1jb3JlIGFuZCBtZXRhLW9wZW5l
bWJlZGRlZCBvbmNlIHRoZXNlIHBhdGNoZXMgZ2V0IG1lcmdlZC4gSSBleHBlY3QgdGhhdCB0aGUg
VVBTVFJFQU1fU1RBQkxFX1JFTEVBU0VfUkVHRVggbWV0YSBkYXRhIHdpbGwgYmUgaW4gZ29vZCBz
aGFwZSBpbiBvbmUgb3IgdHdvIG1vbnRocy4gQW5kIFlvY3RvIExUUyByZWxlYXNlcyAoZnV0dXJl
IG9uZXMgY2FuIG1heWJlIHRoZSBjdXJyZW50IG9uZXMgaWYgdGhlIGJhY2twb3J0IGhhcHBlbnMp
IGNhbiBtYWtlIHVzZSBvZiB0aGVzZSBtZXRhIGRhdGEuDQoNClAuUy4NCkkgc2F3IHRoZSBjaGFu
Z2Vsb2cgY2hhbmdlcyBhbmQgSSBsaWtlIGl0Lg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgTWF5IDEzLCAyMDI2IDU6NTIgUE0NClRvOiBE
YW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCkNjOiBDaGVuLCBRaSA8
UWkuQ2hlbkB3aW5kcml2ZXIuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZzsgTWFjTGVvZCwgUmFuZHkgPFJhbmR5Lk1hY0xlb2RAd2luZHJpdmVyLmNvbT4NClN1
YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggVjUgMS83XSByZWNpcGV1dGlsczogYWRkIG9wdGlv
bmFsIHN0YWJsZV91cGdyYWRlIHBhcmFtZXRlciB0byBnZXRfcmVjaXBlX3VwZ3JhZGVfc3RhdHVz
DQoNCk9uIFdlZCwgMTMgTWF5IDIwMjYgYXQgMTE6NDQsIERhbmllbCBUdXJ1bGwgPGRhbmllbC50
dXJ1bGxAZXJpY3Nzb24uY29tPiB3cm90ZToNCj4gSSB3aWxsIGJlIHByZXNlbnRpbmcgaW4gTmlj
ZSBodHRwczovL2dpdGh1Yi5jb20vTm9yZGl4L21ldGEtYmluYXJ5YXVkaXQvdHJlZS9kZXZlbCB3
aGljaCBjYW4gaGVscCBhbHNvIGlkZW50aWZ5IG1vcmUgY29tcG9uZW50cyB0aGF0IGFyZSBnb29k
IGtlZXBpbmcgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4gSSBjb3VsZCBzZW5kIHRoZSBsaXN0IG9m
IGNvbXBvbmVudHMgdGhhdCBJIGhhdmUgaWRlbnRpZmllZC4NCj4NCj4gUWksIHdpbGwgeW91IHJl
cXVlc3QgdG8gaGF2ZSB0aGlzIGJhY2twb3J0ZWQgdG8gdGhlIFRTQz8gT25jZSBteSBkZXZ0b29s
IGNoYW5nZWxvZyBwYXRjaCBnZXQncyBtZXJnZWQgSSB3YXMgcGxhbm5pbmcgdG8gcmVxdWVzdCBp
dCBhcyB3ZWxsLiBUaGVuIHdlIGNhbiBoYXZlIGEgcG93ZXJmdWwgQVVIIHRvb2wgdG8gaGVscCB0
byBtYWludGFpbiB2ZXJzaW9uIGluIExUUyB2ZXJpZnlpbmcgYmFja3dhcmQgY29tcGF0aWJpbGl0
eSBvciBmb3Igc2VsZWN0ZWQgY29tcG9uZW50cy4NCj4NCg0KSnVzdCBpbiBjYXNlLCBJIHN1cHBv
cnQgdGhlIGJhY2twb3J0LiBUaGUgY2hhbmdlcyB0byBiaXRiYWtlL2NvcmUgYXJlIG5vdCBpbnZh
c2l2ZSwgYW5kIHRoZXkncmUgaW4gcmVsYXRpdmVseSAnc2FmZScgcGFydHMgb2YgdGhlIGNvZGUg
dGhhdCBhcmVuJ3QgdXNlZCBpbiBjb3JlIHdvcmtmbG93cyAoZS5nLiBhY3R1YWwgYnVpbGRzIGFy
ZW4ndCBhZmZlY3RlZCwgb25seSB0aGUgdmVyc2lvbiBjaGVja3MgYW5kIGV2ZW4gdGhlcmUgaXQn
cyBiYWNrd2FyZHMgY29tcGF0aWJsZSkuDQoNCkFsZXgNCg==

