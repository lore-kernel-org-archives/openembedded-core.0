Return-Path: <a.thoma@rational-online.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31017C54EE9
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 08:12:34 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.102])
 by mx.groups.io with SMTP id smtpd.web11.1478.1662451948482451588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 01:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rational-online.com header.s=selector1 header.b=LXuZfDiW;
 spf=pass (domain: rational-online.com, ip: 40.107.21.102,
 mailfrom: a.thoma@rational-online.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOZVNfBJtpa+0VTVhCg/YkU77n1DFkz/c4Jg9eOH8UNCg9fpNDq4gjd1YWosxMStDx1bRATIm9ePDIO1xOC83n53gH8chXAvL/IKAe/XAPoAsFGaFL7IG21su1HOGSH3dMJ6NmW+o5Z8jw9ziQMp6x3y9yQtmHZPm7SBEx+HHZ5wJhXWt4qX6dL7zvRIidx/+Jb5eZYifJVq6KnRnySHw+BbAhprxYGR7JjGRX2LXEvgQatGJiIdR8eq9gGLQ6W2ny3X3FYf90SYP70a02LHvutM8jI6JI3MzNNbnepmagyA4+LO0e1sQTcGvEiwwoLaqmxtZd+dHfmCY9ipFUtWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JI0KQlEa80xZFX/54U6h2l4K5dotFLJqZZttjCvQ8r8=;
 b=SZ1lNQurXPlVtixACvuABtt5yUQZE4oGDr3xDMlY1XuR5v871duONp/GnzTStQOSY9hQB2cWOXCQxyu0uFLofZ2YwEX++ssORjRR6EdwJdut8EW6I3tQ2/5U+oGd7edEU9zRRJRDIyzrUd/EuremxGzkJIAsT5dRHmIS+qvBSYaOUxns+oAgxg+UoOv/DYPhRd+rtr17TY7kEvDa3kuH/6MpVfrOh2ppTjPw0oxny/9UrK3Tm6XO4h+TuAPWEFlAIehrz5T7/70XUnsbZOZxfib7iN11HuEZh7kKbrdewNfCnq6PV3/jlr6DF8gwK79O3lH1oKLGkiCNSBORt4yGjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rational-online.com; dmarc=pass action=none
 header.from=rational-online.com; dkim=pass header.d=rational-online.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rational-online.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JI0KQlEa80xZFX/54U6h2l4K5dotFLJqZZttjCvQ8r8=;
 b=LXuZfDiWPYMZZaLK2OKhfP9KKBdUnGsOK2ru5JjimuBv7MlfP8KG85g/6FBUYJCaqYec+u+85I5ix5giRBzcC3q5UNU7n7GnZXVuhDD5ZYtBJpyQu2ibwkx529Jpy2oJ0UCUZ9WrsAz++QsaHdbANynNT3xDMRlWqyXv4wZkiWc=
Received: from DB4PR10MB6264.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:380::11)
 by VI1PR10MB3598.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:139::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Tue, 6 Sep
 2022 08:12:24 +0000
Received: from DB4PR10MB6264.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8dbd:6faa:c76f:7e46]) by DB4PR10MB6264.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8dbd:6faa:c76f:7e46%6]) with mapi id 15.20.5588.011; Tue, 6 Sep 2022
 08:12:24 +0000
From: "Thoma, Alexander" <a.thoma@rational-online.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [dunfell][PATCH] gcc-sanitizers: modify to also build static libs
Thread-Topic: [dunfell][PATCH] gcc-sanitizers: modify to also build static
 libs
Thread-Index: AdjByBwc8KaI5gfXSbmDL3jDgrkBgQ==
Date: Tue, 6 Sep 2022 08:12:24 +0000
Message-ID: 
 <DB4PR10MB6264EC3702608FDC9A1F3D35A57E9@DB4PR10MB6264.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a420129f-df39-44a7-a73c-ff20f09b8e54_Enabled=true;
 MSIP_Label_a420129f-df39-44a7-a73c-ff20f09b8e54_SetDate=2022-09-06T08:07:48Z;
 MSIP_Label_a420129f-df39-44a7-a73c-ff20f09b8e54_Method=Standard;
 MSIP_Label_a420129f-df39-44a7-a73c-ff20f09b8e54_Name=Business;
 MSIP_Label_a420129f-df39-44a7-a73c-ff20f09b8e54_SiteId=16dbd641-f98d-4ec4-967d-799b7e2b4147;
 MSIP_Label_a420129f-df39-44a7-a73c-ff20f09b8e54_ActionId=8477b4bb-71ba-430d-b210-31ed90d4a860;
 MSIP_Label_a420129f-df39-44a7-a73c-ff20f09b8e54_ContentBits=0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rational-online.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f243a585-7767-433a-7721-08da8fdf87d5
x-ms-traffictypediagnostic: VI1PR10MB3598:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ArxECbeU5+NfO4kmsmWzGSghCAdtKlncQ6hh+9RTyIpz/8k/umqJNpTqcYWpIVvaX6VmMX9yxScE/rEwGeVgewtClNi6BEiWhPn8t3vlvB9jIEisRQtwgH/isXGv0zn6MForPAkPvxk66048j9mLMBPhjU7JVcoGw2bpcj+JOO+t0Z3dAlHRH2KWd7nPmKb4EAy33sK+OzPJ4VuKblPiwkgk9lidAKO0wBvOeVkH4fa+g0xMUB+BzMtdku4Vnu0QhnuXXYkfkgRRC09Y1kja6bN8hCYDpZnsxcBtmsk3vPCLsTIZ/y6CaRvaJ/jlD7KrtZs49C/Lb/LfKvyTgLakQ4iR9Dx0JcqF9YBOQJWo7Pw0dbKkKGJaaQKGEN+FMfpyzuIpkUjEkyygAOBIFg6t7nSdKVRWKRy27zjfxD3+oFE0/I6+wc2wjWiJXT3D6HXOd2HdlqoyyTtZzjPPLcQrPKU4/FbcF8P2QtZjp0BcapNg4QiBTVRU7FxNZrByJzxu+b3u+L1YcSczu5EUO4mGUhoHmBpjxnXaOMGCSqM/uEWx03USTIutrZ1ZTlacRJbcw9kc/bxzTULhmHgdwrEaua9zTFDBnHQjrFi2BkttvtBJ54TmCslS6i+KJ/1rr+qBrIkde/Gd6lmZeP6l0HeA2IN84mFYaibm2C6BD5bZSO1x8hWPh2PGvZF8UOTstr/OxA0klv8ym2A9fMLVTzr/mzJGDN13OWx/Ai4EZjzW62Bnj7Ocqeb6IprqHVR+vtQrBh7zPz1QEZdk0j6Bt+qbWw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR10MB6264.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(366004)(39850400004)(9686003)(5660300002)(52536014)(41300700001)(2906002)(33656002)(26005)(122000001)(38100700002)(66446008)(66476007)(478600001)(66946007)(76116006)(86362001)(64756008)(66556008)(8676002)(7696005)(55236004)(53546011)(8936002)(99936003)(6506007)(38070700005)(186003)(6916009)(71200400001)(316002)(55016003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bk4rMUsvaTlQQVpQWmQwY3VaQVRZSXJtT3d5OWJFNU5DQ2RpNTZsd2JMMjN6?=
 =?utf-8?B?eEhsQVoxOUVadkZXY09mQzdXRUR2RDk3R21uL3l2WUJOYVkveExRa2ZzRU9F?=
 =?utf-8?B?cHIzakVNMDR5bjYzVjhNWnFDeW5HaFp2MjB4ZzJRbUMxZkNBNFRnc2gxUFZK?=
 =?utf-8?B?bmhtZ1VjRTJaU1pYWGtRU3c5enc2M01QMU5xZEpUaEI2ZFlnZk0yWVRBWUtJ?=
 =?utf-8?B?dXBYUzhJam40Mi94V2liQXpnd2sxYnNjNUNnUWJOMGxhM21YZWltZDlDK2hW?=
 =?utf-8?B?Q1prcXQwNkg1djdLOUo4cFBhNFV4dDQ0RlU2RVRsZElwampGTE9ZVzdXNHlq?=
 =?utf-8?B?MlNHd0Vkdm0zdHA5ckczbTY2Zks2OHZadjE2Z3BYdTRlZjVNTnZLVUJmcW16?=
 =?utf-8?B?L3JSaFJBcWVEWW1QWWNMNlZjdGRjNEw3MEJNc2prc0xaeHZKUFZrdmU4OVlJ?=
 =?utf-8?B?Vk1nQUFCNVFRM0N0QS9SUlhQU1V1bFpINllidkpKRCt4dVdDbWkvMW8vTG5M?=
 =?utf-8?B?WUlXdDhsT0pRbEhXZmwwOWFWeVBSdDM0T2ZzZFNuSm90WmdibmxUdXBXWndx?=
 =?utf-8?B?YlRDVmZpdXlod0RrZWthTWdkU1VNZ01xbFIxV0kyN0F2NjAwbEFFcmM0WVBU?=
 =?utf-8?B?a2l3MmpTb25XQmNmWTJNWHJGY2pkcWdFcER5NldwZ291TVpMQnREc3p4ZzVQ?=
 =?utf-8?B?dHlSbXJqV1NDaG56VXhBQjZQZmpYL1NUMWtnOUFVTGdhNnpUTHdkUkhVMUYy?=
 =?utf-8?B?dDRJV0M5dEdpWTZtQWlZY0tHR08zRjgxTHpjYUZTQ3Z3dDZBM21RWDZpZzhu?=
 =?utf-8?B?S3ZqUzNxcEI3VlQ5QmdjN0dYcnBpTW9DZGtHZDdjVDBwMDhhTnV4b1pEbm5x?=
 =?utf-8?B?QXhDNGdTc1ZiNVVVWVpLQjJ2cWxKeGN1cVZTeDVGaTZBem14QlFOcmd1dUQ0?=
 =?utf-8?B?L3poNWdwN2RJV1l0QzZQd0k0RlZSdmRVZytUSWRPRUc2dWtiWXBWbnVTbVJp?=
 =?utf-8?B?YTJ2aFVRWUhIdTZsYldkUkplZllwcHRmblc4OStxNmxORWNPZjVxWXpKSGpl?=
 =?utf-8?B?clo2anB5dHNSSGg3UWVMc043Q1NOQUFZd3RucUxvK09RN1BHZlN5QTVQTkt4?=
 =?utf-8?B?eExpUml5TnJ5WktNNUFwMngrdmVuNFF4eXpHeExmNkNCdUFuTVM2ZlV1NDFW?=
 =?utf-8?B?NEVDTDEwbmhIeGwrejVXWkRlc29SMEQvWEkzTzNobnBXR0xjTEkyTzJSSVpq?=
 =?utf-8?B?cDB6TnBRd1U4N0dZc1lYc3pzNlFxVGFwSnNTc1JOMVMxejVXMGNUMko5RnVI?=
 =?utf-8?B?UnM0RXNDT3VKMDFZNHZxTWZxQ0tvL1U2cldLNFhFR0dDejJtcE8xRk5tL2NW?=
 =?utf-8?B?U0NHUDY1ekg1M0ZYa1ZtSzZCY25oeWhIMVlzMlB0MHYvMitVSW16aTA5VkR0?=
 =?utf-8?B?NXA4UkMweFJDY2VBUUh2SUQ0dXlLdS81TXlwWERqSVBIV1ZMdUxWaXdMdElk?=
 =?utf-8?B?ODZGVkdMZnhlZkpLRlpTMmNkTkV0S1IzRk0yeHFVaGtRUGJ4SjR0NEtvcktT?=
 =?utf-8?B?UVlkb0w4clhlZ2IyUkN1dDkzb0N1MDY0Z0Nydmx1QUhSQVphc3F6M0RyM1hO?=
 =?utf-8?B?QUExNlI2MUJZSHpydVRTSUc5QlZZSUdMbXZQM2wyUkRoNmRrdEJsK0pvV0Zl?=
 =?utf-8?B?ajRrMkorWFQrMEJvWUNXck5sYUxVTVpCVnEyd3VKN0J2N1h3cGgzbkR6bUNU?=
 =?utf-8?B?SXZ1NjR4SzdGTmZ4ZXBxMnYvUXZYaW53Tzdod3BRQ2pPQWpmTHFKTWU4eDdj?=
 =?utf-8?B?eXRyVGhQakJKbVBKWWZ2OTMxYmlCSE1Gd0Y5MlBXMjBlcjllQy9ISDEzaHZO?=
 =?utf-8?B?S090aloxRHFMYWp2U0wwNjVNdTkybzF2emxza0xIZVhaSmk2R0JPQThYclNk?=
 =?utf-8?B?WkFZNnNYajQ1eldtb2twMVRoQ2VOUDVDV25hWDhyMUpKeCt5dXZ4WkVsL1NU?=
 =?utf-8?B?bnR0S3ZDeEpOamZKYlQ3aHM1blpRK2dmQzY0THZqUUdIY0VBTlR2SVRTVzVO?=
 =?utf-8?B?ZmRBT3g4YkUvbFoxUDFPN2pYNyttTmZRZ2lsMmNTaTZaKzhGb3J0REtRMUM2?=
 =?utf-8?B?aGU2MzhnNzdVcU5qTmcwdGZUaFRRd01MYWFQVlpMeXUveU9MSHZHVFZGRmVm?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0059_01D8C1D9.27667640"
MIME-Version: 1.0
X-OriginatorOrg: rational-online.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR10MB6264.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f243a585-7767-433a-7721-08da8fdf87d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 08:12:24.5583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 16dbd641-f98d-4ec4-967d-799b7e2b4147
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 6+pB3xFmU3c0AQM/vSwwh5mb3WwLh3UKOcgPe3HGnFFIIe6KlCrFDqFm++EViKAoG7Oufd9P3Q06vFaMJXJOLHnozNSyn+sILrxKOnUbflU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3598
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 08:12:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170338

------=_NextPart_000_0059_01D8C1D9.27667640
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_005A_01D8C1D9.27667640"


------=_NextPart_001_005A_01D8C1D9.27667640
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

 


------=_NextPart_001_005A_01D8C1D9.27667640
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
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
o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_001_005A_01D8C1D9.27667640--

------=_NextPart_000_0059_01D8C1D9.27667640
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
BgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMjA5MDYwODEyMjJaMCMG
CSqGSIb3DQEJBDEWBBR1tQJ48/Y4aIrhbyAHobGLAZEbYTB9BgkrBgEEAYI3EAQxcDBuMFYxCzAJ
BgNVBAYTAkNIMRUwEwYDVQQKEwxTd2lzc1NpZ24gQUcxMDAuBgNVBAMTJ1N3aXNzU2lnbiBQZXJz
b25hbCBTaWx2ZXIgQ0EgMjAxNCAtIEcyMgIUF3N1tdIhDdefoaTOzlgDnin/Rz0wfwYLKoZIhvcN
AQkQAgsxcKBuMFYxCzAJBgNVBAYTAkNIMRUwEwYDVQQKEwxTd2lzc1NpZ24gQUcxMDAuBgNVBAMT
J1N3aXNzU2lnbiBQZXJzb25hbCBTaWx2ZXIgQ0EgMjAxNCAtIEcyMgIUF3N1tdIhDdefoaTOzlgD
nin/Rz0wgZMGCSqGSIb3DQEJDzGBhTCBgjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAoGCCqG
SIb3DQMHMAsGCWCGSAFlAwQBAjAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4D
AhowCwYJYIZIAWUDBAIDMAsGCWCGSAFlAwQCAjALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAE
ggEAolX9QXzQZZP4acRjxJgQteDGWNJZUAkH18WXj+2DfDFT9FkKINMIn/39UZNWfjvJ+wFaCgyE
LNIBvVC52Ugkcqt3XXw5BDQGUvUrIWNTGgPh0vk3ZK6TjM4AkAuQrlhvjmitf0HJAMxMgokdP0kW
zDUMbq8a9LI2mxLEsr3IOK78lb4qO5qHKPxDwh3KfmiYhBl83hmUmSrJti9ISg3lkjn4y1n9pWSS
6FN71NqivFZTlnHE8i9F2bhjgONA5rgR2CvrUFMLEhVrNttqzkMz0g2tdb0I9vo57l90CXU1a4qF
DpZhE9B1pMkyZR+SlAf573hPNj6nQGEO5QgOCEBbdwAAAAAAAA==

------=_NextPart_000_0059_01D8C1D9.27667640--

