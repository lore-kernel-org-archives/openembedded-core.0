Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.6872.1586431962625841406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 04:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id q22so7326997ljg.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 04:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=33e7seV4VEZapkpg7jZzlGzVb0F0DfUq3kndLSNWwMA=;
        b=aL7J/e7A3fLu0EHf9yNL6/lt8FaJVOMOCBLe6/rMytiB+TTtosVO7L98Wk10fl6AG0
         hpSHo9MFuSfHLOQNM/OtR2zeyNtp7p2KQbIZXA0Poe+ZbNPcE8Ff84HD4KxwFsnqiEXJ
         reDPaFIIDMsoY23MsqRXaVSaIG4vAlHmtWfhlKSjsfPIIxTPWgPDQNJ4Zb56y7GtVJ9b
         MdBCe7yRvZ2QvkhTQv08QSfN5TBxa+1Xlt1jikrzDOb6ka7olR4oqP/wpHzl/M+cmlJa
         pR5Y3e/qB0yTyC3CpdnecUO4irPygDsVFKZgv+g3l2WYFdKmyRfeHhmB9ch7D6Afd9eW
         thfQ==
X-Gm-Message-State: AGi0PuY8qnig7r7AJxLfFzve8JRaCVGIRU26YwcP2x2Z/Elw6x8NjL2C
	qTEGum/esiAVwqVfIov0Z2zp6fCFi1O2N8ZuwgM=
X-Google-Smtp-Source: APiQypK9PntuIAwgN+XeQwCnejLmtZflxKtQyoIPzW8VEgBRsu36RUAejq4FG8hH4AEGGqQ5iNYeI07mbfG3xVQJDn0=
X-Received: by 2002:a2e:9959:: with SMTP id r25mr8107720ljj.200.1586431960406;
 Thu, 09 Apr 2020 04:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200409104951.948242-1-ricardo@ribalda.com> <20200409121031.0efee461@ub1910>
In-Reply-To: <20200409121031.0efee461@ub1910>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Thu, 9 Apr 2020 13:32:23 +0200
Message-ID: <CAPybu_2CHmVa-sfhZdXzQ_PrkqCToZ-wd2rPnGo7bnEPzVEuvg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] wic: Fix permissions
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Paul

On Thu, Apr 9, 2020 at 1:10 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Thu,  9 Apr 2020 12:49:47 +0200
> Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
>
> > Hi
> >
> >
> > Today wic behaves differently if we run it from bitbake of directly from the
> > commandline.
> >
> > When it is run from bitbake, the permissions/usersnames are handled by the
> > pseudo database of the main image.
> >
> > When it is run from the comandline , it is run outside the main image database.
> >
> > This results on permissions/usernames not working ok on some usecases on both
> > bitbake and wic.
> >
> >
> > This is an attempt to fix all the permission bugs that I am aware from wic.
> > Using the following usecases
> >
> >
> > #exclude-path
> > part / --source rootfs --fstype=ext4 --exclude-path=home
> >
> > #split_partition
> > part / --source rootfs --ondisk sda --fstype=ext4 --exclude-path=etc/
> > part /etc --source rootfs --rootfs-dir=tmp/work/qt5222-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/ --fstype=ext4
> >
> > #multi_partition
> > part / --source rootfs --ondisk sda --fstype=ext4
> > part /export --source rootfs --rootfs=core-image-minimal-mtdutils --fstype=ext4
> >
> >
> > With the current master:
> > -------------------------
> > #exclude-path
> > From Bitbake: OK
> > wic cmdline: FAIL
> >
> > #split_partition
> > From Bitbake: OK
> > wic cmdline: FAIL, permissions invalid on both partitions
> >
> > #multi_partition
> > From Bitbake: FAIL second partition
> > wic cmdline: OK
> >
> >
> > After:  wic: Fix permissions when using exclude or include path
> > --------------------------------------------------------------------
> > #exclude-path
> > From Bitbake: OK
> > wic cmdline: OK
> >
> > #split_partition
> > From Bitbake: OK
> > wic cmdline: FAIL, permissions invalid on second partition
> >
> > #multi_partition
> > From Bitbake: FAIL second partition
> > wic cmdline: OK
> >
> >
> > After: wic: Fix multi images .wks with bitbake
> > ----------------------------------------------
> > #exclude-path
> > From Bitbake: OK
> > wic cmdline: OK
> >
> > #split_partition
> > From Bitbake: FAIL, permissions invalid on second partition
> > wic cmdline: FAIL, permissions invalid on second partition
> >
> > #multi_partition
> > From Bitbake: OK
> > wic cmdline: OK
> >
>
> This looks really good, are you able to automate any of these tests and put
> them in meta/lib/oeqa/selftest/cases/wic.py?

Havent done it before, but for sure I can give it a try.

Any good guide I can use? Last time I was playing with selftest
whenever I changed something on a test I had to run the whole test
from scratch, which is not very productive :).



>
> >
> >
> > After: wic: Add --change-directory argument
> > --------------------------------------------
> >
> > we can have a .wks like:
> > part / --source rootfs --ondisk sda --fstype=ext4 --exclude-path=etc/
> > part /etc --source rootfs --fstype=ext4 --change-directory=/etc
> >
> >
> > Wich works fine from bitbake and from cmdline, and has the same functionality as
> > split_partition.
> >
> >
> > Ricardo Ribalda Delgado (4):
> >   wic: Fix permissions when using exclude or include path
> >   wic: Fix multi images .wks with bitbake
> >   wic: Add --change-directory argument
> >   wic: Continue if excluded_path does not exist
> >
> >  meta/classes/image_types_wic.bbclass     |  8 +++-
> >  scripts/lib/wic/help.py                  |  6 +++
> >  scripts/lib/wic/ksparser.py              |  1 +
> >  scripts/lib/wic/partition.py             | 15 ++++---
> >  scripts/lib/wic/plugins/source/rootfs.py | 52 ++++++++++++++++++++++--
> >  5 files changed, 68 insertions(+), 14 deletions(-)
> >
>
> I'll give this a detailed review over the weekend. Looks good at first
> glance, though I may suggest renaming `--change-directory` to something else
> so it's more obvious what it's doing when you just read that in a wks file.
> Perhaps `--part-subdir`, I don't know. Let's not bikeshed it too much though.
>

I do not care about the name, I have used tar as "inspiration"

       -C, --directory=DIR
              Change  to DIR before performing any operations.  This option is
              order-sensitive, i.e. it affects all options that follow.

If you have any preference on the name I will take it.

Thanks!

> Thanks,
>
> --
> Paul Barker
> Konsulko Group



-- 
Ricardo Ribalda
