Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8A2D47CD3
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 10:40:15 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3166.1768560012189658662
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 02:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LG6zZ5Ez;
 spf=pass (domain: smile.fr, ip: 209.85.208.169, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38310ee9d40so16023931fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 02:40:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768560010; cv=none;
        d=google.com; s=arc-20240605;
        b=IZAPN5nnYS+oLcadtpbA1RURp+dHYFHFWsvmvew1mb0u0cKmnn2Mi8s+KoFNNjSv8K
         4m/BaheskITDxjS0s0eWeDHb0WeqLAVpk+xVg40oBb0ejg7gd1SHZF2USjkPLEqFmZiE
         1+YtdrHh0zoC4y6WLOT5c6Y3zFKaku2BBrypx2JPSKmIr7rlwyPe7du6Lf29aR3IZG86
         zqa2uv+PohVCTewBegM0eFQ9djOUt5I6oYnywiUlJynI6krEmoVoyco1orBcBmMx2Ys7
         nXK/ds2TqgqdKpuetBfWpV0CGw98COPTQVW+PmpXdVflMUYm+zA0SvL8BUtBLtY+AU07
         vmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5GJLV6JfCCJBEAyTAmz1t7zf/vKQ8HoKnNUZV33Je3M=;
        fh=ZNQrCAwYkE/hjzZaE1C7oWPVZ/HsTLZmLeGbRsNIuR0=;
        b=cC48J/bsLIp0YTeh7SEnRg57WyB8Nhg9vplWjg5kaSogE9zSlsw5s7FG8taRTrn8Ek
         nxoln8Kj0wV0kIa4zVa2E19ITXFCSCiFDX+bEoRbQf+zjwOvNxLa4IJ3RdwnFo5AkL4l
         O8ORVtnphyx8y476M+lCqyXqGomwogqPQWMbHhHJqKbocYtfdTSQD6TDTZnj1Ht3JhbD
         q2lfVphAF8z7GmLiNEv2l3ImZcQ1ode/ve/ML18Ugue1VepjLQqas93agQKtoH28bF73
         roYQcYp3+wlcT6D0lngFiGYTyTqV7nyVSsmNUsGejPQ1q2C9pDmsnWxhGse3kiBKsdCF
         0acQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768560010; x=1769164810; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5GJLV6JfCCJBEAyTAmz1t7zf/vKQ8HoKnNUZV33Je3M=;
        b=LG6zZ5EzTYlGQqreazwWD/f2N7O4whMu81LMl3UAE9WUcpP1g7mFo8/M9PT1Cf+gOq
         7S3OURgxIkpO299gNxrkK43LyeQMpIQMz1FwmZpFb41/HkHGkCKRCqb1pmKpzF7jr8hL
         JC05+gbLDGEiZXHPJn8HeW7Qrt8/pgqU8/bj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560010; x=1769164810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GJLV6JfCCJBEAyTAmz1t7zf/vKQ8HoKnNUZV33Je3M=;
        b=DfJERvwyRH2p1NlG1sDB0yGD5FwpXuCUb1GSQAGKdx7pAcgeUiSFmeNKpN6hoKGZag
         5MSaBgBCr51Dk8Dxilu6xsE1OX/SMjyobDnfROU3bM0D7Yes4kBI42AWB1KW433E8WqX
         nhK40PXOjTCWiqNLDScr1MHB3TJyCkYWIoGyqxz/fEQEiaKTUKv0rouw9rifQQFmOKBR
         0s/CAEeyot0wwq/PN0goKyV0p4aix6NP8zhe6U0GcP4fDkRq7eC7PSYvZXNLgKGgLDA/
         /aZtq+JpxVE9MUQ9vJOB31rkwl13KoOELaESzfbILaLF6EInMUemdp43u9i3byYbzz3N
         1KEg==
X-Gm-Message-State: AOJu0YxXFBWQlEip67ZDCnti0sxHryq1kVM54yDa4BegNEMCi0OnuNJC
	xcB9GSDxvrnnqDOUHLzkOwfyr17HmNX6fwBPqwDA7zw4ucP9fZfQ8sfnBNJiivyorgVldtnWHBJ
	0rgohUb9T4XB4eFEHsHtYQC8773Z3rj0ObWNJ0f+rlA==
X-Gm-Gg: AY/fxX4h9R+VdHFJ7OmyDtrABLVntZobbUBenHdbjYyRJKBcGu543WHy27py5APAtq2
	FI0Zr9fpdqiOt5xuUSeuoinYowJ2GYeuwMxj6EzNYxBWMsfOgV0CKsVjxMGWp5fRhpksOjE3p8g
	5QxAe+ST6FDkQcwpv4FxAzq93xtBwUT/E3nU0UCt6CvbtY0qw5lI35MZx+4KLdPuY0CrOZ1nD5z
	e0kKSE1VgbADvBBCBO6nQK4zwGikvzLqmDOjyLj8pkruVvkzgd9ZJqmxcZdJboD30ADGP2S8uja
	9eFyYipJYcUxLw8Q1jFwygcDzSE7mTyDbjaFbnEiuo+rIxlIvxeQMDrB
X-Received: by 2002:a2e:a556:0:b0:382:4d6b:993b with SMTP id
 38308e7fff4ca-3838430e070mr8665521fa.35.1768560009858; Fri, 16 Jan 2026
 02:40:09 -0800 (PST)
MIME-Version: 1.0
References: <20260116093215.26108-1-adam.duskett@amarulasolutions.com> <20260116093215.26108-6-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260116093215.26108-6-adam.duskett@amarulasolutions.com>
From: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Date: Fri, 16 Jan 2026 11:39:58 +0100
X-Gm-Features: AZwV_QjSfcp_dJjZ0CnH64fQG627fMEWdcduGfPBcf7-syWlQKtE4OJDDVOFo-w
Message-ID: <CAHT-cZumgyEteKTSO5FGGoC3Xo0+05SUBpzsvpW2fVTZX4CP7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 6/6] wic: extra-partitions: extend to support
 extra directories
To: adam.duskett@amarulasolutions.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000026de2006487ef708"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 10:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229542

--00000000000026de2006487ef708
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Thanks,

Pierre-Loup

On Fri, Jan 16, 2026 at 10:32=E2=80=AFAM Adam Duskett via lists.openembedde=
d.org
<adam.duskett=3Damarulasolutions.com@lists.openembedded.org> wrote:

>   - Add the ability to define a space-delminated list of directories
>     to create on the extra partition.
>
>   - Extend the fail condition to fail if both extra directories and
>     extra files is not defined.
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v1 -> v2: Make the list space deliminated instead of semicolon deliminate=
d.
>           If the list is blank, print a warning instead of an info.
>
> v2 -> v3: Remove uneeded logic in _parse_extra_directories
>
> v3 -> v4: Rework to error if extra directories and files are not set.
>
> v4 -> v5: Fix double image_extra_partition_dirs_var_name typo
>           Change logger.debug print for consistency
>           Reword plugin description for clarity
>           Add an extra line in the plugin description before the WICVARS
>           Remove extra space between _get_extra_vars and
> _parse_extra_directories
>
>  meta/lib/oeqa/selftest/cases/wic.py           | 11 ++++
>  .../lib/wic/plugins/source/extra_partition.py | 60 +++++++++++++++----
>  2 files changed, 59 insertions(+), 12 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py
> b/meta/lib/oeqa/selftest/cases/wic.py
> index d7a9b14658..83072deaae 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -1657,10 +1657,14 @@ INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
>      def test_extra_partition_plugin(self):
>          """Test extra partition plugin"""
>          config =3D dedent("""\
> +        IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo =3D "/test1
> /test2/test3"
> +
> IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d10=
5d
> =3D "/test1 /test2/test3"
>          IMAGE_EXTRA_PARTITION_FILES_label-foo =3D "bar.conf;foo.conf"
>
>  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =
=3D
> "bar.conf;foobar.conf"
>          IMAGE_EXTRA_PARTITION_FILES =3D "foo/*"
>          WICVARS:append =3D "\
> +            IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo \
> +
> IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d10=
5d
> \
>              IMAGE_EXTRA_PARTITION_FILES_label-foo \
>
>  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
>          "
> @@ -1692,6 +1696,13 @@ INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
>                  result =3D runCmd("wic ls %s | wc -l" % wicimg)
>                  self.assertEqual('4', result.output, msg=3D"Expect 3
> partitions, not %s" % result.output)
>
> +                for part, extra_dir in enumerate(["test1", "test2"]):
> +                    result =3D runCmd("wic ls %s:%d | grep -q \"%s\"" %
> (wicimg, part + 1, extra_dir))
> +                    self.assertEqual(0, result.status, msg=3D"Directory
> '%s' not found in the partition #%d" % (extra_dir, part))
> +
> +                    result =3D runCmd("wic ls %s:%d/test2 | grep -q
> \"test3\"" % (wicimg, part + 1))
> +                    self.assertEqual(0, result.status, msg=3D"Directory
> test2/test3 not found in the partition #%d" % part)
> +
>                  for part, file in enumerate(["foo.conf", "foobar.conf",
> "bar.conf"]):
>                      result =3D runCmd("wic ls %s:%d | grep -q \"%s\"" %
> (wicimg, part + 1, file))
>                      self.assertEqual(0, result.status, msg=3D"File '%s' =
not
> found in the partition #%d" % (file, part))
> diff --git a/scripts/lib/wic/plugins/source/extra_partition.py
> b/scripts/lib/wic/plugins/source/extra_partition.py
> index 327bc2b8c3..3be7aed374 100644
> --- a/scripts/lib/wic/plugins/source/extra_partition.py
> +++ b/scripts/lib/wic/plugins/source/extra_partition.py
> @@ -12,21 +12,31 @@ logger =3D logging.getLogger('wic')
>
>  class ExtraPartitionPlugin(SourcePlugin):
>      """
> -    Populates an extra partition with files listed in the
> IMAGE_EXTRA_PARTITION_FILES
> -    BitBake variable. Files should be deployed to the DEPLOY_DIR_IMAGE
> directory.
> +    Populates an extra partition with:
> +    - Files listed in the IMAGE_EXTRA_PARTITION_FILES BitBake variable.
> Files should be deployed to
> +      the DEPLOY_DIR_IMAGE directory.
> +    - Empty directories listed in the IMAGE_EXTRA_PARTITION_DIRECTORIES
> Bitbake variable.
> +      Directories are created automatically.
>
>      The plugin supports:
>      - Glob pattern matching for file selection.
>      - File renaming.
>      - Suffixes to specify the target partition (by label, UUID, or
> partname),
>        enabling multiple extra partitions to coexist.
> +    - Extra directories.
>
>      For example:
>
> +        IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo =3D "/foo /bar/baz"
> +
> IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d10=
5d
> =3D "/foo /bar/baz"
> +
>          IMAGE_EXTRA_PARTITION_FILES_label-foo =3D "bar.conf;foo.conf"
>
>  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =
=3D
> "bar.conf;foobar.conf"
>          IMAGE_EXTRA_PARTITION_FILES =3D "foo/*"
> +
>          WICVARS:append =3D "\
> +            IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo \
> +
> IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d10=
5d
> \
>              IMAGE_EXTRA_PARTITION_FILES_label-foo \
>
>  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
>          "
> @@ -34,6 +44,7 @@ class ExtraPartitionPlugin(SourcePlugin):
>      """
>
>      name =3D 'extra_partition'
> +    image_extra_partition_dirs_var_name =3D
> 'IMAGE_EXTRA_PARTITION_DIRECTORIES'
>      image_extra_partition_files_var_name =3D 'IMAGE_EXTRA_PARTITION_FILE=
S'
>
>      @classmethod
> @@ -50,6 +61,22 @@ class ExtraPartitionPlugin(SourcePlugin):
>                  break
>          return extra_vars
>
> +    @classmethod
> +    def _parse_extra_directories(cls, part):
> +        """
> +        Parse the directories of which to copy.
> +        """
> +        cls.extra_dirs_task =3D []
> +
> +        extra_dirs =3D cls._get_extra_vars(part,
> cls.image_extra_partition_dirs_var_name)
> +        if extra_dirs is None:
> +            logger.info('No extra directories defined, %s unset for
> entry #%d' % (cls.image_extra_partition_dirs_var_name, part.lineno))
> +            return
> +
> +        logger.info('Extra dirs: %s', extra_dirs)
> +        for src_entry in extra_dirs.strip().split(' '):
> +            cls.extra_dirs_task.append(src_entry)
> +
>      @classmethod
>      def _parse_extra_files(cls, part, kernel_dir):
>          """
> @@ -113,6 +140,7 @@ class ExtraPartitionPlugin(SourcePlugin):
>              if not kernel_dir:
>                  raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting"=
)
>
> +        cls._parse_extra_directories(part)
>          cls._parse_extra_files(part, kernel_dir)
>
>      @classmethod
> @@ -126,24 +154,32 @@ class ExtraPartitionPlugin(SourcePlugin):
>          """
>          extradir =3D "%s/extra.%d" % (cr_workdir, part.lineno)
>
> -        if not cls.extra_files_task:
> -            raise WicError("Entry #%d does not have a corresponding %s
> variable set!"
> +        if not cls.extra_dirs_task and not cls.extra_files_task:
> +            raise WicError("Entry #%d does not have a corresponding %s o=
r
> %s variable set!"
>                             "If you wish to create an empty partition,
> remove "
>                             "--source extra-partition from the wks file"
> -                           % (part.lineno,
> cls.image_extra_partition_files_var_name))
> +                           % (part.lineno,
> cls.image_extra_partition_dirs_var_name,
> +                              cls.image_extra_partition_files_var_name))
>
>          if not kernel_dir:
>              kernel_dir =3D get_bitbake_var("DEPLOY_DIR_IMAGE")
>              if not kernel_dir:
>                  raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting"=
)
>
> -        for task in cls.extra_files_task:
> -            src_path, dst_path =3D task
> -            logger.debug('Install %s as %s', src_path, dst_path)
> -            install_cmd =3D "install -m 0644 -D %s %s" \
> -                          % (os.path.join(kernel_dir, src_path),
> -                             os.path.join(extradir, dst_path))
> -            exec_cmd(install_cmd)
> +        if cls.extra_dirs_task:
> +            for task in cls.extra_dirs_task:
> +                logger.debug("Create directory %s" % task)
> +                mkdir_cmd =3D "mkdir -p %s/%s" % (extradir, task)
> +                exec_cmd(mkdir_cmd)
> +
> +        if cls.extra_files_task:
> +            for task in cls.extra_files_task:
> +                src_path, dst_path =3D task
> +                logger.debug('Install %s as %s', src_path, dst_path)
> +                install_cmd =3D "install -m 0644 -D %s %s" \
> +                              % (os.path.join(kernel_dir, src_path),
> +                                 os.path.join(extradir, dst_path))
> +                exec_cmd(install_cmd)
>
>          logger.debug('Prepare extra partition using rootfs in %s',
> extradir)
>          part.prepare_rootfs(cr_workdir, oe_builddir, extradir,
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Liens: Vous recevez tous les messages envoy=C3=A9s =C3=A0 ce groupe.
> Voir/R=C3=A9pondre en ligne (#229536):
> https://lists.openembedded.org/g/openembedded-core/message/229536
> Sujets: https://lists.openembedded.org/mt/117295121/9955716
> Propri=C3=A9taire du groupe: openembedded-core+owner@lists.openembedded.o=
rg
> Se d=C3=A9sabonner: https://lists.openembedded.org/g/openembedded-core/un=
sub [
> pierre-loup.gosse@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000026de2006487ef708
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Pierre-Loup GOSSE &lt;<a href=3D"mailto:=
pierre-loup.gosse@smile.fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a=
>&gt;</div><div><br></div><div>Thanks,</div><div><br></div><div>Pierre-Loup=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jan 16, 2026 at 10:32=E2=80=AFAM Adam=
 Duskett via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a> &lt;adam.duskett=3D<a href=3D"mailto:amarulasolutions.com@lists.open=
embedded.org">amarulasolutions.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 - Add the a=
bility to define a space-delminated list of directories<br>
=C2=A0 =C2=A0 to create on the extra partition.<br>
<br>
=C2=A0 - Extend the fail condition to fail if both extra directories and<br=
>
=C2=A0 =C2=A0 extra files is not defined.<br>
<br>
Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolut=
ions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
---<br>
v1 -&gt; v2: Make the list space deliminated instead of semicolon deliminat=
ed.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If the list is blank, print a warning in=
stead of an info.<br>
<br>
v2 -&gt; v3: Remove uneeded logic in _parse_extra_directories<br>
<br>
v3 -&gt; v4: Rework to error if extra directories and files are not set.<br=
>
<br>
v4 -&gt; v5: Fix double image_extra_partition_dirs_var_name typo <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Change logger.debug print for consistenc=
y<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Reword plugin description for clarity<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Add an extra line in the plugin descript=
ion before the WICVARS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Remove extra space between _get_extra_va=
rs and _parse_extra_directories<br>
<br>
=C2=A0meta/lib/oeqa/selftest/cases/wic.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 11 ++++<br>
=C2=A0.../lib/wic/plugins/source/extra_partition.py | 60 +++++++++++++++---=
-<br>
=C2=A02 files changed, 59 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py<br>
index d7a9b14658..83072deaae 100644<br>
--- a/meta/lib/oeqa/selftest/cases/wic.py<br>
+++ b/meta/lib/oeqa/selftest/cases/wic.py<br>
@@ -1657,10 +1657,14 @@ INITRAMFS_IMAGE =3D &quot;core-image-initramfs-boot=
&quot;<br>
=C2=A0 =C2=A0 =C2=A0def test_extra_partition_plugin(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Test extra partition pl=
ugin&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config =3D dedent(&quot;&quot;&quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo =
=3D &quot;/test1 /test2/test3&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824=
e-cda3-4bed-9f54-9ef5312d105d =3D &quot;/test1 /test2/test3&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES_label-foo =3D=
 &quot;bar.conf;foo.conf&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e=
-cda3-4bed-9f54-9ef5312d105d =3D &quot;bar.conf;foobar.conf&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES =3D &quot;foo=
/*&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WICVARS:append =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_DIRECTORIE=
S_label-foo \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_DIRECTORIE=
S_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES=
_label-foo \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES=
_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
@@ -1692,6 +1696,13 @@ INITRAMFS_IMAGE =3D &quot;core-image-initramfs-boot&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D ru=
nCmd(&quot;wic ls %s | wc -l&quot; % wicimg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEq=
ual(&#39;4&#39;, result.output, msg=3D&quot;Expect 3 partitions, not %s&quo=
t; % result.output)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for part, extra_di=
r in enumerate([&quot;test1&quot;, &quot;test2&quot;]):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resu=
lt =3D runCmd(&quot;wic ls %s:%d | grep -q \&quot;%s\&quot;&quot; % (wicimg=
, part + 1, extra_dir))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.assertEqual(0, result.status, msg=3D&quot;Directory &#39;%s&#39; not found=
 in the partition #%d&quot; % (extra_dir, part))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resu=
lt =3D runCmd(&quot;wic ls %s:%d/test2 | grep -q \&quot;test3\&quot;&quot; =
% (wicimg, part + 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self=
.assertEqual(0, result.status, msg=3D&quot;Directory test2/test3 not found =
in the partition #%d&quot; % part)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for part, fil=
e in enumerate([&quot;foo.conf&quot;, &quot;foobar.conf&quot;, &quot;bar.co=
nf&quot;]):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0result =3D runCmd(&quot;wic ls %s:%d | grep -q \&quot;%s\&quot;&quot; % =
(wicimg, part + 1, file))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.assertEqual(0, result.status, msg=3D&quot;File &#39;%s&#39; not fou=
nd in the partition #%d&quot; % (file, part))<br>
diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/li=
b/wic/plugins/source/extra_partition.py<br>
index 327bc2b8c3..3be7aed374 100644<br>
--- a/scripts/lib/wic/plugins/source/extra_partition.py<br>
+++ b/scripts/lib/wic/plugins/source/extra_partition.py<br>
@@ -12,21 +12,31 @@ logger =3D logging.getLogger(&#39;wic&#39;)<br>
<br>
=C2=A0class ExtraPartitionPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 Populates an extra partition with files listed in the IMAGE_=
EXTRA_PARTITION_FILES<br>
-=C2=A0 =C2=A0 BitBake variable. Files should be deployed to the DEPLOY_DIR=
_IMAGE directory.<br>
+=C2=A0 =C2=A0 Populates an extra partition with:<br>
+=C2=A0 =C2=A0 - Files listed in the IMAGE_EXTRA_PARTITION_FILES BitBake va=
riable. Files should be deployed to<br>
+=C2=A0 =C2=A0 =C2=A0 the DEPLOY_DIR_IMAGE directory.<br>
+=C2=A0 =C2=A0 - Empty directories listed in the IMAGE_EXTRA_PARTITION_DIRE=
CTORIES Bitbake variable.<br>
+=C2=A0 =C2=A0 =C2=A0 Directories are created automatically.<br>
<br>
=C2=A0 =C2=A0 =C2=A0The plugin supports:<br>
=C2=A0 =C2=A0 =C2=A0- Glob pattern matching for file selection.<br>
=C2=A0 =C2=A0 =C2=A0- File renaming.<br>
=C2=A0 =C2=A0 =C2=A0- Suffixes to specify the target partition (by label, U=
UID, or partname),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0enabling multiple extra partitions to coexist.<b=
r>
+=C2=A0 =C2=A0 - Extra directories.<br>
<br>
=C2=A0 =C2=A0 =C2=A0For example:<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo =
=3D &quot;/foo /bar/baz&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824=
e-cda3-4bed-9f54-9ef5312d105d =3D &quot;/foo /bar/baz&quot;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES_label-foo =3D=
 &quot;bar.conf;foo.conf&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e=
-cda3-4bed-9f54-9ef5312d105d =3D &quot;bar.conf;foobar.conf&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES =3D &quot;foo=
/*&quot;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WICVARS:append =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_DIRECTORIE=
S_label-foo \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_DIRECTORIE=
S_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES=
_label-foo \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES=
_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
@@ -34,6 +44,7 @@ class ExtraPartitionPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0name =3D &#39;extra_partition&#39;<br>
+=C2=A0 =C2=A0 image_extra_partition_dirs_var_name =3D &#39;IMAGE_EXTRA_PAR=
TITION_DIRECTORIES&#39;<br>
=C2=A0 =C2=A0 =C2=A0image_extra_partition_files_var_name =3D &#39;IMAGE_EXT=
RA_PARTITION_FILES&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0@classmethod<br>
@@ -50,6 +61,22 @@ class ExtraPartitionPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return extra_vars<br>
<br>
+=C2=A0 =C2=A0 @classmethod<br>
+=C2=A0 =C2=A0 def _parse_extra_directories(cls, part):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Parse the directories of which to copy.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.extra_dirs_task =3D []<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_dirs =3D cls._get_extra_vars(part, cls.i=
mage_extra_partition_dirs_var_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if extra_dirs is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" r=
el=3D"noreferrer" target=3D"_blank">logger.info</a>(&#39;No extra directori=
es defined, %s unset for entry #%d&#39; % (cls.image_extra_partition_dirs_v=
ar_name, part.lineno))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferr=
er" target=3D"_blank">logger.info</a>(&#39;Extra dirs: %s&#39;, extra_dirs)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for src_entry in extra_dirs.strip().split(&#39=
; &#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.extra_dirs_task.append(src_e=
ntry)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0@classmethod<br>
=C2=A0 =C2=A0 =C2=A0def _parse_extra_files(cls, part, kernel_dir):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
@@ -113,6 +140,7 @@ class ExtraPartitionPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not kernel_dir:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise WicErro=
r(&quot;Couldn&#39;t find DEPLOY_DIR_IMAGE, exiting&quot;)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls._parse_extra_directories(part)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cls._parse_extra_files(part, kernel_dir)<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0@classmethod<br>
@@ -126,24 +154,32 @@ class ExtraPartitionPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extradir =3D &quot;%s/extra.%d&quot; % (c=
r_workdir, part.lineno)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cls.extra_files_task:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&quot;Entry #%d d=
oes not have a corresponding %s variable set!&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cls.extra_dirs_task and not cls.extra_f=
iles_task:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&quot;Entry #%d d=
oes not have a corresponding %s or %s variable set!&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;If you wish to create an empty partition, re=
move &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;--source extra-partition from the wks file&q=
uot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0% (part.lineno, cls.image_extra_partition_files_var=
_name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0% (part.lineno, cls.image_extra_partition_dirs_var_=
name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.image_extra_partition_files_var_name))<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not kernel_dir:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_dir =3D get_bitbake_=
var(&quot;DEPLOY_DIR_IMAGE&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not kernel_dir:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise WicErro=
r(&quot;Couldn&#39;t find DEPLOY_DIR_IMAGE, exiting&quot;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for task in cls.extra_files_task:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_path, dst_path =3D task<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;Install %s as =
%s&#39;, src_path, dst_path)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install_cmd =3D &quot;install -m=
 0644 -D %s %s&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 % (os.path.join(kernel_dir, src_path),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.path.join(extradir, dst_path))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_cmd(install_cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cls.extra_dirs_task:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for task in cls.extra_dirs_task:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot=
;Create directory %s&quot; % task)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir_cmd =3D &quo=
t;mkdir -p %s/%s&quot; % (extradir, task)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_cmd(mkdir_cmd=
)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cls.extra_files_task:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for task in cls.extra_files_task=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_path, dst_path=
 =3D task<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;=
Install %s as %s&#39;, src_path, dst_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install_cmd =3D &q=
uot;install -m 0644 -D %s %s&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % (os.path.join(kernel_dir, src_path),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.path.join(extradir, dst_pat=
h))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_cmd(install_c=
md)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.debug(&#39;Prepare extra partition=
 using rootfs in %s&#39;, extradir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part.prepare_rootfs(cr_workdir, oe_buildd=
ir, extradir,<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Liens: Vous recevez tous les messages envoy=C3=A9s =C3=A0 ce groupe.<br>
Voir/R=C3=A9pondre en ligne (#229536): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/229536" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/229536</a><b=
r>
Sujets: <a href=3D"https://lists.openembedded.org/mt/117295121/9955716" rel=
=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/1172951=
21/9955716</a><br>
Propri=C3=A9taire du groupe: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.opene=
mbedded.org</a><br>
Se d=C3=A9sabonner: <a href=3D"https://lists.openembedded.org/g/openembedde=
d-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:pierre-loup.gosse@s=
mile.fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000026de2006487ef708--

