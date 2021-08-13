Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.33120.1628833267370050181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 22:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=J8WX7as0;
 spf=pass (domain: qtec.com, ip: 209.85.167.46, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f46.google.com with SMTP id x27so17940079lfu.5
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Aug 2021 22:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WJiElEPuVe2bcqFl0anx5TVeiU6oF7IFWNiVNollne8=;
        b=J8WX7as0Mwbt25fteVyaFv9peicOs45UDydhiW6tMMMcGUkCxYf3eZ52sGPJ+pD2Ix
         KXIpj9H+Y3R/mBySuZ05EX4T1o6AVkY65S9PknGfYbSDVNsJ9f4nclh6cn1GU7s4Cgdj
         in2Yu8ZCqsHb4cJZYF3QPzQ9jKwJ0+miNswiGpgE2ul/UGOwgNoljf6POp52HepfQtlk
         g4IYjnreDpj5maMlumHrDWoJ1RGYD3bQXOwpj3qsz23YXXc2U7a94FHTkdlaNZ44bSM2
         fvTitFfn2V8op5W2S/Xds6kDIMrvhghQ8KiBwoewrCWqcCivHrqdCdjz5wd4gnL+aLHO
         pvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WJiElEPuVe2bcqFl0anx5TVeiU6oF7IFWNiVNollne8=;
        b=e2bFuvYieGaJJW4cOSGqQNUt58vrDSK1tR/Bmy1lLW3GqF+vrB1rJSHEu/0JE0odMA
         ofXu0hjbI0TgzvkiflBzAT/v6kcgFMQmiy1cI4AfRjHXsJ+u04G3AUYFp2/hROU5aWvv
         pA96fX1h90nZSloEx6r+r2zIS7s8orPA/K5R3ekZBKBmYF6pq70xgml9Vy/IcuriWpCR
         M+BvyQgK6KcsO+IXFhWCvwkOFYIvXjewa+PbyhUkz5wWhrAiYAMMigf2O1dQkiWFq4HT
         C6cApj+gdt6/fTpFpRrq6dDVkffs4cs34vXvk2akDxd9UzvucNB5Didvf6iYLryAgtuP
         GZVw==
X-Gm-Message-State: AOAM533V25KhZZonVrnkp4IMGE6xPi9PO05yrqAH/Gm0biRsZjuWvONM
	QkvlzKCmm7fmBGaU/RJJrpI1Drx2HtTnEPJV9Q45MQ==
X-Google-Smtp-Source: ABdhPJy1a1CV8H8j+WdOSp8fCfSukabZbeFx5itHsYJb3zYS/cr+fzQ9MMh6R8zVzugDvpmqROKx4pm5ujChzvfkX0g=
X-Received: by 2002:a05:6512:3748:: with SMTP id a8mr511379lfs.59.1628833264652;
 Thu, 12 Aug 2021 22:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210810201101.261132-1-daniel@qtec.com> <20210810201101.261132-2-daniel@qtec.com>
 <YRVNoK+utVN0kCH4@piout.net>
In-Reply-To: <YRVNoK+utVN0kCH4@piout.net>
From: "Daniel Gomez" <daniel@qtec.com>
Date: Fri, 13 Aug 2021 07:40:53 +0200
Message-ID: <CAH1Ww+QQsbv7pkok9Ezw6eckzL=9Os7Kk-5K1Y+aE6UP6rSyeQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] oeqa: wic: Add tests for --no-fstab-update
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Daniel Gomez <dagmcr@gmail.com>, 
	Paul Barker <paul@pbarker.dev>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexandre,

On Thu, 12 Aug 2021 at 18:34, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> On 10/08/2021 22:11:01+0200, Daniel Gomez wrote:
> > Add tests for the --no-fstab-update wic part command.
> >
> > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/wic.py | 56 +++++++++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> > index 2efbe514c1..a58360851a 100644
> > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > @@ -11,6 +11,7 @@
> >  import os
> >  import sys
> >  import unittest
> > +import hashlib
> >
> >  from glob import glob
> >  from shutil import rmtree, copy
> > @@ -686,6 +687,61 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
> >                                        % (wks_file, self.resultdir), ignore_status=True).status)
> >          os.remove(wks_file)
> >
> > +    def test_no_fstab_update(self):
> > +        """Test --no-fstab-update wks option."""
> > +
> > +        oldpath = os.environ['PATH']
> > +        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
> > +
> > +        # Get stock fstab from base-files recipe
> > +        bitbake('base-files')
> > +        bf_fstab = os.path.join(get_bb_var('WORKDIR', 'base-files'),'image/etc/fstab')
> > +        bf_fstab_md5sum = runCmd('md5sum %s 2>/dev/null' % bf_fstab).output.split(" ")[0]
> > +
>
> This failed on the autobuilders:
>
>   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/wic.py", line 699, in test_no_fstab_update
>     bf_fstab_md5sum = runCmd('md5sum %s 2>/dev/null' % bf_fstab).output.split(" ")[0]
>   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py", line 207, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
> AssertionError: Command 'md5sum /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-15202/tmp/work/qemux86_64-poky-linux/base-files/3.0.14-r89/image/etc/fstab 2>/dev/null' returned non-zero exit status 1:
>
> Full log here:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/2374/steps/14/logs/stdio

Thanks for letting me know. I'll take a look.

>
> > +        try:
> > +            no_fstab_update_path = os.path.join(self.resultdir, 'test-no-fstab-update')
> > +            os.makedirs(no_fstab_update_path)
> > +            wks_file = os.path.join(no_fstab_update_path, 'temp.wks')
> > +            with open(wks_file, 'w') as wks:
> > +                wks.writelines(['part / --source rootfs --fstype=ext4 --label rootfs\n',
> > +                                'part /mnt/p2 --source rootfs --rootfs-dir=core-image-minimal ',
> > +                                '--fstype=ext4 --label p2 --no-fstab-update\n'])
> > +            runCmd("wic create %s -e core-image-minimal -o %s" \
> > +                                       % (wks_file, self.resultdir))
> > +
> > +            part_fstab_md5sum = []
> > +            for i in range(1, 3):
> > +                part = glob(os.path.join(self.resultdir, 'temp-*.direct.p') + str(i))[0]
> > +                part_fstab = runCmd("debugfs -R 'cat etc/fstab' %s 2>/dev/null" % (part))
> > +                part_fstab_md5sum.append(hashlib.md5((part_fstab.output + "\n\n").encode('utf-8')).hexdigest())
> > +
> > +            # '/etc/fstab' in partition 2 should contain the same stock fstab file at base-file recipe.
> > +            self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
> > +
> > +            # '/etc/fstab' in partition 1 should contain an updated fstab file.
> > +            self.assertNotEqual(bf_fstab_md5sum, part_fstab_md5sum[0])
> > +
> > +        finally:
> > +            os.environ['PATH'] = oldpath
> > +
> > +    def test_no_fstab_update_errors(self):
> > +        """Test --no-fstab-update wks option error handling."""
> > +        wks_file = 'temp.wks'
> > +
> > +        # Absolute argument.
> > +        with open(wks_file, 'w') as wks:
> > +            wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update /etc")
> > +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> > +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> > +        os.remove(wks_file)
> > +
> > +        # Argument pointing to parent directory.
> > +        with open(wks_file, 'w') as wks:
> > +            wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update ././..")
> > +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> > +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> > +        os.remove(wks_file)
> > +
> >  class Wic2(WicTestCase):
> >
> >      def test_bmap_short(self):
> > --
> > 2.30.2
> >
>
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Daniel
