Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=524cf9d53=rich.pixley@palm.com>)
	id 1Sm6wB-000218-4y for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 19:30:55 +0200
X-IronPort-AV: E=Sophos;i="4.77,517,1336374000"; d="scan'208";a="14516073"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP; 03 Jul 2012 10:19:46 -0700
Received: from fuji.noir.com ([10.100.2.10])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id q63HJk0e030963;
	Tue, 3 Jul 2012 10:19:46 -0700
Message-ID: <4FF329B2.1040101@palm.com>
Date: Tue, 03 Jul 2012 10:19:46 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <4FF320DD.8090301@palm.com> <4FF32550.6060606@linux.intel.com>
In-Reply-To: <4FF32550.6060606@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 03 Jul 2012 17:30:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/12 10:01 , Saul Wold wrote:
> On 07/03/2012 09:42 AM, Rich Pixley wrote:
>> Where can I find a description of the recent changes and what I need to
>> do to bring my files back up to current?
>>
>> What were the incompatible changes?
>>
> For bblayers.conf, we bumped the version becase we moved the BBPATH
> initial setting into the bblayers.conf to ensure we dont accidently
> pickup things in . because of the way a :: was being parsed.  See
> this commit
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=5e3a61b40b7b697d83b41e7e247cd1f94eb7673c
>
> Not sure what you mean about local.conf, since I am not sure of your
> starting point.
Ok, so I *liked* having BBPATH be relative.  The alternative, using 
absolute pathnames, means that you have to bolt absolute path names into 
all of your binaries, all of your debug symbols, and all of your build 
configurations.  This means that your binary sizes are greater, that 
debug symbols are significantly greater and more difficult to configure 
properly in your debuger, and that working directories cannot be moved 
around or renamed without needing to manually force full rebuilds.  It 
also means that some forms of file system checkpointing can't be used 
since you can't rely on the build to be in the same place on the file 
system every build.

I'll try to roll with the current plan, though.

In the current arrangement, I'm getting confusing messages about not 
setting MACHINE, even though MACHINE is set in my local.conf.  I'm 
guessing that means that the pathing is busted and it's not finding my 
local.conf.  How is the initial configuration file found?  And which 
configuration file is initial?  Is that "./conf/bblayers.conf"?  And if 
so, does this mean that I need to put my other directory assignments 
like TOPDIR and TMPDIR in bblayers.conf as well?  And if so, then what's 
the logical distinction between bblayers.conf and local.conf at this 
point if build policy needs to go into bblayers.conf?

--rich


