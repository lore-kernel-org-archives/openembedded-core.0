Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.2364.1616786543546185489
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 12:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cYrgiJqb;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id b14so9235493lfv.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 12:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xxpb1T+/J58uvsHJXOfmsw7204zWNUAF4P6jIZzIDlU=;
        b=cYrgiJqbVKSVp7rFh/n7dMFyMgtEAcMtyEcS/OxmkKX2DgGvf+U75SWfGlC7EaL7KM
         omXFBgr5mSYUmHEtsTMJasagTXXNQXGYoad6J5dnZTiQRJC9MOalPUdieW8pVFqxIa+A
         YJ6OMa3z0d7bBH7UHCpgWIwbXXFKbe6G7keNfFTsIu4PiDty/InxHqbefpy7UiV6WzYg
         7FK1Yb/i/6rBHo9dZBwkSNr82i4oV0G4xO9dkq5a1piX0tJB8JbFvaoAaSuoHUK9trFm
         pOm8mqlHMCbPn/KwCh6nFvVQhCXCgvU/M4tNJGrIqsAByGLAKeId4CfT7IDoZiaCjIV6
         9ISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xxpb1T+/J58uvsHJXOfmsw7204zWNUAF4P6jIZzIDlU=;
        b=Pur+0Va+RlU/SBRtwFqqX/Utq0mMioYUPXAeQiAhqGFANmsNO9utsAH3TyWS9Aq1l5
         f3bNS5H0vONQVg1ikj/8OqbR78uQedtpiggRgNt6S0sQ9GvQcD6Yuc7mFtu9mC5Xugjl
         ZcnQyZZuXHRH8N/RLCf99qjHvOOQiypAd4XkRfrkFfWoGrGQC09a9RfHVbP5uve3Cgr3
         BCTBbaf/cR8QC4HbkyJt59njSFSUZI/5JSLUT/sexBGlaV05ZOV0Cide/3a8idJ9GxGW
         QQQTQv9hWbpyyGsVTrlhM252pBh1DUiqZfh6HN+UsnFoJAnGUkPtU53RkaISTGFWitnS
         JGNg==
X-Gm-Message-State: AOAM533ptW3Xtlarq8Nu5ODvFH1LvRWiys0u24m7p4wmLFR6YoBq+cnF
	IJveBXLf8iLeehpHjCPx29EdBd8SgpyXmFdSx34=
X-Google-Smtp-Source: ABdhPJxijbk8jX3/vj1d5JPS4Q129mY4x6bWTqr3b41L8ZddF5/XJN8+XcxXZgY5J0hKhZuuknX2E7+BMi48tgduSe4=
X-Received: by 2002:ac2:5e3b:: with SMTP id o27mr8760707lfg.392.1616786541688;
 Fri, 26 Mar 2021 12:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <117b58d-f7c6-6187-dc33-66d75292cc58@crashcourse.ca>
In-Reply-To: <117b58d-f7c6-6187-dc33-66d75292cc58@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 26 Mar 2021 12:22:10 -0700
Message-ID: <CAJ86T=W8ooDN4td5n1-c_WDpUV6P3wwHQP_f2QyOSYdRXHK_Ag@mail.gmail.com>
Subject: Re: [OE-core] some trivial(?) questions about packagegroups
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 26, 2021 at 8:45 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   what should be easy questions about packagegroups, inspired by my
> running across some puzzling packagegroup recipes in my travels
> recently. (i'll start with examples out of oe-core).
>
>   first, as with any other recipe, given a "trivial" packagegroup
> like, say, packagegroup-core-eclipse-debug.bb:
>
>   SUMMARY = "Remote debugging tools for Eclipse integration"
>
>   inherit packagegroup
>
>   RDEPENDS_${PN} = "\
>     gdbserver \
>     tcf-agent \
>     openssh-sftp-server \
>     "
>
> there is no need to add a "PROVIDES" line since every recipe file
> automatically provides its own name. so far, so good.
>
>   if we move up to packagegroup-core-nfs.bb, note how this recipe file
> defines two additional packagegroups, and has to add a PROVIDES line
> in order to make those new names accessible:
>
>   PROVIDES = "${PACKAGES}"
>   PACKAGES = "${PN}-server ${PN}-client"
>
>   SUMMARY_${PN}-client = "NFS client"
>   RDEPENDS_${PN}-client = "nfs-utils-client"
>
>   SUMMARY_${PN}-server = "NFS server"
>   RDEPENDS_${PN}-server = "\
>     nfs-utils \
>     nfs-utils-client \
>     "
>
> so the question is, must one supply a PROVIDES line for any
> packagegroup names above and beyond the one that comes with the recipe
> file itself? i ask what seems like a dumb question as i've run across
> packagegroup recipe files that define multiple additional
> packagegroups, but do not add them to the PROVIDES line. what is that
> supposed to represent?

PROVIDES sets up a name which can be used as DEPENDS (ie a build time
dependency) in other recipes. If PROVIDES contains more than one name,
they all just become aliases for each other.

Since packagegroup recipes only define run time dependencies, nothing
should have a build time dependency on a packagegroup recipe... and so
there's no obvious reason to set PROVIDES to anything. Leaving the
default will be fine (although it won't be used for anything).
