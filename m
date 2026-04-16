Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29979F8DFC0
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:09:06 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26351.1776373738099973871
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m54Ua/4r;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso85404195e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 14:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776373736; x=1776978536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uE7gm63U0tRw/hrlHVkBJrrL4/52DtJmLpC+do2DrBo=;
        b=m54Ua/4r9deWp/ULgv/E092NZXL8UtYgcfrUGUtNfZzPKRh9eUguCv7Bahn2f/CeEE
         Tgv4ObAV0ESB/eYoxM0weWOGPTfQiyFyhaXGHabGJU3wdX1JfwL9GxxQEIPFozrus3FH
         YkxQrNoUJsHzNNdeA/JZ5Q2sG0NXfMjzBP0E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373736; x=1776978536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uE7gm63U0tRw/hrlHVkBJrrL4/52DtJmLpC+do2DrBo=;
        b=LpztLTzyNvVE7OmzrQnIHTDzHxmeqxdW/Z3f+tTmswSstGcVgfFNQ8rgraL8gMX28C
         oRqfweZ8txzzSTmu+iG3wLKTFfZwm4ngWaderr8gPXbKsoiaQYUi28eeqUDQZLqUz9R5
         PvGG307JrZw/VUCWg3ehHYTV5LlrZD0Snr1z+cbLDE2E7PtLFW2zT4xFjjP/BhNbhp5K
         8BzWzwcmr9VGCpkDl/vHiw0S0uycJQ5w6IJz6Bp91DNzSUT314JTCBP/nKHRH/txYEgP
         8BktzLy6gW+rJSYNy71aKI1gYz3PQ9g7XHLFEpyl8BKvNR6uzZderd7D/TA+FwUewkkp
         lPvw==
X-Gm-Message-State: AOJu0YwMbY8Q7M8Jj1NyHdl0ZpDw2IhKYRmeiNzci2L++BxcmktZUYVO
	eBZfaX9i6Q7VirbsijPuzBk8nueig9ehARH3rLaxn5HgwvsSs6WrzwDLC6SdIrn0/uYfIik+G3S
	h5X0q5PL0oskS
X-Gm-Gg: AeBDiesB6N7l9+Ov5kD9UcFq+K9BvZzwyWFpfne0VeebbXx0cTGv76z80tLfaLmn6VX
	UoBPCuEiU9raY/W56NPbEOliqeQDHTXO89phHdfh6D+wUt8bqJXeR7BocknbzPYQ9mhFGqZFSj/
	9C6nCJlCHRyd9H4pLl2oQisAUo/IrX1B3hV0oVVA7PNbNoEAnm5Md1p4QOmaBdAfI4luBWS/v0N
	Xsx+hLRpoRd1AvwN9CIsDLTVMtxaRW2uYKQKkXBcV8/7q2718QP6njhSwKyHGDf/a8j+1q8iOZ1
	ybqYMK6SC8vxxiA9hrRa7Z+/LKVfNTSWqvv1mXIcIdRoywpIAh/emgiBIHEiPll58zO/bzNSAGA
	GR6NSNchIONPbrevau6o2uhlx74ySqgssjutcdws/L5IUKzJbWMyS3oANixZa/QRgNv8U195hpC
	zuCCg91Q9GLfCgrNwx0xxK3/WSgA9Ex95A8s9XDi9QE5+aINhJxatUtZdN7ne36JvSKY7/0L9Hz
	gAc2F6iQdn8n/Ll7AA2F2X1eW81vElCmgRPeQ==
X-Received: by 2002:a05:600c:3e05:b0:487:575:5e1 with SMTP id 5b1f17b1804b1-488fb78280bmr2559505e9.24.1776373736213;
        Thu, 16 Apr 2026 14:08:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7c2167sm944985e9.36.2026.04.16.14.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:08:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 6/8] oeqa/selftest/devtool-test-git-gitsm: Default to https git protocol for YP/OE repos
Date: Thu, 16 Apr 2026 23:03:59 +0200
Message-ID: <20260416210836.1336162-7-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416210836.1336162-1-yoann.congal@smile.fr>
References: <20260416210836.1336162-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 21:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235423

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Use ";protocol=https" for the parent git submodule and, also, update the
SRCREV to point to a commit where submodules are reference through a
https:// URL instead of a git:// one.

Update the expected output of the archiver test.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-test/devtool/devtool-test-git-gitsm_git.bb    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-git-gitsm_git.bb b/meta-selftest/recipes-test/devtool/devtool-test-git-gitsm_git.bb
index ad50c7f13c5..a362d9e15ee 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-git-gitsm_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-git-gitsm_git.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/git-submodule-test/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI = "git://git.yoctoproject.org/git-submodule-test;branch=master;name=repo-git \
-    gitsm://git.yoctoproject.org/git-submodule-test;branch=master;name=repo-gitsm;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/nested/repo-gitsm"
-SRCREV_repo-git = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
-SRCREV_repo-gitsm = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
+SRC_URI = "git://git.yoctoproject.org/git-submodule-test;branch=master;name=repo-git;protocol=https \
+    gitsm://git.yoctoproject.org/git-submodule-test;branch=master;name=repo-gitsm;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/nested/repo-gitsm;protocol=https"
+SRCREV_repo-git = "f280847494763cdcf71197557a81ba7d8a6bce42"
+SRCREV_repo-gitsm = "f280847494763cdcf71197557a81ba7d8a6bce42"
 SRCREV_FORMAT = "repo-git_repo-gitsm"

