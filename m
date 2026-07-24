Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F6FC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:05:48 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.132])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15506.1784883938237283431
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=E3XkwpS6;
 spf=pass (domain: navimatix.de, ip: 40.107.159.132, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxlOxy+FN84K8chP4naKeP0QCcmW5xeck8jxSFQDamzzQr/t5n2b7AiV2zwNK92lZI0HuTGQLIemaLTfVocuB59PFVursQZ/Ot6l0S6JeVbPR9j0u3kPRqtuRvMb8IFPbropETarprW7e2PF7TbadxrsmwGzxsEvjjYw9189PsrMc+ooCvsYK4/RRNEX3ikJynbGiKqZcDlMASyoTTSK+Jk4tpNJdqK03H7DtGJ74nV5E3o72h0tDt0+xu+xzFgwqP1bw66DmxfDi8vQU3F0ELPbcPFydnxBScC5pShy58M4C48MHHbWOpAnXpOG5bSKjn8ubg8tUb1pPWCfXpoImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5uduAXG3g0ytGWmf5K8jEFMmEly9L3+d+zzM/kOrTc=;
 b=CMEoDUMr9Xpc0w6m5rW3/kuYiTYYqjEgFCbnD7fVyCcjcvOxsj61xxyUME059KPsyQNTaJ06O9jZ02THCDr4Drxdn+Z3ggKAzX3kAFQNaJeJXbQ8+oRn36fynJ648mXtVpZdUegn1DFRe8XUCvmNIGmgJUTFConiK6bKgc3LNOghKxXT5i7szoxV3kP1J4RJWBnB79eNgEP91SnmIRUikkbYlEPg+X0XxXieq/I1vvb/F+URwJ5FCKDiDiCstMVhNl6PPB88Ej87fcFqHwkemwrLJG3tRyCGSx/PlZZrXlziHvdk8QoLLb0Ss9p4R3Wa7sseXqlE+oGAWFx6TLBViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5uduAXG3g0ytGWmf5K8jEFMmEly9L3+d+zzM/kOrTc=;
 b=E3XkwpS6CT/gF9nZPQtALO6J11YrknrtBtqPzIx6RqYVOOgYpBYNsgUEIT1obJHju+hMaRDZqfiua0u+TFZ5/B45g9G+v2GnA8/jKzOC2ZkEevDZqc4M8d2tP34qT4BUGjaaTAJCMFk1FUXzhpJLiCj/NyrTUMJ/4SRoqKuVwTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AM0PR01MB6290.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:160::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 09:05:33 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0245.009; Fri, 24 Jul 2026 09:05:33 +0000
Date: Fri, 24 Jul 2026 11:05:31 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, mathieu.dubois-briand@bootlin.com, 
	rs@ti.com
Subject: Re: [OE-core] [PATCH v2] bitbake.conf: Extend distro feature
 usrmerge to merge bin+sbin
Message-ID: <amMqIdRgjjuYsnAI@navimatix.de>
References: <18C52E3640016A00.1442561@lists.openembedded.org>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="oy42yqqo2hfj77lv"
Content-Disposition: inline
In-Reply-To: <18C52E3640016A00.1442561@lists.openembedded.org>
X-ClientProxiedBy: BE1P281CA0280.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::20) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AM0PR01MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: e653ffc4-76d9-48ab-b693-08dee962b792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	6b6cSCWFFPHFdQ51U9rKu8zgdp+JRdndHih51RAqq9xd9nKXp/nGO180oWZ/emg2Uo/UGwAno4oySwmKKOB0LnuQHWjpt6wIk8WOVwZDv1jpP5Afw1myN+CnUbf5vfLThm2WmmuiVz+fEc8P2HHza3CGID5g4tQ6d2mlutTAquBUYbp0rHT9WztZWBfkHhr5KVE4tSUlv+I3JBh6hkHr2M+XjT+KynGN0VvWGdmqdce/h/TPiAWTXz/w451lWtDLlANPfiinDtzjZPvYCyEmm9RTblazMSnsXctuimB0d2opBB/+K3Fo6Yt3JJUX1znKLaJo7FQ/V1Qah/smL6lwGl0+8pCaP+iJXP+BxI3M0K5Z53PkTPDCaa8/kf+XqFpSchihoNe4pm80+4RESXwpPXLl34cDQuTPNJIO6wZw2uH7Nb+ZKh5JBYRAkvEYV/eg9uzT4LYUYeZ7WMiPt0QuPVw5DbLQzZUeO8Lck6CsGjZQk6qFiiJ22lZXAC7yLNTERko2gFzHSYwiLt760+0frFIa0fbAihJJvb4RK9DyXGzxjsBOOeYajzGobxdXi0HMOm7sSM9m1T2TtoQCAHjQP7yec6uiFZ8TpE1MYOKRaQM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?wjJwAbcn2w+7+Y67uRdiaIk2/lHdHj28KiCW/riguzbfuDvLxu3ES522Xr?=
 =?iso-8859-1?Q?6lrxUjJZRlfTcHXnlz+fi+nHuXrp/HaTIdALYlNXSW1dagIryORhNKSpMa?=
 =?iso-8859-1?Q?qlnDbJ1HkwmcggPXtzm/hnD+Ua/uejzDqvpXwMKWSQQUiLBGCYAodf/DSv?=
 =?iso-8859-1?Q?Ub0uii79pafDxjmvOpnls/g000gHwSWekGzCsWQcqr7J3OkVG5gH8nf9Ax?=
 =?iso-8859-1?Q?9r/Yy6GRej5Q8TFhSvJ2tTgVs9jnfB0nXm88zFuVX+hL46yAOJTxecWtA+?=
 =?iso-8859-1?Q?hSHmKZrm25A7Oyobt5y5rdBx1/S8Q0eTn/bq331zQksUMTOOWLM89tProM?=
 =?iso-8859-1?Q?bKf/Qvb4jHwuJGA9MYeIEMVY7EQnddaQAU7Cua4Swr8tN+hI88fyzpd9IL?=
 =?iso-8859-1?Q?AYhvjOSAhXxoXPAMiU0yh0BiM2NPwNYtofnsMPKi3r+RyCiwlrLlRbp7yd?=
 =?iso-8859-1?Q?j2q0L3eKGSIQAKcfjG0wJI7/8+lIshtuoz9iT0qVT2AH2bC+ps9Xm27TgD?=
 =?iso-8859-1?Q?ooiBLgIsuzIEq6erQ3mRLWQuAHhnfjEToIq0zrIN6CgcdXsYytXoKgoid6?=
 =?iso-8859-1?Q?x6xsSNCL2VQTS0ivcL+rJwm69P84Fse+xKfvMIn1W+uFSsn8zZ/fVTgL6b?=
 =?iso-8859-1?Q?lzZ+/XggpfsvgahpeHclo2jPU77m1NOsD4tRH1zBgtO9MIJs5n5TXWGB+D?=
 =?iso-8859-1?Q?q4swSOm2M3D5wDf+bmSsRRY2E9/muX5/n8cyOVEEtVU3FaUh0JjDdPLnRi?=
 =?iso-8859-1?Q?IUN/RkKTpvErJ/KYvAEOw1x3IZAmd0l3d6TSpH/FaWOq2cuMOH6BS8us6H?=
 =?iso-8859-1?Q?MKIQxm+4b5teQhivOcroXrCzF8Vk1++Jw0gN7ndrVFapHhuCl9QgPtcVgz?=
 =?iso-8859-1?Q?urOSk8GiIrd0vXJamRLD4L4+Tl01GHGKefCxqPAr0GGAHNaqBykxlGhTG0?=
 =?iso-8859-1?Q?WLcCYzaRtwLwgyOUslqXEbZlZTX1DQzOct4a6FphxLbuJJjBuo0hcIZkC6?=
 =?iso-8859-1?Q?nkcJj9GqaR2VnZVc7gVi/nz8qiGvAa6IyDgvH/wAv+Xl1NG1YnTARJJvgj?=
 =?iso-8859-1?Q?vH63k95ebHc8bO3QUpcZs8FP5uivzLP1FRAGSfPut47I956/DWOqz8eJoL?=
 =?iso-8859-1?Q?y/Q3RAhFktXkKqDkSch2Xyi12Qd07wu5jViqpEcXbf5plF50WUPR5R9aTH?=
 =?iso-8859-1?Q?Es6VeE1p/KQzdpw0huEvUpp2Ow1EyJw0csGsqRz9LGtX6XHcdiq3jx/lzQ?=
 =?iso-8859-1?Q?II3iRKZmXRBK4MUdgMqq1a6zUHu5mV1Lu8lmJQdgNLtKJZwGqiRmKC+nt0?=
 =?iso-8859-1?Q?NVXoqJcx1OEqErOWPx+0jonnFf9ilgTA31Ro74OUx2hhsMSW/UD4gnRb/w?=
 =?iso-8859-1?Q?ZoSN8+MA6NJuuPvG8nkBbS2dXyV2WBojfFoIlFlk8ljELmlW6PKgsxDrss?=
 =?iso-8859-1?Q?BGhFnKwb69smRF5YobDEK000WTP7H1jEzvQRGsbhWxfwrjJnay3UlBAaUm?=
 =?iso-8859-1?Q?tdb98hBOFI4Nfl9GQr66+81GUJma95A9WBA7oTFrpR8Tymq3cLcQT1K+Uf?=
 =?iso-8859-1?Q?7vIT74FHIiTjFLqW+L9z3Y1cd0BECcCEThZWA3dCZzLDOzNzSo75gUdh8d?=
 =?iso-8859-1?Q?XAmTMeEDuZj0iigkNuV5sAcySnPqCyqdwf5llQoH21WNQYsniSaggwoF2Z?=
 =?iso-8859-1?Q?D/cj223LQLCYichrhnwqZi38VSXrZDXrDy9nM5qwbKZc/xB1Ti0NrmV1/S?=
 =?iso-8859-1?Q?xA7kdZgyOwjKt3lhzFs+Z8nbg2rjzNxl8RvFT7DX1fnrnKckHFQcghvHS6?=
 =?iso-8859-1?Q?M8EFY0tXN+LVBWAlvUeZ2yW+lRcZR4Y=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e653ffc4-76d9-48ab-b693-08dee962b792
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 09:05:33.0276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Q28AnwQSGtmx27oXAMjneQf9xN2vyd0KQmCqYWPYwH3sqt+txpe7mLyAqdUpnIIpaZBeKeuNR/tGqqwcpRLSJUDIiwGmmM4LtYdljCX93M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR01MB6290
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241921

--oy42yqqo2hfj77lv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH v2] bitbake.conf: Extend distro feature
 usrmerge to merge bin+sbin
MIME-Version: 1.0

J=F6rg Sommer via lists.openembedded.org schrieb am Fr 24. Jul, 11:00 (+020=
0):
> From: Randolph Sapp <rs@ti.com>
>=20
> The split of bin and sbin became more artificial over time, and it is no
> longer clear why programmes goes into the one or the other directory; e.g.
> forever normal users have used sendmail in /usr/sbin, and fdisk and mkfs
> learned to operate on files to create images long ago.
>=20
> Because systemd drives this movement to have only /usr/bin and symlink /b=
in,
> /sbin and /usr/sbin to there, the usrmerge feature (started by systemd to=
o)
> should be extended to include the binmerge. For a system with split bin/s=
bin
> `systemctl status` reports the system as tainted for *unmerged-bin.*
>=20
> Override most sbin variables to point to their bin equivalent when
> usermerge is enabled, with the exception being base_sbindir_native and
> sbindir_native. There is no guarantee the host machine is using this
> filesystem scheme.
>=20
> This check was added to systemd back in 2024 [2].
>=20
> [1] https://gitlab.archlinux.org/archlinux/packaging/packages/filesystem/=
-/blob/main/PKGBUILD
> [2] https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4d=
1e4a6aa6d9f0d
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>
> Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> ---
>=20
> I took Randolph's version and reworked it a bit. But the idea stays the s=
ame.

This is a follow-up to <20260408195024.1874335-2-rs@ti.com>
https://lists.openembedded.org/g/openembedded-core/message/234858


--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--oy42yqqo2hfj77lv
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIaGAYJKoZIhvcNAQcCoIIaCTCCGgUCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghehMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
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
jnZymQyd/teRCBaho1+VMIIGkDCCBHigAwIBAgIRAJNhG7GFaX1Mm3w/sd+ASzYwDQYJKoZI
hvcNAQEMBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQH
EwtKZXJzZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQD
EyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTIxMDMyMjAwMDAw
MFoXDTM4MDExODIzNTk1OVowWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJHlG/qqbTcrdccuXxSl2yyXtixG
j2nZ7JYt8x1avtMdI+ZoCf9KEXMarmefdprS5+y42V8r+SZWUa92nan8F+8yCtAjPLosT0eD
7J0FaEJeBuDV6CtoSJey+vOkcTV9NJsXi39NDdvcTwVMlGK/NfovyKccZtlxX+XmWlXKq/S4
dxlFUEVOSqvbnmbBGbc3QshWpUAS+TPoOEU6xoSjAo4vJLDDQYUHSZzP3NHyJm/tMxwzZypF
N9mFZSIasbUQUglrA8YfcD2RxH2QPe1m+JD/JeDtkqKLMSmtnBJmeGOdV+z7C96O3IvLOql3
9Lrl7DiMi+YTZqdpWMOCGhrN8Z/YU5JOSX2pRefxQyFatz5AzWOJz9m/x1AL4bzniJatntQX
2l3P4JH9phDUuQOBm2ms+4SogTXrG+tobHxgPsPfybSudB1Ird1uEYbhKmo2Fq7IzrzbWPxA
k0DYjlOXwqwiOOWIMbMuoe/s4EIN6v+TVkoGpJtMAmhkj1ZQwYEF/cvbxdcV8mu1dsOj+TLO
yrVKqRt9Gdx/x2p+ley2uI39lUqcoytti/Fw5UcrAFzkuZ7U+NlYKdDL4ChibK6cYuLMvDaT
QfXv/kZilbBXSnQsR1Ipnd2ioU9CwpLOLVBSXowKoffYncX4/TaHTlf9aKFfmYMc8LXd6JLT
ZUBVypaFAgMBAAGjggEgMIIBHDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA4dibwJ3ysgNmyzAd
BgNVHQ4EFgQUp9eVd+tKwyfNk743TCaEIRR9XZgwDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMBEGA1UdIAQKMAgwBgYE
VR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRy
dXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwNQYIKwYBBQUHAQEEKTAnMCUGCCsG
AQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQBw
pquT4ow8LyRHG6NgR4oUsFncHl+eWLMtEBwv90EpGCGGDDDjoO23j4Zw6tS+THzwgz4SyP0M
FQaMzHj40enm+z1Y29QIQCnJTeDOHWHKMRxeiFD8MBso+XgVM6z6MMDbbJ95btM/4eE3LyaB
uBbheiINaAVieIdxLq6+dVkm00kmvMdlARsTkEvr5a9nYhGAs8T5RBD1DozAv9r89WJcn+QY
X1M2l5vv0ws3Me1ziVSjC2cRhcae4seOFFjkRdJItzfk6H/Wm2FNv2XG8nE1nbgN8UCdhORO
lQGGQ9DN152RmSJ1A6KAJIldo3YrJNiO8J4JLAE5/Tl9CNUHtbdYTOZLCAZ95G1g2GELQ2DQ
1Xxo55iNojqUA4w1feORe86Dq2P08xzolHKepP1LGEw1gDGCkUYR0gVXLJExGd3dfEZDm0mm
U7vWb6vRyLso/GUawFD2MZS4kK8/igkPO2Pkjfd5HD7hknpPVhcuBaWxWj8Q7bjwVlxGwts6
sNZ+UJ5HC4c+11vVoV9cdbb93qpbWn/d+azhit6kRYdUmAUl8Bt5VRBMKCUnSaAAspxb9kFK
+cvm/MjErxN63YNEcMs2QKs3N862V8MQaoKqD+KsKnaLxF6pxRpOotenpfUTNE9GqxP9nI6i
9rSHf16VFwW4NnJ6yUgzHUMdIqtTge98VjCCBiowggQSoAMCAQICEHb3t/4teUvaYKSSf0s+
XMIwDQYJKoZIhvcNAQEMBQAwWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjAeFw0yMTAzMjIwMDAwMDBaFw0zNjAzMjEyMzU5NTlaMFgxCzAJBgNVBAYTAkdCMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxLzAtBgNVBAMTJlNlY3RpZ28gUHVibGljIEVtYWlsIFBy
b3RlY3Rpb24gQ0EgUjM2MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAk7qaEDRX
E35PMot8PAmiNaWYblItPHGyt1+H+DUs2GAYHofsdeURmjngaB0C3GcUcrVav1HsGjJuoh77
nRif3O0gxUJGnIzj4ppKxxTsMNau8qvL+FnEkK6VrnqqnKIL3myjhJRdghUlK8Lgetl/3Pdz
KQ7JO2xPZFklrLRm8EQSuUdyccvb+auvRdSnwrxsOvV+9n18ZdeahL/RBxM7R31DhVkMPO19
EiQMj4PBl99wuWzXWL7yLgYh2/TJvIpSOf7waFcHkVYvfAPivV/ulUVaN2ncpSvlE4/TjA8d
5NXKOY+C7RcyD3UZIi6XVg7T81gOfnvE/eEGsyHmgjzLFDYpgBwVOd7jLQ9jhLX4hdRbm959
FrXQQrozzfTbyxRIwMwDqgUoPxIQVU9A7qXKu3yRXsn7OvnjYkYve6X0ZifTbjZaf4Hi/KXW
fNn67zqCt0eNONM2QB5bNqg14qLooRQcgRpSNAEB4UsSyhwsJqEhXz4QwPFWn/wwvEJ0FgYD
AgMBAAGjggFsMIIBaDAfBgNVHSMEGDAWgBSn15V360rDJ82TvjdMJoQhFH1dmDAdBgNVHQ4E
FgQUHwSkfkz2MrEJ4pF84WzfUr/PLv0wDgYDVR0PAQH/BAQDAgGGMBIGA1UdEwEB/wQIMAYB
Af8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGA1UdIAQKMAgwBgYEVR0g
ADBPBgNVHR8ESDBGMESgQqBAhj5odHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJs
aWNFbWFpbFByb3RlY3Rpb25Sb290UjQ2LmNybDB/BggrBgEFBQcBAQRzMHEwSgYIKwYBBQUH
MAKGPmh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY0VtYWlsUHJvdGVjdGlv
blJvb3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTANBgkq
hkiG9w0BAQwFAAOCAgEAWooWgE/1j6esLJfOKB48VUcFaafH6wZcbEln7ls6BP7IvAP2GDRF
33LtQhuVpt7qIqm/RXxWQLaC0yA14LE/pZZdm6CkkoWlTRgzZln6rM9dm2JvqyX2TLS0Z7P1
E6o9EmPx53bRNrnauUu2lYYfpODYq/5LzDPWBjGNK5QW4+oKCykPzzfSveoF5KTuW1xxy+da
EmtXm3hgYwYvTrB/7jHZU2hVbj/8DUAf/JCa/+AdQCtUE5XzKl6o5gGtWahY1yh9smQ3b48/
cto1QW+ZwGCHk5CLr5bDhe2uh2ifn8BXxBOf33D6YHjnrOUyNxi43QD2wZRwyL8arpu/Ljl4
H9zwIM0Q4vfbZuDghYLDnRVC1fGYBArWxw+uvoEMvO7lcc9MTezGkonPmanHYAcGffaIXpIQ
rQWtWS9Pb22jEy6YZCUiqH4YcqkelJHqJD1HBLVMOPaCn2wXgBbv9jvZQsP9yFrD6tKX//ue
D1V12I+L8qjUj17/ZRuxLcPDCF6vb/Svnu38Ejni16jHUO9G/YWFBZOuRbutUEgEp8hMXEzJ
XO43NzBthf80VV86GaC83nNy3TETFF2yav+ioLIK7Qd5NRnI4DXNQYPq6j8qkEnODayXA1bR
7V/qy4BrdrLHJf9NHMiANvCNiDn02MuniTPmb+rp4syaXK409MSG4PYwggVWMIIDvqADAgEC
AhEAsFHj29zvfVPWA2FcnDeJlzANBgkqhkiG9w0BAQsFADBYMQswCQYDVQQGEwJHQjEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMS8wLQYDVQQDEyZTZWN0aWdvIFB1YmxpYyBFbWFpbCBQ
cm90ZWN0aW9uIENBIFIzNjAeFw0yNjA3MDIwMDAwMDBaFw0yODA3MDEyMzU5NTlaMCoxKDAm
BgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUpuQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wb
v4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AHQAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH
+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63whIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9
xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4NEMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK
6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPhvLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQd
xilvAgMBAAGjggHHMIIBwzAfBgNVHSMEGDAWgBQfBKR+TPYysQnikXzhbN9Sv88u/TAdBgNV
HQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQC
MAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGy
MQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYH
Z4EMAQUBAjBNBgNVHR8ERjBEMEKgQKA+hjxodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
Z29QdWJsaWNFbWFpbFByb3RlY3Rpb25DQVIzNi5jcmwwfQYIKwYBBQUHAQEEcTBvMEgGCCsG
AQUFBzAChjxodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNFbWFpbFByb3Rl
Y3Rpb25DQVIzNi5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggGB
AD6hnou447615g2A0y87bR6mtVI+C+wAFCqRqfrCgHu0dB29VPiVXIVYbPN7H6meSMNr2lFo
e81aZfbE7LMQj98hVKA/ljqWKJe6R5W1Tssv1568G9GJ0fvL1iGT74LuqcuYPt0LVH99Q1rH
MfCBKpsyFo7P3JwoqEkuIpbAhaQMYdTcOgeHMYOLrIdx/9wQ1BXjTa/Cajvc3QxJEb308wgJ
PBxhl8FWWm5MNOynBmRZPKeOeMF5113u6b03KTmXhBqSVeN2nZXEZ+B+wNcJv1dr4Sa0/k6p
tbjZcr9ZkK7QtCarYgLDbsSbcLRJMuXUSHf1yaLwihZWJ1asynbFEmv1SrRSQ+3Hv4megEeY
kYmW9Jiu9qh5z6S98F7JhsP4n6tGs24Xz7l2I/T+BmJMRglTeQnzBihH0kFPUanlApSKC99A
clKs/tfOX8HKHs79Bw3PjRjJDog4D4Pbkom8UwQ/m5sCuOf7v632pjK2jm3OErS3XZxIjnFV
4Gl+5jZ1zzGCAjswggI3AgEBMG0wWDELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28g
TGltaXRlZDEvMC0GA1UEAxMmU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBDQSBS
MzYCEQCwUePb3O99U9YDYVycN4mXMA0GCWCGSAFlAwQCAQUAoIGgMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDcyNDA5MDUzMFowLwYJKoZIhvcNAQkE
MSIEIF/uDWLzeuMtZ6aRxs3EMP/4t2VE2zwBKaiGY0uRC+GpMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQAE0cICaSbGP06zYUX7Ju8bWy5SnmRP9W2IUXtk5w4SORyqRdmSFQBD8pdEdywn2Eiz3AbU
Gi8jITEHRFAaQpP5UopuwiUGhsvfjPU8lsvQAeF8KQo9y4+9jpsXHyke3jcy5dNmidb0rSqU
sj9ewoe9irkbmwcH1hiZSA2SPykYgFMTgrh6XOT9pG/gYlk9AeySMuaH2z82WSP+hJSUxwmv
llrC2F5mz1+rruT/pIimeLUE7o8GZQMYUEK56sO1ek3lm7vDPMBPXHY52l0Iq2gSoim12Ymf
dhhsZrSSL6Qw7xXMnPeof14AVL8sZ+KYtuMwC3npA//dVBx6o4rGcCh8

--oy42yqqo2hfj77lv--

