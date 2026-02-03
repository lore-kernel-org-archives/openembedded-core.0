Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A969EE87842
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 15:40:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19375.1770133199675832084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 07:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0wIzXejx;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48069a48629so59931385e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 07:39:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770133198; cv=none;
        d=google.com; s=arc-20240605;
        b=bYOcj+EzTqfA6pYv/4WGoT4LBfafPlt5DbmDG5RTNulhWE1vYSQRNAqoS4dcd2zUuE
         QSuRNb2rx7aE8FjwSlaLXDprKEGn4eo4eTAJmri22I6LB0NiNFbQobdSV8oliEZD3e1E
         Xh7ftk7XDloHPi1mb3ugLXt+1hl3X8k8qXEjDZ4z/HzDZSlBw8NtjiHxTNVI8kDL6utK
         +vHP+4DwsnMfO0ZwkeYaklJfdxTOUUzHrtz8qwObB3RZxOGEqjY7U19LGKZPGNJz20tg
         ojlg11mEo1v1l+nhJ64ypCdMOoicAB9oC4qeIpNglv6P74H/zpHHv6JfzYj02MO1DNba
         8zSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=esjmNgDVd6DQc3XQ0WKO6wEyt1L9uK2unnMXcWLHD4A=;
        fh=tgFbBwuvB3ycpsxc9APNcTjnhDp4v2CQQ6xv921RrVs=;
        b=SgFAVzf4ZxRq1o4MFhOMEV2L5MbnIk+nxxjMuTxfzdGm6UFeOp7PGzroktarwxIr1g
         qywBO0le7HDFLFwAH5xN8/e2Sb9am5URinZL0xJP/rbqKCED5N8A63dkIZVp49IChzyN
         DdCtbpNBCXKqYbrKe3W3V0Fa6T/Bh6mtWHavXF/rvyGXkNIf8g7Qxpo+QGiuAc8mQSWw
         g2hUfZjo1/3c7v50rQXTVUqERH40/IX9+KWFJV67KdHd6J2SPZNmsHIFzkYfC21yaXWD
         PvOelDOSRHo6Gand21ss6myNy2xNscfavntuR2VOa/IfSY7uuUedrXliQbNugzzJt4wG
         xn4A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770133198; x=1770737998; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=esjmNgDVd6DQc3XQ0WKO6wEyt1L9uK2unnMXcWLHD4A=;
        b=0wIzXejxfczFhtdcWV2ui4E5OT8ec4o6ddviw2hR3HdfxZ+77cU/y0w2uapU9sjMXw
         y5wvCka6IhKhMXjUqPR6rRz/QMn+WdHrSRYVSmiDj9y5+iUAJutGbfqWi+OoTF+4W1OF
         ZUMIAu9cIwE2w9Mr9uJ6jYxtWjoXlj6asb0Q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133198; x=1770737998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esjmNgDVd6DQc3XQ0WKO6wEyt1L9uK2unnMXcWLHD4A=;
        b=EcH3xM/3vx5HiwCFyNJKnWd4CoMnpTbe3TjCCtc+vO1qo3WnMjShp//20WKonF9cTE
         qXvrMhtC+Lhc2JfIvq9dnoqlmrLeOREI1Qebo2YpmNWHFDvvvnb/OCesnQPQuGIWUGPr
         mA7RejUEBqPJKxiKAzRSushbQCFTEThVfbVU5cGTDbR1EGB68l/xN5HBrL24wHgCzo8g
         ZjA4zZXQDIINfG+HJ4uiW23gU0taYY+b8G98RJdylJdEoniIIZnGdWXWm+H5LPMCmcFU
         RN629p8Z+7xsHzZ1hiKHQMzJQEBc/wS3OeCQNXV9gOpP+tBBExvBxVZUb1fXkOLLFq7o
         X3VQ==
X-Gm-Message-State: AOJu0YxVukwtjSeVaIb5mmjCD8icYJ3utAUw6CTqOeijXgFn9Yt5VMXq
	K1PPLwIKTL1v5TLSV9216DB7xybnrlzzyeu/aLpUYWUyC37YGy0PEfcSUfzuLvIuriF3ADn13eY
	1so2dmF4zoMyiMyuua8fukVxxEuLIY3FXDX2eJJo2dQ==
X-Gm-Gg: AZuq6aJ7K64w8NIaAqmoxykEoUpRI7+Z2nqBQ47fjF6i3eiWh0QR87xiTqOmPldJ+z1
	rztdsNN/DEyIt2Z0x5MCboeRgcY8knS1j3oWYwY97aTY6Irz+CypikajmjUfNIQ5XnBhEThalDH
	dEfFmI662Zg2xe5H7Fn8bcXiBMjN7bdvMbWvEQWnXhO7uxFifvjnzSrpadUCIvYLc7b+/y22g67
	S8rZGp1G6oCIo5n9N2QyCrU+8LLMzr86VSMvQBKrqstVvXrKxrsg6JPGLSLuO8xlIs/0qtzM7M6
	9hp+xTFsfDxB2OPWBBtz1HBcSrblo1UrD7TUnWk=
X-Received: by 2002:a05:600c:8712:b0:480:4c45:aff5 with SMTP id
 5b1f17b1804b1-4830e99408cmr351175e9.34.1770133197592; Tue, 03 Feb 2026
 07:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20260119133103.1151201-1-suresh.ha@bmwtechworks.in> <MAXP287MB42409B58ADEACA9F748E644DEE9DA@MAXP287MB4240.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MAXP287MB42409B58ADEACA9F748E644DEE9DA@MAXP287MB4240.INDP287.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 3 Feb 2026 16:39:31 +0100
X-Gm-Features: AZwV_Qi09E7MKRADqZ1oTRNPvz2Pra99i6KWZaOpvXFBORHqha2egstuBp0GjXI
Message-ID: <CAMSfU+6DXfuaG0uyPtEg5hE7oHqP=8pRhSttciF+NHcwr0Hpjg@mail.gmail.com>
Subject: Re: [OE-core] [poky][scarthgap][PATCH] improve_kernel_cve_report: add
 script for postprocesing of kernel CVE data
To: Suresh.HA@bmwtechworks.in
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Daniel Turull <daniel.turull@ericsson.com>, Peter Marko <peter.marko@siemens.com>, 
	Marta Rybczynska <rybczynska@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000072b4440649ed4028"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 15:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230461

--00000000000072b4440649ed4028
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 1 f=C3=A9vr. 2026 =C3=A0 17:33, Suresh H A via lists.openembedded.o=
rg
<Suresh.HA=3Dbmwtechworks.in@lists.openembedded.org> a =C3=A9crit :

> Hello maintainers,
>
> Could you please let me know whether this backport is being considered, o=
r
> if any additional information or changes are required?
>

Hello,

This change is clearly a new feature and thus should be rejected from
stables by policy.
But, since this is contrib/ I don't mind letting this through testing and
review.

We'll see what the community thinks.

In addition, I noticed a few other related fixes in the mainline branch
> which may also be relevant for scarthgap. Please let me know if you would
> prefer that I submit separate backport patches for those changes as well.
>

As long as those are only bug fixes, they may qualify for stable inclusion.

Regards,


> The fix is relevant for the scarthgap as well, and I would appreciate any
> guidance on the status of backport.
>
> Thanks,
> Suresh H A
> ------------------------------
> *From:* Suresh H A <Suresh.HA@bmwtechworks.in>
> *Sent:* Monday, January 19, 2026 7:01:03 PM
> *To:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; Suresh H A <
> Suresh.HA@bmwtechworks.in>
> *Cc:* Daniel Turull <daniel.turull@ericsson.com>; Peter Marko <
> peter.marko@siemens.com>; Marta Rybczynska <rybczynska@gmail.com>;
> Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; Richard Purdie
> <richard.purdie@linuxfoundation.org>
> *Subject:* [poky][scarthgap][PATCH] improve_kernel_cve_report: add script
> for postprocesing of kernel CVE data
>
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Adding postprocessing script to process data from linux CNA that includes
> more accurate metadata and it is updated directly by the source.
>
> Example of enhanced CVE from a report from cve-check:
>
> {
>   "id": "CVE-2024-26710",
>   "status": "Ignored",
>   "link": "
> https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.n=
ist.gov%2Fvuln%2Fdetail%2FCVE-2024-26710&data=3D05%7C02%7Csuresh.ha%40bmwte=
chworks.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd10314cc68c56488f3c6=
1cd05%7C0%7C0%7C639044263030909714%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki=
OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3=
D%7C0%7C%7C%7C&sdata=3DBsKNia%2BODStTgGaRUtZpglMWs7s5Tn0cSH06R%2FNgTK0%3D&r=
eserved=3D0
> <https://nvd.nist.gov/vuln/detail/CVE-2024-26710>",
>   "summary": "In the Linux kernel, the following vulnerability [...]",
>   "scorev2": "0.0",
>   "scorev3": "5.5",
>   "scorev4": "0.0",
>   "modified": "2025-03-17T15:36:11.620",
>   "vector": "LOCAL",
>   "vectorString": "CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H",
>   "detail": "not-applicable-config",
>   "description": "Source code not compiled by config.
> ['arch/powerpc/include/asm/thread_info.h']"
> },
>
> And same from a report generated with vex:
> {
>   "id": "CVE-2024-26710",
>   "status": "Ignored",
>   "link": "
> https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.n=
ist.gov%2Fvuln%2Fdetail%2FCVE-2024-26710&data=3D05%7C02%7Csuresh.ha%40bmwte=
chworks.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd10314cc68c56488f3c6=
1cd05%7C0%7C0%7C639044263030930030%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki=
OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3=
D%7C0%7C%7C%7C&sdata=3DbNwat5zDiTj6qNii7ZwAO2nW%2BWr0tpn1FqDMVrT%2FkjE%3D&r=
eserved=3D0
> <https://nvd.nist.gov/vuln/detail/CVE-2024-26710>",
>   "detail": "not-applicable-config",
>   "description": "Source code not compiled by config.
> ['arch/powerpc/include/asm/thread_info.h']"
> },
>
> For unpatched CVEs, provide more context in the description:
> Tested with 6.12.22 kernel
> {
>   "id": "CVE-2025-39728",
>   "status": "Unpatched",
>   "link": "
> https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.n=
ist.gov%2Fvuln%2Fdetail%2FCVE-2025-39728&data=3D05%7C02%7Csuresh.ha%40bmwte=
chworks.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd10314cc68c56488f3c6=
1cd05%7C0%7C0%7C639044263030942329%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki=
OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3=
D%7C0%7C%7C%7C&sdata=3D%2FbXetEZuocKcHrchGkGoLU2rKhPy605fM%2BRygKfw10I%3D&r=
eserved=3D0
> <https://nvd.nist.gov/vuln/detail/CVE-2025-39728>",
>   "summary": "In the Linux kernel, the following vulnerability has been
> [...],
>   "scorev2": "0.0",
>   "scorev3": "0.0",
>   "scorev4": "0.0",
>   "modified": "2025-04-21T14:23:45.950",
>   "vector": "UNKNOWN",
>   "vectorString": "UNKNOWN",
>   "detail": "version-in-range",
>   "description": "Needs backporting (fixed from 6.12.23)"
> },
>
> CC: Peter Marko <peter.marko@siemens.com>
> CC: Marta Rybczynska <rybczynska@gmail.com>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit e60b1759c1aea5b8f5317e46608f0a3e782ecf57)
> Signed-off-by: Suresh H A <suresh.ha@bmwtechworks.in>
> ---
>  scripts/contrib/improve_kernel_cve_report.py | 467 +++++++++++++++++++
>  1 file changed, 467 insertions(+)
>  create mode 100755 scripts/contrib/improve_kernel_cve_report.py
>
> diff --git a/scripts/contrib/improve_kernel_cve_report.py
> b/scripts/contrib/improve_kernel_cve_report.py
> new file mode 100755
> index 0000000000..829cc4cd30
> --- /dev/null
> +++ b/scripts/contrib/improve_kernel_cve_report.py
> @@ -0,0 +1,467 @@
> +#! /usr/bin/env python3
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# The script uses another source of CVE information from linux-vulns
> +# to enrich the cve-summary from cve-check or vex.
> +# It can also use the list of compiled files from the kernel spdx to
> ignore CVEs
> +# that are not affected since the files are not compiled.
> +#
> +# It creates a new json file with updated CVE information
> +#
> +# Compiled files can be extracted adding the following in local.conf
> +# SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"
> +#
> +# Tested with the following CVE sources:
> +# -
> https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ernel.org%2Fpub%2Fscm%2Flinux%2Fsecurity%2Fvulns.git&data=3D05%7C02%7Csures=
h.ha%40bmwtechworks.in%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd10314cc=
68c56488f3c61cd05%7C0%7C0%7C639044263030955837%7CUnknown%7CTWFpbGZsb3d8eyJF=
bXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld=
UIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DkgOmuhM5qTAwa3AODvJoeFc6pUz%2FeTmTkSdW1R=
JOiqY%3D&reserved=3D0
> <https://git.kernel.org/pub/scm/linux/security/vulns.git>
> +# -
> https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FCVEProject%2FcvelistV5&data=3D05%7C02%7Csuresh.ha%40bmwtechworks.in=
%7Cdd87cc08dfad491b4c5b08de575f1452%7C970fa6fd10314cc68c56488f3c61cd05%7C0%=
7C0%7C639044263030969928%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl=
YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7=
C%7C&sdata=3DtYCYdFOW5WGgUSVUKSt02HMCe8ynmRzOu78YCO%2Fi2UI%3D&reserved=3D0
> <https://github.com/CVEProject/cvelistV5>
> +#
> +# Example:
> +# python3
> ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py --spdx
> tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.json
> --kernel-version 6.12.27 --datadir ./vulns
> +# python3
> ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py --spdx
> tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.json
> --datadir ./vulns --old-cve-report build/tmp/log/cve/cve-summary.json
> +#
> +# SPDX-License-Identifier: GPLv2
> +
> +import argparse
> +import json
> +import sys
> +import logging
> +import glob
> +import os
> +import pathlib
> +from packaging.version import Version
> +
> +def is_linux_cve(cve_info):
> +    '''Return true is the CVE belongs to Linux'''
> +    if not "affected" in cve_info["containers"]["cna"]:
> +        return False
> +    for affected in cve_info["containers"]["cna"]["affected"]:
> +        if not "product" in affected:
> +            return False
> +        if affected["product"] =3D=3D "Linux" and affected["vendor"] =3D=
=3D
> "Linux":
> +            return True
> +    return False
> +
> +def get_kernel_cves(datadir, compiled_files, version):
> +    """
> +    Get CVEs for the kernel
> +    """
> +    cves =3D {}
> +
> +    check_config =3D len(compiled_files) > 0
> +
> +    base_version =3D Version(f"{version.major}.{version.minor}")
> +
> +    # Check all CVES from kernel vulns
> +    pattern =3D os.path.join(datadir, '**', "CVE-*.json")
> +    cve_files =3D glob.glob(pattern, recursive=3DTrue)
> +    not_applicable_config =3D 0
> +    fixed_as_later_backport =3D 0
> +    vulnerable =3D 0
> +    not_vulnerable =3D 0
> +    for cve_file in sorted(cve_files):
> +        cve_info =3D {}
> +        with open(cve_file, "r", encoding=3D'ISO-8859-1') as f:
> +            cve_info =3D json.load(f)
> +
> +        if len(cve_info) =3D=3D 0:
> +            logging.error("Not valid data in %s. Aborting", cve_file)
> +            break
> +
> +        if not is_linux_cve(cve_info):
> +            continue
> +        cve_id =3D os.path.basename(cve_file)[:-5]
> +        description =3D
> cve_info["containers"]["cna"]["descriptions"][0]["value"]
> +        if cve_file.find("rejected") >=3D 0:
> +            logging.debug("%s is rejected by the CNA", cve_id)
> +            cves[cve_id] =3D {
> +                "id": cve_id,
> +                "status": "Ignored",
> +                "detail": "rejected",
> +                "summary": description,
> +                "description": f"Rejected by CNA"
> +            }
> +            continue
> +        if any(elem in cve_file for elem in ["review", "reverved",
> "testing"]):
> +            continue
> +
> +        is_vulnerable, first_affected, last_affected, better_match_first=
,
> better_match_last, affected_versions =3D get_cpe_applicability(cve_info,
> version)
> +
> +        logging.debug("%s: %s (%s - %s) (%s - %s)", cve_id,
> is_vulnerable, better_match_first, better_match_last, first_affected,
> last_affected)
> +
> +        if is_vulnerable is None:
> +            logging.warning("%s doesn't have good metadata", cve_id)
> +        if is_vulnerable:
> +            is_affected =3D True
> +            affected_files =3D []
> +            if check_config:
> +                is_affected, affected_files =3D
> check_kernel_compiled_files(compiled_files, cve_info)
> +
> +            if not is_affected and len(affected_files) > 0:
> +                logging.debug(
> +                    "%s - not applicable configuration since affected
> files not compiled: %s",
> +                    cve_id, affected_files)
> +                cves[cve_id] =3D {
> +                    "id": cve_id,
> +                    "status": "Ignored",
> +                    "detail": "not-applicable-config",
> +                    "summary": description,
> +                    "description": f"Source code not compiled by config.
> {affected_files}"
> +                }
> +                not_applicable_config +=3D1
> +            # Check if we have backport
> +            else:
> +                if not better_match_last:
> +                    fixed_in =3D last_affected
> +                else:
> +                    fixed_in =3D better_match_last
> +                logging.debug("%s needs backporting (fixed from %s)",
> cve_id, fixed_in)
> +                cves[cve_id] =3D {
> +                        "id": cve_id,
> +                        "status": "Unpatched",
> +                        "detail": "version-in-range",
> +                        "summary": description,
> +                        "description": f"Needs backporting (fixed from
> {fixed_in})"
> +                }
> +                vulnerable +=3D 1
> +                if (better_match_last and
> +
> Version(f"{better_match_last.major}.{better_match_last.minor}") =3D=3D
> base_version):
> +                    fixed_as_later_backport +=3D 1
> +        # Not vulnerable
> +        else:
> +            if not first_affected:
> +                logging.debug("%s - not known affected %s",
> +                              cve_id,
> +                              better_match_last)
> +                cves[cve_id] =3D {
> +                    "id": cve_id,
> +                    "status": "Patched",
> +                    "detail": "version-not-in-range",
> +                    "summary": description,
> +                    "description": "No CPE match"
> +                }
> +                not_vulnerable +=3D 1
> +                continue
> +            backport_base =3D
> Version(f"{better_match_last.major}.{better_match_last.minor}")
> +            if version < first_affected:
> +                logging.debug('%s - fixed-version: only affects %s
> onwards',
> +                              cve_id,
> +                              first_affected)
> +                cves[cve_id] =3D {
> +                    "id": cve_id,
> +                    "status": "Patched",
> +                    "detail": "fixed-version",
> +                    "summary": description,
> +                    "description": f"only affects {first_affected}
> onwards"
> +                }
> +                not_vulnerable +=3D 1
> +            elif last_affected <=3D version:
> +                logging.debug("%s - fixed-version: Fixed from version %s=
",
> +                              cve_id,
> +                              last_affected)
> +                cves[cve_id] =3D {
> +                    "id": cve_id,
> +                    "status": "Patched",
> +                    "detail": "fixed-version",
> +                    "summary": description,
> +                    "description": f"fixed-version: Fixed from version
> {last_affected}"
> +                }
> +                not_vulnerable +=3D 1
> +            elif backport_base =3D=3D base_version:
> +                logging.debug("%s - cpe-stable-backport: Backported in
> %s",
> +                              cve_id,
> +                              better_match_last)
> +                cves[cve_id] =3D {
> +                    "id": cve_id,
> +                    "status": "Patched",
> +                    "detail": "cpe-stable-backport",
> +                    "summary": description,
> +                    "description": f"Backported in {better_match_last}"
> +                }
> +                not_vulnerable +=3D 1
> +            else:
> +                logging.debug("%s - version not affected %s", cve_id,
> str(affected_versions))
> +                cves[cve_id] =3D {
> +                    "id": cve_id,
> +                    "status": "Patched",
> +                    "detail": "version-not-in-range",
> +                    "summary": description,
> +                    "description": f"Range {affected_versions}"
> +                }
> +                not_vulnerable +=3D 1
> +
> +    logging.info("Total CVEs ignored due to not applicable config: %d",
> not_applicable_config)
> +    logging.info("Total CVEs not vulnerable due version-not-in-range:
> %d", not_vulnerable)
> +    logging.info("Total vulnerable CVEs: %d", vulnerable)
> +
> +    logging.info("Total CVEs already backported in %s: %s", base_version=
,
> +                    fixed_as_later_backport)
> +    return cves
> +
> +def read_spdx(spdx_file):
> +    '''Open SPDX file and extract compiled files'''
> +    with open(spdx_file, 'r', encoding=3D'ISO-8859-1') as f:
> +        spdx =3D json.load(f)
> +        if "spdxVersion" in spdx:
> +            if spdx["spdxVersion"] =3D=3D "SPDX-2.2":
> +                return read_spdx2(spdx)
> +        if "@graph" in spdx:
> +            return read_spdx3(spdx)
> +    return []
> +
> +def read_spdx2(spdx):
> +    '''
> +    Read spdx2 compiled files from spdx
> +    '''
> +    cfiles =3D set()
> +    if 'files' not in spdx:
> +        return cfiles
> +    for item in spdx['files']:
> +        for ftype in item['fileTypes']:
> +            if ftype =3D=3D "SOURCE":
> +                filename =3D item["fileName"][item["fileName"].find("/")=
+1:]
> +                cfiles.add(filename)
> +    return cfiles
> +
> +def read_spdx3(spdx):
> +    '''
> +    Read spdx3 compiled files from spdx
> +    '''
> +    cfiles =3D set()
> +    for item in spdx["@graph"]:
> +        if "software_primaryPurpose" not in item:
> +            continue
> +        if item["software_primaryPurpose"] =3D=3D "source":
> +            filename =3D item['name'][item['name'].find("/")+1:]
> +            cfiles.add(filename)
> +    return cfiles
> +
> +def check_kernel_compiled_files(compiled_files, cve_info):
> +    """
> +    Return if a CVE affected us depending on compiled files
> +    """
> +    files_affected =3D set()
> +    is_affected =3D False
> +
> +    for item in cve_info['containers']['cna']['affected']:
> +        if "programFiles" in item:
> +            for f in item['programFiles']:
> +                if f not in files_affected:
> +                    files_affected.add(f)
> +
> +    if len(files_affected) > 0:
> +        for f in files_affected:
> +            if f in compiled_files:
> +                logging.debug("File match: %s", f)
> +                is_affected =3D True
> +    return is_affected, files_affected
> +
> +def get_cpe_applicability(cve_info, v):
> +    '''
> +    Check if version is affected and return affected versions
> +    '''
> +    base_branch =3D Version(f"{v.major}.{v.minor}")
> +    affected =3D []
> +    if not 'cpeApplicability' in cve_info["containers"]["cna"]:
> +        return None, None, None, None, None, None
> +
> +    for nodes in cve_info["containers"]["cna"]["cpeApplicability"]:
> +        for node in nodes.values():
> +            vulnerable =3D False
> +            matched_branch =3D False
> +            first_affected =3D Version("5000")
> +            last_affected =3D Version("0")
> +            better_match_first =3D Version("0")
> +            better_match_last =3D Version("5000")
> +
> +            if len(node[0]['cpeMatch']) =3D=3D 0:
> +                first_affected =3D None
> +                last_affected =3D None
> +                better_match_first =3D None
> +                better_match_last =3D None
> +
> +            for cpe_match in node[0]['cpeMatch']:
> +                version_start_including =3D Version("0")
> +                version_end_excluding =3D Version("0")
> +                if 'versionStartIncluding' in cpe_match:
> +                    version_start_including =3D
> Version(cpe_match['versionStartIncluding'])
> +                else:
> +                    version_start_including =3D Version("0")
> +                # if versionEndExcluding is missing we are in a branch,
> which is not fixed.
> +                if "versionEndExcluding" in cpe_match:
> +                    version_end_excluding =3D
> Version(cpe_match["versionEndExcluding"])
> +                else:
> +                    # if versionEndExcluding is missing we are in a
> branch, which is not fixed.
> +                    version_end_excluding =3D Version(
> +
> f"{version_start_including.major}.{version_start_including.minor}.5000"
> +                    )
> +                affected.append(f"
> {version_start_including}-{version_end_excluding}")
> +                # Detect if versionEnd is in fixed in base branch. It ha=
s
> precedence over the rest
> +                branch_end =3D
> Version(f"{version_end_excluding.major}.{version_end_excluding.minor}")
> +                if branch_end =3D=3D base_branch:
> +                    if version_start_including <=3D v <
> version_end_excluding:
> +                        vulnerable =3D cpe_match['vulnerable']
> +                    # If we don't match in our branch, we are not
> vulnerable,
> +                    # since we have a backport
> +                    matched_branch =3D True
> +                    better_match_first =3D version_start_including
> +                    better_match_last =3D version_end_excluding
> +                if version_start_including <=3D v < version_end_excludin=
g
> and not matched_branch:
> +                    if version_end_excluding < better_match_last:
> +                        better_match_first =3D max(version_start_includi=
ng,
> better_match_first)
> +                        better_match_last =3D min(better_match_last,
> version_end_excluding)
> +                        vulnerable =3D cpe_match['vulnerable']
> +                        matched_branch =3D True
> +
> +                first_affected =3D min(version_start_including,
> first_affected)
> +                last_affected =3D max(version_end_excluding, last_affect=
ed)
> +            # Not a better match, we use the first and last affected
> instead of the fake .5000
> +            if vulnerable and better_match_last =3D=3D
> Version(f"{base_branch}.5000"):
> +                better_match_last =3D last_affected
> +                better_match_first =3D first_affected
> +    return vulnerable, first_affected, last_affected, better_match_first=
,
> better_match_last, affected
> +
> +def copy_data(old, new):
> +    '''Update dictionary with new entries, while keeping the old ones'''
> +    for k in new.keys():
> +        old[k] =3D new[k]
> +    return old
> +
> +# Function taken from cve_check.bbclass. Adapted to cve fields
> +def cve_update(cve_data, cve, entry):
> +    # If no entry, just add it
> +    if cve not in cve_data:
> +        cve_data[cve] =3D entry
> +        return
> +    # If we are updating, there might be change in the status
> +    if cve_data[cve]['status'] =3D=3D "Unknown":
> +        cve_data[cve] =3D copy_data(cve_data[cve], entry)
> +        return
> +    if cve_data[cve]['status'] =3D=3D entry['status']:
> +        return
> +    if entry['status'] =3D=3D "Unpatched" and cve_data[cve]['status'] =
=3D=3D
> "Patched":
> +        logging.warning("CVE entry %s update from Patched to Unpatched
> from the scan result", cve)
> +        cve_data[cve] =3D copy_data(cve_data[cve], entry)
> +        return
> +    if entry['status'] =3D=3D "Patched" and cve_data[cve]['status'] =3D=
=3D
> "Unpatched":
> +        logging.warning("CVE entry %s update from Unpatched to Patched
> from the scan result", cve)
> +        cve_data[cve] =3D copy_data(cve_data[cve], entry)
> +        return
> +    # If we have an "Ignored", it has a priority
> +    if cve_data[cve]['status'] =3D=3D "Ignored":
> +        logging.debug("CVE %s not updating because Ignored", cve)
> +        return
> +    # If we have an "Ignored", it has a priority
> +    if entry['status'] =3D=3D "Ignored":
> +        cve_data[cve] =3D copy_data(cve_data[cve], entry)
> +        logging.debug("CVE entry %s updated from Unpatched to Ignored",
> cve)
> +        return
> +    logging.warning("Unhandled CVE entry update for %s %s from %s %s to
> %s",
> +        cve, cve_data[cve]['status'], cve_data[cve]['detail'],
> entry['status'], entry['detail'])
> +
> +def main():
> +    parser =3D argparse.ArgumentParser(
> +        description=3D"Update cve-summary with kernel compiled files and
> kernel CVE information"
> +    )
> +    parser.add_argument(
> +        "-s",
> +        "--spdx",
> +        help=3D"SPDX2/3 for the kernel. Needs to include compiled source=
s",
> +    )
> +    parser.add_argument(
> +        "--datadir",
> +        type=3Dpathlib.Path,
> +        help=3D"Directory where CVE data is",
> +        required=3DTrue
> +    )
> +    parser.add_argument(
> +        "--old-cve-report",
> +        help=3D"CVE report to update. (Optional)",
> +    )
> +    parser.add_argument(
> +        "--kernel-version",
> +        help=3D"Kernel version. Needed if old cve_report is not provided
> (Optional)",
> +        type=3DVersion
> +    )
> +    parser.add_argument(
> +        "--new-cve-report",
> +        help=3D"Output file",
> +        default=3D"cve-summary-enhance.json"
> +    )
> +    parser.add_argument(
> +        "-D",
> +        "--debug",
> +        help=3D'Enable debug ',
> +        action=3D"store_true")
> +
> +    args =3D parser.parse_args()
> +
> +    if args.debug:
> +        log_level=3Dlogging.DEBUG
> +    else:
> +        log_level=3Dlogging.INFO
> +    logging.basicConfig(format=3D'[%(filename)s:%(lineno)d] %(message)s'=
,
> level=3Dlog_level)
> +
> +    if not args.kernel_version and not args.old_cve_report:
> +        parser.error("either --kernel-version or --old-cve-report are
> needed")
> +        return -1
> +
> +    # by default we don't check the compiled files, unless provided
> +    compiled_files =3D []
> +    if args.spdx:
> +        compiled_files =3D read_spdx(args.spdx)
> +        logging.info("Total compiled files %d", len(compiled_files))
> +
> +    if args.old_cve_report:
> +        with open(args.old_cve_report, encoding=3D'ISO-8859-1') as f:
> +            cve_report =3D json.load(f)
> +    else:
> +        #If summary not provided, we create one
> +        cve_report =3D {
> +            "version": "1",
> +            "package": [
> +                {
> +                    "name": "linux-yocto",
> +                    "version": str(args.kernel_version),
> +                    "products": [
> +                        {
> +                            "product": "linux_kernel",
> +                            "cvesInRecord": "Yes"
> +                        }
> +                    ],
> +                    "issue": []
> +                }
> +            ]
> +        }
> +
> +    for pkg in cve_report['package']:
> +        is_kernel =3D False
> +        for product in pkg['products']:
> +            if product['product'] =3D=3D "linux_kernel":
> +                is_kernel=3DTrue
> +        if not is_kernel:
> +            continue
> +
> +        kernel_cves =3D get_kernel_cves(args.datadir,
> +                                      compiled_files,
> +                                      Version(pkg["version"]))
> +        logging.info("Total kernel cves from kernel CNA: %s",
> len(kernel_cves))
> +        cves =3D {issue["id"]: issue for issue in pkg["issue"]}
> +        logging.info("Total kernel before processing cves: %s",
> len(cves))
> +
> +        for cve in kernel_cves:
> +            cve_update(cves, cve, kernel_cves[cve])
> +
> +        pkg["issue"] =3D []
> +        for cve in sorted(cves):
> +            pkg["issue"].extend([cves[cve]])
> +        logging.info("Total kernel cves after processing: %s",
> len(pkg['issue']))
> +
> +    with open(args.new_cve_report, "w", encoding=3D'ISO-8859-1') as f:
> +        json.dump(cve_report, f, indent=3D2)
> +
> +    return 0
> +
> +if __name__ =3D=3D "__main__":
> +    sys.exit(main())
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230338):
> https://lists.openembedded.org/g/openembedded-core/message/230338
> Mute This Topic: https://lists.openembedded.org/mt/117344199/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000072b4440649ed4028
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0
ciI+PGRpdiBkaXI9Imx0ciI+TGXCoGRpbS4gMSBmw6l2ci4gMjAyNiDDoMKgMTc6MzMsIFN1cmVz
aCBIIEEgdmlhIDxhIGhyZWY9Imh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnIiB0YXJnZXQ9
Il9ibGFuayI+bGlzdHMub3BlbmVtYmVkZGVkLm9yZzwvYT4gJmx0O1N1cmVzaC5IQT08YSBocmVm
PSJtYWlsdG86Ym13dGVjaHdvcmtzLmluQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciIHRhcmdldD0i
X2JsYW5rIj5ibXd0ZWNod29ya3MuaW5AbGlzdHMub3BlbmVtYmVkZGVkLm9yZzwvYT4mZ3Q7IGEg
w6ljcml0wqA6PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxibG9ja3F1b3RlIGNsYXNz
PSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVm
dDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCg0KDQoNCjxk
aXY+DQo8ZGl2IGRpcj0ibHRyIiBzdHlsZT0iZm9udC1mYW1pbHk6QXB0b3MsQXB0b3NfTVNGb250
U2VydmljZSwtYXBwbGUtc3lzdGVtLFJvYm90byxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtm
b250LXNpemU6MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj4NCkhlbGxvIG1haW50YWluZXJzLDwvZGl2
Pg0KPGRpdiBkaXI9Imx0ciIgc3R5bGU9ImZvbnQtZmFtaWx5OkFwdG9zLEFwdG9zX01TRm9udFNl
cnZpY2UsLWFwcGxlLXN5c3RlbSxSb2JvdG8sQXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9u
dC1zaXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+DQo8YnI+DQo8L2Rpdj4NCjxwIGRpcj0ibHRy
IiBzdHlsZT0idGV4dC1hbGlnbjpsZWZ0O3RleHQtaW5kZW50OjBweDtsaW5lLWhlaWdodDpub3Jt
YWw7dGV4dC10cmFuc2Zvcm06bm9uZTttYXJnaW46MHB4Ij4NCjxzcGFuIHN0eWxlPSJmb250LWZh
bWlseTpBcHRvcyxBcHRvc19NU0ZvbnRTZXJ2aWNlLC1hcHBsZS1zeXN0ZW0sUm9ib3RvLEFyaWFs
LEhlbHZldGljYSxzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxMnB0O2NvbG9yOnJnYigwLDAsMCkiPkNv
dWxkIHlvdSBwbGVhc2UgbGV0IG1lIGtub3cgd2hldGhlciB0aGlzIGJhY2twb3J0IGlzIGJlaW5n
IGNvbnNpZGVyZWQsIG9yIGlmIGFueSBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIG9yIGNoYW5nZXMN
CiBhcmUgcmVxdWlyZWQ/wqA8L3NwYW4+PC9wPjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pjxicj48
L2Rpdj48ZGl2PkhlbGxvLDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhpcyBjaGFuZ2UgaXMg
Y2xlYXJseSBhIG5ldyBmZWF0dXJlIGFuZCB0aHVzIHNob3VsZCBiZSByZWplY3RlZCBmcm9tIHN0
YWJsZXMgYnkgcG9saWN5LjwvZGl2PjxkaXY+QnV0LCBzaW5jZSB0aGlzIGlzIGNvbnRyaWIvIEkg
ZG9uJiMzOTt0IG1pbmQgbGV0dGluZyB0aGlzIHRocm91Z2ggdGVzdGluZyBhbmQgcmV2aWV3Ljwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+V2UmIzM5O2xsIHNlZSB3aGF0IHRoZSBjb21tdW5pdHkg
dGhpbmtzLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90
ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQg
cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2PjxwIGRpcj0ibHRyIiBzdHls
ZT0idGV4dC1hbGlnbjpsZWZ0O3RleHQtaW5kZW50OjBweDtsaW5lLWhlaWdodDpub3JtYWw7dGV4
dC10cmFuc2Zvcm06bm9uZTttYXJnaW4tcmlnaHQ6MHB4O21hcmdpbi1sZWZ0OjBweCI+PHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5OkFwdG9zLEFwdG9zX01TRm9udFNlcnZpY2UsLWFwcGxlLXN5c3Rl
bSxSb2JvdG8sQXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQ7Y29sb3I6
cmdiKDAsMCwwKSI+SW4gYWRkaXRpb24sIEkgbm90aWNlZCBhIGZldyBvdGhlciByZWxhdGVkIGZp
eGVzIGluIHRoZSBtYWlubGluZSBicmFuY2ggd2hpY2ggbWF5IGFsc28gYmUgcmVsZXZhbnQgZm9y
IHNjYXJ0aGdhcC4NCiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHdvdWxkIHByZWZlciB0aGF0
IEkgc3VibWl0IHNlcGFyYXRlIGJhY2twb3J0IHBhdGNoZXMgZm9yIHRob3NlIGNoYW5nZXMgYXMg
d2VsbC48L3NwYW4+PC9wPjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PkFz
IGxvbmcgYXMgdGhvc2UgYXJlIG9ubHkgYnVnIGZpeGVzLCB0aGV5IG1heSBxdWFsaWZ5IGZvciBz
dGFibGUgaW5jbHVzaW9uLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+UmVnYXJkcyw8L2Rpdj48
ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2lu
OjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQp
O3BhZGRpbmctbGVmdDoxZXgiPjxkaXY+PHAgc3R5bGU9InRleHQtYWxpZ246bGVmdDt0ZXh0LWlu
ZGVudDowcHg7bGluZS1oZWlnaHQ6bm9ybWFsO3RleHQtdHJhbnNmb3JtOm5vbmU7bWFyZ2luOjBw
eCI+DQo8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6QXB0b3MsQXB0b3NfTVNGb250U2VydmljZSwt
YXBwbGUtc3lzdGVtLFJvYm90byxBcmlhbCxIZWx2ZXRpY2Esc2Fucy1zZXJpZjtmb250LXNpemU6
MTJwdDtjb2xvcjpyZ2IoMCwwLDApIj5UaGUgZml4IGlzIHJlbGV2YW50IGZvciB0aGUgc2NhcnRo
Z2FwIGFzIHdlbGwsIGFuZCBJIHdvdWxkIGFwcHJlY2lhdGUgYW55IGd1aWRhbmNlIG9uIHRoZSBz
dGF0dXMgb2YgYmFja3BvcnQuPC9zcGFuPsKgPGJyPjxicj48L3A+PC9kaXY+PC9ibG9ja3F1b3Rl
PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBw
eCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxl
ZnQ6MWV4Ij48ZGl2PjxkaXYgZGlyPSJsdHIiIHN0eWxlPSJmb250LWZhbWlseTpBcHRvcyxBcHRv
c19NU0ZvbnRTZXJ2aWNlLC1hcHBsZS1zeXN0ZW0sUm9ib3RvLEFyaWFsLEhlbHZldGljYSxzYW5z
LXNlcmlmO2ZvbnQtc2l6ZToxMnB0O2NvbG9yOnJnYigwLDAsMCkiPg0KVGhhbmtzLDwvZGl2Pg0K
PGRpdiBkaXI9Imx0ciIgc3R5bGU9ImZvbnQtZmFtaWx5OkFwdG9zLEFwdG9zX01TRm9udFNlcnZp
Y2UsLWFwcGxlLXN5c3RlbSxSb2JvdG8sQXJpYWwsSGVsdmV0aWNhLHNhbnMtc2VyaWY7Zm9udC1z
aXplOjEycHQ7Y29sb3I6cmdiKDAsMCwwKSI+DQpTdXJlc2ggSCBBPC9kaXY+DQo8aHIgc3R5bGU9
ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSI+DQo8ZGl2IGlkPSJtXzE4NzgyMDIwNDEz
MDcwODk0Nm1fLTY0MDc4ODcxNzUxNjA2NTkyNzltXy00ODkwMTIzNTM5MjQ0MTgxMDk2bV85MTM1
MjQ1OTk2NjUwNDA1MzkwZGl2UnBseUZ3ZE1zZyIgZGlyPSJsdHIiPjxmb250IGZhY2U9IkNhbGli
cmksIHNhbnMtc2VyaWYiIHN0eWxlPSJmb250LXNpemU6MTFwdCIgY29sb3I9IiMwMDAwMDAiPjxi
PkZyb206PC9iPiBTdXJlc2ggSCBBICZsdDs8YSBocmVmPSJtYWlsdG86U3VyZXNoLkhBQGJtd3Rl
Y2h3b3Jrcy5pbiIgdGFyZ2V0PSJfYmxhbmsiPlN1cmVzaC5IQUBibXd0ZWNod29ya3MuaW48L2E+
Jmd0Ozxicj4NCjxiPlNlbnQ6PC9iPiBNb25kYXksIEphbnVhcnkgMTksIDIwMjYgNzowMTowMyBQ
TTxicj4NCjxiPlRvOjwvYj4gPGEgaHJlZj0ibWFpbHRvOm9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmciIHRhcmdldD0iX2JsYW5rIj5vcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPC9hPiAmbHQ7PGEgaHJlZj0ibWFpbHRvOm9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciIHRhcmdldD0iX2JsYW5rIj5vcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPC9hPiZndDs7IFN1cmVzaCBIIEEgJmx0OzxhIGhy
ZWY9Im1haWx0bzpTdXJlc2guSEFAYm13dGVjaHdvcmtzLmluIiB0YXJnZXQ9Il9ibGFuayI+U3Vy
ZXNoLkhBQGJtd3RlY2h3b3Jrcy5pbjwvYT4mZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBEYW5pZWwgVHVy
dWxsICZsdDs8YSBocmVmPSJtYWlsdG86ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20iIHRhcmdl
dD0iX2JsYW5rIj5kYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbTwvYT4mZ3Q7OyBQZXRlciBNYXJr
byAmbHQ7PGEgaHJlZj0ibWFpbHRvOnBldGVyLm1hcmtvQHNpZW1lbnMuY29tIiB0YXJnZXQ9Il9i
bGFuayI+cGV0ZXIubWFya29Ac2llbWVucy5jb208L2E+Jmd0OzsgTWFydGEgUnliY3p5bnNrYSAm
bHQ7PGEgaHJlZj0ibWFpbHRvOnJ5YmN6eW5za2FAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+
cnliY3p5bnNrYUBnbWFpbC5jb208L2E+Jmd0OzsgTWF0aGlldSBEdWJvaXMtQnJpYW5kICZsdDs8
YSBocmVmPSJtYWlsdG86bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tIiB0YXJnZXQ9
Il9ibGFuayI+bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPC9hPiZndDs7IFJpY2hh
cmQgUHVyZGllICZsdDs8YSBocmVmPSJtYWlsdG86cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0
aW9uLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc8L2E+Jmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBbcG9reV1bc2NhcnRoZ2FwXVtQQVRDSF0g
aW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydDogYWRkIHNjcmlwdCBmb3IgcG9zdHByb2Nlc2luZyBv
ZiBrZXJuZWwgQ1ZFIGRhdGE8L2ZvbnQ+DQo8ZGl2PsKgPC9kaXY+DQo8L2Rpdj4NCjxkaXY+PGZv
bnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij4NCjxkaXY+RnJvbTogRGFu
aWVsIFR1cnVsbCAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29t
IiB0YXJnZXQ9Il9ibGFuayI+ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb208L2E+Jmd0Ozxicj4N
Cjxicj4NCkFkZGluZyBwb3N0cHJvY2Vzc2luZyBzY3JpcHQgdG8gcHJvY2VzcyBkYXRhIGZyb20g
bGludXggQ05BIHRoYXQgaW5jbHVkZXMgbW9yZSBhY2N1cmF0ZSBtZXRhZGF0YSBhbmQgaXQgaXMg
dXBkYXRlZCBkaXJlY3RseSBieSB0aGUgc291cmNlLjxicj4NCjxicj4NCkV4YW1wbGUgb2YgZW5o
YW5jZWQgQ1ZFIGZyb20gYSByZXBvcnQgZnJvbSBjdmUtY2hlY2s6PGJyPg0KPGJyPg0Kezxicj4N
CsKgICZxdW90O2lkJnF1b3Q7OiAmcXVvdDtDVkUtMjAyNC0yNjcxMCZxdW90Oyw8YnI+DQrCoCAm
cXVvdDtzdGF0dXMmcXVvdDs6ICZxdW90O0lnbm9yZWQmcXVvdDssPGJyPg0KwqAgJnF1b3Q7bGlu
ayZxdW90OzogJnF1b3Q7PGEgaHJlZj0iaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwv
Q1ZFLTIwMjQtMjY3MTAiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2luZDAxLnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZudmQubmlzdC5nb3YlMkZ2
dWxuJTJGZGV0YWlsJTJGQ1ZFLTIwMjQtMjY3MTAmYW1wO2RhdGE9MDUlN0MwMiU3Q3N1cmVzaC5o
YSU0MGJtd3RlY2h3b3Jrcy5pbiU3Q2RkODdjYzA4ZGZhZDQ5MWI0YzViMDhkZTU3NWYxNDUyJTdD
OTcwZmE2ZmQxMDMxNGNjNjhjNTY0ODhmM2M2MWNkMDUlN0MwJTdDMCU3QzYzOTA0NDI2MzAzMDkw
OTcxNCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJbFlp
T2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlqb3lm
USUzRCUzRCU3QzAlN0MlN0MlN0MmYW1wO3NkYXRhPUJzS05pYSUyQk9EU3RUZ0dhUlV0WnBnbE1X
czdzNVRuMGNTSDA2UiUyRk5nVEswJTNEJmFtcDtyZXNlcnZlZD0wPC9hPiZxdW90Oyw8YnI+DQrC
oCAmcXVvdDtzdW1tYXJ5JnF1b3Q7OiAmcXVvdDtJbiB0aGUgTGludXgga2VybmVsLCB0aGUgZm9s
bG93aW5nIHZ1bG5lcmFiaWxpdHkgWy4uLl0mcXVvdDssPGJyPg0KwqAgJnF1b3Q7c2NvcmV2MiZx
dW90OzogJnF1b3Q7MC4wJnF1b3Q7LDxicj4NCsKgICZxdW90O3Njb3JldjMmcXVvdDs6ICZxdW90
OzUuNSZxdW90Oyw8YnI+DQrCoCAmcXVvdDtzY29yZXY0JnF1b3Q7OiAmcXVvdDswLjAmcXVvdDss
PGJyPg0KwqAgJnF1b3Q7bW9kaWZpZWQmcXVvdDs6ICZxdW90OzIwMjUtMDMtMTdUMTU6MzY6MTEu
NjIwJnF1b3Q7LDxicj4NCsKgICZxdW90O3ZlY3RvciZxdW90OzogJnF1b3Q7TE9DQUwmcXVvdDss
PGJyPg0KwqAgJnF1b3Q7dmVjdG9yU3RyaW5nJnF1b3Q7OiAmcXVvdDtDVlNTOjMuMS9BVjpML0FD
OkwvUFI6TC9VSTpOL1M6VS9DOk4vSTpOL0E6SCZxdW90Oyw8YnI+DQrCoCAmcXVvdDtkZXRhaWwm
cXVvdDs6ICZxdW90O25vdC1hcHBsaWNhYmxlLWNvbmZpZyZxdW90Oyw8YnI+DQrCoCAmcXVvdDtk
ZXNjcmlwdGlvbiZxdW90OzogJnF1b3Q7U291cmNlIGNvZGUgbm90IGNvbXBpbGVkIGJ5IGNvbmZp
Zy4gWyYjMzk7YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgmIzM5O10mcXVv
dDs8YnI+DQp9LDxicj4NCjxicj4NCkFuZCBzYW1lIGZyb20gYSByZXBvcnQgZ2VuZXJhdGVkIHdp
dGggdmV4Ojxicj4NCns8YnI+DQrCoCAmcXVvdDtpZCZxdW90OzogJnF1b3Q7Q1ZFLTIwMjQtMjY3
MTAmcXVvdDssPGJyPg0KwqAgJnF1b3Q7c3RhdHVzJnF1b3Q7OiAmcXVvdDtJZ25vcmVkJnF1b3Q7
LDxicj4NCsKgICZxdW90O2xpbmsmcXVvdDs6ICZxdW90OzxhIGhyZWY9Imh0dHBzOi8vbnZkLm5p
c3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDI0LTI2NzEwIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6
Ly9pbmQwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJG
JTJGbnZkLm5pc3QuZ292JTJGdnVsbiUyRmRldGFpbCUyRkNWRS0yMDI0LTI2NzEwJmFtcDtkYXRh
PTA1JTdDMDIlN0NzdXJlc2guaGElNDBibXd0ZWNod29ya3MuaW4lN0NkZDg3Y2MwOGRmYWQ0OTFi
NGM1YjA4ZGU1NzVmMTQ1MiU3Qzk3MGZhNmZkMTAzMTRjYzY4YzU2NDg4ZjNjNjFjZDA1JTdDMCU3
QzAlN0M2MzkwNDQyNjMwMzA5MzAwMzAlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBl
VTFoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lq
b2lUV0ZwYkNJc0lsZFVJam95ZlElM0QlM0QlN0MwJTdDJTdDJTdDJmFtcDtzZGF0YT1iTndhdDV6
RGlUajZxTmlpN1p3QU8yblclMkJXcjB0cG4xRnFETVZyVCUyRmtqRSUzRCZhbXA7cmVzZXJ2ZWQ9
MDwvYT4mcXVvdDssPGJyPg0KwqAgJnF1b3Q7ZGV0YWlsJnF1b3Q7OiAmcXVvdDtub3QtYXBwbGlj
YWJsZS1jb25maWcmcXVvdDssPGJyPg0KwqAgJnF1b3Q7ZGVzY3JpcHRpb24mcXVvdDs6ICZxdW90
O1NvdXJjZSBjb2RlIG5vdCBjb21waWxlZCBieSBjb25maWcuIFsmIzM5O2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS90aHJlYWRfaW5mby5oJiMzOTtdJnF1b3Q7PGJyPg0KfSw8YnI+DQo8YnI+DQpG
b3IgdW5wYXRjaGVkIENWRXMsIHByb3ZpZGUgbW9yZSBjb250ZXh0IGluIHRoZSBkZXNjcmlwdGlv
bjo8YnI+DQpUZXN0ZWQgd2l0aCA2LjEyLjIyIGtlcm5lbDxicj4NCns8YnI+DQrCoCAmcXVvdDtp
ZCZxdW90OzogJnF1b3Q7Q1ZFLTIwMjUtMzk3MjgmcXVvdDssPGJyPg0KwqAgJnF1b3Q7c3RhdHVz
JnF1b3Q7OiAmcXVvdDtVbnBhdGNoZWQmcXVvdDssPGJyPg0KwqAgJnF1b3Q7bGluayZxdW90Ozog
JnF1b3Q7PGEgaHJlZj0iaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjUt
Mzk3MjgiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2luZDAxLnNhZmVsaW5rcy5wcm90ZWN0aW9u
Lm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZudmQubmlzdC5nb3YlMkZ2dWxuJTJGZGV0
YWlsJTJGQ1ZFLTIwMjUtMzk3MjgmYW1wO2RhdGE9MDUlN0MwMiU3Q3N1cmVzaC5oYSU0MGJtd3Rl
Y2h3b3Jrcy5pbiU3Q2RkODdjYzA4ZGZhZDQ5MWI0YzViMDhkZTU3NWYxNDUyJTdDOTcwZmE2ZmQx
MDMxNGNjNjhjNTY0ODhmM2M2MWNkMDUlN0MwJTdDMCU3QzYzOTA0NDI2MzAzMDk0MjMyOSU3Q1Vu
a25vd24lN0NUV0ZwYkdac2IzZDhleUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJbFlpT2lJd0xqQXVN
REF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlqb3lmUSUzRCUzRCU3
QzAlN0MlN0MlN0MmYW1wO3NkYXRhPSUyRmJYZXRFWnVvY0tjSHJjaEdrR29MVTJyS2hQeTYwNWZN
JTJCUnlnS2Z3MTBJJTNEJmFtcDtyZXNlcnZlZD0wPC9hPiZxdW90Oyw8YnI+DQrCoCAmcXVvdDtz
dW1tYXJ5JnF1b3Q7OiAmcXVvdDtJbiB0aGUgTGludXgga2VybmVsLCB0aGUgZm9sbG93aW5nIHZ1
bG5lcmFiaWxpdHkgaGFzIGJlZW4gWy4uLl0sPGJyPg0KwqAgJnF1b3Q7c2NvcmV2MiZxdW90Ozog
JnF1b3Q7MC4wJnF1b3Q7LDxicj4NCsKgICZxdW90O3Njb3JldjMmcXVvdDs6ICZxdW90OzAuMCZx
dW90Oyw8YnI+DQrCoCAmcXVvdDtzY29yZXY0JnF1b3Q7OiAmcXVvdDswLjAmcXVvdDssPGJyPg0K
wqAgJnF1b3Q7bW9kaWZpZWQmcXVvdDs6ICZxdW90OzIwMjUtMDQtMjFUMTQ6MjM6NDUuOTUwJnF1
b3Q7LDxicj4NCsKgICZxdW90O3ZlY3RvciZxdW90OzogJnF1b3Q7VU5LTk9XTiZxdW90Oyw8YnI+
DQrCoCAmcXVvdDt2ZWN0b3JTdHJpbmcmcXVvdDs6ICZxdW90O1VOS05PV04mcXVvdDssPGJyPg0K
wqAgJnF1b3Q7ZGV0YWlsJnF1b3Q7OiAmcXVvdDt2ZXJzaW9uLWluLXJhbmdlJnF1b3Q7LDxicj4N
CsKgICZxdW90O2Rlc2NyaXB0aW9uJnF1b3Q7OiAmcXVvdDtOZWVkcyBiYWNrcG9ydGluZyAoZml4
ZWQgZnJvbSA2LjEyLjIzKSZxdW90Ozxicj4NCn0sPGJyPg0KPGJyPg0KQ0M6IFBldGVyIE1hcmtv
ICZsdDs8YSBocmVmPSJtYWlsdG86cGV0ZXIubWFya29Ac2llbWVucy5jb20iIHRhcmdldD0iX2Js
YW5rIj5wZXRlci5tYXJrb0BzaWVtZW5zLmNvbTwvYT4mZ3Q7PGJyPg0KQ0M6IE1hcnRhIFJ5YmN6
eW5za2EgJmx0OzxhIGhyZWY9Im1haWx0bzpyeWJjenluc2thQGdtYWlsLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPnJ5YmN6eW5za2FAZ21haWwuY29tPC9hPiZndDs8YnI+DQpTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgVHVydWxsICZsdDs8YSBocmVmPSJtYWlsdG86ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5j
b20iIHRhcmdldD0iX2JsYW5rIj5kYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbTwvYT4mZ3Q7PGJy
Pg0KU2lnbmVkLW9mZi1ieTogTWF0aGlldSBEdWJvaXMtQnJpYW5kICZsdDs8YSBocmVmPSJtYWls
dG86bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tIiB0YXJnZXQ9Il9ibGFuayI+bWF0
aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPC9hPiZndDs8YnI+DQpTaWduZWQtb2ZmLWJ5
OiBSaWNoYXJkIFB1cmRpZSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmciIHRhcmdldD0iX2JsYW5rIj5yaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPC9hPiZndDs8YnI+DQooY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCBlNjBiMTc1
OWMxYWVhNWI4ZjUzMTdlNDY2MDhmMGEzZTc4MmVjZjU3KTxicj4NClNpZ25lZC1vZmYtYnk6IFN1
cmVzaCBIIEEgJmx0OzxhIGhyZWY9Im1haWx0bzpzdXJlc2guaGFAYm13dGVjaHdvcmtzLmluIiB0
YXJnZXQ9Il9ibGFuayI+c3VyZXNoLmhhQGJtd3RlY2h3b3Jrcy5pbjwvYT4mZ3Q7PGJyPg0KLS0t
PGJyPg0KwqBzY3JpcHRzL2NvbnRyaWIvaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydC5weSB8IDQ2
NyArKysrKysrKysrKysrKysrKysrPGJyPg0KwqAxIGZpbGUgY2hhbmdlZCwgNDY3IGluc2VydGlv
bnMoKyk8YnI+DQrCoGNyZWF0ZSBtb2RlIDEwMDc1NSBzY3JpcHRzL2NvbnRyaWIvaW1wcm92ZV9r
ZXJuZWxfY3ZlX3JlcG9ydC5weTxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9zY3JpcHRzL2NvbnRy
aWIvaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9ydC5weSBiL3NjcmlwdHMvY29udHJpYi9pbXByb3Zl
X2tlcm5lbF9jdmVfcmVwb3J0LnB5PGJyPg0KbmV3IGZpbGUgbW9kZSAxMDA3NTU8YnI+DQppbmRl
eCAwMDAwMDAwMDAwLi44MjljYzRjZDMwPGJyPg0KLS0tIC9kZXYvbnVsbDxicj4NCisrKyBiL3Nj
cmlwdHMvY29udHJpYi9pbXByb3ZlX2tlcm5lbF9jdmVfcmVwb3J0LnB5PGJyPg0KQEAgLTAsMCAr
MSw0NjcgQEA8YnI+DQorIyEgL3Vzci9iaW4vZW52IHB5dGhvbjM8YnI+DQorIzxicj4NCisjIENv
cHlyaWdodCBPcGVuRW1iZWRkZWQgQ29udHJpYnV0b3JzPGJyPg0KKyM8YnI+DQorIyBUaGUgc2Ny
aXB0IHVzZXMgYW5vdGhlciBzb3VyY2Ugb2YgQ1ZFIGluZm9ybWF0aW9uIGZyb20gbGludXgtdnVs
bnM8YnI+DQorIyB0byBlbnJpY2ggdGhlIGN2ZS1zdW1tYXJ5IGZyb20gY3ZlLWNoZWNrIG9yIHZl
eC48YnI+DQorIyBJdCBjYW4gYWxzbyB1c2UgdGhlIGxpc3Qgb2YgY29tcGlsZWQgZmlsZXMgZnJv
bSB0aGUga2VybmVsIHNwZHggdG8gaWdub3JlIENWRXM8YnI+DQorIyB0aGF0IGFyZSBub3QgYWZm
ZWN0ZWQgc2luY2UgdGhlIGZpbGVzIGFyZSBub3QgY29tcGlsZWQuPGJyPg0KKyM8YnI+DQorIyBJ
dCBjcmVhdGVzIGEgbmV3IGpzb24gZmlsZSB3aXRoIHVwZGF0ZWQgQ1ZFIGluZm9ybWF0aW9uPGJy
Pg0KKyM8YnI+DQorIyBDb21waWxlZCBmaWxlcyBjYW4gYmUgZXh0cmFjdGVkIGFkZGluZyB0aGUg
Zm9sbG93aW5nIGluIGxvY2FsLmNvbmY8YnI+DQorIyBTUERYX0lOQ0xVREVfQ09NUElMRURfU09V
UkNFUzpwbi1saW51eC15b2N0byA9ICZxdW90OzEmcXVvdDs8YnI+DQorIzxicj4NCisjIFRlc3Rl
ZCB3aXRoIHRoZSBmb2xsb3dpbmcgQ1ZFIHNvdXJjZXM6PGJyPg0KKyMgLSA8YSBocmVmPSJodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgvc2VjdXJpdHkvdnVsbnMuZ2l0IiB0YXJn
ZXQ9Il9ibGFuayI+aHR0cHM6Ly9pbmQwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNv
bS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmclMkZwdWIlMkZzY20lMkZsaW51eCUy
RnNlY3VyaXR5JTJGdnVsbnMuZ2l0JmFtcDtkYXRhPTA1JTdDMDIlN0NzdXJlc2guaGElNDBibXd0
ZWNod29ya3MuaW4lN0NkZDg3Y2MwOGRmYWQ0OTFiNGM1YjA4ZGU1NzVmMTQ1MiU3Qzk3MGZhNmZk
MTAzMTRjYzY4YzU2NDg4ZjNjNjFjZDA1JTdDMCU3QzAlN0M2MzkwNDQyNjMwMzA5NTU4MzclN0NV
bmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1
TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lUV0ZwYkNJc0lsZFVJam95ZlElM0QlM0Ql
N0MwJTdDJTdDJTdDJmFtcDtzZGF0YT1rZ09tdWhNNXFUQXdhM0FPRHZKb2VGYzZwVXolMkZlVG1U
a1NkVzFSSk9pcVklM0QmYW1wO3Jlc2VydmVkPTA8L2E+PGJyPg0KKyMgLSA8YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vQ1ZFUHJvamVjdC9jdmVsaXN0VjUiIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL2luZDAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZnaXRodWIuY29tJTJGQ1ZFUHJvamVjdCUyRmN2ZWxpc3RWNSZhbXA7ZGF0YT0wNSU3QzAy
JTdDc3VyZXNoLmhhJTQwYm13dGVjaHdvcmtzLmluJTdDZGQ4N2NjMDhkZmFkNDkxYjRjNWIwOGRl
NTc1ZjE0NTIlN0M5NzBmYTZmZDEwMzE0Y2M2OGM1NjQ4OGYzYzYxY2QwNSU3QzAlN0MwJTdDNjM5
MDQ0MjYzMDMwOTY5OTI4JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIwZVUxaGNHa2lP
blJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJD
SXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZhbXA7c2RhdGE9dFlDWWRGT1c1V0dnVVNW
VUtTdDAySE1DZTh5bm1Sek91NzhZQ08lMkZpMlVJJTNEJmFtcDtyZXNlcnZlZD0wPC9hPjxicj4N
CisjPGJyPg0KKyMgRXhhbXBsZTo8YnI+DQorIyBweXRob24zIC4vb3BlbmVtYmVkZGVkLWNvcmUv
c2NyaXB0cy9jb250cmliL2ltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQucHkgLS1zcGR4IHRtcC9k
ZXBsb3kvc3BkeC8zLjAuMS9xZW11eDg2XzY0L3JlY2lwZXMvcmVjaXBlLWxpbnV4LXlvY3RvLnNw
ZHguanNvbiAtLWtlcm5lbC12ZXJzaW9uIDYuMTIuMjcgLS1kYXRhZGlyIC4vdnVsbnM8YnI+DQor
IyBweXRob24zIC4vb3BlbmVtYmVkZGVkLWNvcmUvc2NyaXB0cy9jb250cmliL2ltcHJvdmVfa2Vy
bmVsX2N2ZV9yZXBvcnQucHkgLS1zcGR4IHRtcC9kZXBsb3kvc3BkeC8zLjAuMS9xZW11eDg2XzY0
L3JlY2lwZXMvcmVjaXBlLWxpbnV4LXlvY3RvLnNwZHguanNvbiAtLWRhdGFkaXIgLi92dWxucyAt
LW9sZC1jdmUtcmVwb3J0IGJ1aWxkL3RtcC9sb2cvY3ZlL2N2ZS1zdW1tYXJ5Lmpzb248YnI+DQor
Izxicj4NCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEx2Mjxicj4NCis8YnI+DQoraW1w
b3J0IGFyZ3BhcnNlPGJyPg0KK2ltcG9ydCBqc29uPGJyPg0KK2ltcG9ydCBzeXM8YnI+DQoraW1w
b3J0IGxvZ2dpbmc8YnI+DQoraW1wb3J0IGdsb2I8YnI+DQoraW1wb3J0IG9zPGJyPg0KK2ltcG9y
dCBwYXRobGliPGJyPg0KK2Zyb20gcGFja2FnaW5nLnZlcnNpb24gaW1wb3J0IFZlcnNpb248YnI+
DQorPGJyPg0KK2RlZiBpc19saW51eF9jdmUoY3ZlX2luZm8pOjxicj4NCivCoMKgwqAgJiMzOTsm
IzM5OyYjMzk7UmV0dXJuIHRydWUgaXMgdGhlIENWRSBiZWxvbmdzIHRvIExpbnV4JiMzOTsmIzM5
OyYjMzk7PGJyPg0KK8KgwqDCoCBpZiBub3QgJnF1b3Q7YWZmZWN0ZWQmcXVvdDsgaW4gY3ZlX2lu
Zm9bJnF1b3Q7Y29udGFpbmVycyZxdW90O11bJnF1b3Q7Y25hJnF1b3Q7XTo8YnI+DQorwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIEZhbHNlPGJyPg0KK8KgwqDCoCBmb3IgYWZmZWN0ZWQgaW4gY3ZlX2lu
Zm9bJnF1b3Q7Y29udGFpbmVycyZxdW90O11bJnF1b3Q7Y25hJnF1b3Q7XVsmcXVvdDthZmZlY3Rl
ZCZxdW90O106PGJyPg0KK8KgwqDCoMKgwqDCoMKgIGlmIG5vdCAmcXVvdDtwcm9kdWN0JnF1b3Q7
IGluIGFmZmVjdGVkOjxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBGYWxzZTxi
cj4NCivCoMKgwqDCoMKgwqDCoCBpZiBhZmZlY3RlZFsmcXVvdDtwcm9kdWN0JnF1b3Q7XSA9PSAm
cXVvdDtMaW51eCZxdW90OyBhbmQgYWZmZWN0ZWRbJnF1b3Q7dmVuZG9yJnF1b3Q7XSA9PSAmcXVv
dDtMaW51eCZxdW90Ozo8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gVHJ1ZTxi
cj4NCivCoMKgwqAgcmV0dXJuIEZhbHNlPGJyPg0KKzxicj4NCitkZWYgZ2V0X2tlcm5lbF9jdmVz
KGRhdGFkaXIsIGNvbXBpbGVkX2ZpbGVzLCB2ZXJzaW9uKTo8YnI+DQorwqDCoMKgICZxdW90OyZx
dW90OyZxdW90Ozxicj4NCivCoMKgwqAgR2V0IENWRXMgZm9yIHRoZSBrZXJuZWw8YnI+DQorwqDC
oMKgICZxdW90OyZxdW90OyZxdW90Ozxicj4NCivCoMKgwqAgY3ZlcyA9IHt9PGJyPg0KKzxicj4N
CivCoMKgwqAgY2hlY2tfY29uZmlnID0gbGVuKGNvbXBpbGVkX2ZpbGVzKSAmZ3Q7IDA8YnI+DQor
PGJyPg0KK8KgwqDCoCBiYXNlX3ZlcnNpb24gPSBWZXJzaW9uKGYmcXVvdDt7dmVyc2lvbi5tYWpv
cn0ue3ZlcnNpb24ubWlub3J9JnF1b3Q7KTxicj4NCis8YnI+DQorwqDCoMKgICMgQ2hlY2sgYWxs
IENWRVMgZnJvbSBrZXJuZWwgdnVsbnM8YnI+DQorwqDCoMKgIHBhdHRlcm4gPSBvcy5wYXRoLmpv
aW4oZGF0YWRpciwgJiMzOTsqKiYjMzk7LCAmcXVvdDtDVkUtKi5qc29uJnF1b3Q7KTxicj4NCivC
oMKgwqAgY3ZlX2ZpbGVzID0gZ2xvYi5nbG9iKHBhdHRlcm4sIHJlY3Vyc2l2ZT1UcnVlKTxicj4N
CivCoMKgwqAgbm90X2FwcGxpY2FibGVfY29uZmlnID0gMDxicj4NCivCoMKgwqAgZml4ZWRfYXNf
bGF0ZXJfYmFja3BvcnQgPSAwPGJyPg0KK8KgwqDCoCB2dWxuZXJhYmxlID0gMDxicj4NCivCoMKg
wqAgbm90X3Z1bG5lcmFibGUgPSAwPGJyPg0KK8KgwqDCoCBmb3IgY3ZlX2ZpbGUgaW4gc29ydGVk
KGN2ZV9maWxlcyk6PGJyPg0KK8KgwqDCoMKgwqDCoMKgIGN2ZV9pbmZvID0ge308YnI+DQorwqDC
oMKgwqDCoMKgwqAgd2l0aCBvcGVuKGN2ZV9maWxlLCAmcXVvdDtyJnF1b3Q7LCBlbmNvZGluZz0m
IzM5O0lTTy04ODU5LTEmIzM5OykgYXMgZjo8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
dmVfaW5mbyA9IGpzb24ubG9hZChmKTxicj4NCis8YnI+DQorwqDCoMKgwqDCoMKgwqAgaWYgbGVu
KGN2ZV9pbmZvKSA9PSAwOjxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvZ2dpbmcuZXJy
b3IoJnF1b3Q7Tm90IHZhbGlkIGRhdGEgaW4gJXMuIEFib3J0aW5nJnF1b3Q7LCBjdmVfZmlsZSk8
YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazxicj4NCis8YnI+DQorwqDCoMKgwqDC
oMKgwqAgaWYgbm90IGlzX2xpbnV4X2N2ZShjdmVfaW5mbyk6PGJyPg0KK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29udGludWU8YnI+DQorwqDCoMKgwqDCoMKgwqAgY3ZlX2lkID0gb3MucGF0aC5i
YXNlbmFtZShjdmVfZmlsZSlbOi01XTxicj4NCivCoMKgwqDCoMKgwqDCoCBkZXNjcmlwdGlvbiA9
IGN2ZV9pbmZvWyZxdW90O2NvbnRhaW5lcnMmcXVvdDtdWyZxdW90O2NuYSZxdW90O11bJnF1b3Q7
ZGVzY3JpcHRpb25zJnF1b3Q7XVswXVsmcXVvdDt2YWx1ZSZxdW90O108YnI+DQorwqDCoMKgwqDC
oMKgwqAgaWYgY3ZlX2ZpbGUuZmluZCgmcXVvdDtyZWplY3RlZCZxdW90OykgJmd0Oz0gMDo8YnI+
DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2dnaW5nLmRlYnVnKCZxdW90OyVzIGlzIHJlamVj
dGVkIGJ5IHRoZSBDTkEmcXVvdDssIGN2ZV9pZCk8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjdmVzW2N2ZV9pZF0gPSB7PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAm
cXVvdDtpZCZxdW90OzogY3ZlX2lkLDxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJnF1b3Q7c3RhdHVzJnF1b3Q7OiAmcXVvdDtJZ25vcmVkJnF1b3Q7LDxicj4NCivCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7ZGV0YWlsJnF1b3Q7OiAmcXVvdDtyZWplY3Rl
ZCZxdW90Oyw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZxdW90O3N1bW1h
cnkmcXVvdDs6IGRlc2NyaXB0aW9uLDxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJnF1b3Q7ZGVzY3JpcHRpb24mcXVvdDs6IGYmcXVvdDtSZWplY3RlZCBieSBDTkEmcXVvdDs8
YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29udGludWU8YnI+DQorwqDCoMKgwqDCoMKgwqAgaWYgYW55KGVsZW0gaW4gY3ZlX2ZpbGUg
Zm9yIGVsZW0gaW4gWyZxdW90O3JldmlldyZxdW90OywgJnF1b3Q7cmV2ZXJ2ZWQmcXVvdDssICZx
dW90O3Rlc3RpbmcmcXVvdDtdKTo8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51
ZTxicj4NCis8YnI+DQorwqDCoMKgwqDCoMKgwqAgaXNfdnVsbmVyYWJsZSwgZmlyc3RfYWZmZWN0
ZWQsIGxhc3RfYWZmZWN0ZWQsIGJldHRlcl9tYXRjaF9maXJzdCwgYmV0dGVyX21hdGNoX2xhc3Qs
IGFmZmVjdGVkX3ZlcnNpb25zID0gZ2V0X2NwZV9hcHBsaWNhYmlsaXR5KGN2ZV9pbmZvLCB2ZXJz
aW9uKTxicj4NCis8YnI+DQorwqDCoMKgwqDCoMKgwqAgbG9nZ2luZy5kZWJ1ZygmcXVvdDslczog
JXMgKCVzIC0gJXMpICglcyAtICVzKSZxdW90OywgY3ZlX2lkLCBpc192dWxuZXJhYmxlLCBiZXR0
ZXJfbWF0Y2hfZmlyc3QsIGJldHRlcl9tYXRjaF9sYXN0LCBmaXJzdF9hZmZlY3RlZCwgbGFzdF9h
ZmZlY3RlZCk8YnI+DQorPGJyPg0KK8KgwqDCoMKgwqDCoMKgIGlmIGlzX3Z1bG5lcmFibGUgaXMg
Tm9uZTo8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2dnaW5nLndhcm5pbmcoJnF1b3Q7
JXMgZG9lc24mIzM5O3QgaGF2ZSBnb29kIG1ldGFkYXRhJnF1b3Q7LCBjdmVfaWQpPGJyPg0KK8Kg
wqDCoMKgwqDCoMKgIGlmIGlzX3Z1bG5lcmFibGU6PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaXNfYWZmZWN0ZWQgPSBUcnVlPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWZmZWN0
ZWRfZmlsZXMgPSBbXTxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIGNoZWNrX2NvbmZp
Zzo8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlzX2FmZmVjdGVkLCBhZmZl
Y3RlZF9maWxlcyA9IGNoZWNrX2tlcm5lbF9jb21waWxlZF9maWxlcyhjb21waWxlZF9maWxlcywg
Y3ZlX2luZm8pPGJyPg0KKzxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIG5vdCBpc19h
ZmZlY3RlZCBhbmQgbGVuKGFmZmVjdGVkX2ZpbGVzKSAmZ3Q7IDA6PGJyPg0KK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBsb2dnaW5nLmRlYnVnKDxicj4NCivCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDslcyAtIG5vdCBhcHBsaWNhYmxlIGNvbmZpZ3Vy
YXRpb24gc2luY2UgYWZmZWN0ZWQgZmlsZXMgbm90IGNvbXBpbGVkOiAlcyZxdW90Oyw8YnI+DQor
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3ZlX2lkLCBhZmZlY3RlZF9m
aWxlcyk8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN2ZXNbY3ZlX2lkXSA9
IHs8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7aWQm
cXVvdDs6IGN2ZV9pZCw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJnF1b3Q7c3RhdHVzJnF1b3Q7OiAmcXVvdDtJZ25vcmVkJnF1b3Q7LDxicj4NCivCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDtkZXRhaWwmcXVvdDs6ICZxdW90
O25vdC1hcHBsaWNhYmxlLWNvbmZpZyZxdW90Oyw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7c3VtbWFyeSZxdW90OzogZGVzY3JpcHRpb24sPGJyPg0K
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZxdW90O2Rlc2NyaXB0aW9u
JnF1b3Q7OiBmJnF1b3Q7U291cmNlIGNvZGUgbm90IGNvbXBpbGVkIGJ5IGNvbmZpZy4ge2FmZmVj
dGVkX2ZpbGVzfSZxdW90Ozxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTxi
cj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm90X2FwcGxpY2FibGVfY29uZmln
ICs9MTxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICMgQ2hlY2sgaWYgd2UgaGF2ZSBiYWNr
cG9ydDxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2U6PGJyPg0KK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBub3QgYmV0dGVyX21hdGNoX2xhc3Q6PGJyPg0KK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpeGVkX2luID0gbGFzdF9hZmZlY3Rl
ZDxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZTo8YnI+DQorwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZml4ZWRfaW4gPSBiZXR0ZXJfbWF0Y2hf
bGFzdDxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9nZ2luZy5kZWJ1Zygm
cXVvdDslcyBuZWVkcyBiYWNrcG9ydGluZyAoZml4ZWQgZnJvbSAlcykmcXVvdDssIGN2ZV9pZCwg
Zml4ZWRfaW4pPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjdmVzW2N2ZV9p
ZF0gPSB7PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJnF1b3Q7aWQmcXVvdDs6IGN2ZV9pZCw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDtzdGF0dXMmcXVvdDs6ICZxdW90O1VucGF0Y2hl
ZCZxdW90Oyw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAmcXVvdDtkZXRhaWwmcXVvdDs6ICZxdW90O3ZlcnNpb24taW4tcmFuZ2UmcXVvdDssPGJy
Pg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7
c3VtbWFyeSZxdW90OzogZGVzY3JpcHRpb24sPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7ZGVzY3JpcHRpb24mcXVvdDs6IGYmcXVvdDtO
ZWVkcyBiYWNrcG9ydGluZyAoZml4ZWQgZnJvbSB7Zml4ZWRfaW59KSZxdW90Ozxicj4NCivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdnVsbmVyYWJsZSArPSAxPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoYmV0dGVyX21hdGNoX2xhc3QgYW5kPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFZlcnNpb24oZiZxdW90O3tiZXR0ZXJfbWF0Y2hfbGFzdC5tYWpv
cn0ue2JldHRlcl9tYXRjaF9sYXN0Lm1pbm9yfSZxdW90OykgPT0gYmFzZV92ZXJzaW9uKTo8YnI+
DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZml4ZWRfYXNfbGF0ZXJf
YmFja3BvcnQgKz0gMTxicj4NCivCoMKgwqDCoMKgwqDCoCAjIE5vdCB2dWxuZXJhYmxlPGJyPg0K
K8KgwqDCoMKgwqDCoMKgIGVsc2U6PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgbm90
IGZpcnN0X2FmZmVjdGVkOjxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9n
Z2luZy5kZWJ1ZygmcXVvdDslcyAtIG5vdCBrbm93biBhZmZlY3RlZCAlcyZxdW90Oyw8YnI+DQor
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjdmVfaWQsPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYmV0dGVyX21hdGNoX2xhc3QpPGJyPg0KK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjdmVzW2N2ZV9pZF0gPSB7PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICZxdW90O2lkJnF1b3Q7OiBjdmVfaWQsPGJyPg0KK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZxdW90O3N0YXR1cyZxdW90OzogJnF1
b3Q7UGF0Y2hlZCZxdW90Oyw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgJnF1b3Q7ZGV0YWlsJnF1b3Q7OiAmcXVvdDt2ZXJzaW9uLW5vdC1pbi1yYW5nZSZxdW90
Oyw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7c3Vt
bWFyeSZxdW90OzogZGVzY3JpcHRpb24sPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICZxdW90O2Rlc2NyaXB0aW9uJnF1b3Q7OiAmcXVvdDtObyBDUEUgbWF0Y2gm
cXVvdDs8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH08YnI+DQorwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vdF92dWxuZXJhYmxlICs9IDE8YnI+DQorwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYmFja3BvcnRfYmFzZSA9IFZlcnNpb24oZiZxdW90O3tiZXR0ZXJfbWF0Y2hfbGFzdC5t
YWpvcn0ue2JldHRlcl9tYXRjaF9sYXN0Lm1pbm9yfSZxdW90Oyk8YnI+DQorwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiB2ZXJzaW9uICZsdDsgZmlyc3RfYWZmZWN0ZWQ6PGJyPg0KK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2dnaW5nLmRlYnVnKCYjMzk7JXMgLSBmaXhlZC12ZXJz
aW9uOiBvbmx5IGFmZmVjdHMgJXMgb253YXJkcyYjMzk7LDxicj4NCivCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN2ZV9pZCw8YnI+DQor
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmaXJzdF9hZmZlY3RlZCk8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN2
ZXNbY3ZlX2lkXSA9IHs8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJnF1b3Q7aWQmcXVvdDs6IGN2ZV9pZCw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgJnF1b3Q7c3RhdHVzJnF1b3Q7OiAmcXVvdDtQYXRjaGVkJnF1b3Q7LDxi
cj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDtkZXRhaWwm
cXVvdDs6ICZxdW90O2ZpeGVkLXZlcnNpb24mcXVvdDssPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICZxdW90O3N1bW1hcnkmcXVvdDs6IGRlc2NyaXB0aW9uLDxi
cj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDtkZXNjcmlw
dGlvbiZxdW90OzogZiZxdW90O29ubHkgYWZmZWN0cyB7Zmlyc3RfYWZmZWN0ZWR9IG9ud2FyZHMm
cXVvdDs8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH08YnI+DQorwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vdF92dWxuZXJhYmxlICs9IDE8YnI+DQorwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBlbGlmIGxhc3RfYWZmZWN0ZWQgJmx0Oz0gdmVyc2lvbjo8YnI+DQor
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvZ2dpbmcuZGVidWcoJnF1b3Q7JXMgLSBm
aXhlZC12ZXJzaW9uOiBGaXhlZCBmcm9tIHZlcnNpb24gJXMmcXVvdDssPGJyPg0KK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3ZlX2lk
LDxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGxhc3RfYWZmZWN0ZWQpPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjdmVzW2N2ZV9pZF0gPSB7PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICZxdW90O2lkJnF1b3Q7OiBjdmVfaWQsPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICZxdW90O3N0YXR1cyZxdW90OzogJnF1b3Q7UGF0Y2hlZCZx
dW90Oyw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7
ZGV0YWlsJnF1b3Q7OiAmcXVvdDtmaXhlZC12ZXJzaW9uJnF1b3Q7LDxicj4NCivCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDtzdW1tYXJ5JnF1b3Q7OiBkZXNjcmlw
dGlvbiw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7
ZGVzY3JpcHRpb24mcXVvdDs6IGYmcXVvdDtmaXhlZC12ZXJzaW9uOiBGaXhlZCBmcm9tIHZlcnNp
b24ge2xhc3RfYWZmZWN0ZWR9JnF1b3Q7PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3RfdnVsbmVyYWJs
ZSArPSAxPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxpZiBiYWNrcG9ydF9iYXNlID09
IGJhc2VfdmVyc2lvbjo8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvZ2dp
bmcuZGVidWcoJnF1b3Q7JXMgLSBjcGUtc3RhYmxlLWJhY2twb3J0OiBCYWNrcG9ydGVkIGluICVz
JnF1b3Q7LDxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGN2ZV9pZCw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiZXR0ZXJfbWF0Y2hfbGFzdCk8YnI+DQor
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN2ZXNbY3ZlX2lkXSA9IHs8YnI+DQorwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7aWQmcXVvdDs6IGN2ZV9p
ZCw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7c3Rh
dHVzJnF1b3Q7OiAmcXVvdDtQYXRjaGVkJnF1b3Q7LDxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDtkZXRhaWwmcXVvdDs6ICZxdW90O2NwZS1zdGFibGUt
YmFja3BvcnQmcXVvdDssPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICZxdW90O3N1bW1hcnkmcXVvdDs6IGRlc2NyaXB0aW9uLDxicj4NCivCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDtkZXNjcmlwdGlvbiZxdW90OzogZiZxdW90
O0JhY2twb3J0ZWQgaW4ge2JldHRlcl9tYXRjaF9sYXN0fSZxdW90Ozxicj4NCivCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfTxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbm90X3Z1bG5lcmFibGUgKz0gMTxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2U6
PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2dnaW5nLmRlYnVnKCZxdW90
OyVzIC0gdmVyc2lvbiBub3QgYWZmZWN0ZWQgJXMmcXVvdDssIGN2ZV9pZCwgc3RyKGFmZmVjdGVk
X3ZlcnNpb25zKSk8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN2ZXNbY3Zl
X2lkXSA9IHs8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1
b3Q7aWQmcXVvdDs6IGN2ZV9pZCw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgJnF1b3Q7c3RhdHVzJnF1b3Q7OiAmcXVvdDtQYXRjaGVkJnF1b3Q7LDxicj4NCivC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDtkZXRhaWwmcXVvdDs6
ICZxdW90O3ZlcnNpb24tbm90LWluLXJhbmdlJnF1b3Q7LDxicj4NCivCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDtzdW1tYXJ5JnF1b3Q7OiBkZXNjcmlwdGlvbiw8
YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7ZGVzY3Jp
cHRpb24mcXVvdDs6IGYmcXVvdDtSYW5nZSB7YWZmZWN0ZWRfdmVyc2lvbnN9JnF1b3Q7PGJyPg0K
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBub3RfdnVsbmVyYWJsZSArPSAxPGJyPg0KKzxicj4NCivCoMKgwqAgPGEg
aHJlZj0iaHR0cDovL2xvZ2dpbmcuaW5mbyIgdGFyZ2V0PSJfYmxhbmsiPmxvZ2dpbmcuaW5mbzwv
YT4oJnF1b3Q7VG90YWwgQ1ZFcyBpZ25vcmVkIGR1ZSB0byBub3QgYXBwbGljYWJsZSBjb25maWc6
ICVkJnF1b3Q7LCBub3RfYXBwbGljYWJsZV9jb25maWcpPGJyPg0KK8KgwqDCoCA8YSBocmVmPSJo
dHRwOi8vbG9nZ2luZy5pbmZvIiB0YXJnZXQ9Il9ibGFuayI+bG9nZ2luZy5pbmZvPC9hPigmcXVv
dDtUb3RhbCBDVkVzIG5vdCB2dWxuZXJhYmxlIGR1ZSB2ZXJzaW9uLW5vdC1pbi1yYW5nZTogJWQm
cXVvdDssIG5vdF92dWxuZXJhYmxlKTxicj4NCivCoMKgwqAgPGEgaHJlZj0iaHR0cDovL2xvZ2dp
bmcuaW5mbyIgdGFyZ2V0PSJfYmxhbmsiPmxvZ2dpbmcuaW5mbzwvYT4oJnF1b3Q7VG90YWwgdnVs
bmVyYWJsZSBDVkVzOiAlZCZxdW90OywgdnVsbmVyYWJsZSk8YnI+DQorPGJyPg0KK8KgwqDCoCA8
YSBocmVmPSJodHRwOi8vbG9nZ2luZy5pbmZvIiB0YXJnZXQ9Il9ibGFuayI+bG9nZ2luZy5pbmZv
PC9hPigmcXVvdDtUb3RhbCBDVkVzIGFscmVhZHkgYmFja3BvcnRlZCBpbiAlczogJXMmcXVvdDss
IGJhc2VfdmVyc2lvbiw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZml4ZWRfYXNfbGF0ZXJfYmFja3BvcnQpPGJyPg0KK8KgwqDCoCByZXR1cm4gY3Zlczxicj4N
Cis8YnI+DQorZGVmIHJlYWRfc3BkeChzcGR4X2ZpbGUpOjxicj4NCivCoMKgwqAgJiMzOTsmIzM5
OyYjMzk7T3BlbiBTUERYIGZpbGUgYW5kIGV4dHJhY3QgY29tcGlsZWQgZmlsZXMmIzM5OyYjMzk7
JiMzOTs8YnI+DQorwqDCoMKgIHdpdGggb3BlbihzcGR4X2ZpbGUsICYjMzk7ciYjMzk7LCBlbmNv
ZGluZz0mIzM5O0lTTy04ODU5LTEmIzM5OykgYXMgZjo8YnI+DQorwqDCoMKgwqDCoMKgwqAgc3Bk
eCA9IGpzb24ubG9hZChmKTxicj4NCivCoMKgwqDCoMKgwqDCoCBpZiAmcXVvdDtzcGR4VmVyc2lv
biZxdW90OyBpbiBzcGR4Ojxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIHNwZHhbJnF1
b3Q7c3BkeFZlcnNpb24mcXVvdDtdID09ICZxdW90O1NQRFgtMi4yJnF1b3Q7Ojxicj4NCivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJlYWRfc3BkeDIoc3BkeCk8YnI+DQor
wqDCoMKgwqDCoMKgwqAgaWYgJnF1b3Q7QGdyYXBoJnF1b3Q7IGluIHNwZHg6PGJyPg0KK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJlYWRfc3BkeDMoc3BkeCk8YnI+DQorwqDCoMKgIHJl
dHVybiBbXTxicj4NCis8YnI+DQorZGVmIHJlYWRfc3BkeDIoc3BkeCk6PGJyPg0KK8KgwqDCoCAm
IzM5OyYjMzk7JiMzOTs8YnI+DQorwqDCoMKgIFJlYWQgc3BkeDIgY29tcGlsZWQgZmlsZXMgZnJv
bSBzcGR4PGJyPg0KK8KgwqDCoCAmIzM5OyYjMzk7JiMzOTs8YnI+DQorwqDCoMKgIGNmaWxlcyA9
IHNldCgpPGJyPg0KK8KgwqDCoCBpZiAmIzM5O2ZpbGVzJiMzOTsgbm90IGluIHNwZHg6PGJyPg0K
K8KgwqDCoMKgwqDCoMKgIHJldHVybiBjZmlsZXM8YnI+DQorwqDCoMKgIGZvciBpdGVtIGluIHNw
ZHhbJiMzOTtmaWxlcyYjMzk7XTo8YnI+DQorwqDCoMKgwqDCoMKgwqAgZm9yIGZ0eXBlIGluIGl0
ZW1bJiMzOTtmaWxlVHlwZXMmIzM5O106PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
ZnR5cGUgPT0gJnF1b3Q7U09VUkNFJnF1b3Q7Ojxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZmlsZW5hbWUgPSBpdGVtWyZxdW90O2ZpbGVOYW1lJnF1b3Q7XVtpdGVtWyZxdW90
O2ZpbGVOYW1lJnF1b3Q7XS5maW5kKCZxdW90Oy8mcXVvdDspKzE6XTxicj4NCivCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY2ZpbGVzLmFkZChmaWxlbmFtZSk8YnI+DQorwqDCoMKgIHJl
dHVybiBjZmlsZXM8YnI+DQorPGJyPg0KK2RlZiByZWFkX3NwZHgzKHNwZHgpOjxicj4NCivCoMKg
wqAgJiMzOTsmIzM5OyYjMzk7PGJyPg0KK8KgwqDCoCBSZWFkIHNwZHgzIGNvbXBpbGVkIGZpbGVz
IGZyb20gc3BkeDxicj4NCivCoMKgwqAgJiMzOTsmIzM5OyYjMzk7PGJyPg0KK8KgwqDCoCBjZmls
ZXMgPSBzZXQoKTxicj4NCivCoMKgwqAgZm9yIGl0ZW0gaW4gc3BkeFsmcXVvdDtAZ3JhcGgmcXVv
dDtdOjxicj4NCivCoMKgwqDCoMKgwqDCoCBpZiAmcXVvdDtzb2Z0d2FyZV9wcmltYXJ5UHVycG9z
ZSZxdW90OyBub3QgaW4gaXRlbTo8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51
ZTxicj4NCivCoMKgwqDCoMKgwqDCoCBpZiBpdGVtWyZxdW90O3NvZnR3YXJlX3ByaW1hcnlQdXJw
b3NlJnF1b3Q7XSA9PSAmcXVvdDtzb3VyY2UmcXVvdDs6PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZmlsZW5hbWUgPSBpdGVtWyYjMzk7bmFtZSYjMzk7XVtpdGVtWyYjMzk7bmFtZSYjMzk7
XS5maW5kKCZxdW90Oy8mcXVvdDspKzE6XTxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNm
aWxlcy5hZGQoZmlsZW5hbWUpPGJyPg0KK8KgwqDCoCByZXR1cm4gY2ZpbGVzPGJyPg0KKzxicj4N
CitkZWYgY2hlY2tfa2VybmVsX2NvbXBpbGVkX2ZpbGVzKGNvbXBpbGVkX2ZpbGVzLCBjdmVfaW5m
byk6PGJyPg0KK8KgwqDCoCAmcXVvdDsmcXVvdDsmcXVvdDs8YnI+DQorwqDCoMKgIFJldHVybiBp
ZiBhIENWRSBhZmZlY3RlZCB1cyBkZXBlbmRpbmcgb24gY29tcGlsZWQgZmlsZXM8YnI+DQorwqDC
oMKgICZxdW90OyZxdW90OyZxdW90Ozxicj4NCivCoMKgwqAgZmlsZXNfYWZmZWN0ZWQgPSBzZXQo
KTxicj4NCivCoMKgwqAgaXNfYWZmZWN0ZWQgPSBGYWxzZTxicj4NCis8YnI+DQorwqDCoMKgIGZv
ciBpdGVtIGluIGN2ZV9pbmZvWyYjMzk7Y29udGFpbmVycyYjMzk7XVsmIzM5O2NuYSYjMzk7XVsm
IzM5O2FmZmVjdGVkJiMzOTtdOjxicj4NCivCoMKgwqDCoMKgwqDCoCBpZiAmcXVvdDtwcm9ncmFt
RmlsZXMmcXVvdDsgaW4gaXRlbTo8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgZiBp
biBpdGVtWyYjMzk7cHJvZ3JhbUZpbGVzJiMzOTtdOjxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgZiBub3QgaW4gZmlsZXNfYWZmZWN0ZWQ6PGJyPg0KK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGVzX2FmZmVjdGVkLmFkZChmKTxicj4NCis8
YnI+DQorwqDCoMKgIGlmIGxlbihmaWxlc19hZmZlY3RlZCkgJmd0OyAwOjxicj4NCivCoMKgwqDC
oMKgwqDCoCBmb3IgZiBpbiBmaWxlc19hZmZlY3RlZDo8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiBmIGluIGNvbXBpbGVkX2ZpbGVzOjxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbG9nZ2luZy5kZWJ1ZygmcXVvdDtGaWxlIG1hdGNoOiAlcyZxdW90OywgZik8YnI+
DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlzX2FmZmVjdGVkID0gVHJ1ZTxicj4N
CivCoMKgwqAgcmV0dXJuIGlzX2FmZmVjdGVkLCBmaWxlc19hZmZlY3RlZDxicj4NCis8YnI+DQor
ZGVmIGdldF9jcGVfYXBwbGljYWJpbGl0eShjdmVfaW5mbywgdik6PGJyPg0KK8KgwqDCoCAmIzM5
OyYjMzk7JiMzOTs8YnI+DQorwqDCoMKgIENoZWNrIGlmIHZlcnNpb24gaXMgYWZmZWN0ZWQgYW5k
IHJldHVybiBhZmZlY3RlZCB2ZXJzaW9uczxicj4NCivCoMKgwqAgJiMzOTsmIzM5OyYjMzk7PGJy
Pg0KK8KgwqDCoCBiYXNlX2JyYW5jaCA9IFZlcnNpb24oZiZxdW90O3t2Lm1ham9yfS57di5taW5v
cn0mcXVvdDspPGJyPg0KK8KgwqDCoCBhZmZlY3RlZCA9IFtdPGJyPg0KK8KgwqDCoCBpZiBub3Qg
JiMzOTtjcGVBcHBsaWNhYmlsaXR5JiMzOTsgaW4gY3ZlX2luZm9bJnF1b3Q7Y29udGFpbmVycyZx
dW90O11bJnF1b3Q7Y25hJnF1b3Q7XTo8YnI+DQorwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5vbmUs
IE5vbmUsIE5vbmUsIE5vbmUsIE5vbmUsIE5vbmU8YnI+DQorPGJyPg0KK8KgwqDCoCBmb3Igbm9k
ZXMgaW4gY3ZlX2luZm9bJnF1b3Q7Y29udGFpbmVycyZxdW90O11bJnF1b3Q7Y25hJnF1b3Q7XVsm
cXVvdDtjcGVBcHBsaWNhYmlsaXR5JnF1b3Q7XTo8YnI+DQorwqDCoMKgwqDCoMKgwqAgZm9yIG5v
ZGUgaW4gbm9kZXMudmFsdWVzKCk6PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdnVsbmVy
YWJsZSA9IEZhbHNlPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWF0Y2hlZF9icmFuY2gg
PSBGYWxzZTxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpcnN0X2FmZmVjdGVkID0gVmVy
c2lvbigmcXVvdDs1MDAwJnF1b3Q7KTxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhc3Rf
YWZmZWN0ZWQgPSBWZXJzaW9uKCZxdW90OzAmcXVvdDspPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYmV0dGVyX21hdGNoX2ZpcnN0ID0gVmVyc2lvbigmcXVvdDswJnF1b3Q7KTxicj4NCivC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJldHRlcl9tYXRjaF9sYXN0ID0gVmVyc2lvbigmcXVvdDs1
MDAwJnF1b3Q7KTxicj4NCis8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBsZW4obm9k
ZVswXVsmIzM5O2NwZU1hdGNoJiMzOTtdKSA9PSAwOjxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZmlyc3RfYWZmZWN0ZWQgPSBOb25lPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBsYXN0X2FmZmVjdGVkID0gTm9uZTxicj4NCivCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYmV0dGVyX21hdGNoX2ZpcnN0ID0gTm9uZTxicj4NCivCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYmV0dGVyX21hdGNoX2xhc3QgPSBOb25lPGJyPg0KKzxicj4N
CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciBjcGVfbWF0Y2ggaW4gbm9kZVswXVsmIzM5O2Nw
ZU1hdGNoJiMzOTtdOjxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmVyc2lv
bl9zdGFydF9pbmNsdWRpbmcgPSBWZXJzaW9uKCZxdW90OzAmcXVvdDspPGJyPg0KK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2ZXJzaW9uX2VuZF9leGNsdWRpbmcgPSBWZXJzaW9uKCZx
dW90OzAmcXVvdDspPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAmIzM5
O3ZlcnNpb25TdGFydEluY2x1ZGluZyYjMzk7IGluIGNwZV9tYXRjaDo8YnI+DQorwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmVyc2lvbl9zdGFydF9pbmNsdWRpbmcgPSBW
ZXJzaW9uKGNwZV9tYXRjaFsmIzM5O3ZlcnNpb25TdGFydEluY2x1ZGluZyYjMzk7XSk8YnI+DQor
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2U6PGJyPg0KK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZlcnNpb25fc3RhcnRfaW5jbHVkaW5nID0gVmVyc2lv
bigmcXVvdDswJnF1b3Q7KTxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBp
ZiB2ZXJzaW9uRW5kRXhjbHVkaW5nIGlzIG1pc3Npbmcgd2UgYXJlIGluIGEgYnJhbmNoLCB3aGlj
aCBpcyBub3QgZml4ZWQuPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAm
cXVvdDt2ZXJzaW9uRW5kRXhjbHVkaW5nJnF1b3Q7IGluIGNwZV9tYXRjaDo8YnI+DQorwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmVyc2lvbl9lbmRfZXhjbHVkaW5nID0g
VmVyc2lvbihjcGVfbWF0Y2hbJnF1b3Q7dmVyc2lvbkVuZEV4Y2x1ZGluZyZxdW90O10pPGJyPg0K
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlOjxicj4NCivCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIGlmIHZlcnNpb25FbmRFeGNsdWRpbmcgaXMgbWlz
c2luZyB3ZSBhcmUgaW4gYSBicmFuY2gsIHdoaWNoIGlzIG5vdCBmaXhlZC48YnI+DQorwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmVyc2lvbl9lbmRfZXhjbHVkaW5nID0g
VmVyc2lvbig8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmJnF1b3Q7e3ZlcnNpb25fc3RhcnRfaW5jbHVkaW5nLm1ham9yfS57dmVyc2lvbl9zdGFy
dF9pbmNsdWRpbmcubWlub3J9LjUwMDAmcXVvdDs8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKTxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YWZmZWN0ZWQuYXBwZW5kKGYmcXVvdDsge3ZlcnNpb25fc3RhcnRfaW5jbHVkaW5nfS17dmVyc2lv
bl9lbmRfZXhjbHVkaW5nfSZxdW90Oyk8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICMgRGV0ZWN0IGlmIHZlcnNpb25FbmQgaXMgaW4gZml4ZWQgaW4gYmFzZSBicmFuY2guIEl0
IGhhcyBwcmVjZWRlbmNlIG92ZXIgdGhlIHJlc3Q8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJyYW5jaF9lbmQgPSBWZXJzaW9uKGYmcXVvdDt7dmVyc2lvbl9lbmRfZXhjbHVk
aW5nLm1ham9yfS57dmVyc2lvbl9lbmRfZXhjbHVkaW5nLm1pbm9yfSZxdW90Oyk8YnI+DQorwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIGJyYW5jaF9lbmQgPT0gYmFzZV9icmFuY2g6
PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIHZlcnNpb25f
c3RhcnRfaW5jbHVkaW5nICZsdDs9IHYgJmx0OyB2ZXJzaW9uX2VuZF9leGNsdWRpbmc6PGJyPg0K
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdnVsbmVyYWJs
ZSA9IGNwZV9tYXRjaFsmIzM5O3Z1bG5lcmFibGUmIzM5O108YnI+DQorwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBJZiB3ZSBkb24mIzM5O3QgbWF0Y2ggaW4gb3VyIGJy
YW5jaCwgd2UgYXJlIG5vdCB2dWxuZXJhYmxlLDxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAjIHNpbmNlIHdlIGhhdmUgYSBiYWNrcG9ydDxicj4NCivCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXRjaGVkX2JyYW5jaCA9IFRydWU8YnI+
DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmV0dGVyX21hdGNoX2Zp
cnN0ID0gdmVyc2lvbl9zdGFydF9pbmNsdWRpbmc8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYmV0dGVyX21hdGNoX2xhc3QgPSB2ZXJzaW9uX2VuZF9leGNsdWRp
bmc8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIHZlcnNpb25fc3RhcnRf
aW5jbHVkaW5nICZsdDs9IHYgJmx0OyB2ZXJzaW9uX2VuZF9leGNsdWRpbmcgYW5kIG5vdCBtYXRj
aGVkX2JyYW5jaDo8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgdmVyc2lvbl9lbmRfZXhjbHVkaW5nICZsdDsgYmV0dGVyX21hdGNoX2xhc3Q6PGJyPg0KK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmV0dGVyX21hdGNo
X2ZpcnN0ID0gbWF4KHZlcnNpb25fc3RhcnRfaW5jbHVkaW5nLCBiZXR0ZXJfbWF0Y2hfZmlyc3Qp
PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmV0
dGVyX21hdGNoX2xhc3QgPSBtaW4oYmV0dGVyX21hdGNoX2xhc3QsIHZlcnNpb25fZW5kX2V4Y2x1
ZGluZyk8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB2dWxuZXJhYmxlID0gY3BlX21hdGNoWyYjMzk7dnVsbmVyYWJsZSYjMzk7XTxicj4NCivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hdGNoZWRfYnJhbmNo
ID0gVHJ1ZTxicj4NCis8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpcnN0
X2FmZmVjdGVkID0gbWluKHZlcnNpb25fc3RhcnRfaW5jbHVkaW5nLCBmaXJzdF9hZmZlY3RlZCk8
YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhc3RfYWZmZWN0ZWQgPSBtYXgo
dmVyc2lvbl9lbmRfZXhjbHVkaW5nLCBsYXN0X2FmZmVjdGVkKTxicj4NCivCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICMgTm90IGEgYmV0dGVyIG1hdGNoLCB3ZSB1c2UgdGhlIGZpcnN0IGFuZCBsYXN0
IGFmZmVjdGVkIGluc3RlYWQgb2YgdGhlIGZha2UgLjUwMDA8YnI+DQorwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiB2dWxuZXJhYmxlIGFuZCBiZXR0ZXJfbWF0Y2hfbGFzdCA9PSBWZXJzaW9uKGYm
cXVvdDt7YmFzZV9icmFuY2h9LjUwMDAmcXVvdDspOjxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYmV0dGVyX21hdGNoX2xhc3QgPSBsYXN0X2FmZmVjdGVkPGJyPg0KK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiZXR0ZXJfbWF0Y2hfZmlyc3QgPSBmaXJzdF9hZmZl
Y3RlZDxicj4NCivCoMKgwqAgcmV0dXJuIHZ1bG5lcmFibGUsIGZpcnN0X2FmZmVjdGVkLCBsYXN0
X2FmZmVjdGVkLCBiZXR0ZXJfbWF0Y2hfZmlyc3QsIGJldHRlcl9tYXRjaF9sYXN0LCBhZmZlY3Rl
ZDxicj4NCis8YnI+DQorZGVmIGNvcHlfZGF0YShvbGQsIG5ldyk6PGJyPg0KK8KgwqDCoCAmIzM5
OyYjMzk7JiMzOTtVcGRhdGUgZGljdGlvbmFyeSB3aXRoIG5ldyBlbnRyaWVzLCB3aGlsZSBrZWVw
aW5nIHRoZSBvbGQgb25lcyYjMzk7JiMzOTsmIzM5Ozxicj4NCivCoMKgwqAgZm9yIGsgaW4gbmV3
LmtleXMoKTo8YnI+DQorwqDCoMKgwqDCoMKgwqAgb2xkW2tdID0gbmV3W2tdPGJyPg0KK8KgwqDC
oCByZXR1cm4gb2xkPGJyPg0KKzxicj4NCisjIEZ1bmN0aW9uIHRha2VuIGZyb20gY3ZlX2NoZWNr
LmJiY2xhc3MuIEFkYXB0ZWQgdG8gY3ZlIGZpZWxkczxicj4NCitkZWYgY3ZlX3VwZGF0ZShjdmVf
ZGF0YSwgY3ZlLCBlbnRyeSk6PGJyPg0KK8KgwqDCoCAjIElmIG5vIGVudHJ5LCBqdXN0IGFkZCBp
dDxicj4NCivCoMKgwqAgaWYgY3ZlIG5vdCBpbiBjdmVfZGF0YTo8YnI+DQorwqDCoMKgwqDCoMKg
wqAgY3ZlX2RhdGFbY3ZlXSA9IGVudHJ5PGJyPg0KK8KgwqDCoMKgwqDCoMKgIHJldHVybjxicj4N
CivCoMKgwqAgIyBJZiB3ZSBhcmUgdXBkYXRpbmcsIHRoZXJlIG1pZ2h0IGJlIGNoYW5nZSBpbiB0
aGUgc3RhdHVzPGJyPg0KK8KgwqDCoCBpZiBjdmVfZGF0YVtjdmVdWyYjMzk7c3RhdHVzJiMzOTtd
ID09ICZxdW90O1Vua25vd24mcXVvdDs6PGJyPg0KK8KgwqDCoMKgwqDCoMKgIGN2ZV9kYXRhW2N2
ZV0gPSBjb3B5X2RhdGEoY3ZlX2RhdGFbY3ZlXSwgZW50cnkpPGJyPg0KK8KgwqDCoMKgwqDCoMKg
IHJldHVybjxicj4NCivCoMKgwqAgaWYgY3ZlX2RhdGFbY3ZlXVsmIzM5O3N0YXR1cyYjMzk7XSA9
PSBlbnRyeVsmIzM5O3N0YXR1cyYjMzk7XTo8YnI+DQorwqDCoMKgwqDCoMKgwqAgcmV0dXJuPGJy
Pg0KK8KgwqDCoCBpZiBlbnRyeVsmIzM5O3N0YXR1cyYjMzk7XSA9PSAmcXVvdDtVbnBhdGNoZWQm
cXVvdDsgYW5kIGN2ZV9kYXRhW2N2ZV1bJiMzOTtzdGF0dXMmIzM5O10gPT0gJnF1b3Q7UGF0Y2hl
ZCZxdW90Ozo8YnI+DQorwqDCoMKgwqDCoMKgwqAgbG9nZ2luZy53YXJuaW5nKCZxdW90O0NWRSBl
bnRyeSAlcyB1cGRhdGUgZnJvbSBQYXRjaGVkIHRvIFVucGF0Y2hlZCBmcm9tIHRoZSBzY2FuIHJl
c3VsdCZxdW90OywgY3ZlKTxicj4NCivCoMKgwqDCoMKgwqDCoCBjdmVfZGF0YVtjdmVdID0gY29w
eV9kYXRhKGN2ZV9kYXRhW2N2ZV0sIGVudHJ5KTxicj4NCivCoMKgwqDCoMKgwqDCoCByZXR1cm48
YnI+DQorwqDCoMKgIGlmIGVudHJ5WyYjMzk7c3RhdHVzJiMzOTtdID09ICZxdW90O1BhdGNoZWQm
cXVvdDsgYW5kIGN2ZV9kYXRhW2N2ZV1bJiMzOTtzdGF0dXMmIzM5O10gPT0gJnF1b3Q7VW5wYXRj
aGVkJnF1b3Q7Ojxicj4NCivCoMKgwqDCoMKgwqDCoCBsb2dnaW5nLndhcm5pbmcoJnF1b3Q7Q1ZF
IGVudHJ5ICVzIHVwZGF0ZSBmcm9tIFVucGF0Y2hlZCB0byBQYXRjaGVkIGZyb20gdGhlIHNjYW4g
cmVzdWx0JnF1b3Q7LCBjdmUpPGJyPg0KK8KgwqDCoMKgwqDCoMKgIGN2ZV9kYXRhW2N2ZV0gPSBj
b3B5X2RhdGEoY3ZlX2RhdGFbY3ZlXSwgZW50cnkpPGJyPg0KK8KgwqDCoMKgwqDCoMKgIHJldHVy
bjxicj4NCivCoMKgwqAgIyBJZiB3ZSBoYXZlIGFuICZxdW90O0lnbm9yZWQmcXVvdDssIGl0IGhh
cyBhIHByaW9yaXR5PGJyPg0KK8KgwqDCoCBpZiBjdmVfZGF0YVtjdmVdWyYjMzk7c3RhdHVzJiMz
OTtdID09ICZxdW90O0lnbm9yZWQmcXVvdDs6PGJyPg0KK8KgwqDCoMKgwqDCoMKgIGxvZ2dpbmcu
ZGVidWcoJnF1b3Q7Q1ZFICVzIG5vdCB1cGRhdGluZyBiZWNhdXNlIElnbm9yZWQmcXVvdDssIGN2
ZSk8YnI+DQorwqDCoMKgwqDCoMKgwqAgcmV0dXJuPGJyPg0KK8KgwqDCoCAjIElmIHdlIGhhdmUg
YW4gJnF1b3Q7SWdub3JlZCZxdW90OywgaXQgaGFzIGEgcHJpb3JpdHk8YnI+DQorwqDCoMKgIGlm
IGVudHJ5WyYjMzk7c3RhdHVzJiMzOTtdID09ICZxdW90O0lnbm9yZWQmcXVvdDs6PGJyPg0KK8Kg
wqDCoMKgwqDCoMKgIGN2ZV9kYXRhW2N2ZV0gPSBjb3B5X2RhdGEoY3ZlX2RhdGFbY3ZlXSwgZW50
cnkpPGJyPg0KK8KgwqDCoMKgwqDCoMKgIGxvZ2dpbmcuZGVidWcoJnF1b3Q7Q1ZFIGVudHJ5ICVz
IHVwZGF0ZWQgZnJvbSBVbnBhdGNoZWQgdG8gSWdub3JlZCZxdW90OywgY3ZlKTxicj4NCivCoMKg
wqDCoMKgwqDCoCByZXR1cm48YnI+DQorwqDCoMKgIGxvZ2dpbmcud2FybmluZygmcXVvdDtVbmhh
bmRsZWQgQ1ZFIGVudHJ5IHVwZGF0ZSBmb3IgJXMgJXMgZnJvbSAlcyAlcyB0byAlcyZxdW90Oyw8
YnI+DQorwqDCoMKgwqDCoMKgwqAgY3ZlLCBjdmVfZGF0YVtjdmVdWyYjMzk7c3RhdHVzJiMzOTtd
LCBjdmVfZGF0YVtjdmVdWyYjMzk7ZGV0YWlsJiMzOTtdLMKgIGVudHJ5WyYjMzk7c3RhdHVzJiMz
OTtdLCBlbnRyeVsmIzM5O2RldGFpbCYjMzk7XSk8YnI+DQorPGJyPg0KK2RlZiBtYWluKCk6PGJy
Pg0KK8KgwqDCoCBwYXJzZXIgPSBhcmdwYXJzZS5Bcmd1bWVudFBhcnNlcig8YnI+DQorwqDCoMKg
wqDCoMKgwqAgZGVzY3JpcHRpb249JnF1b3Q7VXBkYXRlIGN2ZS1zdW1tYXJ5IHdpdGgga2VybmVs
IGNvbXBpbGVkIGZpbGVzIGFuZCBrZXJuZWwgQ1ZFIGluZm9ybWF0aW9uJnF1b3Q7PGJyPg0KK8Kg
wqDCoCApPGJyPg0KK8KgwqDCoCBwYXJzZXIuYWRkX2FyZ3VtZW50KDxicj4NCivCoMKgwqDCoMKg
wqDCoCAmcXVvdDstcyZxdW90Oyw8YnI+DQorwqDCoMKgwqDCoMKgwqAgJnF1b3Q7LS1zcGR4JnF1
b3Q7LDxicj4NCivCoMKgwqDCoMKgwqDCoCBoZWxwPSZxdW90O1NQRFgyLzMgZm9yIHRoZSBrZXJu
ZWwuIE5lZWRzIHRvIGluY2x1ZGUgY29tcGlsZWQgc291cmNlcyZxdW90Oyw8YnI+DQorwqDCoMKg
ICk8YnI+DQorwqDCoMKgIHBhcnNlci5hZGRfYXJndW1lbnQoPGJyPg0KK8KgwqDCoMKgwqDCoMKg
ICZxdW90Oy0tZGF0YWRpciZxdW90Oyw8YnI+DQorwqDCoMKgwqDCoMKgwqAgdHlwZT1wYXRobGli
LlBhdGgsPGJyPg0KK8KgwqDCoMKgwqDCoMKgIGhlbHA9JnF1b3Q7RGlyZWN0b3J5IHdoZXJlIENW
RSBkYXRhIGlzJnF1b3Q7LDxicj4NCivCoMKgwqDCoMKgwqDCoCByZXF1aXJlZD1UcnVlPGJyPg0K
K8KgwqDCoCApPGJyPg0KK8KgwqDCoCBwYXJzZXIuYWRkX2FyZ3VtZW50KDxicj4NCivCoMKgwqDC
oMKgwqDCoCAmcXVvdDstLW9sZC1jdmUtcmVwb3J0JnF1b3Q7LDxicj4NCivCoMKgwqDCoMKgwqDC
oCBoZWxwPSZxdW90O0NWRSByZXBvcnQgdG8gdXBkYXRlLiAoT3B0aW9uYWwpJnF1b3Q7LDxicj4N
CivCoMKgwqAgKTxicj4NCivCoMKgwqAgcGFyc2VyLmFkZF9hcmd1bWVudCg8YnI+DQorwqDCoMKg
wqDCoMKgwqAgJnF1b3Q7LS1rZXJuZWwtdmVyc2lvbiZxdW90Oyw8YnI+DQorwqDCoMKgwqDCoMKg
wqAgaGVscD0mcXVvdDtLZXJuZWwgdmVyc2lvbi4gTmVlZGVkIGlmIG9sZCBjdmVfcmVwb3J0IGlz
IG5vdCBwcm92aWRlZCAoT3B0aW9uYWwpJnF1b3Q7LDxicj4NCivCoMKgwqDCoMKgwqDCoCB0eXBl
PVZlcnNpb248YnI+DQorwqDCoMKgICk8YnI+DQorwqDCoMKgIHBhcnNlci5hZGRfYXJndW1lbnQo
PGJyPg0KK8KgwqDCoMKgwqDCoMKgICZxdW90Oy0tbmV3LWN2ZS1yZXBvcnQmcXVvdDssPGJyPg0K
K8KgwqDCoMKgwqDCoMKgIGhlbHA9JnF1b3Q7T3V0cHV0IGZpbGUmcXVvdDssPGJyPg0KK8KgwqDC
oMKgwqDCoMKgIGRlZmF1bHQ9JnF1b3Q7Y3ZlLXN1bW1hcnktZW5oYW5jZS5qc29uJnF1b3Q7PGJy
Pg0KK8KgwqDCoCApPGJyPg0KK8KgwqDCoCBwYXJzZXIuYWRkX2FyZ3VtZW50KDxicj4NCivCoMKg
wqDCoMKgwqDCoCAmcXVvdDstRCZxdW90Oyw8YnI+DQorwqDCoMKgwqDCoMKgwqAgJnF1b3Q7LS1k
ZWJ1ZyZxdW90Oyw8YnI+DQorwqDCoMKgwqDCoMKgwqAgaGVscD0mIzM5O0VuYWJsZSBkZWJ1ZyAm
IzM5Oyw8YnI+DQorwqDCoMKgwqDCoMKgwqAgYWN0aW9uPSZxdW90O3N0b3JlX3RydWUmcXVvdDsp
PGJyPg0KKzxicj4NCivCoMKgwqAgYXJncyA9IHBhcnNlci5wYXJzZV9hcmdzKCk8YnI+DQorPGJy
Pg0KK8KgwqDCoCBpZiBhcmdzLmRlYnVnOjxicj4NCivCoMKgwqDCoMKgwqDCoCBsb2dfbGV2ZWw9
bG9nZ2luZy5ERUJVRzxicj4NCivCoMKgwqAgZWxzZTo8YnI+DQorwqDCoMKgwqDCoMKgwqAgbG9n
X2xldmVsPWxvZ2dpbmcuSU5GTzxicj4NCivCoMKgwqAgbG9nZ2luZy5iYXNpY0NvbmZpZyhmb3Jt
YXQ9JiMzOTtbJShmaWxlbmFtZSlzOiUobGluZW5vKWRdICUobWVzc2FnZSlzJiMzOTssIGxldmVs
PWxvZ19sZXZlbCk8YnI+DQorPGJyPg0KK8KgwqDCoCBpZiBub3QgYXJncy5rZXJuZWxfdmVyc2lv
biBhbmQgbm90IGFyZ3Mub2xkX2N2ZV9yZXBvcnQ6PGJyPg0KK8KgwqDCoMKgwqDCoMKgIHBhcnNl
ci5lcnJvcigmcXVvdDtlaXRoZXIgLS1rZXJuZWwtdmVyc2lvbiBvciAtLW9sZC1jdmUtcmVwb3J0
IGFyZSBuZWVkZWQmcXVvdDspPGJyPg0KK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtMTxicj4NCis8
YnI+DQorwqDCoMKgICMgYnkgZGVmYXVsdCB3ZSBkb24mIzM5O3QgY2hlY2sgdGhlIGNvbXBpbGVk
IGZpbGVzLCB1bmxlc3MgcHJvdmlkZWQ8YnI+DQorwqDCoMKgIGNvbXBpbGVkX2ZpbGVzID0gW108
YnI+DQorwqDCoMKgIGlmIGFyZ3Muc3BkeDo8YnI+DQorwqDCoMKgwqDCoMKgwqAgY29tcGlsZWRf
ZmlsZXMgPSByZWFkX3NwZHgoYXJncy5zcGR4KTxicj4NCivCoMKgwqDCoMKgwqDCoCA8YSBocmVm
PSJodHRwOi8vbG9nZ2luZy5pbmZvIiB0YXJnZXQ9Il9ibGFuayI+bG9nZ2luZy5pbmZvPC9hPigm
cXVvdDtUb3RhbCBjb21waWxlZCBmaWxlcyAlZCZxdW90OywgbGVuKGNvbXBpbGVkX2ZpbGVzKSk8
YnI+DQorPGJyPg0KK8KgwqDCoCBpZiBhcmdzLm9sZF9jdmVfcmVwb3J0Ojxicj4NCivCoMKgwqDC
oMKgwqDCoCB3aXRoIG9wZW4oYXJncy5vbGRfY3ZlX3JlcG9ydCwgZW5jb2Rpbmc9JiMzOTtJU08t
ODg1OS0xJiMzOTspIGFzIGY6PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3ZlX3JlcG9y
dCA9IGpzb24ubG9hZChmKTxicj4NCivCoMKgwqAgZWxzZTo8YnI+DQorwqDCoMKgwqDCoMKgwqAg
I0lmIHN1bW1hcnkgbm90IHByb3ZpZGVkLCB3ZSBjcmVhdGUgb25lPGJyPg0KK8KgwqDCoMKgwqDC
oMKgIGN2ZV9yZXBvcnQgPSB7PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7dmVy
c2lvbiZxdW90OzogJnF1b3Q7MSZxdW90Oyw8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAm
cXVvdDtwYWNrYWdlJnF1b3Q7OiBbPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB7PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZxdW90O25h
bWUmcXVvdDs6ICZxdW90O2xpbnV4LXlvY3RvJnF1b3Q7LDxicj4NCivCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcXVvdDt2ZXJzaW9uJnF1b3Q7OiBzdHIoYXJncy5rZXJu
ZWxfdmVyc2lvbiksPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICZxdW90O3Byb2R1Y3RzJnF1b3Q7OiBbPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgezxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7cHJvZHVjdCZxdW90OzogJnF1b3Q7bGlu
dXhfa2VybmVsJnF1b3Q7LDxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgJnF1b3Q7Y3Zlc0luUmVjb3JkJnF1b3Q7OiAmcXVvdDtZZXMm
cXVvdDs8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB9PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF0sPGJyPg0K
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZxdW90O2lzc3VlJnF1b3Q7
OiBbXTxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTxicj4NCivCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIF08YnI+DQorwqDCoMKgwqDCoMKgwqAgfTxicj4NCis8YnI+DQorwqDC
oMKgIGZvciBwa2cgaW4gY3ZlX3JlcG9ydFsmIzM5O3BhY2thZ2UmIzM5O106PGJyPg0KK8KgwqDC
oMKgwqDCoMKgIGlzX2tlcm5lbCA9IEZhbHNlPGJyPg0KK8KgwqDCoMKgwqDCoMKgIGZvciBwcm9k
dWN0IGluIHBrZ1smIzM5O3Byb2R1Y3RzJiMzOTtdOjxicj4NCivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIHByb2R1Y3RbJiMzOTtwcm9kdWN0JiMzOTtdID09ICZxdW90O2xpbnV4X2tlcm5lbCZx
dW90Ozo8YnI+DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlzX2tlcm5lbD1UcnVl
PGJyPg0KK8KgwqDCoMKgwqDCoMKgIGlmIG5vdCBpc19rZXJuZWw6PGJyPg0KK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29udGludWU8YnI+DQorPGJyPg0KK8KgwqDCoMKgwqDCoMKgIGtlcm5lbF9j
dmVzID0gZ2V0X2tlcm5lbF9jdmVzKGFyZ3MuZGF0YWRpciw8YnI+DQorwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29tcGlsZWRfZmlsZXMsPGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZlcnNpb24ocGtnWyZx
dW90O3ZlcnNpb24mcXVvdDtdKSk8YnI+DQorwqDCoMKgwqDCoMKgwqAgPGEgaHJlZj0iaHR0cDov
L2xvZ2dpbmcuaW5mbyIgdGFyZ2V0PSJfYmxhbmsiPmxvZ2dpbmcuaW5mbzwvYT4oJnF1b3Q7VG90
YWwga2VybmVsIGN2ZXMgZnJvbSBrZXJuZWwgQ05BOiAlcyZxdW90OywgbGVuKGtlcm5lbF9jdmVz
KSk8YnI+DQorwqDCoMKgwqDCoMKgwqAgY3ZlcyA9IHtpc3N1ZVsmcXVvdDtpZCZxdW90O106IGlz
c3VlIGZvciBpc3N1ZSBpbiBwa2dbJnF1b3Q7aXNzdWUmcXVvdDtdfTxicj4NCivCoMKgwqDCoMKg
wqDCoCA8YSBocmVmPSJodHRwOi8vbG9nZ2luZy5pbmZvIiB0YXJnZXQ9Il9ibGFuayI+bG9nZ2lu
Zy5pbmZvPC9hPigmcXVvdDtUb3RhbCBrZXJuZWwgYmVmb3JlIHByb2Nlc3NpbmcgY3ZlczogJXMm
cXVvdDssIGxlbihjdmVzKSk8YnI+DQorPGJyPg0KK8KgwqDCoMKgwqDCoMKgIGZvciBjdmUgaW4g
a2VybmVsX2N2ZXM6PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3ZlX3VwZGF0ZShjdmVz
LCBjdmUsIGtlcm5lbF9jdmVzW2N2ZV0pPGJyPg0KKzxicj4NCivCoMKgwqDCoMKgwqDCoCBwa2db
JnF1b3Q7aXNzdWUmcXVvdDtdID0gW108YnI+DQorwqDCoMKgwqDCoMKgwqAgZm9yIGN2ZSBpbiBz
b3J0ZWQoY3Zlcyk6PGJyPg0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGtnWyZxdW90O2lzc3Vl
JnF1b3Q7XS5leHRlbmQoW2N2ZXNbY3ZlXV0pPGJyPg0KK8KgwqDCoMKgwqDCoMKgIDxhIGhyZWY9
Imh0dHA6Ly9sb2dnaW5nLmluZm8iIHRhcmdldD0iX2JsYW5rIj5sb2dnaW5nLmluZm88L2E+KCZx
dW90O1RvdGFsIGtlcm5lbCBjdmVzIGFmdGVyIHByb2Nlc3Npbmc6ICVzJnF1b3Q7LCBsZW4ocGtn
WyYjMzk7aXNzdWUmIzM5O10pKTxicj4NCis8YnI+DQorwqDCoMKgIHdpdGggb3BlbihhcmdzLm5l
d19jdmVfcmVwb3J0LCAmcXVvdDt3JnF1b3Q7LCBlbmNvZGluZz0mIzM5O0lTTy04ODU5LTEmIzM5
OykgYXMgZjo8YnI+DQorwqDCoMKgwqDCoMKgwqAganNvbi5kdW1wKGN2ZV9yZXBvcnQsIGYsIGlu
ZGVudD0yKTxicj4NCis8YnI+DQorwqDCoMKgIHJldHVybiAwPGJyPg0KKzxicj4NCitpZiBfX25h
bWVfXyA9PSAmcXVvdDtfX21haW5fXyZxdW90Ozo8YnI+DQorwqDCoMKgIHN5cy5leGl0KG1haW4o
KSk8YnI+DQorPGJyPg0KLS0gPGJyPg0KMi4zNC4xPGJyPg0KPGJyPg0KPC9kaXY+DQo8L3NwYW4+
PC9mb250PjwvZGl2Pg0KPC9kaXY+DQoNCjxicj4NCi09LT0tPS09LT0tPS09LT0tPS09LT0tPGJy
Pg0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuPGJy
Pg0KVmlldy9SZXBseSBPbmxpbmUgKCMyMzAzMzgpOiA8YSBocmVmPSJodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIzMDMzOCIgcmVsPSJu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMzAzMzg8L2E+PGJyPg0KTXV0ZSBUaGlzIFRv
cGljOiA8YSBocmVmPSJodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE3MzQ0MTk5
LzQzMTYxODUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9tdC8xMTczNDQxOTkvNDMxNjE4NTwvYT48YnI+DQpHcm91cCBPd25l
cjogPGEgaHJlZj0ibWFpbHRvOm9wZW5lbWJlZGRlZC1jb3JlJTJCb3duZXJAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPm9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc8L2E+PGJyPg0KVW5zdWJzY3JpYmU6IDxhIGhyZWY9Imh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YjwvYT4gWzxhIGhyZWY9Im1haWx0bzp5b2Fubi5jb25n
YWxAc21pbGUuZnIiIHRhcmdldD0iX2JsYW5rIj55b2Fubi5jb25nYWxAc21pbGUuZnI8L2E+XTxi
cj4NCi09LT0tPS09LT0tPS09LT0tPS09LT0tPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2
PjxkaXY+PGJyIGNsZWFyPSJhbGwiPjwvZGl2Pjxicj48c3BhbiBjbGFzcz0iZ21haWxfc2lnbmF0
dXJlX3ByZWZpeCI+LS0gPC9zcGFuPjxicj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfc2ln
bmF0dXJlIj48ZGl2IGRpcj0ibHRyIj48Zm9udCBmYWNlPSJSYWxld2F5LCByZWd1bGFyIj5Zb2Fu
biBDb25nYWw8L2ZvbnQ+PGRpdj48Zm9udCBmYWNlPSJSYWxld2F5LCByZWd1bGFyIj5TbWlsZSBF
Q1M8L2ZvbnQ+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+
DQo=
--00000000000072b4440649ed4028--

