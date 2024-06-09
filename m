Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A441DC27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 15:35:25 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.90])
 by mx.groups.io with SMTP id smtpd.web11.19712.1717947323122508787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jun 2024 08:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=FSw+dQ/t;
 spf=pass (domain: navimatix.de, ip: 40.107.8.90, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ehy7dSRnyeSQHDwWqSzkUvHqoekDryJlwLzjlWcL+rDrAgrRIfKBztZLH+71WaDCEm3+Xs+tP41L9OUsv0Os2QLcP2AB23S0TN+5oA8vyAb/VzVytTA002BDs0/5XzNrzqUY1/t5ZcEN5Vq0nU0QqF12vhxcN9QTlQkVz26v9oAJ5eTE9da9i9UQgxSymMvOMifUITS9QFQ/s0HYPtxTblCGMlzBGMK2izeI5sNskaBWobnKXbs5m3Tt6u9TNGxwCxfmrstNudbZEBpzVHq2BaMOaaqsyD5iBVyEI8qNNpwnQMs7rMNSzOUgp8/4TXIGj7uK4f0B+MdF3jfzGDn6iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzd3Qvfi4+GkOqMxotSEAlp1JEtDuDz2dyMTfgSmjYA=;
 b=RYmGS21iS//pfaGjMZW6dN+ynp6rdkw3D2mogTC6FkxWXtwKI72nQfGbhQylwxtcb3BwCgRgPpFR3lrneCngLX9qkhLn2FULQ60JKtmy9dsnm2kdxk+hbnSE7l7r6ehG4GovqISJ6AdaLUdJfM05JXSfE+SFObQsAA76++FxQPOljgbXsW5Xh+ijasc9ytaawTqU6lLdX0aG7YDaYsHcZblhMYMKA+WTyoYpclwIKCb03kLU0fJz+Ld82IswNfk/RO6VEv9TGE+3/cL6I95lzLuKefxZFJfrVdoX45UXpIN8ZcdFKLfK9ptziaXhcR2nUWHrRNWkATA7iOw+DuBvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzd3Qvfi4+GkOqMxotSEAlp1JEtDuDz2dyMTfgSmjYA=;
 b=FSw+dQ/tSoC5lzW+hndWwwrBdQzA7c4snoNYOBpsMPrr6kvq/5Yi55BV4KmhVec13p16R797yEmoWh+6/BhwxnjsBa8fPW5ujYU26sp4Vau90nwARn7bQzy1qLfr/nXRZfkBayJgEkOP7jrgr914dz3DzICVOoWeh8xyaX1Cx+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DU0PR01MB9357.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:35d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sun, 9 Jun
 2024 15:35:18 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7633.036; Sun, 9 Jun 2024
 15:35:18 +0000
Date: Sun, 9 Jun 2024 17:35:15 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Yanfei Xu <yanfei.xu@windriver.com>
Subject: Re: [OE-core] [PATCH] classes/kernel: No symlink in postinst without
 KERNEL_IMAGETYPE_SYMLINK
Message-ID: <errxxgq3pytbieblhkcdac5ycc47gnkysl5c5s27dhc53dpqbs@skmoqtzuink3>
References: <17D75E0D9904A57D.7758@lists.openembedded.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="t4qfkbrlo6k5qg6d"
Content-Disposition: inline
In-Reply-To: <17D75E0D9904A57D.7758@lists.openembedded.org>
X-ClientProxiedBy: BE1P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::6) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DU0PR01MB9357:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c3777e-fc29-491e-9c1e-08dc8899c418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?8mFGUGXIPAO0QGnBFu5Apx3NYCtyMFm0wWetE4sd61lUNJOD3h7LXrEtyB?=
 =?iso-8859-1?Q?S481zKn++lDgGxbzOCGnIvhGz1qSDM4s8F5hd1oQj5/JOfjOC7CSaD4nIX?=
 =?iso-8859-1?Q?SIxr904xYArvxe3vICLN6By4kGH2KUoZSbhTardQTmVcg7pNATcV3hIL0h?=
 =?iso-8859-1?Q?AmzNViMoT6FJTwPnKaAsD8Sl5fT0jS8h9pFdmGDTYCN0/SFDgOzO3oDkAo?=
 =?iso-8859-1?Q?GtAr9t5AzFbo//3LRREPsi+jvCEHGVDWWDEk64XoEDXbRNwEzrB6a7qgeu?=
 =?iso-8859-1?Q?Hd1nrjhTkbXSDiJZN5IvoIKQxFSvLMJagZ+p3OXQ/Oo8OJgG3wDCdykcq5?=
 =?iso-8859-1?Q?F19IeApPQgJqw7pMgGIs7vorAIMVkPDzl+oBDiH1egNDS6riS0k0fgCE1g?=
 =?iso-8859-1?Q?pdfBUX8bJUF+zOfp2lNPgzAE/i0N50an/YPOVsNr81xG9oQjIEXYlrk82+?=
 =?iso-8859-1?Q?VqRo82v19xSv5uvh3w7xm/cG16PMPdSzeXxEqgAmuETe6teYlQD7Eynxc6?=
 =?iso-8859-1?Q?KxnonjDM9MNKpEB2eUyPxRoOIUoCQvHiPrP31er4dBVH4ZQGEzS3Vj9JWg?=
 =?iso-8859-1?Q?jxf69c1OiD3X/ejXgWu4GUZY/15VYjmMf/w/hD0cM4u/RSgYIvNj4BFS8u?=
 =?iso-8859-1?Q?OdOeK/UuRY34IdMqxHfzkj0B66HoaRWPbnFAzMvlgSraTbr1lDfnNoBqLA?=
 =?iso-8859-1?Q?hdh1wncd545iDTFCQ5oyoIrPkO4OkoCYiDvLP0J16O6qOBrQ6mbW9qj4Lx?=
 =?iso-8859-1?Q?xY7+l57bconrKa7dUP3nHLpRehsOWkIRofJUYHeBNioZCKyFBH27zKVPeG?=
 =?iso-8859-1?Q?XNvwDA8swvrWrvYwo/VZgeMumgfLqZh9LRa9PwXLn5I30Qu4NJFA8RS+Dj?=
 =?iso-8859-1?Q?Dq6q9+2Hzd5hfEp1Sncrqv3XPQaOnyNOO3kBOD65yoy5wNAbR/XanahF9a?=
 =?iso-8859-1?Q?LUMmA7qmuaAdkzJDZTwElnm/qP4S97a1MmIFf8SwUcPMtLOBoabShuC3yU?=
 =?iso-8859-1?Q?o44gLZbbHTKSnbuUWCQi+v3UTJeThSQAJzsAjmlxoeuWoipbfUacVro0IZ?=
 =?iso-8859-1?Q?R5pDwFfLQWF4tl/SjfDGPlARwiDFDre7Q45LkzmOQNAbmKJwAC+AHCdcoK?=
 =?iso-8859-1?Q?hq/67ArapEuaEP9G6VPOWZ6wzGzUz1+JvN2sPADaGqCG6uENTcYzY+WCcA?=
 =?iso-8859-1?Q?XktvQxien4NyYIhMuC5bhHsb8OFj/hoQF336/b7mZcHig55jP2GCxXm/Rz?=
 =?iso-8859-1?Q?8DA0mNBVuZFTtzwsbwEI0klZfk6wxB62tUHVxAI/8XaYNfozUKp0/G6Elk?=
 =?iso-8859-1?Q?yUiEAnKu+ESDSo/Gafuz3z6qOCJEZY6RhGpHbzHhfZg7kpJUf/Z0VG+9mJ?=
 =?iso-8859-1?Q?CK5gJmfqL/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?WCHSGgjIkFQD9QBS0LvMQpkr542YemGSPRhHNTtJCNx4MKhh+YoKZcKrmi?=
 =?iso-8859-1?Q?rRfIS5lihShlnGa2YlcitURjgcE+Z97qfnFxtG2Yilp9aho09f0GMZbdYM?=
 =?iso-8859-1?Q?X60E5ytEUXQahPXp3OBahqskfvqWgTBmK0Gn1dHb0l7VBLQ78h3TVcfUmk?=
 =?iso-8859-1?Q?LX990QTGIJ56HI4bCS97jDfB3SzS4N0t3bvawdh+X8pSrwpO2ibULheJP+?=
 =?iso-8859-1?Q?MzFi/GKTFMBG+ZE0KhKFumMYPitWK8Fm6ipCKkzfi4WtNUF8l4F3vQUyeM?=
 =?iso-8859-1?Q?YIR4aNIEwbkK4NpTRXSGWQtHVNDru336l3W/T1clGlNHn9wbsCbGclRpCO?=
 =?iso-8859-1?Q?+PguO8juDrmRi/sfmiBIcC1z+AwiuhqL6rVAJxyrng8BiMpdngp1NrplRT?=
 =?iso-8859-1?Q?oW/I1kZzQ66jLrHiy1olLX5E/v/xcE1mZgSMGFFZNTcDZUnA9Y807ujFPD?=
 =?iso-8859-1?Q?wrOokU/gyG597nCphaGN7MGByT5J6hdFGc4CFbRZQJigtL/DqotyuNegzZ?=
 =?iso-8859-1?Q?IbAqvrSWOJCsa8X/xXXeEkc/r9gnl+RLIDCtwqROFPwTxTfgRaW1VbptEy?=
 =?iso-8859-1?Q?qkL/hXhrDND34RczkczAus7Ev4TcDIN0SsPmnKrwepfBubxgUdrax+C1Bq?=
 =?iso-8859-1?Q?+f32khns5sXNy7nzZYEDRF8Hn+WpQ4XPCHpBGdvlrfYF76cj462i/p8GD6?=
 =?iso-8859-1?Q?tMtXLPIoP8Ww+FtytBIBk3n5rQxMqGqj8XXxoMmyEWY3nsWyb3RBAFBJqY?=
 =?iso-8859-1?Q?vb5ssyMr7fFTkfBg0M8F0SfagPLBWUVmEjvhRFctpdsTnb0XSiBMifDXgQ?=
 =?iso-8859-1?Q?AvgdWHorGqMUkTiaV0YKBvWUW9YU7f6pZ0keeRwVT0JPizqt4BqWfGMObg?=
 =?iso-8859-1?Q?ZznFTiyS5BACDRAwIW/uFYUMFvCUeDKn/Cu2qmvXpnqBxS6vIvOf7NdMZ2?=
 =?iso-8859-1?Q?mB5hjmqNKNBNrNt2U1YbJFjYOEZVKZumhnKCvcd/fAX/6yxu0RDQJOH3rD?=
 =?iso-8859-1?Q?V7W3ZjHuSxDCGpbhNuu9fAdNXOMDQ9mpyfQo28OOYLooLfui0YwbpwdA16?=
 =?iso-8859-1?Q?PXfybltJg93IDSq22hf9nUCu2qL/caKmCPzw2gUo6SI1vk6amFajC0mILW?=
 =?iso-8859-1?Q?eCWLJJV0v953r9TTAkqRW4v/+/Nd1hBKxTaahH8nK6sP7reKFC5VATwGOV?=
 =?iso-8859-1?Q?Ua3rdryZFaOiQVVmpfN0nPadTCWuvwtPmXd2ddIj60KQ+n0Hp0rZ8C6ixK?=
 =?iso-8859-1?Q?ccU9/R18BzaCleKnjpFgjieFD3HhxIe3FW7UbIEuyTZlcPAAad0f22Shhk?=
 =?iso-8859-1?Q?v05NSKR7JnJPOnFdnCEQ9cxiAOTSv7JGF8D2pswuHA+n3VeuVthpb8PNS8?=
 =?iso-8859-1?Q?XPEc+3iSs/d42Lpy25dPRkfbmZzkrslJ9dBLxky21LlrixvpvEVtUxpEgi?=
 =?iso-8859-1?Q?hv9UrT90OYQ9DkSUf1+iKxNglpKYHyOi3A0DrG/wlHBVP41HqMcTxSN02U?=
 =?iso-8859-1?Q?fU+XH3m55nuwqCNi+xtWBh6u679q3SAroAc5FoWZop/k9za7HOMCABb1Hu?=
 =?iso-8859-1?Q?UD3wqxws62SFfgELI6oclWbZdnoQGos8NxRvbRcD0lz3FbYyk1fkrMdxk6?=
 =?iso-8859-1?Q?HgHd72TXC5JdIVEI4RWck6tI8b933qrWUVBetwIx1hejyyFJDLGTSpAA?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c3777e-fc29-491e-9c1e-08dc8899c418
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2024 15:35:18.2011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5DxxKbB6X7aJXgqCIqjuDzpbaH0kPO8PTbWi1eK3hVauHKawHIEOjg6EuE037idW+hRLtjejAjwo6DIfd8Is7ABsmPLMSmf5yk7VPVGoBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9357
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 15:35:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200461

--t4qfkbrlo6k5qg6d
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] classes/kernel: No symlink in postinst without
 KERNEL_IMAGETYPE_SYMLINK
MIME-Version: 1.0

J=F6rg Sommer via lists.openembedded.org schrieb am So 09. Jun, 16:59 (GMT):
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index d6eedf942c..89badd90f1 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -115,7 +115,9 @@ python __anonymous () {
> =20
>          d.setVar('PKG:%s-image-%s' % (kname,typelower), '%s-image-%s-${K=
ERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>          d.setVar('ALLOW_EMPTY:%s-image-%s' % (kname, typelower), '1')
> -        d.prependVar('pkg_postinst:%s-image-%s' % (kname,typelower), """=
set +e
> +
> +        if d.getVar('KERNEL_IMAGETYPE_SYMLINK') =3D=3D '1':
> +            d.prependVar('pkg_postinst:%s-image-%s' % (kname,typelower),=
 """set +e
>  if [ -n "$D" ]; then
>      ln -sf %s-${KERNEL_VERSION} $D/${KERNEL_IMAGEDEST}/%s > /dev/null 2>=
&1
>  else
> @@ -127,7 +129,7 @@ else
>  fi
>  set -e
>  """ % (type, type, type, type, type, type, type))
> -        d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """set +e
> +            d.setVar('pkg_postrm:%s-image-%s' % (kname,typelower), """se=
t +e

While backporting this patch to kirkstone I realised this uses `setVar`
instead of `prependVar` (as above). Is this right?


--t4qfkbrlo6k5qg6d
Content-Type: application/pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIITyAYJKoZIhvcNAQcCoIITuTCCE7UCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBD
aXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVz
dCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMx
MjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQ
MA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVT
ZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqSvysQTqoa
vIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHbSuejQkq6uIgy
miqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfqB6Mfi/Wlda43
zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC0x7C7aYivTox
uIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHn
Kav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh
2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMC
AYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRy
dXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2BggrBgEF
BQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1
c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0
LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9
FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TE
oGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav
2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn2FlIl7tP
bDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F2nnBtN4t5jO3
ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORdsNmaV3z/sPKuI
n8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNKcIvyg2omAdeb
rMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVn
LernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggWB
MIIEaaADAgECAhA5ckQ6+SK3UdfTbBDdMTWVMA0GCSqGSIb3DQEBDAUAMHsxCzAJBgNVBAYT
AkdCMRswGQYDVQQIDBJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcMB1NhbGZvcmQxGjAY
BgNVBAoMEUNvbW9kbyBDQSBMaW1pdGVkMSEwHwYDVQQDDBhBQUEgQ2VydGlmaWNhdGUgU2Vy
dmljZXMwHhcNMTkwMzEyMDAwMDAwWhcNMjgxMjMxMjM1OTU5WjCBiDELMAkGA1UEBhMCVVMx
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
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
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggK/MIICuwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjQwNjA5MTUzNTE1WjAvBgkqhkiG9w0BCQQxIgQgon/T9j3f
fyFwvqcIUICDoVX6Arh0CLpQEFQdizyvORUweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEArEHNR9GuzW5Cr63fdKpG8m+N/BM5ctvUn7JPsUtVLLeXp2WYXaWQWzdY99bLPlHU
Ykhu9pHBiBeYi9cZaH4xXKfAoXSb08li6NL9066URFE4qnHpU88ZrB0BH9JI/Ryg2X7RvJ2O
FkvqjyPr8EF2uV2h2gD6cvBrNyGyZVPyTqJQHqiSvVV5c9i9p3wMh1J3LOE1jsDc4tEVV254
smXCQjFg1gX0CXqnlIT/m7Qxrn7dVxiO2NVr8Iie+Ik4mXLttYMvgl0b58bu3cHMUW2eQc4Z
hjZGcqb1kZCZIzWoQ7iBabbkkxJrAxH4kGWqlgoTRGqP5Je97PGWCHm8hOHjWA==

--t4qfkbrlo6k5qg6d--

