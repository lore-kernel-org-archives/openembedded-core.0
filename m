Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8852260667
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 01:54:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r721sNAX028602
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Aug 2013 18:54:23 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 1 Aug 2013 18:54:21 -0700
Message-ID: <51FB1157.4050207@windriver.com>
Date: Fri, 2 Aug 2013 09:54:31 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1375073005.git.Qi.Chen@windriver.com>
	<bc3108ce8eea753d38dc70187fface31e6178e71.1375073005.git.Qi.Chen@windriver.com>
	<51FAA515.6050302@linux.intel.com>
In-Reply-To: <51FAA515.6050302@linux.intel.com>
X-Originating-IP: [128.224.162.233]
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] buildtools-tarball: unset OECORE_NATIVE_SYSROOT
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
X-List-Received-Date: Fri, 02 Aug 2013 01:54:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2013 02:12 AM, Saul Wold wrote:
> On 07/29/2013 06:50 PM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> When building a qemu image inside the environment created by the
>> buildtools-tarball, the qemu image cannot be started, as the runqemu
>> script uses the tunctl binary which cannot be found inside the sysroot
>> directory of the buildtools-tarball.
>>
>> The buildtools-tarball is inherently a tool set instead of a fully
>> functional SDK, so leaving the OECORE_NATIVE_SYSROOT variable in the
>> environment will mess things up.
>>
>> However, we do need a line of 'OECORE_NATIVE_SYSROOT=xxx' in the 
>> environment
>> setup script so that the SDK can be extracted and relocated correctly.
>>
> Where is this being processed, can could be done as a since comment in 
> the the environment-setup script instead of exporting and unseting it?
>
meta/classes/populate_sdk_base.bbclass

The self-extraction script needs to get the location of native sysroot. 
And it does so by grep 'OECORE_NATIVE_SYSROOT=' expression in 
$env_setup_script.

Please see more details below (code snippet from populate_sdk_base.bbclass).

chenqi@pek-qchen1-d1:~/poky$ grep -i oecore_native_sysroot 
meta/classes/populate_sdk_base.bbclass
native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 
'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
chenqi@pek-qchen1-d1:~/poky$ grep -i -w native_sysroot 
meta/classes/populate_sdk_base.bbclass
native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 
'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111)
$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep 
":.*\(ASCII\|script\|source\).*text"|cut -d':' -f1|$SUDO_EXEC xargs sed 
-i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
for l in $($SUDO_EXEC find $native_sysroot -type l); do
# find out all perl scripts in $native_sysroot and modify them replacing the
for perl_script in $($SUDO_EXEC grep "^#!.*perl" -rl $native_sysroot); do

Best Regards,
Chen Qi

> Sau!
>> That's why this patch unsets the variable instead of removing it from 
>> the
>> environment setup script.
>>
>> [YOCTO #4939]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/meta/buildtools-tarball.bb |    6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb 
>> b/meta/recipes-core/meta/buildtools-tarball.bb
>> index 9771497..1f8f142 100644
>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
>> @@ -59,7 +59,11 @@ create_sdk_files_append () {
>> script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
>>       touch $script
>>       echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:$PATH' >> 
>> $script
>> +    # OECORE_NATIVE_SYSROOT variable needs to be in $script so that the
>> +    # relocate script can find the ld-linux.so.
>>       echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
>> -
>> +    # buildtools-tarball is inherently a tool set instead of a fully 
>> functional SDK.
>> +    # Leaving OECORE_NATIVE_SYSROOT in environment will mess things up.
>> +    echo 'unset OECORE_NATIVE_SYSROOT' >> $script
>>       toolchain_create_sdk_version 
>> ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
>>   }
>>
>
>


