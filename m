Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id E052176FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 19:15:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 91F9B3C88695
Message-ID: <1441307746.2977.32.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 03 Sep 2015 20:15:46 +0100
In-Reply-To: <55E87FE5.8050406@windriver.com>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
	<82a9dc6d0c430ec44a9a7cf4e2499bdd5bffeb1f.1441291646.git.joshua.lock@collabora.co.uk>
	<55E87FE5.8050406@windriver.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH 8/9] nfs-utils: don't force use of /sbin as sbindir
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
X-List-Received-Date: Thu, 03 Sep 2015 19:15:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-03 at 12:14 -0500, Mark Hatle wrote:
> On 9/3/15 9:58 AM, Joshua Lock wrote:
> > In a system with a merged /usr /sbin isn't packaged.
> 
> This sounds like an error to me if /sbin doesn't exist at all. It
> should exist
> either as a link to /usr/sbin (or the reverse).. but it should be
> there as lots
> of things expect the directory (or link) to exist.

Sure, it exists in my images but not during packaging. In my testing I
have base_bindir, base_libdir and base_sbindir set to children of /usr
in my distro.conf and a base-files_%.bbappend that creates the
symlinks. Therefore at packaging time the /sbin directory (and symlink)
 doesn't exist.

I admit this commit message is pretty poor and I'll try and remember to
fix it in a v2.

Regards,

Joshua

> (It's also required by the FHS, even though that probably isn't
> enough of a
> concern.)
> 
> > Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> > ---
> >  meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb | 8
> > ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> > b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> > index 6da8509..42101de 100644
> > --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> > +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> > @@ -90,6 +90,14 @@ RDEPENDS_${PN}-stats = "python"
> >  
> >  FILES_${PN} += "${systemd_unitdir}"
> >  
> > +do_configure_prepend() {
> > +        sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g'
> > \
> > +            ${S}/utils/mount/Makefile.am
> > +
> > +        sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g'
> > \
> > +            ${S}/utils/osd_login/Makefile.am
> > +}
> > +
> >  # Make clean needed because the package comes with
> >  # precompiled 64-bit objects that break the build
> >  do_compile_prepend() {
> > 
> 
> So my concern is simply with the commit msg -- not the actual
> implementation.
> What you have above looks correct to me.

