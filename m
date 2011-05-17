Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMGqg-0007Di-M4 for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 11:45:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4H9h1Mf005664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 10:43:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31622-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 10:42:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4H9gtxC005646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 10:42:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110517071446.GC3509@jama.jama.net>
References: <46AB3A39-160F-4EB9-B92E-8DE957C1284D@dominion.thruhere.net>
	<20110517071446.GC3509@jama.jama.net>
Date: Tue, 17 May 2011 10:42:52 +0100
Message-ID: <1305625372.3424.216.camel@rex>
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
X-List-Received-Date: Tue, 17 May 2011 09:45:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 09:14 +0200, Martin Jansa wrote:
> there is also another source of many sstate rebuilds. I've discuessed
> this with RP on IRC already and I'll fill bugs as recommended, sharing
> here just because you have opened this topic.
> 
> If you have package with
> PACKAGE_ARCH = "all"
> then the resulting package is created by run.* scripts with different
> pathsi, *FLAGS etc even when it produces same output (ie some theme).
> 
> So all packages with such PACKAGE_ARCH are rebuilt after machine switch
> (if the machine is ie different arch like om-gta02/nokia900).
> Sstate is reused when you go back to om-gta02 after building nokia900,
> so you have ie populate_sysroot only with as many checksums as you're
> building different archs.
> 
> RP said, that right fix is to introduce something like all.bbclass which
> excludes all variables which shouldn't change the output of such package
> and then checksums will be the same.

I think rather then exclude them, we should zero them out or unexport
them and stop them being present in the task environment. We should file
a bug about this problem in the Yocto bugzilla.

> Here is example with gtk-theme-e17lookalike http://paste.pocoo.org/show/388032/
> 
> And as side-note there is small problem when someone tries to hunt such
> checksum changes, because some tasks which are not directly using sstate
> like do_install do not save their run.* scripts in better place then
> ${WORKDIR}/temp 
> 
> So if your bitbake-diffsigs shows something like this:
> 
> Hash for dependent task
> /OE/shr-core/meta-shr/recipes-shr/shr/gtk-theme-e17lookalike_git.bb.do_install
> changed from 8a0de44f3f238f645eab9509172c2d8b to
> 9d6bf027c5f435498017a652088d7327
> 
> You need to find right ${WORKDIR} for that version, and there in temp
> directory right combination of run.do_install._pid_ scripts, but you
> don't know which _pid_ belongs to which sstate checksum and I guess pid
> cannot be stored in .siginfo because it would be always different.

Just for reference, if you want to generate two trees of all tasks
sigdata to compare you can do something like:

MACHINE=qemuarm bitbake console-image -S
MACHINE=qemux86 bitbake console-image -S

and then look at the tmpdir/stamps/*/* files using bitbake-diffsigs on
the files there to try and do this comparison more directly.

I'm open to other ideas to improving the way we write out the sigdata
pieces to make this kind of analysis easier...

Cheers,

Richard



