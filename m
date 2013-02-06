Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2spE-0007pA-9o
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 01:25:20 +0100
Received: by mail-oa0-f46.google.com with SMTP id k1so907279oag.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 16:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=tju2UZQMIKlmiy9KhoFZlLWGBVswUTFj87mM6adeCso=;
	b=t9hiE9CYR/FzCcGtKET6BCdZGetheRA9JwdpzVgS3vcoTCqKt1QIboj2/dVcxJmBtP
	rFrYgh+qmoT02PWIu8uHwc85Wba6tiQEU+z8+M1OerxlyikfJXjNCdM7HNMUzc96NXxW
	trw5tS/2EtFYE1pjaqDORqdnnFKht70yToda19a7iMVQbkwpAC7CAyxeTrSdwfiXhfHF
	p4ftjh+4rYUZ0P10347hYu5k0JDAYY4LUzI+p2nQVhy+uYOyqpVTPtP6DBbYHstBE7IV
	Ebr65mkQ2+S0ltZBD39yJmFjXYBtRmmmdMuwHIC+USQ5kpn6FqTWCu6lhYb8b/eyPTC6
	/W7w==
MIME-Version: 1.0
X-Received: by 10.60.32.84 with SMTP id g20mr2839108oei.42.1360109369596; Tue,
	05 Feb 2013 16:09:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 5 Feb 2013 16:09:29 -0800 (PST)
In-Reply-To: <51119E0A.7030106@linux.intel.com>
References: <cover.1360104547.git.dvhart@linux.intel.com>
	<8bf58d16654191479ceb9e3863b9f0d9ae629af7.1360104547.git.dvhart@linux.intel.com>
	<CAP9ODKqbiwpfwfFFXHKB7h0jsTgrtBgExYtydq=SdmyxjjBBMw@mail.gmail.com>
	<51119E0A.7030106@linux.intel.com>
Date: Tue, 5 Feb 2013 22:09:29 -0200
X-Google-Sender-Auth: CZtf2yA5T7Z9GoImmR5GhBcdkz8
Message-ID: <CAP9ODKo4YhqUe=GmaQ2LPBjVCW2u6jmox2qrB5JUJRYmdqHwiw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
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
X-List-Received-Date: Wed, 06 Feb 2013 00:25:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 5, 2013 at 10:04 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> On 02/05/2013 03:51 PM, Otavio Salvador wrote:
>> On Tue, Feb 5, 2013 at 8:52 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>> oe-git-proxy.sh is a simple tool to be used via GIT_PROXY_COMMAND. It
>>> uses BSD netcat to make SOCKS5 or HTTPS proxy connections. It uses
>>> ALL_PROXY to determine the proxy server, protocol, and port. It uses
>>> NO_PROXY to skip using the proxy for a comma delimited list of hosts,
>>> host globs (*.example.com), IPs, or CIDR masks (192.168.1.0/24). It is
>>> known to work with both bash and dash shells.
>>>
>>> V2: Implement recommendations by Enrico Scholz:
>>>     o Use exec for the nc calls
>>>     o Use "$@" instead of $* to avoid quoting issues inherent with $*
>>>     o Use bash explicitly and simplify some of the string manipulations
>>>     Also:
>>>     o Drop the .sh in the name per Otavio Salvador
>>>     o Remove a stray debug statement
>>>
>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>> Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>>> ---
>>>  scripts/oe-git-proxy |  124 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>>  1 files changed, 124 insertions(+), 0 deletions(-)
>>>  create mode 100755 scripts/oe-git-proxy
>>>
>>> diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
>>> new file mode 100755
>>> index 0000000..4f1871a
>>> --- /dev/null
>>> +++ b/scripts/oe-git-proxy
>>> @@ -0,0 +1,124 @@
>>> +#!/bin/bash
>>> +
>>> +# oe-git-proxy.sh is a simple tool to be via GIT_PROXY_COMMAND. It uses BSD netcat
>>
>> Please fix the script name.
>>
>>> +# to make SOCKS5 or HTTPS proxy connections. It uses ALL_PROXY to determine the
>>> +# proxy server, protocol, and port. It uses NO_PROXY to skip using the proxy for
>>> +# a comma delimited list of hosts, host globs (*.example.com), IPs, or CIDR masks
>>> +# (192.168.1.0/24). It is known to work with both bash and dash shells.
>>> +#
>>> +# BSD netcat is provided by netcat-openbsd on Ubuntu and nc on Fedora.
>>> +#
>>> +# Example ALL_PROXY values:
>>> +# ALL_PROXY=socks://socks.example.com:1080
>>> +# ALL_PROXY=https://proxy.example.com:8080
>>> +#
>>> +# Copyright (c) 2013, Intel Corporation.
>>> +# All rights reserved.
>>
>> And please add a clear license here.
>
>
> Both fixed in the contrib branch. GPL license blurb added.
>
> Have you happened to have tested the script?
>
> Thanks Otavio.

No; not yet.

I am wondering if the code wouldn't be easier to read if done in
Python ... the ipv4 stuff is UGLY and hard to follow ... I understand
it is very simple script but maybe Python would be the right tool for
it. What do you think?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


