Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0AACA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 18:30:13 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.48])
 by mx.groups.io with SMTP id smtpd.web11.1459.1755887404160522212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 11:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=WOLAigiR;
 spf=pass (domain: axis.com, ip: 52.101.72.48, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thlK8Jtj/t2auhFvRzpSaI1xhHWEt91QctWAFdsOvEM3rNNN8/1prvLquSPjMxcaoCqcNWsRpMWnwMGgYmP1sgZcL6oUbyC+3AFxVDtedazTiubmn1ko40DDUYT4h0/QroRnliyRzlH2bimoFdRTwuwB0VBl+sF2L5t2tWZau5E9tMZjU6Tdrbu6KSBRDUNrGu9JzmGK/H5PRXRduGBTxDuiWiPwuf0Skel8l7dN7TZwGFriCeC9jFN/C6PVeWW6Gml2JhsJ8VSYHG2gKaNtHMPaqa6xUEruiWUZwM9W/ZykTWspYIpBSUg1/yeO4SXGjtb0Y8lta4WfklbGYrqqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfCv0+E9Nt2HtnBS4dXt3n96ffcZ9WO7l24LdYj1XIA=;
 b=p0Y8rN1ZSwvsCwxFXJN9zJwNYevIP4wfkfu957fCHTZFms02lr19JM08xK2psS5kkMDkeoAe+qwDkM+zaTi4rXEorIwZUQDRQ7cas5slA9gwu9URdM39Txfjc54KkueGXGCX081663lTDpXhJmS82Zusu49XeEo7PEtwvgkShyRba3VH4Bc7PBdwND0DpUG5m/95vlnfM/vdvJgOyYMb8BUAqgAAIe9ehswRjFlDRU/c+rv9PcNfQy3j3QYseyenpKb5l7g1pAnaLTro2ahPzkcbKskfWPlGo/MyevfSAfp8+femNQYe1aEct8vj2YPUK62b5qbXccfB09Jof+/SHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfCv0+E9Nt2HtnBS4dXt3n96ffcZ9WO7l24LdYj1XIA=;
 b=WOLAigiRpQYaYGi5NStqKtiyDeP788biIDUJRk9a3LsSGABIBHJMACApxfQISy9bjF3SFkliMjBjMASAwHRuDKJh4x8bGwZlmniBf0I/+qe2p72Kv3Cyx9IjBlZQsrPJ7WNWyTXtWqk4SRhUJYX2YnGC+MUkxQ12R7i5TZpjH5w=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by AS8PR02MB7785.eurprd02.prod.outlook.com (2603:10a6:20b:440::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 18:29:55 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb%4]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 18:29:55 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCHv5 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Thread-Topic: [OE-core] [PATCHv5 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Thread-Index: AQHcEmY0Br+4kD+V/k6A4KFaUq2UjbRtNMtggABHXACAAYI90A==
Date: Fri, 22 Aug 2025 18:29:55 +0000
Message-ID: 
 <AS8PR02MB10201B91F7032A65E7A8B98B5EF3DA@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20250820134202.1412477-1-pkj@axis.com>
 <DC7WDGGBK31E.2TP4Q7QNVM9A1@bootlin.com>
 <DB5PR02MB10213ECD00D7E7E9E3F32E155EF32A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <DC8CK0MD1K25.3IXGO4UM4FRLI@bootlin.com>
In-Reply-To: <DC8CK0MD1K25.3IXGO4UM4FRLI@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|AS8PR02MB7785:EE_
x-ms-office365-filtering-correlation-id: ed04286a-71e3-4505-908c-08dde1a9e47f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cGduOUdjaGFoS2YwNFUyTlducmNta251NWtmcUpLbEtTODBSeEExRURMampj?=
 =?utf-8?B?UlZtWThCZXJMNDEyT2tJVUxTSHRlcmVpUTZ0SXlveWdmNFZ4THBnRitlbnps?=
 =?utf-8?B?dGU4NnZFR2lLWUE1ZTlxdXM5cmRER2MvcFppaldTNkZadlpJU1NkNk5EU293?=
 =?utf-8?B?cU1xU2Z5eG9CUU9vZGZYMDIrS012Nk1ZS0FyYXJVSWIzS3g5NUhwa2hmKy82?=
 =?utf-8?B?a2ZiajB5NkphR3dUMjNBb0JQMHlNREhRTGdsZmtVZFdSM1locE5FVXdlZ25r?=
 =?utf-8?B?RThkN1ppL3lFUUlIdWJzeTJlMFRrcml3eUJTRjVnVzB6MWo0RC9hWkh0Vncv?=
 =?utf-8?B?dklrZURiVHhiV1JLMlVFWENVTk5yVGFDRCtCdnVCZS9tMFh1eU1PZ3VxU0Z6?=
 =?utf-8?B?R0FVczFZQ0dLRG4rRlBjYjd0OVlqTnZDaXFEZzYybnVHeDN2QldaQnI3amgy?=
 =?utf-8?B?Q090WFEzTDJleHN3ZFptdVk4NGwzejBoUkdEc1JNRzkzcldGQXJNcTYwZ05Y?=
 =?utf-8?B?YkdNdThSK0IrSDJiU3VoWXVLNkYzQncrUDVWR3pBMVZlMklvYW9icmcyTGxB?=
 =?utf-8?B?MWRob0JmZ2trZUJPTFF0SHRvbmZFQnlPVzRuZkJzKzZLY3lxa3VCQm1HaTBF?=
 =?utf-8?B?ZGovdEFMSWRoYk5kV09MdGlNYjZsNnpESnJOSmd1RDJzdy84dy9TM1lXbzU4?=
 =?utf-8?B?dVl5MU5kYkxaNks4V0pGZ1hDaVhwV0Z1enJRbHNUVzlrNVp1NVZyZ3ZCVjlN?=
 =?utf-8?B?ZlhXQmZPYjJCNjE3aGUwQmUwdzZYU0kwUTVWSE1XY0tuK0VpQjdqVTc2ZEw2?=
 =?utf-8?B?bGxUWVRXYTRPMEUxSFRMVVFRYmJXRnlQcmoyTEdpTjg4M3l0ckM4THQ0OUNV?=
 =?utf-8?B?L1F6bkNvU3kxSUlmVG8ySzBnNHgvNE5jblNEQmplbGJsL1JnMHphbVNxZUJo?=
 =?utf-8?B?U0VBaU1TdFpRd2JQaXdMcm5namplRlV1STZvaVFWbnJkZDRWSVJlWm1rdDB5?=
 =?utf-8?B?ekNqbzhRVjJhTFE3ak9QdUFkdDk2SjQ1Rk9NZHQ0emw1aHQxZFZFMVpGZ0x2?=
 =?utf-8?B?cmc3ZnJkcXNFTGVUWG8wWmhXeS9ad0xnMGtWNXpHR1B0SENTdVZxRTlBeFdD?=
 =?utf-8?B?eTgrckRJem83KzB4c2lGVW5VdDFORmpXdGZFZVN0WWNaVW8rY0szWjNtaHpU?=
 =?utf-8?B?OEV5OW5iVDloU0VwVjNJNzRjM05rWTY1NW9PTnFLaGViTmQ3NTY4dHVsK3kr?=
 =?utf-8?B?OStTZnBWOWkyMlpvSTd1ekVPMnBPNThoV2g1ZEJoNTdlQUtaQUpzVllpMEh1?=
 =?utf-8?B?NGlBeEdiaS9CTGtSMVgzeFVwdTlSOElBK2wvNHVZV3A5eFdpKytyK1BhVGVK?=
 =?utf-8?B?ZkJSUGdHK2Vtb0JXUXg4YXlTaEVVT3Zkak5TM2tjdG92MW1XMm5DR001Vy9t?=
 =?utf-8?B?RHd3OTZYUXRnY2RkZ0F6TWxQUHJpY0FqM2xJa2FWUDR0YzVadlpMaGpsbTZP?=
 =?utf-8?B?aEg4eXlOS2l5K0RTMmoxYnJIc1dDL0o0VklZU2o5WnlYZThkRmlqL1V6VDZV?=
 =?utf-8?B?KzZMZURXcEZRN0FEZEp4b3Q0NkJ0WWZtczVGbWYwNXVtK2QrWEtVdVcyby93?=
 =?utf-8?B?eGptRFRRYm1icmtEclAzU2NuejNZY1gvL1hTOXR1RjRDYzhNZERuVXRqK0Fy?=
 =?utf-8?B?YTlBUHZDM0RGWnQwekVHRENyUDJ2aEtidWdnUU5JaG85N0l3ckJpRTNodUVr?=
 =?utf-8?B?R2dkenpHNnF6WGhvT0dYajZTVzgyVGxPeTlJWVViblUxU241cjJXQzVucjZv?=
 =?utf-8?B?RThzUTM4L3IrZXROY3V2YmRoS2Y0bXhROXVpNGIvMjlHTjZWems2Q1duYkFD?=
 =?utf-8?B?SHMvRVhtaVR2OElXWXZwcWhaSEZzUERxbjZLR0hBQ0VZSFRCWDJzZGx3M0ty?=
 =?utf-8?Q?IgaKcfGYNvE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bm96OExBdWpzSWdxeDV0L0VmUWdPT21hbkV4R2I2RzFyUGJjYllidG5XTjdF?=
 =?utf-8?B?RU5rWlFxSUpaR2ZOelBKd1k5akYzaVd6OXVHVTE1Wk56QXMyZE15RWVzTzJv?=
 =?utf-8?B?VVFlWEpJQ2duM0lDTzJCSjZZVytmT0VPRExoTFFHNG5WaGRrZTJkU2JUcGFR?=
 =?utf-8?B?eWRaQnlRSmJCTE1TQ3YxT1ZqcWM2clZ1V0RTamVIYkNxUHpieFplRVQxSjBK?=
 =?utf-8?B?RWZ3cHpka0JSajFoTUU5OG9lY3B5clN3TjNiRHVTNHBCdXJVK0ZGazRQTjVx?=
 =?utf-8?B?dmlaamIyNXkyRlBpcDcrZVRYTGFpZHRiQWpvWUE4VXdVUFd1NzdtUnlUU1Qy?=
 =?utf-8?B?M2lXVFVXdVVhdTh4cmphakJvNkxibHJ5eDFGSWhsU1lmOW1CMGU4ZVlReTBT?=
 =?utf-8?B?S1NCUHcrNHIrUS9VTjBqdWhjWXBtdldvakxva3NWOGtDZlE2MlFybGNXMmdY?=
 =?utf-8?B?TjY5SFlGdzgyQ1dWMHBLcXlabVJoeS9ra3NySiswNEJPWmw4UjF5bk00d1VF?=
 =?utf-8?B?eTQ0dVpEY3RTL2lqTCs5SFhycHZtY1o5ZndUeXZhN1VZMmEvL1d2UVdWMGh2?=
 =?utf-8?B?SHVtTHQ2VHk3Ukc2c2ttVzNhdHNVcytJaWxMTTlsdUxGK3lZellaSzJJOUlx?=
 =?utf-8?B?NWc5WnNmZlhaSmZlMXZOcWtlSllVRXJhNDNDY1o3K1VXWDZUMElRbzBoZ2g0?=
 =?utf-8?B?cnlYWWRuQVpROE92ejJDQ2hpblY4KzBMcy9ublkwNnlIUWNtem8wQTNrOEVk?=
 =?utf-8?B?SitmUjFJQ1hPaFdkNzJVQStMK2pXekhmOUkyTkF1YnppSkczVTRzYjhqTmQ3?=
 =?utf-8?B?Z2Z2amxqenRnTlpHUy94cTZoZjAyeWhka1FFOGZFRWtISUJMK0VpZlFrNlZL?=
 =?utf-8?B?TkdqNWVTL3llL0RNdWE1K1EySDd1YWxGNEp0WWc4Y041N2dwbWVqTWMxaFN1?=
 =?utf-8?B?c1phNUVBOVlOSXR0UDFPTnphLzNjV3BRSHk1SnhuM25pNm9GSlZaMS92MHQ0?=
 =?utf-8?B?TjJteEZjVmxiVEoxd2tyNlBnTDZrSWNibk9KRHVkcWc5S3AvVXBMSkpSRlIw?=
 =?utf-8?B?eU16MzdpNExCV25tWEhvNmd6eTdoeXExOTdEMkZWcVdFcmZCeWczYlV3aW9O?=
 =?utf-8?B?SXF0d2IvZGQrWmpab01wSUdzM0hHYnVzaHd6SGUyNzNaaUgvaG83ZWZ2bU5L?=
 =?utf-8?B?Zk4xa1VIMWhhdHdjUTFlQlJqV1F1M21temMyM2JxWXpUMXV5WWE5eDRqOXU2?=
 =?utf-8?B?cFlPSVVaN3h2VkN2MlE2L3ZsK2l5MnJTdmJaWVZiWWFTQmUyQmduQmNzRkw4?=
 =?utf-8?B?UU0rSGJ1bnV0ajVUYTlXR09lZk9qK3UrL3JEWWVWRUgveWk3Ni9yVjEyMlBK?=
 =?utf-8?B?OUFwWDFuYkJlUzVzN1Y4LytFOEJpQmdCUFFlQzhzaVo5Y09GNmhudERXVi8x?=
 =?utf-8?B?MGZnZldIT21IV1dHNXlESTI5ODl2OW1YbCttQWd1R0JFQjhmTlZQQitPdDF6?=
 =?utf-8?B?b1lJVHE2N3hIN3VYbHBteDAwTUg4azVUbVpnUHQ4RzB6SExUZ0twMFBVUGNm?=
 =?utf-8?B?c2JwZVV0UTV1ODJrSGNyTXBZcXRmOUNiTUE1MVo2R0s2bEhiNExPQ3NrckFV?=
 =?utf-8?B?cHFwRGdrVVY0SG1EbkJhRnJwSFlCM01sWVNDbWlVYTd3d2V3T0VqMkZvS0Vq?=
 =?utf-8?B?ZUtYd2Q5ZUtnNlNJOW9wUk81U1cyU2tvd3RMR1E1TmUyZWtVMVlIb0JHaTV0?=
 =?utf-8?B?RnFqOW1sNWl5T0FkYkx5dTNMT1pvS2FxeVZCRnhTUmJ2ZWRvQWZ1MWFFYWZl?=
 =?utf-8?B?M0xhT3NDVDlHczc4UFNrbUh3eXhPNE9FZlp0U3FySDh6SzZEb0dMN3NJUEk2?=
 =?utf-8?B?VGw4REMyTzNDcHJpcHFqVzlIL2RRZ2lhcDBMOGJDTHRrSHVJOExHelA0Qkx3?=
 =?utf-8?B?Vyt0cXFiTHY0SUo0Ung0WE0zMmZkNUlpYkhZVGVFYngyamNoSGN4WjBCWDJU?=
 =?utf-8?B?MEJjKzNkSEM4NGJCamRoSG5wSCswdm9rdWxTT0xxR1ozanRlVSt1cmplSDBq?=
 =?utf-8?B?dHJEdGNaeHNueHJDTUt4OWR0UGx1aG9vWUJWdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed04286a-71e3-4505-908c-08dde1a9e47f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 18:29:55.5573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adl9PGt+fPnl8Jy73nasgdq4+Q963LkCeR85cLBlnFcOUzi7cMtlA47fj2FpinV3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 18:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222342

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1Ccmlh
bmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gU2VudDogZGVuIDIxIGF1
Z3VzdGkgMjAyNSAyMToxOQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVy
c3RlZHRAYXhpcy5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIdjUgMS8yXSBzeXN0ZW1kLXN5
c3RlbWN0bC1uYXRpdmU6IEluc3RhbGwgc3lzdGVtZC1zeXN2LWluc3RhbGwNCj4gDQo+IE9uIFRo
dSBBdWcgMjEsIDIwMjUgYXQgNToxMSBQTSBDRVNULCBQZXRlciBLamVsbGVyc3RlZHQgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4+IEZyb206IE1hdGhpZXUgRHVib2lzLUJyaWFuZCA8bWF0aGlldS5kdWJvaXMtYnJp
YW5kQGJvb3RsaW4uY29tPg0KPiA+PiBTZW50OiBkZW4gMjEgYXVndXN0aSAyMDI1IDA4OjM4DQo+
ID4+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT47
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0h2NSAxLzJdIHN5c3RlbWQtc3lzdGVtY3RsLW5hdGl2ZTogSW5z
dGFsbCBzeXN0ZW1kLXN5c3YtaW5zdGFsbA0KPiA+Pg0KPiA+PiBPbiBXZWQgQXVnIDIwLCAyMDI1
IGF0IDM6NDIgUE0gQ0VTVCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIHdyb3RlOg0KPiA+PiA+IEl0IGlzIG5lZWRlZCB3aGVuIHN1cHBvcnQgZm9yIGJvdGgg
c3lzdGVtZCBhbmQgc3lzdmluaXQgYXJlIGVuYWJsZWQuDQo+ID4+ID4NCj4gPj4gPiBUaGlzIGFs
c28gYWRkcyBhIHBhdGNoIGZvciBzeXN0ZW1jdGwgdG8gYWxsb3cgdGhlIHBhdGggdG8NCj4gPj4g
PiBzeXN0ZW1kLXN5c3YtaW5zdGFsbCB0byBiZSBzcGVjaWZpZWQgaW4gcnVudGltZS4gVGhpcyBp
cyBuZWVkZWQgYmVjYXVzZQ0KPiA+PiA+IHRoZSBoYXJkY29kZWQgcGF0aCB0aGF0IGlzIGJ1aWx0
IGludG8gc3lzdGVtY3RsIGRvZXMgbm90IG1hdGNoIHRoZSBwYXRoDQo+ID4+ID4gdG8gd2hlcmUg
aXQgd2lsbCBldmVudHVhbGx5IGJlIGV4ZWN1dGVkLg0KPiA+PiA+DQo+ID4+ID4gU2lnbmVkLW9m
Zi1ieTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+
ID4+ID4gLS0tDQo+ID4+DQo+ID4+IEhpIFBldGVyLA0KPiA+Pg0KPiA+PiBTb3JyeSwgYnV0Li4u
DQo+ID4+DQo+ID4+IFdBUk5JTkc6IGNvcmUtaW1hZ2UtZnVsbC1jbWRsaW5lLTEuMC1yMCBkb19y
b290ZnM6IGlwdGFibGVzLnBvc3RpbnN0IHJldHVybmVkIDEsIG1hcmtpbmcgYXMgdW5wYWNrZWQg
b25seSwgY29uZmlndXJhdGlvbiByZXF1aXJlZCBvbiB0YXJnZXQuDQo+ID4+IFdBUk5JTkc6IGNv
cmUtaW1hZ2UtZnVsbC1jbWRsaW5lLTEuMC1yMCBkb19yb290ZnM6IG9wZW5zc2gtc3NoZC5wb3N0
aW5zdCByZXR1cm5lZCAxLCBtYXJraW5nIGFzIHVucGFja2VkIG9ubHksIGNvbmZpZ3VyYXRpb24g
cmVxdWlyZWQgb24gdGFyZ2V0Lg0KPiA+PiBXQVJOSU5HOiBjb3JlLWltYWdlLWZ1bGwtY21kbGlu
ZS0xLjAtcjAgZG9fcm9vdGZzOiBzeXNrbG9nZC5wb3N0aW5zdCByZXR1cm5lZCAxLCBtYXJraW5n
IGFzIHVucGFja2VkIG9ubHksIGNvbmZpZ3VyYXRpb24gcmVxdWlyZWQgb24gdGFyZ2V0Lg0KPiA+
PiBXQVJOSU5HOiBjb3JlLWltYWdlLWZ1bGwtY21kbGluZS0xLjAtcjAgZG9fcm9vdGZzOiBvc3Rp
bnN0IHJldHVybmVkIDEsIG1hcmtpbmcgYXMgdW5wYWNrZWQgb25seSwgY29uZmlndXJhdGlvbiBy
ZXF1aXJlZCBvbiB0YXJnZXQuDQo+ID4+IFdBUk5JTkc6IGNvcmUtaW1hZ2UtZnVsbC1jbWRsaW5l
LTEuMC1yMCBkb19yb290ZnM6IGF0LnBvc3RpbnN0IHJldHVybmVkIDEsIG1hcmtpbmcgYXMgdW5w
YWNrZWQgb25seSwgY29uZmlndXJhdGlvbiByZXF1aXJlZCBvbiB0YXJnZXQuDQo+ID4+IFdBUk5J
Tkc6IGNvcmUtaW1hZ2UtZnVsbC1jbWRsaW5lLTEuMC1yMCBkb19yb290ZnM6IGNyb25pZS5wb3N0
aW5zdCByZXR1cm5lZCAxLCBtYXJraW5nIGFzIHVucGFja2VkIG9ubHksIGNvbmZpZ3VyYXRpb24g
cmVxdWlyZWQgb24gdGFyZ2V0Lg0KPiA+PiBXQVJOSU5HOiBjb3JlLWltYWdlLWZ1bGwtY21kbGlu
ZS0xLjAtcjAgZG9fcm9vdGZzOiBsb2dyb3RhdGUucG9zdGluc3QgcmV0dXJuZWQgMSwgbWFya2lu
ZyBhcyB1bnBhY2tlZCBvbmx5LCBjb25maWd1cmF0aW9uIHJlcXVpcmVkIG9uIHRhcmdldC4NCj4g
Pj4gV0FSTklORzogY29yZS1pbWFnZS1mdWxsLWNtZGxpbmUtMS4wLXIwIGRvX3Jvb3RmczogbmZz
LXV0aWxzLWNsaWVudC5wb3N0aW5zdCByZXR1cm5lZCAxLCBtYXJraW5nIGFzIHVucGFja2VkIG9u
bHksIGNvbmZpZ3VyYXRpb24gcmVxdWlyZWQgb24gdGFyZ2V0Lg0KPiA+PiBXQVJOSU5HOiBjb3Jl
LWltYWdlLWZ1bGwtY21kbGluZS0xLjAtcjAgZG9fcm9vdGZzOiBuZnMtdXRpbHMucG9zdGluc3Qg
cmV0dXJuZWQgMSwgbWFya2luZyBhcyB1bnBhY2tlZCBvbmx5LCBjb25maWd1cmF0aW9uIHJlcXVp
cmVkIG9uIHRhcmdldC4NCj4gPj4gV0FSTklORzogY29yZS1pbWFnZS1mdWxsLWNtZGxpbmUtMS4w
LXIwIGRvX3Jvb3RmczogcnVuLXBvc3RpbnN0cy5wb3N0aW5zdCByZXR1cm5lZCAxLCBtYXJraW5n
IGFzIHVucGFja2VkIG9ubHksIGNvbmZpZ3VyYXRpb24gcmVxdWlyZWQgb24gdGFyZ2V0Lg0KPiA+
PiBFUlJPUjogY29yZS1pbWFnZS1mdWxsLWNtZGxpbmUtMS4wLXIwIGRvX3Jvb3RmczogUG9zdGlu
c3RhbGwgc2NyaXB0bGV0cyBvZiBbJ2lwdGFibGVzJywgJ29wZW5zc2gtc3NoZCcsICdzeXNrbG9n
ZCcsICdvc3RpbnN0IHJldHVybmVkIDEsIG1hcmtpbmcgYXMgdW5wYWNrZWQgb25seSwgY29uZmln
dXJhdGlvbiByZXF1aXJlZCBvbiB0YXJnZXQnLCAnYXQnLCAnY3JvbmllJywgJ2xvZ3JvdGF0ZScs
ICduZnMtdXRpbHMtY2xpZW50JywgJ25mcy11dGlscycsICdydW4tcG9zdGluc3RzJ10gaGF2ZSBm
YWlsZWQuIElmIHRoZSBpbnRlbnRpb24gaXMgdG8gZGVmZXIgdGhlbSB0byBmaXJzdCBib290LA0K
PiA+PiB0aGVuIHBsZWFzZSBwbGFjZSB0aGVtIGludG8gcGtnX3Bvc3RpbnN0X29udGFyZ2V0OiR7
UE59ICgpLg0KPiA+PiBEZWZlcnJpbmcgdG8gZmlyc3QgYm9vdCB2aWEgJ2V4aXQgMScgaXMgbm8g
bG9uZ2VyIHN1cHBvcnRlZC4NCj4gPj4NCj4gPj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3By
b2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNjUvYnVpbGRzLzIyNTMNCj4gPj4gQW5kIGxv
dCBvZiBvdGhlciBidWlsZHMgaW4NCj4gPj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2pl
Y3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMjkvYnVpbGRzLzIyNDYNCj4gPj4NCj4gPj4NCj4g
Pj4gQmVzdCByZWdhcmRzLA0KPiA+PiBNYXRoaWV1DQo+ID4NCj4gPiBJIGhhdmUgZmFpbGVkIHRv
IHJlcHJvZHVjZSB0aGlzLiBJIGZldGNoZWQgMTVjODM0M2MxMDc1MWYxNjI0OGFjMWI1YjVkMWNh
ZDM0YjRlNDkxNw0KPiA+IHRoYXQgaXMgdXNlZCBpbiB0aGUgYWJvdmUgYnVpbGRzLCBhbmQgdXNl
ZCB0aGlzIGNvbmZpZ3VyYXRpb24gaW4gbXkNCj4gPiBsb2NhbC5jb25mICh0byB0cnkgdG8gbWlt
aWMgdGhlIGNvbmZpZ3VyYXRpb24gdXNlZCBieSB0aGUgYXV0b2J1aWxkZXIpOg0KPiA+DQo+ID4g
RElTVFJPID89ICJwb2t5LWFsdGNmZyINCj4gPg0KPiA+IEVYVFJBX0lNQUdFX0ZFQVRVUkVTID89
ICJhbGxvdy1lbXB0eS1wYXNzd29yZCBlbXB0eS1yb290LXBhc3N3b3JkIGFsbG93LXJvb3QtbG9n
aW4iDQo+ID4NCj4gPiBVU0VSX0NMQVNTRVMgPz0gImJ1aWxkc3RhdHMiDQo+ID4NCj4gPiBNQUNI
SU5FID89ICJnZW5lcmljeDg2Ig0KPiA+DQo+ID4gSU5IRVJJVCArPSAiaW1hZ2UtYnVpbGRpbmZv
Ig0KPiA+IElNQUdFX0JVSUxESU5GT19WQVJTOmFwcGVuZCA9ICIgSU1BR0VfQkFTRU5BTUUgSU1B
R0VfTkFNRSINCj4gPg0KPiA+IFBBQ0tBR0VfQ0xBU1NFUyA9ICJwYWNrYWdlX2lwayBwYWNrYWdl
X3JwbSBwYWNrYWdlX2RlYiINCj4gPg0KPiA+IElNQUdFX1JPT1RGU19FWFRSQV9TUEFDRTphcHBl
bmQgPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0lNQUdFX0ZFQVRVUkVTJywgJ3BhY2thZ2UtbWFu
YWdlbWVudCcsICcgKyAyNjIxNDQnLCAnJywgZCl9Ig0KPiA+DQo+ID4gQkJfSEFTSFNFUlZFID0g
IndzczovL2hhc2hzZXJ2LWV1LnlvY3RvcHJvamVjdC5vcmcvd3MiDQo+ID4NCj4gPiBEbyB5b3Ug
aGF2ZSB0aGUgbG9nLmRvX3Jvb3RmcyBmcm9tIHRoZSBmYWlsZWQgYnVpbGQ/IE1heWJlIGl0IGNh
biBzaGVkDQo+ID4gc29tZSBsaWdodCBvbiB3aGF0IHdlbnQgd3JvbmcuLi4NCj4gPg0KPiA+IC8v
UGV0ZXINCj4gDQo+IEkgaGF2ZSB0byBjb25mZXNzIEknbSBoYXZpbmcgYSBoYXJkIHRpbWUgdHJ5
aW5nIHRvIHJlcHJvZHVjZSB0aGlzDQo+IGxvY2FsbHkuIEkgd2lsbCB0cnkgYWdhaW4gaW4gdGhl
IGNvbWluZyBkYXlzLg0KPiANCj4gSSd2ZSBzYXZlZCBkYXRhIG9mIHRoZSBmb2xsb3dpbmcgYnVp
bGQgYW5kIEknbSBhdHRhY2hpbmcgdGhlDQo+IGxvZy5kb19yb290ZnMuDQo+IA0KPiBodHRwczov
L2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy85My9idWls
ZHMvMjI2Mw0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBNYXRoaWV1DQoNCkkgZmlndXJlZCBpdCBv
dXQuIEl0IGZhaWxlZCB3aGVuIGJ1aWxkaW5nIGZyb20gc3N0YXRlIGJlY2F1c2UgZXZlbiBpZiAN
CkkgZml4ZWQgc28gdGhhdCB0aGUgcGF0aCB0byBzeXN0ZW1kLXN5c3YtaW5zdGFsbCB3YXNu4oCZ
dCBoYXJkY29kZWQgaW50byANCnN5c3RlbWN0bCwgaXQgd2FzIHN0aWxsIGhhcmRjb2RlZCBpbnRv
IHRoZSBSUE0gc2NyaXB0cy4gOigNCg0KSSBoYXZlIHNlbnQgdXBkYXRlZCB2ZXJzaW9ucyBvZiB0
aGUgcGF0Y2hlcyB0aGF0IHNob3VsZCBub3QgcmVzdWx0IGluIA0KYW55IGhhcmRjb2RlZCBwYXRo
cyBhbnl3aGVyZSwgYW5kIHRoaXMgdGltZSBJIGhhdmUgdmVyaWZpZWQgYWxsIA0KY29tYmluYXRp
b25zIEkgY291bGQgdGhpbmsgb2Ygd2l0aCBhbmQgd2l0aG91dCBzc3RhdGUsIGFuZCB3aXRoIGFu
ZCANCndpdGhvdXQgc3lzdmluaXQgaW4gRElTVFJPX0ZFQVRVUkVTLg0KDQovL1BldGVyDQoNCg==

