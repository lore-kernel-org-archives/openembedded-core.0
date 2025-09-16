Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F938CAC587
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 03:59:21 +0000 (UTC)
Subject: Re: [PATCH v2 5/8] debug_build.inc: allow other layers to add their own debug build configurations
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (128.224.246.2)
X-Originating-Platform: Linux Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 15 Sep 2025 20:59:17 -0700
References: <DB5PR02MB102130BB32912B2554180F776EF14A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102130BB32912B2554180F776EF14A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Message-ID: <20091.1757995157141119644@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="aRkO9dNuaBMikDCuFHJN"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 03:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223515

--aRkO9dNuaBMikDCuFHJN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 05:25 PM, Peter Kjellerstedt wrote:

>=20
>=20
>> diff --git a/meta/conf/distro/include/debug_build.inc
>> b/meta/conf/distro/include/debug_build.inc
>> index 43d5ae59d53..f594df4b107 100644
>> --- a/meta/conf/distro/include/debug_build.inc
>> +++ b/meta/conf/distro/include/debug_build.inc
>> @@ -43,3 +43,6 @@ EXTRA_OECONF:append:pn-nativesdk-debugedit =3D "
>> --disable-inlined-xxhash"
>> lcl_maybe_fortify:pn-vim =3D ""
>>=20
>> CXXFLAGS:append:pn-vulkan-validation-layers =3D " -DXXH_NO_INLINE_HINTS=
=3D1"
>> +
>> +# Allow other layers to add their own debug build configurations
>> +include_all conf/include/debug_build.inc
>=20
> I think it is a bad idea to have this file in
> conf/distro/include/debug_build.inc
> and then expect other layers to have it in conf/include/debug_build.inc.
> That is
> bound to result in confusing mistakes. However, since you said that you
> could not
> use the include_all in bitbake.conf as you got an error due to the
> conditional
> include, I took a look at it. From what I can tell, the fact that you get
> an
> error is due to a bug in include_all, where it does not behave like
> include and
> require do when it comes to empty variable expansions.
>=20
> I have sent a stack of changes to the bitbake list that corrects the
> behavior for
> include_all so it works like include and require do. With that applied,
> you should
> be able to use the include_all directly in bitbake.conf instead.

I will move it to original meta/conf/bitbake.conf,
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -830,7 +830,9 @@ include conf/licenses.conf
require conf/sanity.conf
include conf/bblock.conf

-require ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_buil=
d.inc', '', d)}
+# Allow other layers to add their own debug build configurations
+include_all ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_=
build.inc', '', d)}

But as you said, it depends on bitbake commit [1] merged, so I still keep i=
t as a standalone patch

[1] https://lists.openembedded.org/g/bitbake-devel/message/18037?p=3D%2C%2C=
%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C115265193%2Cd%253D3&d=
=3D3

//Hongxu

>=20
>=20
>> --
>> 2.34.1
>=20
>

--aRkO9dNuaBMikDCuFHJN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Sep 15, 2025 at 05:25 PM, Peter Kjellerstedt wrote:</div>
<div>
<blockquote>
<blockquote>diff --git a/meta/conf/distro/include/debug_build.inc b/meta/co=
nf/distro/include/debug_build.inc<br />index 43d5ae59d53..f594df4b107 10064=
4<br />--- a/meta/conf/distro/include/debug_build.inc<br />+++ b/meta/conf/=
distro/include/debug_build.inc<br />@@ -43,3 +43,6 @@ EXTRA_OECONF:append:p=
n-nativesdk-debugedit =3D " --disable-inlined-xxhash"<br />lcl_maybe_fortif=
y:pn-vim =3D ""<br /><br />CXXFLAGS:append:pn-vulkan-validation-layers =3D =
" -DXXH_NO_INLINE_HINTS=3D1"<br />+<br />+# Allow other layers to add their=
 own debug build configurations<br />+include_all conf/include/debug_build.=
inc</blockquote>
I think it is a bad idea to have this file in conf/distro/include/debug_bui=
ld.inc<br />and then expect other layers to have it in conf/include/debug_b=
uild.inc. That is <br />bound to result in confusing mistakes. However, sin=
ce you said that you could not <br />use the include_all in bitbake.conf as=
 you got an error due to the conditional <br />include, I took a look at it=
. From what I can tell, the fact that you get an <br />error is due to a bu=
g in include_all, where it does not behave like include and <br />require d=
o when it comes to empty variable expansions. <br /><br />I have sent a sta=
ck of changes to the bitbake list that corrects the behavior for <br />incl=
ude_all so it works like include and require do. With that applied, you sho=
uld <br />be able to use the include_all directly in bitbake.conf instead.<=
/blockquote>
I will move it to original meta/conf/bitbake.conf,</div>
<div>--- a/meta/conf/bitbake.conf<br />+++ b/meta/conf/bitbake.conf<br />@@=
 -830,7 +830,9 @@ include conf/licenses.conf<br />&nbsp;require conf/sanity=
.conf<br />&nbsp;include conf/bblock.conf<br />&nbsp;<br />-require ${@oe.u=
tils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_build.inc', '', d)}<=
br />+# Allow other layers to add their own debug build configurations<br /=
>+include_all ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug=
_build.inc', '', d)}</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>But as you said, it depends on bitbake commit [1] merged, so I still k=
eep it as a standalone patch</div>
<div>&nbsp;</div>
<div>[1] <a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/=
18037?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C1152651=
93%2Cd%253D3&amp;d=3D3" target=3D"_blank" rel=3D"noopener">https://lists.op=
enembedded.org/g/bitbake-devel/message/18037?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A=
%3ACreated%2C%2C%2C20%2C2%2C0%2C115265193%2Cd%253D3&amp;d=3D3</a></div>
<div>&nbsp;</div>
<div>//Hongxu<br />
<blockquote>
<blockquote>--<br />2.34.1</blockquote>
</blockquote>
</div>

--aRkO9dNuaBMikDCuFHJN--

