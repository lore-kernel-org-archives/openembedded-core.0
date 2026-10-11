Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52486CA9ED3
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:29 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23444.1791708081869457368
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3G52hj+q;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso6665645e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708080; x=1792312880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jbFQqZPH3x6/TWPcEU592xyn33AG8u1hNjuuqEj85D0=;
        b=3G52hj+qpzDdZcbiG3NYPhyJj12eF3xsSwoc9p7McNGPCu7Gy8yv2F1XT/fRd4kJ20
         GlQ16P+8VYAio6AqTs37VwgdaPB8hDd3hm+vAv1LcNlnOVJ3qhO4UfUjgVECV1xTuTZz
         6T2mkevvD4lxr/paZLEKXE2rhUBm4OlIIHjSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708080; x=1792312880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jbFQqZPH3x6/TWPcEU592xyn33AG8u1hNjuuqEj85D0=;
        b=0uz0d/Y5Z7blt4aj0TRjmeqXrHwyhnnDHDXC5Xs7JINRHGX3NBxz9KYGhpzV+j/yHo
         INRPoRnhvYTW1iGa66Ru3BeXNPqXNjkG2lrOPBZTosAPkvaJ0FX2k5AKFioCoea2S9nH
         3D0BiHKtQRehFYR5oOjqOjsW6TlhLta+0vUUWR39c4cQw+J4peejohK8rcYfEbfkbLzM
         BpEKIhPjMgfy53+KALz9JcGGh2QLR+liEGz1zRYhODDgQlxmIzbn0X/4mviz/TwpZovV
         G5v0iZdJ/r9mptJPqp6xne/Kpr2VT4f8dLv8Rv3QjbOBU0WlpujUlTam4/HVUO5ETY/2
         aDtQ==
X-Gm-Message-State: AFq9FYIzV+tl/gKXteEwuweluew+NxTmrrsOB2o3uThx1/PxbirAZExv
	r9HGxDPwzNwV0ObH4jVSt8KkyzMi+eZcFX8bZuzBssQxX0nm0gUzB+Ap8+vGQtSuZVktg066adn
	2gWib/fg=
X-Gm-Gg: AYBFou1wgLLx9GT+ByzK1qDwzCwW4wcTI/arqrmRQCOHTNewXc2UF0CwJJ0PcOTGtLH
	SDY1MStf0O1bNwpZpTbZw0vi9Gi+S+ePdvrsPf+5Ak1SN/SioSrEixcd+muTnpZwQQhrayk7QOG
	d2lzTXlf05OeUfv3xe5aTPPbjNJt1c8MxEDqYqBUQ4BUQtXGf+5g5jcXvNB3ZaWUDzbVLxVErtv
	JRiaovd0zX2349IE2+9DuGZjeS4fgp5QXn5H6VG3PH3RyoMWJG8iaHuufVl5kSPojQepVRjAtz3
	Fz0/kvLJkF2kD251cF4lhZGcfOhP7WXM38WH0ellpttxQGgJu1g1KP3VR+GvHiPKFHOl8/Sye4Y
	iL2FUlmttcWLySq+tR5qHOSCoH3w6KGtT8H3Gw1XsGogSMWCazUH0a9f0t+Hv6of1xscNoKH1+c
	GwCFiRvZ96Pq50Kh71ud1d+97cVotqc+fMZ0PpLy5aI18jljKnTCS9FIf0rk0ijQvmr2C/77SZE
	kKEeYk6olFi8b420Cu3LfJX8vWjOfPYJ9PU2CpLQIddJkjcaRVXjX2btSkfI3Uiclke00IVIw==
X-Received: by 2002:a5d:5f8f:0:b0:48b:42c:8b44 with SMTP id ffacd0b85a97d-48dbaaee9bcmr11079876f8f.32.1791708080029;
        Sun, 11 Oct 2026 01:41:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 30/60] glibc: set status for CVE-2026-86805 and CVE-2026-95818
Date: Sun, 11 Oct 2026 10:40:03 +0200
Message-ID: <cef60071814e22e8beec5197c3798e2e247cbeb9.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247539

From: Peter Marko <peter.marko@siemens.com>

These CVEs are fixed in current hash with commit [1].
It is commit equivalent to [2] mentioned in [3] and [4].

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=533e1c955c7bb9b761749751ec743b46c6bd2238
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=ed0c137b97eb940b4b64981e84ed806d3276edd9
[3] https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0022
[4] https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0023

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc_2.43.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 3d642e6738d..c962171cf3a 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -24,7 +24,7 @@ CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-20
     CVE-2026-4046 \
     CVE-2026-5435 CVE-2026-5450 CVE-2026-5928 CVE-2026-6238 CVE-2026-6791 \
     CVE-2026-6368 CVE-2026-19499 CVE-2026-77117 CVE-2026-80489 CVE-2026-18374 CVE-2026-8674 \
-    CVE-2026-89092 CVE-2026-97399 CVE-2026-19542 \
+    CVE-2026-89092 CVE-2026-97399 CVE-2026-19542 CVE-2026-86805 CVE-2026-95818 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 

