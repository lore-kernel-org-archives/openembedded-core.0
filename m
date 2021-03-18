Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.5295.1616046380489082458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 22:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eH2y8xjJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id y2so828908qtw.13
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 22:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7yLqonY+ca6+I+k3+O6V29LVRz/4wnTHrYuNaHMg6i4=;
        b=eH2y8xjJdhVWeGrRNCTu7RUVeZ40nsSSbeumcFnTWjwV5yWIwZBJtG1cBB8T0xCqoW
         RRdTl5RrpoNx/y+OURg/QFrqg5hHZIMSJ2X9RjIOPdOfon3o9iG20BuL4RJxdc41MPTL
         FBJ5ZPJABrzW2iw3UOofMYamB5NV+OWRD4VNpkc3ZiPxjr41dI7Wf+2OzmwMnEJBp31C
         C8HZv9IXumjCH5yw0vdaWL8a7oF3WgKi6hQtyor21iJv8DoyjfFDQPNP/7tyj8hHgjas
         ZERUNl5mGobXT7GKIFEbRpsQ/Jy/Zf/kjRqJpIop8Y7DGbKSSv0h6E1+GqKGn5JKBM7D
         st1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7yLqonY+ca6+I+k3+O6V29LVRz/4wnTHrYuNaHMg6i4=;
        b=p7x3gSE3mKWLLq5dh2wT0QNQ0D2gkqKOOwKWW6Mwob2lnmlm7EOdgWYJ+rIA8PS4SB
         W6ulGl6Jq1pyb/hvdbX6L8yugx/rJNvI1x8sHOaLKFRql/HfK4USu6Zq2HckOfWce2in
         pSjkI0eRRXlxO7tHFtxuTvAdvgRKe2kgpO0G/4+pgaakIvxaO6Vv5GgwCM0v8xfmhsfD
         RLmLy5mZ8H+Sx1Sh4Rozq6GDZ6KO9tfd5MT8O4VZta5TRzawN60YrsIDIQkELjsWXvWt
         pUEUaJtRVzBw2HTydSFa3s74JdKABta3l7LPTksmsr8y5U+SJrP+C9EvEzBl6DEKFQt8
         iZnA==
X-Gm-Message-State: AOAM532KyzkdnLEAuXCsW7ayHV56EcUN2guWgVXQif3Xij+n53pVn/kJ
	kLOaDcBaTw8Bcl+u45BoqurHhaIcPlYhdxv+tOM=
X-Google-Smtp-Source: ABdhPJy0UhfBYMDNg+gTCx4KHX8TUuDDCZglBVnJ21OpWA01BaDuwSvSG+znxf85WcT6csUbUZ8FsyS7kiEmI8q6tCI=
X-Received: by 2002:ac8:4b6d:: with SMTP id g13mr2274344qts.369.1616046379593;
 Wed, 17 Mar 2021 22:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <166D505781F5EE94.19946@lists.openembedded.org>
 <166D50DC24E9BAF7.5206@lists.openembedded.org> <83c8832f-727d-2d71-2610-fb3d8540f246@windriver.com>
In-Reply-To: <83c8832f-727d-2d71-2610-fb3d8540f246@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Mar 2021 22:45:53 -0700
Message-ID: <CAMKF1sr2=3ip3GjA+touJ0QdVJFBZUwU5z4RGZRCfivhvh63=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] autotools: don't wipe elfutils macros
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 17, 2021 at 10:40 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> Hi Khem,
>
> Understood your concern, but skip elfutils here is the least code change
> and the gettext also use this means previously.

gettext perhaps can be pardoned since its the one providing these
macros in first place.

>
> Meanwhile, there should as least as possible recipe need to skip wiping
> macros. If no, we may need to reconsider the related implement in
> autotools.bbclass. From this perspective, I think we should better
> record the recipe in this general bbclass.

I agree, but so far it seems its only elfutils, if there are more then
please mentioned then to the list
and perhaps a different solution should be sought.

>
> Thanks,
>
> On 3/18/21 11:05 AM, Yu, Mingli wrote:
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > The below m4 macros files shipped with recipe will be removed if the
> > recipe use AM_GNU_GETTEXT.
> > gettext.m4
> > iconv.m4
> > lib-ld.m4
> > lib-link.m4
> > lib-prefix.m4
> > nls.m4 po.m4
> > progtest.m4
> >
> > After elfutils upgrades to 0.183, it begins to use AM_GNU_GETTEXT as the
> > commit (dd52d2ab Modernize gettext infrastructure) included, so the above
> > m4 macros files such as iconv.m4 is removed and it's bad as we need to
> > patch against iconv.m4 shippped with elfutils.
> >
> > So we skip elfutils to not let the elfutils m4 macros removed and also
> > fix below issue:
> >   $ bitbake elfutils -cconfigure && bitbake elfutils -cpatch -f
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >   meta/classes/autotools.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> > index 9dc8ebdaa7..4b462c5aba 100644
> > --- a/meta/classes/autotools.bbclass
> > +++ b/meta/classes/autotools.bbclass
> > @@ -203,7 +203,7 @@ autotools_do_configure() {
> >                               bbnote Executing glib-gettextize --force --copy
> >                               echo "no" | glib-gettextize --force --copy
> >                       fi
> > -             elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
> > +             elif [ "${BPN}" != "gettext" -a "${BPN}" != "elfutils" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
> >                       # We'd call gettextize here if it wasn't so broken...
> >                       cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
> >                       if [ -d ${S}/po/ ]; then
> >
> >
> >
> > 
> >
