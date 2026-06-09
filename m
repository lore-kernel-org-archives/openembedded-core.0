Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6EACD8CAE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:14:49 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73815.1780989237072358881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 00:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=F1e3CyQG;
 spf=pass (domain: est.tech, ip: 52.101.70.12, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjDPXDwiVLyyVuAfKVaAwjY7R2fEZZyav+pl+iDkZBGVYY5jE3Oh961fpvuALrKLFRAsPL+5fYJ4jkNd19xNBsHlJCS31qup/iumCtySNykZFrl3/+ycVsCV7Ykw2i59/KYGtMgDBNv7UFD0CWhQ1mrSaDI4BbHOZtpg0+oBjBnvkGXCbmc4n1CsFSL3jGJ4XGVKVCgopS+UZESB1g3UPUvdEyijobOp/B86CaypNWi1dxNm/85gT5Y9CKm9QWh+IiGDEh+eE64rfKZ7ZI4qNd4W3VbONnDdK9+ixfIAiEhNPel1qLoaRbIS4waBSuoz11ucceYg2e5FHvMNC+dt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejmVRJAAotcTN1QdL/zjhgtXg4YgbJdBvNegs0gKT/c=;
 b=wcs3Df8XDd0l3Oy8I7eBdNzezG3K2uQu323MbuZKQ9oUWy6A2s6DUMo/QinlSOAGufwG/yohqQuhG02bAFdwlP21G0lLxa1rlDcsvYGoqPAJ/rgdQ/uq2DX+LIe2i2lrdOMeIXrP7+mPUHqfhqXF4V0a8/zfOrI2ie1W1L4n5tPEU0cseCUoqzB2Ib2+MZyDUpSEML+C1iQHtZBTdGJcrhf3LjwgVOlRsNSbMzt7Hn+FNKbSyh9qkGYg6uzG6isJ3INuF90fnDdmxpuGVvmqgxm4vutyHDs3VjeaA2fb1Zuar6jmydZg7Rn0iYoRnY7dquLvO3QLaCQ9gLjFU/uzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejmVRJAAotcTN1QdL/zjhgtXg4YgbJdBvNegs0gKT/c=;
 b=F1e3CyQGTeIFg6JgKD94lfTT2RoBZrbvsXkKJA/5oUAdyWj4b/4WANymQtLsAMn2BJAHJVAUO10+cRj28QRks8IkX2JzOKD0B25KHn3jUOOB3DSj87bGd8IHVdfhcS/HW2dQqRzR02fY366NRTqPuV3sLXxSfS0jI7nSgmiXqhBEKT3UzArIQo8zMXssSkGqQMzroMDXkwa0sxH1NLEQeMcI1SndmQD8HSyp8DBjap+eT+CTcxRG/VT3heshNCJJYtknIK6l1NYCw7w7BwBqtZ+LZidMf7WK7msfbP8gV2o0yiyQJ86yZRs+3dXTo0ZCP/JXfD3uweXORuIK8Drqlw==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU0P189MB2475.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:423::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Tue, 9 Jun 2026
 07:13:50 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 07:13:50 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] curl: fix CVE-2026-6276
Thread-Topic: [OE-core][wrynose][PATCH] curl: fix CVE-2026-6276
Thread-Index: AQHc8pkB0Ip6s4oWREumgDNYEDVPB7Y0uu4AgAEZffo=
Date: Tue, 9 Jun 2026 07:13:50 +0000
Message-ID: 
 <AS8P189MB1672EC9FC9325DEC07F97A1CB31D2@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260602140623.762455-1-adarsh.jagadish.kamini@est.tech>
 <DJ3Q5GCNO1UT.3AGC33VNG4IK6@smile.fr>
In-Reply-To: <DJ3Q5GCNO1UT.3AGC33VNG4IK6@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|DU0P189MB2475:EE_
x-ms-office365-filtering-correlation-id: 307330b4-8773-4d67-e887-08dec5f6a808
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003|18002099003|22082099003|6133799003|38070700021|20052099010|11063799006|4143699003|56012099006|3023799007;
x-microsoft-antispam-message-info: 
 6wAhSsoXNdlL75G/oQd3WKK54Ox+ZphK1Wpb1OEj3o+pDznhTr68amHGt4u9ZQArtDarnBrC12VF3UOAzTyZXt2CiXHGYxLucyF4GztgheVB29ayKo37QxHYBTCOYTgf8UNm/0htBKewccZQJZ5kb8frEa+nAmhTF0J+8OQJiCjlKW0ow7+Wf/CFv2TKtIk8F4wHeIau34DKEvPkA79puwcAu5V+oBWY4MDTFoCR7oJJqWxXh17+Pa+lVU55mMb3ULT1ZMCoyjGgP3fDjEo85fY7v9Hmt/qn/HilL38SdzkQTyQHdmsUYVczA8sycXhL+4AMfCvsuwYb6APfBA+jiAmnd6r1yo73d4ALHsYEQZs8VWxC2kpVmh0d22DTMGhQMVGHxSDwOeTTUry9iKVKU93np0qtrNNxq98k5jSJDrj2KWhwjYi8SPPP0oBzlAeG4GctXb8IRnI/GabXOmuGInjH+7Z9x28LCTYr2z5p4C/8eQYndIfC40DBjQqPeATy8SCc3nFJj7OeCF/GdjSM6bT4m6VEotA5CwEjyPHMDs+SZhbBnPE8eFROtUgHX2q5KuT2giDc05umBOjxlefLzdJgRiKGkYG/mPungAj3tyF1P6uXxRYSQAhnUvCooU8N4VJp+3jeGBl1aohoSGoA1zEXHW0Yqzo5mKQ/a9Vr9CufSdxmVpQnbl+sFacTXdB5y97WKzJpTkQ/zy5Rpcwqsg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003)(18002099003)(22082099003)(6133799003)(38070700021)(20052099010)(11063799006)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?95nbLLXL+aQxCQoKItb58XprfZaWjqea78b7SXiuo/4RtIPQPKZ8p5BfBPEB?=
 =?us-ascii?Q?0uyJHNp/wgMkAJlJ5SUMevnGyKH3ypjT4Dh2uQ99xscOpQl5eDpUUidtubW9?=
 =?us-ascii?Q?Co9gN9di8xHSt9WnWTkYeVfmkotFd1EXzBj/nxA/VLrSvNi8jsXWQWsv4HG5?=
 =?us-ascii?Q?VbBXY/fqnxTTZCb8O3bCUqCC9M6yJSrc2zDrCeSIuC1tHAJyYOTMFNC4Gwo9?=
 =?us-ascii?Q?q8DKn2WF+gutuibQ5YtgHVZ4aZNO5jmXmnJEJ1u04SB0+UeZPN8CFxGA3Wx0?=
 =?us-ascii?Q?G/HgzQUQjiF0OPaD3vwVxAjDzFK7HKLResifAHRXcz0gGMe3fUKZ1zB/2mIp?=
 =?us-ascii?Q?y8OaD+YOouGSvExa1lTY8NBJ5tkQzlhkMWq63eQ5ObxqBCC6UZCSTodsnQoC?=
 =?us-ascii?Q?5mPZYc6XsAUB+yAOENlkZ5qiQc21dbK8Has/TJz/kcCxyAsCJ9Gxyvj6Q3LR?=
 =?us-ascii?Q?9T6SimTkaH0EXzkGNApq9yCqx8+oOEqOI1NhhX0qNt/jfNzrSbonpw4soqtR?=
 =?us-ascii?Q?nXue/8J0Bbdxz7CdKyBx8LTnAxzpJyFZzzijdB7meSLQMMujwjEZ/Hm2/W2Q?=
 =?us-ascii?Q?wDiHkm4WPrSnMGsB25Ft6EyRS9YpJpMwdqvULPLGNjoYnHv/j8Q9gyXUwab1?=
 =?us-ascii?Q?qJXtW+zm4UbTXWwfGCIuFrY1QaLoQWisyd+Min/XKeiTi06BC4oDloZQA2Oa?=
 =?us-ascii?Q?MBRA5OAOx5Ptbj/12Lk+nJaiRZ0kX3PdTuJZkwzLY0LfFlzKThWsFrYNHGgy?=
 =?us-ascii?Q?0GKxwSdG3AhbQA2uiU5TYnuRWDbIXbMJfTtjD9hfeATB7cazskO7MlTpf2Zk?=
 =?us-ascii?Q?NYfiMZ84n4Lq5bOuPXkOPgXHm2wkVyhUdL3WzT9gVdTWVZzTyEzgPoWuZTVO?=
 =?us-ascii?Q?e38IdMFHGNNhaqfpFqTQKmGgQkxvqk/kJF6Bbjhf4TWgHmnd6HCb3ShCrUEN?=
 =?us-ascii?Q?fH6xqrlRUGhyd66bnDZSr62Ss5cWNXD8SUYFUru1OEEEMHg2cQ3/U2E/2rIv?=
 =?us-ascii?Q?tHlOq+anBzGkM+QbOo/cYadp7nSlocvoU8QIzDuLc7lswdfaIQurDt1TPpr6?=
 =?us-ascii?Q?PK1HNkFezD0/DN4L5rKmmZSW8WqoAGqgX7qDfqdSNnZWtXvEtLBdl08fDIx6?=
 =?us-ascii?Q?v1XfeW/AiKHexVdAWoj2ButfoCeOcjqpF6eNJNW6gIVRYuL0q98hsIa24emY?=
 =?us-ascii?Q?S1/mCoi3GcR4v03KuFDwBtjRGAto9yusoOvTUq+H8D2ZsnJGS7IxZLMrWZZ8?=
 =?us-ascii?Q?CBtFl7LvFAvv4qL3eIgNHiJA4x5c8xkke8Z53sZgAqj3k0ZQAdMnixS80kzu?=
 =?us-ascii?Q?94c4p9sNVOMG3IHxx47DBZPe5vd9O2MzG3+NuLPt+Y3589Vl/sg/hK9yPlIy?=
 =?us-ascii?Q?gol+o+g9A2m7k8IQjk1a0cUMIvtYXoDdi/raTHz2D67qTFCnW1kbn+pK9L51?=
 =?us-ascii?Q?Qkye/JSCDd2Ot6sB84pLd7+oUFo8WFtyBCkNpyQ6eID3f9pLUfHoHUBlCWrY?=
 =?us-ascii?Q?iGqeUGGdSD5CbrSeG/W7ZUBMo2Buu7dDyOI9XC+XLy0QnGUIh+OgJJQ7ffk6?=
 =?us-ascii?Q?jPpzjsHkPty3HEmjdYKSXBQFcf+aSQ4BK3xVgn6vXDZzm80gD1HF5KiiHHgA?=
 =?us-ascii?Q?RYamMpuq6qOKIoonSTuvRt8h3McWWlvwABj3/5a0tsNQAMskgjp7EeACP4lc?=
 =?us-ascii?Q?NERIIf2uiaU9UGJiv54dXC0IatXVhwdUr6vWq0e6fscM76z1XuHChxoC23ld?=
 =?us-ascii?Q?SB4l+dTqyMPA45eAeClnNxqaD8Ed0+c=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 307330b4-8773-4d67-e887-08dec5f6a808
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 07:13:50.4682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6xwcuZGu6PIfJTwk3J/zmRjdk1neoua2QbAvvVpUXi1RnnS4+EKYlk3/o8WnIvIcX+qYAEzYxiqOf/Zm8M66iSvpf6SB5mB3CuG1uKvVSwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2475
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB1672EC9FC9325DEC07F97A1CB31D2AS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 07:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238266

--_000_AS8P189MB1672EC9FC9325DEC07F97A1CB31D2AS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Thanks for pointing out. I built another version of patch, and with minor c=
hanges, I misplaced the patch file in the recipe.
Will fix it in v2.

Thanks!

________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, June 8, 2026 16:06
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] curl: fix CVE-2026-6276

On Tue Jun 2, 2026 at 4:06 PM CEST, Adarsh Jagadish Kamini via lists.openem=
bedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Backport patch to fix CVE-2026-6276.
> https://nvd.nist.gov/vuln/detail/CVE-2026-6276
>
> Upstream fix:
>   https://github.com/curl/curl/commit/3a19987a87f393d9394fe5acc7643f6c263=
c92db
>
> Adapted for curl 8.19.0:
> - Use Curl_safefree (upstream uses curlx_safefree, renamed in later versi=
ons)
> - Drop req->userpwd/req->proxyuserpwd context (not yet moved to
>   SingleRequest in this version)
>
> Tested with ptest:
> Before: PASSED: 1000, FAILED: 0, SKIPPED: 0
> After: PASSED: 1001, FAILED: 0, SKIPPED: 0
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../curl/curl/CVE-2026-6276.patch             | 315 ++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
>  2 files changed, 316 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6276.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-6276.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-6276.patch
> new file mode 100644
> index 0000000000..68bec24e94
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-6276.patch
> @@ -0,0 +1,315 @@
> +From 48d71bc976572aaf09c63ab86b5165762450a507 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 14 Apr 2026 08:51:44 +0200
> +Subject: [PATCH] urldata: move cookiehost to struct SingleRequest
> +
> +To make it scoped for the single request appropriately.
> +
> +Reported-by: Muhamad Arga Reksapati
> +
> +Verify with libtest 2504: a custom Host *disabled* on reused handle
> +
> +Closes #21312
> +
> +CVE: CVE-2026-6276
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/3a19987a8=
7f393d9394fe5acc7643f6c263c92db]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + lib/http.c                 | 14 +++---
> + lib/request.c              |  3 ++
> + lib/request.h              |  3 ++
> + lib/url.c                  |  2 +-
> + lib/urldata.h              |  3 --
> + tests/data/Makefile.am     |  2 +-
> + tests/data/test2504        | 52 +++++++++++++++++++++
> + tests/libtest/Makefile.inc |  2 +-
> + tests/libtest/lib2504.c    | 93 ++++++++++++++++++++++++++++++++++++++
> + 9 files changed, 162 insertions(+), 12 deletions(-)
> + create mode 100644 tests/data/test2504
> + create mode 100644 tests/libtest/lib2504.c
> +
> +diff --git a/lib/http.c b/lib/http.c
> +index 188da5fd83..7ebbdfa551 100644
> +--- a/lib/http.c
> ++++ b/lib/http.c
> +@@ -2002,6 +2002,9 @@ static CURLcode http_set_aptr_host(struct Curl_eas=
y *data)
> +     data->state.first_remote_protocol =3D conn->scheme->protocol;
> +   }
> +   Curl_safefree(aptr->host);
> ++#ifndef CURL_DISABLE_COOKIES
> ++  Curl_safefree(data->req.cookiehost);
> ++#endif
> +
> +   ptr =3D Curl_checkheaders(data, STRCONST("Host"));
> +   if(ptr && (!data->state.this_is_a_follow ||
> +@@ -2037,8 +2040,7 @@ static CURLcode http_set_aptr_host(struct Curl_eas=
y *data)
> +         if(colon)
> +           *colon =3D 0; /* The host must not include an embedded port n=
umber */
> +       }
> +-      curlx_free(aptr->cookiehost);
> +-      aptr->cookiehost =3D cookiehost;
> ++      data->req.cookiehost =3D cookiehost;
> +     }
> + #endif
> +
> +@@ -2538,8 +2540,8 @@ static CURLcode http_cookies(struct Curl_easy *dat=
a,
> +
> +     if(data->cookies && data->state.cookie_engine) {
> +       bool okay;
> +-      const char *host =3D data->state.aptr.cookiehost ?
> +-        data->state.aptr.cookiehost : data->conn->host.name;
> ++      const char *host =3D data->req.cookiehost ?
> ++        data->req.cookiehost : data->conn->host.name;
> +       Curl_share_lock(data, CURL_LOCK_DATA_COOKIE, CURL_LOCK_ACCESS_SIN=
GLE);
> +       result =3D Curl_cookie_getlist(data, data->conn, &okay, host, &li=
st);
> +       if(!result && okay) {
> +@@ -3545,8 +3547,8 @@ static CURLcode http_header_s(struct Curl_easy *da=
ta,
> +   if(v) {
> +     /* If there is a custom-set Host: name, use it here, or else use
> +      * real peer hostname. */
> +-    const char *host =3D data->state.aptr.cookiehost ?
> +-      data->state.aptr.cookiehost : conn->host.name;
> ++    const char *host =3D data->req.cookiehost ?
> ++      data->req.cookiehost : conn->host.name;
> +     const bool secure_context =3D Curl_secure_context(conn, host);
> +     CURLcode result;
> +     Curl_share_lock(data, CURL_LOCK_DATA_COOKIE, CURL_LOCK_ACCESS_SINGL=
E);
> +diff --git a/lib/request.c b/lib/request.c
> +index 66077530d7..765dbac058 100644
> +--- a/lib/request.c
> ++++ b/lib/request.c
> +@@ -113,6 +113,9 @@ void Curl_req_hard_reset(struct SingleRequest *req, =
struct Curl_easy *data)
> +   struct curltime t0 =3D { 0, 0 };
> +
> +   Curl_safefree(req->newurl);
> ++#ifndef CURL_DISABLE_COOKIES
> ++  Curl_safefree(req->cookiehost);
> ++#endif
> +   Curl_client_reset(data);
> +   if(req->sendbuf_init)
> +     Curl_bufq_reset(&req->sendbuf);
> +diff --git a/lib/request.h b/lib/request.h
> +index 5332d48538..6e4bd0fb6e 100644
> +--- a/lib/request.h
> ++++ b/lib/request.h
> +@@ -95,6 +95,9 @@ struct SingleRequest {
> +   char *newurl;     /* Set to the new URL to use when a redirect or a r=
etry is
> +                        wanted */
> +
> ++#ifndef CURL_DISABLE_COOKIES
> ++  char *cookiehost;
> ++#endif
> + #ifndef CURL_DISABLE_COOKIES
> +   unsigned char setcookies;
> + #endif
> +diff --git a/lib/url.c b/lib/url.c
> +index ec0457bcdd..b9e308add2 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -304,7 +304,7 @@ CURLcode Curl_close(struct Curl_easy **datap)
> +   Curl_safefree(data->state.aptr.ref);
> +   Curl_safefree(data->state.aptr.host);
> + #ifndef CURL_DISABLE_COOKIES
> +-  Curl_safefree(data->state.aptr.cookiehost);
> ++  Curl_safefree(data->req.cookiehost);
> + #endif
> + #ifndef CURL_DISABLE_RTSP
> +   Curl_safefree(data->state.aptr.rtsp_transport);
> +diff --git a/lib/urldata.h b/lib/urldata.h
> +index 5ae148054b..d71337c8f6 100644
> +--- a/lib/urldata.h
> ++++ b/lib/urldata.h
> +@@ -1052,9 +1052,6 @@ struct UrlState {
> +     char *rangeline;
> +     char *ref;
> +     char *host;
> +-#ifndef CURL_DISABLE_COOKIES
> +-    char *cookiehost;
> +-#endif
> + #ifndef CURL_DISABLE_RTSP
> +     char *rtsp_transport;
> + #endif
> +diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
> +index 53abf60901..da0f8f55d4 100644
> +--- a/tests/data/Makefile.am
> ++++ b/tests/data/Makefile.am
> +@@ -264,7 +264,7 @@ test2309 \
> + \
> + test2400 test2401 test2402 test2403 test2404 test2405 test2406 test2407=
 \
> + \
> +-test2500 test2501 test2502 test2503 \
> ++test2500 test2501 test2502 test2503 test2504 \
> + \
> + test2600 test2601 test2602 test2603 test2604 test2605 \
> + \
> +diff --git a/tests/data/test2504 b/tests/data/test2504
> +new file mode 100644
> +index 0000000000..8cec1c8210
> +--- /dev/null
> ++++ b/tests/data/test2504
> +@@ -0,0 +1,52 @@
> ++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
> ++<testcase>
> ++<info>
> ++<keywords>
> ++HTTP
> ++cookies
> ++</keywords>
> ++</info>
> ++
> ++# Server-side
> ++<reply>
> ++<data crlf=3D"headers" nocheck=3D"yes">
> ++HTTP/1.1 200 OK
> ++Date: Tue, 09 Nov 2010 14:49:00 GMT
> ++Server: server.example.com
> ++Content-Length: 47
> ++Set-Cookie: sid=3DSECRET123; Path=3D/
> ++
> ++file contents should appear once for each file
> ++</data>
> ++</reply>
> ++
> ++# Client-side
> ++<client>
> ++<server>
> ++http
> ++</server>
> ++<tool>
> ++lib%TESTNUMBER
> ++</tool>
> ++<name>
> ++custom Host with cookie, handle reuse, no custom Host:
> ++</name>
> ++<command>
> ++http://%HOSTIP:%HTTPPORT
> ++</command>
> ++</client>
> ++
> ++# Verify data after the test has been "shot"
> ++<verify>
> ++<protocol crlf=3D"headers">
> ++GET / HTTP/1.1
> ++Host: victim.internal
> ++Accept: */*
> ++
> ++GET / HTTP/1.1
> ++Host: %HOSTIP:%HTTPPORT
> ++Accept: */*
> ++
> ++</protocol>
> ++</verify>
> ++</testcase>
> +diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
> +index e3202804a9..2319bafe72 100644
> +--- a/tests/libtest/Makefile.inc
> ++++ b/tests/libtest/Makefile.inc
> +@@ -113,7 +113,7 @@ TESTS_C =3D \
> +   lib2023.c lib2032.c lib2082.c \
> +   lib2301.c lib2302.c lib2304.c           lib2306.c lib2308.c lib2309.c=
 \
> +   lib2402.c           lib2404.c lib2405.c \
> +-  lib2502.c \
> ++  lib2502.c lib2504.c \
> +   lib2700.c \
> +   lib3010.c lib3025.c lib3026.c lib3027.c lib3033.c lib3034.c \
> +   lib3100.c lib3101.c lib3102.c lib3103.c lib3104.c lib3105.c \
> +diff --git a/tests/libtest/lib2504.c b/tests/libtest/lib2504.c
> +new file mode 100644
> +index 0000000000..72b965d6e6
> +--- /dev/null
> ++++ b/tests/libtest/lib2504.c
> +@@ -0,0 +1,93 @@
> ++/**********************************************************************=
*****
> ++ *                                  _   _ ____  _
> ++ *  Project                     ___| | | |  _ \| |
> ++ *                             / __| | | | |_) | |
> ++ *                            | (__| |_| |  _ <| |___
> ++ *                             \___|\___/|_| \_\_____|
> ++ *
> ++ * Copyright (C) Linus Nielsen Feltzing <linus@haxx.se>
> ++ *
> ++ * This software is licensed as described in the file COPYING, which
> ++ * you should have received as part of this distribution. The terms
> ++ * are also available at https://curl.se/docs/copyright.html.
> ++ *
> ++ * You may opt to use, copy, modify, merge, publish, distribute and/or =
sell
> ++ * copies of the Software, and permit persons to whom the Software is
> ++ * furnished to do so, under the terms of the COPYING file.
> ++ *
> ++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY O=
F ANY
> ++ * KIND, either express or implied.
> ++ *
> ++ * SPDX-License-Identifier: curl
> ++ *
> ++ **********************************************************************=
*****/
> ++#include "first.h"
> ++
> ++#include "testtrace.h"
> ++
> ++static size_t sink2504(char *ptr, size_t size, size_t nmemb, void *ud)
> ++{
> ++  (void)ptr;
> ++  (void)ud;
> ++  return size * nmemb;
> ++}
> ++
> ++static void dump_cookies2504(CURL *h, const char *tag)
> ++{
> ++  struct curl_slist *cookies =3D NULL;
> ++  struct curl_slist *nc;
> ++  CURLcode rc =3D curl_easy_getinfo(h, CURLINFO_COOKIELIST, &cookies);
> ++
> ++  curl_mprintf("=3D=3D %s =3D=3D\n", tag);
> ++  if(rc) {
> ++    curl_mprintf("getinfo error: %d\n", (int)rc);
> ++    return;
> ++  }
> ++  for(nc =3D cookies; nc; nc =3D nc->next)
> ++    puts(nc->data);
> ++  curl_slist_free_all(cookies);
> ++}
> ++
> ++static CURLcode test_lib2504(const char *URL)
> ++{
> ++  CURL *curl;
> ++  CURLcode result =3D CURLE_OUT_OF_MEMORY;
> ++  struct curl_slist *hdrs =3D NULL;
> ++
> ++  if(curl_global_init(CURL_GLOBAL_ALL) !=3D CURLE_OK) {
> ++    curl_mfprintf(stderr, "curl_global_init() failed\n");
> ++    return TEST_ERR_MAJOR_BAD;
> ++  }
> ++
> ++  curl =3D curl_easy_init();
> ++  if(!curl) {
> ++    curl_mfprintf(stderr, "curl_easy_init() failed\n");
> ++    curl_global_cleanup();
> ++    return TEST_ERR_MAJOR_BAD;
> ++  }
> ++
> ++  hdrs =3D curl_slist_append(hdrs, "Host: victim.internal");
> ++  if(hdrs) {
> ++    test_setopt(curl, CURLOPT_WRITEFUNCTION, sink2504);
> ++    test_setopt(curl, CURLOPT_COOKIEFILE, "");
> ++    test_setopt(curl, CURLOPT_HTTPHEADER, hdrs);
> ++    test_setopt(curl, CURLOPT_URL, URL);
> ++
> ++    result =3D curl_easy_perform(curl);
> ++    curl_mprintf("req1=3D%d\n", (int)result);
> ++    dump_cookies2504(curl, "after request 1");
> ++
> ++    test_setopt(curl, CURLOPT_HTTPHEADER, NULL);
> ++    test_setopt(curl, CURLOPT_URL, URL);
> ++
> ++    result =3D curl_easy_perform(curl);
> ++    curl_mprintf("req2=3D%d\n", (int)result);
> ++    dump_cookies2504(curl, "after request 2");
> ++  }
> ++test_cleanup:
> ++  curl_slist_free_all(hdrs);
> ++  curl_easy_cleanup(curl);
> ++  curl_global_cleanup();
> ++
> ++  return result;
> ++}
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
> index b9251336b8..9bbbb5e36f 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -161,6 +161,7 @@ RDEPENDS:${PN}-ptest +=3D " \
>        perl-module-memoize \
>        perl-module-storable \
>        perl-module-time-hires \
> +    file://CVE-2026-6276.patch \

This should be in SRC_URI, not in RDEPENDS. Did you try to build this
patch?

Regards,

>  "
>
>  PACKAGES =3D+ "lib${BPN}"


--
Yoann Congal
Smile ECS


--_000_AS8P189MB1672EC9FC9325DEC07F97A1CB31D2AS8P189MB1672EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for pointing out. I built another version of patch, and with minor c=
hanges, I misplaced the patch file in the recipe.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Will fix it in v2.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Monday, June 8, 2026 16:06<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH] curl: fix CVE-2026-6276</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue Jun 2, 2026 at 4:06 PM CEST, Adarsh Jagadis=
h Kamini via lists.openembedded.org wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; Backport patch to fix CVE-2026-6276.<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-6276">https://nvd=
.nist.gov/vuln/detail/CVE-2026-6276</a><br>
&gt;<br>
&gt; Upstream fix:<br>
&gt;&nbsp;&nbsp; <a href=3D"https://github.com/curl/curl/commit/3a19987a87f=
393d9394fe5acc7643f6c263c92db">
https://github.com/curl/curl/commit/3a19987a87f393d9394fe5acc7643f6c263c92d=
b</a><br>
&gt;<br>
&gt; Adapted for curl 8.19.0:<br>
&gt; - Use Curl_safefree (upstream uses curlx_safefree, renamed in later ve=
rsions)<br>
&gt; - Drop req-&gt;userpwd/req-&gt;proxyuserpwd context (not yet moved to<=
br>
&gt;&nbsp;&nbsp; SingleRequest in this version)<br>
&gt;<br>
&gt; Tested with ptest:<br>
&gt; Before: PASSED: 1000, FAILED: 0, SKIPPED: 0<br>
&gt; After: PASSED: 1001, FAILED: 0, SKIPPED: 0<br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../curl/curl/CVE-2026-6276.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 315 ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/curl/curl_8.19.0.bb&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 316 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6276.=
patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2026-6276.patch b/meta=
/recipes-support/curl/curl/CVE-2026-6276.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..68bec24e94<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2026-6276.patch<br>
&gt; @@ -0,0 +1,315 @@<br>
&gt; +From 48d71bc976572aaf09c63ab86b5165762450a507 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;daniel@haxx.se&gt;<br>
&gt; +Date: Tue, 14 Apr 2026 08:51:44 +0200<br>
&gt; +Subject: [PATCH] urldata: move cookiehost to struct SingleRequest<br>
&gt; +<br>
&gt; +To make it scoped for the single request appropriately.<br>
&gt; +<br>
&gt; +Reported-by: Muhamad Arga Reksapati<br>
&gt; +<br>
&gt; +Verify with libtest 2504: a custom Host *disabled* on reused handle<b=
r>
&gt; +<br>
&gt; +Closes #21312<br>
&gt; +<br>
&gt; +CVE: CVE-2026-6276<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/3a19987a87f393d9394fe5acc7643f6c263c92db">https://github.com/curl/curl=
/commit/3a19987a87f393d9394fe5acc7643f6c263c92db</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.=
tech&gt;<br>
&gt; +---<br>
&gt; + lib/http.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 14 +++---<br>
&gt; + lib/request.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 ++<br>
&gt; + lib/request.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 ++<br>
&gt; + lib/url.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&gt; + lib/urldata.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 --<br>
&gt; + tests/data/Makefile.am&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&gt; + tests/data/test2504&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 52 +=
++++++++++++++++++++<br>
&gt; + tests/libtest/Makefile.inc |&nbsp; 2 +-<br>
&gt; + tests/libtest/lib2504.c&nbsp;&nbsp;&nbsp; | 93 +++++++++++++++++++++=
+++++++++++++++++<br>
&gt; + 9 files changed, 162 insertions(+), 12 deletions(-)<br>
&gt; + create mode 100644 tests/data/test2504<br>
&gt; + create mode 100644 tests/libtest/lib2504.c<br>
&gt; +<br>
&gt; +diff --git a/lib/http.c b/lib/http.c<br>
&gt; +index 188da5fd83..7ebbdfa551 100644<br>
&gt; +--- a/lib/http.c<br>
&gt; ++++ b/lib/http.c<br>
&gt; +@@ -2002,6 +2002,9 @@ static CURLcode http_set_aptr_host(struct Curl_=
easy *data)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;state.first_remote_protocol =3D con=
n-&gt;scheme-&gt;protocol;<br>
&gt; +&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp; Curl_safefree(aptr-&gt;host);<br>
&gt; ++#ifndef CURL_DISABLE_COOKIES<br>
&gt; ++&nbsp; Curl_safefree(data-&gt;req.cookiehost);<br>
&gt; ++#endif<br>
&gt; + <br>
&gt; +&nbsp;&nbsp; ptr =3D Curl_checkheaders(data, STRCONST(&quot;Host&quot=
;));<br>
&gt; +&nbsp;&nbsp; if(ptr &amp;&amp; (!data-&gt;state.this_is_a_follow ||<b=
r>
&gt; +@@ -2037,8 +2040,7 @@ static CURLcode http_set_aptr_host(struct Curl_=
easy *data)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(colon)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *colon =
=3D 0; /* The host must not include an embedded port number */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; curlx_free(aptr-&gt;cookiehost);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aptr-&gt;cookiehost =3D cookiehost;<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;req.cookiehost =3D cookiehos=
t;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; + #endif<br>
&gt; + <br>
&gt; +@@ -2538,8 +2540,8 @@ static CURLcode http_cookies(struct Curl_easy *=
data,<br>
&gt; + <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if(data-&gt;cookies &amp;&amp; data-&gt;stat=
e.cookie_engine) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool okay;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *host =3D data-&gt;state.a=
ptr.cookiehost ?<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;state.aptr.cooki=
ehost : data-&gt;conn-&gt;host.name;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *host =3D data-&gt;req.coo=
kiehost ?<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;req.cookiehost :=
 data-&gt;conn-&gt;host.name;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Curl_share_lock(data, CURL_LOCK_=
DATA_COOKIE, CURL_LOCK_ACCESS_SINGLE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D Curl_cookie_getlist(d=
ata, data-&gt;conn, &amp;okay, host, &amp;list);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!result &amp;&amp; okay) {<br=
>
&gt; +@@ -3545,8 +3547,8 @@ static CURLcode http_header_s(struct Curl_easy =
*data,<br>
&gt; +&nbsp;&nbsp; if(v) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* If there is a custom-set Host: name, use =
it here, or else use<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * real peer hostname. */<br>
&gt; +-&nbsp;&nbsp;&nbsp; const char *host =3D data-&gt;state.aptr.cookieho=
st ?<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;state.aptr.cookiehost : conn=
-&gt;host.name;<br>
&gt; ++&nbsp;&nbsp;&nbsp; const char *host =3D data-&gt;req.cookiehost ?<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;req.cookiehost : conn-&gt;ho=
st.name;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; const bool secure_context =3D Curl_secure_co=
ntext(conn, host);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; CURLcode result;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; Curl_share_lock(data, CURL_LOCK_DATA_COOKIE,=
 CURL_LOCK_ACCESS_SINGLE);<br>
&gt; +diff --git a/lib/request.c b/lib/request.c<br>
&gt; +index 66077530d7..765dbac058 100644<br>
&gt; +--- a/lib/request.c<br>
&gt; ++++ b/lib/request.c<br>
&gt; +@@ -113,6 +113,9 @@ void Curl_req_hard_reset(struct SingleRequest *re=
q, struct Curl_easy *data)<br>
&gt; +&nbsp;&nbsp; struct curltime t0 =3D { 0, 0 };<br>
&gt; + <br>
&gt; +&nbsp;&nbsp; Curl_safefree(req-&gt;newurl);<br>
&gt; ++#ifndef CURL_DISABLE_COOKIES<br>
&gt; ++&nbsp; Curl_safefree(req-&gt;cookiehost);<br>
&gt; ++#endif<br>
&gt; +&nbsp;&nbsp; Curl_client_reset(data);<br>
&gt; +&nbsp;&nbsp; if(req-&gt;sendbuf_init)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; Curl_bufq_reset(&amp;req-&gt;sendbuf);<br>
&gt; +diff --git a/lib/request.h b/lib/request.h<br>
&gt; +index 5332d48538..6e4bd0fb6e 100644<br>
&gt; +--- a/lib/request.h<br>
&gt; ++++ b/lib/request.h<br>
&gt; +@@ -95,6 +95,9 @@ struct SingleRequest {<br>
&gt; +&nbsp;&nbsp; char *newurl;&nbsp;&nbsp;&nbsp;&nbsp; /* Set to the new =
URL to use when a redirect or a retry is<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wante=
d */<br>
&gt; + <br>
&gt; ++#ifndef CURL_DISABLE_COOKIES<br>
&gt; ++&nbsp; char *cookiehost;<br>
&gt; ++#endif<br>
&gt; + #ifndef CURL_DISABLE_COOKIES<br>
&gt; +&nbsp;&nbsp; unsigned char setcookies;<br>
&gt; + #endif<br>
&gt; +diff --git a/lib/url.c b/lib/url.c<br>
&gt; +index ec0457bcdd..b9e308add2 100644<br>
&gt; +--- a/lib/url.c<br>
&gt; ++++ b/lib/url.c<br>
&gt; +@@ -304,7 +304,7 @@ CURLcode Curl_close(struct Curl_easy **datap)<br>
&gt; +&nbsp;&nbsp; Curl_safefree(data-&gt;state.aptr.ref);<br>
&gt; +&nbsp;&nbsp; Curl_safefree(data-&gt;state.aptr.host);<br>
&gt; + #ifndef CURL_DISABLE_COOKIES<br>
&gt; +-&nbsp; Curl_safefree(data-&gt;state.aptr.cookiehost);<br>
&gt; ++&nbsp; Curl_safefree(data-&gt;req.cookiehost);<br>
&gt; + #endif<br>
&gt; + #ifndef CURL_DISABLE_RTSP<br>
&gt; +&nbsp;&nbsp; Curl_safefree(data-&gt;state.aptr.rtsp_transport);<br>
&gt; +diff --git a/lib/urldata.h b/lib/urldata.h<br>
&gt; +index 5ae148054b..d71337c8f6 100644<br>
&gt; +--- a/lib/urldata.h<br>
&gt; ++++ b/lib/urldata.h<br>
&gt; +@@ -1052,9 +1052,6 @@ struct UrlState {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *rangeline;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *ref;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *host;<br>
&gt; +-#ifndef CURL_DISABLE_COOKIES<br>
&gt; +-&nbsp;&nbsp;&nbsp; char *cookiehost;<br>
&gt; +-#endif<br>
&gt; + #ifndef CURL_DISABLE_RTSP<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *rtsp_transport;<br>
&gt; + #endif<br>
&gt; +diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am<br>
&gt; +index 53abf60901..da0f8f55d4 100644<br>
&gt; +--- a/tests/data/Makefile.am<br>
&gt; ++++ b/tests/data/Makefile.am<br>
&gt; +@@ -264,7 +264,7 @@ test2309 \<br>
&gt; + \<br>
&gt; + test2400 test2401 test2402 test2403 test2404 test2405 test2406 test2=
407 \<br>
&gt; + \<br>
&gt; +-test2500 test2501 test2502 test2503 \<br>
&gt; ++test2500 test2501 test2502 test2503 test2504 \<br>
&gt; + \<br>
&gt; + test2600 test2601 test2602 test2603 test2604 test2605 \<br>
&gt; + \<br>
&gt; +diff --git a/tests/data/test2504 b/tests/data/test2504<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000000..8cec1c8210<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/data/test2504<br>
&gt; +@@ -0,0 +1,52 @@<br>
&gt; ++&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;US-ASCII&quot;?&=
gt;<br>
&gt; ++&lt;testcase&gt;<br>
&gt; ++&lt;info&gt;<br>
&gt; ++&lt;keywords&gt;<br>
&gt; ++HTTP<br>
&gt; ++cookies<br>
&gt; ++&lt;/keywords&gt;<br>
&gt; ++&lt;/info&gt;<br>
&gt; ++<br>
&gt; ++# Server-side<br>
&gt; ++&lt;reply&gt;<br>
&gt; ++&lt;data crlf=3D&quot;headers&quot; nocheck=3D&quot;yes&quot;&gt;<br=
>
&gt; ++HTTP/1.1 200 OK<br>
&gt; ++Date: Tue, 09 Nov 2010 14:49:00 GMT<br>
&gt; ++Server: server.example.com<br>
&gt; ++Content-Length: 47<br>
&gt; ++Set-Cookie: sid=3DSECRET123; Path=3D/<br>
&gt; ++<br>
&gt; ++file contents should appear once for each file<br>
&gt; ++&lt;/data&gt;<br>
&gt; ++&lt;/reply&gt;<br>
&gt; ++<br>
&gt; ++# Client-side<br>
&gt; ++&lt;client&gt;<br>
&gt; ++&lt;server&gt;<br>
&gt; ++http<br>
&gt; ++&lt;/server&gt;<br>
&gt; ++&lt;tool&gt;<br>
&gt; ++lib%TESTNUMBER<br>
&gt; ++&lt;/tool&gt;<br>
&gt; ++&lt;name&gt;<br>
&gt; ++custom Host with cookie, handle reuse, no custom Host:<br>
&gt; ++&lt;/name&gt;<br>
&gt; ++&lt;command&gt;<br>
&gt; ++http://%HOSTIP:%HTTPPORT<br>
&gt; ++&lt;/command&gt;<br>
&gt; ++&lt;/client&gt;<br>
&gt; ++<br>
&gt; ++# Verify data after the test has been &quot;shot&quot;<br>
&gt; ++&lt;verify&gt;<br>
&gt; ++&lt;protocol crlf=3D&quot;headers&quot;&gt;<br>
&gt; ++GET / HTTP/1.1<br>
&gt; ++Host: victim.internal<br>
&gt; ++Accept: */*<br>
&gt; ++<br>
&gt; ++GET / HTTP/1.1<br>
&gt; ++Host: %HOSTIP:%HTTPPORT<br>
&gt; ++Accept: */*<br>
&gt; ++<br>
&gt; ++&lt;/protocol&gt;<br>
&gt; ++&lt;/verify&gt;<br>
&gt; ++&lt;/testcase&gt;<br>
&gt; +diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc<=
br>
&gt; +index e3202804a9..2319bafe72 100644<br>
&gt; +--- a/tests/libtest/Makefile.inc<br>
&gt; ++++ b/tests/libtest/Makefile.inc<br>
&gt; +@@ -113,7 +113,7 @@ TESTS_C =3D \<br>
&gt; +&nbsp;&nbsp; lib2023.c lib2032.c lib2082.c \<br>
&gt; +&nbsp;&nbsp; lib2301.c lib2302.c lib2304.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lib2306.c lib2308.c lib2309.c \<br>
&gt; +&nbsp;&nbsp; lib2402.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; lib2404.c lib2405.c \<br>
&gt; +-&nbsp; lib2502.c \<br>
&gt; ++&nbsp; lib2502.c lib2504.c \<br>
&gt; +&nbsp;&nbsp; lib2700.c \<br>
&gt; +&nbsp;&nbsp; lib3010.c lib3025.c lib3026.c lib3027.c lib3033.c lib303=
4.c \<br>
&gt; +&nbsp;&nbsp; lib3100.c lib3101.c lib3102.c lib3103.c lib3104.c lib310=
5.c \<br>
&gt; +diff --git a/tests/libtest/lib2504.c b/tests/libtest/lib2504.c<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000000..72b965d6e6<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/libtest/lib2504.c<br>
&gt; +@@ -0,0 +1,93 @@<br>
&gt; ++/*******************************************************************=
********<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _&nbsp;&nbsp; _ _=
___&nbsp; _<br>
&gt; ++ *&nbsp; Project&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ___| |=
 | |&nbsp; _ \| |<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; / __| | | | |_) | |<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | (__| |_| |&nbsp; _ &lt;| |___<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; \___|\___/|_| \_\_____|<br>
&gt; ++ *<br>
&gt; ++ * Copyright (C) Linus Nielsen Feltzing &lt;linus@haxx.se&gt;<br>
&gt; ++ *<br>
&gt; ++ * This software is licensed as described in the file COPYING, which=
<br>
&gt; ++ * you should have received as part of this distribution. The terms<=
br>
&gt; ++ * are also available at <a href=3D"https://curl.se/docs/copyright.h=
tml">https://curl.se/docs/copyright.html</a>.<br>
&gt; ++ *<br>
&gt; ++ * You may opt to use, copy, modify, merge, publish, distribute and/=
or sell<br>
&gt; ++ * copies of the Software, and permit persons to whom the Software i=
s<br>
&gt; ++ * furnished to do so, under the terms of the COPYING file.<br>
&gt; ++ *<br>
&gt; ++ * This software is distributed on an &quot;AS IS&quot; basis, WITHO=
UT WARRANTY OF ANY<br>
&gt; ++ * KIND, either express or implied.<br>
&gt; ++ *<br>
&gt; ++ * SPDX-License-Identifier: curl<br>
&gt; ++ *<br>
&gt; ++ *******************************************************************=
********/<br>
&gt; ++#include &quot;first.h&quot;<br>
&gt; ++<br>
&gt; ++#include &quot;testtrace.h&quot;<br>
&gt; ++<br>
&gt; ++static size_t sink2504(char *ptr, size_t size, size_t nmemb, void *u=
d)<br>
&gt; ++{<br>
&gt; ++&nbsp; (void)ptr;<br>
&gt; ++&nbsp; (void)ud;<br>
&gt; ++&nbsp; return size * nmemb;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void dump_cookies2504(CURL *h, const char *tag)<br>
&gt; ++{<br>
&gt; ++&nbsp; struct curl_slist *cookies =3D NULL;<br>
&gt; ++&nbsp; struct curl_slist *nc;<br>
&gt; ++&nbsp; CURLcode rc =3D curl_easy_getinfo(h, CURLINFO_COOKIELIST, &am=
p;cookies);<br>
&gt; ++<br>
&gt; ++&nbsp; curl_mprintf(&quot;=3D=3D %s =3D=3D\n&quot;, tag);<br>
&gt; ++&nbsp; if(rc) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; curl_mprintf(&quot;getinfo error: %d\n&quot;, (in=
t)rc);<br>
&gt; ++&nbsp;&nbsp;&nbsp; return;<br>
&gt; ++&nbsp; }<br>
&gt; ++&nbsp; for(nc =3D cookies; nc; nc =3D nc-&gt;next)<br>
&gt; ++&nbsp;&nbsp;&nbsp; puts(nc-&gt;data);<br>
&gt; ++&nbsp; curl_slist_free_all(cookies);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static CURLcode test_lib2504(const char *URL)<br>
&gt; ++{<br>
&gt; ++&nbsp; CURL *curl;<br>
&gt; ++&nbsp; CURLcode result =3D CURLE_OUT_OF_MEMORY;<br>
&gt; ++&nbsp; struct curl_slist *hdrs =3D NULL;<br>
&gt; ++<br>
&gt; ++&nbsp; if(curl_global_init(CURL_GLOBAL_ALL) !=3D CURLE_OK) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; curl_mfprintf(stderr, &quot;curl_global_init() fa=
iled\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp; return TEST_ERR_MAJOR_BAD;<br>
&gt; ++&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp; curl =3D curl_easy_init();<br>
&gt; ++&nbsp; if(!curl) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; curl_mfprintf(stderr, &quot;curl_easy_init() fail=
ed\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp; curl_global_cleanup();<br>
&gt; ++&nbsp;&nbsp;&nbsp; return TEST_ERR_MAJOR_BAD;<br>
&gt; ++&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp; hdrs =3D curl_slist_append(hdrs, &quot;Host: victim.internal&=
quot;);<br>
&gt; ++&nbsp; if(hdrs) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; test_setopt(curl, CURLOPT_WRITEFUNCTION, sink2504=
);<br>
&gt; ++&nbsp;&nbsp;&nbsp; test_setopt(curl, CURLOPT_COOKIEFILE, &quot;&quot=
;);<br>
&gt; ++&nbsp;&nbsp;&nbsp; test_setopt(curl, CURLOPT_HTTPHEADER, hdrs);<br>
&gt; ++&nbsp;&nbsp;&nbsp; test_setopt(curl, CURLOPT_URL, URL);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; result =3D curl_easy_perform(curl);<br>
&gt; ++&nbsp;&nbsp;&nbsp; curl_mprintf(&quot;req1=3D%d\n&quot;, (int)result=
);<br>
&gt; ++&nbsp;&nbsp;&nbsp; dump_cookies2504(curl, &quot;after request 1&quot=
;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; test_setopt(curl, CURLOPT_HTTPHEADER, NULL);<br>
&gt; ++&nbsp;&nbsp;&nbsp; test_setopt(curl, CURLOPT_URL, URL);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; result =3D curl_easy_perform(curl);<br>
&gt; ++&nbsp;&nbsp;&nbsp; curl_mprintf(&quot;req2=3D%d\n&quot;, (int)result=
);<br>
&gt; ++&nbsp;&nbsp;&nbsp; dump_cookies2504(curl, &quot;after request 2&quot=
;);<br>
&gt; ++&nbsp; }<br>
&gt; ++test_cleanup:<br>
&gt; ++&nbsp; curl_slist_free_all(hdrs);<br>
&gt; ++&nbsp; curl_easy_cleanup(curl);<br>
&gt; ++&nbsp; curl_global_cleanup();<br>
&gt; ++<br>
&gt; ++&nbsp; return result;<br>
&gt; ++}<br>
&gt; diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-s=
upport/curl/curl_8.19.0.bb<br>
&gt; index b9251336b8..9bbbb5e36f 100644<br>
&gt; --- a/meta/recipes-support/curl/curl_8.19.0.bb<br>
&gt; +++ b/meta/recipes-support/curl/curl_8.19.0.bb<br>
&gt; @@ -161,6 +161,7 @@ RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perl-module-memoize \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perl-module-storable \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perl-module-time-hires \<br>
&gt; +&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2026-6276.patch">file://CVE-=
2026-6276.patch</a> \<br>
<br>
This should be in SRC_URI, not in RDEPENDS. Did you try to build this<br>
patch?<br>
<br>
Regards,<br>
<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; PACKAGES =3D+ &quot;lib${BPN}&quot;<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8P189MB1672EC9FC9325DEC07F97A1CB31D2AS8P189MB1672EURP_--

