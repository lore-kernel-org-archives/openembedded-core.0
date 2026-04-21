Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD94BF8FA81
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 14:04:45 +0000 (UTC)
Subject: Re: [master] [PATCH] apt: Add CVE_PRODUCT to support product name
To: openembedded-core@lists.openembedded.org
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 147
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 21 Apr 2026 07:04:42 -0700
References: <20260421111028.2501890-1-hjadon@cisco.com> <b6875fed11ec10d190215ff3587a9553362a55a2.camel@pbarker.dev>
In-Reply-To: <b6875fed11ec10d190215ff3587a9553362a55a2.camel@pbarker.dev>
Message-ID: <988308.1776780282564546487@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="RCd2e8wMXkrv9mugY8Ab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 14:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235680

--RCd2e8wMXkrv9mugY8Ab
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks for raising this point.

The main intention of these patches is to improve CVE correlation in cases =
where the recipe name does not match the active NVD product identity proper=
ly, or where NVD has moved from an older/deprecated product string to a new=
er normalized one. In such situations, depending only on default recipe-nam=
e-based matching can lead to missed CVEs.

We have already added CVE_PRODUCT internally for multiple packages and have=
 seen better reporting because of that, which also helps improve the overal=
l security view. For example:
- abseil-cpp -> abseil:common_libraries, which results in reporting of CVE-=
2025-0838 with CVSS v3 9.8
- onig -> oniguruma_project:oniguruma, where the current DB contains multip=
le CVEs with CVSS v3 9.8 such as CVE-2017-9224 and CVE-2019-1901
- apr -> apache:portable_runtime, where the current DB contains CVE-2022-24=
96 and CVE-2022-2833, both CVSS v3 9.8

This also helps in the longer term by making SBOM-to-CVE correlation more r=
eliable and by reducing dependency on implicit recipe-name matching when th=
e upstream NVD product naming differs.

So the purpose here is not only metadata cleanup, and not only false-positi=
ve handling. The main goal is to make the mapping explicit wherever it impr=
oves correctness, avoids missed CVEs, and gives better security reporting.

Regarding deprecated CPEs, I agree that they should not be removed blindly.=
 If a deprecated CPE still carries CVEs that are relevant for the recipe ve=
rsion being considered, then it makes sense to keep that older alias along =
with the newer active one.

In the specific apt case, the older debian:apt alias is deprecated, and the=
 CVEs currently associated with that alias do not apply to apt_3.0.3. So in=
 this case the deprecated alias is not adding relevant coverage for the cur=
rent recipe version, whereas debian:advanced_package_tool is the active NVD=
 product identity. Because of that, this patch uses the new identity instea=
d of carrying the deprecated one unnecessarily.

Additionally, whenever we come across cases where the NVD CPE naming or map=
ping itself looks inconsistent or incorrect, we are also informing NVD sepa=
rately so that the source data can be corrected there as well. So these rec=
ipe-side CVE_PRODUCT updates are for improving present correlation, while t=
he underlying CPE/data-quality issues should ideally be corrected upstream =
in NVD.

I also think there is scope to improve the cve-check class itself so that i=
t can report when a deprecated CPE is being used in a recipe. That would ma=
ke such cases more visible and help maintain the mappings more cleanly.

Best regards,
Himanshu

--RCd2e8wMXkrv9mugY8Ab
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hi Paul,</div>
<div>&nbsp;</div>
<div>Thanks for raising this point.</div>
<div>&nbsp;</div>
<div>The main intention of these patches is to improve CVE correlation in c=
ases where the recipe name does not match the active NVD product identity p=
roperly, or where NVD has moved from an older/deprecated product string to =
a newer normalized one. In such situations, depending only on default recip=
e-name-based matching can lead to missed CVEs.</div>
<div>&nbsp;</div>
<div>We have already added CVE_PRODUCT internally for multiple packages and=
 have seen better reporting because of that, which also helps improve the o=
verall security view. For example:</div>
<div>- abseil-cpp -&gt; abseil:common_libraries, which results in reporting=
 of CVE-2025-0838 with CVSS v3 9.8<br />- onig -&gt; oniguruma_project:onig=
uruma, where the current DB contains multiple CVEs with CVSS v3 9.8 such as=
 CVE-2017-9224 and CVE-2019-1901<br />- apr -&gt; apache:portable_runtime, =
where the current DB contains CVE-2022-2496 and CVE-2022-2833, both CVSS v3=
 9.8</div>
<div>&nbsp;</div>
<div>This also helps in the longer term by making SBOM-to-CVE correlation m=
ore reliable and by reducing dependency on implicit recipe-name matching wh=
en the upstream NVD product naming differs.</div>
<div>&nbsp;</div>
<div>So the purpose here is not only metadata cleanup, and not only false-p=
ositive handling. The main goal is to make the mapping explicit wherever it=
 improves correctness, avoids missed CVEs, and gives better security report=
ing.</div>
<div>&nbsp;</div>
<div>Regarding deprecated CPEs, I agree that they should not be removed bli=
ndly. If a deprecated CPE still carries CVEs that are relevant for the reci=
pe version being considered, then it makes sense to keep that older alias a=
long with the newer active one.</div>
<div>&nbsp;</div>
<div>In the specific apt case, the older debian:apt alias is deprecated, an=
d the CVEs currently associated with that alias do not apply to apt_3.0.3. =
So in this case the deprecated alias is not adding relevant coverage for th=
e current recipe version, whereas debian:advanced_package_tool is the activ=
e NVD product identity. Because of that, this patch uses the new identity i=
nstead of carrying the deprecated one unnecessarily.</div>
<div>&nbsp;</div>
<div>Additionally, whenever we come across cases where the NVD CPE naming o=
r mapping itself looks inconsistent or incorrect, we are also informing NVD=
 separately so that the source data can be corrected there as well. So thes=
e recipe-side CVE_PRODUCT updates are for improving present correlation, wh=
ile the underlying CPE/data-quality issues should ideally be corrected upst=
ream in NVD.</div>
<div>&nbsp;</div>
<div>I also think there is scope to improve the cve-check class itself so t=
hat it can report when a deprecated CPE is being used in a recipe. That wou=
ld make such cases more visible and help maintain the mappings more cleanly=
.</div>
<div>&nbsp;</div>
<div>Best regards,<br />Himanshu</div>
</div>

--RCd2e8wMXkrv9mugY8Ab--

