Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web12.2617.1596015756306782483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 02:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=r9xc7Vwj;
 spf=pass (domain: konsulko.com, ip: 209.85.167.195, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f195.google.com with SMTP id v13so3570324oiv.13
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 02:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CN12S9V4ZA6FyiQmtD8dzGQC+rcquuxlAgax8i1Hcvo=;
        b=r9xc7Vwj80u8Y1mq3P/O5MKp40rTEqV5OkWPDbzuGGQ60CSgkvUrvXR3tHVGqliDJD
         1p7o+R3P9I3hVwLxxuRJUrhYOI9of6ewe/VdqLOAw0Tiysg8WzBSPMnMJ27imPlCig+C
         5NeaZynOlyMPrGEu0+35UfttgHREzHv/jGDmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CN12S9V4ZA6FyiQmtD8dzGQC+rcquuxlAgax8i1Hcvo=;
        b=AtcDmLMUc6pcgkljQTWMtl+KhHye1JamDfxvJZ8y+d4Y5X4A2tPGaBlNzGSBLnOP19
         qi3je5jXpwadIsAxi1qHFKglVVOTrAy0sLwgUQ0Ibm+ZNHfh2Og9+tYOHp8QVzNfp5oc
         Oe30vcLRyzaZLj2mZDwW+46X+UILTsi/fArfN/o6pMx+MN89zor0Wuhojm4zpC6d6slb
         0DL5Ah8Pa98S+5aV3O0ssCCxBatwzvNcNjWT8sUJ52iElVRDhI0eOPySN4r8aIqQJIgL
         /dJ3m1jmzo9o6B10YDeS1kR1HtH19Mdy5etlipN7AZFdLWqMXKUROOf2hV91QGLUUDUi
         qs9w==
X-Gm-Message-State: AOAM5308Da1KBL3wmEaHI1X/TOpgcMprf9rWYSa49+1jiPV0/xgkBMb4
	ndAMmstH2dpMYwAYeFvKJrY+Ak0tmNeSESOHUV4hWL9l
X-Google-Smtp-Source: ABdhPJzx6AgSlZ7RXEnFi05h3LIb5wwgHvf4+pBu5mZ+lcqy40pR7DaSlUYJLdzlBgxDPao3bIr1sK1ZKy1MskItyE0=
X-Received: by 2002:aca:cc50:: with SMTP id c77mr6559405oig.152.1596015755511;
 Wed, 29 Jul 2020 02:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <3040885.oeqThZ24Ku@n95hx1g2>
In-Reply-To: <3040885.oeqThZ24Ku@n95hx1g2>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 29 Jul 2020 10:42:25 +0100
Message-ID: <CAM9ZRVsDE8Lxd5OsrxoP3htDjc2CuEFu4Hrkh=MOkC0BNt8ngA@mail.gmail.com>
Subject: Re: [OE-core] archiver.bbclass and GIT repositories
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jul 2020 at 13:56, Christian Eggers <ceggers@arri.de> wrote:
>
> In my project, the linux kernel (together with dozens of our changes) is kept
> in a company internal GIT repository. The GPLv2 requires the following:
>
> > 2a) You must cause the modified files to carry prominent notices stating
> > that you changed the files and the date of any change.
>
> My idea is, that the GIT history (and diff) should be sufficient for documenting
> our changes to the linux source code.
>
> But when I unpack the .tar.gz file which was deploy by archiver.bbclass,
> I get the following:
>
> # tar -xf my-linux-kernel.tar.gz
> # cd <temporary directory name>/git
> # git log
>
> > error: object directory /srv/gitlab-runner/downloads/[..]/yocto/git2/[xxx].git/objects does not exist; check .git/objects/info/alternates
> > fatal: bad object HEAD
>
> Note: The project has been built on another machine.
>
> From the bitbake user manual, 4.3.5, Git Fetcher:
> > "This bare clone is then cloned into the work directory during the unpack
> > stage when a specific tree is checked out. This is done using alternates and
> > by reference to minimize the amount of duplicate data on the disk and make
> > the unpack process fast."
>
> It looks like the .git directory within the tar archive doesn't contain
> the necessary information required for using the "git" command on
> the extracted "working copy". If I understood the bitbake doc correctly,
> the working copy is cloned "by reference" from a "bare" clone which
> resided outside the archived directory (in the downloads dir).
>
> So I have three questions:
> 1. Is it possible to archive the git project in a way, that the GIT history
> can be examined later?
> 2. If this is not possible, I would have to put my changes in an
> "external" patch file alongside the bitbake recipe, right?
> 3. Is there any value archiving the .git directory at all?

What configuration are you using to enable the archiver? There may be
ways to fix this by changing the configuration.

Also, which Yocto Project version/branch are you using?

Thanks,

-- 
Paul Barker
Konsulko Group
