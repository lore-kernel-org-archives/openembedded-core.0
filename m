Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.85])
 by mx.groups.io with SMTP id smtpd.web12.7261.1610020596113556488
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 03:56:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=td5OjG3Z;
 spf=pass (domain: kpit.com, ip: 40.107.139.85, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeLC7Gav2K9DPcnNymoLnA1e2XNvZdEi/g1ACUsNrD9EYEYwWFcKMaJOyOduZKcp4347esCznFAzDnIxFmcm/SzI9Dt36YsXruuHdUyPqgzgweUjLY6ESyZ6BpmWwOfO6qeXYEuCg52kdnlO8yfeMTtkVcFqMgrzNqBtGQuLSJ2nPWwyx/UolSirKVIUEFyWPlrjP38rBOO29zmpdVycLbbXHFE/2LnORdi/D3GqbGVrRILkWZI/0k60w5Wcid0recMJTOy4WtYxXCXO6jP6FzK8TRTnTe1vOUVURfPrYfrmezCFacdsu/zVZOvqc8OdEVaTL/C56CQuRKGnMFaepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzfHIKjAf9aLsEhawk4vQdKdKItLi6T8RRoBgUK1wzE=;
 b=PuZj/HZ/3uKHpcSbjUcJTsJ9/ZoUxDYzHujPEZYm7fg0e7wUMsoddVUT9wQjW79SM3lhogFLAviXN/m8GJiSacXeWOCNdu/zEemB+u9MnYNL755haW+3zyfpVxkN3CcOcz6BW8xmFN2t+iuRyql0Hjde2P1PnxygFRkzHnhaKG7v4TZ1Gx1JDlJ64HcKXbAGwI1iIa/FnGtOBpxGyQpiSuS/JjaUp8/zkvebIJnrt1oDR1c7e8LXNO2TEYSDwihWurm1g/KlY0FjL2dgak0Fir6+wDXmn5J3CLFycR6ZJZFkjHnv5XrKV86GnNW8fxFbWMPdNSJTxTal3cscdPZwHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzfHIKjAf9aLsEhawk4vQdKdKItLi6T8RRoBgUK1wzE=;
 b=td5OjG3Zb+tR64q671qZIdgquMfzv8KD5dITGCRKUU5TGCZMGfkTP8J6CnQK6heAa1Ck7fCprfXbaE7RrvQrGCrFe0qUTeMPl2rb5nyI+K2snFTXnqg/57jWEk4hXjd6FtRxjKF6W8WEYMs6RtrFEjuLHGIazBbH4xqh+ZUVVpE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:79::22)
 by MAXPR0101MB1481.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 11:56:31 +0000
Received: from MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c0c3:d811:3987:df57]) by MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c0c3:d811:3987:df57%5]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 11:56:31 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com,
	Harpritkaur.Bhandari@kpit.com,
	Sana Kazi <sanak@kpit.com>
Subject: [poky][zeus][PATCH] curl: Security fixes for CVE-2020-{8169/8177}
Date: Thu,  7 Jan 2021 17:25:46 +0530
Message-Id: <20210107115546.30737-1-sanak@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:1b30:b426:f9cf:4c7f:ce96:878]
X-ClientProxiedBy: BMXPR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::14) To MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:79::22)
Return-Path: sanak@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:1b30:b426:f9cf:4c7f:ce96:878) by BMXPR01CA0004.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 11:56:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 324584f8-4029-4998-e328-08d8b3034625
X-MS-TrafficTypeDiagnostic: MAXPR0101MB1481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MAXPR0101MB148120B3DAAD20B0CC4FF7D099AF0@MAXPR0101MB1481.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:46;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vwFQK4dvRxPuyVihR6lW3K76YLQvI4f2mP8gTourQsoR9cP0B5D1Bpgj7w/F54a2kC5WvWAWsFzv+sEqwtBER4NLqtNpHo/+BxgXFygx2rAUvKX5phsRGrGMx2oobMO6MxlUTrJum+HeWE9uT0k5o3f7my3rt47g7AOXOyjmttVY+gUVisFD/gF3NgCTyJ6mMH7gEbAwjomk9hjXaL/rszTOirHpxgrlsyFZ47kmak8ElzTI8dnqO1gnSy45SWGPOxUkJr1k9vp49CdDhX3+AaTbmadLkcrISna/47QPSk1tHXm/nKuTmOCEoqShSfojvQW+9F/PcNPmYHSL9WgzyRNLxn/CAf6sqRLtl9rgKm+vMFJlM4Sp2psrhiHgK/Bpr7KnUZiPRiRadBDM3ry2MGVeqxEzEKLnfdZ4arJML3A+VZwJP847jKtfAfBBL10Z6bIXzrbFT11w8N+EpQbPhva96BcwC7abiJradCbnUBLkZEMUHosq/VargO57gomGa6n4HX1O9qwETjgzXL7Agwna2smkZM1Vwn7SvvGoubb/+LZaTT80Vy8cpneYFKUk1Dqm1JCSPvVZ0YD7Z/CaEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(6666004)(107886003)(15650500001)(36756003)(1076003)(8936002)(69590400011)(5660300002)(478600001)(8676002)(2906002)(66556008)(66476007)(2616005)(66946007)(4326008)(16526019)(186003)(6486002)(83380400001)(966005)(52116002)(316002)(19627235002)(6512007)(6506007)(66574015)(11965001)(134885004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4tetYTcj76DIDvkvrcKCP6G6fBjs+lvtZLhtByx3TqjUWgogWD69TSrlKbaG?=
 =?us-ascii?Q?e3jC0+J15Mtssvb+NIUzr/o+Zuy7t3nUjtRPQJxd7YGvi8J6ioujfRzDw9FX?=
 =?us-ascii?Q?nDSYHv94L4wSJ3rCEkXpFuNu0NOuR4SAoG2wB0ns4uf5lC1gWZRAycvdSxaZ?=
 =?us-ascii?Q?qwmW5tPd2qhtfsHN9tOiY+UKSWmcR8ZQQpH9g6qP9iujrj4V5yUt7r3gXR0n?=
 =?us-ascii?Q?cOPk5A0ZcCzyxCEmIs9tQLxqfIeo8DTrXaVoN0TQkEmTUu+jPpO3uRxdj5x9?=
 =?us-ascii?Q?EGH3V5z7RmXHZCaO/vd6HtVMOedm6d4kdzM2JmIRZq0+gB4t8Y/1GfS4SyGW?=
 =?us-ascii?Q?nX1VuAkdPkES7qeLgOV4c9CR7xNp7cy/EW416I36fAFvLqFdg7hFL+EckjUi?=
 =?us-ascii?Q?RVopomkP6FY/z314pdqoa2TG2Xh5y3IcDKUKdjAuryuFfy7pOH1zVvy9F4wO?=
 =?us-ascii?Q?NgtlncWsiNMnxqnz3/P+3G/SISvKV2egskAX2NQOYH5toWcNmb6zTyDlJuw+?=
 =?us-ascii?Q?Y/AAVaozSTNGRUyTr7FninxOceIrDN2A8Nzq0bSo2jpHPPOVkzqzoiE9rguY?=
 =?us-ascii?Q?96+npJNGDgELUOPZr9n0ZFLjvJZV9JtW0zlx+gwU4gw4yEn3NaWTwuPGaPOa?=
 =?us-ascii?Q?SGR33p1db2Gz8JvmdrzRtvyz66Koo9KilIezgGv+ReCS83ZkXteaJPbl/Dki?=
 =?us-ascii?Q?4KSEnZuuoaCfCvqYrM0KVk7FNRHWDqMZX7ZFarylkoac/wHinSFH/7cYHwNe?=
 =?us-ascii?Q?AukTXGvq0BFbFa7QAb/b3vYeXAA7SyHynloVlUh+aGGJkfXZG0Gi8k6qSgKB?=
 =?us-ascii?Q?KmYZo2+4liptMKPfGo0Bp3G5lhbpdP33MWF3AQgpjKZ2WMsgj3Cje+sbK24g?=
 =?us-ascii?Q?/cUNfqXfsS8c6Gh6AsmUMwTI5CXotJj3euwxFiBq+4tXLDihazjty5CW9kmx?=
 =?us-ascii?Q?dPYMLAYjUjbhWBP+aEbkVoaSPfw7Lqoh6hvKQBOkND+699Lz3qYuuFdtZd+3?=
 =?us-ascii?Q?fC8h2K5V2N4iJLrNQqcA0x/t3heXEHFO7BBP0sh0y5fDUq/lYDMpLyrRolfE?=
 =?us-ascii?Q?UpgX+5q9?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 11:56:31.3158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: 324584f8-4029-4998-e328-08d8b3034625
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euXCfzsPi03iQaW5pS8m5g6E4X8XU6QDd9YuVLbnRh/XJaIvaCGt0uZUllLTqF8Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1481
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Armin Kuster <akuster@mvista.com>

Source: https://curl.haxx.se/
MR: 104472, 104458
Type: Security Fix
Disposition: Backport from https://github.com/curl/curl/commit/{600a8cded44=
7cd/8236aba58542c5f}
ChangeID: 1300924f7a64b22375b4326daeef0b686481e30c
Description:

- Affected versions: curl 7.20.0 to and including 7.70.0
- Not affected versions: curl < 7.20.0 and curl >=3D 7.71.0

Fixes both CVE-2020-8169 and CVE-2020-8177

(From OE-Core rev: f42702baee57ab3d1b7ab7833e72c7d56ad4ee94)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Sana Kazi <sanak@kpit.com>
---
 .../curl/curl/CVE-2020-8169.patch             | 141 ++++++++++++++++++
 .../curl/curl/CVE-2020-8177.patch             |  67 +++++++++
 meta/recipes-support/curl/curl_7.66.0.bb      |   2 +
 3 files changed, 210 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8169.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8177.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2020-8169.patch b/meta/reci=
pes-support/curl/curl/CVE-2020-8169.patch
new file mode 100644
index 0000000000..774567c017
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2020-8169.patch
@@ -0,0 +1,141 @@
+From 600a8cded447cd7118ed50142c576567c0cf5158 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 14 May 2020 14:37:12 +0200
+Subject: [PATCH] url: make the updated credentials URL-encoded in the URL
+
+Found-by: Gregory Jefferis
+Reported-by: Jeroen Ooms
+Added test 1168 to verify. Bug spotted when doing a redirect.
+Bug: https://github.com/jeroen/curl/issues/224
+Closes #5400
+
+Upstream-Status: Backport
+https://github.com/curl/curl/commit/600a8cded447cd
+
+CVE: CVE-2020-8169
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/url.c               |  6 ++--
+ tests/data/Makefile.inc |  1 +
+ tests/data/test1168     | 78 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 83 insertions(+), 2 deletions(-)
+ create mode 100644 tests/data/test1168
+
+Index: curl-7.69.1/lib/url.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- curl-7.69.1.orig/lib/url.c
++++ curl-7.69.1/lib/url.c
+@@ -2776,12 +2776,14 @@ static CURLcode override_login(struct Cu
+
+   /* for updated strings, we update them in the URL */
+   if(user_changed) {
+-    uc =3D curl_url_set(data->state.uh, CURLUPART_USER, *userp, 0);
++    uc =3D curl_url_set(data->state.uh, CURLUPART_USER, *userp,
++                      CURLU_URLENCODE);
+     if(uc)
+       return Curl_uc_to_curlcode(uc);
+   }
+   if(passwd_changed) {
+-    uc =3D curl_url_set(data->state.uh, CURLUPART_PASSWORD, *passwdp, 0);
++    uc =3D curl_url_set(data->state.uh, CURLUPART_PASSWORD, *passwdp,
++                      CURLU_URLENCODE);
+     if(uc)
+       return Curl_uc_to_curlcode(uc);
+   }
+Index: curl-7.69.1/tests/data/Makefile.inc
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- curl-7.69.1.orig/tests/data/Makefile.inc
++++ curl-7.69.1/tests/data/Makefile.inc
+@@ -129,7 +129,7 @@
+ test1136 test1137 test1138 test1139 test1140 test1141 test1142 test1143 \
+ test1144 test1145 test1146 test1147 test1148 test1149 test1150 test1151 \
+ test1152 test1153 test1154 test1155 test1156 test1157 test1158 test1159 \
+-test1160 test1161 test1162 test1163 test1164 test1165 \
++test1160 test1161 test1162 test1163 test1164 test1165 test1168 \
+ test1170 test1171 test1172 test1173 test1174 \
+ \
+ test1200 test1201 test1202 test1203 test1204 test1205 test1206 test1207 \
+Index: curl-7.69.1/tests/data/test1168
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- /dev/null
++++ curl-7.69.1/tests/data/test1168
+@@ -0,0 +1,78 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++followlocation
++</keywords>
++</info>
++# Server-side
++<reply>
++<data>
++HTTP/1.1 301 This is a weirdo text message swsclose
++Date: Thu, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Location: /data/11680002.txt
++Connection: close
++
++This server reply is for testing a simple Location: following
++
++</data>
++<data2>
++HTTP/1.1 200 Followed here fine swsclose
++Date: Thu, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 52
++
++If this is received, the location following worked
++
++</data2>
++<datacheck>
++HTTP/1.1 301 This is a weirdo text message swsclose
++Date: Thu, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Location: /data/11680002.txt
++Connection: close
++
++HTTP/1.1 200 Followed here fine swsclose
++Date: Thu, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 52
++
++If this is received, the location following worked
++
++</datacheck>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++ <name>
++HTTP redirect with credentials using # in user and password
++ </name>
++ <command>
++http://%HOSTIP:%HTTPPORT/want/1168 -L -u "catmai#d:#DZaRJYrixKE*gFY"
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<strip>
++^User-Agent:.*
++</strip>
++<protocol>
++GET /want/1168 HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic Y2F0bWFpI2Q6I0RaYVJKWXJpeEtFKmdGWQ=3D=3D
++Accept: */*
++
++GET /data/11680002.txt HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic Y2F0bWFpI2Q6I0RaYVJKWXJpeEtFKmdGWQ=3D=3D
++Accept: */*
++
++</protocol>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl/CVE-2020-8177.patch b/meta/reci=
pes-support/curl/curl/CVE-2020-8177.patch
new file mode 100644
index 0000000000..46dc13938b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2020-8177.patch
@@ -0,0 +1,67 @@
+From 8236aba58542c5f89f1d41ca09d84579efb05e22 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 31 May 2020 23:09:59 +0200
+Subject: [PATCH] tool_getparam: -i is not OK if -J is used
+
+Reported-by: sn on hackerone
+Bug: https://curl.haxx.se/docs/CVE-2020-8177.html
+
+Upstream-Status: Backport
+CVE:CVE-2020-8177
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/tool_cb_hdr.c   | 22 ++++------------------
+ src/tool_getparam.c |  5 +++++
+ 2 files changed, 9 insertions(+), 18 deletions(-)
+
+Index: curl-7.69.1/src/tool_cb_hdr.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- curl-7.69.1.orig/src/tool_cb_hdr.c
++++ curl-7.69.1/src/tool_cb_hdr.c
+@@ -134,25 +134,11 @@
+       filename =3D parse_filename(p, len);
+       if(filename) {
+         if(outs->stream) {
+-          int rc;
+-          /* already opened and possibly written to */
+-          if(outs->fopened)
+-            fclose(outs->stream);
+-          outs->stream =3D NULL;
++          /* indication of problem, get out! */
++          free(filename);
++          return failure;
++      }
+
+-          /* rename the initial file name to the new file name */
+-          rc =3D rename(outs->filename, filename);
+-          if(rc !=3D 0) {
+-            warnf(outs->config->global, "Failed to rename %s -> %s: %s\n"=
,
+-                  outs->filename, filename, strerror(errno));
+-          }
+-          if(outs->alloc_filename)
+-            Curl_safefree(outs->filename);
+-          if(rc !=3D 0) {
+-            free(filename);
+-            return failure;
+-          }
+-        }
+         outs->is_cd_filename =3D TRUE;
+         outs->s_isreg =3D TRUE;
+         outs->fopened =3D FALSE;
+Index: curl-7.69.1/src/tool_getparam.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- curl-7.69.1.orig/src/tool_getparam.c
++++ curl-7.69.1/src/tool_getparam.c
+@@ -1807,6 +1807,11 @@ ParameterError getparameter(const char *
+       }
+       break;
+     case 'i':
++      if(config->content_disposition) {
++        warnf(global,
++              "--include and --remote-header-name cannot be combined.\n")=
;
++        return PARAM_BAD_USE;
++      }
+       config->show_headers =3D toggle; /* show the headers as well in the
+                                         general output stream */
+       break;
diff --git a/meta/recipes-support/curl/curl_7.66.0.bb b/meta/recipes-suppor=
t/curl/curl_7.66.0.bb
index a54e0536e9..506ae0eade 100644
--- a/meta/recipes-support/curl/curl_7.66.0.bb
+++ b/meta/recipes-support/curl/curl_7.66.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbe5d9e1419c4363f=
4b32037a2d3b7ffa"
 SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://CVE-2019-15601.patch \
+           file://CVE-2020-8169.patch \
+           file://CVE-2020-8177.patch \
 "

 SRC_URI[md5sum] =3D "c238aa394e3aa47ca4fcb0491774149f"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
