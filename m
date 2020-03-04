Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 835DA6184F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 10:03:04 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id f13so1333940ljp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 02:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Wo1ta41+iDNIubUI/DWQjB8Oue/ziVab22fQYpbJQYc=;
	b=Ji4z71htjyE3/TiA60oJB8mjC8P5FHJY4UjBf//ml7pq/h2GyaWQcSsRIazu1QKYd+
	fmrclVYEqkCnO2hxk0ospKxwjYXyCsQnqdiOdYabjVP1IL/3AE1oPTwjijf894+KZNr8
	jWIds4ypjxxXMCv3G8gPPZQVyV+mE2N1HIy1x6KCqkYo3ay2AulpFols4qbZMCqww6xJ
	aSl7vk6Mu/6zDq0FiXX2G4iyrXn6DriW5IeWOAqNb460eSszNnOCEVzbCUxWYlxgkkNv
	TaosGoJG17LPhqWfX1uPohcIMsgiqN6zdZaKHIrNIESCMTLwEPnQwjui9sDyGpd25klF
	zzJw==
X-Gm-Message-State: ANhLgQ1OlpTWlz8RKbtrwJ68xvwsIiGux+mciYpL/LU9oiIkkEBHk59B
	eeiE6UhW2/ukrBBWavCPnF7x2N+GL0huE6EFemU=
X-Google-Smtp-Source: ADFU+vu7NU2FHFm5+Hn+b284KMNMDW5ZqjNKmeZH9g0A8rXUIHyIhTf+kydrrJrTWoUtuVWck45uqTeawjwHiCeet3w=
X-Received: by 2002:a05:651c:2c1:: with SMTP id
	f1mr1479767ljo.125.1583316184796; 
	Wed, 04 Mar 2020 02:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20200304083438.1022216-1-ricardo@ribalda.com>
	<20200304095334.1f20ddd9@ub1910>
In-Reply-To: <20200304095334.1f20ddd9@ub1910>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Wed, 4 Mar 2020 11:02:47 +0100
Message-ID: <CAPybu_17EBoQH45Cpb+2UJ-Yoho062_5sGWAT1qmu4MPycOHBQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Mar 2020 10:03:04 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Paul

On Wed, Mar 4, 2020 at 10:53 AM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Wed,  4 Mar 2020 09:34:37 +0100
> Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
>
> > When parameters include_path or exclude_path are passed to the rootfs
> > plugin, it will copy the partition content into a folder and make all
> > the modifications there.
> >
> > This is done using copyhardlinktree(), which does not take into
> > consideration the content of the pseudo folder, which contains the
> > information about the right permissions and ownership of the folders.
>
> How are you running wic here? In the do_image_wic task it's executed under
> pseudo so all this is handled already. Executing wic outside of bitbake may
> need some more testing here.

I am running wic outside bitbake. But even if it is run under bitbake,
it should also fail. The pseudo directory needs to be present on the
target image

>
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
> > +                shutil.rmtree(os.path.join(new_rootfs, "../pseudo"))
> > +            copytree(os.path.join(part.rootfs_dir, "../pseudo"),
> > +                     os.path.join(new_rootfs, "../pseudo"))
>
> I don't like stepping up the directory tree like this. We should be more
> explicit with the paths.

You are thinking on:
os.path.dirname(directory)

>
> > +            pseudo_cmd = "%s -B -m %s -M %s" % (cls.__get_pseudo(native_sysroot,new_rootfs),
> > +                                                part.rootfs_dir, new_rootfs)
> > +            exec_native_cmd(pseudo_cmd, native_sysroot)
> > +
> >              for path in part.include_path or []:
> >                  copyhardlinktree(path, new_rootfs)
>
>                    ^^^^^^^^^^^^^^^^
>
> If this is the right approach I imagine you would also need to fix things up
> with pseudo after the copyhardlinktree call above.

I do not think it is needed. include_path does not contain its own
pseudo directory

>
> --
> Paul Barker
> Konsulko Group



-- 
Ricardo Ribalda

