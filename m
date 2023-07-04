Return-Path: <yang.xu@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632B6EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 13:56:29 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web10.59179.1688478984412037886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 06:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=G3ZqzcyH;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: yang.xu@mediatek.com)
X-UUID: 8cc1aabc1a7211ee9cb5633481061a41-20230704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=jJyG0+PTTENP56y0VTJLMJIqKmew4DRHd0kTziVF3FQ=;
	b=G3ZqzcyHSqmuj29k030IVBCCwPLYPBRCi1RebwsptgZoXXksyePp3GD2vnd4uxPe4xtPtNXh3oW1ZRJ6Ov95oKJ1nlYDJtPau3TkcBKtu+xtz1mzwdZgIhNFIx/xqWnO90GwKlr8hW9fmUuObIVvCCzRowHiAhYPGxNp8dnz4mA=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:427043e6-e60d-485a-aafa-ae56ae3ac2a6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.27,REQID:427043e6-e60d-485a-aafa-ae56ae3ac2a6,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:01c9525,CLOUDID:c5f68d0d-26a8-467f-b838-f99719a9c083,B
	ulkID:2307041919188ZKF2G1E,BulkQuantity:2,Recheck:0,SF:48|29|28|16|19,TC:0
	,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ASC,TF_CID_SPAM_USA,TF_CID_SPAM_FSD,TF_CID_SPAM_ULN,
	TF_CID_SPAM_SNR,TF_CID_SPAM_SDM
X-UUID: 8cc1aabc1a7211ee9cb5633481061a41-20230704
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yang.xu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1440049629; Tue, 04 Jul 2023 21:56:18 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 4 Jul 2023 21:56:17 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 4 Jul 2023 21:56:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I91b2/m/I/UYLoeCxbmON+zar8mSxhjzwolowD7ECAjoqHMeSUHt0SSjsad70w9bPmSn6MBhpgrAvSqn5HBe5VGecYJ8EvZCRHDAgTMvLcPETmhjrCOHaCW56zG5fnFX34Qj76GhTqNbM5JxIB2mGZB/s6/OKwguYvDg+zYNasRoikrDoLEjwR1OzYow03fqHz18MzcTK4y8zaxowDgM3oWQaKT5+at4eJpmZ5lrh6hkoER4TeNExUfkv3yJfWURtT77GguNhyWS4TdsSG64FHQW52FnzQcOxJZa/NQh1gkA2g7QrCs1ZCnTtN1RvzhWd+HineuTJA8cemVkF8uIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJyG0+PTTENP56y0VTJLMJIqKmew4DRHd0kTziVF3FQ=;
 b=HKl17yxJhWLVP6ERGnJqJqNrKwzpIg9lHNLGW4DFlS/o4qPwiueZ8T9eEB0dbOy1yV0LGiSTCkCWWLcJIpN0eunEDJ0jmHHywQ435wzbXOXZCD3GGbBuqF/zS0qHyZmJvpKLsBBV9j/BriAlThab8j4qj8hDzL5hSz1yVkRZm7ctrclNSq27CNWTYnMjsOr2t6NXYPCfh0IDAGr2XxurIDeLhM7x7sk4Ql84Zp1u9ObS+ispZ4IfnzcK2vRGspALM4bRlaAhgi4GF3TMXAfCEqFXlYacoeG2UZuYaXnJnAudVjIL76Z9oIore9Czi3/ntd8U2ZTOnpTG/jsDLHBJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJyG0+PTTENP56y0VTJLMJIqKmew4DRHd0kTziVF3FQ=;
 b=mpW9bJjKBQJ2vRgERFdHgJYaHGMKG/Eh0eU8Hy1ybs1SVxVEcwADp+LMPzf8B791U/7SMmtkaGWHqe4LBcR90QncGq/kYRUfMJ7Nr3YQnopDfCkNqWxOWm+aMXKT09sE7/JsGUVOV3W3eWwywZMRs1DAWEkPcyIsb+xwY8W9PYc=
Received: from TYZPR03MB6717.apcprd03.prod.outlook.com (2603:1096:400:1f2::7)
 by TYZPR03MB5327.apcprd03.prod.outlook.com (2603:1096:400:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 13:56:15 +0000
Received: from TYZPR03MB6717.apcprd03.prod.outlook.com
 ([fe80::8c2b:6b90:ecb1:fc87]) by TYZPR03MB6717.apcprd03.prod.outlook.com
 ([fe80::8c2b:6b90:ecb1:fc87%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 13:56:15 +0000
From: =?utf-8?B?WWFuZyBYdSAo5b6Q5omsKQ==?= <Yang.Xu@mediatek.com>
To: "Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] sstatesig: Fix pn and taskname derivation in
 find_siginfo
Thread-Topic: [OE-core] [PATCH v2] sstatesig: Fix pn and taskname derivation
 in find_siginfo
Thread-Index: AQHZrivFgs3EI1+jCUqHcgacoXj/W6+pdlQAgAAr7AA=
Date: Tue, 4 Jul 2023 13:56:14 +0000
Message-ID: <cae7fd83d8a89ea2eceba96bc6020e8d8077ba5a.camel@mediatek.com>
References: <20230704035806.2937-1-yang.xu@mediatek.com>
	 <30C684EE-4374-4ADE-86B1-8F641BF7CECE@arm.com>
In-Reply-To: <30C684EE-4374-4ADE-86B1-8F641BF7CECE@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6717:EE_|TYZPR03MB5327:EE_
x-ms-office365-filtering-correlation-id: 54f29e0d-cd1d-43d9-e52c-08db7c966ee4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KmbPzNATEO/VqvJOMoAw/gKIaL/k6dOyi1HbkxzkAltl/iUO+Kx6xgCXgfinJcEiEgiMq2g4aHH+b/s9WPsWp2MEDaMGwwcJ8ZDmywvXVwJhZPeg1OF2kWHEBcN1q/bYmiyTFqZwxUSQqBsPatYVoFllW3OYP4k2Z3AUUWr7NSC5SLDBGR7WHUMSdllLOfN+pMFpVGTjqGPa5JM+pQCtkyuuyBLd7vJNcTte9lCN9gPA22c0KPVwZrr8vDEdIFCuw+vXV3IyESgvhxUiluyA1UFsruekr/F66OGdWxUmLh/UThhr07F/LhdTQC4RE5klP4sSyLmzg9iP9TnHrbwRMXWKNYl4hAURzwX9VWP6C2mq62oSzY0sHO1mSzpM2IA14ESV4jcIJNr6D73fIIOPMB3kuXpY4x+/x0wqb1zNj+gcIg5Xbh7/7IeUJ0qq5wHHh/ey+TnL+aG4PdLfWlSUuqG32102E+wxB69GcqLcueeEQTwbk8MR1CQ/D9hx2B1VA/eTBbUS9G+POOmUEB3q6bAqNGN450F1wYOWEsdwJakLH0ffiwavRsm9oo3KdVMwOm1K17clN1iBLK5u1+x11OYcPB/gKOjvxiJHvX0BkF7fmtyayr/E4jAC+vcnTB5phU/AUkmtBqBOIo3MSIHELUobYUK2BEApZGWYaQ4KCpk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6717.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(26005)(478600001)(71200400001)(6512007)(6506007)(86362001)(2616005)(186003)(38100700002)(66476007)(64756008)(6916009)(66556008)(4326008)(66946007)(66446008)(83380400001)(76116006)(6486002)(316002)(122000001)(8676002)(8936002)(66899021)(38070700005)(41300700001)(2906002)(5660300002)(36756003)(85182001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVN6SmhBQk4vTDErTWhEdlduNzE0K1NZamNybE51UEJ6Y0xQakZsdkdKOUpI?=
 =?utf-8?B?OHhsZk00WHEvWnFKR1RvenFnNmIrelRldmtuT1VSVEFYVEVLNktGR0xUekJz?=
 =?utf-8?B?YVdxOGdmcmRNKzlXcmpyak4wckppUUJ6a2V3Sk0zeFJFaWNLRGN5bFFHSXVI?=
 =?utf-8?B?K2RLWjAvb1I3Z1VCUE1nSlFnUjdGRGNYc3YwSXZZUTE3c1BKMHRYTll4bjFs?=
 =?utf-8?B?UjRDdjhVdEhUZmlSTUxlUmdxZlJvSnhPV0RaRm1xUUt2aEwxcGdPc2VyQ3Vn?=
 =?utf-8?B?eGxDRDNjRS9PTkNuQkwrQ2RuQTlxUUpUTDltNjJGMjU4TzJMVzZBdUtaeE9t?=
 =?utf-8?B?QXloSjdjdzd5MG5hcVJFVkphYllzR24rNXNBZFJleUt5d3dXSVRQVlBsT0xY?=
 =?utf-8?B?ZTZ4MW8xYlk2SXY5Z1JtTHFiK3ZQOU1wZUhqaTdybFVXSk9zOGREVkpoeU1S?=
 =?utf-8?B?cGlTY2pIdThsdklrUVFXRUhqL3hTa3ZaenJLSmFIMnJKTlBiZXFvaVdHZnNh?=
 =?utf-8?B?c1JGbnpQTXgwa3lFZEN3K1I1cmdaZ3UzeVdYak9OOW0rdVgwVjM3anRMTk04?=
 =?utf-8?B?bCsrZDNZTG4vL3JxSldvTG1sRVplYTc2MnRRTjJBZklMUHJMcFM1T3FlK2Vl?=
 =?utf-8?B?V1lKa0paOERWbFhhZzkzTmRmN3VPcVBQSjZENW9DeHlSU2ZyMjdKWDJFUzB5?=
 =?utf-8?B?eG9keit3emo5WHg5eTc1Vkk5SllIWlFYVUs2SFRtcXBKaGZmV2tJRHVIWHk4?=
 =?utf-8?B?QmMxTGg1eXNnY2t4aDY5Y2szQm5kM0xQTEY3Q216bmZTUitUYnBUUkFkR1RY?=
 =?utf-8?B?M0hpS1F6YnY5VGYzQTFlaDNZWUxROXRPUTlVS3RBTVlBUllqcmF1aDBPMCtR?=
 =?utf-8?B?MGdodU1aQXVvZDd1ZSttSS83RHA2dlU3OXh5ekVONnhYMUltYktLbi82RURv?=
 =?utf-8?B?ZTM1enI3RUU3ZnZUNUg4WDJnRVh2NFJtcGlOT2M3S2k3YWdtL0QyTm1Wam4w?=
 =?utf-8?B?K1JKM3BiRUVYRFF3L2dOWDhaTEMzei8wRGZvRXlUakdWYWFQQVdYbGJhNjd5?=
 =?utf-8?B?SW43SXZqSWFIT1NTOUNpeGM2ZElFYWhLU3UxdkN0RUN4YzM2UkZWRk5jeWRB?=
 =?utf-8?B?emhRN2NUYVlDNy8rTDJSejNrN2xDaXVKb0xvTVdOY1ZYN2ZMTFlyOEpTMDR6?=
 =?utf-8?B?R0Vxb1oxUkJrYnRhT0RmTzBTOW94N2lvdnpkWlM1clphYWNISE96MHFnd3FC?=
 =?utf-8?B?YldTa3p4TVJTc2NpOXJYWFNEa3U1TmtsNTRDU3IzNngxSy8ybXVWTEEyL0t5?=
 =?utf-8?B?ajRzNFVPZ2J6emoxaVpxQmJocHJzbVJlK2JZQzN1WndreVQxUm9LTlRrRWhE?=
 =?utf-8?B?Y2JYeTVhQXVnb3lvUGI2TEVReXRWemoxcUxWOHRHWmJEVFlDRDJ1Y1M0TGhB?=
 =?utf-8?B?REFzY28rSk12cFpodlNvYnBGMzA1Y012dTl6WEVKSU8rV2dCSVNmZ21Gc0Vs?=
 =?utf-8?B?MmlDOTYrL1NsVVlGLzNvaXdGZVBXZkdVMitSeVlBNTFEcDA3SXNDOFdRV2tr?=
 =?utf-8?B?eC8wTmxWZHM3ODNzakxsTW9EdHpuVVVPTndhTER5Zm1iOWlXNU5YWjlxY2xX?=
 =?utf-8?B?WExGZFc5RFQwYzZwNVpGc0RzT281R3J1aTFEbERXNGJic0lucGx1ZFRkWCtY?=
 =?utf-8?B?VGlrbmFRams2Z09RVXhobjM5dmUvbnozbzIzWG9hdmI3M09zS2FmZGdJMVli?=
 =?utf-8?B?cFNHRnpZWGJVS3BuYTY3VlBZM1JPVmRVTEdIQm9oOE5HQk9JTHVoRzM3Z21M?=
 =?utf-8?B?TUtnY203VFBXU3ZaYkVGUUI3ZnpvZ0NvVWlUWDRFTHFiVzhQR0FvTStlNitt?=
 =?utf-8?B?UHRleXlDVjhvNmNwR0NpYlFlMktIZVB4ZnVCMlJsT2szKzVVU3ExKzVIaG1X?=
 =?utf-8?B?dURaTi9kNDREY1JSMnBDRWwyaGpKRkVwZVY5RWk1TVA1RGJkTk10UytvTkRC?=
 =?utf-8?B?UXM3R2k0L3hnZnl0TFhubEU1THBrQTR5Rm9rRjBITUtYN2RaWXF1bjRIallH?=
 =?utf-8?B?M0hhbElKS2t1bWZTV0RWbExhSHhacjh2ZzNZQzAwWmhGR09sdnlCQy90SEJS?=
 =?utf-8?Q?nVsm3W9+JYmVmKQIDYev2+2RO?=
Content-Type: multipart/alternative;
	boundary="_000_cae7fd83d8a89ea2eceba96bc6020e8d8077ba5acamelmediatekco_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6717.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f29e0d-cd1d-43d9-e52c-08db7c966ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 13:56:15.0111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w6Q39Q4mjN4+ILcEnFfawqHPF5Hh8gZ/1MKyWqYcaB4xYlaZn1MaYMPQOn99ld3C0BUIT5r3pirrJT35vtKopA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5327
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 13:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183832

--_000_cae7fd83d8a89ea2eceba96bc6020e8d8077ba5acamelmediatekco_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2hlbiBJIGludmVzdGlhZ2Ugc29tZSBwYWNrYWdlIHRhc2tzIGNhY2hlIG1pc3NpbmcgcHJvYmxl
bSBieSBiaXRiYWtlLWRpZmZzaWdzLCBJIGZvdW5kIHRoYXQgJ2ZpbmRfc2lnaW5mbycgY2FsbGVk
IGJ5IGJpdGJha2UtZGlmZnNpZ3MgaXMgdW5hYmxlIHRvIGNvbnN0cnVjdCB0aGUgY29ycmVjdCBw
YWNrYWdlIG5hbWUocG4pIHdoZW4gZGVhbGluZyB3aXRoIHZpcnR1YWwgdGFyZ2V0cy4NCg0KUGF0
Y2ggdjIgaW50cm9kdWNlcyBoYW5kbGluZyBmb3IgJ2xpYjY0LScgYW5kICdsaWIzMi0nIGNhc2Ug
YmVzaWRlcyAnLW5hdGl2ZScgY2FzZS4NCg0KQW5kIGZvciB0ZXN0IGNhc2UsIEknbSBjdXJyZW50
bHkgbm90IGZhbWlsaWFyIHdpdGggb2Utc2VsZnRlc3QuSG93ZXZlciwgSSB3aWxsIGxlYXJuIGhv
dyB0byBhZGQgdGVzdCBjYXNlIHRvIG9lLXNlbGZ0ZXN0IGFuZCB3aWxsIGF0dGVtcHQgdG8gd3Jp
dGUgYSB0ZXN0IGNhc2UgZm9yIHRoaXMuDQoNClRoYW5rIHlvdS4NCg0KWWFuZw0KDQpPbiBUdWUs
IDIwMjMtMDctMDQgYXQgMTE6MTkgKzAwMDAsIFJvc3MgQnVydG9uIHdyb3RlOg0KDQo+IFRoZSBg
YmIuc2lnZ2VuLmNvbXBhcmVfc2lnZmlsZXNgIG1ldGhvZCB0cmFuc2Zvcm1zIHRoZSBrZXkgZm9y
bWF0IGZyb20NCg0KPiBgW21jOjxtY19uYW1lPjpdW3ZpcnR1YWw6XVtuYXRpdmU6XTxyZWNpcGUg
cGF0aD46PHRhc2tuYW1lPmAgdG8NCg0KPiBgPHJlY2lwZSBkaXI+LzxyZWNpcGUgbmFtZT46PHRh
c2tuYW1lPls6dmlydHVhbF1bOm5hdGl2ZV1bOm1jOjxtY19uYW1lPl1gDQoNCj4gYnkgYGNsZWFu
X2Jhc2VwYXRoc2AuIEhvd2V2ZXIsIGBmaW5kX3NpZ2luZm9gIHVzZXMgdGhlIG9yaWdpbmFsIGZv
cm1hdA0KDQo+IHRvIGdldCB0aGUgcGFja2FnZSBuYW1lIChwbikgYW5kIHRhc2sgbmFtZS4NCg0K
Pg0KDQo+IFRoaXMgY29tbWl0IGNvcnJlY3RzIHRoZSBtZXRob2QgZm9yIGRlcml2aW5nIHRoZSBw
biBhbmQgdGFzayBuYW1lIGluDQoNCj4gYGZpbmRfc2lnaW5mb2AgYW5kIGFkZHMgaGFuZGxpbmcg
Zm9yIG11bHRpbGliIG5hbWUuDQoNCj4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1IDx5YW5n
Lnh1QG1lZGlhdGVrLmNvbT4NCg0KPiAtLS0NCg0KPiBtZXRhL2xpYi9vZS9zc3RhdGVzaWcucHkg
fCAxNyArKysrKysrKysrKystLS0tLQ0KDQo+IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQ0KDQo+DQoNCj4gZGlmZiAtLWdpdCBhL21ldGEvbGliL29lL3Nz
dGF0ZXNpZy5weSBiL21ldGEvbGliL29lL3NzdGF0ZXNpZy5weQ0KDQo+IGluZGV4IGY5NDNkZjE4
MWUuLmYwNDFhMGM0MzAgMTAwNjQ0DQoNCj4gLS0tIGEvbWV0YS9saWIvb2Uvc3N0YXRlc2lnLnB5
DQoNCj4gKysrIGIvbWV0YS9saWIvb2Uvc3N0YXRlc2lnLnB5DQoNCj4gQEAgLTMyMSwxMSArMzIx
LDE4IEBAIGRlZiBmaW5kX3NpZ2luZm8ocG4sIHRhc2tuYW1lLCB0YXNraGFzaGxpc3QsIGQpOg0K
DQo+ICAgICBpZiBub3QgdGFza25hbWU6DQoNCj4gICAgICAgICAjIFdlIGhhdmUgdG8gZGVyaXZl
IHBuIGFuZCB0YXNrbmFtZQ0KDQo+ICAgICAgICAga2V5ID0gcG4NCg0KPiAtICAgICAgICBzcGxp
dGl0ID0ga2V5LnNwbGl0KCcuYmI6JykNCg0KPiAtICAgICAgICB0YXNrbmFtZSA9IHNwbGl0aXRb
MV0NCg0KPiAtICAgICAgICBwbiA9IG9zLnBhdGguYmFzZW5hbWUoc3BsaXRpdFswXSkuc3BsaXQo
J18nKVswXQ0KDQo+IC0gICAgICAgIGlmIGtleS5zdGFydHN3aXRoKCd2aXJ0dWFsOm5hdGl2ZTon
KToNCg0KPiAtICAgICAgICAgICAgcG4gPSBwbiArICctbmF0aXZlJw0KDQo+ICsgICAgICAgIGlm
IGtleS5jb3VudCgnOicpID49IDI6DQoNCj4gKyAgICAgICAgICAgIHNwbGl0aXQsIHRhc2tuYW1l
LCBhZmZpeCA9IGtleS5zcGxpdCgnOicsIDIpDQoNCj4gKyAgICAgICAgZWxzZToNCg0KPiArICAg
ICAgICAgICAgc3BsaXRpdCwgdGFza25hbWUgPSBrZXkuc3BsaXQoJzonLCAxKQ0KDQo+ICsgICAg
ICAgICAgICBhZmZpeCA9ICcnDQoNCj4gKyAgICAgICAgcG4gPSBvcy5wYXRoLnNwbGl0ZXh0KG9z
LnBhdGguYmFzZW5hbWUoc3BsaXRpdCkpWzBdLnNwbGl0KCdfJylbMF0NCg0KPiArICAgICAgICBh
ZmZpeGl0ZW1zID0gYWZmaXguc3BsaXQoJzonKQ0KDQo+ICsgICAgICAgIGlmIGFmZml4aXRlbXNb
MF0gPT0gJ3ZpcnR1YWwnOg0KDQo+ICsgICAgICAgICAgICBpZiBhZmZpeGl0ZW1zWzFdID09ICdu
YXRpdmUnOg0KDQo+ICsgICAgICAgICAgICAgICAgcG4gPSBwbiArICctbmF0aXZlJw0KDQo+ICsg
ICAgICAgICAgICBpZiBhZmZpeGl0ZW1zWzFdID09ICdtdWx0aWxpYic6DQoNCj4gKyAgICAgICAg
ICAgICAgICBwbiA9IGFmZml4aXRlbXNbMl0gKyAnLScgKyBwbg0KDQoNCkhvdyBkaWQgeW91IG5v
dGljZSB0aGlzIHByb2JsZW0sIHdoYXTigJlzIHRoZSBhY3R1YWwgY2hhbmdlIGJldHdlZW4gdGhp
cyBhbmQgdjEsIGFuZCBtb3JlIGltcG9ydGFudGx5IGNhbiB3ZSBhZGQgYSB0ZXN0IGNhc2UgZm9y
IHRoaXMgb2J2aW91c2x5IGNvbXBsZXggY29kZT8NCg0KDQpSb3NzDQoNCg==

--_000_cae7fd83d8a89ea2eceba96bc6020e8d8077ba5acamelmediatekco_
Content-Type: text/html; charset="utf-8"
Content-ID: <DCE52CA07B766F4CAD7EEC9C5DF521AE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgZGlyPSJsdHIiPg0KPGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUi
IGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+DQo8L2hlYWQ+DQo8Ym9keSBzdHls
ZT0idGV4dC1hbGlnbjpsZWZ0OyBkaXJlY3Rpb246bHRyOyI+DQo8ZGl2PldoZW4gSSBpbnZlc3Rp
YWdlIHNvbWUgcGFja2FnZSB0YXNrcyBjYWNoZSBtaXNzaW5nIHByb2JsZW0gYnkgYml0YmFrZS1k
aWZmc2lncywgSSBmb3VuZCB0aGF0ICdmaW5kX3NpZ2luZm8nIGNhbGxlZCBieSBiaXRiYWtlLWRp
ZmZzaWdzIGlzIHVuYWJsZSB0byBjb25zdHJ1Y3QgdGhlIGNvcnJlY3QgcGFja2FnZSBuYW1lKHBu
KSB3aGVuIGRlYWxpbmcgd2l0aCB2aXJ0dWFsIHRhcmdldHMuPC9kaXY+DQo8ZGl2Pjxicj4NCjwv
ZGl2Pg0KPGRpdj5QYXRjaCB2MiBpbnRyb2R1Y2VzIGhhbmRsaW5nIGZvciAnbGliNjQtJyBhbmQg
J2xpYjMyLScgY2FzZSBiZXNpZGVzICctbmF0aXZlJyBjYXNlLjwvZGl2Pg0KPGRpdj48YnI+DQo8
L2Rpdj4NCjxkaXY+QW5kIGZvciB0ZXN0IGNhc2UsIEknbSBjdXJyZW50bHkgbm90IGZhbWlsaWFy
IHdpdGggb2Utc2VsZnRlc3QuSG93ZXZlciwgSSB3aWxsIGxlYXJuIGhvdyB0byBhZGQgdGVzdCBj
YXNlIHRvIG9lLXNlbGZ0ZXN0IGFuZCB3aWxsIGF0dGVtcHQgdG8gd3JpdGUgYSB0ZXN0IGNhc2Ug
Zm9yIHRoaXMuDQo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlRoYW5rIHlvdS48L2Rp
dj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2Pllhbmc8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+
DQo8ZGl2Pk9uIFR1ZSwgMjAyMy0wNy0wNCBhdCAxMToxOSArMDAwMCwgUm9zcyBCdXJ0b24gd3Jv
dGU6PC9kaXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44
ZXg7IGJvcmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPHBy
ZT4mZ3Q7IFRoZSBgYmIuc2lnZ2VuLmNvbXBhcmVfc2lnZmlsZXNgIG1ldGhvZCB0cmFuc2Zvcm1z
IHRoZSBrZXkgZm9ybWF0IGZyb208L3ByZT4NCjxwcmU+Jmd0OyBgW21jOiZsdDttY19uYW1lJmd0
OzpdW3ZpcnR1YWw6XVtuYXRpdmU6XSZsdDtyZWNpcGUgcGF0aCZndDs6Jmx0O3Rhc2tuYW1lJmd0
O2AgdG88L3ByZT4NCjxwcmU+Jmd0OyBgJmx0O3JlY2lwZSBkaXImZ3Q7LyZsdDtyZWNpcGUgbmFt
ZSZndDs6Jmx0O3Rhc2tuYW1lJmd0O1s6dmlydHVhbF1bOm5hdGl2ZV1bOm1jOiZsdDttY19uYW1l
Jmd0O11gPC9wcmU+DQo8cHJlPiZndDsgYnkgYGNsZWFuX2Jhc2VwYXRoc2AuIEhvd2V2ZXIsIGBm
aW5kX3NpZ2luZm9gIHVzZXMgdGhlIG9yaWdpbmFsIGZvcm1hdDwvcHJlPg0KPHByZT4mZ3Q7IHRv
IGdldCB0aGUgcGFja2FnZSBuYW1lIChwbikgYW5kIHRhc2sgbmFtZS48L3ByZT4NCjxwcmU+Jmd0
OyA8L3ByZT4NCjxwcmU+Jmd0OyBUaGlzIGNvbW1pdCBjb3JyZWN0cyB0aGUgbWV0aG9kIGZvciBk
ZXJpdmluZyB0aGUgcG4gYW5kIHRhc2sgbmFtZSBpbjwvcHJlPg0KPHByZT4mZ3Q7IGBmaW5kX3Np
Z2luZm9gIGFuZCBhZGRzIGhhbmRsaW5nIGZvciBtdWx0aWxpYiBuYW1lLjwvcHJlPg0KPHByZT4m
Z3Q7IDwvcHJlPg0KPHByZT4mZ3Q7IFNpZ25lZC1vZmYtYnk6IFlhbmcgWHUgJmx0O3lhbmcueHVA
bWVkaWF0ZWsuY29tJmd0OzwvcHJlPg0KPHByZT4mZ3Q7IC0tLTwvcHJlPg0KPHByZT4mZ3Q7IG1l
dGEvbGliL29lL3NzdGF0ZXNpZy5weSB8IDE3ICsrKysrKysrKysrKy0tLS0tPC9wcmU+DQo8cHJl
PiZndDsgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pPC9w
cmU+DQo8cHJlPiZndDsgPC9wcmU+DQo8cHJlPiZndDsgZGlmZiAtLWdpdCBhL21ldGEvbGliL29l
L3NzdGF0ZXNpZy5weSBiL21ldGEvbGliL29lL3NzdGF0ZXNpZy5weTwvcHJlPg0KPHByZT4mZ3Q7
IGluZGV4IGY5NDNkZjE4MWUuLmYwNDFhMGM0MzAgMTAwNjQ0PC9wcmU+DQo8cHJlPiZndDsgLS0t
IGEvbWV0YS9saWIvb2Uvc3N0YXRlc2lnLnB5PC9wcmU+DQo8cHJlPiZndDsgKysrIGIvbWV0YS9s
aWIvb2Uvc3N0YXRlc2lnLnB5PC9wcmU+DQo8cHJlPiZndDsgQEAgLTMyMSwxMSArMzIxLDE4IEBA
IGRlZiBmaW5kX3NpZ2luZm8ocG4sIHRhc2tuYW1lLCB0YXNraGFzaGxpc3QsIGQpOjwvcHJlPg0K
PHByZT4mZ3Q7ICAgICBpZiBub3QgdGFza25hbWU6PC9wcmU+DQo8cHJlPiZndDsgICAgICAgICAj
IFdlIGhhdmUgdG8gZGVyaXZlIHBuIGFuZCB0YXNrbmFtZTwvcHJlPg0KPHByZT4mZ3Q7ICAgICAg
ICAga2V5ID0gcG48L3ByZT4NCjxwcmU+Jmd0OyAtICAgICAgICBzcGxpdGl0ID0ga2V5LnNwbGl0
KCcuYmI6Jyk8L3ByZT4NCjxwcmU+Jmd0OyAtICAgICAgICB0YXNrbmFtZSA9IHNwbGl0aXRbMV08
L3ByZT4NCjxwcmU+Jmd0OyAtICAgICAgICBwbiA9IG9zLnBhdGguYmFzZW5hbWUoc3BsaXRpdFsw
XSkuc3BsaXQoJ18nKVswXTwvcHJlPg0KPHByZT4mZ3Q7IC0gICAgICAgIGlmIGtleS5zdGFydHN3
aXRoKCd2aXJ0dWFsOm5hdGl2ZTonKTo8L3ByZT4NCjxwcmU+Jmd0OyAtICAgICAgICAgICAgcG4g
PSBwbiArICctbmF0aXZlJzwvcHJlPg0KPHByZT4mZ3Q7ICsgICAgICAgIGlmIGtleS5jb3VudCgn
OicpICZndDs9IDI6PC9wcmU+DQo8cHJlPiZndDsgKyAgICAgICAgICAgIHNwbGl0aXQsIHRhc2tu
YW1lLCBhZmZpeCA9IGtleS5zcGxpdCgnOicsIDIpPC9wcmU+DQo8cHJlPiZndDsgKyAgICAgICAg
ZWxzZTo8L3ByZT4NCjxwcmU+Jmd0OyArICAgICAgICAgICAgc3BsaXRpdCwgdGFza25hbWUgPSBr
ZXkuc3BsaXQoJzonLCAxKTwvcHJlPg0KPHByZT4mZ3Q7ICsgICAgICAgICAgICBhZmZpeCA9ICcn
PC9wcmU+DQo8cHJlPiZndDsgKyAgICAgICAgcG4gPSBvcy5wYXRoLnNwbGl0ZXh0KG9zLnBhdGgu
YmFzZW5hbWUoc3BsaXRpdCkpWzBdLnNwbGl0KCdfJylbMF08L3ByZT4NCjxwcmU+Jmd0OyArICAg
ICAgICBhZmZpeGl0ZW1zID0gYWZmaXguc3BsaXQoJzonKTwvcHJlPg0KPHByZT4mZ3Q7ICsgICAg
ICAgIGlmIGFmZml4aXRlbXNbMF0gPT0gJ3ZpcnR1YWwnOjwvcHJlPg0KPHByZT4mZ3Q7ICsgICAg
ICAgICAgICBpZiBhZmZpeGl0ZW1zWzFdID09ICduYXRpdmUnOjwvcHJlPg0KPHByZT4mZ3Q7ICsg
ICAgICAgICAgICAgICAgcG4gPSBwbiArICctbmF0aXZlJzwvcHJlPg0KPHByZT4mZ3Q7ICsgICAg
ICAgICAgICBpZiBhZmZpeGl0ZW1zWzFdID09ICdtdWx0aWxpYic6PC9wcmU+DQo8cHJlPiZndDsg
KyAgICAgICAgICAgICAgICBwbiA9IGFmZml4aXRlbXNbMl0gKyAnLScgKyBwbjwvcHJlPg0KPHBy
ZT48YnI+PC9wcmU+DQo8cHJlPkhvdyBkaWQgeW91IG5vdGljZSB0aGlzIHByb2JsZW0sIHdoYXTi
gJlzIHRoZSBhY3R1YWwgY2hhbmdlIGJldHdlZW4gdGhpcyBhbmQgdjEsIGFuZCBtb3JlIGltcG9y
dGFudGx5IGNhbiB3ZSBhZGQgYSB0ZXN0IGNhc2UgZm9yIHRoaXMgb2J2aW91c2x5IGNvbXBsZXgg
Y29kZT88L3ByZT4NCjxwcmU+PGJyPjwvcHJlPg0KPHByZT5Sb3NzPC9wcmU+DQo8cHJlPjxicj48
L3ByZT4NCjwvYmxvY2txdW90ZT4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_cae7fd83d8a89ea2eceba96bc6020e8d8077ba5acamelmediatekco_--

