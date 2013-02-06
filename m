Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U2skb-0007dN-9b
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 01:20:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Feb 2013 16:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,610,1355126400"; d="scan'208";a="253089611"
Received: from unknown (HELO envy.home) ([10.255.12.177])
	by azsmga001.ch.intel.com with ESMTP; 05 Feb 2013 16:04:26 -0800
Message-ID: <51119E0A.7030106@linux.intel.com>
Date: Tue, 05 Feb 2013 16:04:26 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1360104547.git.dvhart@linux.intel.com>
	<8bf58d16654191479ceb9e3863b9f0d9ae629af7.1360104547.git.dvhart@linux.intel.com>
	<CAP9ODKqbiwpfwfFFXHKB7h0jsTgrtBgExYtydq=SdmyxjjBBMw@mail.gmail.com>
In-Reply-To: <CAP9ODKqbiwpfwfFFXHKB7h0jsTgrtBgExYtydq=SdmyxjjBBMw@mail.gmail.com>
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
X-List-Received-Date: Wed, 06 Feb 2013 00:20:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/05/2013 03:51 PM, Otavio Salvador wrote:
> On Tue, Feb 5, 2013 at 8:52 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>> oe-git-proxy.sh is a simple tool to be used via GIT_PROXY_COMMAND. It
>> uses BSD netcat to make SOCKS5 or HTTPS proxy connections. It uses
>> ALL_PROXY to determine the proxy server, protocol, and port. It uses
>> NO_PROXY to skip using the proxy for a comma delimited list of hosts,
>> host globs (*.example.com), IPs, or CIDR masks (192.168.1.0/24). It is
>> known to work with both bash and dash shells.
>>
>> V2: Implement recommendations by Enrico Scholz:
>>     o Use exec for the nc calls
>>     o Use "$@" instead of $* to avoid quoting issues inherent with $*
>>     o Use bash explicitly and simplify some of the string manipulations
>>     Also:
>>     o Drop the .sh in the name per Otavio Salvador
>>     o Remove a stray debug statement
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  scripts/oe-git-proxy |  124 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 files changed, 124 insertions(+), 0 deletions(-)
>>  create mode 100755 scripts/oe-git-proxy
>>
>> diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
>> new file mode 100755
>> index 0000000..4f1871a
>> --- /dev/null
>> +++ b/scripts/oe-git-proxy
>> @@ -0,0 +1,124 @@
>> +#!/bin/bash
>> +
>> +# oe-git-proxy.sh is a simple tool to be via GIT_PROXY_COMMAND. It uses BSD netcat
> 
> Please fix the script name.
> 
>> +# to make SOCKS5 or HTTPS proxy connections. It uses ALL_PROXY to determine the
>> +# proxy server, protocol, and port. It uses NO_PROXY to skip using the proxy for
>> +# a comma delimited list of hosts, host globs (*.example.com), IPs, or CIDR masks
>> +# (192.168.1.0/24). It is known to work with both bash and dash shells.
>> +#
>> +# BSD netcat is provided by netcat-openbsd on Ubuntu and nc on Fedora.
>> +#
>> +# Example ALL_PROXY values:
>> +# ALL_PROXY=socks://socks.example.com:1080
>> +# ALL_PROXY=https://proxy.example.com:8080
>> +#
>> +# Copyright (c) 2013, Intel Corporation.
>> +# All rights reserved.
> 
> And please add a clear license here.


Both fixed in the contrib branch. GPL license blurb added.

Have you happened to have tested the script?

Thanks Otavio.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


