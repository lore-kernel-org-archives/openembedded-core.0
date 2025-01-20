Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39CEC0218D
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 14:00:13 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.35800.1737377275668471958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 04:47:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vq6ssb6z;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: arturkow2000@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54298ec925bso5304159e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 04:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737377273; x=1737982073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QktOdatgETcXATTGpeMs+Jrot2sQykkxwWyuaI+FY8=;
        b=Vq6ssb6zzqLYdiroYsYoAyuwHL1ujlpRW+l9Q0dyoobRDBQMl8IH28TFlexqQPlxPV
         +sT85W5FZgSsF8aH6zl/M4giVIgTxrv4tgoKPgfDxzYUMebaxL4ZXs93AzR/xHSMmOtO
         nN6+NKP9HCUd2FwzPrCrrN7m231OIkw5BeC5im6oK0+77X/SBBeotUw4izoaINjQ+iB8
         eaUWSCjYzMEwmfVV88Q77RyrmngCfmgSrffd4E13UrfNESKJhEKMRtN0TfeZqY9CGRIC
         Llms4VKoM5gncWvMJzGrQN7T+kFbC6z2T2vzt47RZnojrQlayJYPWceSuZcWqbag/aFg
         5SJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737377273; x=1737982073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QktOdatgETcXATTGpeMs+Jrot2sQykkxwWyuaI+FY8=;
        b=HbrcVfD7fdjljyoqsngvgkSNV/c7R/WoCOEJUcfy+IaFqqJZ+p+lVKAfVO2XU9Vt34
         uC0ML0CowUzNqHI+21WENbqMF2KyKCzQnQKT19DwJYcqTsAju70qVSYEjcK7wObAdr1L
         tiyvaDWJqW3yM9NEz/q+DT+xXhJg1yhXyfK8ii4Z3886fewVVvQOwyf3UhS3O+VhXgU1
         lVoMZ+DNGrU5LiU43mNXfa7hsz4EVyLsGSCQvFWcDIUvhJPD6459VoG95tYxpKn7nBFB
         SYNQOFMCfpiyrAvWJd2x1KvCYFHwoIET4pLIPLdq+ev/USZrx6j5aI+6EsUxhRpZMHpj
         YdZA==
X-Gm-Message-State: AOJu0YwzRMlx8/Pi224r4yIk8RA6ZTuXGneCcahcOGy89LKt4Dfvkus1
	WF0zOSMPf3/5n0bsYMtKPcCsDjoYwkDTZnCgsDC3Vt5UU4MRRtHEXNwYrg==
X-Gm-Gg: ASbGncvRvX+TL4UYHFFhk2yaty5zNq9hCweWhTmu7vSsny4avxltvP/ibrwCdFZX4p9
	TwgTaCKLlDQGNIJgrCWHj3HSTMI1e/20ByJnEjbB+O5OPXSuitibFf1CyIKOAEb1Q1LcDH8210M
	FN9dgeE6nPUVYCOhAlXutcScopg3E+k87loqe/QaAVWt3sX5ZbGE8LzLK5g9uuocVQujVwf6jZQ
	Ww1aSGzW0Pqsw1pHRHQgWgvGWruq6//kGlNBhvk8TBt7AyGtFkgmuEAPzeHkj7L/ofyoHd/2cm5
	Sw==
X-Google-Smtp-Source: AGHT+IHtUrQxzAn0bTKDPZ+H7NUW+TFfhkOKrsp/Zdy4NGwbBTA5HqAvPlSns9mch4hUimj7LWq8lQ==
X-Received: by 2002:a05:6512:108a:b0:540:1fd6:4e4f with SMTP id 2adb3069b0e04-5439c246c5fmr4470910e87.22.1737377273202;
        Mon, 20 Jan 2025 04:47:53 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:23ed:c831:8228:ebaa])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0742csm1307523e87.37.2025.01.20.04.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 04:47:52 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v3 5/8] systemd.bbclass: properly handle user units in systemd_create_presets
Date: Mon, 20 Jan 2025 13:46:03 +0100
Message-ID: <20250120124605.263817-7-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120124605.263817-2-arturkow2000@gmail.com>
References: <20250120124605.263817-2-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 14:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210035

Previously user units were handled the same way as system units, that
is all preset files were created in system-preset directory, but user
presets should be in user-preset directory.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index a3c2c6eb20..592f15a4b7 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -102,6 +102,12 @@ def systemd_service_searchpaths(user, d):
             d.getVar("systemd_system_unitdir"),
         ]
 
+def systemd_service_exists(service, user, d):
+    searchpaths = systemd_service_searchpaths(user, d)
+    path, _ = systemd_service_path(service, searchpaths, d)
+
+    return path != ''
+
 python systemd_populate_packages() {
     import re
     import shlex
@@ -197,13 +203,27 @@ python systemd_populate_packages() {
                     bb.fatal("Didn't find service unit '{0}', specified in SYSTEMD_SERVICE:{1}. {2}".format(
                         service, pkg_systemd, "Also looked for service unit '{0}'.".format(base) if base is not None else ""))
 
-    def systemd_create_presets(pkg, action):
-        presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "system-preset/98-%s.preset" % pkg)
+    def systemd_create_presets(pkg, action, user):
+        # Check there is at least one service of given type (system/user), don't
+        # create empty files.
+        needs_preset = False
+        for service in d.getVar('SYSTEMD_SERVICE:%s' % pkg).split():
+            if systemd_service_exists(service, user, d):
+                needs_preset = True
+                break
+
+        if not needs_preset:
+            return
+
+        prefix = "user" if user else "system"
+        presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg))
         bb.utils.mkdirhier(os.path.dirname(presetf))
         with open(presetf, 'a') as fd:
             for service in d.getVar('SYSTEMD_SERVICE:%s' % pkg).split():
+                if not systemd_service_exists(service, user, d):
+                    continue
                 fd.write("%s %s\n" % (action,service))
-        d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd_unitdir"), "system-preset/98-%s.preset" % pkg))
+        d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg)))
 
     # Run all modifications once when creating package
     if os.path.exists(d.getVar("D")):
@@ -213,7 +233,8 @@ python systemd_populate_packages() {
                 systemd_generate_package_scripts(pkg)
                 action = get_package_var(d, 'SYSTEMD_AUTO_ENABLE', pkg)
                 if action in ("enable", "disable"):
-                    systemd_create_presets(pkg, action)
+                    systemd_create_presets(pkg, action, False)
+                    systemd_create_presets(pkg, action, True)
                 elif action not in ("mask", "preset"):
                     bb.fatal("SYSTEMD_AUTO_ENABLE:%s '%s' is not 'enable', 'disable', 'mask' or 'preset'" % (pkg, action))
         systemd_check_services()
-- 
2.47.1


