Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9D7E7DEEB
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 14:02:08 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52767.1770040921159986678
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 06:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nTicKpJ8;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c6a822068eso642351585a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 06:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770040920; x=1770645720; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GCg/ADb0DFeVqycawQm1PqdbZR7g3ozIUzGa6tUi1k=;
        b=nTicKpJ8qrzkrt9Hij4G8pAmNCP5eYiV2HTDUodETfWznAITqALtuRDkzxcf+DhPK4
         WYY9jtKov0iowga1bNJxCk/i/OWMJCEosXJEdHXKUegpAojlcDD4tl+ypytPdmfPQ7MR
         Px0MvWs50judFhUfhcnuXG5HaDJi4B7tLRBgG0yAZqiK1bSOzdY1m3dkHpKCpqgjtZTH
         xcvXmN6QTAEEDcUbg2GjMKZxkjAts6583TXCeuLAKyI28amat3Q4E/MJE5XeCuXVkF/J
         rQGKVKEPw8aNSOMeLJSNpSsneZ88GdrVkPzLMvwLa0FXQnzvKyRl1CI+poeynxsWQjvZ
         12nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040920; x=1770645720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9GCg/ADb0DFeVqycawQm1PqdbZR7g3ozIUzGa6tUi1k=;
        b=F+zVDC56zJ1laxFZ3osi2yC+Zche4YxFTTmOnCVuF1VKG+KDdQlac00IlbSgJmDd+l
         z3B4TvxChy4K0QzLtJYQ7sUVlTVVkcagMGIoCn7XTwl26L1qr8nlE9jolbG4eib+ukds
         /+2cddx6Ccp1Seg+SqIsSB57Ph7OGOuiR2/rbzYaEOojrvaGhytXT6WgmCusKdxFLHsn
         x5pMobPznMcnQZXT8Yqrm4szYvLI0/eTZ694pK5Gf7ZDOpUi2jN+bioqHcRlHgorJI1j
         aRsj619Slee4bKpB80odi1H4/KnGd3IObwfwrcBwQH8KkdiCj1h3YuOWf+izO0EihCu+
         4afg==
X-Gm-Message-State: AOJu0YwkVIEQkL+4GF3n4mjIMnSRk00UZdgtiGV3Sv9Rj+fibUBp5f8N
	KQ4m87wvgt9NbMDN2kHpAjsW5saB0C6H0LqEuwPVgjSO4d80kGUnRYxO8pNEcg==
X-Gm-Gg: AZuq6aK46xmluUyXm+yYMPho5hRQuyZ2T0gcBtNM7/gya3Xxdws9zES12ozaZN8cOgH
	6+96qCvvRx8cT8H7u3+pWlm8RtlrMKAvqK4YuGFcURiMfr2w+SSaVp3W+WAy11nDVDsmGkQCOCK
	o++tUvHoo/AxiwuS4R8nMb1IPmQC7fznndUiMOKDCwsg0PKi1eFl4XJStCMCm6RT80vdaY4s3ih
	kDk9OMcu7HqV36+z9dlQmk28etbBA6mo4q2FUDiAxClw8yeUwe0A5Awcw4dN6rTBkWAlCFNf/pz
	XRG5h1SghCczKbo1t9mQS6p7t3J7hLZtksZXNyMC3Cu63wqc08r/laEGc6RVhXTT7+m2IGRBT8N
	W2iKVGC+ETI7Nf2d3Aq7cpcg1SJkDqiQEe/0YrieLClu0clsfiQXk9ppajRW+4zFdZ0Wk39Ov/P
	2yxCQxMoLoCx+OfLVap94IMwbSZaTx+c9OHHtodDjRN5x9gR1/X9JMqA==
X-Received: by 2002:a05:620a:29cc:b0:8c7:c54:4f4d with SMTP id af79cd13be357-8c9eb266be7mr1572307385a.39.1770040918938;
        Mon, 02 Feb 2026 06:01:58 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711b7ba1esm1244854385a.5.2026.02.02.06.01.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 06:01:58 -0800 (PST)
Date: Mon, 2 Feb 2026 09:01:56 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 1/9] remove wic
Message-ID: <aYCuVCk0jkl9vwRN@localhost.localdomain>
References: <20260202135414.682558-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260202135414.682558-1-twoerner@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 14:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230370

On Mon 2026-02-02 @ 08:54:06 AM, Trevor Woerner wrote:
> The wic utility will continue to fall under The Yocto Project umbrella,
> but will no longer be integrated into the project as part of oe-core.
> The ultimate goal is to make wic a completely independent tool, hosted
> on PyPI, with its own tests, development roadmap, and releases.
> 
> Some benefits include:
> - relieving the oe-core maintainers from having to review, understand,
>    merge, or reject wic patches
> - allow the tool to be used outside of The Yocto Project for generating
>   Linux images
> - provide more flexibility to explore other features, libraries,
>   mechanisms, etc
> 
> AI-Generated: AI was used to help with the initial split of wic from oe-core
> AI-Tool: codex
> AI-Model: gpt-5.1-codex-max
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  scripts/lib/wic/__init__.py                   |   10 -
>  scripts/lib/wic/canned-wks/common.wks.inc     |    3 -
>  .../directdisk-bootloader-config.cfg          |   27 -
>  .../directdisk-bootloader-config.wks          |    8 -
>  scripts/lib/wic/canned-wks/directdisk-gpt.wks |   10 -
>  .../canned-wks/directdisk-multi-rootfs.wks    |   23 -
>  scripts/lib/wic/canned-wks/directdisk.wks     |    8 -
>  .../lib/wic/canned-wks/efi-bootdisk.wks.in    |    3 -
>  .../wic/canned-wks/efi-uki-bootdisk.wks.in    |    3 -
>  scripts/lib/wic/canned-wks/mkefidisk.wks      |   11 -
>  scripts/lib/wic/canned-wks/mkhybridiso.wks    |    7 -
>  scripts/lib/wic/canned-wks/qemuloongarch.wks  |    3 -
>  scripts/lib/wic/canned-wks/qemuriscv.wks      |    3 -
>  .../lib/wic/canned-wks/qemux86-directdisk.wks |    8 -
>  .../lib/wic/canned-wks/sdimage-bootpart.wks   |    6 -
>  .../lib/wic/canned-wks/systemd-bootdisk.wks   |   11 -
>  scripts/lib/wic/engine.py                     |  681 ----------
>  scripts/lib/wic/filemap.py                    |  583 --------
>  scripts/lib/wic/help.py                       | 1188 -----------------
>  scripts/lib/wic/ksparser.py                   |  322 -----
>  scripts/lib/wic/misc.py                       |  266 ----
>  scripts/lib/wic/partition.py                  |  562 --------
>  scripts/lib/wic/pluginbase.py                 |  144 --
>  scripts/lib/wic/plugins/imager/direct.py      |  710 ----------
>  .../wic/plugins/source/bootimg_biosplusefi.py |  213 ---
>  scripts/lib/wic/plugins/source/bootimg_efi.py |  435 ------
>  .../wic/plugins/source/bootimg_partition.py   |  162 ---
>  .../lib/wic/plugins/source/bootimg_pcbios.py  |  483 -------
>  scripts/lib/wic/plugins/source/empty.py       |   89 --
>  .../lib/wic/plugins/source/extra_partition.py |  134 --
>  .../wic/plugins/source/isoimage_isohybrid.py  |  463 -------
>  scripts/lib/wic/plugins/source/rawcopy.py     |  115 --
>  scripts/lib/wic/plugins/source/rootfs.py      |  236 ----
>  scripts/wic                                   |  600 ---------
>  34 files changed, 7530 deletions(-)
>  delete mode 100644 scripts/lib/wic/__init__.py
>  delete mode 100644 scripts/lib/wic/canned-wks/common.wks.inc
>  delete mode 100644 scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
>  delete mode 100644 scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks
>  delete mode 100644 scripts/lib/wic/canned-wks/directdisk-gpt.wks
>  delete mode 100644 scripts/lib/wic/canned-wks/directdisk-multi-rootfs.wks
>  delete mode 100644 scripts/lib/wic/canned-wks/directdisk.wks
>  delete mode 100644 scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
>  delete mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
>  delete mode 100644 scripts/lib/wic/canned-wks/mkefidisk.wks
>  delete mode 100644 scripts/lib/wic/canned-wks/mkhybridiso.wks
>  delete mode 100644 scripts/lib/wic/canned-wks/qemuloongarch.wks
>  delete mode 100644 scripts/lib/wic/canned-wks/qemuriscv.wks
>  delete mode 100644 scripts/lib/wic/canned-wks/qemux86-directdisk.wks
>  delete mode 100644 scripts/lib/wic/canned-wks/sdimage-bootpart.wks
>  delete mode 100644 scripts/lib/wic/canned-wks/systemd-bootdisk.wks
>  delete mode 100644 scripts/lib/wic/engine.py
>  delete mode 100644 scripts/lib/wic/filemap.py
>  delete mode 100644 scripts/lib/wic/help.py
>  delete mode 100644 scripts/lib/wic/ksparser.py
>  delete mode 100644 scripts/lib/wic/misc.py
>  delete mode 100644 scripts/lib/wic/partition.py
>  delete mode 100644 scripts/lib/wic/pluginbase.py
>  delete mode 100644 scripts/lib/wic/plugins/imager/direct.py
>  delete mode 100644 scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
>  delete mode 100644 scripts/lib/wic/plugins/source/bootimg_efi.py
>  delete mode 100644 scripts/lib/wic/plugins/source/bootimg_partition.py
>  delete mode 100644 scripts/lib/wic/plugins/source/bootimg_pcbios.py
>  delete mode 100644 scripts/lib/wic/plugins/source/empty.py
>  delete mode 100644 scripts/lib/wic/plugins/source/extra_partition.py
>  delete mode 100644 scripts/lib/wic/plugins/source/isoimage_isohybrid.py
>  delete mode 100644 scripts/lib/wic/plugins/source/rawcopy.py
>  delete mode 100644 scripts/lib/wic/plugins/source/rootfs.py
>  delete mode 100755 scripts/wic

This set of patches is being sent to the mailing list to give others an
idea of the work being done to split wic out into its own independent
project. It is an RFC patch set.

If the day comes when they might be applied, they will need to be
squashed. Otherwise any future bisection that lands in the middle of
these patches will likely cause build failures. This RFC patch set was
created to make review easier. Each patch is quite small and does one
thing.

