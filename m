Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.2763.1628242555488659654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 02:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=BDdjq9GN;
 spf=pass (domain: qtec.com, ip: 209.85.208.180, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f180.google.com with SMTP id u13so11050112lje.5
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 02:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2bBOtAGsp0i8erZ0SC0Ec5lEhj14Dq3grJ0H0GrctDs=;
        b=BDdjq9GNnMQqfXAqItWh97HI+SxdoLHtFv//eu+RReGaDVCeOE5f7oQTMEP0VhUW5S
         8uYblmljqCeIKhF473QCEMf7j/4OR8cJA/DdPnG7W/9yf7Dbqru6cDWtUaXZq13LVyDi
         L1TXDw66St72JheiZv8/znPV5zDPh525Q3Xv1kY2UVesms00cWG1fZqlW442HvNyD0ib
         rP0JptiMnGeC/OKwptT1p5VfA5ICKiDpgwO0VpkN/ZvtMRctd9AU7psJBPm4dBp70QnK
         RM0ljCiXocZ0P+4SpvQasZ36Zm3FqxJYh21jtYdLn9FuPW3Wjek/sEGdT6eXnBI5ZLJW
         xEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2bBOtAGsp0i8erZ0SC0Ec5lEhj14Dq3grJ0H0GrctDs=;
        b=T2fbu2N0ThNqM/NBqxC9qWKwp7drJDhRDGya069f6F/3IgDfZJFYW+VROLoC3lof7C
         Le5qOuDDANi7xvhgplSBdrtfLt8NQ5pKU11+Z42y64PPEFOhrTDEEY/KM9RXlA379g+0
         lGrar0tIQPmYeVjtUyFW2JNnQ2798uFl/QrfCIUBEg5HmCkgznTMbn4PKogdycW1UbUb
         PB8YvdTtKNcMC7AsE1QlcRebEoQH4FBKzr68n+wasBlmVJyC5IVGKlp6jI+UyDZDzxi3
         S2e+pqKKg1cMSSVP1bisRgK4iW8gWgxWCuPtpmX0obC6AUoNnxWEuUs7a5GH6vZpWOCw
         RWNQ==
X-Gm-Message-State: AOAM532ILz6cqbRVEIuKEb+eNaT/aKffJDOp/tlTgmsa3AWxfuBUECwk
	QQN5/9VGRU5/bCSwo3tQAL+To7jap0jBx392ORq35A==
X-Google-Smtp-Source: ABdhPJwu57l49IrZULABu3Iv5ba+SrJeJEgNAQMzx/vYhaarRu8Vh24GtSMVLRbW6zJbg91B5l/031EwYsr2yiUM5yA=
X-Received: by 2002:a2e:a16d:: with SMTP id u13mr6052020ljl.222.1628242552748;
 Fri, 06 Aug 2021 02:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210805150307.56631-1-daniel@qtec.com> <f5204c03e3394a38e6663e56b0072d9d65bcc34d.camel@linuxfoundation.org>
In-Reply-To: <f5204c03e3394a38e6663e56b0072d9d65bcc34d.camel@linuxfoundation.org>
From: "Daniel Gomez" <daniel@qtec.com>
Date: Fri, 6 Aug 2021 11:35:41 +0200
Message-ID: <CAH1Ww+QvgT6pcNsdFJEez4D5ONx=PU90dgEJcJzUYvrbgyC-zQ@mail.gmail.com>
Subject: Re: [OE-core][RFC][PATCH][dunfell] wic: direct: Use stock fstab in partitions
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Daniel Gomez <dagmcr@gmail.com>, 
	Paul Barker <paul@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

On Thu, 5 Aug 2021 at 17:31, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-08-05 at 17:03 +0200, Daniel Gomez wrote:
> > Be able to get the stock fstab in partitions.
> >
> > Functionality reverted at commit id:
> > ce682a73b7447652f898ce1d1d0416a456df5416
> >
> > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > ---
> >
> > Hi,
> >
> > I'm trying to get back the stock fstab file in a rootfs partition
> > image (wic plugin) and I'd like to know what you think about it.
> >
> > Functionality was included before commit-id
> > ce682a73b7447652f898ce1d1d0416a456df5416 and removed afterwards. Would
> > it be possible to add it again? What would be needed to re-add it?
> >
>
> The commit you mention above shouldn't have changed the output, it just used a
> different method to replace the fstab file. The question becomes why isn't the
> modified file being used in the way you're generating an image. I don't know
> wic well enough to know the answer to that though.

Thanks for your comments. I did some debugging and the fstab in use
for each partition will always be updated/replaced in the
'prepare_rootfs_ext' function (when 'update_fstab' in direct.py
updates it):
http://git.openembedded.org/openembedded-core/tree/scripts/lib/wic/partition.py?h=dunfell#n289

To fix it, I made this patch for dunfell so it gets updated if the user wants.
https://lists.openembedded.org/g/openembedded-core/message/154537

The user now decides with --use-stock-fstab if the stock fstab is kept
or replaced/updated.

As said in the other patch/message, I'll update it to master if you agree.

Thanks,
Daniel

>
> Cheers,
>
> Richard
>
>
> > Thanks in advance,
> > Daniel
> >
> > Here the relevant information:
> >
> > wks definition:
> > part /boot/bootloader --source qbootimg-pcbios --active --align 1024 --use-uuid --fsoptions defaults,ro
> > part /export --source rootfs --rootfs-dir=hockeycam-image  --fstype=ext4 --label export --align 1024 --use-uuid --fsoptions defaults,ro --extra-space 400M
> > part /media/rw --fstype=ext4 --label rwfs --align 1024 --use-uuid --size 200
> > part / --source rootfs --fstype=ext4 --label rootfs --align 1024 --use-uuid --fsoptions defaults,ro --extra-space 400M
> >
> > bootloader --timeout=1 --append="ro rootfstype=ext4 qtec_mem.size=64" --source qbootimg-pcbios
> >
> > /export/etc/fstab before:
> > # stock fstab - you probably want to override this with a machine specific one
> >
> > /dev/root            /                    auto       ro              1  0
> > proc                 /proc                proc       defaults              0  0
> > devpts               /dev/pts             devpts     mode=0620,ptmxmode=0666,gid=5      0  0
> > tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
> > tmpfs                /var/volatile        tmpfs      defaults              0  0
> >
> > # uncomment this if your device has a SD/MMC/Transflash slot
> > #/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
> >
> > /dev/sdb /mnt auto defaults 0 0
> > UUID=D339-7B77  /boot/bootloader        vfat    defaults,ro     0       0
> > UUID=31f46be1-d9fb-4081-bd53-2c2727e7854b       /export ext4    defaults,ro     0       0
> > UUID=d8e8f5d4-897e-48cd-9188-33598363f706       /media/rw       ext4    defaults        0       0
> >
> > /export/etc/fstab after:
> > # stock fstab - you probably want to override this with a machine specific one
> >
> > /dev/root            /                    auto       ro              1  0
> > proc                 /proc                proc       defaults              0  0
> > devpts               /dev/pts             devpts     mode=0620,ptmxmode=0666,gid=5      0  0
> > tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
> > tmpfs                /var/volatile        tmpfs      defaults              0  0
> >
> > # uncomment this if your device has a SD/MMC/Transflash slot
> > #/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
> >
> > 10.100.10.100:/mnt/rw /media/rw   nfs        defaults   0 0
> >
> >
> >  scripts/lib/wic/plugins/imager/direct.py | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> > index 7e1c1c03ab..1bb9d38524 100644
> > --- a/scripts/lib/wic/plugins/imager/direct.py
> > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > @@ -111,7 +111,15 @@ class DirectPlugin(ImagerPlugin):
> >
> >          with open(fstab_path) as fstab:
> >              fstab_lines = fstab.readlines()
> > +            self.original_fstab = fstab_lines.copy()
> >
> > +        if self._update_fstab(fstab_lines, self.parts):
> > +            with open(fstab_path, "w") as fstab:
> > +                fstab.writelines(fstab_lines)
> > +        else:
> > +            self.original_fstab = None
> > +
> > +    def _update_fstab(self, fstab_lines, parts):
> >          updated = False
> >          for part in self.parts:
> >              if not part.realnum or not part.mountpoint \
> > @@ -142,10 +150,7 @@ class DirectPlugin(ImagerPlugin):
> >              fstab_lines.append(line)
> >              updated = True
> >
> > -        if updated:
> > -            self.updated_fstab_path = os.path.join(self.workdir, "fstab")
> > -            with open(self.updated_fstab_path, "w") as f:
> > -                f.writelines(fstab_lines)
> > +        return updated
> >
> >      def _full_path(self, path, name, extention):
> >          """ Construct full file path to a file we generate. """
> > @@ -274,6 +279,13 @@ class DirectPlugin(ImagerPlugin):
> >              if os.path.isfile(path):
> >                  shutil.move(path, os.path.join(self.outdir, fname))
> >
> > +
> > +        # Restore original fstab
> > +        if self.original_fstab:
> > +            fstab_path = self.rootfs_dir.get("ROOTFS_DIR") + "/etc/fstab"
> > +            with open(fstab_path, "w") as fstab:
> > +                fstab.writelines(self.original_fstab)
> > +
> >          # remove work directory
> >          shutil.rmtree(self.workdir, ignore_errors=True)
> >
> > --
> > 2.30.2
> >
> > 
> >
>
>
