Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QXclF-0004Kz-2q
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 19:23:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jun 2011 10:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,382,1304319600"; d="scan'208";a="14818441"
Received: from unknown (HELO [10.255.13.45]) ([10.255.13.45])
	by orsmga002.jf.intel.com with ESMTP; 17 Jun 2011 10:19:42 -0700
Message-ID: <4DFB8CAE.8030100@intel.com>
Date: Fri, 17 Jun 2011 10:19:42 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308249837.git.scott.a.garman@intel.com>	<3a0dd72238fb6dbdbfc9ff1f0230f310fde0fff9.1308249837.git.scott.a.garman@intel.com>	<4DFA97A1.9090909@gmail.com>
	<4DFB820B.9070303@intel.com>
	<BANLkTi=_Moowev-2U0tmYiuNwAt2BD9WXA@mail.gmail.com>
In-Reply-To: <BANLkTi=_Moowev-2U0tmYiuNwAt2BD9WXA@mail.gmail.com>
Subject: Re: [PATCH 1/1] base-passwd: disable problematic	login.defs options
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
X-List-Received-Date: Fri, 17 Jun 2011 17:23:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/17/2011 09:43 AM, Khem Raj wrote:
> On Fri, Jun 17, 2011 at 9:34 AM, Scott Garman<scott.a.garman@intel.com>  wrote:
>> On 06/16/2011 04:54 PM, Khem Raj wrote:
>>>
>>> On 06/16/2011 11:50 AM, Scott Garman wrote:
>>>>
>>>> This resolves the following runtime errors when various shadow-utils
>>>> binaries are run:
>>>>
>>>> configuration error - unknown item 'FAILLOG_ENAB' (notify administrator)
>>>> configuration error - unknown item 'LASTLOG_ENAB' (notify administrator)
>>>> configuration error - unknown item 'OBSCURE_CHECKS_ENAB' (notify
>>>> administrator)
>>>> configuration error - unknown item 'PORTTIME_CHECKS_ENAB' (notify
>>>> administrator)
>>>> configuration error - unknown item 'QUOTAS_ENAB' (notify administrator)
>>>> configuration error - unknown item 'MOTD_FILE' (notify administrator)
>>>> configuration error - unknown item 'FTMP_FILE' (notify administrator)
>>>> configuration error - unknown item 'NOLOGINS_FILE' (notify administrator)
>>>> configuration error - unknown item 'ENV_HZ' (notify administrator)
>>>> configuration error - unknown item 'PASS_MIN_LEN' (notify administrator)
>>>> configuration error - unknown item 'SU_WHEEL_ONLY' (notify administrator)
>>>> configuration error - unknown item 'CRACKLIB_DICTPATH' (notify
>>>> administrator)
>>>> configuration error - unknown item 'PASS_CHANGE_TRIES' (notify
>>>> administrator)
>>>> configuration error - unknown item 'PASS_ALWAYS_WARN' (notify
>>>> administrator)
>>>> configuration error - unknown item 'CHFN_AUTH' (notify administrator)
>>>> configuration error - unknown item 'ENVIRON_FILE' (notify administrator)
>>>>
>>>> This fixes bug [YOCTO #1170]
>>>>
>>>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>>>> ---
>>>> .../base-passwd/base-passwd-3.5.22/login.defs | 32 ++++++++++----------
>>>> .../recipes-core/base-passwd/base-passwd_3.5.22.bb | 2 +-
>>>> 2 files changed, 17 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git
>>>> a/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
>>>> b/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
>>>> index 1d392ac..2708eb6 100644
>>>> --- a/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
>>>> +++ b/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
>>>
>>> I wonder if login.defs should be provided at all by base-passwd package.
>>> It should come from shadow isnt it ?
>>
>> Hi Khem,
>>
>> The reason for including the login.defs file with base-passwd has to do with
>> the new useradd.bbclass that I developed (Richard is still holding it for
>> code review, but we should see it here soon). The way it works is custom
>> users/groups get added to the passwd/group files in the target machine's
>> sysroot. The shadow utils require a login.defs in order to work.
>
> hence it should come from shadow isnt it ? why from base-passwd ?
> if someone is not using using shadow this file will be useless for
> him/her isnt it ?

Sorry, I forgot to mention that shadow-utils-native is what is used to 
modify the passwd/group files in the target sysroot. It seems that 
having a -native recipe install files into a target sysroot would be 
worse than including an optional file with base-passwd that may or may 
not be used in target systems.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


