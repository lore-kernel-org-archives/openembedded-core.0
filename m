Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861ABC79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:35:38 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12382.1788960935098385025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=EXkbS47J;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.72.38, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGkIvPPpBNOF+arMxy3LsY8mjkTzqgSC+5BR/mHy/iRiFp8ozGhaoFDtvLKiRf/dzUU8jIyXac4S4eQ5vvLqPbeft6THVqtd9+PMSwnFfTbNRWZv+ph+SMMZ/x2uRL62ByEYiS0hJ7HqB8msAwz6wzsBHLz4gQJuXtFNxuRmAIg30UwNfWc7g6SI9kpqB88hFgDV9rpSHblj0nTBHVPToACfRZz+uupLfA05TEIlk43RVUjXjEWrocDWt2YtA1GZFUw0Bi+0/pYySbizeB8pSRmozUZ8PbWtr0+uAB3xc6PT7XWCIJhoxG0rked4tw3HlQ9xVyy+GuaDkrLocNe9Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qSzjwqHn89OeYq/y2zrVHCDO014JyYCC+Sg2hZnOd0=;
 b=m8GmsEgKGHczHXSnwHmmaWWodK+DmrVn845LvkN1YtGcPazS0iiYS3Vhv/sMGWKLJHtwtYiVQvTmJfZRwKRrxwt6Cy9AhGvBIr5w2PC8m55ZVBadeYZ3hLAzrKpqlkafrdxz9JziRbn99U8VbPFgPfLWruTs71zjUSxRDvKuNMWlG9YjpV/lMNIoi4vJMAeRA6hIntBGmNfwTYhyhwI6823ktZlXFra2FQniLqH6WUlh+om/9WK+l/YA2i2YNeXYOhFQEtnIk8Sc8sjNUGY2CbuFXFwu+ZQPpxOq39no1P1dbkqHOtXX3OJeXIadFDEpYEK4ZEWNubZTuSkkZosqTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qSzjwqHn89OeYq/y2zrVHCDO014JyYCC+Sg2hZnOd0=;
 b=EXkbS47JXBBdKZ/cHVojwR/hkw6SFIN1OxtOsvSvnlovHA8o3INPO3vMHbPJehT8lkgw2X2bnYSM9AXORaUQsaukfQI4mKmHWp8o0t7j6OA/adZSNJGM6lEDxF7w64i4YGFvXtSl3BM2E7YWoIDOQuLjyZ4Yi1G+54D1uku7QAaQyRAA33XgZSlB2Nq+pEEf6/BZNoP9VzCQgBiTP4WwgvB2g1CyDjdlPHhq+cUW7dO6DXS6xhgawjHCfi+ckoUGYYSMtmN7lMa0sxcaRzV/cvTHM2wU0f9b7bkf71919YjDVAh1KqK70WKvtDafzWKKBvIfPz1/DfVTwhoAtW9iiQ==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by VI0PR07MB12084.eurprd07.prod.outlook.com
 (2603:10a6:800:33b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 13:35:30 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.008; Wed, 9 Sep 2026
 13:35:29 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH 1/5] gnutls: fix CVE-2026-42012
Thread-Topic: [wrynose][PATCH 1/5] gnutls: fix CVE-2026-42012
Thread-Index: AQHdQGAUEIYZ2PsTu06uQUJr4RSawA==
Date: Wed, 9 Sep 2026 13:35:29 +0000
Message-ID: <20260909133510.3286-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|VI0PR07MB12084:EE_
x-ms-office365-filtering-correlation-id: c15a64b5-1a51-44d3-8993-08df0e7736fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|5023799004|11063799006|10067099003|56012099006|18002099003|6133799003|12006099003|3023799007|13003099007;
x-microsoft-antispam-message-info: 
 Mhhf6l1Q55uMM+9ciDn7qvUka4JTEvQ1MC3vzAh1rcqOKac2bETAHCKSk83jxW+fdKRMbcgOTbIDSTMo6ohhMnpVeRUvHsVjA41dZqvjSv5QEgU+pOtMOAri2UzPZAlqaK2shwVEmW0gxg/p6QbEp75zQhInXH+NESWJEs+SAtLIqwILPmUt8iUomFJ1C5+n9fE0hxcA1mGPiNfW6+uw9bhgWUjT1TsNP8KQDaFZ9Ygix/DETl2CznmPD+dtiLZPzVCBtRms16S39phhkdvBHEqGJMpFgCvx3smAE+OJ4y7G9zHto8u/dNMSvJ0eacsoMDGOq43/OeNpI0NpxDG2ApV4C+rqilaUPUtrLpQMleLbhoyTL0eFYN4IY6yUzJxVi1X7y1xeNMUYvMf48iFfSUMvFEwnb3fENAjGM5FL1lMSa7COjuOvptiMMFGYt0eOdbc7zqESwlVoNaRwoFe4GYSxmv3cGGzzJO3zMaOZcQ/615ZNYrugis4YEXnHAnc+2HeWbSEfKBLvM3RTjrmwdzcwpu5/+AmflotaA9+/SbCnXwXWrCHDBpqaFoBwBcj2t4VAS/lMhq6oQ8LP+XqWcPVllWIsw1sUj4OnTkEHMbPsxo7RV8uH03wtDTzTXxOf95FIvYYBno5M2/q+ka+qdgRJCAZ/usCymjVDTa/QSJ5GeZjZUxo4Hh7CeoXlfk5mgi2m40/oJnYIFZVRUUH48RX5ZCirE9KSllVR1skn2hk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(5023799004)(11063799006)(10067099003)(56012099006)(18002099003)(6133799003)(12006099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?EIGo0Ps6kDEm+TVSI5su2hknpqSZ3MgVg5vQLRF+YLfn6eyx/TqIlPvOOR?=
 =?iso-8859-1?Q?Nf/E/fUBQpCTfxVjsEI+prATFoOYetU5Z53PUFKkaG2tTTDsqWhf/v09MB?=
 =?iso-8859-1?Q?qR5oy7u2hB7F1hT+2oWlHl/VDUZeJNhlP06X6AdphSYAhIiewE6Tuf/h3Y?=
 =?iso-8859-1?Q?6vuWKWKo32Fu0PV+yap9dQWQBFrjhvPuzwVEC4y+mB1I6PHPprSpWuOzn3?=
 =?iso-8859-1?Q?2FEp/fcvj8ASygoqsB1ZvTjBkcI4H1TJHFT+RA74G4S/pQWWoDnqhBt7ww?=
 =?iso-8859-1?Q?5YSeHmZRVXwl14hcH/muj9tkMrUieZb0M8KoepBhEQzfbZhfDbyCCrHbqO?=
 =?iso-8859-1?Q?mX15Y2bSEWUw1cOK5ndSTyMbp7JBJtUj4AbopHhKx1abAz/NczQMbMznr7?=
 =?iso-8859-1?Q?brRT6PICgwcqjEzvUgxTJJDhOEwWuqwCHxanP1CEeK3xE4KhSduh5SlSUk?=
 =?iso-8859-1?Q?m0xpn0Djm4cnM4uhCjXf2fBTbbT5SC9QiN3s2rlou7j+jmsbs4e7MPK5UN?=
 =?iso-8859-1?Q?a4KASd0hN73d+mu+1ssBw4fbrVvF5MPuLrTtj8gmbO/cW1//ATW+okHs9W?=
 =?iso-8859-1?Q?AwkRkdWX/n8RdvcTXQrvK6WNz7QpW6u2rVFAaw+q+Qsu2qGhiH/INRiax8?=
 =?iso-8859-1?Q?ZRTLZ9kJCXzTv+bj32Zb3UIeanxgkFo211iIb4C936aJdfQh0EY2g6zgh9?=
 =?iso-8859-1?Q?uoopMBKwlhw/y1yKly/DWehc7aJCaJkuByWzlIrLr82SqFLIkWsNW+Rax3?=
 =?iso-8859-1?Q?LXgQgXXhZEh9mXY8KWywf2NzaKyP7B9K14B+IJVLwmFPPs6TA4d2nnX+ZG?=
 =?iso-8859-1?Q?sxlqJ1wiNvIB+14Ak94aYmNmemNmLkQ7GWE+sAmgKHuPv48DMQ+7n3EVEw?=
 =?iso-8859-1?Q?rzQvG6qzPbqrO0avTI22Kq3CFP4aEIa6UVNRUH9eP2V0VZuLlh9nwWmW+L?=
 =?iso-8859-1?Q?fj1ybpbdWJJmDo54SiQHrwO1jhHBzw0VTxfR3RRUeSXCW/Dpwg+RAUAZ4U?=
 =?iso-8859-1?Q?Y6Uk/CYgDQdkYQ7AGDJWJrjCNHadyylX5oXzhR7M4iUaVkAJB7xbY0JY6I?=
 =?iso-8859-1?Q?jNauIRnGYLYz1t1+3Nh8lYwxbLo7zheGvrpExRhCF9hkGHwtVhFW3XUOPO?=
 =?iso-8859-1?Q?scvozcQr6udXccut/hCLftELxM1QP8wAoJgrvQ/ZKFvLtMlayz4XSxkIzv?=
 =?iso-8859-1?Q?exIO8M7LYHvJmVxe/ACqha4S6GItOO4s/A9MgfA3dI9maSJOIeAQlcyyMf?=
 =?iso-8859-1?Q?EpBzE6ayXxuEmousXu6RglA/wyNBH+9zzGHHMrVYTzOsTmyZG/z/P5zQA1?=
 =?iso-8859-1?Q?xcsOxT0ixOyDSmHlE9+DpuSTMCdkhjNRxqLxJq5zELJ966mIkiK1AzgGb9?=
 =?iso-8859-1?Q?S+g3DdL28ddsuRkN1w7JKBlJJLTgKhm0Un7h6ipU0z5SEqdTkYiq9AR/Rg?=
 =?iso-8859-1?Q?Rw1Yt0kR1G3BibF97k2LDyCSvxEMGCcOOPnANZs7eN0TGeylg1mYFvDSxP?=
 =?iso-8859-1?Q?946zF+lhor6UQ+yV1fq1ygu7ujHtlB6qSfHOS2jfX5xCqVTg4nORn79nOy?=
 =?iso-8859-1?Q?lRCe3gc9yZ1lj4Jhxaz4lxHTZfif9EF2iBtX+HyJYw8SoQouzufLTjBhRc?=
 =?iso-8859-1?Q?oOrFkPx7z5e3qqRwLlKjTEbb/6wwkbyV5SpHupUAPtbFvRHmiwzF+YCQ1I?=
 =?iso-8859-1?Q?jVWYUOZIv9dM8RSXlSR3U8fukWCg0/t+Lo34wUQ1hQMeQI0CEKslHEFSMG?=
 =?iso-8859-1?Q?bev6LJAV7nByeXIw1Je0+9csW+FCkrw5n2oVZj4O6pKCZPTry10djlJWFD?=
 =?iso-8859-1?Q?bG3SPIyQvw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15a64b5-1a51-44d3-8993-08df0e7736fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 13:35:29.5941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LH0cGEmD20y3pn5EwyqbU5ct4VQ3chHaReiHxwVOx29xFE4AQCdUh08cVIsN+RyUqDLsvnafEDE+tmJ/WKpPHnf9UyUXG+x5mhkJF9TvBx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB12084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245463

Backport patch to fix CVE-2026-42012.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-42012=0A=
=0A=
Upstream fix:=0A=
  https://gitlab.com/gnutls/gnutls/-/commit/8dcc6a1f48945997666ac9f10896819=
edd01a03b=0A=
=0A=
Tested with ptest=0A=
Pre patches taken from upstream so CVE fix will land cleanly=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../gnutls/gnutls/CVE-2026-42012-pre1.patch   |  70 ++++++++=0A=
 .../gnutls/gnutls/CVE-2026-42012-pre2.patch   | 153 ++++++++++++++++++=0A=
 .../gnutls/gnutls/CVE-2026-42012.patch        |  48 ++++++=0A=
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   3 +=0A=
 4 files changed, 274 insertions(+)=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.=
patch=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.=
patch=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012.patch=
=0A=
=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch b=
/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch=0A=
new file mode 100644=0A=
index 0000000000..1149dafef2=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.patch=0A=
@@ -0,0 +1,70 @@=0A=
+Backport of:=0A=
+=0A=
+From 6133fb459b74a9dcfa2d0ff010a4e03c56822d39 Mon Sep 17 00:00:00 2001=0A=
+From: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Date: Fri, 13 Mar 2026 17:00:03 +0100=0A=
+Subject: [PATCH] x509/hostname-verify: refactor and simplify CN fallback l=
ogic=0A=
+=0A=
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+CVE: CVE-2026-42012=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/6133f=
b459b74a9dcfa2d0ff010a4e03c56822d39]=0A=
+=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/x509/hostname-verify.c | 15 ++++++---------=0A=
+ 1 file changed, 6 insertions(+), 9 deletions(-)=0A=
+=0A=
+--- a/lib/x509/hostname-verify.c=0A=
++++ b/lib/x509/hostname-verify.c=0A=
+@@ -108,7 +108,7 @@ unsigned gnutls_x509_crt_check_ip(gnutls=0A=
+  * that we do not fallback to CN-ID if we encounter a supported name=0A=
+  * type.=0A=
+  */=0A=
+-#define IS_SAN_SUPPORTED(san) \=0A=
++#define PRECLUDES_CN_FALLBACK(san) \=0A=
+ 	(san =3D=3D GNUTLS_SAN_DNSNAME || san =3D=3D GNUTLS_SAN_IPADDRESS)=0A=
+ =0A=
+ /**=0A=
+@@ -151,13 +151,12 @@ unsigned gnutls_x509_crt_check_hostname2=0A=
+ {=0A=
+ 	char dnsname[MAX_CN];=0A=
+ 	size_t dnsnamesize;=0A=
+-	int found_dnsname =3D 0;=0A=
+ 	int ret =3D 0;=0A=
+ 	int i =3D 0;=0A=
+ 	struct in_addr ipv4;=0A=
+ 	char *p =3D NULL;=0A=
+ 	char *a_hostname;=0A=
+-	unsigned have_other_addresses =3D 0;=0A=
++	bool cn_fallback_allowed =3D true;=0A=
+ 	gnutls_datum_t out;=0A=
+ =0A=
+ 	/* check whether @hostname is an ip address */=0A=
+@@ -213,9 +212,10 @@ hostname_fallback:=0A=
+ 		ret =3D gnutls_x509_crt_get_subject_alt_name(cert, i, dnsname,=0A=
+ 							   &dnsnamesize, NULL);=0A=
+ =0A=
+-		if (ret =3D=3D GNUTLS_SAN_DNSNAME) {=0A=
+-			found_dnsname =3D 1;=0A=
++		if (PRECLUDES_CN_FALLBACK(ret))=0A=
++			cn_fallback_allowed =3D false;=0A=
+ =0A=
++		if (ret =3D=3D GNUTLS_SAN_DNSNAME) {=0A=
+ 			if (memchr(dnsname, '\0', dnsnamesize)) {=0A=
+ 				_gnutls_debug_log(=0A=
+ 					"certificate has %s with embedded null in name\n",=0A=
+@@ -236,13 +236,10 @@ hostname_fallback:=0A=
+ 				ret =3D 1;=0A=
+ 				goto cleanup;=0A=
+ 			}=0A=
+-		} else {=0A=
+-			if (IS_SAN_SUPPORTED(ret))=0A=
+-				have_other_addresses =3D 1;=0A=
+ 		}=0A=
+ 	}=0A=
+ =0A=
+-	if (!have_other_addresses && !found_dnsname &&=0A=
++	if (cn_fallback_allowed &&=0A=
+ 	    _gnutls_check_key_purpose(cert, GNUTLS_KP_TLS_WWW_SERVER, 0) !=3D 0)=
 {=0A=
+ 		/* did not get the necessary extension, use CN instead, if the=0A=
+ 		 * certificate would have been acceptable for a TLS WWW server purpose.=
=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch b=
/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch=0A=
new file mode 100644=0A=
index 0000000000..c192a144c0=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch=0A=
@@ -0,0 +1,153 @@=0A=
+Backport of:=0A=
+=0A=
+From 5cc003b9688378f6c7934b1df0aa147e80006be4 Mon Sep 17 00:00:00 2001=0A=
+From: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Date: Fri, 13 Mar 2026 17:41:33 +0100=0A=
+Subject: [PATCH] x509: add bare-bones awareness of SRV virtual SAN=0A=
+=0A=
+There's no support for constraints, no certtool support, no nothing.=0A=
+Just added what's easy to add because I needed a virtual SAN for them.=0A=
+=0A=
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+CVE: CVE-2026-42012=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/5cc00=
3b9688378f6c7934b1df0aa147e80006be4]=0A=
+=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/includes/gnutls/gnutls.h.in |  4 +++-=0A=
+ lib/x509/common.h               |  1 +=0A=
+ lib/x509/name_constraints.c     |  3 ++-=0A=
+ lib/x509/output.c               |  6 ++++++=0A=
+ lib/x509/virt-san.c             | 23 +++++++++++++++++++++++=0A=
+ lib/x509/x509.c                 |  3 ++-=0A=
+ 6 files changed, 37 insertions(+), 3 deletions(-)=0A=
+=0A=
+--- a/lib/includes/gnutls/gnutls.h.in=0A=
++++ b/lib/includes/gnutls/gnutls.h.in=0A=
+@@ -2698,6 +2698,7 @@ void gnutls_psk_set_server_params_functi=0A=
+  * @GNUTLS_SAN_OTHERNAME_XMPP: Virtual SAN, used by certain functions for=
 convenience.=0A=
+  * @GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL: Virtual SAN, used by certain func=
tions for convenience.=0A=
+  * @GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL: Virtual SAN, used by certain fu=
nctions for convenience.=0A=
++ * @GNUTLS_SAN_OTHERNAME_SRV: Virtual SAN, used by certain functions for =
convenience.=0A=
+  *=0A=
+  * Enumeration of different subject alternative names types.=0A=
+  */=0A=
+@@ -2715,7 +2716,8 @@ typedef enum gnutls_x509_subject_alt_nam=0A=
+ 	   Used by gnutls_x509_crt_get_subject_alt_othername_oid.  */=0A=
+ 	GNUTLS_SAN_OTHERNAME_XMPP =3D 1000,=0A=
+ 	GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL,=0A=
+-	GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL=0A=
++	GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL,=0A=
++	GNUTLS_SAN_OTHERNAME_SRV=0A=
+ } gnutls_x509_subject_alt_name_t;=0A=
+ =0A=
+ struct gnutls_openpgp_crt_int;=0A=
+--- a/lib/x509/common.h=0A=
++++ b/lib/x509/common.h=0A=
+@@ -107,6 +107,7 @@=0A=
+ #define XMPP_OID "1.3.6.1.5.5.7.8.5"=0A=
+ #define KRB5_PRINCIPAL_OID "1.3.6.1.5.2.2"=0A=
+ #define MSUSER_PRINCIPAL_NAME_OID "1.3.6.1.4.1.311.20.2.3"=0A=
++#define SRV_OID "1.3.6.1.5.5.7.8.7"=0A=
+ #define PKIX1_RSA_PSS_MGF1_OID "1.2.840.113549.1.1.8"=0A=
+ #define PKIX1_RSA_OAEP_P_SPECIFIED_OID "1.9"=0A=
+ =0A=
+--- a/lib/x509/name_constraints.c=0A=
++++ b/lib/x509/name_constraints.c=0A=
+@@ -516,7 +516,8 @@ static int validate_name_constraints_nod=0A=
+ 	if (type !=3D GNUTLS_SAN_DNSNAME && type !=3D GNUTLS_SAN_RFC822NAME &&=
=0A=
+ 	    type !=3D GNUTLS_SAN_DN && type !=3D GNUTLS_SAN_URI &&=0A=
+ 	    type !=3D GNUTLS_SAN_IPADDRESS &&=0A=
+-	    type !=3D GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL) {=0A=
++	    type !=3D GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL &&=0A=
++	    type !=3D GNUTLS_SAN_OTHERNAME_SRV) {=0A=
+ 		return gnutls_assert_val(GNUTLS_E_X509_UNKNOWN_SAN);=0A=
+ 	}=0A=
+ =0A=
+--- a/lib/x509/output.c=0A=
++++ b/lib/x509/output.c=0A=
+@@ -121,6 +121,7 @@ static void print_name(gnutls_buffer_st=0A=
+ 	if ((type =3D=3D GNUTLS_SAN_DNSNAME || type =3D=3D GNUTLS_SAN_OTHERNAME_=
XMPP ||=0A=
+ 	     type =3D=3D GNUTLS_SAN_OTHERNAME_KRB5PRINCIPAL ||=0A=
+ 	     type =3D=3D GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL ||=0A=
++	     type =3D=3D GNUTLS_SAN_OTHERNAME_SRV ||=0A=
+ 	     type =3D=3D GNUTLS_SAN_RFC822NAME || type =3D=3D GNUTLS_SAN_URI) &&=
=0A=
+ 	    sname !=3D NULL && strlen(sname) !=3D name->size) {=0A=
+ 		adds(str, _("warning: SAN contains an embedded NUL, "=0A=
+@@ -180,6 +181,11 @@ static void print_name(gnutls_buffer_st=0A=
+ 		     name->size, NON_NULL(name->data));=0A=
+ 		break;=0A=
+ =0A=
++	case GNUTLS_SAN_OTHERNAME_SRV:=0A=
++		addf(str, _("%sSRVName: %.*s\n"), prefix, name->size,=0A=
++		     NON_NULL(name->data));=0A=
++		break;=0A=
++=0A=
+ 	default:=0A=
+ 		addf(str, _("%sUnknown name: "), prefix);=0A=
+ 		_gnutls_buffer_hexprint(str, name->data, name->size);=0A=
+--- a/lib/x509/virt-san.c=0A=
++++ b/lib/x509/virt-san.c=0A=
+@@ -45,6 +45,9 @@ static int san_othername_to_virtual(cons=0A=
+ 			 memcmp(oid, MSUSER_PRINCIPAL_NAME_OID,=0A=
+ 				sizeof(MSUSER_PRINCIPAL_NAME_OID) - 1) =3D=3D 0)=0A=
+ 			return GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL;=0A=
++		else if ((unsigned)size =3D=3D (sizeof(SRV_OID) - 1) &&=0A=
++			 memcmp(oid, SRV_OID, sizeof(SRV_OID) - 1) =3D=3D 0)=0A=
++			return GNUTLS_SAN_OTHERNAME_SRV;=0A=
+ 	}=0A=
+ =0A=
+ 	return GNUTLS_SAN_OTHERNAME;=0A=
+@@ -59,6 +62,8 @@ static const char *virtual_to_othername_=0A=
+ 		return KRB5_PRINCIPAL_OID;=0A=
+ 	case GNUTLS_SAN_OTHERNAME_MSUSERPRINCIPAL:=0A=
+ 		return MSUSER_PRINCIPAL_NAME_OID;=0A=
++	case GNUTLS_SAN_OTHERNAME_SRV:=0A=
++		return SRV_OID;=0A=
+ 	default:=0A=
+ 		return NULL;=0A=
+ 	}=0A=
+@@ -126,6 +131,15 @@ int _gnutls_alt_name_assign_virt_type(st=0A=
+ 			name->type =3D GNUTLS_SAN_OTHERNAME;=0A=
+ 			break;=0A=
+ =0A=
++		case GNUTLS_SAN_OTHERNAME_SRV:=0A=
++			ret =3D _gnutls_x509_encode_string(ASN1_ETYPE_IA5_STRING,=0A=
++							 san->data, san->size,=0A=
++							 &encoded);=0A=
++			if (ret < 0)=0A=
++				return gnutls_assert_val(ret);=0A=
++			name->san =3D _gnutls_steal_datum(&encoded);=0A=
++			break;=0A=
++=0A=
+ 		default:=0A=
+ 			return gnutls_assert_val(GNUTLS_E_INVALID_REQUEST);=0A=
+ 		}=0A=
+@@ -187,6 +201,15 @@ int gnutls_x509_othername_to_virtual(con=0A=
+ 						 othername->data,=0A=
+ 						 othername->size, virt, 0);=0A=
+ 		if (ret < 0) {=0A=
++			gnutls_assert();=0A=
++			return ret;=0A=
++		}=0A=
++		return 0;=0A=
++	case GNUTLS_SAN_OTHERNAME_SRV:=0A=
++		ret =3D _gnutls_x509_decode_string(ASN1_ETYPE_IA5_STRING,=0A=
++						 othername->data,=0A=
++						 othername->size, virt, 0);=0A=
++		if (ret < 0) {=0A=
+ 			gnutls_assert();=0A=
+ 			return ret;=0A=
+ 		}=0A=
+--- a/lib/x509/x509.c=0A=
++++ b/lib/x509/x509.c=0A=
+@@ -1562,7 +1562,8 @@ inline static int is_type_printable(int=0A=
+ {=0A=
+ 	if (type =3D=3D GNUTLS_SAN_DNSNAME || type =3D=3D GNUTLS_SAN_RFC822NAME =
||=0A=
+ 	    type =3D=3D GNUTLS_SAN_URI || type =3D=3D GNUTLS_SAN_OTHERNAME_XMPP =
||=0A=
+-	    type =3D=3D GNUTLS_SAN_OTHERNAME || type =3D=3D GNUTLS_SAN_REGISTERE=
D_ID)=0A=
++	    type =3D=3D GNUTLS_SAN_OTHERNAME_SRV || type =3D=3D GNUTLS_SAN_OTHER=
NAME ||=0A=
++	    type =3D=3D GNUTLS_SAN_REGISTERED_ID)=0A=
+ 		return 1;=0A=
+ 	else=0A=
+ 		return 0;=0A=
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42012.patch b/meta=
/recipes-support/gnutls/gnutls/CVE-2026-42012.patch=0A=
new file mode 100644=0A=
index 0000000000..1f43efc122=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012.patch=0A=
@@ -0,0 +1,48 @@=0A=
+From 8dcc6a1f48945997666ac9f10896819edd01a03b Mon Sep 17 00:00:00 2001=0A=
+From: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+Date: Fri, 13 Mar 2026 17:02:07 +0100=0A=
+Subject: [PATCH] x509/hostname-verify: make URI/SRV SAN preclude CN fallba=
ck=0A=
+=0A=
+URI/SRV SAN did not suppress CN fallback as required by RFC 6125 6.4.4:=0A=
+> a client MUST NOT seek a match for a reference identifier of CN-ID=0A=
+> if the presented identifiers include a DNS-ID, *SRV-ID*, *URI-ID*,=0A=
+> or any application-specific identifier types supported by the client.=0A=
+=0A=
+With this change, certificates containing URI or SRV SAN=0A=
+no longer pass DNS hostname checks via CN fallback=0A=
+to avoid potential misuse of such certificates=0A=
+beyond their original purpose.=0A=
+=0A=
+Reported-by: Oleh Konko <security@1seal.org>=0A=
+Fixes: #1802=0A=
+Fixes: CVE-2026-42012=0A=
+Fixes: GNUTLS-SA-2026-04-29-7=0A=
+CVSS: 6.5 Medium CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:H/A:N=0A=
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>=0A=
+CVE: CVE-2026-42012=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/8dcc6=
a1f48945997666ac9f10896819edd01a03b]=0A=
+=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/x509/hostname-verify.c | 5 +++--=0A=
+ 1 file changed, 3 insertions(+), 2 deletions(-)=0A=
+=0A=
+diff --git a/lib/x509/hostname-verify.c b/lib/x509/hostname-verify.c=0A=
+index e7597ad3b0..d989bb1abc 100644=0A=
+--- a/lib/x509/hostname-verify.c=0A=
++++ b/lib/x509/hostname-verify.c=0A=
+@@ -108,8 +108,9 @@ unsigned gnutls_x509_crt_check_ip(gnutls_x509_crt_t ce=
rt,=0A=
+  * that we do not fallback to CN-ID if we encounter a supported name=0A=
+  * type.=0A=
+  */=0A=
+-#define PRECLUDES_CN_FALLBACK(san) \=0A=
+-	(san =3D=3D GNUTLS_SAN_DNSNAME || san =3D=3D GNUTLS_SAN_IPADDRESS)=0A=
++#define PRECLUDES_CN_FALLBACK(san)                                   \=0A=
++	(san =3D=3D GNUTLS_SAN_DNSNAME || san =3D=3D GNUTLS_SAN_IPADDRESS || \=
=0A=
++	 san =3D=3D GNUTLS_SAN_URI || san =3D=3D GNUTLS_SAN_OTHERNAME_SRV)=0A=
+ =0A=
+ /**=0A=
+  * gnutls_x509_crt_check_hostname2:=0A=
+-- =0A=
+GitLab=0A=
+=0A=
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-su=
pport/gnutls/gnutls_3.8.12.bb=0A=
index 3ad011742e..8716c929e7 100644=0A=
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb=0A=
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb=0A=
@@ -37,6 +37,9 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${S=
HRT_VER}/gnutls-${PV}.tar=0A=
            file://CVE-2026-42009_p1.patch \=0A=
            file://CVE-2026-42009_p2.patch \=0A=
            file://CVE-2026-3833.patch \=0A=
+           file://CVE-2026-42012-pre1.patch \=0A=
+           file://CVE-2026-42012-pre2.patch \=0A=
+           file://CVE-2026-42012.patch \=0A=
            "=0A=
 =0A=
 SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf=
470bea012b8e51"=0A=
-- =0A=
2.34.1=0A=
=0A=

