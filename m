Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6989DC4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 08:33:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4534.1784536388726354385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 01:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gKprQW+t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f71156e1aso524111f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 01:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784536387; x=1785141187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kZgUrAG5fEG5XUrl/pWejHVeRm9H4ebvKncNB/hEFfM=;
        b=gKprQW+tgVIfDJQEwcRZTmTloOwUvuAcx60ATEuEFo/zBAsEI4hpCDOcIcut3O7x64
         C2BX1SVUOcPj/X2+ck0BpSBOlLxvSzFsCzEu5m03Rn0TG1qlhXM27M732MjMYRKzIGdr
         jJtQycqOoicXJ/G0WX3YNGuL8ZKII4H5lGxlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536387; x=1785141187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kZgUrAG5fEG5XUrl/pWejHVeRm9H4ebvKncNB/hEFfM=;
        b=fuyOIywP4+DhToa8iR4NIHy7X1/wG4GJe8can1ZljCljexYzq4havz0GHc9Bc70XiC
         Ir+v9gqTYDYVMFzCkGk4W42Yta4jz2bWfg+S0hkBwIgyQjXLOOMHAJXUn3UF8e8gdT4z
         4INx3Qrqr16elkbQzFoIgKZhgMjtvQQ+sm6hnwQczDpXO3T3iU+e5qorDHFzgIHRsh+J
         wdDi8CBc5CxYTVp3gCcNJTKamhX+f+qzAlJYvYX4cgO/s5UDzByYL1cjW6VePpPR571S
         x9dHQ45H2Av3diX4nlvIofJZbPg0eDRh/d6k1zBTVU5sIC+PjkRuLClnGt9heLvVZ21h
         vAcA==
X-Gm-Message-State: AOJu0YzKuGJAcTla4CK7W36kVuV/B0SqCBBVcV6lTTthYdivx6IJSxCT
	t8recUaudAjzoxFXosrYzT1CtbYceyUgt5e3q5yL+lQ2WPf9V630jDSrUMGeDRCMVMC77+8Klwf
	nEtI3ArU=
X-Gm-Gg: AfdE7cndPsn7oBK4OfE3TG/sV5NKdgvhbxsyHUpqqsEe8vMH1YIz/R0z3IRaAmxy4KB
	7wQ+V3iTAFup17x6l616zpbLR8SZTVmLZEr3G+lncrUM24y33qJLb8wQJ7SRnipb4yh9GxDF5br
	rbgf7ZR0kbpWlNvny9ymX6gx+xmlvOJ1Biixuini9ky6nRbl7Y/3O/4VZ2PcS3UlNlur06AK2u8
	AIkx49YJOfflSpZhkJdgcjcB4RMgYZhlSMOnoh2DZOc8KrcXMHtTbYa9ivnOLTZ7yTySFuXI5gM
	AOhomE9KbJKd96DlGnvI8nMLij+uEyCQyt1IVJ/C9ZOCsZl70uVOHKTZ/1wo60SvEqzLs2RCO7E
	57eQ6niIqFIRB7+0Hzp0LCcZ9GwwP2q4LltOnSrB2PNdTqtZqO1tbadBcyn4BR6BfVtBkbLmdgc
	MjZZsNFrf8b/Wp9qDzGqEcRdQrWPVCE9o=
X-Received: by 2002:a05:600c:6c98:b0:493:f6c1:2f09 with SMTP id 5b1f17b1804b1-4954a3d2fcdmr106835165e9.6.1784536386720;
        Mon, 20 Jul 2026 01:33:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f231:f082:3d95:2084])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2aa698sm241732125e9.4.2026.07.20.01.33.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:33:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] wayland: upgrade 1.25.0 -> 1.26.0
Date: Mon, 20 Jul 2026 09:32:56 +0100
Message-ID: <20260720083258.770582-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720083258.770582-1-richard.purdie@linuxfoundation.org>
References: <20260720083258.770582-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241343

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../wayland/0001-build-Fix-strndup-detection-on-MinGW.patch   | 4 ++--
 .../wayland/0001-tests-Remove-event_loop_timer-test.patch     | 2 +-
 .../wayland/{wayland_1.25.0.bb => wayland_1.26.0.bb}          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.25.0.bb => wayland_1.26.0.bb} (96%)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
index d402fbf8b44..c60d01708c4 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
@@ -1,4 +1,4 @@
-From b4a3b9f913e06f9b71966cd695df1ab14a031ed0 Mon Sep 17 00:00:00 2001
+From a3239f480eecc8d45bd15b8c0f6774424249a295 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Thu, 20 Feb 2020 15:20:45 -0600
 Subject: [PATCH] build: Fix strndup detection on MinGW
@@ -20,7 +20,7 @@ Signed-off-by: Denys Dmytriyenko <denis@denix.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 33653e7..e05eaef 100644
+index 2c010be..3b6f8d7 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -49,12 +49,12 @@ have_funcs = [
diff --git a/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_timer-test.patch b/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_timer-test.patch
index b225bec96d7..3de30473147 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_timer-test.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-tests-Remove-event_loop_timer-test.patch
@@ -1,4 +1,4 @@
-From 46da8d01e695f415aeb4a8442dbc13ae0898912c Mon Sep 17 00:00:00 2001
+From 022ef36fa8a9fe57a117a6cbc55d8b81bf0fa023 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Thu, 6 Nov 2025 08:35:26 -0700
 Subject: [PATCH] tests: Remove event_loop_timer test
diff --git a/meta/recipes-graphics/wayland/wayland_1.25.0.bb b/meta/recipes-graphics/wayland/wayland_1.26.0.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/wayland_1.25.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.26.0.bb
index a0bc13df565..c4e3c8b0f68 100644
--- a/meta/recipes-graphics/wayland/wayland_1.25.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.26.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downl
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            file://0001-tests-Remove-event_loop_timer-test.patch \
            "
-SRC_URI[sha256sum] = "c065f040afdff3177680600f249727e41a1afc22fccf27222f15f5306faa1f03"
+SRC_URI[sha256sum] = "64176eaa46e4969903e286f8e5ef8331affc17fdf03ac9b58381d2b23162b7a3"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"

