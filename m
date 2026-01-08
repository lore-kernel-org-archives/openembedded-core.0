Return-Path: <louis.rannou@non.se.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7621CF6A89
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 09:00:59 +0000 (UTC)
Subject: Re: [PATCH 2/2] wic: extra-partition: introduce variable matching sourceparams
To: openembedded-core@lists.openembedded.org
From: "Louis Rannou" <louis.rannou@non.se.com>
X-Originating-Location: =?UTF-8?B?TWFyc2VpbGxlLCBQcm92ZW5jZS1BbHBlcy1Dw7R0ZSBkJ0F6dXIsIEZS?= (147.161.180.91)
X-Originating-Platform: Windows Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 01:00:55 -0800
References: <20260107-extrafiles-v1-0-a4ddd07df231@non.se.com> <20260107-extrafiles-v1-2-a4ddd07df231@non.se.com> <CAHT-cZuC6W_kT2Xc-E07q6wkV36B5rFRxKe4Q-S41hBjbL3U4w@mail.gmail.com>
In-Reply-To: <CAHT-cZuC6W_kT2Xc-E07q6wkV36B5rFRxKe4Q-S41hBjbL3U4w@mail.gmail.com>
Message-ID: <530964.1767862855686685645@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 09:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229044

Hello Pierre-Loup,

Thanks for the review

> I am not sure to understand your first point.
>=20
> - an extra partition that has a specific label (or uuid) is doomed with t=
he
> >   associated variable. The partition cannot be configured unless the la=
bel
> >   (or uuid) is changed.
>=20
>=20
> From my comprehension, an extra partition that has a name (
> --sourceparams=3D"name=3Dfoo") is also doomed with the associated variabl=
e (
> IMAGE_EXTRA_PARTITION_FILES_sourceparams_foo). So, this does not resolve
> the issue for me.
> Let me know if I misunderstood your point.

Here the name can be customized without impacting the final image. While mo=
st of the time you wish the label to keep standard (data, config, home... b=
ut not my_specific_name). Then if you need your partition to have label dat=
a, you will not be able to select an other variable than IMAGE_EXTRA_PARTIT=
ION_FILES_label-data.

>=20
> - two partitions with same label from distincts .wks cannot have differen=
t
> >   content.
>=20
>=20
> I agree. I think this is currently possible if you set the variable based
> on the WKS file, but this adds unnecessary complexity to the configuratio=
n.
>=20
> For example:
> >   an image may define:
> >     IMAGE_EXTRA_PARTITION_FILES_sourceparams_foo =3D "bar.conf"
> >   and the .wks line have line:
> >     part --source extra_partition --sourceparams "name=3Dfoo"
>=20
>=20
> Since the source parameter is "name", perhaps the suffix "name" instead o=
f
> "sourceparams" would be more intuitive ? For example,
> IMAGE_EXTRA_PARTITION_FILES_name_foo.

Fine for me !

>=20
> I think it is great to have another way to select the partition
> independently of the label, uuid or partname.
>=20
> Thanks,
>=20
> Pierre-Loup
>=20
>=20
> On Wed, Jan 7, 2026 at 11:41=E2=80=AFAM Louis Rannou via B4 Relay <
> devnull+louis.rannou.non.se.com@kernel.org> wrote:
>=20
> > From: Louis Rannou <louis.rannou@non.se.com>
> >
> > The current extra_partition plugin uses predictable variable names (the
> > configuration must predict the image partition label or uuid). This has=
 two
> > inconveniences:
> >
> > - an extra partition that has a specific label (or uuid) is doomed with=
 the
> >   associated variable. The partition cannot be configured unless the la=
bel
> >   (or uuid) is changed.
> > - two partitions with same label from distincts .wks cannot have differ=
ent
> >   content.
> >
> > This allows the new suffix _sourceparams_foo to be appended to
> > IMAGE_EXTRA_PARTITION_FILES. This variable will be preferred whenever t=
he
> > .wks specifies a name in the --sourceparams option.
> >
> > For example:
> >   an image may define:
> >     IMAGE_EXTRA_PARTITION_FILES_sourceparams_foo =3D "bar.conf"
> >   and the .wks line have line:
> >     part --source extra_partition --sourceparams "name=3Dfoo"
> >
> > Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/wic.py               | 16 ++++++++++-----
> >  scripts/lib/wic/plugins/source/extra_partition.py | 24
> > +++++++++++++++++------
> >  2 files changed, 29 insertions(+), 11 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/wic.py
> > b/meta/lib/oeqa/selftest/cases/wic.py
> > index 55fb8dfd1b..542ce6fb05 100644
> > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > @@ -1657,6 +1657,7 @@ INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
> >      def test_extra_partition_plugin(self):
> >          """Test extra partition plugin"""
> >          config =3D dedent("""\
> > +        IMAGE_EXTRA_PARTITION_FILES_sourceparams-foo =3D "bar.conf"
> >          IMAGE_EXTRA_PARTITION_FILES_label-foo =3D "bar.conf;foo.conf"
> >
> >  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =
=3D
> > "bar.conf;foobar.conf bar2.conf;foobar2.conf bar3.conf bar4.conf"
> >          IMAGE_EXTRA_PARTITION_FILES =3D "foo/*"
> > @@ -1688,9 +1689,13 @@ INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
> >
> >          try:
> >              with NamedTemporaryFile("w", suffix=3D".wks") as wks:
> > -                wks.writelines(['part / --source extra_partition --ond=
isk
> > sda --label foo --align 4 --size 5M\n',
> > -                                'part / --source extra_partition --ond=
isk
> > sda --fstype=3Dvfat --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align=
 4
> > --size 5M\n',
> > -                                'part / --source extra_partition --ond=
isk
> > sda --fstype=3Dext4 --label bar --align 4 --size 5M\n'])
> > +                wks.writelines([
> > +                    'part / --source extra_partition --ondisk sda
> > --sourceparams "name=3Dfoo" --align 4 --size 5M\n',
> > +                    'part / --source extra_partition --ondisk sda --la=
bel
> > foo --align 4 --size 5M\n',
> > +                    'part / --source extra_partition --ondisk sda
> > --fstype=3Dvfat --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d --align 4 -=
-size
> > 5M\n',
> > +                    'part / --source extra_partition --ondisk sda
> > --fstype=3Dext4 --label bar --align 4 --size 5M\n',
> > +                    'bootloader --ptable gpt\n',
> > +                ])
> >                  wks.flush()
> >                  _, wicimg =3D self._get_wic(wks.name)
> >
> > @@ -1698,14 +1703,15 @@ INITRAMFS_IMAGE =3D "core-image-initramfs-boot"
> >              partls =3D result.output.split('\n')[1:]
> >
> >              # Assert the number of partitions is correct
> > -            self.assertEqual(3, len(partls), msg=3D"Expect 3 partition=
s,
> > not %s" % result.output)
> > +            self.assertEqual(4, len(partls), msg=3D"Expect 4 partition=
s,
> > not %s" % result.output)
> >
> >              # Fstype column from 'wic ls' should be fstype as given in
> > the part command
> > -            for part_id, part_fs in enumerate(["fat16", "fat16", "ext4=
"]):
> > +            for part_id, part_fs in enumerate(["fat16", "fat16", "fat1=
6",
> > "ext4"]):
> >                  self.assertIn(part_fs, partls[part_id])
> >
> >              # For each partition, assert expected files exist
> >              for part, part_glob in enumerate([
> > +                ["bar.conf"],
> >                  ["foo.conf"],
> >                  ["foobar.conf", "foobar2.conf", "bar3.conf", "bar4.con=
f"],
> >                  ["bar.conf", "bar2.conf"],
> > diff --git a/scripts/lib/wic/plugins/source/extra_partition.py
> > b/scripts/lib/wic/plugins/source/extra_partition.py
> > index d370b0107e..f9410388fa 100644
> > --- a/scripts/lib/wic/plugins/source/extra_partition.py
> > +++ b/scripts/lib/wic/plugins/source/extra_partition.py
> > @@ -18,15 +18,17 @@ class ExtraPartitionPlugin(SourcePlugin):
> >      The plugin supports:
> >      - Glob pattern matching for file selection.
> >      - File renaming.
> > -    - Suffixes to specify the target partition (by label, UUID, or
> > partname),
> > -      enabling multiple extra partitions to coexist.
> > +    - Suffixes to specify the target partition (by params-name, label,
> > UUID,
> > +      or partname), enabling multiple extra partitions to coexist.
> >
> >      For example:
> >
> > +        IMAGE_EXTRA_PARTITION_FILES_sourceparams-name =3D
> > "bar.conf;foo.conf"
> >          IMAGE_EXTRA_PARTITION_FILES_label-foo =3D "bar.conf;foo.conf"
> >
> >  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =
=3D
> > "bar.conf;foobar.conf"
> >          IMAGE_EXTRA_PARTITION_FILES =3D "foo/*"
> >          WICVARS:append =3D "\
> > +            IMAGE_EXTRA_PARTITION_FILES_sourceparams-name \
> >              IMAGE_EXTRA_PARTITION_FILES_label-foo \
> >
> >  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =
\
> >          "
> > @@ -53,11 +55,21 @@ class ExtraPartitionPlugin(SourcePlugin):
> >                  raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exitin=
g")
> >
> >          extra_files =3D None
> > -        for (fmt, id) in (("_uuid-%s", part.uuid), ("_label-%s",
> > part.label), ("_part-name-%s", part.part_name), (None, None)):
> > -            if fmt:
> > -                var =3D fmt % id
> > -            else:
> > +        for (fmt, part_id) in (
> > +                ("_sourceparams-%s", source_params.get("name")),
> > +                ("_uuid-%s", part.uuid),
> > +                ("_label-%s", part.label),
> > +                ("_part-name-%s", part.part_name),
> > +                (None, None)
> > +        ):
> > +            if fmt is None:
> >                  var =3D ""
> > +            elif part_id is not None:
> > +                var =3D fmt % part_id
> > +            else:
> > +                continue
> > +
> > +            logger.debug("Looking for extra files in %s" %
> > cls.image_extra_partition_files_var_name + var)
> >              extra_files =3D
> > get_bitbake_var(cls.image_extra_partition_files_var_name + var)
> >              if extra_files is not None:
> >                  break
> >
> > --
> > 2.43.0
> >
> >
> >
>

