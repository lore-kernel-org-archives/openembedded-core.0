Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B33CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 10:18:46 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.5004.1759400320780321809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 03:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tTR0MbRq;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so499443f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1759400319; x=1760005119; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5+bZNK648d/NS/Ta4oO5axCWePOq4ViQBKbRgE68yc=;
        b=tTR0MbRqxjmpU9cArhlG88DhLBZV50iKj6OWP7QpdEjvPCFAboGjhQpacDtL2TG/8A
         B0xte/pCZ3cUsBijt/SdU1GyITeLUv+5mDa/0uFaoRj6J0qnGdJhUF6ySSnNv+oIT0xK
         IBIJp8U892yLV4kNM7HJ9rIlbZwsDK8SK6iVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759400319; x=1760005119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5+bZNK648d/NS/Ta4oO5axCWePOq4ViQBKbRgE68yc=;
        b=rGYu/re+9q+N7lI3mDr3DtbMxh1/7AEQG1qT6CLDpBMOsL2Tr0Qx5qeEPk/bXCAWMz
         nnYrPrtAGPFMEAvw5zDBuoCwo7FnDW8VNZO/pGR66zeam4R53WCrI0A9DBxoIxUMCqeQ
         RiXe1qJDSwRieqX7ztsjBCJmq9bMsi19S6wzyo07wEVCg98NGqMO9kWJDdkt52ll3mVg
         nQ2UwZYjm4+3OZNgmHy2Y0zC2guYR6Q/UIfszx5mMPByUpjYdZVsbRhnZK2ewMIsKVjl
         r35F0pP37ezRWQ5pLRT3jjHxBzRWRalhP+juTrMKsWgZ3imEc/fW4FnI/CDmBRxb5nB7
         NzDw==
X-Gm-Message-State: AOJu0YyJrILpfq56EiCmI315UrmOxXKzLp+ZhbdnuQYmSqOUsuq3WZit
	lkzYjgKZZXxQ2i8/seYtAtk1abU5X26pGedgEmay76i5SnoFj9bIpTMRN4rWJjMktlx5ewu76TM
	PU3yGS+YaZhx1hEGh1NZgq2mWJEC8No9MlG/9T+Cm+Q==
X-Gm-Gg: ASbGncu6nmUlP1RMYYfQafd2XyM3sC4EqegcK7zPsf6ANlD4H6z7zwP9Yb/k4krUqrX
	bBCK+2oUkBpr1VaCCohDnJEWm0ZVHEddilmDGAUf+F9I50neHRTwrxLg9osLBuUolowOHnbkcGG
	uT7BV8x1OVPSH1Plfz+myQoHyqM46Vsinl+VJJM9Y6E47qXSuSl0e2cp3uaf6HgbDRBXqpZWmHb
	QaDRYyuwPJoEHNqxdE/9GMftrj31br4dK7EiSPFB0HRNfxbIcyRgXI/7B1IjBuqhg==
X-Google-Smtp-Source: AGHT+IEalFI1r0TOK3c04DLlHuEThS3TlX+2jxYwf//TLd72PAedb2SleahH1SzfZVpcMTTp3oU7b0dR3tzUsO7CJiE=
X-Received: by 2002:a05:6000:2012:b0:406:87ba:997c with SMTP id
 ffacd0b85a97d-4255780bd6amr5259720f8f.40.1759400318930; Thu, 02 Oct 2025
 03:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250930094344.3049278-1-pierre-loup.gosse@smile.fr> <20250930094344.3049278-2-pierre-loup.gosse@smile.fr>
In-Reply-To: <20250930094344.3049278-2-pierre-loup.gosse@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 2 Oct 2025 12:18:13 +0200
X-Gm-Features: AS18NWBsmtwoELrMniIvpyohJcyXSca4tEDS3KHNjhWoSvzkzq0DmfKYHS2Dnk4
Message-ID: <CAMSfU+7zMDcZgvQJpnP+=giArSX+O6M4a8Ff5DQ1O2gjE6ibZQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] wic: extra partition plugin
To: pierre-loup.gosse@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000007339106402a4f35"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 10:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224348

--00000000000007339106402a4f35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Pierre-Loup,

Le mar. 30 sept. 2025 =C3=A0 11:43, <pierre-loup.gosse@smile.fr> a =C3=A9cr=
it :

> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> The extra_partition plugin allows populating an extra partition with
> files listed in the new IMAGE_EXTRA_FILES variable. The implementation
>

From the patch review call:
The name IMAGE_EXTRA_FILES is a bit too generic to be put in the global
variable namespace.
The name "IMAGE_EXTRA_PARTITION_FILES" would avoid confusion or clashing.
Can you make the change?

The rest of the patch looks good :)


> is similar to the bootimg_partition plugin.
>
> This plugin provides an easy way to install files that are not part of
> the rootfs.
>
> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
> ---
> changes in v2:
> - missing signed-off-by
> - typo
> - assertion message
>
> changes in v3:
> - fix WIC test_image_env
> ---
>  meta/classes-recipe/image_types_wic.bbclass   |   1 +
>  meta/lib/oeqa/selftest/cases/wic.py           |  43 +++++-
>  .../lib/wic/plugins/source/extra_partition.py | 134 ++++++++++++++++++
>  3 files changed, 177 insertions(+), 1 deletion(-)
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
> index b1c318bd4e..1b59980f1c 100644
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
> @@ -1021,7 +1022,7 @@ class Wic2(WicTestCase):
>          wicvars =3D wicvars.difference(('DEPLOY_DIR_IMAGE',
> 'IMAGE_BOOT_FILES',
>                                        'INITRD', 'INITRD_LIVE',
> 'ISODIR','INITRAMFS_IMAGE',
>                                        'INITRAMFS_IMAGE_BUNDLE',
> 'INITRAMFS_LINK_NAME',
> -                                      'APPEND', 'IMAGE_EFI_BOOT_FILES'))
> +                                      'APPEND', 'IMAGE_EFI_BOOT_FILES',
> 'IMAGE_EXTRA_FILES'))
>          with open(path) as envfile:
>              content =3D dict(line.split("=3D", 1) for line in envfile)
>              # test if variables used by wic present in the .env file
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

--00000000000007339106402a4f35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Pierre-Loup,</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. =
30 sept. 2025 =C3=A0=C2=A011:43, &lt;<a href=3D"mailto:pierre-loup.gosse@sm=
ile.fr">pierre-loup.gosse@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: Pierre-Loup GOSSE &lt;=
<a href=3D"mailto:pierre-loup.gosse@smile.fr" target=3D"_blank">pierre-loup=
.gosse@smile.fr</a>&gt;<br>
<br>
The extra_partition plugin allows populating an extra partition with<br>
files listed in the new IMAGE_EXTRA_FILES variable. The implementation<br><=
/blockquote><div><br></div><div>From the patch review call:</div><div>The n=
ame=C2=A0IMAGE_EXTRA_FILES is a bit too generic to be put in the global var=
iable namespace.</div><div>The name &quot;IMAGE_EXTRA_PARTITION_FILES&quot;=
 would avoid confusion or clashing.</div><div>Can you make the change?</div=
><div><br></div><div>The rest of the patch looks good :)</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
is similar to the bootimg_partition plugin.<br>
<br>
This plugin provides an easy way to install files that are not part of<br>
the rootfs.<br>
<br>
Signed-off-by: Pierre-Loup GOSSE &lt;<a href=3D"mailto:pierre-loup.gosse@sm=
ile.fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>&gt;<br>
Reviewed-by: Yoann CONGAL &lt;<a href=3D"mailto:yoann.congal@smile.fr" targ=
et=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
changes in v2:<br>
- missing signed-off-by<br>
- typo<br>
- assertion message<br>
<br>
changes in v3:<br>
- fix WIC test_image_env<br>
---<br>
=C2=A0meta/classes-recipe/image_types_wic.bbclass=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0meta/lib/oeqa/selftest/cases/wic.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 43 +++++-<br>
=C2=A0.../lib/wic/plugins/source/extra_partition.py | 134 +++++++++++++++++=
+<br>
=C2=A03 files changed, 177 insertions(+), 1 deletion(-)<br>
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
index b1c318bd4e..1b59980f1c 100644<br>
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
@@ -1021,7 +1022,7 @@ class Wic2(WicTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wicvars =3D wicvars.difference((&#39;DEPL=
OY_DIR_IMAGE&#39;, &#39;IMAGE_BOOT_FILES&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;INIT=
RD&#39;, &#39;INITRD_LIVE&#39;, &#39;ISODIR&#39;,&#39;INITRAMFS_IMAGE&#39;,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;INIT=
RAMFS_IMAGE_BUNDLE&#39;, &#39;INITRAMFS_LINK_NAME&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;APPEND&#39=
;, &#39;IMAGE_EFI_BOOT_FILES&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;APPEND&#39=
;, &#39;IMAGE_EFI_BOOT_FILES&#39;, &#39;IMAGE_EXTRA_FILES&#39;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(path) as envfile:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0content =3D dict(line.split=
(&quot;=3D&quot;, 1) for line in envfile)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# test if variables used by=
 wic present in the .env file<br>
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

--00000000000007339106402a4f35--

