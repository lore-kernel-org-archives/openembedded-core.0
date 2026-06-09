Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68357CD8CAC
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:40:43 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.136])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74665.1780994436346176641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 01:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=Xu5gMokU;
 spf=pass (domain: navimatix.de, ip: 40.107.162.136, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxsPYKZh/b+3zMUvjvCSlxRdIs166rUSiCg9SaxvAevJtapT/1xQAZ2W50t7DicI7kmOiUbbcoXQObp0EzcBKGfwINHoj3K8GP5Hfrb6W7GqVbgCefzXKxcVjml3y8dMSvw3SAV2LLu5KGq9aoxZBDO/tEJ0wSuhQ2JSsoeApfeL2ic3P+yrJT6TrKHINCZyfUDoTWugMOXT4pHStSrkzf76QDPhR2Q6WSna2dkvhcEfdgU0LGT1npEXNManO6FRY4bI59TkksulBR11HtBxKST59yD6B2OgVE6Eb8jQUqesEfuFZ/GKg3eXsj3hLquy6BlJt7ZILrGtmWrfHpG/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppPN9KBe/NA5ClPzXWnB/oCF+TobKsZBaXvyLMi3pdI=;
 b=QtXMjfji3xOxkuXCgjiFTuTfgy1WFB+nJcRfDPNE8mfrRtY7j+jfKfTr9/Xw5M2hFhs9xJ7N8Eycu+k0Jvi/6PLSMHdpA/5ymBBvPPrvZhHbrDLOJoK1gVxz+6hbES27HAB2EBbL3N9gRe9HoQ9Tef6txAiGl3QlpeV/cuWROzWPwE7xioHYDFrJ9L6uSaQn3c0QEBUhyKbjFpMCP44q2Mwg1yoY7ve65O2i5GADeLIcJBJDGdD9tF8lbYQqsnZ0cYu/5PkFqjhqdfLyb7Xh1y0N6gcoiEV/qi3dB49QsBluLToa40V6eG8b2M9DV73Aj+fvLQ+pQJwdnwPl9KSwrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppPN9KBe/NA5ClPzXWnB/oCF+TobKsZBaXvyLMi3pdI=;
 b=Xu5gMokUumrcKnqn2Xd4bX2EuNdsMI2h4DXQPA49CnEDxXoJObXgXLNbjEHr0Czd5cChjlfJjXPhQjIOlSqYfLE2+f/CP/49oiNFxLQJHzG0UkSLePvno71UZKCCw33XdaODe9X2JbDxyDnM2USiulcwtVLZG0F+OuiTcyByiK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AMBPR01MB12859.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:722::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Tue, 9 Jun 2026
 08:40:33 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0092.011; Tue, 9 Jun 2026 08:40:32 +0000
Date: Tue, 9 Jun 2026 10:40:29 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, AHoemig@datus.com
Subject: Re: [OE-core] [PATCH] rpcbind: Modify socket file only, if systemd
 is used
Message-ID: <aifPPlfnz4e3I50C@navimatix.de>
References: <921b2852784f105d6ca5c8a754f87a68f2ecb4f3.1780937668.git.joerg.sommer@navimatix.de>
 <da28e9e53e21ce0d9dee82a049fb0b6d55907bfb.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="wwkr47bzzhpgt7j6"
Content-Disposition: inline
In-Reply-To: <da28e9e53e21ce0d9dee82a049fb0b6d55907bfb.camel@linuxfoundation.org>
X-ClientProxiedBy: BE1P281CA0480.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::7) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AMBPR01MB12859:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f792c05-f0dc-4846-31d1-08dec602c43b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	zhTX/xdY9ldczvaadjZncUNR/kvxOb8hpNvVzRl2MXZfRAFJJ1/n4BMVEyG2HyQ5OlL0MXLXvA60nPU1yVLOfzJ3JgCq9bnc4Ozd1+LDKcBJE60zc9pRwezfzO4ohB5qlLCZbs0k4QqUMLIckLkkPZ0DJJkjcFVRTW8XbCfejlhtl+29ZoRIKXEL2QVPlLUghcw0qW4ziV7fCL7oVoKjmw5JXBzJmSvzOO9tWjiq8rigoBjHqZ26mOgxF0aVnNkK0eOWa9hSyZg2ej/WrTO5xDCuT2D/uFd9zxoJCgmkWQ5r0vOQ+omS8hiRM2B/2pctpjFVjhg0eYNiinjHQdLllm1pi502PtqSpGc1Kz4D1tt+sE9q93U2QXSsUD9QpoP/uxLpibK2KrpQvNMb3vEnN2ZvSrWXLoYjKgJ89vVPtFGCZW7jgMORQiLWd75CfXwazagPfAb7V6qUCTA9v/phHlOLcK3fwdQbjQ4K76bicwF34i3WPPzrGdpxEYZBqk48/t57p5q2F1FT6HttzWzVAXD6ug08N6xjkuB9zop69nYW7I7hvBdqfUwpqD8+tA9vWbM2QIzcyuU8R+/nGak/LZ3DiVDqVTbTLYQrmHDXADAnpuSF1ky6j+fzsAt5JYVcnCzze97V2mLwVqYaXkyNJw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?aWZgREqjazjLQSErrRy8XeBWwvwIDq/C9xPEwCk0kok2/kT/szAcZLAmtn?=
 =?iso-8859-1?Q?ROzT0chzvwCFCutw2ddhGn1EwL/jo84T8UVCjqj9ydgvox1uYLaAmt2NSf?=
 =?iso-8859-1?Q?fN+fhZ9O2SEA6+BgqvQK1fq0mbMHDzSjfS8xFnVGMSJyB+F4IVef3U/AtZ?=
 =?iso-8859-1?Q?PUY9A9nIeGYHDxfdUJnfbpbcPvBPylBOTqP/OfQjoL57Ho1xfmntgzhhoi?=
 =?iso-8859-1?Q?FW4REz9MZrRx2H5B+UTaVI5olCgkW5weau21isVxHxpBKamY+cAUT8Rh4I?=
 =?iso-8859-1?Q?EbPaVlz1A+ZzYKz2Sd/z0suoAi+DoQi8Nrr4Tg/DnJB0irJxEQwXLRn48d?=
 =?iso-8859-1?Q?sqli6K64juKD1+CAYYG11mUT9NrNKGal5DEkXrmYsC2Y6V+8te07/uSJTz?=
 =?iso-8859-1?Q?FXXNdWrPmr1L6CRLJuaYc5Yp7rY6WTbuy6re/AoKAJI+uvf0GYB+6NJZrD?=
 =?iso-8859-1?Q?0oitaXF6c+ekE4Kqzce80D8KaRSnz4HnhkZ3kuCbDx/2OPrDf2njAaaHhM?=
 =?iso-8859-1?Q?EKeAEHzuZkwPP1ngls+phZzHQEKSR6yegppBK8HsXOFso6dN9McIPj7sK7?=
 =?iso-8859-1?Q?ZGouXliwGbGVlQMDl4/vr3wHzVaX+LoOxyCyFy/KQZlcjmTKY+9GuYdlAD?=
 =?iso-8859-1?Q?gzfAMJbW7WasMFKT6+olMwu2Q1NJq+98X+4Au/HttxYDnWwK30c9Tx2D1/?=
 =?iso-8859-1?Q?63Mi3meZ9AJpZQ/gD288uf7ABR2MVOf3t3WXEo/7UzCZIFHgwqi4WgzWU4?=
 =?iso-8859-1?Q?trH2XfhVCAkx4gjJgeFzmRkVR9YoOhSpY3h4hl3jHRA8OsW7qC8iU72zqi?=
 =?iso-8859-1?Q?DtpORvWB7Cjg7BMaBeQrDPvQb0O8Bm4r98vwlBqFV2XAfjv/M7BhvmOtWC?=
 =?iso-8859-1?Q?2bjAcaAwoQdLDoI05tDrPBR8uZ3hmmteh2AIYZlFACbQO/cvEwWzJ9XVeK?=
 =?iso-8859-1?Q?7pozbMvAPpYb3kojUSmFlg+NyhsezdU5SeHnf8flL404Lw+y0A0M2eUbkS?=
 =?iso-8859-1?Q?2IKZjzhrwPt7OIvGMliMF5Ip1MzoAvS2yk5mBugk+WeAc0JdfrRa38CpUS?=
 =?iso-8859-1?Q?2etluS2A76yTVx6bH34t+grIfvs0yMqImWE6oBzvWlw6WrYh894ig0kU5a?=
 =?iso-8859-1?Q?8SNPcmiLrWIJHTB3idPQFkB/ba7OdxT6LiLtXqRp+b3WepyXpeldZltHFb?=
 =?iso-8859-1?Q?QiA75sL3p5PGLe7Hw3KJqCXCp70jSW4FTzS6PHQkfUjTke50od9v8lD1x2?=
 =?iso-8859-1?Q?K9odsGakes1M8jBS8EX9XyEqABviDUYyY7VtvQswfx7qg4T9SdfDvNvYkA?=
 =?iso-8859-1?Q?M0+eKrJdsGxf7S/ibbD6nzZ2ImtKAyAF2lCGlZBl2OkJJdo6xYj0GHGxiz?=
 =?iso-8859-1?Q?myjL9QLA23D8la+NjWlK9h4f2Vffpbxw/pqPgbQKWwteiIjolJVHfbINkJ?=
 =?iso-8859-1?Q?2LlqHosB4Zdakqg++54xkumoitXOn0o1a/bFMpY7bbgvLm0ALMhrHrTUFU?=
 =?iso-8859-1?Q?OlXDx3jqPLB0o4kXQxpXdq4PsuF/GwtY3+DT5y8WEJcsxreVQhEwbkyaJc?=
 =?iso-8859-1?Q?+7VzPgeWVKU4/I6fIkOH6FACakrmp+wAT8Vjw0xaIyWjlZkngaaOmvC4Ui?=
 =?iso-8859-1?Q?2vESYWM8dR5C2tsC2G6h9CfsSrA0qZY/F5+hLU++7pgD8yyPCSL8mOyQv6?=
 =?iso-8859-1?Q?2q+3xOKPXUJynF8v1XJFQcnEeP+7a/btlDgAvw+sURLmQ6/zVQMAab73Z+?=
 =?iso-8859-1?Q?bS0cDuOc7JSOPyw+xgYi8XNM4CjWHBi8vFuf89ZfBhAOVmeh+O0yvyYneH?=
 =?iso-8859-1?Q?lbu+1FbzadKdGS/O4zSNOCFBB8LdGMg=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f792c05-f0dc-4846-31d1-08dec602c43b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:40:32.1036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUMDJuUd7vdu/CLRUazTVDAmZsEp85PYHvheFGeoTACx1VI4QBrQ41ryZtMhxgri5jbCqYWtQZV7PwdVGJZp8GdurugOxK40ztUTN0FGdeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR01MB12859
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 08:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238275

--wwkr47bzzhpgt7j6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] rpcbind: Modify socket file only, if systemd
 is used
MIME-Version: 1.0

Richard Purdie schrieb am Di 09. Jun, 08:41 (+0100):
> On Mon, 2026-06-08 at 18:54 +0200, J=F6rg Sommer via lists.openembedded.o=
rg wrote:
> > From: J=F6rg Sommer <joerg.sommer@navimatix.de>
> >=20
> > Fixes: bee29dc822c611 ("rpcbind: Remove IPv6 listener, if ipv6 not in D=
ISTRO_FEATURES")
> > Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> > =A0meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb | 3 ++-
> > =A01 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb b/meta/reci=
pes-extended/rpcbind/rpcbind_1.2.8.bb
> > index bd8ba1e88a..6604774c1f 100644
> > --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
> > +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
> > @@ -55,7 +55,8 @@ do_install:append () {
> > =A0	install -d ${D}${systemd_system_unitdir}/rpcbind.service.d
> > =A0	install -m 0644 ${UNPACKDIR}/rpcbind.systemd ${D}${systemd_system_u=
nitdir}/rpcbind.service.d/rpcbind.conf
> > =A0
> > -	if ! ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false',=
 d)}
> > +	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false'=
, d)} \
> > +		&& ! ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false'=
, d)}
> > =A0	then
> > =A0		sed -i '/^Listen.*=3D\[.*\]/s/^/# /' ${D}${systemd_system_unitdir}=
/*.socket
> > =A0	fi
>=20
> That can be simplified to:
>=20
> bb.utils.contains('DISTRO_FEATURES', 'systemd ipv6', 'true', 'false', d)

Actually, it is 'systemd ! ipv6'. I do not think this syntax is supported.

This pattern with true/false is used pretty often:

% for i in oe-core meta-openembedded; git -C $i grep "'true', 'false'" |wc =
-l
83
131

Is it worth to create a helper? Something like contains_tf?


Have a nice day, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--wwkr47bzzhpgt7j6
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
ATAcBgkqhkiG9w0BCQUxDxcNMjYwNjA5MDg0MDI4WjAvBgkqhkiG9w0BCQQxIgQg4487+7kv
5Ak3Pok+l8Kht9qldNUVyxrOpJrHwI+2g7EwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBALzHWm5iHvGf
a0eWJz0/Gft2J3de5C71LOJ+Db3VN3nBIvI6YyTL3gs0CBHADENB/Or7cEip2Bbqjq7oTDMS
1d2Jg5K0bdKY2kQsclSeCYm/nuIuxpB56Bdvpl+/VJ8tV0IrOG3VO34vLvoZokkGE4QVW+8R
seuOZd3qld3eoQ5HN3cE5zt9HsOX0q7qhR8UzdPjiPFqcc7j3I1myoeGWg20asPi2GpkDqe5
MrAv3GgaJBMgQK61h+4IEf+iEUJjNr/H0WIF6XRMNHpjp9V6qtzvsLy1S86rQigovBMRt4kz
im59XU/XOPF3uldTYDljXSa8jGB93xDi0JeD3AD8X6w=

--wwkr47bzzhpgt7j6--

