Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D64C433EF
	for <webhook@archiver.kernel.org>; Sat,  9 Jul 2022 13:53:37 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.6588.1657374810584752934
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 06:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ce/btIfL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id fz10so1301236pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0nIuCgBThlaF7jP3J44t9E9duPzk9VC/2w/6mYwlkcA=;
        b=ce/btIfLmC7hjKgDkrAH4q1aQHYf7/CKlcSvC88BdaJmYWDB8e3h9zLGgMggO5FZFR
         UTk6lY/pWPC2xZLhkf+8chCMjoiHSDv9c1B72ikvoVgTt3kF2Nj3a2dHTAe0igTAFpIb
         2W6YKyO8yn3iXZGfF0kfKIZy078ZEoneyDPUouOn+yVzhfLlraCkCPZrzvhUY1K2TgOc
         F1rcnKA682a+2+vDCJl+ptRr+M+dsw1PFlDwy4Kh9zx3VAKv5zJ3QPEynXxBs1aw9w9O
         cWvC8I4e9QBOh/7Wd56yow6zFpcllgzkGSAg/uP0NctQXA/z7M9Fl8b2yo6304nya2De
         +EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0nIuCgBThlaF7jP3J44t9E9duPzk9VC/2w/6mYwlkcA=;
        b=OXxDey7Y1U73oF0yCfqY0OLDL5K/Ho6f+BR7BlW5d8wheP9681x5whmiQkiqbXtqpg
         xqYgTWMavx10w6c9AZZ+w3ic4rcKROSrXUzaUBzU0CI4HRe9PQBqJ6DK61Da5LAzwxoG
         OyJrbPTtUpmtjhF4y+N81j95PUq12x2b7ElJWQYgbrw6PYS+ZASEOQzGdHNQfeERhp1U
         uIph9zaE1ne7ByJ3jC6VPzNo0w42URWRUp/63Aps+dyTf4Ofp5vP6QAOSRQ/KgDB5atq
         +sz/LKxDQA1yo3flUD3e3C/J6EMkFRnaU/kMzwRrd4+LayGSvdGgGIW8RzPg9Q1obfEo
         xeOw==
X-Gm-Message-State: AJIora9Rxlhb73bIa9uWcDWWp4wyFVrCHzpEoNzJPV399PR3JAzwVXE4
	nlsPoo5hqrXDF/z+Ub+VRDHXNx0DdL7vU5aG
X-Google-Smtp-Source: 
 AGRyM1sHShuQmuYNDDEB4F8kVy77t7aQH4aCdcnXLLdcSgHPumpUyUXSNCxe4gk77lsYvF/dcPP6Fg==
X-Received: by 2002:a17:90a:a605:b0:1ea:6b4f:915e with SMTP id
 c5-20020a17090aa60500b001ea6b4f915emr6176462pjq.60.1657374809157;
        Sat, 09 Jul 2022 06:53:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w12-20020a170902e88c00b0016bdc520f8bsm1334078plg.299.2022.07.09.06.53.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 06:53:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][kirkstone] qemu: add PACKAGECONFIG for capstone
Date: Sat,  9 Jul 2022 03:53:10 -1000
Message-Id: <20220709135310.3067088-1-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Jul 2022 13:53:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167839

Autobuilder workers were non-deterministically enabling capstone
depending on whether the worker had libcapstone installed.

Add PACKAGECONFIG for capstone with default off, since qemu does not
require capstone support.

Qemu version in dunfell has capstone in the source tree as a submodule
and has configure options to enable it using that source code or using
the system libcapstone.

Qemu versions in master and kirkstone have removed the capstone
submodule and configure options, but added libcapstone autodetection to
meson.

In all cases using PACKAGECONFIG will allow a deterministic build.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e4ced6ac27..ef4e949805 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -185,6 +185,7 @@ PACKAGECONFIG[pmem] = "--enable-libpmem,--disable-libpmem,pmdk"
 PACKAGECONFIG[pulsedio] = "--enable-pa,--disable-pa,pulseaudio"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
 PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
+PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.25.1


