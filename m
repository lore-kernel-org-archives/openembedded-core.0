Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.128.1615242365154950539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 14:26:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MWktGsft;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id q25so23637171lfc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 14:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w+nOXP/mGSf20TDVHCCQgARyOt5fBDXkLvqwXqSh9tE=;
        b=MWktGsftBhCi8Qh2evFC8SfNdiXP1sK5235WjXUk3LojmtefT2qoNW9gdI3mCOl2xD
         3XUJZLy+YhGb2qsWYu42NKXWy6v/eQsG45wi+C6AbR2oovXkh0tcEzwbCKTREkjj0TD2
         oy6seedUpIHe4SjZG6tJr5XkBls6Omm5PTschHzK3Qm3f3rfB8woJORiI8jlBVEkOYc2
         3FAtOt4IhxfI0vit9JilaC/2KB2aH1rUBFEIuJ+P4MQLnpajBNxrJ3Co9afQzw06ku6c
         Ey2+NgxEsA0dr/SzSSAqGLPgkMM/lMBh2YpNlZ04n5JmELcXguFiLZ9znZBPivZfKj1E
         aIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w+nOXP/mGSf20TDVHCCQgARyOt5fBDXkLvqwXqSh9tE=;
        b=DmbqB0Z7y5YCsxJZAw6HIyLxgNMr9R94BPt+TKCbSKytBKxA+WXXQOO2sP7aNiCTCy
         pkjWWNenGFcwtsM6/2pBvLtvxwR/uRbkNFQg0ilPcqoIl1h6lO3VuhcnU5gm2jjBfZph
         39W5W0KWZzU1V8e2lJG9RF7FXV/kDgo9NydOZY9AeiZa8av4kwvyfjzUe0Ecz3yBToF+
         jArv/ZyAUazlhslXQVUzDG3CLRmspmWe5ALKgaEUYrVe2Y/7aWe5T77g00uDaLEUL050
         97ucKATvyzJtqsGJf20iBPOLiC2Xmb0QYZD9p+FkdRB3svoOTa0rVesC/APXOO/MuQeG
         4+Hw==
X-Gm-Message-State: AOAM531gwMymunoIBSoWpKHRDdf0f6onqr95qqIYVOjM67HpaQf5QtOo
	Ph1/ZgtdolaOD9HwWNLdJbFVgdgtmCFeAu3Qn8g=
X-Google-Smtp-Source: ABdhPJz55tmdv+fAApllQxMlzWGwZrmkxnjcdXpBzV/K0uc46epJWDOyDRPdF5Po20ouWtpPO7oK58rPCa1l7MmZ1AA=
X-Received: by 2002:ac2:532c:: with SMTP id f12mr16624027lfh.73.1615242363197;
 Mon, 08 Mar 2021 14:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20210308193028.34418-1-raj.khem@gmail.com> <CAJ86T=WW59ZDOpvgEQXRCqwnJKCKpmVsUeFVPk8kUC5m8zCz=g@mail.gmail.com>
 <2a597a00-fbc0-470e-0f43-1d710c74aeaa@gmail.com>
In-Reply-To: <2a597a00-fbc0-470e-0f43-1d710c74aeaa@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 8 Mar 2021 14:25:51 -0800
Message-ID: <CAJ86T=UbEJ730gFbj=WtrGUO2=6+bbgHpuxcuSChV6uGxve3-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] resolvconf: add missing dependencies to RDEPENDS
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 8, 2021 at 2:15 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 3/8/21 2:11 PM, Andre McCurdy wrote:
> > On Mon, Mar 8, 2021 at 11:30 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> From: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
> >>
> >> resolvconf uses flock and readlink.
> >> So explicitly added dependencies on util-linux (for flock) and coreutils
> >> (for readlink).
> >> Note that the options used with flock and readlink are not part of the
> >> busybox implementations so full-fledged implementations are needed.
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>   meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
> >> index 6df96b699c..6da8cd6023 100644
> >> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
> >> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.87.bb
> >> @@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
> >>   LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
> >>   AUTHOR = "Thomas Hood"
> >>   HOMEPAGE = "http://packages.debian.org/resolvconf"
> >> -RDEPENDS_${PN} = "bash"
> >> +RDEPENDS_${PN} = "bash coreutils util-linux"
> >
> > util-linux-flock has its own package.
>
> yeah and busybox also provides flock too. Lets drop it

Busybox provides flock, but it doesn't support the -w option (wait
with timeout). Either the util-linux flock is required or resolvconf
needs to be patched to drop the -w option.

> > Patching resolvconf to use readlink -f (instead of readlink -m) should
> > be sufficient to allow it to work with busybox readlink.
> >
> >>   SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
> >>              file://fix-path-for-busybox.patch \
> >> --
> >> 2.30.1
> >>
> >>
> >> 
> >>
