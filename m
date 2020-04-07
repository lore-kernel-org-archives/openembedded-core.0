Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.2559.1586287191921342875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 12:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id z26so906381ljz.11
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 12:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EdMJ7/BYYXKPGrK60sXBk2GquyWoi6KLsZD3uc8n6JE=;
        b=MLvLb+/YlNnjI/lk1e79kdoBj+nWFi1zBrbtUrosPWKFUzKGMChE8xqlCw0UEqVxqP
         XSeQnijpjngK5XJDWIVsZzRWQTjCO7kDY86GYPV9drWh2yWwFHslRAI2f0mmV4DRmyx/
         u3xi9rr9LGnT8j8huYuZLYdFe3jLgHZWGwtMqRNEr49lj+b37lki7wBM9/nrbhS7aRdN
         kje+rOkQLUDfnKxkDZVvJXr3TXXyAGNgvj4w6zP+QRssngOl///23uQbadc0BK9RdJ43
         mc/BGuj9lvh5fRdM06wxcN5Mk9gJE/ksXqLdPj/0qzF3t4csQcJBDE0sLhNsBctjoxkw
         Njjw==
X-Gm-Message-State: AGi0PuYG6ilUGOtnRdLLYXzldObjWk1pQh/AxXhcS4fVWr+mP42lhuEC
	exTVZ4EsCHtqlN/OFpOKfBvlqYaXsDc7byYAd20=
X-Google-Smtp-Source: APiQypKmEuynmpqhcI41d9K0bHmFkV66OpW/9XKUjUJskWpHpqm1YdBc2ZIIphq94AKTZtqfydG1qTV60ar5aAshc+Q=
X-Received: by 2002:a2e:8746:: with SMTP id q6mr2595549ljj.13.1586287189956;
 Tue, 07 Apr 2020 12:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200304083438.1022216-1-ricardo@ribalda.com> <20200304095334.1f20ddd9@ub1910>
 <CAPybu_17EBoQH45Cpb+2UJ-Yoho062_5sGWAT1qmu4MPycOHBQ@mail.gmail.com>
 <20200305092855.1f9ccae8@ub1910> <CAPybu_0Avf3ckaFNvkmB6Q1FwLmQB_T886HSwNLrjCnu3tkh_w@mail.gmail.com>
 <CAPybu_03RzN3zyQuoHJorcnbqWfvC+cGvGo5yNiVC8pHP-MQ=g@mail.gmail.com>
 <20200407191256.6cb45445@ub1910> <CAPybu_3LK7Qj9qSYW8oR=21u5zDz2UbdSe6oV8s6hHQ_COXVxA@mail.gmail.com>
 <20200407200236.748931eb@ub1910>
In-Reply-To: <20200407200236.748931eb@ub1910>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Tue, 7 Apr 2020 21:19:32 +0200
Message-ID: <CAPybu_0uU1WbC98c_34tb+KhJYs0LcTNSnqxCQsjf5hfzoSVxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] wic: Fix permissions when using exclude or include path
To: Paul Barker <pbarker@konsulko.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, Apr 7, 2020 at 9:02 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Tue, 7 Apr 2020 20:40:18 +0200
> Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
>
> > Hi Paul
> >
> > Thanks for your review, It has been already merged, but if there is
> > something wrong we can send a patch fixing it.
> >
> > https://git.openembedded.org/openembedded-core/commit/?id=36993eea89d1c011397b7692b9b8d61b499d0171
> >
> > On Tue, Apr 7, 2020 at 8:13 PM Paul Barker <pbarker@konsulko.com> wrote:
> > >
> > > On Fri, 3 Apr 2020 21:53:39 +0200
> > > Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
> > >
> > > > ping?
> > >
> > > I think that '../pseudo' should not be used here. I'll explain inline...
> > >
> > > > >
> > > > > This results in a rootfs owned by the user that is running the wic
> > > > > command (usually UID 1000), which makes some rootfs unbootable.
> > > > >
> > > > > To fix this we copy the content of the pseudo folders to the new folder
> > > > > and modify the pseudo database using the "pseudo -B" command.
> > > > >
> > > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > > > ---
> > > > >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++---
> > > > >  1 file changed, 19 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > > > > index 705aeb5563..40419a64b3 100644
> > > > > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > > > > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > > > > @@ -16,11 +16,11 @@ import os
> > > > >  import shutil
> > > > >  import sys
> > > > >
> > > > > -from oe.path import copyhardlinktree
> > > > > +from oe.path import copyhardlinktree, copytree
> > > > >
> > > > >  from wic import WicError
> > > > >  from wic.pluginbase import SourcePlugin
> > > > > -from wic.misc import get_bitbake_var
> > > > > +from wic.misc import get_bitbake_var, exec_native_cmd
> > > > >
> > > > >  logger = logging.getLogger('wic')
> > > > >
> > > > > @@ -44,6 +44,15 @@ class RootfsPlugin(SourcePlugin):
> > > > >
> > > > >          return os.path.realpath(image_rootfs_dir)
> > > > >
> > > > > +    @staticmethod
> > > > > +    def __get_pseudo(native_sysroot, rootfs):
> > > > > +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> > > > > +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % os.path.join(rootfs, "../pseudo")
> > > > > +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs
> > > > > +        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
> > > > > +        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
> > > > > +        return pseudo
> > > > > +
> > > > >      @classmethod
> > > > >      def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
> > > > >                               oe_builddir, bootimg_dir, kernel_dir,
> > > > > @@ -78,9 +87,16 @@ class RootfsPlugin(SourcePlugin):
> > > > >
> > > > >              if os.path.lexists(new_rootfs):
> > > > >                  shutil.rmtree(os.path.join(new_rootfs))
> > > > > -
> > > > >              copyhardlinktree(part.rootfs_dir, new_rootfs)
> > > > >
> > > > > +            if os.path.lexists(os.path.join(new_rootfs, "../pseudo")):
> > >
> > > new_rootfs is set by the following statement a few lines above:
> > >
> > >     new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
> > >
> > > Consider that `cr_workdir` may contain multiple rootfs staging directories
> > > corresponding to multiple lines in the wks file, for example if a rootfs
> > > image is duplicated into multiple partitions for redundancy. In that case
> > > `os.path.join(new_rootfs, "../pseudo")` will clash between these different
> > > rootfs copies.
> > >
> > > Let's use an explicit path instead, such as:
> > >
> > >     new_pseudo = os.path.realpath(os.path.join(cr_workdir, "pseudo%d" % part.lineno))
> >
> > The reason to have that path was to follow the same structure as the
> > real image.bb.
> >
> > If there are multiple partitions on the .wic file the different
> > partitions are done one by one, not
> > in parallel.
> >
> > So
> > ../pseudo will be created  for partition1
> > then it will be used to generate the partition1
> >
> > ../pseudo will be deleted
> > ../pseudo will be created  for partition2
> >
> > Even if they use the same partition, the code works (and ../pseudo is
> > useless once the partition is generated)
> >
>
> Having these separate is important for debugging though, it lets you look
> through the different copies after wic exits if something is wrong.

I see your point, I can make a patch for that

>
> > >
> > > > > +                shutil.rmtree(os.path.join(new_rootfs, "../pseudo"))
> > > > > +            copytree(os.path.join(part.rootfs_dir, "../pseudo"),
> > >
> > > part.rootfs_dir is whatever is given as the option to `--rootfs-dir`. There
> > > is no guarantee that `../psuedo` is valid or if it corresponds to the rootfs
> > > directory given. It's unsafe to step up the directory tree and make
> > > assumptions like this.
> >
> > I think that if we do not pass a real rootfs to the rootfs plugin it
> > is an error from the user.
> >
> > We can add a more beautiful error message instead of a backtrace.
> >
> > Or if you believe that it is a valid usecase to not pass a rootfs then
> > we can continue with a warning/debug message and explicitly telling
> > the user that the permissions are going to be invalid, because what he
> > is using as a roofs is an unknow directory for bitbake.
>
> This is a valid and existing usecase. This is how data partitions are
> populated and how you separate /home or another directory into its own
> partiton (e.g.
> https://stackoverflow.com/questions/56187209/yocto-create-and-populate-a-separate-home-partition).

Luckily on the usecase on that stackoverflow the patch will still work.

we need to combine partition split +
embed-roots/include_path/exlude_path to make it fail

By the way, by looking at your example I think that all the partition
split executed from outside bitbake will have invalid partitions on
their content.

We need to make something like:

part /home --source rootfs --root-dir=/home --ondisk sda --fstype=ext4
--label home


>
> >
> > I have no personal preference for any of the two, tell me what do you
> > prefer (or a different option) and I will implement it.
> >
> > Thans again for the review.
> >
>
> This patch needs reverting from master/dunfell. I hope it hasn't gone into
> the M4 build...

Instead of reverting I believe it is simpler to prepare a patch that
solves both of your concerns

- pseduoX instead of ../pseudo (although this does not break the code)
- keep the old behaviour if the pseudo folder is not found (wrong
permissions, but no backtrace)

And we can start talking about a way to split partitions and keep the
right permissions/username


Best regards.


>
> --
> Paul Barker
> Konsulko Group
> 



--
Ricardo Ribalda
