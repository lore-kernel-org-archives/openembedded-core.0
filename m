Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B690FC982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 07:02:49 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] python3-click: fix CVE-2026-7246
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 153
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 23 Sep 2026 00:02:44 -0700
References: <20260821163206.882233-1-dkelaiya@cisco.com> <DL7RKML5YEK6.3MVF0E1O685WB@smile.fr> <199240.1788773192713715859@lists.openembedded.org> <DLKWKRL5UB9I.DUNGYTI0Z9Y4@smile.fr>
In-Reply-To: <DLKWKRL5UB9I.DUNGYTI0Z9Y4@smile.fr>
Message-ID: <768770.1790146964611277742@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="TMJMknA87jaG7xhqrIJS"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 07:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246452

--TMJMknA87jaG7xhqrIJS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Yoann,

Thanks for the feedback.

The upstream fix and its follow-up are kept as separate patches in v2. Sinc=
e the follow-up is small and self-contained, I have included the backport, =
as shown in [1].

For reference, the NVD record [2] documents the Pallets Click project=E2=80=
=99s position regarding the disputed CVE.

[1] https://lists.openembedded.org/g/openembedded-core/message/246451
[2] https://nvd.nist.gov/vuln/detail/cve-2026-7246

Best regards,
Darsh

On Mon, Sep 21, 2026 at 03:26 PM, Yoann Congal wrote:

>=20
> On Mon Sep 7, 2026 at 11:26 AM CEST, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> On Sun, Sep 6, 2026 at 04:46 AM, Yoann Congal wrote:
>>=20
>>=20
>>>=20
>>> On Fri Aug 21, 2026 at 6:32 PM CEST, Darsh Kelaiya -X (dkelaiya - E
>>> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>>>=20
>>>=20
>>>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>>>=20
>>>> This patch applies the upstream fix for CVE-2026-7246 as referenced
>>>> in [2], using the upstream commit identified in [1].
>>>>=20
>>>> The backport also adapts editor regression tests from the upstream
>>>> test and documentation follow-up identified in [3]. This follow-up
>>>> does not contain an additional production security fix.
>>>>=20
>>>> [1] https://github.com/pallets/click/commit/b96c2601af4e01341b4d2c0db4=
94ebee4aef8f42
>>>>=20
>>>>=20
>>>> [2] https://github.com/tsigouris007/security-advisories/security/advis=
ories/GHSA-47fr-3ffg-hgmw
>>>>=20
>>>>=20
>>>> [3] https://github.com/pallets/click/commit/b55294797ef32e22eb41e7d965=
7edb8faefa4976
>>>>=20
>>>>=20
>>>>=20
>>>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>>>> ---
>>>> .../python/python3-click/CVE-2026-7246.patch | 245 ++++++++++++++++++
>>>> .../python/python3-click_8.1.7.bb | 5 +-
>>>> 2 files changed, 249 insertions(+), 1 deletion(-)
>>>> create mode 100644
>>>> meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>>>>=20
>>>> diff --git
>>>> a/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>>>> b/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>>>> new file mode 100644
>>>> index 0000000000..47ee1a551f
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
>>>> @@ -0,0 +1,245 @@
>>>> +From cb30f575b1a251e8698909bca2a443d41dad1824 Mon Sep 17 00:00:00 200=
1
>>>> +From: Kevin Deldycke <kevin@deldycke.com>
>>>> +Date: Wed, 4 Mar 2026 14:51:58 +0400
>>>> +Subject: [PATCH] Document and fix command string sanitizing with
>>>> `shlex.split`
>>>> +
>>>> +Removes last use of `shell=3DTrue` use for command invokation for
>>>> defense-in-depth.
>>>> +Refs: #1026, #1477 and #2775
>>>> +
>>>> +CVE: CVE-2026-7246
>>>> +Upstream-Status: Backport [ https://github.com/pallets/click/commit/b=
96c2601af4e01341b4d2c0db494ebee4aef8f42
>>>>=20
>>>> ]
>>>> +
>>>> +Backport Changes:
>>>> +- Click 8.1.7 uses Editor.edit_file(filename), not the newer
>>>> + Editor.edit_files(filenames) API. Apply the argv-list change
>>>> + to one filename without adding the multi-file API.
>>>> +- Adapt editor tests from b96c2601 and follow-up b5529479 to
>>>=20
>>> Hello,
>>>=20
>>> This commit has both b96c2601 and b5529479 squashed. Please keep
>>> upstream backport patches split.
>>>=20
>>> Can you send a v2 with as the CVE fix (b96c2601) and its followup
>>> (b5529479)?
>>>=20
>>> Thanks!
>>>=20
>>> --
>>> Yoann Congal
>>> Smile ECS
>>=20
>> Hi Yoann,
>>=20
>> While preparing v2, I noticed that NVD now marks CVE-2026-7246 as disput=
ed
>> and states that the Pallets Click project does not consider it a valid
>> vulnerability:
>>=20
>> https://nvd.nist.gov/vuln/detail/CVE-2026-7246
>>=20
>> However, the published advisory identifies upstream commit b96c2601 as t=
he
>> fix:
>>=20
>> https://github.com/tsigouris007/security-advisories/security/advisories/=
GHSA-47fr-3ffg-hgmw
>>=20
>>=20
>> Upstream describes the removal of shell=3DTrue as defense-in-depth, so I
>> wanted to confirm the preferred handling. Should I replace the backport
>> patches with a status entry such as:
>>=20
>> CVE_STATUS[CVE-2026-7246] =3D "disputed: Pallets Click does not consider
>> this a valid vulnerability"
>>=20
>> Or should I continue with the split v2 backport patches as hardening?
>=20
> Hello,
>=20
> It depends on the patch complexity: If it is small and easely
> understandable let's backport it. If not, we can ignore it but I'd like
> to see the Pallets Click project reasonning for disputing it please.
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

--TMJMknA87jaG7xhqrIJS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Yoann,</div>
<div><br />Thanks for the feedback.</div>
<div>&nbsp;</div>
<div>The upstream fix and its follow-up are kept as separate patches in v2.=
 Since the follow-up is small and self-contained, I have included the backp=
ort, as shown in [1].<br /><br /></div>
<div>For reference, the NVD record [2] documents the Pallets Click project&=
rsquo;s position regarding the disputed CVE.</div>
<div>&nbsp;</div>
<div>[1] <a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/246451" target=3D"_blank" rel=3D"noopener">https://lists.openembedded.o=
rg/g/openembedded-core/message/246451</a><br />[2] <a href=3D"https://nvd.n=
ist.gov/vuln/detail/cve-2026-7246" target=3D"_blank" rel=3D"noopener">https=
://nvd.nist.gov/vuln/detail/cve-2026-7246</a><br /><br />Best regards,<br /=
>Darsh<br /><br />On Mon, Sep 21, 2026 at 03:26 PM, Yoann Congal wrote:</di=
v>
<div>
<blockquote>On Mon Sep 7, 2026 at 11:26 AM CEST, Darsh Kelaiya -X (dkelaiya=
 - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<=
br />
<blockquote>On Sun, Sep 6, 2026 at 04:46 AM, Yoann Congal wrote:<br /><br /=
>
<blockquote><br />On Fri Aug 21, 2026 at 6:32 PM CEST, Darsh Kelaiya -X (dk=
elaiya - E<br />INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.=
org wrote:<br /><br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />This =
patch applies the upstream fix for CVE-2026-7246 as referenced<br />in [2],=
 using the upstream commit identified in [1].<br /><br />The backport also =
adapts editor regression tests from the upstream<br />test and documentatio=
n follow-up identified in [3]. This follow-up<br />does not contain an addi=
tional production security fix.<br /><br />[1] <a href=3D"https://github.co=
m/pallets/click/commit/b96c2601af4e01341b4d2c0db494ebee4aef8f42" target=3D"=
_blank" rel=3D"noopener">https://github.com/pallets/click/commit/b96c2601af=
4e01341b4d2c0db494ebee4aef8f42</a><br /><br />[2] <a href=3D"https://github=
.com/tsigouris007/security-advisories/security/advisories/GHSA-47fr-3ffg-hg=
mw" target=3D"_blank" rel=3D"noopener">https://github.com/tsigouris007/secu=
rity-advisories/security/advisories/GHSA-47fr-3ffg-hgmw</a><br /><br />[3] =
<a href=3D"https://github.com/pallets/click/commit/b55294797ef32e22eb41e7d9=
657edb8faefa4976" target=3D"_blank" rel=3D"noopener">https://github.com/pal=
lets/click/commit/b55294797ef32e22eb41e7d9657edb8faefa4976</a><br /><br /><=
br />Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br />---<br />=
.../python/python3-click/CVE-2026-7246.patch | 245 ++++++++++++++++++<br />=
.../python/python3-click_8.1.7.bb | 5 +-<br />2 files changed, 249 insertio=
ns(+), 1 deletion(-)<br />create mode 100644<br />meta/recipes-devtools/pyt=
hon/python3-click/CVE-2026-7246.patch<br /><br />diff --git<br />a/meta/rec=
ipes-devtools/python/python3-click/CVE-2026-7246.patch<br />b/meta/recipes-=
devtools/python/python3-click/CVE-2026-7246.patch<br />new file mode 100644=
<br />index 0000000000..47ee1a551f<br />--- /dev/null<br />+++ b/meta/recip=
es-devtools/python/python3-click/CVE-2026-7246.patch<br />@@ -0,0 +1,245 @@=
<br />+From cb30f575b1a251e8698909bca2a443d41dad1824 Mon Sep 17 00:00:00 20=
01<br />+From: Kevin Deldycke &lt;kevin@deldycke.com&gt;<br />+Date: Wed, 4=
 Mar 2026 14:51:58 +0400<br />+Subject: [PATCH] Document and fix command st=
ring sanitizing with<br />`shlex.split`<br />+<br />+Removes last use of `s=
hell=3DTrue` use for command invokation for<br />defense-in-depth.<br />+Re=
fs: #1026, #1477 and #2775<br />+<br />+CVE: CVE-2026-7246<br />+Upstream-S=
tatus: Backport [ <a href=3D"https://github.com/pallets/click/commit/b96c26=
01af4e01341b4d2c0db494ebee4aef8f42" target=3D"_blank" rel=3D"noopener">http=
s://github.com/pallets/click/commit/b96c2601af4e01341b4d2c0db494ebee4aef8f4=
2</a><br />]<br />+<br />+Backport Changes:<br />+- Click 8.1.7 uses Editor=
.edit_file(filename), not the newer<br />+ Editor.edit_files(filenames) API=
. Apply the argv-list change<br />+ to one filename without adding the mult=
i-file API.<br />+- Adapt editor tests from b96c2601 and follow-up b5529479=
 to</blockquote>
Hello,<br /><br />This commit has both b96c2601 and b5529479 squashed. Plea=
se keep<br />upstream backport patches split.<br /><br />Can you send a v2 =
with as the CVE fix (b96c2601) and its followup<br />(b5529479)?<br /><br /=
>Thanks!<br /><br />--<br />Yoann Congal<br />Smile ECS</blockquote>
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
hardening?</blockquote>
Hello,<br /><br />It depends on the patch complexity: If it is small and ea=
sely<br />understandable let's backport it. If not, we can ignore it but I'=
d like<br />to see the Pallets Click project reasonning for disputing it pl=
ease.<br /><br />Thanks!<br />-- <br />Yoann Congal<br />Smile ECS</blockqu=
ote>
</div>

--TMJMknA87jaG7xhqrIJS--

