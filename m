Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04FACAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 07:56:17 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.6083.1758786976093373812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 00:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d9O2jj4N;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45ed646b656so4620495e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 00:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758786974; x=1759391774; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uO4Hs5LK+bnRe8AnFNMemSpdWC8XwWg7l6UlAVRMits=;
        b=d9O2jj4Nk6IG80HEXaMxFGqxzNxzxrjSNJMRw1urzeDk/ffBnm+8lw3k9o8QsvM0x8
         Gp9qG3919yTnSBMQ5KaTNYH7KB3ouCN8jm6jETp3tfoJ/Zvf9fCeAX+Ufw3oE6jQ662O
         xPygN37IQDYSjom8IgdBNGLoP3c+zpzAR/Qq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758786974; x=1759391774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO4Hs5LK+bnRe8AnFNMemSpdWC8XwWg7l6UlAVRMits=;
        b=ATA+3IFfLmCeDeTZj0Z5PtxaQVSeBnZz2zCxzZ+m7RO1HdmH/1y0bNw7Z4fOsuauVo
         DH4gZ+bKHcauduA5HaxPvVDzwFSMq27btJDCMhaRdM2zXV6Ud+5RLWbSSLjt/HEF0R5y
         fCnFlFQ383jDemlxPB9r/8pYFVJE9VwncD3ALTzPZmu4dV4TQkaw4fdulQAEmwi1pCAq
         zk+qWcgEitx1JjARbrbJmfVYB7HwYZKV1VRV+pcCIMGnQ1vFT1F0qmE3RLeQ5cvOynK/
         fhWVNw0w11v/unmUmtNCKfTGkcvLyCavGANf0ES055tQST+jm8enURlLOoRZfGESG+kc
         +QOA==
X-Gm-Message-State: AOJu0Yxuhh7E/b7wQSWSQARhRPPskNg6cuaRjeEZCmC9VIj9OrVuKviO
	wYbuJwKnwBODW6CWZmKmfz0HnzKboLYYlY/xjFm+JmppXYrcsnidTCihZGA0T9hlKbCooLd7jv4
	gRebvdasgu3pxGCu+Xj5U1iJClPVviIx0S4kbYoJYQQ==
X-Gm-Gg: ASbGncuW3dz02o0gzj0TPl2TD+ckPQyxIOggvBtYAkHZuTzUYgnAqSgVxlWk6AYqk92
	3GUOSh83tyTMipMCdMsvmjC3Ptv2Pvw3G19Yud25wrMyNk8g/xPvSfSa0yr7FZsZPZ8S3Kh6cT5
	uHTMSqt8KxXjQUIMNYtkhs78z8svz4itdk/jdHEY2TxhqJhxULmBaR8BHmVKGo7X5pL/NDkTyIA
	BYrWBFYOC8HTcFRyjTfc3nERBjWsRDp80x81sb0sQ==
X-Google-Smtp-Source: AGHT+IG2q+QXAPWc+bZL9Y+OIOx7TMdPFQFEcZSoFgcrdoGud2GcHeLDdWMS69tyTTvyEYtV5slBPyO/UP6p1qXncJg=
X-Received: by 2002:a05:600c:3153:b0:46d:27b7:e7ff with SMTP id
 5b1f17b1804b1-46e32a58b6amr24923655e9.36.1758786974270; Thu, 25 Sep 2025
 00:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250925072203.3490596-1-pierre-loup.gosse@smile.fr> <20250925072203.3490596-2-pierre-loup.gosse@smile.fr>
In-Reply-To: <20250925072203.3490596-2-pierre-loup.gosse@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 25 Sep 2025 09:55:47 +0200
X-Gm-Features: AS18NWDEPTFOCX0L9hrGrb89s2LjTyOr7kMlmw6ubZ4MqwWfe8ZTcv8Zm_qT2wE
Message-ID: <CAMSfU+4LjK0K9Mh20oJxhTvW8Dw87nriJakCwQiFfr_T6TSLOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] wic: extra partition plugin
To: pierre-loup.gosse@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d653b9063f9b80be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 07:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224003

--000000000000d653b9063f9b80be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 25 sept. 2025 =C3=A0 09:23, <pierre-loup.gosse@smile.fr> a =C3=A9cr=
it :

> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> The extra_partition plugin allows populating an extra partition with
> files listed in the new IMAGE_EXTRA_FILES variable. The implementation
> is similar to the bootimg_partition plugin.
>
> This plugin provides an easy way to install files that are not part of
> the rootfs.
>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
>

To confirm, I indeed did review it internally.


> ---
> changes in v2:
> - missing signed-off-by
> - typo
> - assertion message
> ---
>  meta/classes-recipe/image_types_wic.bbclass   |   1 +
>  meta/lib/oeqa/selftest/cases/wic.py           |  41 ++++++
>  .../lib/wic/plugins/source/extra_partition.py | 134 ++++++++++++++++++
>  3 files changed, 176 insertions(+)
>  create mode 100644 scripts/lib/wic/plugins/source/extra_partition.py
>
> diff --git a/meta/classes-recipe/image_types_wic.bbclass
> b/meta/classes-recipe/image_types_wic.bbclass
> index 6180874a4c..549a69db60 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -17,6 +17,7 @@ WICVARS ?=3D "\
>         IMAGE_BOOT_FILES \
>         IMAGE_CLASSES \
>         IMAGE_EFI_BOOT_FILES \
> +       IMAGE_EXTRA_FILES \
>         IMAGE_LINK_NAME \
>         IMAGE_ROOTFS \
>         IMGDEPLOYDIR \
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py
> b/meta/lib/oeqa/selftest/cases/wic.py
> index b1c318bd4e..acbece4279 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -18,6 +18,7 @@ from glob import glob
>  from shutil import rmtree, copy
>  from tempfile import NamedTemporaryFile
>  from tempfile import TemporaryDirectory
> +from textwrap import dedent
>
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.core.decorator import OETestTag
> @@ -1647,6 +1648,46 @@ INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
>              status, output =3D qemu.run_serial(cmd)
>              self.assertEqual(1, status, 'Failed to run command "%s": %s'
> % (cmd, output))
>
> +    def test_extra_partition_plugin(self):
> +        """Test extra partition plugin"""
> +        config =3D dedent("""\
> +        IMAGE_EXTRA_FILES_label-foo =3D "bar.conf;foo.conf"
> +        IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =3D
> "bar.conf;foobar.conf"
> +        IMAGE_EXTRA_FILES =3D "foo/*"
> +        WICVARS:append =3D "\
> +            IMAGE_EXTRA_FILES_label-foo \
> +            IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =
\
> +        "
> +        """)
> +        self.append_config(config)
> +
> +        deploy_dir =3D get_bb_var('DEPLOY_DIR_IMAGE')
> +
> +        testfile =3D open(os.path.join(deploy_dir, "bar.conf"), "w")
> +        testfile.write("test")
> +        testfile.close()
> +
> +        os.mkdir(os.path.join(deploy_dir, "foo"))
> +        testfile =3D open(os.path.join(deploy_dir, "foo", "bar.conf"), "=
w")
> +        testfile.write("test")
> +        testfile.close()
> +
> +        with NamedTemporaryFile("w", suffix=3D".wks") as wks:
> +            wks.writelines(['part / --source extra_partition --ondisk sd=
a
> --fstype=3Dext4 --label foo --align 4 --size 5M\n',
> +                            'part / --source extra_partition --ondisk sd=
a
> --fstype=3Dext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --s=
ize
> 5M\n',
> +                            'part / --source extra_partition --ondisk sd=
a
> --fstype=3Dext4 --label bar --align 4 --size 5M\n'])
> +            wks.flush()
> +            _, wicimg =3D self._get_wic(wks.name)
> +
> +            result =3D runCmd("wic ls %s | wc -l" % wicimg)
> +            self.assertEqual('4', result.output, msg=3D"Expect 3
> partitions, not %s" % result.output)
> +
> +            for part, file in enumerate(["foo.conf", "foobar.conf",
> "bar.conf"]):
> +                result =3D runCmd("wic ls %s:%d | grep -q \"%s\"" %
> (wicimg, part + 1, file))
> +                self.assertEqual(0, result.status, msg=3D"File '%s' not
> found in the partition #%d" % (file, part))
> +
> +        self.remove_config(config)
> +
>      def test_fs_types(self):
>          """Test filesystem types for empty and not empty partitions"""
>          img =3D 'core-image-minimal'
> diff --git a/scripts/lib/wic/plugins/source/extra_partition.py
> b/scripts/lib/wic/plugins/source/extra_partition.py
> new file mode 100644
> index 0000000000..499bede280
> --- /dev/null
> +++ b/scripts/lib/wic/plugins/source/extra_partition.py
> @@ -0,0 +1,134 @@
> +import logging
> +import os
> +import re
> +
> +from glob import glob
> +
> +from wic import WicError
> +from wic.pluginbase import SourcePlugin
> +from wic.misc import exec_cmd, get_bitbake_var
> +
> +logger =3D logging.getLogger('wic')
> +
> +class ExtraPartitionPlugin(SourcePlugin):
> +    """
> +    Populates an extra partition with files listed in the
> IMAGE_EXTRA_FILES
> +    BitBake variable. Files should be deployed to the DEPLOY_DIR_IMAGE
> directory.
> +
> +    The plugin supports:
> +    - Glob pattern matching for file selection.
> +    - File renaming.
> +    - Suffixes to specify the target partition (by label, UUID, or
> partname),
> +      enabling multiple extra partitions to coexist.
> +
> +    For example:
> +
> +        IMAGE_EXTRA_FILES_label-foo =3D "bar.conf;foo.conf"
> +        IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =3D
> "bar.conf;foobar.conf"
> +        IMAGE_EXTRA_FILES =3D "foo/*"
> +        WICVARS:append =3D "\
> +            IMAGE_EXTRA_FILES_label-foo \
> +            IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =
\
> +        "
> +
> +    """
> +
> +    name =3D 'extra_partition'
> +    image_extra_files_var_name =3D 'IMAGE_EXTRA_FILES'
> +
> +    @classmethod
> +    def do_configure_partition(cls, part, source_params, cr, cr_workdir,
> +                             oe_builddir, bootimg_dir, kernel_dir,
> +                             native_sysroot):
> +        """
> +        Called before do_prepare_partition(), list the files to copy
> +        """
> +        extradir =3D "%s/extra.%d" % (cr_workdir, part.lineno)
> +        install_cmd =3D "install -d %s" % extradir
> +        exec_cmd(install_cmd)
> +
> +        if not kernel_dir:
> +            kernel_dir =3D get_bitbake_var("DEPLOY_DIR_IMAGE")
> +            if not kernel_dir:
> +                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting"=
)
> +
> +        extra_files =3D None
> +        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s",
> part.label), ("_part-name-%s", part.part_name), (None, None)):
> +            if fmt:
> +                var =3D fmt % id
> +            else:
> +                var =3D ""
> +            extra_files =3D get_bitbake_var(cls.image_extra_files_var_na=
me
> + var)
> +            if extra_files is not None:
> +                break
> +
> +        if extra_files is None:
> +            raise WicError('No extra files defined, %s unset for entry
> #%d' % (cls.image_extra_files_var_name, part.lineno))
> +
> +        logger.info('Extra files: %s', extra_files)
> +
> +        # list of tuples (src_name, dst_name)
> +        deploy_files =3D []
> +        for src_entry in re.findall(r'[\w;\-\./\*]+', extra_files):
> +            if ';' in src_entry:
> +                dst_entry =3D tuple(src_entry.split(';'))
> +                if not dst_entry[0] or not dst_entry[1]:
> +                    raise WicError('Malformed extra file entry: %s' %
> src_entry)
> +            else:
> +                dst_entry =3D (src_entry, src_entry)
> +
> +            logger.debug('Destination entry: %r', dst_entry)
> +            deploy_files.append(dst_entry)
> +
> +        cls.install_task =3D [];
> +        for deploy_entry in deploy_files:
> +            src, dst =3D deploy_entry
> +            if '*' in src:
> +                # by default install files under their basename
> +                entry_name_fn =3D os.path.basename
> +                if dst !=3D src:
> +                    # unless a target name was given, then treat name
> +                    # as a directory and append a basename
> +                    entry_name_fn =3D lambda name: \
> +                                    os.path.join(dst,
> +                                                 os.path.basename(name))
> +
> +                srcs =3D glob(os.path.join(kernel_dir, src))
> +
> +                logger.debug('Globbed sources: %s', ', '.join(srcs))
> +                for entry in srcs:
> +                    src =3D os.path.relpath(entry, kernel_dir)
> +                    entry_dst_name =3D entry_name_fn(entry)
> +                    cls.install_task.append((src, entry_dst_name))
> +            else:
> +                cls.install_task.append((src, dst))
> +
> +
> +    @classmethod
> +    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
> +                             oe_builddir, bootimg_dir, kernel_dir,
> +                             rootfs_dir, native_sysroot):
> +        """
> +        Called to do the actual content population for a partition i.e. =
it
> +        'prepares' the partition to be incorporated into the image.
> +        In this case, we copies all files listed in IMAGE_EXTRA_FILES
> variable.
> +        """
> +        extradir =3D "%s/extra.%d" % (cr_workdir, part.lineno)
> +
> +        if not kernel_dir:
> +            kernel_dir =3D get_bitbake_var("DEPLOY_DIR_IMAGE")
> +            if not kernel_dir:
> +                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting"=
)
> +
> +        for task in cls.install_task:
> +            src_path, dst_path =3D task
> +            logger.debug('Install %s as %s', src_path, dst_path)
> +            install_cmd =3D "install -m 0644 -D %s %s" \
> +                          % (os.path.join(kernel_dir, src_path),
> +                             os.path.join(extradir, dst_path))
> +            exec_cmd(install_cmd)
> +
> +        logger.debug('Prepare extra partition using rootfs in %s',
> extradir)
> +        part.prepare_rootfs(cr_workdir, oe_builddir, extradir,
> +                            native_sysroot, False)
> +
> --
> 2.34.1
>
>

--=20
Yoann Congal
Smile ECS

--000000000000d653b9063f9b80be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0jeu. 25 sept. 2025 =C3=A0=C2=A009=
:23, &lt;<a href=3D"mailto:pierre-loup.gosse@smile.fr">pierre-loup.gosse@sm=
ile.fr</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote gmail_quo=
te_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Pierr=
e-Loup GOSSE &lt;<a href=3D"mailto:pierre-loup.gosse@smile.fr" target=3D"_b=
lank">pierre-loup.gosse@smile.fr</a>&gt;<br>
<br>
The extra_partition plugin allows populating an extra partition with<br>
files listed in the new IMAGE_EXTRA_FILES variable. The implementation<br>
is similar to the bootimg_partition plugin.<br>
<br>
This plugin provides an easy way to install files that are not part of<br>
the rootfs.<br>
<br>
Signed-off-by: Pierre-Loup GOSSE &lt;<a href=3D"mailto:pierre-loup.gosse@sm=
ile.fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>&gt;<br>
Reviewed-by: Yoann CONGAL &lt;<a href=3D"mailto:yoann.congal@smile.fr" targ=
et=3D"_blank">yoann.congal@smile.fr</a>&gt;<br></blockquote><div><br></div>=
<div>To confirm, I indeed did review it internally.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
changes in v2:<br>
- missing signed-off-by<br>
- typo<br>
- assertion message<br>
---<br>
=C2=A0meta/classes-recipe/image_types_wic.bbclass=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0meta/lib/oeqa/selftest/cases/wic.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 41 ++++++<br>
=C2=A0.../lib/wic/plugins/source/extra_partition.py | 134 +++++++++++++++++=
+<br>
=C2=A03 files changed, 176 insertions(+)<br>
=C2=A0create mode 100644 scripts/lib/wic/plugins/source/extra_partition.py<=
br>
<br>
diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-rec=
ipe/image_types_wic.bbclass<br>
index 6180874a4c..549a69db60 100644<br>
--- a/meta/classes-recipe/image_types_wic.bbclass<br>
+++ b/meta/classes-recipe/image_types_wic.bbclass<br>
@@ -17,6 +17,7 @@ WICVARS ?=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_BOOT_FILES \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_CLASSES \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EFI_BOOT_FILES \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_FILES \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_LINK_NAME \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_ROOTFS \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMGDEPLOYDIR \<br>
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py<br>
index b1c318bd4e..acbece4279 100644<br>
--- a/meta/lib/oeqa/selftest/cases/wic.py<br>
+++ b/meta/lib/oeqa/selftest/cases/wic.py<br>
@@ -18,6 +18,7 @@ from glob import glob<br>
=C2=A0from shutil import rmtree, copy<br>
=C2=A0from tempfile import NamedTemporaryFile<br>
=C2=A0from tempfile import TemporaryDirectory<br>
+from textwrap import dedent<br>
<br>
=C2=A0from oeqa.selftest.case import OESelftestTestCase<br>
=C2=A0from oeqa.core.decorator import OETestTag<br>
@@ -1647,6 +1648,46 @@ INITRAMFS_IMAGE =3D &quot;core-image-initramfs-boot&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status, output =3D qemu.run=
_serial(cmd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(1, status,=
 &#39;Failed to run command &quot;%s&quot;: %s&#39; % (cmd, output))<br>
<br>
+=C2=A0 =C2=A0 def test_extra_partition_plugin(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test extra partition plugin&=
quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D dedent(&quot;&quot;&quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_FILES_label-foo =3D &quot;bar.conf=
;foo.conf&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54=
-9ef5312d105d =3D &quot;bar.conf;foobar.conf&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_FILES =3D &quot;foo/*&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 WICVARS:append =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_FILES_label-foo \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_FILES_uuid-e7d0824e-=
cda3-4bed-9f54-9ef5312d105d \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(config)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_dir =3D get_bb_var(&#39;DEPLOY_DIR_IMAG=
E&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 testfile =3D open(os.path.join(deploy_dir, &qu=
ot;bar.conf&quot;), &quot;w&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 testfile.write(&quot;test&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 testfile.close()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.mkdir(os.path.join(deploy_dir, &quot;foo&qu=
ot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 testfile =3D open(os.path.join(deploy_dir, &qu=
ot;foo&quot;, &quot;bar.conf&quot;), &quot;w&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 testfile.write(&quot;test&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 testfile.close()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with NamedTemporaryFile(&quot;w&quot;, suffix=
=3D&quot;.wks&quot;) as wks:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks.writelines([&#39;part / --so=
urce extra_partition --ondisk sda --fstype=3Dext4 --label foo --align 4 --s=
ize 5M\n&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part / --source extra_partition --ondisk sda =
--fstype=3Dext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --siz=
e 5M\n&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part / --source extra_partition --ondisk sda =
--fstype=3Dext4 --label bar --align 4 --size 5M\n&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks.flush()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _, wicimg =3D self._get_wic(<a h=
ref=3D"http://wks.name" rel=3D"noreferrer" target=3D"_blank">wks.name</a>)<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&quot;wic ls %=
s | wc -l&quot; % wicimg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(&#39;4&#39;, re=
sult.output, msg=3D&quot;Expect 3 partitions, not %s&quot; % result.output)=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for part, file in enumerate([&qu=
ot;foo.conf&quot;, &quot;foobar.conf&quot;, &quot;bar.conf&quot;]):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(=
&quot;wic ls %s:%d | grep -q \&quot;%s\&quot;&quot; % (wicimg, part + 1, fi=
le))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(0=
, result.status, msg=3D&quot;File &#39;%s&#39; not found in the partition #=
%d&quot; % (file, part))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.remove_config(config)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def test_fs_types(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Test filesystem types f=
or empty and not empty partitions&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0img =3D &#39;core-image-minimal&#39;<br>
diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/li=
b/wic/plugins/source/extra_partition.py<br>
new file mode 100644<br>
index 0000000000..499bede280<br>
--- /dev/null<br>
+++ b/scripts/lib/wic/plugins/source/extra_partition.py<br>
@@ -0,0 +1,134 @@<br>
+import logging<br>
+import os<br>
+import re<br>
+<br>
+from glob import glob<br>
+<br>
+from wic import WicError<br>
+from wic.pluginbase import SourcePlugin<br>
+from wic.misc import exec_cmd, get_bitbake_var<br>
+<br>
+logger =3D logging.getLogger(&#39;wic&#39;)<br>
+<br>
+class ExtraPartitionPlugin(SourcePlugin):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Populates an extra partition with files listed in the IMAGE_=
EXTRA_FILES<br>
+=C2=A0 =C2=A0 BitBake variable. Files should be deployed to the DEPLOY_DIR=
_IMAGE directory.<br>
+<br>
+=C2=A0 =C2=A0 The plugin supports:<br>
+=C2=A0 =C2=A0 - Glob pattern matching for file selection.<br>
+=C2=A0 =C2=A0 - File renaming.<br>
+=C2=A0 =C2=A0 - Suffixes to specify the target partition (by label, UUID, =
or partname),<br>
+=C2=A0 =C2=A0 =C2=A0 enabling multiple extra partitions to coexist.<br>
+<br>
+=C2=A0 =C2=A0 For example:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_FILES_label-foo =3D &quot;bar.conf=
;foo.conf&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54=
-9ef5312d105d =3D &quot;bar.conf;foobar.conf&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_FILES =3D &quot;foo/*&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 WICVARS:append =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_FILES_label-foo \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_FILES_uuid-e7d0824e-=
cda3-4bed-9f54-9ef5312d105d \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 name =3D &#39;extra_partition&#39;<br>
+=C2=A0 =C2=A0 image_extra_files_var_name =3D &#39;IMAGE_EXTRA_FILES&#39;<b=
r>
+<br>
+=C2=A0 =C2=A0 @classmethod<br>
+=C2=A0 =C2=A0 def do_configure_partition(cls, part, source_params, cr, cr_=
workdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_builddir, bootimg_dir, kernel_dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0native_sysroot):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Called before do_prepare_partition(), list the=
 files to copy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extradir =3D &quot;%s/extra.%d&quot; % (cr_wor=
kdir, part.lineno)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_cmd =3D &quot;install -d %s&quot; % ex=
tradir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_cmd(install_cmd)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not kernel_dir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_dir =3D get_bitbake_var(&=
quot;DEPLOY_DIR_IMAGE&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not kernel_dir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&qu=
ot;Couldn&#39;t find DEPLOY_DIR_IMAGE, exiting&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_files =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (fmt, id) in ((&quot;_uuid-%s&quot;, part.=
uuid), (&quot;_label-%s&quot;, part.label), (&quot;_part-name-%s&quot;, par=
t.part_name), (None, None)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if fmt:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 var =3D fmt % id<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 var =3D &quot;&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_files =3D get_bitbake_var(=
cls.image_extra_files_var_name + var)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if extra_files is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if extra_files is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&#39;No extra fil=
es defined, %s unset for entry #%d&#39; % (cls.image_extra_files_var_name, =
part.lineno))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://logger.info" rel=3D"noreferr=
er" target=3D"_blank">logger.info</a>(&#39;Extra files: %s&#39;, extra_file=
s)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # list of tuples (src_name, dst_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_files =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for src_entry in re.findall(r&#39;[\w;\-\./\*]=
+&#39;, extra_files):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;;&#39; in src_entry:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_entry =3D tupl=
e(src_entry.split(&#39;;&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not dst_entry[0=
] or not dst_entry[1]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rais=
e WicError(&#39;Malformed extra file entry: %s&#39; % src_entry)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_entry =3D (src=
_entry, src_entry)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;Destination en=
try: %r&#39;, dst_entry)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_files.append(dst_entry)<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.install_task =3D [];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for deploy_entry in deploy_files:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src, dst =3D deploy_entry<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;*&#39; in src:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # by default insta=
ll files under their basename<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry_name_fn =3D =
os.path.basename<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dst !=3D src:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # un=
less a target name was given, then treat name<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # as=
 a directory and append a basename<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entr=
y_name_fn =3D lambda name: \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(dst,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0os.path.basename(name))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcs =3D glob(os.p=
ath.join(kernel_dir, src))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;=
Globbed sources: %s&#39;, &#39;, &#39;.join(srcs))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for entry in srcs:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src =
=3D os.path.relpath(entry, kernel_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entr=
y_dst_name =3D entry_name_fn(entry)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.=
install_task.append((src, entry_dst_name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.install_task.a=
ppend((src, dst))<br>
+<br>
+<br>
+=C2=A0 =C2=A0 @classmethod<br>
+=C2=A0 =C2=A0 def do_prepare_partition(cls, part, source_params, cr, cr_wo=
rkdir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_builddir, bootimg_dir, kernel_dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootfs_dir, native_sysroot):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Called to do the actual content population for=
 a partition i.e. it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;prepares&#39; the partition to be incorpo=
rated into the image.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 In this case, we copies all files listed in IM=
AGE_EXTRA_FILES variable.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extradir =3D &quot;%s/extra.%d&quot; % (cr_wor=
kdir, part.lineno)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not kernel_dir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_dir =3D get_bitbake_var(&=
quot;DEPLOY_DIR_IMAGE&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not kernel_dir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&qu=
ot;Couldn&#39;t find DEPLOY_DIR_IMAGE, exiting&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for task in cls.install_task:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_path, dst_path =3D task<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;Install %s as =
%s&#39;, src_path, dst_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install_cmd =3D &quot;install -m=
 0644 -D %s %s&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 % (os.path.join(kernel_dir, src_path),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.path.join(extradir, dst_path))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_cmd(install_cmd)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&#39;Prepare extra partition usin=
g rootfs in %s&#39;, extradir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 part.prepare_rootfs(cr_workdir, oe_builddir, e=
xtradir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot, False)<br>
+<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000d653b9063f9b80be--

