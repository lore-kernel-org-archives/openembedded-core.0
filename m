Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Sm7BP-0002KY-8M
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 19:46:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q63HZa7B024427
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jul 2012 10:35:36 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 3 Jul 2012 10:35:35 -0700
Message-ID: <4FF32D67.7020309@windriver.com>
Date: Tue, 3 Jul 2012 12:35:35 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4FF320DD.8090301@palm.com> <4FF32550.6060606@linux.intel.com>
	<4FF329B2.1040101@palm.com>
In-Reply-To: <4FF329B2.1040101@palm.com>
Subject: Re: local.conf & bblayers.conf changes...
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
X-List-Received-Date: Tue, 03 Jul 2012 17:46:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/12 12:19 PM, Rich Pixley wrote:
> On 7/3/12 10:01 , Saul Wold wrote:
>> On 07/03/2012 09:42 AM, Rich Pixley wrote:
>>> Where can I find a description of the recent changes and what I need to
>>> do to bring my files back up to current?
>>>
>>> What were the incompatible changes?
>>>
>> For bblayers.conf, we bumped the version becase we moved the BBPATH
>> initial setting into the bblayers.conf to ensure we dont accidently
>> pickup things in . because of the way a :: was being parsed.  See
>> this commit
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=5e3a61b40b7b697d83b41e7e247cd1f94eb7673c
>>
>> Not sure what you mean about local.conf, since I am not sure of your
>> starting point.
> Ok, so I *liked* having BBPATH be relative.  The alternative, using
> absolute pathnames, means that you have to bolt absolute path names into
> all of your binaries, all of your debug symbols, and all of your build
> configurations.  This means that your binary sizes are greater, that
> debug symbols are significantly greater and more difficult to configure
> properly in your debuger, and that working directories cannot be moved
> around or renamed without needing to manually force full rebuilds.  It
> also means that some forms of file system checkpointing can't be used
> since you can't rely on the build to be in the same place on the file
> system every build.

BBPATH being relative doesn't affect what ends up in debug symbols, etc.

The BBPATH needs to be absolute, within the scope of a single loaded session to 
avoid randomly included items, primarily from the CWD.  This prevents 
non-repeatable builds.

In a layer, the typical BBPATH is something like:

BBPATH := "${LAYERDIR}:${BBPATH}"

LAYERDIR is always the path to the layer being processed at any given time... 
so if a layer also provides addition scripts you can do:

# Add scripts to PATH
PATH := "${PATH}:${LAYERDIR}/scripts"


As for the debug items, the system handles all of the debug symbols for you. 
All target symbols are referenced from the -root- of the target filesystem.  If 
this is not happening in your builds, then you've disabled the debug symbol 
processing -- or you found a bug in the system...  On the target side, debugging 
on the target that is, everything should 'just work' with no manual settings.

On a remote debug, you just need to tell the system where the relative path is 
to the root of the filesystem you are debugging, gdb should then be able to add 
the references to the associated sources and .debug split items.

This is all unchanged behavior for oe-core from when it was made oe-core to present.

> I'll try to roll with the current plan, though.
>
> In the current arrangement, I'm getting confusing messages about not
> setting MACHINE, even though MACHINE is set in my local.conf.  I'm
> guessing that means that the pathing is busted and it's not finding my
> local.conf.  How is the initial configuration file found?  And which

If it says MACHINE isn't configured, then you are lacking a proper BSP/machine 
configuration file.

There are a couple of checks, but in the end they resolve down to checking that 
TUNE_ARCH, TARGET_OS, and TUNE_PKGARCH exit and are reasonable, as well as 
conf/machine/${MACHINE}.conf can be loaded.

Any of the above items not found or not configured properly indicate MACHINE 
isn't defined, or the conf/machine/${MACHINE}.conf doesn't exist -- or is 
incorrectly configured.

> configuration file is initial?  Is that "./conf/bblayers.conf"?  And if
> so, does this mean that I need to put my other directory assignments
> like TOPDIR and TMPDIR in bblayers.conf as well?  And if so, then what's
> the logical distinction between bblayers.conf and local.conf at this
> point if build policy needs to go into bblayers.conf?

bblayers shouldn't affect your machine files, other then a layer may contain a 
conf/machine/...conf file.  The BBPATH setting of ${LAYERDIR} allows this 
directory to be automatically scanned when requesting a conf file.

--Mark

> --rich
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>




