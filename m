Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251B8EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 13:32:24 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.8025.1687786340739669507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 06:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i41oVF7y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687786338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ls1NifKrcMNSnEtoTGWPTNwJz5YxFtd5sGTR/wB9yz4=;
	b=i41oVF7yjRLBnn5HsTx0/zyw3OUqriTGp36Xegwr5M5OS6LI67lFTJ0YCEGfxGokUmzs4Z
	VjI1KNamavPIkEaTAFvfNtQWgN69aN4A0U3vqglZAVySO3p0jmDQ/ECJzgPB+hOUCbmoca
	iZAaJhubjkG+361RIK6QPUh2krQYtmTHLFbEVd3WmowiE4eglmLh+6H1RuSn7Oz8N2fdA6
	gksCq4vzjrdmowghqDzCP8OTdYSLCXNAdZvBLWZId/DgB5zlmndS+MpfIBJKsW4LYKUhSg
	YD8pecu+tBhuchIKb5wZBKl+6St4g4pcipcLNUEMIPqKfmPQ8eBt6SCgJyX/IA==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26ECA20005;
	Mon, 26 Jun 2023 13:32:15 +0000 (UTC)
Date: Mon, 26 Jun 2023 15:32:05 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Bruce Ashfield
 <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: hoist up "unset S" bbfatal
 from kernel-yocto.bbclass to kernel.bbclass
Message-ID: <20230626153205.42cd884f@booty>
In-Reply-To: <674d0a964611cc1e5451318976f17a4a24cbca5a.camel@linuxfoundation.org>
References: <20230605141319.532136-1-luca.ceresoli@bootlin.com>
	<674d0a964611cc1e5451318976f17a4a24cbca5a.camel@linuxfoundation.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 13:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183412

Hello Richard,

thanks for reviewing!

On Fri, 23 Jun 2023 12:07:43 +0100
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> Hi Luca,
>=20
> On Mon, 2023-06-05 at 16:13 +0200, Luca Ceresoli via lists.openembedded.o=
rg wrote:
> > From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >=20
> > Writing a simple recipe that inherits kernel.bbclass and downloads a ke=
rnel
> > tarball (e.g. a mainline release from kernel.org) via http or ftp fails
> > with either:
> >=20
> >   ERROR: linux-acme-6.3.3-r0 do_configure: oe_runmake failed
> >   ...
> >   | make: *** No rule to make target 'oldnoconfig'.  Stop.
> >=20
> > or (seen on a different setup, based on kirkstone):
> >=20
> >   ... do_populate_lic: QA Issue: ... LIC_FILES_CHKSUM points to an inva=
lid file: .../work-shared/.../kernel-source/COPYING [license-checksum]
> >=20
> > This happens when not setting S in the recipe. In this case, kernel.bbc=
lass
> > sets it to ${STAGING_KERNEL_DIR}
> > (${TMPDIR}/work-shared/${MACHINE}/kernel-source).  This means that in
> > do_symlink_kernsrc(), the 'if s !=3D kernsrc' never triggers and thus t=
he
> > kernel tree will not me moved into work/shared, which results in an emp=
ty
> > work-shared/.../kernel-source directory.
> >=20
> > When downloading a tarball it is usually not required to set S in recip=
es,
> > so this is not obvious here and the error message does not point to the
> > problem or its solution.
> >=20
> > There is such a check in kernel-yocto.bbclass though, so move it to
> > kernel.bbclass so that also kernel recipes not based on kernel-yocto can
> > benefit from it.
> >=20
> > The check is moved:
> >=20
> >  - from the beginning of do_kernel_checkout() in kernel-yocto
> >  - to the end of do_symlink_kernsrc() in kernel.bbclass
> >=20
> > and since do_kernel_checkout is executed 'after do_symlink_kernsrc', the
> > code flow does not change in a relevant way when using linux-yocto.
> >=20
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  meta/classes-recipe/kernel-yocto.bbclass | 8 --------
> >  meta/classes-recipe/kernel.bbclass       | 6 ++++++
> >  2 files changed, 6 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-re=
cipe/kernel-yocto.bbclass
> > index 108b7e675212..ceb451b69969 100644
> > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > @@ -394,16 +394,8 @@ do_kernel_checkout() {
> >  		# case: we have no git repository at all.=20
> >  		# To support low bandwidth options for building the kernel, we'll ju=
st=20
> >  		# convert the tree to a git repo and let the rest of the process wor=
k unchanged
> > -	=09
> > -		# if ${S} hasn't been set to the proper subdirectory a default of "l=
inux" is=20
> > -		# used, but we can't initialize that empty directory. So check it an=
d throw a
> > -		# clear error
> > =20
> >  	        cd ${S}
> > -		if [ ! -f "Makefile" ]; then
> > -			bberror "S is not set to the linux source directory. Check "
> > -			bbfatal "the recipe and set S to the proper extracted subdirectory"
> > -		fi
> >  		rm -f .gitignore
> >  		git init
> >  		check_git_config
> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/k=
ernel.bbclass
> > index 9c8036f4df01..5ed4a2e03c72 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -195,6 +195,12 @@ python do_symlink_kernsrc () {
> >              import shutil
> >              shutil.move(s, kernsrc)
> >              os.symlink(kernsrc, s)
> > +
> > +    # When not using git, we cannot figure out automatically the extra=
cted
> > +    # directory. So check it and throw a clear error.
> > +    if not os.path.isdir(os.path.join(d.getVar("WORKDIR"), "git")) and=
 \
> > +       not os.path.exists(os.path.join(s, "Makefile")):
> > +        bb.fatal("S is not set to the linux source directory. Check th=
e recipe and set S to the proper extracted subdirectory.")
> >  }
> >  # do_patch is normally ordered before do_configure, but
> >  # externalsrc.bbclass deletes do_patch, breaking the dependency of =20
>=20
> Sorry this has taken a bit of time to get to.

No problem.

> We can't check for "git" as the workdir directory in this test as it
> can be overridden in the fetcher. We'll need to find some other better
> approach.=C2=A0Can't we just use ${S}/Makefile ?

I'm not sure I got your point, however I agree. :-)

I'm not sure I got your point because in my patch I did try to mimick as
far as possible the same logic as the original code, which is:

        if [ -d "${WORKDIR}/git/" ]; then
                # case: git repository

		...
        else
                # case: we have no git repository at all.=20

		...

		### This is the check I have moved to kernel.bbclass ###
                if [ ! -f "Makefile" ]; then
                        bberror "S is not set to the linux source directory=
. Check "
                        bbfatal "the recipe and set S to the proper extract=
ed subdirectory"
                fi
		###

		...
	fi

So the bberror/bbfatal I moved is de facto inside a (if ! -d
${WORKDIR}/git && ! -f ${S}/Makefile) check, which is what I replicated
in kernel.bbclass.

On the other hand I agree that we could only check for ${S}/Makefile,
which is what I did in a draft version, and has the small side effect
of printing  the explanatory error message _also_ in the git case,
instead of a long-lined log concluded by "No rule to make target
'oldnoconfig'. Stop.".

So it looks like I'll be sending a v2 with simply the ${WORKDIR}/git
check removed.

> Please also copy Bruce on these changes going forward.

Sure, I will.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

