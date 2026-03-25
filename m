Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54115109C04E
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 17:34:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28676.1774460081210824920
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 10:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=vArZkXQ+;
 spf=pass (domain: navimatix.de, ip: 52.101.70.140, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a93Wc7J5YEd3UMA2CvX7e3/bN25CdaCTwzc7rY7ulAF+7OT2qO3QwdkABVSd2bklOM1GZs0eaoV4Qlpjv8Mn5Hv0GqmKtClNpaU4Z9+T+1LOm4O701TYb+OBSLCN2XxtdU5ipRzYyGtxREaRAEXIpYEnIE2f7nCWeyRpf+l+bsVMjx2kn/6y6K3n0yrYLNrJOAkUVCKVBHeeN3CfVhdvYpsyDzRd6Brc7fgEcdhRO0kgoLsnLkH0yfktAG64zsNKuKAxEL/9GhVq0NW2niJHgA57lqXZklwEqasrnF+9BEs1ZQf7Dh9QcNzplIjLpMkxsHqwhIo908+MmyC5Caj4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrGZM2rVfA1LVTevU2K156a8MyYC+ophPyto3g2XsJs=;
 b=uwYwVCNhV9wdaJXwtY067Z6pxyoLr8EfDVl78d1pkTP2UxH7uAjSU1J8PuXjHYK79mguXC595Jd9JRvuHcebl67L3qeyStTC5JToCZX8cOHLk9KymBJnaX/4A/HFdtknSKLoqGLrUr/NPxYwP+20hbACcCamTwp4wT9udxEmsQlIhiCOJ6zqaWliciVLmDH/I7JZfqHJeu9B90MrMHKmiK/c7ZjLh2YWCTdaYpdke8nNeRRqEpfWOp+z37iCsTArrVw7R3yEqkPav2CMZsP4gx1xCoTem9/xeSipeiva0ga6zOQHRKz1cPWVJPkOkl+jZl0J8L4DLbwLC/ErN4WLQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrGZM2rVfA1LVTevU2K156a8MyYC+ophPyto3g2XsJs=;
 b=vArZkXQ++PmbIJsJ1H99OBY5lzk0HXKtEbw0cBrETspdiSQikkU7WugG5Xs0RjbALbxo6ELR/ZqcOJaRISkayvQvyaOfwcAxSfJwy4AmP6pF3VF2b3farzTyRwGeBObZrEcrWec4YfWGrxY/OnJNyyhLIioBtY8l7atV0a2oojY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS8PR01MB7366.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:258::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 17:34:36 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9723.022; Wed, 25 Mar 2026 17:34:27 +0000
Date: Wed, 25 Mar 2026 18:34:34 +0100
From: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] icu: Skip buildpaths QA check, if TMPDIR is
 /build/tmp
Message-ID: <acQUiBfw3GTKD6IT@navimatix.de>
References: <dddfc185f8b0627d2851b95fe37b697d6453e7c0.1773822079.git.joerg.sommer@navimatix.de>
 <EC36900E-3010-4C11-B633-2850D42C60ED@arm.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="47nli5a4usbe742t"
Content-Disposition: inline
In-Reply-To: <EC36900E-3010-4C11-B633-2850D42C60ED@arm.com>
X-ClientProxiedBy: BE1P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::19) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS8PR01MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 89113f47-e041-4861-2319-08de8a94c336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	jjvm19Q4BuQfq4gmkbEavlSGoG8jwtnyVyAURVxFnrB7ZsCZSkG3QumwWyU7fN4ZXwYEIJ+VloQTvQq5II/93oPqT+bgIe4yliqJUB5zWBUY4N29M9AlDWvV8nYeCpM/Q44X9VmsKWVMrPnJ0aSPFJtAod+SFeUQ+6p61f5etQAh3F1w7hmSWf3S6g+c4VE+5oQ9tlW8oRK883CgptgNnTpYWJwsxp1mmR8sudIecH4o+BCe+creJlQElQJkapYLdGmopkNrv694U+tX0YjMZTHcF1q3Wz8ga2qRdeYDM1gDMc27D+BFi131tjL6dBU/SCDhmPit5x89QtfZlbfsIcnMoytW9MV4TZHj9QdeYCds6UippsIgzCvSU7+Qavwl+8zpovjxua0QA+Tiv432AmsUMcMvZSrnWX4KQkCyRXEJh8gXrtyTKZlBEEwGsNSSM8hmT9t4yjURMNuQRb5V3dwM/tQYfPehlKteSlKCceXFNxTB4yS8idIiT37n1Ry1Xl2NYN4A+rbKK6PUHPNDtwdPfyMKmxAfu9b0X33vUMbaHe39K4E/guyUD2ReAhzkx1gQ0dY4FoD9tUX8gv7G/Vi6mCvBwA4Zoq/Oqe8sIATPnf/PNf2eOK4mBvh2DibxTcKAEGPEVS8eVMJaGdfFc/AiuGhlbfXNZnD8r//+HJjE3U5/bX98uMBOGXgqO3ab
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R3lreDJvRHkvY2hiMjloT1BjNUdHa2VUWHowZFlDVVlhNldiSG16UW9Zcmln?=
 =?utf-8?B?bThFc1VodkR5c1Z1R1ZodTRGaEw3cDJjVVFKZjVXWHNDaGRKWVhSYnlXQ0tN?=
 =?utf-8?B?U3ljSmM5a09JUnBpT2JWZXdFNVRqZXlFdVViaVJwTFVYU2NaMVR0Z1EwYWN4?=
 =?utf-8?B?MTJSSHlyOEJjaThKMzhpbHZEeU1QWStHeE10SkxTUDh6NldrTVJQYU9CYWFK?=
 =?utf-8?B?SU44eXBLS0V0UlVhbVNYbzFGUGRxWDByRWR1d3N2ZTI3RjBkSy9HM3NtZzVl?=
 =?utf-8?B?QTNTOTdMQzk4Wi9mQVlaUkdBSmZ6Tnl2Um5FR2VUSk83WUN2Z1NkSTR1SEUy?=
 =?utf-8?B?a3JCQ2RaZS8wSk5MM0taYS9uVzVWcm1HZ2p3eWxQbWNwbjU3YVEzRTErTFJQ?=
 =?utf-8?B?VmVqOEcvN1VaSmJtdEtscDBubnlqVGc5YmkyU1dFNzllenNxZmZleU9tVE16?=
 =?utf-8?B?alZTTmdybWU1V0w2QnM5dVBmUDJhdFdQWThtUkNuQk4rTnYyUy8xYWFFQXlK?=
 =?utf-8?B?UVNxY0Z5dlRrNlJSWlhCckRLRFNPVkVva1RtTFZLRGhYVDQ1UFFQUWJ6N2RI?=
 =?utf-8?B?UmlZMmkwRTBaNnZzSGZ4Zk5mSE5xNTM3YWR6K0xGVndJUkNIZjhEbTY3ZFpj?=
 =?utf-8?B?UGJpR0M5bkMvTnk2eXNFdm1rZS9MaG1RRHh2TFI1VlluaUIvdk5NV1dvNW8y?=
 =?utf-8?B?bU5ZUEVMV2tlNURObzlxc3VtUmI1RWdjWWJZajNES0tvQ2JXM28zOGdidGJU?=
 =?utf-8?B?Z1R0VmdxVlVFTlJFVlo3MTlwRlltTHBYSzFDRFZVTG1mTWtPUGNsbi9XVm80?=
 =?utf-8?B?WTJsQzE3cTloTHBBaS9KcGR2SnZpcHQ5SHBMV2U4NzZsbXRTYnNwaEtsL3NH?=
 =?utf-8?B?NlBwblVrVDhneDZKRS9uM0JOeDNDaWNTaWpvOVVJQ2ZpeG1rdFI3bGthZmRD?=
 =?utf-8?B?SzJiZFE0cWh4Q2M3UzlkR0prZENhc0pmdmFvTWwwMkEzcCtLei9KSDFmdGNB?=
 =?utf-8?B?MlRNbjYvc090MWR4S1BZWFovVjRPVUxIQnNNTVZtcnZSRXhPK2h6UlJOSUxH?=
 =?utf-8?B?N2hvaWVTeDQ0c1lvRlBxTGp1RzlJclE2a1lKOVFSZUpHRmt1elhlYjJWQ3Rj?=
 =?utf-8?B?d2h5Q2VtWlJmMmlaMWdNUjQrWHpSbkt5RVZhb0N1UHlNTHlYemhlaXpTM2JE?=
 =?utf-8?B?ZTZQVEJJMEc0WjQ2OUQ5UHZxcVJFT1Z0dEhJaXc1MWgxZ1pFRkdkOGdlYUNF?=
 =?utf-8?B?a0ZxNVFKVlNTNHAxR25NWXQrakozMjhuMGJuVTQ4NlRmNVNXRlNtbjE4cVkw?=
 =?utf-8?B?RTI4MXQ0UnluZ2s0L09tUkpNb0daRC9xYW9sYjMySmk4bWljRFBBa2FYU2M3?=
 =?utf-8?B?YmJqaWp4T29lR2xVNVA3ZjBNNHRHVFBoOGU0eXhWc1MwcDRzQkplQ2lWZnZm?=
 =?utf-8?B?S3MzdmphZENSc1BzK2RnVkUvSFk5OW1Gb1ZtVWZ3Uk1KSU42NjFuVmxiaTc0?=
 =?utf-8?B?OExRN2Z0d0ZJcVVpRzJMZ0Znc1hhcWNGbE0rRm5UcmhIUkFGZ0VCU3FhK2pJ?=
 =?utf-8?B?cy9xc0hjNTlJY2F5WHJFakRzUnhuZ3dKQlJFVy95WndhdnFFNktOY3dOOWd5?=
 =?utf-8?B?RUVHWnNZV0VuUVlCQ2pVQ2QvTURzZVFSb295cEN0SmNGTlR2MDE2a3BWeEor?=
 =?utf-8?B?L1VqUnc3dGdVcjVnVEtuMzB6L2labzBtUUMvS0tuOFpEWGxzeTcrZklXSjIw?=
 =?utf-8?B?a013MktEMStnQTBrbzhRTFZiaTc3YStKTURkWVdHb2xtaThHR2picXk1M3Br?=
 =?utf-8?B?WjN1TnhRVGpMRFdOSmNFdHdIS0IyRmNicUxnaVM0dVkrbmFZVFN2ZHlVUWY3?=
 =?utf-8?B?Y2djK25oVXMydURZcDhadmZWLzJGUEFZWnNqR1BDcFRnUDZrcTQyS2x3R0tZ?=
 =?utf-8?B?TWt5dmU5VHRLMFcySWcxS0UvdmlzRURheTg3NDdrUW9VaEFqSytZUHc5SDJV?=
 =?utf-8?B?N0t1SjRleHkwTVo1VlZvVXRHQmI5M0l6dDdPREZ0Vm93dTlKR2cybk9pTnVs?=
 =?utf-8?B?RTdrL3JoclU3UmpqY3JWbGh5dVI4d2YzZFhHNFlqbk91V0l2V2RiemJaWTlz?=
 =?utf-8?B?MnNyOFRsRlBqRklxVEY4QkszRnVYUEd4Zk82RWFOU1pHZVFlUUtMNHhlL0J1?=
 =?utf-8?B?Rnh2MFdMbW9GVU9NMjZ3SHFXVU5ZT0ltMEwwaVhOUjdXZTJXQjE5cHBha3or?=
 =?utf-8?B?ZjNyVGRkUW1DQUNYV3NTTDZ1UjhJTVdGQlE2dFphN2tkY1dZWWVXSEkyNm5S?=
 =?utf-8?B?ZUc2dFF6amt4K2FtN2lUd1BPVnZ0c05Lc3VDTDBuN083RTRHMzRpTXFtVDhH?=
 =?utf-8?Q?1P4a5NuVwskv55bo=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 89113f47-e041-4861-2319-08de8a94c336
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 17:34:27.1465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVlNIrV7nK/YhawFioJunpKpQXOAGhm7VqewK59knVvl2Aa6O6fu1Di688shuauSdy9F4VgskK9+1WV3EvIwrBh0hrdRS8vsmZjzhc3XicM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7366
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 17:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233932

--47nli5a4usbe742t
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] icu: Skip buildpaths QA check, if TMPDIR is
 /build/tmp
MIME-Version: 1.0

Ross Burton schrieb am Mi 25. M=C3=A4r, 12:27 (+0000):
> On 18 Mar 2026, at 08:21, J=C3=B6rg Sommer via lists.openembedded.org <jo=
erg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> > +# The file source/test/cintltst/udatatst.c contains the string "/build=
/tmp/.."
> > +INSANE_SKIP:${PN}-src +=3D "${@'buildpaths' if d.getVar('TMPDIR') =3D=
=3D '/build/tmp' else '=E2=80=99}=E2=80=9D
>=20
> This INSANE_SKIP is quite ugly=E2=80=A6

Yes, I fully agree.

> As this is just test data, would it be possible to patch it to something
> that isn=E2=80=99t likely to be a build path instead? (and ideally, upstr=
eam that
> patch)

I don't know. But as far as I can see the =E2=80=9Cbuild=E2=80=9D part is a=
lso hardcoded in
ctest_dataOutDir[1] and I fear in more places. I didn't try but a simple
change of this string might break the tests, or needs changes anywhere
else.

[1]: https://github.com/unicode-org/icu/blob/1659052025f132eabc9b088ffa5dd1=
0f733993c9/icu4c/source/test/cintltst/cintltst.c#L386=20

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--47nli5a4usbe742t
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
ATAcBgkqhkiG9w0BCQUxDxcNMjYwMzI1MTczNDMzWjAvBgkqhkiG9w0BCQQxIgQg05tHiKZi
oVSBIHC7z4iAJAAQFs5pBtcOgpXE4Rwcj+EwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAB10jZSHvISY
mjujRGxuCIYSj4JnCWEuU7Q1f3wlPBWDREiIFulEdKc2XbRuH9xHRTXCn9e4/gCFqAGXN62H
Xk8Zxnv/lRmCUdN/zmRecANvlDYI+NAoO+Idj94IndP1E0T6m06T1vUV05//BxKOn/wmE+Ct
p5cU7VJ+OS+rFrMSomQKzAX9q3Jn77nggDc+I578woQbKxLRrPDx/uEsMgTQevAjj9NbUumq
0Hyh0oEuX3F0pKM2UTj8rjHEic75qg9666yAD21ML3yGyVkfciW5t6JkQg8zDnyfKU5gTv3b
IyUE6sJVvjgQoCQUjtrDpYdbC+vhTQ4/4lv+woDjfvA=

--47nli5a4usbe742t--

