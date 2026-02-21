Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DA2C624A4
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 21:48:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2884.1771710529679650403
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 13:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YQuuuTNF;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso25275655e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 13:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771710528; x=1772315328; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9qkvkeq6lxtmzjcHqIngTkzbVghbh1tllPjvrYGEew=;
        b=YQuuuTNFOV0inRbCDOlTv0WkBelk1bNFPxSZhJgaSx589s6r5Op1VM8edeGaLPBDjr
         2pLPJYAkRcvxbomzZJ12Ut/YPL0QDNEp0IJEds8Aw+K3dmwZoUON8QIJ3/deb4sJuCn1
         K5P3cXgdU+8IWhKrueWiMhZylqh+y/1HhjL8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771710528; x=1772315328;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9qkvkeq6lxtmzjcHqIngTkzbVghbh1tllPjvrYGEew=;
        b=MYLo9PG8cRBsP1YjTUf2K2tN6ZP7LYQxlr+DPgrc19rEpMAtLMk+5fdeWBvTGFzmrI
         YvHa6AjHAbIpy5zX9bEREUM3ZquQYP62bTWcA3kWKlbWn+Lz2tWpn5Ly+aXbzzdg1G5t
         c1a/6Vdfq7hMslWqUOdo97osXlAJXGcTXlEmA/RFMwZBUvAB+LdVhT2wfjprQleDfKSl
         oXY/bfagNoTIWGC5+7zlDRCQtCuwdmHy4IJIpPx5axLSpgToCC3rcCQcRuUS3BlfuUg3
         amqGv96PxrLulmUL0rbi7zXZxbRMNwdixByrAxvaI2dnjirCRkgWGkOvSNao9rGes+Fa
         c0Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX4O7BBVKJL4+E4hdKDklMqAdmpKdw7DNoEwXxYqz9E0Xb42rrFjT0j8ySOdz2GhMleUlsk1Z+BXNm2EPYUJ9ytqQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySDreiORUB+20lKx6EKXUIqhvHuiZDgkCUDjbWHtMfL1SDm/D1
	Lwsd6nASkeMNG+8ag8pOIgHnlfDEjzNMiqrTALCocrADf1hzK4GI/pK/VeucXmj35BDOl/eJEaT
	IEvDe
X-Gm-Gg: AZuq6aL6oCwpRdDy116hWcYVH/tA2KhhRk6gwcYF0n6b8dKwazzRuievAijdZAOSlSh
	89GUynTsIhsLk6mBqGZ2vEtiIZedsVKP1xG0WKPdL6ZV/SWbQFvk88eBoh55gnMUYDXSBnN9VWg
	lC+WY5Nw+z20g1lvg8y+YPn4ymDMP4E2XCSclG+mYaJ/q5ghQ/wBg8RltW9YBnK+PbRFE0RK2xN
	piYDLtVs2rECXzCvvu9uJw+SaGr25MGFsRC9PQoIlvXX3ovWYFXymkcGFqLnYU41jRx1PuUMuWB
	1bqSyYn+q6bJHVpvZ+b37zpMDyznz9+UdheEqXYm6A7ZQa4FIi7NXmsPU1E0Ti+G9YT8DUm3Bq4
	km66c7SHJkwUjahiyg917pgI636OtaIrP7bhYRSMg+sK9HbRdOoxYAr+JZBiUE5jePpwVPLcuKc
	0vDNlHV3oszIVc2TXqWXIPAru6E0EYVuwGfvtJeAUJookShl5/uRItrN8fr7pJN8n0CswezDIL8
	GFVc5aBshr6lo4=
X-Received: by 2002:a05:600c:3e05:b0:483:78e1:784 with SMTP id 5b1f17b1804b1-483a95aaeb9mr64754525e9.4.1771710527792;
        Sat, 21 Feb 2026 13:48:47 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm7609412f8f.29.2026.02.21.13.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 13:48:47 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 22:48:46 +0100
Message-Id: <DGKYYRP6LKYP.3O6GA4S9H6SZP@smile.fr>
Subject: Re: [OE-core][PATCH v3] wic/engine: error on old host debugfs for
 standalone directory copy
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <daniel.dragomir@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260211131120.2502404-1-daniel.dragomir@windriver.com>
In-Reply-To: <20260211131120.2502404-1-daniel.dragomir@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 21:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231623

On Wed Feb 11, 2026 at 2:11 PM CET, Daniel via lists.openembedded.org Drago=
mir wrote:
> When wic is used in standalone mode, it relies on host tools such as
> debugfs. For directory host->image copies into ext* partitions, wic
> uses scripted debugfs "-f" input with multiple mkdir/write commands.
>
> Older host debugfs versions (< 1.46.5) may behave unreliably in this
> mode and can silently miss files. This does not affect builds using
> debugfs from OE where the version is known to be sufficiently new.
>
> Add a debugfs version check and emit an error when an older host
> debugfs is detected. The error is shown once per run and halts execution.
>
> Changes in v2:
> - adjust the last working debugfs version to 1.46.5
>
> Changes in v3:
> - switch debugfs check from warning to error

Hello,

We missed it during review and this patch has now merge with a minor
problem: the "Changes in" notes are part of the merged commit message.
While precious during review and patch iteration, this info is not
useful once the patch has merged.

For the next patches, please put these notes below the "---" line. This
will prevent them to appear in the final merged commit.

Thanks!
>
> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
> ---
>  scripts/lib/wic/engine.py | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index 565a0db38a..8ca8ed0dbd 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -220,6 +220,34 @@ def wic_list(args, scripts_path):
> =20
>      return False
> =20
> +_DEBUGFS_VERSION =3D None
> +
> +def debugfs_version_check(debugfs_path, min_ver=3D(1, 46, 5)):
> +    global _DEBUGFS_VERSION
> +
> +    if _DEBUGFS_VERSION is None:
> +        out =3D ""
> +        for flag in ("-V", "-v"):
> +            try:
> +                out =3D exec_cmd(f"{debugfs_path} {flag}")
> +                break
> +            except Exception:
> +                continue
> +
> +        import re
> +        m =3D re.search(r"(\d+)\.(\d+)\.(\d+)", out or "")
> +        _DEBUGFS_VERSION =3D tuple(map(int, m.groups())) if m else None
> +
> +    ver =3D _DEBUGFS_VERSION
> +
> +    if ver is not None and ver < min_ver:
> +        raise WicError(
> +            "Sorry, debugfs 1.46.5 or later is required for this script.=
 "
> +            "Older versions of debugfs can make directory copies into ex=
t* partitions "
> +            "via scripted debugfs (-f) unreliable or broken. Detected ve=
rsion: %s"
> +            % (".".join(map(str, ver)) if ver else "unknown")
> +        )
> +
> =20
>  class Disk:
>      def __init__(self, imagepath, native_sysroot, fstypes=3D('fat', 'ext=
')):
> @@ -334,6 +362,7 @@ class Disk:
>          if self.partitions[pnum].fstype.startswith('ext'):
>              if isinstance(src, str): # host to image case
>                  if os.path.isdir(src):
> +                    debugfs_version_check(self.debugfs)
>                      base =3D os.path.abspath(src)
>                      base_parent =3D os.path.dirname(base)
>                      cmds =3D []


--=20
Yoann Congal
Smile ECS


