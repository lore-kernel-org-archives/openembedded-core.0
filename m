Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DF1F43695
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 12:04:01 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43331.1776427432939651226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 05:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e7jIPFVd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66f727d6849so928791a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 05:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776427431; x=1777032231; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DelC7xexNFJOuG/WvSQi+85IS6VxGZCb/uFVyeJnekc=;
        b=e7jIPFVdueNld+ocI6rJaqOwoim9NzDGkemyMrRJd9A2oUS6DXTMrjiG03033Gvber
         EDu3i3szz7U8cf5fB6xUtVUPl4shuNg51BhPOwlFzeHITv48vhsZe8vcPHwMD8Ngglo7
         mUqlk3NxACIGVsr+VQf2ZPo+O8WiPDBUnNZOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776427431; x=1777032231;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DelC7xexNFJOuG/WvSQi+85IS6VxGZCb/uFVyeJnekc=;
        b=nnJWgK6VxGTR72gQF70pl9dHV23mSt7vM7ue1AoS7cA8h8BSu+ijQSmaVfbg2Dw9lH
         G38kWcdns6ApSORzzVsVjTVGTBwJXYIhKnFA0Hr9s30J2OLY7/rHMryiK/Jt2u+T4tZS
         +XjteLxniKIwxkm/enW9wnfX317wzYYGMfWWy5nW57eBSTbmSpyVgnre5zjo5hnhsr6u
         DqkKpLksx5x4T/Lo8UNoICjLAhHwim2KoabRE8qokveYUc9bSQFrcmpejYu8FOWB3/xG
         VQf1H+fcMrJxNifZE0DvHG3EyE50wwkmUUMHO6XbWId+gCzgYSi4LOktPqPUuV5UVCZy
         lX+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8vu8lUXOfo5swMZxEQfsvFe06doY2fHVJkYwaXYaWHDa7gp+FECgruHFje3j3macf9PqOvCWfgSjrWQSTkNNUtFw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7wONwwtje/e+vgT5jev2JC1Oj+EbP2jPPijiiWnH8oMlaY/Nr
	2ocBcmY2zCxUmluLBiZeF7hsDetGNhpIvfvrnxcAFIKxG5rxnDL0WCWi0DRlR8ygh4U=
X-Gm-Gg: AeBDievEMwDYELprNe6KLmhdCplV7ktHgu+p+bgoydsgNphVFnzSED+pegYIKRcjTt4
	mKIGRTVsquFhFOIv9yf03EoWVyiIYPui+A3CymbWmRCOLQY9TvllOG+v4BE9NWyEyd3DRWrItPF
	oK2LpkHPrVrQlefNgobOTKjuvYA3x54dXteBRKSBip6G5pLtbjvRz5tdBMB37XjmfVU3caKB0RH
	nFa3d6lufL4N+AtR3rpAsKn3v1SgLARyl1ZtGK5PfEkg1jJtv5WNQNK/zCSjImdMj/FDn9oQTyn
	jQpT7gSNh8x7cvahGrCn63squorddWlvCgnw9VuLGYxGRjF70OQW0Yl33iyxeV6hHFK/3ZZK5iR
	APT//Vh5jCdqfwdm/Z9h7q+8a8nHYf3lQSks+f699E11uIX3EmOxV+QYJkcVA1pFfgPgy4YHGMB
	A4WT0Uvt22zSNJcAK6X8zHAN2bBquiRO/cqzhM5dOS4Lr5gQfxeA6LlF9B1oH2L+5IB52ht4p0s
	N/NzQfztuxann/v4NXbSzIAYeU=
X-Received: by 2002:a17:907:2d9e:b0:b9c:4096:7893 with SMTP id a640c23a62f3a-ba41907450fmr137135166b.14.1776427430768;
        Fri, 17 Apr 2026 05:03:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d1f3:409a:3cf5:1213? ([2001:8b0:aba:5f3c:d1f3:409a:3cf5:1213])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d67e50sm307446a12.27.2026.04.17.05.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 05:03:49 -0700 (PDT)
Message-ID: <3b0b8c914e99882168b9415dba9d001a4381e150.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] create-spdx-3.0: rerun do_create_recipe_spdx
 on patch changes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com
Date: Fri, 17 Apr 2026 13:03:47 +0100
In-Reply-To: <20260417083025.95554-1-peter.marko@siemens.com>
References: <20260417083025.95554-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 12:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235496

On Fri, 2026-04-17 at 10:30 +0200, Peter Marko via lists.openembedded.org w=
rote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Valkyrie patchmetrics from 2026-04-17 is showing two CVEs where patches
> were merged the day before (2026-04-16) - inetutils/CVE-2026-32746 and
> re2c/CVE-2026-2903.
> Root-cause is that the CVE patches are evaluated in task
> do_create_recipe_spdx which does not have any dependency on SRC_URI nor
> content of the patches, so it is taken from sstate-cache which contains
> old (stale) data.
>=20
> Note that this will mean that running sbom-cve-check will run do_fetch
> task for all evaluated recipes, however that is necessary to catch also
> changes within patch content (e.g. adding additional CVE: tags) in
> addition to re-running when adding new patches if we would only add
> dependency on SRC_URI variable.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> =C2=A0meta/classes/create-spdx-3.0.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 432adb14cd..db1ccc0c81 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -192,7 +192,7 @@ python do_create_recipe_spdx() {
> =C2=A0=C2=A0=C2=A0=C2=A0 import oe.spdx30_tasks
> =C2=A0=C2=A0=C2=A0=C2=A0 oe.spdx30_tasks.create_recipe_spdx(d)
> =C2=A0}
> -addtask do_create_recipe_spdx
> +addtask do_create_recipe_spdx after do_fetch
> =C2=A0
> =C2=A0SSTATETASKS +=3D "do_create_recipe_spdx"
> =C2=A0do_create_recipe_spdx[sstate-inputdirs] =3D "${SPDXRECIPEDEPLOY}"

What data does do_create_recipe_spdx actually need?

Does it just need SRC_URI, or does it need to re-run if any of the
contents of items in SRC_URI changes? Or does it actually need the
patch contents?

If it needs to depend on more than the contents of SRC_URI, it should
have a dependency but I think Joshua was trying to avoid that. The
dependency would be on unpack or patch, not fetch as it shouldn't be
poking into DL_DIR.

FWIW, the way do_fetch runs only if it needs to is:

do_fetch[file-checksums] =3D "${@bb.fetch.get_checksum_file_list(d)}"
do_fetch[file-checksums] +=3D " ${@get_lic_checksum_file_list(d)}"

Cheers,

Richard



