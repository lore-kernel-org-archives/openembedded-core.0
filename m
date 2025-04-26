Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E63AC369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 09:03:00 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.6016.1745658173752694820
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 02:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LGOmYML9;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2aeada833so598137966b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 02:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745658172; x=1746262972; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8e2pOZoZIq7wuAaHpo5WJ6bGy/upKwZ5OC3ybUIQZX4=;
        b=LGOmYML93dFSHuv8UbzWQghlA4cervWoSm0kHEm62xlMiGz2TME77cJlajyAeHDj28
         Bz/4am7s4gwE3CPDum8WaV7bzu5tZycGO23bZEa3txVdeDkEtEp1v+8Mb7+2kY/3h/WO
         6w+NzmAeHc3/fSNUZkXYmNDw3L4c1BDHdXlSQfPv8GWm5Nex2/qenS4IUoAA0zk1y+Xi
         u4zCibUhjFBIUnoadTUR1hFRgW7bXI5UKJvUudhz1QI7FxqTAjOcTTFsYw1ZAFBJpU3t
         +Gji+87Bt6Mn6KYGeLtKgD39a9T4Mh16u1wexO+ojzsuTHv5vtLfipIDUoeqmUYiVnTB
         fSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745658172; x=1746262972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8e2pOZoZIq7wuAaHpo5WJ6bGy/upKwZ5OC3ybUIQZX4=;
        b=ASmBYlRF8rPP627VO2glBo1Bc2pJqSSHCph6s+gEiIbp7UEgm7X9kqyNisHuuB32wx
         L5IQPJ68sIHDd8OBij2rspiqbo2BTWa9LNgu0iqfmwumYrArHxpNmYJ0VB96+L845MJT
         ghMhvMYxDQ6pc0fG/33jOr0kvGK1b6dAiQikaU/t1aveRMTZaf4yWwwIZXLcE81lsvdH
         u7MuCV4QYONDUSGARKa3wSFmS0U1s/AxSc8vsvdrQHfyku0pOAPuWkIlr4rJNzll46kE
         idBu8SWKz+mwbvH1RVPXgOFiRj3jgrZkQCHe1mbKn/PUHXLTNooqWUe0ZUL6vlpx2XCu
         MLCw==
X-Forwarded-Encrypted: i=1; AJvYcCWCP7BNnSqKGmqEQQ5nuAL92ojEQr1Eitdzc8kqoPpufNgeegmjlmoMvwk9nvIOf5/r7EmrjjO8rXJOXnUEuVTSUA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyBiT3g/aMxVAWPVMAIAYZEVEoU4F5yAdCxXDivXYOygeVVT3h8
	+i1nHXfhnKuBmZlZkU7skHCKzTsqma4Yn4TemI/02Z4qwXxXYh1g
X-Gm-Gg: ASbGnctHjXS7OwPCOYwhwFMBet8LP5ks/qrunMNPM7i1G9m+c1DXwDD0AQznaE/zV2l
	VTNWRV94S2+eydEVktRyyb8m6UYddVssoAy3dYHphNwbt0un86riUnTA/B/xQr0zAB5sa7v8o1X
	2flNXB/tY+DetgIBuJGLXYlyMJP027RGA0BJp/6SHUTU56+Q4mv2q87f8Tlwb0YUtZE56exfjrq
	qdYUaqGq0NwXcsKQiJ5+wc4s8bHGZNnXBk2mybwINafrsBdEWdzo3luq9rCGYY88bMzMJGz3DKR
	ImZROzdmQnQoXjNC2h/ljzSWc+QnQchhiiAXhkMJIgDP9HpQ
X-Google-Smtp-Source: AGHT+IGXchvevBVY4po7nhKqBEWV84RZtIhr/UXKyTWork/PYaYbXv49vy7hyeMHnSEAsQeJHio6Cw==
X-Received: by 2002:a17:907:97c4:b0:ace:4870:507c with SMTP id a640c23a62f3a-ace5a44a4bdmr757551566b.23.1745658171756;
        Sat, 26 Apr 2025 02:02:51 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4f88e6sm260579666b.70.2025.04.26.02.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 02:02:51 -0700 (PDT)
Message-ID: <854aacf4-7278-4af6-9ab2-7f0c4ed68504@gmail.com>
Date: Sat, 26 Apr 2025 11:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] linux/generate-cve-exclusions: use data
 from CVEProject
To: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org,
 bruce.ashfield@gmail.com
References: <20250410094837.897013-1-daniel.turull@ericsson.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250410094837.897013-1-daniel.turull@ericsson.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 09:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215516


On 4/10/25 11:48, Daniel Turull via lists.openembedded.org wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> The old script was relying on linuxkernelcves.com that was archived in
> May 2024 when kernel.org became a CNA.
>
> The new script reads CVE json files from the datadir that can be either
> from the official kernel.org CNA [1] or CVEProject [2]
>
> [1] https://git.kernel.org/pub/scm/linux/security/vulns.git
> [2] https://github.com/CVEProject/cvelistV5
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  .../linux/generate-cve-exclusions.py          | 116 +++++++++++++-----
>  1 file changed, 85 insertions(+), 31 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
> index aa9195aab4..82fb4264e3 100755
> --- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
> +++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
> @@ -1,7 +1,7 @@
>  #! /usr/bin/env python3
>  
>  # Generate granular CVE status metadata for a specific version of the kernel
> -# using data from linuxkernelcves.com.
> +# using json data from cvelistV5 or vulns repository
>  #
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> @@ -9,7 +9,8 @@ import argparse
>  import datetime
>  import json
>  import pathlib
> -import re
> +import os
> +import glob
>  
>  from packaging.version import Version
>  
> @@ -25,22 +26,75 @@ def parse_version(s):
>          return Version(s)
>      return None
>  
> +def get_fixed_versions(cve_info, base_version):
> +    '''
> +    Get fixed versionss
> +    '''
> +    first_affected = None
> +    fixed = None
> +    fixed_backport = None
> +    next_version = Version(str(base_version) + ".5000")
> +    for affected in cve_info["containers"]["cna"]["affected"]:
> +        # In case the CVE info is not complete, it might not have default status and therefore
> +        # we don't know the status of this CVE.
> +        if not "defaultStatus" in affected:
> +            return first_affected, fixed, fixed_backport
> +        if affected["defaultStatus"] == "affected":
> +            for version in affected["versions"]:
> +                v = Version(version["version"])
> +                if v == 0:
> +                    #Skiping non-affected
> +                    continue
> +                if version["status"] == "affected" and not first_affected:
> +                    first_affected = v
> +                elif (version["status"] == "unaffected" and
> +                    version['versionType'] == "original_commit_for_fix"):
> +                    fixed = v
Is this part, the universally true? E.g. CVE-2024-46700 has been fixed
since 6.10.8, but the generated list indicates that there is no solution
for it. Looking at the raw data, it lists the fix, but without the
"original_commit_for_fix" versionType. Is this a data problem, or a
parsing one?
> +                elif base_version < v and v < next_version:
> +                    fixed_backport = v
> +        elif affected["defaultStatus"] == "unaffected":
> +            # Only specific versions are affected. We care only about our base version
> +            if "versions" not in affected:
> +                continue
> +            for version in affected["versions"]:
> +                if "versionType" not in version:
> +                    continue
> +                if version["versionType"] == "git":
> +                    continue
> +                v = Version(version["version"])
> +                # in case it is not in our base version
> +                less_than = Version(version["lessThan"])
> +
> +                if not first_affected:
> +                    first_affected = v
> +                    fixed = less_than
> +                if base_version < v and v < next_version:
> +                    first_affected = v
> +                    fixed = less_than
> +                    fixed_backport = less_than
> +
> +    return first_affected, fixed, fixed_backport
> +
> +def is_linux_cve(cve_info):
> +    '''Return true is the CVE belongs to Linux'''
> +    if not "affected" in cve_info["containers"]["cna"]:
> +        return False
> +    for affected in cve_info["containers"]["cna"]["affected"]:
> +        if not "product" in affected:
> +            return False
> +        if affected["product"] == "Linux" and affected["vendor"] == "Linux":
> +            return True
> +    return False
>  
>  def main(argp=None):
>      parser = argparse.ArgumentParser()
> -    parser.add_argument("datadir", type=pathlib.Path, help="Path to a clone of https://github.com/nluedtke/linux_kernel_cves")
> +    parser.add_argument("datadir", type=pathlib.Path, help="Path to a clone of https://github.com/CVEProject/cvelistV5 or https://git.kernel.org/pub/scm/linux/security/vulns.git")
>      parser.add_argument("version", type=Version, help="Kernel version number to generate data for, such as 6.1.38")
>  
>      args = parser.parse_args(argp)
>      datadir = args.datadir
>      version = args.version
> -    base_version = f"{version.major}.{version.minor}"
> -
> -    with open(datadir / "data" / "kernel_cves.json", "r") as f:
> -        cve_data = json.load(f)
> -
> -    with open(datadir / "data" / "stream_fixes.json", "r") as f:
> -        stream_data = json.load(f)
> +    base_version = Version(f"{version.major}.{version.minor}")
>  
>      print(f"""
>  # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
> @@ -55,17 +109,23 @@ python check_kernel_cve_status_version() {{
>  do_cve_check[prefuncs] += "check_kernel_cve_status_version"
>  """)
>  
> -    for cve, data in cve_data.items():
> -        if "affected_versions" not in data:
> -            print(f"# Skipping {cve}, no affected_versions")
> -            print()
> -            continue
> +    # Loop though all CVES and check if they are kernel related, newer than 2015
> +    pattern = os.path.join(datadir, '**', "CVE-20*.json")
>  
> -        affected = data["affected_versions"]
> -        first_affected, fixed = re.search(r"(.+) to (.+)", affected).groups()
> -        first_affected = parse_version(first_affected)
> -        fixed = parse_version(fixed)
> +    files = glob.glob(pattern, recursive=True)
> +    for cve_file in sorted(files):
> +        # Get CVE Id
> +        cve = cve_file[cve_file.rfind("/")+1:cve_file.rfind(".json")]
> +        # We process from 2015 data, old request are not properly formated
> +        year = cve.split("-")[1]
> +        if int(year) < 2015:
> +            continue
> +        with open(cve_file, 'r', encoding='utf-8') as json_file:
> +            cve_info = json.load(json_file)
>  
> +        if not is_linux_cve(cve_info):
> +            continue
> +        first_affected, fixed, backport_ver = get_fixed_versions(cve_info, base_version)
>          if not fixed:
>              print(f"# {cve} has no known resolution")
>          elif first_affected and version < first_affected:
> @@ -75,19 +135,13 @@ do_cve_check[prefuncs] += "check_kernel_cve_status_version"
>                  f'CVE_STATUS[{cve}] = "fixed-version: Fixed from version {fixed}"'
>              )
>          else:
> -            if cve in stream_data:
> -                backport_data = stream_data[cve]
> -                if base_version in backport_data:
> -                    backport_ver = Version(backport_data[base_version]["fixed_version"])
> -                    if backport_ver <= version:
> -                        print(
> -                            f'CVE_STATUS[{cve}] = "cpe-stable-backport: Backported in {backport_ver}"'
> -                        )
> -                    else:
> -                        # TODO print a note that the kernel needs bumping
> -                        print(f"# {cve} needs backporting (fixed from {backport_ver})")
> +            if backport_ver:
> +                if backport_ver <= version:
> +                    print(
> +                        f'CVE_STATUS[{cve}] = "cpe-stable-backport: Backported in {backport_ver}"'
> +                    )
>                  else:
> -                    print(f"# {cve} needs backporting (fixed from {fixed})")
> +                    print(f"# {cve} needs backporting (fixed from {backport_ver})")
>              else:
>                  print(f"# {cve} needs backporting (fixed from {fixed})")
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214634): https://lists.openembedded.org/g/openembedded-core/message/214634
> Mute This Topic: https://lists.openembedded.org/mt/112188268/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


