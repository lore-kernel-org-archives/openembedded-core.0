Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C6D6E6F8A2;
	Thu,  3 Apr 2014 07:23:22 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s337NGE5012540; Thu, 3 Apr 2014 08:23:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wluWgAFFYJvw; Thu,  3 Apr 2014 08:23:16 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s337NBWX012536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 3 Apr 2014 08:23:13 +0100
Message-ID: <1396509786.2910.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 03 Apr 2014 08:23:06 +0100
In-Reply-To: <20140402170718.GC2132@jama>
References: <20140330090302.B0FBA50478@opal> <20140330113031.GF2428@jama>
	<53382C05.70506@windriver.com> <20140331215105.GI2425@jama>
	<20140402170718.GC2132@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : linux-yocto/3.10: fix drm build failure
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
X-List-Received-Date: Thu, 03 Apr 2014 07:23:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-04-02 at 19:07 +0200, Martin Jansa wrote:
> On Mon, Mar 31, 2014 at 11:51:05PM +0200, Martin Jansa wrote:
> > > I can confirm that that is the right revision. I wonder what the fetcher
> > > is doing, or is something in the infrastructure caching and older
> > > revision ?
> > 
> > Sorry for noise, it was after all our mirror not getting updates
> > anymore, fetching it manually works.
> 
> I've noticed one more thing:
> 
> When fetch fails, the checkout in downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git
> is removed and then git cloned again:
> 
> This is what I did:
> 
> # check that checkout is there:
> OE qemux86@ ~/build/oe-core $ ll downloads/git2/*linux-yocto-3.14*
> -rw-r--r-- 1 bitbake bitbake    0 Apr  1 14:38 downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git.done
> 
> downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git:
> total 156
> drwxr-xr-x   6 bitbake bitbake  4096 Apr  1 14:38 ./
> drwxr-xr-x 210 bitbake bitbake 36864 Apr  2 17:29 ../
> -rw-r--r--   1 bitbake bitbake 42799 Apr  1 14:38 FETCH_HEAD
> -rw-r--r--   1 bitbake bitbake    23 Mar 29 21:18 HEAD
> -rw-r--r--   1 bitbake bitbake   163 Apr  1 14:38 config
> -rw-r--r--   1 bitbake bitbake    73 Mar 29 20:57 description
> drwxr-xr-x   2 bitbake bitbake  4096 Mar 29 20:57 hooks/
> drwxr-xr-x   2 bitbake bitbake  4096 Mar 29 20:57 info/
> drwxr-xr-x   4 bitbake bitbake  4096 Mar 29 20:57 objects/
> -rw-r--r--   1 bitbake bitbake 40375 Mar 29 21:18 packed-refs
> drwxr-xr-x   4 bitbake bitbake  4096 Mar 29 20:57 refs/
> 
> # create backup just in case:
> OE qemux86@ ~/build/oe-core $ cp -ra downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git-backup 
> 
> # put wrong SRCREV
> OE qemux86@ ~/build/oe-core $ vi openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> 
> # try to build it:
> OE qemux86@ ~/build/oe-core $ bitbake linux-yocto
> NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 40335, PID: 8726
> Loading cache: 100% |#########################################################################################################################| ETA:  00:00:00...
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: Failed to fetch URL git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=standard/common-pc/base,meta;name=machine,meta, attempting MIRRORS if available
> Currently 2 running tasks (238 of 551):
> 0: linux-yocto-3.14+gitAUTOINC+fc8c30398d_0143c6ebb4-r0 do_fetch (pid 10446)
> 1: binutils-cross-2.24-r0 do_compile (pid 15509)
> ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-eglibc/work/qemux86-oe-linux/linux-yocto/3.14+gitAUTOINC+fc8c30398d_0143c6ebb4-r0/temp/log.do_fetch.10446                                                                                                                                                        Currently 1 running tasks (238 of 551):
> NOTE: Tasks Summary: Attempted 239 tasks of which 67 didn't need to be rerun and 1 failed.
> NOTE: Writing buildhistory
> Waiting for 0 running tasks to finish:
> 
> Summary: 1 task failed:
>   /OE/build/oe-core/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.14.bb, do_fetch
> Summary: There was 1 WARNING message shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> 
> It was removed and then created again (this isn't good proof, but I was checking while the build was
> running and the directory was gone):
> 
> drwxr-xr-x 4 bitbake bitbake 4096 Apr  2 18:56 downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git
> drwxr-xr-x 6 bitbake bitbake 4096 Apr  1 14:38 downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git-backup
> 
> It's because fetcher is calling clean() before trying the MIRRORS, but I think in this special case it's
> a bit sad, because for very big repos the first thing I want to do is "git branch -a --contains $SRCREV"
> in downloads/git2/repo and it's already gone
> 
> It can also increase the load we create on git servers, but I don't know if we can correctly recover from
> old kinds of fetcher issues without actually doing the clean(). E.g. if it failed because of wrong permissions
> on some directory...

I think this is due to the use of mirror tarballs. If it finds a mirror
tarball, it will try and use it however it has to clean the previous
directory out the way to be able to extract the tarball. Its hard to
know in advance if a mirror tarball will contain what we want but if it
hasn't been able to fetch it through an update (git pull), it will try.

Cheers,

Richard




