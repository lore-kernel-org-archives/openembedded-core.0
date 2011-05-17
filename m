Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMTSU-0000Nc-AI for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 01:13:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HNArUj021641
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 00:10:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21281-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 00:10:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HNAi9W021635
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 00:10:45 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110517113716.GA11317@jama.jama.net>
References: <46AB3A39-160F-4EB9-B92E-8DE957C1284D@dominion.thruhere.net>
	<20110517071446.GC3509@jama.jama.net> <1305625372.3424.216.camel@rex>
	<20110517113716.GA11317@jama.jama.net>
Date: Wed, 18 May 2011 00:10:42 +0100
Message-ID: <1305673842.3424.288.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: sstate breakage with multimachine
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
X-List-Received-Date: Tue, 17 May 2011 23:13:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 13:37 +0200, Martin Jansa wrote:
> On Tue, May 17, 2011 at 10:42:52AM +0100, Richard Purdie wrote:
> > On Tue, 2011-05-17 at 09:14 +0200, Martin Jansa wrote:
> > > there is also another source of many sstate rebuilds. I've discuessed
> > > this with RP on IRC already and I'll fill bugs as recommended, sharing
> > > here just because you have opened this topic.
> > > 
> > > If you have package with
> > > PACKAGE_ARCH = "all"
> > > then the resulting package is created by run.* scripts with different
> > > pathsi, *FLAGS etc even when it produces same output (ie some theme).
> > > 
> > > So all packages with such PACKAGE_ARCH are rebuilt after machine switch
> > > (if the machine is ie different arch like om-gta02/nokia900).
> > > Sstate is reused when you go back to om-gta02 after building nokia900,
> > > so you have ie populate_sysroot only with as many checksums as you're
> > > building different archs.
> > > 
> > > RP said, that right fix is to introduce something like all.bbclass which
> > > excludes all variables which shouldn't change the output of such package
> > > and then checksums will be the same.
> > 
> > I think rather then exclude them, we should zero them out or unexport
> > them and stop them being present in the task environment. We should file
> > a bug about this problem in the Yocto bugzilla.
> 
> Already did in morning
> http://bugzilla.yoctoproject.org/show_bug.cgi?id=1075

Its not finished but here is a start at this:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/allarch&id=0944f7393054a91ce1508ec1a98bd4c612ee90e4

I fixed up encodings to compile (without trying to us a compiler). The
same kind of fixes are needed for gnome-icon-theme, font-alias and
possibly others. If they are truly "all" arch, they shouldn't be trying
to access a compiler at all.


> > > Here is example with gtk-theme-e17lookalike http://paste.pocoo.org/show/388032/
> > > 
> > > And as side-note there is small problem when someone tries to hunt such
> > > checksum changes, because some tasks which are not directly using sstate
> > > like do_install do not save their run.* scripts in better place then
> > > ${WORKDIR}/temp 
> > > 
> > > So if your bitbake-diffsigs shows something like this:
> > > 
> > > Hash for dependent task
> > > /OE/shr-core/meta-shr/recipes-shr/shr/gtk-theme-e17lookalike_git.bb.do_install
> > > changed from 8a0de44f3f238f645eab9509172c2d8b to
> > > 9d6bf027c5f435498017a652088d7327
> > > 
> > > You need to find right ${WORKDIR} for that version, and there in temp
> > > directory right combination of run.do_install._pid_ scripts, but you
> > > don't know which _pid_ belongs to which sstate checksum and I guess pid
> > > cannot be stored in .siginfo because it would be always different.
> > 
> > Just for reference, if you want to generate two trees of all tasks
> > sigdata to compare you can do something like:
> > 
> > MACHINE=qemuarm bitbake console-image -S
> > MACHINE=qemux86 bitbake console-image -S
> > 
> > and then look at the tmpdir/stamps/*/* files using bitbake-diffsigs on
> > the files there to try and do this comparison more directly.
> 
> This works for multimachine build when I'm trying to find what's
> different between qemuarm and qemux86, but wont help if I'm trying to
> find what's changed in run.do_install from last week when I notice that
> some package is being rebuilt again.
> 
> Also already in bugzilla
> http://bugzilla.yoctoproject.org/show_bug.cgi?id=1074
> 
> > I'm open to other ideas to improving the way we write out the sigdata
> > pieces to make this kind of analysis easier...
> 
> I don't know sstate internals as you do, but cannot we store every
> dependant task used to count checksum in something like 
> state-gtk-theme-e17lookalike-all-oe-linux-gnueabi-0.1.1+gitr3+9b92a3d095ef1b53f55026cc292771d1507e6800-r8-all-2-do_install_8a0de44f3f238f645eab9509172c2d8b.gz
> and from second run
> state-gtk-theme-e17lookalike-all-oe-linux-gnueabi-0.1.1+gitr3+9b92a3d095ef1b53f55026cc292771d1507e6800-r8-all-2-do_install_9d6bf027c5f435498017a652088d7327.gz
> 
> or even flat filename structure like
> siginfo-do_install_8a0de44f3f238f645eab9509172c2d8b.gz and
> siginfo-do_install_9d6bf027c5f435498017a652088d7327.gz
> as hash collision is not very likely to happen and overwrites with same
> script are ok.
> 
> Then it would be easy to find actuall scripts which caused checksum
> change without ${WORKDIR}/temp files

How about:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/allarch&id=aca23a2ab92ad950d44dd45524773591bc7993bc

which results in sigdata files in the stamp directory.

Cheers,

Richard



