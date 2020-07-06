Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.61885.1594053511980765902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DBLfwI68;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.46, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f46.google.com with SMTP id a8so34400196edy.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s9wByrGdYOQkBgjrJZ3cWL/ZTVAW/Ttw98ABoAlDsSg=;
        b=DBLfwI68B5UnNVsmE+FPB+GP+qIzh23zdCAG74Rl+b8Hw9KBcjZU5Z+VaZQIJiiGar
         xYmxIAHltpBaU/VGyDQwpNb0lAH+23JSaSGJ/rmacnmX6xY3iXRis78x6ofce2gJD6xv
         C602mbUgJnlD7yhusmsV+6sL+90LSAF/VTxDEEomL2AlN/vK8Yna1s+XyAAzI+O3c+mL
         IAEsjHbTeWOxl5TzmG65Iwz9mqf6Z0ODg8Y4pstqco7+mTWlR0ngn83/+zGcvwQoS9d5
         jOiMQDdLJKAoQ+AlVFUy7zIcEv70pscaw/IcjVA2O+xW6HEGyKVZ+IBIB6pN7UyHvuJ4
         RNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s9wByrGdYOQkBgjrJZ3cWL/ZTVAW/Ttw98ABoAlDsSg=;
        b=R/Ba5VEqYQObxa77z8wDdsOXWLQzDPvZ//HjqZG/gXyBjkTTr/rhrIGSfa8p2h+lnn
         B2TfbD/3NeHOQrdRvvsL5hkd2JlKRyGByJl7N4/AB+sr8M6H+j/C4BeKY5LhLbOIWZuc
         Jq4GCJqL+LiBpKidZckfF2mo+T0s9NtxWDTDBYOkKNphL6KClmibGMubYfVlsypfvXFx
         P3/PdGAd/9amgxUJ5fXuE78j/e5VhQugUvqK7+sxAZq9onvYffvgY5hfhG/fWKun6LoM
         94rz/rQQtYfif9yIVyQ5ilvvJx7ma/6MSwEtR+6MD02Qy+Jv407rHL4Oe9ueEyk3Zm/K
         QNgQ==
X-Gm-Message-State: AOAM533jJSMzXQZCchBzaayowLvhcuhaJWSB117vHa/A3HSuAfikcUm6
	hUX2RDvafi6+0blxCSdHjyK8Rb4goq8P+TiZkToZCg==
X-Google-Smtp-Source: ABdhPJzNKRLVfQ/NA8JPSFq+C/AufH3CgoqTV62odFJUE+BI//+Cw02AlyOJAMXAT/6R0/KU6Bdg3dYc7hY8f8d9pho=
X-Received: by 2002:aa7:db53:: with SMTP id n19mr27589742edt.338.1594053510348;
 Mon, 06 Jul 2020 09:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594050175.git.steve@sakoman.com> <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
 <CADkTA4Nyy_=+bXfiaXoHPzZHDsdHmfAX=tjzarrz3_y-Sw=3tw@mail.gmail.com>
In-Reply-To: <CADkTA4Nyy_=+bXfiaXoHPzZHDsdHmfAX=tjzarrz3_y-Sw=3tw@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 6 Jul 2020 06:38:19 -1000
Message-ID: <CAOSpxdYXtK=5=QhGEGiJbx1_zzQp2LmnnHBfAbZ8uL1W01hTdg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> We have a fixup patch for this one in test right now, so we don't want
> this patch, without the follow up.
>
> But this is useful for dunfell, since it was an unexpected behaviour
> that needed to be fixed.

Thanks, I'll drop this patch from the pull request and include it
along with the fixup patch in next week's patch set.

Steve

> On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > It is uncommon that a BSP definition and a defconfig are used in
> > a single configuration. That being said, it is a valid way to
> > organize kernel configuration meta data.
> >
> > When a defconfig is used, either on the src_uri or from in
> > the kernel tree, it is normally expected that it is the baseline,
> > with all options applied on top of it.
> >
> > With this commit, we detect either type of defconfig and ensure
> > that it is used first, followed by the fragments in their
> > previous order. This allows existing configuration stacks to
> > remain the same, while ensuring that a defconfig combined stack
> > works as expected.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit e6845327b69396d843a2f3c4c3ac9400ae9caedf)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 33 ++++++++++++++++++++-----------
> >  1 file changed, 21 insertions(+), 12 deletions(-)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > index 5bc627066e..41d8620e67 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -131,7 +131,7 @@ do_kernel_metadata() {
> >                         else
> >                                 cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
> >                         fi
> > -                       sccs="${WORKDIR}/defconfig"
> > +                       in_tree_defconfig="${WORKDIR}/defconfig"
> >                 else
> >                         bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
> >                 fi
> > @@ -153,14 +153,24 @@ do_kernel_metadata() {
> >         patches="${@" ".join(find_patches(d,''))}"
> >         feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
> >
> > -       # a quick check to make sure we don't have duplicate defconfigs
> > -       # If there's a defconfig in the SRC_URI, did we also have one from
> > -       # the KBUILD_DEFCONFIG processing above ?
> > -       if [ -n "$sccs" ]; then
> > -           # we did have a defconfig from above. remove any that might be in the src_uri
> > -           sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> > +       # a quick check to make sure we don't have duplicate defconfigs If
> > +       # there's a defconfig in the SRC_URI, did we also have one from the
> > +       # KBUILD_DEFCONFIG processing above ?
> > +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
> > +       # drop and defconfig's from the src_uri variable, we captured it just above here if it existed
> > +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> > +       if [ -n "$in_tree_defconfig" ]; then
> > +               sccs_defconfig=$in_tree_defconfig
> > +               if [ -n "$src_uri_defconfig" ]; then
> > +                       bbwarn "[NOTE]: defconfig was supplied both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
> > +               fi
> > +       else
> > +               # if we didn't have an in-tree one, make our defconfig the one
> > +               # from the src_uri. Note: there may not have been one from the
> > +               # src_uri, so this can be an empty variable.
> > +               sccs_defconfig=$src_uri_defconfig
> >         fi
> > -       sccs="$sccs $sccs_from_src_uri"
> > +       sccs="$sccs_from_src_uri"
> >
> >         # check for feature directories/repos/branches that were part of the
> >         # SRC_URI. If they were supplied, we convert them into include directives
> > @@ -187,11 +197,10 @@ do_kernel_metadata() {
> >         # expand kernel features into their full path equivalents
> >         bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
> >         if [ -z "$bsp_definition" ]; then
> > -               echo "$sccs" | grep -q defconfig
> > -               if [ $? -ne 0 ]; then
> > +               if [ -z "$sccs_defconfig" ]; then
> >                         bbfatal_log "Could not locate BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
> >                 fi
> > -
> > +       else
> >                 # if the bsp definition has "define KMETA_EXTERNAL_BSP t",
> >                 # then we need to set a flag that will instruct the next
> >                 # steps to use the BSP as both configuration and patches.
> > @@ -206,7 +215,7 @@ do_kernel_metadata() {
> >         elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
> >         if [ -n "${elements}" ]; then
> >                 echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
> > -               scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> > +               scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEATURES}
> >                 if [ $? -ne 0 ]; then
> >                         bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
> >                 fi
> > --
> > 2.17.1
> >
> > 
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
