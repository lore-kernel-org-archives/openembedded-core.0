Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853F6CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 14:56:18 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.10866.1759416968476113721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 07:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HmOwkH7f;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.182, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71d603a9cfaso12698287b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759416967; x=1760021767; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LY+2lbvVIUJ7+K56+zTUvBli5mNXXIZnHB9Eg8xcx88=;
        b=HmOwkH7fEQKQZYkjUD437DEVkgfVD933Fv/xBeECZb51S0sROZRoXf/iD2ZOX7k+NU
         Uja4giTMjnqvUy6YfZPimVGmaRVdH/UlgD+qi8B5FC8Knadu//3196lpHbw3s/lOo9MG
         xb+3bCUNuVTZkpV19xG6L96A79LwHU7TZHoW0a6epj2ct0yWML4HBXt7cJnoc69weZtK
         aPseuxWd+f3tstZRsRkXywEz0tsv9R84u/5ayqmhGxo+EPm1/Zh+1nBf4hWbGkI9z5jr
         3NJZkcaxnhQ17D3S/WLrQUuddlyavxxlhbvbia5vW6cYFGZCSaKU0a5z9Bk3OIUv7Uc1
         ILIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416967; x=1760021767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LY+2lbvVIUJ7+K56+zTUvBli5mNXXIZnHB9Eg8xcx88=;
        b=PkXTA6TuIZwCyDvdrTJC9aLimAqjaBIAGHEoz+8QAprtEiEk8a/3Bcf+MGm6Twh1Qk
         EP+0ZhdvBmlKLGL7NNgJ6ZamhZaEw23Cc4d3RO18MxEH3dnl5y6vV46Zyd9yR3DdFU2S
         e+0k6DAjQhjkN3Ydiu8ldO2sjeyfWicXb07XEfE2d9BjOE/jV7keavO2UIh0lLi+1+4S
         iqqtzwvPxDbgmd3ok4l/HlK5PYmgpZqewKLVC5lf4JFBOaN0WSXXTzsmFurOKvmVWTL6
         Ku9TbJzQINZ1vRxEY/97UImN15ayBAW6vOEXWyzeOUmw8HUq2k+Hq2GRmRskf5u3FuRM
         cYMw==
X-Gm-Message-State: AOJu0YyyQP6VI6CLVGMBEis6SmzGzpK2sT8MrUe3xV7xz6q2KnmM6c+t
	rOJeQeWgeO8yGFdKJNlgbGjqXdrzwu4gEhRAZh23cyOGQ4mWnKjZGxdVM+QV65zwNo4eGlOMg/b
	rcWtgfH6UDqFL9YOOmgiwwIXym7nuSP3gWNzsM2btKrkJ7EihiPyl
X-Gm-Gg: ASbGnctkswQdl/clx1b1Uv64EOhsXUXYygPAPPl7BZEfp7+k4Zzqg+Ur9sJPzaUWRx+
	zXnvC35cLaTlb6zInXtQwv2s1lpHJPFulf68SejC3lUAcCmvq2QSZUxH9lpK6FQxzdQGJ7nnLUH
	i9EiRHG6g2ipMLiYsXo7sfW7E79j7ezjEl1YH1WTF66mO+OuHlXb5oEbaXiUm0xLLOH2Vf/ocy/
	gtQphHmBgsfyKqyG7LyWc14a0kDVbLKEHw3t1Co9sLfjiOvctKBAfC/qD2OXLo=
X-Google-Smtp-Source: AGHT+IHSC3JC5Y5B9olqb2lFgM/E1Vg77t0Yp+mOgQ82z94M2wdca7XutClzuwprT8mA50c8K8w1Wojsd0K2uuypMWw=
X-Received: by 2002:a53:be48:0:b0:636:1f40:2f5a with SMTP id
 956f58d0204a3-63b7009c53emr7713735d50.44.1759416967414; Thu, 02 Oct 2025
 07:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251001163457.49114-1-daniel.dragomir@windriver.com>
In-Reply-To: <20251001163457.49114-1-daniel.dragomir@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 2 Oct 2025 07:55:56 -0700
X-Gm-Features: AS18NWDNpBiN6IZIaXQbLxx6hNeGddO3mlXG_P6piF6Q3yE09gZ2s16JqIsJz5U
Message-ID: <CAOSpxdas1e33jheu0ELXgQQf9e9+8ccwbFTkffhPPYObAnjJRA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] wic/engine: fix copying directories
 into wic image with ext* partition
To: daniel.dragomir@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 14:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224363

Is this also an issue on master?  If so, you will need to submit this
patch for master before I can take it for scarthgap.  If not, can you
explain why it isn't needed there?

Thanks,

Steve

On Wed, Oct 1, 2025 at 2:25=E2=80=AFPM Dragomir, Daniel via
lists.openembedded.org
<daniel.dragomir=3Dwindriver.com@lists.openembedded.org> wrote:
>
> wic uses debugfs to write on ext* partitions, but debugfs can only
> write to the current working directory and it cannot copy complete
> directory trees. Running 'wic ls' on a copied directory show this:
>     -l: Ext2 inode is not a directory
>
> Fix this by creating a command list for debugfs (-f parameter) when
> recursive parsing the host directory in order to create a similar
> directory structure (mkdir) and copy files (write) on each level
> into the destination directory from the wic's ext* partition.
>
> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
> ---
>  scripts/lib/wic/engine.py | 63 ++++++++++++++++++++++++++++++---------
>  1 file changed, 49 insertions(+), 14 deletions(-)
>
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index b9e60cbe4e..9d596be3a7 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -345,29 +345,64 @@ class Disk:
>                                                     path))
>
>      def copy(self, src, dest):
> -        """Copy partition image into wic image."""
> -        pnum =3D  dest.part if isinstance(src, str) else src.part
> +        """Copy files or directories to/from the vfat or ext* partition.=
"""
> +        pnum =3D dest.part if isinstance(src, str) else src.part
> +        partimg =3D self._get_part_image(pnum)
>
>          if self.partitions[pnum].fstype.startswith('ext'):
> -            if isinstance(src, str):
> -                cmd =3D "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
> -                      format(os.path.dirname(dest.path), src, os.path.ba=
sename(src),
> -                             self.debugfs, self._get_part_image(pnum))
> -            else: # copy from wic
> -                # run both dump and rdump to support both files and dire=
ctory
> +            if isinstance(src, str): # host to image case
> +                if os.path.isdir(src):
> +                    base =3D os.path.abspath(src)
> +                    base_parent =3D os.path.dirname(base)
> +                    cmds =3D []
> +                    made =3D set()
> +
> +                    for root, dirs, files in os.walk(base):
> +                        for fname in files:
> +                            host_file =3D os.path.join(root, fname)
> +                            rel =3D os.path.relpath(host_file, base_pare=
nt)
> +                            dest_file =3D os.path.join(dest.path, rel)
> +                            dest_dir =3D os.path.dirname(dest_file)
> +
> +                            # create dir structure (mkdir -p)
> +                            parts =3D dest_dir.strip('/').split('/')
> +                            cur =3D ''
> +                            for p in parts:
> +                                cur =3D cur + '/' + p
> +                                if cur not in made:
> +                                    cmds.append(f'mkdir "{cur}"')
> +                                    made.add(cur)
> +
> +                            cmds.append(f'write "{host_file}" "{dest_fil=
e}"')
> +
> +                    # write script to a temp file
> +                    with tempfile.NamedTemporaryFile(mode=3D'w', delete=
=3DFalse,
> +                                                     prefix=3D'wic-debug=
fs-') as tf:
> +                        for line in cmds:
> +                            tf.write(line + '\n')
> +                        scriptname =3D tf.name
> +
> +                    cmd =3D f"{self.debugfs} -w -f {scriptname} {partimg=
}"
> +
> +                else: # single file
> +                    cmd =3D "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
> +                          format(os.path.dirname(dest.path), src,
> +                                 os.path.basename(src), self.debugfs, pa=
rtimg)
> +
> +            else: # image to host case
>                  cmd =3D "printf 'cd {}\ndump /{} {}\nrdump /{} {}\n' | {=
} {}".\
>                        format(os.path.dirname(src.path), src.path,
> -                             dest, src.path, dest, self.debugfs,
> -                             self._get_part_image(pnum))
> +                             dest, src.path, dest, self.debugfs, partimg=
)
> +
>          else: # fat
>              if isinstance(src, str):
>                  cmd =3D "{} -i {} -snop {} ::{}".format(self.mcopy,
> -                                                  self._get_part_image(p=
num),
> -                                                  src, dest.path)
> +                                                      partimg,
> +                                                      src, dest.path)
>              else:
>                  cmd =3D "{} -i {} -snop ::{} {}".format(self.mcopy,
> -                                                  self._get_part_image(p=
num),
> -                                                  src.path, dest)
> +                                                      partimg,
> +                                                      src.path, dest)
>
>          exec_cmd(cmd, as_shell=3DTrue)
>          self._put_part_image(pnum)
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224331): https://lists.openembedded.org/g/openembedde=
d-core/message/224331
> Mute This Topic: https://lists.openembedded.org/mt/115542019/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

