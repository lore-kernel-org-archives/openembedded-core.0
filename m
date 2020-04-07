Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.3208.1586288861550328912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 12:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sEmMEYaN;
 spf=pass (domain: konsulko.com, ip: 209.85.221.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f65.google.com with SMTP id w10so5278341wrm.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 12:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=mGv0OxAqrB5SCdgosHBf5jKZtIIf/KzzDIvz1DFZLY0=;
        b=sEmMEYaNHlGMcG+fbwCBiTxov3C3KM/pf7TgpXSqB7c6jjb0dyc1laQtQUSdUYASI3
         xBa+frpYv+inmZaDIwf3jqb8UfZR25kDghBLRz3l06eUYr/hryTpI3MYtcl5GzLIHsiT
         oAqjXEaqVsn5k24jNsRUPYP7Ly8uCZsV9JXXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=mGv0OxAqrB5SCdgosHBf5jKZtIIf/KzzDIvz1DFZLY0=;
        b=tcf6cY99wMYOhMxTyiLG4YFTl3MJIUBAFq1O0FqLpcs78UlYdADnDoZmukWE46jRL6
         60+UDT9f0R9c7xRv2o39pMgt1RVAxbgG172lQ7dv9IVRF6tzow2igAfSaAavQrawyjdP
         K830QQmJvOO+UupgvRx1Nv0PO5BZST35Y67d6FlhugrOdwxI9TGKZwSbBCkG3bBkX8m8
         sI12bIp9IRTfUbp/AYYvw8ooBZhzNp9GyLyAN0WtmMNa5k8dW9csYjSSssC9l+GEKm0+
         Du4vTgahYHhkB0CmvJ1wtGpuvvb2x9WLnoiNrm0WjQx+8211TKrf2PQedKkrAuw/l6Hs
         ZyYg==
X-Gm-Message-State: AGi0PuZlFR5lFbEQxB6xEIyABbd97EGmmE2gRhvEU6YLNTR95RS2xQI3
	/o5FcBdtHkwk+xzgXMYO1VkBQw==
X-Google-Smtp-Source: APiQypIgnb5ORDQci3cVO7qb1fLWbSISEyvJBXNPwW1qyH/pQEw0n513Vmo8IhaswqQuunJjOYkyQg==
X-Received: by 2002:adf:f5c5:: with SMTP id k5mr4235361wrp.403.1586288859931;
        Tue, 07 Apr 2020 12:47:39 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id y22sm5115546wma.0.2020.04.07.12.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 12:47:39 -0700 (PDT)
Date: Tue, 7 Apr 2020 20:43:39 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] wic: Fix permissions when using exclude or include path
Message-ID: <20200407204339.35085140@ub1910>
In-Reply-To: <CAPybu_0uU1WbC98c_34tb+KhJYs0LcTNSnqxCQsjf5hfzoSVxQ@mail.gmail.com>
References: <20200304083438.1022216-1-ricardo@ribalda.com>
	<20200304095334.1f20ddd9@ub1910>
	<CAPybu_17EBoQH45Cpb+2UJ-Yoho062_5sGWAT1qmu4MPycOHBQ@mail.gmail.com>
	<20200305092855.1f9ccae8@ub1910>
	<CAPybu_0Avf3ckaFNvkmB6Q1FwLmQB_T886HSwNLrjCnu3tkh_w@mail.gmail.com>
	<CAPybu_03RzN3zyQuoHJorcnbqWfvC+cGvGo5yNiVC8pHP-MQ=g@mail.gmail.com>
	<20200407191256.6cb45445@ub1910>
	<CAPybu_3LK7Qj9qSYW8oR=21u5zDz2UbdSe6oV8s6hHQ_COXVxA@mail.gmail.com>
	<20200407200236.748931eb@ub1910>
	<CAPybu_0uU1WbC98c_34tb+KhJYs0LcTNSnqxCQsjf5hfzoSVxQ@mail.gmail.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 Apr 2020 21:19:32 +0200
"Ricardo Ribalda" <ricardo.ribalda@gmail.com> wrote:

> Hi
> 
> On Tue, Apr 7, 2020 at 9:02 PM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Tue, 7 Apr 2020 20:40:18 +0200
> > Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
> >
> > > Hi Paul
> > >
> > > Thanks for your review, It has been already merged, but if there is
> > > something wrong we can send a patch fixing it.
> > >
> > > https://git.openembedded.org/openembedded-core/commit/?id=36993eea89d1c011397b7692b9b8d61b499d0171
> > >
> > > On Tue, Apr 7, 2020 at 8:13 PM Paul Barker <pbarker@konsulko.com> wrote:
> > > >
> > > > On Fri, 3 Apr 2020 21:53:39 +0200
> > > > Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
> > > >
> > > > > ping?
> > > >
> > > > I think that '../pseudo' should not be used here. I'll explain inline...
> > > >
> > > > > >
> > > > > > This results in a rootfs owned by the user that is running the wic
> > > > > > command (usually UID 1000), which makes some rootfs unbootable.
> > > > > >
> > > > > > To fix this we copy the content of the pseudo folders to the new folder
> > > > > > and modify the pseudo database using the "pseudo -B" command.
> > > > > >
> > > > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > > > > ---
> > > > > >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++---
> > > > > >  1 file changed, 19 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > > > > > index 705aeb5563..40419a64b3 100644
> > > > > > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > > > > > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > > > > > @@ -16,11 +16,11 @@ import os
> > > > > >  import shutil
> > > > > >  import sys
> > > > > >
> > > > > > -from oe.path import copyhardlinktree
> > > > > > +from oe.path import copyhardlinktree, copytree
> > > > > >
> > > > > >  from wic import WicError
> > > > > >  from wic.pluginbase import SourcePlugin
> > > > > > -from wic.misc import get_bitbake_var
> > > > > > +from wic.misc import get_bitbake_var, exec_native_cmd
> > > > > >
> > > > > >  logger = logging.getLogger('wic')
> > > > > >
> > > > > > @@ -44,6 +44,15 @@ class RootfsPlugin(SourcePlugin):
> > > > > >
> > > > > >          return os.path.realpath(image_rootfs_dir)
> > > > > >
> > > > > > +    @staticmethod
> > > > > > +    def __get_pseudo(native_sysroot, rootfs):
> > > > > > +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> > > > > > +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % os.path.join(rootfs, "../pseudo")
> > > > > > +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs
> > > > > > +        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
> > > > > > +        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
> > > > > > +        return pseudo
> > > > > > +
> > > > > >      @classmethod
> > > > > >      def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
> > > > > >                               oe_builddir, bootimg_dir, kernel_dir,
> > > > > > @@ -78,9 +87,16 @@ class RootfsPlugin(SourcePlugin):
> > > > > >
> > > > > >              if os.path.lexists(new_rootfs):
> > > > > >                  shutil.rmtree(os.path.join(new_rootfs))
> > > > > > -
> > > > > >              copyhardlinktree(part.rootfs_dir, new_rootfs)
> > > > > >
> > > > > > +            if os.path.lexists(os.path.join(new_rootfs, "../pseudo")):
> > > >
> > > > new_rootfs is set by the following statement a few lines above:
> > > >
> > > >     new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
> > > >
> > > > Consider that `cr_workdir` may contain multiple rootfs staging directories
> > > > corresponding to multiple lines in the wks file, for example if a rootfs
> > > > image is duplicated into multiple partitions for redundancy. In that case
> > > > `os.path.join(new_rootfs, "../pseudo")` will clash between these different
> > > > rootfs copies.
> > > >
> > > > Let's use an explicit path instead, such as:
> > > >
> > > >     new_pseudo = os.path.realpath(os.path.join(cr_workdir, "pseudo%d" % part.lineno))
> > >
> > > The reason to have that path was to follow the same structure as the
> > > real image.bb.
> > >
> > > If there are multiple partitions on the .wic file the different
> > > partitions are done one by one, not
> > > in parallel.
> > >
> > > So
> > > ../pseudo will be created  for partition1
> > > then it will be used to generate the partition1
> > >
> > > ../pseudo will be deleted
> > > ../pseudo will be created  for partition2
> > >
> > > Even if they use the same partition, the code works (and ../pseudo is
> > > useless once the partition is generated)
> > >
> >
> > Having these separate is important for debugging though, it lets you look
> > through the different copies after wic exits if something is wrong.
> 
> I see your point, I can make a patch for that
> 
> >
> > > >
> > > > > > +                shutil.rmtree(os.path.join(new_rootfs, "../pseudo"))
> > > > > > +            copytree(os.path.join(part.rootfs_dir, "../pseudo"),
> > > >
> > > > part.rootfs_dir is whatever is given as the option to `--rootfs-dir`. There
> > > > is no guarantee that `../psuedo` is valid or if it corresponds to the rootfs
> > > > directory given. It's unsafe to step up the directory tree and make
> > > > assumptions like this.
> > >
> > > I think that if we do not pass a real rootfs to the rootfs plugin it
> > > is an error from the user.
> > >
> > > We can add a more beautiful error message instead of a backtrace.
> > >
> > > Or if you believe that it is a valid usecase to not pass a rootfs then
> > > we can continue with a warning/debug message and explicitly telling
> > > the user that the permissions are going to be invalid, because what he
> > > is using as a roofs is an unknow directory for bitbake.
> >
> > This is a valid and existing usecase. This is how data partitions are
> > populated and how you separate /home or another directory into its own
> > partiton (e.g.
> > https://stackoverflow.com/questions/56187209/yocto-create-and-populate-a-separate-home-partition).
> 
> Luckily on the usecase on that stackoverflow the patch will still work.
> 
> we need to combine partition split +
> embed-roots/include_path/exlude_path to make it fail
> 
> By the way, by looking at your example I think that all the partition
> split executed from outside bitbake will have invalid partitions on
> their content.
> 
> We need to make something like:
> 
> part /home --source rootfs --root-dir=/home --ondisk sda --fstype=ext4
> --label home
> 

Agreed, there is an issue here when running wic outside bitbake that we need
to solve. I think this patch is most of the way towards fixing it but does
introduce other problems as I said.

> 
> >
> > >
> > > I have no personal preference for any of the two, tell me what do you
> > > prefer (or a different option) and I will implement it.
> > >
> > > Thans again for the review.
> > >
> >
> > This patch needs reverting from master/dunfell. I hope it hasn't gone into
> > the M4 build...
> 
> Instead of reverting I believe it is simpler to prepare a patch that
> solves both of your concerns
> 
> - pseduoX instead of ../pseudo (although this does not break the code)
> - keep the old behaviour if the pseudo folder is not found (wrong
> permissions, but no backtrace)
> 
> And we can start talking about a way to split partitions and keep the
> right permissions/username
> 

We can do that after the 3.1 release. We're supposed to be in feature freeze
right now, this shouldn't have been merged so the best solution is to revert
it.

Thanks,

-- 
Paul Barker
Konsulko Group
