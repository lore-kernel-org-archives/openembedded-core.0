Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QLzWN-0006xs-Jb
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 17:15:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2011 08:12:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,374,1301900400"; d="scan'208";a="643311591"
Received: from unknown (HELO [10.255.12.132]) ([10.255.12.132])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2011 08:12:54 -0700
Message-ID: <4DD13F02.4030506@linux.intel.com>
Date: Mon, 16 May 2011 08:13:06 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>	<33b417d1457fc40c41c4957d62e6758ec1cfcc42.1305329659.git.dvhart@linux.intel.com>	<BANLkTinVmZDFvLVz9+pf3m9O=CeHRx4ddA@mail.gmail.com>	<4DCECDC0.7060708@linux.intel.com>
	<BANLkTinQc5CtwEa9VO1-2AQriVA1u8fO=g@mail.gmail.com>
In-Reply-To: <BANLkTinQc5CtwEa9VO1-2AQriVA1u8fO=g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 10/10] send-pull-request: verify git sendemail config
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
X-List-Received-Date: Mon, 16 May 2011 15:15:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/14/2011 07:48 PM, Bruce Ashfield wrote:
> On Sat, May 14, 2011 at 2:45 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>
>>
>> On 05/13/2011 10:43 PM, Bruce Ashfield wrote:
>>> On Fri, May 13, 2011 at 7:38 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>>> Perform a quick sanity check to be able to direct users to configure
>>>> git.sendemail if they haven't yet.
>>>>
>>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>>> ---
>>>>  scripts/send-pull-request |   15 +++++++++++++++
>>>>  1 files changed, 15 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
>>>> index f94596f..2ccb8e8 100755
>>>> --- a/scripts/send-pull-request
>>>> +++ b/scripts/send-pull-request
>>>> @@ -38,6 +38,18 @@ harvest_recipients()
>>>>        unset IFS
>>>>  }
>>>>
>>>> +check_git_sendemail_config()
>>>> +{
>>>> +       GIT_SMTP=$(git config sendemail.smtpserver)
>>>> +       GIT_FROM=$(git config sendemail.from)
>>>> +       if [ -z "$GIT_SMTP" ] || [ -z "$GIT_FROM" ]; then
>>>> +               echo "ERROR: git sendemail is not configured."
>>>> +               echo "Please read GIT-SEND-EMAIL(1) and configure:"
>>>> +               echo "  sendemail.smtpserver"
>>>> +               echo "  sendemail.from"
>>>
>>> I was going to ask for this to be optional, since I always pass the smtp
>>> settings on the command line .. but then I realized that I invoke git send-email
>>> directly anyway, so I don't need it to be optional. :)
>>>
>>> Regardless, reading this from git config is good idea, so the above is
>>> only a comment.
>>
>> This only impacts the send-pull-request script which requires
>> git-send-email to be configured in order to work, so it really can't be
>> an optional thing.
> 
> I meant making it optional from being in your .gitconfig. I use
> git send-email with a smtp server almost every day .. and it's
> not in my .gitconfig :)

Right, duh. OK, so it order to make this optional, we would have to add
all the necessary options to pass through from the script to
git-send-email. I'd really rather avoid that.

What is your objection to having a default smtp/from in your git config?
You can always override it on the command line, and with confirm=always
in your git config (you're sane right?) there is little risk of sending
from the wrong account accidentally.

--
Darren

> 
> Bruce
> 
>>
>> --
>> Darren
>>
>>>
>>> Bruce
>>>
>>>> +               exit 1
>>>> +       fi
>>>> +}
>>>>
>>>>  # Parse and verify arguments
>>>>  while getopts "ahp:t:" OPT; do
>>>> @@ -67,6 +79,9 @@ while getopts "ahp:t:" OPT; do
>>>>        esac
>>>>  done
>>>>
>>>> +# Abort early if git-send-email is not properly configured
>>>> +check_git_sendemail_config
>>>> +
>>>>  if [ -z "$PDIR" ]; then
>>>>        echo "ERROR: you must specify a pull-dir."
>>>>        usage
>>>> --
>>>> 1.7.1
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>
>>>
>>>
>>>
>>
>> --
>> Darren Hart
>> Intel Open Source Technology Center
>> Yocto Project - Linux Kernel
>>
> 
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


