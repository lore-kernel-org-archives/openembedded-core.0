Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65AEC02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 14:11:46 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.85])
 by mx.groups.io with SMTP id smtpd.web11.16464.1736773638651717366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 05:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=kvdvKpHJ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.103.85, mailfrom: catalin.popescu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hS9tEnBAFxgMpiVfVgz9SnRGt66GqknUKEREwjr8p5/myIiTXd5tq7ozmXz5OJHAcMHGEpsP2LG9KASESmHXN+pRcQtsB7ZC3X7Dqm4CBhDwasHMpUbGM+tF0RFbZ/N3+DGdwggQhWZASMZDeI/lFloBZUhKtUBS9VIdG2MN5/GeSa4GV2RCiuhx9NVBMfGvJGUuOV4+WvPktlox877KQNJ/jOu0h8ADh8Pw3JcEB4wKxZWD/V4yE+uiKs7WwvuxnX2DdwRofWYs4xj4eVgVPGS6zEGNOHqDEMIFNTKf+rzzHaT0dxvf2dt5hPga5RSCnHfVUFILgddEjn1O0MxcbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5X7Z7fjniiXsK/wPljbCav0NgaPSCu5Aj4e1Bv7ObeI=;
 b=WR4fukePpmV8SlsTLQgWIyLGdAqY82MaU4Y4wZOdpNo2S+QVulogNiUemRVsBgoQPfrfya2y2rA34mAUPOJ6DpBaNulY8lobUXYnJqHv6g4RjGSx8iorvIDkhD8R88SaC8oFsmx9YcJg6jDdbVgHDYfQHL5SGGgJml5WeaGbIlThzV+nR2BJRLJZN17XcB0L4n7L2IuVOv6cVEgRgYIkTuqbwCTb1xvaz/AZXoU53c4GaF7xTjBY0Ilot2bDXwmfGCm5LL99mQIXx1QcBVOiI9sNb2y1teOoLJ1lId0FT7n/4i9zG1kv74VhPpNKdzvYWbYIGQ497UUirvBNQvV/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5X7Z7fjniiXsK/wPljbCav0NgaPSCu5Aj4e1Bv7ObeI=;
 b=kvdvKpHJ/6ZespCjQlVfQuLizpD3AnJxrpwtezRFwltQkYbMWKKmiLs0OPKrUrpzTXOMOCcryW6z/h03q57ysZTayQ+sn1dEV/jEWzB2x7MvMy/syctrSgMyLilgwm7IvXeJBD6ZgbuRc1YKVBMPnNyTnUulhulLfN7Cog1NoaE=
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com (2603:10a6:10:1a0::11)
 by AM9PR06MB7890.eurprd06.prod.outlook.com (2603:10a6:20b:3a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 13:07:15 +0000
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0]) by DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0%7]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 13:07:15 +0000
From: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Steve Sakoman <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>
Subject: Re: [OE-core] [scarthgap][PATCH] bluez5: backport configuration file shipping from 5.73 to 5.72
Thread-Topic: [OE-core] [scarthgap][PATCH] bluez5: backport configuration file
 shipping from 5.73 to 5.72
Thread-Index: AQHbYb2xfJ/q8Va8aE6fA9r66k6ItLMTN4SAgAFV3ICAAAoqAIAAHRsA
Date: Mon, 13 Jan 2025 13:07:15 +0000
Message-ID: <4d18c6e6-ec7c-4c2a-9a12-98fe1382774d@leica-geosystems.com>
References: <20250108110844.3849307-1-catalin.popescu@leica-geosystems.com>
 <CAOSpxda7RYcaEf-i_=iKuFiEPun6D-xjm7HOc0s+Dc3jdZu-Uw@mail.gmail.com>
 <08981091-3b9c-4282-b1d5-bd777c69d2e4@leica-geosystems.com>
 <CANNYZj-LbrGbye1PHktf6CRAeS+RcV07H=TbsESG7s6wmRD2=Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-LbrGbye1PHktf6CRAeS+RcV07H=TbsESG7s6wmRD2=Q@mail.gmail.com>
Accept-Language: en-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR06MB6901:EE_|AM9PR06MB7890:EE_
x-ms-office365-filtering-correlation-id: 35ae5122-4528-42e4-2ced-08dd33d33389
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TU5odGFvMW5kZGNXSGlNWkh6VnkxL3VETk1jMWJTR25pbEp2dnE3ME1oRXFF?=
 =?utf-8?B?UjhuNFcwNkVoLzJPekphUk1tUWNKSDVvMkNrVHE5WGpvTU4vMXkyZzh6NXRM?=
 =?utf-8?B?bURUaXFNNTUzNDFHU3ljQUdZL1FDcFdUUldiZ2YrVFJFcHJRR2Vhb0wvZHNV?=
 =?utf-8?B?dFZ6c2FrQ0Njd2FXaG5oaDNCUm5HUUpkV1VueGdoSHJIUlF3Q1hpbXZQYUF2?=
 =?utf-8?B?ZFFzM3ltUmMwb2hCeVpxQVd2S3dKUXQ0ZVhodHNYL1lOMTJ5YVZIazUxV2pn?=
 =?utf-8?B?MkZNbFJHV1FreGJwQVBFZzkrY0dlU2xKdEZqMTZPNDJMZDZmMjhCaSthc2ww?=
 =?utf-8?B?MkN4SWlQakhrTlF4RWoxQlpPRGxpVGlwUW1raGlhMTg2ZHRsajNwT3dWdkVw?=
 =?utf-8?B?MXRBOC95bTRmcC9COUQvYWpxOU95U09jY0ZlbWJqQ0xiYkxPblRMTm9SS3hE?=
 =?utf-8?B?eHp4ZTAvV29yL2VBYWpodWZkYU5qdXVZL1JaT3VNME1EY3IxZURpSnJTZE9T?=
 =?utf-8?B?N2JvOFhvaGN1dWxLc1hMREJ2dmVaK0c5by92dGdFR1hBdkFFRURuLzdpKzdz?=
 =?utf-8?B?OUZxdlNOQ21sVmplQ3h3NFRTVXY3TnZINlAraVI2YU5ZcHhzSVorWjBTR29D?=
 =?utf-8?B?L29nbEI1QUROZUJrQlAraWZ5cmdBL2Q2ZlFwbXVUUm5PQitqRkVWc0Q2RXVC?=
 =?utf-8?B?VjFBaGJYcFhCd25SWXJXM1hVdlM3NHN4cXJKdmRDSGdFTDMwcmNoQS9mSXl2?=
 =?utf-8?B?NlcyL1lQWmpmclVqWHRrSnRmVCt5TjF3ZjI0SDRSclk5MDYrRTlUd2d5WnhO?=
 =?utf-8?B?RENlZGhIbWFjOWZHNmwwUkRPNHhUYVcrZWJjYlZBWm00UVZORVdPL0VyN1BS?=
 =?utf-8?B?SjhSNDh2TUxDV1owNkRHL0p0Z2MySUVBQi9qdGVHdmlVNUNrRzdESDR0eDNj?=
 =?utf-8?B?UVh2TnA0WjVrMldvM1dSeGNhVEM0TUU2ZHppeDBaT2dqUngvV0VlL0JkK3Vz?=
 =?utf-8?B?M3U0OVhrMk9MWCt2a1I0N3JSNEdKSFFDYy9qdURnVU02NE5jODdLZFJyZVNW?=
 =?utf-8?B?OS9XZmZwWjZjRHBCMzFybEw0YXVSZEhmNVR6enZhWEFMK3lDMmpQWWw4Y1ZJ?=
 =?utf-8?B?UXZqRGh6cHlxUmM2alJBWFlCbjJuSkhDUFNQS1dmeGdKUkoxSWJZWWN4L3l5?=
 =?utf-8?B?bys3d2JEUk9ab0YzbURqT05KUnBKRHdZZDdHdHQ2a0N2amVERzlDbXBMUVFy?=
 =?utf-8?B?by9LTHRoQU9xM2VBTHF4MDlDOC9YMXFBR2NSYkF3YnZHVUh2dGhGdlRLSXF2?=
 =?utf-8?B?aXR6R0ZjaUV3bkpiQWhZbC93MUJQQU1MaTNIdmppVnZmVmdJVWpmUEZhN0Q3?=
 =?utf-8?B?cUlPNkFUSGZnS0tMcjJFRjZ2RXp2QjU0TXo1Vll3Z2lvRndTK2RUL0JzMFZh?=
 =?utf-8?B?VVVNUFVxb1NxY1RtcTMwUWdibzlNM1k0b2JMZUM1ZGw4SnhBcG9TQ1U2SHhN?=
 =?utf-8?B?SzZFeTZXaHJwVWpYYU1nM3E5OG4wVG5hQTVhRFVMZjNsNHZYNjl6SFBUVXho?=
 =?utf-8?B?K2cxeFhPcmNxTmp0OVQ3K0U5QTdBWll2ZGR6UGRpdnQvTElueWl6a1I3SkZ4?=
 =?utf-8?B?dEhPWDJVaVRscENwdkZieDNmT0pQUVpud0J5d1VEOFUxaU9RM1drRW5raUNZ?=
 =?utf-8?B?MU5WU0NuQ0dFTkd0VThUWVgwZ0hSenhKUklTNkdkS21yUHV6dC9ISHlORnUx?=
 =?utf-8?B?dTZzQmEyUkFHVzJRanpBcnJPY0dFRUtzMW5qYktiaUw2U0l2V24wcWJ6dVJv?=
 =?utf-8?B?cXRxdllYbDZHVnV1b2xQSFovRFJLWEtjYysrYk1ERlRlQVltek5Cd2FMNEdX?=
 =?utf-8?B?dWxIcXN2ajV1RHhnNUtaNGg0WWkvZjN3Qm1Wb0RTU0VQTy9paXhZcmw4ckNQ?=
 =?utf-8?Q?qMhmMfVobuFeNgmeM8PtDOTU6j/wxRXn?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR06MB6901.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aGYzc3dBQVFVT1I4UXF4aU1SWWdKNFY2a1QrUG1TdUNTMnJiaG5OcW43VnRM?=
 =?utf-8?B?Y0ZyMk5ycjhPM0liYUpMeFJZMDJjTGd4MzZmbUFtcmZWK0NmZUdNL3lGUkFU?=
 =?utf-8?B?cnVvRXYxTmF2dXFPOEF6TFR6ajY2c3BFdDdyQkVYakpRV1psNFl2TGx4aERL?=
 =?utf-8?B?WUxWWCszVnc0MXBZR0RzeUgrSWNSTk5rZlBqYTl4dWtkdkdEdThRNjFsVUEv?=
 =?utf-8?B?bUJZL0lZZklTVWh2YXI4cnZKQ3p0WFlDcVdsampxamp6UThuUlRTZFBWVVY5?=
 =?utf-8?B?YnVkS0dUSVY5bFhiYm9mcjhXZGRhTXFyRm05cG9Ibi9xTTVCSFhTR05KMnBs?=
 =?utf-8?B?NEowbDhNTnBNNG1TaVp5SW5xckExbUxCQlhxc2JMU052RGxNa1JQdUZnMlRW?=
 =?utf-8?B?QTJOU2tXeGJ5a3E5NVFkTGt0aHd2b2sxaXc0b293N0R5UXhKdHB1dHZXaGxw?=
 =?utf-8?B?MU41T0N6VS84M3JJZzYrUnBueVBvd0VBNlh4ODJLYnZHM29TcEVIR05uL1Q3?=
 =?utf-8?B?ZWJ6WkIzV0RIM0NkUkFPTW9FODJqb2ZOUlFuTjJONk9NWFFxYlhNbjY5THB6?=
 =?utf-8?B?OUhiWnloWTVNTlQxdDFLbnpyUml0ai9STW5KR1JVMG9WSTArZkdrQ1NYVEdK?=
 =?utf-8?B?dlR1SDFad2lBN2NrcjA2WGw0cEVucDFzUm53OS90NEFSTytGVmtPZU1WOVU5?=
 =?utf-8?B?UGprU3FId1hlNFJ4WVdXRWttcHJDN1JnZDBUSXlYSXI1SnZQeXNtblNDaEJw?=
 =?utf-8?B?Y2t5MGdjVStlOE1odStLcXRRNFpQL1RNaVBwM0kzV28ra1lNVmJ1WEIzRjJW?=
 =?utf-8?B?UzNFd2pEVVRDeEZOMVZCQXVPYkhjaXBNVWxQdmVzZVF1NlJZaThSamRHS0VE?=
 =?utf-8?B?MTg0V1lFWTJYVS94YXVDOEJERnVEVDJvd256UzZQOHhFbVNMMTV6NnBnS3ox?=
 =?utf-8?B?NlBENjlVTDFBSnZYVlkwNDFUVVVBTk9oTkIxMDdyNGdMMEt2cHJnbXZrUDM1?=
 =?utf-8?B?V2EybG5TWW9idG1BZmVkUFRYTU8wZEM3TUJoNnhRT1pNdFV1eHdrNTZ5QmdF?=
 =?utf-8?B?VUxGMlpxam9FanZuVkt4cUpXSythYUVjMmlKTlJuUE1HRlN0blNwVkFqQ1A0?=
 =?utf-8?B?cVpuUnZwSEljcGtjR1pnNFlkOXB4TXRyeWpkcGpGdEFVcy9RMUV0SUJZeFVo?=
 =?utf-8?B?aHBZNWxrT3BRb3orMkdmUE9sZHJwOWxrc2IwR0x6ZlZ0TlI2Rms1V3p2NFNV?=
 =?utf-8?B?a3hpUkJGNEFuOEF1V0tIRFFydkxYN3lWS05YU01aclFkS0FuVXU4NkltNVRt?=
 =?utf-8?B?WVEvUDNXclUyVitkTHlnb243R0sxTGtDTThqdTg2a2xLRFFYWFpGM055SCtr?=
 =?utf-8?B?N3dqN3dWYzRmcTd1RE40NjR4SEM1eXZlWlRJRGgrelFoZDVMZkR6MVVUaGM2?=
 =?utf-8?B?akJTY25WYVpGMmphL2tSMFdpRnZKYWtqbzZGT045aEp1TXg4WWRESHI4T3VY?=
 =?utf-8?B?MEw5NkhRSGFRVVZPdzUzMDRSM2x4UHF4dDNhNXd0bko1T3NBeXFlN2hlcS9F?=
 =?utf-8?B?QkFSLzdPZnZjZmpWdGhEcGtCVmxjbFpyNi9kd3ZWZ3FCUDNYQk1KRjR5RU8r?=
 =?utf-8?B?QkE1bnhTYm1ycFFQZW5BSEVZM25BWVFpU3VRSUQwUHUxZ2ZtNUJ4bFk1NWJo?=
 =?utf-8?B?QkdOWVlDK3V6THFuNEpNaWhGVkhCeWxTMWlydHdPR01FRkNFYm5sQ2ZXQlY4?=
 =?utf-8?B?QkcwejM1NVdhRXl6NHNNL2JTM0ZmNEdwU0tXMGlJTFdBS1M3U0p3UmYzakkx?=
 =?utf-8?B?MW92Z2NzQzJHTFNwbXhldXhjSnBOUE4vYVNWN0kzanlnN1BKd1pDdTlmM28w?=
 =?utf-8?B?TVdGSkViVDBISWFmRWoxNlVnOU5sVkYxcWdLS3krM0lFNmU3UzB3SUkrWDUy?=
 =?utf-8?B?UUhqK0NidFYyRUlCaEhiZXcrVGVWTlBBWHRNUkQ0VXU0NVpUaVdWZVhJcDhv?=
 =?utf-8?B?MzljNEtCZW5nRnphU2Fub2JNdU1tZm83QWp6M2hDeFZtMzR3YitiSmI3dTZB?=
 =?utf-8?B?QlJCRWpZWHBsQWlEb2h6RSt2UGpDNXg5cDBQMDFvQzZmMWRMWnppV3kxVkpC?=
 =?utf-8?B?ZkFCZUNDcTV0eEhwVFZ6cGRoOFUxekhJZ0JLYmxIaXpsRDhZaDkxV3VEdUFz?=
 =?utf-8?B?T2c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR06MB6901.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ae5122-4528-42e4-2ced-08dd33d33389
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 13:07:15.2085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YMfz8PKgopE8mfY6mRUOpg4wpwEHcWW1DOf+TybxNDtsSUgzbg5cGjKoLWaRWLy1G8V2RawaWZu4CIHx8i5sH3DbJnFse1dHo6ubofpQ6CnMkUb/oLBj0y0DxqvUd//A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7890
Content-Language: aa
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A391A5B5BB22545A356ECC57D818D10@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209729

T24gMTMvMDEvMjAyNSAxMjoyMywgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+IFtTb21lIHBl
b3BsZSB3aG8gcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9t
IGFsZXgua2FuYXZpbkBnbWFpbC5jb20uIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBo
dHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPg0KPiBUaGlz
IGVtYWlsIGlzIG5vdCBmcm9tIEhleGFnb27igJlzIE9mZmljZSAzNjUgaW5zdGFuY2UuIFBsZWFz
ZSBiZSBjYXJlZnVsIHdoaWxlIGNsaWNraW5nIGxpbmtzLCBvcGVuaW5nIGF0dGFjaG1lbnRzLCBv
ciByZXBseWluZyB0byB0aGlzIGVtYWlsLg0KPg0KPg0KPiBPbiBNb24sIDEzIEphbiAyMDI1IGF0
IDEyOjE2LCBQT1BFU0NVIENhdGFsaW4gdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
PGNhdGFsaW4ucG9wZXNjdT1sZWljYS1nZW9zeXN0ZW1zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4+IFRoZSBlcnJvciBkb2Vzbid0IGxvb2sgbGlrZSB0byBiZSByZWxhdGVk
IHRvIG15IHBhdGNoLg0KPj4+IHJtOiBjYW5ub3QgcmVtb3ZlDQo+Pj4gJ1RPUERJUi90bXAvd29y
ay9xZW11eDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFnZS1zYXRvLzEuMC90ZXN0aW1hZ2Utc2Rr
L3N5c3Jvb3RzL2NvcmUyLTY0LXBva3ktbGludXgvZXRjL2JsdWV0b290aC9pbnB1dC5jb25mJzoN
Cj4+PiBQZXJtaXNzaW9uIGRlbmllZA0KPj4+IHJtOiBjYW5ub3QgcmVtb3ZlDQo+Pj4gJ1RPUERJ
Ui90bXAvd29yay9xZW11eDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFnZS1zYXRvLzEuMC90ZXN0
aW1hZ2Utc2RrL3N5c3Jvb3RzL2NvcmUyLTY0LXBva3ktbGludXgvZXRjL2JsdWV0b290aC9uZXR3
b3JrLmNvbmYnOg0KPj4+IFBlcm1pc3Npb24gZGVuaWVkDQo+Pj4gcm06IGNhbm5vdCByZW1vdmUN
Cj4+PiAnVE9QRElSL3RtcC93b3JrL3FlbXV4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXNh
dG8vMS4wL3Rlc3RpbWFnZS1zZGsvc3lzcm9vdHMvY29yZTItNjQtcG9reS1saW51eC9ldGMvYmx1
ZXRvb3RoL21haW4uY29uZic6DQo+Pj4gUGVybWlzc2lvbiBkZW5pZWQNCj4gWW91ciBwYXRjaCBp
cyBoYW5kbGluZyBleGFjdGx5IHRoZXNlIGZpbGVzLCBzbyBpdCdzIGJldHRlciB0byBzZWUgaWYN
Cj4geW91IGNhbiByZXByb2R1Y2UgdGhlIGVycm9yLg0KPg0KPiBBbGV4DQoNCkkgZG9uJ3QgcmVh
bGx5IGtub3cgaG93IHRvIHJlcHJvZHVjZSB0aGlzIGVycm9yICh3aGljaCBJIGRvbid0IHNlZSBv
biBteSANCnNldHVwKS4NCg0KSXQgbG9va3MgdG8gYmUgcmVsYXRlZCB0byB0aGUgcGVybWlzc2lv
bnMgZm9yIHRoZSBibHVleiBjb25maWcgZmlsZXMgc28gDQpwcm9iYWJseSB0aGVyZSBhcmUgc29t
ZSBvdGhlciBibHVleiBwYXRjaGVzIHRoYXQgbmVlZHMgdG8gYmUgYmFja3BvcnRlZC4NCg0KT25l
IGVhc2llciB3YXkgdG8gYWRkcmVzcyB0aGUgaXNzdWUgd2l0aCB0aGUgYmx1ZXogY29uZmlnIGZp
bGVzIG5vdCANCnNoaXBwZWQgb24gc2NhcnRoZ2FwIHdvdWxkIGJlIHRvIHJldmVydCB0aGUgYWN0
dWFsIGNvbW1pdCB0aGF0IA0KaW50cm9kdWNlZCB0aGUgaXNzdWUgOg0KDQpjb21taXQgNDkzOTFm
ZGNmNzFiMzJjNWZkM2M3YjEzNGMxZDFjNDVjYzFkYjM4OA0KQXV0aG9yOiBFbWlsIEtyb25ib3Jn
IDxlbWlsLmtyb25ib3JnQHByb3Rvbm1haWwuY29tPg0KRGF0ZTrCoMKgIFRodSBGZWIgMjIgMTk6
NDQ6NTkgMjAyNCArMDAwMA0KDQogwqDCoMKgIGJsdWV6NTogcmVtb3ZlIGNvbmZpZ3VyYXRpb24g
ZmlsZXMgZnJvbSBpbnN0YWxsIHRhc2sNCg0KIMKgwqDCoCBTaW5jZSBiZTBlNzk2Mjk5YjAgKCJi
dWlsZDogc2hpcCBhbGwgY29uZmlnIGZpbGVzIHdpdGgNCiDCoMKgwqAgLS1lbmFibGUtZGF0YWZp
bGVzIikgaW4gYmx1ZXosIGluc3RhbGxpbmcgaW5wdXQuY29uZiBhbmQgbmV0d29yay5jb25mDQog
wqDCoMKgIGhhcyBiZWVuIHJlZHVuZGFudCwgYXMgdGhlIGJsdWV6NSByZWNpcGUgYWxyZWFkeSBp
bmNsdWRlcw0KIMKgwqDCoCAtLWVuYWJsZS1kYXRhZmlsZXMuDQoNCiDCoMKgwqAgU2lnbmVkLW9m
Zi1ieTogRW1pbCBLcm9uYm9yZyA8ZW1pbC5rcm9uYm9yZ0Bwcm90b25tYWlsLmNvbT4NCiDCoMKg
wqAgU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91
bmRhdGlvbi5vcmc+DQoNClRoaXMgY29tbWl0IHNob3VsZCBoYXZlIG5ldmVyIGJlZW4gbWVyZ2Vk
IGFzIGxvbmcgYXMgc2NhcnRoZ2FwIHB1bGxzIGluIA0KYmx1ZXogNS43MiAoVGhlIGNvbW1pdCBt
ZW50aW9uZWQgYmUwZTc5NjI5OWIwIHdhcyBtZXJnZWQgaW4gYmx1ZXogNS43MyANCm5vdCBpbiA1
LjcyKS4NCg0KSWYgaXQncyBhY2NlcHRhYmxlIEkgY2FuIHN1Ym1pdCBhbm90aGVyIHBhdGNoLg0K
DQpCUiwNCg0KQ2F0YWxpbg0KDQoNCg==

