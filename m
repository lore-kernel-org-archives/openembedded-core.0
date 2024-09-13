Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DC7FA3724
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 07:52:39 +0000 (UTC)
Subject: Re: [PATCH] go-mod.bbclass: Set GO_MOD_CACHE_DIR
To: openembedded-core@lists.openembedded.org
From: "Christian Lindeberg" <christian.lindeberg@axis.com>
X-Originating-Location: =?UTF-8?B?THVuZCwgU2vDpW5lIENvdW50eSwgU0U=?= (195.60.68.152)
X-Originating-Platform: Linux Chrome 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 00:52:28 -0700
References: <CANPvuR=_+MNMoB6-5-0NyR+U0VS5p4A3VdXokv1Evw04=e7-+A@mail.gmail.com>
In-Reply-To: <CANPvuR=_+MNMoB6-5-0NyR+U0VS5p4A3VdXokv1Evw04=e7-+A@mail.gmail.com>
Message-ID: <14967.1726213948941593452@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="yuEmruagyHGmmYle3li9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 07:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204473

--yuEmruagyHGmmYle3li9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 07:01 PM, Jose Quaresma wrote:

>=20
> Hi Christian,
>=20
> Christian Lindeberg via lists.openembedded.org (
> http://lists.openembedded.org ) <christian.lindeberg=3D axis.com@lists.op=
enembedded.org
> > escreveu (quinta, 12/09/2024 =C3=A0(s) 15:30):
>=20
>> From: Christian Lindeberg < christian.lindeberg@axis.com >
>>=20
>> Set the GO_MOD_CACHE_DIR variable and move the location of the module
>> cache to enable the use of the go module fetchers for module
>> dependencies.
>> Also, clean out the module cache before unpacking.
>>=20
>> Signed-off-by: Christian Lindeberg < christian.lindeberg@axis.com >
>> ---
>> meta/classes-recipe/go-mod.bbclass | 8 ++++----
>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/meta/classes-recipe/go-mod.bbclass
>> b/meta/classes-recipe/go-mod.bbclass
>> index ca3a690d05..71a6712c47 100644
>> --- a/meta/classes-recipe/go-mod.bbclass
>> +++ b/meta/classes-recipe/go-mod.bbclass
>> @@ -22,9 +22,9 @@ GOBUILDFLAGS:append =3D " -modcacherw"
>>=20
>> inherit go
>>=20
>> +GO_MOD_CACHE_DIR ?=3D "${@os.path.join(os.path.basename(d.getVar('S')),
>> 'pkg/mod')}"
>> +export GOMODCACHE =3D "${@os.path.join(os.path.dirname(d.getVar('S')),
>> d.getVar('GO_MOD_CACHE_DIR'))}"
>=20
>=20
> Using the default [1] bitbake=C2=A0S =3D "${WORKDIR}/${BP}" config, I thi=
nk this
> will be equal=C2=A0to:
>=20
> GO_MOD_CACHE_DIR ?=3D "${BP}/pkg/mod"
> export GOMODCACHE =3D "${WORKDIR}/${BP}/pkg/mod"
>=20
> in the end this can be written as:
>=20
> export GOMODCACHE=C2=A0?=3D "${S}/pkg/mod"
>=20
> Is it correct or am I seeing something wrong?
>=20

Correct, I sent a new version with this and the suggestion from Peter Kjell=
erstedt.

Thanks,
Christian

>=20
>=20
> [1] https://github.com/openembedded/openembedded-core/blob/40d2fbece1c2f6=
ecf62bffa44ad37850e90268cb/meta/conf/bitbake.conf#L405C6-L405C16
>=20
>=20
> Jose
>=20
>=20
>> +do_unpack[cleandirs] +=3D "${GOMODCACHE}"
>> +
>> GO_WORKDIR ?=3D "${GO_IMPORT}"
>> do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
>> -
>> -export GOMODCACHE =3D "${B}/.mod"
>> -
>> -do_compile[cleandirs] +=3D "${B}/.mod"
>> --
>> 2.39.2
>>=20
>>=20
>>=20
>>=20
>=20
>=20
>=20
>=20
> --
> Best regards,
>=20
> Jos=C3=A9 Quaresma
>

--yuEmruagyHGmmYle3li9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Sep 12, 2024 at 07:01 PM, Jose Quaresma wrote:</div>
<div>
<blockquote>
<div dir=3D"ltr">
<div>Hi Christian,</div>
<br />
<div class=3D"gmail_quote">
<div class=3D"gmail_attr" dir=3D"ltr">Christian Lindeberg via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;christian.linde=
berg=3D<a href=3D"mailto:axis.com@lists.openembedded.org">axis.com@lists.op=
enembedded.org</a>&gt; escreveu (quinta, 12/09/2024 &agrave;(s) 15:30):</di=
v>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">From: Christian Lindeberg &l=
t;<a href=3D"mailto:christian.lindeberg@axis.com" target=3D"_blank" rel=3D"=
noopener">christian.lindeberg@axis.com</a>&gt;<br /><br />Set the GO_MOD_CA=
CHE_DIR variable and move the location of the module<br />cache to enable t=
he use of the go module fetchers for module<br />dependencies.<br />Also, c=
lean out the module cache before unpacking.<br /><br />Signed-off-by: Chris=
tian Lindeberg &lt;<a href=3D"mailto:christian.lindeberg@axis.com" target=
=3D"_blank" rel=3D"noopener">christian.lindeberg@axis.com</a>&gt;<br />---<=
br />&nbsp;meta/classes-recipe/go-mod.bbclass | 8 ++++----<br />&nbsp;1 fil=
e changed, 4 insertions(+), 4 deletions(-)<br /><br />diff --git a/meta/cla=
sses-recipe/go-mod.bbclass b/meta/classes-recipe/go-mod.bbclass<br />index =
ca3a690d05..71a6712c47 100644<br />--- a/meta/classes-recipe/go-mod.bbclass=
<br />+++ b/meta/classes-recipe/go-mod.bbclass<br />@@ -22,9 +22,9 @@ GOBUI=
LDFLAGS:append =3D " -modcacherw"<br /><br />&nbsp;inherit go<br /><br />+G=
O_MOD_CACHE_DIR ?=3D "${@os.path.join(os.path.basename(d.getVar('S')), 'pkg=
/mod')}"<br />+export GOMODCACHE =3D "${@os.path.join(os.path.dirname(d.get=
Var('S')), d.getVar('GO_MOD_CACHE_DIR'))}"</blockquote>
<div>&nbsp;</div>
<div>Using the default [1] bitbake&nbsp;S =3D "${WORKDIR}/${BP}" config, I =
think this will be equal&nbsp;to:</div>
<div>&nbsp;</div>
<div>GO_MOD_CACHE_DIR ?=3D "${BP}/pkg/mod"</div>
<div>export GOMODCACHE =3D "${WORKDIR}/${BP}/pkg/mod"</div>
<div>&nbsp;</div>
<div>in the end this can be written as:</div>
<div><br />export GOMODCACHE&nbsp;?=3D "${S}/pkg/mod"</div>
<div>
<div><br />Is it correct or am I seeing something wrong?</div>
</div>
</div>
</div>
</blockquote>
Correct, I sent a new version with this and the suggestion from Peter Kjell=
erstedt.</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Christian</div>
<div><br />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div>
<div>&nbsp;</div>
</div>
<div>[1] <a href=3D"https://github.com/openembedded/openembedded-core/blob/=
40d2fbece1c2f6ecf62bffa44ad37850e90268cb/meta/conf/bitbake.conf#L405C6-L405=
C16">https://github.com/openembedded/openembedded-core/blob/40d2fbece1c2f6e=
cf62bffa44ad37850e90268cb/meta/conf/bitbake.conf#L405C6-L405C16</a></div>
<div>&nbsp;</div>
<div>Jose</div>
<div>&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">+do_unpack[cleandirs] +=3D "=
${GOMODCACHE}"<br />+<br />&nbsp;GO_WORKDIR ?=3D "${GO_IMPORT}"<br />&nbsp;=
do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"<br />-<br />-export GOMODCAC=
HE =3D "${B}/.mod"<br />-<br />-do_compile[cleandirs] +=3D "${B}/.mod"<br /=
>-- <br />2.39.2<br /><br /><br /><br /></blockquote>
</div>
<br clear=3D"all" />
<div>&nbsp;</div>
<span class=3D"gmail_signature_prefix">-- </span><br />
<div class=3D"gmail_signature" dir=3D"ltr">
<div dir=3D"ltr">Best regards,
<div><br />Jos&eacute; Quaresma</div>
</div>
</div>
</div>
</blockquote>
</div>

--yuEmruagyHGmmYle3li9--

