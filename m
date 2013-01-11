Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TtgkR-0008Nx-8v for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 16:42:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0BFR6lZ018369;
	Fri, 11 Jan 2013 15:27:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18272-01; Fri, 11 Jan 2013 15:27:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0BFQvMQ018363
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 11 Jan 2013 15:26:58 GMT
Message-ID: <1357918019.4072.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Constantin Musca <constantinx.musca@intel.com>
Date: Fri, 11 Jan 2013 15:26:59 +0000
In-Reply-To: <1357917602.4072.74.camel@ted>
References: <cover.1357721541.git.constantinx.musca@intel.com>
	<cbe92655aebcddb452f3855ba543be2560ac8a1c.1357721541.git.constantinx.musca@intel.com>
	<1357917602.4072.74.camel@ted>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] gcc: enable multilib for target gcc
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
X-List-Received-Date: Fri, 11 Jan 2013 15:42:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-01-11 at 15:20 +0000, Richard Purdie wrote:
> On Wed, 2013-01-09 at 11:00 +0200, Constantin Musca wrote:
> > - add a task to setup multilib configuration for target gcc
> > - this commit adapts Nitin Kamble's work to gcc 4.7
> > 
> > Tests:
> > root@qemux86-64:~# gcc -m64 t.c -o t
> > root@qemux86-64:~# file t
> > t: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not stripped
> > root@qemux86-64:~# ./t
> > Hello World !
> > root@qemux86-64:~# gcc -m32 t.c -o t
> > root@qemux86-64:~# file t
> > t: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not stripped
> > root@qemux86-64:~# ./t
> > Hello World !
> > 
> > [YOCTO #1369]
> > 
> > Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-4.7.inc              |   2 +-
> >  meta/recipes-devtools/gcc/gcc-common.inc           |  23 ++++
> >  meta/recipes-devtools/gcc/gcc-configure-common.inc |   2 +-
> >  meta/recipes-devtools/gcc/gcc-configure-target.inc |   1 +
> >  meta/recipes-devtools/gcc/gcc-multilib-config.inc  | 132 +++++++++++++++++++++
> >  meta/recipes-devtools/gcc/libgcc_4.7.bb            |  44 +++++++
> >  6 files changed, 202 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc
> 
> This triggered some build failures:
> 
> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/769/steps/shell_29/logs/stdio

and a different more subtle issue in:

http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64-lsb/builds/191/steps/shell_29/logs/stdio

which I suspect is related since a build of master just before this
without the patch worked.

Cheers,

Richard



