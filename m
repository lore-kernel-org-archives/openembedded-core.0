Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TCWDq-00066e-J3 for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 15:46:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EDXh2b011771;
	Fri, 14 Sep 2012 14:33:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10921-09; Fri, 14 Sep 2012 14:33:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EDXXJ7011765
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 14:33:34 +0100
Message-ID: <1347629615.13596.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 14 Sep 2012 14:33:35 +0100
In-Reply-To: <lyobl8u70k.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1347451098-16659-1-git-send-email-constantinx.musca@intel.com>
	<lyvcfgu9ls.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1347623450.9456.29.camel@ted>
	<lyobl8u70k.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Constantin Musca
	<constantinx.musca-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] patch.bbclass: Use one TMPDIR per patching process
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
X-List-Received-Date: Fri, 14 Sep 2012 13:46:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 14:24 +0200, Enrico Scholz wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> >> > +    process_tmpdir = os.path.join('/tmp', str(os.getpid()))
> >> > +        shutil.rmtree(process_tmpdir)
> 
> > Its only being used as a prefix, not as the full directory path name
> > so it isn't quite as insecure as it would first appear.
> 
> It *is* insecure as it would first appear.  'shutil.rmtree()' does not
> traverse the directory in a secure way so that an attacker could:
> 
> 1. touch /tmp/<2-32767>/a
> 2. mkdir /tmp/<2-32767>/Z
> 3. wait for an inotify which triggers on deletion of the 'a' files
> 4. rmdir /tmp/$dir/Z
> 5. ln -s /home/<user> /tmp/$dir/Z
> 
> When steps 4+5 are executed between
> 
> | $ strace python -c 'import shutil; shutil.rmtree("/tmp/2");'
> | ...
> | lstat("/tmp/2/Z", {st_mode=S_IFDIR|0755, st_size=60, ...}) = 0
> | <<<< steps 4+5 here >>>>
> | openat(AT_FDCWD, "/tmp/2/Z", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 3
> | getdents(3, /* 3 entries */, 32768)     = 72
> | ...
> | unlink("/tmp/2/Z/foo")                  = 0
> 
> user writable directories will be removed.
> 
> There have been established some rules regarding secure tmpfile/dir
> generation in the last 10-20 years which should never be violated.
> 
> 
> Beside the obvious security issues, build will be aborted when somebody
> else creates a /tmp/<number> file and <number> matches the bitbake pid.

Firstly, I agree that we need to fix this and I know Constantin is
working on a patch. 

I would point out that the build process is likely full of such races
though. We execute an absolute *ton* of code, much of which is part of
upstream projects and which we don't directly control (think of all the
configure scripts and makefiles). I'd therefore suggest that builds be
considered insecure in themselves and run in environments appropriate to
that.

So build time security, I make *no* claims to and I find it hard to get
worked up about this lest it create some illusion builds are "secure".
Runtime security of the build output, very different question,
naturally.

Cheers,

Richard




