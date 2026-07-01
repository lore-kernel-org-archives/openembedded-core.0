Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12A0C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:01:49 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.136])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38539.1782885705718862145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=oNhPCszC;
 spf=pass (domain: navimatix.de, ip: 40.107.162.136, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgpLTXIK1Q6bG4twp32ABemKb7lHaeJQK4DbhoqoLNIZnNg8BUc0p+KHFdjDGJz2M0JkGwQlyOTzt4jztJcRBsUeqRrVXtQdw0tGsKNb9pD5TnHkZ28vip2Y4gFUkEGASQXGtHsCTjVQc0uNmGpMUWRYKJWJicQQZ6OnXt0ImucaaVDG9yiBghWxSOKYFyi0yVf2IG4oMVb38GAcnrm9vd2Buh8weprgaYkNCo1oq+kAF51b4Gi8KB86du8vW2x7LoMO2R8AyYMSZeDpDsmKkcIx4R8fUvQbOzQabdn65DnOt7HzC4cJgCW6DQKIN+geNLLSsLYkGRi5U8ZNoKX3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qbkNOO/t04JU6tggvtzJfz6WoUI1dk24nvSY5NAVIY=;
 b=hFKZddMKN2LIuluwR8Fm0HPJwEdaKmJMCvP3VIryhiU8vUiV/x28FehJ+CU8UEyTj9fIjiWQ24Om+o8qGewvZ91fnz0rkjYv6KZ/Vfq/KkTL4m54+37SkNyEF1BXwGB0UqkitV+Rdd0M4zz1Kr594O1tBNOZOJY3Vm3lBkexLHpp2bj68zL09xvbgsHHmqdqZ0fPkaJjtt0UEPgtVoHsUb5UPdGm7z9hp2+tkVNurbhVtZbVXWDa7kgPOEq8ozDhLfO8UhaNHDdecVN7kWYsqI+DuiGg35Dyf3DCW2TjCYKdxtStKF3+4GofmgU0zNZWm6lqKvti7wcVCepUu9Yf3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qbkNOO/t04JU6tggvtzJfz6WoUI1dk24nvSY5NAVIY=;
 b=oNhPCszC9caLEc9fpFnwR25u4UhycEERESkSr1f+vYMP8SiM+lfWjqFamPdul3gSpkuBbfAO7TkM4VxlsHNbN+H9aydxQGV5wEEvXXNPqVe9n9A/EiT+q6XpHTQs9Q7J/b4F5Whfraq+vQeGwpCw8yIrQ4EqHw/ns7G9ss0Y+hQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DBBPR01MB10623.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:52b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 06:01:40 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0181.008; Wed, 1 Jul 2026 06:01:39 +0000
Date: Wed, 1 Jul 2026 08:01:37 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] classes/insane: increase shebang size limit
Message-ID: <akSsWsEkZv4c99OR@navimatix.de>
References: <20260630140800.4018491-1-ross.burton@arm.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="fv74f4dmycydx3oq"
Content-Disposition: inline
In-Reply-To: <20260630140800.4018491-1-ross.burton@arm.com>
X-ClientProxiedBy: BE1P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::6) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DBBPR01MB10623:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d87894-c51b-4da3-3523-08ded7363793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	TEoi57g8HoE8+JRZ4/v6teiAgygW/BsuN7JAc96GogRx3FBP6TeOMi/qqNUMK9iD22YoDp18DXMv2TOjAQw2uZjWzmsqWNinztkz+YXERY2GK81iC3BIV8PjCiO4I0bZ/PFJlHfQjkKv9htmq122J1Y7TJH9E31z4upuxHCRpasTHWJzWzdyzpfadwOR77yDv4xkgNtFohiGE3vODOZ8D35hfKAz7IfsryvjfEFn8ebwUdOhXzevaN1p6XxwCBhWPmk63SivdTOOQWi7s0g1WPFGddeTFN/LeougtvOYnZDJhZraC94HJZ7fs7FPSVW6gysYTqNLBROyzvEc0CIH4Zec2OCnXf+xD9sFvnTtz2sLQPS9jF9u4Y3udfeSSb3jlxyWFg2vWHd4994ClY7LtLtMbwa2MwPH8DlFBHjqL1/epJo69yj4dMKWLqIqdh9g4ZNb4kHsJ+Ocl0hrUm+Re6MjIHjxyBr0a/YRjfq5cgE+poH4/U9PAO/7/tIC/z3ccbQD53p5VrbtB5SFuiTRdwDRUj+F9FRlu0I5m8fXPV1f+3h25xSSq7Ww+BKOZ40BXzGnf1llPF5OJs8LdcRQtTRsgMmMpxLOi5mbR+ABlBY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?Mu3tP/jVMDwka3d5RARB+qXBsbG1R7IK6M65+LC5QB+VGrzzk2M77OBLiU?=
 =?iso-8859-1?Q?usZzwgFA4wihhoqmgGLL8df3AAXFk8lBQ6uI2BYp0BucesGDpfsa8Z8ASc?=
 =?iso-8859-1?Q?ElI4STYhZwupu90ZphUBw8XgHLCTtEFGH+PW1WIX187ZTrrTYz5h8xwZma?=
 =?iso-8859-1?Q?1XHnPLfGgPZFPShfYRwrEYfvF6a9ohyIR5F4VS+tcqWhFwJcXH+Eyuy00I?=
 =?iso-8859-1?Q?+1H5lJkOJQOqZQpQw5wkCsMAgCQIIqHBABuQYtOBugr0W3Hru4xcmG/RNM?=
 =?iso-8859-1?Q?vF55n7Oj8ynD5g3XYyVCcvYwEFDLd+LcWMYzTZvicFV+C6KcyiVhnigG+Q?=
 =?iso-8859-1?Q?RCa72UzzCwy80XoFvnOuYjRm0ad3Deti0fXF51YNoaxdCdyk62gpnmfsa5?=
 =?iso-8859-1?Q?ERhjEWrbWKfMU8kFgyKNw/MsJcPhsOfOhRIJ7rWPp26Dc8dD+5ibDYXMVO?=
 =?iso-8859-1?Q?OiRnyFck84Y/G3G2OEFVIK2YedJLgNrO/ScWqOMlHOtTRidyrprMRAb9US?=
 =?iso-8859-1?Q?SiD77+r6Br/GvDcOY87unmWF7f8IooMx2XpWSeUY8WcRXb9Tz/1of3wc1o?=
 =?iso-8859-1?Q?07SA32ZPy60rV4vVUNndAnxkT+Ebumd5K2WffDGV05KIlH1vj47VQp6pDP?=
 =?iso-8859-1?Q?4diM7C748Yk6Sx9My7jpnoHAkLCAVkSvpyOHfctp0epqAguTtUIZcbQ+BI?=
 =?iso-8859-1?Q?WZ1B9WhyOQSa1adWzNUcfPGOiHvSul0bv7npQjB+e4we36cvMHGHkjruUP?=
 =?iso-8859-1?Q?WSrDjG5LxhUFyQOO/9bFCxzNiNBtaJPoLWHLR5IHLeaonu+qlsPo8kwSYL?=
 =?iso-8859-1?Q?jRI8sWGBEjsf4SkbqTeDNJ31N5GXkaCBj2lOKwlNGGogn4kSJlBWrzT1WK?=
 =?iso-8859-1?Q?592m6sDpFoPFTebJQ58UHWFSLTS2ipP+m3ectV0BgsyddRZxlh7bV/MpWk?=
 =?iso-8859-1?Q?dKwpzUpnQIcB5kcuj5owfmySeoqVoVbyuSNGekmhwkGhVV4xX0RQvqYGz/?=
 =?iso-8859-1?Q?L7lxp2SKJINaTTGEgXGlGQSH+KZ7U5xkwZ7LwgUxohsEO4yzqmwWOX9oEg?=
 =?iso-8859-1?Q?QUIZqAhobmUwK2yKsGmgg53uVD7yCBFJYdYu+E7wcx0zun2aa//9VpjTtD?=
 =?iso-8859-1?Q?Sl6HfKqzVRCjmuJBbtseWFmBS05BZikRB8syv7yo/p5ItouUFyL3BAJQFF?=
 =?iso-8859-1?Q?QP9g6KPOQD7BNMQfE2V8Rvx/3rtOMaVqpsT3WwltQWgQEFjQMh9VAhbgy2?=
 =?iso-8859-1?Q?FoZQRhZ+euBdZY2v+u2HA5eBGS9dfZxZsvSuMPbF6jwOtDMOgmzS1g3vo9?=
 =?iso-8859-1?Q?PiN7NMTK0mNV/i11KebdId/1O3zWttRz54AEgfm2kEApvdzLJ80ob8HPkA?=
 =?iso-8859-1?Q?pPwGPTMEZNKk+xluQc6fpTszD7lJx3zxdXJY+KLGq08ksazQ0jjDP2RtHl?=
 =?iso-8859-1?Q?A6PyZy6ZqQ67e5j7HT7pLiU7E9wO+OABakEU1hvNKEGX7qkZ8Lae2JO++N?=
 =?iso-8859-1?Q?E5kmrTNc6WL7Gk4V0rv0pehh/nJ94l0MNJO8aJfXnhBYk74Y47DapckrVf?=
 =?iso-8859-1?Q?vcGvyYDQMjyPAKd+ANYFk+K8713WVjMGUmQncoKWRFR2ihFyePNqMzKijo?=
 =?iso-8859-1?Q?WHfdZFITWSxF0tuNFyDltEr2vxvadzLgWhSvOSmmWNOrrdpIgkZJcIV5Cc?=
 =?iso-8859-1?Q?JXyEX0lVM0u5I08RSPc5b22sSFtdFz4sl5jeYXmgu901IBArrln0lAnm0f?=
 =?iso-8859-1?Q?pm7h/pblO75wIqIKUiQ0QhL4SH5jKJ6zapqvk40asPSQLYS4ATg7/QkAAq?=
 =?iso-8859-1?Q?Ubvn2/gsBaCIPpEJnzsVctE4Qp+gHOs=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d87894-c51b-4da3-3523-08ded7363793
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 06:01:39.6434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSPmVh2mHeXCHflAYBt9vrlrO1b3+Qc1aGUOAHnnRbsTq0p4sqeVZocrVviPQlY/9OGV6gO3l5xKu9FCVaQSPHjTo5VgAcWAFanZlg7r+7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR01MB10623
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 06:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239930

--fv74f4dmycydx3oq
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH 1/3] classes/insane: increase shebang size limit
MIME-Version: 1.0

Ross Burton via lists.openembedded.org schrieb am Di 30. Jun, 15:07 (+0100):
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index 4250331af12..08bff7dca45 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -83,25 +83,22 @@ QAPATHTEST[shebang-size] =3D "package_qa_check_sheban=
g_size"
>  def package_qa_check_shebang_size(path, name, d, elf):
>      global cpath
> =20
> +    # From kernel 5.1 onwards (specifically linux 6eb3c3d0a52dc ("exec: =
increase
> +    # BINPRM_BUF_SIZE to 256")) the shebang buffer is was increased from=
 128 bytes

The =BBis=AB is too much.


Regards, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--fv74f4dmycydx3oq
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
ATAcBgkqhkiG9w0BCQUxDxcNMjYwNzAxMDYwMTM2WjAvBgkqhkiG9w0BCQQxIgQgblOp+BGE
N79K0lAQGrXsV59lJOnOqaYUa4KMvFjkRkwwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAIbTgy5k79yH
Klvdx9WhPvoK4uF9nZ/s72VA28FCVjyB9IBiy4rTIht7kF3s16+PL0GVmlIDsdl/r/TGaTJz
quqyhpk/CibbDlvmCbgcfSA60M3agizpJQPrU4KwrRULoA9KFh6xCpE/3MGzb9CW/DjISWYR
i798q6VxNORtAHfxUNW9d8Khd+5U9oXlnM1TbdVWRND2HCZNCt7VqIOJnsYBqueqFEI8h/o1
5WczAEp0pq5tgd6NdegjcWS93j5nAA/ry7YyPKiu1HdVkccqiVJLxG2QJwP6qBVdMN7EaTGf
OKStNNEH24Yec9MONt5B9C9+0b+YQBdIumWajuq1zbc=

--fv74f4dmycydx3oq--

