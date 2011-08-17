Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtjmN-0000Jx-TX
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 19:19:47 +0200
Received: from localhost (85.231.30.150) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	19:15:09 +0200
Date: Wed, 17 Aug 2011 19:15:19 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110817171519.GA2222@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1313503017.git.anders@chargestorm.se>
	<0723e2f710db1680c71a1f6f848563cfcc6b3cdc.1313503017.git.anders@chargestorm.se>
	<1313590095.13995.38.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1313590095.13995.38.camel@rex>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH 1/5] qt4: allow a reduction in build time
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
X-List-Received-Date: Wed, 17 Aug 2011 17:19:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Richard Purdie <richard.purdie@linuxfoundation.org> [110817 16:09]:
> On Tue, 2011-08-16 at 15:57 +0200, Anders Darander wrote:
> > When reducing build time by adding QT_DISTRO_FLAGS from the set '-no-gui -nomake tools
> > -nomake examples -nomake demos -nomake docs', build failure can occur, due to not building
> > all tools.
> > 
> > * Make rm not error out when removing one of the, possibly, non-existing tools.
> > * Only try to rename qtdemo, if qtdemo exists.
> > * Guard do_split_packages() with an try-except-clause, otherwise we get an error stating
> >   that .../phrasebooks/... do not exist.
> > 
> > Signed-off-by: Anders Darander <anders@chargestorm.se>
> > ---
> >  meta/recipes-qt/qt4/qt4.inc |   13 ++++++++-----
> >  1 files changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> > index 0410a92..994ec12 100644
> > --- a/meta/recipes-qt/qt4/qt4.inc
> > +++ b/meta/recipes-qt/qt4/qt4.inc
> > @@ -227,7 +227,10 @@ python populate_packages_prepend() {
> >   
> >          phrasebook_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
> >          phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d)
> > -        do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
> > +        try:
> > +                do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
> > +        except:
> > +                pass

> Please use some actual test here, not a general try/except/pass. This
> reason is that is some failure we want to know about happens, this will
> hide it as the code stands.

Yes, that's right. Initially I had a plan to get some ideas on how to
tackle this, but I think I've got a good test outlined. Hopefully I can
implement and test it tonight, otherwise I'll do it tomorrow.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB


