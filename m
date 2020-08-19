Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.54])
 by mx.groups.io with SMTP id smtpd.web11.82481.1597809847336458957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 21:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mG2F8xjs;
 spf=pass (domain: windriver.com, ip: 40.107.220.54, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/lG/RSE/Z7fw3nRSTLbnpb+ilERgD1Zdl5NIqIpyfUaHfBMPJPm+mpkBzp4FFQiRVbZK1DjOsOitdnBC9zqJV8cf1cvCN81iCzqfX4Rk4ibCdQbs+6wcVzvbt6SabiEBZCaGLXexLXqvbYXxLrMs/hSsimWssPmknt9mQy8V3Z2HRZJs6EyqeV6USNkJ6aT5sQAVFWziZUSf1Own2pva4JbdY4HLsn6Q4U2NNYplX8kK7m6IejIWSe4tLPCSXs3hY+uNSXEd1rJQE4qole2SP2I4bD9LrchwrFs8f/ygv5a4esNydENAWbMRngrOy/urtAkDk2seN0yHl+mI0l5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFMGCpmetHNaNOwEguREFh8y1jkCQ5RipytiqXmdNJo=;
 b=T9USXC1affZkQS2AvI/RPJtd6ulhfkx1B5QFt1PjcZlVthawmExRYK+GNsKLa7oej7y/FhiFtc9CkQbL8raYaKPlsQIw3ji+ksPqqFuHaK5g4bK88GWdqHkdJIzC5VO7h/gIjeZnujIHjN97ILkat3EM4uOb27H8ueHXLsrfLwsbkoO3cT+XoBd9G25Vn6wS9F3fQ+JhUV+ET0nL4kUZ0iYEbeJh3qyeznRPwX1WU8wKvDG2xFR7sdyxoMVPiW912WTzkcU0ypA/Ux+vWcQ3Y11moisPNPuaws0hXzTZbuDrj+wWeIOocK2vnnwYYb6OpW3depJ9vsccbu6ejKi/5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFMGCpmetHNaNOwEguREFh8y1jkCQ5RipytiqXmdNJo=;
 b=mG2F8xjsRS37yZ9YU4hd5yUps+igpcpPiqnyk3uvzR5nzgmTFrRggiGgjuMK2s1j1B3UVlwYN9yyjKKcd840mwuZmNOOv+bsyHFhULi3//D3KK0QKExLqGuKfnN8xROi+YcUNPd4k2Thkngof03NYAeaVevifSRkzCeXB27GlZ8=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2815.namprd11.prod.outlook.com (2603:10b6:805:62::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 04:04:04 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2d48:250:daff:8270]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2d48:250:daff:8270%5]) with mapi id 15.20.3283.027; Wed, 19 Aug 2020
 04:04:04 +0000
Subject: Re: [OE-core] [PATCH V6] gpgme: fix multilib header conflict
To: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20200818095902.1768116-1-changqing.li@windriver.com>
 <162C54B24C526659.7353@lists.openembedded.org>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <dd00727b-5666-7df1-8ff4-ff28eb7e1ca5@windriver.com>
Date: Wed, 19 Aug 2020 12:03:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <162C54B24C526659.7353@lists.openembedded.org>
X-ClientProxiedBy: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 04:04:03 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa7e35cb-5986-4255-d759-08d843f4e9b6
X-MS-TrafficTypeDiagnostic: SN6PR11MB2815:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB28157155A8073080B73AC975825D0@SN6PR11MB2815.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RwPcglcaTDLPFRxdLqapZzN4KWOqhR8gDQ4IfarOBgGWB79pUdQuN+kvhtuGGFBZy+bbm5QbhEMYbrN3Otl4kg4bktQw6+bsUPfE6nlwK+7drljTfxEy6DTEBJzVYWKC5QtPscpLt9V822V/EfPohaTt4cXBC/lgy9Sh7AlQ1o+iHH/h5gmvEhnRHMknjr1/gO7kYNEVk/XHTx+zkW7GQGIRM/ue1k8CWwCLnKySZhd6gJp8CyyiUstrRV0AnLr6QbJSodd7dyDOJSCCPKVzO9FaKEcy1Kld1fA5nKojLILvYC0n0XUKc/4Tk/G/N3owx9nlomkfEXjXNDqt+NzByYFAQmWOa1fqYXJXXBhflVyJkwZm81rqJSbv+S2lNyce13BZ+8bhT9YV6g5lwddKHgMR52wxqOzF5FWdEme5r7lw17swO3Cr4V575q/S2h7u361NIJ7RX6GVJDNbwBRNB0k0db99tSX96/TxTGnr9d4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39840400004)(366004)(376002)(346002)(136003)(44832011)(478600001)(33964004)(6666004)(31696002)(53546011)(52116002)(316002)(6916009)(8936002)(2906002)(6706004)(8676002)(16576012)(36756003)(26005)(86362001)(956004)(6486002)(966005)(2616005)(16526019)(186003)(31686004)(166002)(83380400001)(5660300002)(66946007)(66476007)(66556008)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	m9/CeLDQs4Jh11wRe4wd+ZLO8etJOU/VunpFPMciFKw6Gi/DlLJkpCnYtkd1fZO2DTRvYH/SVNVqX5JFbvk0WWwOsokObW6MHYPgxJPHBnBMDvjvys3DPTl1/uAqKwDwC4InRSj/fDvCYIr0fr6HWWDqgs5S6u0FjQ7CZTReCyBqEdzhoYYnrtYUgpJcsPHDeusghlCSc/VkGJwhtuds/chbmpFn7JLh16JNy8JdFJYNdW+SWuLPJJPz4tbcoTIQ7iXFA9jlmaMfR3GSe1ZFI13+9WIvtET/5AcoF2CXai5KYQHRWXGO2OHVDvyDugRqRx6buVfvpj3uC49kMSIw0sFZmfwFTVR/p+lgjHLRGKQlMyP9usB2AjlexGm5+j0smAGeBVHtNWc83HFWaYYRZlhirB682Qtd1ngpinF9OSGcGhQ/yaYm2zF3/lZ0hxFbSXEOL0fOkDJ6ar8+ZyOeLwJSvUU8ByQ9pYS5frzjkf5hR7lfuk0nQmoluG8qJ00HGMbgR6OZxWV548WJ+y3hWnT2mwwyq1efie5woHnb8Lj2gcuEh7B1URMjywa4/0wkjz8cGhbnYp3hnkWH77/WozFO7cVSqgL/HPZNH/VVbgfg0lAEsZiYuQgQl/JlRg+rgsLsDx3WtMn3YC4tk+QSNQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7e35cb-5986-4255-d759-08d843f4e9b6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 04:04:04.6829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5AzgJqHmcr8J5MUuGdIkzea0JZUmWzqRauH9xxUCkhu5xyaQ2V+WJamoTSFKrLIwSgdb4+JwYVIW00mfiZYB0892K1j1L+U6y69hD7xRMyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2815
Content-Type: multipart/alternative;
 boundary="------------494D7FCF877CCACAF846DA60"
Content-Language: en-US

--------------494D7FCF877CCACAF846DA60
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Richard

Maybe I didn't make things clear,   gpgme is build with LFS enabled by 
default for both lib32-gpgme and gpgme.

for 64bit,  _FILE_OFFSET_BITS  is set to 0, and for 32bit, 
_FILE_OFFSET_BITS is set to 64. And this is same as the diff part said.


And here is part of section "Largefile support (LFS)" in the GPGME manual:

On POSIX platforms GPGME is compiled using largefile support by default. 
This means that your application must do the same, at least as far as it 
is relevant for using the gpgme.h header file. All types in this header 
files refer to their largefile counterparts, if they are different from 
any default types on the system.

On POSIX platforms you can enable largefile support, if it is different 
from the default on the system the application is compiled on, by using 
the Autoconf macro AC_SYS_LARGEFILE. If you do this, then you don’t need 
to worry about anything else: It will just work. In this case you might 
also want to use AC_FUNC_FSEEKO to take advantage of some new 
interfaces, and AC_TYPE_OFF_T (just in case).

If you do not use Autoconf, you can define the preprocessor symbol 
_FILE_OFFSET_BITS to 64 before including any header files, for example 
by specifying the option -D_FILE_OFFSET_BITS=64 on the compiler command 
line. You will also want to define the preprocessor symbol 
LARGEFILE_SOURCE to 1 in this case, to take advantage of some new 
interfaces.


And this header gpgme.h can used to check if application using gpgme 
have same configuration (like _FILE_OFFSET_BITS) as gpgme. so I think 
this patch is also needed.

//Changqing

On 8/18/20 5:59 PM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> fix error:
> file /usr/include/gpgme.h conflicts between attempted installs of gpgme-dev-1.13.1-r0.core2_64 and lib32-gpgme-dev-1.13.1-r0.core2_32
>
> part of diff:
> -#if 64
> +#if 0
>   #ifndef _FILE_OFFSET_BITS
> -#error GPGME was compiled with _FILE_OFFSET_BITS = 64, please see the section "Largefile support (LFS)" in the GPGME manual.
> +#error GPGME was compiled with _FILE_OFFSET_BITS = 0, please see the section "Largefile support (LFS)" in the GPGME manual.
>   #else
> -#if (_FILE_OFFSET_BITS) != (64)
> -#error GPGME was compiled with a different value for _FILE_OFFSET_BITS, namely 64, please see the section "Largefile support (LFS)" in the GPGME manual.
> +#if (_FILE_OFFSET_BITS) != (0)
> +#error GPGME was compiled with a different value for _FILE_OFFSET_BITS, namely 0, please see the section "Largefile support (LFS)" in the GPGME manual.
>   #endif
>   #endif
>   #endif
>
> LFS support is enabled by default, and this header is generated during
> build according to current configure
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-support/gpgme/gpgme_1.13.1.bb | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/gpgme/gpgme_1.13.1.bb b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
> index 9fc1ae24a4..b51534351d 100644
> --- a/meta/recipes-support/gpgme/gpgme_1.13.1.bb
> +++ b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
> @@ -59,7 +59,7 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
>                    --disable-lang-python-test \
>   '
>   
> -inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT}
> +inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT} multilib_header
>   
>   export PKG_CONFIG='pkg-config'
>   
> @@ -83,3 +83,7 @@ do_configure_prepend () {
>   	rm -f ${S}/m4/libassuan.m4
>   	rm -f ${S}/m4/python.m4
>   }
> +
> +do_install_append() {
> +       oe_multilib_header gpgme.h
> +}
>
> 

--------------494D7FCF877CCACAF846DA60
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi, Richard<br>
    <br>
    Maybe I didn't make things clear,&nbsp;&nbsp; gpgme is build with LFS enabled
    by default for both lib32-gpgme and gpgme.<br>
    <br>
    for 64bit,&nbsp; _FILE_OFFSET_BITS&nbsp; is set to 0, and for 32bit,&nbsp;
    _FILE_OFFSET_BITS is set to 64. And this is same as the diff part
    said.<br>
    <br>
    <br>
    And here is part of section &quot;Largefile support (LFS)&quot; in the GPGME
    manual:<br>
    <br>
    <font face="Times New Roman, Times, serif">On POSIX platforms GPGME
      is compiled using largefile support by default. This means that
      your application must do the same, at least as far as it is
      relevant for using the gpgme.h header file. All types in this
      header files refer to their largefile counterparts, if they are
      different from any default types on the system.<br>
      <br>
      On POSIX platforms you can enable largefile support, if it is
      different from the default on the system the application is
      compiled on, by using the Autoconf macro AC_SYS_LARGEFILE. If you
      do this, then you don’t need to worry about anything else: It will
      just work. In this case you might also want to use AC_FUNC_FSEEKO
      to take advantage of some new interfaces, and AC_TYPE_OFF_T (just
      in case).<br>
      <br>
      If you do not use Autoconf, you can define the preprocessor symbol
      _FILE_OFFSET_BITS to 64 before including any header files, for
      example by specifying the option -D_FILE_OFFSET_BITS=64 on the
      compiler command line. You will also want to define the
      preprocessor symbol LARGEFILE_SOURCE to 1 in this case, to take
      advantage of some new interfaces.</font><br>
    <br>
    <br>
    <p>And this header gpgme.h can used to check if application using
      gpgme have same configuration (like _FILE_OFFSET_BITS) as gpgme.&nbsp;
      so I think this patch is also needed.</p>
    <p><font face="Times New Roman, Times, serif">//Changqing</font><br>
    </p>
    <div class="moz-cite-prefix">On 8/18/20 5:59 PM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:162C54B24C526659.7353@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

fix error:
file /usr/include/gpgme.h conflicts between attempted installs of gpgme-dev-1.13.1-r0.core2_64 and lib32-gpgme-dev-1.13.1-r0.core2_32

part of diff:
-#if 64
+#if 0
 #ifndef _FILE_OFFSET_BITS
-#error GPGME was compiled with _FILE_OFFSET_BITS = 64, please see the section &quot;Largefile support (LFS)&quot; in the GPGME manual.
+#error GPGME was compiled with _FILE_OFFSET_BITS = 0, please see the section &quot;Largefile support (LFS)&quot; in the GPGME manual.
 #else
-#if (_FILE_OFFSET_BITS) != (64)
-#error GPGME was compiled with a different value for _FILE_OFFSET_BITS, namely 64, please see the section &quot;Largefile support (LFS)&quot; in the GPGME manual.
+#if (_FILE_OFFSET_BITS) != (0)
+#error GPGME was compiled with a different value for _FILE_OFFSET_BITS, namely 0, please see the section &quot;Largefile support (LFS)&quot; in the GPGME manual.
 #endif
 #endif
 #endif

LFS support is enabled by default, and this header is generated during
build according to current configure

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-support/gpgme/gpgme_1.13.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.13.1.bb b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
index 9fc1ae24a4..b51534351d 100644
--- a/meta/recipes-support/gpgme/gpgme_1.13.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
@@ -59,7 +59,7 @@ EXTRA_OECONF += '--enable-languages=&quot;${LANGUAGES}&quot; \
                  --disable-lang-python-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT}
+inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT} multilib_header
 
 export PKG_CONFIG='pkg-config'
 
@@ -83,3 +83,7 @@ do_configure_prepend () {
 	rm -f ${S}/m4/libassuan.m4
 	rm -f ${S}/m4/python.m4
 }
+
+do_install_append() {
+       oe_multilib_header gpgme.h
+}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------494D7FCF877CCACAF846DA60--
