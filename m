Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.1606.1600126334020357204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 16:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WViPtt5L;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: andrey.z@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id i26so2294606ejb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 16:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SjYwUMhqYOCWoiux9gC5vSLnSyl0g69dp4oXTCSpguk=;
        b=WViPtt5LWhZNt1Oi5eAkxgBjyctlxkA2G6WxnUnq99hxzbED5w+808rVHSORrBMTkJ
         gcu4m9SyqISoEKYrPWD2L7xSVeY3+qqWUtB6iS8YA4bQMkEI7P1gYvsXhb2PQLtsVbkV
         nDs6Rnp55fb3NkFy2or2r5xTiPDfJlAfyawX4LLnYgKYoISLDJE0DgqByvMTftMeJXFh
         mqt0s9bdW/JwYP2j4OQq43TTz3j6Q7ts7FMIwCoogFw0YXoZVILE/vHrf271NKgZ9iUg
         X897mQPxBpKxSp5Rh8+r2YrudHD/DTpZ33W72HhE28pC+FCKoJDBaOTBZ1LDPlQbSVKf
         bdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SjYwUMhqYOCWoiux9gC5vSLnSyl0g69dp4oXTCSpguk=;
        b=Fi/vwgH/uzIKr+CZLLXra6n3HWf8tC/qSkSkIJ+hrOjB5YRGw8GON98kULT4zSChbG
         I5i8I7UQReC2BrkTlYkerdYkXTY1MLNj+0BpdMMmgJCguPQTHI+40MBb/J/OF1qZHrAc
         T2hBO+hGkjlTnnNuAYTyQ+K5amAgB8NUB5/cvPSfRu+d4BqaC06XqedxXuNHoHjMUF/C
         POU5xfzUTttSLjU2fXmw3subdSpbJq/NkuUk1dH6utEeNDEnvYMtZyxPR/7zXyG7Jld1
         AHgKW5P7YDbjeev642HDa7LI54CMBMbbkzZow9urXzVrLliXIhtAzpib2Lxd8TQH2a9G
         fizg==
X-Gm-Message-State: AOAM532tofSc6J6itt4IAluHrGoqd7P0ZERMTzsUcLfv8d27qBU6y9uz
	wUYIACSBhY3mNcpUxaqz0IAzjqcHT+M=
X-Google-Smtp-Source: ABdhPJzfst/CFL1UApnf+IdWeRoXjqGFifpa9B/41GvWsNyeczGtX1TmVO06WiZqxS2ISoC5d3+coA==
X-Received: by 2002:a17:906:4154:: with SMTP id l20mr18265462ejk.68.1600126332077;
        Mon, 14 Sep 2020 16:32:12 -0700 (PDT)
Return-Path: <andrey.z@gmail.com>
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id o11sm10211421edr.2.2020.09.14.16.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 16:32:11 -0700 (PDT)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.z@gmail.com>
Subject: [PATCH] insane: check for missing update-alternatives inherit
Date: Mon, 14 Sep 2020 23:31:59 +0000
Message-Id: <20200914233159.3771-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1

Add a package QA check to test if the recipe sets ALTERNATIVE variable
for any of its packages, and does not inherit update-alternatives class.
This causes the do_rootfs to fail since a proper alternative cannot be
created.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta/classes/insane.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c38720afdb..c6dff9659c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -27,6 +27,7 @@ WARN_QA ?= " libdir xorg-driver-abi \
             infodir build-deps src-uri-bad symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
             mime mime-xdg unlisted-pkg-lics unhandled-features-check \
+            missing-update-alternatives \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -989,6 +990,14 @@ def package_qa_check_unhandled_features_check(pn, d, messages):
         if var_set:
             package_qa_handle_error("unhandled-features-check", "%s: recipe doesn't inherit features_check" % pn, d)
 
+QARECIPETEST[missing-update-alternatives] = "package_qa_check_missing_update_alternatives"
+def package_qa_check_missing_update_alternatives(pn, d, messages):
+    # Look at all packages and find out if any of those sets ALTERNATIVE variable
+    # without inheriting update-alternatives class
+    for pkg in (d.getVar('PACKAGES') or '').split():
+        if d.getVar('ALTERNATIVE_%s' % pkg) and not bb.data.inherits_class('update-alternatives', d):
+            package_qa_handle_error("missing-update-alternatives", "%s: recipe defines ALTERNATIVE_%s but doesn't inherit update-alternatives. This might fail during do_rootfs later!" % (pn, pkg), d)
+
 # The PACKAGE FUNC to scan each package
 python do_package_qa () {
     import subprocess
-- 
2.17.1

