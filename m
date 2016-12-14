Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A91E173D27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 08:37:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBE8bZmI011092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Dec 2016 00:37:35 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Dec 2016 00:37:34 -0800
To: Ulf Magnusson <ulfalizer@gmail.com>
References: <cover.1481700149.git.liezhi.yang@windriver.com>
	<bc7d57b6fe00ec420d4fe2ebfd633da348bf2d00.1481700149.git.liezhi.yang@windriver.com>
	<CAFkk2KTb_5513EU1ntijyMdjtjENhAyN8b9MBd5hVp2D7ifavQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <b05aefdd-c148-68a1-f195-b9df745eef8c@windriver.com>
Date: Wed, 14 Dec 2016 16:37:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFkk2KTb_5513EU1ntijyMdjtjENhAyN8b9MBd5hVp2D7ifavQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/8] populate_sdk_ext.bbclass: break the long lines
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
X-List-Received-Date: Wed, 14 Dec 2016 08:37:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ulf,

On 12/14/2016 04:02 PM, Ulf Magnusson wrote:
> I'm not a big fan of those run-on lines either, so thanks. Some
> superficial comments:
>
> On Wed, Dec 14, 2016 at 8:24 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Make it easier to read and maintain.
>>
>> [YOCTO #10647]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/classes/populate_sdk_ext.bbclass | 24 ++++++++++++++++++++----
>>  1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
>> index 3c3a73c..adef96d 100644
>> --- a/meta/classes/populate_sdk_ext.bbclass
>> +++ b/meta/classes/populate_sdk_ext.bbclass
>> @@ -567,7 +567,13 @@ sdk_ext_postinst() {
>>         printf "\nExtracting buildtools...\n"
>>         cd $target_sdk_dir
>>         env_setup_script="$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}"
>> -       printf "buildtools\ny" | ./${SDK_BUILDTOOLS_INSTALLER} > buildtools.log || { printf 'ERROR: buildtools installation failed:\n' ; cat buildtools.log ; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
>> +       ./${SDK_BUILDTOOLS_INSTALLER} -d buildtools -y > buildtools.log
>> +       if [ $? -ne 0 ]; then
>> +               printf 'ERROR: buildtools installation failed:\n'
>> +               cat buildtools.log
>> +               echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script
>> +               exit 1
>> +       fi
>
> Maybe it's a deliberate style choice, but just in case you're not
> aware of it, the following two snippets work the same:
>
> ./${SDK_BUILDTOOLS_INSTALLER} -d buildtools -y > buildtools.log
> if [ $? -ne 0 ]; then
>     ...
>
> if ! ./${SDK_BUILDTOOLS_INSTALLER} -d buildtools -y > buildtools.log; then
>     ...

I'm not sure which is better. We have both of them in the real world.

>
>>
>>         # Delete the buildtools tar file since it won't be used again
>>         rm -f ./${SDK_BUILDTOOLS_INSTALLER}
>> @@ -588,7 +594,9 @@ sdk_ext_postinst() {
>>         echo "printf 'SDK environment now set up; additionally you may now run devtool to perform development tasks.\nRun devtool --help for further details.\n'" >> $env_setup_script
>>
>>         # Warn if trying to use external bitbake and the ext SDK together
>> -       echo "(which bitbake > /dev/null 2>&1 && echo 'WARNING: attempting to use the extensible SDK in an environment set up to run bitbake - this may lead to unexpected results. Please source this script in a new shell session instead.') || true" >> $env_setup_script
>> +       echo "(which bitbake > /dev/null 2>&1 && \
>> +               echo 'WARNING: attempting to use the extensible SDK in an environment set up to run bitbake - this may lead to unexpected results. Please source this script in a new shell session instead.') || \
>> +               true" >> $env_setup_script
>>
>>         if [ "$prepare_buildsystem" != "no" ]; then
>>                 printf "Preparing build system...\n"
>> @@ -596,8 +604,16 @@ sdk_ext_postinst() {
>>                 # current working directory when first ran, nor will it set $1 when
>>                 # sourcing a script. That is why this has to look so ugly.
>>                 LOGFILE="$target_sdk_dir/preparing_build_system.log"
>> -               sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
>> -               rm $target_sdk_dir/ext-sdk-prepare.py
>> +               sh -c ". buildtools/environment-setup* > $LOGFILE && \
>> +                       cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && \
>> +                       set $target_sdk_dir && \
>
> I know it was there before, but I wonder what the point of the 'set'
> is here. It sets $1 to $target_sdk_dir, but $target_sdk_dir is already
> passed explicitly to $target_sdk_dir/${oe_init_build_env_path} below.

Will remove it in another thread the extra sed is useless here.

>
>> +                       . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && \
>> +                       python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'"
>> +               if [ $? -ne ]; then
>> +                       echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script
>> +                       exit 1
>> +                       rm $target_sdk_dir/ext-sdk-prepare.py
>
> Unreachable code.

Good catch, thanks, updated in the repo.

// Robert

>
>> +               fi
>>         fi
>>         echo done
>>  }
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> Cheers,
> Ulf
>

