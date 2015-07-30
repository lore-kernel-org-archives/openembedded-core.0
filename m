Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 4B90B763E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 16:15:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id D13BE6002ED
Message-ID: <1438272923.3455.23.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 17:15:23 +0100
In-Reply-To: <CAMg8ce8qNmsMEz4dhVNCJMYJ0R-Eb6cnsNgSWAHnDWzZRJ6SdA@mail.gmail.com>
References: <1437500771-20097-1-git-send-email-tobias.olausson@pelagicore.com>
	<20150727152544.GA307@jama>
	<CAMg8ce8qNmsMEz4dhVNCJMYJ0R-Eb6cnsNgSWAHnDWzZRJ6SdA@mail.gmail.com>
X-Mailer: Evolution 3.16.4 (3.16.4-2.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH] mesa: fix sed for MESA_EGL_NO_X11_HEADERS in fido
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
X-List-Received-Date: Thu, 30 Jul 2015 16:15:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-07-27 at 11:00 -0700, Tobias Olausson wrote:
> On 27 July 2015 at 08:25, Martin Jansa <martin.jansa@gmail.com> 
> wrote:
> > On Tue, Jul 21, 2015 at 10:46:11AM -0700, Tobias Olausson wrote:
> > > In 10.4 versions of mesa, the check for MESA_EGL_NO_X11_HEADERS 
> > uses an #ifdef,
> > > not an #if define().
> > 
> > So this commit which was recently backported to fido branch should 
> > be
> > reverted:
> Well, reverting the already backported patch would break my patch. I 
> don't mind resubmitting a new patch, but the one I originally 
> submitted builds on top of the backported one, so the backported one 
> would be neutralized.

Ideally you'd submit a series of patches with 1) a patch to revert the
already backported patch below and 2) a patch to backport the change
from 9c746017af381884cc20c7cd563fc429c2c66112.

That would give us nice clean git history (making future patch
backporting easier) and mean next to no work for me.

Does that seem reasonable?

Regards,

Joshua

> >  
> > commit 12e467f436fbc22f274558c753f0ac9756ce1071
> > Author:     Robert Yang <liezhi.yang@windriver.com>
> > AuthorDate: Wed May 6 00:08:35 2015 -0700
> > Commit:     Richard Purdie <richard.purdie@linuxfoundation.org>
> > CommitDate: Sun Jun 28 09:41:54 2015 +0100
> > 
> >     mesa: fix do_install_append
> > 
> >     "ifdef MESA_EGL_NO_X11_HEADERS" -> "if 
> > defined(MESA_EGL_NO_X11_HEADERS)"
> > 
> >     (From OE-Core master rev: 
> > 3a464d67b60f70b865f7db768e7edc53e40ff450)
> > 
> >     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >     Signed-off-by: Richard Purdie <
> > richard.purdie@linuxfoundation.org>
> >     Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> > 
> > with proper commit message (preferably separately from
> > 9c746017af381884cc20c7cd563fc429c2c66112 backport), otherwise I 
> > like
> > what this patch is doing.
> > 
> > Thanks
> > 
> > >
> > > Also, this backports commit 
> > 9c746017af381884cc20c7cd563fc429c2c66112
> > > to fido from master.
> > >
> > > Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
> > > ---
> > >  meta/recipes-graphics/mesa/mesa_10.4.4.bb | 2 +-
> > >  meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb 
> > b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> > > index 90cccbe..a5f510d 100644
> > > --- a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> > > +++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> > > @@ -11,6 +11,6 @@ S = "${WORKDIR}/Mesa-${PV}"
> > >  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > >  do_install_append() {
> > >      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 
> > 'false', d)}; then
> > > -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if 
> > ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' 
> > ${D}${includedir}/EGL/eglplatform.h
> > > +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if 
> > defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECO
> > NFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> > >      fi
> > >  }
> > > diff --git a/meta/recipes-graphics/mesa/mesa_git.bb 
> > b/meta/recipes-graphics/mesa/mesa_git.bb
> > > index 1598019..269ae1e 100644
> > > --- a/meta/recipes-graphics/mesa/mesa_git.bb
> > > +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> > > @@ -13,6 +13,6 @@ S = "${WORKDIR}/git"
> > >  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > >  do_install_append() {
> > >      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 
> > 'false', d)}; then
> > > -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if 
> > ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' 
> > ${D}${includedir}/EGL/eglplatform.h
> > > +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if 
> > defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECO
> > NFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> > >      fi
> > >  }
> > > --
> > > 2.1.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > 
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

