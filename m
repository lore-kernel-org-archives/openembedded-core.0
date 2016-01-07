Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C633273183
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 15:07:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 07 Jan 2016 07:07:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,533,1444719600"; d="scan'208";a="885698716"
Received: from lsandov1-mob1-linux.zpn.intel.com (HELO [10.219.5.155])
	([10.219.5.155])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2016 07:07:44 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Mike Looijmans <mike.looijmans@topic.nl>
References: <568533E5.4000105@topic.nl> <56856023.5060407@linux.intel.com>
	<5686447F.60200@topic.nl>
	<3915097.5a95lnvstk@peggleto-mobl.ger.corp.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <568E801F.4010601@linux.intel.com>
Date: Thu, 7 Jan 2016 09:11:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <3915097.5a95lnvstk@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Getting "menuconfig" to work again?
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
X-List-Received-Date: Thu, 07 Jan 2016 15:07:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/01/2016 11:58 AM, Paul Eggleton wrote:
> Hi Mike,
>
> On Fri, 01 Jan 2016 10:18:55 Mike Looijmans wrote:
>> On 31-12-15 18:04, Leonardo Sandoval wrote:
>>> On 12/31/2015 07:58 AM, Mike Looijmans wrote:
>>>> On 31-12-15 14:55, Mike Looijmans wrote:
>>>>> When running a "menuconfig" (or any other task that needs a terminal),
>>>>> bitbake just "stops" and doesn't show any terminal.
>>>>>
>>>>> I'm using the current master branch of everything, on Ubuntu 15.
>>>>>
>>>>> When running with "-D" I can see the following log:
>>>>>
>>>>> DEBUG: Executing task do_menuconfig
>>>>> DEBUG: Attempting to spawn terminal "custom"
>>>>> DEBUG: No custom terminal (OE_TERMINAL_CUSTOMCMD) set
>>>>> DEBUG: Attempting to spawn terminal "tmux-running"
>>>>> DEBUG: Attempting to spawn terminal "tmux-new-window"
>>>>> DEBUG: Attempting to spawn terminal "gnome"
>>>>>
>>>>> But nothing happens from that point.
>>>> Extra info: apparently it spawns a process:
>>>>
>>>> /usr/bin/python3 /usr/bin/gnome-terminal --version
>>> gnome-terminal is a pain... there are some checks base on the version
>>> and based on that certain parameters are set. which g-t version are you
>>> using?
>> $ gnome-terminal --version
>> GNOME Terminal 3.14.2
>>
>>>> If I kill that process, the menuconfig magically appears.
>> Digging into the source code, I saw that "gnome-terminal --version" is
>> only being called to determine if the "--disable-factory" option should
>> be passed to it. For some reason, in OE that call "hangs", I suspect
>> because of the way the environment and pipes are laid out at that point.
>>
>> If I just run 'gnome-terminal -t hello --disable-factory -x sh' I don't
>> get any errors and it works just fine. To me it looks like the whole
>> version check could be removed and always pass "--disable-factory".
Mike, this is definitely a bug that you hit. Can you file it in 
https://bugzilla.yoctoproject.org/?

> Unfortunately that's what we did earlier and it was fine until gnome-terminal
> stopped accepting that option. Perhaps it's now a no-op in the version you're
> using, I'm not sure; but in 3.10 they made it trigger an error.
>
> It ought not to be too hard to fix the hanging - hopefully someone with a GNOME
> desktop installed (not me) can figure out what's happening there.
>
>> Happy New Year!
> Same to you! :)
>
> Cheers,
> Paul
>


