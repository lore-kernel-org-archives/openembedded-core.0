Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4CDCA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:40:05 +0000 (UTC)
Subject: Re: [scarthgap][PATCH 1/6] curl: Fix CVE-2026-8286
To: openembedded-core@lists.openembedded.org
From: "Devansh Patel" <devanshp@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 154
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 07 Oct 2026 04:39:55 -0700
References: <20260904090007.27374-1-devanshp@cisco.com> <DLICCNG5E097.3K1S7KX9M5QVE@smile.fr>
In-Reply-To: <DLICCNG5E097.3K1S7KX9M5QVE@smile.fr>
Message-ID: <1690975.1791373195261402163@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="U14B4wZf8HODOtm8kJmh"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 11:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247396

--U14B4wZf8HODOtm8kJmh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the review. I regenerated the patches and also adapted few CVE_S=
TATUSES from Wrynose,
sent a new fresh v1 series combining CVEs with Deepak's two fixes for CVE-2=
026-6429 & CVE-2026-7168 :

New Series: https://patchwork.yoctoproject.org/project/oe-core/list/?series=
=3D51870

The series applies to Scarthgap and curl 8.7.1. Please consider my earlier =
six-patch series superseded.

Regards,
Devansh

On Fri, Sep 18, 2026 at 03:10 PM, Yoann Congal wrote:

>=20
> On Fri Sep 4, 2026 at 11:00 AM CEST, Devansh Patel via
> lists.openembedded.org wrote:
>=20
>> From: Devansh Patel <devanshp@cisco.com>
>>=20
>> This patch applies the upstream fix as referenced in [2], using the
>> commit shown in [1].
>>=20
>> [1] https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de=
8319ad16
>>=20
>> [2] https://curl.se/docs/CVE-2026-8286.html
>>=20
>> Signed-off-by: Devansh Patel <devanshp@cisco.com>
>> ---
>> .../curl/curl/CVE-2026-8286.patch | 60 +++++++++++++++++++
>> meta/recipes-support/curl/curl_8.7.1.bb | 1 +
>> 2 files changed, 61 insertions(+)
>> create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch
>>=20
>> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8286.patch
>> b/meta/recipes-support/curl/curl/CVE-2026-8286.patch
>> new file mode 100644
>> index 0000000000..ec2f6165c3
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2026-8286.patch
>> @@ -0,0 +1,60 @@
>> +From 471592386ff977dfd3e2de107b8f81dfc1d3d030 Mon Sep 17 00:00:00 2001
>> +From: Stefan Eissing <stefan@eissing.org>
>> +Date: Thu, 7 May 2026 10:30:07 +0200
>> +Subject: [PATCH] url: fix connection reuse for starttls protocols
>> +
>> +When a connection is tested for reuse in a transfer that *may* upgrade
>> +to TLS (commonly via STARTTLS), the SSL configuration must match the
>> +existing connection.
>> +
>> +Reported-by: Andrew Nesbit
>> +Closes #21522
>> +
>> +CVE: CVE-2026-8286
>> +Upstream-Status: Backport [ https://github.com/curl/curl/commit/a86efdd=
7ca5433de9231e650f18247de8319ad16
>> ]
>> +
>> +Backport Changes:
>> +- curl 8.7.1 predates the url_conn_match refactor. Carry the upstream
>> may-TLS
>> + and require-TLS distinction in ConnectionExists() and preserve the
>> upstream
>> + TLS configuration matching behavior.
>> +
>> +(cherry picked from commit a86efdd7ca5433de9231e650f18247de8319ad16)
>> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
>> +---
>> + lib/url.c | 9 +++++----
>> + 1 file changed, 5 insertions(+), 4 deletions(-)
>> +
>=20
> Hello,
>=20
> This patch and the other ones in the series have formating issues:
>=20
>=20
>> +diff --git a/lib/url.c b/lib/url.c
>> +index dfcd6f4841..9e1ca0336c 100644
>> +--- a/lib/url.c
>> ++++ b/lib/url.c
>> +@@ -935,7 +935,8 @@ ConnectionExists(struct Curl_easy *data,
>> + /* plain HTTP with upgrade */
>> + bool h2upgrade =3D (data->state.httpwant =3D=3D CURL_HTTP_VERSION_2_0)=
 &&
>> + (needle->handler->protocol & CURLPROTO_HTTP);
>> +- bool req_tls =3D data->set.use_ssl >=3D CURLUSESSL_CONTROL;
>> ++ bool require_tls =3D data->set.use_ssl >=3D CURLUSESSL_CONTROL;
>> ++ bool may_tls =3D data->set.use_ssl > CURLUSESSL_NONE;
>> +
>=20
> ^ For exemple, here it lacks a space to mark context.
>=20
> If you use interdiff to compare the upstream patch and yours, it is
> quite noticeable.
>=20
> Can you send a v2 with those fixed?
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

--U14B4wZf8HODOtm8kJmh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,<br /><br />Thanks for the review. I regenerated the patches =
and also adapted few CVE_STATUSES from Wrynose,<br />sent a new fresh v1 se=
ries combining CVEs with Deepak's two fixes for CVE-2026-6429 &amp; CVE-202=
6-7168 :<br /><br />New Series: https://patchwork.yoctoproject.org/project/=
oe-core/list/?series=3D51870<br /><br />The series applies to Scarthgap and=
 curl 8.7.1. Please consider my earlier six-patch series superseded.<br /><=
br />Regards,<br />Devansh<br /><br />On Fri, Sep 18, 2026 at 03:10 PM, Yoa=
nn Congal wrote:</div>
<div>
<blockquote>On Fri Sep 4, 2026 at 11:00 AM CEST, Devansh Patel via lists.op=
enembedded.org wrote:<br />
<blockquote>From: Devansh Patel &lt;devanshp@cisco.com&gt;<br /><br />This =
patch applies the upstream fix as referenced in [2], using the<br />commit =
shown in [1].<br /><br />[1] <a href=3D"https://github.com/curl/curl/commit=
/a86efdd7ca5433de9231e650f18247de8319ad16" target=3D"_blank" rel=3D"noopene=
r">https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319=
ad16</a><br />[2] <a href=3D"https://curl.se/docs/CVE-2026-8286.html" targe=
t=3D"_blank" rel=3D"noopener">https://curl.se/docs/CVE-2026-8286.html</a><b=
r /><br />Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br />---<=
br />.../curl/curl/CVE-2026-8286.patch | 60 +++++++++++++++++++<br />meta/r=
ecipes-support/curl/curl_8.7.1.bb | 1 +<br />2 files changed, 61 insertions=
(+)<br />create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.pa=
tch<br /><br />diff --git a/meta/recipes-support/curl/curl/CVE-2026-8286.pa=
tch b/meta/recipes-support/curl/curl/CVE-2026-8286.patch<br />new file mode=
 100644<br />index 0000000000..ec2f6165c3<br />--- /dev/null<br />+++ b/met=
a/recipes-support/curl/curl/CVE-2026-8286.patch<br />@@ -0,0 +1,60 @@<br />=
+From 471592386ff977dfd3e2de107b8f81dfc1d3d030 Mon Sep 17 00:00:00 2001<br =
/>+From: Stefan Eissing &lt;stefan@eissing.org&gt;<br />+Date: Thu, 7 May 2=
026 10:30:07 +0200<br />+Subject: [PATCH] url: fix connection reuse for sta=
rttls protocols<br />+<br />+When a connection is tested for reuse in a tra=
nsfer that *may* upgrade<br />+to TLS (commonly via STARTTLS), the SSL conf=
iguration must match the<br />+existing connection.<br />+<br />+Reported-b=
y: Andrew Nesbit<br />+Closes #21522<br />+<br />+CVE: CVE-2026-8286<br />+=
Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/commit/a=
86efdd7ca5433de9231e650f18247de8319ad16" target=3D"_blank" rel=3D"noopener"=
>https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319ad=
16</a>]<br />+<br />+Backport Changes:<br />+- curl 8.7.1 predates the url_=
conn_match refactor. Carry the upstream may-TLS<br />+ and require-TLS dist=
inction in ConnectionExists() and preserve the upstream<br />+ TLS configur=
ation matching behavior.<br />+<br />+(cherry picked from commit a86efdd7ca=
5433de9231e650f18247de8319ad16)<br />+Signed-off-by: Devansh Patel &lt;deva=
nshp@cisco.com&gt;<br />+---<br />+ lib/url.c | 9 +++++----<br />+ 1 file c=
hanged, 5 insertions(+), 4 deletions(-)<br />+</blockquote>
Hello,<br /><br />This patch and the other ones in the series have formatin=
g issues:<br /><br />
<blockquote>+diff --git a/lib/url.c b/lib/url.c<br />+index dfcd6f4841..9e1=
ca0336c 100644<br />+--- a/lib/url.c<br />++++ b/lib/url.c<br />+@@ -935,7 =
+935,8 @@ ConnectionExists(struct Curl_easy *data,<br />+ /* plain HTTP wit=
h upgrade */<br />+ bool h2upgrade =3D (data-&gt;state.httpwant =3D=3D CURL=
_HTTP_VERSION_2_0) &amp;&amp;<br />+ (needle-&gt;handler-&gt;protocol &amp;=
 CURLPROTO_HTTP);<br />+- bool req_tls =3D data-&gt;set.use_ssl &gt;=3D CUR=
LUSESSL_CONTROL;<br />++ bool require_tls =3D data-&gt;set.use_ssl &gt;=3D =
CURLUSESSL_CONTROL;<br />++ bool may_tls =3D data-&gt;set.use_ssl &gt; CURL=
USESSL_NONE;<br />+</blockquote>
^ For exemple, here it lacks a space to mark context.<br /><br />If you use=
 interdiff to compare the upstream patch and yours, it is<br />quite notice=
able.<br /><br />Can you send a v2 with those fixed?<br /><br />Thanks!<br =
/>-- <br />Yoann Congal<br />Smile ECS</blockquote>
</div>

--U14B4wZf8HODOtm8kJmh--

