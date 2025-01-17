Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FA2C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 04:24:56 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.4174.1737087886249506115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 20:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dbLyvfjH;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so2935730a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 20:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737087886; x=1737692686; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0nh6OEt1QlQU7YoQT5Btwc5ltyPHnYng1Pi+zSDYLMM=;
        b=dbLyvfjHB/k5C72ygB9q16fpvmMYY209wKvI/gKB/vXsduIeP+B4v7PeoGN1vaEV6E
         FSn9uWdiaHeL5o6gQEsDWSGwhxwllwlKhHETs7JiG57PV6XPn9+2XsmugFJ5XYeaSl5f
         T3XMRkr56nA71x42QuuofNu5rbkbM/nXzGwrv0H+xT1+5LYJnRwjkiCEbGynhz9gWcuI
         +mo2CyDwG3j6TggnFCFSqrzfO9HfpJxNMREm26fmzNUxE7nyWPD381jLljIoZClrEFpa
         H14fBTtIapnn97mkkeJMs5IJX8MyjXTEBSgfmM6LfyVIVhUM0eY4gQDA3nw5rvMTv6Kf
         DJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737087886; x=1737692686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0nh6OEt1QlQU7YoQT5Btwc5ltyPHnYng1Pi+zSDYLMM=;
        b=xHO+PiVcGgTrAY0HKAx6wNLJIgP68vEb1J5bl5Ro4vRHqmTZir24UGvDOC7AztrUUw
         O/2jMzgaDvAZ+5tODoaj4epRenjer5clz1aiY7FBjv8VGB6Lcv6/pOd3GY+VMMGIsKCY
         pSNfzrmpn6FNKkGr9pNZ8OSvUfFIxjYHm+nQlI35zvLt2h5XCLvnkrY/Bvued1r75TK6
         ny20X8Xdxcu4XyJuS278fFf5EBF692XJGZScb+gBuVA+pJ66a8549cf8qcXY8EqMq/iY
         QIX25fpGJ8F8+5ONsq6BevDZ3Ht2cFiV+RrObbg1PFVdR8rTBiccuGRt/jDBnIb1XpHV
         SXOg==
X-Gm-Message-State: AOJu0YzIe6Sa60E25Nd53sa+AwB2aXOnAEvFnAVOMQVLNv1mk87ZT6vq
	b2KSsTA0X+1rwYQDg0GfnLYRiKHOi8VNmzMZvqT+QerRx1+YplVZ6U8x5hQuVqr/1wMvFNk+wGN
	Qnns3nR1lGmmM7nNr4pguUZz8vPVrMU/6KJnSKw==
X-Gm-Gg: ASbGnctRUvPgg2XVuUhfGXpYm1eEP8p0L8QywE1geHMxwsEnr5tm6JzMNMI2JMdQGMU
	5a3Irl8KfeFaRjUEmWiJkjHvz4jtKoZIPRijXgt8=
X-Google-Smtp-Source: AGHT+IGKZNTy3VbNq3nIOpj7EghwOp2mHDUzOxMp24fb28IOyqkSxnMjVwrVYe6Oh5+vaK5FzZabC8TZdzhDYeElon8=
X-Received: by 2002:a17:90b:2dc2:b0:2ee:6db1:21d3 with SMTP id
 98e67ed59e1d1-2f782d323a6mr1645509a91.25.1737087885650; Thu, 16 Jan 2025
 20:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20241217074547.1601328-1-ejo@pengutronix.de> <CADkTA4O+QD=OScLw6-9Tq6UpOnV88AVBxByye+OA=4FXANwG-Q@mail.gmail.com>
 <91576a7cb37a545ae04980bb771f3d20aa571387.camel@pengutronix.de>
In-Reply-To: <91576a7cb37a545ae04980bb771f3d20aa571387.camel@pengutronix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 16 Jan 2025 23:24:34 -0500
X-Gm-Features: AbW1kvZP9up4sAbydZolZ2BKCsMJIVS7wVDP5ldQAUG_8n7K8CY_etd4H9-Mi2s
Message-ID: <CADkTA4Ps8P=kR2Zq9W_z1Qpn1ze79fh6M5Q==6+2R4kw0z93tQ@mail.gmail.com>
Subject: Re: [PATCH] kernel-yocto: make kernel commits reproducible
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Felix Kloeckner <F.Kloeckner@weinmann-emt.de>
Content-Type: multipart/alternative; boundary="0000000000005e337f062bdf4ac2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 04:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209974

--0000000000005e337f062bdf4ac2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 9:19=E2=80=AFAM Enrico J=C3=B6rns <ejo@pengutronix.=
de> wrote:

> Am Freitag, dem 20.12.2024 um 09:59 -0500 schrieb Bruce Ashfield:
> > On Tue, Dec 17, 2024 at 2:46=E2=80=AFAM Enrico J=C3=B6rns <ejo@pengutro=
nix.de> wrote:
> > > The git commit hashes for the kernel checkout are not reproducible
> under
> > > certain conditions:
> > >
> > > - If the git repository is initialized on an archive (rather than a
> > >   git), the initial git commit not only has the current user name set=
,
> > >   it also uses the current system time as committer and author date.
> > >   This will affect the initial git hash and thus all subsequent ones.
> > >
> > > - The patches applied by the kern-tools have a valid author and date.
> > >   However, their committer again depends on the user building the BSP=
.
> > >
> > > This is an issue, for example, if one compiles a kernel with
> > > CONFIG_LOCALVERSION_AUTO enabled where the commit hash lands into the
> > > kernel and thus the package version. This not only makes the package
> > > version non-reproducible, but also leads to version mismatches betwee=
n
> > > kernel modules built against a fresh kernel checkout and the kernel
> > > retrieved from the sstate cache.
> > >
> > > The class uses 'check_git_config', but this only sets the git user an=
d
> > > only if none existed before. Thus it doesn't really help here.
> > >
> > > Since in Git the committer information can be set only from the
> > > environment variables GIT_COMMITTER_NAME, GIT_COMMITTER_EMAIL, and
> > > GIT_COMMITTER_DATE, we introduce the helper function
> > > 'reproducible_git_committer' here to set those.
> > > As values simply use PATCH_GIT_USER_NAME, PATCH_GIT_USER_EMAIL (from
> > > patch.bbclass) and SOURCE_DATE_EPOCH.
> > >
> > > Using this helper makes the committer date/name/email for the initial
> > > reproducible, as well as the committer name/email for the patches
> > > applied with kern-tools.
> > >
> > > What's still missing is the initial commit's date/name/email which we
> > > just set explicitly via command line arguments.
> > >
> > > Suggested-by: Felix Kl=C3=B6ckner <F.Kloeckner@weinmann-emt.de>
> > > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > > ---
> > >  meta/classes-recipe/kernel-yocto.bbclass | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> > > index a5d89dc2c8..1ba2f91e62 100644
> > > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > > @@ -9,6 +9,12 @@ SRCTREECOVEREDTASKS +=3D "do_validate_branches
> do_kernel_configcheck
> > > do_kernel_che
> > >  PATCH_GIT_USER_EMAIL ?=3D "kernel-yocto@oe"
> > >  PATCH_GIT_USER_NAME ?=3D "OpenEmbedded"
> > >
> > > +reproducible_git_committer() {
> > > +       export GIT_COMMITTER_NAME=3D"${PATCH_GIT_USER_NAME}"
> > > +       export GIT_COMMITTER_EMAIL=3D"${PATCH_GIT_USER_EMAIL}"
> > > +       export GIT_COMMITTER_DATE=3D"$(date -d @${SOURCE_DATE_EPOCH})=
"
> > > +}
> >
> > These would be better set in the same class and I'd argue
> > that they should just be set in same function  as our other
> > settings check_git_config()
> >
> > While the check_git_config name might not convey it, the
> > original intent of that routine was to make sure that if what we
> > needed wasn't set, that we'd configure/set it for the upcoming
> > git commands.
>
> Yeah. Maybe it's useful for others, too.
> Will move it to utils.bbclass.
>
> > Is there any reason this wouldn't work when exported from
> > classes-global/utils.bbclass ?
>
> None that I would know of.
>
> > We also have already have get_kernel_source_date_epoch(),
> > that should be used instead of going directly at
> > SOURCE_DATE_EPOCH (unless the routine is causing a
> > problem, and then I'd be interested in hearing what it is).
>
> Cannot find a method named 'get_kernel_source_date_epoch()' in any class.
> Just find other parts of the kernel classes using SOURCE_DATE_EPOCH
> directly.
> Could you give me a hint what I have to look at?
>

HAH!!!!! I'm not all that bright, I forgot that was my own local commit:

commit 5b2b393c70243cdfa04fccd13b1bf599e5d8abed
Author: Bruce Ashfield <bruce.ashfield@gmail.com>
Date:   Tue May 12 15:05:19 2022 -0400

    kernel/reproducibility: factor kernel source epoch for common use

    Rather than duplicating the code to generate the kbuild environment
    variable: KBUILD_BUILD_TIMESTAMP, we can factor the checks into a
    python function and call it from the main image and kernel module
    do_compile routines.

    All paths have been checked and the timestamp is identical to the
    previous shell variant.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

And a rather old one that that :)

So ignore that part of the comment, going at the variable itself
is the only option at the moment.


> > There are some builds that for debugging purposes
> > we want to inhibit all reproducibility and forced setting of
> > timestamps, so setting these options should be
> > conditional on KERNEL_DEBUG_TIMESTAMPS not being
> > set. I realize that this is a slightly different use of setting
> > the timestamp as when we build the kernel, but it would
> > still be useful to disable the forced timestamp in some
> > scenarios.
>
> I have no opinion on this and will do as suggested.
> If timestamps change I'd assume that I can safely ignore all
> reproducibility features, right?
>

Correct!

Would make it easier then by just guarding the call to
> 'reproducible_git_commiter'.
>

Whatever is easier/cleaner makes sense to me. As long at it is something
that can be enabled/disabled in times of need :)



>
> > > +
> > >  # The distro or local.conf should set this, but if nobody cares...
> > >  LINUX_KERNEL_TYPE ??=3D "standard"
> > >
> > > @@ -349,6 +355,7 @@ do_patch() {
> > >         cd ${S}
> > >
> > >         check_git_config
> > > +       reproducible_git_committer
> > >         meta_dir=3D$(kgit --meta)
> > >         (cd ${meta_dir}; ln -sf patch.queue series)
> > >         if [ -f "${meta_dir}/series" ]; then
> > > @@ -431,8 +438,9 @@ do_kernel_checkout() {
> > >                 rm -f .gitignore
> > >                 git init
> > >                 check_git_config
> > > +               reproducible_git_committer
> > >                 git add .
> > > -               git commit -q -n -m "baseline commit: creating repo
> for ${PN}-${PV}"
> > > +               git commit --author=3D"${PATCH_GIT_USER_NAME}
> <${PATCH_GIT_USER_EMAIL}>" --
> > > date=3D${SOURCE_DATE_EPOCH} -q -n -m "baseline commit: creating repo =
for
> ${PN}-${PV}"
> > >
> >
> >
> > The author, author date and author email can also come from
> the environment
> > in my experiments.
>
> Yes, this works, too.
> Wasn't sure which way to go since e.g. patch.py also uses --author
> directly.
>

Organically and incrementally developed things aren't great for
consistency, that is for sure!

Cheers,

Bruce



> > Can we just set them the same way as the other variables for consistenc=
y
> ?
>
> Maybe that's better anyway, yes.
>
>
> Regards, Enrico
>
> > Bruce
> >
> > >                 git clean -d -f
> > >         fi
> > >
>
> --
> Pengutronix e.K.                           | Enrico J=C3=B6rns           =
     |
> Embedded Linux Consulting & Support        | https://www.pengutronix.de/ =
|
> Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  =
|
> 31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    =
|
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000005e337f062bdf4ac2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 16, 2025 at 9:19=
=E2=80=AFAM Enrico J=C3=B6rns &lt;<a href=3D"mailto:ejo@pengutronix.de">ejo=
@pengutronix.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Am Freitag, dem 20.12.2024 um 09:59 -0500 schrieb Bruce Ashf=
ield:<br>
&gt; On Tue, Dec 17, 2024 at 2:46=E2=80=AFAM Enrico J=C3=B6rns &lt;<a href=
=3D"mailto:ejo@pengutronix.de" target=3D"_blank">ejo@pengutronix.de</a>&gt;=
 wrote:<br>
&gt; &gt; The git commit hashes for the kernel checkout are not reproducibl=
e under<br>
&gt; &gt; certain conditions:<br>
&gt; &gt; <br>
&gt; &gt; - If the git repository is initialized on an archive (rather than=
 a<br>
&gt; &gt; =C2=A0 git), the initial git commit not only has the current user=
 name set,<br>
&gt; &gt; =C2=A0 it also uses the current system time as committer and auth=
or date.<br>
&gt; &gt; =C2=A0 This will affect the initial git hash and thus all subsequ=
ent ones.<br>
&gt; &gt; <br>
&gt; &gt; - The patches applied by the kern-tools have a valid author and d=
ate.<br>
&gt; &gt; =C2=A0 However, their committer again depends on the user buildin=
g the BSP.<br>
&gt; &gt; <br>
&gt; &gt; This is an issue, for example, if one compiles a kernel with<br>
&gt; &gt; CONFIG_LOCALVERSION_AUTO enabled where the commit hash lands into=
 the<br>
&gt; &gt; kernel and thus the package version. This not only makes the pack=
age<br>
&gt; &gt; version non-reproducible, but also leads to version mismatches be=
tween<br>
&gt; &gt; kernel modules built against a fresh kernel checkout and the kern=
el<br>
&gt; &gt; retrieved from the sstate cache.<br>
&gt; &gt; <br>
&gt; &gt; The class uses &#39;check_git_config&#39;, but this only sets the=
 git user and<br>
&gt; &gt; only if none existed before. Thus it doesn&#39;t really help here=
.<br>
&gt; &gt; <br>
&gt; &gt; Since in Git the committer information can be set only from the<b=
r>
&gt; &gt; environment variables GIT_COMMITTER_NAME, GIT_COMMITTER_EMAIL, an=
d<br>
&gt; &gt; GIT_COMMITTER_DATE, we introduce the helper function<br>
&gt; &gt; &#39;reproducible_git_committer&#39; here to set those.<br>
&gt; &gt; As values simply use PATCH_GIT_USER_NAME, PATCH_GIT_USER_EMAIL (f=
rom<br>
&gt; &gt; patch.bbclass) and SOURCE_DATE_EPOCH.<br>
&gt; &gt; <br>
&gt; &gt; Using this helper makes the committer date/name/email for the ini=
tial<br>
&gt; &gt; reproducible, as well as the committer name/email for the patches=
<br>
&gt; &gt; applied with kern-tools.<br>
&gt; &gt; <br>
&gt; &gt; What&#39;s still missing is the initial commit&#39;s date/name/em=
ail which we<br>
&gt; &gt; just set explicitly via command line arguments.<br>
&gt; &gt; <br>
&gt; &gt; Suggested-by: Felix Kl=C3=B6ckner &lt;<a href=3D"mailto:F.Kloeckn=
er@weinmann-emt.de" target=3D"_blank">F.Kloeckner@weinmann-emt.de</a>&gt;<b=
r>
&gt; &gt; Signed-off-by: Enrico J=C3=B6rns &lt;<a href=3D"mailto:ejo@pengut=
ronix.de" target=3D"_blank">ejo@pengutronix.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/classes-recipe/kernel-yocto.bbclass | 10 +++++++++-<br=
>
&gt; &gt; =C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/clas=
ses-recipe/kernel-yocto.bbclass<br>
&gt; &gt; index a5d89dc2c8..1ba2f91e62 100644<br>
&gt; &gt; --- a/meta/classes-recipe/kernel-yocto.bbclass<br>
&gt; &gt; +++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
&gt; &gt; @@ -9,6 +9,12 @@ SRCTREECOVEREDTASKS +=3D &quot;do_validate_branc=
hes do_kernel_configcheck<br>
&gt; &gt; do_kernel_che<br>
&gt; &gt; =C2=A0PATCH_GIT_USER_EMAIL ?=3D &quot;kernel-yocto@oe&quot;<br>
&gt; &gt; =C2=A0PATCH_GIT_USER_NAME ?=3D &quot;OpenEmbedded&quot;<br>
&gt; &gt; <br>
&gt; &gt; +reproducible_git_committer() {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_COMMITTER_NAME=3D&quot;${P=
ATCH_GIT_USER_NAME}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_COMMITTER_EMAIL=3D&quot;${=
PATCH_GIT_USER_EMAIL}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GIT_COMMITTER_DATE=3D&quot;$(d=
ate -d @${SOURCE_DATE_EPOCH})&quot;<br>
&gt; &gt; +}<br>
&gt; <br>
&gt; These would be better set in the same class and I&#39;d argue<br>
&gt; that they should just be set in same function=C2=A0 as our other<br>
&gt; settings check_git_config()<br>
&gt; <br>
&gt; While the check_git_config name might not convey it, the<br>
&gt; original intent of that routine was to make sure that if what we<br>
&gt; needed wasn&#39;t set, that we&#39;d configure/set it for the upcoming=
<br>
&gt; git commands.<br>
<br>
Yeah. Maybe it&#39;s useful for others, too.<br>
Will move it to utils.bbclass.<br>
<br>
&gt; Is there any reason this wouldn&#39;t work when exported from<br>
&gt; classes-global/utils.bbclass ?<br>
<br>
None that I would know of.<br>
<br>
&gt; We also have already have get_kernel_source_date_epoch(),<br>
&gt; that should be used instead of going directly at<br>
&gt; SOURCE_DATE_EPOCH (unless the routine is causing a<br>
&gt; problem, and then I&#39;d be interested in hearing what it is).<br>
<br>
Cannot find a method named &#39;get_kernel_source_date_epoch()&#39; in any =
class.<br>
Just find other parts of the kernel classes using SOURCE_DATE_EPOCH directl=
y.<br>
Could you give me a hint what I have to look at?<br></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">HAH!!!!! I=
&#39;m not all that bright, I forgot that was my own local commit:</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">commit 5b2b393c70243cdfa04fccd13b=
1bf599e5d8abed<br>Author: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfie=
ld@gmail.com">bruce.ashfield@gmail.com</a>&gt;<br>Date: =C2=A0 Tue May 12 1=
5:05:19 2022 -0400<br><br>=C2=A0 =C2=A0 kernel/reproducibility: factor kern=
el source epoch for common use<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Rather th=
an duplicating the code to generate the kbuild environment<br>=C2=A0 =C2=A0=
 variable: KBUILD_BUILD_TIMESTAMP, we can factor the checks into a<br>=C2=
=A0 =C2=A0 python function and call it from the main image and kernel modul=
e<br>=C2=A0 =C2=A0 do_compile routines.<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 =
All paths have been checked and the timestamp is identical to the<br>=C2=A0=
 =C2=A0 previous shell variant.<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Signed-o=
ff-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce=
.ashfield@gmail.com</a>&gt;<br></div></div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">And a rather old one that that :)</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">So ignore that part of the comment, going at the vari=
able itself</div><div class=3D"gmail_default" style=3D"font-size:small">is =
the only option at the moment.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
&gt; There are some builds that for debugging purposes<br>
&gt; we want to inhibit all reproducibility=C2=A0and forced setting of<br>
&gt; timestamps, so setting these options should be<br>
&gt; conditional on KERNEL_DEBUG_TIMESTAMPS not being<br>
&gt; set. I realize that this is a slightly different use of setting<br>
&gt; the timestamp as when we build the kernel, but it would=C2=A0<br>
&gt; still be useful to disable the forced timestamp in some<br>
&gt; scenarios.<br>
<br>
I have no opinion on this and will do as suggested.<br>
If timestamps change I&#39;d assume that I can safely ignore all reproducib=
ility features, right?<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">Correct!</div></div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
Would make it easier then by just guarding the call to &#39;reproducible_gi=
t_commiter&#39;.<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Whatever is easier/cleaner makes sense to =
me. As long at it is something that can be enabled/disabled in times of nee=
d :)</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; &gt; +<br>
&gt; &gt; =C2=A0# The distro or local.conf should set this, but if nobody c=
ares...<br>
&gt; &gt; =C2=A0LINUX_KERNEL_TYPE ??=3D &quot;standard&quot;<br>
&gt; &gt; <br>
&gt; &gt; @@ -349,6 +355,7 @@ do_patch() {<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 check_git_config<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reproducible_git_committer<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta_dir=3D$(kgit --meta)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 (cd ${meta_dir}; ln -sf patch.queue s=
eries)<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f &quot;${meta_dir}/series&quot=
; ]; then<br>
&gt; &gt; @@ -431,8 +438,9 @@ do_kernel_checkout() {<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f .gi=
tignore<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git init<=
br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check_git=
_config<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reproduci=
ble_git_committer<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git add .=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git commi=
t -q -n -m &quot;baseline commit: creating repo for ${PN}-${PV}&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git commi=
t --author=3D&quot;${PATCH_GIT_USER_NAME} &lt;${PATCH_GIT_USER_EMAIL}&gt;&q=
uot; --<br>
&gt; &gt; date=3D${SOURCE_DATE_EPOCH} -q -n -m &quot;baseline commit: creat=
ing repo for ${PN}-${PV}&quot;<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; The author, author date and author email can also come from the=C2=A0e=
nvironment<br>
&gt; in my experiments.<br>
<br>
Yes, this works, too.<br>
Wasn&#39;t sure which way to go since e.g. patch.py also uses --author dire=
ctly.<br></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Organically and incrementally developed things aren&#=
39;t great for consistency, that is for sure!</div></div><div><br></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small">Cheers,</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">Bruce</div><br></div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Can we just set them the same way as the other variables for consisten=
cy ?<br>
<br>
Maybe that&#39;s better anyway, yes.<br>
<br>
<br>
Regards, Enrico<br>
<br>
&gt; Bruce<br>
&gt; =C2=A0<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git clean=
 -d -f<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; <br>
<br>
-- <br>
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|<b=
r>
Embedded Linux Consulting &amp; Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| <a href=3D"https://www.pengutronix.de/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://www.pengutronix.de/</a> |<br>
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|<br>
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000005e337f062bdf4ac2--

