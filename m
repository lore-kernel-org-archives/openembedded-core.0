Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.34261.1631011318599447060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 03:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hc1iC9nK;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id d16so15776861ljq.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f6jWiOeCJuSOgOBerF8LhDqhJiWi1kfs5qfvn0pLYvU=;
        b=hc1iC9nK2TVmYU54vRa0Q/QM8OkMJNGUFpMKnxPr3lZTEGi5dClK82aSegYZEsqh+1
         +odTEAEa3npcV62/6CajBSZkQeYJj6zxAAGT6n3ZLTqwSAjDgB1ECOil1EODk4H42Kor
         4coMj6GJtp8+JXwB+OK6Lohp1fME/mRo70VaSfKqtnQpFcSf7pUFIew3fZ2U0s+bHfl8
         viZPxrtrm8WzdicSXjEZXCFOl2OgXimw66fMjQhdgO8Dm848oi9R6bJUWsgg/4NMcgcp
         hc/R4bM2UtVspmvRKuFncQTCrvj1rjiLIYMp+rhRKI4nt2Kmw0rdG2kbIWvt0PfKXIQg
         qDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f6jWiOeCJuSOgOBerF8LhDqhJiWi1kfs5qfvn0pLYvU=;
        b=Rsz0L9tq+j5Gk1I8bhp0vDtvCCSBjE2uHQJFTmyxHDI8CQT/Einmo54GRWeMdwRoI/
         iGI83K7VfmDbWCSOwk+G+NMlJjEpwHKnFvlFDNvTmT15neRapAIk+td+UNBAAEiiTl5c
         QQOfjrsV/eYe1Xxm+vnYsg/D+ku9YBOZwYYPmuzwJ4uB6iiyBfaxCli1BkpX9wTGeC2o
         qZpPBnTx3gTUDP8L0wegb3rg36QWKodPBX+XKcKy8pyUB5fs/qdzzRXPwtXDOE04BZno
         7414BVFi77QpqervCMeRr/mRs1vi+djeASM91X2kn8gqNj3knkJGD2jhNhwffDbsi2AO
         gCLQ==
X-Gm-Message-State: AOAM532cxHkTau0tpabkgvny7S+Kzhob9ZxkrvGrP0ASdMJ/CRgPhN/J
	EUwJWBXn0uEtq4KbD8wvAeTSmQOFQxFp9xBXGnY=
X-Google-Smtp-Source: ABdhPJzTptpWBJ+GJ1nh2R9nlvAQQ/GSTk6FhQ8E896XyPlNI36uYiCRWKnJILuEl7rLSL9p47PdwWBypnoj+vEJ8oY=
X-Received: by 2002:a2e:7616:: with SMTP id r22mr13885098ljc.387.1631011316749;
 Tue, 07 Sep 2021 03:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210907062554.852167-1-hongxu.jia@windriver.com> <16A2841257B7E642.24606@lists.openembedded.org>
In-Reply-To: <16A2841257B7E642.24606@lists.openembedded.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 7 Sep 2021 12:41:13 +0200
Message-ID: <CAHtQpK5jrvp3qCoo3vXHZprwTo01xU_LQTAZwODSexJiQ=KUAg@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] Revert "sdk: fix relocate symlink failed"
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: hongxu <hongxu.jia@windriver.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 12:40 PM Andrey Zhizhikin via
lists.openembedded.org <andrey.z=gmail.com@lists.openembedded.org>
wrote:
>
> Hello Hongxu,
>
> On Tue, Sep 7, 2021 at 8:26 AM hongxu <hongxu.jia@windriver.com> wrote:
> >
> > The commit [7e71acd265 sdk: fix relocate symlink failed] is used to fix
> > regression issue caused by commit [bc4ee54535 sdk: Decouple default install
> > path from built in path], but hardknott does not contain commit bc4ee54535,
> > so commit 7e71acd265 should not be in hardknott neither, otherwise it caused
> > other regression issue.
> >
> > This reverts commit 7e71acd265637d54d5bf149ea36cefa581f60992.
>
> This has been already discussed for [dunfell], see [1].
>
> The actual proposal was to take the second commit rather than
> reverting the first one, which Steve did (see [2]).
>
> Can the same approach be applied to [hardknott]?

Ah, just saw Anuj took it for [hardknott]
(https://lists.openembedded.org/g/openembedded-core/message/155735).
:)


>
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >  meta/files/toolchain-shar-relocate.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
> > index ba873373e2..5433741296 100644
> > --- a/meta/files/toolchain-shar-relocate.sh
> > +++ b/meta/files/toolchain-shar-relocate.sh
> > @@ -72,7 +72,7 @@ fi
> >
> >  # change all symlinks pointing to @SDKPATH@
> >  for l in $($SUDO_EXEC find $native_sysroot -type l); do
> > -       $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$SDK_BUILD_PATH:$target_sdk_dir:") $l
> > +       $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
> >         if [ $? -ne 0 ]; then
> >                 echo "Failed to setup symlinks. Relocate script failed. Abort!"
> >                 exit 1
> > --
> > 2.27.0
> >
> >
> >
> >
>
> Link: [1]: https://lists.openembedded.org/g/openembedded-core/topic/85311771#155603
> Link: [2]: https://lists.openembedded.org/g/openembedded-core/message/155670
>
> --
> Regards,
> Andrey.
>
> 
>


--
Regards,
Andrey.
