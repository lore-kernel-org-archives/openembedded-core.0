Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQykv-0007YU-JO for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 10:59:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAH9rHJj015005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 09:53:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14940-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 09:53:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAH9r9KA014999
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 09:53:10 GMT
Message-ID: <1321523593.18905.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 17 Nov 2011 09:53:13 +0000
In-Reply-To: <1321520914.3998.7.camel@mattotaupa>
References: <1321488805.18905.5.camel@ted> <1321520914.3998.7.camel@mattotaupa>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] libtool-cross: Upbreak and actually use more of it
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
X-List-Received-Date: Thu, 17 Nov 2011 09:59:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-17 at 10:08 +0100, Paul Menzel wrote:
> Dear Richard,
> Am Donnerstag, den 17.11.2011, 00:13 +0000 schrieb Richard Purdie:
> 
> unfortunately I could not find the meaning of upbreak here.

Sorry, its a typo and should be "unbreak"

> 
> > We should be using libtool-cross for cross compiling but
> > were not.
> 
> Is that just a cosmetic thing or did packages break?

Its currently harmless but when I applied my other libtool changes,
things did break.

> > This patch sets datadir so libtoolize ends up
> > containing correct paths. It then installs libtoolize.
> > 
> > The path ltmain.sh was installed to was incorrect and this is fixed.
> > 
> > We also now install all the libtool m4 macros.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> > index 596528a..4e6e3f2 100644
> > --- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> > +++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> > @@ -1,10 +1,13 @@
> >  require libtool-${PV}.inc
> >  
> > -PR = "r5"
> > +PR = "r7"
> 
> Increase just by one?

Ideally I guess, yes.

> >  PACKAGES = ""
> >  SRC_URI += "file://prefix.patch"
> >  SRC_URI += "file://fixinstall.patch"
> >  
> > +target_datadir := "${datadir}"
> 
> Is not already defined this way in `bitbake.conf`?
> 
> $ git grep target_d ./meta/conf/bitbake.conf
> meta/conf/bitbake.conf:target_datadir := "${datadir}"

Good catch, I'd forgotten we'd saved this already.

> > +datadir = "${STAGING_DIR_TARGET}${target_datad

Cheers,

Richard



