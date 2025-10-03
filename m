Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A7BCCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:44:03 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.785.1759509836889083974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 09:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=p5aqCPRq;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.170, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71d71bcab6fso26458217b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759509836; x=1760114636; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osTA+1MnY8vMOIg/ia0iCz1iWvG6E3XprUFHpf0qWaA=;
        b=p5aqCPRqKZ0QkqMcpHx+NdzWwwPMjZlgZhrcQBq/6TxOsRddrUiuCqEgNKMkwSc0K9
         xX6OrL6zzRW+CV74lTv8SUdCw3rroa2RCKf2LUfgKTp21ut+3wlnD5sgQ9CkYeWcLBQ0
         N4OZZ4p2i9wOcNRAj5FsaipvOGOww6bJZZ/dyE3Ur6F6fGUUyNB1+k2UhSGavPO690nv
         HrMzvkOHapphlMnu6ZaaUOfx8N2vsE4QGPLNjMoNDL4Yan1c7zG59W1IkcB0Cf9i0dyF
         BV8Dxfk7FV9APCV5rqOb880knXr3id6llFLPOnpOJ5pqfxpJhJ2LKPqbu7Ea1VxriCde
         /pEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759509836; x=1760114636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osTA+1MnY8vMOIg/ia0iCz1iWvG6E3XprUFHpf0qWaA=;
        b=PM+X3KdrplpkbTPo1Reku7T+mEMcH69iUhIXwFFL++32ABN0DyI7/6/AvZLK0LWz9S
         y7L/3D46oiyT/LYMGbeubewsVx3hbSmkumloNZUmU6Avyxne8fo3cgOq+FhR3dePeQUF
         qRHvtrikN9qzIxlVcjoIkz1QeeeY1Zbfn1eGVfw2M9pB8X9ZGk/6gGch8hwcCf8lelrn
         /A08XWST8/tL2Ty3kSgRhA+bbcC+BhDoqa4sTYj+j88nVA5Bqr6laZFJ+4126tJKLVvN
         xoSDPWSGjmRhJWbpwRCRxFtIV/uGfH70lWHkMO8lWeGH03TlQAZm23qaAWi8k0wI+zMV
         9DRg==
X-Gm-Message-State: AOJu0Yw/tC858IpvMoAHtoO6yGEAAl4bSA67oNv6+hKTT1zNb44xjLeE
	qadjfDT+4Mfg9EHouEVb94+qFKTj303lzmUMiTPJ8ERFsN3D5q83LWtdvPOYuKnNbDAL0AnTAmT
	2CH5NO+R87vPFmwS8imWPTqGQEbOKKixqTMb2xLopqk9+ttFLnkWR
X-Gm-Gg: ASbGncuLeun7lIQTeAK13aHqhvcSxVduheHFgzYv8hZ2znJnE1ullJ6+7LtHid6Y4qn
	8IfHxvSPhAkJ4lnsrHp8ZxH6pgx4eXwUrX9ztFGLceduA9I5Jz2V+5Yw8P/5TjrNNpHWL+B1jqF
	fWKqBI80sIa/dfBoMAYLrfCQsZmSgK8Bu6ZeQXYTmE+RvdbJoPhZtcgAfdGdnZBdYWG3+ozOHZf
	y6wv4Rpnalx+88nitSDy/SVqCuhS2eHnN6uyDYOZG21FA/ZtYNz/5izm3wjyBDdkbpFNlsGPw==
X-Google-Smtp-Source: AGHT+IEph5zAU8J/MVWxtIcVmYnyNCUf1GWCW5spOgTdv0Hl5QHyOOSJWYosUxLHI58uskS7DZsGcnR+2FaooXLWHY8=
X-Received: by 2002:a53:7406:0:b0:634:73aa:d06d with SMTP id
 956f58d0204a3-63b9a0e3137mr2596186d50.32.1759509835577; Fri, 03 Oct 2025
 09:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251001163457.49114-1-daniel.dragomir@windriver.com>
 <CAOSpxdas1e33jheu0ELXgQQf9e9+8ccwbFTkffhPPYObAnjJRA@mail.gmail.com> <BY1PR11MB79813ED8D397932BA1178D36F7E4A@BY1PR11MB7981.namprd11.prod.outlook.com>
In-Reply-To: <BY1PR11MB79813ED8D397932BA1178D36F7E4A@BY1PR11MB7981.namprd11.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 3 Oct 2025 09:43:44 -0700
X-Gm-Features: AS18NWB_KoYUt7ON7N927XmZ8KWnf30uoDrb4z_MK3keaa_f3dPWdJwGn5WITUE
Message-ID: <CAOSpxdZwfQG_8JUbmvqnpGg=0oTimNv2q=XOc4iW71rX8G04zA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] wic/engine: fix copying directories
 into wic image with ext* partition
To: "Dragomir, Daniel" <Daniel.Dragomir@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 16:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224401

On Fri, Oct 3, 2025 at 12:13=E2=80=AFAM Dragomir, Daniel
<Daniel.Dragomir@windriver.com> wrote:
>
> Yes, this is an issue on master/master-next too.
> I tested and the same patch can be applied fine on both master and scarth=
gap branches.

Thanks for checking.

Please submit the patch for the master branch.  It would be helpful if
you would then ping me when you see that it has been accepted.  I'll
try to remember to watch for it, but a ping would ensure I don't miss
it :-)

Steve

>
> Regards,
> Daniel
>
> ________________________________
> From: Steve Sakoman <steve@sakoman.com>
> Sent: Thursday, October 2, 2025 5:55 PM
> To: Dragomir, Daniel <Daniel.Dragomir@windriver.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: Re: [OE-core][scarthgap][PATCH] wic/engine: fix copying director=
ies into wic image with ext* partition
>
> Is this also an issue on master?  If so, you will need to submit this
> patch for master before I can take it for scarthgap.  If not, can you
> explain why it isn't needed there?
>
> Thanks,
>
> Steve
>
> On Wed, Oct 1, 2025 at 2:25=E2=80=AFPM Dragomir, Daniel via
> lists.openembedded.org
> <daniel.dragomir=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > wic uses debugfs to write on ext* partitions, but debugfs can only
> > write to the current working directory and it cannot copy complete
> > directory trees. Running 'wic ls' on a copied directory show this:
> >     -l: Ext2 inode is not a directory
> >
> > Fix this by creating a command list for debugfs (-f parameter) when
> > recursive parsing the host directory in order to create a similar
> > directory structure (mkdir) and copy files (write) on each level
> > into the destination directory from the wic's ext* partition.
> >
> > Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
> > ---
> >  scripts/lib/wic/engine.py | 63 ++++++++++++++++++++++++++++++---------
> >  1 file changed, 49 insertions(+), 14 deletions(-)
> >
> > diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> > index b9e60cbe4e..9d596be3a7 100644
> > --- a/scripts/lib/wic/engine.py
> > +++ b/scripts/lib/wic/engine.py
> > @@ -345,29 +345,64 @@ class Disk:
> >                                                     path))
> >
> >      def copy(self, src, dest):
> > -        """Copy partition image into wic image."""
> > -        pnum =3D  dest.part if isinstance(src, str) else src.part
> > +        """Copy files or directories to/from the vfat or ext* partitio=
n."""
> > +        pnum =3D dest.part if isinstance(src, str) else src.part
> > +        partimg =3D self._get_part_image(pnum)
> >
> >          if self.partitions[pnum].fstype.startswith('ext'):
> > -            if isinstance(src, str):
> > -                cmd =3D "printf 'cd {}\nwrite {} {}\n' | {} -w {}".\
> > -                      format(os.path.dirname(dest.path), src, os.path.=
basename(src),
> > -                             self.debugfs, self._get_part_image(pnum))
> > -            else: # copy from wic
> > -                # run both dump and rdump to support both files and di=
rectory
> > +            if isinstance(src, str): # host to image case
> > +                if os.path.isdir(src):
> > +                    base =3D os.path.abspath(src)
> > +                    base_parent =3D os.path.dirname(base)
> > +                    cmds =3D []
> > +                    made =3D set()
> > +
> > +                    for root, dirs, files in os.walk(base):
> > +                        for fname in files:
> > +                            host_file =3D os.path.join(root, fname)
> > +                            rel =3D os.path.relpath(host_file, base_pa=
rent)
> > +                            dest_file =3D os.path.join(dest.path, rel)
> > +                            dest_dir =3D os.path.dirname(dest_file)
> > +
> > +                            # create dir structure (mkdir -p)
> > +                            parts =3D dest_dir.strip('/').split('/')
> > +                            cur =3D ''
> > +                            for p in parts:
> > +                                cur =3D cur + '/' + p
> > +                                if cur not in made:
> > +                                    cmds.append(f'mkdir "{cur}"')
> > +                                    made.add(cur)
> > +
> > +                            cmds.append(f'write "{host_file}" "{dest_f=
ile}"')
> > +
> > +                    # write script to a temp file
> > +                    with tempfile.NamedTemporaryFile(mode=3D'w', delet=
e=3DFalse,
> > +                                                     prefix=3D'wic-deb=
ugfs-') as tf:
> > +                        for line in cmds:
> > +                            tf.write(line + '\n')
> > +                        scriptname =3D tf.name
> > +
> > +                    cmd =3D f"{self.debugfs} -w -f {scriptname} {parti=
mg}"
> > +
> > +                else: # single file
> > +                    cmd =3D "printf 'cd {}\nwrite {} {}\n' | {} -w {}"=
.\
> > +                          format(os.path.dirname(dest.path), src,
> > +                                 os.path.basename(src), self.debugfs, =
partimg)
> > +
> > +            else: # image to host case
> >                  cmd =3D "printf 'cd {}\ndump /{} {}\nrdump /{} {}\n' |=
 {} {}".\
> >                        format(os.path.dirname(src.path), src.path,
> > -                             dest, src.path, dest, self.debugfs,
> > -                             self._get_part_image(pnum))
> > +                             dest, src.path, dest, self.debugfs, parti=
mg)
> > +
> >          else: # fat
> >              if isinstance(src, str):
> >                  cmd =3D "{} -i {} -snop {} ::{}".format(self.mcopy,
> > -                                                  self._get_part_image=
(pnum),
> > -                                                  src, dest.path)
> > +                                                      partimg,
> > +                                                      src, dest.path)
> >              else:
> >                  cmd =3D "{} -i {} -snop ::{} {}".format(self.mcopy,
> > -                                                  self._get_part_image=
(pnum),
> > -                                                  src.path, dest)
> > +                                                      partimg,
> > +                                                      src.path, dest)
> >
> >          exec_cmd(cmd, as_shell=3DTrue)
> >          self._put_part_image(pnum)
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#224331): https://lists.openembedded.org/g/openembed=
ded-core/message/224331
> > Mute This Topic: https://lists.openembedded.org/mt/115542019/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

