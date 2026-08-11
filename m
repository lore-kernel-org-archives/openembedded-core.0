Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98F6C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 10:05:36 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51258.1786442731123411288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 03:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CHGhE9tq;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9034b6b7674so4474176d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 03:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786442730; cv=none;
        d=google.com; s=arc-20260327;
        b=UrAvAS/4CrAacJRjFuCP9HWTmrBH0MZVV5qAuLiuRZtpOxD2pqOrBYLIz2HQ4oJg2d
         YtZdNo2azrPm9GogmNxrkNgFdkx04Jmf1ll2htHt+jbTHXGuCpcjQoGwJy9yiJhImtWD
         j0NCs+6hs/5DTcOvvaS2BoiPNVybFMtL7YlaRTi+mKxVczt8Rr3MiXj9KXNG3G+LxPsu
         2RHNvtVB5YEWX9t308Gb2LvzimT7gbHTNANpdomJLWVu/hbu/a90zqECAdhiB62fF4bF
         SY/RvRaTiSftsMFrcGF927aIqxoLrGuVM9NtC2jdDFiO9lkkJv1h1ZDdTKbvz7/LGPYV
         0Vww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=648ySjpJx7Sgme3Pk7ODk8Avh0hVLC4SHWCtmd6Z6LM=;
        fh=FChst+2kkpWHvV/QhJUyBy+F7C/G12cpuxFFuKW6qjg=;
        b=pRi1AVzJzZ1kaAxP4sqqN0J5ieUHPXt47C2vIJPbU5zM1pIOEZ7mhJ7aCrMEq4Q2VE
         6/xsplMA2GfjKsS1UPwrnkYhhq1jb1E5ZZbLImu+GlcBIY3blWHeasI/leMnfOEw60ni
         d5hqtm5WXquFsI5a4FsC3D25Gw7+9hYfbS3v5cvIMRyyZICzgYp1xYzKzu198oM69NLg
         dnwhR0czzNC685nZCUPzAO2sgP8giT3kYfMWidHQyRBokfuyJVviyOZNaCHK9JTkTknR
         nporqIWLKvWeZh9gHkc9kqQpzKQistxwIzc/mL4BiNK3qlbKmwrFQe0uor4yxA8EMbj3
         cebQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786442730; x=1787047530; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=648ySjpJx7Sgme3Pk7ODk8Avh0hVLC4SHWCtmd6Z6LM=;
        b=CHGhE9tqndJCsfu2P6OtduOFy9V9eIU38A2lZOZmc3YibS89CT/4/4VsVYFl5dfvZp
         wjPWfZYJNPjxN6/AGTM+p6HpokVL6/qTDVFGMbje/yKyJJW3jpA30GErXuE0qYxJpINv
         i7ZEHEV0JWYIhkNgcEy33UX193ihGOX0azAlG/HkrJTrvbNjLvXhrWU/+5OYtlwhZo4a
         YlBMydSbftSgG9PVsDr5+eGO4/17ApE03KN7dZlZGFkfAQiiiF0DGvyN3tmsXDxi4Kdt
         TX8E2LZmbGCRntNaqp01OFeGppJogbIkR5tAb/rngtXFTcxhI+ngos4BvOJJUYbIL4kc
         O0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786442730; x=1787047530;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=648ySjpJx7Sgme3Pk7ODk8Avh0hVLC4SHWCtmd6Z6LM=;
        b=Gc+cegJhRKIPWDucC4IaGFx9LJtzRbCTeAObNsOBhBJgHH55drQEb9rroGcAuu+xBH
         +xwXDSZebbUVXE1Gcj93Y6yDpRe6KH1rGaEUa4nBOQfCOvP1uH21SHdlW8RU8bQWFLfO
         jI3bNnBHlwtb3uT6AuUe2ucH1yI+GzbDz4aKrWt+xZmeMuI9O5o4dLCwuU5twT2WGAKz
         T5GQ1HtRm+Dx4LUeYgY91ubIhMM0jMVK4osGO0BqDUPh3VRF8KxOAjoD4gtXJn3Ii//6
         B1Pw8q5OE9BEeUqMDu9eraOzEcQMDk2q6+Q++Q0os4v7b9qe+aBgaiw49BK3mQKHLlr7
         TDDg==
X-Gm-Message-State: AOJu0YzCAv4djY3bBorUuXPK0d/J8MC/Z4sOEsZiIOx6AmMwMW/7bXGu
	kf/55jxeXk+/FGDsVMJ0oysw5ffC444RJVQY0hr226zA7XNGMLW2AE7TsfwEJeyq41pXrp7zzuc
	2VZ4EENlglMl04CS62EwnIK3aOJ0VWNI=
X-Gm-Gg: AR+sD12YKCh85ENJPePhy2nMabebkEYNNKlVJ+EoHNrBJ+YUBvFIn2WcXU38I4Prxen
	XbWmSbCHTRYXhhbh+NFz80WrBUSNCHFDwd8K2Guvx3L4JBIfmeHufGr4foTZJM8vcurs8HjBeKE
	XVs3HK9S0hTxTMDkETDJ0ElBUy3Nv4algl4pK+znA/PS9l/Z9PFJpjqm7lmUeepplj++KvB8w9a
	x0d2wuqibLV0xrmzZdcTyvYKslKRWg4sQoWLrLoD2z4pNprle8TlfnundaQsp9MInkhBkZojC1e
	I2MhQKyqEX7Su4mzgmqivfqMqifCnZHljJtm16e/XpTZxB5DnvFqoKqg1p0ELgz9wGcV5ndWplV
	dK40=
X-Received: by 2002:a05:6214:5245:b0:907:5516:3d61 with SMTP id
 6a1803df08f44-90a6691b406mr16424326d6.21.1786442730035; Tue, 11 Aug 2026
 03:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260811091843.3420858-1-daniel.turull@ericsson.com> <20260811091843.3420858-2-daniel.turull@ericsson.com>
In-Reply-To: <20260811091843.3420858-2-daniel.turull@ericsson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Aug 2026 12:05:19 +0200
X-Gm-Features: AUfX_mzFKh8L-fFum3ylBQEIWjLNUEYl-6Ame__K6HRazDUp7UrvW5GQmtWUjoo
Message-ID: <CANNYZj90jvkMf40urEk6W1+70MAzTT=jT=0vwdP03Y6Qci5Y3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] lttng-ust: inherit upstream-stable-release-point
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, paul@pbarker.dev, 
	Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 10:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243181

This probably needs to be updated in lockstep with other lttng*
recipes (modules, tools), and so they all must fit the criteria, or
you need to find out if one can be updated without the others.

Alex

On Tue, 11 Aug 2026 at 11:19, <daniel.turull@ericsson.com> wrote:
>
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> lttng-ust maintains a branch per minor series (stable-2.13 through
> stable-2.16) and releases from several at once: 2.14.2 and 2.15.1 went out
> the same day in May 2026, and three series together in February, 2.13.10,
> 2.14.1 and 2.15.0. So upgrades within a major.minor are stable point
> upgrades per the OE-Core stable release policy (ref-manual, "Stable Point
> Release Upgrades"). There is no written policy document, so qualification
> rests on that branch structure and the release contents below.
>
>   https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
>   https://github.com/lttng/lttng-ust/tree/stable-2.15
>
> Upstream keeps a ChangeLog with a per-release entry list, and every entry
> for the one point release in the current series is labelled a fix. 2.15.1
> (May 22 2026) covers a negative error code on incorrect message size, a
> shmp() return value checked before dereference, an underflow warning in
> zero_file, uninitialised LTTNG_UST_LFILE and sigevent structs, close_range
> inefficiency and excessive fd-tracker memory use, and a NULL check in
> ustctl. The one non-fix entry changes a likely to unlikely branch hint.
>
> Only one point release exists in the 2.15 series so far, so this also
> rests on the 2.13 series' record, which ran to ten.
>
> Already tracked this way on the OE stable branches, counting only bumps
> since each branch forked: kirkstone took 2.13.5 -> 2.13.6 and scarthgap
> 2.13.7 -> 2.13.8 -> 2.13.10. wrynose has taken none and sits at 2.14.0.
>
> AI-Generated: Kiro with Claude Opus 5
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
> index 9f1d0961a1..5d2ce3d0b4 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb
> @@ -11,7 +11,9 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
>                   PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
>  "
>
> -inherit autotools lib_package manpages python3native pkgconfig
> +# lttng-ust publishes bugfix/security-only releases on its per-minor
> +# stable-X.Y branches, the same upstream and release model as lttng-tools.
> +inherit autotools lib_package manpages python3native pkgconfig upstream-stable-release-point
>
>  include lttng-platforms.inc
>

