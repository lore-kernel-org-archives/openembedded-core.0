Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.1760.1586284836462574433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 11:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id 131so3161166lfh.11
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 11:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LAtZSpPjVqQ9wfD6kE1savRLGQiiKEzbqD5QUQTZwzg=;
        b=fgQadUpTWAzwHMtwTMnnm1fVPohYlr+6IWbNKSqGkxN7zYTKP+QATzOMa/62XzEyiE
         eUiZw4b+CtgNJqHp5+Uw9D35yKYeaR2M/vpIx55YF5EuIdpuspP0fRVt/08JCBHQrqqA
         A29A9ZRSuW3Tc6/d2tUvtkmos49zvoArPMxvKQXxYq4He2WK1DIbyLTlenymY9PGHk/M
         IRMEOGSCaHbArMhSL4zus+lYPOtnyJUrITr08/9vA1DF/rV/x3Oh03onkp1PzP2Kwn6h
         IjHJMIx0uMtWbnZ34sZQWizcvuJKSxx7sa+mCGO/KXLEOYuNAVGq5fqq87m4QAMZeZjl
         G/3w==
X-Gm-Message-State: AGi0PuZtUKS94+T0KqCNrNdyVI4PIMJSQJu8hC8IIL0xdSXIF+y9smii
	rBidz1Kcv185nOSxviGzjV6xAFdfXEsyIm0hKHA=
X-Google-Smtp-Source: APiQypIUnZh9AU6tQw2NSl05DIrGNlm4LQxOZvuUAAw0Oqf3DC9x0UKmSiaG3dcc8RUx1It7Rf5iK1/M+MyB+P4VSuQ=
X-Received: by 2002:ac2:545b:: with SMTP id d27mr2204215lfn.187.1586284834555;
 Tue, 07 Apr 2020 11:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200304083438.1022216-1-ricardo@ribalda.com> <20200304095334.1f20ddd9@ub1910>
 <CAPybu_17EBoQH45Cpb+2UJ-Yoho062_5sGWAT1qmu4MPycOHBQ@mail.gmail.com>
 <20200305092855.1f9ccae8@ub1910> <CAPybu_0Avf3ckaFNvkmB6Q1FwLmQB_T886HSwNLrjCnu3tkh_w@mail.gmail.com>
 <CAPybu_03RzN3zyQuoHJorcnbqWfvC+cGvGo5yNiVC8pHP-MQ=g@mail.gmail.com> <20200407191256.6cb45445@ub1910>
In-Reply-To: <20200407191256.6cb45445@ub1910>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Tue, 7 Apr 2020 20:40:18 +0200
Message-ID: <CAPybu_3LK7Qj9qSYW8oR=21u5zDz2UbdSe6oV8s6hHQ_COXVxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] wic: Fix permissions when using exclude or include path
To: Paul Barker <pbarker@konsulko.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Paul

Thanks for your review, It has been already merged, but if there is
something wrong we can send a patch fixing it.

https://git.openembedded.org/openembedded-core/commit/?id=36993eea89d1c011397b7692b9b8d61b499d0171

On Tue, Apr 7, 2020 at 8:13 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Fri, 3 Apr 2020 21:53:39 +0200
> Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
>
> > ping?
>
> I think that '../pseudo' should not be used here. I'll explain inline...
>
> > >
> > > This results in a rootfs owned by the user that is running the wic
> > > command (usually UID 1000), which makes some rootfs unbootable.
> > >
> > > To fix this we copy the content of the pseudo folders to the new folder
> > > and modify the pseudo database using the "pseudo -B" command.
> > >
> > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > ---
> > >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++---
> > >  1 file changed, 19 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > > index 705aeb5563..40419a64b3 100644
> > > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > > @@ -16,11 +16,11 @@ import os
> > >  import shutil
> > >  import sys
> > >
> > > -from oe.path import copyhardlinktree
> > > +from oe.path import copyhardlinktree, copytree
> > >
> > >  from wic import WicError
> > >  from wic.pluginbase import SourcePlugin
> > > -from wic.misc import get_bitbake_var
> > > +from wic.misc import get_bitbake_var, exec_native_cmd
> > >
> > >  logger = logging.getLogger('wic')
> > >
> > > @@ -44,6 +44,15 @@ class RootfsPlugin(SourcePlugin):
> > >
> > >          return os.path.realpath(image_rootfs_dir)
> > >
> > > +    @staticmethod
> > > +    def __get_pseudo(native_sysroot, rootfs):
> > > +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> > > +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % os.path.join(rootfs, "../pseudo")
> > > +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs
> > > +        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
> > > +        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
> > > +        return pseudo
> > > +
> > >      @classmethod
> > >      def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
> > >                               oe_builddir, bootimg_dir, kernel_dir,
> > > @@ -78,9 +87,16 @@ class RootfsPlugin(SourcePlugin):
> > >
> > >              if os.path.lexists(new_rootfs):
> > >                  shutil.rmtree(os.path.join(new_rootfs))
> > > -
> > >              copyhardlinktree(part.rootfs_dir, new_rootfs)
> > >
> > > +            if os.path.lexists(os.path.join(new_rootfs, "../pseudo")):
>
> new_rootfs is set by the following statement a few lines above:
>
>     new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
>
> Consider that `cr_workdir` may contain multiple rootfs staging directories
> corresponding to multiple lines in the wks file, for example if a rootfs
> image is duplicated into multiple partitions for redundancy. In that case
> `os.path.join(new_rootfs, "../pseudo")` will clash between these different
> rootfs copies.
>
> Let's use an explicit path instead, such as:
>
>     new_pseudo = os.path.realpath(os.path.join(cr_workdir, "pseudo%d" % part.lineno))

The reason to have that path was to follow the same structure as the
real image.bb.

If there are multiple partitions on the .wic file the different
partitions are done one by one, not
in parallel.

So
../pseudo will be created  for partition1
then it will be used to generate the partition1

../pseudo will be deleted
../pseudo will be created  for partition2

Even if they use the same partition, the code works (and ../pseudo is
useless once the partition is generated)

>
> > > +                shutil.rmtree(os.path.join(new_rootfs, "../pseudo"))
> > > +            copytree(os.path.join(part.rootfs_dir, "../pseudo"),
>
> part.rootfs_dir is whatever is given as the option to `--rootfs-dir`. There
> is no guarantee that `../psuedo` is valid or if it corresponds to the rootfs
> directory given. It's unsafe to step up the directory tree and make
> assumptions like this.

I think that if we do not pass a real rootfs to the rootfs plugin it
is an error from the user.

We can add a more beautiful error message instead of a backtrace.

Or if you believe that it is a valid usecase to not pass a rootfs then
we can continue with a warning/debug message and explicitly telling
the user that the permissions are going to be invalid, because what he
is using as a roofs is an unknow directory for bitbake.

I have no personal preference for any of the two, tell me what do you
prefer (or a different option) and I will implement it.

Thans again for the review.


>
> > > +                     os.path.join(new_rootfs, "../pseudo"))
> > > +            pseudo_cmd = "%s -B -m %s -M %s" % (cls.__get_pseudo(native_sysroot,new_rootfs),
> > > +                                                part.rootfs_dir, new_rootfs)
> > > +            exec_native_cmd(pseudo_cmd, native_sysroot)
> > > +
> > >              for path in part.include_path or []:
> > >                  copyhardlinktree(path, new_rootfs)
>
> --
> Paul Barker
> Konsulko Group
> 



-- 
Ricardo Ribalda
