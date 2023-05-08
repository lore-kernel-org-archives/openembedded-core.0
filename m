Return-Path: <david.reyna@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19B4C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:54:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.104285.1683543274148369390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 03:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VPiGS3O1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44927bbe97=david.reyna@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3489csk7016092
	for <openembedded-core@lists.openembedded.org>; Mon, 8 May 2023 10:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=QQ75/nZ45McBGh5PUbsM7OHWbCTaZ9TzGSZ8ef+EumU=;
 b=VPiGS3O1brnMnwr4MteKLq+UaafhSbySAWa3TFZUzTOVKT05IvLRTz30Q2bcVQ4ih7hI
 +2WTD9StrXqx3d1/OvGIcuqOAQFB8cj65gmCrbJIyfml6TgcsLLRplGfSBjQKWuxgqg1
 Rr1cH/2SEXi24BKfClrFJLO+6uxNl7jPpHy6IEROxO3n7y4mHl4bgN0o+PlrJmPq/7jw
 T8QVSi2hhcgIQQonaxh3bNqCqa0I5Qn5wfzTIPcEzJ/SU6UXo8xhkjJOUWeXUZnMdpOC
 CzLySU8nvzitwjSWyIJv5jUwE/6tXHRnti+BIOfV64kh+5w4DqXHYO90Sa58IacMNAzc Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qdc441ppg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 10:54:33 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 348AjNja004233
	for <openembedded-core@lists.openembedded.org>; Mon, 8 May 2023 10:54:32 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qdc441ppf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 10:54:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ofepx8vi6pSDygivilIGXQ194gRtSfKZH2pvwufibBvMpw2Iw0yrwlRTa0YPRcIOgdzJKRGzHKSd4g9Kdh91K/cQUWBMtGdmdTfzTSx6M5zQXvlHXmaJsYsBIoCckb6UOmMan+9eK0DFcn2HE/n8T7iwbETYRHb6PgATMXVKyiYDrnzIRxTr0TiLhlrLAEQPRoKy5KADLScsXmHmuNyDcsJQi3eYnrhWYQoC15ApS5DXUqZDr2ZUZbus/Xz/1B6kB/Ym5QeSeFuFtXlfFDqFk7WZsPJIvIUiSqDKJ7eQPE8t/6mgGfgSULtYeOBI0FSEk35dH6PIVnHzqC4/ClxOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ75/nZ45McBGh5PUbsM7OHWbCTaZ9TzGSZ8ef+EumU=;
 b=XbuplQukzCaeadqNBn3WvnrNwMVt+17ENlmpydJn97iDEkkI5TmGHxzvuCLQ9I9MZpu+7A3CUiDGSkVMtEHB0iq6ai8K/0HQvlewYnaONj31F/NbULIbyx7485KhoFB61/ifexm2K1bEPEMSWWI9WD9+OCKwWmt5qH8qDOsiMu0ecFuDET8ZXoBIrVR+C8MBAPQMGQKmBrVOanfTgIVjdOW/xExheao8EZUeMtw0w9+nNxfDf7eFEIsYrfiW7RlGZnK+j22S9/WvtrCndSXqXsbP4H5pFXTRw+ictuKBIpjTJ2kq5zdrG0x7Bz3DhKRsoRFXGrjTAKO2iVgyOS8I+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB4167.namprd11.prod.outlook.com (2603:10b6:a03:185::28)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 10:54:29 +0000
Received: from BY5PR11MB4167.namprd11.prod.outlook.com
 ([fe80::3a20:96ba:1025:9c2f]) by BY5PR11MB4167.namprd11.prod.outlook.com
 ([fe80::3a20:96ba:1025:9c2f%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 10:54:29 +0000
From: "Reyna, David" <david.reyna@windriver.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>,
        Nicolas Dechesne
	<ndec13@gmail.com>
CC: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
        "yocto-advocacy@lists.yoctoproject.org"
	<yocto-advocacy@lists.yoctoproject.org>,
        openembedded-core
	<openembedded-core@lists.openembedded.org>,
        Josef Holzmayr
	<jester@theyoctojester.info>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [Yocto-Advocacy] [OE-core] Yocto Project Community Manager
 updates
Thread-Topic: [Yocto-Advocacy] [OE-core] Yocto Project Community Manager
 updates
Thread-Index: AQHZf3mZnezC7uTux0aTVvI1ohBOH69QNXWw
Date: Mon, 8 May 2023 10:54:29 +0000
Message-ID: 
 <BY5PR11MB4167EE2230A997C5F31C4B23EA719@BY5PR11MB4167.namprd11.prod.outlook.com>
References: 
 <CAOT3mi+DorC4uSqCwO7HmmFVuXX3BLFWJNp_o-NH4OmqP=6ZSg@mail.gmail.com>
 <CAMKF1sq-grYZTE6iLqEuFc4O5_EHoUYDzanywi94a_cNsmG0Bg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq-grYZTE6iLqEuFc4O5_EHoUYDzanywi94a_cNsmG0Bg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4167:EE_|SJ0PR11MB5134:EE_
x-ms-office365-filtering-correlation-id: b1ebd6cf-ee18-4605-c4a5-08db4fb298dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 N/K6lUogBoY/ayysLhYZEzVL/s3OugpBE977KB+CDZGYhSKaHOAVFxegOyHqYpKmkgEDxavH5k9ApWwZdhzyJP8fxBkEI36w0mt2J9dGFUFmsafuKDdmEwMsigVK/F8ztv0UmiDu5mCcnDTdYoeIh/HtybsQJEeYWkqV1+YZHoIBe2n6g7de2V3vSB/Md+ElEQK5UFLgp2ebuBXjHNoZ6sWnI+vEpt2w347LMBmIQca0bLaDEDhUUvRltveri9dZ3xmTo4qmJ+8oMFTQx0kobclT2tABOuDZ8ebXCVk2QuQ1lpU2v20zwfXrp54D0ROxCWD1racWeOB0fxqgheJXc39N2zsI8CEpzWWRnjPEjSk1xcj7fBJGa3RZgqpsldzzygj687rKOqCAhQNmJy/IAYhdttD8VLi4dAlkO/1NEGCRW305icOj+62oEX0Y/vU+o5O0P8P3qENJpzsbIEhbD95urcOP5cc91VSsz5pjUrm3twm2ygttL6s995AOvNlwK02CUn8bsHW8ldPPnpkD1xCHITWm3XOlPnhBTGP7rg8XY+RbxNofObsUV1JCLUdYhstReAwQKD3F6PjcZD9teZUBw/Rn58Id5jDqeP2JuJscbA+x+3EYiV3E8dNHvnPa
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4167.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(136003)(396003)(39850400004)(451199021)(7696005)(54906003)(45080400002)(478600001)(110136005)(71200400001)(53546011)(186003)(9686003)(26005)(15650500001)(8676002)(8936002)(41300700001)(66476007)(76116006)(2906002)(66556008)(66946007)(66446008)(64756008)(5660300002)(52536014)(4326008)(38070700005)(6506007)(316002)(86362001)(38100700002)(33656002)(55016003)(83380400001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aHcvbUcwcVNnQWN3VGdTWnRxSlIvK2lCYXpETEF3L2VmTWhBdVZKdWFHK0Jx?=
 =?utf-8?B?Z2lEVndWK09OY0hpZWwrWlMvRjFidDBBNzIzQlVzd1o1Qm55RXpmcWNsb3la?=
 =?utf-8?B?cHBOSWxpNnNLU2U5ckMveUExR0dOU240cE9MZVJ4M3UvWTBPMUZ6NGN4V01s?=
 =?utf-8?B?YkhGb08rRWd6aGFsdFlHWFZPaktkanMrbGNxNTcwYnp0UE91YXNTbWR3bDZG?=
 =?utf-8?B?aXpWSjRsMmdTamU2cmRmSXA1Rk1oWjdmbVVBeTR2dVM4NG1YWnVjUmQ5cVVR?=
 =?utf-8?B?OVBlbVhMTG92d3BicmtZSU5nbjdMTEZMQWtnR0pkOWpXbVVYQUZrakRZUjBi?=
 =?utf-8?B?eVVpQ0JKWnp2NE1icGRXNU1EV2wwMGpYZlJYL3BWM3dvQStLa3BzQ3hEOFdV?=
 =?utf-8?B?cGdsRTRpa2FGbTZ1cEVmVGdvSDJCRk1hV2hvMW10S0JjYS9kK01yZytIQldt?=
 =?utf-8?B?eXY1OThicEhLbWYzT1RlMDhBaVp4UDJZdThrN3pwRTljaW9Jdk50aFZFaEFX?=
 =?utf-8?B?L0pKbm9ZZVQ5bWE5cFM0ZmRncXFsSkY1UlVUSkZtb1BXY1dzU2tzQUk5Q1l5?=
 =?utf-8?B?M2FqVHJLc3ZuV013U2FuZ29QM2tyMDFZU2dEQmM4bllDTG8vazVjTnhic3ZQ?=
 =?utf-8?B?WDRJRWFvRmtodmRWU2FLR3o4RXh6akM4RVRqTHZaaDE4NmEremc4VlVOR3ox?=
 =?utf-8?B?Nk1vYjY0blpOQVpCOXRWNEdGYWR1eVlzS0tQdWNnUzdiTjI1MDRBb21BZ05p?=
 =?utf-8?B?dmpPNGh1SEZJaW12Ny9HQUsrRksyVWNmc0crM2ZzYWhWdHVkcjAwa0VxSmds?=
 =?utf-8?B?K2RwbGVaaG8xUUpkd3VzSWxyd1FIWDlTSGhlK1VuTlJwL1AzNGxZQ0tvWG53?=
 =?utf-8?B?V3lzQ2V6SnMrbGxSSTNnUXJhL29BeVdYRTR4MnMvbHRaeFg0NHRNc0M1YllK?=
 =?utf-8?B?Q2ZuUmtXQ1F3d1Q3QlVMdGY3TGM0WTl6QklzY1Vqdi96bzN4SUFaRU91Uzdj?=
 =?utf-8?B?QXhvRGtCdW9UUnBWRWxkcU0vQkdVQm9lSXQwbWRFUkNobkh6QTA3SHdxNndE?=
 =?utf-8?B?U2NIak5GQlVPYU1vTlNxdGNzREVSTGlOODZpMUhVbGsrelZvUGRha25KRUQ1?=
 =?utf-8?B?UTFySlpkdUhNc1pmUnlaRTVWcGZnOEoweWo3a2xMU1N3enljVnF2b2hKRHRp?=
 =?utf-8?B?bkhGU25uekpLdnBoRmFBazl1V01wemNqT1NKbVhWUmx6SitKSzhuU3NYZFJz?=
 =?utf-8?B?M242cjJsZFlDQStIRU9CdUVxUFgyUDN2ZVI4UENlckRWcUFlUWpUdndxRFVT?=
 =?utf-8?B?ZmFPNFozd0lrVUdleFdha0ZvUHptQitDNEpaVjU0QXQvdXBWYkhDODJIYUdC?=
 =?utf-8?B?eU9xU0dXdXlBZXF3ZCtsNlB5N1E4L2h0QW1SSHZoSVRkeFZhdE50Sm5jd29s?=
 =?utf-8?B?Rlh1T0o4N1ppNVE0azJkalhoRkdJYy9WNE5zVTU3NkpoalJzNjJqQVM0Zm0y?=
 =?utf-8?B?QjhhMEZUSEdNOE55aTBraVh4R1RybldrbVhRTUZ6dXptV2tGeDB4empDdmJF?=
 =?utf-8?B?U283UHBhcmhDKytZM09tS3QvUFJ2M0VDNmJnaytmM1R1eFUxdzQrNXZjVWx4?=
 =?utf-8?B?b3ZoSVNVdE9wWno0NjkxdTlmeVdVWXk0NnlZaTBOSlVKMEg0eWpBZFNnc01K?=
 =?utf-8?B?d2g1bWVHR2tkU3FvY2JMNy9XNDhMT29xaHVBaDAvUkNUb21wbFA2ajBZNWNt?=
 =?utf-8?B?Z0FvSXhtcFpVaitKZWttZi8vV0xlRmNobGlYTnpSR24zY2tHK3BZa3JVUENX?=
 =?utf-8?B?R3kyU3EvN3QrNE1IYmlVaUpCVDJvWHg3bG5sTHFmU2ovU3NYMS9IRDFLUmRN?=
 =?utf-8?B?a0xBN1pyQ0dXNzZ5Sno2T2R5RzJyekFKSW4xbmQ4WFZPa2l0Y3pyS1pqelVo?=
 =?utf-8?B?dVJ6MEZMT0hVSnR2aFFoVjFNUFVPRXcyVDlJQm9EczhkYkoyRVk4VnJvMHhY?=
 =?utf-8?B?TTBzcmxxRFFqRzkzYU9lQm1JVU1tTzlBbnpGaXFYa0FCSk51S1lVZEIvc1JK?=
 =?utf-8?B?Z05TQmN2MFZkbXhVeUp5d0JOV3UyMFozUkhwdFFTQ2VHcGx3ZFpWRXhQc21m?=
 =?utf-8?Q?CtSDh5o2iQZfcBRffMN/9jS6C?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4167.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ebd6cf-ee18-4605-c4a5-08db4fb298dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 10:54:29.0245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: um8qH3z9vlFB/OXJ6jGIRIE06+7XSNVeFY3LmkywVgazudw4AorrM1oMn309ewMJwnz4LAdpnIx2JU8nwhTGCkrAk1hrdgGCf6aIudgPaKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
X-Proofpoint-ORIG-GUID: E8D12Bq1NY8vCNq-Dc50bkvJMr3w94yN
X-Proofpoint-GUID: pkoRkVpxFAGM51cBI0E_hlE3W0NKgN53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=427 mlxscore=0 suspectscore=0 clxscore=1011 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 10:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181020

SGkgTmljbywNCg0KVGhhbmsgeW91IGZvciB0aGUgbWFueSB5ZWFycyBvZiBhY2NvbXBsaXNobWVu
dCBhbmQgY29udHJpYnV0aW9uLg0KDQpJbiBhZGRpdGlvbmFsIHRvIGFsbCB0aGUgb3RoZXIgdGhp
bmdzIHlvdSBoZWxwZWQgZm9zdGVyLCBJIHdvdWxkIGxpa2UgdG8gc3BlY2lmaWNhbGx5IHRoYW5r
IHlvdSBmb3IgeW91ciBoZWxwIHdpdGggYWxsIHRoZSBEZXZEYXlzIEkgcmFuIChsaWtlIDggb3Ig
OSBvZiB0aGVtISkuIFlvdSB3ZXJlIGFsd2F5cyB0aGVyZSB3aGVuIEkgbmVlZGVkIHNvbWVvbmUg
aGVscCBvdXQgb3IgZXZlbiBqdXN0IHRvIGJvdW5jZSBpZGVhcyBvZmYgb2YsIGFuZCB0aGF0IHJl
YWxseSBoZWxwZWQgbWFrZSB0aGluZ3MgaGFwcGVuIGFuZCBoYXBwZW4gd2VsbC4NCg0KQW5kIHdp
dGggYWxsIHRoYXQsIHlvdSBhbHNvIGNvdWxkIG5vdCBoYXZlIGJlZW4gYSBuaWNlciBwZXJzb24g
dG8gd29yayB3aXRoIQ0KDQpUaGFua3MuIFlvdSB3aWxsIGJlIG1pc3NlZC4NCkRhdmlkDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiB5b2N0by1hZHZvY2FjeUBsaXN0cy55b2N0
b3Byb2plY3Qub3JnIDx5b2N0by1hZHZvY2FjeUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBC
ZWhhbGYgT2YgS2hlbSBSYWogdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClNlbnQ6IEZyaWRh
eSwgTWF5IDUsIDIwMjMgMTA6NDcgQU0NClRvOiBOaWNvbGFzIERlY2hlc25lIDxuZGVjMTNAZ21h
aWwuY29tPg0KQ2M6IHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IHlvY3RvLWFkdm9jYWN5
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IG9wZW5lbWJlZGRlZC1jb3JlIDxvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPjsgSm9zZWYgSG9sem1heXIgPGplc3RlckB0aGV5
b2N0b2plc3Rlci5pbmZvPjsgUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91
bmRhdGlvbi5vcmc+DQpTdWJqZWN0OiBSZTogW1lvY3RvLUFkdm9jYWN5XSBbT0UtY29yZV0gWW9j
dG8gUHJvamVjdCBDb21tdW5pdHkgTWFuYWdlciB1cGRhdGVzDQoNCk5pY28sIHRoYW5rcyBmbyBh
bGwgeW91ciBjb250cmlidXRpb25zIHRvIHByb2plY3QuIFdlIHdpbGwgbWlzcyB5b3UuDQoNCk9u
IFRodSwgTWF5IDQsIDIwMjMgYXQgNzo0MOKAr0FNIE5pY29sYXMgRGVjaGVzbmUgPG5kZWMxM0Bn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBEZWFyIGFsbCwNCj4NCj4gQWZ0ZXIgZml2ZSB5ZWFycywg
SSBoYXZlIGRlY2lkZWQgdG8gcmVzaWduIGZyb20gbXkgcG9zaXRpb24gYXMgdGhlIFlvY3RvIFBy
b2plY3QgQ29tbXVuaXR5IE1hbmFnZXIuIEkgam9pbmVkIHRoZSBPcGVuRW1iZWRkZWQgY29tbXVu
aXR5IGFyb3VuZCAyMDA4LiBJIGhhdmUgZm9uZCBtZW1vcmllcyBvZiBteSBlYXJseSBkYXlzLCBh
bmQgc3RpbGwgcmVtZW1iZXIgc29tZSBvZiBteSBmaXJzdCBpbnRlcmFjdGlvbnMgb24gSVJDIGFu
ZCBtYWlsaW5nIGxpc3RzISBUaGlzIGlzIGEgdmVyeSB3ZWxjb21pbmcgY29tbXVuaXR5LCBhbHdh
eXMgaGVscGluZyBuZXcgcGVvcGxlIHdpdGggcGF0aWVuY2UgYW5kIGtpbmRuZXNzLiBTZXJ2aW5n
IHRoZSBwcm9qZWN0IGR1cmluZyB0aGUgbGFzdCBmaXZlIHllYXJzIGlzIHNvbWV0aGluZyBJIGFt
IHZlcnkgcHJvdWQgb2YsIGFuZCBJIHdpbGwgYmUgZm9yZXZlciBncmF0ZWZ1bCB0byBhbGwgb2Yg
eW91IGZvciBhY2NlcHRpbmcgbWUhDQo+DQo+IER1cmluZyB0aGVzZSB5ZWFycywgd2UgaGF2ZSBn
b25lIHRocm91Z2ggYSBsb3QgdG9nZXRoZXIsIHRoZSBwYW5kZW1pYyBnYXZlIHVzIGFuIG9wcG9y
dHVuaXR5IHRvIHJldGhpbmsgaG93IG91ciBjb21tdW5pdHkgc2hvdWxkIGNvbWUgdG9nZXRoZXIu
IFNldHRpbmcgdXAgb3VyIFZpcnR1YWwgU3VtbWl0cyBoYXMgYmVlbiBhIGxvdCBvZiB3b3JrIChh
bmQgc3RyZXNzISkgZm9yIGEgZ3JvdXAgb2YgZmV3IHBlb3BsZSwgYnV0IHRoZSBuZXZlciBlbmRp
bmcgc3VjY2VzcyBvZiB0aGVzZSBldmVudHMgaGFzIGJlZW4gdmVyeSByZXdhcmRpbmchIE91ciBv
bmxpbmUgcHJlc2VuY2UgaW4gc29jaWFsIG1lZGlhIGhhcyBkcmFtYXRpY2FsbHkgaW1wcm92ZWQs
IGFuZCBhbGxvd3MgdXMgdG8gcmVhY2ggb3V0IHRvIGFuZCBpbnRlcmFjdCB3aXRoIG91ciBjb21t
dW5pdHkgZmFzdGVyIHRoYW4gZXZlciBiZWZvcmUhDQo+DQo+IE9uIHRoZSBzaWRlIG9mIGFsbCB0
aGUgdGVjaG5pY2FsIGNoYW5nZXMsIGFuZCByZWxlYXNlcywgd2UgaGF2ZSBhbHNvIGVzdGFibGlz
aGVkIHRoZSBZb2N0byBMVFMgcHJvY2VzcyB3aGljaCB3YXMgYSByZWN1cnJpbmcgcmVxdWVzdCBm
cm9tIHRoZSBjb21tdW5pdHkgYW5kIGhhcyBiZWNvbWUgYSBzdHJlbmd0aCBvZiB0aGUgcHJvamVj
dCEgV2UgYWxzbyByZXZhbXBlZCB0aGUgcHJvamVjdCBkb2N1bWVudGF0aW9uIHRvIG1ha2UgaXQg
ZWFzaWVyIHRvIG1haW50YWluIGFuZCBjb250cmlidXRlLiBUaGUgWW9jdG8gUHJvamVjdCBkb2N1
bWVudGF0aW9uIGlzIHN1Y2ggYSBncmVhdCByZXNvdXJjZSBmb3Igb3VyIGNvbW11bml0eSEgSSBo
YXZlIHNwZW50IHNvIG1hbnkgaG91cnMgb24gdGhlc2UgUERGcyBpbiBteSBlYXJseSBkYXlzIQ0K
Pg0KPiBBbnl3YXksIGxldOKAmXMgbm90IGZvY3VzIG9uIHRoZSBwYXN0ISBUaGUgZnV0dXJlIGxv
b2tzIGJyaWdodCBhbmQgSSBhbSByZWFsbHkgZXhjaXRlZCB0byBhbm5vdW5jZSB0aGF0IEpvc2Vm
IEhvbHptYXlyIGhhcyBhY2NlcHRlZCB0byB0YWtlIG92ZXIgdGhlIENvbW11bml0eSBNYW5hZ2Vy
IHJvbGUuIEpvc2VmIG5lZWRzIG5vIGludHJvZHVjdGlvbiwgaGUgaGFzIGJlZW4gYSBrZXkgbWVt
YmVyIG9mIHRoaXMgY29tbXVuaXR5IGZvciBzbyBtYW55IHllYXJzLiBUaGFua3MgdG8gSm9zZWYn
cyByZWxlbnRsZXNzIGVmZm9ydHMsIHdlIGhhdmUgZ3Jvd24gb3VyIHNvY2lhbCBtZWRpYSBwcmVz
ZW5jZSBvbiBZb3V0dWJlLCBUd2l0dGVyLCBMaW5rZWRJbiBhbmQgTWFzdG9kb24hIEhpcyBlbmVy
Z3kgd2lsbCBiZSBhIGdyZWF0IHNvdXJjZSBvZiBpbnNwaXJhdGlvbiBmb3IgdGhpcyBjb21tdW5p
dHkhIEkgd2lzaCBKb3NlZiBhbmQgWW9jdG8gdGhlIGJlc3QgZm9yIHRoZSB5ZWFycyB0byBjb21l
LCBhbmQgSSBhbSBjb252aW5jZWQgdGhpcyBjb21tdW5pdHkgaXMgaW4gZ29vZCBoYW5kcyBhbmQg
dGhhdCBKb3NlZiB3aWxsIGJlIGEgZ3JlYXQgY29tbXVuaXR5IGxlYWRlciENCj4NCj4gTWFueSB0
aGFua3MhDQo+IE5pY28NCj4NCj4gDQo+DQo=

