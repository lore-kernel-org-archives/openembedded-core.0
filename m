Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A398C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 09:26:34 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] python3-click: fix CVE-2026-7246
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 07 Sep 2026 02:26:32 -0700
References: <20260821163206.882233-1-dkelaiya@cisco.com> <DL7RKML5YEK6.3MVF0E1O685WB@smile.fr>
In-Reply-To: <DL7RKML5YEK6.3MVF0E1O685WB@smile.fr>
Message-ID: <199240.1788773192713715859@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="4D6Fnjsn2E4opAndR1bZ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 09:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245242

--4D6Fnjsn2E4opAndR1bZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 04:46 AM, Yoann Congal wrote:

>=20
> On Fri Aug 21, 2026 at 6:32 PM CEST, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>=20
>> This patch applies the upstream fix for CVE-2026-7246 as referenced
>> in [2], using the upstream commit identified in [1].
>>=20
>> The backport also adapts editor regression tests from the upstream
>> test and documentation follow-up identified in [3]. This follow-up
>> does not contain an additional production security fix.
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
>> .../python/python3-click/CVE-2026-7246.patch | 245 ++++++++++++++++++
>> .../python/python3-click_8.1.7.bb | 5 +-
>> 2 files changed, 249 insertions(+), 1 deletion(-)
>> create mode 100644
>> meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>>=20
>> diff --git
>> a/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>> b/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>> new file mode 100644
>> index 0000000000..47ee1a551f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>> @@ -0,0 +1,245 @@
>> +From cb30f575b1a251e8698909bca2a443d41dad1824 Mon Sep 17 00:00:00 2001
>> +From: Kevin Deldycke <kevin@deldycke.com>
>> +Date: Wed, 4 Mar 2026 14:51:58 +0400
>> +Subject: [PATCH] Document and fix command string sanitizing with
>> `shlex.split`
>> +
>> +Removes last use of `shell=3DTrue` use for command invokation for
>> defense-in-depth.
>> +Refs: #1026, #1477 and #2775
>> +
>> +CVE: CVE-2026-7246
>> +Upstream-Status: Backport [ https://github.com/pallets/click/commit/b96=
c2601af4e01341b4d2c0db494ebee4aef8f42
>> ]
>> +
>> +Backport Changes:
>> +- Click 8.1.7 uses Editor.edit_file(filename), not the newer
>> + Editor.edit_files(filenames) API. Apply the argv-list change
>> + to one filename without adding the multi-file API.
>> +- Adapt editor tests from b96c2601 and follow-up b5529479 to
>=20
> Hello,
>=20
> This commit has both b96c2601 and b5529479 squashed. Please keep
> upstream backport patches split.
>=20
> Can you send a v2 with as the CVE fix (b96c2601) and its followup
> (b5529479)?
>=20
> Thanks!
>=20
> --
> Yoann Congal
> Smile ECS

Hi Yoann,

While preparing v2, I noticed that NVD now marks CVE-2026-7246 as disputed =
and states that the Pallets Click project does not consider it a valid vuln=
erability:

https://nvd.nist.gov/vuln/detail/CVE-2026-7246

However, the published advisory identifies upstream commit b96c2601 as the =
fix:

https://github.com/tsigouris007/security-advisories/security/advisories/GHS=
A-47fr-3ffg-hgmw

Upstream describes the removal of shell=3DTrue as defense-in-depth, so I wa=
nted to confirm the preferred handling. Should I replace the backport patch=
es with a status entry such as:

CVE_STATUS[CVE-2026-7246] =3D "disputed: Pallets Click does not consider th=
is a valid vulnerability"

Or should I continue with the split v2 backport patches as hardening?

Thanks,
Darsh

--4D6Fnjsn2E4opAndR1bZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sun, Sep 6, 2026 at 04:46 AM, Yoann Congal wrote:</div>
<div>
<blockquote>On Fri Aug 21, 2026 at 6:32 PM CEST, Darsh Kelaiya -X (dkelaiya=
 - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<=
br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />This =
patch applies the upstream fix for CVE-2026-7246 as referenced<br />in [2],=
 using the upstream commit identified in [1].<br /><br />The backport also =
adapts editor regression tests from the upstream<br />test and documentatio=
n follow-up identified in [3]. This follow-up<br />does not contain an addi=
tional production security fix.<br /><br />[1] <a href=3D"https://github.co=
m/pallets/click/commit/b96c2601af4e01341b4d2c0db494ebee4aef8f42" target=3D"=
_blank" rel=3D"noopener">https://github.com/pallets/click/commit/b96c2601af=
4e01341b4d2c0db494ebee4aef8f42</a><br />[2] <a href=3D"https://github.com/t=
sigouris007/security-advisories/security/advisories/GHSA-47fr-3ffg-hgmw" ta=
rget=3D"_blank" rel=3D"noopener">https://github.com/tsigouris007/security-a=
dvisories/security/advisories/GHSA-47fr-3ffg-hgmw</a><br />[3] <a href=3D"h=
ttps://github.com/pallets/click/commit/b55294797ef32e22eb41e7d9657edb8faefa=
4976" target=3D"_blank" rel=3D"noopener">https://github.com/pallets/click/c=
ommit/b55294797ef32e22eb41e7d9657edb8faefa4976</a><br /><br />Signed-off-by=
: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br />---<br />.../python/python3=
-click/CVE-2026-7246.patch | 245 ++++++++++++++++++<br />.../python/python3=
-click_8.1.7.bb | 5 +-<br />2 files changed, 249 insertions(+), 1 deletion(=
-)<br />create mode 100644 meta/recipes-devtools/python/python3-click/CVE-2=
026-7246.patch<br /><br />diff --git a/meta/recipes-devtools/python/python3=
-click/CVE-2026-7246.patch b/meta/recipes-devtools/python/python3-click/CVE=
-2026-7246.patch<br />new file mode 100644<br />index 0000000000..47ee1a551=
f<br />--- /dev/null<br />+++ b/meta/recipes-devtools/python/python3-click/=
CVE-2026-7246.patch<br />@@ -0,0 +1,245 @@<br />+From cb30f575b1a251e869890=
9bca2a443d41dad1824 Mon Sep 17 00:00:00 2001<br />+From: Kevin Deldycke &lt=
;kevin@deldycke.com&gt;<br />+Date: Wed, 4 Mar 2026 14:51:58 +0400<br />+Su=
bject: [PATCH] Document and fix command string sanitizing with `shlex.split=
`<br />+<br />+Removes last use of `shell=3DTrue` use for command invokatio=
n for defense-in-depth.<br />+Refs: #1026, #1477 and #2775<br />+<br />+CVE=
: CVE-2026-7246<br />+Upstream-Status: Backport [<a href=3D"https://github.=
com/pallets/click/commit/b96c2601af4e01341b4d2c0db494ebee4aef8f42" target=
=3D"_blank" rel=3D"noopener">https://github.com/pallets/click/commit/b96c26=
01af4e01341b4d2c0db494ebee4aef8f42</a>]<br />+<br />+Backport Changes:<br /=
>+- Click 8.1.7 uses Editor.edit_file(filename), not the newer<br />+ Edito=
r.edit_files(filenames) API. Apply the argv-list change<br />+ to one filen=
ame without adding the multi-file API.<br />+- Adapt editor tests from b96c=
2601 and follow-up b5529479 to</blockquote>
Hello,<br /><br />This commit has both b96c2601 and b5529479 squashed. Plea=
se keep<br />upstream backport patches split.<br /><br />Can you send a v2 =
with as the CVE fix (b96c2601) and its followup<br />(b5529479)?<br /><br /=
>Thanks!<br /><br />-- <br />Yoann Congal<br />Smile ECS</blockquote>
Hi Yoann,<br /><br />While preparing v2, I noticed that NVD now marks CVE-2=
026-7246 as disputed and states that the Pallets Click project does not con=
sider it a valid vulnerability:<br /><br /><a href=3D"https://nvd.nist.gov/=
vuln/detail/CVE-2026-7246" target=3D"_blank" rel=3D"noopener">https://nvd.n=
ist.gov/vuln/detail/CVE-2026-7246</a><br /><br />However, the published adv=
isory identifies upstream commit b96c2601 as the fix:<br /><br /><a href=3D=
"https://github.com/tsigouris007/security-advisories/security/advisories/GH=
SA-47fr-3ffg-hgmw" target=3D"_blank" rel=3D"noopener">https://github.com/ts=
igouris007/security-advisories/security/advisories/GHSA-47fr-3ffg-hgmw</a><=
br /><br />Upstream describes the removal of shell=3DTrue as defense-in-dep=
th, so I wanted to confirm the preferred handling. Should I replace the bac=
kport patches with a status entry such as:<br /><br />CVE_STATUS[CVE-2026-7=
246] =3D "disputed: Pallets Click does not consider this a valid vulnerabil=
ity"<br /><br />Or should I continue with the split v2 backport patches as =
hardening?<br /><br />Thanks,<br />Darsh</div>

--4D6Fnjsn2E4opAndR1bZ--

