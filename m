Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCFBD2F33E
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 16:19:03 +0000 (UTC)
Subject: Re: [PATCH 6/6] wic: extra-partitions: extend to support extra directories
To: openembedded-core@lists.openembedded.org
From: "Pierre-loup GOSSE" <pierre-loup.gosse@smile.fr>
X-Originating-Location: =?UTF-8?B?UGFyaXMsIMOObGUtZGUtRnJhbmNlLCBGUg==?= (147.161.184.208)
X-Originating-Platform: Linux Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 08:18:54 -0800
References: <20260113144314.3563680-1-adam.duskett@amarulasolutions.com> <20260113144314.3563680-6-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260113144314.3563680-6-adam.duskett@amarulasolutions.com>
Message-ID: <575011.1768321134244816412@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="TDycyEduVOOS5SaRBbTn"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 16:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229278

--TDycyEduVOOS5SaRBbTn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 13, 2026 at 03:43 PM, Adam Duskett wrote:

>=20
> Add the ability to define a semicolon-delminated list of directories
> to create on the extra partition.

I think using a semicolon to separate items in IMAGE_EXTRA_PARTITION_DIRECT=
ORIES could be confusing, as it=E2=80=99s already used for tuples in the IM=
AGE_EXTRA_PARTITION_FILES variable. A space-delimited list might be more in=
tuitive and consistent with how IMAGE_EXTRA_PARTITION_FILES is structured. =
For example:

IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo =3D "/test1 /test2/test3 /test4=
"
IMAGE_EXTRA_PARTITION_FILES_label-foo =3D "bar1.conf;foo1.conf bar2.conf ba=
r3;foo3"

What do you think ?

>=20
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> meta/lib/oeqa/selftest/cases/wic.py | 11 ++++++
> .../lib/wic/plugins/source/extra_partition.py | 38 +++++++++++++++++++
> 2 files changed, 49 insertions(+)
>=20
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
>=20
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
> result =3D runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1,
> file))
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
>=20
> For example:
>=20
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
>=20
> name =3D 'extra_partition'
> image_extra_partition_files_var_name =3D 'IMAGE_EXTRA_PARTITION_FILES'
> + image_extra_partition_dirs_var_name =3D
> 'IMAGE_EXTRA_PARTITION_DIRECTORIES'
>=20
> @classmethod
> def _get_extra_vars(cls, part, var_name):
> @@ -50,6 +57,30 @@ class ExtraPartitionPlugin(SourcePlugin):
> break
> return extra_vars
>=20
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

This raises an error for " foo;", but not for " foo;bar; ".
With a space-delimited list, the src_entry can be directly added to the ext=
ra_dirs_task list.

>=20
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
>=20
> + cls._parse_extra_directories(part)
> cls._parse_extra_files(part, kernel_dir)
>=20
> @classmethod
> @@ -132,6 +164,12 @@ class ExtraPartitionPlugin(SourcePlugin):
> if not kernel_dir:
> raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
>=20
> + if cls.extra_dirs_task:
> + for task in cls.extra_dirs_task:
> + mkdir_cmd =3D "mkdir -p %s/%s" % (extradir, task)
> + logger.debug(mkdir_cmd)
> + exec_cmd(mkdir_cmd)
> +
> if cls.extra_files_task:
> for task in cls.extra_files_task:
> src_path, dst_path =3D task

Regarding your patch 5/6, the plugin should indeed be able to create extra =
directories without requiring extra files. For example to prepare a data pa=
rtition with only directories.
However, since extra partition plugin was not designed to create empty part=
itions (omitting --source achieve this), I think the plugin should raise an=
 error if no files or directories are defined.

Pierre-Loup,

--TDycyEduVOOS5SaRBbTn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div><br />On Tue, Jan 13, 2026 at 03:43 PM, Adam Duskett wrote:</div>
<div>
<blockquote>Add the ability to define a semicolon-delminated list of direct=
ories<br />to create on the extra partition.</blockquote>
</div>
<div>&nbsp;</div>
<div>I think using a semicolon to separate items in <span style=3D"font-fam=
ily: 'courier new', courier;">IMAGE_EXTRA_PARTITION_DIRECTORIES</span>&nbsp=
;could be confusing, as it&rsquo;s already used for tuples in the <span sty=
le=3D"font-family: 'courier new', courier;">IMAGE_EXTRA_PARTITION_FILES</sp=
an>&nbsp;variable. A space-delimited list might be more intuitive and consi=
stent with how <span style=3D"font-family: 'courier new', courier;">IMAGE_E=
XTRA_PARTITION_FILES</span>&nbsp;is structured. For example:</div>
<div>&nbsp;</div>
<div><span style=3D"font-family: 'courier new', courier;">IMAGE_EXTRA_PARTI=
TION_DIRECTORIES_label-foo =3D "/test1 /test2/test3 /test4"</span></div>
<div><span style=3D"font-family: 'courier new', courier;">IMAGE_EXTRA_PARTI=
TION_FILES_label-foo =3D "bar1.conf;foo1.conf bar2.conf bar3;foo3"</span></=
div>
<div>&nbsp;</div>
<div>What do you think ?</div>
<div>&nbsp;</div>
<div>
<blockquote>Signed-off-by: Adam Duskett &lt;adam.duskett@amarulasolutions.c=
om&gt;<br />---<br />meta/lib/oeqa/selftest/cases/wic.py | 11 ++++++<br />.=
../lib/wic/plugins/source/extra_partition.py | 38 +++++++++++++++++++<br />=
2 files changed, 49 insertions(+)<br /><br />diff --git a/meta/lib/oeqa/sel=
ftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py<br />index 33a6460=
677..d365345554 100644<br />--- a/meta/lib/oeqa/selftest/cases/wic.py<br />=
+++ b/meta/lib/oeqa/selftest/cases/wic.py<br />@@ -1657,10 +1657,14 @@ INIT=
RAMFS_IMAGE =3D "core-image-initramfs-boot"<br />def test_extra_partition_p=
lugin(self):<br />"""Test extra partition plugin"""<br />config =3D dedent(=
"""\<br />+ IMAGE_EXTRA_PARTITION_DIRECTORIES_label-foo =3D "/test1;/test2/=
test3"<br />+ IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f5=
4-9ef5312d105d =3D "/test1;/test2/test3"<br />IMAGE_EXTRA_PARTITION_FILES_l=
abel-foo =3D "bar.conf;foo.conf"<br />IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0=
824e-cda3-4bed-9f54-9ef5312d105d =3D "bar.conf;foobar.conf"<br />IMAGE_EXTR=
A_PARTITION_FILES =3D "foo/*"<br />WICVARS:append =3D "\<br />+ IMAGE_EXTRA=
_PARTITION_DIRECTORIES_label-foo \<br />+ IMAGE_EXTRA_PARTITION_DIRECTORIES=
_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \<br />IMAGE_EXTRA_PARTITION_FIL=
ES_label-foo \<br />IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f5=
4-9ef5312d105d \<br />"<br />@@ -1692,6 +1696,13 @@ INITRAMFS_IMAGE =3D "co=
re-image-initramfs-boot"<br />result =3D runCmd("wic ls %s | wc -l" % wicim=
g)<br />self.assertEqual('4', result.output, msg=3D"Expect 3 partitions, no=
t %s" % result.output)<br /><br />+ for part, extra_dir in enumerate(["test=
1", "test2"]):<br />+ result =3D runCmd("wic ls %s:%d | grep -q \"%s\"" % (=
wicimg, part + 1, extra_dir))<br />+ self.assertEqual(0, result.status, msg=
=3D"Directory '%s' not found in the partition #%d" % (extra_dir, part))<br =
/>+<br />+ result =3D runCmd("wic ls %s:%d/test2 | grep -q \"test3\"" % (wi=
cimg, part + 1))<br />+ self.assertEqual(0, result.status, msg=3D"Directory=
 test2/test3 not found in the partition #%d" % part)<br />+<br />for part, =
file in enumerate(["foo.conf", "foobar.conf", "bar.conf"]):<br />result =3D=
 runCmd("wic ls %s:%d | grep -q \"%s\"" % (wicimg, part + 1, file))<br />se=
lf.assertEqual(0, result.status, msg=3D"File '%s' not found in the partitio=
n #%d" % (file, part))<br />diff --git a/scripts/lib/wic/plugins/source/ext=
ra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py<br />in=
dex 3abd2bfd4c..fee72df615 100644<br />--- a/scripts/lib/wic/plugins/source=
/extra_partition.py<br />+++ b/scripts/lib/wic/plugins/source/extra_partiti=
on.py<br />@@ -20,13 +20,19 @@ class ExtraPartitionPlugin(SourcePlugin):<br=
 />- File renaming.<br />- Suffixes to specify the target partition (by lab=
el, UUID, or partname),<br />enabling multiple extra partitions to coexist.=
<br />+ - Extra directories.<br /><br />For example:<br /><br />+ IMAGE_EXT=
RA_PARTITION_DIRECTORIES_label-foo =3D "/foo;/bar/baz"<br />+ IMAGE_EXTRA_P=
ARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =3D "/foo;/b=
ar/baz"<br />+<br />IMAGE_EXTRA_PARTITION_FILES_label-foo =3D "bar.conf;foo=
.conf"<br />IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef531=
2d105d =3D "bar.conf;foobar.conf"<br />IMAGE_EXTRA_PARTITION_FILES =3D "foo=
/*"<br />WICVARS:append =3D "\<br />+ IMAGE_EXTRA_PARTITION_DIRECTORIES_lab=
el-foo \<br />+ IMAGE_EXTRA_PARTITION_DIRECTORIES_uuid-e7d0824e-cda3-4bed-9=
f54-9ef5312d105d \<br />IMAGE_EXTRA_PARTITION_FILES_label-foo \<br />IMAGE_=
EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \<br />"<br=
 />@@ -35,6 +41,7 @@ class ExtraPartitionPlugin(SourcePlugin):<br /><br />n=
ame =3D 'extra_partition'<br />image_extra_partition_files_var_name =3D 'IM=
AGE_EXTRA_PARTITION_FILES'<br />+ image_extra_partition_dirs_var_name =3D '=
IMAGE_EXTRA_PARTITION_DIRECTORIES'<br /><br />@classmethod<br />def _get_ex=
tra_vars(cls, part, var_name):<br />@@ -50,6 +57,30 @@ class ExtraPartition=
Plugin(SourcePlugin):<br />break<br />return extra_vars<br /><br />+<br />+=
 @classmethod<br />+ def _parse_extra_directories(cls, part):<br />+ """<br=
 />+ Parse the directories of which to copy.<br />+ """<br />+ cls.extra_di=
rs_task =3D []<br />+<br />+ extra_dirs =3D cls._get_extra_vars(part, cls.i=
mage_extra_partition_dirs_var_name)<br />+ if extra_dirs is None:<br />+ lo=
gger.debug('No extra directories defined, %s unset for entry #%d' % (cls.im=
age_extra_partition_dirs_var_name, part.lineno))<br />+ return<br />+<br />=
+ logger.info('Extra dirs: %s', extra_dirs)<br />+ for src_entry in re.find=
all(r'[\w;\-./*]+', extra_dirs):<br />+ if ';' in src_entry:<br />+ dst_ent=
ries =3D src_entry.split(';')<br />+ if not dst_entries[0] or not dst_entri=
es[1]:<br />+ raise WicError('Malformed extra dir entry: %s' % src_entry)</=
blockquote>
</div>
<div>&nbsp;</div>
<div>This raises an error for "<span style=3D"font-family: 'courier new', c=
ourier;">foo;",</span> but not for "<span style=3D"font-family: 'courier ne=
w', courier;">foo;bar;</span>".</div>
<div>With a space-delimited list, the <span style=3D"font-family: 'courier =
new', courier;">src_entry</span> can be directly added to the <span style=
=3D"font-family: 'courier new', courier;">extra_dirs_task</span> list.</div=
>
<div><br />
<blockquote>+ for dst_entry in dst_entries:<br />+ cls.extra_dirs_task.appe=
nd(dst_entry)<br />+ else:<br />+ cls.extra_dirs_task.append(src_entry)<br =
/>+<br />@classmethod<br />def _parse_extra_files(cls, part, kernel_dir):<b=
r />"""<br />@@ -114,6 +145,7 @@ class ExtraPartitionPlugin(SourcePlugin):<=
br />if not kernel_dir:<br />raise WicError("Couldn't find DEPLOY_DIR_IMAGE=
, exiting")<br /><br />+ cls._parse_extra_directories(part)<br />cls._parse=
_extra_files(part, kernel_dir)<br /><br />@classmethod<br />@@ -132,6 +164,=
12 @@ class ExtraPartitionPlugin(SourcePlugin):<br />if not kernel_dir:<br =
/>raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")<br /><br />+ if=
 cls.extra_dirs_task:<br />+ for task in cls.extra_dirs_task:<br />+ mkdir_=
cmd =3D "mkdir -p %s/%s" % (extradir, task)<br />+ logger.debug(mkdir_cmd)<=
br />+ exec_cmd(mkdir_cmd)<br />+<br />if cls.extra_files_task:<br />for ta=
sk in cls.extra_files_task:<br />src_path, dst_path =3D task</blockquote>
</div>
<div>Regarding your patch 5/6, the plugin should indeed be able to create e=
xtra directories without requiring extra files. For example to prepare a da=
ta partition with only directories.</div>
<div>However, since extra partition plugin was not designed to create empty=
 partitions (omitting <span style=3D"font-family: 'courier new', courier;">=
--source</span> achieve this), I think the plugin should raise an error if =
no files or directories are defined.</div>
<div>&nbsp;</div>
<div>Pierre-Loup,</div>
<div>&nbsp;</div>

--TDycyEduVOOS5SaRBbTn--

