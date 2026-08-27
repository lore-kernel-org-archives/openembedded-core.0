Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAD2C61DC6
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 12:47:15 +0000 (UTC)
Subject: Re: [PATCH] binutils: correct CVE_PRODUCT mapping
To: openembedded-core@lists.openembedded.org
From: "Devansh Patel" <devanshp@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 05:47:07 -0700
References: <20260824110156.25702-1-devanshp@cisco.com> <82653ab103f8116bfb0a9a675cf9d7f38a92a588.camel@pbarker.dev>
In-Reply-To: <82653ab103f8116bfb0a9a675cf9d7f38a92a588.camel@pbarker.dev>
Message-ID: <2789044.1787834827643066647@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qDIxz2ckyEQa16fP238J"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 12:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244485

--qDIxz2ckyEQa16fP238J
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 02:32 PM, Paul Barker wrote:

>=20
> On Mon, 2026-08-24 at 04:01 -0700, Devansh Patel -X (devanshp - E
> INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
>=20
>> From: Devansh Patel <devanshp@cisco.com>
>>=20
>> The current "binutils" mapping generates a vendor-wildcard product
>> identity for the packaged GNU Binutils source.
>>=20
>> Use "gnu:binutils", which matches the active NVD dictionary CPE, NVD
>> configuration criteria, and CNA affected data for the Sourceware project=
.
>>=20
>> This changes the generated identity from
>> cpe:2.3:*:*:binutils:2.47:*:*:*:*:*:*:* to
>> cpe:2.3:*:gnu:binutils:2.47:*:*:*:*:*:*:*, but sbom-cve-check 1.3.3
>> with the frozen 2026-08-10 databases has no current CVE report delta.
>>=20
>> Signed-off-by: Devansh Patel <devanshp@cisco.com>
>> ---
>> meta/recipes-devtools/binutils/binutils_2.47.bb | 2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/meta/recipes-devtools/binutils/binutils_2.47.bb
>> b/meta/recipes-devtools/binutils/binutils_2.47.bb
>> index 79bcac2025..798d886614 100644
>> --- a/meta/recipes-devtools/binutils/binutils_2.47.bb
>> +++ b/meta/recipes-devtools/binutils/binutils_2.47.bb
>> @@ -1,6 +1,8 @@
>> require binutils.inc
>> require binutils-${PV}.inc
>>=20
>> +CVE_PRODUCT =3D "gnu:binutils"
>=20
> Hi,
>=20
> We have a default CVE_PRODUCT value so that we don't have to manually
> maintain mappings in every recipe. Per-recipe CVE_PRODUCT assignments
> are useful when the default mapping either misses CVEs or matches
> unrelated CVEs.
>=20
> In this case you say there is no CVE report delta between having this
> CVE_PRODUCT assignment and not having it - so is there any reason it is
> needed?
>=20
> Best regards,
>=20
> --
> Paul Barker

Hi Paul,

Thanks for the feedback. I wanted to clarify the broader intention behind t=
hese CVE_PRODUCT updates, as there are two related use cases we are trying =
to address.

CVE_PRODUCT is used for both CVE report generation and for deriving the CPE=
 identity exposed in the SPDX SBOM. The default ${BPN}-based mapping can be=
 sufficient for CVE matching when the recipe and NVD product names already =
align, which is why in some of these patches there is no immediate CVE repo=
rt delta.

However, from the SBOM perspective, product-name-only matching can still le=
ave the vendor unspecified. Since this CPE identity is exposed in the SPDX =
2.3/3.0 output and consumed by downstream security tooling, we want the SBO=
M to carry an explicit and accurate upstream component identity rather than=
 relying on an implicit vendor-wildcard mapping.

The "no CVE report delta" in these patches was therefore intended as a regr=
ession check, not as the motivation for the change: it confirms that making=
 the identity more specific does not lose currently reported CVEs.

This is also an evolution of the earlier discussion around CVE_PRODUCT [1].=
 Initially, the focus was on cases where the recipe name did not correspond=
 to the vulnerability product name and explicit mappings were needed to avo=
id missed CVEs. We are continuing that same work but also covering the seco=
nd consumer of this metadata: the SBOM. In older flows such as Scarthgap, C=
VE reporting and SPDX generation are separate consumers of the recipe metad=
ata. In Wrynose, cve-check has been replaced by sbom-cve-check, where the g=
enerated SPDX itself is used as input to the CVE analysis. So, maintaining =
an accurate component identity in the SBOM is increasingly part of the CVE =
reporting path itself.

So, the overall goal is to keep CVE_PRODUCT accurate for both purposes: com=
plete CVE correlation and an unambiguous vendor/product identity in the gen=
erated SPDX SBOM, while preserving any aliases required for valid CVE cover=
age.

[1] https://lists.openembedded.org/g/openembedded-core/topic/118935618

Best regards,
Devansh Patel

--qDIxz2ckyEQa16fP238J
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Aug 26, 2026 at 02:32 PM, Paul Barker wrote:</div>
<div>
<blockquote>On Mon, 2026-08-24 at 04:01 -0700, Devansh Patel -X (devanshp -=
 E<br />INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br />
<blockquote>From: Devansh Patel &lt;devanshp@cisco.com&gt;<br /><br />The c=
urrent "binutils" mapping generates a vendor-wildcard product<br />identity=
 for the packaged GNU Binutils source.<br /><br />Use "gnu:binutils", which=
 matches the active NVD dictionary CPE, NVD<br />configuration criteria, an=
d CNA affected data for the Sourceware project.<br /><br />This changes the=
 generated identity from<br />cpe:2.3:*:*:binutils:2.47:*:*:*:*:*:*:* to<br=
 />cpe:2.3:*:gnu:binutils:2.47:*:*:*:*:*:*:*, but sbom-cve-check 1.3.3<br /=
>with the frozen 2026-08-10 databases has no current CVE report delta.<br /=
><br />Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br />---<br =
/>meta/recipes-devtools/binutils/binutils_2.47.bb | 2 ++<br />1 file change=
d, 2 insertions(+)<br /><br />diff --git a/meta/recipes-devtools/binutils/b=
inutils_2.47.bb b/meta/recipes-devtools/binutils/binutils_2.47.bb<br />inde=
x 79bcac2025..798d886614 100644<br />--- a/meta/recipes-devtools/binutils/b=
inutils_2.47.bb<br />+++ b/meta/recipes-devtools/binutils/binutils_2.47.bb<=
br />@@ -1,6 +1,8 @@<br />require binutils.inc<br />require binutils-${PV}.=
inc<br /><br />+CVE_PRODUCT =3D "gnu:binutils"</blockquote>
Hi,<br /><br />We have a default CVE_PRODUCT value so that we don't have to=
 manually<br />maintain mappings in every recipe. Per-recipe CVE_PRODUCT as=
signments<br />are useful when the default mapping either misses CVEs or ma=
tches<br />unrelated CVEs.<br /><br />In this case you say there is no CVE =
report delta between having this<br />CVE_PRODUCT assignment and not having=
 it - so is there any reason it is<br />needed?<br /><br />Best regards,<br=
 /><br />-- <br />Paul Barker</blockquote>
</div>
<div>Hi Paul,</div>
<div><br />Thanks for the feedback. I wanted to clarify the broader intenti=
on behind these CVE_PRODUCT updates, as there are two related use cases we =
are trying to address.</div>
<div><br />CVE_PRODUCT is used for both CVE report generation and for deriv=
ing the CPE identity exposed in the SPDX SBOM. The default ${BPN}-based map=
ping can be sufficient for CVE matching when the recipe and NVD product nam=
es already align, which is why in some of these patches there is no immedia=
te CVE report delta.</div>
<div><br />However, from the SBOM perspective, product-name-only matching c=
an still leave the vendor unspecified. Since this CPE identity is exposed i=
n the SPDX 2.3/3.0 output and consumed by downstream security tooling, we w=
ant the SBOM to carry an explicit and accurate upstream component identity =
rather than relying on an implicit vendor-wildcard mapping.</div>
<div><br />The "no CVE report delta" in these patches was therefore intende=
d as a regression check, not as the motivation for the change: it confirms =
that making the identity more specific does not lose currently reported CVE=
s.</div>
<div><br />This is also an evolution of the earlier discussion around CVE_P=
RODUCT [1]. Initially, the focus was on cases where the recipe name did not=
 correspond to the vulnerability product name and explicit mappings were ne=
eded to avoid missed CVEs. We are continuing that same work but also coveri=
ng the second consumer of this metadata: the SBOM. In older flows such as S=
carthgap, CVE reporting and SPDX generation are separate consumers of the r=
ecipe metadata. In Wrynose, cve-check has been replaced by sbom-cve-check, =
where the generated SPDX itself is used as input to the CVE analysis. So, m=
aintaining an accurate component identity in the SBOM is increasingly part =
of the CVE reporting path itself.</div>
<div><br />So, the overall goal is to keep CVE_PRODUCT accurate for both pu=
rposes: complete CVE correlation and an unambiguous vendor/product identity=
 in the generated SPDX SBOM, while preserving any aliases required for vali=
d CVE coverage.</div>
<div><br />[1] <a href=3D"https://lists.openembedded.org/g/openembedded-cor=
e/topic/118935618" target=3D"_blank" rel=3D"noopener">https://lists.openemb=
edded.org/g/openembedded-core/topic/118935618</a></div>
<div><br />Best regards,<br />Devansh Patel</div>

--qDIxz2ckyEQa16fP238J--

