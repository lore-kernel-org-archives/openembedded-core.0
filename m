Subject: Re: [wrynose][PATCH 0/3] acl: Security fixes
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 158
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 23 Nov 2026 23:43:12 -0800
References: <20261104055335.2080900-1-dkelaiya@cisco.com> <DMVCJFB6GMSJ.278YTTU78ZCM0@smile.fr> <882014.1794918843277220981@lists.openembedded.org>
In-Reply-To: <882014.1794918843277220981@lists.openembedded.org>
Message-ID: <1226682.1795506192826477342@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OS56xS5qtFxcfR98Jb84"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 07:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250964

--OS56xS5qtFxcfR98Jb84
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Following our discussion, I have submitted an ACL 2.4.0 upgrade for
Wrynose [1] to replace the earlier three-patch backport series.

Upgrading keeps the source aligned with an upstream release and
avoids maintaining an extensive downstream patch stack.

Therefore, I believe the upgrade is preferable for addressing
CVE-2026-54369 and CVE-2026-54370, and worth considering as an exception
for Wrynose.

[1] https://lists.openembedded.org/g/openembedded-core/message/250963

Thanks,
Darsh
On Tue, Nov 17, 2026 at 06:04 PM, Darsh Kelaiya -X (dkelaiya - E INFOCHIPS =
PRIVATE LIMITED at Cisco) wrote:

>=20
> Hi Yoann,
>=20
> Thanks for reviewing this. I haven't identified any definite breakage
> specific to upgrading to ACL 2.4.0. My original choice followed the
> usual stable-branch backport approach.
>=20
> I agree that this series already introduces substantial changes,
> including the new APIs, compatibility helpers and directory walker.
> Keeping the 2.3.2 version therefore does not necessarily provide a
> lower-risk result.
>=20
> Upstream also recommends updating these packages even on older
> distributions:
>=20
> https://www.openwall.com/lists/oss-security/2026/06/29/1#:~:text=3DYou%20=
probably%20want,org/projects/acl
>=20
>=20
> I'm happy to evaluate the 2.4.0 upgrade. That would give us a firmer
> basis for considering an upgrade exception for Wrynose.
>=20
> Regards,
> Darsh
>=20
> On Sun, Nov 15, 2026 at 05:39 AM, Yoann Congal wrote:
>=20
>> On Wed Nov 4, 2026 at 6:53 AM CET, Darsh Kelaiya -X (dkelaiya - E
>> INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:
>>=20
>>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>>=20
>>> Backport the upstream fixes for CVE-2026-54369 and CVE-2026-54370 to
>>> ACL 2.3.2.
>>>=20
>>> CVE-2026-54369 adds descriptor-relative ACL APIs so callers can control
>>> symlink traversal. CVE-2026-54370 uses those APIs to harden getfacl,
>>> setfacl, setfacl --restore and chacl against path replacement races and
>>> unsafe symlink traversal.
>>>=20
>>> Retain ACL 2.3.2 on the stable Wrynose branch and backport the security
>>> fixes with the required _at APIs and helper dependencies. This follows
>>> OE-Core's focus on security and bug fixes for stable branches [1],
>>> avoiding a general recipe upgrade to ACL 2.4.0. Existing pathname API
>>> behavior is preserved.
>>>=20
>>> The new public acl_*_at declarations conflict with private helpers
>>> using the same names in GNU tar 1.35. Patch 1 backports the upstream
>>> tar rename before patches 2 and 3 introduce and consume
>>> the new ACL APIs.
>>>=20
>>> [1] https://docs.yoctoproject.org/6.0/ref-manual/release-process.html#s=
table-release-process
>>>=20
>>>=20
>>> Darsh Kelaiya (3):
>>> tar: avoid name conflicts with new libacl APIs
>>> acl: fix CVE-2026-54369
>>> acl: fix CVE-2026-54370
>>>=20
>>> .../tar/tar/Avoid-acl_-prefix-for-functions.patch | 103 ++
>>> meta/recipes-extended/tar/tar_1.35.bb | 1 +
>>> .../attr/acl/CVE-2026-54369-dependent_p1.patch | 69 ++
>>> .../attr/acl/CVE-2026-54369-dependent_p2.patch | 200 ++++
>>> .../attr/acl/CVE-2026-54369-dependent_p3.patch | 712 +++++++++++++
>>> meta/recipes-support/attr/acl/CVE-2026-54369_p1.patch | 719 +++++++++++=
++
>>> meta/recipes-support/attr/acl/CVE-2026-54369_p2.patch | 957
>>> ++++++++++++++++++
>>> meta/recipes-support/attr/acl/CVE-2026-54369_p3.patch | 109 ++
>>> .../attr/acl/CVE-2026-54370-dependent_p1.patch | 168 +++
>>> .../attr/acl/CVE-2026-54370-dependent_p2.patch | 761 ++++++++++++++
>>> .../attr/acl/CVE-2026-54370-dependent_p3.patch | 439 ++++++++
>>> .../attr/acl/CVE-2026-54370-dependent_p4.patch | 140 +++
>>> meta/recipes-support/attr/acl/CVE-2026-54370_p1.patch | 299 ++++++
>>> meta/recipes-support/attr/acl/CVE-2026-54370_p2.patch | 403 ++++++++
>>> meta/recipes-support/attr/acl/CVE-2026-54370_p3.patch | 603 +++++++++++
>>> meta/recipes-support/attr/acl/CVE-2026-54370_p4.patch | 213 ++++
>>> meta/recipes-support/attr/acl_2.3.2.bb | 14 +
>>> 17 files changed, 5910 insertions(+)
>>> create mode 100644
>>> meta/recipes-extended/tar/tar/Avoid-acl_-prefix-for-functions.patch
>>> create mode 100644
>>> meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p1.patch
>>> create mode 100644
>>> meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p2.patch
>>> create mode 100644
>>> meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p3.patch
>>> create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p1.patc=
h
>>> create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p2.patc=
h
>>> create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p3.patc=
h
>>> create mode 100644
>>> meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p1.patch
>>> create mode 100644
>>> meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p2.patch
>>> create mode 100644
>>> meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p3.patch
>>> create mode 100644
>>> meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p4.patch
>>> create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p1.patc=
h
>>> create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p2.patc=
h
>>> create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p3.patc=
h
>>> create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p4.patc=
h
>>=20
>> Hello,
>>=20
>> This is quite a big series ("5910 insertions(+)"). Looking at it, I thin=
k
>> this might be just backporting most of the risky parts of the 2.4.0
>> upgrade, but then, we might just be better off simply upgrading to
>> 2.4.0. Do you have thoughts about that? Are there definite breakage on a
>> potential 2.4.0 upgrade?
>>=20
>> Obviously, a 2.4.0 upgrade would need serious thoughts/discussion but
>> this might be the way forward.
>>=20
>> Regards,
>> --
>> Yoann Congal
>> Smile ECS
>=20
>=20
>

--OS56xS5qtFxcfR98Jb84
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Yoann,<br /><br />Following our discussion, I have submitted an ACL=
 2.4.0 upgrade for<br />Wrynose [1] to replace the earlier three-patch back=
port series.<br /><br />Upgrading keeps the source aligned with an upstream=
 release and<br />avoids maintaining an extensive downstream patch stack.<b=
r /><br />Therefore, I believe the upgrade is preferable for addressing<br =
/>CVE-2026-54369 and CVE-2026-54370, and worth considering as an exception<=
br />for Wrynose.<br /><br />[1] <a href=3D"https://lists.openembedded.org/=
g/openembedded-core/message/250963" target=3D"_blank" rel=3D"noopener">http=
s://lists.openembedded.org/g/openembedded-core/message/250963</a>&nbsp;<br =
/><br />Thanks,<br />Darsh</div>
<div>On Tue, Nov 17, 2026 at 06:04 PM, Darsh Kelaiya -X (dkelaiya - E INFOC=
HIPS PRIVATE LIMITED at Cisco) wrote:</div>
<div>
<blockquote>
<div>Hi Yoann,<br /><br />Thanks for reviewing this. I haven't identified a=
ny definite breakage<br />specific to upgrading to ACL 2.4.0. My original c=
hoice followed the<br />usual stable-branch backport approach.<br /><br />I=
 agree that this series already introduces substantial changes,<br />includ=
ing the new APIs, compatibility helpers and directory walker.<br />Keeping =
the 2.3.2 version therefore does not necessarily provide a<br />lower-risk =
result.<br /><br />Upstream also recommends updating these packages even on=
 older<br />distributions:<br /><br /><a href=3D"https://www.openwall.com/l=
ists/oss-security/2026/06/29/1#:~:text=3DYou%20probably%20want,org/projects=
/acl" target=3D"_blank" rel=3D"noopener">https://www.openwall.com/lists/oss=
-security/2026/06/29/1#:~:text=3DYou%20probably%20want,org/projects/acl</a>=
&nbsp;<br /><br />I'm happy to evaluate the 2.4.0 upgrade. That would give =
us a firmer<br />basis for considering an upgrade exception for Wrynose.<br=
 /><br />Regards,<br />Darsh<br /><br />On Sun, Nov 15, 2026 at 05:39 AM, Y=
oann Congal wrote:</div>
<div>
<blockquote>On Wed Nov 4, 2026 at 6:53 AM CET, Darsh Kelaiya -X (dkelaiya -=
 E INFOCHIPS PRIVATE LIMITED at Cisco) via openembedded-core wrote:<br />
<blockquote>From: Darsh Kelaiya &lt;dkelaiya@cisco.com&gt;<br /><br />Backp=
ort the upstream fixes for CVE-2026-54369 and CVE-2026-54370 to<br />ACL 2.=
3.2.<br /><br />CVE-2026-54369 adds descriptor-relative ACL APIs so callers=
 can control<br />symlink traversal. CVE-2026-54370 uses those APIs to hard=
en getfacl,<br />setfacl, setfacl --restore and chacl against path replacem=
ent races and<br />unsafe symlink traversal.<br /><br />Retain ACL 2.3.2 on=
 the stable Wrynose branch and backport the security<br />fixes with the re=
quired _at APIs and helper dependencies. This follows<br />OE-Core's focus =
on security and bug fixes for stable branches [1],<br />avoiding a general =
recipe upgrade to ACL 2.4.0. Existing pathname API<br />behavior is preserv=
ed.<br /><br />The new public acl_*_at declarations conflict with private h=
elpers<br />using the same names in GNU tar 1.35. Patch 1 backports the ups=
tream<br />tar rename before patches 2 and 3 introduce and consume<br />the=
 new ACL APIs.<br /><br />[1] <a href=3D"https://docs.yoctoproject.org/6.0/=
ref-manual/release-process.html#stable-release-process" target=3D"_blank" r=
el=3D"noopener">https://docs.yoctoproject.org/6.0/ref-manual/release-proces=
s.html#stable-release-process</a><br /><br />Darsh Kelaiya (3):<br />tar: a=
void name conflicts with new libacl APIs<br />acl: fix CVE-2026-54369<br />=
acl: fix CVE-2026-54370<br /><br />.../tar/tar/Avoid-acl_-prefix-for-functi=
ons.patch | 103 ++<br />meta/recipes-extended/tar/tar_1.35.bb | 1 +<br />..=
./attr/acl/CVE-2026-54369-dependent_p1.patch | 69 ++<br />.../attr/acl/CVE-=
2026-54369-dependent_p2.patch | 200 ++++<br />.../attr/acl/CVE-2026-54369-d=
ependent_p3.patch | 712 +++++++++++++<br />meta/recipes-support/attr/acl/CV=
E-2026-54369_p1.patch | 719 +++++++++++++<br />meta/recipes-support/attr/ac=
l/CVE-2026-54369_p2.patch | 957 ++++++++++++++++++<br />meta/recipes-suppor=
t/attr/acl/CVE-2026-54369_p3.patch | 109 ++<br />.../attr/acl/CVE-2026-5437=
0-dependent_p1.patch | 168 +++<br />.../attr/acl/CVE-2026-54370-dependent_p=
2.patch | 761 ++++++++++++++<br />.../attr/acl/CVE-2026-54370-dependent_p3.=
patch | 439 ++++++++<br />.../attr/acl/CVE-2026-54370-dependent_p4.patch | =
140 +++<br />meta/recipes-support/attr/acl/CVE-2026-54370_p1.patch | 299 ++=
++++<br />meta/recipes-support/attr/acl/CVE-2026-54370_p2.patch | 403 +++++=
+++<br />meta/recipes-support/attr/acl/CVE-2026-54370_p3.patch | 603 ++++++=
+++++<br />meta/recipes-support/attr/acl/CVE-2026-54370_p4.patch | 213 ++++=
<br />meta/recipes-support/attr/acl_2.3.2.bb | 14 +<br />17 files changed, =
5910 insertions(+)<br />create mode 100644 meta/recipes-extended/tar/tar/Av=
oid-acl_-prefix-for-functions.patch<br />create mode 100644 meta/recipes-su=
pport/attr/acl/CVE-2026-54369-dependent_p1.patch<br />create mode 100644 me=
ta/recipes-support/attr/acl/CVE-2026-54369-dependent_p2.patch<br />create m=
ode 100644 meta/recipes-support/attr/acl/CVE-2026-54369-dependent_p3.patch<=
br />create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p1.pat=
ch<br />create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_p2.=
patch<br />create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54369_=
p3.patch<br />create mode 100644 meta/recipes-support/attr/acl/CVE-2026-543=
70-dependent_p1.patch<br />create mode 100644 meta/recipes-support/attr/acl=
/CVE-2026-54370-dependent_p2.patch<br />create mode 100644 meta/recipes-sup=
port/attr/acl/CVE-2026-54370-dependent_p3.patch<br />create mode 100644 met=
a/recipes-support/attr/acl/CVE-2026-54370-dependent_p4.patch<br />create mo=
de 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p1.patch<br />create=
 mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p2.patch<br />cre=
ate mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p3.patch<br />=
create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p4.patch</b=
lockquote>
Hello,<br /><br />This is quite a big series ("5910 insertions(+)"). Lookin=
g at it, I think<br />this might be just backporting most of the risky part=
s of the 2.4.0<br />upgrade, but then, we might just be better off simply u=
pgrading to<br />2.4.0. Do you have thoughts about that? Are there definite=
 breakage on a<br />potential 2.4.0 upgrade?<br /><br />Obviously, a 2.4.0 =
upgrade would need serious thoughts/discussion but<br />this might be the w=
ay forward.<br /><br />Regards,<br />-- <br />Yoann Congal<br />Smile ECS</=
blockquote>
</div>
</blockquote>
</div>

--OS56xS5qtFxcfR98Jb84--
