Received: from outbound-relay8.guardedhost.com (outbound-relay8.guardedhost.com [216.239.133.208])
 by mx.groups.io with SMTP id smtpd.web11.4431.1607553570371083367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 14:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: snowmoose.com, ip: 216.239.133.208, mailfrom: alanp@snowmoose.com)
Received: from mail.guardedhost.com (mx04.guardedhost.com [IPv6:2607:fe90:1:1::55:1])
	by outbound-relay5.guardedhost.com (Postfix) with ESMTP id 4CrsRd0LGVz10sC;
	Wed,  9 Dec 2020 22:39:24 +0000 (GMT)
Received: from Alans-MacBook-Pro.local (c-73-254-147-133.hsd1.wa.comcast.net [73.254.147.133])
	(Authenticated sender: alanp@snowmoose.com)
	by mail.guardedhost.com (Postfix) with ESMTPA id 4CrsRc18RQz30LC;
	Wed,  9 Dec 2020 22:39:24 +0000 (GMT)
Subject: Re: [OE-core] [PATCH v2 1/2] iproute2: install tools to mirror install under Debian/Ubuntu
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20201205082246.14954-1-alanp@snowmoose.com>
 <bb38bb9111dbc5e0a2c3c47256d2bead31b70316.camel@linuxfoundation.org>
From: "Alan Perry" <alanp@snowmoose.com>
Message-ID: <83ae3fae-37a5-e32d-5084-e1a20d97b13d@snowmoose.com>
Date: Wed, 9 Dec 2020 14:39:22 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <bb38bb9111dbc5e0a2c3c47256d2bead31b70316.camel@linuxfoundation.org>
Authentication-Results: mail.guardedhost.com;auth=pass
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse-Id: 636371E0-3A6F-11EB-9A84-F94F6C6C9F7D
X-Virus-Scanned: clamav-milter 0.102.2 at tev-mx4.omnis.com
X-Virus-Status: Clean
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/7/20 1:49 PM, Richard Purdie wrote:
> On Sat, 2020-12-05 at 08:22 +0000, Alan Perry wrote:
>> Many scripts exist that expect the iproute2 tools to be found in
>> the same directories where they are found in Debian or Ubuntu.
>> For the iproute2 tools included in the iproute2 recipe, move
>> them to those directories or create links there.. Also, add
>> bash-completion files as is done by Debian and Ubuntu.
>>
>> Signed-off-by: Alan Perry <alanp@snowmoose.com>
>> ---
>>   .../iproute2/iproute2.inc                     | 23 +++++++++++++++++--
>>   1 file changed, 21 insertions(+), 2 deletions(-)
> The direction in the patch is worrying me a little.
>
> There is a bash-completion class which splits completion files into
> their own package, most "embedded" users don't want them in the main
> packages. This patch does something different to what has been done
> elsewhere.
>
> Secondly, I'm also not sure that just because debian does something we
> should therefore do it, I'm not convinced that scripts should be
> hardcoding path assumptions about these tools. IF this is such a
> universal need, why doesn't upstream change the default installation
> locations? Has it been discussed?
>
> I'd expect there to be opinions on this topic but I'm not seeing much
> discussion. I suspect if if does merge there would be push back later
> though.
>
> Also, the duplication between bin and sbin for ip is not particularly
> good practise.
>
Thanks for your comments. I apologize for the delay in responding, but I 
needed to do some research first.

I will look at the bash-completion class and make the appropriate 
changes there.

As far as the installation path changes, I discussed why those aren't 
the defaults with the iproute2 upstream maintainer. The idea is that the 
upstream puts everything in /sbin and where is appropriate to install 
them for a given distro is left as an exercise for that distro.

The iproute2 recipe is doing that exercise for poky. So, where is the 
correct place to install these tools on poky? I'd argue that they should 
go in the expected directories for Unix-y OSes. Someone at Debian went 
through that analysis and put them where they put them and those mostly 
seem like reasonable places to me. It is also where users coming to 
poky-based systems will likely expecting to find them.

As far as duplicating ip in bin and sbin, I agree that it isn't good 
practice. Having it in both doesn't seem necessary to me.

alan

