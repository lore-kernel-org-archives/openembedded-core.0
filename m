Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQFmQ-000684-7Q; Mon, 22 Oct 2012 13:02:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MAnJfV004032;
	Mon, 22 Oct 2012 11:49:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02610-06; Mon, 22 Oct 2012 11:49:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MAn9EQ004025
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 22 Oct 2012 11:49:10 +0100
Message-ID: <1350902949.2520.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Oct 2012 11:49:09 +0100
In-Reply-To: <20121022083441.GA3269@jama.jama.net>
References: <20121019163541.436A0103AB@opal>
	<20121022083441.GA3269@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : perl: fix dependecies
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
X-List-Received-Date: Mon, 22 Oct 2012 11:02:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-22 at 10:34 +0200, Martin Jansa wrote:
> >  # 5.10.1 has Module::Build built-in
> >  PROVIDES += "libmodule-build-perl"
> > @@ -243,7 +243,13 @@ perl_package_preprocess () {
> >  
> >  PACKAGES = "perl-dbg perl perl-misc perl-dev perl-pod perl-doc perl-lib \
> >              perl-module-cpan perl-module-cpanplus perl-module-unicore"
> > -FILES_${PN} = "${bindir}/perl ${bindir}/perl${PV}"
> > +FILES_${PN} = "${bindir}/perl ${bindir}/perl${PV} \
> > +               ${libdir}/perl/${PV}/Config.pm \
> > +               ${libdir}/perl/${PV}/strict.pm \
> > +               ${libdir}/perl/${PV}/warnings.pm \
> > +               ${libdir}/perl/${PV}/warnings \
> > +               ${libdir}/perl/${PV}/vars.pm \
> > +              "
> 
> I think this breaks at least automake, tiobench and libtimedate-perl
> 
> OE @ ~/openembedded-core $ git grep perl-module-strict
> meta/recipes-devtools/automake/automake_1.12.3.bb:    perl-module-strict \
> meta/recipes-extended/perl/libtimedate-perl_1.20.bb:RDEPENDS_${PN} += "perl-module-carp perl-module-exporter perl-module-strict perl-module-time-local"
> OE @ ~/meta-openembedded $ git grep perl-module-strict
> meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb:    perl-module-strict \
> OE @ ~/openembedded-core $ git grep perl-module-vars
> meta/recipes-devtools/automake/automake_1.12.3.bb:    perl-module-vars "
> 
> perl-module-strict and perl-module-vars are not created now, probably empty.
> 

It does, the autobuilder also noticed this and I pushed in a fix this
morning:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=072a6d352f55bbe481b04db02aa6d9cde7d90057

Cheers,

Richard



