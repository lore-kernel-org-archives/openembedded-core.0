Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECA7C5DF89
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 13:48:33 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7824.1787320107700062954
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 06:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=aTw231p/;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.83.9, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M48TbkocNNbGq+27VyvFr5uLrdUTlxUMWQ8Mghpb064dwxbhnmOsEkPluW7bkNlDioC/hYpxxesxl6NVZO27K18np8T6COOB7F5RZlJJThhuKBN4X6d7RuwVdLejT2GB/IwQTxpiLbatWzf/wtLYbDowabl0GOPl3kPjE+9/83BHPwDdrXwzov2hCEXPevCLbBnxIBa+Xd6AP4Hj85jaAeoYBCDtIMpIokJyV/0lFVH1HvfKMmUuSD5s9iM3F+Sga0p26D2ZVznlSE5NyOOK6hMpZqXdoYXmxBLMMKx7PJuK1QXX7IatkE2tnspFxSnpil//9uOz1XSPkiwnBZvS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbXvAD+h4QKXV3EHKC/5/jO6gLJK4aJ4Q+/7RNPpNZw=;
 b=cxHeVa+37D96urUAWi9XbSeS9wALVrGjNLoQBhBNYcoVriorxmD7tmfTpfms0G00qSJs15k3G/L5z9nt+Fdw9/fAzcmcUFnrOYCVQMhSL4IzQSuBb+IMbe2y7jFKXSBpAtChTF11Uirs9rpIQ1HoMEVhi2GCTwGPxOfmcwaxg0I75co3r29s2Em/rBQF17wRlelVQuhmvnTbxYxSVXkgIiHr5N9rXN+sBaCiOItN94MlyW1yWqLQV3a0hnwC3o2RQVat5dzrqvdSXX8EKgsCsqfOE3jUwvchVlM/h5EWVkpYYFG9sHswNx7HKQJ8IAw2ZtNQ//0VZtMjauExpL/ScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbXvAD+h4QKXV3EHKC/5/jO6gLJK4aJ4Q+/7RNPpNZw=;
 b=aTw231p/y4BlvxY7kzwI6fJndi9IvCjMuo1H7Bwrwg0Ycr06w7XRpFEAYrHTijkokYBqGzIayfpJM4XpLwhqYsCdU+jBvqTtMCPgaBcaszBkrWhQny33UhyACnydFewhfV+8YNBys+dhqy3VCq/e7DKNeDolR2zNaHRUw/x2WfTXXES+WOcfUzQlb3ennACGf2oBKeOVxpfiVlE8V6pQmTzJFEZNRwoVT/MRz1eJtAkoyPpiwwc/M4BFMpQ8Az8QC6kGM8nJ/LxiMp672B+WE8PnpNuYcnVr5AxM8bg2yEg/AOyk0mtwEFiKu56sK/yyVnse8XRxB4ZmhqwJk4N01w==
Received: from FRWPR07MB10660.eurprd07.prod.outlook.com (2603:10a6:d10:183::9)
 by DBBPR07MB7433.eurprd07.prod.outlook.com (2603:10a6:10:1f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Fri, 21 Aug
 2026 13:48:23 +0000
Received: from FRWPR07MB10660.eurprd07.prod.outlook.com
 ([fe80::9105:401:e0a2:a997]) by FRWPR07MB10660.eurprd07.prod.outlook.com
 ([fe80::9105:401:e0a2:a997%4]) with mapi id 15.21.0360.003; Fri, 21 Aug 2026
 13:48:23 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH] util-linux: fix CVE-2026-3184
Thread-Topic: [wrynose][PATCH] util-linux: fix CVE-2026-3184
Thread-Index: AQHdMXO7e1pz33f/l06CsBMK2KzqPg==
Date: Fri, 21 Aug 2026 13:48:22 +0000
Message-ID: <20260821134807.1295002-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRWPR07MB10660:EE_|DBBPR07MB7433:EE_
x-ms-office365-filtering-correlation-id: 74830ad4-46ad-4a93-2fc0-08deff8ade21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|6133799003|10067099003|11063799006|5023799004|56012099006|18002099003|3023799007|13003099007;
x-microsoft-antispam-message-info: 
 NiaO5FfjHpn/8L38ActauYXA913sM1kipZjIPrkLWjItfW6u7txvfZzLghGJCbL50nCbAa73sa6EoA7waQzsTAz9Nuy+DTQY/b6mP97gDVo/kEoeVFM9PmPLHeAZPLp9aJv50RN+vbdq3Lbi1553Q0XfIaMZVcVjt+wAxmbVe6GNE3DxsSd5reGzvcnJOco33SDoJ0Wpem8RI55FX9qUC6rTgehAbHrA1wmDfgbEYOMD9St2krbMAp7XBiSX7W0m8P0TMsJU42tpxkU9SuUcyTGQimfFC0hLNNqqyDQTDYSGUqCsgthPkz3N4BJjthBa8Zkfh6fUoaSjT4xrSmj/tEcPf67Iw4e9zWFul6ZjglNMlHy/FpSh4A9ziee7+9F/dhRNZbJVhe9ZK2uFw61PULFp15M4NG8gMaFsMeD1aYLRW8rFGHMVOhqo2gnBpKsMPprJH7SCeDa82a+pKtyuOZK81Kjc5FwTFVLyUeML2DvKgo0KbV2w5lmUoxY8Zob4Mu4tAXKQmq9RoA/vwy3wC7WmNoqhL2IJWCoaMaevq1RypzMUdWx5OCqcGtQtAdj77Z3Y2HwWUjM7vrlLxGk+otc84Nm3ZK4ImOTaA0QJ1UC7jjyYfZ7zoDyVPIC5XDtjTkIuWcnVIkyIK5hf4OyLUmYUpF7yibqpeGP1bo7emz6raPBvPmDzKqqTVGTvLvoKSQOW47YcuAhpSUP9TySaF6/6iPddx7c9P6fduj/aihU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWPR07MB10660.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SFd6b1pLK2ZxVkM0NHJZL1B0MXVFVGRFVTRRbkg3cWNCZjAwb0ZnTHo3dE9Z?=
 =?utf-8?B?bzRvTE1saWEwaWNxang3ZThrMDNFMEIvTXBoakxCV2RaOVhhYWZkRUpBUHRw?=
 =?utf-8?B?WlpNbUYwRGljWGZVdmZVQ2tyWDJ3M2o4T1A3RUFpQ1psTXRPNklWM20wVmlE?=
 =?utf-8?B?UGxMdVZ3R2hveCtpazlwbFc2QnpzZkJvS210QTA4UHgxUkJPcncvcGIyazRj?=
 =?utf-8?B?aDZyR0dxL2hyb24wS1hjb2tuUW1mWlYra0dSdGsxdytDVVd2NHU2Z1dVKzhV?=
 =?utf-8?B?UEJrOFB6d2M1RC9TTFZGZTBIUUg1d3F3Rll1anBibWlIVUE0dTJrQUlaMmNw?=
 =?utf-8?B?SU05V21TeDdKeEI0RnlOR2kwaVY3LzhEOWV3WTVDS0ZGbVVScC9yU0lmd3Vr?=
 =?utf-8?B?VEkrdjJja2VsdVppMWxBZDJDd1IyM2Y5Sy8rdU9VY2JFaGh4b3VMM2UwSGtO?=
 =?utf-8?B?eVp4ZldRNDZ4ZXJvb0FETkdiTklIdkFqNnZyMHpIamNWYXhiN2x1alZmQmo2?=
 =?utf-8?B?L0FjeDBYNDE1NzlBdlo5TE9MZTJwTUpzMkhRUnVwK1RpdVIveFM0UkxLcnF1?=
 =?utf-8?B?a2JoRlJyZDFaSW1Kakd0WTlCQkxmZlExbE1UYXRhTytoOEthdjhhcFF3b3pR?=
 =?utf-8?B?Y0h3cXhFODY4ZkNOTE5NNisvdVBQaG1VWU93cGl1Ry9aU1VZWmZsOHp3aWo4?=
 =?utf-8?B?RU9mRDVKeEZkQ1RlSGhUZDR2c2NQb2l1eHJoNG1mZElhRXhiYWdNOEJ0YkdL?=
 =?utf-8?B?SHg3RjNET0hpVFlFNXRWbjV1WlR4S25MT3JIZGU5NzZBazZkSXY5cWRRRGNP?=
 =?utf-8?B?dU1mcVVUMEtLUXNkOFVsdnl6QmdmSVdxU3l3ZTgrM1RtTWRscmV2dFNVNmQ4?=
 =?utf-8?B?NUpTdVMwcWJIemk1S3EyNG9Fa0tHMWl0NUp6MTRqbG16SU1Uck5LY1ZsN283?=
 =?utf-8?B?MVVMMWJPSnFmZTFRRDFtZTM1QVp0ZFh1YTFwQ3hIRi92SE1UN21EYzVIdU9t?=
 =?utf-8?B?a05FOG1jL2t3OEJ1c2czMFJ4eW9MQVlZY3ZmSlBLRGpaU3ZncGhRZXFQWEJl?=
 =?utf-8?B?SzNnL3orQmw3UThzcGtSYUtXZHhVSnJaYkpjVjU3cTZveU11LzlIU0dkTyto?=
 =?utf-8?B?d0tKQVA5WEFFbVJhNCtXQ0Rvc2dmVEhYcGUzU2diWmxTL3NzT21Qc3NEalFJ?=
 =?utf-8?B?M2FLVzZWVFRJd1l6c1JOQTA5c2xxQjNYRmpFcXA4YlIyQ2pBSElHOWk3TFhh?=
 =?utf-8?B?L2owQ0N4SVZHeExtcmlCc3oxbDdEN3JHeWdIdmh6dllpZEhoRXFiSEpSTHJt?=
 =?utf-8?B?WnBGOXgwQmlhemkwUVFuM04yQUU4d3o4eHh0OHBjeU0wUzBGcDgzR0loVGEz?=
 =?utf-8?B?SFI0dXpEUEE5ZFhVTWh2a1RLN3EvRmV3czlqZHEvRU5QTE80SG45SjA2c1BZ?=
 =?utf-8?B?Q1VsNXZ6M1FoT0N6MktCNTBIWUlEYUZ5VWNsUXhDQ3NuOXZOd2ZrcklsVDdU?=
 =?utf-8?B?alZPa1FWZ3R0eFBOSmVhZnc3Tlo2Sk50ZWhUeTZXT3E3WEdvRW1FYUhFTjJQ?=
 =?utf-8?B?Wnk1SkpaQ0pKZGxROU5hZ2Z4NnBwMnhsZUNMSUVIbGRLTTlQcVp3MEEzcXUz?=
 =?utf-8?B?Q0hnS3h6NkNXS085dnphYjJBZmpNSll3OXM1Rnl0b2tmZHl6RGdGRmhVaklM?=
 =?utf-8?B?K09QdXNVeDN5L0RBMUQvUjVCNWJ3bUNmcDl5MzEvb0N1b0JGejc4TDEzeVJQ?=
 =?utf-8?B?azBnekZEVWlHWVJVbWt3TzlPUVhzZ0lScXBnWFU3MWpCVFRNQzFaeWJxR0NY?=
 =?utf-8?B?aXRiYm02WGNRNWJlRks4Y2JCSm5HTi9NdGdSc2N2NmFBWi9QSDE1TlNNRGNp?=
 =?utf-8?B?T0I0MEFHLzNveGVtbzY3QW1TbWxNL2hTcndvWTJiMGZHVExwc0ozMGd6YllZ?=
 =?utf-8?B?bjY1ZGladjNGTWtWSG5XNTVNQ0F6Z3laSytNdzRDVThLZTc2c2V2SFRQalpE?=
 =?utf-8?B?NFpCWDNmQzB4M09KZzRPN2hoOUhZMUZWL3RlNFdUOHA1WWRoanVULzJ3WnNW?=
 =?utf-8?B?U1JDOFNYVmZCMWRXOUk5T01oeFg0L1dBcXJDakI2RStFdXF3YUtuVDVSMVor?=
 =?utf-8?B?RXBTVVJIc2JBc2JITFM0ekxIQ0RRQ3NSd1JSUjhHV3IxYmxBOHVVeUJ5UzBC?=
 =?utf-8?B?MUppUS95RGMwZ3hCSFhxbXBjWHErRHluMkVHY0Ivd0hsclhNNkVKUjV3VzRu?=
 =?utf-8?B?WjFVNDV5WllRdmN1NEhSKytqSVBoTUJ1QlFsRUE2RFM1RzY5bVhUbkJpbDgr?=
 =?utf-8?B?ZnlaVUtzTXU2SHFWZ3M5OCtDT0E2UGlSUVV6WE9jOXE5V0RmM2ZVZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRWPR07MB10660.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74830ad4-46ad-4a93-2fc0-08deff8ade21
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2026 13:48:22.9367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ACoNLAc+Vju19k0X8VDU9KmtaosYDWX5/Qs0ifXKPTEECHHt4x3DM+ysUry/MlShJyr+i6Yk2V0a5WmdWyHTaEoml/EdsYC5i7fLSESBEzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7433
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 13:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243942

QmFja3BvcnQgcGF0Y2ggdG8gZml4IENWRS0yMDI2LTMxODQuCgpSZWZlcmVuY2VzOgogIGh0dHBz
Oi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDI2LTMxODQKClVwc3RyZWFtIGZpeDoK
ICBodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbW1pdC84YjI5YWVi
MDgxZTI5N2U0OGM0YzFhYzUzZDg4YWUwN2UxMzMxOTg0CgpUZXN0ZWQgd2l0aCBwdGVzdAoKU2ln
bmVkLW9mZi1ieTogSmFrdWIgU3pjenVkbG8gPGpha3ViLnN6Y3p1ZGxvQG5va2lhLmNvbT4KLS0t
CiBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jICAgfCAgMSArCiAu
Li4vdXRpbC1saW51eC91dGlsLWxpbnV4L0NWRS0yMDI2LTMxODQucGF0Y2ggfCA2MyArKysrKysr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvQ1ZFLTIw
MjYtMzE4NC5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgu
aW5jCmluZGV4IGFlYzg3MjFjYTMuLmZkYzYyYWNjNzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4LmluYwpAQCAtMjAsNiArMjAsNyBAQCBTUkNfVVJJID0gIiR7
S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvdXRpbC1saW51eC92JHtNQUpPUl9WRVJTSU9O
fS91dGlsLWxpbgogICAgICAgICAgICBmaWxlOi8vMDAwMS1sc2ZkLW1rZmRzLWZvcmVpZ24tc29j
a2V0cy1za2lwLXdoZW4tbGFja2luZy1zb2NrX2RpLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtdHMta2lsbC1kZWNvZGUtdXNlLVJUTUlOLWZyb20ta2lsbC1MLWluc3RlYWQtb2YtaGFy
ZC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXRlc3RzLXNjcmlwdC1EaXNhYmxlLXNp
emUtb3B0aW9uLXRlc3QucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjYtMzE4NC5w
YXRjaCBcCiAgICAgICAgICAgICIKIAogU1JDX1VSSVtzaGEyNTZzdW1dID0gImY1ODZlMzVkMzIw
ZmY1MzdhYWIzZmZlY2EzN2U5ZWNkNDgyY2NiZTAxMzU5MGRiNDQyOWE0MTRkOGFhNmE3MjgiCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvQ1ZFLTIw
MjYtMzE4NC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9D
VkUtMjAyNi0zMTg0LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LjVkYjdmYjk3ZmMKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXgvQ1ZFLTIwMjYtMzE4NC5wYXRjaApAQCAtMCwwICsxLDYzIEBACitGcm9t
IDhiMjlhZWIwODFlMjk3ZTQ4YzRjMWFjNTNkODhhZTA3ZTEzMzE5ODQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tOiBLYXJlbCBaYWsgPGt6YWtAcmVkaGF0LmNvbT4KK0RhdGU6IFRodSwg
MTkgRmViIDIwMjYgMTI6MjA6MjggKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gbG9naW46IHVzZSBv
cmlnaW5hbCBGUUROIGZvciBQQU1fUkhPU1QKKworV2hlbiBsb2dpbiAtaCA8cmVtb3RlaG9zdD4g
aXMgaW52b2tlZCwgaW5pdF9yZW1vdGVfaW5mbygpIHN0cmlwcyB0aGUKK2xvY2FsIGRvbWFpbiBz
dWZmaXggZnJvbSB0aGUgaG9zdG5hbWUgKEZRRE4gdG8gc2hvcnQgbmFtZSkgYmVmb3JlCitzdG9y
aW5nIGl0IGluIGN4dC0+aG9zdG5hbWUuIFRoaXMgdHJ1bmNhdGVkIHZhbHVlIGlzIHRoZW4gdXNl
ZCBmb3IKK1BBTV9SSE9TVCwgd2hpY2ggY2FuIGJ5cGFzcyBwYW1fYWNjZXNzIGhvc3QgZGVueSBy
dWxlcyB0aGF0IG1hdGNoIG9uCit0aGUgRlFETi4KKworUHJlc2VydmUgdGhlIG9yaWdpbmFsIC1o
IGhvc3RuYW1lIGluIGEgbmV3IGNtZF9ob3N0bmFtZSBmaWVsZCBhbmQgdXNlCitpdCBmb3IgUEFN
X1JIT1NULCB3aGlsZSBrZWVwaW5nIHRoZSB0cnVuY2F0ZWQgaG9zdG5hbWUgZm9yIHV0bXAvd3Rt
cAorYW5kIGxvZ2dpbmcgdW5jaGFuZ2VkLgorCitOb3RlLCB0aGUgcmVhbC13b3JsZCBpbXBhY3Qg
aXMgbG93IC0tIGxvZ2luIC1oIGlzIG9ubHkgdXNlZCBieSBsZWdhY3kKK3RlbG5ldC9ybG9naW4g
ZGFlbW9ucywgYW5kIGV4cGxvaXRhdGlvbiByZXF1aXJlcyBGUUROLXNwZWNpZmljCitwYW1fYWNj
ZXNzIHJ1bGVzIG9uIGEgc3lzdGVtIHN0aWxsIHVzaW5nIHRoZXNlIG9ic29sZXRlIHNlcnZpY2Vz
LgorCitSZXBvcnRlZC1ieTogQXNpbSBWaWxhZGkgT2dsdSBNYW5pemFkYSA8bWFuaXphZGFAcG0u
bWU+CitTaWduZWQtb2ZmLWJ5OiBLYXJlbCBaYWsgPGt6YWtAcmVkaGF0LmNvbT4KKworQ1ZFOiBD
VkUtMjAyNi0zMTg0CitVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5j
b20vdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbW1pdC84YjI5YWViMDgxZTI5N2U0OGM0YzFhYzUz
ZDg4YWUwN2UxMzMxOTg0XQorCitTaWduZWQtb2ZmLWJ5OiBKYWt1YiBTemN6dWRsbyA8amFrdWIu
c3pjenVkbG9Abm9raWEuY29tPgorLS0tCisgbG9naW4tdXRpbHMvbG9naW4uYyB8IDUgKysrKy0K
KyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYg
LS1naXQgYS9sb2dpbi11dGlscy9sb2dpbi5jIGIvbG9naW4tdXRpbHMvbG9naW4uYworaW5kZXgg
MzIxZjlkNi4uMGM1YzgwNSAxMDA2NDQKKy0tLSBhL2xvZ2luLXV0aWxzL2xvZ2luLmMKKysrKyBi
L2xvZ2luLXV0aWxzL2xvZ2luLmMKK0BAIC0xMjgsNiArMTI4LDcgQEAgc3RydWN0IGxvZ2luX2Nv
bnRleHQgeworIAljaGFyCQkqdGhpc2hvc3Q7CQkvKiB0aGlzIG1hY2hpbmUgKi8KKyAJY2hhcgkJ
KnRoaXNkb21haW47CQkvKiB0aGlzIG1hY2hpbmUncyBkb21haW4gKi8KKyAJY2hhcgkJKmhvc3Ru
YW1lOwkJLyogcmVtb3RlIG1hY2hpbmUgKi8KKysJY2hhcgkJKmNtZF9ob3N0bmFtZTsJCS8qIHJl
bW90ZSBtYWNoaW5lIGFzIHNwZWNpZmllZCBvbiBjb21tYW5kIGxpbmUgKi8KKyAJY2hhcgkJaG9z
dGFkZHJlc3NbMTZdOwkvKiByZW1vdGUgYWRkcmVzcyAqLworIAorIAlwaWRfdAkJcGlkOworQEAg
LTkwNiw3ICs5MDcsNyBAQCBzdGF0aWMgcGFtX2hhbmRsZV90ICppbml0X2xvZ2lucGFtKHN0cnVj
dCBsb2dpbl9jb250ZXh0ICpjeHQpCisgCisgCS8qIGhvc3RuYW1lICYgdHR5IGFyZSBlaXRoZXIg
c2V0IHRvIE5VTEwgb3IgdGhlaXIgY29ycmVjdCB2YWx1ZXMsCisgCSAqIGRlcGVuZGluZyBvbiBo
b3cgbXVjaCB3ZSBrbm93LiAqLworLQlyYyA9IHBhbV9zZXRfaXRlbShwYW1oLCBQQU1fUkhPU1Qs
IGN4dC0+aG9zdG5hbWUpOworKwlyYyA9IHBhbV9zZXRfaXRlbShwYW1oLCBQQU1fUkhPU1QsIGN4
dC0+Y21kX2hvc3RuYW1lKTsKKyAJaWYgKGlzX3BhbV9mYWlsdXJlKHJjKSkKKyAJCWxvZ2lucGFt
X2VycihwYW1oLCByYyk7CisgCitAQCAtMTI0OSw2ICsxMjUwLDggQEAgc3RhdGljIHZvaWQgaW5p
dF9yZW1vdGVfaW5mbyhzdHJ1Y3QgbG9naW5fY29udGV4dCAqY3h0LCBjaGFyICpyZW1vdGVob3N0
KQorIAorIAlnZXRfdGhpc2hvc3QoY3h0LCAmZG9tYWluKTsKKyAKKysJY3h0LT5jbWRfaG9zdG5h
bWUgPSB4c3RyZHVwKHJlbW90ZWhvc3QpOworKworIAlpZiAoZG9tYWluICYmIChwID0gc3RyY2hy
KHJlbW90ZWhvc3QsICcuJykpICYmCisgCSAgICBzdHJjYXNlY21wKHAgKyAxLCBkb21haW4pID09
IDApCisgCQkqcCA9ICdcMCc7CistLSAKKzIuMzQuMQorCi0tIAoyLjM0LjEKCg==

