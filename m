Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01E2E6BF06
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 12:03:29 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8672.1769774607872893154
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 04:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=c+u1a6yN;
 spf=pass (domain: est.tech, ip: 40.107.130.58, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCyBSrL1T9cU1m14dbfrPIrMrXR3imJ/S6xB72z9kwAXDWvBULVZG90BzOaA9uYy6nJDPJyggWkIjtuvI4U8xlLZEnCBWM1klQHcR3xhNS99EjUYdEsqUCHV6x9JsI8I72d6YLB3wVPb6c4O1g7vOeo6ag5IN98xQkZt5l/jh58BfN7VmRbQDHPJjZXN20gFlLx5NWMQUp8K0PVpWYA9Un4ORd1PGo6XSGxpxAB4u88QJyREuDigLonWIVquGnk75HUwXYAazybbMgZhNPI7ohjBhTfAbvUsj1SqfGIsDSSmZ/ag/TyrtYlewvdiONLAj5XihmWz90wYt4jHmpMucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gkeWIFSZyuINNn/XBgetQWruK7KynQAu7G4aDwLOqg=;
 b=P7GVmiC5viwAlZEJjNiaO3PGsIw20N+InIrKvHOiiEOALZWl0hD43MGZIfKFymoObLbTKagQoUS4DTpuSpaNy9Zr3eGoYKOfy1UABtkcL95yAqzsxHv96V4QJZD39BVtHb4DNaq30XUw6xR2QN5dFw3yF22xaIqJT/wWUZnGLxjaWvmWMrO5UvfIomtv9YLstjrdcMaV07YWMnEIQn5PtIHCwDh6WEcbcoyMzUtCvEohfxD30Bw5s1q942JnL8fh4nKL/i6OI5Oxj02et8UzwICosIix1pUjxwgAdF0d+ba4k6EXo3Eg+miIChcakn/1UG7VKKWj6iVOcXsK77uE4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gkeWIFSZyuINNn/XBgetQWruK7KynQAu7G4aDwLOqg=;
 b=c+u1a6yNJLeSs5C+dSgZ77dEbYvmI/ljkRD03wJ88yXqrolXoUGD/leoi1EmAV00KKHQg29GOPbugOx/Tgi50TT7Oat8dXAkFEUzPDMiJCw/AwNa9I06yAV0MOtj3NHoFGJWk5oeCMzFBL/RrDBGQQXxybVd/nFg9iAYrZJj1LdP2VpNFOM0cxMLfMxo1xVygT/vmfU+q3Ng8p6PwJR8YwGMbwqy3cwgTVKReQEz7nlP8ubn/nfLiegUkTvJjKD1jzTJ181oKnQnhB0KIikswi9Ytjh0rPkhZZIAp0F64OSr95ZUYJptI9SKEFKvrDoUabMVc45kpKU3wo4OmNqiDA==
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by DU0P189MB3268.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5a7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 12:03:24 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a%7]) with mapi id 15.20.9542.015; Fri, 30 Jan 2026
 12:03:24 +0000
From: Amaury Couderc <amaury.couderc@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH]
 curl_sasl:_if_redirected,_require_permission_to_use_bearer
Thread-Topic: [OE-core] [scarthgap][PATCH]
 curl_sasl:_if_redirected,_require_permission_to_use_bearer
Thread-Index: AQHckdGZUKgvLPB41U+k4UKUXNEG9bVqhhsAgAAWdjc=
Date: Fri, 30 Jan 2026 12:03:24 +0000
Message-ID: 
 <AMBP189MB3196741A2986E6EE02918178F89FA@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
References: <20260130101650.19830-1-amaury.couderc@est.tech>
 <CAMSfU+4SfoT8xMcAx=HesFsLcKAJZPpKPsGkWG6RhTDAJUgwmw@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+4SfoT8xMcAx=HesFsLcKAJZPpKPsGkWG6RhTDAJUgwmw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP189MB3196:EE_|DU0P189MB3268:EE_
x-ms-office365-filtering-correlation-id: 82a94c44-9566-4298-4ce9-08de5ff791d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|13003099007|8096899003|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?0W9kgqmTiSLBi2VBuhZMC2bhsjpWT80xPuYdHNcBlTCjpT46QOX0pvVPhE?=
 =?iso-8859-1?Q?Ia18eBK4ijpwOk6vda4z5Imeb12IWNLFv4Z59jitnXE3Nm03jRhVe0IxsV?=
 =?iso-8859-1?Q?v9Jrhp34QBn9/LdqLni2CQdBdEMWjWd+LTc17PfZOIXk8gI6S2L+Fl7LDW?=
 =?iso-8859-1?Q?hP//pZENISwf0gLn4OCmsLTTjaJ5CvSnPXVCEkSWMNhZbf09R4tXbDjT7U?=
 =?iso-8859-1?Q?Q5PnfcS1YUCsacQIJ3NygR1cwob4VdUpRSkUZQrWJ30Oa8lfV0lU4+6EZX?=
 =?iso-8859-1?Q?5s+fftzs5nXEEqjWFdVHJ2ZcDPzQlD5cI8V4UODST+ZrvtDv+kYjWJPyEg?=
 =?iso-8859-1?Q?VZCCcIuo85Gx7w3omuqrVIIsclgm1Hj6jnQWn/V1fqDIrgUM6cvPjQFuHe?=
 =?iso-8859-1?Q?5fCf4eABknC8QQek8BaE8BndEqhLs6VaGWQh/dmWpExr8Jxn7jYy/PkuXz?=
 =?iso-8859-1?Q?VIia5bk9qpK5lBmecdcxSMSIsagahD86By2zORp6FiCS/YfqmZlw2z7WCE?=
 =?iso-8859-1?Q?yLuIrNL9msKGh575tXqAHnSaJZqr53vKaXDkKpeWbpAlBaJJRFPRkqEumB?=
 =?iso-8859-1?Q?QkVPT34Y+H17gwQdRjtCNJEz+Hxfcy7ersjY4pbR6+2YoWgbb/JRaCLNLr?=
 =?iso-8859-1?Q?/HOqH5lXgvP5m8br+O4OxH4ewmD9fBEOBWg92pHxUDADiUugcbKjKNw9y7?=
 =?iso-8859-1?Q?3+zYscCSQP/unFTm7I8MuRrjoqMiMre0C/XcpyJCyBfgk5+DWcFywMF4Uh?=
 =?iso-8859-1?Q?UUJlkf4GfPFPgpgsy2mYeSrIeKX0xLz01I/s2Cz+1+3DD1NkDNOSp7aT/1?=
 =?iso-8859-1?Q?lhpC59P3GFNJysh0FxKtxgo1X29M2x3hbfmrEKRMUv9mU0HT51N4SoDD8A?=
 =?iso-8859-1?Q?4/kxD54ec0kMBODfvOeyH/faEvQh12Xnk5gJoQkLnsUqh8oc8UK3SncRIi?=
 =?iso-8859-1?Q?oasT7hu4aCH3lTy78u4XxTTcwLH8MMR3rUTctKIJ7/aIksV+HIN525n8dQ?=
 =?iso-8859-1?Q?sODzskdyWk3+WRUvHPm0on+laTwAb4Zn6pH7B5HjffW2LxKfu/loyQFSVW?=
 =?iso-8859-1?Q?jPiyRP9LBfN75bGJ9DVhIJp/yMW8DpXrhFSG0e5uecE32ACoXXGyZZ5hU6?=
 =?iso-8859-1?Q?kVRP+WcV747cBE2I+nphtn93o/9CAroOumor1f9flaPhbmkgNUmpsyRmgn?=
 =?iso-8859-1?Q?8K0XANhF6uy2DAfIFsmgnuOR7SpkBBhvr78DLoXHQCoY3IN9geCSkcpQ+L?=
 =?iso-8859-1?Q?IaHG4dbJiwpWwHWDHIX3wVJQ5n4RgjYF1hU9vp81oDl5aaq99YhcazGt+d?=
 =?iso-8859-1?Q?1dCQ3Y3+AtjfUubt/PKQ/nW1GkysMh44PbTj8VIGMQgdMRUrdqzmRIDg1/?=
 =?iso-8859-1?Q?ndwkxOTAkFfWfWpMKb4mBdeqEvK8r2mXmUpfcrDdlZGlSNRnF7ocaDCo8K?=
 =?iso-8859-1?Q?va7mpC1z1msBAyekNwT4bJmX5QOqvQVFC/4LK0RRFvoibYZJ9sd0Vxjv+J?=
 =?iso-8859-1?Q?lwpViFr0RzRjVim7jfoIvx6Yw1zdVUNu76e1sjNB6wzFDO4oKwZuGR18wv?=
 =?iso-8859-1?Q?It0c6fuu2vUuqFo+Jt+UBbo2RNpC1vpcyyz0xxFUpE2tToB2d9CZgAR2RY?=
 =?iso-8859-1?Q?6Yc0g2zADUarc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(13003099007)(8096899003)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?bQjZ0wIr7dNNrqdfi/7ayLXek+ziAzg5GJgCY0aZKmbwu9ue6qLLkOeF/l?=
 =?iso-8859-1?Q?hnVIOX+F24G7G8H9oMhqfwW77UAsm2gx1lyZRxb7hO7hW6RyY+mirzzZ9Y?=
 =?iso-8859-1?Q?MN39ucPn9Bxh8K14zyRtalGJTeEpU0Z8n9P/vfXuu6A63JXyx8iYGbyLXQ?=
 =?iso-8859-1?Q?HSn3iIoM8edbITjbPqf44vYsGgdwl0XO744OzoscY1HFsVifyaaUtOYFN8?=
 =?iso-8859-1?Q?iTHeKSMZuV4ysCD/uqcjZRclurZXK7wvtZTCzM5edsvD10clnPSkSUVy6l?=
 =?iso-8859-1?Q?7uhJXCldBSSAm4W5dcTz62Fw6prfxAR+aFuTjkTgBPIxBOPTMjwEmhZ9if?=
 =?iso-8859-1?Q?WBq/6zAUkLtmzaO6EBY8cJZYpCX/8mEZqRxk3w46T+atm90fow0YVj1VXj?=
 =?iso-8859-1?Q?wMB3lRp0D/UcVPjEZuHAtzn3qy4WDgN9QcLyU4F/ekikaQaBuhCXSgJ2gp?=
 =?iso-8859-1?Q?3Fd6BRijvaDpmrZEdXzdV2aFrInYLfmN8LThJIJTxZhMcJPplcz7GJ+K4Y?=
 =?iso-8859-1?Q?k1l2sRkmeWGtbabFcgFzsHnRpDiPtCzO71Qa9Tpqbki/HAaLg6pgvpUxci?=
 =?iso-8859-1?Q?IedQYUnU4+jrpGut0G99p6oi0mGb+f6O6EEQ50Po7PdIkznmTYdguYJu3k?=
 =?iso-8859-1?Q?GRfWH4SbKFrdFGjViHRH3xngXAo2nCxHBnUx6yjiUHcEMV+9+ff0smrirT?=
 =?iso-8859-1?Q?lVx9Ys9sF+8b9DaMo54o0sDaw03+zRfv0CDhRbayPZO2L8IeDIuQRawlnQ?=
 =?iso-8859-1?Q?j5ZhqJIz9TnUkMGr3SwxFojlTe5YYx161gWa1JSMM4OsMbV4ebn+T+S1nE?=
 =?iso-8859-1?Q?YVUGBryFXxjywqjqA1Mq8rHCj8ZL65pbxV3iRgcXnk7mZGmi2FoBRMfnPf?=
 =?iso-8859-1?Q?Erab17DVSsxaLhgMeW5Y/NVrRp4IvEoaKPE+rSnbwdMmznlaM1nOts3iT0?=
 =?iso-8859-1?Q?FUvuX/NQU/2Q6GiOnraEqZnyWaZd54Rm235zYEb/k5gSAmolT/4tiqfCwQ?=
 =?iso-8859-1?Q?bMlEfkpBFzUzfsnHsytRzzULFTqxBe7fkjnMVxPAKmczCtRb+OR/y6KtmM?=
 =?iso-8859-1?Q?+uiMUokFXcovyDE1shZxP93vrNY0BzY/Bul8ZB285on19/V8jFnIfHa8ni?=
 =?iso-8859-1?Q?F4NvyEtfy3d8LE7YzuapjeRWaR5RSPqPQDKDEs4C7lQclXjlIM5H078gpf?=
 =?iso-8859-1?Q?Sk8JouZUuYK5LtlnpE9ZQe6xRWXAwVKLOSs1rmlHyWUjD3EorcaEudaIRK?=
 =?iso-8859-1?Q?5aTV+UlOVUNa6qjycDZZ/Oa6mYYM7mQ+afkSPFPkspAjt5mVXHN+UCNRdL?=
 =?iso-8859-1?Q?zSHm4D7CCqJQA5tIfnTSNVxYNICf+YC8FTU/HzdRbN39/qo08MfSp+75+y?=
 =?iso-8859-1?Q?GbTHWBvwptv1KJ8t3dVZRAZm9z8ITaS6v8wTBf8EKNWlxfi2caZTM1uFtc?=
 =?iso-8859-1?Q?s3RmBAy/Y82gBDsfpW7XM/d84MojsNJ6snxxEQLH9khMthwm240UN1b5+z?=
 =?iso-8859-1?Q?UAIBkubQRPUDcDbVQHM1MCDuc5+0RBrMx6wzt1viD0iCyYo38p+L2Al+bo?=
 =?iso-8859-1?Q?78EKrvmK7uR1mpdCXWRf7rcbOtf6F8rKN1ja/O31KbOlLJrNdi+0BVaqq8?=
 =?iso-8859-1?Q?7k3B7A6AUumWfZn9v9Jz2i0noGV5u5InJn/RGeyjUyDWRm/Gb01FqvFNfr?=
 =?iso-8859-1?Q?DxcPQAOkRejYRW+Fmac5akMZ9zwS9iMgyE3THLAVCG295PxV2u4FwWKIJt?=
 =?iso-8859-1?Q?8qH4fxIjhaum/5fHmqvI4ODccB6Z4mNHYgz8V+DG1h+u3W?=
Content-Type: multipart/alternative;
	boundary="_000_AMBP189MB3196741A2986E6EE02918178F89FAAMBP189MB3196EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a94c44-9566-4298-4ce9-08de5ff791d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 12:03:24.0821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eVZBt4VnbqFExHCVd//sDEvAFeCYmUKxykvULEkPOl749ndWgn/uhbaKiwnAiYXim80ILJsRpxJeRIFVdR1C1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3268
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 12:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230195

--_000_AMBP189MB3196741A2986E6EE02918178F89FAAMBP189MB3196EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review, I will send a v2 with the corrections.

Kind Regards,

Amaury
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Friday, January 30, 2026 11:40 AM
To: Amaury Couderc <amaury.couderc@est.tech>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] curl_sasl:_if_redirected,_require=
_permission_to_use_bearer



Le ven. 30 janv. 2026 =E0 11:17, Amaury Couderc via lists.openembedded.org<=
http://lists.openembedded.org> <amaury.couderc=3Dest.tech@lists.openembedde=
d.org<mailto:est.tech@lists.openembedded.org>> a =E9crit :
From: Amaury Couderc <amaury.couderc@est.tech>

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>

Hello,

The subject for this patch should be "[scarthgap][PATCH] curl: patch CVE-20=
25-14524"
"curl_sasl: if redirected, require permission to use bearer" has very littl=
e meaning outside of the curl source code.

Can you send a v2 with that?

Also, can you ensure the Upstream-Status line is not split?

Thanks!

---
 .../curl/curl/CVE-2025-14524.patch            | 45 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb<http://curl_8.7.1.bb>       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14524.patch b/meta/rec=
ipes-support/curl/curl/CVE-2025-14524.patch
new file mode 100644
index 0000000000..bd0dd86acb
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
@@ -0,0 +1,45 @@
+From 0bccd8d29c89d70120444088d3893af59f3772bf Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se<mailto:daniel@haxx.se>>
+Date: Wed, 10 Dec 2025 11:40:47 +0100
+Subject: [PATCH] curl_sasl: if redirected, require permission to use beare=
r
+
+Closes #19933
+
+CVE: CVE-2025-14524
+Upstream-Status: Backport
+[https://github.com/curl/curl/commit/1a822275d333dc6da6043497160fd04c8fa48=
640]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ lib/curl_sasl.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/curl_sasl.c b/lib/curl_sasl.c
+index 66639cbacc..fe646548a8 100644
+--- a/lib/curl_sasl.c
++++ b/lib/curl_sasl.c
+@@ -357,7 +357,9 @@ CURLcode Curl_sasl_start(struct SASL *sasl, struct Cur=
l_easy *data,
+     data->set.str[STRING_SERVICE_NAME] :
+     sasl->params->service;
+ #endif
+-  const char *oauth_bearer =3D data->set.str[STRING_BEARER];
++  const char *oauth_bearer =3D
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts=
) ?
++    data->set.str[STRING_BEARER] : NULL;
+   struct bufref nullmsg;
+
+   Curl_conn_get_host(data, FIRSTSOCKET, &hostname, &disp_hostname, &port)=
;
+@@ -544,7 +546,9 @@ CURLcode Curl_sasl_continue(struct SASL *sasl, struct =
Curl_easy *data,
+     data->set.str[STRING_SERVICE_NAME] :
+     sasl->params->service;
+ #endif
+-  const char *oauth_bearer =3D data->set.str[STRING_BEARER];
++  const char *oauth_bearer =3D
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts=
) ?
++    data->set.str[STRING_BEARER] : NULL;
+   struct bufref serverdata;
+
+   Curl_conn_get_host(data, FIRSTSOCKET, &hostname, &disp_hostname, &port)=
;
+--
+2.43.0
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb<http://curl_8.7.1.bb> =
b/meta/recipes-support/curl/curl_8.7.1.bb<http://curl_8.7.1.bb>
index 0af6a41399..33bf6b1163 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb<http://curl_8.7.1.bb>
+++ b/meta/recipes-support/curl/curl_8.7.1.bb<http://curl_8.7.1.bb>
@@ -25,6 +25,7 @@ SRC_URI =3D " \
     file://CVE-2024-11053-0003.patch \
     file://CVE-2025-0167.patch \
     file://CVE-2025-9086.patch \
+    file://CVE-2025-14524.patch \
 "

 SRC_URI:append:class-nativesdk =3D " \
--
2.52.0


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#230190): https://lists.openembedded.org/g/openembedded-=
core/message/230190
Mute This Topic: https://lists.openembedded.org/mt/117542226/4316185
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoan=
n.congal@smile.fr<mailto:yoann.congal@smile.fr>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--
Yoann Congal
Smile ECS

--_000_AMBP189MB3196741A2986E6EE02918178F89FAAMBP189MB3196EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for the review, I will send a v2 with the corrections.</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Kind Regards,</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Amaury</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Friday, January 30, 2026 11:40 AM<br>
<b>To:</b> Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] curl_sasl:_if_redirected,_=
require_permission_to_use_bearer</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr"><br>
</div>
<br>
<div class=3D"x_gmail_quote x_gmail_quote_container">
<div dir=3D"ltr" class=3D"x_gmail_attr">Le&nbsp;ven. 30 janv. 2026 =E0&nbsp=
;11:17, Amaury Couderc via
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;am=
aury.couderc=3D<a href=3D"mailto:est.tech@lists.openembedded.org">est.tech@=
lists.openembedded.org</a>&gt; a =E9crit&nbsp;:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
From: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
<br>
Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
</blockquote>
<div><br>
</div>
<div>Hello,</div>
<div><br>
</div>
<div>The subject for this patch should be &quot;[scarthgap][PATCH] curl: pa=
tch CVE-2025-14524&quot;&nbsp;</div>
<div>&quot;curl_sasl: if redirected, require permission to use bearer&quot;=
 has very little meaning outside of the curl source code.</div>
<div><br>
</div>
<div>Can you send a v2 with that?</div>
<div><br>
</div>
<div>Also, can you ensure the&nbsp;Upstream-Status line is not split?</div>
<div><br>
</div>
<div>Thanks!</div>
<div><br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
---<br>
&nbsp;.../curl/curl/CVE-2025-14524.patch&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | 45 +++++++++++++++++++<br>
&nbsp;meta/recipes-support/curl/<a href=3D"http://curl_8.7.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.7.1.bb</a>&nbsp; &nbsp; &nbsp; &nbsp;|&nb=
sp; 1 +<br>
&nbsp;2 files changed, 46 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patc=
h<br>
<br>
diff --git a/meta/recipes-support/curl/curl/CVE-2025-14524.patch b/meta/rec=
ipes-support/curl/curl/CVE-2025-14524.patch<br>
new file mode 100644<br>
index 0000000000..bd0dd86acb<br>
--- /dev/null<br>
+++ b/meta/recipes-support/curl/curl/CVE-2025-14524.patch<br>
@@ -0,0 +1,45 @@<br>
+From 0bccd8d29c89d70120444088d3893af59f3772bf Mon Sep 17 00:00:00 2001<br>
+From: Daniel Stenberg &lt;<a href=3D"mailto:daniel@haxx.se" target=3D"_bla=
nk">daniel@haxx.se</a>&gt;<br>
+Date: Wed, 10 Dec 2025 11:40:47 +0100<br>
+Subject: [PATCH] curl_sasl: if redirected, require permission to use beare=
r<br>
+<br>
+Closes #19933<br>
+<br>
+CVE: CVE-2025-14524<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://github.com/curl/curl/commit/1a822275d333dc6da604349716=
0fd04c8fa48640" rel=3D"noreferrer" target=3D"_blank">https://github.com/cur=
l/curl/commit/1a822275d333dc6da6043497160fd04c8fa48640</a>]<br>
+<br>
+Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
+---<br>
+ lib/curl_sasl.c | 8 ++++++--<br>
+ 1 file changed, 6 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/lib/curl_sasl.c b/lib/curl_sasl.c<br>
+index 66639cbacc..fe646548a8 100644<br>
+--- a/lib/curl_sasl.c<br>
++++ b/lib/curl_sasl.c<br>
+@@ -357,7 +357,9 @@ CURLcode Curl_sasl_start(struct SASL *sasl, struct Cur=
l_easy *data,<br>
+&nbsp; &nbsp; &nbsp;data-&gt;set.str[STRING_SERVICE_NAME] :<br>
+&nbsp; &nbsp; &nbsp;sasl-&gt;params-&gt;service;<br>
+ #endif<br>
+-&nbsp; const char *oauth_bearer =3D data-&gt;set.str[STRING_BEARER];<br>
++&nbsp; const char *oauth_bearer =3D<br>
++&nbsp; &nbsp; (!data-&gt;state.this_is_a_follow || data-&gt;set.allow_aut=
h_to_other_hosts) ?<br>
++&nbsp; &nbsp; data-&gt;set.str[STRING_BEARER] : NULL;<br>
+&nbsp; &nbsp;struct bufref nullmsg;<br>
+ <br>
+&nbsp; &nbsp;Curl_conn_get_host(data, FIRSTSOCKET, &amp;hostname, &amp;dis=
p_hostname, &amp;port);<br>
+@@ -544,7 +546,9 @@ CURLcode Curl_sasl_continue(struct SASL *sasl, struct =
Curl_easy *data,<br>
+&nbsp; &nbsp; &nbsp;data-&gt;set.str[STRING_SERVICE_NAME] :<br>
+&nbsp; &nbsp; &nbsp;sasl-&gt;params-&gt;service;<br>
+ #endif<br>
+-&nbsp; const char *oauth_bearer =3D data-&gt;set.str[STRING_BEARER];<br>
++&nbsp; const char *oauth_bearer =3D<br>
++&nbsp; &nbsp; (!data-&gt;state.this_is_a_follow || data-&gt;set.allow_aut=
h_to_other_hosts) ?<br>
++&nbsp; &nbsp; data-&gt;set.str[STRING_BEARER] : NULL;<br>
+&nbsp; &nbsp;struct bufref serverdata;<br>
+ <br>
+&nbsp; &nbsp;Curl_conn_get_host(data, FIRSTSOCKET, &amp;hostname, &amp;dis=
p_hostname, &amp;port);<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_8.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_8.7.1.bb</a> b/meta/recipes-support/=
curl/<a href=3D"http://curl_8.7.1.bb" rel=3D"noreferrer" target=3D"_blank">=
curl_8.7.1.bb</a><br>
index 0af6a41399..33bf6b1163 100644<br>
--- a/meta/recipes-support/curl/<a href=3D"http://curl_8.7.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.7.1.bb</a><br>
+++ b/meta/recipes-support/curl/<a href=3D"http://curl_8.7.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">curl_8.7.1.bb</a><br>
@@ -25,6 +25,7 @@ SRC_URI =3D &quot; \<br>
&nbsp; &nbsp; &nbsp;file://CVE-2024-11053-0003.patch \<br>
&nbsp; &nbsp; &nbsp;file://CVE-2025-0167.patch \<br>
&nbsp; &nbsp; &nbsp;file://CVE-2025-9086.patch \<br>
+&nbsp; &nbsp; file://CVE-2025-14524.patch \<br>
&nbsp;&quot;<br>
<br>
&nbsp;SRC_URI:append:class-nativesdk =3D &quot; \<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230190): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230190" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/230190</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117542226/431=
6185" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/mt/117542226/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>]<br=
>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
<div><br clear=3D"all">
</div>
<br>
<span class=3D"x_gmail_signature_prefix">-- </span><br>
<div dir=3D"ltr" class=3D"x_gmail_signature">
<div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font>
<div><font face=3D"Raleway, regular">Smile ECS</font></div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AMBP189MB3196741A2986E6EE02918178F89FAAMBP189MB3196EURP_--

