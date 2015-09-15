Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6D565D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 01:08:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8F18Jpe011150
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Sep 2015 18:08:19 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 14 Sep 2015 18:08:18 -0700
Message-ID: <55F76F81.7040809@windriver.com>
Date: Tue, 15 Sep 2015 09:08:17 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <1440568697-32101-1-git-send-email-rongqing.li@windriver.com>
	<55F6DCF8.9030906@linux.intel.com>
In-Reply-To: <55F6DCF8.9030906@linux.intel.com>
Subject: Re: [PATCH][v2] perf: fix the install-python_ext
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
X-List-Received-Date: Tue, 15 Sep 2015 01:08:34 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年09月14日 22:43, Saul Wold wrote:
> On 08/25/2015 10:58 PM, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> 1. $(grep xxx xxx) never returns 0, it maybe return empty or string, and
>> can not compare with 0, this fixes that python module never are
>> installed.
>>
>> 2. python library is installed into /usr/lib/ by default, but we expect
>> it is installed into ${libdir}, so add --install-lib parameter for python
>> setup.py to set the library dir;
>> this fixes not shipped warning, since python modules are installed into
>> /usr/lib/, but FILE_${PN}-python expects it is under ${libdir}, which is
>> /usr/lib64/ for 64bit machine
>>
>> 3. the makefile target install-python_ext is moved from Makefile to
>> Makefile.perf from linux v3.13, so match install-python_ext in Makefile.*
>> and --root='/\$(DESTDIR_SQ)' before linux v3.13 will install the target
>> python library to native sysroot, so replace it with --prefix as after
>> linux
>> 3.13;
>> this fixes not shipped warning, and install target files to native
>> dir, like
>> below:
>> ERROR: QA Issue: perf: Files/directories were installed but not
>> shipped in any package:
>>    /home
>>    /home/pokybuild
>>    /home/pokybuild/yocto-autobuilder
>>    /home/pokybuild/yocto-autobuilder/yocto-worker
>>    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb
>>
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build
>>
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build
>>
>>
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp
>>
>>
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots
>>
>>
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux
>>
>>
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr
>>
>>
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib
>>
>>
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7
>>
>>
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages
>>
>>
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf.so
>>
>>
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf-0.1-py2.7.egg-info
>>
>>
>
> This patch actually seems to introduce this failure,
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm/builds/494/steps/BuildImages/logs/stdio
>
>
> This needs to be addressed.
>
> Sau!


Ok, I will see it

-Roy


>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   meta/recipes-kernel/perf/perf.bb | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb
>> b/meta/recipes-kernel/perf/perf.bb
>> index b18e474..adb3a2c 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -44,6 +44,7 @@ export STAGING_INCDIR
>>   export STAGING_LIBDIR
>>   export BUILD_SYS
>>   export HOST_SYS
>> +export PYTHON_SITEPACKAGES_DIR
>>
>>   #kernel 3.1+ supports WERROR to disable warnings as errors
>>   export WERROR = "0"
>> @@ -111,7 +112,7 @@ do_install() {
>>       unset CFLAGS
>>       oe_runmake DESTDIR=${D} install
>>       # we are checking for this make target to be compatible with
>> older perf versions
>> -    if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1"
>> -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0" ]; then
>> +    if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1"
>> ] && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
>>           oe_runmake DESTDIR=${D} install-python_ext
>>       fi
>>   }
>> @@ -143,7 +144,12 @@ do_configure_prepend () {
>>       if [ -e "${S}/tools/perf/Makefile.perf" ]; then
>>           sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
>>               ${S}/tools/perf/Makefile.perf
>> +        sed -i -e
>> "s,prefix='\$(DESTDIR_SQ)/usr'$,prefix='\$(DESTDIR_SQ)/usr'
>> --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
>> +            ${S}/tools/perf/Makefile.perf
>>       fi
>> +    sed -i -e
>> "s,--root='/\$(DESTDIR_SQ)',--prefix='\$(DESTDIR_SQ)/usr'
>> --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
>> +        ${S}/tools/perf/Makefile
>> +
>>       if [ -e "${S}/tools/build/Makefile.build" ]; then
>>           sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
>>               ${S}/tools/build/Makefile.build
>>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

