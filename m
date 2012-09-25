Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGdH5-0005YC-8I for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 00:06:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8PLrmms012181;
	Tue, 25 Sep 2012 22:53:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12087-01; Tue, 25 Sep 2012 22:53:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8PLrf86012174
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 25 Sep 2012 22:53:42 +0100
Message-ID: <1348610022.8662.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 25 Sep 2012 22:53:42 +0100
In-Reply-To: <5061F3F1.2010502@windriver.com>
References: <1348525482-31986-1-git-send-email-raj.khem@gmail.com>
	<5061F3F1.2010502@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-common.inc: Consider multilib when renaming libgcc for debian'ness
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
X-List-Received-Date: Tue, 25 Sep 2012 22:06:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-25 at 13:12 -0500, Mark Hatle wrote:
> On 9/24/12 5:24 PM, Khem Raj wrote:
> > When doing multilib builds rpm does not find libgcc1 for lib32
> > multilib because its not honoring the debian renaming scheme for
> > libgcc-multilib. Lets add MLPREFIX to fix it.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta/recipes-devtools/gcc/gcc-common.inc |    2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
> > index 3b00017..38f3b7f 100644
> > --- a/meta/recipes-devtools/gcc/gcc-common.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> > @@ -40,7 +40,7 @@ def get_gcc_multiarch_setting(bb, d):
> >   # For now, libgcc is most important so we fix for that - RP.
> >   SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
> >
> > -DEBIANNAME_libgcc = "libgcc1"
> > +DEBIANNAME_${MLPREFIX}libgcc = "libgcc1"
> 
> I realize this is a fairly rare case, but should the debian (or multilib) 
> bbclasses be multilib aware, and if so automatically generate the corresponding 
> DEBIANNAME_${MLPREFIX}pn = value?
> 
> This is already done for blacklists, preferred provider/version and whitelists 
> in the base.bbclass.  Then if anyone (in the future) specifies DEBIANNAME, it'll 
> be automatic.

The multilib/package code does have a list of variables it processes for
this, this one should probably be added to that list.

In fact debian.bbclass should append it to the list package.bbclass
has...

Cheers,

Richard



