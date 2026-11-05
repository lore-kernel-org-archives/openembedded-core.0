Subject: Re: [wrynose][PATCH 1/2] curl: fix CVE-2026-87864
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 156
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 05 Nov 2026 02:14:13 -0800
References: <20261030085350.13089-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20261030085350.13089-1-adarsh.jagadish.kamini@est.tech>
Message-ID: <105529.1793873653631988994@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="nAXvkog6R6ct7B1fQFS2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 10:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249526

--nAXvkog6R6ct7B1fQFS2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Yoann, Adarsh,

I submitted the five-patch curl v2 series on October 23 [1] and
the twelve-patch series on November 4 [2]. I have also prepared
nine further patches on top, forming a consolidated Wrynose stack
addressing 26 additional CVEs.

These comprise 25 source fixes and a conditional CVE_STATUS change
for CVE-2026-19931. The stack builds on Jaipaul's already accepted
CVE-2026-80230 fix.

I noticed that Adarsh has submitted fixes for CVE-2026-87864,
CVE-2026-92388 and CVE-2026-92389. My twelve-patch submission
includes 87864 and 92389, while the additional nine include 92388.

Could we coordinate which versions to retain for these three CVEs?

[1] https://lists.openembedded.org/g/openembedded-core/message/248493
[2] https://lists.openembedded.org/g/openembedded-core/message/249332

Thanks,
Darsh

On Fri, Oct 30, 2026 at 02:23 PM, Adarsh Jagadish Kamini wrote:

>=20
> Backport patch to fix CVE-2026-87864.
>=20
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2026-87864
>=20
> Upstream fix:
> https://github.com/curl/curl/commit/3b547de301342b347fb3c6ea6ae797
>=20
> Tested with ptest:
> Before: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0
> After: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0
>=20
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
> .../curl/curl/CVE-2026-87864.patch | 52 +++++++++++++++++++
> meta/recipes-support/curl/curl_8.19.0.bb | 1 +
> 2 files changed, 53 insertions(+)
> create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch
>=20
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-87864.patch
> b/meta/recipes-support/curl/curl/CVE-2026-87864.patch
> new file mode 100644
> index 0000000000..01efc71c4a
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-87864.patch
> @@ -0,0 +1,52 @@
> +From ca1b787c594b2f1b2fc7227b75d2166551aca32d Mon Sep 17 00:00:00 2001
> +From: Stefan Eissing <stefan@eissing.org>
> +Date: Thu, 27 Aug 2026 09:47:53 +0200
> +Subject: [PATCH] imap: APPEND CRLF fix
> +
> +Deny an APPEND operation with CRLF conversion requested as we are unable
> +to predict the final upload size and APPEND requires us to announce it
> +before starting the upload.
> +
> +The check for unknown sizes had already been there, but the crlf
> +conversion that renders a known size unknown was not accounted for.
> +
> +Closes #22702
> +
> +CVE: CVE-2026-87864
> +Upstream-Status: Backport [ https://github.com/curl/curl/commit/3b547de3=
01342b347fb3c6ea6ae797
> ]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + lib/imap.c | 11 ++++++++---
> + 1 file changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/lib/imap.c b/lib/imap.c
> +index 0546595f89..f37568fb20 100644
> +--- a/lib/imap.c
> ++++ b/lib/imap.c
> +@@ -884,7 +884,6 @@ static CURLcode imap_perform_append(struct Curl_easy
> *data,
> + result =3D Curl_creader_set_mime(data, postp);
> + if(result)
> + return result;
> +- data->state.infilesize =3D Curl_creader_client_length(data);
> + }
> + else
> + #endif
> +@@ -894,9 +893,15 @@ static CURLcode imap_perform_append(struct Curl_eas=
y
> *data,
> + return result;
> + }
> +
> +- /* Check we know the size of the upload */
> ++ /* Check we know the size of the upload. This takes all readers
> ++ * into account. Especially crlf conversions which make the size
> ++ * unpredictable, e.g. -1. */
> ++ data->state.infilesize =3D Curl_creader_total_length(data);
> + if(data->state.infilesize < 0) {
> +- failf(data, "Cannot APPEND with unknown input file size");
> ++ if(data->set.crlf)
> ++ failf(data, "Cannot APPEND with CRLF conversion making size unknown");
> ++ else
> ++ failf(data, "Cannot APPEND with unknown input file size");
> + return CURLE_UPLOAD_FAILED;
> + }
> +
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb
> b/meta/recipes-support/curl/curl_8.19.0.bb
> index c2697d6dd8..ac25f7f156 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -39,6 +39,7 @@ SRC_URI =3D " https://curl.se/download/ ${BP}.tar.xz \
> file://CVE-2026-9546-01.patch \
> file://CVE-2026-9546-02.patch \
> file://CVE-2026-80230.patch \
> + file://CVE-2026-87864.patch \
> "
>=20
> SRC_URI:append:class-nativesdk =3D " \

--nAXvkog6R6ct7B1fQFS2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Yoann, Adarsh,<br /><br />I submitted the five-patch curl v2 ser=
ies on October 23 [1] and<br />the twelve-patch series on November 4 [2]. I=
 have also prepared<br />nine further patches on top, forming a consolidate=
d Wrynose stack<br />addressing 26 additional CVEs.<br /><br />These compri=
se 25 source fixes and a conditional CVE_STATUS change<br />for CVE-2026-19=
931. The stack builds on Jaipaul's already accepted<br />CVE-2026-80230 fix=
.</div>
<div>&nbsp;</div>
<div>I noticed that Adarsh has submitted fixes for CVE-2026-87864,<br />CVE=
-2026-92388 and CVE-2026-92389. My twelve-patch submission<br />includes 87=
864 and 92389, while the additional nine include 92388.<br /><br />Could we=
 coordinate which versions to retain for these three CVEs?<br /><br />[1] <=
a href=3D"https://lists.openembedded.org/g/openembedded-core/message/248493=
" target=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/opene=
mbedded-core/message/248493</a>&nbsp;<br />[2] <a href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/message/249332" target=3D"_blank" rel=3D"=
noopener">https://lists.openembedded.org/g/openembedded-core/message/249332=
</a>&nbsp;<br /><br />Thanks,<br />Darsh<br /><br />On Fri, Oct 30, 2026 at=
 02:23 PM, Adarsh Jagadish Kamini wrote:</div>
<div>
<blockquote>Backport patch to fix CVE-2026-87864.<br /><br />References:<br=
 /><a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-87864" target=3D"_b=
lank" rel=3D"noopener">https://nvd.nist.gov/vuln/detail/CVE-2026-87864</a><=
br /><br />Upstream fix:<br /><a href=3D"https://github.com/curl/curl/commi=
t/3b547de301342b347fb3c6ea6ae797" target=3D"_blank" rel=3D"noopener">https:=
//github.com/curl/curl/commit/3b547de301342b347fb3c6ea6ae797</a><br /><br /=
>Tested with ptest:<br />Before: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORT=
ED: 0<br />After: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0<br /><br =
/>Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech=
&gt;<br />---<br />.../curl/curl/CVE-2026-87864.patch | 52 ++++++++++++++++=
+++<br />meta/recipes-support/curl/curl_8.19.0.bb | 1 +<br />2 files change=
d, 53 insertions(+)<br />create mode 100644 meta/recipes-support/curl/curl/=
CVE-2026-87864.patch<br /><br />diff --git a/meta/recipes-support/curl/curl=
/CVE-2026-87864.patch b/meta/recipes-support/curl/curl/CVE-2026-87864.patch=
<br />new file mode 100644<br />index 0000000000..01efc71c4a<br />--- /dev/=
null<br />+++ b/meta/recipes-support/curl/curl/CVE-2026-87864.patch<br />@@=
 -0,0 +1,52 @@<br />+From ca1b787c594b2f1b2fc7227b75d2166551aca32d Mon Sep =
17 00:00:00 2001<br />+From: Stefan Eissing &lt;stefan@eissing.org&gt;<br /=
>+Date: Thu, 27 Aug 2026 09:47:53 +0200<br />+Subject: [PATCH] imap: APPEND=
 CRLF fix<br />+<br />+Deny an APPEND operation with CRLF conversion reques=
ted as we are unable<br />+to predict the final upload size and APPEND requ=
ires us to announce it<br />+before starting the upload.<br />+<br />+The c=
heck for unknown sizes had already been there, but the crlf<br />+conversio=
n that renders a known size unknown was not accounted for.<br />+<br />+Clo=
ses #22702<br />+<br />+CVE: CVE-2026-87864<br />+Upstream-Status: Backport=
 [<a href=3D"https://github.com/curl/curl/commit/3b547de301342b347fb3c6ea6a=
e797" target=3D"_blank" rel=3D"noopener">https://github.com/curl/curl/commi=
t/3b547de301342b347fb3c6ea6ae797</a>]<br />+<br />+Signed-off-by: Adarsh Ja=
gadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<br />+---<br />+ lib/=
imap.c | 11 ++++++++---<br />+ 1 file changed, 8 insertions(+), 3 deletions=
(-)<br />+<br />+diff --git a/lib/imap.c b/lib/imap.c<br />+index 0546595f8=
9..f37568fb20 100644<br />+--- a/lib/imap.c<br />++++ b/lib/imap.c<br />+@@=
 -884,7 +884,6 @@ static CURLcode imap_perform_append(struct Curl_easy *dat=
a,<br />+ result =3D Curl_creader_set_mime(data, postp);<br />+ if(result)<=
br />+ return result;<br />+- data-&gt;state.infilesize =3D Curl_creader_cl=
ient_length(data);<br />+ }<br />+ else<br />+ #endif<br />+@@ -894,9 +893,=
15 @@ static CURLcode imap_perform_append(struct Curl_easy *data,<br />+ re=
turn result;<br />+ }<br />+ <br />+- /* Check we know the size of the uplo=
ad */<br />++ /* Check we know the size of the upload. This takes all reade=
rs<br />++ * into account. Especially crlf conversions which make the size<=
br />++ * unpredictable, e.g. -1. */<br />++ data-&gt;state.infilesize =3D =
Curl_creader_total_length(data);<br />+ if(data-&gt;state.infilesize &lt; 0=
) {<br />+- failf(data, "Cannot APPEND with unknown input file size");<br /=
>++ if(data-&gt;set.crlf)<br />++ failf(data, "Cannot APPEND with CRLF conv=
ersion making size unknown");<br />++ else<br />++ failf(data, "Cannot APPE=
ND with unknown input file size");<br />+ return CURLE_UPLOAD_FAILED;<br />=
+ }<br />+ <br />diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/me=
ta/recipes-support/curl/curl_8.19.0.bb<br />index c2697d6dd8..ac25f7f156 10=
0644<br />--- a/meta/recipes-support/curl/curl_8.19.0.bb<br />+++ b/meta/re=
cipes-support/curl/curl_8.19.0.bb<br />@@ -39,6 +39,7 @@ SRC_URI =3D "<a hr=
ef=3D"https://curl.se/download/" target=3D"_blank" rel=3D"noopener">https:/=
/curl.se/download/</a>${BP}.tar.xz \<br />file://CVE-2026-9546-01.patch \<b=
r />file://CVE-2026-9546-02.patch \<br />file://CVE-2026-80230.patch \<br /=
>+ file://CVE-2026-87864.patch \<br />"<br /><br />SRC_URI:append:class-nat=
ivesdk =3D " \</blockquote>
</div>

--nAXvkog6R6ct7B1fQFS2--
