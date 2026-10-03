Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49136CA5FDD
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 09:05:30 +0000 (UTC)
Subject: Re: [scarthgap][PATCH v2] python3-click: fix CVE-2026-7246
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 154
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 03 Oct 2026 02:05:27 -0700
References: <20260923063627.2741697-1-dkelaiya@cisco.com> <DLU8FCHIHDV4.IM2I01UE56W8@smile.fr>
In-Reply-To: <DLU8FCHIHDV4.IM2I01UE56W8@smile.fr>
Message-ID: <1265106.1791018327706370564@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="87CufiPiVTtIlKyph7qK"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 09:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247150

--87CufiPiVTtIlKyph7qK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the review. I added python3-shell because the backported click.e=
dit() fix imports shlex to split the editor command, and OE packages shlex.=
py in python3-shell.
Without that runtime dependency, the fixed path can fail on a minimal image=
.

Click also imports shlex in master (8.5.0) and Wrynose (8.3.3). I=E2=80=99v=
e sent separate dependency patches for master [1] and Wrynose [2].

[1] https://lists.openembedded.org/g/openembedded-core/message/247148
[2] https://lists.openembedded.org/g/openembedded-core/message/247149

Best Regards,
Darsh

On Fri, Oct 2, 2026 at 02:37 PM, Yoann Congal wrote:

>=20
> On Wed Sep 23, 2026 at 8:36 AM CEST, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>=20
>> This backports the click.edit() hardening identified as the fix in
>> the public advisory [2], using upstream commit [1].
>>=20
>> Upstream follow-up commit [3] adds regression-test coverage for editor
>> command parsing and clarifies the related source comments. It does not
>> change runtime behavior or provide an additional security fix. Carry it
>> as a separate patch to preserve the upstream commit boundaries.
>>=20
>> [1] https://github.com/pallets/click/commit/b96c2601af4e01341b4d2c0db494=
ebee4aef8f42
>>=20
>> [2] https://github.com/tsigouris007/security-advisories/security/advisor=
ies/GHSA-47fr-3ffg-hgmw
>>=20
>> [3] https://github.com/pallets/click/commit/b55294797ef32e22eb41e7d9657e=
db8faefa4976
>>=20
>>=20
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>> .../CVE-2026-7246-regression.patch | 124 +++++++++++
>> .../python/python3-click/CVE-2026-7246.patch | 201 ++++++++++++++++++
>> .../python/python3-click_8.1.7.bb | 6 +-
>> 3 files changed, 330 insertions(+), 1 deletion(-)
>> create mode 100644
>> meta/recipes-devtools/python/python3-click/CVE-2026-7246-regression.patc=
h
>> create mode 100644
>> meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>>=20
>> [...]
>> diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb
>> b/meta/recipes-devtools/python/python3-click_8.1.7.bb
>> index b75d9108893..8a077f48c7c 100644
>> --- a/meta/recipes-devtools/python/python3-click_8.1.7.bb
>> +++ b/meta/recipes-devtools/python/python3-click_8.1.7.bb
>> @@ -12,7 +12,10 @@ SRC_URI[sha256sum] =3D
>> "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b
>>=20
>> inherit pypi setuptools3 ptest
>>=20
>> -SRC_URI +=3D "file://run-ptest"
>> +SRC_URI +=3D "file://run-ptest \
>> + file://CVE-2026-7246.patch \
>> + file://CVE-2026-7246-regression.patch \
>> + "
>>=20
>> CVE_PRODUCT =3D "palletsprojects:click"
>>=20
>> @@ -36,6 +39,7 @@ CLEANBROKEN =3D "1"
>> RDEPENDS:${PN} +=3D "\
>> python3-io \
>> python3-threading \
>=20
> Hello,
>=20
>=20
>> + python3-shell \
>=20
> Why was this added? master does not have this RDEPENDS. If that is an
> issue to fix, then it should go through master (and other stables)
> first.
>=20
>=20
>> "
>>=20
>> BBCLASSEXTEND =3D "native nativesdk"
>=20
> FYI, the rest of the patch looks good to me. I've not found convincing
> reason to ignore the CVE. So the fix is the way forward.
>=20
> Regards,
> --
> Yoann Congal
> Smile ECS

--87CufiPiVTtIlKyph7qK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,<br /><br />Thanks for the review. I added python3-shell beca=
use the backported click.edit() fix imports shlex to split the editor comma=
nd, and OE packages shlex.py in python3-shell.<br />Without that runtime de=
pendency, the fixed path can fail on a minimal image.</div>
<div><br />Click also imports shlex in master (8.5.0) and Wrynose (8.3.3). =
I&rsquo;ve sent separate dependency patches for master [1] and Wrynose [2].=
<br /><br />[1] <a href=3D"https://lists.openembedded.org/g/openembedded-co=
re/message/247148" target=3D"_blank" rel=3D"noopener">https://lists.openemb=
edded.org/g/openembedded-core/message/247148</a><br />[2] <a href=3D"https:=
//lists.openembedded.org/g/openembedded-core/message/247149" target=3D"_bla=
nk" rel=3D"noopener">https://lists.openembedded.org/g/openembedded-core/mes=
sage/247149</a><br /><br />Best Regards,<br />Darsh<br /><br />On Fri, Oct =
2, 2026 at 02:37 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Wed Sep 23, 2026 at 8:36 AM CEST, Darsh Kelaiya -X (dkelaiya=
 - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<=
br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />This =
backports the click.edit() hardening identified as the fix in<br />the publ=
ic advisory [2], using upstream commit [1].<br /><br />Upstream follow-up c=
ommit [3] adds regression-test coverage for editor<br />command parsing and=
 clarifies the related source comments. It does not<br />change runtime beh=
avior or provide an additional security fix. Carry it<br />as a separate pa=
tch to preserve the upstream commit boundaries.<br /><br />[1] <a href=3D"h=
ttps://github.com/pallets/click/commit/b96c2601af4e01341b4d2c0db494ebee4aef=
8f42" target=3D"_blank" rel=3D"noopener">https://github.com/pallets/click/c=
ommit/b96c2601af4e01341b4d2c0db494ebee4aef8f42</a><br />[2] <a href=3D"http=
s://github.com/tsigouris007/security-advisories/security/advisories/GHSA-47=
fr-3ffg-hgmw" target=3D"_blank" rel=3D"noopener">https://github.com/tsigour=
is007/security-advisories/security/advisories/GHSA-47fr-3ffg-hgmw</a><br />=
[3] <a href=3D"https://github.com/pallets/click/commit/b55294797ef32e22eb41=
e7d9657edb8faefa4976" target=3D"_blank" rel=3D"noopener">https://github.com=
/pallets/click/commit/b55294797ef32e22eb41e7d9657edb8faefa4976</a><br /><br=
 />Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br />---<br />..=
./CVE-2026-7246-regression.patch | 124 +++++++++++<br />.../python/python3-=
click/CVE-2026-7246.patch | 201 ++++++++++++++++++<br />.../python/python3-=
click_8.1.7.bb | 6 +-<br />3 files changed, 330 insertions(+), 1 deletion(-=
)<br />create mode 100644 meta/recipes-devtools/python/python3-click/CVE-20=
26-7246-regression.patch<br />create mode 100644 meta/recipes-devtools/pyth=
on/python3-click/CVE-2026-7246.patch<br /><br />[...]<br />diff --git a/met=
a/recipes-devtools/python/python3-click_8.1.7.bb b/meta/recipes-devtools/py=
thon/python3-click_8.1.7.bb<br />index b75d9108893..8a077f48c7c 100644<br /=
>--- a/meta/recipes-devtools/python/python3-click_8.1.7.bb<br />+++ b/meta/=
recipes-devtools/python/python3-click_8.1.7.bb<br />@@ -12,7 +12,10 @@ SRC_=
URI[sha256sum] =3D "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b=
41b<br /><br />inherit pypi setuptools3 ptest<br /><br />-SRC_URI +=3D "fil=
e://run-ptest"<br />+SRC_URI +=3D "file://run-ptest \<br />+ file://CVE-202=
6-7246.patch \<br />+ file://CVE-2026-7246-regression.patch \<br />+ "<br /=
><br />CVE_PRODUCT =3D "palletsprojects:click"<br /><br />@@ -36,6 +39,7 @@=
 CLEANBROKEN =3D "1"<br />RDEPENDS:${PN} +=3D "\<br />python3-io \<br />pyt=
hon3-threading \</blockquote>
Hello,<br /><br />
<blockquote>+ python3-shell \</blockquote>
Why was this added? master does not have this RDEPENDS. If that is an<br />=
issue to fix, then it should go through master (and other stables)<br />fir=
st.<br /><br />
<blockquote>"<br /><br />BBCLASSEXTEND =3D "native nativesdk"</blockquote>
FYI, the rest of the patch looks good to me. I've not found convincing<br /=
>reason to ignore the CVE. So the fix is the way forward.<br /><br />Regard=
s,<br />-- <br />Yoann Congal<br />Smile ECS</blockquote>
</div>

--87CufiPiVTtIlKyph7qK--

