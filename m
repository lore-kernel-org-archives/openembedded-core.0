Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9FFC982E1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:16 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1583.1789682890887549551
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SjpsjS1u;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so930685e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682889; x=1790287689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jetXS0VQ38xoVvVx165OIv3MztjEOThJrvyUD7qtNq0=;
        b=SjpsjS1uS3SX28GkmVItXSv+95Vp3OZGV8Ei8Y+vrp+i3GICZDlLO7wZ0KUTe6TOp8
         05SsSGpok+2EPAbInoFK2AfdxGTnElGCBfOE3z3Mh60DxiqgG2qw3g2nOWxKR7ZQ4YcG
         JUBaZSZBhMvifKfpr95kHAP6neo2ZAlvm53Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682889; x=1790287689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jetXS0VQ38xoVvVx165OIv3MztjEOThJrvyUD7qtNq0=;
        b=iKRq+g48oW5J/XpehU0e5aX00HlIdoxIlUvi2YixBHSLNS7KKNY94TckV5N1v8FVqM
         Y1pw5I6ofxMW4FBQ0M017Qdc88QT35soo2eB8HjbImDFh0/G6+v2N3gbAs2Ax0iPYMqJ
         WoOYBj9F+Te8tLHGyqVYDH6vEMa1EjXaW4ruKURedPKhOyjlr/GU7cTjHYbvnv8JrWt2
         vv1KzIRdIxzuo4nQAZtWCsl+b2C+WVmprRwQ7oQA9BY/HTf8WAEOfq4SdBNz+0Eejv9p
         PX6MZAyFQtLKWkdA7a2EpBxczb0US/qyR0U7Sc2p9iQNGzgmw0BGQGJ4Fd16N4U9CEqO
         uZgg==
X-Gm-Message-State: AFuF++mJsWqM6dVnVejL5TvBh47oYhfoCODbWMWX5Lc/ctBWgrnQnGyv
	O7ceWalFrp7bY2l7KwMfT+XFE7aKLiNQtN0CMDLIV0pPKlW7JTdqRxYaGvc912HJ7qtMK+s8Yxk
	FWmQiouA=
X-Gm-Gg: AYBFou0dFhCjhWpBRpFVDtVuUEqT3iPFPJr1+DR+3YTrk4Rp+d0hyWZSsN/GaGt4I7R
	dnVMsAuNWLQTt5heS7naRMN7CYz8DL/6wGy1oxzJ6Y6/1uIIwd+FWqDA8ngE1ZqTai+ouetNOmv
	qURhZyZYEkkTBj/w4yYc0/QuupGzxNWZCufwYPTuZmK76ZGXTrzkfGIXnOajmW/+wReYVvNKvmh
	ctN/35XCoTmdem5/JUoU8iJm2xpGtF/H37h0k5Bxfz44L6Y5dibGuNT9GHVX1KeVWMngz1+ptnp
	FnJaMpirvz2Q1Qrl+O3oHCDp8VKJgToaoo4GLc5Jeq5zHpkws9YWik4mAkhCEfhC+wQ1/0qv24k
	ZsYoMsSHmDYOlAYR0ReRhtVK6q9CJdrmRRiXeVBm2TMWe2DV07hs4Xtr6ACnNsqu6NaHBY9mj8v
	Drkpurbti2Axw2SMEvaqXgmLu/i9/GWjSfL9zpBItkcIqMoOkhjDZ6bKW3B/MelJ+RIfdO/P0Cq
	md8/vLTcwySdlLpK5eKD0NwXMykcwWL7jnyZvJ4zmXiduvDEM17rM8WyZwcKWp4Totqugm9b7E=
X-Received: by 2002:a05:600c:6296:b0:49e:6fd2:a45 with SMTP id 5b1f17b1804b1-49fc5737c43mr2857915e9.16.1789682889123;
        Thu, 17 Sep 2026 15:08:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 37/79] python3: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:22 +0200
Message-ID: <73694e077d37633c5b44a2d450ac2413df39e52e.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246132

From: Daniel Turull <daniel.turull@ericsson.com>

Python maintains each release series on a per-minor maintenance branch
that, once released, takes bug and security fixes only, and it releases
from several at once: 3.10.20, 3.11.15 and 3.12.13 all went out on
2026-03-03, after 3.14.3. So upgrades within a major.minor are stable
point upgrades per the OE-Core stable release policy (ref-manual, "Stable
Point Release Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://devguide.python.org/versions/

Checked the last three point releases by category, since these are
substantial bug-fix releases rather than security-only. 3.14.6 (Jun 10
2026) has 8 Security, 32 Library and 17 Core entries; 3.14.4 (Apr 07 2026)
has 5, 59 and 46. Every C API entry in both is a fix, so neither adds C
API. 3.14.5 (May 10 2026) is mostly fixes but does add RFC 9309 support to
urllib.robotparser -- one extra capability in one module, touching neither
the language, the C API nor the stable ABI.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone 3.10.4 -> 3.10.20, scarthgap 3.12.3 ->
3.12.13, wrynose 3.14.4 -> 3.14.6.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit e49e237208a9a5074d7bbc65b748962f3ea0eb49)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.14.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-devtools/python/python3_3.14.7.bb
index b798f1c3697..e73dc8d7728 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -45,6 +45,10 @@ SRC_URI[sha256sum] = "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66b
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
+# Python publishes bugfix/security-only releases on its per-minor
+# maintenance branches.
+inherit upstream-stable-release-point
+
 CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
 PYTHON_MAJMIN = "3.14"

