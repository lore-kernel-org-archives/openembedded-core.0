Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C6CCF6BEF
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 16:39:37 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10430.1767803967556909976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 08:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ljnQV1Tk;
 spf=pass (domain: smile.fr, ip: 209.85.208.181, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382fb2bb83dso8946861fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767803966; x=1768408766; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HwcF+PMOxuyvkpcpCQ4yHb0fnFqFj6XEy3EKJAXWRok=;
        b=ljnQV1TkHphctHE6lo2+4iAgQGr2mo/xdotxFeM4/ZHbNaA4Zx89a+M9JhBRHxCJRp
         DldpcpRfRhE6ZsJfd0pgvv5/1WD1yADHQtDF9u1qWrgdfj1ao7q1QT5/lb7ZpVgIcnuj
         Zl9JgButPT7eStourdpO34bRE3ifdgohgIA+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803966; x=1768408766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwcF+PMOxuyvkpcpCQ4yHb0fnFqFj6XEy3EKJAXWRok=;
        b=gGkc4ES0UZ6CJVBVKqZLSNkiU+IUwS4pmraRseiimXmKzEm+H+EljKCnxyPO5f5e0v
         YlpsiW4U9pYV9is9Xae/14uKwUEXjHyUxpQ1Wi1jbXI8YIKdelQTZWryw1hpGs0Dv45T
         VhEsollMnneQUXoGCxuiBQpgE4glxJs48pdYb8nokzHjWtaenyfE2c2QDAWVVtXKHC7V
         h63oLFXHpfe9x+z6J7vD2Rl2OgARjUeQFhFoF/w2SgtLfcF+PTjJiKsp+CGNe3McPU2F
         7SzXG2Utauc4RUY3nyeXl++6KXf/vDOsSkdrxiFha5vrKJssCN8mTPjelBZUczjyQHCK
         G73Q==
X-Gm-Message-State: AOJu0YxoowLSeut3KE0+sKeM6udX/Sm+JwF4XmLtA4BvIAekN5QeUoOT
	Vz0VeH3cSwPR5LrpnG7t3Zo44RHeKZgN5qeISD4wbRwnOXz639AmM6EufabkjB73Ai2/+3nhkfT
	EGthTchZryZv+Twhx6jyLjLo9I2o2/rYPumI3Lt7TEg==
X-Gm-Gg: AY/fxX6jTHvME4aTWo6yMHOUqVcF3YO4nVr+3x3ig6I+oVMlP/kjMhn4DIfNuw51n83
	PIExLev6PHXM40FM+kI7PuWNJjoVo/EC90elqBIZlZ1a6v4QiFkgTJLDTpquYcPxC+cAbEuvgiu
	xj7mmtK7W48Nq/FekR/l5Ww0obSjBNWrFcJhITGcrPIhSDXkOBKIT2GCAasi0ZmHxkwcGhW7lA6
	67vf23FGE4Fop9kwd40lKmRGuCl7kAZch21Qa1opf9noOB//AaOHUHnkSU0MsaF2R3ZFMlSFeF/
	yyLALRAo46N3BcJP4dV+GCT/GAC/w74wpSUvd9yL0dnoFDPF6aTP7f7DdB9pPOVMElC2ticl66H
	q2yThbQLILL2fzD40uWg/32In
X-Google-Smtp-Source: AGHT+IHuwTfp1LACkljY236x8DrQApb0x+ONQej5ZrLbCRWKzZ2b6sOn1U6NBeqZUZ7lEWyaQrPrswAnN+xYRySZXsE=
X-Received: by 2002:a05:651c:41c8:b0:37f:cac3:c25b with SMTP id
 38308e7fff4ca-382ff6ebee0mr8337581fa.28.1767803965585; Wed, 07 Jan 2026
 08:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20260107-extrafiles-v1-0-a4ddd07df231@non.se.com> <20260107-extrafiles-v1-2-a4ddd07df231@non.se.com>
In-Reply-To: <20260107-extrafiles-v1-2-a4ddd07df231@non.se.com>
From: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Date: Wed, 7 Jan 2026 17:39:14 +0100
X-Gm-Features: AQt7F2qUFmd_d5VI8E8mlSlVUA3COKxg7y2MqW_Nhso9izeqU9BpmBxMYXrucjw
Message-ID: <CAHT-cZuC6W_kT2Xc-E07q6wkV36B5rFRxKe4Q-S41hBjbL3U4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] wic: extra-partition: introduce variable matching sourceparams
To: louis.rannou@non.se.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000066c8410647ceef28"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 16:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229014

--00000000000066c8410647ceef28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Louis,

Thanks for your patches.

I am not sure to understand your first point.

- an extra partition that has a specific label (or uuid) is doomed with the
>   associated variable. The partition cannot be configured unless the labe=
l
>   (or uuid) is changed.


From my comprehension, an extra partition that has a name (
--sourceparams=3D"name=3Dfoo") is also doomed with the associated variable =
(
IMAGE_EXTRA_PARTITION_FILES_sourceparams_foo). So, this does not resolve
the issue for me.
Let me know if I misunderstood your point.

- two partitions with same label from distincts .wks cannot have different
>   content.


I agree. I think this is currently possible if you set the variable based
on the WKS file, but this adds unnecessary complexity to the configuration.

For example:
>   an image may define:
>     IMAGE_EXTRA_PARTITION_FILES_sourceparams_foo =3D "bar.conf"
>   and the .wks line have line:
>     part --source extra_partition --sourceparams "name=3Dfoo"


Since the source parameter is "name", perhaps the suffix "name" instead of
"sourceparams" would be more intuitive ? For example,
IMAGE_EXTRA_PARTITION_FILES_name_foo.

I think it is great to have another way to select the partition
independently of the label, uuid or partname.

Thanks,

Pierre-Loup


On Wed, Jan 7, 2026 at 11:41=E2=80=AFAM Louis Rannou via B4 Relay <
devnull+louis.rannou.non.se.com@kernel.org> wrote:

> From: Louis Rannou <louis.rannou@non.se.com>
>
> The current extra_partition plugin uses predictable variable names (the
> configuration must predict the image partition label or uuid). This has t=
wo
> inconveniences:
>
> - an extra partition that has a specific label (or uuid) is doomed with t=
he
>   associated variable. The partition cannot be configured unless the labe=
l
>   (or uuid) is changed.
> - two partitions with same label from distincts .wks cannot have differen=
t
>   content.
>
> This allows the new suffix _sourceparams_foo to be appended to
> IMAGE_EXTRA_PARTITION_FILES. This variable will be preferred whenever the
> .wks specifies a name in the --sourceparams option.
>
> For example:
>   an image may define:
>     IMAGE_EXTRA_PARTITION_FILES_sourceparams_foo =3D "bar.conf"
>   and the .wks line have line:
>     part --source extra_partition --sourceparams "name=3Dfoo"
>
> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> ---
>  meta/lib/oeqa/selftest/cases/wic.py               | 16 ++++++++++-----
>  scripts/lib/wic/plugins/source/extra_partition.py | 24
> +++++++++++++++++------
>  2 files changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py
> b/meta/lib/oeqa/selftest/cases/wic.py
> index 55fb8dfd1b..542ce6fb05 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -1657,6 +1657,7 @@ INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
>      def test_extra_partition_plugin(self):
>          """Test extra partition plugin"""
>          config =3D dedent("""\
> +        IMAGE_EXTRA_PARTITION_FILES_sourceparams-foo =3D "bar.conf"
>          IMAGE_EXTRA_PARTITION_FILES_label-foo =3D "bar.conf;foo.conf"
>
>  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =
=3D
> "bar.conf;foobar.conf bar2.conf;foobar2.conf bar3.conf bar4.conf"
>          IMAGE_EXTRA_PARTITION_FILES =3D "foo/*"
> @@ -1688,9 +1689,13 @@ INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
>
>          try:
>              with NamedTemporaryFile("w", suffix=3D".wks") as wks:
> -                wks.writelines(['part / --source extra_partition --ondis=
k
> sda --label foo --align 4 --size 5M\n',
> -                                'part / --source extra_partition --ondis=
k
> sda --fstype=3Dvfat --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4
> --size 5M\n',
> -                                'part / --source extra_partition --ondis=
k
> sda --fstype=3Dext4 --label bar --align 4 --size 5M\n'])
> +                wks.writelines([
> +                    'part / --source extra_partition --ondisk sda
> --sourceparams "name=3Dfoo" --align 4 --size 5M\n',
> +                    'part / --source extra_partition --ondisk sda --labe=
l
> foo --align 4 --size 5M\n',
> +                    'part / --source extra_partition --ondisk sda
> --fstype=3Dvfat --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 --s=
ize
> 5M\n',
> +                    'part / --source extra_partition --ondisk sda
> --fstype=3Dext4 --label bar --align 4 --size 5M\n',
> +                    'bootloader --ptable gpt\n',
> +                ])
>                  wks.flush()
>                  _, wicimg =3D self._get_wic(wks.name)
>
> @@ -1698,14 +1703,15 @@ INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
>              partls =3D result.output.split('\n')[1:]
>
>              # Assert the number of partitions is correct
> -            self.assertEqual(3, len(partls), msg=3D"Expect 3 partitions,
> not %s" % result.output)
> +            self.assertEqual(4, len(partls), msg=3D"Expect 4 partitions,
> not %s" % result.output)
>
>              # Fstype column from 'wic ls' should be fstype as given in
> the part command
> -            for part_id, part_fs in enumerate(["fat16", "fat16", "ext4"]=
):
> +            for part_id, part_fs in enumerate(["fat16", "fat16", "fat16"=
,
> "ext4"]):
>                  self.assertIn(part_fs, partls[part_id])
>
>              # For each partition, assert expected files exist
>              for part, part_glob in enumerate([
> +                ["bar.conf"],
>                  ["foo.conf"],
>                  ["foobar.conf", "foobar2.conf", "bar3.conf", "bar4.conf"=
],
>                  ["bar.conf", "bar2.conf"],
> diff --git a/scripts/lib/wic/plugins/source/extra_partition.py
> b/scripts/lib/wic/plugins/source/extra_partition.py
> index d370b0107e..f9410388fa 100644
> --- a/scripts/lib/wic/plugins/source/extra_partition.py
> +++ b/scripts/lib/wic/plugins/source/extra_partition.py
> @@ -18,15 +18,17 @@ class ExtraPartitionPlugin(SourcePlugin):
>      The plugin supports:
>      - Glob pattern matching for file selection.
>      - File renaming.
> -    - Suffixes to specify the target partition (by label, UUID, or
> partname),
> -      enabling multiple extra partitions to coexist.
> +    - Suffixes to specify the target partition (by params-name, label,
> UUID,
> +      or partname), enabling multiple extra partitions to coexist.
>
>      For example:
>
> +        IMAGE_EXTRA_PARTITION_FILES_sourceparams-name =3D
> "bar.conf;foo.conf"
>          IMAGE_EXTRA_PARTITION_FILES_label-foo =3D "bar.conf;foo.conf"
>
>  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =
=3D
> "bar.conf;foobar.conf"
>          IMAGE_EXTRA_PARTITION_FILES =3D "foo/*"
>          WICVARS:append =3D "\
> +            IMAGE_EXTRA_PARTITION_FILES_sourceparams-name \
>              IMAGE_EXTRA_PARTITION_FILES_label-foo \
>
>  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
>          "
> @@ -53,11 +55,21 @@ class ExtraPartitionPlugin(SourcePlugin):
>                  raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting"=
)
>
>          extra_files =3D None
> -        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s",
> part.label), ("_part-name-%s", part.part_name), (None, None)):
> -            if fmt:
> -                var =3D fmt % id
> -            else:
> +        for (fmt, part_id) in (
> +                ("_sourceparams-%s", source_params.get("name")),
> +                ("_uuid-%s", part.uuid),
> +                ("_label-%s", part.label),
> +                ("_part-name-%s", part.part_name),
> +                (None, None)
> +        ):
> +            if fmt is None:
>                  var =3D ""
> +            elif part_id is not None:
> +                var =3D fmt % part_id
> +            else:
> +                continue
> +
> +            logger.debug("Looking for extra files in %s" %
> cls.image_extra_partition_files_var_name + var)
>              extra_files =3D
> get_bitbake_var(cls.image_extra_partition_files_var_name + var)
>              if extra_files is not None:
>                  break
>
> --
> 2.43.0
>
>
>

--00000000000066c8410647ceef28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Louis,</div><div><br></div><div>Thanks for your pa=
tches.</div><br><div>I am not sure to understand your first point.<div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">- an extra partitio=
n that has a specific label (or uuid) is doomed with the<br>
=C2=A0 associated variable. The partition cannot be configured unless the l=
abel<br>
=C2=A0 (or uuid) is changed.</blockquote></div><div><br></div><div>From my =
comprehension, an extra partition that has a name (<span style=3D"font-fami=
ly:monospace">--sourceparams=3D&quot;name=3Dfoo&quot;</span>) is also doome=
d with the associated variable (<span style=3D"font-family:monospace">IMAGE=
_EXTRA_PARTITION_FILES_sourceparams_foo</span>). So, this does not resolve =
the issue for me.</div><div></div><div>Let me know if I misunderstood your =
point.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">- two partitions with same label from distincts .wks cannot have differen=
t<br>
=C2=A0 content.</blockquote><div><br></div><div>I agree. I think this is=20
currently possible if you set the variable based on the WKS file, but=20
this adds=C2=A0unnecessary complexity to the configuration.</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">For example:<br>
=C2=A0 an image may define:<br>
=C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_FILES_sourceparams_foo =3D &quot;bar.co=
nf&quot;<br>
=C2=A0 and the .wks line have line:<br>
=C2=A0 =C2=A0 part --source extra_partition --sourceparams &quot;name=3Dfoo=
&quot;</blockquote><div><br></div><div>Since
 the source parameter is &quot;name&quot;,=C2=A0perhaps=C2=A0the suffix &qu=
ot;name&quot; instead of=20
&quot;sourceparams&quot; would be more intuitive ? For example,=C2=A0<span =
style=3D"font-family:monospace">IMAGE_EXTRA_PARTITION_FILES_name_foo.</span=
></div><div><br></div><div>I think it is great to have another way to selec=
t the partition independently of the label, uuid or partname.</div><div><br=
></div><div>Thanks,</div><div><br></div><div>Pierre-Loup</div><br></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, J=
an 7, 2026 at 11:41=E2=80=AFAM Louis Rannou via B4 Relay &lt;<a href=3D"mai=
lto:devnull%2Blouis.rannou.non.se.com@kernel.org" target=3D"_blank">devnull=
+louis.rannou.non.se.com@kernel.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Louis Rannou &lt;<a href=3D"mailto=
:louis.rannou@non.se.com" target=3D"_blank">louis.rannou@non.se.com</a>&gt;=
<br>
<br>
The current extra_partition plugin uses predictable variable names (the<br>
configuration must predict the image partition label or uuid). This has two=
<br>
inconveniences:<br>
<br>
- an extra partition that has a specific label (or uuid) is doomed with the=
<br>
=C2=A0 associated variable. The partition cannot be configured unless the l=
abel<br>
=C2=A0 (or uuid) is changed.<br>
- two partitions with same label from distincts .wks cannot have different<=
br>
=C2=A0 content.<br>
<br>
This allows the new suffix _sourceparams_foo to be appended to<br>
IMAGE_EXTRA_PARTITION_FILES. This variable will be preferred whenever the<b=
r>
.wks specifies a name in the --sourceparams option.<br>
<br>
For example:<br>
=C2=A0 an image may define:<br>
=C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_FILES_sourceparams_foo =3D &quot;bar.co=
nf&quot;<br>
=C2=A0 and the .wks line have line:<br>
=C2=A0 =C2=A0 part --source extra_partition --sourceparams &quot;name=3Dfoo=
&quot;<br>
<br>
Signed-off-by: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" =
target=3D"_blank">louis.rannou@non.se.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/wic.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 16 ++++++++++-----<br>
=C2=A0scripts/lib/wic/plugins/source/extra_partition.py | 24 ++++++++++++++=
+++------<br>
=C2=A02 files changed, 29 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py<br>
index 55fb8dfd1b..542ce6fb05 100644<br>
--- a/meta/lib/oeqa/selftest/cases/wic.py<br>
+++ b/meta/lib/oeqa/selftest/cases/wic.py<br>
@@ -1657,6 +1657,7 @@ INITRAMFS_IMAGE =3D &quot;core-image-initramfs-boot&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0def test_extra_partition_plugin(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Test extra partition pl=
ugin&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config =3D dedent(&quot;&quot;&quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_FILES_sourceparams-foo =
=3D &quot;bar.conf&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES_label-foo =3D=
 &quot;bar.conf;foo.conf&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e=
-cda3-4bed-9f54-9ef5312d105d =3D &quot;bar.conf;foobar.conf bar2.conf;fooba=
r2.conf bar3.conf bar4.conf&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES =3D &quot;foo=
/*&quot;<br>
@@ -1688,9 +1689,13 @@ INITRAMFS_IMAGE =3D &quot;core-image-initramfs-boot&=
quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with NamedTemporaryFile(&qu=
ot;w&quot;, suffix=3D&quot;.wks&quot;) as wks:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks.writelines([&#=
39;part / --source extra_partition --ondisk sda --label foo --align 4 --siz=
e 5M\n&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part / --source extra_partition=
 --ondisk sda --fstype=3Dvfat --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d -=
-align 4 --size 5M\n&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part / --source extra_partition=
 --ondisk sda --fstype=3Dext4 --label bar --align 4 --size 5M\n&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks.writelines([<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;part / --source extra_partition --ondisk sda --sourceparams &quot;name=3Df=
oo&quot; --align 4 --size 5M\n&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;part / --source extra_partition --ondisk sda --label foo --align 4 --size =
5M\n&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;part / --source extra_partition --ondisk sda --fstype=3Dvfat --uuid e7d082=
4e-cda3-4bed-9f54-9ef5312d105d --align 4 --size 5M\n&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;part / --source extra_partition --ondisk sda --fstype=3Dext4 --label bar -=
-align 4 --size 5M\n&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;bootloader --ptable gpt\n&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wks.flush()<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_, wicimg =3D=
 self._get_wic(<a href=3D"http://wks.name" rel=3D"noreferrer" target=3D"_bl=
ank">wks.name</a>)<br>
<br>
@@ -1698,14 +1703,15 @@ INITRAMFS_IMAGE =3D &quot;core-image-initramfs-boot=
&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partls =3D result.output.sp=
lit(&#39;\n&#39;)[1:]<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Assert the number of part=
itions is correct<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(3, len(partls),=
 msg=3D&quot;Expect 3 partitions, not %s&quot; % result.output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(4, len(partls),=
 msg=3D&quot;Expect 4 partitions, not %s&quot; % result.output)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Fstype column from &#39;w=
ic ls&#39; should be fstype as given in the part command<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for part_id, part_fs in enumerat=
e([&quot;fat16&quot;, &quot;fat16&quot;, &quot;ext4&quot;]):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for part_id, part_fs in enumerat=
e([&quot;fat16&quot;, &quot;fat16&quot;, &quot;fat16&quot;, &quot;ext4&quot=
;]):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIn=
(part_fs, partls[part_id])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# For each partition, asser=
t expected files exist<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for part, part_glob in enum=
erate([<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&quot;bar.conf&qu=
ot;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&quot;foo.co=
nf&quot;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&quot;foobar=
.conf&quot;, &quot;foobar2.conf&quot;, &quot;bar3.conf&quot;, &quot;bar4.co=
nf&quot;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&quot;bar.co=
nf&quot;, &quot;bar2.conf&quot;],<br>
diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/li=
b/wic/plugins/source/extra_partition.py<br>
index d370b0107e..f9410388fa 100644<br>
--- a/scripts/lib/wic/plugins/source/extra_partition.py<br>
+++ b/scripts/lib/wic/plugins/source/extra_partition.py<br>
@@ -18,15 +18,17 @@ class ExtraPartitionPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0The plugin supports:<br>
=C2=A0 =C2=A0 =C2=A0- Glob pattern matching for file selection.<br>
=C2=A0 =C2=A0 =C2=A0- File renaming.<br>
-=C2=A0 =C2=A0 - Suffixes to specify the target partition (by label, UUID, =
or partname),<br>
-=C2=A0 =C2=A0 =C2=A0 enabling multiple extra partitions to coexist.<br>
+=C2=A0 =C2=A0 - Suffixes to specify the target partition (by params-name, =
label, UUID,<br>
+=C2=A0 =C2=A0 =C2=A0 or partname), enabling multiple extra partitions to c=
oexist.<br>
<br>
=C2=A0 =C2=A0 =C2=A0For example:<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_FILES_sourceparams-name =
=3D &quot;bar.conf;foo.conf&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES_label-foo =3D=
 &quot;bar.conf;foo.conf&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e=
-cda3-4bed-9f54-9ef5312d105d =3D &quot;bar.conf;foobar.conf&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES =3D &quot;foo=
/*&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WICVARS:append =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_FILES_sour=
ceparams-name \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES=
_label-foo \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES=
_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
@@ -53,11 +55,21 @@ class ExtraPartitionPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise WicErro=
r(&quot;Couldn&#39;t find DEPLOY_DIR_IMAGE, exiting&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extra_files =3D None<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (fmt, id) in ((&quot;_uuid-%s&quot;, part.=
uuid), (&quot;_label-%s&quot;, part.label), (&quot;_part-name-%s&quot;, par=
t.part_name), (None, None)):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if fmt:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 var =3D fmt % id<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (fmt, part_id) in (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;_sourcepara=
ms-%s&quot;, source_params.get(&quot;name&quot;)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;_uuid-%s&qu=
ot;, part.uuid),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;_label-%s&q=
uot;, part.label),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;_part-name-=
%s&quot;, part.part_name),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (None, None)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if fmt is None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0var =3D &quot=
;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif part_id is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 var =3D fmt % part=
_id<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;Looking for e=
xtra files in %s&quot; % cls.image_extra_partition_files_var_name + var)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extra_files =3D get_bitbake=
_var(cls.image_extra_partition_files_var_name + var)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if extra_files is not None:=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
</blockquote></div>

--00000000000066c8410647ceef28--

