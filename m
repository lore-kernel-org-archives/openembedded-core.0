Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F426C27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:18 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.4242.1719778097125863669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CiMp37ul;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.171, mailfrom: steve@sakoman.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-37636c38d6aso10906905ab.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778096; x=1720382896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66LtoTbOOvvvQV9JluJv5lY7DJEYjDdLkfbx11X8oDA=;
        b=CiMp37uloACzaLpzTq2dd60fwVfsgIFKKL8UTSuus8FHo8gl2i4kFbPStXu9IvNEjb
         Rek0aB5Q5493fkHX3kFpSfVIJmgyTnjyNsyp+3b8vsG3XZP+Ofqt7f7UNUebdvZC5HJ0
         x0AmXeNI75PxDe55odGT7Haam62nzCDxDh/tcICKU8kY8VfrIRqwaTVmqgyHNhE26y7B
         e3uTIrs5o3mkf94gsmF/aTEDndkQyLHyvdAMK9uuMQ/jXTOzPWliqhjXhZKCoNyAWn0A
         hxEvwhnUKNMocYkLS5rGvX3ASxlBXqNe7kSP+/Q4QSA1M+lGCjFOtd5zwwTel1pnH8iB
         iepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778096; x=1720382896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66LtoTbOOvvvQV9JluJv5lY7DJEYjDdLkfbx11X8oDA=;
        b=q/gC4Yn7wYFyyg861OllG1KXfDt4oBPziSAz5wLEonM6O0tS8XkTb6eR96YRAdDmYI
         Y6BJfXACEXuJ5Iv2p75mo3ADa31Ae3nWdhv/ez8GILYSmpfvW45SGz6c8i3Wu2NonKAf
         M3m+0YecToOBgERERKHcVIjB1/9WWNeblS7DY8EAf8zGGb3AW6HdYkpKLEDIStCASWtR
         yxOqiBmmvgxy763X+R8eSH8BNuCmljYwC7DcqyWJ2sEtRqUv/z4vYTIdoZ3TMtG1pu01
         MMPm6aSecwCaQnc4pdAe6kU0HlTn+8zoephJde9zjleC2vcunEjDLUfHAzsSd7Nlm++q
         uexQ==
X-Gm-Message-State: AOJu0YyCksRqIGEyO1SsgK0r5O7HEqlKbGQs9a64hzL3XIgnC4cS35wf
	dPK92YHb/3Y+SuU7gmdjJRKC1jtTWoobNP8GGsCYe2rv9/pOKQ16EzD7osl01Pjv/aXLRpLRt77
	5NCY=
X-Google-Smtp-Source: AGHT+IE1TFMc/SHzHX2Xx+qdmTIPK0bAGWjDvG42QhcWnQJlp4xr4wz7lvo65jSVKl/CCsIOak7xzw==
X-Received: by 2002:a05:6e02:1d87:b0:374:64df:6805 with SMTP id e9e14a558f8ab-37cd2bed7acmr52868835ab.26.1719778094168;
        Sun, 30 Jun 2024 13:08:14 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/35] linux-yocto/6.6: nft: enable veth
Date: Sun, 30 Jun 2024 13:07:25 -0700
Message-Id: <519547708f1b8a9383c9a5c2a6ce129345884d9a.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201250

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Khem Raj
    Email: raj.khem@gmail.com
    Subject: nft_test.cfg: Enable CONFIG_VETH
    Date: Wed, 10 Apr 2024 16:11:47 -0700

    nftable ptests do create interfaces of veth type and this
    feature would be needed to enable those tests

    e.g. from tests/shell/testcases/packetpath/vlan_8021ad_tag

    ip link add veth0 netns $ns1 type veth peer name veth0 netns $ns2

    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 95caeaa193239784481cd9e69870b41431e1a974)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 5071550640..be60bbee78 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "9f39c8adfc6025293e5ff131f7bb4f728edd0c99"
-SRCREV_meta ?= "f057956f86fc59540ed6cf4cb1599050fd3121a8"
+SRCREV_meta ?= "00aab388b73211bf49b352e7475595aa2e5fbc44"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index a4af8c8a16..559ca3563a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_meta ?= "f057956f86fc59540ed6cf4cb1599050fd3121a8"
+SRCREV_meta ?= "00aab388b73211bf49b352e7475595aa2e5fbc44"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 583dade097..b0674348e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
 SRCREV_machine:qemux86-64 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
 SRCREV_machine:qemumips64 ?= "936a9ceb126dfb2cc4b38229cab68636263ecfab"
 SRCREV_machine ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_meta ?= "f057956f86fc59540ed6cf4cb1599050fd3121a8"
+SRCREV_meta ?= "00aab388b73211bf49b352e7475595aa2e5fbc44"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


