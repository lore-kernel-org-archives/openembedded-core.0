Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF90CF9C5B
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 23:43:49 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.1865.1727135019704382929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 16:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X3aafbhF;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71971d20ad9so3238495b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 16:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727135019; x=1727739819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xAL0NGmkDE9Bofw305nqQ2l39kLHHBh76V51qPa4JN8=;
        b=X3aafbhFA3R4jbnbxJ1xzde1l7clSUsALgIxAq/QFsbFdR9k6P2XcLISKgd/xEibE4
         tyqy5wIeZeI6KB5/fvhTBuWfRABqK+YIvt/X4R1xVAzB0GAO/44XI8P/fAjnYQ4fwhjf
         j7OS46o+aDePuh0bLQoBH9iCR63X4cs5C9Tu3qG5vKXWB8gEJb69JmT5bCZ6vyMtK8oj
         0AWlFNJ0vRevQ+ZMqaZ7ZrawFa5Gi/Gy89Wa6Er8ml/iVfgiWIT2xCZ9GqB2cQBmIwyR
         J4inwo767cZxeThVgAJtpB1dj7kG0N7vFYSe0c+4On5s1XISSlwBehiCREMWMmPnltD3
         SzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727135019; x=1727739819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAL0NGmkDE9Bofw305nqQ2l39kLHHBh76V51qPa4JN8=;
        b=ilHi+bf1m/4dcAKJUYqrm/xVLJYZtEnPr0SzP/7xWnf8XUCqJnoMdi+HQq7KGoK+eN
         qWxCE4U1xPz3AjYoSs9WilNDRsj6eeoS3zIYgCnKZxsxdO/f4K/Nv5xRHRXZtos7GMWP
         Ggls0kB0DYg97GVPiK5dM8+mkC5CwBI9cE/ZXcPs/ADg/uaS0od7uJJaQyMgj3GAPRZq
         uXiLAWvfcqy5S8KN+vlc/pMkL6RNe3FvQXvgoFeP/u1oDFqsOrCE/Zqw+rOhjUX3Sxwj
         hzOUN0aGfQpYe3STA5rPbNYsoeXblWCpNcvKr6qZaFlHmwAR1AqH+EHWRT7avRYHKWib
         wFWQ==
X-Gm-Message-State: AOJu0Yzz3ov81Eo0lRsrnHLy/PZ0e1WYwZtCuBLR+0J2uEHrtSJPRm16
	mgakQIgaaRfy9gQZdOwPQqAby828r2tYIChn8GxhBpQzrkNfBPBoMF5SQTDZ
X-Google-Smtp-Source: AGHT+IF1kcA1GPyxcNusYp/oCBHopJy3c64uVnN9awTBwQFix66AGXBdD4EjTSVRuavEvo0bHx+qBA==
X-Received: by 2002:a05:6a00:1ad1:b0:718:f026:6c78 with SMTP id d2e1a72fcca58-7199c9cb840mr18177518b3a.13.1727135018780;
        Mon, 23 Sep 2024 16:43:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::47f4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c31b47sm106343a12.15.2024.09.23.16.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 16:43:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] vte: Upgrade to 0.78.0
Date: Mon, 23 Sep 2024 16:43:36 -0700
Message-ID: <20240923234336.3978188-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 23:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204827

- Needed for Gnome-47 components e.g. gnome-console
- Disable GI_DATA on arm, it uses qemu usermode and qemu-user crashes
  while running qemu_Vte-3.91

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/vte/{vte_0.76.3.bb => vte_0.78.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.76.3.bb => vte_0.78.0.bb} (94%)

diff --git a/meta/recipes-support/vte/vte_0.76.3.bb b/meta/recipes-support/vte/vte_0.78.0.bb
similarity index 94%
rename from meta/recipes-support/vte/vte_0.76.3.bb
rename to meta/recipes-support/vte/vte_0.78.0.bb
index 515ff228fd4..f44d39ac451 100644
--- a/meta/recipes-support/vte/vte_0.76.3.bb
+++ b/meta/recipes-support/vte/vte_0.78.0.bb
@@ -15,11 +15,11 @@ DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native i
 
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
-
+GI_DATA_ENABLED:armv7ve = "False"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "f678e94c056f377fd0021214adff5450cb172e9a08b160911181ddff7b7d5d60"
+SRC_URI[archive.sha256sum] = "07f09c6228a8bb3c1599dd0f5a6ec797b30d3010c3ac91cf21b69d9635dfaf7c"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 

