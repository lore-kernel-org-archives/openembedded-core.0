Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1BCC02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 14:19:30 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.49971.1737037166053965722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 06:19:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tYQiR-0003is-Mh; Thu, 16 Jan 2025 15:19:23 +0100
Message-ID: <91576a7cb37a545ae04980bb771f3d20aa571387.camel@pengutronix.de>
Subject: Re: [PATCH] kernel-yocto: make kernel commits reproducible
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, Felix
	Kloeckner <F.Kloeckner@weinmann-emt.de>
Date: Thu, 16 Jan 2025 15:19:22 +0100
In-Reply-To: <CADkTA4O+QD=OScLw6-9Tq6UpOnV88AVBxByye+OA=4FXANwG-Q@mail.gmail.com>
References: <20241217074547.1601328-1-ejo@pengutronix.de>
	 <CADkTA4O+QD=OScLw6-9Tq6UpOnV88AVBxByye+OA=4FXANwG-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 14:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209951

Am Freitag, dem 20.12.2024 um 09:59 -0500 schrieb Bruce Ashfield:
> On Tue, Dec 17, 2024 at 2:46=E2=80=AFAM Enrico J=C3=B6rns <ejo@pengutroni=
x.de> wrote:
> > The git commit hashes for the kernel checkout are not reproducible unde=
r
> > certain conditions:
> >=20
> > - If the git repository is initialized on an archive (rather than a
> > =C2=A0 git), the initial git commit not only has the current user name =
set,
> > =C2=A0 it also uses the current system time as committer and author dat=
e.
> > =C2=A0 This will affect the initial git hash and thus all subsequent on=
es.
> >=20
> > - The patches applied by the kern-tools have a valid author and date.
> > =C2=A0 However, their committer again depends on the user building the =
BSP.
> >=20
> > This is an issue, for example, if one compiles a kernel with
> > CONFIG_LOCALVERSION_AUTO enabled where the commit hash lands into the
> > kernel and thus the package version. This not only makes the package
> > version non-reproducible, but also leads to version mismatches between
> > kernel modules built against a fresh kernel checkout and the kernel
> > retrieved from the sstate cache.
> >=20
> > The class uses 'check_git_config', but this only sets the git user and
> > only if none existed before. Thus it doesn't really help here.
> >=20
> > Since in Git the committer information can be set only from the
> > environment variables GIT_COMMITTER_NAME, GIT_COMMITTER_EMAIL, and
> > GIT_COMMITTER_DATE, we introduce the helper function
> > 'reproducible_git_committer' here to set those.
> > As values simply use PATCH_GIT_USER_NAME, PATCH_GIT_USER_EMAIL (from
> > patch.bbclass) and SOURCE_DATE_EPOCH.
> >=20
> > Using this helper makes the committer date/name/email for the initial
> > reproducible, as well as the committer name/email for the patches
> > applied with kern-tools.
> >=20
> > What's still missing is the initial commit's date/name/email which we
> > just set explicitly via command line arguments.
> >=20
> > Suggested-by: Felix Kl=C3=B6ckner <F.Kloeckner@weinmann-emt.de>
> > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > ---
> > =C2=A0meta/classes-recipe/kernel-yocto.bbclass | 10 +++++++++-
> > =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-re=
cipe/kernel-yocto.bbclass
> > index a5d89dc2c8..1ba2f91e62 100644
> > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > @@ -9,6 +9,12 @@ SRCTREECOVEREDTASKS +=3D "do_validate_branches do_kern=
el_configcheck
> > do_kernel_che
> > =C2=A0PATCH_GIT_USER_EMAIL ?=3D "kernel-yocto@oe"
> > =C2=A0PATCH_GIT_USER_NAME ?=3D "OpenEmbedded"
> >=20
> > +reproducible_git_committer() {
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_COMMITTER_NAME=3D"${PATCH_GIT_US=
ER_NAME}"
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_COMMITTER_EMAIL=3D"${PATCH_GIT_U=
SER_EMAIL}"
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_COMMITTER_DATE=3D"$(date -d @${S=
OURCE_DATE_EPOCH})"
> > +}
>=20
> These would be better set in the same class and I'd argue
> that they should just be set in same function=C2=A0 as our other
> settings check_git_config()
>=20
> While the check_git_config name might not convey it, the
> original intent of that routine was to make sure that if what we
> needed wasn't set, that we'd configure/set it for the upcoming
> git commands.

Yeah. Maybe it's useful for others, too.
Will move it to utils.bbclass.

> Is there any reason this wouldn't work when exported from
> classes-global/utils.bbclass ?

None that I would know of.

> We also have already have get_kernel_source_date_epoch(),
> that should be used instead of going directly at
> SOURCE_DATE_EPOCH (unless the routine is causing a
> problem, and then I'd be interested in hearing what it is).

Cannot find a method named 'get_kernel_source_date_epoch()' in any class.
Just find other parts of the kernel classes using SOURCE_DATE_EPOCH directl=
y.
Could you give me a hint what I have to look at?

> There are some builds that for debugging purposes
> we want to inhibit all reproducibility=C2=A0and forced setting of
> timestamps, so setting these options should be
> conditional on KERNEL_DEBUG_TIMESTAMPS not being
> set. I realize that this is a slightly different use of setting
> the timestamp as when we build the kernel, but it would=C2=A0
> still be useful to disable the forced timestamp in some
> scenarios.

I have no opinion on this and will do as suggested.
If timestamps change I'd assume that I can safely ignore all reproducibilit=
y features, right?
Would make it easier then by just guarding the call to 'reproducible_git_co=
mmiter'.

> > +
> > =C2=A0# The distro or local.conf should set this, but if nobody cares..=
.
> > =C2=A0LINUX_KERNEL_TYPE ??=3D "standard"
> >=20
> > @@ -349,6 +355,7 @@ do_patch() {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}
> >=20
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 check_git_config
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0reproducible_git_committer
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta_dir=3D$(kgit --meta)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd ${meta_dir}; ln -sf patch.queue series)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f "${meta_dir}/series" ]; then
> > @@ -431,8 +438,9 @@ do_kernel_checkout() {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f .gitignor=
e
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git init
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check_git_confi=
g
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reproducible_gi=
t_committer
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git add .
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git commit -q -=
n -m "baseline commit: creating repo for ${PN}-${PV}"
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git commit --au=
thor=3D"${PATCH_GIT_USER_NAME} <${PATCH_GIT_USER_EMAIL}>" --
> > date=3D${SOURCE_DATE_EPOCH} -q -n -m "baseline commit: creating repo fo=
r ${PN}-${PV}"
> >=20
>=20
>=20
> The author, author date and author email can also come from the=C2=A0envi=
ronment
> in my experiments.

Yes, this works, too.
Wasn't sure which way to go since e.g. patch.py also uses --author directly=
.

> Can we just set them the same way as the other variables for consistency =
?

Maybe that's better anyway, yes.


Regards, Enrico

> Bruce
> =C2=A0
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git clean -d -f
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> >=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

