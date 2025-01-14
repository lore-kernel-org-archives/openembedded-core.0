Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D326C02186
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 12:50:45 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.43087.1736858063983296146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 04:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aaJje6dP;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: arturkow2000@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so47499271fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858061; x=1737462861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyM/lhGriZkk3C8yfuaMmHJTbeA/ePF/wbk0LZ659Cw=;
        b=aaJje6dPE7TlIkKj5WV7i2vX0EbWFpLfk2R2G0OM6hd5PqR7kREAf8Gyir6r7qKRix
         AAyv8Sm5Xy6k5O6dYE8X/2keGf4YgW/DYbagFHjK67uZbQ84KwVT0UrXLF5QW9i2dfMq
         5Pjv8Zb6OhrwSLStltauqNqJDDVECAeZr4H4laQ1p/+9DTFnE7RvoYxP9a0ibahuuLB3
         YNGk5BYvMTJhkfF5+AcqOc8kTs961ybXtseDkRU2aDJBHzkO4BX6lvpZd9SgiS9NXQgs
         +nV+fkYAsCP7Bpk9HwdPxuAByaQnG3mVeuHqJoqkBc0pjYsO6C60geroAWnuoDc/A5g9
         fbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858061; x=1737462861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyM/lhGriZkk3C8yfuaMmHJTbeA/ePF/wbk0LZ659Cw=;
        b=A7OT6A/yYq8tWgecscIbh+RYU2SPrU+dAmqnq0/cku9CbOlrvtuZxHYZ/ME8uLOOc4
         mc0yg0O4JqZYrbwkvxKInvV/XBTyPYSctHRqGYUo4aunje32kXQzEXjQuYaScVQbH5LV
         jsY2G5ZPmeU2nyNqLS1Oe5c3kcIxdOHDkG5pZbfUT4a0YXH1TgrkQybphHizTrgqM8B+
         MixDbogj/3O+k9P3TrbHhswYhuH4CeMCCuWGw6aC4DqX0pQeAbwyrE9suzMGt1A+2J2Q
         V+RIMkRV7s91UjlBG/upSLg1F+0SU6fDlbG6feQPb8VwSf4P9R4wcPAzshVWTVVNWUfS
         O9dw==
X-Gm-Message-State: AOJu0Yy8npZeGWGZCPS/Ug7JoeCApykSpFZUGm8n4B5eigrU/UhI+Wbh
	jTvz7lmVPXFz4ES09ZOF1C7O6UBRBXekyKDFaBV/j+KWQHvCOB6ZL3iqsQ==
X-Gm-Gg: ASbGnctuZ+S2z+Q4GYOPRJcucrB2H8z92es3SErFRacJUFhVZjmOR/iarLqldakIi4j
	bWrYyLRlX18AxcvXb2/PeLPteowLGW2CuPQPAtoh9CI8cOQBYv5UsIo2506z+qgYrgAQxGiCcrs
	ndCn9oVK1NTuX+LNuv4WWxd9Gh2cfaSGrsUe5B/54l5ohGYcIBWCQ9H5h8X86WDNEGdzBD7DsF5
	JUhZr6VjRwcV2BiNpoSBM9gaedOMrULsaBWqAO+xgOge3Fo0yNvDQ+Y/98WYuRc
X-Google-Smtp-Source: AGHT+IFIM4nhCiJt+Rh0Bsbp7xBUO+8ipMUcrOpJP76oSufqHko9hgw9XNhwJMsWINtlljZ+jQ5kwA==
X-Received: by 2002:a05:651c:897:b0:306:26cf:1305 with SMTP id 38308e7fff4ca-30626cf13b0mr17591101fa.35.1736858061182;
        Tue, 14 Jan 2025 04:34:21 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:86d6:2e13:1a85:5192])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec4d6sm17230521fa.111.2025.01.14.04.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:34:20 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v2 5/8] systemd.bbclass: properly handle user units in systemd_create_presets
Date: Tue, 14 Jan 2025 13:26:13 +0100
Message-ID: <20250114122613.3046925-9-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250114122613.3046925-4-arturkow2000@gmail.com>
References: <20250114122613.3046925-4-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 12:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209797

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
2.47.0


