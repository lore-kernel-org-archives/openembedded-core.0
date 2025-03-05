Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905ECC28B23
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:36 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.6415.1741212695173211883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ohnMXl+y;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fee05829edso71748a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212694; x=1741817494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xf0W5IHJ3WSNIBbXtvG9qNceS3UeBXYlrnO3YTQSpZA=;
        b=ohnMXl+yxddAl14wkC6HXRn/3u/+jIUlbaD34HmblhNuzN034DZL5AWsYDiUHYH6Wc
         bIL5EYkvnlYxur6VJRxie0FY9aG3wwq94MZFntn/iJre2MOGkEp/K9PQMczmATwn8K6q
         vApkhyKUAGb3gO4XFFEIbAK7YChqemJ2ISmqjUlp4fNFgP9UqKE+F7gaDjQ586OLUVlK
         S0wyve6jG6LgySs2+346pLy2fjxzlpHqm9PUayYfjNi8QvHcQk3ErYi4ksoanAwPd/AG
         AfnNZvwRqBessbSSBekZTzNapu4dpZuP2r7td8dT0qDSMXwz7goOFzJ3BZQdjS0qeyzf
         ZoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212694; x=1741817494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xf0W5IHJ3WSNIBbXtvG9qNceS3UeBXYlrnO3YTQSpZA=;
        b=Hgu7D5vusxsQfKZZ3J/zOQCQqGJ0EjnKaJl7+XzzfFYmXamiRUpKpbHyMVUIN2+Zj9
         PdzULKtP+5XOLcV66bfCvDD92VHyGfGJupSL6SfIlUpNshNy5FckjySzu7Wf+ZgbdSsa
         YrR6qTmyi69TatVh6AyACGNJF05voUP5cQ1zeQXEliQLtLjj06oYpojFhl5BykVURI2i
         g0009t7Z8qb/bqQiTMgUrXaAlOQjE3yz/MuA1ZuheSK27zzjw103HVTABTHazVtvYe0y
         +WiBRqWc/Gd6/I3xPIGRWol9KvM9f8X+7dkdEkK9aUlIpQfRvoMeWorNIbzUkagfC+kV
         A1Yg==
X-Gm-Message-State: AOJu0YxHrggYpXYzRD45YoLgULsIq3Dmkn5aLK19xePWbZB8aP7hjKgu
	wksSPie5HGHVVsV52ddTgCx8YQ88ZSwz92qPPcPqxDefxNWgX+SFnANWkmpilVHBxOHRaHFvKo1
	9
X-Gm-Gg: ASbGncvkfxLwQ1zRIjIVFhgXTASc13zxkK6Dzi24RNucTwP1IGAmw9OakHEcQaTORf4
	RstblVOlsel3ZJS5pDlwDa8/hGIG44RBykuGBU1DubS7ZI/2mGYVL/67qmIjXxAHt95Elm6IvE/
	8YvnDjfYeIK04bX19icTQ0adFoQDzKhZ4Jng291R7f0XoYTaQe/T3GotmDSy3NWAIyvZPXWws4b
	3QSz93sQ8q/SK7ZufAve1yh66wjotZKnSrGMPzaY48/IKMiNz5o+eyAXIhFCpgb/mO5Lgw6icwg
	9kQBuKXPWi0ly6rK5BlWjLZkeB7eUD7mRQA=
X-Google-Smtp-Source: AGHT+IHAZ0qsMzUXPW22xET2X4N1l87Rfc06Nf9kvl5sZkUMYCTaVuTsdtXZppD3dTorzpvBejqspw==
X-Received: by 2002:a05:6a21:32a7:b0:1f0:e7e2:b295 with SMTP id adf61e73a8af0-1f34944b70amr7313972637.5.1741212694324;
        Wed, 05 Mar 2025 14:11:34 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/16] xwayland: Fix CVE-2025-26596
Date: Wed,  5 Mar 2025 14:11:05 -0800
Message-ID: <ea9aac48ff4bc25e79b17c63b425a705c97f078d.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212356

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/80d69f01

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-26596.patch    | 49 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26596.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26596.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26596.patch
new file mode 100644
index 0000000000..f9df8d75ea
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26596.patch
@@ -0,0 +1,49 @@
+From 80d69f01423fc065c950e1ff4e8ddf9f675df773 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Thu, 28 Nov 2024 11:49:34 +0100
+Subject: [PATCH] xkb: Fix computation of XkbSizeKeySyms
+
+The computation of the length in XkbSizeKeySyms() differs from what is
+actually written in XkbWriteKeySyms(), leading to a heap overflow.
+
+Fix the calculation in XkbSizeKeySyms() to match what kbWriteKeySyms()
+does.
+
+CVE-2025-26596, ZDI-CAN-25543
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/80d69f01]
+CVE: CVE-2025-26596
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 85659382da..744dba63d7 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -1095,10 +1095,10 @@ XkbSizeKeySyms(XkbDescPtr xkb, xkbGetMapReply * rep)
+     len = rep->nKeySyms * SIZEOF(xkbSymMapWireDesc);
+     symMap = &xkb->map->key_sym_map[rep->firstKeySym];
+     for (i = nSyms = 0; i < rep->nKeySyms; i++, symMap++) {
+-        if (symMap->offset != 0) {
+-            nSymsThisKey = XkbNumGroups(symMap->group_info) * symMap->width;
+-            nSyms += nSymsThisKey;
+-        }
++        nSymsThisKey = XkbNumGroups(symMap->group_info) * symMap->width;
++        if (nSymsThisKey == 0)
++            continue;
++        nSyms += nSymsThisKey;
+     }
+     len += nSyms * 4;
+     rep->totalSyms = nSyms;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 2215d2fe4d..63803a7a44 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26594-1.patch \
            file://CVE-2025-26594-2.patch \
            file://CVE-2025-26595.patch \
+           file://CVE-2025-26596.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


