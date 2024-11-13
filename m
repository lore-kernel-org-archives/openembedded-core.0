Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9405DD41D4A
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 13:23:01 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.56])
 by mx.groups.io with SMTP id smtpd.web11.11201.1731504179312582516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 05:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=frijkXKh;
 spf=pass (domain: infinera.com, ip: 40.107.243.56, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVQg9AXPzGdKDWhQftM//8ChEneXfOMEmdUm2cg60XLrocuOlEcHYc9Bjdd/O1fH3UyUOaQzamTRmFXrgOFnmvfiwSXHHEtJLxi21AqNhF+oKpLHez6XnidkBMUB1oIiKWhOQXFJPgR+M2vNonGZ5lHdzooIm3xzzApI2Of9O15uTXX6xjrGu4J9K34XNhJ+SL1H87LzGBoDaw3fQ9eNAHHGq1roieUAKyww7kyl2yHkQ2pYVCDBKr/10waWFt5LVFIwsXS4LTx2/a440UoWHSJwZNyYgseZOUjdRv+tzqLxdyWDp8Kkz1Jx/1zTiggKw7FuP0GFApqnPH+W8rBgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIPSEQSs+clMey0fZ2v7DMZSzmM3IXza7OeSY3GVTN0=;
 b=XMvEY+bWMCoPWx8hmZZhiT3EZT1i+AKiPNkSLC78Mxbfw4RfANEcCIEC5QRny45kr//OH8VgNFNw95I/K4J17AatKFLxTUnLg7wUQEoSq4v9mcYg8ECGQR9K2cnFP4mdh4aFGqd1ZOFs9taH9i+GHEH7Baap+aw2whBt7Iht7+6kNhzTjPblveHkApn79RFAFWgWZad02SJOc4KXSiCTNSl5jDDmbwzEhChUImD/pldM1V/8lTRlnMZtELsEfPmvpBFQv0S6APZ3tZ3fLPB39B756N+X1dXob08g00H7qIvQHUAw4vvIY2SsSlneGHuWk2B+WzTmDjncXrSxc0nCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIPSEQSs+clMey0fZ2v7DMZSzmM3IXza7OeSY3GVTN0=;
 b=frijkXKh6PePBw+7LgFrEpQiux1evEdXi8KVfanw5+DSXfcswMpCZD9y3DkO4DFEfvE1XFWf74ZEDsMEuOMjoyOj/4Maa64aj9uyConPngFypfCMfr642hND/Anp8y5iYitPqDSdr1f+BErYtXbat8I1R7JWt5jTxAquDZwA0vG6uKatLjUsl67g9U/K8SWYzLHqJvETYEvhZcsjJnpgnCMsd2R3juzxNjhJ7uBMkx27blG4FI1CLP39ggvu9oFfXDv9mKBvdHBj9g5ydN5LRvxhepdYpXoNT6QiGF46Fog+vDi/32URD35rVwXovwQAPESq3b62qMWS5E5pgG3Y7Q==
Received: from DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19)
 by CY8PR10MB7193.namprd10.prod.outlook.com (2603:10b6:930:76::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 13:22:56 +0000
Received: from DS7PR10MB5197.namprd10.prod.outlook.com
 ([fe80::9b1b:e457:4852:c406]) by DS7PR10MB5197.namprd10.prod.outlook.com
 ([fe80::9b1b:e457:4852:c406%3]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 13:22:56 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] PREMIRRORS ordering seem wrong?
Thread-Topic: [OE-core] PREMIRRORS ordering seem wrong?
Thread-Index: AQHbNbcInpiBgUGeEUWkPMStCUYvqrK1KZSAgAAJSYA=
Date: Wed, 13 Nov 2024 13:22:56 +0000
Message-ID: <32aa4b12e3bafb565ddd362f1abbb67b6767d59a.camel@infinera.com>
References: <5e358010917ca8fd59bd2d31bdcc12adac6ed478.camel@infinera.com>
	 <d2d018af97eb31eccef77e18c991cc4e689e4549.camel@linuxfoundation.org>
In-Reply-To: 
 <d2d018af97eb31eccef77e18c991cc4e689e4549.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB5197:EE_|CY8PR10MB7193:EE_
x-ms-office365-filtering-correlation-id: 614db5be-fa4c-4647-db6c-08dd03e649a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bkRaVWxNb1ZXMXJ5U2FFSjJqMGMxL2QxVEJoV24zNjloaWVvR0VPblJuQi9Q?=
 =?utf-8?B?NHZzUkRjaUlHbHYvU3E2QUVOM3RrajRBYlhaVVNsMCtNKzJZZHgrbGtIbzAx?=
 =?utf-8?B?YTd6QWRKQTNhUkltUXlIc3ZnOTFXSnI1K2hKc1lNZm80UGxhTXNoMUIvVlpv?=
 =?utf-8?B?VTFXazFyQUU4YTJ6RVpOSEFyaWVPa2x2REUwSkJDM1BmdXA5QXJoUURJaVRr?=
 =?utf-8?B?YktaYlB4RnkxMDlqc1h6eGtYNVFlNTV3R2ZuYWVJUTRzUlp5SkRmbkRzejFQ?=
 =?utf-8?B?OFVKNVVFTWV2LytHRkhkM2U1VlZHZnFnTmlQUThSTHp1TmxpR2hDYTB4MC8y?=
 =?utf-8?B?bkNCUXVJUXNJNEhnSk9lZ1NPYlVPWEpFQjBxT1o2L0Rod3lSTXd0SWtjeDlF?=
 =?utf-8?B?VUpib0tUUm41UnVEa0FkM3o3cThGaXhKaWhlTGdTQkRKcENDdmpkOHBkV1dM?=
 =?utf-8?B?aUR6dUZHQTBFeXpXZXJVbEVWQ0NpTllCNlRvQzVrYlR5bWttVkVLeWxnQy9x?=
 =?utf-8?B?MEJSZWFwZ3RaRzRHM0l6ajhSWk9mbUpkUjd0eWlGRVc2RlFrMmpzK2FoMWtY?=
 =?utf-8?B?NHpmbUJGR1FwL25rNlZsT09sNUxqUG8yQUZSbVVQb2VNSTlXV1o3bWlIKy83?=
 =?utf-8?B?TldCenNOWUZmZzc5TEQ2a1FGK1R1cWx6OGszMTV6a1NyczZJY1R5K09abk8w?=
 =?utf-8?B?T3NMNVhxTzBtYnppN2dHOWFpbWdLbGx2R3N3eW1zekt2eHMwakVoOTBqVEEr?=
 =?utf-8?B?OEVHSTNjcFEvMGtWRXc4eERrcWVOWUpKYjh0Q0k4eTFYelZtV0NVTG5Cc2pE?=
 =?utf-8?B?TVI0eXNEOVY1T2hrQ0swVlF0NERZeFFHYlhLNkhEemdXcm01d0FNMmMvSFE5?=
 =?utf-8?B?NzFWOFFPa0MwZnczeDdyOVZZQmxzMzJTMldEWHJ2N0RxTVpmcHdtN0hHYTR3?=
 =?utf-8?B?L0JKY3hGV215ZjZQNmM0b0xRMnNLcUV1dnF3K1UwSHd4ZW1DNnNOaW1CYWNQ?=
 =?utf-8?B?bjdyWDByblhoS1BKT2U1NnlyeHpLMEpVVmNwVWZ1VEtlY0dTZzBHZXByNmh6?=
 =?utf-8?B?TWdlZ1MzdStPUDBMSktSZS9pMVNET0xwb25obmxVVE9xN2VwUTBBSlpDRmFZ?=
 =?utf-8?B?K0xJNHZmTVQwSm1TNlNVNzlQL2N6cEc2dTlvRmRaWFFacGE1SnUvcDBSdEVk?=
 =?utf-8?B?WGNBcnFKblpTbWZHV1A4dWV1Y0FlN2xMSm05Y3FWTTZnaXZZY09Gem1QTWdB?=
 =?utf-8?B?TGk4T1hiTDJlRGowNzdjY3BvUGp2YzB4YzA0cFNtVUtMMWVWQWxqWlpvM2xq?=
 =?utf-8?B?Q1F2eE5DWTJ1OGpuVjJraWdRUlV6WTNiMm1CUjk3czBUNjR4cFZWVUI3OXBa?=
 =?utf-8?B?QXlQcTBvREtLQjU1bElDSUo5aUUzUGRML2RJNDgvSVJnVytFemlDTlZNanJF?=
 =?utf-8?B?cGdTK1daM3V0R3dvb0crMmpGTU44T1RwbUNXdVFtaVl0U1BBRDhLZ2dpL0FB?=
 =?utf-8?B?TkVaZ3FJU040bHdnd09qYzh6UTFqZ1pkSFQ1dTBlOFh3cjBaRWNWRG44akJV?=
 =?utf-8?B?QlJoRm5mTU1vT0loTUdFaFcrQVVlbXFnMGlwTFM3Ym1IUHcrOFpoSlpsRk0x?=
 =?utf-8?B?UGZKamlUekhnYVNXeERYMUVlZGYxa1piNmxhZURDZ1phb2RzMjhMNHBad0Rx?=
 =?utf-8?B?NmpDMFlNUVVLUFh5L0VpVER4QkpBenlrd0pIL3M0L0NvSVdBQnJXcVFyemIz?=
 =?utf-8?B?bUhuVmo3TEdBelRVK3V0SXhOa2FXYitFUThTT0RtWDZ5SkVNd0N4MHFMTk1Q?=
 =?utf-8?Q?TPkEeubqh1pfNdlOjD0/2N3ndgFCzZMM9Cfuw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5197.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q0I5b0w0WUZ6b2NYTnVJTWpkT29EYXk2Q3dmTENXN0tST2dxYk1mbnlIczZG?=
 =?utf-8?B?QmM2N2tYbXByN1p1WExtaTlRWGF0QlNjK0lKSmx4d041STUybHNtV3E2b1hG?=
 =?utf-8?B?Z3NGc1ZSbEpRcUtrMEJDNVN1ZmU5WWZpYkt4OTd1WG9hQ2pFak1XTVNFaWc1?=
 =?utf-8?B?ZzBPRVo1OFdEVVRTSzRZM3VhcEFDWHYxejMvRktsZXF6N3BqUlBmWUZ2TG1i?=
 =?utf-8?B?d21id08zcy9WaHYxNWtoN2lxV3RSamZNbytEdERsdnhBWVRMSlpNaU8wb2VK?=
 =?utf-8?B?djlMTy9GbXZpa0hiSFRRWXEyT1VNbzVhLzJEeTNOMEp0NmU1RzJBRWs2RUl1?=
 =?utf-8?B?WXM0YVBnaG50aUM0VFlnZy9EY0pSTHRVRm1QeWp0MnFCWlpCcjRTNmQ2QlNS?=
 =?utf-8?B?UjdSUFVzc0tyN29LRWIzbVhiVk9UNi8zSWUyYzZBbHZLcXI0UnFkUWlHWHJ4?=
 =?utf-8?B?MkNJQURZVlA1K1BaMHF6VVREWHorY09ORkdqVW8yU2hoNWxFYnd5RzRwUHZW?=
 =?utf-8?B?bFpXeEZnUXZ5dTE5VG1CWnlrNjU0N1UzT2RBWFFXYWRIcUxYWVBRb3hDdGla?=
 =?utf-8?B?VXp3MkMzVG9LZGMySmxraW1HRWFDK2h2ZDZoRUtNcVNEbzlyS2NoZGN3bEJO?=
 =?utf-8?B?S05QU3ZMOTMzNW5GcUFRVHptT3BESVBpT1pocmVWMW9jY094OTFWcTIwRlFM?=
 =?utf-8?B?QlJ6ak14OUE4OHY2aDljK2xOTHUwMnJjOEZBUkxma1NqT2p6c3RMQ0xReXNP?=
 =?utf-8?B?MHFvQnpjZ0xuYnhhS2pTdGNVTVRKemRyUGE3Zk82K1NRMWVCMGNiSWVlTnY2?=
 =?utf-8?B?NjYyd3dNMGYzbVZUVENVdXFaaTlGbkp5ekR5T2h1ZHZFUWNBYU56eHV5b3dM?=
 =?utf-8?B?UzE2cXNOcUlFUnIxZDhKbUlBaGRNZmJyckdwRG4wSnlXNVBoeUs1Um9hRlBY?=
 =?utf-8?B?N2RCRC9wT2Y4Y0lpaHp3WkpLZjlnaklaUTZLQ3MvQVVibFRLQ1dWcCtHSW42?=
 =?utf-8?B?SGEzU2FONTJOQnNmNjJoVnNHUFo1MXI1SWlOMnlkMnZNVnpuOGk4ZUJUaS9M?=
 =?utf-8?B?NmVuaHZ1UlYwMVcyditzaS8xWTRLTEZQSHZ5UDllSFJ5dDY3N0w0VmxFR2RS?=
 =?utf-8?B?UWUxZW1LeWJqdlpqdVBLQldMSmlqeTBxMVZhODlhUUdNL3hkbi9NOUdZR1Nz?=
 =?utf-8?B?OVh3V0puRVJrTDgvK29sWGNSbUZCUUZmZzhGZ3lhQnBoUEVDMURwTkdFS2lZ?=
 =?utf-8?B?M2p3aWprNlU2U3ZqbUVVeVF2ZU1sV3huWkFVSGY2cWpuK1hlaFNGYi80WWc4?=
 =?utf-8?B?cENiY3F5OXBNdHhtOWZoRUNuS0NrL1FMUzNlM0kydVMxZTV3WW1uQUQ1eTln?=
 =?utf-8?B?VzN3cXhTOWtIZEk0L3gxaXRBSzBUQWZJVEM1eWxlOHVRKzROQ1p5WVpMZXpo?=
 =?utf-8?B?bjE0UXgveFo0QldmYlcrRWdGZmVZUldGWkV6M3hyd3RQN2xwdE51OStsdEhS?=
 =?utf-8?B?TnlGZ2lqazhGMm1tVjQrWkJUYXV5eDFzUmZwVDBxakt5M3F5ZmxIalpwUWw4?=
 =?utf-8?B?Qml0akE4N0w3Z3RJendHdkVTbGpEVjVuQVdadWNnaDFqbDRzMzJScWpxdTRp?=
 =?utf-8?B?dVlWMTJ2Mkh5UHIwMDYvWW1sUloyOHJVMlRDQS9WaVd2Ym5KYm11cFJGaEpl?=
 =?utf-8?B?ZzZzU20ycEFKM3lON2tveVR4UGk1d2tWeDl5SzhZdlRQelh5dXFzaWhFWGs4?=
 =?utf-8?B?cTRvMXhaenRyZTdPckFDUXMzNVRlcDUxOHdlbHIrSEJhNDl4b0JWSm9FSHR6?=
 =?utf-8?B?cnp2UHlxN3ExblZVamlEalFTc0wzS20yWTErYUNQM2hEVHRkWGNTZjQ2Wmsz?=
 =?utf-8?B?Unc1N01FT29walYzamZnMkJmUWVLSkMzQk00TUlZanZlWE00QjJHS3IwWHM0?=
 =?utf-8?B?eEVxZk1tS1B4emJZMC81RkNPUjB2WFdULytEQjUvd2ZWTGh4SHp6SFVKTUtk?=
 =?utf-8?B?czFoVEVoNTVqTDBOTC9YN29JUEt5THRLUjN2ZVd1UmVSbU5JK2d2WEc0cWZi?=
 =?utf-8?B?MVpkZXUvS1d3NjVYY3FCNnF0TkdZZkk5OURiVlFOODZWM1gyVW5RL1FPY0xi?=
 =?utf-8?Q?H7eKbtaHhMGgzH9SNWj526Tsv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8876DF6BD05E02478A58C8997038F679@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5197.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614db5be-fa4c-4647-db6c-08dd03e649a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 13:22:56.9042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cF3nlzQWQyMwanzt9wYg8+4aBA0s+O7HVd3IshrsmmSm6g4Ak/QHY8tVlPX39S7DLrEdC7FxwNENImfvJJKYEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 13:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207101

T24gV2VkLCAyMDI0LTExLTEzIGF0IDEyOjQ5ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gV2VkLCAyMDI0LTExLTEzIGF0IDEwOjMwICswMDAwLCBKb2FraW0gVGplcm5sdW5kIHZp
YQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEkgaGF2ZSBzZXQ6DQo+ID4g
SU5IRVJJVCArPSAib3duLW1pcnJvcnMiDQo+ID4gUFJFTUlSUk9SUzpwcmVwZW5kID0gIm15IGdp
dCBwcmUgbWlycm9yIGV4cHIuIg0KPiA+IA0KPiA+IGxvb2tpbmcgYXQ6DQo+ID4gwqBiaXRiYWtl
IC1lIG15LWltYWdlIHwgZ3JlcCBQUkVNSVJST1JTPQ0KPiA+IEkgc2VlIHRoYXQgIm15IGdpdCBw
cmUgbWlycm9yIGV4cHIuIiBpcyBsYXN0IGluIFBSRU1JUlJPUlMgdmFyaWFibGUsDQo+ID4gdGhh
dCBzZWVtcyB3cm9uZz8NCj4gPiANCj4gPiBUbyBtZSAibXkgZ2l0IHByZSBtaXJyb3IgZXhwci4i
IHNob3VsZCBiZSBiZWZvcmUgdGhlIGVudHJpZXMgYWRkZWQgYnkNCj4gPiBvd24tbWlycm9ycw0K
PiANCj4gSU5IRVJJVCBpbiBjb25mIGZpbGVzIGlzIGRlZmVycmVkIGFuZCBub3QgaW1tZWRpYXRl
bHkgcHJvY2Vzc2VkLg0KPiAgDQoNCk9LLCB0aGF0IHNlZW1zIHRvIHN1cHBvcnQgbXkgZmluZGlu
Z3MgYXMgb3duLW1pcnJvcnMgYWxzbyBkb2VzIFBSRU1JUlJPUlM6cHJlcGVuZCBhbmQgdGhhdA0K
cHV0cyBteSBvd24gUFJFTUlSUk9SUzpwcmVwZW5kID0gIm15IGdpdCBwcmUgbWlycm9yIGV4cHIu
IiBsYXN0IGluIFBSRU1JUlJPUlMNCg0KSXQgdGhhdCBob3cgaXQgc2hvdWxkIGJlPw0KDQogSm9j
a2UNCg0K

