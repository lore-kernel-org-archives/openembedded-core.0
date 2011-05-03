Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHDEY-0004o0-CL for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 12:53:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p43AoxxH011847;
	Tue, 3 May 2011 11:50:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10021-03; Tue,  3 May 2011 11:50:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p43AoqZ1011835
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 3 May 2011 11:50:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1304073898-12204-1-git-send-email-michael.lippautz@gmail.com>
References: <1304073898-12204-1-git-send-email-michael.lippautz@gmail.com>
Date: Tue, 03 May 2011 11:50:50 +0100
Message-ID: <1304419850.21461.102.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH]] python: Unbreak Python third-party extensions
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
X-List-Received-Date: Tue, 03 May 2011 10:53:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-29 at 12:44 +0200, Michael Lippautz wrote:
> This fixes compilation/linking of Python 3rd party extensions.
> 
> ${STAGING_LIBDIR}/python<pyver>/config/Makefile needs the correct
> INCDIR and LIBDIR settings to be used in cross compilation for the
> target. 3rd party module use distutils.sysconfig which uses this
> Makefile to create compiler/linker flags.
> 
> Workflow:
> 1) compile needs the staged/sysroot Makefile since it is needed
>    for compilation/linking
> 2) install needs the unmodified Makefile to install files (i.e.
>    headers) into the right directores. (otherwise they would be
>    installed in ${D}/${STAGING_...}
> 3) staging needs modified Makefile again
> 4) packaging needs unmodified to make compilation on the target
>    possible
> 
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  meta/recipes-devtools/python/python_2.6.6.bb |   25 +++++++++++++++++++------
>  1 files changed, 19 insertions(+), 6 deletions(-)

I'm ok with this patch but I am a little worried looking at the python
recipe that it won't interact well with sstate. I'd therefore like to
fix this whilst we have someone who understands this code around.

The problem is that do_compile_prepend() is poking files directly into
staging. Instead, do_install should be manipulating things in ${D}
instead and then PACKAGE_PREPROCESS_FUNCS and SYSROOT_PREPROCESS_FUNCS
should be taking care of any fixups for the target/sysroot cases.

Can we add the code in the do_compile_prepend() to the start of the
do_install() ?

Cheers,

Richard



