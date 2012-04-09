Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHGgY-0002hA-QQ
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 17:39:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Apr 2012 08:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130323474"
Received: from unknown (HELO [10.255.12.159]) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2012 08:30:01 -0700
Message-ID: <4F830078.9020403@linux.intel.com>
Date: Mon, 09 Apr 2012 08:30:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Scott Garman <scott.a.garman@intel.com>
References: <cover.1333695164.git.scott.a.garman@intel.com>
	<4F80D4EF.8090704@linux.intel.com> <4F826CEE.9040107@intel.com>
In-Reply-To: <4F826CEE.9040107@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] shadow-native: disable logging to syslog
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
X-List-Received-Date: Mon, 09 Apr 2012 15:39:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2012 10:00 PM, Scott Garman wrote:
> On 04/07/2012 04:59 PM, Saul Wold wrote:
>> On 04/05/2012 11:53 PM, Scott Garman wrote:
>>> Hello,
>>>
>>> This pull request includes a patch to shadow to disable logging to
>>> syslog, to prevent sysroot user and group additions from writing
>>> entries to the host's syslog.
>>>
>>> I have build-tested this with core-image-sato (which builds a few
>>> useradd-based recipes, such as avahi and dbus) for all 5 of our
>>> qemu architectures, while watching my syslog to verify that no
>>> useradd or groupadd entries were written.
>>>
>>
>> With this patch applied, the following error was seen on the AB:
>>
>> | Running useradd commands...
>> | WARNING: useradd command did not succeed. Retrying...
>> | WARNING: useradd command did not succeed. Retrying...
>> | WARNING: useradd command did not succeed. Retrying...
>> | WARNING: useradd command did not succeed. Retrying...
>> | WARNING: useradd command did not succeed. Retrying...
>> | WARNING: useradd command did not succeed. Retrying...
>> | WARNING: useradd command did not succeed. Retrying...
>> | WARNING: useradd command did not succeed. Retrying...
>> | WARNING: useradd command did not succeed. Retrying...
>> | WARNING: useradd command did not succeed. Retrying...
>> | ERROR: tried running useradd command 10 times without success,
>> giving up
>>
>> Check the AB here:
>>
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/369/steps/shell_19/logs/stdio
>>
>
> Hi Saul,
>
> The syslog disable patch cannot trigger this error, I'm pretty certain
> you have encountered another problem.
>
> The useradd class now uses code which checks that the user account or
> group account was created in the passwd and group files, respectively.
> If the account was not created (which is verified via a grep command),
> the script sleeps for 1 second and tries again, up to 10 times. This is
> intended to avoid lockfile races, as useradd and groupadd lock the
> passwd and group files when creating accounts.
>
> It seems extremely unlikely that the passwd file was locked for a full
> 10s worth of attempts to access it. I also see from the logs that the
> base-passwd package was installed before this error was encountered,
> which *should* rule out the possibility that the useradd command was
> failing because /etc/passwd didn't exist yet.
>
> Later useradd commands are also failing in this manner, which makes me
> suspect that something is wrong with the /etc/passwd file in this image.
> The groupadd commands, on the other hand, are succeeding without any
> retries.
>
> So it would be helpful for me to know answers to the following:
>
> Was this a build from scratch or from sstate?
>
This was from sstate.

> Is this problem reproducible? (I'm starting a build from scratch
> overnight on my end)
>
Only saw it on one build over the weekend, but turns out a bug already 
existed with this issue, but it was filed as a PAM build failure (see 
2218) , which maybe I need to re-assign to you.


> What does the etc/passwd file in this image look like?
>
You can get it from the AB yourself, correct?  If not, let me know please.

Sau!

> Thanks,
>
> Scott
>


