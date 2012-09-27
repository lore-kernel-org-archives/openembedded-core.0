Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1THKbm-000185-6k
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 22:22:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8RKA1rG003628
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 13:10:01 -0700 (PDT)
Received: from msp-dhcp5.wrs.com (172.25.34.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 27 Sep 2012 13:10:00 -0700
Message-ID: <5064B298.4030200@windriver.com>
Date: Thu, 27 Sep 2012 15:10:00 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1348748457-7215-1-git-send-email-christian.glindkamp@taskit.de>
	<50647177.5090105@linux.intel.com>
In-Reply-To: <50647177.5090105@linux.intel.com>
Subject: Re: [PATCH] perl: Fix nativesdk install path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 20:22:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I had to revert this patch.  With it enabled, if I enable multilibs and build 
for x86_64 (so my libdir == /usr/lib64), perl no longer finishes do_install().

When I revert it fixes that issue, but of course then the nativesdk is broken again.

--Mark

On 9/27/12 10:32 AM, Saul Wold wrote:
> On 09/27/2012 05:20 AM, Christian Glindkamp wrote:
>> Commit 38234f2e276356b1d77a87ceabc486107e336d19 tried to fix the sed
>> expressions by anchoring the left side of the search regexp to prevent
>> $prefix$prefix type expression in the perl config. For nativesdk this is
>> not enough. Adding anchors on both side fixes this.
>>
>> Signed-off-by: Christian Glindkamp <christian.glindkamp@taskit.de>
>> ---
>>
>> This is currently only build tested, but buildhistory for perl did not change.
>>
>>    meta/recipes-devtools/perl/perl_5.14.2.bb |    8 ++++----
>>    1 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
>> index 3c1360f..0009855 100644
>> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>>    # We need gnugrep (for -I)
>>    DEPENDS = "virtual/db grep-native"
>>    DEPENDS += "gdbm zlib"
>> -PR = "r9"
>> +PR = "r10"
>>
>>    # 5.10.1 has Module::Build built-in
>>    PROVIDES += "libmodule-build-perl"
>> @@ -150,9 +150,9 @@ do_configure() {
>>                   -e 's,@ARCH@-thread-multi,,g' \
>>                   -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
>>                   -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
>> -               -e "s%\([ \"^\',=]\+\)/usr/include%\1${STAGING_INCDIR}%g" \
>> -	       -e "s%\([ \"^\',=]\+\)/usr/lib/%\1${libdir}/%g" \
>> -	       -e "s%\([ \"^\',=]\+\)/usr/%\1${exec_prefix}/%g" \
>> +               -e "s%\([ \"^\',=]\+\)/usr/include\([ \"^\',=]\+\)%\1${STAGING_INCDIR}\2%g" \
>> +	       -e "s%\([ \"^\',=]\+\)/usr/lib/\([ \"^\',=]\+\)%\1${libdir}/\2%g" \
>> +	       -e "s%\([ \"^\',=]\+\)/usr/\([ \"^\',=]\+\)%\1${exec_prefix}/\2%g" \
>>    	       -e "s%/perl5%/perl%g" \
>>                config.sh-${TARGET_ARCH}-${TARGET_OS}
>>
>>
>
> Merged into OE-Core
>
> Thanks	
> 	Sau!
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



