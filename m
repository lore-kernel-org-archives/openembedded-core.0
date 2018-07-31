Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D013D78AF9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 02:23:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6V2N290005168
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Jul 2018 19:23:02 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 30 Jul 2018 19:23:02 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1532917949-207205-1-git-send-email-changqing.li@windriver.com>
	<8caafb085ff549a7979806bd748f51d290546a49.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <5c05f226-5eb4-27f7-f3ca-6b6d3f8372e3@windriver.com>
Date: Tue, 31 Jul 2018 10:22:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <8caafb085ff549a7979806bd748f51d290546a49.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH V2] curl: support multilib installation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2018 02:23:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/31/2018 06:29 AM, Richard Purdie wrote:
> On Mon, 2018-07-30 at 10:32 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> curl-config is generated to displays information about
>> the curl and libcurl installation. So the content is different
>> for 32bit and 64bit package. eg: maybe for 32bit, use
>> i686-linux-gnu-gcc, and for 64bit, use x86-64-linux-gnu-gcc.
>>
>> Use update-alternatives to add base_libdir as suffix to create
>> seperate curl-config, so user can check both info of 32/64 bit
>> curl.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-support/curl/curl_7.61.0.bb | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
>> index cc983fd..1841c50 100644
>> --- a/meta/recipes-support/curl/curl_7.61.0.bb
>> +++ b/meta/recipes-support/curl/curl_7.61.0.bb
>> @@ -13,7 +13,7 @@ SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
>>   SRC_URI[sha256sum] = "5f6f336921cf5b84de56afbd08dfb70adeef2303751ffb3e570c936c6d656c9c"
>>   
>>   CVE_PRODUCT = "libcurl"
>> -inherit autotools pkgconfig binconfig multilib_header
>> +inherit autotools pkgconfig binconfig multilib_header update-alternatives
>>   
>>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy threaded-resolver verbose zlib"
>>   PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver verbose zlib"
>> @@ -48,6 +48,17 @@ PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threade
>>   PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
>>   PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
>>   
>> +MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
>> +ALTERNATIVE_${PN}-dev = "curl-config"
>> +ALTERNATIVE_LINK_NAME[curl-config] = "${bindir}/curl-config"
>> +ALTERNATIVE_TARGET[curl-config] = "${bindir}/curl-config-${MULTILIB_SUFFIX}"
>> +
>> +PACKAGE_PREPROCESS_FUNCS += "alternative_rename"
>> +
>> +alternative_rename() {
>> +        mv ${PKGD}${bindir}/curl-config ${PKGD}${bindir}/curl-config-${MULTILIB_SUFFIX}
>> +}
>> +
>>   EXTRA_OECONF = " \
>>       --disable-libcurl-option \
>>       --disable-ntlm-wb \
> We're going to keep having this problem with other files and I really
> don't want to impact non-multilib systems with the problems multilib
> causes.
>
> I started writing a reply suggesting we create multilib_script.bbclass
> and then realised it would also solve my libtool issue with multilib
> and kernel-devsrc.
>
> I've therefore written a patch which I've just sent out which fixes
> this kind of issue in libtool. You should be able to use the same
> mechanism for curl.
>
> That said, is it not possible to just patch curl-config to use pkg-
> config instead and remove the differences between the two multilib
> cases, thereby solving this problem in a better way?
>
> Cheers,
>
> Richard

Thanks, I will try with your patch way.

>

-- 
BRs

Sandy(Li Changqing)
+861084778653


