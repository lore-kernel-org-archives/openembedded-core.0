Return-Path: <mike.looijmans@topic.nl>
Received: from smtp02.mail.online.nl (smtp02.mail.online.nl [194.134.25.72])
	by mail.openembedded.org (Postfix) with ESMTP id 0D37460721
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jan 2016 09:18:56 +0000 (UTC)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.mail.online.nl (Postfix) with ESMTP id 6C0171A002E;
	Fri,  1 Jan 2016 10:18:55 +0100 (CET)
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <568533E5.4000105@topic.nl> <5685347E.5080003@topic.nl>
	<56856023.5060407@linux.intel.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <5686447F.60200@topic.nl>
Date: Fri, 1 Jan 2016 10:18:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <56856023.5060407@linux.intel.com>
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
X-List-Received-Date: Fri, 01 Jan 2016 09:18:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 31-12-15 18:04, Leonardo Sandoval wrote:
>
>
> On 12/31/2015 07:58 AM, Mike Looijmans wrote:
>> On 31-12-15 14:55, Mike Looijmans wrote:
>>> When running a "menuconfig" (or any other task that needs a terminal),
>>> bitbake just "stops" and doesn't show any terminal.
>>>
>>> I'm using the current master branch of everything, on Ubuntu 15.
>>>
>>> When running with "-D" I can see the following log:
>>>
>>> DEBUG: Executing task do_menuconfig
>>> DEBUG: Attempting to spawn terminal "custom"
>>> DEBUG: No custom terminal (OE_TERMINAL_CUSTOMCMD) set
>>> DEBUG: Attempting to spawn terminal "tmux-running"
>>> DEBUG: Attempting to spawn terminal "tmux-new-window"
>>> DEBUG: Attempting to spawn terminal "gnome"
>>>
>>> But nothing happens from that point.
>>
>> Extra info: apparently it spawns a process:
>>
>> /usr/bin/python3 /usr/bin/gnome-terminal --version
>>
> gnome-terminal is a pain... there are some checks base on the version
> and based on that certain parameters are set. which g-t version are you
> using?

$ gnome-terminal --version
GNOME Terminal 3.14.2

>> If I kill that process, the menuconfig magically appears.

Digging into the source code, I saw that "gnome-terminal --version" is 
only being called to determine if the "--disable-factory" option should 
be passed to it. For some reason, in OE that call "hangs", I suspect 
because of the way the environment and pipes are laid out at that point.

If I just run 'gnome-terminal -t hello --disable-factory -x sh' I don't 
get any errors and it works just fine. To me it looks like the whole 
version check could be removed and always pass "--disable-factory".

Happy New Year!

-- 
Mike Looijmans

