Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8344F1076371
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 05:39:32 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.135])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6283.1775021964507420644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 22:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=SvwNyHW6;
 spf=pass (domain: navimatix.de, ip: 52.101.72.135, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFVgdVRdUqcNxkXzqF5Ut50gQY3m9csen4Rt2UFN6/9wn6KTXSl/oKrpvUkQVKjk6MibJmyts+qRoiZnVZz2pdYoK0k9k4Km2QQZvW9lFUttJ22xixv2HHdhXovoy5pnaEvol9+qusMGdUboxOEGL6cPt1dL2ZZpolQRZw9kyLVVDABw2guaoA7zNe1dI6Cfl/NBZMF8qs6xNwGOszzd/C3Gq4dq5B+JuNAmHZ3lm2li5Q4ewNLIOeUnrUF4dYDTN1czQpf897HJUDPUxl8RpLTiG8Uoi7m5KedXZl5BAbZlhtXeBJLEHHDfD5S6I1AdNtaKWKHPdE6DOC2GoMo9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Br5PaYI34DVJI41wnLcqInnvfQNS1P8BhHoRy8dmX3U=;
 b=GBtNTbUdEzp7hQvleh8hjyelTi5kF6FT8HnO3gJTtpLN+YbsLPh+T0uFnx6dDIp9cCK1EK13r//7KOYEENvMQMaPMztSrhiSKB2Gr7Bf8/0ScEFEbDpmyH55TzTZ1Wq2S6EiR5Kg/gvUeXghVo0wnkDU/nMM/yiwrfai7bjIXr/whdCekWOAMHg27MRJ8Tn+pHhMXfqB0TOdiGVZXlfKQl0A9MZcrcivdyQuhQ4UzJIj3FcI2nPban44oBT2ZKXeywVOxLjZ2/NN36yKYVrCHhxiXeEQGRrkohA0YH4VPe1UVEvo3eOiKxTC2xU+wcLhkIMmRu3kKesSPJsJ2CwPTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Br5PaYI34DVJI41wnLcqInnvfQNS1P8BhHoRy8dmX3U=;
 b=SvwNyHW6HDHQEugPo9h9o0mGkN4nRwEjpj/56OQEOqBY5muCnaSrzi8DEbfaI1dWjdrQBZ4/d8KJud+jOAvQlwMGR6wvUmqwDhMnjVw0RH6zNrHYL3OSh4qr5+UZTfMuhfYzJCpDkzPLmxdVPsceZfCXq33lcS41tlyuEuYy/+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AM7PR01MB6884.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1b8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 05:39:20 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9769.014; Wed, 1 Apr 2026 05:39:17 +0000
Date: Wed, 1 Apr 2026 07:39:15 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: thomas.perrot@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Subject: Re: [OE-core][PATCH] lto: disable LTO for e2fsprogs
Message-ID: <acytsjVUJ3oP0u3K@navimatix.de>
References: <20260330230727.1380122-1-thomas.perrot@bootlin.com>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="lviujbckyuozhl7n"
Content-Disposition: inline
In-Reply-To: <20260330230727.1380122-1-thomas.perrot@bootlin.com>
X-ClientProxiedBy: BE1P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::10) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AM7PR01MB6884:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b5bbe3-9710-4d9e-74aa-08de8fb1041e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	89vl3sMlOhGBH+0ntiHaENO65UrSAGiGYTjQHsZEOgODVSjsA6MdgBqW8ZJ3NTBO7Fm/B8EZD6gspV6HjWDykxRh/qqAk6UysyLY1ePqkhci/s+FOO8mklbtHAKkPAC5gE7y05aEWXxxhAkCpnzn2F3GElRONo8CEPVKlq2K/l2W6I8VcDhC+oiMpMJyiJPaVI97Tlm6NKQ/gDBN/Nsaw2/FoQH81wiPB5uUADDAggKWwECuW6HGQOgxtgrMDyg0+IF1iUrfHY+NREvC8XxgUq5m3Anf3dhCPO/1X2GNL3MwqQaxnNj+SRRo0VQNEZvcjba1MyQd2zTpePABUMjVeFuL2x3AmadEBndNJS7XZBWoJpKqCdAgkMCpcpOJdLa934V0cEqBpoI2gtHzhhiIybHXQfpenUebrTBXQUI+Z3AQ7Nj/cZ+HwvTb/qC/Rqf05FLbdZOEHQWldQOS5lGm37qv41mtMD7LsfwdwVUoXMMwmGtRsUSFn/xpdk6SNNslSPLpm2yKXxCbFYPHJJmlF6gXd+IceR2JU/iXVx2U9sEavPI/jcu9iQ7D622J+Tz42FexgTrSgie6ROt5Wf9U0AV7ui5s3lFuKYmZfRpdAxXVyfvPVhamO5mck1037teXJOQFB6xK6GrHLcJT8ewNpT36pMxBtwE207+xN+8FmeMAuWuc7gGYjOY7cm63ORts
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?L/yv0emL/Y0bZ6PR9Kep5ruEQlSt63rE2TicGGlQuiS32UUArV98kzO0C5?=
 =?iso-8859-1?Q?IDsY4XT1uea4twC3BTSaqgPpTI/IPx3mV9L15ZJNM5AhnlZEsMkpaafkUn?=
 =?iso-8859-1?Q?2gj8HOL1DMugwEAdXDzKzpnLKTBYEZUzn/i0vqHMSZgw+42Xij3Ry6Wmy2?=
 =?iso-8859-1?Q?dOZ7N8kuz3NxEVt1pVjSj84s1PN/ph3G2/UDfpsr7ggE/9v58ZizbJFggl?=
 =?iso-8859-1?Q?he/4bYCZ1KWJ5vUdwcrkwnWZPASHtl6OvBy/aOt8pAIwsX1WUusPGlmNY1?=
 =?iso-8859-1?Q?FSuroaHbs2DEj+yxXnjaX3Enj97LEKDeubOInGz4v9G6BSZP2KWP494q1+?=
 =?iso-8859-1?Q?11RJ2XgvxqAitxZaH9YRC7Ee2GmoeJFi6R7Ph6m2KSuNcJ813yqe/xlneY?=
 =?iso-8859-1?Q?SWIaBMladbETpCslgy27+AdY8+2qtZ10ovA/Gwyno+u7pJPa1q1t/pa0p9?=
 =?iso-8859-1?Q?HEsH6xXXIdC6fC7nWIyBoD+vdZuB1XRU3VKLUExZZTzEkp0+vNHM8Mz1MB?=
 =?iso-8859-1?Q?yae2Bk18rJ5IhVKeD6qKwOuegFp4/AXw3GQad73IrxBH1b2onuO7riyyKO?=
 =?iso-8859-1?Q?3spSh+bBwaUDfvH3F+hkpoDoow/qzG0fv/U4V976qu0gh1bRcIPnoHPZYx?=
 =?iso-8859-1?Q?K0rcufG2LZP864oUbZi7T1dpPdT5xadtgd4nHx8mK1raN13lT/TFBIIaM0?=
 =?iso-8859-1?Q?MC3Ax/R2QSrjsUDEdhIg5zHkFYr3LKOiUW1IlO1oINs+s5VBheVB5FLOzU?=
 =?iso-8859-1?Q?W6Xl6Ed0bOVrwvctk1mzz5NGCxWTwgRKOJErAjrFs9YRCJauEiVBsPanTy?=
 =?iso-8859-1?Q?Lqhfogs6IRLoceyF36s36shxk9T6xbTE5TLCiJhVhOMUbfudos70odBMQf?=
 =?iso-8859-1?Q?gP+Z6awk7b9ntHk5seKRMsUtOqHt+l7OhAWavjUBr35CZwoQnP7DI/v+zb?=
 =?iso-8859-1?Q?zkTIEYp3ibf7pCP4uwnoakT75/EwCUCGTAkBZY54om7DWvCvTfRf9UzYfJ?=
 =?iso-8859-1?Q?cYuxXpL78Wn26s+JBFXue5B9/9Dq9+zvldw+SO+LOYMjGrS7U58ybIrcvb?=
 =?iso-8859-1?Q?+5b4Av37HEgoWR/fzjLCwQp2xCI2ntIP/AgS+NvmyPja1i3Ccb14J4oMEX?=
 =?iso-8859-1?Q?K5wvWZypoQHiM+en/BBGGVLoJy5dKBjLdmmBLnG/9p7WdTX5fuHP0/waXq?=
 =?iso-8859-1?Q?edaWJ64i6D5d+tQ9JSHNJuRirh+dZd0LtflwpjPOyvdoPut/6hd00ijD+9?=
 =?iso-8859-1?Q?tWV4KI/k0FJ7Ulg8vL80YZgQJZ2vA/26d8U/qXw2IjWZxio1lKujd3whiT?=
 =?iso-8859-1?Q?xcTjUvyBeMSJUtsGjGZ7dpKT9Hd6A81hJZN3vVjt/QEXn63h/INgT0uYUo?=
 =?iso-8859-1?Q?Gd3SiBFalUeg3vXm55VWPIPMoqHuV/ClgJ3z5b6musvXxC9eNh5GY2omjW?=
 =?iso-8859-1?Q?drMuQuDuQ7KRPwXQUDypeFctacASe+brGWNRthb8egfqjWUlI9jFIv+YJx?=
 =?iso-8859-1?Q?NVuPXWHb44lTnQhS94j9Hx1cnL0IkS1KQz+lClTmEi8PuGxvi++vmNjWIM?=
 =?iso-8859-1?Q?H5NPxGHMQLkTGrfA1P7cjejMuEm6w3L/WAGhEx+TuzBxIjspYE+xv8p78g?=
 =?iso-8859-1?Q?sSV2qT80I2Ge154asI+LrOfO6khkGwoUn5fAcPv9PA2hhIXM/LRGeNlYLX?=
 =?iso-8859-1?Q?Ky32N7+jMGme3ll1PgYBQ7pRYhd3BwiEIRGhDNNTV1+ktlQP7g2653cpad?=
 =?iso-8859-1?Q?wKVBZlZ4TPOZ213fzKUU/LfkVApuoM/1YDjDGi4yYCkmu8PtKKM4nGDZae?=
 =?iso-8859-1?Q?V/YnO3HBVY3mhKUVvFntB5NcxuVPIpc=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b5bbe3-9710-4d9e-74aa-08de8fb1041e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 05:39:17.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93vlWws7/XG0cbFIHfFtNoF89tlJkRi3+dEkkLgKIsdfSrk6er4gk9QrlTEPu9/fLWq2iXpKCon4Gm1VgEQXPp2wX3/oUa96Xb6e079lGB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB6884
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 05:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234325

--lviujbckyuozhl7n
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core][PATCH] lto: disable LTO for e2fsprogs
MIME-Version: 1.0

Thomas Perrot via lists.openembedded.org schrieb am Di 31. M=E4r, 01:07 (+0=
200):
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>=20
> Fat LTO objects embed original source paths in .gnu.lto_* IR sections
> which are not remapped by -ffile-prefix-map. This causes buildpaths QA
> failures for libss.a and libext2fs.a in the e2fsprogs-staticdev package.
>=20
> Disable LTO for e2fsprogs to prevent TMPDIR references from leaking into
> the installed static libraries.

For e2fsprogs this was a patch I've used to fix the LTO problem. Feel free
to take it:

diff --git c/recipes/e2fsprogs/e2fsprogs/lto.patch i/recipes/e2fsprogs/e2fs=
progs/lto.patch
new file mode 100644
index 0000000..cf5c076
--- /dev/null
+++ i/recipes/e2fsprogs/e2fsprogs/lto.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Inappropriate [ TODO ]
+
+diff --git i/lib/ext2fs/Makefile.in w/lib/ext2fs/Makefile.in
+index e9a6ced2..998ccd19 100644
+--- i/lib/ext2fs/Makefile.in
++++ w/lib/ext2fs/Makefile.in
+@@ -262,11 +262,11 @@ all:: ext2fs.pc
+=20
+ .c.o:
+ 	$(E) "	CC $<"
+-	$(Q) $(CC) $(ALL_CFLAGS_STLIB) -c $< -o $@
++	$(Q) $(CC) $(ALL_CFLAGS_STLIB) -c ./$< -o $@
+ 	$(Q) $(CHECK_CMD) $(ALL_CFLAGS) $<
+ 	$(Q) $(CPPCHECK_CMD) $(CPPFLAGS) $<
+ @PROFILE_CMT@	$(Q) $(CC) $(ALL_CFLAGS_STLIB) -g -pg -o profiled/$*.o -c $<
+-@ELF_CMT@	$(Q) $(CC) $(ALL_CFLAGS_SHLIB) -fPIC -shared -o elfshared/$*.o =
-c $<
++@ELF_CMT@	$(Q) $(CC) $(ALL_CFLAGS_SHLIB) -fPIC -shared -o elfshared/$*.o =
-c ./$<
+ @BSDLIB_CMT@	$(Q) $(CC) $(ALL_CFLAGS_SHLIB) $(BSDLIB_PIC_FLAG) -o pic/$*.=
o -c $<
+=20
+ DISTFILES=3D Makefile *.c *.h image
+diff --git i/lib/ss/Makefile.in w/lib/ss/Makefile.in
+index bb504189..9d8ec595 100644
+--- i/lib/ss/Makefile.in
++++ w/lib/ss/Makefile.in
+@@ -34,11 +34,11 @@ COMPILE_ET=3D	_ET_DIR_OVERRIDE=3D$(srcdir)/../et ../et=
/compile_et
+=20
+ .c.o:
+ 	$(E) "	CC $<"
+-	$(Q) $(CC) $(ALL_CFLAGS_STLIB) -c $<
++	$(Q) $(CC) $(ALL_CFLAGS_STLIB) -c ./$<
+ 	$(Q) $(CHECK_CMD) $(ALL_CFLAGS) $<
+ 	$(Q) $(CPPCHECK_CMD) $(CPPFLAGS) $<
+ @PROFILE_CMT@	$(Q) $(CC) $(ALL_CFLAGS_STLIB) -g -pg -o profiled/$*.o -c $<
+-@ELF_CMT@	$(Q) $(CC) $(ALL_CFLAGS_SHLIB) -DSHARED_ELF_LIB -fPIC -shared -=
o elfshared/$*.o -c $<
++@ELF_CMT@	$(Q) $(CC) $(ALL_CFLAGS_SHLIB) -DSHARED_ELF_LIB -fPIC -shared -=
o elfshared/$*.o -c ./$<
+ @BSDLIB_CMT@	$(Q) $(CC) $(ALL_CFLAGS_SHLIB) $(BSDLIB_PIC_FLAG) -o pic/$*.=
o -c $<
+=20
+ # for the library
diff --git c/recipes/e2fsprogs/e2fsprogs_%.bbappend i/recipes/e2fsprogs/e2f=
sprogs_%.bbappend
new file mode 100644
index 0000000..ee75686
--- /dev/null
+++ i/recipes/e2fsprogs/e2fsprogs_%.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}:"
+
+SRC_URI +=3D "\
+    file://lto.patch \
+"


--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--lviujbckyuozhl7n
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
ATAcBgkqhkiG9w0BCQUxDxcNMjYwNDAxMDUzOTE0WjAvBgkqhkiG9w0BCQQxIgQgDuKOqu1T
n0DmlqxYkpMuWwMOibXqKkCGcf/kKn0wTJQwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBACt7gCky08rZ
K8IYxtgojyNogZLEekmRptMJr+OsUoMohwaMrXRUbluah9YLKWgksoKUCaYIEuSaKNncaEU9
79SL0pMR6/j1WR5z3yfPcsufu7IyantKni6gWgNn7/M8IolAJ/lVB/u0VGTiOg/lKDGjXysH
kcvLTfIxbrD6z0FRQOZeRsWofhghheras9Na6tj9wphyUScNlIrHpZ+iGjKjkBJYUnOwwgV/
azxmQSkH+h9qId+2nPuQEkXSGViyUE1I8up6RYEtJ3Jz5JmNUM7X4izb7zHBu3BfVAF4hed6
+UUX1ZOefEc2E+24txps6R4NYGGgZSpMLY5lDL/qE8I=

--lviujbckyuozhl7n--

