Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485B3C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 10:12:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.55])
 by mx.groups.io with SMTP id smtpd.web10.24351.1699611145643045563
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Nov 2023 02:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=doxdhCrs;
 spf=pass (domain: welotec.com, ip: 40.107.20.55, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhtm/Z71aQgFgTQq1kWTftHTmS7JCT2j9NYFQfChJCut3VuSxrlRjcSMsAg8ZiaNi+c9R4Tv6WIfyhiV0uGYuzpG1P9H3I/bdqDxb7oJbq3kTlHi7vOXay4/dCWl/L3kcvISzJtvZ7C8336qJMO9J0YCFac6avm7kD92hGBh4dQ/6+al0CK2pvCfftbjDjhgZ5FhlxjUhiE9Dm7w3wKu8Vu2Q2sM07jBDGkibEnvl7nqsLZkYoaD7ATb5mOeXEVs5VsUMW2Hw8QKBEXMceabEOR3LH9YB6QnG8y/CVoc1WB+KNT1kXViVx4SxPoDnHVycNDPZ8Iu2vW8/Mhu63Kw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z29BkAcKc07He9y8msjNHIH6I1g/oUKCcaw8c/eCWBA=;
 b=ICmTJFThzJFqtDZCizGJ9UPptzjLNyBFTPM1g03s0ihkrM2WLN9ahfMoBLCHtzANoBAnNyowS6wfHDoYVqAJzA3LbVi0dt09hwL3g0dDn0IZcOLJE4/zsDJEkfp59qJ5NJ3lMoAtAZfkeXDGGEfutQYydOoFn50jAoohCDi0DNnRcW+FZkToMeRpPWM6UqptZgMuoGUXJy1yn87Mo54HHveK6NbqJj1+Ln45qnAPzHqNWM9RymYUs6/CACQNxtkl4qxLdCLZ/fEtOaNBRtajyOxXLj/mqX0lkDrOBcbfU0exTW55zEx6Z016kITf/91w/IIK80uogGco71KO2u2Ypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z29BkAcKc07He9y8msjNHIH6I1g/oUKCcaw8c/eCWBA=;
 b=doxdhCrsVd4GgybQba4i6N1xm7AHZKpdVQRe4lHsY5X4zojzfaCOo/9HnPngEk1Sel2Y4CgauSMvkV0lInskKGmmjdWjYGxLw+4UFaPwyxbHlzmRXlJsnTsDE/qEdnrrOIoIc1tlEaQbKh4GiVVKeHhREmsiLuoTBJ6BQFYzh0Y3TF3yX3aivS4pSnjV1PrNi2N4b0Z66NHFO4IzDMPwP7HvvhwHasPuWdQ5kC9Ypepi903WHmYXT5wyNB7h36tIB51KIiaT23A7LhZo9+v9s1XUOVSDv/YAc69pFSrPylqYw5t95pZZ95NR3DZJTnJq+5gAkrQ7tFm8WM0O3y9OGw==
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB9258.eurprd04.prod.outlook.com (2603:10a6:10:372::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.10; Fri, 10 Nov
 2023 10:12:21 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::a038:57ac:22bc:9918]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::a038:57ac:22bc:9918%6]) with mapi id 15.20.6977.016; Fri, 10 Nov 2023
 10:12:20 +0000
From: =?utf-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: =?utf-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
Subject: Re: [OE-Core][PATCH v14 03/11] sstate.bbclass: override tar with
 tar-native
Thread-Topic: [OE-Core][PATCH v14 03/11] sstate.bbclass: override tar with
 tar-native
Thread-Index: AQHZ/3gR441rZw67AEy2jVPMY0zZfrBLK2KAgAC9qwCAJ5TKAA==
Date: Fri, 10 Nov 2023 10:12:20 +0000
Message-ID: <2705101.mvXUDI8C0e@latitude>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
 <3bf4d3c6ef38532d316ec3eefc9d670aad5ba21d.camel@linuxfoundation.org>
 <178E804624FA5560.14388@lists.openembedded.org>
In-Reply-To: <178E804624FA5560.14388@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DB9PR04MB9258:EE_
x-ms-office365-filtering-correlation-id: ac423696-d5d3-4d29-7ff0-08dbe1d586b9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yGd75eCH7HGF/6bXuhxq7ZjQi3864yus4y/psRjS+HWnLT4Ic9CpapZdKWhuifBrovsh6zBEz86mcttNI9EW58hTQnFgEQg0yuXCUmYGCJKi18u6P5/7mGZpsktXwO+8gq4ivbN4kJNAxR0Pk3Eo2IPuMfgKSnapmkoXnDQS9NAGK9NgAv7PyREnIrwjo4uM5j8STmFpo14FEF79xRKAgtHQdXiVcRtOoHtFUyzfsjUAwKcBv/o/xH+kMRhFuUsAQ34GZfNYVuz3iYfxlEZheSul/MytmaB6g6H39NE3S7oaIa+Ppv9a2uJDa+BmlU98lFtwhHvknlj0+tSEleFxZFhtRC6ptcE2fS2plZauyrVxyoEsiSEMjWFxyUJyuTtZfn1tFpFj1HE1WfzFyZom7PbCpEn/U6NNeU6/ApM74XIuCxwDUuttuiBpEC8fImkbpjpWTYrvM1Z+qVkSnGG8p2sYf3q7MXrTeyfZcfov2pCL7kNSEVjSdrd00iquv9ruQln21UF1g96EwtyTqVbDKGidy9d8W/4AH98c70ENGgO1OB+RIpU8xlfXReOO501A2a/WjOEB9ajmhijC+Abf2vKdKnV3EnQLxqvKXBXbj2qkWE/PSDhYY+Omgrgw+4EZIbd0d/yH55cOzcX/EsZAWA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(136003)(396003)(346002)(39840400004)(366004)(451199024)(1800799009)(64100799003)(186009)(45080400002)(6486002)(966005)(478600001)(71200400001)(6506007)(38070700009)(85202003)(4001150100001)(86362001)(5660300002)(122000001)(41300700001)(2906002)(33716001)(85182001)(316002)(66476007)(110136005)(38100700002)(64756008)(91956017)(66446008)(76116006)(66946007)(66556008)(8676002)(8936002)(4326008)(66899024)(83380400001)(26005)(66574015)(107886003)(6512007)(9686003)(39026012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ejNhc1duc0VQT01qZ3ptSUh5ZFkzem04b3g5dEphU2tVVldYbG4wakdjRFVr?=
 =?utf-8?B?M1lVRWtHSWZCV3Z6bkpHMzNQQkNFK3JtZmowaXZMV2RtVFh0THpiQTZxTG9n?=
 =?utf-8?B?bEZXMjdhTkwvM2hFcXM2d0J4RFFPd1RWeFhrMUdFcFBWUWRQcElycW1NTFFu?=
 =?utf-8?B?cVJIMjZ6SkVOeXNsdWQvQ1dlazdkTE9TVEg5TklWN3B4WTRsK0JwRW5NS2Q5?=
 =?utf-8?B?c3NXNlYxbVdDa0pYMGJLS3Y1eUV3cEE0clVYNmQzM1hKc2M0MFNEWHdCSFVE?=
 =?utf-8?B?ZExLVFFnOXFhVVVmV3JoUkcyM3JGUk5hZW12bkpCNW1TaXl3T1hmM1JFNzZ5?=
 =?utf-8?B?Wk05WmYzVy9idHJNV000dmtPMW9DMXFqSzZnQ1plaENSMW4yYWEvT1F5aDk3?=
 =?utf-8?B?Tk1DVXM5V3dZc2JiM1pmZ1VUbTRwaE4xcjZ3aGltQ1dsM29OQ255RVpDemxE?=
 =?utf-8?B?QmxJR2R3bGpFL0V2MWdiRUpOMnlkWEc5Ni9ZdmVxSTJjZEN0d0M0TElzUlNY?=
 =?utf-8?B?NGRSZEk1dS94UXo5VW5nbTJnZDVsdnlNenlBMTdKVWYxRnVjb3R1TWpkQnpp?=
 =?utf-8?B?dG54emIvNFpBTENNT0NjUFgyRFNhaHhMNmRoN1lnODB0Qkcwc05wd21YeVdl?=
 =?utf-8?B?bHVtNGdBWm5WMnpWTEVweldrdVBiRFdLWXNCUEFkMUJYdHlVaXFUcVBTbG5C?=
 =?utf-8?B?eFR0cDBEZHJWekdzdDhIV0FVY2ZmV2tTVE5ublZZMFphUVErNjV4akZvcUtI?=
 =?utf-8?B?YkhOcENUUTMvTTcyMFc0aEwxYmxWNzNpYkVuL2RvRHZ2bFBBbWlPNWxOTmtj?=
 =?utf-8?B?WFZkVGEvTVE3UFVaN3NxWWFYSWJHOG4xQURkVGpXeUNWYU1DbC8vcVBVNkpT?=
 =?utf-8?B?SnJpN3RUc2hjV1JkUDZTMW1MZDF1d1ozTlFhazdHM3NHV1VLdWhiTVh1TUdm?=
 =?utf-8?B?aVFpY3V4SDArUkZvZGgrd2dBODR1bE1MSVlFQlFqaTFqZnl6empGWE1zUnB5?=
 =?utf-8?B?SkE0YVdCS0d3bi84SXdDTi96eFk5elZMTENMUHBMdlJWWEk3c1YrcnJjSWFn?=
 =?utf-8?B?cHA2ZndEMDRWWlRWSkxBd0RkN1hwWFczazdDbDU1Nkw5WVNvOEtISmo3ZWp5?=
 =?utf-8?B?MmNXWEFibFgyMm5DWWFCcFdBNWgxMklONmIyVkxxZE1UUVZHTFpqYXFjNkJp?=
 =?utf-8?B?blh2L3ZLRGhiRnJ0dEZaSURJK2E2b0taOU16UWdqMTJPczFSeUNkVnptL2VN?=
 =?utf-8?B?U2hCZG9tTyt6UzQybHhEeTZ2SE5vSUdaVzg0eDF0RC9ocEs1czV1VWsvRWl1?=
 =?utf-8?B?eTVtTGZMOTYvRllPMURXY2phSUpSRnpqY09oWXE4NVh2YXFQZVJTLzlsNzFW?=
 =?utf-8?B?ajd2d2dqTHdnNEhYS2twa2o1Sk9jQi91clU5dHl2R25lTHdoeno0eFFMTUtp?=
 =?utf-8?B?eWRkbW1pbVNMQ3JPTGlnK0pPRlc1QThoRFhCY3l2VExwZ094TGE2NnUxNTJC?=
 =?utf-8?B?RXM5U29VNGRkM09CaTlIdDZCYlZQcXhLY2kwVEpBcXRSTXVUZVFzZUlYZzFH?=
 =?utf-8?B?MnhFY0EzUG9WcHRXTmQ5RGc4ditmSjExa0JMSlphWmlxbFU1QmwxREpXckpr?=
 =?utf-8?B?am1mNVNtWVBCOVBXd1hHK2JhU1lVdmhQMzQ0NzkrQ1oxVWNNYVFadE4wNU5t?=
 =?utf-8?B?SE84Rm9ZNVRUM2g2R01ub0JOMzBzSjZRUFJWUHJwUUZSa2pINDVFVWtiekR2?=
 =?utf-8?B?YnE3VGIvN0xCM3RjSmxSbkZaR3dLRGV0b3IyMlZHcFJIU0xtcTlpSVptTCtI?=
 =?utf-8?B?Q3h1SkFuV1NHVWJGMXQvWTYreUdBaVBOT2V4Uzl2VWZ2T0ZndTNRSE9JVHN2?=
 =?utf-8?B?N0hJbW90QWNwVklkMEJybFU5OXZTdmdVZXNNTDRUd3VMS2lFaXQybUNVTjQr?=
 =?utf-8?B?cGR6cmFUbmhkalFYWXkxZjlUUGlMRkFCTUJEY2JXN2xJS0ZNYnhDbDE0Ukow?=
 =?utf-8?B?V0FXMVNMNXErTFdnaXJ3NDAzNTNiUmdpSVc5WFR1OVlVMUNuOVY1ZkhRVUxw?=
 =?utf-8?B?cHNEcGlkY2hQTFFDL0pjalQ0a3pyTTloWjVrdnVZcDhscDBaMW9MS0VzUFBN?=
 =?utf-8?Q?M7yGjMkUJCHMWdbBX3Av0n8nz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B6B8F84EF2C4B41B40FBF4D41D8A9A2@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac423696-d5d3-4d29-7ff0-08dbe1d586b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 10:12:20.7573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RLGC9wk09E+lPazJv/O6sKNx5W36aAwV5AkI8GJANOH8Y3r8LtHcLIR950r8BMZwGRlqGh7KclT46VCYTbWRKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9258
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Nov 2023 10:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190405

RG5pYSBwb25pZWR6aWHFgmVrLCAxNiBwYcW6ZHppZXJuaWthIDIwMjMgMDc6NDU6NDEgQ0VUIFBp
b3RyIMWBb2JhY3ogdmlhIApsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHBpc3plOgo+IERuaWEgbmll
ZHppZWxhLCAxNSBwYcW6ZHppZXJuaWthIDIwMjMgMjA6MjY6NDkgQ0VTVCBSaWNoYXJkIFB1cmRp
ZSBwaXN6ZToKPiA+IE9uIFN1biwgMjAyMy0xMC0xNSBhdCAxNjo1NyArMDIwMCwgUGlvdHIgxYFv
YmFjeiB3cm90ZToKPiA+ID4gRHVlIHRvIHRoZSBidWdzCj4gPiA+IGh0dHBzOi8vZXVyMDQuc2Fm
ZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnNhdmFubgo+
ID4gPiBhJTJGJmRhdGE9MDUlN0MwMSU3Q3AubG9iYWN6JTQwd2Vsb3RlYy5jb20lN0NiYWMzZjA0
YTA3NjY0YjNhOTEyYTA4ZGJjZTAKPiA+ID4gYjI4MmMlN0MyNTExMWE3ZjFkNWE0YzUxYTRjYTdm
OGU0NDAxMWIzOSU3QzAlN0MwJTdDNjM4MzMwMzE5NTQ1ODA4MzUxJTdDCj4gPiA+IFVua25vd24l
N0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJ
NklrMWhhVwo+ID4gPiB3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZzZGF0YT04NzV3
d3B4bXZZMTAlMkJVZHZFYkpGVEp3YzF6VyUyQnEKPiA+ID4gMFlPbjhnOXdnVnZkVUElM0QmcmVz
ZXJ2ZWQ9MAo+ID4gPiBoLmdudS5vcmclMkZidWdzJTJGJTNGNjE5MzQmZGF0YT0wNSU3QzAxJTdD
cC5sb2JhY3olNDB3ZWxvdGVjLmNvbSU3QzIwOAo+ID4gPiA0M2MKPiA+ID4gZDQwOWZmNDcxYWQ1
M2IwOGRiY2RhYzRkNTUlN0MyNTExMWE3ZjFkNWE0YzUxYTRjYTdmOGU0NDAxMWIzOSU3QzAlN0Mw
JTcKPiA+ID4gQzYzCj4gPiA+IDgzMjk5MTIxNDQwMjA0ODclN0NVbmtub3duJTdDVFdGcGJHWnNi
M2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYyCj4gPiA+IGx1TQo+ID4gPiB6SWlMQ0pC
VGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJnNkYXRhPVU4JTJGbW0w
Mk1SNXBzNQo+ID4gPiBidFIgSm5FMUVueVNOazROSlY0OThrUlg2NmpqZWVRJTNEJnJlc2VydmVk
PTAgYW5kCj4gPiA+IGh0dHBzOi8vZXVyMDQuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRnNhdmFubgo+ID4gPiBhJTJGJmRhdGE9MDUlN0MwMSU3Q3Au
bG9iYWN6JTQwd2Vsb3RlYy5jb20lN0NiYWMzZjA0YTA3NjY0YjNhOTEyYTA4ZGJjZTAKPiA+ID4g
YjI4MmMlN0MyNTExMWE3ZjFkNWE0YzUxYTRjYTdmOGU0NDAxMWIzOSU3QzAlN0MwJTdDNjM4MzMw
MzE5NTQ1ODA4MzUxJTdDCj4gPiA+IFVua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdM
akF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhVwo+ID4gPiB3aUxDSlhWQ0k2TW4w
JTNEJTdDMzAwMCU3QyU3QyU3QyZzZGF0YT04NzV3d3B4bXZZMTAlMkJVZHZFYkpGVEp3YzF6VyUy
QnEKPiA+ID4gMFlPbjhnOXdnVnZkVUElM0QmcmVzZXJ2ZWQ9MAo+ID4gPiBoLmdudS5vcmclMkZi
dWdzJTJGJTNGNTkxODQmZGF0YT0wNSU3QzAxJTdDcC5sb2JhY3olNDB3ZWxvdGVjLmNvbSU3QzIw
OAo+ID4gPiA0M2MKPiA+ID4gZDQwOWZmNDcxYWQ1M2IwOGRiY2RhYzRkNTUlN0MyNTExMWE3ZjFk
NWE0YzUxYTRjYTdmOGU0NDAxMWIzOSU3QzAlN0MwJTcKPiA+ID4gQzYzCj4gPiA+IDgzMjk5MTIx
NDQwMjA0ODclN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pR
SWpvaVYyCj4gPiA+IGx1TQo+ID4gPiB6SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0Ql
N0MzMDAwJTdDJTdDJTdDJnNkYXRhPUozY3dXV0FRNkJIUDFhRwo+ID4gPiBWZVAgMXlSSUduR3lH
MWZxVnZQYVZKWTZraktXYyUzRCZyZXNlcnZlZD0wLCB3aGljaCBhcmUgZml4ZWQgaW4gdGFyCj4g
PiA+IHZlcnNpb24gMS4zNSwgd2UgbmVlZCB0byBmb3JjZSB5b2N0byB0byB1c2UgaXQgaW5zdGVh
ZAo+ID4gPiBvZiB0aGUgb25lIHByb3ZpZGVkIGJ5IHRoZSBob3N0IG1hY2hpbmUuCj4gPiA+IAo+
ID4gPiBzc3RhdGVfY3JlYXRlX3BhY2thZ2UgYW5kIHNzdGF0ZV91bnBhY2tfcGFja2FnZSBmdW5j
dGlvbnMsCj4gPiA+IHdpbGwgdXNlIHRoZSB0YXIgcHJvdmlkZWQgYnkgdGFyIHJlY2lwZSwgd2hp
Y2ggaXMgYWxyZWFkeQo+ID4gPiBpbiBwcm9wZXIgdmVyc2lvbi4KPiA+ID4gCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFBpb3RyIMWBb2JhY3ogPHAubG9iYWN6QHdlbG90ZWMuY29tPgo+ID4gPiAtLS0K
PiA+ID4gCj4gPiA+ICBtZXRhL2NsYXNzZXMtZ2xvYmFsL3NzdGF0ZS5iYmNsYXNzIHwgNiArKysr
Ky0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtZ2xvYmFsL3NzdGF0ZS5iYmNs
YXNzCj4gPiA+IGIvbWV0YS9jbGFzc2VzLWdsb2JhbC9zc3RhdGUuYmJjbGFzcyBpbmRleCAyNjc2
ZjE4ZTBhLi41YWU2ZjUxNWYyIDEwMDY0NAo+ID4gPiAtLS0gYS9tZXRhL2NsYXNzZXMtZ2xvYmFs
L3NzdGF0ZS5iYmNsYXNzCj4gPiA+ICsrKyBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvc3N0YXRlLmJi
Y2xhc3MKPiA+ID4gQEAgLTE1Miw3ICsxNTIsOSBAQCBweXRob24gKCkgewo+ID4gPiAKPiA+ID4g
ICAgICBlbHNlOgo+ID4gPiAgICAgICAgICBkLnNldFZhcignU1NUQVRFX01BTk1BQ0gnLCBkLmV4
cGFuZCgiJHtQQUNLQUdFX0FSQ0h9IikpCj4gPiA+IAo+ID4gPiAtICAgIGlmIGJiLmRhdGEuaW5o
ZXJpdHNfY2xhc3MoJ25hdGl2ZScsIGQpIG9yCj4gPiA+IGJiLmRhdGEuaW5oZXJpdHNfY2xhc3Mo
J2Nyb3Nzc2RrJywgZCkgb3IgYmIuZGF0YS5pbmhlcml0c19jbGFzcygnY3Jvc3MnLAo+ID4gPiBk
KTogKyAgICBpc19uYXRpdmUgPSBiYi5kYXRhLmluaGVyaXRzX2NsYXNzKCduYXRpdmUnLCBkKSBv
cgo+ID4gPiBiYi5kYXRhLmluaGVyaXRzX2NsYXNzKCdjcm9zc3NkaycsIGQpIG9yIGJiLmRhdGEu
aW5oZXJpdHNfY2xhc3MoJ2Nyb3NzJywKPiA+ID4gZCkgKwo+ID4gPiAKPiA+ID4gKyAgICBpZiBp
c19uYXRpdmU6Cj4gPiA+ICAgICAgICAgIGQuc2V0VmFyKCdTU1RBVEVfRVhUUkFQQVRIJywgIiR7
TkFUSVZFTFNCU1RSSU5HfS8iKQo+ID4gPiAgICAgICAgICBkLnNldFZhcignQkJfSEFTSEZJTEVO
QU1FJywgIlRydWUgJHtTU1RBVEVfUEtHU1BFQ30KPiA+ID4gICAgICAgICAgJHtTU1RBVEVfU1dT
UEVDfSIpCj4gPiA+ICAgICAgICAgIGQuc2V0VmFyKCdTU1RBVEVfRVhUUkFQQVRIV0lMRENBUkQn
LCAiJHtOQVRJVkVMU0JTVFJJTkd9LyIpCj4gPiA+IAo+ID4gPiBAQCAtMTY0LDYgKzE2Niw4IEBA
IHB5dGhvbiAoKSB7Cj4gPiA+IAo+ID4gPiAgICAgICAgICBkLmFwcGVuZFZhckZsYWcodGFzaywg
J3Bvc3RmdW5jcycsICIgc3N0YXRlX3Rhc2tfcG9zdGZ1bmMiKQo+ID4gPiAgICAgICAgICBkLnNl
dFZhckZsYWcodGFzaywgJ25ldHdvcmsnLCAnMScpCj4gPiA+ICAgICAgICAgIGQuc2V0VmFyRmxh
Zyh0YXNrICsgIl9zZXRzY2VuZSIsICduZXR3b3JrJywgJzEnKQo+ID4gPiAKPiA+ID4gKyAgICAg
ICAgaWYgbm90IGlzX25hdGl2ZToKPiA+ID4gKyAgICAgICAgICAgIGQuYXBwZW5kVmFyRmxhZyh0
YXNrLCAnZGVwdGFzaycsICcKPiA+ID4gdGFyLXJlcGxhY2VtZW50LW5hdGl2ZTpkb19wb3B1bGF0
ZV9zeXNyb290Jyk+Cj4gPiA+IAo+ID4gPiAgfQo+ID4gCj4gPiA+ICBkZWYgc3N0YXRlX2luaXQo
dGFzaywgZCk6Cj4gPiBJIGRvbid0IHRoaW5rIHRoaXMgZGVwZW5kZW5jeSBpcyBlbm91Z2ggdG8g
ZW5zdXJlIHRoYXQgdGhlIHNldHNjZW5lCj4gPiB0YXNrIGZvciBvbmUgb2YgdGhlc2UgdGFza3Mg
aGFzIHRhci1uYXRpdmUgcHJlc2VudCB3aGVuIHRoZSBzc3RhdGUKPiA+IHBhY2thZ2UgaXMgZXh0
cmFjdGVkIGZyb20gc3N0YXRlPwo+ID4gCj4gPiBDaGVlcnMsCj4gPiAKPiA+IFJpY2hhcmQKPiAK
PiBIaSBSaWNoYXJkLCBwcm9wb3NhbHMgYXJlIHdlbGNvbWUgOi0pCj4gCj4gQlIKPiBQaW90cgpC
VFcuIFJpY2hhcmQgd2FzIGl0IHRlc3RlZCBhbHJlYWR5IGJ5IHlvdT8KCkJSClBpb3RyCg==

