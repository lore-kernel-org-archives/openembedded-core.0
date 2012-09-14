Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TCUcK-0003D1-OS for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 14:03:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EBosCc011069;
	Fri, 14 Sep 2012 12:50:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10777-03; Fri, 14 Sep 2012 12:50:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8EBolQT011063
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 12:50:48 +0100
Message-ID: <1347623450.9456.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 14 Sep 2012 12:50:50 +0100
In-Reply-To: <lyvcfgu9ls.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1347451098-16659-1-git-send-email-constantinx.musca@intel.com>
	<lyvcfgu9ls.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Fri, 14 Sep 2012 12:03:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 13:28 +0200, Enrico Scholz wrote:
> Constantin Musca
> <constantinx.musca-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:
> 
> > +    process_tmpdir = os.path.join('/tmp', str(os.getpid()))
> > +    if os.path.exists(process_tmpdir):
> > +        shutil.rmtree(process_tmpdir)
> > +    os.makedirs(process_tmpdir)
> 
> ooohhhh... this violates trivial rules regarding secure generation of
> tempfiles. Better use 'mkdtemp()' from the 'tempfile' module.

The problem is that the internal temp directory creation inside patch
can be broken. We *really* don't want to start building patch-native so
this workaround gives patch a fighting chance of not conflicting with
other instances of itself. Its only being used as a prefix, not as the
full directory path name so it isn't quite as insecure as it would first
appear.

I'm fine if we want to use the mkdtemp approach though and further
randomise this. I'd also suggest any updated version adds a comment to
the code about *why* we need a separate TMPDIR and which versions of
patch have this problem.

Cheers,

Richard



