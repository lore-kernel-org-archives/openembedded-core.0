Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.1176.1586283182074044041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 11:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PrP385mx;
 spf=pass (domain: konsulko.com, ip: 209.85.128.66, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f66.google.com with SMTP id h2so2674823wmb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 11:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=AEV6tcfmPIhx90cokMSeNwiA00mCN2cYFnQauS8rxWI=;
        b=PrP385mxMMMMgoCHSqNgTJ1sXam8xA6Mzmg/cOHrY7wCFW/QFK1q5p29qL+cowerro
         WxVZEyLYfDoTUElSsHM6sDyQyjxFCwiDOhlIHgTvdBrWd1Qhll4TnpKYTNr2yiSHSFHs
         9VKp/dVU1UrvjGZgjaTaz2qJhHUZ0B5XeiRyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=AEV6tcfmPIhx90cokMSeNwiA00mCN2cYFnQauS8rxWI=;
        b=pYbEgwk3veW7AiLXr3k9RTFeFqdq5Kd5yOTYwOT77kcmgYUDlMnkmQUsscti6AI70d
         ozA9SwO5MXFLdE5qPXHPrML1/e0w/zQuMZDOnq6aM0qjX1P6qU0927W1WAK4kg+3WTxw
         hC5XU/fJO9A75UQv7Z/SqgjNh0334C7dkXlcL8H0t6H0hJYGoyuGAD6U3d2QHL3ZO/kT
         wwQx3wcOYGzABC18Y04jufVZf7PhSONCOkBnk7G0rKxo0/qQAN5wpcfjvQr0sTiwf/0+
         Me+9mPLJygRSnZjYrqIZ2pZFLMjpVNeHUkGYiUYzig6r7qsxnW0riq5UIg/8kN1ZKRvs
         Pv3w==
X-Gm-Message-State: AGi0PuZNUBOKcmZgvRqifgofqNUJ8m5nVx1wXku/hOEtT/h460vhChUG
	3aP8Tbqucc4ti4Ce9sx3ku/qxg==
X-Google-Smtp-Source: APiQypKfMeARb6XZlSpB6pl1PIE9/CEtEYXrCgd/Muh+MyS85ZYYEx7zJqg3M3SDYbJbRYGLHRrJMA==
X-Received: by 2002:a1c:ac8a:: with SMTP id v132mr520088wme.62.1586283180570;
        Tue, 07 Apr 2020 11:13:00 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id a15sm3322255wme.17.2020.04.07.11.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 11:13:00 -0700 (PDT)
Date: Tue, 7 Apr 2020 19:12:56 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] wic: Fix permissions when using exclude or include path
Message-ID: <20200407191256.6cb45445@ub1910>
In-Reply-To: <CAPybu_03RzN3zyQuoHJorcnbqWfvC+cGvGo5yNiVC8pHP-MQ=g@mail.gmail.com>
References: <20200304083438.1022216-1-ricardo@ribalda.com>
	<20200304095334.1f20ddd9@ub1910>
	<CAPybu_17EBoQH45Cpb+2UJ-Yoho062_5sGWAT1qmu4MPycOHBQ@mail.gmail.com>
	<20200305092855.1f9ccae8@ub1910>
	<CAPybu_0Avf3ckaFNvkmB6Q1FwLmQB_T886HSwNLrjCnu3tkh_w@mail.gmail.com>
	<CAPybu_03RzN3zyQuoHJorcnbqWfvC+cGvGo5yNiVC8pHP-MQ=g@mail.gmail.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 3 Apr 2020 21:53:39 +0200
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> ping?

I think that '../pseudo' should not be used here. I'll explain inline...

> >
> > This results in a rootfs owned by the user that is running the wic
> > command (usually UID 1000), which makes some rootfs unbootable.
> >
> > To fix this we copy the content of the pseudo folders to the new folder
> > and modify the pseudo database using the "pseudo -B" command.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > ---
> >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++---
> >  1 file changed, 19 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > index 705aeb5563..40419a64b3 100644
> > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > @@ -16,11 +16,11 @@ import os
> >  import shutil
> >  import sys
> >
> > -from oe.path import copyhardlinktree
> > +from oe.path import copyhardlinktree, copytree
> >
> >  from wic import WicError
> >  from wic.pluginbase import SourcePlugin
> > -from wic.misc import get_bitbake_var
> > +from wic.misc import get_bitbake_var, exec_native_cmd
> >
> >  logger = logging.getLogger('wic')
> >
> > @@ -44,6 +44,15 @@ class RootfsPlugin(SourcePlugin):
> >
> >          return os.path.realpath(image_rootfs_dir)
> >
> > +    @staticmethod
> > +    def __get_pseudo(native_sysroot, rootfs):
> > +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> > +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % os.path.join(rootfs, "../pseudo")
> > +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs
> > +        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
> > +        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
> > +        return pseudo
> > +
> >      @classmethod
> >      def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
> >                               oe_builddir, bootimg_dir, kernel_dir,
> > @@ -78,9 +87,16 @@ class RootfsPlugin(SourcePlugin):
> >
> >              if os.path.lexists(new_rootfs):
> >                  shutil.rmtree(os.path.join(new_rootfs))
> > -
> >              copyhardlinktree(part.rootfs_dir, new_rootfs)
> >
> > +            if os.path.lexists(os.path.join(new_rootfs, "../pseudo")):

new_rootfs is set by the following statement a few lines above:

    new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))

Consider that `cr_workdir` may contain multiple rootfs staging directories
corresponding to multiple lines in the wks file, for example if a rootfs
image is duplicated into multiple partitions for redundancy. In that case
`os.path.join(new_rootfs, "../pseudo")` will clash between these different
rootfs copies.

Let's use an explicit path instead, such as:

    new_pseudo = os.path.realpath(os.path.join(cr_workdir, "pseudo%d" % part.lineno))

> > +                shutil.rmtree(os.path.join(new_rootfs, "../pseudo"))
> > +            copytree(os.path.join(part.rootfs_dir, "../pseudo"),

part.rootfs_dir is whatever is given as the option to `--rootfs-dir`. There
is no guarantee that `../psuedo` is valid or if it corresponds to the rootfs
directory given. It's unsafe to step up the directory tree and make
assumptions like this.

> > +                     os.path.join(new_rootfs, "../pseudo"))  
> > +            pseudo_cmd = "%s -B -m %s -M %s" % (cls.__get_pseudo(native_sysroot,new_rootfs),
> > +                                                part.rootfs_dir, new_rootfs)
> > +            exec_native_cmd(pseudo_cmd, native_sysroot)
> > +
> >              for path in part.include_path or []:
> >                  copyhardlinktree(path, new_rootfs)  

-- 
Paul Barker
Konsulko Group
