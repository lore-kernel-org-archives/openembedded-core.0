Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3C71A77177
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:11:24 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:50e2:c523:4434:54a0] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cHUsc-0000yl-Se; Thu, 15 Dec 2016 13:11:25 +0100
Message-ID: <1481803881.10018.20.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Dec 2016 12:11:21 +0000
In-Reply-To: <CAMKF1sq--mXBzTh+xc+gZb9L9wNugK8izZ-MMrYJyKKKdR9aOg@mail.gmail.com>
References: <1481751480.3851.14.camel@pbcl.net>
	<CAMKF1sq--mXBzTh+xc+gZb9L9wNugK8izZ-MMrYJyKKKdR9aOg@mail.gmail.com>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-ust: Patch python shebang appropriately for native builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Dec 2016 12:11:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-12-14 at 15:38 -0800, Khem Raj wrote:
> On Wed, Dec 14, 2016 at 1:38 PM, Phil Blundell <pb@pbcl.net> wrote:
> > If we are building a native package then ${bindir}/python3 is not
> > guaranteed
> > to be available, and if it is available then it is probably a
> > directory not a
> > file.  In either case, attempting to use it as an interpreter will
> > not end
> > well.  Let's use ${bindir}/nativepython instead.
> > 
> > Signed-off-by: Phil Blundell <philb@gnu.org>
> > ---
> >  meta/recipes-kernel/lttng/lttng-ust_git.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-kernel/lttng/lttng-ust_git.bb
> > b/meta/recipes-kernel/lttng/lttng-ust_git.bb
> > index 5869093..df22352 100644
> > --- a/meta/recipes-kernel/lttng/lttng-ust_git.bb
> > +++ b/meta/recipes-kernel/lttng/lttng-ust_git.bb
> > @@ -29,10 +29,12 @@ SRC_URI = "git://git.lttng.org/lttng-
> > ust.git;branch=stable-2.7 \
> > 
> >  PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-
> > pages, asciidoc-native xmlto-native libxslt-native"
> > 
> > +usepython="${bindir}/python3"
> > +usepython_class-native="${bindir}/nativepython"
> >  do_install_append() {
> >          # Patch python tools to use Python 3; they should be
> > source compatible, but
> >          # still refer to Python 2 in the shebang
> > -        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,'
> > ${D}${bindir}/lttng-gen-tp
> > +        sed -i -e '1s,#!.*python.*,#!${usepython},'
> > ${D}${bindir}/lttng-gen-tp
> 
> This also means we need to add a dependency on python-native may be
> it
> should inherit the python native class.

I suppose it probably should.  That'd be a bit suboptimal in the sense
that the non-native version does not need to depend on python-native,
but given that python-native is probably installed in the sysroot
anyway I don't suppose it is likely to hurt very much.  And I don't
think it is worth the complexity of trying to do a conditional inherit
of pythonnative.

p.


