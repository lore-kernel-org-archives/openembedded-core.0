Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2030BEE6B52
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 20:27:41 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16.1770409656784395542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 12:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ndpHUZaK;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88ffcb14e11so35235496d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770409656; x=1771014456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBrE6zuAMcWTHbyUu7kW2p+kU5CeStklg9q8b6a/qJg=;
        b=ndpHUZaKYxabqn0w6mDVG6WrpDVDkMwPG/K+PPNOMFR1ZFKHiHTFuGCTrZB5cRmvUH
         rjhZjh85DDFL6I54gHRuA0C9ePVQXQiLn7dQMwMBj3YAPDf8pg4m5LgdHEBUGOqKJMA0
         8h/O458hJKfTdQr8Jb+KKpwh1WrpSIf+BTfFuGTD78T0JO/5oDlKweVnYOnWJbwOefQA
         nFWUKUuLKL4WBRzqrO3CObRLqlcgmYXlqlJBXmQvFcG8rJ5ArjbEIRYVnFdsSXvPqL06
         bvm7TSygljiVKgPW0LXrBvg6KBc1maxSL3PEulEyOJPDxekieNtSmtn95vNhXiQL7h8r
         GcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770409656; x=1771014456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBrE6zuAMcWTHbyUu7kW2p+kU5CeStklg9q8b6a/qJg=;
        b=frMFlVDN5MKudOg8T0Xx64rk4LcDNB36mdWkwbLZyQ0vQuc/jT+XOgBLigXpHZIWIX
         UFPQEG/s//UQPtUvnQWzlBdv6v5UZugjp7sF9mdbEC8kbkfH3pWHLFcmQ49wmW0rROMU
         09qnqS2lFmyLc38MuCLAyVo0qr6vOiQT5Mt21EEdasRuno8foYEux9adQzGmVZj1dFcg
         RhsC6Z4ROj2TGIJSsCuwUjZvX7ubAFHSk4m2O2+qp08iXiAAEM/Df0RCt32EFOJUVIA8
         TlygWU/PhAherOJNv+gbd3zdwiW8o1++P24TDCOqDCzwzLaCurenrGwKX1xrNhGFrP4v
         5fXg==
X-Gm-Message-State: AOJu0Yxg0HOzKyqnCyxdyp327MO7OtwOAfPAkZklLhfAJHHNhF8sinGs
	TDcfRqJbGycLZ14+rlC1EwxH85E0Tt99+3BrRScXcAJAU2i0mPqsn2xl
X-Gm-Gg: AZuq6aKnmB3FNBItf5dz1zooNYdfwbS9v63PXlpFFKhCXugL+emhJ6JMzgWCW9MG7hQ
	OJd590Hmzs/uS/mJ8UimW+/WytaLOBubG0S9JEpin/jo3sScDh7Jl329cR1+kkaWPSWHI/8Cxlk
	idVaOHhokgJpjL5TKB7uvmtGYOai/5sKbP4YBpnykW/3PHcJG+YP2QB4Ag3GYfp6sS0T3wXJFnL
	Yi7qmvmO4yYbFJJp7v9KYGNGrFY+T5YcQLul3hUbITp50HbSDRZlTKDm0BnIK/5uwg1CG9dtTNb
	Bq7IOOvHv28PyioQxfd/RtKjtgxOx4RiiDdTshkOJdUP+EXkJ1axEpjNd/rdJWXp++eettpX/jX
	OfJ+aiPoxF/eBJXglxu2J+3j43nqhcx0XlZJr8ivtkPIIDxqNsBoZZFrEXIze/1C6mikVmcDxT6
	vXGuJMAAU9QLtq2MutKMj9wBgpauTnxxD5Yqa2g/0sJrAylNVTobL0vNW9QlK3YrFTKwdseL6yQ
	PZG++8AwYPPTkDq4HhcmLvKuop1fcmcjooaJ0ilH6NEFI2uHFpMjCpbxA==
X-Received: by 2002:a05:622a:7:b0:501:4b10:aa9e with SMTP id d75a77b69052e-5063986a750mr54265591cf.13.1770409655606;
        Fri, 06 Feb 2026 12:27:35 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392bf955sm22651541cf.25.2026.02.06.12.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 12:27:35 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/13] kernel-yocto: 6.18 updates and 6.12/6.16 removal
Date: Fri,  6 Feb 2026 15:27:18 -0500
Message-ID: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 20:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230644

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here's my series for the two repositories combined into one.
I usually do end up missing some reference to the old kernels,
so I'm never completely sure that I've gotten them all.

But with this (and thanks to Kevin getting the beaglebone
working with 6.18/standard/base), we are down to just the
single reference kernel.

As usual, I'll continue updating any kernel that is active
upstream, and I'll send -stable updates to the appropriate
branches.

I also plan to make my scripts available for those that may
want to bump SRCREVs by themselves to continue consuming my
merges.

I'm out for the weekend, but will pick up any issues with
this on first thing Monday morning.

Bruce

openembedded-core (9):
  linux-yocto/6.12: update to v6.12.67
  linux-yocto/6.12: update CVE exclusions (6.12.67)
  linux-yocto/6.12: drop reference recipes
  linux-yocto/6.16: drop reference recipes
  linux-yocto/6.18: update to v6.18.7
  linux-yocto/6.18: update CVE exclusions (6.18.7)
  linux-yocto/6.18: beaglebone black: boot and graphics fixes
  linux-yocto/6.18: update to v6.18.8
  linux-yocto/6.18: update CVE exclusions (6.18.8)

meta-yocto (4):
  yocto-bsp: Bump the default kernel to v6.18 for
  meta-yocto-bsp: drop 6.12 bbappend
  meta-yocto-bsp: drop 6.16 bbappend
  yocto-bsp: linux-yocto/6.18: update to v6.18.8

 openembedded-core:
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc   | 20306 -------------------
 meta/recipes-kernel/linux/cve-exclusion_6.16.inc   | 17040 ----------------
 meta/recipes-kernel/linux/cve-exclusion_6.18.inc   |   354 +-
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   |    48 -
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   |    48 -
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |     6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb |    33 -
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb |    33 -
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |     6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      |    79 -
 meta/recipes-kernel/linux/linux-yocto_6.16.bb      |    79 -
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      |    24 +-
 12 files changed, 366 insertions(+), 37690 deletions(-)

 meta-yocto:
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf             |  2 +-
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.12.bbappend | 11 -----------
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend | 11 -----------
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend |  2 +-
 4 files changed, 2 insertions(+), 24 deletions(-)

-- 
2.43.0

