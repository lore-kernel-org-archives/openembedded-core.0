Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD0FCC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 07:54:21 +0000 (UTC)
Subject: Re: [scarthgap][Patch 02/11] u-boot-tools: Ignore CVE-2024-42040
To: openembedded-core@lists.openembedded.org
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 154
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 15 Oct 2026 00:54:20 -0700
References: <cover.1787731424.git.hthakar@cisco.com> <240b02378283bcfe760e1902a29fad5361fda380.1787731424.git.hthakar@cisco.com> <DLCHXHGCOH27.3OW22UEZ4WRRG@smile.fr> <DLCI03E7XIUV.244KWPU4PD674@smile.fr> <967518.1790247412147100715@lists.openembedded.org>
In-Reply-To: <967518.1790247412147100715@lists.openembedded.org>
Message-ID: <2269369.1792050860134896226@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="iDmnAovzKaYxzHbE3rpt"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 07:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247868

--iDmnAovzKaYxzHbE3rpt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 04:26 PM, Hetvi Thakar -X (hthakar - E INFOCHIPS PR=
IVATE LIMITED at Cisco) wrote:

>=20
> On Fri, Sep 11, 2026 at 06:19 PM, Yoann Congal wrote:
>=20
>> On Fri Sep 11, 2026 at 2:46 PM CEST, Yoann Congal wrote:
>>=20
>>> On Wed Aug 26, 2026 at 10:12 AM CEST, Hetvi Thakar -X (hthakar - E
>>> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>>>=20
>>>> From: Hetvi Thakar <hthakar@cisco.com>
>>>>=20
>>>> Analysis:
>>>> - CVE-2024-42040 affects the U-Boot DHCP client in net/bootp.c [1].
>>>> - u-boot-tools uses tools-only_defconfig, where CONFIG_NET is disabled
>>>> [2].
>>>> - Hence ignore this CVE for u-boot-tools; the exclusion is
>>>> configuration-based.
>>>>=20
>>>> Reference:
>>>> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-42040
>>>> [2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/configs/tools-o=
nly_defconfig
>>>>=20
>>>>=20
>>>> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
>>>> ---
>>>> meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 2 ++
>>>> 1 file changed, 2 insertions(+)
>>>>=20
>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
>>>> b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
>>>> index 4b6d89ed4e..b5711e1f97 100644
>>>> --- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
>>>> +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
>>>> @@ -2,3 +2,5 @@ require u-boot-common.inc
>>>> require u-boot-tools.inc
>>>>=20
>>>> SRC_URI +=3D "file://CVE-2026-46728.patch"
>>>> +
>>>> +CVE_STATUS[CVE-2024-42040] =3D "not-applicable-config: DHCP client co=
de in
>>>> net/bootp.c is not built by tools-only_defconfig, which disables
>>>> CONFIG_NET."
>>>=20
>>> Hello,
>>>=20
>>> I don't think we need this because, even if the code is not compiled, i=
t
>>> has been fixed earlier in scarthgap:
>>> See 5c086db3f44 (u-boot: fix CVE-2024-42040, 2025-10-29)
>>> Same reasonning apply to other patches in this series. Can you check if
>>> we really need those?
>>>=20
>>> Thanks!
>>=20
>> In the meantime, I took 1/11 in my branch and held the rest (2-11/11).
>> Be aware of this if you send a new series.
>=20
>=20
> Hi Yoann,
>=20
> Thanks for pointing this out.
>=20
> The referenced fix was initially added in u-boot-common.inc, where
> it applied to both u-boot and u-boot-tools. It was later moved to
> u-boot.inc [1], so it now applies only to the u-boot recipe and
> not to u-boot-tools.
>=20
> u-boot-tools does not inherit u-boot.inc; it uses
> u-boot-common.inc and u-boot-tools.inc. Therefore, the existing
> CVE status is no longer applied to u-boot-tools.
>=20
> The CVE is still reported against u-boot-tools because its
> CVE_PRODUCT [2] maps to the U-Boot product. However, u-boot-tools
> uses tools-only_defconfig, where CONFIG_NET is disabled, so the
> vulnerable DHCP client code in net/bootp.c is not compiled.
>=20
> Therefore, the proposed change only adds a recipe-specific CVE status
> for u-boot-tools; it does not duplicate the source fix.
>=20
> I also noticed Peter's proposed change [3], which moves these CVE
> patches from u-boot.inc to u-boot-common.inc. Since
> u-boot-common.inc is inherited by both u-boot and u-boot-tools,
> this would cause all of those patches to be applied to u-boot-tools
> as well.
>=20
> I don't think this move is necessary, since not all of the affected
> code is built by u-boot-tools. The actual source fixes should remain
> with u-boot, where they are required. For u-boot-tools, the CVEs
> whose vulnerable code is not compiled can instead be handled with the
> appropriate CVE_STATUS entries.
>=20
> References:
> [1]
> https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3Df4ced8ff03147dd532a88cf3ce08d61fab057522
>=20
> [2]
> https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&id=
=3D9170fe393c379b9161a8843506420269f5b53e40
>=20
> [3]
> https://patchwork.yoctoproject.org/project/oe-core/patch/20260923173850.2=
1338-1-peter.marko@siemens.com/
>=20
>=20
> Regards,
> Hetvi
>=20
>> Thanks!
>> --
>> Yoann Congal
>> Smile ECS
>=20
>=20
>=20

Hi Yoann,
Any update on this?

Regards,
Hetvi

>=20
>=20
>

--iDmnAovzKaYxzHbE3rpt
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Sep 24, 2026 at 04:26 PM, Hetvi Thakar -X (hthakar - E INFOCHI=
PS PRIVATE LIMITED at Cisco) wrote:</div>
<div>
<blockquote>
<div>On Fri, Sep 11, 2026 at 06:19 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Fri Sep 11, 2026 at 2:46 PM CEST, Yoann Congal wrote:<br />
<blockquote>On Wed Aug 26, 2026 at 10:12 AM CEST, Hetvi Thakar -X (hthakar =
- E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<b=
r />
<blockquote>From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br /><br />Analysi=
s:<br />- CVE-2024-42040 affects the U-Boot DHCP client in net/bootp.c [1].=
<br />- u-boot-tools uses tools-only_defconfig, where CONFIG_NET is disable=
d<br />[2].<br />- Hence ignore this CVE for u-boot-tools; the exclusion is=
<br />configuration-based.<br /><br />Reference:<br />[1] <a href=3D"https:=
//nvd.nist.gov/vuln/detail/CVE-2024-42040" target=3D"_blank" rel=3D"noopene=
r">https://nvd.nist.gov/vuln/detail/CVE-2024-42040</a><br />[2] <a href=3D"=
https://github.com/u-boot/u-boot/blob/866ca972d6c3/configs/tools-only_defco=
nfig" target=3D"_blank" rel=3D"noopener">https://github.com/u-boot/u-boot/b=
lob/866ca972d6c3/configs/tools-only_defconfig</a><br /><br />Signed-off-by:=
 Hetvi Thakar &lt;hthakar@cisco.com&gt;<br />---<br />meta/recipes-bsp/u-bo=
ot/u-boot-tools_2024.01.bb | 2 ++<br />1 file changed, 2 insertions(+)<br /=
><br />diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/=
recipes-bsp/u-boot/u-boot-tools_2024.01.bb<br />index 4b6d89ed4e..b5711e1f9=
7 100644<br />--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb<br />++=
+ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb<br />@@ -2,3 +2,5 @@ re=
quire u-boot-common.inc<br />require u-boot-tools.inc<br /><br />SRC_URI +=
=3D "file://CVE-2026-46728.patch"<br />+<br />+CVE_STATUS[CVE-2024-42040] =
=3D "not-applicable-config: DHCP client code in net/bootp.c is not built by=
 tools-only_defconfig, which disables CONFIG_NET."</blockquote>
Hello,<br /><br />I don't think we need this because, even if the code is n=
ot compiled, it<br />has been fixed earlier in scarthgap:<br />See 5c086db3=
f44 (u-boot: fix CVE-2024-42040, 2025-10-29)<br />Same reasonning apply to =
other patches in this series. Can you check if<br />we really need those?<b=
r /><br />Thanks!</blockquote>
In the meantime, I took 1/11 in my branch and held the rest (2-11/11).<br /=
>Be aware of this if you send a new series.</blockquote>
<br />Hi Yoann,<br /><br />Thanks for pointing this out.<br /><br />The ref=
erenced fix was initially added in u-boot-common.inc, where<br />it applied=
 to both u-boot and u-boot-tools. It was later moved to<br />u-boot.inc [1]=
, so it now applies only to the u-boot recipe and<br />not to u-boot-tools.=
<br /><br />u-boot-tools does not inherit u-boot.inc; it uses<br />u-boot-c=
ommon.inc and u-boot-tools.inc. Therefore, the existing<br />CVE status is =
no longer applied to u-boot-tools.<br /><br />The CVE is still reported aga=
inst u-boot-tools because its<br />CVE_PRODUCT [2] maps to the U-Boot produ=
ct. However, u-boot-tools<br />uses tools-only_defconfig, where CONFIG_NET =
is disabled, so the<br />vulnerable DHCP client code in net/bootp.c is not =
compiled.<br /><br />Therefore, the proposed change only adds a recipe-spec=
ific CVE status<br />for u-boot-tools; it does not duplicate the source fix=
.<br /><br />I also noticed Peter's proposed change [3], which moves these =
CVE<br />patches from u-boot.inc to u-boot-common.inc. Since<br />u-boot-co=
mmon.inc is inherited by both u-boot and u-boot-tools,<br />this would caus=
e all of those patches to be applied to u-boot-tools<br />as well.<br /><br=
 />I don't think this move is necessary, since not all of the affected<br /=
>code is built by u-boot-tools. The actual source fixes should remain<br />=
with u-boot, where they are required. For u-boot-tools, the CVEs<br />whose=
 vulnerable code is not compiled can instead be handled with the<br />appro=
priate CVE_STATUS entries.<br /><br />References:<br />[1] https://git.open=
embedded.org/openembedded-core/commit/?h=3Dscarthgap&amp;id=3Df4ced8ff03147=
dd532a88cf3ce08d61fab057522<br />[2] https://git.openembedded.org/openembed=
ded-core/commit/?h=3Dscarthgap&amp;id=3D9170fe393c379b9161a8843506420269f5b=
53e40<br />[3] https://patchwork.yoctoproject.org/project/oe-core/patch/202=
60923173850.21338-1-peter.marko@siemens.com/<br /><br />Regards,<br />Hetvi=
<br />
<blockquote style=3D"padding-left: 40px;">Thanks!<br />-- <br />Yoann Conga=
l<br />Smile ECS</blockquote>
</div>
</blockquote>
<br />Hi Yoann,<br />Any update on this?<br /><br />Regards,<br />Hetvi<br =
/>
<blockquote>
<div>&nbsp;</div>
</blockquote>
</div>

--iDmnAovzKaYxzHbE3rpt--

