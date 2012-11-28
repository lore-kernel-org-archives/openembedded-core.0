Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tdbde-0000A3-Qu for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 08:01:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS6kckI010799;
	Wed, 28 Nov 2012 06:46:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09454-05; Wed, 28 Nov 2012 06:46:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS6kUUp010793
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 28 Nov 2012 06:46:32 GMT
Message-ID: <1354085189.21863.122.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Wed, 28 Nov 2012 06:46:29 +0000
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A7AE107@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1353620179.10459.59.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A7AE107@039-SN1MPN1-001.039d.mgd.msft.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Explicitly depend on linux-libc-headers
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
X-List-Received-Date: Wed, 28 Nov 2012 07:01:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-11-27 at 20:08 +0000, McClintock Matthew-B29882 wrote:
> On Thu, Nov 22, 2012 at 3:36 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > gcc-cross cannot build without linux-libc-headers but doesn't explicitly depend on
> > it relying on the implied dependency through libc. With cases where pieces
> > can be installed through sstate, we now need this explicit dependency to
> > ensure builds with partial sstate work.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> > index 6d160d6..cde08ee 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > @@ -1,6 +1,6 @@
> >  inherit cross
> >
> > -DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc ${NATIVEDEPS}"
> > +DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc linux-libc-headers ${NATIVEDEPS}"
> 
> How would you suggest not forcing a rebuild of all components if the
> linux headers signature changes? During our normal development we
> change Linux headers for things that would in no way effect gcc or
> even libc. It's painful to watch a complete rebuild occur because of
> this.
> 
> Just have a different recipe for headers for some components?

This is partly why our headers recipe is separate from the kernel and
other parts of the system but that doesn't sound like its enough for
you.

The signatures code can support things like adding the recipe name to
SIGGEN_EXCLUDERECIPES_ABISAFE to mark it as not being part of inter-task
dependencies so perhaps do that?

Cheers,

Richard



