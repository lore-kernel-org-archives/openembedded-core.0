Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0236CFF5123
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:22:46 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.112])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85613.1775578957971842463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=5Dr/gaED;
 spf=pass (domain: navimatix.de, ip: 40.107.162.112, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MggX6zfRKCTmeQCgslQ/JzK88TG828xmRIZXzCK/5y2zsFMXrGd1eiBkTG6ayyjSOID7aAgGsQflWU8Dq3ckTmeGYuD3A3NdQ3BqozmNj862BhpIBwEjcy+SQ36ld6vwm01K3qSnjtcopsPixnjg9OynvZpCjCgCcb1xXGEAKVW8xjEe/33bHOiQFnFjzFDnKe/mGX+pK7rOdg1fS97L5yGlMHs+E4elPszTSo8qbtr9xbQel3xdhvnyk6XfHk84bjk6YuPH+1Or8C5j8KteC/5cmiu1XZfwXGR9Syxd4rxqWnFCmSSXz//rQgi5Lf3EL8WgfrfjiqMAJPBLbxqgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyOA/A3xJEbnBbciDIDCseB5teCAYl6wExI7fYmZBwU=;
 b=xRHoRZvV25DqTZpgO7qqPyoyRNi/hiTG4onWKjw+jnL5G9jucWDia1Q0MCUXUYmiVOC1dAQ5IUcLHW4BHvCt7bBxhBqdN31ZeMWfRUEVzOvYLezeODoxqMdr1ceRu+yC2TXZMsIDzT+j0+UcEUmiOuVManObUjA/vFim4tg4C/Q5aSQfdyGAn+H9PR5WOcyXiKAsAIdyWOtV6uoErsssSp9zYI4L0QNuunEY3CL4QUfduQymyrBrXx4I4ETGTJr7MmXyUOVcfgd047czXf4NlFm9in8I4BDR6DmddseKnUeuCHBDN6U7LK5au0xk3mzzKBG3kf2CbeUXpF+oZxjdyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyOA/A3xJEbnBbciDIDCseB5teCAYl6wExI7fYmZBwU=;
 b=5Dr/gaEDJiUJobXXVGbX2hinWsu0yJ1T7K3SioZEYjPoIv0aLK8Y21ER56Ww3gtTjHVZn/4tMvi5CYurlnlLR+16fP7W1YP28/5LyQxjLmQYV9Ny5klJxugF0KYq6Vct6HN1ivGy2oqOrlIJdEGWXrX6eRIPuEBjexQz/QzGCkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB8806.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:224::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 16:22:33 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9769.014; Tue, 7 Apr 2026 16:22:33 +0000
Date: Tue, 7 Apr 2026 18:22:31 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] busybox: fix DISTRO_FEATURES detection
Message-ID: <adUu2aZMnLWP8bKu@navimatix.de>
References: <20260407161030.1196116-1-ross.burton@arm.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="52fzse6cfxnddr4v"
Content-Disposition: inline
In-Reply-To: <20260407161030.1196116-1-ross.burton@arm.com>
X-ClientProxiedBy: BE1P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::18) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 645adb12-4c76-41e1-5e6b-08de94c1df50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	OeIMrLN3J9D/5l4LXTlNe2hNOWdVy7r3gVG4FDZys4peHDJ3k20wlb0cyssDnRYSrKodGy4avFOXpKA2FcLLw0I4iXSarvpKXKd62m6w/rBuKJAN9bbyorfxhXTz9s1bRD16MTaOIT4zeuBk3Cuq3/4O5/gge/ithKoWHgVjHqvKTY8ulS/bRsZvErleJes4s1fPD0WUOwGPtw9iLpu9GCjIVqHc1Fn7bEGmKGWkodazkMSuPiZztkNFlVV8ZcCKeK+YQZ81jbyQNPMxgnijl5WaccQLigf/L7wIZyG9cq5+zWSmvfJr9aYcqKCVSD7M+XaH4yTM4fXcWf+v06PtbSFKBUwYyc7w9DRFE88vVRjLLZ4xjV1LDuHnqLcYHyum7kdDp8XQh8ycIAo/2A3CLFVNGTYyiFrTZhK0Ag1VIZdqh7VWrfJwBRhPyUd3+lClOjoYWlpTpwbnbDsq0x/aM14qI336F3sssBEmjXobKGnBUqsiAPQLFk9+WPX0bbnsxKsB+YxLY3Wj5ZSfT49gEpw685E+1WSnxEJMrFg14aMxm5ZdWDMv+ssr3/rhPDQ8eTBGkOteDA4Xql1SFNZkBBRv5SFDJ6JPxKW3s35Xnq7VckBC5KZe0pXoQIn1/5iXd7S2a09j/CNvjKmfkZsMnRDRkmRZiIxvTWfwlU8MBQ54GChHzZmBPavu1HEUCBoX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?3rEUr0vtZXRUBG2rejTy6dlrMpXxbFJYkpwcpidJJ2HabJWQijTMZbfwUL?=
 =?iso-8859-1?Q?v2XvXvBJmujf8U354XzSAYZlnl5QQfzIhOEAD4/6YTaA5ufKJx5Y4PxJaY?=
 =?iso-8859-1?Q?f6Y1oqyttawZmzFxJcq+Vb9MCefp6UpdsqdZFcZ52K8aezFiJvgfXfAGtJ?=
 =?iso-8859-1?Q?FM9+95/J807HC8r9YQSumZvhxDmzbUMDdRHXCciw2igsQ0lNFj4c+gXQqv?=
 =?iso-8859-1?Q?cdEax8CwKWWO1RJtKRAvMPIOPWANx8PEvHpx9xlJOBMthSgsHqxUkWgxBr?=
 =?iso-8859-1?Q?cjE3hXukCggFxQ/KgtvRWVkj/ItqQ3EfB/PmpTzs5VR2TTHVdrxuhrF6E3?=
 =?iso-8859-1?Q?In4MUFDdvbJfBs+70S2UlXBhnS3BHt7ok/VW6ur6j0nN+J19ZLKGac19rx?=
 =?iso-8859-1?Q?+dH0XO/AqQTx9ENW+29zU059+OFfRHV1juM57fM/afrM4/myG7cn+p/8ZX?=
 =?iso-8859-1?Q?aRDjwRZMsrx1w7LpKCkTB2+HrKjqIG6/TYiIJEjgqTVxE0QBMgtnf+XnEf?=
 =?iso-8859-1?Q?ePwKl+iUvAL0uNfoo2deem/BFlJ5vW97GEEInwtp29v98f5lPJbEzXlX9r?=
 =?iso-8859-1?Q?OpfTLjK09cEz0d4AFl/9XnaqHnitbq8FiXkDcBXGaRdpzzNsYlkG0lhcs/?=
 =?iso-8859-1?Q?VyvR4tuDLL7QrGPtIVIzDvb9nSU8qM0L8ljvXhHi5bN06g1rC/37uIJ9eF?=
 =?iso-8859-1?Q?T5QcqZSvEWYGogSIOgjFIMmGMWAcNpz4el7caLCEXBR+qHN1TfTIUAoLlg?=
 =?iso-8859-1?Q?+izY8LLJnhM5T4g9Xz8mui8iKPX9j7ddX8kteKyTbt8EI4DI6xDRK2EhNL?=
 =?iso-8859-1?Q?qLbLI+xvfiLKMW71vrmyCjkj0/8vKDgyEaNZwHyRuBMRF2igWqx8hH/orT?=
 =?iso-8859-1?Q?mCpYHAGrMbhwcfz39Ek8xAG36zWTvK1TKFUr6k5YCRzosqVdALUvz+THz4?=
 =?iso-8859-1?Q?U0hmQi53qfCmJapmKidQvFQTw3hNgFPnErLFxgCCAYTgFJU3Sy14IIL9qP?=
 =?iso-8859-1?Q?TW0IGn9q30sYFwdWhd6eVHwmzfp9l+IbBNjTe73hHiI4H1MA7stO8jFcYI?=
 =?iso-8859-1?Q?XouBA/e3EOXo7pRO25LZBQ7ahcyl5q0WJzlEVBDwO1kjlqksECX2AeKV4Q?=
 =?iso-8859-1?Q?r3GWCIvXvr4qaHTb8Wi/qINftPTaX3wGcrk7oF/6PfRRi+vc2DfjZIMn4i?=
 =?iso-8859-1?Q?AvrG6RluLGX11G1i17/bwzILhcrJ/XY8pz6I2ixfonYb+lTwU5Q+8TrwKl?=
 =?iso-8859-1?Q?safm2lAEZuovmLu2fGEBDAuguBB8mSu++Y7psO9dfoqRJbutYJ4r34rPRd?=
 =?iso-8859-1?Q?f9/jOSNniTLAdfGy0j9X4Q5j6Z8IDgL7tPo6xLiwuISYqLorzMItjm3tkc?=
 =?iso-8859-1?Q?WI+VkCd9dVQsQFQMDH7oeGr75Pji/4n8zhc0ll/bwtXIc7IbJf6ZoUUEy5?=
 =?iso-8859-1?Q?NxGZRVGFqGlL6icaGP4ObIISwQq5Il9hmZ8eszuupKzneAkATqQQbo+sff?=
 =?iso-8859-1?Q?a/cp4jEkkYTx2TvlC+5NUKRmuBO88GVEW4t0T0uU2AZ3CZD/bHdiaaEqGN?=
 =?iso-8859-1?Q?n9/BV3gZAz5EfZjwA7yBprGnpHNNHh8ki0CRPNRPK78LeXJsFav4jssgZa?=
 =?iso-8859-1?Q?MHw3R0wDR1dyUYATL5fblIGmGRPAtK9JfziFUwAdtG0UirRDaaTXzWgPoh?=
 =?iso-8859-1?Q?Q7xGVkIkbZOPNRgcnyQzbQ/OLKV+eirNGuApvVwkqJhx3RHCKry72Zg5Xp?=
 =?iso-8859-1?Q?gABfa4OWr7hp3jhXlrh74syBVIpcXhA0NXmTm5+2hQgttRqjipVfb5YAiH?=
 =?iso-8859-1?Q?AG46GqQR0pbRILeYw+/DtVwvoyA0DJE=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 645adb12-4c76-41e1-5e6b-08de94c1df50
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 16:22:33.2049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ox3u2Cuvgejpcl1F1bKZgP6ZGWixzR9Kk+7JrShnfZHwFOaNgknPgFtNTVPVaJ4L1z9t+e25TqprYxtTfydxNV3P16xTt437g1pZz+3Api8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8806
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234773

--52fzse6cfxnddr4v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] busybox: fix DISTRO_FEATURES detection
MIME-Version: 1.0

Ross Burton via lists.openembedded.org schrieb am Di 07. Apr, 17:10 (+0100):
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index 355c019738..1429da9f96 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -129,7 +127,8 @@ do_prepare_config () {
>  	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
>  		${S}/.config
>  	sed -i -e '${configmangle}' ${S}/.config
> -	if test ${DO_IPv4} -eq 0 && test ${DO_IPv6} -eq 0; then
> +
> +	if not ${@bb.utils.contains_any('DISTRO_FEATURES', 'ipv4 ipv6', 'true',=
 'false', d)}; then

s/not/!/



--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--52fzse6cfxnddr4v
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
ATAcBgkqhkiG9w0BCQUxDxcNMjYwNDA3MTYyMjMwWjAvBgkqhkiG9w0BCQQxIgQgZ119YCZX
cK/BPQuO2CrGQqk8XA+8OzxcqenlOr+gvDEwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBADt3vfFLJoim
I31sT4HDHiFweku/fLSzvnI/9umjcOtcNeRozZV6WpXxOzJky3DK15nESgUMed3QPVJo25AC
J7M548S34dOkK1zI7R0ARC3DTJoYv7+M6K3JR8GtftJLrg7r/gtoBoqMLJfP2U9CecSx19Qc
MAq5JsUAypyiDiZgAKLGY9h2CRRL3te3dzA26cf6OCcTGWWDp2+9UHmNiFxlmoO2BV9CJHjj
ERD4zAh6aMu5hgXjqtXvp2DSuRfWPh+xdvZ9SByWwdMjJqOJi2mTjncFEB/e5SsBs1rg4uAd
KZ2XcgjzQFwHGhGb1KL43zOiEx7mXAoZpMAZN94ZjaU=

--52fzse6cfxnddr4v--

