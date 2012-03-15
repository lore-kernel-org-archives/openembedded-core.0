Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S80Tq-0003dz-0S
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 03:31:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2F2N6Uo010534
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 19:23:06 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 14 Mar 2012 19:23:06 -0700
Message-ID: <4F615289.8070801@windriver.com>
Date: Thu, 15 Mar 2012 10:23:05 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1331716010.git.liezhi.yang@windriver.com>
	<34489f7f0d7f0457df45e2ee4606b51a09ed1704.1331716010.git.liezhi.yang@windriver.com>
	<1331738800.18586.39.camel@ted>
In-Reply-To: <1331738800.18586.39.camel@ted>
Subject: Re: [PATCH 1/1] gcc-cross: aviod creating invalid symlinks
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
X-List-Received-Date: Thu, 15 Mar 2012 02:31:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/14/2012 11:26 PM, Richard Purdie wrote:
> On Wed, 2012-03-14 at 17:13 +0800, Robert Yang wrote:
>> There are several invalid symlinks in gcc-cross-initial,
>> gcc-cross-intermediate and gcc-cross, these cause the error:(56 errors)
>>
>> tmp/work/i586-poky-linux/gcc-cross-initial-4.6.3+svnr184847-r23/temp/log.do_populate_sysroot:
>> log.do_populate_sysroot:grep: /path/to/invalid/symlink: No such file or directory
>>
>> Avoid creating invalid symlinks would fix this problem.
>>
>> Use the:
>> [ ! -e file ] || do_something
>> But not use:
>> [ -e file ]&&  do_something
>> is because that if the "file" doesn't exist, then the whole statement
>> would return false, and bitbake treats this an error, so use the "||" to
>> let it always be true.
>>
>> [YOCTO #2095]
>>
>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>> ---
>>   .../gcc/gcc-cross-intermediate.inc                 |    3 ++-
>>   meta/recipes-devtools/gcc/gcc-package-cross.inc    |    6 ++++--
>>   2 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
>> index ea105e6..87d11ab 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
>> @@ -51,7 +51,8 @@ do_install () {
>>   	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
>>   	install -d $dest
>>   	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
>> -		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
>> +		[ ! -e ${BINRELPATH}/${TARGET_PREFIX}$t ] || \
>> +	        ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
>>   	done
>>   }
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-package-cross.inc b/meta/recipes-devtools/gcc/gcc-package-cross.inc
>> index e32412c..3d52d23 100644
>> --- a/meta/recipes-devtools/gcc/gcc-package-cross.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-package-cross.inc
>> @@ -19,8 +19,10 @@ do_install () {
>>   	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
>>   	install -d $dest
>>   	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
>> -		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
>> -		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
>> +        if [ -e ${BINRELPATH}/${TARGET_PREFIX}$t ]; then
>> +		    ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
>> +		    ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
>> +        fi
>>   	done
>>
>>   	# Remove things we don't need but keep share/java
>
>
> I've had to revert this, it totally broke the mips/ppc/arm toolchains.
> See the failures on the autobuilder, e.g.
> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/338/steps/shell_33/logs/stdio in eglibc-initial. The problem is that the location we're symlinking to may not be installed yet. For example, gcc provides "${TARGET_PREFIX}gcc" but it won't be installed at the location we point at until after gcc's populate_sysroot function runs. The tests you're using are therefore not adding as many symlinks as we need.
>

I'm really sorry for this, I will drop the it.

// Robert

> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


