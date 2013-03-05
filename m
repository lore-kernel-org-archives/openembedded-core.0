Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UCsGF-0008U1-Kx for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 14:50:49 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r25Dfoce030917; Tue, 5 Mar 2013 13:41:50 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WPfYFndXTeJQ; Tue,  5 Mar 2013 13:41:50 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r25Dfjnh030898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 5 Mar 2013 13:41:47 GMT
Message-ID: <1362490426.29587.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 05 Mar 2013 13:33:46 +0000
In-Reply-To: <CAMKF1sqdJCLdnpr4WrWzQ44yUrpe+bxtjrm+oZrm0H0NxeXhOw@mail.gmail.com>
References: <ly628a8z00.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAMKF1sp7G1S-B5N-HR-2P_PEhkmeJnjDtskRe6EcubxiHah=nQ@mail.gmail.com>
	<1362330269.4325.28.camel@ted>
	<CAMKF1sqdJCLdnpr4WrWzQ44yUrpe+bxtjrm+oZrm0H0NxeXhOw@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libgcc: Mark libgcc_s as executable to ensure its stripped
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
X-List-Received-Date: Tue, 05 Mar 2013 13:50:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-04 at 12:06 -0800, Khem Raj wrote:
> On Sun, Mar 3, 2013 at 9:04 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > libgcc_s is not marked as executable and hence it doesn't get stripped. This
> > means its about 1MB larger than it needs to be. There is no good reason it
> > shouldn't get stripped so ensure it does and mark as executable.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
> > index 47669a2..6a0931f 100644
> > --- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
> > +++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
> > @@ -57,6 +57,9 @@ do_install () {
> >         # install the runtime in /usr/lib/ not in /usr/lib/gcc on target
> >         # so that cross-gcc can find it in the sysroot
> >
> > +       # Ensure libs are executable else they aren't stripped
> > +       chmod a+x ${D}/${base_libdir}/*
> > +
> 
> hmmm, while this solves the issue I think better fix would for
> stripper to know that its a shared object
> and can be stripped. Marking libraries with exe (except ld.so which
> can execute on its own) seems not
> right to me.

Agreed, I've pushed something which addresses the root cause in
package.bbclass.

Cheers,

Richard



