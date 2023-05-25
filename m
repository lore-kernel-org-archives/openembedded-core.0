Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9BBC77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 16:00:00 +0000 (UTC)
Subject: Re: [PATCH 1/2] package-index: Convert package-index into a bbclass.
To: openembedded-core@lists.openembedded.org
From: "Charlie Johnston" <charlie.johnston@ni.com>
X-Originating-Location: Austin, Texas, US (162.237.205.80)
X-Originating-Platform: Windows Chrome 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 25 May 2023 08:59:52 -0700
References: <303bdaddd7f8bd6f4655395bf977323c83211133.camel@linuxfoundation.org>
In-Reply-To: <303bdaddd7f8bd6f4655395bf977323c83211133.camel@linuxfoundation.org>
Message-ID: <2625.1685030392048662114@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ppZaMgXYfP9aNkf1W3dO"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 16:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181717

--ppZaMgXYfP9aNkf1W3dO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback. Are there concerns on this specific patch you have=
 other than the commit message?

Thanks,
Charlie

On Wed, May 24, 2023 at 06:26 PM, Richard Purdie wrote:

>=20
> On Wed, 2023-05-24 at 16:55 -0500, Charlie Johnston wrote:
>=20
>> Currently, package-index is a bit strange because it's a
>> bitbake recipe that implements a task.
>=20
> That isn't strange at all, it is perfectly fine for a recipe to add a
> task.
>=20
>=20
>> That task is
>> already used elsewhere and could be leveraged further
>> for BUILD_IMAGES_FROM_FEEDS.
>>=20
>> This change moves the logic for do_package_index into its
>> own bbclass and has package-index.bb inherit from there.
>=20
> The description here does not match what this patch actually does.=C2=A0T=
he
> patch changes the behaviour of the code considerably and this isn't
> even mentioned.
>=20
>=20
>>=20
>> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
>> ---
>> meta/classes/package_index.bbclass | 21 +++++++++++++++++++++
>> meta/recipes-core/meta/package-index.bb | 10 +---------
>> 2 files changed, 22 insertions(+), 9 deletions(-)
>> create mode 100644 meta/classes/package_index.bbclass
>>=20
>> diff --git a/meta/classes/package_index.bbclass
>> b/meta/classes/package_index.bbclass
>> new file mode 100644
>> index 0000000000..fdd10f6dd0
>> --- /dev/null
>> +++ b/meta/classes/package_index.bbclass
>> @@ -0,0 +1,21 @@
>> +#
>> +# Creates package indices for the IMAGE_PKGTYPE
>> +#
>> +
>> +do_package_index[nostamp] =3D "1"
>> +do_package_index[depends] +=3D "${PACKAGEINDEXDEPS}"
>> +do_package_index[recrdeptask] +=3D 'do_package_write_deb'
>> +do_package_index[recrdeptask] +=3D 'do_package_write_ipk'
>> +do_package_index[recrdeptask] +=3D 'do_package_write_rpm'
>=20
> Adding recrdeptask isn't mentioned in the commit message. "package-
> index" deliberately just indexes what is in the packages directory with
> no dependencies. This is therefore a significant change in behaviour.
>=20
>=20
>> +
>> +python do_package_index() {
>> + from oe.rootfs import generate_index_files
>> + generate_index_files(d)
>> +}
>> +
>> +# Package indexes are required for the dummy SDK architectures
>> +# to support scenarios where SDK images are built from feeds.
>> +PACKAGE_ARCHS:append:task-package-index =3D " sdk-provides-dummy-target=
"
>> +SDK_PACKAGE_ARCHS:append:task-package-index =3D "
>> sdk-provides-dummy-${SDKPKGSUFFIX}"
>=20
> This is also a change in behaviour, again unmentioned.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>> +
>> +addtask do_package_index before do_build
>> diff --git a/meta/recipes-core/meta/package-index.bb
>> b/meta/recipes-core/meta/package-index.bb
>> index 98c5bcb372..3fc18865b7 100644
>> --- a/meta/recipes-core/meta/package-index.bb
>> +++ b/meta/recipes-core/meta/package-index.bb
>> @@ -4,7 +4,7 @@ LICENSE =3D "MIT"
>> INHIBIT_DEFAULT_DEPS =3D "1"
>> PACKAGES =3D ""
>>=20
>> -inherit nopackages
>> +inherit nopackages package_index
>>=20
>> deltask do_fetch
>> deltask do_unpack
>> @@ -15,12 +15,4 @@ deltask do_install
>> deltask do_populate_lic
>> deltask do_populate_sysroot
>>=20
>> -do_package_index[nostamp] =3D "1"
>> -do_package_index[depends] +=3D "${PACKAGEINDEXDEPS}"
>> -
>> -python do_package_index() {
>> - from oe.rootfs import generate_index_files
>> - generate_index_files(d)
>> -}
>> -addtask do_package_index before do_build
>> EXCLUDE_FROM_WORLD =3D "1"
>=20
>

--ppZaMgXYfP9aNkf1W3dO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback. Are there concerns on this specific patch you have=
 other than the commit message?<br /><br />Thanks,<br />Charlie<br /><br />=
On Wed, May 24, 2023 at 06:26 PM, Richard Purdie wrote:<br />
<blockquote>On Wed, 2023-05-24 at 16:55 -0500, Charlie Johnston wrote:<br /=
>
<blockquote>Currently, package-index is a bit strange because it's a<br />b=
itbake recipe that implements a task.</blockquote>
That isn't strange at all, it is perfectly fine for a recipe to add a<br />=
task.<br /><br />
<blockquote>That task is<br />already used elsewhere and could be leveraged=
 further<br />for BUILD_IMAGES_FROM_FEEDS.<br /><br />This change moves the=
 logic for do_package_index into its<br />own bbclass and has package-index=
.bb inherit from there.</blockquote>
The description here does not match what this patch actually does.&nbsp;The=
<br />patch changes the behaviour of the code considerably and this isn't<b=
r />even mentioned.<br /><br />
<blockquote><br />Signed-off-by: Charlie Johnston &lt;charlie.johnston@ni.c=
om&gt;<br />---<br />meta/classes/package_index.bbclass | 21 ++++++++++++++=
+++++++<br />meta/recipes-core/meta/package-index.bb | 10 +---------<br />2=
 files changed, 22 insertions(+), 9 deletions(-)<br />create mode 100644 me=
ta/classes/package_index.bbclass<br /><br />diff --git a/meta/classes/packa=
ge_index.bbclass b/meta/classes/package_index.bbclass<br />new file mode 10=
0644<br />index 0000000000..fdd10f6dd0<br />--- /dev/null<br />+++ b/meta/c=
lasses/package_index.bbclass<br />@@ -0,0 +1,21 @@<br />+#<br />+# Creates =
package indices for the IMAGE_PKGTYPE<br />+#<br />+<br />+do_package_index=
[nostamp] =3D "1"<br />+do_package_index[depends] +=3D "${PACKAGEINDEXDEPS}=
"<br />+do_package_index[recrdeptask] +=3D 'do_package_write_deb'<br />+do_=
package_index[recrdeptask] +=3D 'do_package_write_ipk'<br />+do_package_ind=
ex[recrdeptask] +=3D 'do_package_write_rpm'</blockquote>
Adding recrdeptask isn't mentioned in the commit message. "package-<br />in=
dex" deliberately just indexes what is in the packages directory with<br />=
no dependencies. This is therefore a significant change in behaviour.<br />=
<br />
<blockquote>+<br />+python do_package_index() {<br />+ from oe.rootfs impor=
t generate_index_files<br />+ generate_index_files(d)<br />+}<br />+<br />+=
# Package indexes are required for the dummy SDK architectures<br />+# to s=
upport scenarios where SDK images are built from feeds.<br />+PACKAGE_ARCHS=
:append:task-package-index =3D " sdk-provides-dummy-target"<br />+SDK_PACKA=
GE_ARCHS:append:task-package-index =3D " sdk-provides-dummy-${SDKPKGSUFFIX}=
"</blockquote>
This is also a change in behaviour, again unmentioned.<br /><br />Cheers,<b=
r /><br />Richard<br /><br />
<blockquote>+<br />+addtask do_package_index before do_build<br />diff --gi=
t a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/packag=
e-index.bb<br />index 98c5bcb372..3fc18865b7 100644<br />--- a/meta/recipes=
-core/meta/package-index.bb<br />+++ b/meta/recipes-core/meta/package-index=
.bb<br />@@ -4,7 +4,7 @@ LICENSE =3D "MIT"<br />INHIBIT_DEFAULT_DEPS =3D "1=
"<br />PACKAGES =3D ""<br /><br />-inherit nopackages<br />+inherit nopacka=
ges package_index<br /><br />deltask do_fetch<br />deltask do_unpack<br />@=
@ -15,12 +15,4 @@ deltask do_install<br />deltask do_populate_lic<br />delt=
ask do_populate_sysroot<br /><br />-do_package_index[nostamp] =3D "1"<br />=
-do_package_index[depends] +=3D "${PACKAGEINDEXDEPS}"<br />-<br />-python d=
o_package_index() {<br />- from oe.rootfs import generate_index_files<br />=
- generate_index_files(d)<br />-}<br />-addtask do_package_index before do_=
build<br />EXCLUDE_FROM_WORLD =3D "1"</blockquote>
</blockquote>

--ppZaMgXYfP9aNkf1W3dO--

