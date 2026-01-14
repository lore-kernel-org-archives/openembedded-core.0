Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48331D31A35
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 09:28:23 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6558.1768382898231896618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 01:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=IQFXv+l/;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.47, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64ce9d80429so1157151a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 01:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768382897; cv=none;
        d=google.com; s=arc-20240605;
        b=jBWLq1GuUozjgN1DbgH4AZZI7ut699QHRNDy4LyEpHtSM7EXJglPPucWT2KRPicIhz
         t0cCWzSR3c2mUGtLRqR0pemz6+S9tKMI1AoXuUlQVud3nZCW4lA5LDqSBybJQX2htnq1
         gCz/pj6747eMO4ov9d2E75LMJ4NXRReyXSnG+b7DcpPTnoY4It6fiNy0WvO4HDWJ2WPk
         sd93FLoxK1OO1EiLdR0i5v5VRBJ0YdUGMaSK4Q4FXryB5pwerytvSj+1XSVp4/CuJg4i
         XRHxQx2hgjCXcp44FW+OqvtRfmdDrJr/4ZK2VdoCbAQtVN7KMxq8LmX3sVJC6c6fBM3I
         sn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1WeQal2YB7RmdiJRlQn5PXIoMqECM35ZdcsUAqhSysU=;
        fh=Htrtf6tcKeuHYwhT3Feqs2aWr0CPzN1U6b0F0T3T/w4=;
        b=DqJs7kuQvQeMT8oSwv7im/KYBIlytluc+ctYqTRPRb/uOTzYxr3ea8i2apnWEnn8tv
         zuX2/JJp7pOaJWpT6F6hCbCQEBlb1+8NHhEkjHUKO7sIQzp0VaPSOWqCD308YeXGyU0J
         46iJ+TPI9LUh4gN/2krBVp4QFUOkWSBOzvqQBQ5BadK8FEiuqk349k7tsrK5M1XheME3
         Nn5984nvnJLG9JUXJXHO3NE6ntmF39oS+tlvNi7yKP5pZ5fRFkgjgFe+kdffxSZJDyC3
         HRnAVB9HRRyT3H25TZIzSfPpLzNMq9J2d9lZLUVCiqyXqV0tStKiG24uOq9/NiDw9DN7
         UnPw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768382897; x=1768987697; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1WeQal2YB7RmdiJRlQn5PXIoMqECM35ZdcsUAqhSysU=;
        b=IQFXv+l/ybHpZmcIbg3M4XLsXIHNf3eqbbuhAnveT+SGE8MrT19zV1+h5DIaYB4Rrb
         tZ3VBV4v0yjDmxYJ09x3KUvJqCUDrUrtzT2gYH3nyjwe2k6SpBAoHVwVJlrRoif1QEjw
         K1Efjvn/wqPw1wzyWWBT4FXNOwRk4ceY0ZGTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382897; x=1768987697;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WeQal2YB7RmdiJRlQn5PXIoMqECM35ZdcsUAqhSysU=;
        b=wcciUYZh9aalWQjmH1/i/CjO+936bYC3Yx+ondf9gVlBJCOD/5fQ91cHBjQxCKPFAf
         cd6MhCuspBcBgUfWJwfqx62HB99PGHaMHyPuVmKseetRyn2KYvYmVvKwBztGQU2+MM90
         uLMnn/WTrwzqihHLWhbgByo0mvHvi8iBxBNoNmd22+NZrr1dkYxxD7mjSvSxFQORAfnI
         LL7O26UHVIbAnT7I81nvFuly1iPdLBG65PHudFdiwZ69gFzUjQtYKg6aRI5X0mulFMAt
         Y0lM/6FsYLUYKvxDlNLGA1jaKQDxHCcEHAN7XwEJNWdxCrxEg8owEbcZekM8C47/y+HX
         GJTg==
X-Gm-Message-State: AOJu0YwyvZDJrq3WEbkbhfszxo4eTD+tN9jZVNZRwYpFGpVdSNv6bVNI
	rH9+a17B1fFRpkA9zVDb8ttiqJHGLn9yFNc8KewsFvMjFjyB7FKqqBNUhmpNXt4ArgqTpmr5JmI
	ME3BsDS+I69UZjsAmkzaQTI4HZhhintIkZ10KIjQeWIT4YNo7MEcC
X-Gm-Gg: AY/fxX7j3YhsNVAkjUxUUKZMlfdvEDFPSvipXWgIFURM8kwUrNu8ytlrzxGRgQ530Ki
	aUuJ19p/XtjivEEQd53O23xpQzyswQRgZqt3RplHxl+yHhTXt1whcpWz1H6doNUwf7xup8wqcWs
	z6IM0kMWsM2FSZhPAQf9K0nXxAZmV/jBaaF5C2+6wh1cjALA/2jAwQ3ITzecIPGJT7Z5mlcpmie
	QkHK8KPr80a3fbaHMepccxS7NlJ3lYv9oDUM3g3F2GeYr1cvDLbU9mcnpVLJcI8dirIpuzwEpy1
	zIqPNwSfhSGFeknrZjKMUguaL3an
X-Received: by 2002:a05:6402:5201:b0:64d:26a2:56af with SMTP id
 4fb4d7f45d1cf-653ebf7a343mr908975a12.0.1768382896557; Wed, 14 Jan 2026
 01:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com>
 <20260113144314.3563680-6-adam.duskett@amarulasolutions.com> <575011.1768321134244816412@lists.openembedded.org>
In-Reply-To: <575011.1768321134244816412@lists.openembedded.org>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 14 Jan 2026 10:28:04 +0100
X-Gm-Features: AZwV_QiUMgk055SVkUeqxQWryl9A2I_Av-lVSOqFz7XYUI1kDdZz-cRQ85Du3pM
Message-ID: <CAHDQB6PxWr-tvo0azAfgRj2H1Qs6GTEz37S5jB48a8Tb24yfsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] wic: extra-partitions: extend to support
 extra directories
To: pierre-loup.gosse@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000606241064855baa9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229310

--000000000000606241064855baa9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pierre-Loup!




On Tue, Jan 13, 2026 at 5:18=E2=80=AFPM Pierre-loup GOSSE via lists.openemb=
edded.org
<pierre-loup.gosse=3Dsmile.fr@lists.openembedded.org> wrote:

> Hi,
>
> On Tue, Jan 13, 2026 at 03:43 PM, Adam Duskett wrote:
>
> Add the ability to define a semicolon-delminated list of directories
> to create on the extra partition.
>
>
> I think using a semicolon to separate items in
> IMAGE_EXTRA_PARTITION_DIRECTORIES could be confusing, as it=E2=80=99s alr=
eady
> used for tuples in the IMAGE_EXTRA_PARTITION_FILES variable. A
> space-delimited list might be more intuitive and consistent with how
> IMAGE_EXTRA_PARTITION_FILES is structured. For example:
>
> IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo =3D "/test1 /test2/test3 /tes=
t4"
> IMAGE_EXTRA_PARTITION_FILES_label-foo =3D "bar1.conf;foo1.conf bar2.conf
> bar3;foo3"
>
> What do you think ?
>
>
Looks good to me. I can send a V2 that separates by space instead. It does
look cleaner!

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> meta/lib/oeqa/selftest/cases/wic.py | 11 ++++++
> .../lib/wic/plugins/source/extra_partition.py | 38 +++++++++++++++++++
> 2 files changed, 49 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py
> b/meta/lib/oeqa/selftest/cases/wic.py
> index 33a6460677..d365345554 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -1657,10 +1657,14 @@ INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
> def test_extra_partition_plugin(self):
> """Test extra partition plugin"""
> config =3D dedent("""\
> + IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo =3D "/test1;/test2/test3"
> +
> IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d10=
5d
> =3D "/test1;/test2/test3"
> IMAGE_EXTRA_PARTITION_FILES_label-foo =3D "bar.conf;foo.conf"
> IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =3D
> "bar.conf;foobar.conf"
> IMAGE_EXTRA_PARTITION_FILES =3D "foo/*"
> WICVARS:append =3D "\
> + IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo \
> +
> IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d10=
5d
> \
> IMAGE_EXTRA_PARTITION_FILES_label-foo \
> IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
> "
> @@ -1692,6 +1696,13 @@ INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
> result =3D runCmd("wic ls %s | wc -l" % wicimg)
> self.assertEqual('4', result.output, msg=3D"Expect 3 partitions, not %s" =
%
> result.output)
>
> + for part, extra_dir in enumerate(["test1", "test2"]):
> + result =3D runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1,
> extra_dir))
> + self.assertEqual(0, result.status, msg=3D"Directory '%s' not found in t=
he
> partition #%d" % (extra_dir, part))
> +
> + result =3D runCmd("wic ls %s:%d/test2 | grep -q \"test3\"" % (wicimg, p=
art
> + 1))
> + self.assertEqual(0, result.status, msg=3D"Directory test2/test3 not fou=
nd
> in the partition #%d" % part)
> +
> for part, file in enumerate(["foo.conf", "foobar.conf", "bar.conf"]):
> result =3D runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1, fi=
le))
> self.assertEqual(0, result.status, msg=3D"File '%s' not found in the
> partition #%d" % (file, part))
> diff --git a/scripts/lib/wic/plugins/source/extra_partition.py
> b/scripts/lib/wic/plugins/source/extra_partition.py
> index 3abd2bfd4c..fee72df615 100644
> --- a/scripts/lib/wic/plugins/source/extra_partition.py
> +++ b/scripts/lib/wic/plugins/source/extra_partition.py
> @@ -20,13 +20,19 @@ class ExtraPartitionPlugin(SourcePlugin):
> - File renaming.
> - Suffixes to specify the target partition (by label, UUID, or partname),
> enabling multiple extra partitions to coexist.
> + - Extra directories.
>
> For example:
>
> + IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo =3D "/foo;/bar/baz"
> +
> IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d10=
5d
> =3D "/foo;/bar/baz"
> +
> IMAGE_EXTRA_PARTITION_FILES_label-foo =3D "bar.conf;foo.conf"
> IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =3D
> "bar.conf;foobar.conf"
> IMAGE_EXTRA_PARTITION_FILES =3D "foo/*"
> WICVARS:append =3D "\
> + IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo \
> +
> IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d10=
5d
> \
> IMAGE_EXTRA_PARTITION_FILES_label-foo \
> IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
> "
> @@ -35,6 +41,7 @@ class ExtraPartitionPlugin(SourcePlugin):
>
> name =3D 'extra_partition'
> image_extra_partition_files_var_name =3D 'IMAGE_EXTRA_PARTITION_FILES'
> + image_extra_partition_dirs_var_name =3D 'IMAGE_EXTRA_PARTITION_DIRECTOR=
IES'
>
> @classmethod
> def _get_extra_vars(cls, part, var_name):
> @@ -50,6 +57,30 @@ class ExtraPartitionPlugin(SourcePlugin):
> break
> return extra_vars
>
> +
> + @classmethod
> + def _parse_extra_directories(cls, part):
> + """
> + Parse the directories of which to copy.
> + """
> + cls.extra_dirs_task =3D []
> +
> + extra_dirs =3D cls._get_extra_vars(part,
> cls.image_extra_partition_dirs_var_name)
> + if extra_dirs is None:
> + logger.debug('No extra directories defined, %s unset for entry #%d' %
> (cls.image_extra_partition_dirs_var_name, part.lineno))
> + return
> +
> + logger.info('Extra dirs: %s', extra_dirs)
> + for src_entry in re.findall(r'[\w;\-./*]+', extra_dirs):
> + if ';' in src_entry:
> + dst_entries =3D src_entry.split(';')
> + if not dst_entries[0] or not dst_entries[1]:
> + raise WicError('Malformed extra dir entry: %s' % src_entry)
>
>
> This raises an error for "foo;", but not for "foo;bar;".
> With a space-delimited list, the src_entry can be directly added to the
> extra_dirs_task list.
>
> + for dst_entry in dst_entries:
> + cls.extra_dirs_task.append(dst_entry)
> + else:
> + cls.extra_dirs_task.append(src_entry)
> +
> @classmethod
> def _parse_extra_files(cls, part, kernel_dir):
> """
> @@ -114,6 +145,7 @@ class ExtraPartitionPlugin(SourcePlugin):
> if not kernel_dir:
> raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
>
> + cls._parse_extra_directories(part)
> cls._parse_extra_files(part, kernel_dir)
>
> @classmethod
> @@ -132,6 +164,12 @@ class ExtraPartitionPlugin(SourcePlugin):
> if not kernel_dir:
> raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
>
> + if cls.extra_dirs_task:
> + for task in cls.extra_dirs_task:
> + mkdir_cmd =3D "mkdir -p %s/%s" % (extradir, task)
> + logger.debug(mkdir_cmd)
> + exec_cmd(mkdir_cmd)
> +
> if cls.extra_files_task:
> for task in cls.extra_files_task:
> src_path, dst_path =3D task
>
> Regarding your patch 5/6, the plugin should indeed be able to create extr=
a
> directories without requiring extra files. For example to prepare a data
> partition with only directories.
> However, since extra partition plugin was not designed to create empty
> partitions (omitting --source achieve this), I think the plugin should
> raise an error if no files or directories are defined.
>

Again, I don't understand why having the option for directories or files is
a problem. It's an extra partition.
Is it just because there is a different way to have an empty partition as
well?


> Pierre-Loup,
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229278):
> https://lists.openembedded.org/g/openembedded-core/message/229278
> Mute This Topic: https://lists.openembedded.org/mt/117243677/10152556
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adam.duskett@amarulasolutions.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000606241064855baa9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Pierre-Loup!<div><div dir=3D"ltr" clas=
s=3D"gmail_signature"><div dir=3D"ltr"><span><br><div><br></div></span></di=
v></div></div><br></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 13, 2026 at 5:18=E2=80=
=AFPM Pierre-loup GOSSE via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;pierre-loup.gosse=3D<a href=3D"mailto:smile.fr@li=
sts.openembedded.org">smile.fr@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Hi,</div>
<div><br>On Tue, Jan 13, 2026 at 03:43 PM, Adam Duskett wrote:</div>
<div>
<blockquote>Add the ability to define a semicolon-delminated list of direct=
ories<br>to create on the extra partition.</blockquote>
</div>
<div>=C2=A0</div>
<div>I think using a semicolon to separate items in <span style=3D"font-fam=
ily:&quot;courier new&quot;,courier">IMAGE_EXTRA_PARTITION_DIRECTORIES</spa=
n>=C2=A0could be confusing, as it=E2=80=99s already used for tuples in the =
<span style=3D"font-family:&quot;courier new&quot;,courier">IMAGE_EXTRA_PAR=
TITION_FILES</span>=C2=A0variable. A space-delimited list might be more int=
uitive and consistent with how <span style=3D"font-family:&quot;courier new=
&quot;,courier">IMAGE_EXTRA_PARTITION_FILES</span>=C2=A0is structured. For =
example:</div>
<div>=C2=A0</div>
<div><span style=3D"font-family:&quot;courier new&quot;,courier">IMAGE_EXTR=
A_PARTITION_DIRECTORIES_label-foo =3D &quot;/test1 /test2/test3 /test4&quot=
;</span></div>
<div><span style=3D"font-family:&quot;courier new&quot;,courier">IMAGE_EXTR=
A_PARTITION_FILES_label-foo =3D &quot;bar1.conf;foo1.conf bar2.conf bar3;fo=
o3&quot;</span></div>
<div>=C2=A0</div>
<div>What do you think ?</div>
<div>=C2=A0</div></blockquote><div>Looks good to me. I can send a V2 that s=
eparates by space instead. It does look cleaner!=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<div>
<blockquote>Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@=
amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</=
a>&gt;<br>---<br>meta/lib/oeqa/selftest/cases/wic.py | 11 ++++++<br>.../lib=
/wic/plugins/source/extra_partition.py | 38 +++++++++++++++++++<br>2 files =
changed, 49 insertions(+)<br><br>diff --git a/meta/lib/oeqa/selftest/cases/=
wic.py b/meta/lib/oeqa/selftest/cases/wic.py<br>index 33a6460677..d36534555=
4 100644<br>--- a/meta/lib/oeqa/selftest/cases/wic.py<br>+++ b/meta/lib/oeq=
a/selftest/cases/wic.py<br>@@ -1657,10 +1657,14 @@ INITRAMFS_IMAGE =3D &quo=
t;core-image-initramfs-boot&quot;<br>def test_extra_partition_plugin(self):=
<br>&quot;&quot;&quot;Test extra partition plugin&quot;&quot;&quot;<br>conf=
ig =3D dedent(&quot;&quot;&quot;\<br>+ IMAGE_EXTRA_PARTITION_DIRECTORIES_la=
bel-foo =3D &quot;/test1;/test2/test3&quot;<br>+ IMAGE_EXTRA_PARTITION_DIRE=
CTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =3D &quot;/test1;/test2/t=
est3&quot;<br>IMAGE_EXTRA_PARTITION_FILES_label-foo =3D &quot;bar.conf;foo.=
conf&quot;<br>IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5=
312d105d =3D &quot;bar.conf;foobar.conf&quot;<br>IMAGE_EXTRA_PARTITION_FILE=
S =3D &quot;foo/*&quot;<br>WICVARS:append =3D &quot;\<br>+ IMAGE_EXTRA_PART=
ITION_DIRECTORIES_label-foo \<br>+ IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e=
7d0824e-cda3-4bed-9f54-9ef5312d105d \<br>IMAGE_EXTRA_PARTITION_FILES_label-=
foo \<br>IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d1=
05d \<br>&quot;<br>@@ -1692,6 +1696,13 @@ INITRAMFS_IMAGE =3D &quot;core-im=
age-initramfs-boot&quot;<br>result =3D runCmd(&quot;wic ls %s | wc -l&quot;=
 % wicimg)<br>self.assertEqual(&#39;4&#39;, result.output, msg=3D&quot;Expe=
ct 3 partitions, not %s&quot; % result.output)<br><br>+ for part, extra_dir=
 in enumerate([&quot;test1&quot;, &quot;test2&quot;]):<br>+ result =3D runC=
md(&quot;wic ls %s:%d | grep -q \&quot;%s\&quot;&quot; % (wicimg, part + 1,=
 extra_dir))<br>+ self.assertEqual(0, result.status, msg=3D&quot;Directory =
&#39;%s&#39; not found in the partition #%d&quot; % (extra_dir, part))<br>+=
<br>+ result =3D runCmd(&quot;wic ls %s:%d/test2 | grep -q \&quot;test3\&qu=
ot;&quot; % (wicimg, part + 1))<br>+ self.assertEqual(0, result.status, msg=
=3D&quot;Directory test2/test3 not found in the partition #%d&quot; % part)=
<br>+<br>for part, file in enumerate([&quot;foo.conf&quot;, &quot;foobar.co=
nf&quot;, &quot;bar.conf&quot;]):<br>result =3D runCmd(&quot;wic ls %s:%d |=
 grep -q \&quot;%s\&quot;&quot; % (wicimg, part + 1, file))<br>self.assertE=
qual(0, result.status, msg=3D&quot;File &#39;%s&#39; not found in the parti=
tion #%d&quot; % (file, part))<br>diff --git a/scripts/lib/wic/plugins/sour=
ce/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py<b=
r>index 3abd2bfd4c..fee72df615 100644<br>--- a/scripts/lib/wic/plugins/sour=
ce/extra_partition.py<br>+++ b/scripts/lib/wic/plugins/source/extra_partiti=
on.py<br>@@ -20,13 +20,19 @@ class ExtraPartitionPlugin(SourcePlugin):<br>-=
 File renaming.<br>- Suffixes to specify the target partition (by label, UU=
ID, or partname),<br>enabling multiple extra partitions to coexist.<br>+ - =
Extra directories.<br><br>For example:<br><br>+ IMAGE_EXTRA_PARTITION_DIREC=
TORIES_label-foo =3D &quot;/foo;/bar/baz&quot;<br>+ IMAGE_EXTRA_PARTITION_D=
IRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =3D &quot;/foo;/bar/ba=
z&quot;<br>+<br>IMAGE_EXTRA_PARTITION_FILES_label-foo =3D &quot;bar.conf;fo=
o.conf&quot;<br>IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9e=
f5312d105d =3D &quot;bar.conf;foobar.conf&quot;<br>IMAGE_EXTRA_PARTITION_FI=
LES =3D &quot;foo/*&quot;<br>WICVARS:append =3D &quot;\<br>+ IMAGE_EXTRA_PA=
RTITION_DIRECTORIES_label-foo \<br>+ IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid=
-e7d0824e-cda3-4bed-9f54-9ef5312d105d \<br>IMAGE_EXTRA_PARTITION_FILES_labe=
l-foo \<br>IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312=
d105d \<br>&quot;<br>@@ -35,6 +41,7 @@ class ExtraPartitionPlugin(SourcePlu=
gin):<br><br>name =3D &#39;extra_partition&#39;<br>image_extra_partition_fi=
les_var_name =3D &#39;IMAGE_EXTRA_PARTITION_FILES&#39;<br>+ image_extra_par=
tition_dirs_var_name =3D &#39;IMAGE_EXTRA_PARTITION_DIRECTORIES&#39;<br><br=
>@classmethod<br>def _get_extra_vars(cls, part, var_name):<br>@@ -50,6 +57,=
30 @@ class ExtraPartitionPlugin(SourcePlugin):<br>break<br>return extra_va=
rs<br><br>+<br>+ @classmethod<br>+ def _parse_extra_directories(cls, part):=
<br>+ &quot;&quot;&quot;<br>+ Parse the directories of which to copy.<br>+ =
&quot;&quot;&quot;<br>+ cls.extra_dirs_task =3D []<br>+<br>+ extra_dirs =3D=
 cls._get_extra_vars(part, cls.image_extra_partition_dirs_var_name)<br>+ if=
 extra_dirs is None:<br>+ logger.debug(&#39;No extra directories defined, %=
s unset for entry #%d&#39; % (cls.image_extra_partition_dirs_var_name, part=
.lineno))<br>+ return<br>+<br>+ <a href=3D"http://logger.info" target=3D"_b=
lank">logger.info</a>(&#39;Extra dirs: %s&#39;, extra_dirs)<br>+ for src_en=
try in re.findall(r&#39;[\w;\-./*]+&#39;, extra_dirs):<br>+ if &#39;;&#39; =
in src_entry:<br>+ dst_entries =3D src_entry.split(&#39;;&#39;)<br>+ if not=
 dst_entries[0] or not dst_entries[1]:<br>+ raise WicError(&#39;Malformed e=
xtra dir entry: %s&#39; % src_entry)</blockquote>
</div>
<div>=C2=A0</div>
<div>This raises an error for &quot;<span style=3D"font-family:&quot;courie=
r new&quot;,courier">foo;&quot;,</span> but not for &quot;<span style=3D"fo=
nt-family:&quot;courier new&quot;,courier">foo;bar;</span>&quot;.</div>
<div>With a space-delimited list, the <span style=3D"font-family:&quot;cour=
ier new&quot;,courier">src_entry</span> can be directly added to the <span =
style=3D"font-family:&quot;courier new&quot;,courier">extra_dirs_task</span=
> list.</div>
<div><br>
<blockquote>+ for dst_entry in dst_entries:<br>+ cls.extra_dirs_task.append=
(dst_entry)<br>+ else:<br>+ cls.extra_dirs_task.append(src_entry)<br>+<br>@=
classmethod<br>def _parse_extra_files(cls, part, kernel_dir):<br>&quot;&quo=
t;&quot;<br>@@ -114,6 +145,7 @@ class ExtraPartitionPlugin(SourcePlugin):<b=
r>if not kernel_dir:<br>raise WicError(&quot;Couldn&#39;t find DEPLOY_DIR_I=
MAGE, exiting&quot;)<br><br>+ cls._parse_extra_directories(part)<br>cls._pa=
rse_extra_files(part, kernel_dir)<br><br>@classmethod<br>@@ -132,6 +164,12 =
@@ class ExtraPartitionPlugin(SourcePlugin):<br>if not kernel_dir:<br>raise=
 WicError(&quot;Couldn&#39;t find DEPLOY_DIR_IMAGE, exiting&quot;)<br><br>+=
 if cls.extra_dirs_task:<br>+ for task in cls.extra_dirs_task:<br>+ mkdir_c=
md =3D &quot;mkdir -p %s/%s&quot; % (extradir, task)<br>+ logger.debug(mkdi=
r_cmd)<br>+ exec_cmd(mkdir_cmd)<br>+<br>if cls.extra_files_task:<br>for tas=
k in cls.extra_files_task:<br>src_path, dst_path =3D task</blockquote>
</div>
<div>Regarding your patch 5/6, the plugin should indeed be able to create e=
xtra directories without requiring extra files. For example to prepare a da=
ta partition with only directories.</div>
<div>However, since extra partition plugin was not designed to create empty=
 partitions (omitting <span style=3D"font-family:&quot;courier new&quot;,co=
urier">--source</span> achieve this), I think the plugin should raise an er=
ror if no files or directories are defined.</div></blockquote><div><br></di=
v><div>Again, I don&#39;t understand why having the option for directories =
or files is a problem. It&#39;s an extra partition.</div><div>Is it just be=
cause there is a different way to have an empty partition as well?</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div>=C2=A0</div>
<div>Pierre-Loup,</div>
<div>=C2=A0</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229278): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229278" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229278</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117243677/101=
52556" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
mt/117243677/10152556</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:adam.duskett@amarulasoluti=
ons.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000606241064855baa9--

