Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE614C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:23:18 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12761.1788355389230032517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FA+ddqZm;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90cd4631090so11692996d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355388; x=1788960188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIynLHqxJMF9PiCqxCOZuPeNyW6bqIBmHuPUAfIXBl8=;
        b=FA+ddqZmo4uVgB+P483u5eVOrUsw6XPc83w/Lbbby+DO98BZWUYWp1KiiNkbwXFeVF
         wTo17cfj2z80qv4BOcxBixGDTZljxYw6jX9pVp/rcS7HBIiPXyF0/NsmTmDeN6QenxlF
         hUA9oYT7ojFJiF30WSDKm+e7jwcHCir/y7Ijmdww5Hwal4dbVnGVjzWhlRbkF2HONhGP
         bsz4qoBnmybN+atq1BbjO28GslfDABkPepek+kwyVxuxU8O1KBYREuTPeK1dpBq7ThSV
         3joHXvNssQQCcF3sC3GiaLQiPeg2wAuKhWyLdVjB2PZ7EWApc/L1RExfWaPpulh7PfFU
         i6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355388; x=1788960188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIynLHqxJMF9PiCqxCOZuPeNyW6bqIBmHuPUAfIXBl8=;
        b=Ng82wguZoYXX7SZ/WD5g9KBTAmMSNl1OakObGEiX/gSYiuYPBKwZc+GwZkPfuDpkrk
         yezI9ha5AtZsd1e6PdSENQF1D2kFyitn0VApMyDslxwyHVRyvkJp6nXbYDtrRGFeFJwy
         62S+DZEMpTsdS0y9lx9Lscmyjj0tgK/3xCiaMxz2f4kkU6LcUsYUUnOfH+XJ5lXORuMq
         QeaqyEzFfhUEbNnLqb/57vEtKcMXHYnFnCWltTJBHrFyJTZTvN5iCw6MF1C9dD/b2GFl
         dDlcSVC2GoFF+JWWt0wSIXCmm6umqlGNBR4/GsHghIyNbGMQgomYYdRkK3sXPiZiZmuJ
         DfTw==
X-Gm-Message-State: AFuF++lfxPk3qd8/tAHpS8377GtJ4S1tLDP0pSIH4VzgVcxJqX9UjA+2
	uyr3CIZ3baZxiC8KL9cyA4PWcAxavhoudelp25xJRxMN8OnMWQW+FkOc
X-Gm-Gg: AR+sD11Q7BbS8Jf/N7wYeEj7g6/mVgpQdXKA1/T+0Kis9QoBlNYmXrG5heWyDWKjhds
	piTEkYLQNIxqWpPLb9RGBwqbHjyWVQ7rc7WHEfL7EiTJk007O2YIRtgz4xfWnmf2zi5g3rS2dPW
	O0AtYqsmSEE81+s2tvMSv86+f29Gj1xqqPQ3Q0fFcxtynBGYS/TlsR5HnXNQKOHECT1/n/ByGwk
	OWqdwCQSoK8N2M3G2UJz+WCJ3vx5fIts6nAOYdSNUKRIYzDS2VWE5Rt7bSwbOBBYP4zjWugbxv+
	3w77LpJZTjvWAn7mXzi+yk7ffKz216cOz1qIkSgd3+LB8a0mKC4z1uGWYj4bUMsVn972yaMyjXh
	nSks9NI3AqHYn2zcXNQmADbhliDqvlh59Rz/uOuP86JCE/4i/Q5Z3kw2Qn0smwE/yqbAXRmx5vZ
	evw1gbRXxxwTA2z7GlzysBzvgjUjC/hi9sT04WkbaB6oCjSneXokDdbcxuld9tomrOdD3OH52gG
	dovnZ7r7RBseJFKxcl4D0nKVrp5OxzRX/slO2UcRDVWHWTlOmhFOdd85BIfWjCYaVzWEttXwbuZ
	bcP/qAn8L2v8b7LKSgS03yCji4j0z/WdkvtG2M1197/RdedLgK/GOjm1Y7A9zXLDn/sxPOQSzLu
	G6lmg
X-Received: by 2002:a05:6214:3f86:b0:90c:6948:9191 with SMTP id 6a1803df08f44-9102ea5a164mr37054876d6.12.1788355387618;
        Wed, 02 Sep 2026 06:23:07 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee43763sm18059076d6.22.2026.09.02.06.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:23:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7 v2] linux-yocto: consolidated pull request
Date: Wed,  2 Sep 2026 09:22:57 -0400
Message-ID: <20260902132305.3685228-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244948

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here's the next set of linux-yocto patches.

I've addressed the reported issues with the 7.2 series:

  - configuration warnings
  - fixed devsrc for 32 bit x86 kernels
  - fixed the rust QA warning

I've also bumped to 7.2.2, and included a 6.18 bump in this series.

A note about the rust QA fix (it is covered in the commit itself)
... but I'll summarize it here:

Between the 6.18 and 7.2 kernel this commit: dda135077ecc9 ("rust:
build: remap path to avoid absolute path") was done, and it restricts
rustc path remapping to macro scope. That leaves build paths in the
DWARF debug info of rust objects.

In our builds that is what triggerse buildpaths QA check on kernel-dbg
(samples/rust/*.ko and vmlinux)

The gotcha is that the kenrel Makefile is structured in such a way
that I can't fix it from the recipe or bbclasses, I did a kernel patch
for linux-yocto, and will send it upstream once I'm convinced it is the
right thing (and have checked that no one else is hitting this yet).

The linux-yocto patch widens the scope to 'all' so rust debug info is
remapped like C, restoring the pre-7.x.

Cheers,

Bruce

openembedded-core (6):
  linux-yocto/7.2: introduce reference kernel recipes
  linux-yocto/7.2: BSPs: fix configuration warnings
  linux-yocto/7.2: update to v7.2.2
  linux-yocto/7.2: remap rust debug info paths
  kernel-devsrc: ship tools/include for archscripts host tools
  linux-yocto/6.18: update to v6.18.48

meta-yocto (1):
  linux-yocto/6.18: update to v6.18.48

 openembedded-core:
 meta/recipes-kernel/linux/kernel-devsrc.bb         |  7 +++++--
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_7.2.bb    | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_7.2.bb  | 34 ++++++++++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 24 ++++++++++++------------
 meta/recipes-kernel/linux/linux-yocto_7.2.bb       | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 184 insertions(+), 20 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

