Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S8L36-0000Vz-B7
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:29:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 7C571315A21B;
	Fri, 16 Mar 2012 01:20:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id WX1rDkz0jqAd; Fri, 16 Mar 2012 01:20:46 +0100 (CET)
Received: from [172.22.22.61] (drms-590ec311.pool.mediaWays.net [89.14.195.17])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0800B315A219;
	Fri, 16 Mar 2012 01:20:45 +0100 (CET)
Message-ID: <4F62875C.60303@opendreambox.org>
Date: Fri, 16 Mar 2012 01:20:44 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<e4d001f8c6f8945c8c70c2558ad5f9e1fd85dfad.1331685330.git.paul.eggleton@linux.intel.com>
	<4F613827.3040705@opendreambox.org> <665936693.QMobc8r8oH@helios>
In-Reply-To: <665936693.QMobc8r8oH@helios>
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
X-List-Received-Date: Fri, 16 Mar 2012 00:29:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 16.03.2012 00:09, Paul Eggleton wrote:
> On Thursday 15 March 2012 01:30:31 Andreas Oberritter wrote:
>> On 14.03.2012 01:36, Paul Eggleton wrote:
>>> If the user is in any directory other than $BUILDDIR when the bitbake
>>> wrapper script is run, then show an error an exit.
>>
>> this patch broke my setup.
> 
> Ah, sorry about that.
>  
>> My $BUILDDIR points to tmp, so that pseudo doesn't get rebuilt for every
>> machine. I have a shared tmp for many machines.
> 
> So a couple of things:
> 
> 1) Unless I'm missing something you can share the same TMPDIR between multiple 
> build directories to get the same result.
>  
> 2) pseudo is a native package. It shouldn't be rebuilt when changing MACHINE. 
> In fact I just verified by creating a different build directory with only 
> MACHINE changed in the config, it is not rebuilt.

Sorry, I messed up some details. In fact, pseudo-native doesn't get
rebuilt, but bitbake pseudo-native still gets executed for every
machine, unless $BUILDDIR/pseudodone is present and contains
PSEUDOBINDIR. This just wastes time and confuses users who receive a
message saying "Pseudo is not present but is required, building this
first before the main build".

>> BUILDDIR doesn't seem to have any other use than pointing to the
>> 'pseudodone' file. I don't understand why it's required to run bitbake
>> from there.
> 
> Well, it's required that bitbake is run from the build directory and when you 
> use the setup script as intended that's where BUILDDIR points to. I hadn't 
> anticipated that anyone would be changing BUILDDIR to point to anything other 
> than the build dir, however I don't really think it's a good idea to support 
> that.

That's because BUILDDIR has no meaning outside oe-core's setup scripts.
In scripts/bitbake, BUILDDIR would better be called PSEUDODONEDIR or
similar, because that's what the variable really means in this context
[1]. If I had a choice to override a more suitably named variable I
certainly would do that. ;-)

In order to verify that scripts/bitbake is called from the build
directory, you could as well just check whether $PWD/conf/local.conf exists.

I'm not using oe-core's scripts, because they make assumptions about the
directory layout that don't fit my project's needs. I think they are
overly complex and they display texts that seem to suit yocto's needs
but at least not mine.

Regards,
Andreas

[1]
$ grep BUILDDIR scripts/bitbake
if [ $needpseudo = "1" ] && [ -e "$BUILDDIR/pseudodone" ]; then
    PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`
    echo $PSEUDOBINDIR > $BUILDDIR/pseudodone
    PSEUDOBINDIR=`cat $BUILDDIR/pseudodone`


