Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 66DAF6117D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 09:46:43 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id f10so5308796ljn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2020 01:46:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uf5Z7JLqzucq29n4CbDEhYtGrGQDc5x8eX1g5qec5O0=;
	b=Lx5M5I/Yk3sGaiDYZixh40CqLEIh/gJwPFnlUHIyG2L0/XiUhtVT2OXsI6oThD6r5n
	J4AHPJ2R/PpQJ7ePBshRMqZNAvtXiz5SHK8ci3bhlJvSGDzgB4MJo4MLYtanWuIRgrMU
	6Qn+HaXMNuFtlQIVnfRuUrz3/kP6BT5/cMToqyUuszjcOEnR/2pfh9nK6OUeLraV1afv
	Vy3BHzbMSUQiJH88EQrdUUbbQcXrsAdzlj5X1Lj3SGD8fDn3F00SYBbi4Q1nwJJ+0V+y
	m2RvTLLe6QJPJ+Qn65Fc/2YchNEpIclxPy0gMvWRPkoxExzJmiPCOy/2W6ePJ1b68J1P
	Op6Q==
X-Gm-Message-State: ANhLgQ1wwz/+sDs8rqSnr4OpYm72XyQV+A9nJ4uy/FK8p80QeqB47lkG
	MccI5AYDZqyqQRC9BhJOlhKRo+2U2QsC3NMuXt9/SO26
X-Google-Smtp-Source: ADFU+vuCqEAiV8Ww0+7RwMu545U+tw+qBLZWKgttpb9vCJlMwG5mrLyS8gw/mAwEUnzrxqWnSnc67lcX4xjveBak/qY=
X-Received: by 2002:a2e:85d8:: with SMTP id h24mr1799342ljj.230.1583401603569; 
	Thu, 05 Mar 2020 01:46:43 -0800 (PST)
MIME-Version: 1.0
References: <20200304083438.1022216-1-ricardo@ribalda.com>
	<20200304095334.1f20ddd9@ub1910>
	<CAPybu_17EBoQH45Cpb+2UJ-Yoho062_5sGWAT1qmu4MPycOHBQ@mail.gmail.com>
	<20200305092855.1f9ccae8@ub1910>
In-Reply-To: <20200305092855.1f9ccae8@ub1910>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Thu, 5 Mar 2020 10:46:27 +0100
Message-ID: <CAPybu_0Avf3ckaFNvkmB6Q1FwLmQB_T886HSwNLrjCnu3tkh_w@mail.gmail.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic: Fix permissions when using exclude or include path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2020 09:46:43 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Paul

On Thu, Mar 5, 2020 at 10:32 AM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Wed, 4 Mar 2020 11:02:47 +0100
> Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
>
> > Hi Paul
> >
> > On Wed, Mar 4, 2020 at 10:53 AM Paul Barker <pbarker@konsulko.com> wrote:
> > >
> > > On Wed,  4 Mar 2020 09:34:37 +0100
> > > Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
> > >
> > > > When parameters include_path or exclude_path are passed to the rootfs
> > > > plugin, it will copy the partition content into a folder and make all
> > > > the modifications there.
> > > >
> > > > This is done using copyhardlinktree(), which does not take into
> > > > consideration the content of the pseudo folder, which contains the
> > > > information about the right permissions and ownership of the folders.
> > >
> > > How are you running wic here? In the do_image_wic task it's executed under
> > > pseudo so all this is handled already. Executing wic outside of bitbake may
> > > need some more testing here.
> >
> > I am running wic outside bitbake. But even if it is run under bitbake,
> > it should also fail. The pseudo directory needs to be present on the
> > target image
>
> If you're running wic outside of bitbake, is there any guarantee that pseudo
> is available?

Yes, the same guarantee that the ext3_tools are available. So I
believe we are safe here. Actually in my docker pseudo is not
installed and when I invoke with wic, everything is fine.

>
> >
> > >
> > > >
> > > > This results in a rootfs owned by the user that is running the wic
> > > > command (usually UID 1000), which makes some rootfs unbootable.
> > > >
> > > > To fix this we copy the content of the pseudo folders to the new folder
> > > > and modify the pseudo database using the "pseudo -B" command.
> > > >
> > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > > ---
> > > >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++---
> > > >  1 file changed, 19 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > > > index 705aeb5563..40419a64b3 100644
> > > > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > > > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > > > @@ -16,11 +16,11 @@ import os
> > > >  import shutil
> > > >  import sys
> > > >
> > > > -from oe.path import copyhardlinktree
> > > > +from oe.path import copyhardlinktree, copytree
> > > >
> > > >  from wic import WicError
> > > >  from wic.pluginbase import SourcePlugin
> > > > -from wic.misc import get_bitbake_var
> > > > +from wic.misc import get_bitbake_var, exec_native_cmd
> > > >
> > > >  logger = logging.getLogger('wic')
> > > >
> > > > @@ -44,6 +44,15 @@ class RootfsPlugin(SourcePlugin):
> > > >
> > > >          return os.path.realpath(image_rootfs_dir)
> > > >
> > > > +    @staticmethod
> > > > +    def __get_pseudo(native_sysroot, rootfs):
> > > > +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> > > > +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % os.path.join(rootfs, "../pseudo")
> > > > +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs
> > > > +        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
> > > > +        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
> > > > +        return pseudo
> > > > +
> > > >      @classmethod
> > > >      def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
> > > >                               oe_builddir, bootimg_dir, kernel_dir,
> > > > @@ -78,9 +87,16 @@ class RootfsPlugin(SourcePlugin):
> > > >
> > > >              if os.path.lexists(new_rootfs):
> > > >                  shutil.rmtree(os.path.join(new_rootfs))
> > > > -
> > > >              copyhardlinktree(part.rootfs_dir, new_rootfs)
> > > >
> > > > +            if os.path.lexists(os.path.join(new_rootfs, "../pseudo")):
> > > > +                shutil.rmtree(os.path.join(new_rootfs, "../pseudo"))
> > > > +            copytree(os.path.join(part.rootfs_dir, "../pseudo"),
> > > > +                     os.path.join(new_rootfs, "../pseudo"))
> > >
> > > I don't like stepping up the directory tree like this. We should be more
> > > explicit with the paths.
> >
> > You are thinking on:
> > os.path.dirname(directory)
>
> No, I'm wondering why we're taking a step up the directory tree from
> `part.rootfs_dir`. I can point that at any path using the `--rootfs-dir`
> argument and there's no guarantee that ../pseudo exists or is relevant to the
> path I gave to `--rootfs-dir`.

Because we are asuming that the rootfs is being generated with
OE/yocto, and there is where the pseudo folder lives.
It is the same asumption part.prepare_rootfs() is taking.

>
> >
> > >
> > > > +            pseudo_cmd = "%s -B -m %s -M %s" % (cls.__get_pseudo(native_sysroot,new_rootfs),
> > > > +                                                part.rootfs_dir, new_rootfs)
> > > > +            exec_native_cmd(pseudo_cmd, native_sysroot)
> > > > +
> > > >              for path in part.include_path or []:
> > > >                  copyhardlinktree(path, new_rootfs)
> > >
> > >                    ^^^^^^^^^^^^^^^^
> > >
> > > If this is the right approach I imagine you would also need to fix things up
> > > with pseudo after the copyhardlinktree call above.
> >
> > I do not think it is needed. include_path does not contain its own
> > pseudo directory
>
> That's not necessarily true. The include_path could have been built by Yocto
> using pseudo.

Then you need to provide where the pseudo folder is. Eg

--include_path folder/A/B/C/D/file

Where is the pseudo database? in folder/A/B/C/D/pseudo,
folder/A/B/C/pseudo , folder/A/B/C/pseudo /...



>
> I can see that there is an issue using these arguments to wic outside of
> bitbake but I'm not sure this is the correct solution.
>
> --
> Paul Barker
> Konsulko Group



-- 
Ricardo Ribalda

