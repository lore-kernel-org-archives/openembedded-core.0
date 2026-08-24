Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022FEC5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 09:53:22 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.86])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13239.1787565198506458322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 02:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=6Lg4ke8Q;
 spf=pass (domain: navimatix.de, ip: 52.101.65.86, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQarF9avDJ+qrgdz880tVENZ+WkRxgYTZVCcXco29gEBp4SvP6p/hdIhko3UiVtTPfIUdI23SdOgIzZypNDDTxMw+5AgkVEj9ZlCKiBbWM2VOFLjG10MwrBjy3P5LEChYZrZj1XIQXRgYnRcuWJsyqKyekAYP/Zso0j76gsEml9VrbZMn8h7Xapira+ZAIRqrX1DH4bwxeyBYdzmuVP8e87vMtbelonjmRsa/90D+5vC/7uWK/SYH8h1BEfeS2T7XfWMRry+BlFLBOYWFSazZCtxJ4J3cq/W8y7wbZKoQWs1OBeARRQVsDAMpiBfuc2XHXEA0euPfGs/TY3UaCbF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArjdZVEo+9XLNNm0njRo0Dq4eQ+/keKgvCTgycda5sY=;
 b=G2u1VRbN7/BXUWgrZIhd9UHMzMGqj8lfDz/nHc2BR8D13irvu8QDDiBkNUb0FxTw9C2pvPkAanVfzMXTYzVVn5GH0urnTCOU/6Uk9Tn/3h2+Fq6Gm3qRYOWIA3BiZF7rTteUldtGJ5+1YIr7oanDbPvmu+On1zBthsCAYcfbWmKPRkQ9PA/L9LJwmzW8vseUrXDPKtb4z7vKY+KrenrSsuYc1u8GZEpAljGzQbVSL1XFySTsuRGVCut4bvjJ65eCsPnJRNZoZe0sqTgo7XykWlCAHalr01EXaKgcuPtdniPxuitJjqtEjd1ph9fMtfLmj61VGt9yInRqVaSRWtQc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArjdZVEo+9XLNNm0njRo0Dq4eQ+/keKgvCTgycda5sY=;
 b=6Lg4ke8QaiboUW/LPph7Y7SmbdhALzYryS1pdwps+fNv1bLq/eQ/OQTk7UNz5sraOGLQWT/D+ErGV8D3cbtTAir4qmbl0Qrg5AccGDOlVthRBJ/sPvtcrw58vlqU3wh29tqHqbx182xTiTNeeCtIYMaejtw++zreykSZYpJrHXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA4PR01MB8900.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2a3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:53:13 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%6])
 with mapi id 15.21.0339.012; Mon, 24 Aug 2026 09:53:13 +0000
Date: Mon, 24 Aug 2026 11:53:11 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, ross.burton@arm.com, rs@ti.com
Subject: Re: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to merge
 bin+sbin
Message-ID: <aowSZF6aysT2amaR@navimatix.de>
References: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de>
 <aolV39x9UzHwcTrZ@navimatix.de>
 <DKVGRWKPI3K2.1PBICS35XGJYK@bootlin.com>
 <aoms3iLkFaLTp8E7@navimatix.de>
 <DKWYNZVX7C32.11QQ5O5ZO8J68@bootlin.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="74s7szgycyojzgnn"
Content-Disposition: inline
In-Reply-To: <DKWYNZVX7C32.11QQ5O5ZO8J68@bootlin.com>
X-ClientProxiedBy: BE1P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::8) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA4PR01MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c52337-4cab-47af-a0c7-08df01c5833a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	FDqigo2d0WyI1WGE92qAf1XHjUFvg/FFsUM1CtK+kQwFSdRtfeILabUpP0gvJ8lgMBFgXG+lgV4I62hXl7sUMyQTvaC2WCcY9fSC7prOQWp0X+GNp/zwWP14idUoppr3tFo109dgTJ5dtBvClsHLHP+nwbMKYJXh8zhOZkrPFLMGU6GbDGnCo3NMYBb0y9LVoUImLJIvHukSaInzdpJBMePf6MT2SRs1e575xLdCorpvQ5nC9c5Pz7lB3Q7CuSOtwPEYYpdgi2yk7OnAkNFdtXNNXcu/+Yr0hrDYNYFI6J7VsRbWBAgsNoHPHyzZAM9EzepfNV0WPmG5f+lJ6OL9NWQwduinPGBUKBkrWvW05nWwoEMIvrCcubRxgJXzUDLYY2RaApiBUyFIYvQdYzI1zba379WZRTfqnni7UeEuhxDf9633hJpUI9epA/M9/1HmtaWN67Gy0VfcpA/w0KzMu+yLfM4cka4DhwpyR5/KeYW7GroBkdlhs/gaW9obDnngt1+SSPavdKs0VrhjhelIjPialRI4XbYKlWe/uhHJIPCbPSXpqLlMIvzzmEtSW+u4aJTgYlbP/JUfxpcJ6kXuSzBF3uxyHLsHILXypnLempg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?TG1dejT+1xB0n+fJKG0gHGyHcTdjXul7/3G+wYRvtxgRq/RHcFne7AW1+v?=
 =?iso-8859-1?Q?Mc2Vu1sd730rygm2z4C3d3IYNMhWihP7CVO3S/Tp/hgahrG/RfJdQ7sdsh?=
 =?iso-8859-1?Q?Ezc501kzi4qoIektDz1knwN8wYuhBzdkFrgYwEcpz0uFYiyMbeRUovSxbU?=
 =?iso-8859-1?Q?+tUIAvHzyqgCKGZt0Cjsy0brcXkUCCfUgIZSOOMD13X4L6WqLwLIDt5YbX?=
 =?iso-8859-1?Q?L78eMojX5C4bN4K2zkrbO6mNiB6dFi3a340wQIvsyJpvQDmcwswxN6PwAd?=
 =?iso-8859-1?Q?T5VXuJCTyHCWQWORfGd2scBGc+aO0iP7AWL78pk0iZ1mg3g18In76OrN4s?=
 =?iso-8859-1?Q?y4v3wPzQNXu/ghqC/cqNQDoZYucrGKTFCtSNvqXovc2+vIenhseIGHFGBP?=
 =?iso-8859-1?Q?Oj9Z9uV8HmOfOTgBmKxevBo5xhVnLa0QSZandr4l6RQWnOICCFCHGQtqhI?=
 =?iso-8859-1?Q?EH4qtawIs0Dy/8Eez/MxazvxIP0IUR+8ZHKhbabuIIqYB80bJ04zqhDpdI?=
 =?iso-8859-1?Q?i0f0Eybl1aiv5w1XdMT4pum7s5pab+337Oa627vCdBQdV5Qz7tFV+IJ/sE?=
 =?iso-8859-1?Q?vU9Df7Pg8kB8rtiHDW9HKXjx2lIZxsV1vT2iAKrLLtnDyN1gQQB5gTQKpd?=
 =?iso-8859-1?Q?QBPj7EPzB3QhZKQRX5M4jrspIcqJwzhiWzN6uCJMzjj4o8IYO4ykGeTzzO?=
 =?iso-8859-1?Q?oCqGWAPVjOCpy9yOaHjHWgqHVHCkgOD5aCW3WpxkAz5wXfUGKvy0siwIQD?=
 =?iso-8859-1?Q?kHLftKRLV/z3dQqj6w0SYZKTu2P5P55SdF+ptU6R54s66rEeFOpSH+x8u2?=
 =?iso-8859-1?Q?5BYF3pvqAJleYqDRZagRX1ULlY1cndNbEfQROe5/NukbRPk7ANu8kVJGmx?=
 =?iso-8859-1?Q?CyHTT02fvmNnkOtvD+ERuaru+VKe0w16/GqUylW3eUjfyDaEnZOSN3QlJc?=
 =?iso-8859-1?Q?48Sq9fuLvWdrJCPAlJ2cukDWN2sfTLnByGh3AoJ3Iiip46DcRX0uB+k06D?=
 =?iso-8859-1?Q?rqkGi58TER/M05mR7011DPlRuZNI7zDIZkQ3uETX66uE65qZusoLqkR/D+?=
 =?iso-8859-1?Q?I/GzKX8L6st7Df9vvMeZteW94PRuC23OygWoJVNW3zZl4Iq5nfmECIFunN?=
 =?iso-8859-1?Q?xTsx7i7MXvm1C760PFrdjDdFZ0+0nPgr27jGbXXih0PQwD5sSZYBvyOvC9?=
 =?iso-8859-1?Q?YwV5aqRi6GjERjc8aXicEpthG5chPwYEo9HW3wHl4uLdG1fJ17n4ii22+7?=
 =?iso-8859-1?Q?QvMERnggmZpcQPikNLk6TA+J1LtCiQZuLbWCE9eZHmSYVCpUhOX8NddRKK?=
 =?iso-8859-1?Q?xPYF/fyJOcK36f/3w7whfCyKenbIOY11aCKeUXvC1Milvb3nxohIz1bzoy?=
 =?iso-8859-1?Q?+i2b45rShC3HpXFpPJFR/PF4zOiT1Sa/LqdoHy+0G/uvnjRqF13zSre4DH?=
 =?iso-8859-1?Q?ek2QXNA6PA7yo6mCGIrhr4/pDmIJoojakkkFU5iRkwhpP900GwV1wDzE+O?=
 =?iso-8859-1?Q?u02lWm2gW+5hOId5Dvaz8MTa5DGB0pJd/tOeM8GvJGcHaZflLBF1aXT0CW?=
 =?iso-8859-1?Q?mRMPCq7/uwLCwB9Bt5nh6IyxXFOVUJJlz5xruKtVZgLvLUG+YzkFxQTalf?=
 =?iso-8859-1?Q?LpH9xp9K7SSmYeqPgf/QVxs74dExAM7RLC5W4s4oa/gz6l/YfLnnqF6Fgb?=
 =?iso-8859-1?Q?3mzBSm309RradcHsgfQm94PcpixLOtMjdjR6iSjL99ddKLBpP1ypVVj9au?=
 =?iso-8859-1?Q?LT7DTDMlJgaVboWAR7vo6KO6fTTC+Egij57jJDgr5SWV5jzPsJoMsfLPCf?=
 =?iso-8859-1?Q?OXUhSeA2EpNZtG8WoWGJ7OFsx7QeBLg=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c52337-4cab-47af-a0c7-08df01c5833a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:53:13.3237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGAG0r7lyKFoM/EvoAu2dadC/fCntwukWHItdG5jiNPpSItbPmw0cI+c6qHYFfUInlXZaHn5jBZsm0EUwjp5Xo5UBEnKRfznJQ7NCYMgCJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB8900
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244078

--74s7szgycyojzgnn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to merge
 bin+sbin
MIME-Version: 1.0

Mathieu Dubois-Briand schrieb am Mo 24. Aug, 08:30 (+0200):
> On Sat Aug 22, 2026 at 4:09 PM CEST, J=F6rg Sommer wrote:
> > Mathieu Dubois-Briand schrieb am Sa 22. Aug, 14:16 (+0200):
> >> On Sat Aug 22, 2026 at 9:56 AM CEST, J=F6rg Sommer wrote:
> >> > J=F6rg Sommer schrieb am Fr 24. Jul, 11:00 (+0200):
> >> >> From: Randolph Sapp <rs@ti.com>
> >> >>=20
> >> >> The split of bin and sbin became more artificial over time, and it =
is no
> >> >> longer clear why programmes goes into the one or the other director=
y; e.g.
> >> >> forever normal users have used sendmail in /usr/sbin, and fdisk and=
 mkfs
> >> >> learned to operate on files to create images long ago.
> >> >
> >> > Gentle ping. What's the state of this?
> >> >
> >>=20
> >> Hi J=F6rg,
> >>=20
> >> Previous builds showed some errors. Should it have evolve since that?
> >
> > Yes, I think so. The bootchart2 errors were addressed by 2bf18f9908, an=
d the
> > tcf-agent by 443f8c62ad.
>=20
> Hi J=F6rg,
>=20
> It looks like this is still failing, at least with alt distro:
>=20
> ERROR: systemd-1_261.2-r0 do_package: QA Issue: systemd: Files/directorie=
s were installed but not shipped in any package:
>   /usr/sbin
>   /usr/sbin/poweroff
>   /usr/sbin/mount.ddi
>   /usr/sbin/init
>   /usr/sbin/resolvconf
>   /usr/sbin/mount.storage
>   /usr/sbin/halt
>   /usr/sbin/mount.mstack
>   /usr/sbin/reboot
>   /usr/sbin/shutdown
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
> systemd: 10 installed and not shipped files. [installed-vs-shipped]
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/4407
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/4430
>=20
> Can you have a look at the issue?

Thank you Mathieu for your testing. I built systemd 261.2 with poky-altcfg
and had no errors. Can I find your branch mathieu/master-next somewhere?


Regards, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--74s7szgycyojzgnn
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
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDgyNDA5NTMxMFowLwYJKoZIhvcNAQkE
MSIEIPKgpCYqdrquDska8DRlC2ZaVv5FuYfpOTQJR5SEfg1zMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQCEgGsduzZYwkgjYyvihI2h/JmiFcNNIqO7dmhwg3PfN6/qqfESvIQQ4csUYsiRnMe4oG4z
5sOQm1wi0wWhXnBzcXyJUugN7aY9nXAyveQFvpaw49ao3AEHKD4C3wt8mrl9m8moWmrJZhiU
+9NiThom9Ntc856NG2i4f0NNp6nS1mhQCnLyPwC8hlKBmTVHkUtrFXeJsrPrIX8zQbJqK5wh
JyB8fRnuLmwMOZ608be/qqTwmmGbuYikj3ruJj4PVpRgVRl+peQ06Xbe+ggZBYXp2+IW5LxZ
YU0CGBkth8Qv6ftHJujaU9EZ+l1t66gBKSMbNC7FREGaJCVRI4LrahS+

--74s7szgycyojzgnn--

