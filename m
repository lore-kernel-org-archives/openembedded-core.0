Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QZZHf-00027G-4M
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 04:04:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5N216Nd007263
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 19:01:06 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 22 Jun 2011 19:01:06 -0700
Message-ID: <4E029E60.4090107@windriver.com>
Date: Thu, 23 Jun 2011 10:01:04 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308391365.git.liezhi.yang@windriver.com>	<42574f1bebc1fdf79c9662a22ca0a86d12a8f221.1308391365.git.liezhi.yang@windriver.com>
	<1308768927.20015.96.camel@rex>
In-Reply-To: <1308768927.20015.96.camel@rex>
Subject: Re: [PATCH 5/6 V3] gcc-crosssdk: share work directories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2011 02:04:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/23/2011 02:55 AM, Richard Purdie wrote:
> On Sat, 2011-06-18 at 20:41 +0800, Robert Yang wrote:
>> The gcc-crosssdk.inc edited the files of config/*/linux*.h in ${S},
>> which made the source incompatible. Copy config to config-sdk, and edit
>> the files in config-sdk, configure will read the files in it when build
>> gcc-crosssdk.
>>
>> The sed command for configure is more complicated than for configure.ac,
>> this is because there is such a line /boot/home/config/ in it, we should
>> not substitute it.
>>
>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-crosssdk.inc |   13 +++++++++++--
>>   1 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
>> index 6e7d5a7..fdba6df 100644
>> --- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
>> @@ -9,8 +9,17 @@ GCCMULTILIB = "--disable-multilib"
>>   DEPENDS = "virtual/${TARGET_PREFIX}binutils-crosssdk virtual/${TARGET_PREFIX}libc-for-gcc-nativesdk gettext-native"
>>   PROVIDES = "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREFIX}g++-crosssdk"
>>
>> +export BUILD_GCC_SDK = "-sdk"
>>   do_configure_prepend () {
>>   	# Change the default dynamic linker path to the one in the SDK
>> -	sed -i ${S}/gcc/config/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib/#\1${SYSTEMLIBS}#'
>> -	sed -i ${S}/gcc/config/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib64/#\1${SYSTEMLIBS}#'
>> +	[ ! -d ${S}/gcc/config-sdk ]&&  cp -r ${S}/gcc/config ${S}/gcc/config-sdk/
>> +	sed -i ${S}/gcc/configure.ac -e 's#config/#config\$BUILD_GCC_SDK/#'
>> +	sed -i ${S}/gcc/configure -e 's# config/# config\$BUILD_GCC_SDK/#' \
>> +		-e 's#\${srcdir}/config/#\${srcdir}/config\$BUILD_GCC_SDK/#' \
>> +		-e 's#\$srcdir/config/#\$srcdir/config\$BUILD_GCC_SDK/#' \
>> +		-e 's#\$(srcdir)/config/#\$(srcdir)/config\$BUILD_GCC_SDK/#' \
>> +		-e "s#\$(srcdir)'/config/#\$(srcdir)'/config\$BUILD_GCC_SDK/#"
>> +
>> +	sed -i ${S}/gcc/config-sdk/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib/#\1${SYSTEMLIBS}#'
>> +	sed -i ${S}/gcc/config-sdk/*/linux*.h -e 's#\(GLIBC_DYNAMIC_LINKER.*\)/lib64/#\1${SYSTEMLIBS}#'
>>   }
>
> The other patches look good but this one is still giving me cause for
> concern I'm afraid. The reason why is that you could change SDKMACHINE
> and get unexpected results. We really need the changes to be
> configurable from ${B}.
>
> How about this approach:
>

Thanks, this approach seems better, I will send an update sooner.

// Robert

> We always sed these files in config/ changing:
>
> "GLIBC_DYNAMIC_LINKER.*/lib32/.*" ->  "GLIBC_DYNAMIC_LINKER[...] (GLIBC_LIBDIR32 "/[...])"
> "GLIBC_DYNAMIC_LINKER.*/lib64/.*" ->  "GLIBC_DYNAMIC_LINKER[...] (GLIBC_LIBDIR64 "/[...])"
> "GLIBC_DYNAMIC_LINKER.*/lib/.*" ->  "GLIBC_DYNAMIC_LINKER[...] (GLIBC_LIBDIR "/[...])"
>
> so entries in the files that look like:
>
> #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
>
> would become
>
> #define GLIBC_DYNAMIC_LINKER64 (GLIBC_LIBDIR64 "/ld-linux-x86-64.so.2")
>
> and then we'd add:
>
> #define GLIBC_LIBDIR "/lib"
> #define GLIBC_LIBDIR32 "/lib32"
> #define GLIBC_LIBDIR64 "/lib64"
>
> to our config.h or t-oe (I haven't checked which which makes sense).
> We'd then be able to customise these entries in the specific gcc
> configurations as needed. It shouldn't change the "normal" cases and
> when we get into multilib configurations, we should have some useful
> code already present to assist with making filesystem layout changes too
> as an added bonus.
>
> Could you see if you can get something like that to work?
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


