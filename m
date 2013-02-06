Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U2swK-0007y2-KJ
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 01:32:41 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 16:16:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,610,1355126400"; d="scan'208";a="281438579"
Received: from unknown (HELO envy.home) ([10.255.12.177])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 16:16:48 -0800
Message-ID: <5111A0F0.1050503@linux.intel.com>
Date: Tue, 05 Feb 2013 16:16:48 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1360104547.git.dvhart@linux.intel.com>
	<8bf58d16654191479ceb9e3863b9f0d9ae629af7.1360104547.git.dvhart@linux.intel.com>
	<CAP9ODKqbiwpfwfFFXHKB7h0jsTgrtBgExYtydq=SdmyxjjBBMw@mail.gmail.com>
	<51119E0A.7030106@linux.intel.com>
	<CAP9ODKo4YhqUe=GmaQ2LPBjVCW2u6jmox2qrB5JUJRYmdqHwiw@mail.gmail.com>
In-Reply-To: <CAP9ODKo4YhqUe=GmaQ2LPBjVCW2u6jmox2qrB5JUJRYmdqHwiw@mail.gmail.com>
X-Enigmail-Version: 1.5
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] oe-git-proxy: Add a new comprehensive git proxy script
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
X-List-Received-Date: Wed, 06 Feb 2013 00:32:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/05/2013 04:09 PM, Otavio Salvador wrote:
> On Tue, Feb 5, 2013 at 10:04 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>> On 02/05/2013 03:51 PM, Otavio Salvador wrote:
>>> On Tue, Feb 5, 2013 at 8:52 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>>> oe-git-proxy.sh is a simple tool to be used via GIT_PROXY_COMMAND. It
>>>> uses BSD netcat to make SOCKS5 or HTTPS proxy connections. It uses
>>>> ALL_PROXY to determine the proxy server, protocol, and port. It uses
>>>> NO_PROXY to skip using the proxy for a comma delimited list of hosts,
>>>> host globs (*.example.com), IPs, or CIDR masks (192.168.1.0/24). It is
>>>> known to work with both bash and dash shells.
>>>>
>>>> V2: Implement recommendations by Enrico Scholz:
>>>>     o Use exec for the nc calls
>>>>     o Use "$@" instead of $* to avoid quoting issues inherent with $*
>>>>     o Use bash explicitly and simplify some of the string manipulations
>>>>     Also:
>>>>     o Drop the .sh in the name per Otavio Salvador
>>>>     o Remove a stray debug statement
>>>>
>>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>>> Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>>>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>>>> ---
>>>>  scripts/oe-git-proxy |  124 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>  1 files changed, 124 insertions(+), 0 deletions(-)
>>>>  create mode 100755 scripts/oe-git-proxy
>>>>
>>>> diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
>>>> new file mode 100755
>>>> index 0000000..4f1871a
>>>> --- /dev/null
>>>> +++ b/scripts/oe-git-proxy
>>>> @@ -0,0 +1,124 @@
>>>> +#!/bin/bash
>>>> +
>>>> +# oe-git-proxy.sh is a simple tool to be via GIT_PROXY_COMMAND. It uses BSD netcat
>>>
>>> Please fix the script name.
>>>
>>>> +# to make SOCKS5 or HTTPS proxy connections. It uses ALL_PROXY to determine the
>>>> +# proxy server, protocol, and port. It uses NO_PROXY to skip using the proxy for
>>>> +# a comma delimited list of hosts, host globs (*.example.com), IPs, or CIDR masks
>>>> +# (192.168.1.0/24). It is known to work with both bash and dash shells.
>>>> +#
>>>> +# BSD netcat is provided by netcat-openbsd on Ubuntu and nc on Fedora.
>>>> +#
>>>> +# Example ALL_PROXY values:
>>>> +# ALL_PROXY=socks://socks.example.com:1080
>>>> +# ALL_PROXY=https://proxy.example.com:8080
>>>> +#
>>>> +# Copyright (c) 2013, Intel Corporation.
>>>> +# All rights reserved.
>>>
>>> And please add a clear license here.
>>
>>
>> Both fixed in the contrib branch. GPL license blurb added.
>>
>> Have you happened to have tested the script?
>>
>> Thanks Otavio.
>
> No; not yet.
>
> I am wondering if the code wouldn't be easier to read if done in
> Python ... the ipv4 stuff is UGLY and hard to follow ... I understand
> it is very simple script but maybe Python would be the right tool for
> it. What do you think?

I had originally written the IP matching stuff in C, but converted to
shell to
keep this script self contained and easily deployable. The proper way to
do this
with python would require the use of external modules, which may or may
not be
installed on the target system. Although I suppose even just replacing this
script and all the math it does in python might be an improvement.
However, For
the purposes of a one-stop-shop example git proxy script for oe-core, I
think
bash still serves us best here. Otherwise, yes, I completely agree it's
horrible
to look at :-)


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


