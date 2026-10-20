Subject: Re: [patch] python3: upgrade 3.14.7 -> 3.14.8
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 155
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 05:05:13 -0700
References: <20261008090135.1485765-1-vanusuri@mvista.com>
In-Reply-To: <20261008090135.1485765-1-vanusuri@mvista.com>
Message-ID: <2200835.1792497913489677566@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="dNrzJJZBDlu5BeMAZ5eK"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 12:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248274

--dNrzJJZBDlu5BeMAZ5eK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Vijay, Ross,

I reviewed the 3.14.8 upgrade. The downloaded source tarball=E2=80=99s SHA-=
256 matches the recipe, and the retained source patches apply without fuzz.

Following Ross=E2=80=99s upstream report [1], I inspected libedit=E2=80=99s=
 history append path. append_history() opens the file with fopen(filename, =
"a"), and history_save_fp() writes the _HiStOrY_V2_ header whenever ftell()=
 returns zero.

If the append stream initially reports offset zero on musl, this would caus=
e another header to be appended to an existing history file. That is consis=
tent with the reported result where the header appears as a history entry a=
fter truncation.

This suggests a history handling issue that needs investigation before deci=
ding whether a test skip is appropriate. Could you check whether explicitly=
 positioning the append stream at EOF before saving resolves the failure, a=
nd share the result in the upstream issue?

This analysis is based on source inspection. I have not independently repro=
duced the musl failure.

[1] https://github.com/python/cpython/issues/159424

Thanks,
Darsh

On Thu, Oct 8, 2026 at 02:31 PM, Vijay Anusuri wrote:

>=20
> Release information:
> * https://www.python.org/downloads/release/python-3148/
> * Python 3.14.8 is an expedited security release and the eighth
> maintenance release of 3.14, containing around 354 bugfixes, build
> improvements and documentation changes from 142 contributors since 3.14.7=
.
>=20
>=20
> Handles CVE-2026-19445 CVE-2026-19553 CVE-2026-19672 CVE-2026-15310
> CVE-2026-15806 CVE-2026-17084
>=20
> Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-14-=
8-final
>=20
>=20
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
> .../python/{python3_3.14.7.bb =3D> python3_3.14.8.bb} | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D>
> python3_3.14.8.bb} (99%)
>=20
> diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb
> b/meta/recipes-devtools/python/python3_3.14.8.bb
> similarity index 99%
> rename from meta/recipes-devtools/python/python3_3.14.7.bb
> rename to meta/recipes-devtools/python/python3_3.14.8.bb
> index f917edebd8..4663ee85cd 100644
> --- a/meta/recipes-devtools/python/python3_3.14.7.bb
> +++ b/meta/recipes-devtools/python/python3_3.14.8.bb
> @@ -30,7 +30,7 @@ SRC_URI:append:class-native =3D " \
> file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
> "
>=20
> -SRC_URI[sha256sum] =3D
> "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"
> +SRC_URI[sha256sum] =3D
> "c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73"
>=20
> # exclude pre-releases for both python 2.x and 3.x
> UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> --
> 2.43.0

--dNrzJJZBDlu5BeMAZ5eK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Vijay, Ross,<br /><br />I reviewed the 3.14.8 upgrade. The downl=
oaded source tarball&rsquo;s SHA-256 matches the recipe, and the retained s=
ource patches apply without fuzz.<br /><br />Following Ross&rsquo;s upstrea=
m report [1], I inspected libedit&rsquo;s history append path. append_histo=
ry() opens the file with fopen(filename, "a"), and history_save_fp() writes=
 the _HiStOrY_V2_ header whenever ftell() returns zero.<br /><br />If the a=
ppend stream initially reports offset zero on musl, this would cause anothe=
r header to be appended to an existing history file. That is consistent wit=
h the reported result where the header appears as a history entry after tru=
ncation.<br /><br />This suggests a history handling issue that needs inves=
tigation before deciding whether a test skip is appropriate. Could you chec=
k whether explicitly positioning the append stream at EOF before saving res=
olves the failure, and share the result in the upstream issue?</div>
<div>&nbsp;</div>
<div>This analysis is based on source inspection. I have not independently =
reproduced the musl failure.</div>
<div><br />[1] <a href=3D"https://github.com/python/cpython/issues/159424" =
target=3D"_blank" rel=3D"noopener">https://github.com/python/cpython/issues=
/159424</a><br /><br />Thanks,<br />Darsh</div>
<div>&nbsp;</div>
<div>On Thu, Oct 8, 2026 at 02:31 PM, Vijay Anusuri wrote:</div>
<div>
<blockquote>Release information:<br />* <a href=3D"https://www.python.org/d=
ownloads/release/python-3148/" target=3D"_blank" rel=3D"noopener">https://w=
ww.python.org/downloads/release/python-3148/</a><br />* Python 3.14.8 is an=
 expedited security release and the eighth maintenance release of 3.14, con=
taining around 354 bugfixes, build improvements and documentation changes f=
rom 142 contributors since 3.14.7.<br /><br />Handles CVE-2026-19445 CVE-20=
26-19553 CVE-2026-19672 CVE-2026-15310<br />CVE-2026-15806 CVE-2026-17084<b=
r /><br />Changelog: <a href=3D"https://docs.python.org/3/whatsnew/changelo=
g.html#python-3-14-8-final" target=3D"_blank" rel=3D"noopener">https://docs=
.python.org/3/whatsnew/changelog.html#python-3-14-8-final</a><br /><br />Si=
gned-off-by: Vijay Anusuri &lt;vanusuri@mvista.com&gt;<br />---<br />.../py=
thon/{python3_3.14.7.bb =3D&gt; python3_3.14.8.bb} | 2 +-<br />1 file chang=
ed, 1 insertion(+), 1 deletion(-)<br />rename meta/recipes-devtools/python/=
{python3_3.14.7.bb =3D&gt; python3_3.14.8.bb} (99%)<br /><br />diff --git a=
/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-devtools/pyt=
hon/python3_3.14.8.bb<br />similarity index 99%<br />rename from meta/recip=
es-devtools/python/python3_3.14.7.bb<br />rename to meta/recipes-devtools/p=
ython/python3_3.14.8.bb<br />index f917edebd8..4663ee85cd 100644<br />--- a=
/meta/recipes-devtools/python/python3_3.14.7.bb<br />+++ b/meta/recipes-dev=
tools/python/python3_3.14.8.bb<br />@@ -30,7 +30,7 @@ SRC_URI:append:class-=
native =3D " \<br />file://0001-Lib-sysconfig.py-use-prefix-value-from-buil=
d-configu.patch \<br />"<br /><br />-SRC_URI[sha256sum] =3D "3b48dac8fb59f6=
2eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"<br />+SRC_URI[sha256sum=
] =3D "c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73"<br=
 /><br /># exclude pre-releases for both python 2.x and 3.x<br />UPSTREAM_C=
HECK_REGEX =3D "[Pp]ython-(?P&lt;pver&gt;\d+(\.\d+)+).tar"<br />-- <br />2.=
43.0</blockquote>
</div>

--dNrzJJZBDlu5BeMAZ5eK--
