Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.32059.1610361375192532436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 02:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SV7FGO+9;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id x26so9453488vsq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Jan 2021 02:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Ha08+safpGxhm+5hEI7isLq/AlgoBokS5mycpZJ5vQ=;
        b=SV7FGO+9EcAPYxcFBcirTb+nqGG/c+/eYIY4yY8APz5m+nvkqHnNUwtXBT80bm8WIN
         GiGcLcjndWhP1/tVOgycKKkiZ7GidAe/4OguwxBM80lRnoRTSoe2aNnGq/djLhowl5E0
         Dh+tnF67D+KG8KNK0IsRFJN+j6TGUAcO9OD2NsWqJCO3tTOwQevn9mfDqmylDD3YT+/d
         sa7Iq5YBDvNkVB0drIvPbghVldsxM3zK3fdP/EGTmnIub6PDwiBuRKlXRM+hp39gzXml
         ALvvMbtnrDuWzDjpXbEHkYEVtz7Rke44jQr1STlgcCfgIx91KhgtTg51lTXl/vhmrl1d
         gbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Ha08+safpGxhm+5hEI7isLq/AlgoBokS5mycpZJ5vQ=;
        b=QoYnhaJqy9uOaHz5ytKcuIbxytWYl2FTRLxWD1JorekX88mXFPWZU9JDyrPwkqZ0Oc
         6Kdz4kO9TTHrkH0jzkbUpAZpxLGWvwRM+cPdbZDtEkhwwCo96/I46CXriRfgUdlL/W0C
         CKSUxQtU3nBBCEmUm6f8V7QuR8KcIkSgo2Z2VfgC2exniWAnpzvcxK5LUKt9sOA+YZOq
         XyhlIWGCVjRnmeXdxUoMhIvnAFyIY/QKwkRIweKvTcHoOdI9h3aPhOsCpHgjFSkYgUYi
         tFlT2wQxItMvUuuKvZwmATeC0LbnFdNZk+LeSLDRoMSdDt7WiqGFdtwKSXVbTSbY/6lp
         5c3w==
X-Gm-Message-State: AOAM5339F5SCKgRXbeagHAWf5w+15J+I/wmXjddA4sYJvEjggNFuO7e1
	8DpnyvR7EWp6lw0Zvo5FzMiM3fq6CZcxtf0bI2c=
X-Google-Smtp-Source: ABdhPJy9ebxv+2yG5Wj5TYRs6G/cCurL+LjPTWIjj51XkXIgijrMq+Zly+rcPm8arAoyBsXbUa84eAX4+2cILdyzLDw=
X-Received: by 2002:a05:6102:319b:: with SMTP id c27mr12056692vsh.20.1610361374208;
 Mon, 11 Jan 2021 02:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20210111103247.11685-1-pbarker@konsulko.com> <20210111103247.11685-6-pbarker@konsulko.com>
In-Reply-To: <20210111103247.11685-6-pbarker@konsulko.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 11 Jan 2021 11:36:01 +0100
Message-ID: <CANNYZj9Nf11EJq43Opwc7KpOWEU9nc7O1XEaoqUHuGG5ZDRjyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] wic: Optimise fstab modification for ext2/3/4 and msdos partitions
To: Paul Barker <pbarker@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ab74b005b89d7915"

--000000000000ab74b005b89d7915
Content-Type: text/plain; charset="UTF-8"

Can there be a warning if the filesystem is not one of the supported ones?

Alex

On Mon, 11 Jan 2021 at 11:33, Paul Barker <pbarker@konsulko.com> wrote:

> The fix for [Yocto #13994] required the rootfs directory to be copied
> (using hardlinks if possible) when modifying the fstab file under wic.
>
> We can optimise this copy away for filesystems where we have the tools
> to modify the contents of the partition image after it is created. For
> ext2/3/4 filesystems we have the debugfs tool and for msdos/vfat
> filesystems we have the mcopy tool. So for any of these filesystems we
> skip the modification of the fstab file in the rootfs directory (and
> skip the associated copy unless it is otherwise necessary) and update
> the contents of fstab directly in the partition image.
>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  scripts/lib/wic/partition.py             | 27 +++++++++++++++++++-----
>  scripts/lib/wic/plugins/source/rootfs.py |  9 +++++---
>  2 files changed, 28 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index f59eceb23d..e574f40c47 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -55,6 +55,8 @@ class Partition():
>          self.fsuuid = args.fsuuid
>          self.type = args.type
>          self.updated_fstab_path = None
> +        self.has_fstab = False
> +        self.update_fstab_in_rootfs = False
>
>          self.lineno = lineno
>          self.source_file = ""
> @@ -125,6 +127,8 @@ class Partition():
>          partition command parameters.
>          """
>          self.updated_fstab_path = updated_fstab_path
> +        if self.updated_fstab_path and not (self.fstype.startswith("ext")
> or self.fstype == "msdos"):
> +            self.update_fstab_in_rootfs = True
>
>          if not self.source:
>              if not self.size and not self.fixed_size:
> @@ -250,7 +254,7 @@ class Partition():
>
>          prefix = "ext" if self.fstype.startswith("ext") else self.fstype
>          method = getattr(self, "prepare_rootfs_" + prefix)
> -        method(rootfs, oe_builddir, rootfs_dir, native_sysroot, pseudo)
> +        method(rootfs, cr_workdir, oe_builddir, rootfs_dir,
> native_sysroot, pseudo)
>          self.source_file = rootfs
>
>          # get the rootfs size in the right units for kickstart (kB)
> @@ -258,7 +262,7 @@ class Partition():
>          out = exec_cmd(du_cmd)
>          self.size = int(out.split()[0])
>
> -    def prepare_rootfs_ext(self, rootfs, oe_builddir, rootfs_dir,
> +    def prepare_rootfs_ext(self, rootfs, cr_workdir, oe_builddir,
> rootfs_dir,
>                             native_sysroot, pseudo):
>          """
>          Prepare content for an ext2/3/4 rootfs partition.
> @@ -282,10 +286,19 @@ class Partition():
>              (self.fstype, extraopts, rootfs, label_str, self.fsuuid,
> rootfs_dir)
>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
>
> +        if self.updated_fstab_path and self.has_fstab:
> +            debugfs_script_path = os.path.join(cr_workdir,
> "debugfs_script")
> +            with open(debugfs_script_path, "w") as f:
> +                f.write("cd etc\n")
> +                f.write("rm fstab\n")
> +                f.write("write %s fstab\n" % (self.updated_fstab_path))
> +            debugfs_cmd = "debugfs -w -f %s %s" % (debugfs_script_path,
> rootfs)
> +            exec_native_cmd(debugfs_cmd, native_sysroot)
> +
>          mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
>
> -    def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
> +    def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_builddir,
> rootfs_dir,
>                               native_sysroot, pseudo):
>          """
>          Prepare content for a btrfs rootfs partition.
> @@ -308,7 +321,7 @@ class Partition():
>               self.mkfs_extraopts, self.fsuuid, rootfs)
>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
>
> -    def prepare_rootfs_msdos(self, rootfs, oe_builddir, rootfs_dir,
> +    def prepare_rootfs_msdos(self, rootfs, cr_workdir, oe_builddir,
> rootfs_dir,
>                               native_sysroot, pseudo):
>          """
>          Prepare content for a msdos/vfat rootfs partition.
> @@ -337,12 +350,16 @@ class Partition():
>          mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
>          exec_native_cmd(mcopy_cmd, native_sysroot)
>
> +        if self.updated_fstab_path and self.has_fstab:
> +            mcopy_cmd = "mcopy -i %s %s ::/etc/fstab" % (rootfs,
> self.updated_fstab_path)
> +            exec_native_cmd(mcopy_cmd, native_sysroot)
> +
>          chmod_cmd = "chmod 644 %s" % rootfs
>          exec_cmd(chmod_cmd)
>
>      prepare_rootfs_vfat = prepare_rootfs_msdos
>
> -    def prepare_rootfs_squashfs(self, rootfs, oe_builddir, rootfs_dir,
> +    def prepare_rootfs_squashfs(self, rootfs, cr_workdir, oe_builddir,
> rootfs_dir,
>                                  native_sysroot, pseudo):
>          """
>          Prepare content for a squashfs rootfs partition.
> diff --git a/scripts/lib/wic/plugins/source/rootfs.py
> b/scripts/lib/wic/plugins/source/rootfs.py
> index 6fd415af5b..96d940a91d 100644
> --- a/scripts/lib/wic/plugins/source/rootfs.py
> +++ b/scripts/lib/wic/plugins/source/rootfs.py
> @@ -94,6 +94,7 @@ class RootfsPlugin(SourcePlugin):
>                                 "it is not a valid path, exiting" %
> part.rootfs_dir)
>
>          part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
> +        part.has_fstab = os.path.exists(os.path.join(part.rootfs_dir,
> "etc/fstab"))
>          pseudo_dir = os.path.join(part.rootfs_dir, "../pseudo")
>          if not os.path.lexists(pseudo_dir):
>              logger.warn("%s folder does not exist. "
> @@ -103,7 +104,7 @@ class RootfsPlugin(SourcePlugin):
>          new_rootfs = None
>          new_pseudo = None
>          # Handle excluded paths.
> -        if part.exclude_path or part.include_path or
> part.change_directory or part.updated_fstab_path:
> +        if part.exclude_path or part.include_path or
> part.change_directory or part.update_fstab_in_rootfs:
>              # We need a new rootfs directory we can safely modify without
>              # interfering with other tasks. Copy to workdir.
>              new_rootfs = os.path.realpath(os.path.join(cr_workdir,
> "rootfs%d" % part.lineno))
> @@ -214,8 +215,10 @@ class RootfsPlugin(SourcePlugin):
>                      rm_cmd = "rm -rf %s" % (full_path)
>                      exec_native_cmd(rm_cmd, native_sysroot, pseudo)
>
> -            has_fstab = os.path.exists(os.path.join(new_rootfs,
> "etc/fstab"))
> -            if part.updated_fstab_path and has_fstab:
> +            # Update part.has_fstab here as fstab may have been added or
> +            # removed by the above modifications.
> +            part.has_fstab = os.path.exists(os.path.join(new_rootfs,
> "etc/fstab"))
> +            if part.update_fstab_in_rootfs and part.has_fstab:
>                  fstab_path = os.path.join(new_rootfs, "etc/fstab")
>                  # Assume that fstab should always be owned by root with
> fixed permissions
>                  install_cmd = "install -m 0644 %s %s" %
> (part.updated_fstab_path, fstab_path)
> --
> 2.26.2
>
>
> 
>
>

--000000000000ab74b005b89d7915
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can there be a warning if the filesystem is not one o=
f the supported ones?</div><div><br></div><div>Alex<br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 11 Jan=
 2021 at 11:33, Paul Barker &lt;<a href=3D"mailto:pbarker@konsulko.com">pba=
rker@konsulko.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">The fix for [Yocto #13994] required the rootfs directory t=
o be copied<br>
(using hardlinks if possible) when modifying the fstab file under wic.<br>
<br>
We can optimise this copy away for filesystems where we have the tools<br>
to modify the contents of the partition image after it is created. For<br>
ext2/3/4 filesystems we have the debugfs tool and for msdos/vfat<br>
filesystems we have the mcopy tool. So for any of these filesystems we<br>
skip the modification of the fstab file in the rootfs directory (and<br>
skip the associated copy unless it is otherwise necessary) and update<br>
the contents of fstab directly in the partition image.<br>
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:pbarker@konsulko.com" tar=
get=3D"_blank">pbarker@konsulko.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/wic/partition.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 27 +++++++++++++++++++-----<br>
=C2=A0scripts/lib/wic/plugins/source/rootfs.py |=C2=A0 9 +++++---<br>
=C2=A02 files changed, 28 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py<b=
r>
index f59eceb23d..e574f40c47 100644<br>
--- a/scripts/lib/wic/partition.py<br>
+++ b/scripts/lib/wic/partition.py<br>
@@ -55,6 +55,8 @@ class Partition():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.fsuuid =3D args.fsuuid<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.type =3D args.type<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.updated_fstab_path =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.has_fstab =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.update_fstab_in_rootfs =3D False<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.lineno =3D lineno<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.source_file =3D &quot;&quot;<br>
@@ -125,6 +127,8 @@ class Partition():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition command parameters.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.updated_fstab_path =3D updated_fsta=
b_path<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.updated_fstab_path and not (self.fsty=
pe.startswith(&quot;ext&quot;) or self.fstype =3D=3D &quot;msdos&quot;):<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.update_fstab_in_rootfs =3D=
 True<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.source:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.size and not s=
elf.fixed_size:<br>
@@ -250,7 +254,7 @@ class Partition():<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix =3D &quot;ext&quot; if self.fstyp=
e.startswith(&quot;ext&quot;) else self.fstype<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0method =3D getattr(self, &quot;prepare_r=
ootfs_&quot; + prefix)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 method(rootfs, oe_builddir, rootfs_dir, nativ=
e_sysroot, pseudo)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 method(rootfs, cr_workdir, oe_builddir, rootf=
s_dir, native_sysroot, pseudo)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.source_file =3D rootfs<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# get the rootfs size in the right units=
 for kickstart (kB)<br>
@@ -258,7 +262,7 @@ class Partition():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out =3D exec_cmd(du_cmd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.size =3D int(out.split()[0])<br>
<br>
-=C2=A0 =C2=A0 def prepare_rootfs_ext(self, rootfs, oe_builddir, rootfs_di=
r,<br>
+=C2=A0 =C2=A0 def prepare_rootfs_ext(self, rootfs, cr_workdir, oe_builddi=
r, rootfs_dir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot, pseudo):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Prepare content for an ext2/3/4 rootfs p=
artition.<br>
@@ -282,10 +286,19 @@ class Partition():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(self.fstype, extraopts, r=
ootfs, label_str, self.fsuuid, rootfs_dir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_native_cmd(mkfs_cmd, native_sysroot=
, pseudo=3Dpseudo)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.updated_fstab_path and self.has_fstab=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debugfs_script_path =3D os.path=
.join(cr_workdir, &quot;debugfs_script&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(debugfs_script_path, =
&quot;w&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;cd =
etc\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;rm =
fstab\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;wri=
te %s fstab\n&quot; % (self.updated_fstab_path))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debugfs_cmd =3D &quot;debugfs -=
w -f %s %s&quot; % (debugfs_script_path, rootfs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(debugfs_cmd, na=
tive_sysroot)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs_cmd =3D &quot;fsck.%s -pvfD %s&quot=
; % (self.fstype, rootfs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_native_cmd(mkfs_cmd, native_sysroot=
, pseudo=3Dpseudo)<br>
<br>
-=C2=A0 =C2=A0 def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_=
dir,<br>
+=C2=A0 =C2=A0 def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_build=
dir, rootfs_dir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot, pseudo):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Prepare content for a btrfs rootfs parti=
tion.<br>
@@ -308,7 +321,7 @@ class Partition():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.mkfs_extraopts, self=
.fsuuid, rootfs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_native_cmd(mkfs_cmd, native_sysroot=
, pseudo=3Dpseudo)<br>
<br>
-=C2=A0 =C2=A0 def prepare_rootfs_msdos(self, rootfs, oe_builddir, rootfs_=
dir,<br>
+=C2=A0 =C2=A0 def prepare_rootfs_msdos(self, rootfs, cr_workdir, oe_build=
dir, rootfs_dir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot, pseudo):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Prepare content for a msdos/vfat rootfs =
partition.<br>
@@ -337,12 +350,16 @@ class Partition():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mcopy_cmd =3D &quot;mcopy -i %s -s %s/* =
::/&quot; % (rootfs, rootfs_dir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_native_cmd(mcopy_cmd, native_sysroo=
t)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.updated_fstab_path and self.has_fstab=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mcopy_cmd =3D &quot;mcopy -i %s=
 %s ::/etc/fstab&quot; % (rootfs, self.updated_fstab_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(mcopy_cmd, nati=
ve_sysroot)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod_cmd =3D &quot;chmod 644 %s&quot; %=
 rootfs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_cmd(chmod_cmd)<br>
<br>
=C2=A0 =C2=A0 =C2=A0prepare_rootfs_vfat =3D prepare_rootfs_msdos<br>
<br>
-=C2=A0 =C2=A0 def prepare_rootfs_squashfs(self, rootfs, oe_builddir, root=
fs_dir,<br>
+=C2=A0 =C2=A0 def prepare_rootfs_squashfs(self, rootfs, cr_workdir, oe_bu=
ilddir, rootfs_dir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0native_sysroot, pseudo):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Prepare content for a squashfs rootfs pa=
rtition.<br>
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/pl=
ugins/source/rootfs.py<br>
index 6fd415af5b..96d940a91d 100644<br>
--- a/scripts/lib/wic/plugins/source/rootfs.py<br>
+++ b/scripts/lib/wic/plugins/source/rootfs.py<br>
@@ -94,6 +94,7 @@ class RootfsPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;it is not a valid path, exiti=
ng&quot; % part.rootfs_dir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.rootfs_dir =3D cls.__get_rootfs_dir=
(rootfs_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 part.has_fstab =3D os.path.exists(os.path.joi=
n(part.rootfs_dir, &quot;etc/fstab&quot;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pseudo_dir =3D os.path.join(part.rootfs_=
dir, &quot;../pseudo&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.lexists(pseudo_dir):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.warn(&quot;%s folde=
r does not exist. &quot;<br>
@@ -103,7 +104,7 @@ class RootfsPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_rootfs =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_pseudo =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Handle excluded paths.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.exclude_path or part.include_path or =
part.change_directory or part.updated_fstab_path:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.exclude_path or part.include_path or =
part.change_directory or part.update_fstab_in_rootfs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We need a new rootfs dir=
ectory we can safely modify without<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# interfering with other t=
asks. Copy to workdir.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_rootfs =3D os.path.rea=
lpath(os.path.join(cr_workdir, &quot;rootfs%d&quot; % part.lineno))<br>
@@ -214,8 +215,10 @@ class RootfsPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0rm_cmd =3D &quot;rm -rf %s&quot; % (full_path)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0exec_native_cmd(rm_cmd, native_sysroot, pseudo)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 has_fstab =3D os.path.exists(os=
.path.join(new_rootfs, &quot;etc/fstab&quot;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.updated_fstab_path and =
has_fstab:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update part.has_fstab here as=
 fstab may have been added or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # removed by the above modifica=
tions.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part.has_fstab =3D os.path.exis=
ts(os.path.join(new_rootfs, &quot;etc/fstab&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.update_fstab_in_rootfs =
and part.has_fstab:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fstab_path =
=3D os.path.join(new_rootfs, &quot;etc/fstab&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Assume tha=
t fstab should always be owned by root with fixed permissions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install_cmd =
=
=3D &quot;install -m 0644 %s %s&quot; % (part.updated_fstab_path, fstab_pa=
th)<br>
-- <br>
2.26.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000ab74b005b89d7915--
