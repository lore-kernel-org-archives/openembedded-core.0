Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UVNW1-0004ni-S9
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 16:51:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Apr 2013 07:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,551,1363158000"; d="scan'208";a="301925816"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 25 Apr 2013 07:32:56 -0700
Message-ID: <51793E97.3070201@intel.com>
Date: Thu, 25 Apr 2013 17:32:55 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1366892003.git.laurentiu.palcu@intel.com>
	<f0a9ef998eba08dce22e9a931e34f89c6c2c34e7.1366892003.git.laurentiu.palcu@intel.com>
	<517934DE.90303@windriver.com>
In-Reply-To: <517934DE.90303@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] scripts/postinst-intercepts: create separete hooks for multilib
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
X-List-Received-Date: Thu, 25 Apr 2013 14:51:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/25/2013 04:51 PM, Mark Hatle wrote:
> On 4/25/13 7:24 AM, Laurentiu Palcu wrote:
>> When using multilib, the hooks for lib32/lib64 must be different because
>> the libdir/base_libdir point to different locations. Nothing has to be
>> done in the postinstalls for this. When a hook is installed, it will be
>> detected automatically if this is a ML package (from the libXX- package
>> prefix) and a separate hook will be created.
>>
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> ---
>>   scripts/postinst-intercepts/postinst_intercept |   18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/scripts/postinst-intercepts/postinst_intercept b/scripts/postinst-intercepts/postinst_intercept
>> index ed32f27..5969eba 100755
>> --- a/scripts/postinst-intercepts/postinst_intercept
>> +++ b/scripts/postinst-intercepts/postinst_intercept
>> @@ -17,9 +17,27 @@
>>
>>   intercept_script=$INTERCEPT_DIR/$1 && shift
>>   package_name=$1 && shift
>> +mlprefix=$(echo $package_name|sed -rn 's/^(lib32|lib64|libx32)-.*/\1/p')
> 
> The mlprefix is theoretically arbitrary.  It would be better to base the parse 
> list off of a given machines available multilibs.  If you can dump the multilib 
> list from bitbake, that would be best.
OK, I understand your concern... I could probably pass
mlprefix=${MLPREFIX} as a third argument to all calls to
postinst_intercept script instead. I'll rework it and send a v2.

Thanks,
Laurentiu


