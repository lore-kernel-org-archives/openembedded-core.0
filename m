Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57196D44C5F
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 14:56:04 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37529.1768488959317907156
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 06:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1SBlWLW5;
 spf=pass (domain: smile.fr, ip: 209.85.167.41, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b7bb3b913so1221235e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 06:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768488957; x=1769093757; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c5CMO9DEARVNTEBXMiHQq1UiNYyhJQAjXtsuScNkw6M=;
        b=1SBlWLW5GOmpRstnVKwN5vEW4FinC41Vq1tOBUpYeIwGJlJCiysTwimlD7zdfj+ka/
         DmVcmRmgs+6JyN6EyRDiWCGBq660i0sHwvnck/hvOHoOgzq/4CqZNv/taIOpfF1QHTQH
         ml8pabiJTRGjKQQvFp5GoS3WChK3VZ9eoq8Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768488957; x=1769093757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5CMO9DEARVNTEBXMiHQq1UiNYyhJQAjXtsuScNkw6M=;
        b=qZNUj8J3u6wdS9MBGxvu7B7Js7XolJ6lgAJfJckbsaooJ2hMmuvkVQIr500pYW1CA5
         XhGTrsI0lVRKSBiE8/ds77QeQs57Hep2J/jXeAJOFF6/Fjuk5kx3gOyJY9MavujP+CuD
         sp6+yrMq/4Ecn2BRd3o8t7C80mJjUJsNyQEkz2vddhilTjfzt9nOr9ltnIrkkwYzO+bT
         f5+25udtIHvvdBK2c4dG8o7gVwR5gG27gkOWhBeHfNE6Al54JYCsco2YNr77wTepn69E
         esEq2UUxZld47r8HU18drtZiv7/phI5ZEc1VAbOozMzadsMI5TjABUhODwp9t0khuj/I
         BirQ==
X-Gm-Message-State: AOJu0Yzc8/y+UgLPZ+KUIU/dGJ4ON0y1PJng3drDC3xGzkl8KgoPpwjd
	gPGG6qaqUySPrnWlW9q+EZhSZbnUgvr1/TVWv7cLOiQ6F9iGi1ckXsLauid+P209J1XMjfyZDv8
	t3R+zFx0MrwUVvHJu74Uqw1hE47fRd+ZHMbxsZMz/gw==
X-Gm-Gg: AY/fxX4IXlIvykM/RHSKHopcFI+ko0fWaI/SRHg/R9oRKek6ytRaLfTo3D/b97Hudxt
	6cjjCiQoSXaOyjUWnXrB18fsel3Ha6LwBnPBldQix4iA/gBs5ZpebwuasVUww3jyiyhsZV+m8Z0
	UhmH6cf8LgB2rz4aAzaYafo5XT1Q84u0+m9E106fzkuFtPcoH9dUCbUWHGpsVMP+6MwQNt9QgOg
	MnF4I8RWTVDgxPgzUr6gkn1mVgUvP9VzhQhn222vJeN7rXFL9xV6i5w6OEX8oZ4uMsDW1QUp2Ad
	ZPliS5mVV5Gm1kEG3sqDv6xoBCerzzdCpMEqMEznhYCPH46QHrIIkYe13s3bAAt+JoF7cB8JynN
	wsi39HfTSK6IkKQ==
X-Received: by 2002:a05:6512:64e5:b0:59b:a8f0:5abd with SMTP id
 2adb3069b0e04-59ba8f05b91mr934267e87.1.1768488957050; Thu, 15 Jan 2026
 06:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20260115101432.162696-1-adam.duskett@amarulasolutions.com> <20260115101432.162696-6-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260115101432.162696-6-adam.duskett@amarulasolutions.com>
From: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Date: Thu, 15 Jan 2026 15:55:45 +0100
X-Gm-Features: AZwV_QiNJM3MuOHbeQc-1WPvI_GqRzdoE6uHEGPaAqH-qTFZ7fBTRa-ZV9PooB4
Message-ID: <CAHT-cZvh=aH5gyDbR0eE3ZQn3FJ=i=SQQtHhU+swZeXnLnUyBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 6/6] wic: extra-partitions: extend to support
 extra directories
To: adam.duskett@amarulasolutions.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000013135b06486e6c85"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 14:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229416

--00000000000013135b06486e6c85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adam,

Thanks for this v4 patch series.

-        if not cls.extra_files_task:
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
> cls.image_extra_partition_dirs_var_name))
> +                           % (part.lineno,
> cls.image_extra_partition_dirs_var_name,
> +                              cls.image_extra_partition_dirs_var_name))


There is a typo, one of the printed variables should be
image_extra_partition_files_var_name.


+        if cls.extra_dirs_task:
> +            for task in cls.extra_dirs_task:
> +                mkdir_cmd =3D "mkdir -p %s/%s" % (extradir, task)
> +                logger.debug(mkdir_cmd)
> +                exec_cmd(mkdir_cmd)
> +


To maintain consistency with the extra files log, instead of printing the
mkdir command, you could print something like:

    logger.debug("Create directory %s" % task)


@@ -13,20 +13,29 @@ logger =3D logging.getLogger('wic')
>  class ExtraPartitionPlugin(SourcePlugin):
>      """
>      Populates an extra partition with files listed in the
> IMAGE_EXTRA_PARTITION_FILES
> -    BitBake variable. Files should be deployed to the DEPLOY_DIR_IMAGE
> directory.
> +    BitBake variable or directories listed in the
> IMAGE_EXTRA_PARTITION_DIRECTORIES Bitbake variable.
> +
> +    Directories are created automatically.
> +    Files should be deployed to the DEPLOY_DIR_IMAGE directory.
>

I think the description should be reworded to avoid the confusion that the
plugin copies directories from DEPLOY_DIR_IMAGE like the files. Here is my
suggestion:

    Populates an extra partition with:
    - Files listed in the IMAGE_EXTRA_PARTITION_FILES BitBake variable.
Files should be deployed to
      the DEPLOY_DIR_IMAGE directory.
    - Empty directories listed in the IMAGE_EXTRA_PARTITION_DIRECTORIES
Bitbake variable.
      Directories are created automatically.

What do you think ?


And just two minor points:

     For example:
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
>          WICVARS:append =3D "\
> +            IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo \
> +
> IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d10=
5d
> \
>              IMAGE_EXTRA_PARTITION_FILES_label-foo \
>
>  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
>

I would add an extra line in the plugin description before the WICVARS,
just as you did to separate the directories and files variables.


@@ -50,6 +60,23 @@ class ExtraPartitionPlugin(SourcePlugin):
>                  break
>          return extra_vars
>
> +
> +    @classmethod
> +    def _parse_extra_directories(cls, part):
> +        """
> +        Parse the directories of which to copy.
> +        """
>

There is an extra line between the functions.


Thanks for your compromise, I appreciate it.

Pierre-Loup,



On Thu, Jan 15, 2026 at 11:15=E2=80=AFAM Adam Duskett via lists.openembedde=
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
>  meta/lib/oeqa/selftest/cases/wic.py           | 11 +++++
>  .../lib/wic/plugins/source/extra_partition.py | 43 +++++++++++++++++--
>  2 files changed, 50 insertions(+), 4 deletions(-)
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
> index 62a7b4b1d3..185fcab585 100644
> --- a/scripts/lib/wic/plugins/source/extra_partition.py
> +++ b/scripts/lib/wic/plugins/source/extra_partition.py
> @@ -13,20 +13,29 @@ logger =3D logging.getLogger('wic')
>  class ExtraPartitionPlugin(SourcePlugin):
>      """
>      Populates an extra partition with files listed in the
> IMAGE_EXTRA_PARTITION_FILES
> -    BitBake variable. Files should be deployed to the DEPLOY_DIR_IMAGE
> directory.
> +    BitBake variable or directories listed in the
> IMAGE_EXTRA_PARTITION_DIRECTORIES Bitbake variable.
> +
> +    Directories are created automatically.
> +    Files should be deployed to the DEPLOY_DIR_IMAGE directory.
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
> @@ -34,6 +43,7 @@ class ExtraPartitionPlugin(SourcePlugin):
>      """
>
>      name =3D 'extra_partition'
> +    image_extra_partition_dirs_var_name =3D
> 'IMAGE_EXTRA_PARTITION_DIRECTORIES'
>      image_extra_partition_files_var_name =3D 'IMAGE_EXTRA_PARTITION_FILE=
S'
>
>      @classmethod
> @@ -50,6 +60,23 @@ class ExtraPartitionPlugin(SourcePlugin):
>                  break
>          return extra_vars
>
> +
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
> +            logger.warning('No extra directories defined, %s unset for
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
> @@ -126,17 +154,24 @@ class ExtraPartitionPlugin(SourcePlugin):
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
> cls.image_extra_partition_dirs_var_name))
> +                           % (part.lineno,
> cls.image_extra_partition_dirs_var_name,
> +                              cls.image_extra_partition_dirs_var_name))
>
>          if not kernel_dir:
>              kernel_dir =3D get_bitbake_var("DEPLOY_DIR_IMAGE")
>              if not kernel_dir:
>                  raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting"=
)
>
> +        if cls.extra_dirs_task:
> +            for task in cls.extra_dirs_task:
> +                mkdir_cmd =3D "mkdir -p %s/%s" % (extradir, task)
> +                logger.debug(mkdir_cmd)
> +                exec_cmd(mkdir_cmd)
> +
>          if cls.extra_files_task:
>              for task in cls.extra_files_task:
>                  src_path, dst_path =3D task
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Liens: Vous recevez tous les messages envoy=C3=A9s =C3=A0 ce groupe.
> Voir/R=C3=A9pondre en ligne (#229404):
> https://lists.openembedded.org/g/openembedded-core/message/229404
> Sujets: https://lists.openembedded.org/mt/117276849/9955716
> Propri=C3=A9taire du groupe: openembedded-core+owner@lists.openembedded.o=
rg
> Se d=C3=A9sabonner: https://lists.openembedded.org/g/openembedded-core/un=
sub [
> pierre-loup.gosse@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000013135b06486e6c85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Adam,</div><div><br></div><div>Th=
anks for this v4 patch series.</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cls.extra_fil=
es_task:<br>
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
=A0 =C2=A0 =C2=A0 =C2=A0% (part.lineno, cls.image_extra_partition_dirs_var_=
name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0% (part.lineno, cls.image_extra_partition_dirs_var_=
name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.image_extra_partition_dirs_var_name))</=
blockquote><div>=C2=A0</div><div>There is a typo, one of the printed variab=
les should be=C2=A0<span style=3D"font-family:monospace">image_extra_partit=
ion_files_var_name</span>.</div><div><br></div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cls.ex=
tra_dirs_task:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for task in cls.extra_dirs_task:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir_cmd =3D &quo=
t;mkdir -p %s/%s&quot; % (extradir, task)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(mkdir=
_cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_cmd(mkdir_cmd=
)<br>
+</blockquote><div><br></div><div>To maintain consistency with the extra fi=
les log, instead of printing the mkdir command, you could print something l=
ike:</div><div><span style=3D"font-family:monospace"><br></span></div><div>=
<span style=3D"font-family:monospace">=C2=A0 =C2=A0 logger.debug(&quot;Crea=
te directory %s&quot; % task)</span></div><div><br></div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">@@ -13,20 +13,29 @@ logger =
=3D logging.getLogger(&#39;wic&#39;)<br>
=C2=A0class ExtraPartitionPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Populates an extra partition with files listed in the I=
MAGE_EXTRA_PARTITION_FILES<br>
-=C2=A0 =C2=A0 BitBake variable. Files should be deployed to the DEPLOY_DIR=
_IMAGE directory.<br>
+=C2=A0 =C2=A0 BitBake variable or directories listed in the IMAGE_EXTRA_PA=
RTITION_DIRECTORIES Bitbake variable.<br>
+<br>
+=C2=A0 =C2=A0 Directories are created automatically.<br>
+=C2=A0 =C2=A0 Files should be deployed to the DEPLOY_DIR_IMAGE directory.<=
br></blockquote><div><br></div><div>I think the description should be rewor=
ded to avoid the confusion that the plugin copies directories from DEPLOY_D=
IR_IMAGE like the files. Here is my suggestion:</div><div><br></div><div><s=
pan style=3D"font-family:monospace">=C2=A0 =C2=A0 Populates an extra partit=
ion with:<br>=C2=A0 =C2=A0 - Files listed in the IMAGE_EXTRA_PARTITION_FILE=
S BitBake variable. Files should be deployed to</span></div><div><span styl=
e=3D"font-family:monospace">=C2=A0 =C2=A0 =C2=A0 the DEPLOY_DIR_IMAGE direc=
tory.<br>=C2=A0 =C2=A0 - Empty directories listed in the IMAGE_EXTRA_PARTIT=
ION_DIRECTORIES Bitbake variable.<br>=C2=A0 =C2=A0 =C2=A0 Directories are c=
reated automatically.</span></div><div><br></div><div>What do you think ?</=
div><div><br></div><div><br></div><div>And just two minor points:</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0 =
=C2=A0For example:<br>
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WICVARS:append =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_DIRECTORIE=
S_label-foo \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_DIRECTORIE=
S_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES=
_label-foo \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES=
_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \<br></blockquote><div><br></div=
><div>I would add an extra line in the plugin description before the WICVAR=
S, just as you did to separate the directories and files variables.</div><d=
iv><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">@@ -50,6 +60,23 @@ class ExtraPartitionPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return extra_vars<br>
<br>
+<br>
+=C2=A0 =C2=A0 @classmethod<br>
+=C2=A0 =C2=A0 def _parse_extra_directories(cls, part):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Parse the directories of which to copy.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br></blockquote><div><br></=
div><div>There is an extra line between the functions.</div><div><br></div>=
<div><br></div><div>Thanks for your compromise, I appreciate it.</div><div>=
<br></div><div>Pierre-Loup,</div><div><br></div><div><br></div></div><br><d=
iv class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Jan 15, 2026 at 11:15=E2=80=AFAM Adam Duskett via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;adam.dusk=
ett=3D<a href=3D"mailto:amarulasolutions.com@lists.openembedded.org">amarul=
asolutions.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">=C2=A0 - Add the ability to define a s=
pace-delminated list of directories<br>
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
=C2=A0meta/lib/oeqa/selftest/cases/wic.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 11 +++++<br>
=C2=A0.../lib/wic/plugins/source/extra_partition.py | 43 +++++++++++++++++-=
-<br>
=C2=A02 files changed, 50 insertions(+), 4 deletions(-)<br>
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
index 62a7b4b1d3..185fcab585 100644<br>
--- a/scripts/lib/wic/plugins/source/extra_partition.py<br>
+++ b/scripts/lib/wic/plugins/source/extra_partition.py<br>
@@ -13,20 +13,29 @@ logger =3D logging.getLogger(&#39;wic&#39;)<br>
=C2=A0class ExtraPartitionPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Populates an extra partition with files listed in the I=
MAGE_EXTRA_PARTITION_FILES<br>
-=C2=A0 =C2=A0 BitBake variable. Files should be deployed to the DEPLOY_DIR=
_IMAGE directory.<br>
+=C2=A0 =C2=A0 BitBake variable or directories listed in the IMAGE_EXTRA_PA=
RTITION_DIRECTORIES Bitbake variable.<br>
+<br>
+=C2=A0 =C2=A0 Directories are created automatically.<br>
+=C2=A0 =C2=A0 Files should be deployed to the DEPLOY_DIR_IMAGE directory.<=
br>
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
@@ -34,6 +43,7 @@ class ExtraPartitionPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0name =3D &#39;extra_partition&#39;<br>
+=C2=A0 =C2=A0 image_extra_partition_dirs_var_name =3D &#39;IMAGE_EXTRA_PAR=
TITION_DIRECTORIES&#39;<br>
=C2=A0 =C2=A0 =C2=A0image_extra_partition_files_var_name =3D &#39;IMAGE_EXT=
RA_PARTITION_FILES&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0@classmethod<br>
@@ -50,6 +60,23 @@ class ExtraPartitionPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return extra_vars<br>
<br>
+<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&#39;No extra dir=
ectories defined, %s unset for entry #%d&#39; % (cls.image_extra_partition_=
dirs_var_name, part.lineno))<br>
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
@@ -126,17 +154,24 @@ class ExtraPartitionPlugin(SourcePlugin):<br>
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
=A0 =C2=A0 =C2=A0 =C2=A0% (part.lineno, cls.image_extra_partition_dirs_var_=
name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0% (part.lineno, cls.image_extra_partition_dirs_var_=
name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.image_extra_partition_dirs_var_name))<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not kernel_dir:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_dir =3D get_bitbake_=
var(&quot;DEPLOY_DIR_IMAGE&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not kernel_dir:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise WicErro=
r(&quot;Couldn&#39;t find DEPLOY_DIR_IMAGE, exiting&quot;)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cls.extra_dirs_task:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for task in cls.extra_dirs_task:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir_cmd =3D &quo=
t;mkdir -p %s/%s&quot; % (extradir, task)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(mkdir=
_cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_cmd(mkdir_cmd=
)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if cls.extra_files_task:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for task in cls.extra_files=
_task:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src_path, dst=
_path =3D task<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Liens: Vous recevez tous les messages envoy=C3=A9s =C3=A0 ce groupe.<br>
Voir/R=C3=A9pondre en ligne (#229404): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/229404" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/229404</a><b=
r>
Sujets: <a href=3D"https://lists.openembedded.org/mt/117276849/9955716" rel=
=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/1172768=
49/9955716</a><br>
Propri=C3=A9taire du groupe: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.opene=
mbedded.org</a><br>
Se d=C3=A9sabonner: <a href=3D"https://lists.openembedded.org/g/openembedde=
d-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:pierre-loup.gosse@s=
mile.fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000013135b06486e6c85--

