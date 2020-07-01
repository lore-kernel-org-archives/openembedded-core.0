Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.20610.1593608482413660586
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 06:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jhyweqR1;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id a8so18407510edy.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qecei3KAPwgng12aGTVdWcpgSoAPjRGI88GgBS3SonA=;
        b=jhyweqR1J1X/7Fvv0Hro/R2OuyTLbiamUbSDn+v0y0M9r8VvGnDmmJy5WxAAbK2Gv0
         PGrwKg37K607ptXM4M8PscY/AKEO53tT4Vd/cu0KSHERsU8n9ZVW7+oiOidGbG6lNPCY
         OuOM2QDsDnx0cm+RpDeGRMM0IC+Cb8DcAj9kKopzwVuGK8EkrhH3auPgSy9M4nTXzqYQ
         vYXjD6E+iit6FkIIX93Qfq1wjFtRp5qQyA3M4C7/N2J6y5Xmafi2DNirc7z161GrUrqF
         EJt5MdwupsX7HQT8mD/fShZp4MAO17TVwvDO+2WXi+vOfxB7SSC1nKae9NAaUjs/jNVK
         MTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qecei3KAPwgng12aGTVdWcpgSoAPjRGI88GgBS3SonA=;
        b=JE1VfwJnlBLcbNMGzPEwtrwAjLld4Xp2LjNllg5CNN/I4rJipBzJ6qkzs0lSMuiXGE
         1txu95ilvFQo/Af1F7LlpfVHO9RyG+wmiUat3TdPSzkgkvHOlXfOuRLbEiRL/CKsvXCD
         1AmnjGuzA/KemRtuALF3vU1Biqdwhr7Y+RAGfSli0xqHFMDNwp9+pBFtFnosYEkvdJmR
         wIyfDTGFjCQ4Q8c6jSnef9RfkU5kHhZQ69sDzpcO6nNMQwxkaukyGTT52slTAcguVMCv
         LzBwRax9++JSarbB8rYdOToBGJI2MeBGb4PL3atHPdylQPweVjQW+2gONQwQqIYobJlY
         24Yw==
X-Gm-Message-State: AOAM532XuF5gg9U6rHIksqekDAHn89O0LkDnIvI+cEb7jiSsfW+91kLr
	IUwPkILaPEWM98CPfl06hXTWXPQTr5ITGu4AILD2mSSHzbs=
X-Google-Smtp-Source: ABdhPJwzlK76K6wPJcweKj07kdPBlChAIsjYKpVM/jaqQhERON7kwVOq3yf7APeZ0Cn1FwXg2WwuhXHivWKKth8Ce3M=
X-Received: by 2002:aa7:c2cf:: with SMTP id m15mr4602105edp.27.1593608480941;
 Wed, 01 Jul 2020 06:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200701104628.32696-1-andrey.z@gmail.com> <CADkTA4N68p6gK-nO3mPJ0z+MtBDFJDjsvn0RpF=ou1+Wj-5UFQ@mail.gmail.com>
In-Reply-To: <CADkTA4N68p6gK-nO3mPJ0z+MtBDFJDjsvn0RpF=ou1+Wj-5UFQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 1 Jul 2020 09:01:09 -0400
Message-ID: <CADkTA4PbQdsZf5pCCPvZTmaBfGKkZvLihjabYBAdOudOw7OzAA@mail.gmail.com>
Subject: Re: [PATCH] kernel/yocto: fix search for defconfig from src_uri
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 1, 2020 at 8:58 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, Jul 1, 2020 at 6:46 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> >
> > Fetcher provides full paths to defconfig and scc files, which awk
> > comparison operator does not catch during construction of
> > src_uri_defconfig and sccs_from_src_uri lists. This causes the
> > src_uri_defconfig variable to come out empty, and fails further
> > validation if defconfig is only supplied via SRC_URI.
> >
> > Replace comparison operator with awk index function which searches for
> > sub-string during filtering, effectively placing defconfig from SRC_URI
> > into src_uri_defconfig and scc files in sccs_from_src_uri respectively.
> >
>
> Hmm. This passed all of my testing (defconfigs were picked up
> properly), can you share your test configuration ? I'd like to test
> this across my kernels, since I have even more corner cases than most.
>
> What issues did it cause in your build ? Was the defconfig skipped completely ?

Ooops. I see you did mention this in the log.

I do have an additional question though .. we only want to match
on"defconfig", not a substring of something else that contains
defconfig. Won't the replacement awk expression match more than just a
single 'deconfig' word ?

Which is again why I'd like to see your test config, because I was
testing against cases like that, and they all worked here.

Bruce

>
> Bruce
>
> > Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are processed first)
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > index 41d8620e67..059d78b7dc 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -156,9 +156,10 @@ do_kernel_metadata() {
> >         # a quick check to make sure we don't have duplicate defconfigs If
> >         # there's a defconfig in the SRC_URI, did we also have one from the
> >         # KBUILD_DEFCONFIG processing above ?
> > -       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
> > +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '(index($0, "defconfig") != 0) { print $0 }' RS=' ')
> >         # drop and defconfig's from the src_uri variable, we captured it just above here if it existed
> > -       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> > +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '(index($0, "defconfig") == 0) { print $0 }' RS=' ')
> > +
> >         if [ -n "$in_tree_defconfig" ]; then
> >                 sccs_defconfig=$in_tree_defconfig
> >                 if [ -n "$src_uri_defconfig" ]; then
> > --
> > 2.17.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
