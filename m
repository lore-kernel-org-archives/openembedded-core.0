Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F048DF8E48B
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:37 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28283.1776378808934427987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Osx22Fqb;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48896199cbaso496855e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378807; x=1776983607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQ1nnPZD4T81cHP4CPJAEtZLqfKwRd1IwiROmD+jMLs=;
        b=Osx22FqbLa+n3jlCwfeg654z0fnm4U2wRQAzypNI4oRKIkgtYLkM6Z5p36PmUrfHwO
         UlB2vASrtFsyiw5LE1nrKonp07nZ1oTSlskH2U+6dYjmYzQHe5M1YVusnX4AhV/q4T0q
         joyx/nWqY56y/YJbNzvBkwl2EWcDIrE4eyOEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378807; x=1776983607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MQ1nnPZD4T81cHP4CPJAEtZLqfKwRd1IwiROmD+jMLs=;
        b=sfyRBU8suwb+FCWwnLpFl/yTbFAdu5dccb/LsJ9c1wnNFy96jl7D+MMNHZe3cAPKXb
         JeZbcyc0jr2QMx695gvbwqUnidWNlfP7yBz0aopTRjY4AZi9ZYzFyvp79dS0QymJvwwE
         8e2hElZKU6y2QCW1jLzpI9rc1B/ZZlA9rCDgwXzObQeuIbrwTz0YUaDewvk9Ff6B8qoc
         DKAYoatrD/uj1ox1qSUE2kE37z5DpTfcIlBFjf9seEcnxLI0IRfiVqpUBjWtenLL5nsS
         4DV6M/yFCSHQJOfGf0aQiHTkZN3NIH1M42PUpeW1tg2CggSqwmxoahOn11ycXvlUEGT2
         KJZw==
X-Gm-Message-State: AOJu0Yw2KfkBvn1a9nyM44cPcw41e2O8Xcw5GGRmHL0NjBBvJXRCAFsV
	vGLuvPzhSYj0siQDpBQH8CvgNlMtTPq4QDAYhoggwUPExRozaBLxV3yt6KkexAfh0Ch87US8ilE
	y99bku87Iz4Ad
X-Gm-Gg: AeBDieshtJYjcJsqewStbCvB9w4MMHnoo5aCX4bBQW7P3g70Szwe0uSCt7bsxvD+zXk
	P+p0qdoqJVfjLanE4l8UQowrj2SDdTrIrDxyhm2zn6szpxBg98/UIUubFAcv8pFpau/ivTE37AD
	0zDex3ZOQN1gfpFPNrajmKGqirE9lYwvf1IPDREUS++ogYMnNToMVrB8CwaMI7ctph0nN806qMS
	5cCQw9biZi+rkwmqSCSl6RVT/MYyFxsBWcL92UNitXKZYQbEmKRv0ZMTTCrce6PQKOmz9UMRfSP
	V5y1mdEO21ShKJnxRqXIaiu+Ym/rZCByUNkixt3d0cQdCetqi1vVQ0A8yRcW2PTcxR7KxRZ5Vcx
	6FkWZuwmvsUTp52v+vG0z2sXC9FvWSCIoZt1RUBLD0jZJrXXbrLRcbNz4Xg8KWTb2T1KLGZBnsk
	E5BVeNZyy1kQb3HHIVR2qno7z5XI/XYP07XUm69G1chyDW4cNKhVTi3YtAAsTk+fU3z2B2itvyz
	ziGWmZlj8U++l2+FIBi/U9f+o2G8ivpMs/lwQ==
X-Received: by 2002:a05:600c:8b68:b0:488:7f69:4abf with SMTP id 5b1f17b1804b1-488fb75405fmr5988975e9.12.1776378807027;
        Thu, 16 Apr 2026 15:33:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 43/51] scripts: Default to https git protocol for YP/OE repos
Date: Fri, 17 Apr 2026 00:30:26 +0200
Message-ID: <95cf84a4ea77c4a8af2cf814857f50c8a3508c1e.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235472

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/combo-layer.conf.example | 4 ++--
 scripts/contrib/patchtest.sh     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 90e2b58723b..4ae3db45ab1 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -14,7 +14,7 @@ signoff = False
 
 # mandatory options
 # git upstream uri
-src_uri = git://git.openembedded.org/bitbake
+src_uri = https://git.openembedded.org/bitbake
 
 # the directory to clone the component repo
 local_repo_dir = /home/kyu3/src/test/bitbake
@@ -76,7 +76,7 @@ last_revision =
 # that matches the original commit.
 
 [oe-core]
-src_uri = git://git.openembedded.org/openembedded-core
+src_uri = https://git.openembedded.org/openembedded-core
 local_repo_dir = /home/kyu3/src/test/oecore
 dest_dir = .
 last_revision =
diff --git a/scripts/contrib/patchtest.sh b/scripts/contrib/patchtest.sh
index b1e1ea334b9..550b6a88f3c 100755
--- a/scripts/contrib/patchtest.sh
+++ b/scripts/contrib/patchtest.sh
@@ -75,8 +75,8 @@ source $PTENV/bin/activate
 cd $PTENV
 
 # clone or pull
-clone git://git.yoctoproject.org/patchtest $PT
-clone git://git.yoctoproject.org/patchtest-oe $PTOE
+clone https://git.yoctoproject.org/patchtest $PT
+clone https://git.yoctoproject.org/patchtest-oe $PTOE
 
 # install requirements
 pip install -r $PT/requirements.txt --quiet

