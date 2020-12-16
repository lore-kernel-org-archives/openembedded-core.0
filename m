Received: from outbound-relay8.guardedhost.com (outbound-relay8.guardedhost.com [216.239.133.208])
 by mx.groups.io with SMTP id smtpd.web12.918.1608145075721081695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 10:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: snowmoose.com, ip: 216.239.133.208, mailfrom: alanp@snowmoose.com)
Received: from mail.guardedhost.com (tev-mx3.omnis.com [216.239.133.143])
	by outbound-relay5.guardedhost.com (Postfix) with ESMTP id 4Cx4Bp4tRkz7vD;
	Wed, 16 Dec 2020 18:57:54 +0000 (GMT)
Received: from Alans-MacBook-Pro.local (c-73-254-147-133.hsd1.wa.comcast.net [73.254.147.133])
	(Authenticated sender: alanp@snowmoose.com)
	by mail.guardedhost.com (Postfix) with ESMTPA id 4Cx4Bn5btHz2xpq;
	Wed, 16 Dec 2020 18:57:53 +0000 (GMT)
Subject: Re: [OE-core] [PATCH] binutils: add libopcodes package for perf
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20201216073754.4371-1-alanp@snowmoose.com>
 <CAMKF1sq+_YGUfaKVDYW8APSFdMDC8BWV+Tdf4mm+XjJ+w4_BvQ@mail.gmail.com>
From: "Alan Perry" <alanp@snowmoose.com>
Message-ID: <d1e0520e-3321-2ef1-9ba6-9a4a5287998a@snowmoose.com>
Date: Wed, 16 Dec 2020 10:57:52 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq+_YGUfaKVDYW8APSFdMDC8BWV+Tdf4mm+XjJ+w4_BvQ@mail.gmail.com>
Authentication-Results: mail.guardedhost.com;auth=pass
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse-Id: 9AA0F90A-3FD0-11EB-8397-8B021E24E163
X-Virus-Scanned: clamav-milter 0.102.2 at tev-mx3.omnis.com
X-Virus-Status: Clean
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/16/20 10:27 AM, Khem Raj wrote:
> On Tue, Dec 15, 2020 at 11:38 PM Alan Perry <alanp@snowmoose.com> wrote:
>> Add a package for libopcodes, since, like libbfd, it is needed by
>> perf. Without separate packages for these libraries, all of the
>> binutil tools get added as well.
>>
> libopcodes is not an API that binutils publish for wider consumption,
> its meant for internal components and
> external components can use it from binutils itself knowing very well
> that it will change with binutils and therefore
> I would prefer to not separate it out into separate package like this
> which can appear as if its an external API
> that binutils will respect.

Currently in binutils, the libbfd package is there "so including perf 
doesn't include extra stuff".

Without this change, including perf includes that extra stuff anyway.

If that comment is to be believed, the libbfd is not currently being 
provided in binutils as an external API.


>
>> Signed-off-by: Alan Perry <alanp@snowmoose.com>
>> ---
>>   meta/recipes-devtools/binutils/binutils_2.35.bb | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils_2.35.bb b/meta/recipes-devtools/binutils/binutils_2.35.bb
>> index 2e645e1ed8..976e49765a 100644
>> --- a/meta/recipes-devtools/binutils/binutils_2.35.bb
>> +++ b/meta/recipes-devtools/binutils/binutils_2.35.bb
>> @@ -52,9 +52,11 @@ do_install_class-native () {
>>          rmdir ${D}/${libdir}64 || :
>>   }
>>
>> -# Split out libbfd-*.so so including perf doesn't include extra stuff
>> -PACKAGE_BEFORE_PN += "libbfd"
>> +# Split out libbfd-*.so and libopcodes-*.so so including perf doesn't include
>> +# extra stuff
>> +PACKAGE_BEFORE_PN += "libbfd libopcodes"
>>   FILES_libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
>> +FILES_libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
>>
>>   SRC_URI_append_class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
>>
>> --
>> 2.17.1
>>
>>
>> 
>>

