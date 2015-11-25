Return-Path: <george.nita@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 286386057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 14:23:13 +0000 (UTC)
Received: from [192.168.14.142] (192.168.14.142) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 15:23:12 +0100
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1447929347-20043-1-git-send-email-george.nita@enea.com>
	<6556342.K0qaf5B5dg@peggleto-mobl.ger.corp.intel.com>
From: George Nita <george.nita@enea.com>
Message-ID: <5655C449.7010205@enea.com>
Date: Wed, 25 Nov 2015 16:23:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <6556342.K0qaf5B5dg@peggleto-mobl.ger.corp.intel.com>
X-Originating-IP: [192.168.14.142]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dizzy][PATCH] toolchain-shar-template.sh: Ensure it's ran in clean environment
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
X-List-Received-Date: Wed, 25 Nov 2015 14:23:15 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/2015 12:35 AM, Paul Eggleton wrote:
> Hi George,
>
> On Thursday 19 November 2015 11:35:47 George Nita wrote:
>> Fixes [YOCTO #8698] --
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=8698
>>
>> If prior to running the toolchain installation script a toolchain
>> environment script is sourced then the toolchain installation will
>> fail. This because the environment is now set for the sourced toolchain
>> and doesn't suit the installation. In particular PATH points to the
>> toolchain executables.
>>
>> The fix makes the script recursively call itself a second time with a
>> clean environment.
>>
>> Tested by sourcing a previous successfully installed environment, erasing
>> the previous installation directory and then reinstalling in the same
>> directory.
>>
>> Signed-off-by: George Nita <george.nita@enea.com>
>> ---
>>   meta/files/toolchain-shar-template.sh | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/files/toolchain-shar-template.sh
>> b/meta/files/toolchain-shar-template.sh index 4a7fbd5..b8c5685 100644
>> --- a/meta/files/toolchain-shar-template.sh
>> +++ b/meta/files/toolchain-shar-template.sh
>> @@ -1,5 +1,7 @@
>>   #!/bin/bash
>>
>> +[ -z "$ENVCLEANED" ] && exec /usr/bin/env -i  ENVCLEANED=1 "$0" "$@"
>> +
>>   INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
>>   SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e
>> "s/x86[-_]64/x86_64/")
>
> Interesting, I wasn't aware you could do this with env, thanks.
>
> You've sent this patch on top of dizzy, however when we make fixes like this
> the fix needs to go into master first and then backported to all release
> branches between that and the one you're targeting, assuming they are
> applicable; otherwise we can be in the situation where the fix is effectively
> lost when upgrading. In this instance I'll take care of this for you and send
> out a new fix (along with some others for the SDK), but if you could remember
> that when sending future patches that would be great.
>
> Cheers,
> Paul
>
Thanks Paul. Was induced in error by the script changed name in master 
(toolchain-shar-extract.sh). If still applicable I can send a patch for 
master too.

-- 
Best regards,
George Nita
Software developer
Enea Linux

Email george.nita@enea.com
Phone +4 074.575.4737

Enea Linux
www.enea.com

