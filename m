Return-Path: <y.moog@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03192D29C2A
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 13:15:21 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34869.1768828517715623968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 05:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=YJSBMKFy;
 spf=pass (domain: phytec.de, ip: 52.101.84.94, mailfrom: y.moog@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6/nxHO9LCkXVNJnAH/Eq9xKM8mk4gSCVDwvJjcFQou0X+/ZrQeTv3tbwDTGPBPp7LuTBuXbNnui/kS+W15gRvmdTzoNRK5G1SzmiNO0kq/X6xapr2l2Rd8SmgUkE5aEv5/xxeAN3GnMu90sXmjdOUusYOY4RVuLkbC5ipHPj0LM3BB6ZGxZiTCRLRq7RG3cL19KwvOH28gAabCZGrk5lMgZ3TNBWTKPk7IIrNUhQvAIpjEprK9MSGITOHBU7wR38rymzVbXViSrFQSYN0H/MbJ9JwH/pMqJPhbKEvgu+FRgMojWU43/CD+lFnN9c/MpBMn4K0UWex18//QYWn1ulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20+iUnLDxxUMCwUauokQ55DsR/NiJajOcQmakcnziaQ=;
 b=XpJwNzQ+XgqyQwzXcrWy4JrZjO1kwaUPhnVio1le+rnt8x73XS3RUOGmNy2ieo8Go13pB+OyYCxASUjAo9MqrovP9UblvXStKbJk2Y7ENbN/rrhiyKpreAL/Wgwl1exkbrrJCyBCIAwQWZj1zDOgv5A0z8lwoIWoYnXHC2C5W2J/w4JrrJ+5mU59Pumetz3uPzuq+Eanks8JNs8PzZI26qd0y1dL24vL+6S+juW7yrxJUXZ64NX7EUS33CyIVUASfsW7LLgOCrefvlH7iyvyxBQaVgmQSF7eCBWubdcfEgiFO+PInL8CAaVFhtgqsDTiKaF+ePuvcrzxmpsWVfBiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20+iUnLDxxUMCwUauokQ55DsR/NiJajOcQmakcnziaQ=;
 b=YJSBMKFyIE6srchrWnDJ6blODt+jRM5g0WrnqWsCr8aFXKbAL5nA26TPMYo/hLr60tEHWKU+TDoxDG8KYGE7wv5Se+SGiBL5lfKZA+OSIl/d0Mja99Wby0Hi6AsGmUW+M2bz1FjLwotnvYqxjwOAfJX4HUGjlsbNbU7yiNKPfQzC4e/xCWseow87Y9fNdlBn+lPIcstka2gpK5YC3mxdwpCuRwN1rLllK4DXxmQRrmVVet4ketjcGpfY5G4oj57TY8DdrBUSBLnV6+A2tkvRDHHh/xuJed9pYf95ESh5HvmpxHGstCeeoM3UXgfCjUihXIfuT5jGa8TQponX0y6eQQ==
Received: from GV1P195MB2476.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:1a0::7)
 by AS8P195MB2120.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:56d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 13:15:13 +0000
Received: from GV1P195MB2476.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b46:2d4d:cf51:47d8]) by GV1P195MB2476.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b46:2d4d:cf51:47d8%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 13:15:13 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: "max.oss.09@gmail.com" <max.oss.09@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Ross Burton <ross.burton@arm.com>, Max Krummenacher
	<max.krummenacher@toradex.com>
Subject: Re: [OE-core][Patch v1] alsa-utils: fix install package alsa-utils
Thread-Topic: [OE-core][Patch v1] alsa-utils: fix install package alsa-utils
Thread-Index: AQHciUHUYCWQQs4L0kKbN0iU89BLz7VZeMaA
Date: Mon, 19 Jan 2026 13:15:13 +0000
Message-ID: <60a51e225b22d4492a341d4d7ac5f49c6b73f430.camel@phytec.de>
References: <20260119124722.646039-1-max.oss.09@gmail.com>
In-Reply-To: <20260119124722.646039-1-max.oss.09@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1P195MB2476:EE_|AS8P195MB2120:EE_
x-ms-office365-filtering-correlation-id: 13d5f8d9-3ab1-4160-ed26-08de575cc80a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cnBYRFg5dnpBYXRpRWY0TEVsNkdZN3ZvZE53cmtlamt2dTNxOXlQenQ1Z2Fp?=
 =?utf-8?B?OWdHbnp0U2w1ZWxtbStvMFUyLytGSUNTRE1FUHgyOUpLYjE2RDFKc085bjEr?=
 =?utf-8?B?N1AwZitUeGF4VlEzZXdYWkVCclFuZU0zdit2a0ZFRkQ2K3o0cHBrdXA0QWRY?=
 =?utf-8?B?N3h5blUwL082dlJEdU5wRkdlZHRST09CSzV3bllscFJOQ3F4NjNUWlFZNFp2?=
 =?utf-8?B?dERJU29qRlRIblhIOHkwQ2dwWmM5Wkpob0VvVU9uZWNnMXBDUkFOSklmTmFy?=
 =?utf-8?B?VitFc0xmbDJNUHZhRVBkcWhkb3JLNjRKTDVGcXRwMGhMUmROTHdvc2JLTkNj?=
 =?utf-8?B?eWtGWTRXVVFVU1pBOGd0bzdhYmowQ0tZNlpQcW1mVXJoVTVKTmJPOHBjUkFL?=
 =?utf-8?B?cUZBYWpSNzBKWjJEMlcvdHNpN3NpY00wVU93TkVaaHJYWEQvdk5kdzZKekJo?=
 =?utf-8?B?Q3ZhaTdreklOYmZYQXVZanNZbDdvVHdLZzlZMGdhd0tNeUFkMzZSYWpCWDlz?=
 =?utf-8?B?bzFsN3hPSXovcnBjajcybUlPWHI3dGZiVjVXWERpODY3Q0M1aWovN3ZBTnEx?=
 =?utf-8?B?ZVZGUnZ6K2ZEQVZ5YjdlRXRkR3Q3bDd4QmxqTUM0WVRxZXEydWpDd2pKOTM4?=
 =?utf-8?B?ZkdBekVnemZJTkZqUDMzOHRpbnFNRThMR1ZXTVcveVF4SnJNUEtyUkJPMGdI?=
 =?utf-8?B?YWsvajZIZVFyWkJqVUR0WHRTcS9NcnlDVElDeVhKMXdCWXA0Y2ZPNmxybDBL?=
 =?utf-8?B?QWNKVDVVdWQzZVQ0VnkwWEVPdmdKQ3gwVjBjYi9rdU4wNFdUcXdWVnFhWkd3?=
 =?utf-8?B?S3pCMHJPZVFFSUROc2JQbVpsYTZKdzlYV0tKY3AxOFdoQmw1K1gzWUhBMUky?=
 =?utf-8?B?dnZKMGhjOEFFR0hVQ3d0bXhMNUlMTHdid3pzQ1luUURqZ0llVEt2L2ZNcjJY?=
 =?utf-8?B?NFA5V3N0Y2lNWTlFc3grTERLSlJ4bXlsZXpyZ2p6TU5MdE5ranQ3ODR6SEVC?=
 =?utf-8?B?UVluRWJyNGQ4TU1aTVZoRENab0twVFY5cDM4M1AyM3NkTm5UK3E4Z3hiVmRR?=
 =?utf-8?B?cVVKT1ZTaFNORU1MUWg0SWV0MWUzNXBZYjdubE1SenprYi95ckU3Y25ta0xq?=
 =?utf-8?B?ZVFOcXdrcHhCT2JZNytCTWY0NmRhYVRxTlN5SkN6MWlCbVdyODduZFNpOWI1?=
 =?utf-8?B?NmJFc0dieE9ZV1NsWWxHOGc4OHZxNkdEREZVOVhHTTdxN1BqTzU2UmhKL2t1?=
 =?utf-8?B?aThhdzhMSVdGa1NXSlloYmhWRVJzL2xwYTljdysyc3V1MjhrTzRGUUN4dUVZ?=
 =?utf-8?B?dVlHMC83RFh3ZTBzOUZqVmF1OFhXNThIMWFWbXFvaUM1N3phaDF6R3FaLzZV?=
 =?utf-8?B?Y2lzYWs2WVU2TUhEcFZUaEhCcGl3S01leDcyUHZmcVU4TVJCOTdRNTVDR3No?=
 =?utf-8?B?b01pTHVHL2lvUUJJYUthM1N0a0p4cjRpd05wMk1vRGFHMlVjK0Jrd0hzWHI1?=
 =?utf-8?B?SWU0WktXRnpYeVZmd3lKelZHV2hWT3dMUlpncnhTc3czYndYVWFvelpSTVZN?=
 =?utf-8?B?Vm5rZjUwcEJBQW1uNHpaTEJEaWMvZ0pPYWs1c0I3ckp6cUVFaVpMR0Y2aC9B?=
 =?utf-8?B?WUIwUFBpL1RDaDhxa1RkQ0dRRVo3VjB3dy91RW0zcFQ3MnZac1VOWHRmSG1h?=
 =?utf-8?B?dS8zaTAyaXVHd1lTeWRVTC9iemFkd3NMcWVjbnlXcitHRTdxUzNVL1JNdFAw?=
 =?utf-8?B?Tk94UGdJa3BQeHJ6MjZzS3U1bGJjRVJhZTU4Wk5xZUcycVpPTTdmdWd4QVE3?=
 =?utf-8?B?NU1DQitBdFVQV0F4bXFLUnZ6TUpRbUlVWElWeGVkVHNmbHlTOXhDcGNyR2lt?=
 =?utf-8?B?S21YOUZXU21YdVNoRWhLUU91VWQyblZJNnFhdllQT0JHby9CamszZTZFSnV5?=
 =?utf-8?B?d3B5bi9nMGlLNGlDZDNKSzZaTURQYmROSDJkNDdLazVjbmFjRk9naVZUODl4?=
 =?utf-8?B?VXpvZmE1NURkMHR5bFk2VmR3SHFnNFFucnhDeU5YV0dqdDJwcldTUlczMmo1?=
 =?utf-8?B?dVArb0hma1d6WERTcUhobFRsY1g5WnVscmFWREJpV0J4bkNYOUxnelBnVGM4?=
 =?utf-8?B?cmpER0ovNVlXMDBjckZHMW5yZUx1eEVjV2MvWGl5L2UwSmk5cEUvVEUweVE0?=
 =?utf-8?Q?wGS9j8z3B9fRUkNHR/x5LPw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P195MB2476.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QVFHanNCcm5xNlNZMFp6T3lDcjR4MTF0SGYvODdPL0QyRG0vS0xpbEZuUUVS?=
 =?utf-8?B?M2ZQZzEzU1JWWG5LSkdkMTdNV0JJb2JXSW00ZG83UW90SVNwRmF6V3cwYWwv?=
 =?utf-8?B?U0pSbUFwUzJwb3RHUnNyV25GcUtvTDlqYjB2Q3dzTGhRcXl6K2xUajhEVVlN?=
 =?utf-8?B?Mk5rck10YVBrZTJ2VUFiQ3N1d0duOXhGWHhoV2w0OHJCUjdjajYxM1pKK3V6?=
 =?utf-8?B?UDlqZzRobitaaTdabGJMQUJDU3FzeVJ1bEt5RTltMzN0MXp0cUwyTDdqclYx?=
 =?utf-8?B?SSs4dHE2QXNWUXZGUHczR3E2MDdaU2ZBSUY5emM1LzFkbVRNb2hzckpudWds?=
 =?utf-8?B?cGRzdWhoeUx5bGNtaWE3aFl3SE51OURKR3RVZjYxdXVURUVreHYvU0dDbGZl?=
 =?utf-8?B?Yk9GSlN6MVVROFdMS2o1QXJKbnBBam5SWlFoRHRySHprV1lhb0JLK2p5ODFk?=
 =?utf-8?B?bmdqSExkRnJLZm5YLzBHKzJ6dnExZWNZanVJWE13bVJpZG8zR3Vad2ZOY2Zs?=
 =?utf-8?B?SWlOWGFHWTd0YzRDV2VYVmVRUk9JcnBERkFHUjU0bnJPVXhvdWg4WkVFb3di?=
 =?utf-8?B?ZmRib2E1ald4SXo5SjNob2ZCdWhKems0UUNDVkx5YjZhSzVJaXJOcjRCTTBx?=
 =?utf-8?B?T3hhKzMrcVZrTFl3STRiNW1WQ3ZlcXEvZzZ2UnRacDBUcWt0Z21KeGFnblRy?=
 =?utf-8?B?UHlpQTlZKytVWmtObEJVR2RDR3RzT0VLRlhrUTZ4U0VSTUNKYURlenRuQ2d1?=
 =?utf-8?B?S3oyb0tvbmRwcW5sSERkN1djUm5POTFWUy9Gb2g2RUVBVWljeDRnbm9XS3Bs?=
 =?utf-8?B?L0VWTlIzSXpxallST0tWdUNyQ2xMTFhuL0NPTUZBZ1BtVWswM0RCdDlhcEo1?=
 =?utf-8?B?ZWJPNVZ6WFN5L2t0VXc4emdjekxOMFgxT2thRHEvNHZPM1ovZUlpZVBxSWhs?=
 =?utf-8?B?aWF4OWNvbGIwQTZFbmRHbXdlRUo5T040SzRHazdjK2NCNHVCVXNYRFAvb3Ry?=
 =?utf-8?B?a3BEay82cThnWjR1bUhta3JibW1reml2V1NKTDFvWUlpalFTUzc0a0F1a3pk?=
 =?utf-8?B?N01PUWEyZE41NngwUWdYM1FUSjByZ3NWclZuZnFTbDgyZ3VueFBXdkpLeW4v?=
 =?utf-8?B?NW1QeHBuMVY2eEp4OVZpUXQ3L1NKeW82MmpMSHhsTkhaUGx3V3p6bnZzOVla?=
 =?utf-8?B?QmhwdEJlc1JyTm1TbVdUOUVkamJUWkl2VnZsUXQ1ZzNUejdlcjcyS1NqY2l1?=
 =?utf-8?B?b3dPUzQ3UTFPQkdkM1pNQmgrZlRvMHFFTkRxWHdtZzVrRFhhVlVSVEUyS0hw?=
 =?utf-8?B?K2JLOENyNWxKaGdBVzVER3gxSnltMzRFVk5YclZVYW9zaUtKYjdldEM3L3Qz?=
 =?utf-8?B?SDlKSGhtUHFqQ0M3TE0vOUVKbHgrZTBnSXpWeVRaSlJSaWdBQXFycko2cWhi?=
 =?utf-8?B?UjgvQjY4eTZqMzVqR082OEZjWlhyV3B3cFNIdHZROE5iMHhycXVOWWZZQ29t?=
 =?utf-8?B?bUxsbnltNEs3ZG15TXBUNTV3VHpJM3lPM2grOEJVNHBYNUw1RnRrTmtFWXln?=
 =?utf-8?B?a0o3eEJUbGNuNG5nd3RrU1RLNE9yZWVLV3dwcENNaERKaTV3Mm9VdDFac2JB?=
 =?utf-8?B?OGp5WEFLZlhxc09YZWdVNndEcFdDUTB2V3AvL3pMUzI1WmdZdnNZVUpaTlZI?=
 =?utf-8?B?dElrV011ZHlXcnNRZ3hZSll2N2U3cVFWeWlDY29KaEZOK0JtdUtXSTZZOWZw?=
 =?utf-8?B?NnJadHZnV2NxeFFSOG9mMXhGTFczT2xQc3FsZjBaOXBBRzgwRmM4UGkweUFI?=
 =?utf-8?B?ZU40SnI1RDJ3bUZOVzNLRlpxYUtTMFA2ejlxMGpSQ3owR1YyenpnMFR3QWVK?=
 =?utf-8?B?NnpTM2hjbTllSnNWME91R09JWFlpK2ZDUjcxVmxBV3A2UE9FeTd5eGZDRXlR?=
 =?utf-8?B?c1g4L2htc2VYK0xrUW1vZlU2cHo5em54ejFkbC9WS2NGdjh2VkNwV214Nksw?=
 =?utf-8?B?NUNGbnZQN3hZWUdweURxT3lxRHcxWmFpQWE2NFhaOXBOZCtJVkNRd1RYaFJP?=
 =?utf-8?B?OFR4L1hUd05GMEFvVWI4TGxWMHB4bW44UTE0MkpQYWloazZKSnA4T01Wdld1?=
 =?utf-8?B?K2MyTDFpNXRkdHJnbG1rUUR5TDZqWjZ0cDZRTDU3cUFXNmF6Y2U3QzVMNTN0?=
 =?utf-8?B?R0F0YTd6TjlWY01kOHd4ZzNHSXdLcHk1MWZhcVRUelQxazlCckYwVTR1U1R1?=
 =?utf-8?B?NXRETUZ4ZlNETzlON0M0aVdlajgwbnBqZjFNTGZaNEcwNlBIbmpzRDhlNSs0?=
 =?utf-8?Q?OeEfGfUOWQ51/ie1xB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <356A8077642D18418ACE20D009031A5E@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1P195MB2476.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d5f8d9-3ab1-4160-ed26-08de575cc80a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 13:15:13.7875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMot2scK9/lKh0lID3tVIqRIZMlV33KPAU4a3ZlRUOwVR3OaLj1qvQNGzOp6L3yqAdBMFnSK5G5cdgeDykyVlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 13:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229618

T24gTW9uLCAyMDI2LTAxLTE5IGF0IDEzOjQ3ICswMTAwLCBNYXggS3J1bW1lbmFjaGVyIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOgo+IEZyb206IE1heCBLcnVtbWVuYWNoZXIgPG1h
eC5rcnVtbWVuYWNoZXJAdG9yYWRleC5jb20+Cj4gCj4gVGhlIHJlY2VudCBtb3ZlIHRvIHVzaW5n
IGR5bmFtaWNhbGx5IHNwbGl0IHBhY2thZ2VzIGNyZWF0ZWQgYSByZWdyZXNzaW9uLgo+IAo+IFNv
bWUgb2YgdGhlIGR5bmFtaWNhbGx5IHNwbGl0IHBhY2thZ2VzIGFyZSBlbXB0eSBhcyB0aGUgZmls
ZXMKPiBkeW5hbWljYWxseSBhZGRpbmcgdGhlIHBhY2thZ2UgYXJlIHBhY2thZ2VkIHRocm91Z2gg
ZXhwbGljaXQgRklMRVNfKgo+IGludG8gc29tZSBvdGhlciBwYWNrYWdlLgo+IFRoaXMgdGhlbiBi
cmVha3MgdGhlIG1ldGEgcGFja2FnZSBhbHNhLXV0aWxzIHdoaWNoIFJERVBFTkRTIG9uIHRoZQo+
IG5vdCBleGlzdGluZyBlbXB0eSBwYWNrYWdlcy4KPiAKPiBFbXB0eSBwYWNrYWdlczoKPiBhbHNh
LXV0aWxzLWFsc2FiYXQtdGVzdCwgYWxzYS11dGlscy1hcGxheW1pZGksIGFsc2EtdXRpbHMtYXBs
YXltaWRpMiwKPiBhbHNhLXV0aWxzLWFyZWNvcmRtaWRpLCBhbHNhLXV0aWxzLWFyZWNvcmRtaWRp
MiwgYWxzYS11dGlscy1heGZlcgo+IAo+IENoYW5nZSB0aGUgUkRFUEVORFMgb2YgYWxzYS11dGls
cyB0byBSUkVDT01NRU5EUyB0byB3b3JrIGFyb3VuZCB0aGUgaXNzdWUuCj4gCj4gRml4ZXMgZG9f
cm9vdGZzIHdoZW4gSU1BR0VfSU5TVEFMTCBjb250YWlucyBhbHNhLXV0aWxzOgo+IMKgIC0gbm90
aGluZyBwcm92aWRlcyBhbHNhLXV0aWxzLWFwbGF5bWlkaSBuZWVkZWQgYnkgYWxzYS11dGlscy0x
LjIuMTUuMS1yMC5hcm12N2F0MmhmLW5lb24KPiAKPiBGaXhlczogMjZhMjhlZTc5MzUwICgiYWxz
YS11dGlsczogZHluYW1pY2FsbHkgc3BsaXQgdGhlIHBhY2thZ2VzIGluc3RlYWQgb2YgZG9pbmcg
aXQgbWFudWFsbHkiKQo+IFNpZ25lZC1vZmYtYnk6IE1heCBLcnVtbWVuYWNoZXIgPG1heC5rcnVt
bWVuYWNoZXJAdG9yYWRleC5jb20+CgpSZXZpZXdlZC1ieTogWWFubmljIE1vb2cgPHkubW9vZ0Bw
aHl0ZWMuZGU+ClRlc3RlZC1ieTogWWFubmljIE1vb2cgPHkubW9vZ0BwaHl0ZWMuZGU+Cgo+IC0t
LQo+IMKgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi4xNS4xLmJi
IHwgMiArLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGls
c18xLjIuMTUuMS5iYiBiL21ldGEvcmVjaXBlcy0KPiBtdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGls
c18xLjIuMTUuMS5iYgo+IGluZGV4IDkyN2Y5NGFmYjY1NC4uMWVkNGQ5YzRiNTRhIDEwMDY0NAo+
IC0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuMTUuMS5i
Ygo+ICsrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuMTUu
MS5iYgo+IEBAIC03MCw3ICs3MCw3IEBAIHB5dGhvbiBwb3B1bGF0ZV9wYWNrYWdlczpwcmVwZW5k
KCkgewo+IMKgwqDCoMKgIHBuID0gZC5nZXRWYXIoIlBOIikKPiDCoMKgwqDCoCBwYWNrYWdlcyA9
IGRvX3NwbGl0X3BhY2thZ2VzKGQsIGQuZ2V0VmFyKCJiaW5kaXIiKSwgciJeKFteLl0rKS4qJCIs
IHBuICsgIi0lcyIsICJhbHNhLXV0aWxzCj4gdG9vbCAlcyIsIGV4dHJhX2RlcGVuZHM9IiIpCj4g
wqDCoMKgwqAgcGFja2FnZXMgKz0gZG9fc3BsaXRfcGFja2FnZXMoZCwgZC5nZXRWYXIoInNiaW5k
aXIiKSwgciJeKFteLl0rKS4qJCIsIHBuICsgIi0lcyIsICJhbHNhLQo+IHV0aWxzIHRvb2wgJXMi
LCBleHRyYV9kZXBlbmRzPSIiKQo+IC3CoMKgwqAgZC5zZXRWYXIoIlJERVBFTkRTOiIgKyBwbiwg
IiAiLmpvaW4ocGFja2FnZXMpKQo+ICvCoMKgwqAgZC5zZXRWYXIoIlJSRUNPTU1FTkRTOiIgKyBw
biwgIiAiLmpvaW4ocGFja2FnZXMpKQo+IMKgfQo+IMKgCj4gwqBQQUNLQUdFU19EWU5BTUlDID0g
Il4ke1BOfS0uKiIKPiAKPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQo+IExpbmtzOiBZb3UgcmVj
ZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLgo+IFZpZXcvUmVwbHkgT25saW5l
ICgjMjI5NjE0KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvbWVzc2FnZS8yMjk2MTQKPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tdC8xMTczNDM2ODkvODI4MDU2NQo+IEdyb3VwIE93bmVyOiBvcGVuZW1i
ZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnCj4gVW5zdWJzY3JpYmU6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViwqBb
eS5tb29nQHBoeXRlYy5kZV0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQo=

