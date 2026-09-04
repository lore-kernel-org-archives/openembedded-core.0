Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C267EC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:46:30 +0000 (UTC)
Subject: Re: [wrynose][PATCH 2/4] python3-git: fix CVE-2026-42215
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 04 Sep 2026 02:46:26 -0700
References: <20260819050808.3986732-1-dkelaiya@cisco.com> <20260819050808.3986732-2-dkelaiya@cisco.com> <DL4UM4WBEOTF.2U2FRST6PNQFF@smile.fr>
In-Reply-To: <DL4UM4WBEOTF.2U2FRST6PNQFF@smile.fr>
Message-ID: <7884.1788515186007356272@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Y4blBG0ury722bFKG3h5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245086

--Y4blBG0ury722bFKG3h5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 06:31 PM, Yoann Congal wrote:

>=20
> On Wed Aug 19, 2026 at 7:08 AM CEST, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>=20
>> This patch applies the upstream fix as referenced in [4], using all the
>> backported commits shown in [1], [2], and [3].
>>=20
>> [1] https://github.com/gitpython-developers/GitPython/commit/142195888e7=
13542189533a52cdfc333f05c3af6
>>=20
>> [2] https://github.com/gitpython-developers/GitPython/commit/9aed7cf8c20=
f69effcfcf7ebef09f312f73ab826
>>=20
>> [3] https://github.com/gitpython-developers/GitPython/commit/43d92dec468=
3568d11495956dd556161f17c3ea8
>>=20
>> [4] https://github.com/gitpython-developers/GitPython/security/advisorie=
s/GHSA-rpm5-65cw-6hj4
>>=20
>>=20
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>> .../python3-git/CVE-2026-42215_p1.patch | 60 +++++++++++++++++++
>> .../python3-git/CVE-2026-42215_p2.patch | 29 +++++++++
>> .../python3-git/CVE-2026-42215_p3.patch | 45 ++++++++++++++
>> .../python/python3-git_3.1.43.bb | 3 +
>> 4 files changed, 137 insertions(+)
>> create mode 100644
>> meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
>> create mode 100644
>> meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
>> create mode 100644
>> meta/recipes-devtools/python/python3-git/CVE-2026-42215_p3.patch
>>=20
>> diff --git
>> a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
>> b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
>> new file mode 100644
>> index 0000000000..0129250fdf
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
>> @@ -0,0 +1,60 @@
>> +From dd5d1c4ddcc5d44faf4e71bcfa338f09db2022d6 Mon Sep 17 00:00:00 2001
>> +From: w <w@mac.lan>
>> +Date: Mon, 20 Apr 2026 23:29:50 -0400
>> +Subject: [PATCH] Block unsafe underscored git kwargs / Fix for
>> + GHSA-rpm5-65cw-6hj4
>> +
>> +CVE: CVE-2026-42215
>> +Upstream-Status: Backport [ https://github.com/gitpython-developers/Git=
Python/commit/142195888e713542189533a52cdfc333f05c3af6
>> ]
>> +
>> +Backport Changes:
>> +- Omitted test/test_clone.py, test/test_git.py, and
>> + test/test_remote.py because the PyPI 3.1.43 source used by the
>> + recipe does not ship the upstream test tree.
>> +
>> +(cherry picked from commit 142195888e713542189533a52cdfc333f05c3af6)
>> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> +---
>> + git/cmd.py | 21 +++++++++++++--------
>> + 1 file changed, 13 insertions(+), 8 deletions(-)
>> +
>> [...]
>> diff --git
>> a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
>> b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
>> new file mode 100644
>> index 0000000000..4326bede07
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
>> @@ -0,0 +1,29 @@
>> +From e77461e6953a67f17ecd1808c352e6613a17345b Mon Sep 17 00:00:00 2001
>> +From: w <w@mac.lan>
>> +Date: Mon, 20 Apr 2026 23:43:59 -0400
>> +Subject: [PATCH] linter fix
>> +
>> +CVE: CVE-2026-42215
>> +Upstream-Status: Backport [ https://github.com/gitpython-developers/Git=
Python/commit/9aed7cf8c20f69effcfcf7ebef09f312f73ab826
>> ]
>> +
>> +(cherry picked from commit 9aed7cf8c20f69effcfcf7ebef09f312f73ab826)
>> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> +---
>> + git/cmd.py | 4 +---
>> + 1 file changed, 1 insertion(+), 3 deletions(-)
>> +
>> +diff --git a/git/cmd.py b/git/cmd.py
>> +index 2ecb8e66..372eac28 100644
>> +--- a/git/cmd.py
>> ++++ b/git/cmd.py
>> +@@ -729,9 +729,7 @@ class Git(metaclass=3D_GitMeta):
>> + for option in options:
>> + unsafe_option =3D
>> canonical_unsafe_options.get(cls._canonicalize_option_name(option))
>> + if unsafe_option is not None:
>> +- raise UnsafeOptionError(
>> +- f"{unsafe_option} is not allowed, use `allow_unsafe_options=3DTrue` t=
o
>> allow it."
>> +- )
>> ++ raise UnsafeOptionError(f"{unsafe_option} is not allowed, use
>> `allow_unsafe_options=3DTrue` to allow it.")
>> +
>> + class AutoInterrupt:
>> + """Process wrapper that terminates the wrapped process on finalization=
.
>=20
> Hello,
>=20
> I don't think we need this "linter fix" _p2 patch. If that works, can you
> send a v2 without it?
>=20
> Same for the scarthgap patch.
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

Hi Yoann,

Thanks for the review.

I've sent v2 patches for Wrynose [1] and Scarthgap [2] as requested.

[1] https://lists.openembedded.org/g/openembedded-core/topic/wrynose_patch_=
v2_2_4/121083416
[2] https://lists.openembedded.org/g/openembedded-core/topic/scarthgap_patc=
h_v2_2_4/121083408

Regards,
Darsh Kelaiya

--Y4blBG0ury722bFKG3h5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Sep 2, 2026 at 06:31 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Wed Aug 19, 2026 at 7:08 AM CEST, Darsh Kelaiya -X (dkelaiya=
 - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<=
br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />This =
patch applies the upstream fix as referenced in [4], using all the<br />bac=
kported commits shown in [1], [2], and [3].<br /><br />[1] <a href=3D"https=
://github.com/gitpython-developers/GitPython/commit/142195888e713542189533a=
52cdfc333f05c3af6" target=3D"_blank" rel=3D"noopener">https://github.com/gi=
tpython-developers/GitPython/commit/142195888e713542189533a52cdfc333f05c3af=
6</a><br />[2] <a href=3D"https://github.com/gitpython-developers/GitPython=
/commit/9aed7cf8c20f69effcfcf7ebef09f312f73ab826" target=3D"_blank" rel=3D"=
noopener">https://github.com/gitpython-developers/GitPython/commit/9aed7cf8=
c20f69effcfcf7ebef09f312f73ab826</a><br />[3] <a href=3D"https://github.com=
/gitpython-developers/GitPython/commit/43d92dec4683568d11495956dd556161f17c=
3ea8" target=3D"_blank" rel=3D"noopener">https://github.com/gitpython-devel=
opers/GitPython/commit/43d92dec4683568d11495956dd556161f17c3ea8</a><br />[4=
] <a href=3D"https://github.com/gitpython-developers/GitPython/security/adv=
isories/GHSA-rpm5-65cw-6hj4" target=3D"_blank" rel=3D"noopener">https://git=
hub.com/gitpython-developers/GitPython/security/advisories/GHSA-rpm5-65cw-6=
hj4</a><br /><br />Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<=
br />---<br />.../python3-git/CVE-2026-42215_p1.patch | 60 ++++++++++++++++=
+++<br />.../python3-git/CVE-2026-42215_p2.patch | 29 +++++++++<br />.../py=
thon3-git/CVE-2026-42215_p3.patch | 45 ++++++++++++++<br />.../python/pytho=
n3-git_3.1.43.bb | 3 +<br />4 files changed, 137 insertions(+)<br />create =
mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patc=
h<br />create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026=
-42215_p2.patch<br />create mode 100644 meta/recipes-devtools/python/python=
3-git/CVE-2026-42215_p3.patch<br /><br />diff --git a/meta/recipes-devtools=
/python/python3-git/CVE-2026-42215_p1.patch b/meta/recipes-devtools/python/=
python3-git/CVE-2026-42215_p1.patch<br />new file mode 100644<br />index 00=
00000000..0129250fdf<br />--- /dev/null<br />+++ b/meta/recipes-devtools/py=
thon/python3-git/CVE-2026-42215_p1.patch<br />@@ -0,0 +1,60 @@<br />+From d=
d5d1c4ddcc5d44faf4e71bcfa338f09db2022d6 Mon Sep 17 00:00:00 2001<br />+From=
: w &lt;w@mac.lan&gt;<br />+Date: Mon, 20 Apr 2026 23:29:50 -0400<br />+Sub=
ject: [PATCH] Block unsafe underscored git kwargs / Fix for<br />+ GHSA-rpm=
5-65cw-6hj4<br />+<br />+CVE: CVE-2026-42215<br />+Upstream-Status: Backpor=
t [<a href=3D"https://github.com/gitpython-developers/GitPython/commit/1421=
95888e713542189533a52cdfc333f05c3af6" target=3D"_blank" rel=3D"noopener">ht=
tps://github.com/gitpython-developers/GitPython/commit/142195888e7135421895=
33a52cdfc333f05c3af6</a>]<br />+<br />+Backport Changes:<br />+- Omitted te=
st/test_clone.py, test/test_git.py, and<br />+ test/test_remote.py because =
the PyPI 3.1.43 source used by the<br />+ recipe does not ship the upstream=
 test tree.<br />+<br />+(cherry picked from commit 142195888e713542189533a=
52cdfc333f05c3af6)<br />+Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.co=
m&gt;<br />+---<br />+ git/cmd.py | 21 +++++++++++++--------<br />+ 1 file =
changed, 13 insertions(+), 8 deletions(-)<br />+<br />[...]<br />diff --git=
 a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch b/meta/=
recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch<br />new file m=
ode 100644<br />index 0000000000..4326bede07<br />--- /dev/null<br />+++ b/=
meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch<br />@@ -0=
,0 +1,29 @@<br />+From e77461e6953a67f17ecd1808c352e6613a17345b Mon Sep 17 =
00:00:00 2001<br />+From: w &lt;w@mac.lan&gt;<br />+Date: Mon, 20 Apr 2026 =
23:43:59 -0400<br />+Subject: [PATCH] linter fix<br />+<br />+CVE: CVE-2026=
-42215<br />+Upstream-Status: Backport [<a href=3D"https://github.com/gitpy=
thon-developers/GitPython/commit/9aed7cf8c20f69effcfcf7ebef09f312f73ab826" =
target=3D"_blank" rel=3D"noopener">https://github.com/gitpython-developers/=
GitPython/commit/9aed7cf8c20f69effcfcf7ebef09f312f73ab826</a>]<br />+<br />=
+(cherry picked from commit 9aed7cf8c20f69effcfcf7ebef09f312f73ab826)<br />=
+Signed-off-by: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br />+---<br />+ g=
it/cmd.py | 4 +---<br />+ 1 file changed, 1 insertion(+), 3 deletions(-)<br=
 />+<br />+diff --git a/git/cmd.py b/git/cmd.py<br />+index 2ecb8e66..372ea=
c28 100644<br />+--- a/git/cmd.py<br />++++ b/git/cmd.py<br />+@@ -729,9 +7=
29,7 @@ class Git(metaclass=3D_GitMeta):<br />+ for option in options:<br /=
>+ unsafe_option =3D canonical_unsafe_options.get(cls._canonicalize_option_=
name(option))<br />+ if unsafe_option is not None:<br />+- raise UnsafeOpti=
onError(<br />+- f"{unsafe_option} is not allowed, use `allow_unsafe_option=
s=3DTrue` to allow it."<br />+- )<br />++ raise UnsafeOptionError(f"{unsafe=
_option} is not allowed, use `allow_unsafe_options=3DTrue` to allow it.")<b=
r />+ <br />+ class AutoInterrupt:<br />+ """Process wrapper that terminate=
s the wrapped process on finalization.</blockquote>
Hello,<br /><br />I don't think we need this "linter fix" _p2 patch. If tha=
t works, can you<br />send a v2 without it?<br /><br />Same for the scarthg=
ap patch.<br /><br />Thanks!<br />-- <br />Yoann Congal<br />Smile ECS</blo=
ckquote>
Hi Yoann,<br /><br />Thanks for the review.<br /><br />I've sent v2 patches=
 for Wrynose [1] and Scarthgap [2] as requested.<br /><br />[1] <a href=3D"=
https://lists.openembedded.org/g/openembedded-core/topic/wrynose_patch_v2_2=
_4/121083416" target=3D"_blank" rel=3D"noopener">https://lists.openembedded=
.org/g/openembedded-core/topic/wrynose_patch_v2_2_4/121083416</a><br />[2] =
<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/scarthg=
ap_patch_v2_2_4/121083408" target=3D"_blank" rel=3D"noopener">https://lists=
.openembedded.org/g/openembedded-core/topic/scarthgap_patch_v2_2_4/12108340=
8</a><br /><br />Regards,<br />Darsh Kelaiya</div>

--Y4blBG0ury722bFKG3h5--

