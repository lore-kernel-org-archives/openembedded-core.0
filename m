Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DFAC79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 13:36:48 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12406.1788961004133811043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 06:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=js1W/j10;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.72.40, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uF6kH2YOiSzvJ/LMgLETSTGx00t3OV6wV1uwvCzX1W2g58Hbp+3WchHItP+IubYC+RQ+pwSSMcoFG1YS8gP3QpePyeF8puo0/9xCBfWkpna5m674HZXAPNnNZflTqhb4iOqh4/TRSoZyHyPVUj/19EW2Lrqd1l4Le/Tg1J7SuK4dTk/QPnYogFr00vuYSMT/zHv0RHDAFT03qCK2a7DisQawIXzgjumm8ZURAHIx/AklPhrPjxaQXc8bginjfXdhwYkFQ/MGRGRfBfuW5mK5OHBaT5wkebX4Vk2gBxs59J7dHHG9O5Cq38RFWu0FWbQoG2g7f5EqBYtx6TB+c2JDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqPZL38Tq8CjZUAwBJq5sQu9BAbBdW2qmAAQNnOW1do=;
 b=ZWgRjKYQOOIy7VG+D/TGeHpVq0GAAEOJtipxjB4uOrpBBrjU5lZRm4WcR1ftpiYv5VKdc6IQjYD7eBS9dMmA6fLmnHKSAJzbGQ0UEiKGdR7a86Pkc+/1SeJ7JvEAjy5JckCrbs5RVzFzTwyv8cvMdlGpvjtEgLuRCC/KBTLeKC9qw3Ma0sHy7jgiC5M/PkfpeKjPD0JAx2RzKK86cEVjqKtwANlLZbTnyvj5VvDdVBYxIRCYsJGRksnHOnxmzq/8uqPuKzDOc6S19ZSzjSs9WpcDGZmIUzZIKNTOFDtvrjpZiR+86YXSrh1V61m45WgY1Prl1zFuWwyMTlVHhbJFzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqPZL38Tq8CjZUAwBJq5sQu9BAbBdW2qmAAQNnOW1do=;
 b=js1W/j10IBcz2Ey2K5tsy5KYEWycJgqcw4RSWZ2ef5q0RWLVKJYdrLt2rri2cAlys63eAp5HxlVgARJ3/bGdKxwqHQqSlfzEojOkzaSY8qi7NJJmG1OcjRrFpWIszbIR7ccHlHHlyA/q1eZ2bujsn2KnGa2cpF+7TvlLQiRS1SfMfmVfcMZJ619uUuv3f6qjkR/H+XxNsEFP02FjFePUNzoJ0Vaxzq0a086/9vW5M400Tm+A2bk+9qHyhxFjBvHh36I5D8/PP+cyg3DDgeHcsu8UL9qrncQVXu6gWVRpOYIf3XkKk54TK4U+z/pOZpdInkHfofLBDKsQirJCx9vIMA==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by VI0PR07MB12084.eurprd07.prod.outlook.com
 (2603:10a6:800:33b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 13:36:38 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0360.008; Wed, 9 Sep 2026
 13:36:38 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [scarthgap][PATCH 1/5] gnutls: fix CVE-2026-42012
Thread-Topic: [scarthgap][PATCH 1/5] gnutls: fix CVE-2026-42012
Thread-Index: AQHdQGA9uOpBdqd1/keUEIWvlAoSLQ==
Date: Wed, 9 Sep 2026 13:36:38 +0000
Message-ID: <20260909133633.3691-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|VI0PR07MB12084:EE_
x-ms-office365-filtering-correlation-id: c6a5b53e-bdf7-4f30-e03a-08df0e775fd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|5023799004|11063799006|10067099003|56012099006|18002099003|6133799003|12006099003|3023799007|13003099007;
x-microsoft-antispam-message-info: 
 wLIcL9MdGxUQ6knb+K7DF7idUrjeTDF9IkZu1+6t9jUOKsCdTmP6Wj0Juaz/h2L7CRXyzeoqRE5XHa9oyfELKjDcTije0WLGoEgF1kYz1MU4sd0pthxU5ERj74b17s4lR8a38t2LJph8U1lzEk1nIbsf4q3KoTnLzr7sBFQIU8wutoxCOhQoqTnEF/mnSTyv/BJKtr5MIFrCsUut5vtEctRpl+pjppyLJ7oXn5zVDB4+ORYKtkqpb/pT9gLoU/V+Uzc8OedxT6b+1F8g5UwWKlDtrHyQ1tAoz0RStcIDAk699qpXrnYPnO0in3bX7PTBVTWb1J/mEH2XCc78ji38T0eNn5KsqqjbhBGfhuOafmgg6h+xC/j2A4b1UGFdjxUKVPgMxIWdlpK5F2RLGJYxTK9fnU2IPdllkRNaVb2lf5di+n586GqS4Ym8/M9bRvDw5bk9AqdnRAzldyqDgQLHwLctgeOXbacN/RBNuvRnuUW0f+HybjefUA8qtW9uUlXVB5KSdwNUm4IH4fLw0bju2knN0ssLX6Ggm4DBKDxmO1WuKMHqOAoLQEXscToADGVU3M3opSxZHqKI8U5BtgVVEuHFinWTfYjkymOH4+8Zxq+6cTnecfcmUEK5X6QgmLZ71CsVF3tVNdnppvIkPbwDv4Po96/PqbAWYeH2k/C62L7niPX/s3CQyoFU9Bq7cpHGRtb7xmAktIVTik8Pu+E4tMUJJE1lPHzh0Q+oOruySFk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(5023799004)(11063799006)(10067099003)(56012099006)(18002099003)(6133799003)(12006099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?5GathJaAXTqM+SwBzAUwsk6EsU8zpbRkvcds1ZYN4l3v34a+vYciDsCoGH?=
 =?iso-8859-1?Q?fwqzG7M9V3KItX6p3TEO/gxzDc7/lhPwAt+eoY5yYhvTBIso7zFXsraJdQ?=
 =?iso-8859-1?Q?2lML0MkyzH4FNBYzPkpBGzlngDKUTL3uKaUV3gdwHtxWkSAVEilEAbbf3f?=
 =?iso-8859-1?Q?g+YVrlQcwoXgQvBDgxLOAQBVgBWVwoOPNzjfZwkjplxSpu7CEYKvbMqW2n?=
 =?iso-8859-1?Q?8Jy54JQCRsD6BKFZCN944CdHsVBghGsuDZqzevq1VWZhw8ElDzjMj9Sf6b?=
 =?iso-8859-1?Q?TF75D0YycDrMyxaLR8kDBhXgq4Rhc/Fyb7zwuyos0XLtchCzzf5f2etTg/?=
 =?iso-8859-1?Q?E9cEq4AYRoznBxEjaOlXDwF3/tLoq09R+Wjl1vkBGqyKRCg8+lPr2mlmXY?=
 =?iso-8859-1?Q?OhVjpOwRC3vIC3mmasHeec5RaBm1cZBNqbVgkVO0ESCTXh/vU3UZC9Bo2j?=
 =?iso-8859-1?Q?2oPol1VXMa7FMLbFc2oCMHmLtfHGlDDO2tCW4eYwtXMbCW6QayNvvZCC8e?=
 =?iso-8859-1?Q?U/D85tHbcaM7++p6Iz3XFke21I79I+jc+yQxxmdsgLKfoZWnpr+5ItA2ay?=
 =?iso-8859-1?Q?3FFkGtqeEGYSkdoTIYMP5hpCIbnIvLzV5GNcRVgAnEUChI891VIyE+o0ge?=
 =?iso-8859-1?Q?Q72qkvPVTIV6jeerq/pEWSPzMc4FR5eR9J6YC9KylSa0q4WWZ+qxLzv3H/?=
 =?iso-8859-1?Q?Y1A3WboIrWJu+K8HXgRWbSAo6g/89sLSRE8F1ZG0iZAtGjp3lTk888ZLwm?=
 =?iso-8859-1?Q?FtvtihNMBWmxr/V+iEaxNGZ+wVvd1QPvCZWaoHjvpZ96oGWQPEUY1IQ7g/?=
 =?iso-8859-1?Q?kN6pADT7ct4l2RDbDhoCNKhOmwfK1eQJef8QDANKJGI15LY/Ao8lyLIH/J?=
 =?iso-8859-1?Q?FNLUvuXJZlT4YsEJHiFXCqFYXiqKmU4QoNNk64D4xVLfrN6dlWcNpKgwIA?=
 =?iso-8859-1?Q?a0q51Bl41urqNOoFJ+lJRSnlIlr7aFS5EjKb6ia+ZTYincgmmf11/vanr6?=
 =?iso-8859-1?Q?QCckbrVEB+6DPLQdDlhf4+3Wgwi8D5AlQvvcGTTXyKI51jYxJVlEVAWtIX?=
 =?iso-8859-1?Q?heVWltvbwzG/fLGIvufzywMUBWb2cOamo8Ayy1t2jujnWjCnnRUknw+aoZ?=
 =?iso-8859-1?Q?SEK5PtCI1vJbxk5fQV1QVZerYv4FlP6Z+ziEFPBrajTMJnSYG/z3jd1Py/?=
 =?iso-8859-1?Q?Wrm1fFkJY32J4uxzb7hTfsANnw0Afnt3zfUSxs16rjEjjvYVNeMn2ny7D4?=
 =?iso-8859-1?Q?R2Y6BmuojBoEqvoUZWhlGmRJfNTV6quDh8SNYRxMAu+t+TaiGGkmFkuMGZ?=
 =?iso-8859-1?Q?XWHxHJBocfaIYPMmPtst5pWoxPwYZjo+dle/Q4EsDQX5viPas7h0vAMEiB?=
 =?iso-8859-1?Q?vJoscL7YboF9sZHj6dIklC0saxzGJX+mn5WrpnZqoXw5fWSG4UR0gWQZCm?=
 =?iso-8859-1?Q?/7gMv/C0eoUSTCXOmUKRvx/sJF7FCWxvGYFt0Kql7F/seXPcvi02LarMj+?=
 =?iso-8859-1?Q?aFta1wcNqBImTsjh+EzsuP19g9kW5YI96zDUGohIEf941A+UsaMm3fELqn?=
 =?iso-8859-1?Q?6p8x7/aolawGDRYtGrXuo+7sYCISqAfxg8AEOmO6gzOBBa5vWJgwh1hhVN?=
 =?iso-8859-1?Q?bAJiHEMsHZIQQ4W0nPl2PYGuUl+U0yANW0kwPAAPHWh+ieFbg2d4w5JkHx?=
 =?iso-8859-1?Q?e6zV+rBy1vIE7DLDDimzU2005Vacstf1krpPktezc7l+5lk63F9TwJ4qI+?=
 =?iso-8859-1?Q?C93WvEZgHbYbTNtnp1hOw/IaJPfQS1ZReb9N9iXYe5vIe31OIamsM0trdg?=
 =?iso-8859-1?Q?Obz1k8fKMw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a5b53e-bdf7-4f30-e03a-08df0e775fd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 13:36:38.1808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+IbozzAWzYXigYPgJz4lLKgVCfkR9K0g2TlwMKxINel+WthdRnvc9wDoOW09//4UC23ecsedkvi2JqNbd54gr0w+6yEnlj7BfD7gbAxQKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB12084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245468

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
 .../gnutls/gnutls/CVE-2026-42012-pre2.patch   | 156 ++++++++++++++++++=0A=
 .../gnutls/gnutls/CVE-2026-42012-pre3.patch   | 126 ++++++++++++++=0A=
 .../gnutls/gnutls/CVE-2026-42012.patch        |  48 ++++++=0A=
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   4 +=0A=
 5 files changed, 404 insertions(+)=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre1.=
patch=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.=
patch=0A=
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre3.=
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
index 0000000000..42adccc6ba=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre2.patch=0A=
@@ -0,0 +1,156 @@=0A=
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
+Backport Changes:=0A=
+- common.h context updated for 3.8.4 (PKIX1_RSA_OAEP_P_SPECIFIED_OID).=0A=
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
+@@ -2646,6 +2646,7 @@ void gnutls_psk_set_server_params_functi=0A=
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
+@@ -2663,7 +2664,8 @@ typedef enum gnutls_x509_subject_alt_nam=0A=
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
+=0A=
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
+@@ -1554,7 +1554,8 @@ inline static int is_type_printable(int=0A=
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
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre3.patch b=
/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre3.patch=0A=
new file mode 100644=0A=
index 0000000000..3dd9fe5a25=0A=
--- /dev/null=0A=
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-42012-pre3.patch=0A=
@@ -0,0 +1,126 @@=0A=
+From 9f635788da50eb1285cae5c8d787b12bda01ae4d Mon Sep 17 00:00:00 2001=0A=
+From: Daiki Ueno <ueno@gnu.org>=0A=
+Date: Wed, 22 Jan 2025 07:45:46 +0900=0A=
+Subject: [PATCH] datum, mem, str: add helper functions to steal pointers=
=0A=
+=0A=
+This introduces 3 new inline functions, namely _gnutls_steal_datum,=0A=
+_gnutls_steal_buffer, and _gnutls_steal_pointer, to return a copy of=0A=
+data structure and reset the original pointer. Those would enable to=0A=
+return a populated data structure upon success; otherwise free the=0A=
+partially filled data structure in a single code path, e.g.,=0A=
+=0A=
+```c=0A=
+  gnutls_datum_t tmp_result =3D { NULL, 0 };=0A=
+=0A=
+  // Calculate tmp_result=0A=
+  ...=0A=
+  if (error)=0A=
+    goto cleanup;=0A=
+=0A=
+  // Propagate tmp_result to *result=0A=
+  *result =3D _gnutls_steal_datum(&tmp_result);=0A=
+=0A=
+cleanup:=0A=
+  _gnutls_free_datum(&tmp_result);=0A=
+  return ret;=0A=
+```=0A=
+=0A=
+Signed-off-by: Daiki Ueno <ueno@gnu.org>=0A=
+CVE: CVE-2026-42012=0A=
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/9f635=
788da50eb1285cae5c8d787b12bda01ae4d]=0A=
+=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ lib/datum.h | 11 +++++++++++=0A=
+ lib/mem.h   |  9 +++++++++=0A=
+ lib/str.h   | 23 +++++++++++++++--------=0A=
+ 3 files changed, 35 insertions(+), 8 deletions(-)=0A=
+=0A=
+--- a/lib/datum.h=0A=
++++ b/lib/datum.h=0A=
+@@ -68,4 +68,15 @@ inline static ATTRIBUTE_NONNULL() void _=0A=
+ 	dat->size =3D 0;=0A=
+ }=0A=
+ =0A=
++inline static ATTRIBUTE_NONNULL() gnutls_datum_t=0A=
++	_gnutls_steal_datum(gnutls_datum_t *src)=0A=
++{=0A=
++	gnutls_datum_t dst =3D *src;=0A=
++=0A=
++	src->data =3D NULL;=0A=
++	src->size =3D 0;=0A=
++=0A=
++	return dst;=0A=
++}=0A=
++=0A=
+ #endif /* GNUTLS_LIB_DATUM_H */=0A=
+--- a/lib/mem.h=0A=
++++ b/lib/mem.h=0A=
+@@ -33,6 +33,8 @@=0A=
+ #include <valgrind/memcheck.h>=0A=
+ #endif=0A=
+ =0A=
++#include "attribute.h"=0A=
++=0A=
+ /* These realloc functions will return ptr if size=3D=3D0, and will free=
=0A=
+  * the ptr if the new allocation failed.=0A=
+  */=0A=
+@@ -78,4 +80,11 @@ static inline void _gnutls_memory_mark_d=0A=
+ #endif=0A=
+ }=0A=
+ =0A=
++static inline ATTRIBUTE_NONNULL() void *_gnutls_steal_pointer(void **src)=
=0A=
++{=0A=
++	void *dst =3D *src;=0A=
++	*src =3D NULL;=0A=
++	return dst;=0A=
++}=0A=
++=0A=
+ #endif /* GNUTLS_LIB_MEM_H */=0A=
+--- a/lib/str.h=0A=
++++ b/lib/str.h=0A=
+@@ -30,6 +30,7 @@=0A=
+ #include "datum.h"=0A=
+ #include <c-ctype.h>=0A=
+ #include "errors.h"=0A=
++#include "attribute.h"=0A=
+ =0A=
+ #ifdef HAVE_DCGETTEXT=0A=
+ #include "gettext.h"=0A=
+@@ -97,6 +98,19 @@ inline static void _gnutls_buffer_reset(=0A=
+ 	buf->length =3D 0;=0A=
+ }=0A=
+ =0A=
++inline static ATTRIBUTE_NONNULL() gnutls_buffer_st=0A=
++	_gnutls_steal_buffer(gnutls_buffer_st *src)=0A=
++{=0A=
++	gnutls_buffer_st dst =3D *src;=0A=
++=0A=
++	src->allocd =3D NULL;=0A=
++	src->data =3D NULL;=0A=
++	src->max_length =3D 0;=0A=
++	src->length =3D 0;=0A=
++=0A=
++	return dst;=0A=
++}=0A=
++=0A=
+ int _gnutls_buffer_resize(gnutls_buffer_st *, size_t new_size);=0A=
+ =0A=
+ int _gnutls_buffer_append_str(gnutls_buffer_st *, const char *str);=0A=
+@@ -161,15 +175,8 @@ int _gnutls_buffer_append_escape(gnutls_=0A=
+ 				 size_t data_size, const char *invalid_chars);=0A=
+ int _gnutls_buffer_unescape(gnutls_buffer_st *dest);=0A=
+ =0A=
+-#ifndef __attribute__=0A=
+-/* This feature is available in gcc versions 2.5 and later.  */=0A=
+-#if __GNUC__ < 2 || (__GNUC__ =3D=3D 2 && __GNUC_MINOR__ < 5)=0A=
+-#define __attribute__(Spec) /* empty */=0A=
+-#endif=0A=
+-#endif=0A=
+-=0A=
+ int _gnutls_buffer_append_printf(gnutls_buffer_st *dest, const char *fmt,=
 ...)=0A=
+-	__attribute__((format(printf, 2, 3)));=0A=
++	ATTRIBUTE_FORMAT((printf, 2, 3));=0A=
+ =0A=
+ void _gnutls_buffer_hexprint(gnutls_buffer_st *str, const void *data,=0A=
+ 			     size_t len);=0A=
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
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.8.4.bb=0A=
index 0eabc517ce..34d9603efa 100644=0A=
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb=0A=
@@ -46,6 +46,10 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${=
SHRT_VER}/gnutls-${PV}.tar=0A=
            file://CVE-2026-42009_p1.patch \=0A=
            file://CVE-2026-42009_p2.patch \=0A=
            file://CVE-2026-3833.patch \=0A=
+           file://CVE-2026-42012-pre1.patch \=0A=
+           file://CVE-2026-42012-pre2.patch \=0A=
+           file://CVE-2026-42012-pre3.patch \=0A=
+           file://CVE-2026-42012.patch \=0A=
            "=0A=
 =0A=
 SRC_URI[sha256sum] =3D "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44c=
dfa7f36ebc3a9b"=0A=
-- =0A=
2.34.1=0A=
=0A=

