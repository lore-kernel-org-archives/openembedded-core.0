Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QSBjJ-0004A1-5L for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 19:30:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52HRXot019944
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 18:27:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19747-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 18:27:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52HRRsB019934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 18:27:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201106021751.26598.paul.eggleton@linux.intel.com>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<ac909be8f5af8515017da51e7217fc15ef69379e.1306958862.git.otavio@ossystems.com.br>
	<201106021751.26598.paul.eggleton@linux.intel.com>
Date: Thu, 02 Jun 2011 18:27:07 +0100
Message-ID: <1307035627.27470.585.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/3] qmake_base.bbclass: fix lrelease/lupdate binary names
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
X-List-Received-Date: Thu, 02 Jun 2011 17:30:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 17:51 +0100, Paul Eggleton wrote:
> On Wednesday 01 June 2011 21:09:54 Otavio Salvador wrote:
> > To support translation, qmake based projects usually call lrelease and
> > lupdate however OE changes the binary names so this needs some mangle
> > to work out of box.
> > 
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >  meta/classes/qmake_base.bbclass |    5 +++++
> >  1 files changed, 5 insertions(+), 0 deletions(-)
> > 
> > diff --git a/meta/classes/qmake_base.bbclass
> > b/meta/classes/qmake_base.bbclass index a054efd..165d689 100644
> > --- a/meta/classes/qmake_base.bbclass
> > +++ b/meta/classes/qmake_base.bbclass
> > @@ -92,6 +92,11 @@ qmake_base_do_configure() {
> >  		bbnote "qmake prevar substitution: ${EXTRA_QMAKEVARS_PRE}"
> >  	fi
> > 
> > +	# Hack .pro files to use OE utilities
> > +	find -name '*.pro' \
> > +	     -exec sed -i -e 's,=\s*.*/lrelease,= ${OE_QMAKE_LRELEASE},g' \
> > +	                  -e 's,=\s*.*/lupdate,= ${OE_QMAKE_LUPDATE},g' '{}' ';'
> > +
> >  #bbnote "Calling '${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o
> > Makefile $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST'" unset
> > QMAKESPEC || true
> >  	${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o Makefile
> > $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error
> > calling ${OE_QMAKE_QMAKE} on $PROFILES"
> 
> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Merged to master, thanks.

Richard




