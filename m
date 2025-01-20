Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD4CC0218C
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 14:00:13 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.35716.1737377276440880970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 04:47:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YGfsxeJU;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: arturkow2000@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54024aa9febso4474002e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 04:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737377273; x=1737982073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUBZ/MjYIEmyPQEgf5zKWhx1g02PCZraW796fbGupF0=;
        b=YGfsxeJUkHxpCvJA7OXt/WcN5j83a7+z78me78iZMKb2lPdttilFGmKf2id8ndrW76
         ezk+omWpuQk747QDG7DjWNzGaNfLx3tqMI0AfNCSpfQZA3Y8cLdN7hWiKWmti6dGkkvm
         4fZHVGPT/51PsUhNjoAjivGtkAqlJaPb0IK1chwj99OxSxzbSrw31PSjKbzYO8YEy2gV
         g6KFiDrXzuiAJMs433C/Zg64p05uZNuVoKip/HiGro3hXBpV6xIGhRXNiVpW1e6svmhE
         NHcYgFGgJcYp20gBp2aXSWfRB5TuupUIfp9k/aE/hmxbckr97hF8uIbRJcepp6gvzM/N
         zEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737377273; x=1737982073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUBZ/MjYIEmyPQEgf5zKWhx1g02PCZraW796fbGupF0=;
        b=TX4zSsu9jH6daofu1SD6dutE1lvrwK75F6I1Yv9P6M1cjCrCpn+i0+lSJYSD9PilEF
         ci9TdzzKqzt4ZstAxFCocREDsRE9u225RuWHyDqmSDEQs9Q1DF08WIrZ3cshl+M90E7U
         PNrfsafke4GCxTaD4sfy3K8Ov7rbBDqBnGLTBPYjqZYpIxcAnjMunFmMAr2ko3R686US
         KA142FxMM70nDK3oXtEYWiR6W+05PQlhJHLBMeu2IfDd+KTmMeB4fC2ohiWeYcu4+o6U
         +MEXL3RKbsm72EkQHn1i/CuEn8dBS1+P1/OuYuKMC1DJb7iJTUagDQJQOh2QmjfGqCXn
         /HNA==
X-Gm-Message-State: AOJu0YyN5UVU6s0IumemtJI6vKsqd1IM6qcENp2jw5qhqK2WIwNS58t9
	2UVDY31klnnb0ueiYSVE3fFUrj4Kxc0MpXngsaU1y1rNSvbYMiKhmc2P6w==
X-Gm-Gg: ASbGncvDrcTkWKxLWkuY8vdrMgWCOD1GqMC/tvy33DZdqx/mttUnaNJrFiHGt+r5Hgu
	5OQPXjlOB+glC/nFig+u+dZZ/jZZLaYlD4yOyeaYNYChwNd+j7oT03lv53iWqMWP+Vp6LaeSJNs
	G2T6Ahf8XphXP1Qgp3SHDb9lmhGrOR5glrTKV2qufBkxJvsHf8pM8hrE+9aKsxwmGkW9xYdaqjr
	h4Fn1IdpVG4SLnGynocINxKC65zaWysTNbSDMR7jqrj8sbMBr2BbjLRvJxNwRdWJt71tQ66dz3w
	wA==
X-Google-Smtp-Source: AGHT+IEoV/xzsoV45WfgSEGCTf04Uocw+AFIu7AbYwaC26TkItByJC8Q5jAj5AVgAlQui3DcXkI9Ig==
X-Received: by 2002:ac2:4142:0:b0:540:2a6e:3e11 with SMTP id 2adb3069b0e04-5439c287d97mr2930160e87.46.1737377272489;
        Mon, 20 Jan 2025 04:47:52 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:23ed:c831:8228:ebaa])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0742csm1307523e87.37.2025.01.20.04.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 04:47:52 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v3 4/8] systemd.bbclass: introduce systemd_service_searchpaths()
Date: Mon, 20 Jan 2025 13:46:02 +0100
Message-ID: <20250120124605.263817-6-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120124605.263817-2-arturkow2000@gmail.com>
References: <20250120124605.263817-2-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 14:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210036

systemd_service_searchpaths accepts boolean value indicating whether we
are dealing with system or user units and returns search paths
accordingly.

Previously search path list was created in systemd_check_services() but
following commits will introduce additional places. The
systemd_service_searchpaths helper function is meant to reduce code
duplication.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 14fef2d7a6..a3c2c6eb20 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -90,6 +90,18 @@ def systemd_service_path(service, searchpaths, d):
 
     return path_found, base
 
+def systemd_service_searchpaths(user, d):
+    if user:
+        return [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
+            d.getVar("systemd_user_unitdir"),
+        ]
+    else:
+        return [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
+            d.getVar("systemd_system_unitdir"),
+        ]
+
 python systemd_populate_packages() {
     import re
     import shlex
@@ -169,12 +181,9 @@ python systemd_populate_packages() {
 
     # Check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-        searchpaths = [
-            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
-            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
-        ]
-        searchpaths.append(d.getVar("systemd_system_unitdir"))
-        searchpaths.append(d.getVar("systemd_user_unitdir"))
+        searchpaths = systemd_service_searchpaths(False, d)
+        searchpaths.extend(systemd_service_searchpaths(True, d))
+
         systemd_packages = d.getVar('SYSTEMD_PACKAGES')
 
         # scan for all in SYSTEMD_SERVICE[]
-- 
2.47.1


