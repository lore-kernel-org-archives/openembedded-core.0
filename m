Return-Path: <nobuta.keiya@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C98EC433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 02:24:03 +0000 (UTC)
Subject: Re: [PATCH 2/3] create-spdx: Fix "licenseDeclared" shows weird value
To: openembedded-core@lists.openembedded.org
From: "Keiya Nobuta" <nobuta.keiya@fujitsu.com>
X-Originating-Location: Tokyo, JP (208.127.119.236)
X-Originating-Platform: Windows Chrome 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 19 Oct 2022 19:23:57 -0700
References: <CAJdd5GYUxEHhZGNfj_7FL9_=7KF158kLoKmuSmEZR6q+5WdeKw@mail.gmail.com>
In-Reply-To: <CAJdd5GYUxEHhZGNfj_7FL9_=7KF158kLoKmuSmEZR6q+5WdeKw@mail.gmail.com>
Message-ID: <17154.1666232637937411000@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="daFiOlo5TqNyChbHQlFV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 02:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171987

--daFiOlo5TqNyChbHQlFV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 06:17 AM, Joshua Watt wrote:

>=20
> On Wed, Oct 19, 2022 at 6:08 AM Keiya Nobuta <nobuta.keiya@fujitsu.com>
> wrote:
>=20
>> Fixed an issue that "licenseDeclared" shows weird value, for example
>> `busybox.spdx.json` shows like:
>>=20
>> "GPL-2.0-only AND DocumentRef-recipe-busybox:LicenseRef-bzip2-1.0.4"
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> unwanted value
>=20
> I don't believe this is unwanted: the license text lives in another
> document (ecipe-busybox.spdx.json) so we need to indicate that here

Thanks for your comment.
I was misunderstanding, so I'm withdrawing this patch.

The reason I got it wrong was because the SPDX validation tool[1]
gave me the following message:

```
The following warning(s) were raised: [Invalid package
declared license:Incompatible type for property member: class
org.spdx.library.model.license.AnyLicenseInfo]
```

But this is probably due to a flaw in the validation tool. So I checked the
SPDX specification[2], and understood that it complies with the user define=
d
license reference.

[1] https://tools.spdx.org/app/validate/
[2] https://spdx.github.io/spdx-spec/SPDX-license-expressions/

>=20
>=20
>> Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
>> ---
>> meta/classes/create-spdx.bbclass | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/classes/create-spdx.bbclass
>> b/meta/classes/create-spdx.bbclass
>> index c190ad3889..1661c7d2f0 100644
>> --- a/meta/classes/create-spdx.bbclass
>> +++ b/meta/classes/create-spdx.bbclass
>> @@ -534,7 +534,7 @@ python do_create_spdx() {
>> recipe_ref.checksum.checksumValue =3D doc_sha1
>>=20
>> sources =3D collect_dep_sources(d, dep_recipes)
>> - found_licenses =3D {license.name:recipe_ref.externalDocumentId + ":" +
>> license.licenseId for license in doc.hasExtractedLicensingInfos}
>> + found_licenses =3D {license.name: license.licenseId for license in
>> doc.hasExtractedLicensingInfos}
>>=20
>> if not recipe_spdx_is_native(d, recipe):
>> bb.build.exec_func("read_subpackage_metadata", d)
>> --
>> 2.25.1
>>=20
>>=20
>>=20
>=20
>

--daFiOlo5TqNyChbHQlFV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 06:17 AM, Joshua Watt wrote:<br />
<blockquote>On Wed, Oct 19, 2022 at 6:08 AM Keiya Nobuta &lt;nobuta.keiya@f=
ujitsu.com&gt; wrote:<br />
<blockquote>Fixed an issue that "licenseDeclared" shows weird value, for ex=
ample<br />`busybox.spdx.json` shows like:<br /><br />"GPL-2.0-only AND Doc=
umentRef-recipe-busybox:LicenseRef-bzip2-1.0.4"<br />^^^^^^^^^^^^^^^^^^^^^^=
^^^^^<br />unwanted value</blockquote>
I don't believe this is unwanted: the license text lives in another<br />do=
cument (ecipe-busybox.spdx.json) so we need to indicate that here</blockquo=
te>
<div>Thanks for your comment.</div>
<div>I was misunderstanding, so I'm withdrawing this patch.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>The reason I got it wrong was because the SPDX validation tool[1]<br /=
>gave me the following message:</div>
<div>&nbsp;</div>
<div>```</div>
<div>The following warning(s) were raised: [Invalid package</div>
<div>declared license:Incompatible type for property member: class</div>
<div>org.spdx.library.model.license.AnyLicenseInfo]</div>
<div>```</div>
<div>&nbsp;</div>
<div>
<div>But this is probably due to a flaw in the validation tool. So I checke=
d the</div>
<div>SPDX specification[2], and understood that it complies with the user d=
efined</div>
<div>license reference.</div>
</div>
<div>&nbsp;</div>
<div>[1] https://tools.spdx.org/app/validate/</div>
<div>[2] https://spdx.github.io/spdx-spec/SPDX-license-expressions/</div>
<div>&nbsp;</div>
<br />
<blockquote>
<blockquote>Signed-off-by: Keiya Nobuta &lt;nobuta.keiya@fujitsu.com&gt;<br=
 />---<br />meta/classes/create-spdx.bbclass | 2 +-<br />1 file changed, 1 =
insertion(+), 1 deletion(-)<br /><br />diff --git a/meta/classes/create-spd=
x.bbclass b/meta/classes/create-spdx.bbclass<br />index c190ad3889..1661c7d=
2f0 100644<br />--- a/meta/classes/create-spdx.bbclass<br />+++ b/meta/clas=
ses/create-spdx.bbclass<br />@@ -534,7 +534,7 @@ python do_create_spdx() {<=
br />recipe_ref.checksum.checksumValue =3D doc_sha1<br /><br />sources =3D =
collect_dep_sources(d, dep_recipes)<br />- found_licenses =3D {license.name=
:recipe_ref.externalDocumentId + ":" + license.licenseId for license in doc=
.hasExtractedLicensingInfos}<br />+ found_licenses =3D {license.name: licen=
se.licenseId for license in doc.hasExtractedLicensingInfos}<br /><br />if n=
ot recipe_spdx_is_native(d, recipe):<br />bb.build.exec_func("read_subpacka=
ge_metadata", d)<br />--<br />2.25.1<br /><br /><br /></blockquote>
</blockquote>

--daFiOlo5TqNyChbHQlFV--

