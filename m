Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel2.indieserve.net (cpanel2.indieserve.net [199.212.143.6])
	by mail.openembedded.org (Postfix) with ESMTP id 2392C78519
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 11:15:22 +0000 (UTC)
Received: from [::1] (port=52440 helo=cpanel2.indieserve.net)
	by cpanel2.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1dc8fU-0006gZ-1r; Mon, 31 Jul 2017 07:15:24 -0400
Received: from 158.116.144.29 ([158.116.144.29]) by crashcourse.ca (Horde
	Framework) with HTTPS; Mon, 31 Jul 2017 07:15:23 -0400
Date: Mon, 31 Jul 2017 07:15:23 -0400
Message-ID: <20170731071523.Horde.D4ds4jNhxwzGV9es7N9Nh3V@crashcourse.ca>
From: rpjday@crashcourse.ca
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20170731064114.Horde.DvVIF0q0YvJ5HlL1pcjzGe4@crashcourse.ca>
	<ca8a860d-0894-e604-6108-359ccd094e72@linux.intel.com>
	<1501498850.18633.1.camel@linuxfoundation.org>
In-Reply-To: <1501498850.18633.1.camel@linuxfoundation.org>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel2.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel2.indieserve.net: authenticated_id:
	rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel2.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: worth adding a "git"-versioned of i2c-tools to oe-core?
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
X-List-Received-Date: Mon, 31 Jul 2017 11:15:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline
Content-Transfer-Encoding: 8bit


Quoting Richard Purdie <richard.purdie@linuxfoundation.org>:

> On Mon, 2017-07-31 at 13:41 +0300, Alexander Kanavin wrote:
>> On 07/31/2017 01:41 PM, rpjday@crashcourse.ca wrote:
>> >
>> >
>> >    given that some significant changes have been made to i2c-tools
>> > since
>> > version 3.1.2, is it worth adding a git-versioned recipe of that
>> > to 
>> > oe-core,
>> > and using DEFAULT_PREFERENCE to force people to select it if they
>> > want it?
>> > in particular, the code base has been restructured, and a new
>> > utility,
>> > "i2ctransfer", has been added.
>> It's better to ask the upstream to make a new release.
>>
>> We've had dual git/release recipes in the past, and they were all an 
>> utter failure. In the sense, that only one version of the recipe was 
>> maintained, and the other was completely neglected.
>
> Going forward we may accept patches using this instead:
>
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/devupstream.bbclass
>
> Cheers,
>
> Richard

   well, here's a possible conundrum ... in that same package (i2c-tools),
there appears to be an *obvious* flaw in that the "eeprog" utility uses a
sleep that is far too short for proper operation, as described here:

https://www.toradex.com/community/questions/10243/write-issue-with-eeprog-in-eeprom.html

there is a link to a patch on that page that simply cranks up a few sleep
calls from 10usec to 5msec, which apparently solves the problem. i've been
involved in a discussion on the i2c-tools mailing list about this very
issue after i tripped over it, but there seems to be little enthusiasm on
that list for "fixing" this -- i was told that people use the kernel driver
instead and access via /sys rather than calling "eeprog".

   so, from my perspective, this should definitely be fixed so that "eeprog"
functions properly, but it's not clear upstream is all that interested in it.
what would the protocol be here?

rday



