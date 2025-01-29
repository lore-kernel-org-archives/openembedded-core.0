Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFC4C02190
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 16:20:37 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.16612.1738167636102919215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 08:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VcGFNcFr;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-307325f2436so76154831fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 08:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738167634; x=1738772434; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF6QW8uGHASRm5syLBQ4tkgr+WIJUfwBYu/n2wJH45Q=;
        b=VcGFNcFrkZz2FX9WVa2h4B1jYBKeKP8VroMI6URa6L722ca7CgFEyINU+tJUIpQ+fP
         S64Px5N2MkEeZzpCYcwjSxi0BL1WFyz+huNuhB/qLxsXigw2vXLW2C0I12s65rxRj3jL
         kQBE7KUaKPkLj0Srspg62mCxI5eYgmqrFTZXBdJACJzXExKpnoDmKBnR2RUdgeukEx0O
         QaQFSfr60nPdKClh0SYQe5A6XEKPCq4lHDhgiZTt76A6r8/o0z9n4PJYMMKubeU2sL+/
         /mUyd0FttOUsr3vtWwUAzXpX23YBAmPuzFwQ6JcZqKSRTkibDrdBrpxL/75bEeoG8NL2
         sAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167634; x=1738772434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VF6QW8uGHASRm5syLBQ4tkgr+WIJUfwBYu/n2wJH45Q=;
        b=QkA+HirsqZ1YFKIoY/KfmVv9JOSFYho3unhCRzp0MtkdA1oWrHYpxSIfNJsV29tXIq
         G4eCpnNDhntOAdRhd4hnsc0Gk46RNEvhuVxZrzdbxxzuwt5mObbZNGqz73iljchyFlw+
         LaDNZC60rZlsk/63DqFST65MXtg4GJs+CZ5CMiZ7WovYqjGeB1EYaJ294goGUgiT3BsU
         iZrsw/iOEPaxAZSDsbvPit5XJWySkIzprTLIMwZacxpe6Q5j7SitBWy5Q1TM9o2ZMVhq
         bIRcp/cSHb6aFd/fl+j2TH40M6i4aSGccTPq8hC1jDwIL9oY8nKDTeJnVQ0Hi24EvRQX
         2Vtw==
X-Gm-Message-State: AOJu0YyGQb0kVwc4E+VDlYfZB6Qv4/aPd/Cp1viYVygxDss9g3Wulv7W
	m05+vqsiyuY4f9V2GLiSGPhX2InIlYB/SxWl/Iag+++VEaifaPV6ap4ubm2jae6GTTZUFsDWMBr
	Fxzs5ypVDJ0Sa8JJq5NUTPssI5UI=
X-Gm-Gg: ASbGncuCcXM/hKwvtU25meRaLgzUiBd/Nl1/06gPD/ZqaG5wPdcNYFQ5t5zqdLTPUFH
	lxC48oSuQnxWacLrqTMtK5SreEY8TF9vtPRD2OuqNVr7MXs10ViWnxZo3GQqWfI1Yil30YPW218
	E=
X-Google-Smtp-Source: AGHT+IGoJ6ZdBuBEhU3ac+JUnjaS8en1bo1thFE4C+WBPNOEdS3CAJNdSpw96TQ0f+eUeoA6mSPsRwFsCaUZZmftUw0=
X-Received: by 2002:a05:651c:b06:b0:300:1f2d:97a with SMTP id
 38308e7fff4ca-307968570eemr14236551fa.16.1738167633855; Wed, 29 Jan 2025
 08:20:33 -0800 (PST)
MIME-Version: 1.0
References: <20250108154718.3031653-2-hongxu.jia@windriver.com> <20250108160520.3159757-1-hongxu.jia@windriver.com>
In-Reply-To: <20250108160520.3159757-1-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 29 Jan 2025 09:20:21 -0700
X-Gm-Features: AWEUYZn74WFZj1Sb--tG10BFhoj6A4mMHB9H1syZ-aGtTSFRurpF3nK9jjf__4g
Message-ID: <CAJdd5GaNsd8o13+PJJ7xEr3dy0jX=GF1GzcNz1KEvPnA1y3hpA@mail.gmail.com>
Subject: Re: [PATCH V3 2/3] meta/lib/oe/spdx30_tasks.py: add patched CVE to
 SPDX 3
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org, colinmca242@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 16:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210389

On Wed, Jan 8, 2025 at 9:05=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.com=
> wrote:
>
> Due to commit [cve-check: annotate CVEs during analysis][1] improved
> get_patched_cves to search for additional CVEs from CVE_STATUS which
> means the funciton get_patched_cves contains both of patched CVE and
> decoded_status
>
> This commit add function get_cves to use get_patched_cves in one place
> to add CVEs, and convert patched_cve to decoded_status:
>
>   patched_cve["abbrev-status"] --> decoded_status["mapping"]
>   patched_cve["status"] --> decoded_status["detail"]
>   patched_cve["justification"] --> decoded_status["description"]
>
> Take recipe unzip for example, CVE-2015-1315 is patched in oe-core and
> is available in package SPDX
>
> oe-core$ grep "CVE-2015-1315" -rn meta
> meta/recipes-extended/unzip/unzip_6.0.bb:12:    file://06-unzip60-alt-ico=
nv-utf8_CVE-2015-1315.patch \
> meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315=
.patch:6:CVE: CVE-2015-1315
>
> $ bitbake unzip
> $ vim tmp/deploy/spdx/3.0.1/core2-64/packages/package-unzip.spdx.json [2]
> ...
>     {
>       "type": "security_VexFixedVulnAssessmentRelationship",
>       "spdxId": "http://spdx.org/spdxdocs/unzip-d5d383ad-de07-5ac4-8814-3=
c95ed6bdaaa/47a621ef0550c7a6a1ed0507b0b8a7b7822447c2ff0995acc4b688eed1e1f1d=
0/vex-fixed/1aeb76ce6ca8dd91b12c18a11eeb964b",
>       "creationInfo": "_:CreationInfo1",
>       "extension": [
>         {
>           "type": "https://rdf.openembedded.org/spdx/3.0/id-alias",
>           "https://rdf.openembedded.org/spdx/3.0/alias": "http://spdxdocs=
.org/openembedded-alias/by-doc-hash/22ab8d6eced4525f57bb861acc0fe983d8af580=
5dd97e702c22c1ffe04621cb2/unzip/UNIHASH/vex-fixed/1aeb76ce6ca8dd91b12c18a11=
eeb964b"
>         }
>       ],
>       "from": "http://spdxdocs.org/openembedded-alias/by-doc-hash/539e1de=
ec075c3a51b8c6975352b0a9ad320a130a4d7d516316b35994a830f93/unzip/UNIHASH/vul=
nerability/CVE-2015-1315",
>       "relationshipType": "fixedIn",
>       "to": [
>         "http://spdx.org/spdxdocs/unzip-d5d383ad-de07-5ac4-8814-3c95ed6bd=
aaa/47a621ef0550c7a6a1ed0507b0b8a7b7822447c2ff0995acc4b688eed1e1f1d0/packag=
e/unzip"
>       ],
>       "security_vexVersion": "1.0.0"
>     },
> ...
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3D452e605b5=
5ad61c08f4af7089a5a9c576ca28f7d
> [2] https://spdx.github.io/spdx-spec/v3.0.1/model/Security/Classes/VexFix=
edVulnAssessmentRelationship/
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index c60c97896c..9baa40887b 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -437,6 +437,17 @@ def set_purposes(d, element, *var_names, force_purpo=
ses=3D[]):
>          getattr(oe.spdx30.software_SoftwarePurpose, p) for p in purposes=
[1:]
>      ]
>
> +def get_cves(d):
> +    cve_status =3D {}
> +    patched_cves =3D oe.cve_check.get_patched_cves(d)
> +    for cve, patched_cve in patched_cves.items():
> +        cve_status[cve] =3D {
> +            "mapping": patched_cve["abbrev-status"],
> +            "detail": patched_cve["status"],
> +            "description": patched_cve.get("justification", None)
> +        }

I don't see any reason to map this to the old indexes; better to
update the code consuming it to use the new indexes instead.

> +
> +    return cve_status
>
>  def create_spdx(d):
>      def set_var_field(var, obj, name, package=3DNone):
> @@ -487,8 +498,8 @@ def create_spdx(d):
>      # Add CVEs
>      cve_by_status =3D {}
>      if include_vex !=3D "none":
> -        for cve in d.getVarFlags("CVE_STATUS") or {}:
> -            decoded_status =3D oe.cve_check.decode_cve_status(d, cve)
> +        cve_data =3D get_cves(d)
> +        for cve, decoded_status in cve_data.items():
>
>              # If this CVE is fixed upstream, skip it unless all CVEs are
>              # specified.
> --
> 2.25.1
>

