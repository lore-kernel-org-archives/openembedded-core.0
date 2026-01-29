Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B994AD358E3
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 08:33:15 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10804.1769675591886627700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 00:33:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=dxRtKgvN;
 spf=pass (domain: est.tech, ip: 52.101.69.52, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOIGvwS4ktFWhcBd9piTaZcEnMG1YGLqG+ZR6L9JV3k/dRHQvofELK8ANqlX+aNIwvBvB+i9bAGJJcar57VApWP0lgl/aospsdQb1MY1/Iq1gLsDjAU6EiLNTLjfVszLkINLmagqt5M6LIqNT0RpSNUJtJ9YtLx+slMzBOe9nVATZkOnBrOvb3FMSz5fz7hzwc0ox0+PLPjAhCIce5nZ6K/GSORsagO0Z45bKhVbMgtH93Vfg9Z5oFaNOoLk0RgrkddSXIxVM9byfbawjeBrM6TYYmbUgd3p8b01vCCbOA7SUwrL2Q3de36+kury73Th4p36gbG5qfsiV9aC9mn/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSMUCIpRXiDw5nzmR5BSXbZ9KaxuqtBiCRk6p6oaido=;
 b=w6+juGQU7ZHtE9NyCTihjmzw6IDEz69gjQn2tCsjZ6zx6jMjO0IrcGui+o1w8fwCs8B9+KQb9LkMnI6SSsyFp0dYOZp6sZjyW0nCzWcltRgQJCjcq+r85S6jla6GDJEP2GmG0PMaZRknbGW+9/uWg/BA7qh4VCyUlE1KI2zpx4xDW3W2o2897apcdkRgvjZPMVg+Cly1bumoRvf1diNp4dKBjR/T4s2V8TgGwmawml/hKC9ca6dticYgrKVBkyt2Pjsj4A/rgNC7+9WDGRRgrHYQRqwk3sVp3d4sdN/4JeolLix635ZFdwHlY1BOoYKZhFUKsEyn6hxUSsYfCD7PQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSMUCIpRXiDw5nzmR5BSXbZ9KaxuqtBiCRk6p6oaido=;
 b=dxRtKgvNclOU/dov5Y2wwOojr6R0QXnI5QDponLUne21ylW327k51BAiJPeP36WA8LKr66jpJmjFT+G3OufTh5ffm77yYElrVVnaPRQlJ7A9qopqlI4QIAis2YNFqBGwdJ7eA8zl0/xADaZFmaeUDFWaPZ8EusgOnfpQS8MCKIOZMCvShZH6A8wb93OX2Mhkh2w4tFtUmOTbt6LWWHHmP25eyd1fFi+u27cG0HwAnRxXMMjv0phmw5EMiJZfdE/izMhIGfpCJtGtP03F0ANhaY522qEhMPLv1oD5Gbs5/Nw3UHyWHRzvHbQju0JUMhJfNy0MdZhqckpo9a/oDP1CBw==
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9e)
 by AM7P189MB0646.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 08:33:06 +0000
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::e967:c0a2:c8e1:99e]) by DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::e967:c0a2:c8e1:99e%5]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 08:33:06 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Randy MacLeod <randy.macleod@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
Thread-Topic: [OE-core][PATCH v1] libconfig: add ptest support
Thread-Index: AQHckF9WTpead0Uhr0+hKOkrljk1fLVoSx+AgACHnwU=
Date: Thu, 29 Jan 2026 08:33:06 +0000
Message-ID: 
 <DU2PPFB77F8FB197407E3ABBE614C6C569DFE9EA@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM>
References: <20260128140635.43214-1-pratik.farkase@est.tech>
 <5f426a3e-4220-4274-b38b-e2bae5188cee@windriver.com>
In-Reply-To: <5f426a3e-4220-4274-b38b-e2bae5188cee@windriver.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PPFB77F8FB19:EE_|AM7P189MB0646:EE_
x-ms-office365-filtering-correlation-id: e17fcf18-0feb-44d1-2726-08de5f1106c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?RyRmr0X7VhfrRGkRUSiWPkSKPw74PYTguI9lBFs8/WxHgK29Fn+bsKnY5Xq+?=
 =?us-ascii?Q?t9sDB3+gRdB78XtSisUiHGx5kurtpQZFMEpQ6LkIOxYMpDJGSarSSAiCT97l?=
 =?us-ascii?Q?MWdvbNojnVPPS0GNGx13cUxtw2SfqdAW3Wf41Tu6Fy6rJsY29Zzci4MoBfId?=
 =?us-ascii?Q?ej0HByPPoGVSc5iLDSISX5u/1N/mh02DvRRhe9F0w12nUahw4pj8N4BhM/S3?=
 =?us-ascii?Q?3eR5BpbE6uoFCDKGeqIi6eeJBKSE/5sQsxT+4cxxUWAoHpgPJb+GnPku3pSM?=
 =?us-ascii?Q?qgRx/95lbZDIaudsDUWhEvZumCiq24adyAIGoTgZp7K4iCvghxJbzWwLINiT?=
 =?us-ascii?Q?KpYK0sA9MOkWHHtgP3gWQnjzmQ/9IwvovTdJ36YtHerh77tYpOlSXnX83LOM?=
 =?us-ascii?Q?+s197vQJ4o4xzMQPmh3pzCyOJX48rEb83Y9x5HuVbfcLdcWeVB+Dy5JBdT4t?=
 =?us-ascii?Q?RtwoCc5j9HNfJsKKLRxPtEvtTgPRXLEFsf9YlUn/G6bbuCIywlQQRFdv+/uV?=
 =?us-ascii?Q?mIpU2l8E6MHOnd4K6WHl1EaDa1YFC6LROSBvAGMy09EppEPlaS4TxIU7ILTp?=
 =?us-ascii?Q?lA2ir9B63Dkrb2b99mk+I/SyM/IudH/mwHnY7rwxpQ9PI+ZCFl2DbFji2R36?=
 =?us-ascii?Q?m3vE0CkTYHXh0FSMI2pHtDesIbIedvcOI5y/ClClcZ8hp4rYQihem0WUuqjs?=
 =?us-ascii?Q?zRs7Naed/OvxK8u4+9gR+Qs7+S+EuPWYYP8JnQpPS4WnUhMHdnQQyLAHKMCI?=
 =?us-ascii?Q?npmhJyMFa/ZIE5wTuIG5Dul8bZOhHYkDpi+kTMhJ6BE4FvE7g9IFG5vLmTR2?=
 =?us-ascii?Q?i0SIoedaxCqmZ0ricHemizagHct0MN+txAsp81XuBMaqayo2r/QIXeYb36Ev?=
 =?us-ascii?Q?8j36d/r7+SI6ZutUrUlBcts+/VvwbjFOxAI4oyYJYf/ztVQtmUW8EzAOtzYG?=
 =?us-ascii?Q?UzGKKWJWMNUog5DQqzHhS1+kO7bWKhEeaFJ2LL6I8DRc/5k//2Qj/QZV4Vfq?=
 =?us-ascii?Q?HWilzxn5ECTHNyu51vYEQMIQxb4bW6QXbMLCnRENbpTO1bUf5H3avTALZmF1?=
 =?us-ascii?Q?9IWb3yopV0Q5BKAO3L9BIei5jGteWf+8d+/7LUhKEZyxooi5FsVqZovTXgTh?=
 =?us-ascii?Q?le9n8uS1U1V5lATmK82LiYVYNbuJIiP5y4EM4Ij5rOv98CcwTu+pi3g0/WsA?=
 =?us-ascii?Q?LMVqj0sjGDTeUTnemKQGgL6J2RExUC4jdWeQOnuxr1eH+7beN8nTY0oEfMSO?=
 =?us-ascii?Q?Qus0pq228HHo4aEt6egCLANssIhf/IPHwvWg+S8Mjc/jTpicHuOYHt9TgFG6?=
 =?us-ascii?Q?6k4r5fIDn/4MloLP6nes6xbyrHdp2g3xCjb3QHlQ++yEP2+60yv2JNoowehO?=
 =?us-ascii?Q?+ZwIF33XJMrhi/Mlkn3pFoh6Mtl7qU1u0U5HZovATxqU+xfATPR8kHXsnCVk?=
 =?us-ascii?Q?IL2f9DUdGdQaaYf92skNQwYiIUeyOIge9NMyM7s99XR9O4Z/oW7S+Lt/ewUI?=
 =?us-ascii?Q?shVSTY9j+m7NeElt70kY1a8+iarRx0EK4OKM2As/Z0Up0cV2Ls5bOiWwvQxy?=
 =?us-ascii?Q?z2WgbU6hsNFDt8FbHQQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nk+zFXYn2nz2KwlzHXOwZEeGdcnQK+FYYecntyoS9/ri2ctYUNytpTKaEllL?=
 =?us-ascii?Q?zqBk3ELf8jffIVpLSNarfF0WFwPQy0vzMXDCd/3JccG84b82Kd37IJtZhZ3B?=
 =?us-ascii?Q?8bhT6SBGJ6Mkbq/sf9OwlIokd8zEBsbdaIQ5bNOMjVN17N2EjVgKg91i0H03?=
 =?us-ascii?Q?1X7F+MBfEM+6JP+N3JmNkRqWQzNGVWnCt7Z+8G6hAk1GADLlcVqsnKNnZ6vT?=
 =?us-ascii?Q?Szqc4iLonI2sLhgju5zbBdnxBeMwCT7ZtwAjtQcLJDKDaRyLg8r8ZTN3Iv4R?=
 =?us-ascii?Q?Wf5Uec6HxEtOyiRS+e7ZXC5MrZGJwk8zmhH+iZY4ffdLx7/bzMcAAcNHKMQU?=
 =?us-ascii?Q?Bo8rBEm1qTlVjyPXmDmCSLcHSrma/4nk4YDOCd4BSKesQQhgTzD1H/h+szUI?=
 =?us-ascii?Q?+FnEm5zLMCvyssjhnqy4ccnuawZ8m6Z7NPuUrDoA9GV/7rHk4KvJYmlrX5De?=
 =?us-ascii?Q?WfyrOChJTcmUZeREcN3fF6Eef4V+lT4jjH4jO1ZNwRFKmiCa44FcJl38tsfC?=
 =?us-ascii?Q?S+4gi52AhaZMj2wDOXMAGnRDFIEc1mhnf/IF5e6Q0qeDvzdChWMg1ZFZCfVF?=
 =?us-ascii?Q?DiCX3Fc3rtpqkI89+bpihjpv7AURAUn8xMXti8QL0Yn8GFlR7KKhrCS/1jvE?=
 =?us-ascii?Q?5wfI0JWssIXIaW2TBJFQPkgE2tP0rFmojYJp0SwM3x46wahZt69Jmp70mZqL?=
 =?us-ascii?Q?z5QOYuP5UyrTer5atwLj0mFAB0va7clZWOEcbNIKV4bBSnlMnFV2RDPSyO1Q?=
 =?us-ascii?Q?QSK5fLaUhTETe0Obzay8pg9gv5b+fi+bGvlLbqfbg92HcjBxxhAN0hE8d0OS?=
 =?us-ascii?Q?Z0uDcxcDHrL7OHB1n8++soWenHXyN8sd58bVzY79mKMI7S1h7rMaea/9y3QD?=
 =?us-ascii?Q?Q+344p/CMWS5b8YXumZYrAulDH4UC82gxImpwZP3ec+DGc8qJWCjLlRNWk7U?=
 =?us-ascii?Q?Goeof6Xl0sMpDug7lga7AcSG99KpZXaINUY0pSTn7+pBPmsI7UYXMGOUgg12?=
 =?us-ascii?Q?ONmYSsn8GtR3m12739/D9qiPY/DuCqpuhHXD2rLzl/dMBjIBmY+on1xiczyq?=
 =?us-ascii?Q?/Wyz0p4W8zWPvEZR9nyIV1L/ISp4KgZt1nNG8C9DQjayLYllHEMwHgjIaSEI?=
 =?us-ascii?Q?zg3BRXG5iuWDvP6EgMWFPdFggOcFEKr1a0/Zxo9mui9p46JNTkPAXapVcVjJ?=
 =?us-ascii?Q?yTq3q+CN36T20US0IaQyVw1zvPaIH+XVGvVDr/ffJSuqYi10h7xfygEUMKat?=
 =?us-ascii?Q?y5mJb+eLUr9Ddcy+kRJOK50o11mRrUjiCmiWKdfq35wLLEkEmmnN3WVf8ZRD?=
 =?us-ascii?Q?pKaJX5GLbcKnBYjG1Pd+iHun5sPfr6lNvWB59aekMMINkbwxNFc5mNxy64eO?=
 =?us-ascii?Q?JT4SilWZoKMZjETKjUlkW1H0YeB4ZeuWAdirueSWN58R1cwkB7IjeVYrggZ6?=
 =?us-ascii?Q?gu60O94jZD3ux4hwfSz51B64fFGLmSiCH1Buoh2kQOxDQl//TuwBeD/WBytd?=
 =?us-ascii?Q?q2Kqcr7Iqk90Cm9ss9HXp+m3UEpMlaVMsYHm6y5QBTMN1L5fFnz8XTO6ndmd?=
 =?us-ascii?Q?N1P0f3bn3NCcwcyGQN2+9wvb1HTvH19W+jjkGbpmZWwU6v0O6lZn2vezWOFZ?=
 =?us-ascii?Q?A8Cbt+e/9NVShEGeyUuiA0qzAhmL+KRy6IldMaVSsmU9VwrX8pdnn68vPCIZ?=
 =?us-ascii?Q?Nnw9dLv6O1j0W7wPjq8OJbDXVE6swZ9OpQPBps1U9CqoltmQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e17fcf18-0feb-44d1-2726-08de5f1106c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 08:33:06.5090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JdbxG0ZSK6EmrmpWzx9PdBdyPN+gzDS+OKAxcL6y0KFPEC5GueOsRDBeYoSd1Z9IdFmvZkjcMLA4dtCWFR8EKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0646
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 08:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230125

Hi Randy,

Good catch! You're absolutely right - the bash dependency was unnecessary.

I've removed the RDEPENDS on bash. Patch v2 is sent separately.

Thanks for the review!

Best Regards,
Pratik

________________________________________
From: Randy MacLeod <randy.macleod@windriver.com>
Sent: Thursday, January 29, 2026 1:26 AM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support

Hi Pratik,

On 2026-01-28 9:06 a.m., Pratik Farkase via lists.openembedded.org wrote:

Add ptest support to enable automated testing of libconfig
using ptest-runner.

Nice, thanks.



The implementation uses libtool --mode=3Dinstall to properly
install test binaries, avoiding issues with libtool wrapper
scripts. Tests are built via 'make check TESTS=3D' to compile
without running during the build phase.

The test suite includes 16 tests covering parsing, formatting,
binary/hex values, escaped strings, and various edge cases.
All tests pass successfully on qemux86-64 :
START: ptest-runner
BEGIN: /usr/lib/libconfig/ptest
[TEST] ParsingAndFormatting
parsing testdata/input_0.cfg
parsing testdata/input_1.cfg
parsing testdata/input_2.cfg
parsing testdata/input_3.cfg
parsing testdata/input_4.cfg
parsing testdata/input_5.cfg
parsing testdata/input_6.cfg
parsing testdata/input_7.cfg
[ OK ] ParsingAndFormatting

[TEST] ParseInvalidFiles
[ OK ] ParseInvalidFiles

[TEST] ParseInvalidStrings
[ OK ] ParseInvalidStrings

[TEST] BigInt1
[ OK ] BigInt1

[TEST] BigInt2
[ OK ] BigInt2

[TEST] BigInt3
[ OK ] BigInt3

[TEST] BigInt4
[ OK ] BigInt4

[TEST] BigInt5
[ OK ] BigInt5

[TEST] BigInt6
[ OK ] BigInt6

[TEST] BigInt7
[ OK ] BigInt7

[TEST] RemoveSetting
[ OK ] RemoveSetting

[TEST] EscapedStrings
[ OK ] EscapedStrings

[TEST] OverrideSetting
[ OK ] OverrideSetting

[TEST] SettingLookups
[ OK ] SettingLookups

[TEST] ReadStream
[ OK ] ReadStream

[TEST] BinaryAndHex
some auto big hex: 4294967296
some auto big bin: 8589934591
negativehex: -1430532899
[ OK ] BinaryAndHex

16 tests; 16 passed, 0 failed
PASS: libconfig_tests
DURATION: 0
END: /usr/lib/libconfig/ptest
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Change-Id: Ibd69ccd63ce0168571d46a199c08be59ea748d69
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech><mailto:pratik.farka=
se@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libconfig/libconfig/run-ptest             | 16 ++++++++++++++
 .../libconfig/libconfig_1.8.2.bb              | 21 ++++++++++++++++++-
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-extended/libconfig/libconfig/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 739995bcfe..7c5810f252 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -29,6 +29,7 @@ PTESTS_FAST =3D "\
     json-c \
     json-glib \
     libcheck \
+    libconfig \
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
diff --git a/meta/recipes-extended/libconfig/libconfig/run-ptest b/meta/rec=
ipes-extended/libconfig/libconfig/run-ptest
new file mode 100755
index 0000000000..d81fcf4def
--- /dev/null
+++ b/meta/recipes-extended/libconfig/libconfig/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+cd tests
+
+for t in libconfig_tests; do
+    if [ -x ./$t ]; then
+        ./$t
+        if [ $? -eq 0 ]; then
+            echo "PASS: $t"
+        else
+            echo "FAIL: $t"
+        fi
+    else
+        echo "SKIP: $t"
+    fi
+done
diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb b/meta/reci=
pes-extended/libconfig/libconfig_1.8.2.bb
index 6e08a7b04b..9ae0ce2e6e 100644
--- a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
+++ b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D17c8e32f0f72=
580cc2906b409d46b5ac"<file://COPYING.LIB;md5=3D17c8e32f0f72580cc2906b409d46=
b5ac>

 SRC_URI =3D " \
     git://github.com/hyperrealm/libconfig.git;protocol=3Dhttps;branch=3Dma=
ster;tag=3Dv${PV} \
+    file://run-ptest \
 "
 SRCREV =3D "a42cb47c1526a4f2ed025fcbb2289863375bc898"

@@ -17,7 +18,7 @@ DEPENDS +=3D "bison-native flex-native"

 UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"

-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest

 PACKAGE_BEFORE_PN =3D "${PN}++"
 FILES:${PN}++ =3D "${libdir}/${BPN}++*${SOLIBS}"
@@ -27,3 +28,21 @@ do_compile:prepend() {
     rm -f ${S}/lib/grammar.[ch]
     rm -f ${S}/lib/scanner.[ch]
 }
+
+do_compile_ptest() {
+    oe_runmake -C tests check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    if [ -f ${B}/tests/libconfig_tests ]; then
+        libtool --mode=3Dinstall install -m 0755 ${B}/tests/libconfig_test=
s ${D}${PTEST_PATH}/tests/libconfig_tests
+    fi
+
+    if [ -d ${S}/tests/testdata ]; then
+        cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/
+    fi
+}
+
+RDEPENDS:${PN}-ptest +=3D "<mailto:@@-27,3+28,21@@do_compile:prepend(){rm-=
f${S}/lib/grammar.[ch]rm-f${S}/lib/scanner.[ch]}++do_compile_ptest(){+oe_ru=
nmake-CtestscheckTESTS=3D+}++do_install_ptest(){+install-d${D}${PTEST_PATH}=
/tests++if[-f${B}/tests/libconfig_tests];then+libtool--mode=3Dinstallinstal=
l-m0755${B}/tests/libconfig_tests${D}${PTEST_PATH}/tests/libconfig_tests+fi=
++if[-d${S}/tests/testdata];then+cp-r${S}/tests/testdata${D}${PTEST_PATH}/t=
ests/+fi+}++RDEPENDS:${PN}-ptest+=3D>bash"

Why do you need bash rather than any posix shell?
We run the ptests in a minimal environment so if busybox shell works, pleas=
e drop this.

If not, please either remove the bash dependency or explain it in the commi=
t log.

Thanks,

../Randy







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#230097): https://lists.openembedded.org/g/openembedded-=
core/message/230097
Mute This Topic: https://lists.openembedded.org/mt/117507676/3616765
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core+owner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [rand=
y.macleod@windriver.com<mailto:randy.macleod@windriver.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-




--
# Randy MacLeod
# Wind River Linux

