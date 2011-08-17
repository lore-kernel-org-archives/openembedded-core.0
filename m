Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1QtaPP-0006Ir-VA
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 09:19:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7H7EmZC007808
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Aug 2011 00:14:48 -0700 (PDT)
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 17 Aug 2011 00:14:47 -0700
Message-ID: <4E4B6AAA.60900@windriver.com>
Date: Wed, 17 Aug 2011 15:15:54 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1313479193.git.wenzong.fan@windriver.com>
	<14db4cd25c94ed42ef971b2e462d484da8328242.1313479193.git.wenzong.fan@windriver.com>
	<4E4AE293.9040808@linux.intel.com>
In-Reply-To: <4E4AE293.9040808@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] perl-native: Update 'find_perl()' to find the perl wrapper
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
X-List-Received-Date: Wed, 17 Aug 2011 07:19:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2011 05:35 AM, Saul Wold wrote:
> On 08/16/2011 12:56 AM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>
>> [YOCTO #1157] [YOCTO #829]
>>
>> This is a common issue to the packages which using 'MakeMaker.pm' to
>> generate their Makefiles. The function 'find_perl()' in 'MM_Unix.pm'
>> will be used to figure out the path/link of 'PERL/FULLPERL', but it
>> always find the 'perl.real' instead of perl wrapper.
>>
>> Just update it to find the perl wrapper correctly.
>
> Should the be looking for the perl_native directory?
>

Yes, it should. Otherwise it'll use the 'perl' on host.

> See additional comment about patch header below.

I'll add the patch header.

Thanks
Wenzong

>
>
> Thanks
>
> Sau!
>>
>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>> ---
>>   .../perl/perl-5.12.3/MM_Unix.pm.patch              |   12 ++++++++++++
>>   meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    5 +++--
>>   2 files changed, 15 insertions(+), 2 deletions(-)
>>   create mode 100644 
>> meta/recipes-devtools/perl/perl-5.12.3/MM_Unix.pm.patch
>>
>> diff --git a/meta/recipes-devtools/perl/perl-5.12.3/MM_Unix.pm.patch 
>> b/meta/recipes-devtools/perl/perl-5.12.3/MM_Unix.pm.patch
>> new file mode 100644
>> index 0000000..7a6e02d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/perl/perl-5.12.3/MM_Unix.pm.patch
>
> This needs a patch header with a Signed-off-by and Upstream-Status as 
> per the guidelines:
>
> http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines
>
>
>> @@ -0,0 +1,12 @@
>> +--- 
>> perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm.orig    
>> 2011-08-12 16:07:30.000000000 +0800
>> ++++ perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm    
>> 2011-08-12 16:08:56.000000000 +0800
>> +@@ -1019,6 +1019,9 @@
>> +     }
>> +
>> +     foreach my $name (@$names){
>> ++        # Getting MakeMaker.pm use perl wrapper instead of 
>> 'perl.real' directly
>> ++        $name =~ s/perl\.real/perl/ if ($name =~ /perl\.real/);
>> ++
>> +         foreach my $dir (@$dirs){
>> +             next unless defined $dir; # $self->{PERL_SRC} may be 
>> undefined
>> +             my ($abs, $val);
>> diff --git a/meta/recipes-devtools/perl/perl-native_5.12.3.bb 
>> b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
>> index 945ebd4..a8e2346 100644
>> --- a/meta/recipes-devtools/perl/perl-native_5.12.3.bb
>> +++ b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
>> @@ -4,7 +4,7 @@ SECTION = "libs"
>>   LICENSE = "Artistic|GPL"
>>   LIC_FILES_CHKSUM = 
>> "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>>               file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
>> -PR = "r4"
>> +PR = "r5"
>>
>>   LIC_FILES_CHKSUM = 
>> "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>>                       
>> file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
>> @@ -19,7 +19,8 @@ SRC_URI = 
>> "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
>>              file://parallel_build_fix_5.patch \
>>              file://parallel_build_fix_6.patch \
>>              file://native-nopacklist.patch \
>> -           file://native-perlinc.patch"
>> +           file://native-perlinc.patch \
>> +           file://MM_Unix.pm.patch"
>>
>>   SRC_URI[md5sum] = "29975a69dce54e47fcd6331c085c6c99"
>>   SRC_URI[sha256sum] = 
>> "5678bfd5c2cd59253a26171bf3e681235433b00c730eea8a8046e1b225c11d2f"
>



