Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D37CDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 18:11:35 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18321.1782411084740534304
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 11:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=z7AHgDmj;
 spf=pass (domain: navimatix.de, ip: 52.101.84.130, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDCES2cgZEHb+DhXkwpSrIJoMLv5j7tlt+qmvbvrLJQOxPF5vFuTvR+1Bjkk7r1LGQfYnMHENRLoap6Ut2BnKBkk9/yd+30s70+AhSkYYJOE38FSCf+Mckj+q1dFtc2bMnx/ZfFH/ZvFXV1ai03boZ9FUECXWKDCC6YfSkVR9QlG3G4z1qrInlCJcCkQWIE3qKCb0WIitMR+3OIrgzlRRF1egnqk5drFWG7Q6c05CkdYSDQVVyBS17XMwoNSPC1T/QGimiZVpfHGlu5XbT1ogG94vTj4gSn69l24iIHa5C8NaSfRiaaobVpD6Aol9aAqYJZdr40bOMhcgDqfqr+Sng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5+SF6n+W9PlEq2EDsQmlaZ+bEaU4N3nmnXZyUMwVqo=;
 b=Uoz8lanEbXKIhUn4Xeki8jUVEvy9TIkFRkB1Cm6fYCBrUiHo08lgT4shf/0STmZuk/dZwglfk7+vlUPc/3gb5KgQCvrnLwSbt4/W9ISJxs/tEQJ7F5+LYCkvCzCltPjmWi+QKastcWeFn9E5YeOZHEhDHJj9/mhjM4oPRaYmybshuaJnoJjMbT7H188FNqdwub/HZaGXRnOKKhF9PMrYdc87c7ieUDnqEAO5W5QqVIcalmSfq9nITKeFjQh31qXM7b7LV6A2gcK19d0izZZ0JpbgWYjLRSEXdMcTBYltruFhz8hCkWJitWPXiJ3vHo/6TXBPA5brxwbvo8uE8bGiMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5+SF6n+W9PlEq2EDsQmlaZ+bEaU4N3nmnXZyUMwVqo=;
 b=z7AHgDmjoG6/l5/rdq4cowwWO/6TICgWjo7lw0BQjrqVd4Lr/MlEBktvpx3+xvOu0EFNM7tHW6iOWDkVwojrc8LS5WzRcpIS7zNZBV6VuDkUW62k4Gbb8T1+VwkHM8jsigSQ52c7lNMgw5R65g919vYhqQTILvBS4BqtyToby7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from AMDPR01MB11848.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:716::14) by AS4PR01MB8895.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4e2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 18:11:19 +0000
Received: from AMDPR01MB11848.eurprd01.prod.exchangelabs.com
 ([fe80::bd09:997f:d01a:43f0]) by
 AMDPR01MB11848.eurprd01.prod.exchangelabs.com ([fe80::bd09:997f:d01a:43f0%2])
 with mapi id 15.21.0159.015; Thu, 25 Jun 2026 18:11:19 +0000
Date: Thu, 25 Jun 2026 20:11:17 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, anders.heimer@est.tech, 
	qi.chen@windriver.com, alex.kanavin@gmail.com, richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCH 2/3] systemd: upgrade to 261
Message-ID: <aj1uKWoXHQM3vpFf@navimatix.de>
References: <20260625134210.4046622-1-daniel.turull@ericsson.com>
 <20260625134210.4046622-3-daniel.turull@ericsson.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="h5dvp5wyqtw567ja"
Content-Disposition: inline
In-Reply-To: <20260625134210.4046622-3-daniel.turull@ericsson.com>
X-ClientProxiedBy: BE1P281CA0356.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::10) To AMDPR01MB11848.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:716::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMDPR01MB11848:EE_|AS4PR01MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: b96032e2-589a-4eb1-87a4-08ded2e527be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6TVKNI/gz0umhTYsU8ndB/tutWJN8sb6LMJQRPuKoAIdVdt+CotEMOiDLalsy99TIxEeidG/nxjQgbYmCK78c2pJtkFXk3kuu31K5nRk24bx3hfiMb2hPeqD4ehz5qzRefF5AEoYY/1dYpjb1L6/MgooTbaESuFzeiSnbWVR67mo0Df2RS9uC16TT3GVCsuYbI3qtv788LtTIpNCd/dvIUyCkwyGKAj4xw5hmI7Ql27Wn8TG4RYTyRug0ZLSha9ZrhWa9oXMEpvB4T1a6L4WDPNSUk3Zv5GTwu0w2K9B5zTP5rkoPR725fxwsxiRK8f7gNctu3dNVHGkeq+EHLtdYrF2//Onn2mO6en524mB7hsz6kKaeSdBBL2HfA5g29Zw6GMe1P0LNb6oEpMJR5wMXogVIr3DfIgp5C2OiVvfCcZBE+b2kooa5ehZnqTfzdfPKtrlB8ZyMQ1NABx94Gi5TN0EKlQ7VbNAfO1QUtjp4k21h+nzkTe5AOsM1XZRIQY6hS9xOHYnu/3E6vVeHmBniHM4VVi9WphvmMWcErmPQGuP85vw+z9/XC4leFnOsL4fxc5ALABsZF3xNa7NvjKougVR2mKSAM3CyXZbRMB679s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMDPR01MB11848.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?vIAND+r4eVrUIsoXor8+Au9jVZiEVjo9HmJEpeZfD+fi68nkaHqs5P8/um?=
 =?iso-8859-1?Q?zsjWehNuo0KE1HEj3a5TwIroNM4yNU10cqgdDlMIXMrGQxfD83nGX5QHHi?=
 =?iso-8859-1?Q?qslx08Zod69pfCnDFi61Tla3wSzEt5+cVy6EECZn/A5ZsD+QWqst+HdrbQ?=
 =?iso-8859-1?Q?nYuix6C/Dkzk8MLeyDF0J1HB5ybXqXYEalUfrfk5CHA76OZDmpFRM7PSDR?=
 =?iso-8859-1?Q?G92sHQjJ1BJioSzqZkgrxKFmkM2hFW/QZ48bZj8uID6QC/9orqK0S5ssGU?=
 =?iso-8859-1?Q?iEwJszib5kCX77Y62FyrhUOOuMi3R+VCiUypKnTGR5wTz+HWim8WayIGlB?=
 =?iso-8859-1?Q?9755HIKJcKOSLrIj297wc66yyZmu8WtRH7JLW32p0g7RxZdD0vnyDahfDR?=
 =?iso-8859-1?Q?5Q9wn/vrYAEX4D+83bdrsFWFyYKR5BOZIBKq8vT/0EobB6D9Tbg0PvgTsr?=
 =?iso-8859-1?Q?z8kBhRCtpOC+MCN0R9gQcSnur+CRqWNtoPGDbWaK4zf+VlIe0YxeJszzuc?=
 =?iso-8859-1?Q?HEtM8V0gZuCc4TbpdBOVPVZSSrxRc+TGMos+TU2CkZTGDStpGDMmP07sll?=
 =?iso-8859-1?Q?756q/8WjJ0EVsx/buXNjOPrrYQjlQH9EpllVdiDSlBZLJ+7+SPdgJOgNOZ?=
 =?iso-8859-1?Q?O7pig8+7EE2kL83XoaW4hGqB6yo8cqFmfhXrD4vkPvTz0ciurYDt5HBOGr?=
 =?iso-8859-1?Q?tPPnl84rzHF9R9A48DcOvH+grOLLkqkA1nLjgyj+84FUp5Cx3x0OhYtGsp?=
 =?iso-8859-1?Q?EAica834oIOCqRkcs8us13KnV5DeMcOY8w6faVmwoEBXDfGC25R0Tn02kS?=
 =?iso-8859-1?Q?Fba72Zrf+GKS2pMWN91UhZO1RKc30Halz8bVfG6e3xsd2ESzEFTAdGXbKe?=
 =?iso-8859-1?Q?C4ysgn2RB1Q6crU2fGBKh7/LjIf/x5tPMFzZXg0zAq52EBDSKYIwHKVQSU?=
 =?iso-8859-1?Q?jXvkkCwaMChaJi/TuUhBBLMaB+4bkJhvSIFRcrfCKNbadC0vNmcXHG1hBs?=
 =?iso-8859-1?Q?1CN0enhACR2hLjPqOVjfVslbG8BzCHzilDyJnG6f6S2B2TC4jCULmMhPSv?=
 =?iso-8859-1?Q?boVtcWjrRn9vQDrI1TGZ2RWACHlUmI2D9L5yoc/L2AtBq/kvzdeBSyb4/g?=
 =?iso-8859-1?Q?eGBV5eaYbJsZqpMAw6P2/d6sVyp+5CeBzBPdfCXrMPcXcFPFQTynhjscBg?=
 =?iso-8859-1?Q?FK+lfhBAQGv5U6C6WujS1BS6IUAq4BfUOZoxsgi10POSYlQQvMrWyEmbxn?=
 =?iso-8859-1?Q?1Oyl2s0GqAwIiHS/n9CNx9yEfIlaBdzChzNOwWXW0UvjrexUFBRpQna/df?=
 =?iso-8859-1?Q?jPRDJq7zQVBsDon4JU1LeeX8Zl6dN3MOgwPvB5GvpPPfsloVVDtUwiZnK0?=
 =?iso-8859-1?Q?7vH22q+zkZuaBJf/I7so6bPpx+GAAhBz4mSwoXJxVWWmKRoK2DOeO/Hdk2?=
 =?iso-8859-1?Q?k4Qgfq2hIObAJoWcsWPBaoO4iB7qAuJ1cQAz9lWdRFoC55+GSgSSYDK5/W?=
 =?iso-8859-1?Q?TNh5qgz+SniBexUlaEBGtxl5qURM/gqt9OXO9kdVv3IJT0b9SxHMUSkMDk?=
 =?iso-8859-1?Q?hPpLyQWcWaN2KEsoE4oBYjsWRClyFeXkFFVkXghYaPePoP9UXsffYCw4AS?=
 =?iso-8859-1?Q?Z5LQm8SHayAjbI1SbsJSdh+0pjKQI646QHF7pRLsRQjb0PZVBiPfZf0JTM?=
 =?iso-8859-1?Q?ruw43O/ydGyVajoJZltOnE/3k70iNnmGoi4U2jXadenQAFczYlQvDWWm3T?=
 =?iso-8859-1?Q?wGcB6+5JaQM4PwgbYr3CvyqZyXeoui/YQdBj2bTm1I/KCMaPH/HG1VDtj/?=
 =?iso-8859-1?Q?Qg+6o9x0DNp4zExCwjFYo6NWeGaWOtw=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b96032e2-589a-4eb1-87a4-08ded2e527be
X-MS-Exchange-CrossTenant-AuthSource: AMDPR01MB11848.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 18:11:19.0412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlsRfsHK7JXyNasq3Mjm1R8ePXFuElt5CmuCIvEmckw3FxdpBdYOMaerjxtfOrE2Gvpu76/9OCP+756lk9cUUMyTBegfPoFAnUJYZ90SBJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR01MB8895
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 18:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239587

--h5dvp5wyqtw567ja
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH 2/3] systemd: upgrade to 261
MIME-Version: 1.0

Daniel Turull via lists.openembedded.org schrieb am Do 25. Jun, 15:41 (+020=
0):
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> Changes: https://github.com/systemd/systemd/compare/v259.5...v261-stable
>=20
> - Drop backported patches no longer needed (libfido2_cflags,
>   tpm2-util PCR bank, fdset_new debug)
> - Drop redundant tag=3D from SRC_URI (SRCREV already pins the commit)

But isn't the idea of tag+commit to ensure the tag (the version) is on the
source branch, and you are not labelling a commit as version PV, while the
tag sits somewhere else?


Kind regards, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--h5dvp5wyqtw567ja
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
ATAcBgkqhkiG9w0BCQUxDxcNMjYwNjI1MTgxMTE2WjAvBgkqhkiG9w0BCQQxIgQgmi88hEik
LWvgbai10NUQUNaQoiGWICkwxXk1UtTbmHAwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAMdM1xjIKLEF
CjKBXcY8cguj2UDQPUVr7WSRT6N3ccqaCq72aT2kH4bFwCdiPOC84llPL/dPVdKdzyrT+2Ia
NMDyfLW/gWoLmRNIjvJ6LUaDcBBBz/em+fY8Mcbf5Z0tl64wZ/Ca8P5sZvy7j2FNQ4EZZVlM
MTaxhd2hFMaDCHsxhlqRhEcPoqBvdMz3Nb9vz1GwacinuCNZOVhH2Q4P9pODisoRyWonzoiy
hc9FRrUA/eO8NFmygAdp2A6DjDiolnC6+crH0tl3bSzhxodbUVS3ZutLyjL8UFbIf38dezAN
ad2NWwGD51rJ0KhawXmjJ3jW5VYRmoeusu4E2RONLjA=

--h5dvp5wyqtw567ja--

