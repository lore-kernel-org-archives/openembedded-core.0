Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA44C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 16:16:08 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20278.1785860162958714959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 09:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=7DWNK78t;
 spf=pass (domain: navimatix.de, ip: 52.101.84.82, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkP9KTZS3vXsgY+Da4VGLQa5/LyXGv+UL9wAXPEdXOOxqRd99x0HVkFgIn+1rv1m6GrymIpxa0ceNzLLOmnOr3sQBLL3+zt/m902rVCRcVcK5mD+XstdYCDKY5sLxgdqYB+jfPeHNWhvy1uRxGgYT8LstAg8N5f/onBwByq7gk533T737rrwhU5dr2D1XcElHFOk1HpSdbJB+Ka8urApUbDKZMVAPB+wToPWadqQ7u6qYfXb0w4mug8/z1zkboh/autI+Cf114xmnU/H87da4fiwCSTPVQzlOMK3DtXmHUL1YULE9bGnfRikAo3bN31c2KVVX5JnkMOKxFT5zwjo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAOmVtLrF4eBgLpsv/+Bfbv5qQVNT5VKiUCYsGRICs0=;
 b=ZegTTS17Kt0D9b8xqGsYilUwx02VrJxlrMCIenfX2bW0WrbAaB49jDJveGnJTJhKAYLNBSDTyuH5nx6Y7NuFsrAQRPC/gj/qLR57tALOMyhH7goETBWWxfQAmMKWCGLKR96pFvGZWz+LYdcAkUvoqdBkBzSu033RA/0ZEjYBSCALEbJ7xjZv52ey0m6fOCJ3/4zop4A5DkyU38yT7iYwk+MRWmZsEoZWTrFpjPuti97NDH1mM3VbzNo18ZccoxeIqUWsEmHaLZHYFiQ/RMMD1KZtUIPqfgwT20Gcje6o6WkL16z2mRRatWQhrRhkcT2e7srAssSBsyvkhF9BeANmOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAOmVtLrF4eBgLpsv/+Bfbv5qQVNT5VKiUCYsGRICs0=;
 b=7DWNK78tdQncKLgRNxbIHfBCgY5+ENrV52K3krjWk48Ig1M00t2EBRsamGIipevF0nARdJPkt7D9uOcDNoxmM3SZbXrfajFBrQBOZj+2xW8CE3lnwv1+RMA6LG2l7/jnLClnSzrxqVgQWAKjvzacJp0PVwqBKHlQOJlbvW05xtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA1PR01MB12380.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:4f8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:15:57 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%6])
 with mapi id 15.21.0292.013; Tue, 4 Aug 2026 16:15:57 +0000
Date: Tue, 4 Aug 2026 18:15:54 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] rpm: Enable PACKAGECONFIG[acl audit selinux] by
 DISTRO_FEATURES
Message-ID: <anINzsmQ7QmHNKrB@navimatix.de>
References: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
 <831673f23f130b01228e0252fbb750b459062fcb.1784039919.git.joerg.sommer@navimatix.de>
 <nvgg2pt3ksylrazgnihfdkqnfaht7bn25mj5tdfqtw5l6v2bbu@ssha5wbn5fui>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="ajecrklbde2ykglm"
Content-Disposition: inline
In-Reply-To: <nvgg2pt3ksylrazgnihfdkqnfaht7bn25mj5tdfqtw5l6v2bbu@ssha5wbn5fui>
X-ClientProxiedBy: BE1P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::13) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA1PR01MB12380:EE_
X-MS-Office365-Filtering-Correlation-Id: 5150b6f6-1cb0-4a1a-b14d-08def243aa6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|6133799003|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	12TJKUv1fLYHnt6hSjpGXkdgWJJpMirEE0pm2ufjWfojzKnVjmXfHa0arHwVEiolmMGs2u63WQilMl423ZMt0l7VaXK6S0GqX5bqOO6JJL8u6AjhVUXUCAVodQmxbxHUfIPj5pBFpMquSCV4YPwwS/Z+3BmmCYnh/xR6l1BQ6V0+4XZghnfy5O2GyR6qA9qEjh1Vz3KrSQ/0jt9Sk5ztMUg/Mqge9jEocj0fCqFdT36i/quUKVumcBD/uq8tPzIWPd/RJmwbUIqIPdY0Sxz+wupFJFMIh6lZh3Yhz2KwRs08RCnWCcsFjbKZ8Rmb2KX16Fgf834JNX1CY8nEJy68xdti3FsfVib86Eqk/fdwXjXCeuPRNfX76U7N0lf436heMxBHbnK0pFIuZF6ym+2ZDwd5Pvi2ezhPNQ35sM80OFVsTbdA6Hw3HeODTs4ue06vByJ58Te9mMy5uLvXk50YzUV/uKdiIb+R/axuhBD9RRKvDL+4rBG+9F2OgaCpsfbcDl9z7vT7TwiucxJE+OKzIqCEZk2Jfic86ex1btptae4NPuebGD2AP/3k8bD+JtQ1JF++DxfMgnBetmdkvC1oQqe3TZ0WECnJlBCVYWWxsTg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?PPEoJeXOkr3uFSsu6xZ+K3U4SYtTCCGcTh5v3FnTuGUfvI4w983m5iVG8t?=
 =?iso-8859-1?Q?79KKh/QhA6qLKU4hmkDY4fiVjBSc5aZLMmbuHnN/9nmK+zwmQ6/G0NgwB2?=
 =?iso-8859-1?Q?TCMtFQX0J6iq7X8G8QWm2R5HbNdQKHYpStatS1RcEXWAMlfpTDqq1qjhfN?=
 =?iso-8859-1?Q?UQy7FM7S/EPAiuSYHUEZVe+tafS071IFrQKVD16RvX4ENTjVMOJN5ykpyJ?=
 =?iso-8859-1?Q?nRLaY7gmCz1Ja+SuZqzMgAyv4uFdCepWwXwdX1/BGBnvIOryp3324EWHeC?=
 =?iso-8859-1?Q?bCYUbpJuqwcJX3ggfO6R11l5JZwx1YJbI//sGF3l6nlg0MmQPvWbFN1X2X?=
 =?iso-8859-1?Q?VbF5nd1RBiq5iojSA4rKD5UER/6EehQghpvp9KiEr95rIQjyyfTtdhzXY2?=
 =?iso-8859-1?Q?s4qz8icaIKsHT0FnwTaFYDPoFdHokfnJqx98E5C6qgJrOdZfxuUD1lYswB?=
 =?iso-8859-1?Q?0eH/WuJdg0vHldmjRrc2ibYWjCFq4msPSdcRmY8Xw5Cl/s7+yxcUIy/Ziz?=
 =?iso-8859-1?Q?wwIuA5TgV6t8uezfA8J7r7LM/xROh+L/Y8kNFRT4hzZCwzBeHU78Im9uEz?=
 =?iso-8859-1?Q?TGi27C82dz/z1ueN65uQpABmAKAlRiZP4a+aKkX4petf+9apVl2BmM/8J6?=
 =?iso-8859-1?Q?QEM5xomzQxht/ZewLFo84sVkUdMNh0jWyDsmEvB22rleRthQUODTnfZaRB?=
 =?iso-8859-1?Q?wNaQIAJzd0Mq4OpdWNIglkFhp79MUd8cDRx5EVBsQT9NPBpYorpDGkZJTb?=
 =?iso-8859-1?Q?2IPoXx7199V0YAYrtmU1BynkvBCkoczSzHwd4nRMU7GQYL6Rb2x3NgMK0Q?=
 =?iso-8859-1?Q?fknkn6bQ1WcJTPB1tHhRsUloZeL6vM0YVin4X7mf/r3ZWtBWM/CEa0JfH3?=
 =?iso-8859-1?Q?pcP+N6dCn7D5bnJwWqyjoBLOtFxNsBowIjPxqBRMD3ujwz+mDpPnvI5Pql?=
 =?iso-8859-1?Q?acLveiKOCZkQSnEiwrObwb/2klERLO9DzLtMr76AJbXYj3vWdPXkjDsErz?=
 =?iso-8859-1?Q?nQS1rtoK98se9PEXes+z+W54u3XKtD3hn41T8gBTZcm6XAYsO1UbI+SwxP?=
 =?iso-8859-1?Q?flqra3I2O4racj35LVOjst2Fe/K+vve0ymyFibAD9ut8jXEjmniMbqt/cJ?=
 =?iso-8859-1?Q?WqJA+yMZLsWL2SqpXFrC8NTg6RDdEdlZjlhanMWjEtduUwYePGu4jCXNrX?=
 =?iso-8859-1?Q?wittAhxIH73m0IkhVaUv0YqngUtVvgbd2LXp0uBrtcFsZBAUj2tBNGoUbF?=
 =?iso-8859-1?Q?kkzJKKe9jVen9kGMThbwlPydViebiEX8TjwrlDs7YjMn8KbKWHV5glQtks?=
 =?iso-8859-1?Q?EpaHoUkwFIYPQMSKcVn0ig4+cXMWInYpuxMpMu745yxkyA1rPmLv1CZrHT?=
 =?iso-8859-1?Q?mpS7CR9dL9yU+ZrviVCNvkRGVKaepyHKQGA0or6g/z19xAgRkR1QHRu3kK?=
 =?iso-8859-1?Q?SRkkCRlsQOqgVtWflpeFRLV/Wb/Y6Pys1PSt2eDzj2+4B8AXoZ8loDuWHT?=
 =?iso-8859-1?Q?Zetiof0H2zcbVVoA5VISA/HteQpsRRlEspp4JJ5iwUMRPcc80VXD1VWXnJ?=
 =?iso-8859-1?Q?JFG+1xS4/jAc4B79gbyIRpcQgBsKoRJIHMQTWn0zpbvkwsiz+YBR3rj61d?=
 =?iso-8859-1?Q?gic171MIBJvgXQO+M9FLB4gqIUHt7uVZzg4JAsw+uh1jiKkeiRyYQVvndy?=
 =?iso-8859-1?Q?mhFRnNmLXBVPPgDS2SVp7SREIp09C/7nNQmbIk42WGtg2t+z4KoqTOkCiB?=
 =?iso-8859-1?Q?hYEZg/kGMlZ0h2eQ1Ic9di3A8GvUjlMqDF5OXJZz51jCeGl7j38rl5er5T?=
 =?iso-8859-1?Q?FKk1PCw8Yx7xrkZ4XwoXMJquusD31VY=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5150b6f6-1cb0-4a1a-b14d-08def243aa6c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:15:57.0902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxNXCGqsQpuHacbw8fEBgr6P8I3i9tuobzwrLo5uEczPlC47lmkxyz1JK/mKGNL8/20iF9siwISFqDV3bN3Sivm8j67o45l9rXC1LnXSxvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR01MB12380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 16:16:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242779

--ajecrklbde2ykglm
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/6] rpm: Enable PACKAGECONFIG[acl audit selinux] by
 DISTRO_FEATURES
MIME-Version: 1.0

Dmitry Baryshkov schrieb am Di 04. Aug, 15:24 (+0300):
> On Tue, Jul 14, 2026 at 04:41:39PM +0200, J=F6rg Sommer wrote:
> > From: J=F6rg Sommer <joerg.sommer@navimatix.de>
> >
> > Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> >  meta/recipes-devtools/rpm/rpm_4.20.1.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-dev=
tools/rpm/rpm_4.20.1.bb
> > index ba967ec1fa..17e75c3e14 100644
> > --- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
> > +++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
> > @@ -64,7 +64,10 @@ BBCLASSEXTEND =3D "native nativesdk"
> >  # https://github.com/llvm/llvm-project/issues/82541
> >  TOOLCHAIN =3D "gcc"
> >
> > -PACKAGECONFIG ??=3D "archive"
> > +PACKAGECONFIG ??=3D "\
> > +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit selinux', d)} \
>=20
> This broke SDK builds for SELinux-enabled distros since nativesdk-rpm
> depends on nativesdk-libselinux, but it is not there by default. [1]
> should fix the issue, if it gets accepted.
>=20
> [1] https://lore.kernel.org/r/20260804114749.625810-1-dmitry.baryshkov@os=
s.qualcomm.com/
>=20
> Otherwise, we'd need to drop this patch.

Or we could drop only selinux from the list. But this leaves the question
what someone should do when she enables rpm with selinux and wants an SDK.
So, hopfully your patch gets accepted.


Best regards, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--ajecrklbde2ykglm
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
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDgwNDE2MTU1M1owLwYJKoZIhvcNAQkE
MSIEIDEzwLViVHax7WsTcASS0o09FSxXKzOcJ0VWRIFFwd4UMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQA5gNFxkY2yynkMRKCJLbpyaCNPaFZp3ZHXFXwWXDCGst4ZgfZTVgDWq0z/BasKLJJcyfjY
gNiO3swGJyfnLfnqX5cAFs9LfMSO64vBRRSXaZmHF1/QMgf6waPwmOE18ad+cEFbZwq2nlul
Z3iGPbz3YYOYTDjQ9uHsjJP/Z1k1vfDTYiJf45VeQzxWWkBa0irwyUCRabkDpUtohqE4YweT
x5wBR2/lamrpRLakMo7wm+RLNjFP4HfeV+SZ5UlXFEroElOrtqY5YxHp5p4lAadi+ESraaPG
r2NoHFX0TacB04dAdqNFmTCjOgOzaElZNrff2mMvwRcJsqPPEBf35t5K

--ajecrklbde2ykglm--

