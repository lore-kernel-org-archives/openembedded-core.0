Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285DFCD6E52
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 16:07:58 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.125])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10020.1780243673456144404
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 09:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=inGOLFMb;
 spf=pass (domain: navimatix.de, ip: 52.101.72.125, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEb5nF+aFeoiYV8d7jkBxMdMCbjstCLuomv7DAnBwaDgOhqdV63pm5gJuCcp72BXfuK74QJxico5LdlDMoOw2ddftOGWsLdyxv4+vhEL3iXIY/ibBzPBoSJhQEC7I/foZyVnVWtVgZ8y/wOxMIZykwtBGlXZWKC5bBHhDcL8FP/jFp4U/ZzuTq1HjyEGxRQWf0osgOKkdyyuG6oOhvAepAFln1F1WmCs5QjhKXoNVxdT5vuroFXO+xy9vAvJgqNgP76Vrr1EcNm68Hz7Nc9i9JX1hipy+LmIpo5WyafcBV7aXbcsntwnNu1Ok17h3gr+ndK2OfoAwMvAq7TTyaZ6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsRBlxW070Nf6ZBojmQY8jWjR3IyGO+tJxyWBHk1gus=;
 b=xx/KwsPvCINdXasM1sMjzxc5fxuqPlDgVdua+785B8y2GcaINQOVXd/eE4muHugFFKYiCaL6t4tYQe/c6UMRUFJ98LlKA1FLJTav83IxwPbiwG/qJtPSYo8d03w0lRYGl1zj+OaziG/xTBxOPZ68DrfwIyVxKog05Hd0OM7ZO3nNhFAT7DiUw192iDv2bjjFzFablu3TCb6E1CAMFn7FKh3s9UgSR/kVh1lAVngEV6ZeuMrLulwojtfx7iqXYOxR8dJOUEtxhxNsfyse7lx7dnE9Ywwp87iBv47PUVFeoR0rvI0uwQlggYRF8jNFZ5gJZDpefJayQw9RrmXTZihjIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsRBlxW070Nf6ZBojmQY8jWjR3IyGO+tJxyWBHk1gus=;
 b=inGOLFMbPlKTMcRhfQFlQN+5YWoS8yTGTQ9w6vAERfp7sEuxYT5GxZce44r8sK7aGA+3dTklPXS+herYNoO0ynCKG+ps3iRW+QLgk27qvtPTz4x6dqJu0TJ+dYFLS0NC/hwxWwEx5AVY7jdul2IKAgHqwb2h1+YlZikLpA3lcNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AM0PR01MB6243.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:167::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 16:07:50 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0071.014; Sun, 31 May 2026 16:07:50 +0000
Date: Sun, 31 May 2026 18:07:48 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] python3-idna: Upgrade 3.13 -> 3.17 #security
Message-ID: <ahxcUy_F4HEqaRad@navimatix.de>
References: <18B4B2091480F9D8.111707@lists.openembedded.org>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="ar7w6mhhcalbhdw5"
Content-Disposition: inline
In-Reply-To: <18B4B2091480F9D8.111707@lists.openembedded.org>
X-ClientProxiedBy: BE1P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::20) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AM0PR01MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 9008f857-64e1-4425-0dde-08debf2ec376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	xJdJQewbx85ymTauCr8lwmzuM6frwOjrfoBOaYQB/LP+Y0FUvEDN9CqFeYiMIdpRgXv3nRCm05vKf0HWtwwXbiocrxWVVXy67zi0RmdSrvetlyCrUQN5M9z7JntVAhKR4RElg0Yuo23ocugQ++2PJqMJFLFAOUJWXUCvfwBw5qygs+jQ+bhZdOylBy0VEYP7/2wh5CYHn8B3bKzdi4JU48MxNkJEZlaW+kCqxup/Fg/9UHGN5GCii87U4WcY/IykEQpRpJVuSLCwRv+PumQWBYKWSO/1Jo3E5Q09+BEqRV4R3mE7P6//+SRYfaTpXGWIEmzuRstYADgm75yUXCbb8rj07vgjI9kr/QN8d+bUuy5Lv3daypSc3vhlayc7T4YXrl1VJjP4KrvRq88Qoa7ezSNrnkUuufub8F7J1EHeWftkqqvbbY1BMFsXKWvlr38u/Bz4PYgExUEcRpzfd40vgYWosjlNceyvepq1lHXJVGcic1N6vreEboYCadAb4C6mEYojA8DsHqevjvv6efu7uLqkIBgc1iMWPaGzY/oLOcAsPRh4XWjqwqI0onLTzioaVslSkeEXwQ43xXg++NEI7QHb+g810MukhIQ/wvqOzoG5ewjRdhieeDU7GzOOdxnCJmjOxmjTgxrKsuca/ZO4mA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?QSHTBo6LVSrOZWPx+q3pPYuP+3X4NpV262cx9VjG8P24/aw1pP7RZ5QSvj?=
 =?iso-8859-1?Q?JD4NHXpF6dvwkPPSSyz0usgBn6KwR7HbfLRrnFKh5rfRzwo+RZpcECgqTU?=
 =?iso-8859-1?Q?cHpDAkBhklbf45gFdv2N8+Z0WLUmLK6ORRZEWbKhkVJzhC0C7crWULCLHs?=
 =?iso-8859-1?Q?72H7X+7R3sh4j6kcWK+gFjDzd3+szgCz6AhGdssSw07ZiGpprjzTnO5a9C?=
 =?iso-8859-1?Q?NrnHQs6KbINZC+V/z069366d5S8HOhj8QxB0aFOXpKR6r+Xz13/nP6ukLB?=
 =?iso-8859-1?Q?pXlUoM2yjkFocUpMeW6XxSl4BIGyLOgG9IOTjWdsTCfAsUR77ago2kLfEy?=
 =?iso-8859-1?Q?NWmtm2VAln4cptsXsr3Gyf6msoMpQKDnNTmsuUFKeY7a/AS9YYw9ljFZuJ?=
 =?iso-8859-1?Q?Wv6VTVacCCyPSrov/BSCP493Jy5nxYEZ1c9H3jPdqXXmcuWtyIr+LpiTl7?=
 =?iso-8859-1?Q?H+NZ6623sM4T1P2VeFF7fXlMn1iXgGgNm+1C7gSJvIB7VOpTU0oMNtXDz8?=
 =?iso-8859-1?Q?rb48m087EnKUGXlx+hQZ/DgZ6klV+KXwzsVzcPPcxFYxUkBVi6KS0y8X4D?=
 =?iso-8859-1?Q?zlSpqxwooVEO6m/jGJ/t91Lu3TpaV8hrmstZ2FAy2iBm5D0LT6ordS5MRg?=
 =?iso-8859-1?Q?2dPvd0NnykTIWUZcwi2eAkwKfVHMbtYIab3XmQTOEH44JqQfuhdoT1BYOv?=
 =?iso-8859-1?Q?F0a/5DTpyl0cNIQ1D5RLx0oxCKDi2gu5GeY9ewCf3c49L75imXdhXquIBR?=
 =?iso-8859-1?Q?7npO9N39QpqwZpEiPQbe9OaCrSUFPg2sG0giQjJ1Jl9u7LlWTjSmiLgR3r?=
 =?iso-8859-1?Q?p8iUMD4nQaQWNXrAj7Q3fqgjR8OWH68o/YCOdMaQsThSiGT1qGyD+xQbEE?=
 =?iso-8859-1?Q?6ktY20WxgFRhZrBBcGmIHRGqKHNIpkOwqfO4Nw5z9KsqbDlC7+ymL7htvf?=
 =?iso-8859-1?Q?0Fi2x6nam5ft/d0OCGkyMswEtw5gRTUWrT+99okOlRM5Uj7Ayfn9nZ+Epy?=
 =?iso-8859-1?Q?rQwpjEFgscUsW/Xy2PCAGoG3L0JTtiTVj4KCivpIpvwQNRc/CzXqEH9V53?=
 =?iso-8859-1?Q?AKQ1vTG48kMQhDP8eHq41b416wMB6DETg8eYAkCLVDnJAJgHKSkSt1HfEH?=
 =?iso-8859-1?Q?/XW/6n7v0ebwT2Ub0QtisiBRWtPI7o0dU2aFsaozKJ+HUCftA2dv6NiDH2?=
 =?iso-8859-1?Q?cASzc8x0TWl4FGjmR+TRiQUOCpuGLVrmDoGlq+eoRtuqQdbrVeJrpZUo9V?=
 =?iso-8859-1?Q?pxGtT/6xPJ5tosKeekGSUXCCMzu+WCl60AGtq/F0PiB0bMXjYJxOWjtjlN?=
 =?iso-8859-1?Q?213zmNhW5JZIBrTIMDQbF/jcbgLpzNkaqyxTjMnyiSbIFb6Pea9pTJjpFM?=
 =?iso-8859-1?Q?t2X3BCodgx/MMQ1hMx5h//55nOEd6/Nie4cyl2d6Bz+8aEuHhSFl2UVA+P?=
 =?iso-8859-1?Q?tmEaOAoJSFv8RN8llxM+VqkokZW8NExNZdEkr3mvZDcP138leGWlKKv7NW?=
 =?iso-8859-1?Q?t7CoQxs0VigGzxiOVvEb9pDzaUulz4Vy+vPsAj+jogmAtHNtJYFSVPcgu+?=
 =?iso-8859-1?Q?5MBe2QteqTvZte9jIwA5fUgBGlQIEmAPVY15WEsbDROcLGNNF8LtiNvszr?=
 =?iso-8859-1?Q?MyqTvGbZrmzn5lt60fTDwzmH4D/QkY9R4bovoEoGqtlnpdJLvAkngC5Ol4?=
 =?iso-8859-1?Q?pyeUxzRMl3biOAdFNC5TdG5GhK0JJpMvTZEepxzT9oPnPHRyUN2F0RZ+L6?=
 =?iso-8859-1?Q?z1A7hTinvw6cm0xew0lYjco28qavwnR2B9DGq+ffY8YjU9YTuY8+AzdBXW?=
 =?iso-8859-1?Q?4PTzI3k+5WiNSwfQRUU8A69/GL9CR7M=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9008f857-64e1-4425-0dde-08debf2ec376
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 16:07:50.2987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxthYNnAeGBP1kQSNfNTiPES8mKzgjqWHMYY7UJN7JzGpJz4n/PwAff8vd75lfaQKvmfOGMrAH06EbZhEnMQEClEyUNJjAWivpGMK0Ijv90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR01MB6243
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 16:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237798

--ar7w6mhhcalbhdw5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH v2] python3-idna: Upgrade 3.13 -> 3.17 #security
MIME-Version: 1.0

J=F6rg Sommer via lists.openembedded.org schrieb am So 31. Mai, 18:04 (+020=
0):
> * 3.14 (2026-05-10)
>=20
> - Removed opportunity to process long inputs into quadratic
>   time by rejecting oversize inputs up-front. Closes a bypass
>   of the CVE-2024-3651 mitigation. [CVE-2026-45409]

This might be of interest for security updates.


--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--ar7w6mhhcalbhdw5
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
ATAcBgkqhkiG9w0BCQUxDxcNMjYwNTMxMTYwNzQ3WjAvBgkqhkiG9w0BCQQxIgQgzXIC4ERY
BuFqiUgluqQISHRRtjF+74tacORktQxHZ2UwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAIrrwJAdescV
o07QQni9J4hBHRdsMFL5q9kjHJSM5JjEUuYrbxMJfJrg5GjxenwfcMPN550jfeWZXfjjOYqo
Wq0tax5JAGgLxKhuX12TQosljbxMGSruE2w+/OQsB9zntTqRQvNnZ+IWmIwnkqX3KrIYFwWt
sp18fiuGJ4scIjgtdHOSPcaayzNlxihkl/M2aa/C7VU/6xs1RpWHv7o4XcWtdugNF2H1DYxj
FFRWbaStBQ+16k4m0Vq1wwGWmjulXqci+2xDOmAsBbZNe6nEb0iYIdVGb0Yw/P5CAJ6YnfQF
fqLHl5QrlG4SJwG4YnmK82xy+hb38EdWXWJavC56hgc=

--ar7w6mhhcalbhdw5--

