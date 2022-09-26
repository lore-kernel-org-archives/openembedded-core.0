Return-Path: <andriy.danylovskyy@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 095C7C6FA83
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 11:46:47 +0000 (UTC)
Subject: Re: [PATCH] classes/patch: move QUILT_PC for patching consistency
To: openembedded-core@lists.openembedded.org
From: "Andriy Danylovskyy" <andriy.danylovskyy@streamunlimited.com>
X-Originating-Location: Vienna, AT (91.114.0.140)
X-Originating-Platform: Linux Chrome 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 26 Sep 2022 04:46:43 -0700
References: 
 <bb6a6b015fa7e01e51b85096c10bf02859edc96e.camel@linuxfoundation.org>
In-Reply-To: 
 <bb6a6b015fa7e01e51b85096c10bf02859edc96e.camel@linuxfoundation.org>
Message-ID: <15447.1664192803295005631@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="AJsj2nE7ENEUSq8LJw7e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 11:46:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171062

--AJsj2nE7ENEUSq8LJw7e
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On 26/09/2022 12:23, Richard Purdie wrote:

>=20
> On Mon, 2022-09-26 at 11:06 +0200, Andriy Danylovskyy wrote:
>=20
>> This will move the quilt cache from the default location '$S/.pc' to
>> '$S/patches/.pc', to ensure source invalidation always wipes it out,
>> together with all patches.
>>=20
>> Recipes which set $S to $WORKDIR are
>> susceptible to a weird issue:
>>=20
>=20
> There are a number of problems with recipes which use S =3D WORKDIR
> unfortunately. Another is that rerunning fetch/unpack doesn't clean up
> files properly and can lead to build corruption.
>=20
> I'm leaning towards
> making S =3D=3D WORKDIR a warning and migrating recipes
> to always use a
> subdir. That isn't entirely straight forward but
> probably the only way to
> solve all the issues.
>=20

Anything that doesn't let it "pass" silently would be already a big improve=
ment. Although deprecation with a warning sounds like a few more years to g=
o into all affected projects.

>=20
> =C2=A0
>>  if
>> a source file is patched by quilt (a .bbappend adds a patch), updates
>> to it are ignored by incremental builds, the first obsolete version is
>> picked again and again. This is because quilt keeps its own cache in
>> '$S/.pc', and this one survives source invalidation on do_unpack.
>>=20
>> This is
>> a follow-up for a56fb90dc380 and 42a513489dc6
>>=20
>> Signed-off-by: Andriy
>> Danylovskyy <andriy.danylovskyy@streamunlimited.com>
>> ---
>>=20
>> meta/classes-global/patch.bbclass | 3 +++
>>  1 file changed, 3 insertions(+)
>> diff --git a/meta/classes-global/patch.bbclass
>> b/meta/classes-global/patch.bbclass
>> index e3157c7b18..6fcac18d9c 100644
>> --- a/meta/classes-global/patch.bbclass
>> +++
>> b/meta/classes-global/patch.bbclass
>> @@ -5,6 +5,9 @@
>>  # Point to an empty
>> file so any user's custom settings don't break things
>>  QUILTRCFILE ?=3D
>> "${STAGING_ETCDIR_NATIVE}/quiltrc"
>> =20
>> +# Move quilt's cache to ensure it
>> always gets removed together with "patches"
>> +export QUILT_PC =3D
>> "${S}/patches/.pc"
>> +
>>=20
>=20
> This would break all other commandline use of quilt without the right
> environment. Sadly that is a usecase I personally use quite heavily too
> :/.
>=20
> Cheers,
>=20
> Richard
>=20

I can't think of any patching in a recipe workdir, outside of do_patch and =
the devtool, so this wasn't taken into account. But what do I know about ot=
her people's workflows...=C2=A0 =C2=A0Then another (dirtier?) option would =
be to patch quilt-native itself, setting QUILT_PC to the relative ./patches=
/.pc

--
Best regards,
Andriy

--AJsj2nE7ENEUSq8LJw7e
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div class=3D"moz-cite-prefix">On 26/09/2022 12:23, Richard Purdie wrote:</=
div>
<blockquote cite=3D"mid:bb6a6b015fa7e01e51b85096c10bf02859edc96e.camel@linu=
xfoundation.org">
<pre class=3D"moz-quote-pre">On Mon, 2022-09-26 at 11:06 +0200, Andriy Dany=
lovskyy wrote:
</pre>
<blockquote>
<pre class=3D"moz-quote-pre">This will move the quilt cache from the defaul=
t location '$S/.pc' to
'$S/patches/.pc', to ensure source invalidation always wipes it out,
together with all patches.

Recipes which set $S to $WORKDIR are susceptible to a weird issue:
</pre>
</blockquote>
<pre class=3D"moz-quote-pre">There are a number of problems with recipes wh=
ich use S =3D WORKDIR
unfortunately. Another is that rerunning fetch/unpack doesn't clean up
files properly and can lead to build corruption.

I'm leaning towards making S =3D=3D WORKDIR a warning and migrating recipes
to always use a subdir. That isn't entirely straight forward but
probably the only way to solve all the issues.
</pre>
</blockquote>
Anything that doesn't let it "pass" silently would be already a big improve=
ment. Although deprecation with a warning sounds like a few more years to g=
o into all affected projects.<br /><br /><br />
<blockquote>
<pre class=3D"moz-quote-pre">&nbsp;</pre>
<blockquote>
<pre class=3D"moz-quote-pre"> if
a source file is patched by quilt (a .bbappend adds a patch), updates
to it are ignored by incremental builds, the first obsolete version is
picked again and again. This is because quilt keeps its own cache in
'$S/.pc', and this one survives source invalidation on do_unpack.

This is a follow-up for a56fb90dc380 and 42a513489dc6

Signed-off-by: Andriy Danylovskyy &lt;andriy.danylovskyy@streamunlimited.co=
m&gt;
---
 meta/classes-global/patch.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-global/patch.bbclass b/meta/classes-global/patch.=
bbclass
index e3157c7b18..6fcac18d9c 100644
--- a/meta/classes-global/patch.bbclass
+++ b/meta/classes-global/patch.bbclass
@@ -5,6 +5,9 @@
 # Point to an empty file so any user's custom settings don't break things
 QUILTRCFILE ?=3D "${STAGING_ETCDIR_NATIVE}/quiltrc"
=20
+# Move quilt's cache to ensure it always gets removed together with "patch=
es"
+export QUILT_PC =3D "${S}/patches/.pc"
+
</pre>
</blockquote>
<pre class=3D"moz-quote-pre">This would break all other commandline use of =
quilt without the right
environment. Sadly that is a usecase I personally use quite heavily too
:/.

Cheers,

Richard
</pre>
</blockquote>
I can't think of any patching in a recipe workdir, outside of do_patch and =
the devtool, so this wasn't taken into account. But what do I know about ot=
her people's workflows...&nbsp; &nbsp;Then another (dirtier?) option would =
be to patch quilt-native itself, setting QUILT_PC to the relative ./patches=
/.pc<br /><br />--<br />Best regards,<br />Andriy

--AJsj2nE7ENEUSq8LJw7e--

