Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UFUUy-00064o-GX for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 20:04:33 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2CIuOon003763; Tue, 12 Mar 2013 18:56:24 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uZ1zJgQ4yQnk; Tue, 12 Mar 2013 18:56:23 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2CIuEiV003750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Mar 2013 18:56:20 GMT
Message-ID: <1363114053.9859.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 12 Mar 2013 18:47:33 +0000
In-Reply-To: <lya9q8ud8c.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <7acaf76adbd1f0c29b17da721267392533d3a703.1360499939.git.enrico.scholz@sigma-chemnitz.de>
	<69be0b1aae50eb097172bcfa2e9aa02157f62436.1360499939.git.enrico.scholz@sigma-chemnitz.de>
	<1362570557.11727.59.camel@ted>
	<lya9q8ud8c.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] package.bbclass: use oe.path.realpath()
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
X-List-Received-Date: Tue, 12 Mar 2013 19:04:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-03-12 at 11:25 +0100, Enrico Scholz wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> >> Old implementation suffered from lot of problems; e.g.
> >> 
> >> * redundant code
> >> 
> >> * calls 'os.stat()' which references files on host; this can give wrong
> >>   results about existing/non-existing and can cause EPERM (instead of
> >>   the catched ENONENT) exceptions
> >> 
> >> * does not deal with special cases like '..' leaving the sysroot.
> >
> > Whilst these changes are good, they do come at a cost:
> >
> > post symlink package changes
> > ./perfscript -c 8c22531e491e6b0cfffaaa80d6bc75db757fc1d1
> > 49:38.46,17:12.15
> >
> > pre symlink package changes
> > ./perfscript -c 1a80329b3fcf23ecc23e409a260b9b2182652f65
> > 48:16.33,13:39.97
> >
> > So it added 1m20 to the overall build time, but more worryingly, added
> > added nearly 3m30 to the time for:
> >
> > bitbake virtual/kernel -c cleansstate; bitbake virtual/kernel
> >
> > These tests are based on the script linked from
> > https://wiki.yoctoproject.org/wiki/Performance_Test where the kernel
> > test is this is the second number above list, overall build time is the
> > first.
> >
> > Have you any time to look into this performance regression?
> 
> Well, patch replaced a call to os.path.realpath() with a more accurate
> variant honoring a sysroot. There must be more work be done to replace
> things previously solved by the operating system with custom (python)
> code.
> 
> I will try to write a C implementation of oe.path.realpath() but this
> can take some time and I do not have an idea how to integrate it into
> oe.

The issue is not an interpreted language verses C, the problem is the
shear number of syscalls. Each isdir() and islink() call means a stat
call into the kernel. For "bitbake virtual/kernel -c package", I'm
seeing 400,000 stat calls for 23,000 files. We know the filesystem
doesn't change so we could cache the stat calls and hopefully hence the
speed. I actually have some code I tried this with but its not working
as well as I'd like so I need to do some further investigation about
what is happening.

Cheers,

Richard





