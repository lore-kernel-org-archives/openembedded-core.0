Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S9Hq7-0000KL-H4
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Mar 2012 16:16:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7B109315A320;
	Sun, 18 Mar 2012 16:07:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id nAI1WmYZ83Oe; Sun, 18 Mar 2012 16:07:16 +0100 (CET)
Received: from [172.22.22.61] (drms-590ec7ee.pool.mediaWays.net
	[89.14.199.238])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id ED2F43159AEE;
	Sun, 18 Mar 2012 16:07:15 +0100 (CET)
Message-ID: <4F65FA23.7050309@opendreambox.org>
Date: Sun, 18 Mar 2012 16:07:15 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<665936693.QMobc8r8oH@helios> <4F62875C.60303@opendreambox.org>
	<1481997.vT15FBqihJ@helios>
In-Reply-To: <1481997.vT15FBqihJ@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] scripts/bitbake: ensure user is in build directory
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
X-List-Received-Date: Sun, 18 Mar 2012 15:16:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 16.03.2012 11:56, Paul Eggleton wrote:
> On Friday 16 March 2012 01:20:44 Andreas Oberritter wrote:
>> Sorry, I messed up some details. In fact, pseudo-native doesn't get
>> rebuilt, but bitbake pseudo-native still gets executed for every
>> machine, unless $BUILDDIR/pseudodone is present and contains
>> PSEUDOBINDIR. This just wastes time and confuses users who receive a
>> message saying "Pseudo is not present but is required, building this
>> first before the main build".
> 
> It takes a small amount of time just once. However if this is really an issue 
> perhaps we could address it directly rather than hacking around it?
> 
>>>> BUILDDIR doesn't seem to have any other use than pointing to the
>>>> 'pseudodone' file. I don't understand why it's required to run bitbake
>>>> from there.
>>>
>>> Well, it's required that bitbake is run from the build directory and when
>>> you use the setup script as intended that's where BUILDDIR points to. I
>>> hadn't anticipated that anyone would be changing BUILDDIR to point to
>>> anything other than the build dir, however I don't really think it's a
>>> good idea to support that.
>>
>> That's because BUILDDIR has no meaning outside oe-core's setup scripts.
>> In scripts/bitbake, BUILDDIR would better be called PSEUDODONEDIR or
>> similar, because that's what the variable really means in this context
> 
> The naming is such that it should point to the build directory because that's 
> where pseudodone is meant to be written. I think when it was introduced there 
> was an idea that it might be useful in other contexts, thus the naming.

What is the reason for storing 'pseudodone' inside BUILDDIR? Wouldn't it
better be stored inside TMPDIR by default? Isn't there any way to get
rid of pseudodone completely?

>> In order to verify that scripts/bitbake is called from the build
>> directory, you could as well just check whether $PWD/conf/local.conf exists.
> 
> Unfortunately it's not that simple. bitbake.conf pulls in local.conf using 
> "include" and not "require", thus it doesn't actually have to exist anywhere.

In fact it is that simple, because If local.conf doesn't exist,
oe-setup-builddir creates it.

>> I'm not using oe-core's scripts, because they make assumptions about the
>> directory layout that don't fit my project's needs. I think they are
>> overly complex
> 
> Could you perhaps elaborate on what needs those scripts are not fulfilling?

1.) OE-core is not my top-level directory. It's included as a git
submodule. it must not contain any data not fetched from the OE-core
repository (i.e. no bitbake tree, no build dirs).

2.) Switching between build directories must not involve changing the
environment.

>> and they display texts that seem to suit yocto's needs but at least not
>> mine.
> 
> We print these messages so that people know what to do and where to find 
> further information. I don't think that's unreasonable. However if you have 
> suggestions on how we might improve those messages or allow them to be 
> customised if necessary, we could look at changing them.

I'd like to display none of those messages to my users. We have our own
help texts that are specific to our distribution and configuration.

Our setup script is based on GNU make and uses make's dependency
tracking. It creates local.conf on its own. I don't want any other
script to do that.

I really don't want to be forced to use those OE-core scripts, if a
two-line script is sufficient to fulfil my needs. This two-line script
just sets up the path to bitbake and sets the location of 'pseudodone'
(which already sucks - the path to bitbake should be sufficient alone).

Regards,
Andreas


