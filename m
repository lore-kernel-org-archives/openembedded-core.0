Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C55DE98FAE
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 04:30:49 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.125127.1775709045248166218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 21:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=o51qswZ4;
 spf=pass (domain: navimatix.de, ip: 40.107.159.79, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoUGA3Fn6wXBOnW+cPE8RQlKax6eYJYDvn1kNxJhknBA8Nw+PJtsQFt74qc16EjtwuOqnsp+doM+8aogsAvch+tyKq3NoTgm27FKwcSM6plnVwn2hH06zNS2b6JMsyw6MZj+avVbp6Cmi+EOFG7E8mdtvw6qUefBeSAeIq/KqyuLWkHbK00BwHZvlSkxhaHnuPa0xXc+m9l9kN5EneTn2MkfrlAuLpuXeeDu9281axdcTQ2kgXpjExj2aMB/wPqiTJo5BiWFY+idFVY3OziUlp+LnZiXknUtGTaiKzJfWbNLBjx8ypw6rFdA0sAnSPzuOhvnofdl6270aGcR9VFmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKlcbsJdD2A4AttwoIQLW2ieN8Rh8dJ3CJmqf4nMZm4=;
 b=JXh3dAlfhNoqoUmuExc0ryOrUI4yFU6vdvby290I6wYKm2CtAFm2ge8muJInIfCwfygrFhs2xdQgve4F/pG/ExsDBMNo+fIg4kro6WRjC/SrvWx6OfPtylNtE2NDCLl5RI3dGaJ44fGFI1IIsnIWAQ4p/3R4H/cHNzJTu19ezp3impc9KgW4dqaDoCBlMhWb5zQDX/2Fr0wc21xw9LS5o5a0ROXnfFXAy3Rmar6IsfKWydjDSIgLQBGMrwRC+mu6XK2t5uMyGuBPpMmYbY3PKNnrXJjF+Yyg9aTDiQppr/zsL1aWjDidYzrYbcDx8w5TLAbqVYVftMqKjPuOLz1Lkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKlcbsJdD2A4AttwoIQLW2ieN8Rh8dJ3CJmqf4nMZm4=;
 b=o51qswZ46QiT8Ytq312kf9hvDgxjupmrLWXCuJMP9Z8ERkXGkABmz0ipBTyYUMKZMWitnC6nbKHWoRAKaEcMdc2vlnBZLOUdEfSFwXFybgTLfREBPVkW2jNDG9eI2bc7raL3eYwQKcihfeHsGT4STZVX9K0kTFvaA4NK+p/qLo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB9PR01MB10425.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:304::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 04:30:40 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9769.014; Thu, 9 Apr 2026 04:30:40 +0000
Date: Thu, 9 Apr 2026 06:30:38 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: rs@ti.com
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
	mathieu.dubois-briand@bootlin.com, openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
Message-ID: <adcqUntpjuEXPLyw@navimatix.de>
References: <20260408195024.1874335-2-rs@ti.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="plqjoyrh2enax3la"
Content-Disposition: inline
In-Reply-To: <20260408195024.1874335-2-rs@ti.com>
X-ClientProxiedBy: BE1P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::19) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DB9PR01MB10425:EE_
X-MS-Office365-Filtering-Correlation-Id: 721ddc9d-ca48-4dca-feea-08de95f0c147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	qyKcU/Gn1wn4hDm17tfNINl2f1tYvxRwQE0CfEK/oqN7t57ZMWPmnfNXpY1a8bqjNJAErdqPwXRy0FrbZG9yjSFSiMv9LHccijapWP/RIAyrQjGl2LqagQILiLvrMV2iQVKXmMfjfN055M5VD92uppRhfiLMzT/V8ucxIRzPyqO5r8lrwkbMYVpAND1r/UKGVHmg8+2qCp+OqqbZwVgxHSqW4RkHSfV8AUUwHyE/4kIpR/KRXdXajg3lpoAfWSYA1qrNj7sCtse8lQJC+N+uPNfHvatfdcd5aLh6DKSpxA0Drw0i7rEesJwOlY55QOgN2SFrqcZSqXW3z6FQ5TlTxppeQKlO+YldMoxFPgH5euhLCy4XnQH1XXKvME9bJt8DDRt9UAjm7ntJ79myLWpiHP8UGWTTReTiDFNtxW399bmOby2j9wh/nuJvPQaD3P7jugcfgQFzct1mba7UBNNL2RDQbMbzxQ2I5kx6YlB2e99CatLcvlQjQUx5WEw9QCoffr4lV8dv2q4i4tFF0R1Qzsk8z/30mN2NbV+2xMzfTp6np0xAt9sM6rWfgXZ36NXkPder+JWnp8EhV/33cLI60o38OXAOLKZbkz68sBpZ7ZlIaAYQ7bZ+u3rFw6q+yQ1HrUAmCHTzBwQjwlGt44Mzp9CLwOPpQb4xs9ZSi09EIykR/2tSWCZbhQdjoRzH+A14
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?ho3nvV9jd+lqB0Xd5EOH8vBSegCWxsvqzcUuzZ3vxzV2b1bVX8Uzqebm7p?=
 =?iso-8859-1?Q?XixH+IA0j3Lt3/C5dgF2UO9jL1JDocU2mS94VkDTGb3mN50ewQkiHZBJ4R?=
 =?iso-8859-1?Q?+f7i7rxWSQ11oJ/Reh5Jq/tDN2Xbj8kKxYFQQTDUdbv9Slxblft3EbN5Dv?=
 =?iso-8859-1?Q?V0NGfQ5DusbH8v1pL3EEVqmqLtv8ROfLP5EhM6GoUbVtgL9Ce1VQNDZ6Q/?=
 =?iso-8859-1?Q?Z3/Dzeyj1QWJ+B9IphribLVxgLN+KAX2GfhRJta9tWCFSBa7w5t6hpX09M?=
 =?iso-8859-1?Q?LzmAzWTgTqfZdqdODhyQsiys9tzG0ZAq0TE2VJ5FMMXWYfHfPtRqDmvGdF?=
 =?iso-8859-1?Q?CQMX702LXtrwLeA4XFoR2CXThnruLipmAa0Z51Hv28Y2DRlbckq0EmQ0hd?=
 =?iso-8859-1?Q?e6N6wqu/4bI/lZI+8DqHeKCeEuuL4dVKspKjzRGh9DCQnZgo9Pq9dAwyku?=
 =?iso-8859-1?Q?YMlVhN4J1VkKBapiELVmgX2UCsIZdm8qIZDu3F0YHUfvL/So9RlRvgZA10?=
 =?iso-8859-1?Q?IqxCgC4w0hBjehC9IaJVc5OSABNX1IRDjUTWByPuD0YcvU41MtaN36cvLD?=
 =?iso-8859-1?Q?7oA/2QJWRUkL8xMw5hamtPAOFJeuRdvLMUSMrwB++gECJ0FGs5ATWZdTcS?=
 =?iso-8859-1?Q?0TG2oMxFlM5kB3Kxp4t7jOv0V95NJUgwVs1TFOgFhne+WT4dUJkr6EjMGH?=
 =?iso-8859-1?Q?Fa5/VdcXVPytSMsLdPp2uJNFv/Zh9OrMSr1n011mMmUPG1K+Wx0t6EkltP?=
 =?iso-8859-1?Q?ruS9RkQ8sreC3Et/tlMuAMnsnfmM94M/YuN5DspOjiH3I0ArgxP4CbZTz6?=
 =?iso-8859-1?Q?xqeFMy3e2CV1ji5wOx5N8P2crgAc00SoAZCghYzhqZhHprDGJ7OHzm5otZ?=
 =?iso-8859-1?Q?q9cquVFZQ5pYuqRkazkuc1YthgXpf9s20J8wuUGGJodVgs7kZfmHefrU6q?=
 =?iso-8859-1?Q?Xs6eiIMNjLLY2jr4ciEag9IRtxrBH6jSNk7nNq2BTrL9Cs/ZhHVuUznQ9b?=
 =?iso-8859-1?Q?G1qmpSwnousd0tOzeYceM6VmzpUcyx6JaXXZ5nURlkobQDOaa8RPYJIW0Q?=
 =?iso-8859-1?Q?Ufyk9KDsQN8k44Q1M4y9NW1l/5ag9T37fXc49vMnJZ3sNq0Lj622eokpzh?=
 =?iso-8859-1?Q?ucaMsSlzdASlXg1J2m9+hA6InlnUALtIhyUAXpnfBRXxcHIV0zpbrmvA9v?=
 =?iso-8859-1?Q?1VxhI/ZYRSctwwhHU59MGAg5ePDiLoPGArto5HTMo3Bh13Tdn0EnRM3lCV?=
 =?iso-8859-1?Q?YNZgVXjgEOGVc68yY9I2v2sYdgE82+9xqObM4YvEWT4QbCL/r5K7my6gP1?=
 =?iso-8859-1?Q?FCMV6xBE+PBklQk5DijKKoEvdcEoj61Pc1zvRqPVvoBxJrcHjwUd1lmGuT?=
 =?iso-8859-1?Q?kAdnjS1+LXvzajCVXNvc9XA09u70tG/2P5GyzJlEf1GIbRVe+lPvMgZuVt?=
 =?iso-8859-1?Q?WlwHn6+xQ8JpLdyXTTMIXYeywOdu14urBnjEtDLIE+fSWRacw02W3t5j1Y?=
 =?iso-8859-1?Q?HGVl+4cODromnGK6vMJKUr5c4/SoBtO2J59pxzMGlFWY4QsE4CHzCpRXRL?=
 =?iso-8859-1?Q?86Sa1h1T3wxKeAwUdnuE179rPf35WgB86QL3r2jy3WkA8FC36DoFKrcHEq?=
 =?iso-8859-1?Q?sTA7GRdW0HgWHf2ydX40PijjV8Eq4rm4ueU/bvq9oFvs/hf6jX7ve4cJr8?=
 =?iso-8859-1?Q?wW8mNc++IFey5MRGrtIoQT8hyi4Fs5Llr/PC5a0NsjIGysSilCt0I93zzO?=
 =?iso-8859-1?Q?qaldIZfzkDOIGfIYuDkM8xwcNAFwFI+AUs1gcSQfuXgqrO7fGQwd8karTj?=
 =?iso-8859-1?Q?A34mfnBGKojTqDraK+J/lb+rqi5p6lU=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 721ddc9d-ca48-4dca-feea-08de95f0c147
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 04:30:40.2876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oq5sHPrSNsNsaAYPkKPf+bNuLoFj9iCB+Kvc7pNN7qjscRi4yzsYx69gfKM4QQUMV5zNZcPjs1hkFHcN+4WNcnW7CPCUqXiSieFySrjcVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB10425
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 04:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234873

--plqjoyrh2enax3la
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
MIME-Version: 1.0

Randolph Sapp via lists.openembedded.org schrieb am Mi 08. Apr, 14:50 (-050=
0):
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 84450386d9..29301534d2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -22,7 +22,7 @@ root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURES'=
, 'usrmerge', '${exec_prefi
> =20
>  # Base paths
>  export base_bindir =3D "${root_prefix}/bin"
> -export base_sbindir =3D "${root_prefix}/sbin"
> +export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmer=
ge', '${root_prefix}/bin', '${root_prefix}/sbin', d)}"

Maybe:

export base_sbindir =3D "${root_prefix}/${@bb.utils.contains('DISTRO_FEATUR=
ES', 'usrmerge', 'bin', 'sbin', d)}"

or

export base_sbindir =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge'=
, '${base_bindir}', '${root_prefix}/sbin', d)}"

>  export base_libdir =3D "${root_prefix}/${baselib}"
>  export nonarch_base_libdir =3D "${root_prefix}/lib"


J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--plqjoyrh2enax3la
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
ATAcBgkqhkiG9w0BCQUxDxcNMjYwNDA5MDQzMDM3WjAvBgkqhkiG9w0BCQQxIgQg0C7olCsT
WLjkhsK9XNvFMtnCM3gT+1bj27rievzC99owNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBADtH/JVX7GF2
k5+mqgh+y343uMyd/S9AhadhSX4sCXMN6yfR9Y6RcfObcRxcoFSBCe0O79voHA+wdlYTfVzb
q7OYQYvpO5bTwZlEhL1wMIY56KNJU1UnELuxaX2AnEl0zpIgbqsoyh9SjFDx1vlYsT1u7AzV
U5yxwnTqpaoOG97K118zgVaXvADGifjgTvLP0J0ROwEWs+jPPRywEe1b157Q8SVPbHxOtri0
irioWDG0pBnOikNgxV2/A6QhO8Jw4TdGzDrnpO5OFp6eYHrSMDjjdHE7YwZe8wJaR3L8P3hK
Zz5TYJjJiwwMmuirj2cCoLysQezbqwa8W4lZ7DKK87M=

--plqjoyrh2enax3la--

