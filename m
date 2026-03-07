Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814F6F55112
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:32:16 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18731.1772922735205473245
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:32:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iKlxnR3X;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7982c3b7dfcso105476317b3.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772922734; cv=none;
        d=google.com; s=arc-20240605;
        b=MEQjWfN7ftNUliPtXH4B/5IYI5dRAlcZ5hmzB1juOWWFeFGvVPftqS8miBq7eUh5it
         T37zNzHJI0XyVnxsSFkhmMAnH0rH5xnDQ0NNf4aXTTMKtP4eWlvFLCtOlohnIZzLBgCn
         z7BD9GZPkv2mXzYR7FTq2ee5LCrdjKsSa4YneaLHJbShaEfCA8cgsgcSix8f5k5O9/TK
         BVjOIBg6wY6QNns66W+WmZK3DTKa3vgzvLoaI5wSQF8CGlf9b7HDM4l28du+PDSSYcj4
         S4oJO3RD4OqbP6Xks1Ss3Fo2iDb+2ST/NTLUA9ub1mJTiTe0i8iBJ6pHnPAjiX06TqK5
         6RqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c6HaKkol8S2JRnS3HIE5xH6jOIzdrTdFNCvv0eMxF3U=;
        fh=+56fr8oC44TsvrkKtM/RCoPNRtxwzn4I3GjUOOlVKC0=;
        b=GvmkLCofvt2i0ooZDrCvYpAQwyM1fYSL+kHjp2nf/q4IkCq7klrPcq5eTotc4sCMLc
         DCOp8m3xgIlTe96zDcXkfUBq17kMAxQCIps0QbqbfM9M6pxPbNL3tEUT3aW5ZBCEW7A+
         j2Rl1h3vEW6mbjINlIsTy4T1WlxdbKHJVx5ArkBMbwMNnz3KoMrx3NDKJfhczvP66KJy
         19TrQr9a+TlTjhDlyIDnvzhk1ptxidPx2bvs9J9yjr16SkAMBhVDQ/p0Gj+2PQ/7Pr3c
         qmM/T4oYxmilBm+wxzqRMEyxmFnWwq+JXDanUABSW+GMU9LnY2aFYUix+YslX6wjNW2n
         oTsQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772922734; x=1773527534; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6HaKkol8S2JRnS3HIE5xH6jOIzdrTdFNCvv0eMxF3U=;
        b=iKlxnR3XfxBCdDNbnPqzo7QaNIHXOViL61fxd7Tu7mpiNXrYWwgL8wKercZ6Oqvy3B
         yWa3kUHl0Rn/IaSTV8/93HuCIlIjL8pa399X6q+RQlK7Xy55f1PxHofL3jHsRPc4zmbQ
         7BIYg9tps7ZlfpzBSXgOnzkTP7iCOdpfkqkh0oMaBUU4FtEzYbBny4yiG+pxPc5yOpVV
         HZ+Met6FatGKVZETO6pHnuA8XesF9/4oV+bcvh6bU6pENT3LhKEXIR+EPym4E43XAzA9
         4TN85jkteZeZ7OV5BJGs5fttp9nxL1Bo8bmzxOvmDBjHkIrh5wjYAiHx3zDTy7WKaHYM
         MzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772922734; x=1773527534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c6HaKkol8S2JRnS3HIE5xH6jOIzdrTdFNCvv0eMxF3U=;
        b=NUrd/HMcnmkR6lzgEfXldLN3jUKUep7VQ99pW8a111PY+t615P9Hn+Zgj0UOcIwBhk
         CgPEQ88j6nxmw5xzstgasA48hXAwH2IJk3G3zS5h1sqTF/6bO/YfiwfFVfWli9Yf2FGS
         5aYNxsMaVVN7PyQothjWQjRzMe5ARPrQQC5jnVY59COnQFYKppwDrct85SsF3v+QOC7g
         h/wnfhd2vQUsr2i93sXbiB2aMhxEMPufSrc4o40Md8co+v5pVYDBPMn64xHnHN940zPT
         N/DQbUdiUk+LQw/WRSJCMH7WtAgMrn5SxaaLgUaHAKsH/h0YK+vUC5FciAF48UZTWMNf
         3wLw==
X-Gm-Message-State: AOJu0YwkZgHB3TekwvOPadhlVx4R1xcn7uX7Kr2av+y+U/sUWOMeuxkx
	cScnUPFUOBhK8g6F16Z7RUFmS3AV4pA0+HyppUo30ZsBTDCldbaQ9wlYyMz2zK7J+/ZEX/lSGMj
	XFq/n+wg48v1u+iYWT02e5VM4sK1oLL4=
X-Gm-Gg: ATEYQzwxflsBKG/pOjasYwn0fBiLzqSq+O185BwSKTNvOOvoJoyOBWTYwO1RSw6qbLk
	fcSfOYmNg4B2rH+HaNCWEFQQwTKLCGmRs0YMqHuNXBIef1ovSNe8wbnrAv/A4953tz7ftpzlOfT
	G/rg4H9PcSlONeCN8BhxgHRHobOgalEWNC7iW3jpVCQYJ38IRSewHv2GwG2aSuRFzGjNGZZL/xY
	+qHl05M+R5WpA3RRyQX3t9RyZYiIvQSwix+ezZLWO2Ov4q9OGrUppWNFNp3ylj0AycoKCtacqwY
	QZAUNB3aOZFBLArsDwwYyA==
X-Received: by 2002:a05:690c:805:b0:796:45d4:9e2d with SMTP id
 00721157ae682-798dd79f251mr49354897b3.53.1772922734169; Sat, 07 Mar 2026
 14:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260304170541.180868-1-stefano.tondo.ext@siemens.com> <20260304170541.180868-5-stefano.tondo.ext@siemens.com>
In-Reply-To: <20260304170541.180868-5-stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 7 Mar 2026 15:32:03 -0700
X-Gm-Features: AaiRm53n29hqtEsjWE_dt8Mqfbk-qIv0O6v0xYCTmLnnP-APtizYgML7Tv3bBjI
Message-ID: <CAJdd5GaGp5F7egs-v7s=dqaw+gk_dWWKQWPHjXt90+4K+zma0g@mail.gmail.com>
Subject: Re: [PATCH v6 04/10] spdx30: Add version extraction from SRCREV for
 Git source components
To: Stefano Tondo <stondo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com, 
	stefano.tondo.ext@siemens.com, Peter.Marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232621

On Wed, Mar 4, 2026 at 10:05=E2=80=AFAM Stefano Tondo <stondo@gmail.com> wr=
ote:
>
> Extract version information for Git-based source components in SPDX 3.0
> SBOMs to improve SBOM completeness and enable better supply chain trackin=
g.
>
> Problem:
> Git repositories fetched as SRC_URI entries currently appear in SBOMs
> without version information (software_packageVersion is null). This makes
> it difficult to track which specific revision of a dependency was used,
> reducing SBOM usefulness for security and compliance tracking.
>
> Solution:
> - Extract SRCREV for Git sources and use it as packageVersion
> - Use fd.revision attribute (the resolved Git commit)
> - Fallback to SRCREV variable if fd.revision not available
> - Use first 12 characters as version (standard Git short hash)
> - Generate pkg:github PURLs for GitHub repositories (official PURL type)
> - Add comprehensive debug logging for troubleshooting
>
> Impact:
> - Git source components now have version information
> - GitHub repositories get proper PURLs (pkg:github/owner/repo@commit)
> - Enables tracking specific commit dependencies in SBOMs
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 80 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 11945a622d..78d1dfd250 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -569,6 +569,86 @@ def add_download_files(d, objset):
>                  )
>              )
>
> +            # Extract version and PURL for source packages
> +            dep_version =3D None
> +            dep_purl =3D None
> +
> +            # For Git repositories, extract version from SRCREV
> +            if fd.type =3D=3D "git":
> +                srcrev =3D None
> +
> +                # Try to get SRCREV for this specific source URL
> +                # Note: fd.revision (not fd.revisions) contains the reso=
lved revision
> +                if hasattr(fd, 'revision') and fd.revision:
> +                    srcrev =3D fd.revision
> +                    bb.debug(1, f"SPDX: Found fd.revision for {file_name=
}: {srcrev}")
> +
> +                # Note: We intentionally do NOT fall back to d.getVar('S=
RCREV')
> +                # because referencing SRCREV in BBIMPORTS-registered mod=
ule code
> +                # causes bitbake's signature generator to trace the SRCR=
EV ->
> +                # AUTOREV dependency chain during recipe finalization, t=
riggering
> +                # "AUTOREV/SRCPV set too late" errors for non-git temp r=
ecipes
> +                # used by recipetool/devtool with HTTP sources.
> +                # fd.revision is always available for git sources after =
fetch.

I'm fine with using fd.revision if it's correct.... but is this a bug
in devtool and recipetool?

> +                if srcrev and srcrev not in ['${AUTOREV}', 'AUTOINC', 'I=
NVALID']:

Minor: A set would be more efficient:

  srcrev not in {"${AUTOREV}", "AUTOINC", "INVALID}:

> +                    # Use first 12 characters of Git commit as version (=
standard Git short hash)
> +                    dep_version =3D srcrev[:12] if len(srcrev) >=3D 12 e=
lse srcrev

Is it always 12, or is it "12 or however many are required to be
disambiguous" (which would require asking git)? I'd prefer to use the
full SHA-1 to prevent that.

> +                    bb.debug(1, f"SPDX: Extracted Git version for {file_=
name}: {dep_version}")
> +
> +                    # Generate PURL for Git hosting services
> +                    # Reference: https://github.com/package-url/purl-spe=
c/blob/master/PURL-TYPES.rst
> +                    download_location =3D oe.spdx_common.fetch_data_to_u=
ri(fd, fd.name)
> +                    if download_location and download_location.startswit=
h('git+'):
> +                        git_url =3D download_location[4:]  # Remove 'git=
+' prefix
> +
> +                        # Build Git PURL handlers from default + custom =
mappings
> +                        # Format: 'domain': ('purl_type', lambda to extr=
act path)
> +                        # Can be extended in meta-siemens or other layer=
s via SPDX_GIT_PURL_MAPPINGS
> +                        git_purl_handlers =3D {
> +                            'github.com': ('pkg:github', lambda parts: f=
"{parts[0]}/{parts[1].replace('.git', '')}" if len(parts) >=3D 2 else None)=
,

You lambda is always the same for all of the entries in this hash
table; given that I don't see why we need it in the table.

> +                            # Note: pkg:gitlab is NOT in official PURL s=
pec, so we omit it by default
> +                            # Other Git hosts can be added via SPDX_GIT_=
PURL_MAPPINGS
> +                        }
> +
> +                        # Allow layers to extend PURL mappings via SPDX_=
GIT_PURL_MAPPINGS variable
> +                        # Format: "domain1:purl_type1 domain2:purl_type2=
"
> +                        # Example: SPDX_GIT_PURL_MAPPINGS =3D "gitlab.co=
m:pkg:gitlab git.example.com:pkg:generic"
> +                        custom_mappings =3D d.getVar('SPDX_GIT_PURL_MAPP=
INGS')
> +                        if custom_mappings:
> +                            for mapping in custom_mappings.split():
> +                                try:
> +                                    domain, purl_type =3D mapping.split(=
':')

This would fail with your example of "gitlab.com:pkg:gitlab" because
it would split into 3 parts and you are only capturing 2. You probably
want `mappings.split(":", 1), and some tests

> +                                    # Use simple path handler for custom=
 domains
> +                                    git_purl_handlers[domain] =3D (purl_=
type, lambda parts: f"{parts[0]}/{parts[1].replace('.git', '')}" if len(par=
ts) >=3D 2 else None)
> +                                    bb.debug(2, f"SPDX: Added custom Git=
 PURL mapping: {domain} -> {purl_type}")
> +                                except ValueError:
> +                                    bb.warn(f"SPDX: Invalid SPDX_GIT_PUR=
L_MAPPINGS entry: {mapping} (expected format: domain:purl_type)")
> +
> +                        for domain, (purl_type, path_handler) in git_pur=
l_handlers.items():
> +                            if f'://{domain}/' in git_url or f'//{domain=
}/' in git_url:
> +                                # Extract path after domain
> +                                path_start =3D git_url.find(f'{domain}/'=
) + len(f'{domain}/')
> +                                path =3D git_url[path_start:].split('/')
> +                                purl_path =3D path_handler(path)

I think using urllib can simplify this code.

> +                                if purl_path:
> +                                    dep_purl =3D f"{purl_type}/{purl_pat=
h}@{srcrev}"
> +                                    bb.debug(1, f"SPDX: Generated {purl_=
type} PURL: {dep_purl}")
> +                                break
> +
> +            # Fallback: use parent package version if no other version f=
ound
> +            if not dep_version:
> +                pv =3D d.getVar('PV')
> +                if pv and pv not in ['git', 'AUTOINC', 'INVALID', '${PV}=
']:

Minor: Use a set

> +                    dep_version =3D pv
> +                    bb.debug(1, f"SPDX: Using parent PV for {file_name}:=
 {dep_version}")
> +
> +            # Set version and PURL if extracted
> +            if dep_version:
> +                dl.software_packageVersion =3D dep_version
> +
> +            if dep_purl:
> +                dl.software_packageUrl =3D dep_purl
> +
>              if fd.method.supports_checksum(fd):
>                  # TODO Need something better than hard coding this
>                  for checksum_id in ["sha256", "sha1"]:
> --
> 2.53.0
>

