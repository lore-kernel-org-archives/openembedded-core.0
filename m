Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E15C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:06:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7575.1787731594429831850
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=hVCi5VAw;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 40.107.159.7, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3jnGKPRe+I4EYABfW+rRgNL2iuEAie6a6IAJjjO9EwLrTiofzH3vBPcQGtFwK9/PCks2R/b/hkdkI0po//R4f2EbZMLV61QM4QiQd7fzWhJ03a/RZgC2Md2UeR3oQZwcOntAmXF7jVPA03SRAXcUxNbWf6REV2eTlQwsV/91HPayK6Mna/RfF2uWRmxlFbw0gu9E4idmXLA4oeTMddeze6GSFpnyzvWMncOpj58HapdLJ9Gt9O8PiqAOGaeg++apEe7akPKSENJtq2L/fMVpVvow4a8GW7nogEq2gry4p9FgJOQDUUYnjkC2lEymkmYEoCyxNRaU/BjdjDF3S+uFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCOjUJOsOJzhH0omHFXBmLsFdzDWhFXOKPwnnrtEI2I=;
 b=ccUs1BGjXjqmlZ7Q8kb56G/V+uJPiB4La4zrvA63pNbYeifRUB/gdUG3uT4KqpvZjPiM6iOJLUVaNp4TbejCJTQ14SDKp8V3nW7SMJCFrca7iltfnUB5RotIwy59+ecRZBmnJ800kvPGLwExy3FJH81/qbXUxTRGb+tVp77fqCYC8D7e200OccJ4uVk7CfjN56EUr+5D8wRSW37pkywssKg8/wCi4b1TA5sxZoiLUIKq6E7nWROmg6hxfC+0/0G5T6c/j2bAcVrVM+ImxvUd6lxd/Na0N4PlFGE3C/E17usc8R8Nbyk4q+07FSDYs5WaXxkMtvvHXwt2gTaDWR8m7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCOjUJOsOJzhH0omHFXBmLsFdzDWhFXOKPwnnrtEI2I=;
 b=hVCi5VAwEhkEJ0PhiMrdMJqMNe5EErDJ8yihDsatG/hYwOf0k3DV3nX+ib9txUhUh6sZmBUBfDJ13JUeA0cBxwHL4+bn4jUtwVCBxSRPKbZQe7hGvXgoVTer9NxekOqTUIjP+gzajpiTGLXh/QGWTaLloqQAfKViDZs/I5CraaNX2KJ0C/oWAT1l5m3odXi6kVuCmXCW2vnNF1gfvbI/EmdSJEnlxi2vzqanNHurnJ+E72zV4kmFF6rIZSqY0nGFiHW9ymRzu8bNY1aD91aycs1efOI7mMWCJdDeT5d3wt0ZlzX39pC+ahSpQvSgjBvkw6CkVOH4Kc0JHGdoRjwpWw==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by DBAPR07MB6662.eurprd07.prod.outlook.com
 (2603:10a6:10:180::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 08:06:30 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 08:06:30 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [scarthgap][PATCH 1/2] gnutls: fix CVE-2026-42010
Thread-Topic: [scarthgap][PATCH 1/2] gnutls: fix CVE-2026-42010
Thread-Index: AQHdNTHNiCLsjsiyzEa/V6VwOnDrEQ==
Date: Wed, 26 Aug 2026 08:06:30 +0000
Message-ID: <20260826080602.17100-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|DBAPR07MB6662:EE_
x-ms-office365-filtering-correlation-id: a5847f06-9a94-44a4-b09c-08df0348ef8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|13003099007|38070700021|10067099003|11063799006|56012099006|25016099003|29003799003|12006099003|18002099003;
x-microsoft-antispam-message-info: 
 4CRrQTjHuv5BKpGMG15cPNRTL3spwZ1q0UFvEO3J4gHLWw8cFyEbz/RKCFkt+e8C5vmhG+hyjuoiJkXFWH/UydsNjVTSrz82c32rj1Xxr3wWgE0eyW/mjGEWpVFomO6AuVLIWB2pTEi738KgesD+L/ARxeJ+Jx4/NtqV/jFCngp2sXrXjJ3J/abcNnfhTzLHOdQ96in5gYdcjBl0eTvUySz6GbP+1Voyo1FPo7uWGHS5lR2z13sQmDkNCQT9mNzlq2As+8ndf5vpuInhwXhOkxTcI11cFJ77Fj0FFlitvmd+YWe4ND1sr56J9TmmG/h8JYVU5My6qGJswcaAgKJiN/YO3HEOD1ZKOVWNxhrw/0w+iALo6W5Sv6HDVRBufrVZbAyjSCxMG0Z7z1FkEIJ9St83zlA7tFmSpbe3keJul1WAn0NuBp3Ovahv2jv7gJrdQPXKF/b1lrPVIQPHLsXLwJi8lHg5W8USGDnGkodtEt9s66pY6pS2dg8oCMSudDTrZ2yrTUJKQlCjxrVv6Hgqz8z/OeqcnojPZQ6j4UhJgzC50x6QVnvorSimPfEbul6CxP7jnS7dT6lzrrXQZd8rdz460T0ZvxKTJBST4QDR/BEHFYDPqqB0PfSBMT/kCrflhpNH72Z4B/dpL8E52RxKf6Y1Hve+MR+acYrhFmTocnKmhf5QxsW1Kwc51HY4Myy9EJbfoI9hrc05VdqJaoJSYD9BUH+FANF+fR5wNptg/Ss=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(13003099007)(38070700021)(10067099003)(11063799006)(56012099006)(25016099003)(29003799003)(12006099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?KNzjJtuh/SWjbo/MxSl0ExvrjEuaLRAzMh+oWNhwlmulwBSCS83gw9UlM2?=
 =?iso-8859-1?Q?OSg6cBfuQIcJUVWT7+VaiF1+Z79KzMdCCPgGwloZtXcc/7gNoisL4Bxux9?=
 =?iso-8859-1?Q?Zjiqpe0aeoOA17MdMp4YNQNtgwbg4CMGjju8dQImQm7Q4okXOSnbSzfwEL?=
 =?iso-8859-1?Q?n6ZPujDv44ta6Scgucn2mEJnc52Zwe9Tg5YsunvH/w5ZkAu/2ehI4cIZWW?=
 =?iso-8859-1?Q?ZSyo4TR+oVzGwEJ/90+D1pxZtBa+t0gnZ1ziGNi/g+K+lLEa+ky7uAXsLt?=
 =?iso-8859-1?Q?mIjlJCappc0JlV/izx/0hBwqW/ZdynJAjO+LATiAh9WVeL4evv/xgMjtJZ?=
 =?iso-8859-1?Q?YmkC5EIhUlhu1Tc0MeTzfIAPm8riRZd5VleMMYq0dY5/iZr7QPUsCaSTnv?=
 =?iso-8859-1?Q?gZtyOT4loGgMz/Z02TiuJoHOQaUVcDf4b8BnLhBC2x0beaGejaGqpZd1fE?=
 =?iso-8859-1?Q?KPT4fn7TcGrt97iztJ8Jw4lurGq8//GRKDeM3JZBt+rukCedo9dyazjfzy?=
 =?iso-8859-1?Q?YG+erEsnyLZMZCHFhcw20FZqoiFy++HIrwxoCKHXb+gWXRyfqilqz2mRby?=
 =?iso-8859-1?Q?DjtRHTyKlMtCWjKherzT7wSwgsfS/Pd7NcJoWD81VGVn9YEXvqO8dMXGXi?=
 =?iso-8859-1?Q?KMoxZGPbZOlgWX4gSV4JtHoshPKGiIQTOjJTXBn0lEhNvskSstMhRDrkwM?=
 =?iso-8859-1?Q?MzDOyKampnuW9YbOE3WRGCdcXNsLgBtviDkIVwt1K9yi7gzpRvwDHZzT3V?=
 =?iso-8859-1?Q?gaeUdzG0G1iXiHVbnDF93mPaFpzrW5+tnSLWmbltWyJBy5yrqgzuTOOTDK?=
 =?iso-8859-1?Q?PPehfVBITtYH2BJYj9z8WvxpBxuUwrL2tdQruY86fl2i6j+HG8I561SNqL?=
 =?iso-8859-1?Q?rFD8MJa4iojWwkehO+FN0+08mwi5O/sevexXSQhNH3fCGt+q5PbrIWDcHw?=
 =?iso-8859-1?Q?kg+UCIsmXQUceOHZpWNHdX5o/K3xBQNAyo0wBSSmXc6t/tGa4goptrXQ7K?=
 =?iso-8859-1?Q?g2ruUyTIUKDdxABHr635h4EK8eCpJxsU/RjsbyX+kT3zdpNS1WTvg2YcwL?=
 =?iso-8859-1?Q?dXFZH0s8nxtB0Mw1bh3DrPidS2mSpi9TswM2IeeVMsxRrftAt6nYPx5KWl?=
 =?iso-8859-1?Q?bJ8bapP9Pr7xnnYUAptE/3qkQwPZ3aRFCepYe/wzyKNXLYt/OF3QkttRex?=
 =?iso-8859-1?Q?bCbMxBWbb4h6/7na8c6PHsOvqeZM+F8yVvcfqTGL5QmZYC/pa1taWu6NkC?=
 =?iso-8859-1?Q?asoxxHWhK2sly+Uizqn0af+gBklcqnTxxdA2T/f4H3VR2gr2Jx2FYgG5Yc?=
 =?iso-8859-1?Q?lv9A79ZouYHSD5rHTRA3Xnbmgi0bGG9oIqd+tEccUUEUwIWd+MyiMSVq90?=
 =?iso-8859-1?Q?NxsztGTT8qpX/43TaQC6n1RaK35k62LIrJP0Ej+z5Qf0sd1ZHdbEsUN2C1?=
 =?iso-8859-1?Q?9PjAV41/YbLAVqdbFvjCBP0Fzd4y7roSx/gKoKJxivurpGyDQCp+umRXHh?=
 =?iso-8859-1?Q?wfuc7L4RQRRCs38vZ7GYrus48wGgNjV0AEIKNFFOH14cz/XA0TNUgxB3jT?=
 =?iso-8859-1?Q?Br4IfN4ihUW8tfddiKMeJrR8R1B312L3NNniGxODMMZ0rPBBVWGvS9xTCg?=
 =?iso-8859-1?Q?vqUDC5a7ZBiEA4dYcq7tM35Mn05FPelRof1LirDVOqkVwlAoSyT3c5gMub?=
 =?iso-8859-1?Q?PwHzkEejF96IfeQbouBN/IBNgcfE2eZLdPgHxnKq7DIHML1vLW8vH9iQx9?=
 =?iso-8859-1?Q?W2tS5KRFxefJwGHqdV2fTMAdhQkhKlzhCfInD/dyNzlwQw0/8eMcrLB8Xl?=
 =?iso-8859-1?Q?vsn9pwOdqw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5847f06-9a94-44a4-b09c-08df0348ef8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 08:06:30.1082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXaSE1jOhE1GugMbS7a+Qc28HPx+kiaoJBwZ0+qzgTKLdPOOCLnGZk8k502i2mtlkIVpxbpAr2FAsOkk0tvoWhEHk3EgFS9cBPlOOi4l+AA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244325

Backport patch to fix CVE-2026-42010.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-42010=0A=
=0A=
Upstream fix:=0A=
  https://gitlab.com/gnutls/gnutls/-/commit/cb1833afd9b6309563211b1c0a7c291=
f52ca98d5=0A=
=0A=
Tested with ptest=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../gnutls/gnutls/CVE-2026-42010.patch        | 41 +++++++++++++++++++=0A=
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +=0A=
 2 files changed, 42 insertions(+)=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch=
=0A=
=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch b/meta=
/recipes-support/gnutls/gnutls/CVE-2026-42010.patch=0A=
new file mode 100644=0A=
index 0000000000..b94a32afff=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42010.patch=0A=
@@ -0,0 +1,41 @@=0A=
+From cb1833afd9b6309563211b1c0a7c291f52ca98d5 Mon Sep 17 00:00:00 2001=0A=
+From: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Date: Tue, 21 Apr 2026 19:26:10 +0200=0A=
+Subject: [PATCH] lib/auth/rsa_psk: fix binary PSK identity lookup=0A=
+=0A=
+A server looking up PSK username with a NUL-character in it=0A=
+was wrongfully matching username truncated at a NUL-character.=0A=
+Fix the check to compare up to the full username length.=0A=
+=0A=
+CVE: CVE-2026-42010=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/cb183=
3afd9b6309563211b1c0a7c291f52ca98d5]=0A=
+=0A=
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>=0A=
+Fixes: #1850=0A=
+Fixes: CVE-2026-42010=0A=
+Fixes: GNUTLS-SA-2026-04-29-4=0A=
+CVSS: 7.1 High CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:L/A:N=0A=
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Signed-off-by: Peter Marko <peter.marko@siemens.com>=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/auth/rsa_psk.c | 3 +--=0A=
+ 1 file changed, 1 insertion(+), 2 deletions(-)=0A=
+=0A=
+diff --git a/lib/auth/rsa_psk.c b/lib/auth/rsa_psk.c=0A=
+index cc92b4aa96..27caf18769 100644=0A=
+--- a/lib/auth/rsa_psk.c=0A=
++++ b/lib/auth/rsa_psk.c=0A=
+@@ -321,8 +321,7 @@ static int _gnutls_proc_rsa_psk_client_kx(gnutls_sessi=
on_t session,=0A=
+ 	 * filled in if the key is not found.=0A=
+ 	 */=0A=
+ 	ret =3D _gnutls_psk_pwd_find_entry(session, info->username,=0A=
+-					 strlen(info->username), &pwd_psk,=0A=
+-					 NULL);=0A=
++					 info->username_len, &pwd_psk, NULL);=0A=
+ 	if (ret < 0)=0A=
+ 		return gnutls_assert_val(ret);=0A=
+ =0A=
+-- =0A=
+GitLab=0A=
+=0A=
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.8.4.bb=0A=
index 676c5c6f94..eb66bfd19d 100644=0A=
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
@@ -46,6 +46,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar=0A=
            file://CVE-2026-42009_p1.patch \=0A=
            file://CVE-2026-42009_p2.patch \=0A=
            file://CVE-2026-3833.patch \=0A=
+           file://CVE-2026-42010.patch \=0A=
            "=0A=
 =0A=
 SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44c=
dfa7f36ebc3a9b"=0A=
-- =0A=
2.34.1=0A=
=0A=

