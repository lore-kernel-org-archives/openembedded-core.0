Return-Path: <a.thoma@rational-online.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C57C38145
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 08:14:14 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.93])
 by mx.groups.io with SMTP id smtpd.web12.1546.1662452048472812342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 01:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rational-online.com header.s=selector1 header.b=guyxNZKx;
 spf=pass (domain: rational-online.com, ip: 40.107.1.93,
 mailfrom: a.thoma@rational-online.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEUcZOTh3Nn2tEDjm5+cWunCWSjbUhAbU40nR+/X3wBHZPLHrXzU/92/ThK0X+n5vXQb7ABPGgHZvGfof8bp4c0urbEzMK3eGJm4d4DYbwKa/hUArwmdi3GNCg+yTVgd5ffKnS8Izz3N0Ifqbzj5IqbHelGnGnQdUFok3hiwJD/I9No6iQvT7DO9OQXfooBSdMJbnsDxSFIAmVqaxk1PE/3I12UKvabURZ3F9n8eDXnkQRejPT5CjIwtSuSOUXl7RMN3Cci76G8z2DCMRS0wXAoC6aSey/RsO8wrROymwzT4Zpb0A0GD4hJv+ngTWNfwDrHS1/YnovpQK2j4rPpoCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l38AUO5zUif1SeW6MMxI/25+GdszU1Q6SuiZ2LLyZvw=;
 b=h6qQZv3o9v2RSu5yPXqcgRxvkd4L8vljRBI5sM+0cIES2LZtqdkVDli3r0OiVVj2QQw3tP8FxL2SaM7MU/zlQ9oywZQLZu8tmtT5Ei3Am9iVM0Q8hrG/jxoYLMkYAf4KDm3BNYHIkMdscFn8Tw56qrgjeEKT6/h0P2nWkhzUU6dvlT3jrl7xgoDydvAtLixjf7zCjJUDtaGc2vcsWwsOKP7woPPdni12KQaDXr67nzPQ31g3OSz3pk294tPVN4JbCgpbsR2MFN42EaukKTd486BXzejyVvKF2Id5NrQegj7OqZAyAcgVXonj4NVQVq5LTlFhECwFN3osf4pBNPVuWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rational-online.com; dmarc=pass action=none
 header.from=rational-online.com; dkim=pass header.d=rational-online.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rational-online.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l38AUO5zUif1SeW6MMxI/25+GdszU1Q6SuiZ2LLyZvw=;
 b=guyxNZKxLadtxuJMObeW//6lFWJyw2M2sgAlI7QETBOX0uDbzrDlNyz4fxp13DuTzTeuh1Kje/G/0U4kLmFfAPoF9L7oS/A+kv/e/ut0feJePFGT8R92wCOfPHHP8HWMPQF6T7T0E77RftzlQkiEZh7F8grDRnpJyB1Wj8Aq5jY=
Received: from DB4PR10MB6264.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:380::11)
 by AS8PR10MB6414.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:56c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 6 Sep
 2022 08:14:04 +0000
Received: from DB4PR10MB6264.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8dbd:6faa:c76f:7e46]) by DB4PR10MB6264.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8dbd:6faa:c76f:7e46%6]) with mapi id 15.20.5588.011; Tue, 6 Sep 2022
 08:14:04 +0000
From: "Thoma, Alexander" <a.thoma@rational-online.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [dunfell][PATCH] gcc-sanitizers: modify to also build static libs
Thread-Topic: [dunfell][PATCH] gcc-sanitizers: modify to also build static
 libs
Thread-Index: AdjByIz57XDuSzMzR7qHdyEZGhD95w==
Date: Tue, 6 Sep 2022 08:14:04 +0000
Message-ID: 
 <DB4PR10MB6264FE1630B64A178AEBA030A57E9@DB4PR10MB6264.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7b6377d-5307-4af7-82b4-bc5066ec1eee_Enabled=true;
 MSIP_Label_a7b6377d-5307-4af7-82b4-bc5066ec1eee_SetDate=2022-09-06T08:13:31Z;
 MSIP_Label_a7b6377d-5307-4af7-82b4-bc5066ec1eee_Method=Privileged;
 MSIP_Label_a7b6377d-5307-4af7-82b4-bc5066ec1eee_Name=Public;
 MSIP_Label_a7b6377d-5307-4af7-82b4-bc5066ec1eee_SiteId=16dbd641-f98d-4ec4-967d-799b7e2b4147;
 MSIP_Label_a7b6377d-5307-4af7-82b4-bc5066ec1eee_ActionId=683219f7-645d-4170-82cc-04a16e7f705c;
 MSIP_Label_a7b6377d-5307-4af7-82b4-bc5066ec1eee_ContentBits=0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rational-online.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f3f650f-5809-4dc6-15e6-08da8fdfc39d
x-ms-traffictypediagnostic: AS8PR10MB6414:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oNSpLIl0g1n371+HtyOMv6aRT3aWT6echAdd2922pz6UaumdiPenZJQwF9bgnw0Y+4SM7/GXSwKS732S8gICiNyFhpK9lQra+hNgxxcYtbQ6xgS/pU1lzrHO0kAnS4FE3j0I9V3w+wzc7/MtsCt7Yr9jBLP/hj5M2zVvvM94fWmt3s/4+FTLwPrhyDS7B+pvGUmJbF3iLb0Z5gcQxtZmc0+4qdzTi6jQi9EyT4eYXYzcZJfA3JEU3cgqvIzZ9Ts8y6RweFID3aSNnfaRLwYvGiavK59xFWkGlSTXAOP/ntQHATxBcvMac2YqTULzgJWYfKaCA5CLD/u0WHccl2K7dIa1MVfD/W1ABOFOgEg6yfZpAJgBLPMjzscyrtN/RRu6pW0ABLhT9oKm7g6IPzX/FsaMb24Kqm1kZVkzfz4NawOh9zcKU3O6dmtoGNiNI+FpnI2x7XRQe/Y/6DgpJJMxo3QqaweStxMJWr0Pn0g/QJ/JoMpTcuq76vir/bSup3YgYLzf2tq0AbjcYU5NEzBkb4x7TMAJtBGLDvQvb4X0Gu0Zg01AlWggEdNGgHoGLAQPmJi0Fc8itoSmZyY3TpsbZx0gGO7PVwhaU5xyuIsLtUw9LLTzeADfFDzV1VkCdi9G06GWhdv6b5oPcQwf2CtZDkmv4PvyoMRYBu+jf0LtqFVx8w3aXR2Fj+KzKai2m1uBJeAuSyeBEH2ndWUi/I6GBKKO1qIMzU2xA2XhIbRZ6Q/tSwvyiULpwgFqq4FIA4heDv4jdn4253MVUj577TJGoA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR10MB6264.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(186003)(86362001)(2906002)(8676002)(76116006)(64756008)(66476007)(66946007)(66446008)(66556008)(316002)(6916009)(8936002)(52536014)(53546011)(55236004)(6506007)(478600001)(26005)(9686003)(7696005)(71200400001)(5660300002)(41300700001)(55016003)(99936003)(38100700002)(38070700005)(83380400001)(33656002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TUxPaThuL0c0UVJHRUZtb1VmaXkvNHNnUC9yNk8vZG5oek9oSlp0OTdhTVVl?=
 =?utf-8?B?N3VGZTNzaW5UeE56QkdHOGF3QW1XTkZSczBWRDR1SE9UMURmT2hGTmp0dWhW?=
 =?utf-8?B?VnVpVm5lS2hDdUc5S0dKREd6M2JHajlDa1NhMXcxTng0aElVMVc1ODFJRXZa?=
 =?utf-8?B?OGN2WVd0RzFybDE1QUdXc2c1QjFCMm9HcHFIREY1Vm5PZFlKT3VQKzdZSllv?=
 =?utf-8?B?N2hHd1RZMTJFNmx6TnF1MHVZLzl0VDlZRFBGbVFCVXRCWlUwalo0aDlVSTNL?=
 =?utf-8?B?cG11LzlMUFNYbXBubFJHQjVHQk1JdEt6aC9VYWMydE02ZVNOTUtVQkM0dUdL?=
 =?utf-8?B?bmFvMnFlMkZPM2w1ZkRmdCtuNHdNeWFvRytWVVBJR3RLNHZCZFZzY2lZZ0dS?=
 =?utf-8?B?QkRYT0UxNVhmTnJxQ2pKY0pTa3lDTG84aE85ZmgxNlJPWVdreFlkZ0tiOFFL?=
 =?utf-8?B?dXJYT3huLzNrSU9RWDArbFNsRTN1SlZrOVR2M0UxTit3NmN1MFBYbUJFcGNr?=
 =?utf-8?B?dFY5ZWthOGZKdWNWOHMwZVVLNHNMV245ZWZZT1dnWVBYNndsNSt4YjM3Q1lq?=
 =?utf-8?B?b1p1Szg1MTB6WjJZS2d3NXcyc05vUmNvU2NMM0Njak1ZbFRQSnpNVDVNRzBo?=
 =?utf-8?B?aWpXY3lxd2M4dzN4TURUOWhZc2N0R2lWdGpVdFJuU0VUTzBzWjhJVWpSd2hk?=
 =?utf-8?B?eDZjZWVZNk1GME1YOE9DRUw0UDhQKzlsbDN6cG9ZWmRqOS84TUVNTWo0cm5D?=
 =?utf-8?B?eUR5RzRETjBkUHkzcVVsSGRtRWJ3SVhvQ3dlUlNXRWVCOTZlR0tmZUx3OGNl?=
 =?utf-8?B?OUhWNFlNOENzOHBMYVo5eTZLY1pYaWZ2WjBKNlc5Y0JMRWNqMm5KdE1xb3oy?=
 =?utf-8?B?MDJ3MXJaRzNKYy9tVisyOWptTm1tbm5oMmZUQy8vZlZmeVB1dU1yM3hDQ0dU?=
 =?utf-8?B?SFlIWkZpVFJGS00rZlJzZ0p1a1Bna2RXckRja2ZaeG80N29qa1dITzdZTStV?=
 =?utf-8?B?VWM3Y0EyUnZEcTArbUd5OEo2ZENraTRJQ3dZT2pUV3NoS2UvaWpiTXQzTnBT?=
 =?utf-8?B?eEdlYlhlSE1nOGpVYjczUjd4VmtkTG5naDQ0dUluRCtjdis1elIrVDNVeEs3?=
 =?utf-8?B?VXcyYngyby91K1NFemprRGI0R1U1Vkk4N0JHRTdzZUV6SFQzTVp4SVFaZ3lK?=
 =?utf-8?B?REZ0RDZLNUlXOVVmRFZCRDhsNURIYUlGM3kycVQ3aitKVmxNbHRTS0syVXVH?=
 =?utf-8?B?NnNRTmR2VmNqYkcrcklHWFhEWldtSzM2UGJGSEJWWGx6cGVCYVhJUUJycWVQ?=
 =?utf-8?B?SW9nTEk1cHpNdE9ONkpIZnRMYkozWWtHdm5OTVY5eEdwblRVTVVHSFkwZHYw?=
 =?utf-8?B?dWVyeS9DdlVwUkJVU3dGaG5WRlhpQWJ3K3lNbStFMTNyc1hTZlFzY3QwRkhK?=
 =?utf-8?B?UlRkZE1rUlk5MnMwSUVZSGY5UnJPN2dYR0RoUk80N1ZjcHJrTFV5VExLQWRn?=
 =?utf-8?B?VDJ3NkNXSHRNWU5yZ3VTd0hRZFJJV1E1cVFKZTRTbnJDbkFwTHdpZVJhSHBj?=
 =?utf-8?B?bFN5R3YwUVFZU2dtV05WSlF5UmhiNlp5OXM3eUdDaVdqQW84SXFPVDljSUYy?=
 =?utf-8?B?cXVkdVVTTEhYTjAvdTNkemdHQWJNYVFpMkN0WGlRazFpc0hGMEVYVXEvN2Fo?=
 =?utf-8?B?ZzVjY0pORys5T1g3eDQwN0xkS2Y1VU9VMzNtSzM5MXFTTnptdG1FMDNOTnh5?=
 =?utf-8?B?cm1nTlVveHJVRlIzeHpHb1FYdmVXWGxzSUE4Y3Jrd2ZyOWRuTytJd1lZaE9G?=
 =?utf-8?B?UlA2MHljNlg5Zlc2VUt1OUw5Y0ZTSmhYeXozVFlZdDBDRGVPL0xZclZ0WSta?=
 =?utf-8?B?Y2ZhcUtSL0p6am1lb0lXSWhOQVBGSVBXOFI0ODByREFyTk5McHp3eU12YmhR?=
 =?utf-8?B?bk90OVJXTFk2eURqVEVycjhBYVg3NnRhbG9RMWx1WlVPeHZOYndsTEQwZC9R?=
 =?utf-8?B?alJMQUp1eHBvUFp5OUJzVkVCQ0M3T0tRNXV2Q0FoWTdkdmhaVEtYQzlOcWdG?=
 =?utf-8?B?OXI1OW5HSGhXMS9UOGFuZHZmamFHQWZGZFZSZ3U1ekxHUFl3QlJBd3FmR2F5?=
 =?utf-8?B?OHhZWU0yTEJJcG82aktabHUyNW1SMGdUVGZxaTltbmhHa3VGWXpDdzUzVzU5?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_006D_01D8C1D9.6332B080"
MIME-Version: 1.0
X-OriginatorOrg: rational-online.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR10MB6264.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f3f650f-5809-4dc6-15e6-08da8fdfc39d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 08:14:04.8052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 16dbd641-f98d-4ec4-967d-799b7e2b4147
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 OhNosndWNElMfQCjUqTL2tPCgQdxnCChbVzB19sKCZ1Sp1pZvfv8HT/XkuCuyiLfesVL+6WEcTS7r6CuN7jzlapTtTXJhdwymrJlWlnTvvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6414
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 08:14:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170339

------=_NextPart_000_006D_01D8C1D9.6332B080
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_006E_01D8C1D9.6332B080"


------=_NextPart_001_006E_01D8C1D9.6332B080
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

From ba6cdecb93c09e1f218542a3cfbeb63d9141e069 Mon Sep 17 00:00:00 2001

From: Alexander Thoma  <mailto:a.thoma@rational-online.com>
a.thoma@rational-online.com

Date: Fri, 5 Aug 2022 08:41:09 +0200

Subject: [PATCH] gcc-sanitizers: modify to also build static libs

 

gcc-sanitizers static-dev can be build for static and dynamic linking.
Before static-dev package was always empty since static build was not
enabled.

Package-dependencies needs to be rearranged since both dev and static-dev
need the obj-files.

 

Signed-off-by: Alexander Thoma  <mailto:a.thoma@rational-online.com>
a.thoma@rational-online.com

Signed-off-by: Florian Wuehr  <mailto:f.wuehr@rational-online.com>
f.wuehr@rational-online.com

---

meta/recipes-devtools/gcc/gcc-sanitizers.inc | 43 +++++++++++++++-----

1 file changed, 32 insertions(+), 11 deletions(-)

 

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
b/meta/recipes-devtools/gcc/gcc-sanitizers.inc

index 668e14a59f..561e8f95b0 100644

--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc

+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc

@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "\

      <file://libsanitizer/LICENSE.TXT;md5=0249c37748936faf5b1efd5789587909>
file://libsanitizer/LICENSE.TXT;md5=0249c37748936faf5b1efd5789587909 \

"

 

+EXTRA_OECONF_append = " --enable-static"

+

EXTRA_OECONF_PATHS = "\

     --with-sysroot=/not/exist \

     --with-build-sysroot=${STAGING_DIR_TARGET} \

@@ -23,6 +25,8 @@ do_configure () {

     sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/'
${B}/${TARGET_SYS}/libsanitizer/libtool

     # Link to the sysroot's libstdc++ instead of one gcc thinks it just
built

     sed -i -e '/LIBSTDCXX_RAW_CXX_\(CXXFLAGS\|LDFLAGS\)\s*=/d'
${B}/${TARGET_SYS}/libsanitizer/*/Makefile

+    # Enable static build

+    sed -i -e 's/build_old_libs=no/build_old_libs=yes/'
${B}/${TARGET_SYS}/libsanitizer/libtool

}

EXTRACONFFUNCS += "extract_stashed_builddir"

do_configure[depends] += "${COMPILERDEP}"

@@ -53,16 +57,25 @@ BBCLASSEXTEND = "nativesdk"

PACKAGES = "${PN} ${PN}-dbg"

PACKAGES += "libasan libubsan liblsan libtsan"

PACKAGES += "libasan-dev libubsan-dev liblsan-dev libtsan-dev"

+PACKAGES += "libasan-obj libubsan-obj liblsan-obj libtsan-obj"

PACKAGES += "libasan-staticdev libubsan-staticdev liblsan-staticdev
libtsan-staticdev"

 

 RDEPENDS_libasan += "libstdc++"

RDEPENDS_libubsan += "libstdc++"

RDEPENDS_liblsan += "libstdc++"

RDEPENDS_libtsan += "libstdc++"

-RDEPENDS_libasan-dev += "${PN}"

-RDEPENDS_libubsan-dev += "${PN}"

-RDEPENDS_liblsan-dev += "${PN}"

-RDEPENDS_libtsan-dev += "${PN}"

+RDEPENDS_libasan-dev += "${PN} libasan-obj"

+RDEPENDS_libubsan-dev += "${PN} libubsan-obj"

+RDEPENDS_liblsan-dev += "${PN} liblsan-obj"

+RDEPENDS_libtsan-dev += "${PN} libtsan-obj"

+RDEPENDS_libasan-staticdev += "${PN} libasan-obj"

+RDEPENDS_libubsan-staticdev += "${PN} libubsan-obj"

+RDEPENDS_liblsan-staticdev += "${PN} liblsan-obj"

+RDEPENDS_libtsan-staticdev += "${PN} libtsan-obj"

+ALLOW_EMPTY_libasan-obj = "1"

+ALLOW_EMPTY_libubsan-obj = "1"

+ALLOW_EMPTY_liblsan-obj = "1"

+ALLOW_EMPTY_libtsan-obj = "1"

RRECOMMENDS_${PN} += "libasan libubsan"

RRECOMMENDS_${PN}_append_x86 = " liblsan"

RRECOMMENDS_${PN}_append_x86-64 = " liblsan libtsan"

@@ -79,34 +92,42 @@ COMPATIBLE_HOST =
'(x86_64|i.86|powerpc|sparc|s390|arm|aarch64).*-linux'

COMPATIBLE_HOST_libc-musl = 'null'

 

 FILES_libasan += "${libdir}/libasan.so.*"

-FILES_libasan-dev += "\

+FILES_libasan-obj += "\

     ${libdir}/libasan_preinit.o \

-    ${libdir}/libasan.so \

     ${libdir}/libasan.la \

"

+FILES_libasan-dev += "\

+    ${libdir}/libasan.so \

+"

FILES_libasan-staticdev += "${libdir}/libasan.a"

 

 FILES_libubsan += "${libdir}/libubsan.so.*"

+FILES_libubsan-obj += "\

+    ${libdir}/libubsan.la \

+"

FILES_libubsan-dev += "\

     ${libdir}/libubsan.so \

-    ${libdir}/libubsan.la \

"

FILES_libubsan-staticdev += "${libdir}/libubsan.a"

 

 FILES_liblsan += "${libdir}/liblsan.so.*"

-FILES_liblsan-dev += "\

-    ${libdir}/liblsan.so \

+FILES_liblsan-obj += "\

     ${libdir}/liblsan.la \

     ${libdir}/liblsan_preinit.o \

"

+FILES_liblsan-dev += "\

+    ${libdir}/liblsan.so \

+"

FILES_liblsan-staticdev += "${libdir}/liblsan.a"

 

 FILES_libtsan += "${libdir}/libtsan.so.*"

-FILES_libtsan-dev += "\

-    ${libdir}/libtsan.so \

+FILES_libtsan-obj += "\

     ${libdir}/libtsan.la \

     ${libdir}/libtsan_*.o \

"

+FILES_libtsan-dev += "\

+    ${libdir}/libtsan.so \

+"

FILES_libtsan-staticdev += "${libdir}/libtsan.a"

 

 FILES_${PN} = "${libdir}/*.spec
${libdir}/gcc/${TARGET_SYS}/${BINV}/include/sanitizer/*.h"

-- 

2.25.1

 

 

Kind regards

 

Alexander Thoma

 

 


------=_NextPart_001_006E_01D8C1D9.6332B080
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DDE =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>F=
rom ba6cdecb93c09e1f218542a3cfbeb63d9141e069 Mon Sep 17 00:00:00 =
2001<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>F=
rom: Alexander Thoma </span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
a href=3D"mailto:a.thoma@rational-online.com"><span =
lang=3DEN-US>a.thoma@rational-online.com</span></a></span><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>D=
ate: Fri, 5 Aug 2022 08:41:09 +0200<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>S=
ubject: [PATCH] gcc-sanitizers: modify to also build static =
libs<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>g=
cc-sanitizers static-dev can be build for static and dynamic linking. =
Before static-dev package was always empty since static build was not =
enabled.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>P=
ackage-dependencies needs to be rearranged since both dev and static-dev =
need the obj-files.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>S=
igned-off-by: Alexander Thoma </span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
a href=3D"mailto:a.thoma@rational-online.com"><span =
lang=3DEN-US>a.thoma@rational-online.com</span></a></span><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>S=
igned-off-by: Florian Wuehr </span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
a href=3D"mailto:f.wuehr@rational-online.com"><span =
lang=3DEN-US>f.wuehr@rational-online.com</span></a></span><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
--<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>m=
eta/recipes-devtools/gcc/gcc-sanitizers.inc | 43 =
+++++++++++++++-----<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>1=
 file changed, 32 insertions(+), 11 deletions(-)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>d=
iff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc =
b/meta/recipes-devtools/gcc/gcc-sanitizers.inc<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>i=
ndex 668e14a59f..561e8f95b0 100644<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
-- =
a/meta/recipes-devtools/gcc/gcc-sanitizers.inc<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
++ =
b/meta/recipes-devtools/gcc/gcc-sanitizers.inc<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>@=
@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
a =
href=3D"file://libsanitizer/LICENSE.TXT;md5=3D0249c37748936faf5b1efd57895=
87909"><span =
lang=3DEN-US>file://libsanitizer/LICENSE.TXT;md5=3D0249c37748936faf5b1efd=
5789587909</span></a></span><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'> =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
EXTRA_OECONF_append =3D &quot; =
--enable-static&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>E=
XTRA_OECONF_PATHS =3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp;&nbsp; --with-sysroot=3D/not/exist =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp; &nbsp;--with-build-sysroot=3D${STAGING_DIR_TARGET} =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>@=
@ -23,6 +25,8 @@ do_configure () {<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp;&nbsp; sed -i -e =
's/hardcode_into_libs=3Dyes/hardcode_into_libs=3Dno/' =
${B}/${TARGET_SYS}/libsanitizer/libtool<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp;&nbsp; # Link to the sysroot's libstdc++ instead of one =
gcc thinks it just built<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp;&nbsp; sed -i -e =
'/LIBSTDCXX_RAW_CXX_\(CXXFLAGS\|LDFLAGS\)\s*=3D/d' =
${B}/${TARGET_SYS}/libsanitizer/*/Makefile<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
&nbsp;&nbsp;&nbsp; # Enable static build<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
&nbsp;&nbsp;&nbsp; sed -i -e =
's/build_old_libs=3Dno/build_old_libs=3Dyes/' =
${B}/${TARGET_SYS}/libsanitizer/libtool<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>}=
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>E=
XTRACONFFUNCS +=3D =
&quot;extract_stashed_builddir&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>d=
o_configure[depends] +=3D =
&quot;${COMPILERDEP}&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>@=
@ -53,16 +57,25 @@ BBCLASSEXTEND =3D =
&quot;nativesdk&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>P=
ACKAGES =3D &quot;${PN} ${PN}-dbg&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>P=
ACKAGES +=3D &quot;libasan libubsan liblsan =
libtsan&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>P=
ACKAGES +=3D &quot;libasan-dev libubsan-dev liblsan-dev =
libtsan-dev&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
PACKAGES +=3D &quot;libasan-obj libubsan-obj liblsan-obj =
libtsan-obj&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>P=
ACKAGES +=3D &quot;libasan-staticdev libubsan-staticdev =
liblsan-staticdev libtsan-staticdev&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;RDEPENDS_libasan +=3D &quot;libstdc++&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>R=
DEPENDS_libubsan +=3D &quot;libstdc++&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>R=
DEPENDS_liblsan +=3D &quot;libstdc++&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>R=
DEPENDS_libtsan +=3D &quot;libstdc++&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
RDEPENDS_libasan-dev +=3D &quot;${PN}&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
RDEPENDS_libubsan-dev +=3D &quot;${PN}&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
RDEPENDS_liblsan-dev +=3D &quot;${PN}&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
RDEPENDS_libtsan-dev +=3D &quot;${PN}&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
RDEPENDS_libasan-dev +=3D &quot;${PN} =
libasan-obj&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
RDEPENDS_libubsan-dev +=3D &quot;${PN} =
libubsan-obj&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
RDEPENDS_liblsan-dev +=3D &quot;${PN} =
liblsan-obj&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
RDEPENDS_libtsan-dev +=3D &quot;${PN} =
libtsan-obj&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
RDEPENDS_libasan-staticdev +=3D &quot;${PN} =
libasan-obj&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
RDEPENDS_libubsan-staticdev +=3D &quot;${PN} =
libubsan-obj&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
RDEPENDS_liblsan-staticdev +=3D &quot;${PN} =
liblsan-obj&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
RDEPENDS_libtsan-staticdev +=3D &quot;${PN} =
libtsan-obj&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
ALLOW_EMPTY_libasan-obj =3D &quot;1&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
ALLOW_EMPTY_libubsan-obj =3D &quot;1&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
ALLOW_EMPTY_liblsan-obj =3D &quot;1&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
ALLOW_EMPTY_libtsan-obj =3D &quot;1&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>R=
RECOMMENDS_${PN} +=3D &quot;libasan =
libubsan&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>R=
RECOMMENDS_${PN}_append_x86 =3D &quot; =
liblsan&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>R=
RECOMMENDS_${PN}_append_x86-64 =3D &quot; liblsan =
libtsan&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>@=
@ -79,34 +92,42 @@ COMPATIBLE_HOST =3D =
'(x86_64|i.86|powerpc|sparc|s390|arm|aarch64).*-linux'<o:p></o:p></span><=
/p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>C=
OMPATIBLE_HOST_libc-musl =3D 'null'<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;FILES_libasan +=3D =
&quot;${libdir}/libasan.so.*&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
FILES_libasan-dev +=3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
FILES_libasan-obj +=3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp;&nbsp; ${libdir}/libasan_preinit.o =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
&nbsp;&nbsp;&nbsp; ${libdir}/libasan.so \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp;&nbsp; ${libdir}/libasan.la \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
FILES_libasan-dev +=3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
&nbsp;&nbsp;&nbsp; ${libdir}/libasan.so \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>F=
ILES_libasan-staticdev +=3D =
&quot;${libdir}/libasan.a&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;FILES_libubsan +=3D =
&quot;${libdir}/libubsan.so.*&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
FILES_libubsan-obj +=3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
&nbsp;&nbsp;&nbsp; ${libdir}/libubsan.la \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>F=
ILES_libubsan-dev +=3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp;&nbsp; ${libdir}/libubsan.so \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
&nbsp;&nbsp;&nbsp; ${libdir}/libubsan.la \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>F=
ILES_libubsan-staticdev +=3D =
&quot;${libdir}/libubsan.a&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;FILES_liblsan +=3D =
&quot;${libdir}/liblsan.so.*&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
FILES_liblsan-dev +=3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
&nbsp;&nbsp;&nbsp; ${libdir}/liblsan.so \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
FILES_liblsan-obj +=3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp;&nbsp; ${libdir}/liblsan.la \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp;&nbsp; ${libdir}/liblsan_preinit.o =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
FILES_liblsan-dev +=3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
&nbsp;&nbsp;&nbsp; ${libdir}/liblsan.so \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>F=
ILES_liblsan-staticdev +=3D =
&quot;${libdir}/liblsan.a&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;FILES_libtsan +=3D =
&quot;${libdir}/libtsan.so.*&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
FILES_libtsan-dev +=3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
&nbsp;&nbsp;&nbsp; ${libdir}/libtsan.so \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
FILES_libtsan-obj +=3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp;&nbsp; ${libdir}/libtsan.la \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;&nbsp;&nbsp;&nbsp; ${libdir}/libtsan_*.o \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
FILES_libtsan-dev +=3D &quot;\<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
&nbsp;&nbsp;&nbsp; ${libdir}/libtsan.so \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>+=
&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>F=
ILES_libtsan-staticdev +=3D =
&quot;${libdir}/libtsan.a&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>&=
nbsp;FILES_${PN} =3D &quot;${libdir}/*.spec =
${libdir}/gcc/${TARGET_SYS}/${BINV}/include/sanitizer/*.h&quot;<o:p></o:p=
></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>-=
- <o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>2=
.25.1<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'>K=
ind regards</span><span =
style=3D'font-size:7.5pt;font-family:"Arial",sans-serif;color:black;mso-f=
areast-language:DE'><o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:7.5pt;font-family:"Arial",sans-serif;color:black;mso-f=
areast-language:DE'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'><b><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C;ms=
o-fareast-language:DE'>Alexander Thoma</span></b><o:p></o:p></p><p =
class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;color:#3C3C3C'><=
o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_001_006E_01D8C1D9.6332B080--

------=_NextPart_000_006D_01D8C1D9.6332B080
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

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
uChn3uaWXkzhTqjOG97NR75x8vVj1drZZzGeUdyQRyF2F4QZR2GCPGE48VY1OlMhB9uxk4uzVnB3
trvgSPQvk5lDkqaDEX57RMWBV7h5Xny1hsuYCQ31k5lCZykwvlvAB+nXQa2mw9LlKRU0BHvWq5Y8
fq/y4VQKOdTHF8YWgpSfUm7K7fdU7V6AcJNQ2XPK6iQaIJgbQQo3gq5p8K+LLL4g+Cc96z5Dpdfd
FoMQUbm1QC0BIEPNBDXDuEH6ObZVZMWtmLYyWNzoyyloUD5BjGgifFOCzMm8WJYSZWQst21kk10y
VCSn3rP48RTuXNtN/z0CAwEAAaOCAxswggMXMCYGA1UdEQQfMB2BG2EudGhvbWFAcmF0aW9uYWwt
b25saW5lLmNvbTA9BgkrBgEEAYI3FQcEMDAuBiYrBgEEAYI3FQiG2NQIgubSQIHtmT+F/+8Wzfx7
gUWC97R+hMjVUQIBZAIBHDAOBgNVHQ8BAf8EBAMCBLAwEwYDVR0lBAwwCgYIKwYBBQUHAwQwHQYD
VR0OBBYEFLteOxzV1I3u9WIFKJphNe5qxDL8MB8GA1UdIwQYMBaAFPDHozKRtevKtVh3FadOvhpd
YUMlMIH/BgNVHR8EgfcwgfQwR6BFoEOGQWh0dHA6Ly9jcmwuc3dpc3NzaWduLm5ldC9GMEM3QTMz
MjkxQjVFQkNBQjU1ODc3MTVBNzRFQkUxQTVENjE0MzI1MIGooIGloIGihoGfbGRhcDovL2RpcmVj
dG9yeS5zd2lzc3NpZ24ubmV0L0NOPUYwQzdBMzMyOTFCNUVCQ0FCNTU4NzcxNUE3NEVCRTFBNUQ2
MTQzMjUlMkNPPVN3aXNzU2lnbiUyQ0M9Q0g/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNl
P29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50MGsGA1UdIARkMGIwVgYJYIV0AVkBAwEM
MEkwRwYIKwYBBQUHAgEWO2h0dHA6Ly9yZXBvc2l0b3J5LnN3aXNzc2lnbi5jb20vU3dpc3NTaWdu
LVNpbHZlci1DUC1DUFMucGRmMAgGBgQAj3oBAzCB2QYIKwYBBQUHAQEEgcwwgckwZAYIKwYBBQUH
MAKGWGh0dHA6Ly9zd2lzc3NpZ24ubmV0L2NnaS1iaW4vYXV0aG9yaXR5L2Rvd25sb2FkL0YwQzdB
MzMyOTFCNUVCQ0FCNTU4NzcxNUE3NEVCRTFBNUQ2MTQzMjUwYQYIKwYBBQUHMAGGVWh0dHA6Ly9z
aWx2ZXItcGVyc29uYWwtZzIub2NzcC5zd2lzc3NpZ24ubmV0L0YwQzdBMzMyOTFCNUVCQ0FCNTU4
NzcxNUE3NEVCRTFBNUQ2MTQzMjUwDQYJKoZIhvcNAQELBQADggEBAL+CG4N1Qogn30rm9UcRGRzm
qpIjslPOZheir6unxaGDzoHt0v/APSXQ20G1SvnyQV+Y5OZ4lFSvQDOZW3JloJzzVGXeSuTlSNRi
wokXjhd6bHuVBY/usnLCJnS5Z8SESHFMVdZqMf72Wsx1CwC9lANrnjNhrGc6pES3tbGPvZpKAP2j
TySQ0Ymwaf9QBGzW2f3CGQpjvFBaipqGOkKmdgoLwC/qKvAPQzJ3/vZCavS4blLPa4suncb2qktW
r5y2ofAJGlcfxh6PL0Nqs1w4ywwu9iJ8KrNAFVTO8qwSi85QdH4SLyRVV9ld0+dcojjA/tH+Kv5B
iaJ+wuCrIST3X0kwgga+MIIEpqADAgECAg8FRNZOrR7TNtUyQF0AuTYwDQYJKoZIhvcNAQELBQAw
RzELMAkGA1UEBhMCQ0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEhMB8GA1UEAxMYU3dpc3NTaWdu
IFNpbHZlciBDQSAtIEcyMB4XDTE0MDkxOTIwMzY0OVoXDTI5MDkxNTIwMzY0OVowVjELMAkGA1UE
BhMCQ0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEwMC4GA1UEAxMnU3dpc3NTaWduIFBlcnNvbmFs
IFNpbHZlciBDQSAyMDE0IC0gRzIyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyzmx
OYX++smhvMODqQ5KLYRyHv9oxafEHewP16iLEx6z0RaLQNwPU28BPezoZLWX24O8qKjAhDhYXgMU
K+bKMO8AsusTORmSRyohAOVyzcIxYg7MVir/d8RjjJjCb3jXtbbM6X0fM6aRBSr+0VLW9Oyc/k1M
alLhhXZiu7lo5lJj/MEhkZJdGdjcgNEZ40kWVwIOGUSFqynJL/rGbWsKofb3/2thNRUmlJQCaSVd
afe9XmuC2ZAMBvlDBSJJ6zbQIFpjEOM4IdV/FitBikZ68mfopNC6Hn8kJ3WYlEktVsRUM5GdYvnV
X95bqRWYnJRTwYDpCRcVtBuAKTKh0K8TpwIDAQABo4ICljCCApIwDgYDVR0PAQH/BAQDAgEGMBIG
A1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFPDHozKRtevKtVh3FadOvhpdYUMlMB8GA1UdIwQY
MBaAFBegzcHkQbY6WzvLRZ29HMKY+oZYMIH/BgNVHR8EgfcwgfQwR6BFoEOGQWh0dHA6Ly9jcmwu
c3dpc3NzaWduLm5ldC8xN0EwQ0RDMUU0NDFCNjNBNUIzQkNCNDU5REJEMUNDMjk4RkE4NjU4MIGo
oIGloIGihoGfbGRhcDovL2RpcmVjdG9yeS5zd2lzc3NpZ24ubmV0L0NOPTE3QTBDREMxRTQ0MUI2
M0E1QjNCQ0I0NTlEQkQxQ0MyOThGQTg2NTglMkNPPVN3aXNzU2lnbiUyQ0M9Q0g/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50MGEG
A1UdIARaMFgwVgYJYIV0AVkBAwEGMEkwRwYIKwYBBQUHAgEWO2h0dHA6Ly9yZXBvc2l0b3J5LnN3
aXNzc2lnbi5jb20vU3dpc3NTaWduLVNpbHZlci1DUC1DUFMucGRmMIHGBggrBgEFBQcBAQSBuTCB
tjBkBggrBgEFBQcwAoZYaHR0cDovL3N3aXNzc2lnbi5uZXQvY2dpLWJpbi9hdXRob3JpdHkvZG93
bmxvYWQvMTdBMENEQzFFNDQxQjYzQTVCM0JDQjQ1OURCRDFDQzI5OEZBODY1ODBOBggrBgEFBQcw
AYZCaHR0cDovL29jc3Auc3dpc3NzaWduLm5ldC8xN0EwQ0RDMUU0NDFCNjNBNUIzQkNCNDU5REJE
MUNDMjk4RkE4NjU4MA0GCSqGSIb3DQEBCwUAA4ICAQDDeadXt3utUWj1RIxBlSgBfHTWO2q8be+n
1005mR1ojcoI2dBxsRk1k2+CxhxJuFHuTPlsCm/Ypfv++zBeANKUq8QSUbqqiqtq3RnXK0r3FrJr
Uc90Wymic96X/thPICF9aQywUOWNWIyALuUXHN1jeqrvBfnDaZ7kjHFiXELuOvLN4BLvi1zpzlMo
MuyVCxlUoiGN+n9Qp0+8GXuya4wpP3c+yiPHaVpBnX1mMW96cXnaqWU663/XENULX1QZfM43JSSE
UNCvQDTCX5LiepHzL0JHG588QvvZX6W8cEWO76A5kPWheGzXwGdZGeEA3lz8eOhP3buskS5yi/zq
R29DKLy7uY6UvvpQ3VCTG0wYtnb/w0cKWbTNbVXYarZfyS/BlDY+vq5ANQYg7eACTC00RQ5Dr6L0
2JAV5dDAm0RArjyPk1G8mWhzaXt1WJm31ARP3/GCcREde/wTHXdlVWPXUnJ83TFHhqeV2KwmcT0j
5hI79H+alob+K+qg8yYNdcYWjDEg5xFHoeeparClsoEe3D3QoeNu1fBmphx915KITQAHC3Hnc+dz
5FRlafw3jfEeb3Dup2yzUkVnWdYFSLEh6Zco2dn0tKagZyM2vGBHDlwof12TijG6jTE2FMd6Qp1v
IMFsKvgWD2rZAJQyuz1VscXDoQ2xeXdUHeAzgn7u6jGCA4wwggOIAgEBMG4wVjELMAkGA1UEBhMC
Q0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEwMC4GA1UEAxMnU3dpc3NTaWduIFBlcnNvbmFsIFNp
bHZlciBDQSAyMDE0IC0gRzIyAhQXc3W10iEN15+hpM7OWAOeKf9HPTAJBgUrDgMCGgUAoIIB8zAY
BgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMjA5MDYwODE0MDJaMCMG
CSqGSIb3DQEJBDEWBBSf7hJgRoRYXfJhuVAE186yd+BZJTB9BgkrBgEEAYI3EAQxcDBuMFYxCzAJ
BgNVBAYTAkNIMRUwEwYDVQQKEwxTd2lzc1NpZ24gQUcxMDAuBgNVBAMTJ1N3aXNzU2lnbiBQZXJz
b25hbCBTaWx2ZXIgQ0EgMjAxNCAtIEcyMgIUF3N1tdIhDdefoaTOzlgDnin/Rz0wfwYLKoZIhvcN
AQkQAgsxcKBuMFYxCzAJBgNVBAYTAkNIMRUwEwYDVQQKEwxTd2lzc1NpZ24gQUcxMDAuBgNVBAMT
J1N3aXNzU2lnbiBQZXJzb25hbCBTaWx2ZXIgQ0EgMjAxNCAtIEcyMgIUF3N1tdIhDdefoaTOzlgD
nin/Rz0wgZMGCSqGSIb3DQEJDzGBhTCBgjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqG
SIb3DQMHMAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4D
AhowCwYJYIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAE
ggEAUmFZHqG1k6kbUMpimXm4RwO35Vsq56ZqhCUHWZMsbWrS1Qr0ihRY3/rkZjgF4n8ymquf6mbw
iJTTYwaJrNBsYx2OYnp/yHJPEr2FTPOJG4imGNuVYsYYPir5Y8cADJ9ZsoMCeA2Qx/BEjnk+55z4
Yl91tfOYb3QEGciUacb5MPPXtvj0XNK9n2Drp3azV+7SEJyfUzARGSJk3qtNcwmlK42NhJ/KW5FP
OPqnUTFdQ/ILZoXw+y6Ua84z4aoC8hIF4KtpV8jsYCOripYC7wO/7ws56v7oQR8vDQNKiS9HZQJr
T8nhTL/72lhzVfufQc6OBHnhkqRdMF/WugrBXOYZ2QAAAAAAAA==

------=_NextPart_000_006D_01D8C1D9.6332B080--

