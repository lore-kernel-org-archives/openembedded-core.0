Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BD3E7DEF1
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 14:44:39 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54233.1770043477077263560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 06:44:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hh/d7e/P;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c711959442so479050585a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 06:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770043475; x=1770648275; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=siSdLt6QbPk0Ta860yVoGYP9k07NE7oWHldZdXv2zZA=;
        b=hh/d7e/Pj4s+AU+dObso7MLuAHeth7r+6tWZr4Hv9wAFm5zZ/49YbccbH/Kv0vML0l
         Gu793KjQTLXUWecNpIH6NViynyr8fABeD4XzoQuqOboZzgSJyH8z6WNV0bkF+BeTOe4T
         l9TC8DJC89Wu//IMKJtd1EmDFEYKqrgnvBZIQP5pDvuHYDNfCXGmnDU1y/jHitqnfCLb
         HjEli+sSp5ofOIl94pBjxkfSru2AzFBGi2b9Z4CnLgFW5bvgRkz3L01ymZ6scMCca3kt
         D18Ug8OOj4NXTkcSPLZoIfzdyyNHPe+l3zc2DHb73IUQw1qDXJPVtETdLC4MlNTOfbR9
         T9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043475; x=1770648275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=siSdLt6QbPk0Ta860yVoGYP9k07NE7oWHldZdXv2zZA=;
        b=dHTIEQMqduS685ktyh/HHk5q12AA3tkYMcM6TcjFun+tk3i8cy63ZboRUvJfL9Dn+V
         rB4tgnY04gzF4ODJqhQxR6XanrTxHIkGNgle0QUHdjVr50VpPANFnvosHzouEFFKDoTD
         e3eUWwavwbhoK2L6iRNKIJGltvAAw9LG0T4bEqGMVhvsp+6oLBt0xYF1aANC3swB337A
         alzgU+spe2fI+LmNWlVQeqZc3o26qgpkKKQmerKk0kv5PLSvlygItQwseJO8zF4TU+HB
         /rPTpjkidWN2kLKNL/HSEwYQYf5iqlDhFCJ9+9dla/s1TQjwKOOtvpFD5kzZ39/VWbeH
         k53Q==
X-Gm-Message-State: AOJu0YwdcpogDk2/hNTalCzH1s+8uavTsnbVJaZr/lA5gFJK2huMnPQx
	zuPTsRxOQUeS2Gor4S4ifhBdT4RN68FfAZt927fEHdmi2WFBO8ZoAQTiIodsqg==
X-Gm-Gg: AZuq6aI6qyjvbDc6zgpt0iOelORL+1HZk0I8Fe6mSXSovYLL0y9+FPHFrThoqIDcfO1
	5gyYy14P9Y4o2Vm/l1eYiV6EAffOnsgsLJPelfwfXd1KSblgix/H+jGWxUZYp9SzEMLBZFnP0+I
	ezOaaxUG+1ybcvQdhEeNweILqDvI8WuaWONMGOdPjbzCfkYjbSO8WErT5LqBCQvobQ/+IkKau1y
	00ka0MHuuwDPNsSGBYgssGoto4OlcdyRdPjhJDH7nEbH7sPAb/yd9RX39Z2N8/v8Fn1HtzWCNCV
	GtaNa1LybiaCb0wkHosmkNzNnOj9FaF12BIgkQR1MhmCNZc3GynHjC6Ti9Dib4FGG37qYZdHUwj
	fj9ki9AYi9rdw4LWm5EhwKrHDhvl5NraiREztXeZCihmHaIndyVnUKIKQ19T4YdSLEg2JxW6ks3
	BnUMxGyvPXDTm8n/nnClxXChhZiEEEyIvEoDlmEygh9d68nZ3ypegTsg==
X-Received: by 2002:a05:620a:1729:b0:8c5:2de4:d6ee with SMTP id af79cd13be357-8c9ebdf1abemr1261303185a.33.1770043475255;
        Mon, 02 Feb 2026 06:44:35 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711b95e4esm1344037085a.15.2026.02.02.06.44.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 06:44:34 -0800 (PST)
Date: Mon, 2 Feb 2026 09:44:32 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC][PATCH 1/9] remove wic
Message-ID: <aYC4UFMriap9O_zh@localhost.localdomain>
References: <20260202135414.682558-1-twoerner@gmail.com>
 <189072D7050C78DA.4987@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <189072D7050C78DA.4987@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 14:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230372

On Mon 2026-02-02 @ 09:01:56 AM, Trevor Woerner via lists.openembedded.org wrote:
> On Mon 2026-02-02 @ 08:54:06 AM, Trevor Woerner wrote:
> > The wic utility will continue to fall under The Yocto Project umbrella,
> > but will no longer be integrated into the project as part of oe-core.
> > The ultimate goal is to make wic a completely independent tool, hosted
> > on PyPI, with its own tests, development roadmap, and releases.
> > 
> > Some benefits include:
> > - relieving the oe-core maintainers from having to review, understand,
> >    merge, or reject wic patches
> > - allow the tool to be used outside of The Yocto Project for generating
> >   Linux images
> > - provide more flexibility to explore other features, libraries,
> >   mechanisms, etc
> > 
> > AI-Generated: AI was used to help with the initial split of wic from oe-core
> > AI-Tool: codex
> > AI-Model: gpt-5.1-codex-max
> > 
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  scripts/lib/wic/__init__.py                   |   10 -
> >  scripts/lib/wic/canned-wks/common.wks.inc     |    3 -
> >  .../directdisk-bootloader-config.cfg          |   27 -
> >  .../directdisk-bootloader-config.wks          |    8 -
> >  scripts/lib/wic/canned-wks/directdisk-gpt.wks |   10 -
> >  .../canned-wks/directdisk-multi-rootfs.wks    |   23 -
> >  scripts/lib/wic/canned-wks/directdisk.wks     |    8 -
> >  .../lib/wic/canned-wks/efi-bootdisk.wks.in    |    3 -
> >  .../wic/canned-wks/efi-uki-bootdisk.wks.in    |    3 -
> >  scripts/lib/wic/canned-wks/mkefidisk.wks      |   11 -
> >  scripts/lib/wic/canned-wks/mkhybridiso.wks    |    7 -
> >  scripts/lib/wic/canned-wks/qemuloongarch.wks  |    3 -
> >  scripts/lib/wic/canned-wks/qemuriscv.wks      |    3 -
> >  .../lib/wic/canned-wks/qemux86-directdisk.wks |    8 -
> >  .../lib/wic/canned-wks/sdimage-bootpart.wks   |    6 -
> >  .../lib/wic/canned-wks/systemd-bootdisk.wks   |   11 -
> >  scripts/lib/wic/engine.py                     |  681 ----------
> >  scripts/lib/wic/filemap.py                    |  583 --------
> >  scripts/lib/wic/help.py                       | 1188 -----------------
> >  scripts/lib/wic/ksparser.py                   |  322 -----
> >  scripts/lib/wic/misc.py                       |  266 ----
> >  scripts/lib/wic/partition.py                  |  562 --------
> >  scripts/lib/wic/pluginbase.py                 |  144 --
> >  scripts/lib/wic/plugins/imager/direct.py      |  710 ----------
> >  .../wic/plugins/source/bootimg_biosplusefi.py |  213 ---
> >  scripts/lib/wic/plugins/source/bootimg_efi.py |  435 ------
> >  .../wic/plugins/source/bootimg_partition.py   |  162 ---
> >  .../lib/wic/plugins/source/bootimg_pcbios.py  |  483 -------
> >  scripts/lib/wic/plugins/source/empty.py       |   89 --
> >  .../lib/wic/plugins/source/extra_partition.py |  134 --
> >  .../wic/plugins/source/isoimage_isohybrid.py  |  463 -------
> >  scripts/lib/wic/plugins/source/rawcopy.py     |  115 --
> >  scripts/lib/wic/plugins/source/rootfs.py      |  236 ----
> >  scripts/wic                                   |  600 ---------
> >  34 files changed, 7530 deletions(-)
> >  delete mode 100644 scripts/lib/wic/__init__.py
> >  delete mode 100644 scripts/lib/wic/canned-wks/common.wks.inc
> >  delete mode 100644 scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
> >  delete mode 100644 scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks
> >  delete mode 100644 scripts/lib/wic/canned-wks/directdisk-gpt.wks
> >  delete mode 100644 scripts/lib/wic/canned-wks/directdisk-multi-rootfs.wks
> >  delete mode 100644 scripts/lib/wic/canned-wks/directdisk.wks
> >  delete mode 100644 scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
> >  delete mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
> >  delete mode 100644 scripts/lib/wic/canned-wks/mkefidisk.wks
> >  delete mode 100644 scripts/lib/wic/canned-wks/mkhybridiso.wks
> >  delete mode 100644 scripts/lib/wic/canned-wks/qemuloongarch.wks
> >  delete mode 100644 scripts/lib/wic/canned-wks/qemuriscv.wks
> >  delete mode 100644 scripts/lib/wic/canned-wks/qemux86-directdisk.wks
> >  delete mode 100644 scripts/lib/wic/canned-wks/sdimage-bootpart.wks
> >  delete mode 100644 scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> >  delete mode 100644 scripts/lib/wic/engine.py
> >  delete mode 100644 scripts/lib/wic/filemap.py
> >  delete mode 100644 scripts/lib/wic/help.py
> >  delete mode 100644 scripts/lib/wic/ksparser.py
> >  delete mode 100644 scripts/lib/wic/misc.py
> >  delete mode 100644 scripts/lib/wic/partition.py
> >  delete mode 100644 scripts/lib/wic/pluginbase.py
> >  delete mode 100644 scripts/lib/wic/plugins/imager/direct.py
> >  delete mode 100644 scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
> >  delete mode 100644 scripts/lib/wic/plugins/source/bootimg_efi.py
> >  delete mode 100644 scripts/lib/wic/plugins/source/bootimg_partition.py
> >  delete mode 100644 scripts/lib/wic/plugins/source/bootimg_pcbios.py
> >  delete mode 100644 scripts/lib/wic/plugins/source/empty.py
> >  delete mode 100644 scripts/lib/wic/plugins/source/extra_partition.py
> >  delete mode 100644 scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> >  delete mode 100644 scripts/lib/wic/plugins/source/rawcopy.py
> >  delete mode 100644 scripts/lib/wic/plugins/source/rootfs.py
> >  delete mode 100755 scripts/wic
> 
> This set of patches is being sent to the mailing list to give others an
> idea of the work being done to split wic out into its own independent
> project. It is an RFC patch set.
> 
> If the day comes when they might be applied, they will need to be
> squashed. Otherwise any future bisection that lands in the middle of
> these patches will likely cause build failures. This RFC patch set was
> created to make review easier. Each patch is quite small and does one
> thing.

On my machine, for an unmodified oe-core. when I run the wic-related
oe-selftests I see:

	successes=93, skipped=1, failures=0, errors=1

with these changes, this is what I get on my machine:

	successes=91, skipped=1, failures=2, errors=0

to run:
	$ sudo .../openembedded-core/scripts/runqemu-gen-tapdevs <your numeric gid> 4
	$ oe-selftest -v -r wic.CLITests wic.ModifyTests wic.Wic wic.Wic2

There are still 2 test cases that are eluding me, but I wanted to get
this patchset out there in case anyone was interested in looking at it,
and to see how it will do on the AB (knowing that there is a little more
to do).

