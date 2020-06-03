Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.73])
 by mx.groups.io with SMTP id smtpd.web10.9293.1591172159599489056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 01:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=I0F1jot2;
 spf=pass (domain: windriver.com, ip: 40.107.93.73, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tcxj34J40dM/7FjXmhHqEJ5VyIvY/4PSF2Wv/AJjAtP/GEBVte3zuzNsmMr1VvV5s+KCCPUuvAe/aRYY4c8fmpC/CuKUJxanpwMSMxkXt1RJ85/rC1I9q4ann6vBsPcjSTtJ0ot7cBUQHhKppdkdD0s3zm8Zbo3EXUSkK4qZwdtqA8ykG6o6Yfbht1gK6lK58r0Cc43nPEdDYp6Z6/f0Orpaay2u42UkoUt0cA8S1WC4sv4lV1EB/NKkbyzfGQpqQjYQEo7a3tR+ttD7kEyWL96NqGuRE1OMoAW5XW0d6KZ1CJXytWfR+6z7e4t8NMd84SlvXfMluZgA4hNufePIlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcsjYIwsLuseuaN5MgC2X0UYPzOOhkp2WTibaQM/RyM=;
 b=mzJY90BcQ9vuyeDQcheOUMrJTUf0gSPkKhXR3ypmbTA88X4Mej5g9KQ6CLePfxiUWlq2dFr6XgQ5tU30aWTaHRwGTDSmQZIHn4bertDzaPYq+kd/g6JzJb0cfY+/SVb0YEtr58XBkdbDy9Uqx3iYOiih8/O64oaugv8cf7gL4Qkog5/tdjdyKNSDm1tTBmxg8iwPMZc4oEfA3IHFE2/tlgA09rcc55k+RH9xnVWq9tMVIVaVO1dM1vfP9cNKLA9f3AbDR6b1WJ4z3nIkKf1YCsN/AuOOYFcrx3egrUbCFKezw7CzSa3fuzYr6HYuigpAlJ5j2bh5lSFgox4ajUGP8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcsjYIwsLuseuaN5MgC2X0UYPzOOhkp2WTibaQM/RyM=;
 b=I0F1jot2Cvvk7PfHuHVyhsoNsqP9IJzZdtYZfN2znMHQqAkUaTbvWQXxHfzbVZxTI7v/QsSykCEDeOlOLhoiS3nNTkHpOjN1Pzs2uGJkFpfh6CTq4/ZbvA08PdUVvBBMiX3EgtNJMRhRYwa2cJfUmzmPdTaFO/gkmVG7PiA+k9Q=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM6PR11MB3226.namprd11.prod.outlook.com (2603:10b6:5:59::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Wed, 3 Jun
 2020 08:15:58 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a402:5c0a:9c87:dd5d]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a402:5c0a:9c87:dd5d%6]) with mapi id 15.20.3045.024; Wed, 3 Jun 2020
 08:15:58 +0000
Subject: Re: [OE-core] [PATCH] rpm: fix rpm -Kv xxx.rpm failed if signature header is larger than 64KB
From: "hongxu" <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org
References: <1614F64351C2C406.25117@lists.openembedded.org>
Message-ID: <f3e0e10d-74f0-7ecc-4cd4-701450a86bfa@windriver.com>
Date: Wed, 3 Jun 2020 16:15:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <1614F64351C2C406.25117@lists.openembedded.org>
X-ClientProxiedBy: HK0PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:203:b0::27) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.148] (60.247.85.82) by HK0PR03CA0111.apcprd03.prod.outlook.com (2603:1096:203:b0::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 08:15:57 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74976b3e-d743-4229-d5fe-08d807965853
X-MS-TrafficTypeDiagnostic: DM6PR11MB3226:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB32262017419C3FB0E84A088A94880@DM6PR11MB3226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NrJw855W9kOr2KIo+CMPSHF8UoLI/Ei7LEhT7vurvVFqViSGQuUv7LxKyDXsLCoZx8AGfBPAXtzLy6YmYe/9C5k0+5+JMnSYCYMZ8X9l1Nyp6/ja1GFIvTRekoe55jjTjvo8AY4FMItnqveIsjM2OOA9wkcZYj9JGZOpHSQn6bSyguaix94J7cS+YFgxfOA52MU6MnYs2I1Ywdb0e2Ts5SvMiOvr1XAgHd8nQ7PnO4/bLIWWdvIIaCdyueIYIk/9tlPv7n+863mHpupnqMDgKmeqCISYeKX4a018y8KgP88JGBLoW2tevgp2KHv+ljnyB7kCUCx6sptIZNDJpDz+EA++oFQw0AQGk4fBdqQRK9jc3WbnXXUsOvkodh6Bi/FMVDk2UJJMaka5Ymifod3wK2IBo5DTXt5abhvIHpknBzub7knLoHxkrRj8ddtU/BXxf+28+74zBVTKslTDDkuSX7ZHpgkkxgD+xdtMywy7SkgpTk48P37HPE6Tsw3jupUdRkPbaRlEOThjEZ2476P+oQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39850400004)(346002)(376002)(136003)(53546011)(6706004)(66946007)(966005)(5660300002)(33964004)(66556008)(478600001)(2906002)(16576012)(30864003)(66476007)(316002)(6486002)(2616005)(44832011)(83380400001)(52116002)(166002)(956004)(26005)(31686004)(36756003)(86362001)(31696002)(8936002)(6666004)(16526019)(8676002)(186003)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rEcDR8IxhHyEzrllZ+xU6Q9PgUEmr42J7M4H/JXhPICrKlCUwKeh+0VokcP0daymo5SkptEN5v51OM7+snTDYfiUtWEZEbnBxC3ol2W9dpZzv9oWmc45m0KdoXZInijqPoOc+lHpxpjMTQI9afx501p8pZ2gpUypMvrw589OasDMgCNPTmKJ6U9KNRHJ9x4oEYm7rS6gw463zRZBHsNi/AstcaAO33RVoCCu91g+rkIMU4tSts4Lv1Z/D59ED/DsW+U94SkdTMNkomsddY0e32HtKopMpULAFKNRmF8ieyRDMqBnLyZBmU6fyfuuNi8do6G/q4wt61XNfBFYZMsoYYbAz47bBqb0Z/gpVT7UOyEOnsy3IGkzFS08w2BOzOC/uxCtNSbK+I/Dt5pTnGmJS6a14iD7Quc5Vm/huij5ppWaQsmC9U3xZDbN43XXdBwiZaWeDtx4AiagSrQHlRTv924do6U575Yj+WBj3N5RSiQ=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74976b3e-d743-4229-d5fe-08d807965853
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 08:15:58.3282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBOzpq5/j7bnRGs3Oa/FqdzOIxYIf4NumeDchrb3RYRGZv8WEUJkVL0S+SAYUC7b++n6f2T0joqfcc0rMUC8HO+2K9FGTbpq9pX9XtkTr4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3226
Content-Type: multipart/alternative;
 boundary="------------04DAA264B7D08CC4479B39A1"
Content-Language: en-US

--------------04DAA264B7D08CC4479B39A1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Update status, upstream has merged the fix

https://github.com/rpm-software-management/rpm/commit/486579912381ede82172dc6d0ff3941a6d0536b5

//Hongxu


On 6/3/20 2:55 PM, hongxu wrote:
> Since commits [Place file signatures into the signature header where they
> belong][1] applied, run `rpm -Kv **.rpm' failed if signature header
> is larger than 64KB. Here are steps:
>
> 1) A unsigned rpm package, the size is 227560 bytes
> $ ls -al xz-src-5.2.5-r0.corei7_64.rpm
> -rw-------. 1 mockbuild 1000 227560 Jun  3 09:59
>
> 2) Sign the rpm package
> $ rpmsign --addsign ... xz-src-5.2.5-r0.corei7_64.rpm
>
> 3) The size of signed rpm is 312208 bytes
> $ ls -al xz-src-5.2.5-r0.corei7_64.rpm
> -rw-------. 1 mockbuild 1000 312208 Jun  3 09:48
>
> 4) Run `rpm -Kv' failed with signature hdr data out of range
> $ rpm -Kv xz-src-5.2.5-r0.corei7_64.rpm
> xz-src-5.2.5-r0.corei7_64.rpm:
> error: xz-src-5.2.5-r0.corei7_64.rpm: signature hdr data: BAD, no. of
> bytes(88864) out of range
>
>  From 1) and 3), the size of signed rpm package increased
> 312208 - 227560 = 84648, so the check of dl_max (64KB,65536)
> is not enough.
>
> As [1] said:
>
>      This also means the signature header can be MUCH bigger than ever
>      before,so bump up the limit (to 64MB, arbitrary something for now)
>
> So [1] missed to multiply by 1024.
>
> [1] https://github.com/rpm-software-management/rpm/commit/f558e886050c4e98f6cdde391df679a411b3f62c
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   ...he-limit-of-signature-header-to-64MB.patch | 62 +++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_4.15.1.bb       |  1 +
>   2 files changed, 63 insertions(+)
>   create mode 100644 meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch b/meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch
> new file mode 100644
> index 0000000000..88a7bc7c41
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch
> @@ -0,0 +1,62 @@
> +From e8bf0eba7143abb6e69db82ee747a0c6790dd00a Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 3 Jun 2020 10:25:24 +0800
> +Subject: [PATCH] Bump up the limit of signature header to 64MB
> +
> +Since commits [Place file signatures into the signature header where they
> +belong][1] applied, run `rpm -Kv **.rpm' failed if signature header
> +is larger than 64KB. Here are steps:
> +
> +1) A unsigned rpm package, the size is 227560 bytes
> +$ ls -al xz-src-5.2.5-r0.corei7_64.rpm
> +-rw-------. 1 mockbuild 1000 227560 Jun  3 09:59
> +
> +2) Sign the rpm package
> +$ rpmsign --addsign ... xz-src-5.2.5-r0.corei7_64.rpm
> +
> +3) The size of signed rpm is 312208 bytes
> +$ ls -al xz-src-5.2.5-r0.corei7_64.rpm
> +-rw-------. 1 mockbuild 1000 312208 Jun  3 09:48
> +
> +4) Run `rpm -Kv' failed with signature hdr data out of range
> +$ rpm -Kv xz-src-5.2.5-r0.corei7_64.rpm
> +xz-src-5.2.5-r0.corei7_64.rpm:
> +error: xz-src-5.2.5-r0.corei7_64.rpm: signature hdr data: BAD, no. of
> +bytes(88864) out of range
> +
> +From 1) and 3), the size of signed rpm package increased
> +312208 - 227560 = 84648, so the check of dl_max (64KB,65536)
> +is not enough.
> +
> +As [1] said:
> +
> +    This also means the signature header can be MUCH bigger than ever
> +    before,so bump up the limit (to 64MB, arbitrary something for now)
> +
> +So [1] missed to multiply by 1024.
> +
> +[1] https://github.com/rpm-software-management/rpm/commit/f558e886050c4e98f6cdde391df679a411b3f62c
> +
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/1252]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + lib/header.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/header.c b/lib/header.c
> +index 9ec7ed0..cbf6890 100644
> +--- a/lib/header.c
> ++++ b/lib/header.c
> +@@ -1906,7 +1906,7 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_size, rpmTagVal regionTag, hdrbl
> +
> +     if (regionTag == RPMTAG_HEADERSIGNATURES) {
> + 	il_max = 32;
> +-	dl_max = 64 * 1024;
> ++	dl_max = 64 * 1024 * 1024;
> +     }
> +
> +     memset(block, 0, sizeof(block));
> +--
> +2.25.4
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
> index 8add142461..cbe1acffe2 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
> @@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
>              file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
>              file://0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch \
>              file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
> +           file://0001-Bump-up-the-limit-of-signature-header-to-64MB.patch \
>              "
>   
>   PE = "1"
>
> 



--------------04DAA264B7D08CC4479B39A1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <p>Update status, upstream has merged the fix</p>
      <p><a class="moz-txt-link-freetext" href="https://github.com/rpm-software-management/rpm/commit/486579912381ede82172dc6d0ff3941a6d0536b5">https://github.com/rpm-software-management/rpm/commit/486579912381ede82172dc6d0ff3941a6d0536b5</a></p>
      <p>//Hongxu</p>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 6/3/20 2:55 PM, hongxu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1614F64351C2C406.25117@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Since commits [Place file signatures into the signature header where they
belong][1] applied, run `rpm -Kv **.rpm' failed if signature header
is larger than 64KB. Here are steps:

1) A unsigned rpm package, the size is 227560 bytes
$ ls -al xz-src-5.2.5-r0.corei7_64.rpm
-rw-------. 1 mockbuild 1000 227560 Jun  3 09:59

2) Sign the rpm package
$ rpmsign --addsign ... xz-src-5.2.5-r0.corei7_64.rpm

3) The size of signed rpm is 312208 bytes
$ ls -al xz-src-5.2.5-r0.corei7_64.rpm
-rw-------. 1 mockbuild 1000 312208 Jun  3 09:48

4) Run `rpm -Kv' failed with signature hdr data out of range
$ rpm -Kv xz-src-5.2.5-r0.corei7_64.rpm
xz-src-5.2.5-r0.corei7_64.rpm:
error: xz-src-5.2.5-r0.corei7_64.rpm: signature hdr data: BAD, no. of
bytes(88864) out of range

From 1) and 3), the size of signed rpm package increased
312208 - 227560 = 84648, so the check of dl_max (64KB,65536)
is not enough.

As [1] said:

    This also means the signature header can be MUCH bigger than ever
    before,so bump up the limit (to 64MB, arbitrary something for now)

So [1] missed to multiply by 1024.

[1] <a class="moz-txt-link-freetext" href="https://github.com/rpm-software-management/rpm/commit/f558e886050c4e98f6cdde391df679a411b3f62c">https://github.com/rpm-software-management/rpm/commit/f558e886050c4e98f6cdde391df679a411b3f62c</a>

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 ...he-limit-of-signature-header-to-64MB.patch | 62 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 meta/recipes-devtools/rpm/rpm_4.15.1.bb       |  1 &#43;
 2 files changed, 63 insertions(&#43;)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch b/meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch
new file mode 100644
index 0000000000..88a7bc7c41
--- /dev/null
&#43;&#43;&#43; b/meta/recipes-devtools/rpm/files/0001-Bump-up-the-limit-of-signature-header-to-64MB.patch
@@ -0,0 &#43;1,62 @@
&#43;From e8bf0eba7143abb6e69db82ee747a0c6790dd00a Mon Sep 17 00:00:00 2001
&#43;From: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
&#43;Date: Wed, 3 Jun 2020 10:25:24 &#43;0800
&#43;Subject: [PATCH] Bump up the limit of signature header to 64MB
&#43;
&#43;Since commits [Place file signatures into the signature header where they
&#43;belong][1] applied, run `rpm -Kv **.rpm' failed if signature header
&#43;is larger than 64KB. Here are steps:
&#43;
&#43;1) A unsigned rpm package, the size is 227560 bytes
&#43;$ ls -al xz-src-5.2.5-r0.corei7_64.rpm
&#43;-rw-------. 1 mockbuild 1000 227560 Jun  3 09:59
&#43;
&#43;2) Sign the rpm package
&#43;$ rpmsign --addsign ... xz-src-5.2.5-r0.corei7_64.rpm
&#43;
&#43;3) The size of signed rpm is 312208 bytes
&#43;$ ls -al xz-src-5.2.5-r0.corei7_64.rpm
&#43;-rw-------. 1 mockbuild 1000 312208 Jun  3 09:48
&#43;
&#43;4) Run `rpm -Kv' failed with signature hdr data out of range
&#43;$ rpm -Kv xz-src-5.2.5-r0.corei7_64.rpm
&#43;xz-src-5.2.5-r0.corei7_64.rpm:
&#43;error: xz-src-5.2.5-r0.corei7_64.rpm: signature hdr data: BAD, no. of
&#43;bytes(88864) out of range
&#43;
&#43;From 1) and 3), the size of signed rpm package increased
&#43;312208 - 227560 = 84648, so the check of dl_max (64KB,65536)
&#43;is not enough.
&#43;
&#43;As [1] said:
&#43;
&#43;    This also means the signature header can be MUCH bigger than ever
&#43;    before,so bump up the limit (to 64MB, arbitrary something for now)
&#43;
&#43;So [1] missed to multiply by 1024.
&#43;
&#43;[1] <a class="moz-txt-link-freetext" href="https://github.com/rpm-software-management/rpm/commit/f558e886050c4e98f6cdde391df679a411b3f62c">https://github.com/rpm-software-management/rpm/commit/f558e886050c4e98f6cdde391df679a411b3f62c</a>
&#43;
&#43;Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/rpm-software-management/rpm/pull/1252">https://github.com/rpm-software-management/rpm/pull/1252</a>]
&#43;
&#43;Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
&#43;---
&#43; lib/header.c | 2 &#43;-
&#43; 1 file changed, 1 insertion(&#43;), 1 deletion(-)
&#43;
&#43;diff --git a/lib/header.c b/lib/header.c
&#43;index 9ec7ed0..cbf6890 100644
&#43;--- a/lib/header.c
&#43;&#43;&#43;&#43; b/lib/header.c
&#43;@@ -1906,7 &#43;1906,7 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_size, rpmTagVal regionTag, hdrbl
&#43; 
&#43;     if (regionTag == RPMTAG_HEADERSIGNATURES) {
&#43; 	il_max = 32;
&#43;-	dl_max = 64 * 1024;
&#43;&#43;	dl_max = 64 * 1024 * 1024;
&#43;     }
&#43; 
&#43;     memset(block, 0, sizeof(block));
&#43;-- 
&#43;2.25.4
&#43;
diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
index 8add142461..cbe1acffe2 100644
--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
&#43;&#43;&#43; b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -40,6 &#43;40,7 @@ SRC_URI = &quot;git://github.com/rpm-software-management/rpm;branch=rpm-4.15.x \
            <a class="moz-txt-link-freetext" href="file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch">file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch">file://0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch">file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch</a> \
&#43;           <a class="moz-txt-link-freetext" href="file://0001-Bump-up-the-limit-of-signature-header-to-64MB.patch">file://0001-Bump-up-the-limit-of-signature-header-to-64MB.patch</a> \
            &quot;
 
 PE = &quot;1&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------04DAA264B7D08CC4479B39A1--
