Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64A1C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 16:51:37 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.22338.1736787090321343158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 08:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YRIvbrgG;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2167141dfa1so79806365ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 08:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736787090; x=1737391890; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v/8s/bXCoT3hvaEAOubKfNH5Mf5IEJtlUf8iXry1p9U=;
        b=YRIvbrgGtZqVc+9FO25AwSoF4cyKOVZFyCfldEfXlGokMl62nYVzvSaV3X0pKvsKgf
         G52IqlzOulod9ArBwppwKmk8IzRGOUcsGNJiEIFrL9eRZkwZJg2m1fvaXDKyUsgJ0e0J
         JxwYVNpVkb8WqMnnEUsT9Hbg9+viJzza1cEtP7L5b2kKmK8KJTggkrtP7aKNspglXpsk
         V4LAl+pipAzK2MY4+P9BJBGyLoAhOxJheaXsuinOLPahXfEb9XoXTGhJjbCCzovwx6tw
         8ty7wSLlwcTtzaFuSv3r1xRVvMZj4h/tg4PYwYJ8MHqqn4/md+qvS9vzsF+2r3E9xgFj
         kL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736787090; x=1737391890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/8s/bXCoT3hvaEAOubKfNH5Mf5IEJtlUf8iXry1p9U=;
        b=uOBa1zyedj8MdDagUWt1DOFFAUPBWIT06k7uEMDJx2CSCAZWdlG6XC+y23EBzvtY2L
         Ezy6uKjXLagonrKzaD7BX1URHNk6ijukVQ9nseyzJJETHMZvNaoSU32aK7gmT8P+od3l
         aekLkPOihMupKVYhhavXBKfolIAF3CMHWHI/vzn0Jaxsff4LlpAFP/Z0pMHiqpgNwVbx
         iyzdV7xBmhdQnZx7X4SW90C/QKHTuUeXoCCiXGkx/PDqMZn/ZOpvP9Otu3d4eTsL38Ws
         RusPJn163itotzgsRWzHy4iqvW1JteHbLDIBc1B/7klZmvhuZmJxgJ8XEbljZjs2mDAV
         CNIw==
X-Gm-Message-State: AOJu0YzpzjRxHX0F0n9paELXDpXSV0P5uXWDyksepiwlex0Z6qFW9T56
	JS8s6klEFEWXQAY58nsaoXYhqY7S52bBxpWkh0dck/rRQjb1rWnc8phPrf8N5SNDH+A2cpXi5J5
	rwOW+wvcAziISet1Cs9542f2HZ4ODRw==
X-Gm-Gg: ASbGnct2AscLhH75pv37qHSh/fPoMzg+u1II9/FbRKtK7CBYg+8fagqrIEPQGd7G/ZH
	i9JLZLdo/GMq4UOoDNgaIBOmkgTClVoNVac1cEAbK
X-Google-Smtp-Source: AGHT+IE6jcgId2hH78qPLYhVqkK2HUeAU3HU7YgAuQmaf827/K3I8HPjU29v3dg0Uzv/4WUn8VDGuV06VJupI5HR0oc=
X-Received: by 2002:a17:90b:4c50:b0:2f6:e47c:1750 with SMTP id
 98e67ed59e1d1-2f6e47c182dmr7941191a91.13.1736787089562; Mon, 13 Jan 2025
 08:51:29 -0800 (PST)
MIME-Version: 1.0
References: <20250108154718.3031653-1-hongxu.jia@windriver.com> <20250108154718.3031653-3-hongxu.jia@windriver.com>
In-Reply-To: <20250108154718.3031653-3-hongxu.jia@windriver.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 13 Jan 2025 17:51:18 +0100
X-Gm-Features: AbW1kvZCKMva8vkYVE0G2j2GrIPn1ONSkI7PPsNUHXUNbs-Hb5hGXcADCYEpgkE
Message-ID: <CAApg2=QwE7Mo5rqcp_UK6X0VnS7h9Tv7AsroWpa8M2GgGVg-mw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] SPDX 3.0: add CVEs from cve-ckeck results
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, colinmca242@gmail.com, 
	JPEWhacker@gmail.com
Content-Type: multipart/alternative; boundary="0000000000008622eb062b99410a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 16:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209739

--0000000000008622eb062b99410a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Thank you for this work. Could you explain your use case, why do you
include all the entries in the image's SPDX?

I'm asking, because that SPDX file will be out of date quite rapidly,
probably in 24h. Without updating it with the new data, it can be even
misleading. How do you address this issue?

I also notice that this patch adds a dependency of SPDX on cve-check. We
have been trying to avoid this for a long time. This may be a discussion to
have.

Kind regards,
Marta

On Wed, Jan 8, 2025 at 4:47=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:

> Originally, SPDX 3.0 added CVEs from CVE patch and CVE_STATUS
> in recipe, this commit adds CVEs cve-ckeck results that is
> generated from NVD CVE database
>
> Enable it by inheriting cve_check and setting 'SPDX_INCLUDE_VEX =3D "all"=
'
> otherwise still added CVEs from CVE patch and CVE_STATUS as usual
>
> $ echo 'INHERIT +=3D "cve-check"' >> conf/local.conf
> $ echo 'SPDX_INCLUDE_VEX =3D "all"' >> conf/local.conf
> $ bitbake glibc
> WARNING: glibc-2.40+git-r0 do_cve_check: Found unpatched CVE
> (CVE-2010-4756)
>
> $ bitbake core-image-minimal
> $ vim
> tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.spdx.js=
on
> ...
>     {
>       "type": "security_VexAffectedVulnAssessmentRelationship",
>       "spdxId": "
> http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a6=
53fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vex-affected/1a=
e2a2b94bac9bf0894b46b0c3194416
> ",
>       "creationInfo": "_:CreationInfo161",
>       "from": "
> http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a6=
53fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vulnerability/C=
VE-2010-4756
> ",
>       "relationshipType": "affects",
>       "to": [
>         "
> http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a6=
53fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/package/libc6
> "
>       ],
>       "security_vexVersion": "1.0.0"
>     },
> ...
>     {
>       "type": "security_Vulnerability",
>       "spdxId": "
> http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a6=
53fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vulnerability/C=
VE-2010-4756
> ",
>       "creationInfo": "_:CreationInfo263",
>       "externalIdentifier": [
>         {
>           "type": "ExternalIdentifier",
>           "externalIdentifierType": "cve",
>           "identifier": "CVE-2010-4756",
>           "identifierLocator": [
>             "https://cveawg.mitre.org/api/cve/CVE-2010-4756",
>             "https://www.cve.org/CVERecord?id=3DCVE-2010-4756"
>           ]
>         }
>       ]
>     },
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass |  7 +++++--
>  meta/classes/spdx-common.bbclass     | 11 +++++++++++
>  meta/lib/oe/spdx30_tasks.py          | 29 ++++++++++++++++++++++++++--
>  3 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass
> b/meta/classes/create-spdx-3.0.bbclass
> index 25f3aa5f43..e3d6f95e3d 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -42,8 +42,9 @@ SPDX_INCLUDE_VEX[doc] =3D "Controls what VEX informatio=
n
> is in the output. Set to
>      'none' to disable all VEX data. Set to 'current' to only include VEX
> data \
>      for vulnerabilities not already fixed in the upstream source code \
>      (recommended). Set  to 'all' to get all known historical
> vulnerabilities, \
> -    including those already fixed upstream (warning: This can be large
> and \
> -    slow)."
> +    including those already fixed upstream, if cve_check is inherited,
> set to 'all' \
> +    to get all known historical vulnerabilities from cve check result \
> +    (warning: This can be large and slow)."
>
>  SPDX_INCLUDE_TIMESTAMPS ?=3D "0"
>  SPDX_INCLUDE_TIMESTAMPS[doc] =3D "Include time stamps in SPDX output. Th=
is
> is \
> @@ -141,6 +142,7 @@ do_create_spdx[vardeps] +=3D "\
>      SPDX_PROFILES \
>      SPDX_NAMESPACE_PREFIX \
>      SPDX_UUID_NAMESPACE \
> +    SPDX_INCLUDE_VEX \
>      "
>
>  addtask do_create_spdx after \
> @@ -164,6 +166,7 @@ do_create_spdx[cleandirs] =3D "${SPDXDEPLOY} ${SPDXWO=
RK}"
>  do_create_spdx[depends] +=3D " \
>      ${PATCHDEPENDENCY} \
>      ${@create_spdx_source_deps(d)} \
> +    ${@create_spdx_cve_check_deps(d)} \
>  "
>
>  python do_create_package_spdx() {
> diff --git a/meta/classes/spdx-common.bbclass
> b/meta/classes/spdx-common.bbclass
> index 81ad4d3b7a..8918448c35 100644
> --- a/meta/classes/spdx-common.bbclass
> +++ b/meta/classes/spdx-common.bbclass
> @@ -39,6 +39,17 @@ SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
>
>  SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
>
> +def create_spdx_cve_check_deps(d):
> +    if (
> +        d.getVar("SPDX_INCLUDE_VEX") =3D=3D "all"
> +        and bb.data.inherits_class('cve-check', d)
> +        and d.getVar("CVE_CHECK_FORMAT_JSON") =3D=3D "1"
> +    ):
> +        pn =3D d.getVar('PN')
> +        return pn + ":do_cve_check"
> +
> +    return ""
> +
>  def create_spdx_source_deps(d):
>      import oe.spdx_common
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 9baa40887b..e8658e2c32 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -437,8 +437,33 @@ def set_purposes(d, element, *var_names,
> force_purposes=3D[]):
>          getattr(oe.spdx30.software_SoftwarePurpose, p) for p in
> purposes[1:]
>      ]
>
> -def get_cves(d):
> +def get_cves(d, include_vex):
>      cve_status =3D {}
> +
> +    # Get CVEs from cve-check
> +    if (
> +        include_vex =3D=3D "all"
> +        and bb.data.inherits_class('cve-check', d)
> +        and d.getVar("CVE_CHECK_FORMAT_JSON") =3D=3D "1"
> +    ):
> +        pkgfilepath =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
> +        if os.path.exists(pkgfilepath):
> +            with open(pkgfilepath) as j:
> +                data =3D json.load(j)
> +                json_data =3D {"version":"1", "package": []}
> +                oe.cve_check.cve_check_merge_jsons(json_data, data)
> +                for issue in json_data["package"][0].get("issue", []):
> +                    cve =3D issue["id"]
> +                    cve_status[cve] =3D {
> +                        "mapping": issue["status"],
> +                        "detail": issue["detail"],
> +                        "description": issue.get("description", None)
> +                    }
> +
> +                if cve_status:
> +                    return cve_status
> +
> +    # Get CVEs from recipe
>      patched_cves =3D oe.cve_check.get_patched_cves(d)
>      for cve, patched_cve in patched_cves.items():
>          cve_status[cve] =3D {
> @@ -498,7 +523,7 @@ def create_spdx(d):
>      # Add CVEs
>      cve_by_status =3D {}
>      if include_vex !=3D "none":
> -        cve_data =3D get_cves(d)
> +        cve_data =3D get_cves(d, include_vex)
>          for cve, decoded_status in cve_data.items():
>
>              # If this CVE is fixed upstream, skip it unless all CVEs are
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209575):
> https://lists.openembedded.org/g/openembedded-core/message/209575
> Mute This Topic: https://lists.openembedded.org/mt/110498417/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008622eb062b99410a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>Thank you for this work. Could you e=
xplain your use case, why do you include all the entries in the image&#39;s=
 SPDX?</div><div><br></div><div>I&#39;m asking, because that SPDX file will=
 be out of date quite rapidly, probably in 24h. Without updating it with th=
e new data, it can be even misleading. How do you address this issue?<br></=
div><div><br></div><div>I also notice that this patch adds a dependency of =
SPDX on cve-check. We have been trying to avoid this for a long time. This =
may be a discussion to have.</div><div><br></div><div>Kind regards,</div><d=
iv>Marta<br></div></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 8, 2025 at 4:47=E2=80=
=AFPM hongxu via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windriver.com@lists.opene=
mbedded.org">eng.windriver.com@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Originally, SPDX 3.0 a=
dded CVEs from CVE patch and CVE_STATUS<br>
in recipe, this commit adds CVEs cve-ckeck results that is<br>
generated from NVD CVE database<br>
<br>
Enable it by inheriting cve_check and setting &#39;SPDX_INCLUDE_VEX =3D &qu=
ot;all&quot;&#39;<br>
otherwise still added CVEs from CVE patch and CVE_STATUS as usual<br>
<br>
$ echo &#39;INHERIT +=3D &quot;cve-check&quot;&#39; &gt;&gt; conf/local.con=
f<br>
$ echo &#39;SPDX_INCLUDE_VEX =3D &quot;all&quot;&#39; &gt;&gt; conf/local.c=
onf<br>
$ bitbake glibc<br>
WARNING: glibc-2.40+git-r0 do_cve_check: Found unpatched CVE (CVE-2010-4756=
)<br>
<br>
$ bitbake core-image-minimal<br>
$ vim tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.spd=
x.json<br>
...<br>
=C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;security_VexAffectedVulnAssess=
mentRelationship&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;spdxId&quot;: &quot;<a href=3D"http://spdx.org/s=
pdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75=
ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vex-affected/1ae2a2b94bac9bf0894b4=
6b0c3194416" rel=3D"noreferrer" target=3D"_blank">http://spdx.org/spdxdocs/=
glibc-086907e2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c=
3d0c6093c4bf8b05d1473ae4da277398/vex-affected/1ae2a2b94bac9bf0894b46b0c3194=
416</a>&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;creationInfo&quot;: &quot;_:CreationInfo161&quot=
;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;from&quot;: &quot;<a href=3D"http://spdx.org/spd=
xdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba=
8cff1c3d0c6093c4bf8b05d1473ae4da277398/vulnerability/CVE-2010-4756" rel=3D"=
noreferrer" target=3D"_blank">http://spdx.org/spdxdocs/glibc-086907e2-5516-=
5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d147=
3ae4da277398/vulnerability/CVE-2010-4756</a>&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;relationshipType&quot;: &quot;affects&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;to&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"http://spdx.org/spdxdocs/glibc=
-086907e2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6=
093c4bf8b05d1473ae4da277398/package/libc6" rel=3D"noreferrer" target=3D"_bl=
ank">http://spdx.org/spdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df=
3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/package/libc=
6</a>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ],<br>
=C2=A0 =C2=A0 =C2=A0 &quot;security_vexVersion&quot;: &quot;1.0.0&quot;<br>
=C2=A0 =C2=A0 },<br>
...<br>
=C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;security_Vulnerability&quot;,<=
br>
=C2=A0 =C2=A0 =C2=A0 &quot;spdxId&quot;: &quot;<a href=3D"http://spdx.org/s=
pdxdocs/glibc-086907e2-5516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75=
ba8cff1c3d0c6093c4bf8b05d1473ae4da277398/vulnerability/CVE-2010-4756" rel=
=3D"noreferrer" target=3D"_blank">http://spdx.org/spdxdocs/glibc-086907e2-5=
516-5638-9df3-b3863651f374/df3a653fe6624a017aa75a75ba8cff1c3d0c6093c4bf8b05=
d1473ae4da277398/vulnerability/CVE-2010-4756</a>&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;creationInfo&quot;: &quot;_:CreationInfo263&quot=
;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;externalIdentifier&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;ExternalIdentifi=
er&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;externalIdentifierType&quot;: &quo=
t;cve&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;identifier&quot;: &quot;CVE-2010-4=
756&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;identifierLocator&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://cveawg.m=
itre.org/api/cve/CVE-2010-4756" rel=3D"noreferrer" target=3D"_blank">https:=
//cveawg.mitre.org/api/cve/CVE-2010-4756</a>&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<a href=3D"https://www.cve.=
org/CVERecord?id=3DCVE-2010-4756" rel=3D"noreferrer" target=3D"_blank">http=
s://www.cve.org/CVERecord?id=3DCVE-2010-4756</a>&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 ]<br>
=C2=A0 =C2=A0 },<br>
...<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/create-spdx-3.0.bbclass |=C2=A0 7 +++++--<br>
=C2=A0meta/classes/spdx-common.bbclass=C2=A0 =C2=A0 =C2=A0| 11 +++++++++++<=
br>
=C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 29 ++=
++++++++++++++++++++++++--<br>
=C2=A03 files changed, 43 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spd=
x-3.0.bbclass<br>
index 25f3aa5f43..e3d6f95e3d 100644<br>
--- a/meta/classes/create-spdx-3.0.bbclass<br>
+++ b/meta/classes/create-spdx-3.0.bbclass<br>
@@ -42,8 +42,9 @@ SPDX_INCLUDE_VEX[doc] =3D &quot;Controls what VEX informa=
tion is in the output. Set to<br>
=C2=A0 =C2=A0 =C2=A0&#39;none&#39; to disable all VEX data. Set to &#39;cur=
rent&#39; to only include VEX data \<br>
=C2=A0 =C2=A0 =C2=A0for vulnerabilities not already fixed in the upstream s=
ource code \<br>
=C2=A0 =C2=A0 =C2=A0(recommended). Set=C2=A0 to &#39;all&#39; to get all kn=
own historical vulnerabilities, \<br>
-=C2=A0 =C2=A0 including those already fixed upstream (warning: This can be=
 large and \<br>
-=C2=A0 =C2=A0 slow).&quot;<br>
+=C2=A0 =C2=A0 including those already fixed upstream, if cve_check is inhe=
rited, set to &#39;all&#39; \<br>
+=C2=A0 =C2=A0 to get all known historical vulnerabilities from cve check r=
esult \<br>
+=C2=A0 =C2=A0 (warning: This can be large and slow).&quot;<br>
<br>
=C2=A0SPDX_INCLUDE_TIMESTAMPS ?=3D &quot;0&quot;<br>
=C2=A0SPDX_INCLUDE_TIMESTAMPS[doc] =3D &quot;Include time stamps in SPDX ou=
tput. This is \<br>
@@ -141,6 +142,7 @@ do_create_spdx[vardeps] +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0SPDX_PROFILES \<br>
=C2=A0 =C2=A0 =C2=A0SPDX_NAMESPACE_PREFIX \<br>
=C2=A0 =C2=A0 =C2=A0SPDX_UUID_NAMESPACE \<br>
+=C2=A0 =C2=A0 SPDX_INCLUDE_VEX \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0addtask do_create_spdx after \<br>
@@ -164,6 +166,7 @@ do_create_spdx[cleandirs] =3D &quot;${SPDXDEPLOY} ${SPD=
XWORK}&quot;<br>
=C2=A0do_create_spdx[depends] +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${PATCHDEPENDENCY} \<br>
=C2=A0 =C2=A0 =C2=A0${@create_spdx_source_deps(d)} \<br>
+=C2=A0 =C2=A0 ${@create_spdx_cve_check_deps(d)} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0python do_create_package_spdx() {<br>
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bb=
class<br>
index 81ad4d3b7a..8918448c35 100644<br>
--- a/meta/classes/spdx-common.bbclass<br>
+++ b/meta/classes/spdx-common.bbclass<br>
@@ -39,6 +39,17 @@ SPDX_CUSTOM_ANNOTATION_VARS ??=3D &quot;&quot;<br>
<br>
=C2=A0SPDX_MULTILIB_SSTATE_ARCHS ??=3D &quot;${SSTATE_ARCHS}&quot;<br>
<br>
+def create_spdx_cve_check_deps(d):<br>
+=C2=A0 =C2=A0 if (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&quot;SPDX_INCLUDE_VEX&quot;) =3D=3D =
&quot;all&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 and bb.data.inherits_class(&#39;cve-check&#39;=
, d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 and d.getVar(&quot;CVE_CHECK_FORMAT_JSON&quot;=
) =3D=3D &quot;1&quot;<br>
+=C2=A0 =C2=A0 ):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return pn + &quot;:do_cve_check&quot;<br>
+<br>
+=C2=A0 =C2=A0 return &quot;&quot;<br>
+<br>
=C2=A0def create_spdx_source_deps(d):<br>
=C2=A0 =C2=A0 =C2=A0import oe.spdx_common<br>
<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index 9baa40887b..e8658e2c32 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -437,8 +437,33 @@ def set_purposes(d, element, *var_names, force_purpose=
s=3D[]):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getattr(oe.spdx30.software_SoftwarePurpos=
e, p) for p in purposes[1:]<br>
=C2=A0 =C2=A0 =C2=A0]<br>
<br>
-def get_cves(d):<br>
+def get_cves(d, include_vex):<br>
=C2=A0 =C2=A0 =C2=A0cve_status =3D {}<br>
+<br>
+=C2=A0 =C2=A0 # Get CVEs from cve-check<br>
+=C2=A0 =C2=A0 if (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 include_vex =3D=3D &quot;all&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 and bb.data.inherits_class(&#39;cve-check&#39;=
, d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 and d.getVar(&quot;CVE_CHECK_FORMAT_JSON&quot;=
) =3D=3D &quot;1&quot;<br>
+=C2=A0 =C2=A0 ):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgfilepath =3D d.getVar(&quot;CVE_CHECK_RECIP=
E_FILE_JSON&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(pkgfilepath):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(pkgfilepath) as j:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D json.load=
(j)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json_data =3D {&qu=
ot;version&quot;:&quot;1&quot;, &quot;package&quot;: []}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.cve_check.cve_c=
heck_merge_jsons(json_data, data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for issue in json_=
data[&quot;package&quot;][0].get(&quot;issue&quot;, []):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve =
=3D issue[&quot;id&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_=
status[cve] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;mapping&quot;: issue[&quot;status&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;detail&quot;: issue[&quot;detail&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;description&quot;: issue.get(&quot;description&quot;, None=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cve_status:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn cve_status<br>
+<br>
+=C2=A0 =C2=A0 # Get CVEs from recipe<br>
=C2=A0 =C2=A0 =C2=A0patched_cves =3D oe.cve_check.get_patched_cves(d)<br>
=C2=A0 =C2=A0 =C2=A0for cve, patched_cve in patched_cves.items():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cve_status[cve] =3D {<br>
@@ -498,7 +523,7 @@ def create_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0# Add CVEs<br>
=C2=A0 =C2=A0 =C2=A0cve_by_status =3D {}<br>
=C2=A0 =C2=A0 =C2=A0if include_vex !=3D &quot;none&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data =3D get_cves(d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data =3D get_cves(d, include_vex)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for cve, decoded_status in cve_data.items=
():<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If this CVE is fixed upst=
ream, skip it unless all CVEs are<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#209575): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/209575" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/209575</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110498417/582=
7677" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110498417/5827677</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmail.com" targ=
et=3D"_blank">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008622eb062b99410a--

