Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843C2EE3696
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 15:15:35 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47370.1770909334425568147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 07:15:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ScZeI/JI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65941c07fb4so12272775a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 07:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770909333; x=1771514133; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzuS7xuwB2MurCwwmCCdfdxhuh41ekcaNRePj1Onrds=;
        b=ScZeI/JINF5t4KZmt45q/Vv2nPam+IO3u222aG+UhqdJfwVlrKiyZYkj35lHRzC5oj
         3njmYTfLbrtAYm5bSLfui9ZxqCtuqHQCvwKzfFt9je8jpL4pmMyWDA+hFxui5DNchZI8
         qNO+Z213wMluUG3cLZxMmDeLGyuS7hSHRJI2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770909333; x=1771514133;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzuS7xuwB2MurCwwmCCdfdxhuh41ekcaNRePj1Onrds=;
        b=k0t0yi8n0sLrHMRXGMS/xV1eEKBVsYbywJk8bvDSR7qxVRYZJp4QCc3KSW4GGhA7LO
         z/BPBwSd65X2QWwOkNpGbzvRlf60Jc0Bhg8sz+jjzx68qLyBiW8eS+eiQOY9ECR/2YWT
         oE+B28q9y2cH4bXU2hKWZSzJn1hB6l5yL9keV4h9Iel8snQdKsAtVB5zGZ1Eu52v0EZ9
         A5Fa3XZCct++4XAmCH1iU5/UGJkQ4KkWZRUMvgMG6CTjo4JDI4OveSuHbBv6fACYH7Me
         SAIBugaXeK/O3ySvnpqdLMiduvtgortwpBIvRgj3aMo6i9KQEAV+e6Ucn9qPCGGKMM3Y
         zLWA==
X-Forwarded-Encrypted: i=1; AJvYcCWRjBtDrxjOBZMKNN9PrT0N8NXVes0jDgRKJdbzdk162msaOgPi1/Qn3hqca1R0GfZ2RGiQAdqG3xyD9dZdZWhIVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxztWJUtG5jPOSt3vPRRQFk6lljibegCZuLZxSrfzOKSXeSYdUZ
	px0LXfQZewfTy7kXCUKbK2p2DWGu1uVXkJnQlNEVO4YAvQKqpXOgYmhqnDIoQSCJ7Yw=
X-Gm-Gg: AZuq6aK3o9oDDl4084ajrTiOzEwKMrbrSEwijHwqNOJEE4tLmEvmBzsGYrNQnBGJ9aU
	HMxT9WdjYzWIGWlpXaI7m+Nw1GsARZEc0vydhomp8HYUx3tiE4GFqPU7T1D6vPCfIhnO39qmucb
	AFMNMgPqb7L1W4vHGZC4zdlLvPZueJ5CZMbH9ziPtapy2Ek6BcQa8sxWvyVp33kOouJ/CLCtBry
	lpfEkL25aJSpGjlzEkAG6VD29cZNwFz2PpMSkbx/feqtTlRvfc9x22cHY5gpjy1KbgXXRS5TRGJ
	Z0AxX/yncD+q6YiP+49WzhHhyNMHEexk6ziwqy3d8I3h0uozgj7FD0VL6kVEZQzP7aQptqA2PA5
	m+uMbi4jM2dmr2cCu4G7hh6g6oHQYfiU4M5oCVDyOWo9HcrESU+HitOk+S2YaldavRHwFtsuR27
	1NK+/M5WAweGuSgqZ5P4qOFO1peSgSPAl6iRCeYEAU4PpQX3w14ZiCb3KZ3T7uHS8qpO9WZuHBQ
	vnizz/57Os6sSY=
X-Received: by 2002:a05:6402:3509:b0:658:c933:cf19 with SMTP id 4fb4d7f45d1cf-65b96e3bac0mr1555348a12.31.1770909332663;
        Thu, 12 Feb 2026 07:15:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2d5c:3d9d:6093:b070? ([2001:8b0:aba:5f3c:2d5c:3d9d:6093:b070])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cebe165sm1806221a12.9.2026.02.12.07.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 07:15:31 -0800 (PST)
Message-ID: <4a2c5d68e143c2260023afbdb67ab25573c7a49c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] devtool: standard: Add new patches in correct
 order when finishing
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Date: Thu, 12 Feb 2026 15:15:30 +0000
In-Reply-To: <20260206011344.1788785-1-pkj@axis.com>
References: <20260206011344.1788785-1-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 15:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231035

Hi Peter,

On Fri, 2026-02-06 at 02:13 +0100, Peter Kjellerstedt via lists.openembedde=
d.org wrote:
> Make sure that new patches that are added as a result of using devtool
> finish are added to the SRC_URI in the same order they were committed.
>=20
> Previously, the order was a result of the arbitrary order the patch
> files were returned by os.walk(), which typically resulted in them being
> added to the SRC_URI in the reverse order they were committed.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> =C2=A0meta/lib/oeqa/selftest/cases/devtool.py | 30 +++++++++++++++++++---=
---
> =C2=A0scripts/lib/devtool/standard.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 6 ++++-
> =C2=A02 files changed, 28 insertions(+), 8 deletions(-)
>=20
>=20
>=20
[....]

> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
> index 1fd5947c41..7afb4654cc 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -1322,7 +1322,11 @@ def _export_patches(srctree, rd, start_revs, destd=
ir, changed_revs=3DNone):
> =C2=A0=C2=A0=C2=A0=C2=A0 patch_pathspec =3D _git_exclude_path(srctree, 'o=
e-local-files')
> =C2=A0=C2=A0=C2=A0=C2=A0 GitApplyTree.extractPatches(srctree, start_revs,=
 destdir, patch_pathspec)
> =C2=A0=C2=A0=C2=A0=C2=A0 for dirpath, dirnames, filenames in os.walk(dest=
dir):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_patches =3D filenames
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Sort the filenames to avoid=
 the arbitrary order resulting from using
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # os.walk(). This matters for=
 added patches, and the assumption is that
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # they are prefixed by a four=
 digit number resulting from the order in
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # which they were committed.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_patches =3D sorted(filena=
mes)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reldirpath =3D os.path.r=
elpath(dirpath, destdir)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for new_patch in new_pat=
ches:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# Strip numbering from patch names. If it's a git sequence named patch,

This looks like a good find and something we should fix.

I did wonder if we always number the patches? I ask as the code in
extractPatches() calls:

"git", "format-patch", "--no-signature", "--no-numbered"

which hints that it might not?

Could we pass the patch list from that function in the correct order
rather than relying on a directory listing?

Cheers,

Richard

