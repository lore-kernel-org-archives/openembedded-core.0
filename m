Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T9iBX-0004Q8-Ts
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 21:56:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q86Jhssg027723
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Sep 2012 12:43:54 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 6 Sep 2012 12:43:54 -0700
Message-ID: <5048FCF9.9070707@windriver.com>
Date: Thu, 6 Sep 2012 14:43:53 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1346920164-29192-1-git-send-email-mertsas@cisco.com>
	<5048F57F.10002@linux.intel.com>
In-Reply-To: <5048F57F.10002@linux.intel.com>
Subject: Re: [PATCH] perl: Remove the changes of bin, lib etc. as the defaults will give sane values.
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
X-List-Received-Date: Thu, 06 Sep 2012 19:56:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/12 2:11 PM, Saul Wold wrote:
> On 09/06/2012 01:29 AM, Martin Ertsaas wrote:
>> The old config put stuff in ${perldir}/image/usr/local/oecore-x86_64/sysroot/x86_64-unknownsdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-unknownsdk-linux/usr
>> instead of in ${perldir}/image/usr/local/oecore-x86_64/sysroot/x86_64-nimbussdk-linux/usr as it should.
>
> I am not sure we want to remove that sed code, since allows for
> different ${libdir} than /usr/lib, such as a flattened /lib, same with
> the ${exec_prefix}.

Ya, the sed lines are specifically there to enable the end user to modify the 
exec_prefix and libdir to their local distribution policies.  If this is no 
longer necessary, we can remove it.. but someone needs to verify they are being 
used properly.  (Flattened filesystem and multilibs are the two places I know 
it's used today.)

--Mark

> Sau!
>
>
>> ---
>>    meta/recipes-devtools/perl/perl_5.14.2.bb |   19 ++++++++-----------
>>    1 files changed, 8 insertions(+), 11 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
>> index 3c1360f..04e2597 100644
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
>> @@ -145,16 +145,13 @@ do_configure() {
>>
>>    	${@base_contains('DISTRO_FEATURES', 'largefile', '', 'do_nolargefile', d)}
>>
>> -        # Update some paths in the configuration
>> -        sed -i -e 's,@DESTDIR@,${prefix},g' \
>> -               -e 's,@ARCH@-thread-multi,,g' \
>> -               -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
>> -               -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
>> -               -e "s%\([ \"^\',=]\+\)/usr/include%\1${STAGING_INCDIR}%g" \
>> -	       -e "s%\([ \"^\',=]\+\)/usr/lib/%\1${libdir}/%g" \
>> -	       -e "s%\([ \"^\',=]\+\)/usr/%\1${exec_prefix}/%g" \
>> -	       -e "s%/perl5%/perl%g" \
>> -            config.sh-${TARGET_ARCH}-${TARGET_OS}
>> +    # Update some paths in the configuration
>> +    sed -i -e 's,@DESTDIR@,${prefix},g' \
>> +           -e 's,@ARCH@-thread-multi,,g' \
>> +           -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
>> +           -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
>> +           -e "s%/perl5%/perl%g" \
>> +          config.sh-${TARGET_ARCH}-${TARGET_OS}
>>
>>    	case "${TARGET_ARCH}" in
>>    		x86_64 | powerpc | s390)
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



