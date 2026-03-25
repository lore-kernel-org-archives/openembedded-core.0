Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E6C109C05D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 20:03:13 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32510.1774468988060178988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 13:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=bKDC2vOv;
 spf=pass (domain: navimatix.de, ip: 40.107.162.100, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG96tLIxWIRyRcXg3gnyLuIDtYNAjVg3SShc5f1K17G3q7jdmQ3HYKGADkc9cH2+I7vz/kEpKjFtn7aBPhUY9eXN+UCi7QHx38gf6TPJWOlnHQPwKfgWa8taqElPm7OV3B/gVph0iqTRr4MZaMZZrUcJOZ6HLuWIL5jcstTkFfy2KfvXSG3zbPekaL8VdzHkjhKc/vS2gDZm7mKbBgNeYIdTo6V/qK+uk+XlpyyqBlCb7/097AzG70Zgy+LJ2CxI1TYWOmd/M5pqvWx7OBgIs8f7yLoDji7/dept0okMu9Ch0zA8irucW2BZmb+foT7RLelMviWs1WEWrJyMYF/AMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxawZRjvmU/alk0Bsu0AazucxXELzhIFVIKd14aubp4=;
 b=C/JPk4+5KTtlQnZ48iZB2t3kIzyISNDDx5aBTdxXXeT14JYiGevERsLJqScpWBfWonaUrhOUDGqEaWFV9WBI8e9H9AyHYI1GXhzSi2fN405Zr7aGOwdVt38QtmQHVD7q3EMtQiR0a4R/drSJVGHfqX7sSZBuH5H4lRvwasOQetwTrIStII07JDL0dw8b1wDQ7Toz0OtfH1Y4cw1aexpba9F5s4Wl3bdAHPPwG7ohV4QBINSbPGmQV5jGmqIyo8I7tTLIKGe6/IhIC1un4IjamF5JPfdCoouTzbepswS2wfb/N9FYpm+dCuQdZqfD2AyZZG2UieOhR1kqJArxaGopfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxawZRjvmU/alk0Bsu0AazucxXELzhIFVIKd14aubp4=;
 b=bKDC2vOvywitt7ycwCcJiu3roLCezS2fI8wfp85iaTbqsP0FC6Gj6BVxljqlY6cKS4Qq7YglQqPbF0TnrtegzBt7PdqQryHcFNCrt6JCMHXkBfWsbDDvwd5sBHT0LjsRPjCJ9J/Gr0nwsXlNndgNwa6RX5lnuMeyklQg5fecfHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI2PR01MB12690.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:327::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 20:03:04 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9723.022; Wed, 25 Mar 2026 20:02:55 +0000
Date: Wed, 25 Mar 2026 21:03:02 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] icu: Skip buildpaths QA check, if TMPDIR is
 /build/tmp
Message-ID: <acQ-FrzTYxhakf0Q@navimatix.de>
References: <dddfc185f8b0627d2851b95fe37b697d6453e7c0.1773822079.git.joerg.sommer@navimatix.de>
 <EC36900E-3010-4C11-B633-2850D42C60ED@arm.com>
 <18A0260B1ECE6409.55659@lists.openembedded.org>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="a44ly4b4oyftve42"
Content-Disposition: inline
In-Reply-To: <18A0260B1ECE6409.55659@lists.openembedded.org>
X-ClientProxiedBy: BE1P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::16) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI2PR01MB12690:EE_
X-MS-Office365-Filtering-Correlation-Id: 36640bde-1ebb-4acc-7982-08de8aa980b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	n/af0gD6iTwxvz0H5F81+ympKQlm4WuATGVtRKBT7BrTiIXHD2iy6YqIj/ZuG4pCI7QLoe6uOrUaJ+9Dh/RZd6uVmKLAefQ+aDmd8PVAl1ZV0PoXq0lPgNtIu92SWiOy2YyzmIUodiNZjylFgj3mJd6iHpXXHykxm4nmMb5KJXhI51KmC6J2yoAXR1PYmpHfOte93LZbK3UZ5VULZ3xTtwSYtNvTSqEMLZHiJEdT1imeIW9TY84DoMs+/jm0yQctbihuAnTGJ4I4X3rCTodjqwrOprzolrtNEJ5UfwSEeR5Pp2iRoohmfoLMJvNOZXL4fKdWMkdF70ALDEzDblCfeMXSye3dewe48mj8FPExDZvsCQ1dSpnNc1XTSt06+RTYNggmaJZzKqnwpHTcCpRcNAlame9/DANmVoqblcZ9EpzkplwXxPRqXc/a4v/QRs+cFf8JrYvOkbGWhPlCIexK3MXq+bXtToEzQ3YO0eKVTd3ZVAmX7pXTWVi0M4r6FduxY0gTRhSgK3NYjngoWPiDnVqEqdcw/1FSOd9gMKmzqt3QWSwJ5zPtDVExhKSQpGRCs6XidNpkoUmTwG6vUrXdGBm60BuVfz7cVitJf55X4zpxt8+RGYdiNabWEKJhDBn9YbA2pCq/4gHjrLP/9kxv7J/IwuS40f/q2FA73dkOpF8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RHZpMjgrWTI2WEF1amtIQUIzV1Z6RzNDcjZvZVdDK0piWm9mZms5QXVWRHlP?=
 =?utf-8?B?SGF4Z1dicGlIa01OSy8zTkJSNTl1Y1hYTFJJdjZUUVFUcVMzTEYwQXdNdkdQ?=
 =?utf-8?B?SUE2b3cxRWJ6Y0FtWDlkbHFqOE5sS3dNVVF2R2N0cWZ5QUhXQUVFbHh2Q0Mw?=
 =?utf-8?B?bGhtdXBXZXFzb1JUbTBzRkhCMVlFWUIyUE1JbTBhYjhnWjIwY3ZoZ0swQkpP?=
 =?utf-8?B?VGF2MEhEb0UvZkRzWHhWT1JqM0UvQVlhWEJtNlFFVzNINzJid3cvenhpMlV0?=
 =?utf-8?B?clhKM1pWYU1ZVlNOL1hnbWx6czNWeWRzck9CMEV0VHMrWkFib3UyaG5yMmpt?=
 =?utf-8?B?eGNMZTZyT1FVb1RseWtWdHdwQWxnQk5YZ1IwVzN1UG1DRTluTVVUc2h6M1pq?=
 =?utf-8?B?SjdKSUJzbmtTdlFjOS96aEw5NUhLU1krUC9xK2g0MEgxTEk3VGJTSEtXMkcz?=
 =?utf-8?B?RXZSYUU5d0lxazc3OStZN2lSbUxzK0EvYXpqUzZiUitTUWgwU3lOUzlmWWVs?=
 =?utf-8?B?QllCT3NGQ3Y2VklQK2h1NUk4Sk85MDFTMFBXV2hqNE45NTdUNGpONXlFczYr?=
 =?utf-8?B?R3diZnJxMTVPdDBtQ093VU1qUVlTTUpYTFRIb2toS2R3bjA2ZVd6RHl6Vjdz?=
 =?utf-8?B?T3NoclFmYzN4bi9qVDlkQjk5RXc0U0kzYUltVUJuSHRHaGdCNHhsZ2dVOC9X?=
 =?utf-8?B?SjJXZm5aMHBzaElRazNuU0lsWktSV0RHNjVxbUoxOGZHYVlleFFnMi9HcCtu?=
 =?utf-8?B?U0g1bUF6eTZpVnZFOC9ETzNuY3lrU0MyOGxrUnBCRDVNbmhlY1lObGNHbksy?=
 =?utf-8?B?M3RRQ2ZWSFdnZ25xZDhBdnJZZC9FWFF5K1FGRWJnL2lIWG1iWjNrZnlnT1RO?=
 =?utf-8?B?dExETWl1SkFoT2dCZnd3Nkk5MGlBeGdLSmhXQTVUMlBOd1ZzZVJISzZXTGQ1?=
 =?utf-8?B?akM0SHZrbTNwOHU1SVFCTW9lL3p1Z1NWTXZhWXVHb1dtSThTcEJET29ESFlB?=
 =?utf-8?B?dURJZTFGWkMxZitZT1kxcnJZQVFueFdUSWN1UDZWMG1uaUliVitZNFBiTDNh?=
 =?utf-8?B?dXZyUldwYXM2SFdhbmpiSXdGWUtBUmk0WmpnZzZxOFJNWHFkQm9IUVlmZklp?=
 =?utf-8?B?Ry9lL3lrZ1R6bmkvZXgvU1VXclA4cW1LMExrR1VKMXEwZEdwc1g4N2Q3dGFm?=
 =?utf-8?B?amh5ck9GUGUrajVQczhQN3ZIcTNEK1ZtR2Z0QmNkK0QvaEhaT0xkaFd3aDZG?=
 =?utf-8?B?VENQMUxtekx6cThnbDZwcTdxTkpKcHJwcGpoaTNwRFFGeHRLVWZPRXpJY01a?=
 =?utf-8?B?WS9KeVVGZVVqK24xRkMrbUdaWlhBUjdMcW9YNVRGT2pKTFYyUUpCZFlGRWcx?=
 =?utf-8?B?TEJOSGFMbU43UUFQbXp5RmlZdlJyZ05xaXJCdVEybzRtZEJxems3VWo3UXZJ?=
 =?utf-8?B?L3VucmJLbGcyby94M3B2L1l5R0QzSmdhWXhpOFk3UUdvOU9YY3Z4cWRhSEo3?=
 =?utf-8?B?V0J0VzNvZkR4d2p1RnhpdkV6N0hyNUhQdytWekZIaUhEZ3E0UzBMYUdSc0tN?=
 =?utf-8?B?NUdqWS92YURuQkIzYkJ0RGR6VnRwR0psUnE2WGNOM0lHOXpiYXpJb2dLaTVk?=
 =?utf-8?B?ZjRiMnU1MDlLT2MvdXAvU2RqdW5HSnJGaHpKQVVDWGlCQVcwWUluVUl1RUMr?=
 =?utf-8?B?MlhsOW9TUTFyZGhxUjFESVA1UjNYenYvUWZ5QVlscUJWeG5iYnppcXBaOWZN?=
 =?utf-8?B?Tm13VUxNNW5qd1RaV0FTWWJ0V09Gd1ZPTnR0b0lTVWhqakdob2NObm1kTWxh?=
 =?utf-8?B?ZFZKMmdBbnFrTkRDQUZzZGZQS280Z1hIUHp0V1V4ekNQRW1kRXpxbWFRbWFF?=
 =?utf-8?B?VCtKci9UOHYwU3JHMVBrMmVHZXZzUzR3b1EzRWkrK0MvOThyZm9RcDFOU0Vi?=
 =?utf-8?B?RlRRVmUrRmJRWm1yZThOYTg2c2g2SWtlQ2k5M1oxQkw3bmh5S1h0b0NYQ3Fr?=
 =?utf-8?B?YjljWVcxTytiTUJ2WTFPSm05VzFCVmpzUkN2K2phdHJ5bHlVMk03QW9yTjhz?=
 =?utf-8?B?QlpPR2RDaERPdTdMQUFJT2d3NlB0Q3hsNGc1K1ordmdGbml2VDdiblhqVUdq?=
 =?utf-8?B?aHp3M084bWlOSndpYmhxb01VdWE1QnpXTDF6S09vdnNpVFgxWHVzUnVjbWYy?=
 =?utf-8?B?b21qcVZ6L1FORnVSb2RReWduRDZHSm1qZnh2bWtPNVRvNzlFZFNWdkdhN1I2?=
 =?utf-8?B?T3UxT1RFcG5QNkVETEZFVlhpeGtsR1o2cXhvL2hhZWpKTzJiQTFlMmpFb0E3?=
 =?utf-8?B?N1VXcWV4aTJVdEwrU1BCaGlyaWZTakgrRlhpY2dlV3hZcWRlb0RpTkk1cGNY?=
 =?utf-8?Q?Yr+LVtWj6O9L6NeM=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 36640bde-1ebb-4acc-7982-08de8aa980b0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 20:02:55.0056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFbbnNNmUqaCNcuy7V222xHvHUGVLH6hH1r6XL4/tx1qol5uHgYwUxx6HWP8bT2LDprdFpir+Bnkf+BhKBzKo9/HWl7TZedOS6+/2jNJO5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR01MB12690
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 20:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233936

--a44ly4b4oyftve42
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] icu: Skip buildpaths QA check, if TMPDIR is
 /build/tmp
MIME-Version: 1.0

J=C3=B6rg Sommer via lists.openembedded.org schrieb am Mi 25. M=C3=A4r, 18:=
34 (+0100):
> Ross Burton schrieb am Mi 25. M=C3=A4r, 12:27 (+0000):
> > On 18 Mar 2026, at 08:21, J=C3=B6rg Sommer via lists.openembedded.org <=
joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> > > +# The file source/test/cintltst/udatatst.c contains the string "/bui=
ld/tmp/.."
> > > +INSANE_SKIP:${PN}-src +=3D "${@'buildpaths' if d.getVar('TMPDIR') =
=3D=3D '/build/tmp' else '=E2=80=99}=E2=80=9D
> >=20
> > This INSANE_SKIP is quite ugly=E2=80=A6
>=20
> Yes, I fully agree.
>=20
> > As this is just test data, would it be possible to patch it to something
> > that isn=E2=80=99t likely to be a build path instead? (and ideally, ups=
tream that
> > patch)
>=20
> I don't know. But as far as I can see the =E2=80=9Cbuild=E2=80=9D part is=
 also hardcoded in
> ctest_dataOutDir[1] and I fear in more places. I didn't try but a simple
> change of this string might break the tests, or needs changes anywhere
> else.

Because the error is

ERROR: icu-78.2-r0 do_package_qa: QA Issue: File /usr/src/debug/icu/78.2/te=
st/cintltst/udatatst.c in package icu-src contains reference to TMPDIR [bui=
ldpaths]

we could rewrite the string to `strlen("/build""/tmp/..")`

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--a44ly4b4oyftve42
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIThAYJKoZIhvcNAQcCoIITdTCCE3ECAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG
9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMT
JVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAw
WhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4w
PAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBF
bWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY7
5tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHb
SuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfq
B6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC
0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz
6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5
v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNV
HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9j
cmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNy
bDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3Au
dXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfX
ehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2
f102qxxvM3TEoGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGW
MeK1w+vnKhav2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF
8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bw
c/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F
2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORds
NmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNK
cIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQR
EJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVv
JsmzNicwggUwMIIEGKADAgECAhEA/OH3TxzsxiYnBai43hD2fjANBgkqhkiG9w0BAQsFADCB
ljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0yNDA2MDQw
MDAwMDBaFw0yNjA3MDMyMzU5NTlaMCoxKDAmBgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBu
YXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUp
uQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wbv4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AH
QAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63w
hIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4N
EMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPh
vLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQdxilvAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIw
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggJ7MIICdwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggaAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMzI1MjAwMzAyWjAvBgkqhkiG9w0BCQQxIgQgq4beqw9r
9M2Tv9Zh1FNTSV1hRHz4OM09BvU1hFgWAa0wNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAJB4/T07t/a6
PyQuyM4ExWs8/yyT+TNj9r1LOO8Gc/O1M/O4pl3lQLJ7WaLhAsOC+wcUtT7W1BTdJMRpFswh
MQv3lsPbYt/AhqlGaj6RHpV5foxjE2wEat3BHKKv2mCKDQg7jhCuKBHh6U0xj8M371oKX9YZ
145STsIwuHSG2gpkFAX+6vcNi2W96HHwpjcPGXbJwqMMSvf/RHneg6DNywm6zCBbOlM0oYPJ
6MaZ/d8uFFjtmoeaYyndR/a0q5Eg60WB37vBdat1APBysez6TpQLwgf7eLangTE10PRFYmkC
NkGNFlT+hhBRkc0aKfkU4ZEbWpFXJtoo4TpA7DBjsJ4=

--a44ly4b4oyftve42--

