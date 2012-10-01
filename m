Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TIhx1-0001eC-O7
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 17:30:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Oct 2012 08:17:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,517,1344236400"; d="scan'208";a="217568784"
Received: from unknown (HELO [10.252.122.42]) ([10.252.122.42])
	by orsmga002.jf.intel.com with ESMTP; 01 Oct 2012 08:17:31 -0700
Message-ID: <5069B40A.5090902@intel.com>
Date: Mon, 01 Oct 2012 18:17:30 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1348963477.git.mark.hatle@windriver.com>
	<0a88f460fef5d86e2a3ec4158498f025c836cfa9.1348963477.git.mark.hatle@windriver.com>
	<1349097436.15753.99.camel@ted> <5069AEFF.5080707@windriver.com>
In-Reply-To: <5069AEFF.5080707@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/12] populate_sdk_base: Update extraction script for multilibs
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
X-List-Received-Date: Mon, 01 Oct 2012 15:30:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/01/2012 05:55 PM, Mark Hatle wrote:
> On 10/1/12 8:17 AM, Richard Purdie wrote:
>> On Sat, 2012-09-29 at 19:19 -0500, Mark Hatle wrote:
>>> When multilibs are enabled, there will be more then one environment
>>> file created.  We need to be sure to process each environment file.
>>> The next function can simply use the last environment file processed
>>> to get the magic value(s) that it requires.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>> ---
>>>   meta/classes/populate_sdk_base.bbclass |    5 +++--
>>>   1 files changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>>> index 6eb6726..1bc1438 100644
>>> --- a/meta/classes/populate_sdk_base.bbclass
>>> +++ b/meta/classes/populate_sdk_base.bbclass
>>> @@ -158,8 +158,9 @@ echo "done"
>>>
>>>   printf "Setting it up..."
>>>   # fix environment paths
>>> -env_setup_script=$(find $target_sdk_dir/ -name "environment-setup-${REAL_MULTIMACH_TARGET_SYS}")
The reason to replace globbing with ${REAL_MULTIMACH_TARGET_SYS} was to
match only the file we're interested in and avoid matching other files
whose names start with environment-setup. However, since all the
environment-setup directories reside in $target_sdk_dir/ we would
probably be safer, and faster, by doing a simple ls and avoid searching
all the tree.

env_setup_script=$(ls $target_sdk_dir/environment-setup-*)

>>> -sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
>>> +for env_setup_script in `find $target_sdk_dir/ -name "environment-setup-*"` ; do
>>> +  sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
>>> +done
We could probably do this without the for loop since sed accepts
multiple input files.

>>>
>>>   # fix dynamic loader paths in all ELF SDK binaries
>>>   native_sysroot=$(cat $env_setup_script |grep OECORE_NATIVE_SYSROOT|cut -d'=' -f2|tr -d '"')
>>
>> This is on course to conflict with
>>
>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=1b6019086c4242c550b4e0551c7b5d206a0d52e1
>>
>> Can you please talk with Laurentiu and come up with a solution that
>> works for everyone.
> 
> I think this is a better fix for the problem.  The other change limits the 
> environment file to a single file.  However, there is nothing in the function -- 
> other then the use of 'env_setuo_script' -- that wants or needs a single file 
> loaded.
> 
> So it's better to find htem all and just iterate over them all.  Also the order 
> of processing, and the last item processed does not matter.  The later chunks of 
> functionality just look for a static value that is supposed to be the same in 
> all of the environment files.
> 
> --Mark
> 
>> Cheers,
>>
>> Richard
>>
> 


