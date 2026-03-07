Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8351FF55114
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:42:56 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18897.1772923369805435036
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:42:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IVXYploU;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64caaacb9bcso9956895d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:42:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772923369; cv=none;
        d=google.com; s=arc-20240605;
        b=UJwEXZrBFocJEcTgIPUicIMu/08AY/WXE0UeRktjIJp70QQro/GcWDgjyHgOMzKtat
         Tl7eaNsNBa2AAoTKsJi+bRezyxtf3QtGvRxmyxPawPhIL+UE8hVtNnxvLaEgff3bh9M9
         IdcRGfEwvxem4q5XweBubmjugRGUARpLqvQ1dTWazHbDkNUtBR12I56RLn3A6nRisAFI
         dWuDoYZAPokvIQZboUgIALU1b8N66Zji1ma7u3zzTDGWMsQBmn2PQZJL1mJ1b7Iddlg7
         0sDcGa98w1ZSULERVhBjvjJV6KIq1RBYf4lcs0tnhIRLjxEy8oiHv+e+8tpbunicINeJ
         rXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rLBhNgBuR/xEPiSuoMkVlIV0jFga4h0tteSx/syKGD0=;
        fh=aX9SpBcc1D+i0sBLZeYvRNp2cqEQvxp/jAk+Y+9zDH4=;
        b=do76UpRUStmpceq7WQKkdpcT2sc7LWpu9nJRt453KXtprISbfxKVbvHZDp9OBpjqAS
         nD74t86Thub9kKD19eCGY5+RLQQtYXtUoiUqEGxwD3W/55xumR5pgMK1FAdHu69RP1dI
         V38WRCJrlxDs+k2dqDrcd+FfCUXEEEAdrJ/Utvl1xgojh0yyUqYjC9auiSaFJr4zhPYf
         7+iOqW7vzt/H9lf/TgGxsUeseoujglkkLPWcaZc6nsEQ81AIpeY3jMEW3XdntniVChD3
         sh6B0jW49dPGjoAruNnXxyEU5uNPbzcgUflF6ileX3oPkK3dGtnpf+a7TLtkU7T8AFMl
         XJag==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772923369; x=1773528169; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLBhNgBuR/xEPiSuoMkVlIV0jFga4h0tteSx/syKGD0=;
        b=IVXYploUqGEQAKtvDcFiUCDk+IUXSwukvGPi4Pkh1QAO1QeFpk37esOUnXPpbhWsQp
         Cn1IBv+KGEpPLdhQmHELt41zePiSIZsox0DXFmK2CKYk9oTA+WfElelyLKuz5tqGweht
         AKpQqreGa6e0gPMRZXWN3ZBBHXXQagZoV3wlsBd3sDFmOaCehOhR81DkPavvcMicmkFw
         MIpWSKUk05IyWEXou/sIB9MBo7LrHa3vq8pmP7zrp+4lLVrYmIRDJNKbpljPR52fNtKH
         uDnh0x596trBsthvS6WJlQWC38X10X0MoNNvKBqqzNfCUa9A8014CZsBTHNOwPKyEY/z
         vqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923369; x=1773528169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rLBhNgBuR/xEPiSuoMkVlIV0jFga4h0tteSx/syKGD0=;
        b=XdRbsh5M8tUXy+10FvhXvkaNuNf8XJCLCHjSMYSjgTa74J+0XfoYtnSHFY26hMJ8uZ
         aWOsuBJLRG0b2kvU6qVc1eMLyaqwAi2J5VqWl0s6cF13yRLcqjN/oSNsMIVxOxhsGi1i
         Vc2BiiAcakvZecNQNwxOrqajO85Yt1R1djQu7lztJd6jymFZe5R46DkNhD4kavqSXMu8
         bfJzrRLC74h8V/1DKst7tMofWAavzbvoanv4+NzgSEdOdo4Ydc9Xt0NknCkW0YbeVZDV
         bMEnPtWKj0v7vknyY6XrA4kU9fv2/8vFABTn3tZZf6dyBfX2kc9plYDa93OXkFBQnJNC
         nvsw==
X-Gm-Message-State: AOJu0YxS8whvE5ftW9gnEOi5MPLyny9Wp1zdvqqEV4EAoig99kbgKQ+b
	+LDb+cJzZOen7DoVezbXbNZ9xliAI6EicnptroNvibhEqjghL7GEX5/ZyJUuRLEqmis8YZZLjhV
	a97exM+Efdj8ny3vaB9PZKMu7YGdizg0=
X-Gm-Gg: ATEYQzxC5qgrL898kDXlF3JlJ3LD1I3ADlq+ZF/8SKZYttfDmYZXN8RX9ebjnPARHsz
	uVRzD/Gj11H3tVojm0OucVKBBpR0T7xVbze/e7Ene8Dk+nniVC+b9A/c2P3VFdhPOC8xtpVKsZN
	B0APLYG/fJEWL14JYDCop520ZtpbmfEPST8Sm0bsHJj1Gc0XaVyTv5LurTSGpBdbHtohcJVG8H1
	WOUq+PyXbVLZZ2vFQX97mX/6sjDAYt/96BkQa75P/tFi2vDapUNAzOvsN9JzhbWooHKZtSMtyPI
	mcMZQj2UiyR47wlU4YZRcQ==
X-Received: by 2002:a05:690c:86:b0:798:798d:9a1b with SMTP id
 00721157ae682-798dd7caa89mr63906587b3.63.1772923368540; Sat, 07 Mar 2026
 14:42:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com> <387d3edf78fc6381bc876445de23cab95d63f224.1772805096.git.stefano.tondo.ext@siemens.com>
In-Reply-To: <387d3edf78fc6381bc876445de23cab95d63f224.1772805096.git.stefano.tondo.ext@siemens.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 7 Mar 2026 15:42:37 -0700
X-Gm-Features: AaiRm53JLWwPNKAiN2npgPFB07RJeYBnMdMMKl4JmsBHx_OlBkUGNG2NS9TvbME
Message-ID: <CAJdd5GbSa=ND4RoS2SsucMxEmGfV-YxCWTtqf6h3w7g=v4BW5g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 06/10] spdx30: Enrich source downloads with
 external refs and PURLs
To: stondo@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, joshua.watt@garmin.com, 
	ross.burton@arm.com, adrian.freihofer@siemens.com, Peter.Marko@siemens.com, 
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232622

I don't really like that this significantly rewrites the
implementation from 2 patches prior; it makes review more difficult.
Is there a reason you did it that way? If not, I'd suggest squashing
the two patches together

On Fri, Mar 6, 2026 at 7:00=E2=80=AFAM Stefano Tondo via
lists.openembedded.org <stondo=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Enrich source download packages in SPDX SBOMs with comprehensive
> source tracking metadata:
>
> External references:
> - VCS references for Git repositories (ExternalRefType.vcs)
> - Distribution references for HTTP/HTTPS/FTP archive downloads
> - Homepage references from HOMEPAGE variable
>
> Source PURL qualifiers:
> - Add ?type=3Dsource qualifier for recipe source tarballs to
>   distinguish them from built runtime packages
> - Only applied to pkg:yocto or pkg:generic PURLs (ecosystem-specific
>   PURLs like pkg:npm already have their own semantics)
>
> Version extraction with priority chain:
> - Priority 1: ;tag=3D parameter from SRC_URI (preferred, provides
>   meaningful versions like '1.2.3')
> - Priority 2: fd.revision (resolved Git commit hash)
> - Priority 3: SRCREV variable
> - Priority 4: PV from recipe metadata
>
> PURL generation:
> - Generate pkg:github PURLs for GitHub-hosted repositories
> - Extensible via SPDX_GIT_PURL_MAPPINGS for other hosting services
> - Ecosystem-specific version and PURL integration for Rust crates,
>   Go modules, PyPI, NPM packages
>
> Also add defensive error handling for download_location retrieval
> and wire up extract_dependency_metadata() for non-Git sources.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 178 +++++++++++++++++++++++++-----------
>  1 file changed, 126 insertions(+), 52 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 78d1dfd250..b82015341b 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -20,7 +20,6 @@ from datetime import datetime, timezone
>  from pathlib import Path
>
>
> -
>  def extract_dependency_metadata(d, file_name):
>      """Extract ecosystem-specific PURL for dependency packages.
>
> @@ -573,15 +572,29 @@ def add_download_files(d, objset):
>              dep_version =3D None
>              dep_purl =3D None
>

add_download_files is getting pretty long, can this new functionality
be split into a new function?

> -            # For Git repositories, extract version from SRCREV
> +            # Get download location for external references
> +            download_location =3D None
> +            try:
> +                download_location =3D oe.spdx_common.fetch_data_to_uri(f=
d, fd.name)
> +            except Exception as e:
> +                bb.debug(1, f"Could not get download location for {file_=
name}: {e}")
> +
> +            # For Git repositories, extract version from SRCREV or tag
>              if fd.type =3D=3D "git":
>                  srcrev =3D None
>
> -                # Try to get SRCREV for this specific source URL
> +                # Prefer ;tag=3D parameter from SRC_URI
> +                if hasattr(fd, 'parm') and fd.parm and 'tag' in fd.parm:
> +                    tag =3D fd.parm['tag']
> +                    if tag and tag not in ['${AUTOREV}', 'AUTOINC', 'INV=
ALID']:
> +                        dep_version =3D tag[1:] if tag.startswith('v') e=
lse tag
> +                        version_source =3D "tag"

This feels like a little too much of a heuristic to me (mapping a tag
to a version); Do we need to do this? The SRCREV seems more precise

> +                # Try fd.revision for resolved SRCREV
>                  # Note: fd.revision (not fd.revisions) contains the reso=
lved revision
> -                if hasattr(fd, 'revision') and fd.revision:
> +                if not dep_version and hasattr(fd, 'revision') and fd.re=
vision:
>                      srcrev =3D fd.revision
>                      bb.debug(1, f"SPDX: Found fd.revision for {file_name=
}: {srcrev}")
> +                    version_source =3D "fd.revision"
>
>                  # Note: We intentionally do NOT fall back to d.getVar('S=
RCREV')
>                  # because referencing SRCREV in BBIMPORTS-registered mod=
ule code
> @@ -590,65 +603,127 @@ def add_download_files(d, objset):
>                  # "AUTOREV/SRCPV set too late" errors for non-git temp r=
ecipes
>                  # used by recipetool/devtool with HTTP sources.
>                  # fd.revision is always available for git sources after =
fetch.
> -                if srcrev and srcrev not in ['${AUTOREV}', 'AUTOINC', 'I=
NVALID']:
> -                    # Use first 12 characters of Git commit as version (=
standard Git short hash)
> +                if not dep_version and srcrev and srcrev not in ['${AUTO=
REV}', 'AUTOINC', 'INVALID']:
>                      dep_version =3D srcrev[:12] if len(srcrev) >=3D 12 e=
lse srcrev
> -                    bb.debug(1, f"SPDX: Extracted Git version for {file_=
name}: {dep_version}")
> -
> -                    # Generate PURL for Git hosting services
> -                    # Reference: https://github.com/package-url/purl-spe=
c/blob/master/PURL-TYPES.rst
> -                    download_location =3D oe.spdx_common.fetch_data_to_u=
ri(fd, fd.name)
> -                    if download_location and download_location.startswit=
h('git+'):
> -                        git_url =3D download_location[4:]  # Remove 'git=
+' prefix
> -
> -                        # Build Git PURL handlers from default + custom =
mappings
> -                        # Format: 'domain': ('purl_type', lambda to extr=
act path)
> -                        # Can be extended in meta-siemens or other layer=
s via SPDX_GIT_PURL_MAPPINGS
> -                        git_purl_handlers =3D {
> -                            'github.com': ('pkg:github', lambda parts: f=
"{parts[0]}/{parts[1].replace('.git', '')}" if len(parts) >=3D 2 else None)=
,
> -                            # Note: pkg:gitlab is NOT in official PURL s=
pec, so we omit it by default
> -                            # Other Git hosts can be added via SPDX_GIT_=
PURL_MAPPINGS
> -                        }
> -
> -                        # Allow layers to extend PURL mappings via SPDX_=
GIT_PURL_MAPPINGS variable
> -                        # Format: "domain1:purl_type1 domain2:purl_type2=
"
> -                        # Example: SPDX_GIT_PURL_MAPPINGS =3D "gitlab.co=
m:pkg:gitlab git.example.com:pkg:generic"
> -                        custom_mappings =3D d.getVar('SPDX_GIT_PURL_MAPP=
INGS')
> -                        if custom_mappings:
> -                            for mapping in custom_mappings.split():
> -                                try:
> -                                    domain, purl_type =3D mapping.split(=
':')
> -                                    # Use simple path handler for custom=
 domains
> -                                    git_purl_handlers[domain] =3D (purl_=
type, lambda parts: f"{parts[0]}/{parts[1].replace('.git', '')}" if len(par=
ts) >=3D 2 else None)
> -                                    bb.debug(2, f"SPDX: Added custom Git=
 PURL mapping: {domain} -> {purl_type}")
> -                                except ValueError:
> -                                    bb.warn(f"SPDX: Invalid SPDX_GIT_PUR=
L_MAPPINGS entry: {mapping} (expected format: domain:purl_type)")
> -
> -                        for domain, (purl_type, path_handler) in git_pur=
l_handlers.items():
> -                            if f'://{domain}/' in git_url or f'//{domain=
}/' in git_url:
> -                                # Extract path after domain
> -                                path_start =3D git_url.find(f'{domain}/'=
) + len(f'{domain}/')
> -                                path =3D git_url[path_start:].split('/')
> -                                purl_path =3D path_handler(path)
> -                                if purl_path:
> -                                    dep_purl =3D f"{purl_type}/{purl_pat=
h}@{srcrev}"
> -                                    bb.debug(1, f"SPDX: Generated {purl_=
type} PURL: {dep_purl}")
> -                                break
> -
> -            # Fallback: use parent package version if no other version f=
ound
> +                    bb.debug(1, f"Extracted Git version for {file_name}:=
 {dep_version} (from {version_source})")
> +
> +                # Generate PURL for Git hosting services
> +                # Reference: https://github.com/package-url/purl-spec/bl=
ob/master/PURL-TYPES.rst
> +                if dep_version and download_location and isinstance(down=
load_location, str) and download_location.startswith('git+'):
> +                    git_url =3D download_location[4:]  # Remove 'git+' p=
refix
> +
> +                    # Default Git PURL handler (github.com)
> +                    git_purl_handlers =3D {
> +                        'github.com': ('pkg:github', lambda parts: f"{pa=
rts[0]}/{parts[1].replace('.git', '')}" if len(parts) >=3D 2 else None),
> +                        # Note: pkg:gitlab is NOT in official PURL spec,=
 so we omit it by default
> +                    }
> +
> +                    # Custom PURL mappings from SPDX_GIT_PURL_MAPPINGS
> +                    # Format: "domain1:purl_type1 domain2:purl_type2"
> +                    # Example: SPDX_GIT_PURL_MAPPINGS =3D "gitlab.com:pk=
g:gitlab git.example.com:pkg:generic"
> +                    custom_mappings =3D d.getVar('SPDX_GIT_PURL_MAPPINGS=
')
> +                    if custom_mappings:
> +                        for mapping in custom_mappings.split():
> +                            try:
> +                                domain, purl_type =3D mapping.split(':')
> +                                git_purl_handlers[domain] =3D (purl_type=
, lambda parts: f"{parts[0]}/{parts[1].replace('.git', '')}" if len(parts) =
>=3D 2 else None)
> +                                bb.debug(2, f"Added custom Git PURL mapp=
ing: {domain} -> {purl_type}")
> +                            except ValueError:
> +                                bb.warn(f"Invalid SPDX_GIT_PURL_MAPPINGS=
 entry: {mapping} (expected format: domain:purl_type)")
> +
> +                    for domain, (purl_type, path_handler) in git_purl_ha=
ndlers.items():
> +                        if f'://{domain}/' in git_url or f'//{domain}/' =
in git_url:
> +                            path_start =3D git_url.find(f'{domain}/') + =
len(f'{domain}/')
> +                            path =3D git_url[path_start:].split('/')
> +                            purl_path =3D path_handler(path)
> +                            if purl_path:
> +                                purl_version =3D dep_version if version_=
source =3D=3D "tag" else (srcrev if srcrev else dep_version)
> +                                dep_purl =3D f"{purl_type}/{purl_path}@{=
purl_version}"
> +                                bb.debug(1, f"Generated {purl_type} PURL=
: {dep_purl}")
> +                            break
> +
> +            # Fallback to recipe PV
>              if not dep_version:
>                  pv =3D d.getVar('PV')
>                  if pv and pv not in ['git', 'AUTOINC', 'INVALID', '${PV}=
']:
>                      dep_version =3D pv
> -                    bb.debug(1, f"SPDX: Using parent PV for {file_name}:=
 {dep_version}")
> +            # Non-Git: try ecosystem-specific PURL
> +            if fd.type !=3D "git":
> +                ecosystem_version, ecosystem_purl =3D extract_dependency=
_metadata(d, file_name)
> +
> +                if ecosystem_version and not dep_version:
> +                    dep_version =3D ecosystem_version
> +                if ecosystem_purl and not dep_purl:
> +                    dep_purl =3D ecosystem_purl
> +                    bb.debug(1, f"Generated ecosystem PURL for {file_nam=
e}: {dep_purl}")
>
> -            # Set version and PURL if extracted
>              if dep_version:
>                  dl.software_packageVersion =3D dep_version
>
>              if dep_purl:
>                  dl.software_packageUrl =3D dep_purl
>
> +            # Add ?type=3Dsource qualifier for source tarballs
> +            if (primary_purpose =3D=3D oe.spdx30.software_SoftwarePurpos=
e.source and
> +                fd.type !=3D "git" and
> +                file_name.endswith(('.tar.gz', '.tar.bz2', '.tar.xz', '.=
zip', '.tgz'))):

Why does it have to be one of these archive formats?

> +
> +                current_purl =3D dl.software_packageUrl

Isn't this `dep_purl`? Why can't this code live before
dl.software_packageUrl is assigned.

> +                if current_purl:
> +                    purl_type =3D current_purl.split('/')[0] if '/' in c=
urrent_purl else ''
> +                    if purl_type in ['pkg:yocto', 'pkg:generic']:
> +                        source_purl =3D f"{current_purl}?type=3Dsource"
> +                        dl.software_packageUrl =3D source_purl
> +                else:
> +                    recipe_purl =3D oe.purl.get_base_purl(d)
> +                    if recipe_purl:
> +                        base_purl =3D recipe_purl
> +                        source_purl =3D f"{base_purl}?type=3Dsource"
> +                        dl.software_packageUrl =3D source_purl
> +            # Add external references
> +
> +            # VCS reference for Git repositories
> +            if fd.type =3D=3D "git" and download_location and isinstance=
(download_location, str) and download_location.startswith('git+'):
> +                git_url =3D download_location[4:]  # Remove 'git+' prefi=
x
> +                # Clean up URL (remove commit hash if present)
> +                if '@' in git_url:
> +                    git_url =3D git_url.split('@')[0]
> +
> +                dl.externalRef =3D dl.externalRef or []
> +                dl.externalRef.append(
> +                    oe.spdx30.ExternalRef(
> +                        externalRefType=3Doe.spdx30.ExternalRefType.vcs,
> +                        locator=3D[git_url],
> +                    )
> +                )
> +
> +            # Distribution reference for tarball/archive downloads
> +            elif download_location and isinstance(download_location, str=
) and (
> +                    download_location.startswith('http://') or
> +                    download_location.startswith('https://') or
> +                    download_location.startswith('ftp://')):
> +                dl.externalRef =3D dl.externalRef or []
> +                dl.externalRef.append(
> +                    oe.spdx30.ExternalRef(
> +                        externalRefType=3Doe.spdx30.ExternalRefType.altD=
ownloadLocation,
> +                        locator=3D[download_location],
> +                    )
> +                )
> +
> +            # Homepage reference if available
> +            homepage =3D d.getVar('HOMEPAGE')

Does HOMEPAGE apply to all downloads? I'm not sure.

> +            if homepage:
> +                homepage =3D homepage.strip()
> +                dl.externalRef =3D dl.externalRef or []
> +                # Only add if not already added as distribution referenc=
e
> +                if not any(homepage in ref.locator for ref in dl.externa=
lRef):
> +                    dl.externalRef.append(
> +                        oe.spdx30.ExternalRef(
> +                            externalRefType=3Doe.spdx30.ExternalRefType.=
altWebPage,
> +                            locator=3D[homepage],
> +                        )
> +                    )
> +
>              if fd.method.supports_checksum(fd):
>                  # TODO Need something better than hard coding this
>                  for checksum_id in ["sha256", "sha1"]:
> @@ -665,7 +740,6 @@ def add_download_files(d, objset):
>                          )
>                      )
>
> -            inputs.add(dl)
>
>      return inputs
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232572): https://lists.openembedded.org/g/openembedde=
d-core/message/232572
> Mute This Topic: https://lists.openembedded.org/mt/118170498/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

