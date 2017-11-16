Return-Path: <martyn.welch@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id E5CE878423
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 09:40:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: martyn) with ESMTPSA id 9A0552607F2
Message-ID: <1510825242.6402.23.camel@collabora.co.uk>
From: Martyn Welch <martyn.welch@collabora.co.uk>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Thu, 16 Nov 2017 09:40:42 +0000
In-Reply-To: <CAP9ODKq5HO3MtsCsJ+3o4cicrQD+9H-=yGf=TjE0i3riy+oK4w@mail.gmail.com>
References: <1510758646-19268-1-git-send-email-martyn.welch@collabora.co.uk>
	<CAP9ODKq5HO3MtsCsJ+3o4cicrQD+9H-=yGf=TjE0i3riy+oK4w@mail.gmail.com>
Organization: Collabora Ltd
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: yocto <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] image.bbclass: add prohibited-paths QA test
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
X-List-Received-Date: Thu, 16 Nov 2017 09:40:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-11-15 at 18:46 -0200, Otavio Salvador wrote:
> On Wed, Nov 15, 2017 at 1:10 PM, Martyn Welch
> <martyn.welch@collabora.co.uk> wrote:
> > Sometimes we wish to ensure that files or directories are not installed
> > somewhere that may prove detrimental to the operation of the system. For
> > example, this may be the case if files are placed in a directory that is
> > utilised as a mount point at run time, thus making them inaccessible once
> > when the mount point is being utilised.
> >
> > Implement the prohibited paths QA test, which enables such locations to be
> > specified in a "PROHIBITED_PATHS" variable. This implementation allows for
> > a colon separated list of paths to be provided. Shell style wildcards can
> > be used.
> >
> > Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> > Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> > ---
> > Changes since v1:
> >  - Correcting author and SOB.
> >
> > Changes since v2:
> >  - Reimplemented as image rather than package level QA test.
> >  - Changed variable from PROHIBITED_PATH to PROHIBITED_PATHS to better
> >    reflect its use.
> >
> >  meta/classes/image.bbclass | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index d93de02..bebb363 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -296,6 +296,26 @@ python do_image_complete_setscene () {
> >  }
> >  addtask do_image_complete_setscene
> >
> > +python image_check_prohibited_paths () {
> > +    import glob
> > +    from oe.utils import ImageQAFailed
> > +
> > +    rootfs = d.getVar('IMAGE_ROOTFS')
> > +
> > +    path = d.getVar('PROHIBITED_PATHS')
> 
> path = (d.getVar('PROHIBITED_PATHS') or "")
> 
> I'd use IMAGE_QA_PROHIBITED_PATHS as variable name. It makes easier to
> know what it relates to.
> 
> > +    if path != None and path != "":
> 
> If can die.
> 
> > +        for p in path.split(':'):
> > +            if p[0] != '/':
> 
> if not p.startswith('/'):
> 
> > +                raise ImageQAFailed("PROHIBITED_PATHS \"%s\" must be an absolute path" % p, image_check_prohibited_paths)
> > +
> > +            match = glob.glob("%s%s" % (rootfs, p))
> > +            if match:
> 
> I'd use:
> 
> if glob.glob(...):
> 
> It is a single use so not sure it is worth the extra variable.
> 
> > +                loc = ", ".join(item.replace(rootfs, '') for item in match)

match is used here.

> > +                raise ImageQAFailed("Match(es) for PROHIBITED_PATHS \"%s\": %s" % (p, loc), image_check_prohibited_paths)
> > +}
> 



