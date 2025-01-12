Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F5FE7719C
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:40:33 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.36620.1736692499515932187
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:34:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j54/fBI2;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: arturkow2000@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso6733332a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 06:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736692497; x=1737297297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWsN5zIfL084OB2rcs87AqX0oiiorNISdvb7uMWAESY=;
        b=j54/fBI2QPjK0oAq3QWfzcDOxQ+w71h5dvlhGLxGWgzTQWCIloovJ80YQXMiY/Ys+n
         Yj9vWPmlEoVgARpqd/cJtfqNUHiWcrryY2pb3mD1iZ3O9JQunIaQ2x5nV0tCqQfEmCYg
         b9Qixq7WOfChVCEHOFXkf0rVvNfBwJMGcCqKsE9LKE6PFcp+KcIl2Ffv0goQuXLcczLj
         urbvRhIg3Znp3LHnv0+gQieHkZh+Ei2ob2sweGLa+uJ6YqNB17b4kmlJjhST+vwsM4Wy
         nleIbfxPtU4nXbfxheD8Z+ox2pn4sYwKti8aJOjRmK/NiFSXyTOLZ8vgtCe7paq/Tl6I
         8mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736692497; x=1737297297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWsN5zIfL084OB2rcs87AqX0oiiorNISdvb7uMWAESY=;
        b=usOafFniwVN30xUkn/thtLkVSFWZUrP1BQJ0G2ZF6m5eB+/wgX9SbY3exI4JYEIpFT
         gdL4qNP2PG5Bz5OjT/yrgk8MeHgW/zLfEhDvfFyjrcwA2RSblAjFQWiE9u1Etn3DhO5T
         QRgdj8tqSiXq59+pKRmeawbzNGSXRH9VQdvIdbI+UIytKKX4a86GUIFCV02DtrddMBmW
         oC+WylU6J7WrvARHBhRwDv97L+UefuBoG0xAH3lyAgc9cnbMI5KCmfr08BKDua74o6Ko
         zpBzFNPjFSpE76t4cgxqCOdoxXawCVrNMr2m0Kvh4D3uAI3lXjI40T4EkK+3Un8bD97I
         4QkQ==
X-Gm-Message-State: AOJu0Yw56uVRJs8cy9FArdUDjKWeAyr960pHrVJI6ITHnN/xZPNnZnt6
	YM0qQIZUPHxgVj4XW/h/cMvK72PETW/CPkQj5DnFnFcmPQbeCv8ZD7fE3w==
X-Gm-Gg: ASbGnctB7t+9pN5IeTUYwbjADBqpXxUcDHV/NsXh8x1TVajPWz9ESHMv8qIeldDN/I9
	AMAsaGPGno4bvSVEMLI4BALid7hFb2GdwanHtc544En1jBJdmRBpZ9PYB5wm6ugfzpzCxmibERa
	vr9rsgHzpR4ht0uhT9oXpYxqbnLtlvKo440b8zQpRbOqmZ2Su9W7wi2OtuTgo1+ejYPmia8mqYW
	hXdcwnVChnm2VMjeWQeOnfYIetKkRDXHpjgMA/IioS4tG6kI08KPbSXLsMgW9Qk
X-Google-Smtp-Source: AGHT+IGapDBnnEn102Gw3pR3taPL3WHiN18L/oY+WcYWDQ5XahuwRqWyCE3m03kyRRfidODy4m3lLA==
X-Received: by 2002:a05:6402:2815:b0:5d3:d8bb:3c5c with SMTP id 4fb4d7f45d1cf-5d972e095dfmr14839707a12.12.1736692497260;
        Sun, 12 Jan 2025 06:34:57 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:dec6:9e22:e5fb:f0d5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99d05bec4sm3207739a12.14.2025.01.12.06.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 06:34:56 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH 2/3] systemd.bbclass: add support for user presets
Date: Sun, 12 Jan 2025 15:31:40 +0100
Message-ID: <20250112143141.1300189-3-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250112143141.1300189-1-arturkow2000@gmail.com>
References: <20250112143141.1300189-1-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209687

Previously user units were causing build erros when listed in
SYSTEMD_SERVICE and SYSTEMD_AUTO_ENABLE was set.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 120 +++++++++++++++++++++-------
 1 file changed, 93 insertions(+), 27 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 4b4470b7b3..80f4da3bdf 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -37,17 +37,29 @@ if systemctl >/dev/null 2>/dev/null; then
 	fi
 
 	if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
+		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}; do
 			systemctl ${OPTS} enable "$service"
 		done
+
+		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}; do
+			systemctl --global ${OPTS} enable "$service"
+		done
 	fi
 
 	if [ -z "$D" ]; then
+		# Reload only system service manager
+		# --global for daemon-reload is not supported: https://github.com/systemd/systemd/issues/19284
 		systemctl daemon-reload
-		systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ] && \
+			systemctl preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
+
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}" ] && \
+			systemctl --global preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}
 
 		if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-			systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
+			# --global flag for restart is not supported by systemd (see above)
+			[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ] && \
+				systemctl --no-block restart ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
 		fi
 	fi
 fi
@@ -56,9 +68,14 @@ fi
 systemd_prerm() {
 if systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
-		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
+		# same as above, --global flag is not supported for stop
+		if [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ]; then
+			systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
+			systemctl disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
+		fi
 
-		systemctl disable ${SYSTEMD_SERVICE_ESCAPED}
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}" ] && \
+			systemctl --global disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}
 	fi
 fi
 }
@@ -67,6 +84,44 @@ fi
 systemd_populate_packages[vardeps] += "systemd_prerm systemd_postinst"
 systemd_populate_packages[vardepsexclude] += "OVERRIDES"
 
+def systemd_service_path(service, searchpaths, d):
+    path_found = ''
+
+    # Deal with adding, for example, 'ifplugd@eth0.service' from
+    # 'ifplugd@.service'
+    base = None
+    at = service.find('@')
+    if at != -1:
+        ext = service.rfind('.')
+        base = service[:at] + '@' + service[ext:]
+
+    for path in searchpaths:
+        if os.path.lexists(oe.path.join(d.getVar("D"), path, service)):
+            path_found = path
+            break
+        elif base is not None:
+            if os.path.exists(oe.path.join(d.getVar("D"), path, base)):
+                path_found = path
+                break
+
+    return path_found, base
+
+def systemd_service_exists(service, user, d):
+    searchpaths = [
+        oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
+        d.getVar("systemd_user_unitdir"),
+    ] if user else [
+        oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
+        d.getVar("systemd_system_unitdir"),
+    ]
+
+    path, _ = systemd_service_path(service, searchpaths, d)
+
+    return path != ''
+
+def systemd_filter_services(services, user, d):
+    return ' '.join(service for service in services.split() if systemd_service_exists(service, user, d))
+
 
 python systemd_populate_packages() {
     import re
@@ -147,7 +202,10 @@ python systemd_populate_packages() {
 
     # Check service-files and call systemd_add_files_and_parse for each entry
     def systemd_check_services():
-        searchpaths = [oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),]
+        searchpaths = [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
+        ]
         searchpaths.append(d.getVar("systemd_system_unitdir"))
         searchpaths.append(d.getVar("systemd_user_unitdir"))
         systemd_packages = d.getVar('SYSTEMD_PACKAGES')
@@ -155,24 +213,7 @@ python systemd_populate_packages() {
         # scan for all in SYSTEMD_SERVICE[]
         for pkg_systemd in systemd_packages.split():
             for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
-                path_found = ''
-
-                # Deal with adding, for example, 'ifplugd@eth0.service' from
-                # 'ifplugd@.service'
-                base = None
-                at = service.find('@')
-                if at != -1:
-                    ext = service.rfind('.')
-                    base = service[:at] + '@' + service[ext:]
-
-                for path in searchpaths:
-                    if os.path.lexists(oe.path.join(d.getVar("D"), path, service)):
-                        path_found = path
-                        break
-                    elif base is not None:
-                        if os.path.exists(oe.path.join(d.getVar("D"), path, base)):
-                            path_found = path
-                            break
+                path_found, base = systemd_service_path(service, searchpaths, d)
 
                 if path_found != '':
                     systemd_add_files_and_parse(pkg_systemd, path_found, service)
@@ -180,13 +221,38 @@ python systemd_populate_packages() {
                     bb.fatal("Didn't find service unit '{0}', specified in SYSTEMD_SERVICE:{1}. {2}".format(
                         service, pkg_systemd, "Also looked for service unit '{0}'.".format(base) if base is not None else ""))
 
-    def systemd_create_presets(pkg, action):
-        presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "system-preset/98-%s.preset" % pkg)
+    def _systemd_create_presets(pkg, action, prefix, searchpaths):
+        # Check there is at least one service of given type (system/user), don't
+        # create empty files.
+        needs_preset = False
+        for service in d.getVar('SYSTEMD_SERVICE:%s' % pkg).split():
+            path_found, _ = systemd_service_path(service, searchpaths, d)
+            if path_found != '':
+                needs_preset = True
+                break
+
+        if not needs_preset:
+            return
+
+        presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg))
         bb.utils.mkdirhier(os.path.dirname(presetf))
         with open(presetf, 'a') as fd:
             for service in d.getVar('SYSTEMD_SERVICE:%s' % pkg).split():
+                path_found, _ = systemd_service_path(service, searchpaths, d)
+                if path_found == '':
+                    continue
                 fd.write("%s %s\n" % (action,service))
-        d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd_unitdir"), "system-preset/98-%s.preset" % pkg))
+        d.appendVar("FILES:%s" % pkg, ' ' + oe.path.join(d.getVar("systemd_unitdir"), "%s-preset/98-%s.preset" % (prefix, pkg)))
+
+    def systemd_create_presets(pkg, action):
+        _systemd_create_presets(pkg, action, "system", [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "system"),
+            d.getVar("systemd_system_unitdir"),
+        ])
+        _systemd_create_presets(pkg, action, "user", [
+            oe.path.join(d.getVar("sysconfdir"), "systemd", "user"),
+            d.getVar("systemd_user_unitdir"),
+        ])
 
     # Run all modifications once when creating package
     if os.path.exists(d.getVar("D")):
-- 
2.47.0


