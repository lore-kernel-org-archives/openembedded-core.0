Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC54D1F9B7
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:20 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.4740.1729018279904196478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Hbs8aBPV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e5130832aso2143477b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018279; x=1729623079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZR9szJTYHAA+5hHVaAaYJBZWXd/eZxs14F4rhxsofXQ=;
        b=Hbs8aBPVc+Rlcy0KBSSGkCVRqPQJWEZvu3ZDi3uDb0l6jSN+GnvLU0czD+d4ZXOQKN
         KYnJ25IRKh/8aVwK+zJIOMFPMH8JO6Sv+DZNBVVO8dS691XeUSyA3VBrBbHXnkZqK+AV
         R+jsAjh8y/JDqA1hwVfKNWWm3N1NdnSU3ktt/uPbOiYqj4GJ9DBCCLHdoia6YKYDdxf3
         aiSBLbPoqUzDYn0k89KN+h0ppQ7Gh9K39MgZp6ZCcBKnRwI5vfCQPYUHAPmpngE+suT+
         FVeNY8oaRhl6RBxgfo9VmLFgXRyAE/QiVzlU9NK9fBjcWwrVtfcxgCn01+3C0UjTMDUu
         +lBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018279; x=1729623079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZR9szJTYHAA+5hHVaAaYJBZWXd/eZxs14F4rhxsofXQ=;
        b=IdqyHaHBHwcAC+i+TWILCNF4vxJA1izpn9p5zta/t48qCeNOFO67gVlHXUkfhqiJPf
         UrrPX46TI197qDxMDbnzlSMlzmdg1IxfJ+W4Ts9dA+aLMLIFR9/hEGXguEuEXFoNy9yv
         dyrxVymnpapSdzC6R6gbZwQEUpSjrHftpgx/bqXoS+1onNcAoJFWgcQuGYhRSBRcFwIu
         R4zJKu04OiImJ7L6F41uPZolyrfyVXvg76z0FiCTYLPzlzLGqs3jwl2iK6t+NaA4u1ax
         VoO6BcvDLgIsC3BlrOwr4ZkY/UucY0BqKxafj3v/Sa6fkZQ9UNeSPc5vpvlzqohaexED
         8zqw==
X-Gm-Message-State: AOJu0YzqJ7bjy+reCPpz1jSjUjCjrWv0yZxNov/qpPvGb+App4+IRHVo
	UD8bNaJFG5SfmcjSeIm/z4IVBSbqGDSgFy44ryuJyCwnm9pPVHhKx3CBJt2aKkUQpUsnJV1mEZN
	D
X-Google-Smtp-Source: AGHT+IGkEpQU5XyzYtNxRrQXR9Tp3pYKMT5SCY/onsDp6TBswnISogV66QHI8Di+HViznDprWIb/5A==
X-Received: by 2002:aa7:88d1:0:b0:71e:4a51:2007 with SMTP id d2e1a72fcca58-71e4c13daadmr22789740b3a.4.1729018279039;
        Tue, 15 Oct 2024 11:51:19 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/18] lib/oe/package-manager: skip processing installed-pkgs with empty globs
Date: Tue, 15 Oct 2024 11:50:47 -0700
Message-Id: <f944a1be484378c733d7fd835dc17e210f1c2705.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205934

From: Claus Stovgaard <claus.stovgaard@gmail.com>

We can skip processing the installed-pkgs file if globs is empty.
This is the case if self.d.getVar for IMAGE_INSTALL_COMPLEMENTARY
returns an empty string. If globs is an empty string the result from
processing with empty glob in oe-pkgdata-util will always be 0 packages
to install.

Instead of return early on this we just skip and still generate the
locale archive if needed.

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 160c45c83d5addf01e4834cf896af871bd6fca7f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/__init__.py | 76 ++++++++++++-------------
 1 file changed, 37 insertions(+), 39 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index d3b2317894..2100a97c12 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -365,45 +365,43 @@ class PackageManager(object, metaclass=ABCMeta):
                 for complementary_linguas in (self.d.getVar('IMAGE_LINGUAS_COMPLEMENTARY') or "").split():
                     globs += (" " + complementary_linguas) % lang
 
-        if globs is None:
-            return
-
-        # we need to write the list of installed packages to a file because the
-        # oe-pkgdata-util reads it from a file
-        with tempfile.NamedTemporaryFile(mode="w+", prefix="installed-pkgs") as installed_pkgs:
-            pkgs = self.list_installed()
-
-            provided_pkgs = set()
-            for pkg in pkgs.values():
-                provided_pkgs |= set(pkg.get('provs', []))
-
-            output = oe.utils.format_pkg_list(pkgs, "arch")
-            installed_pkgs.write(output)
-            installed_pkgs.flush()
-
-            cmd = ["oe-pkgdata-util",
-                   "-p", self.d.getVar('PKGDATA_DIR'), "glob", installed_pkgs.name,
-                   globs]
-            exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
-            if exclude:
-                cmd.extend(['--exclude=' + '|'.join(exclude.split())])
-            try:
-                bb.note('Running %s' % cmd)
-                proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-                stdout, stderr = proc.communicate()
-                if stderr: bb.note(stderr.decode("utf-8"))
-                complementary_pkgs = stdout.decode("utf-8")
-                complementary_pkgs = set(complementary_pkgs.split())
-                skip_pkgs = sorted(complementary_pkgs & provided_pkgs)
-                install_pkgs = sorted(complementary_pkgs - provided_pkgs)
-                bb.note("Installing complementary packages ... %s (skipped already provided packages %s)" % (
-                    ' '.join(install_pkgs),
-                    ' '.join(skip_pkgs)))
-                self.install(install_pkgs, hard_depends_only=True)
-            except subprocess.CalledProcessError as e:
-                bb.fatal("Could not compute complementary packages list. Command "
-                         "'%s' returned %d:\n%s" %
-                         (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+        if globs:
+            # we need to write the list of installed packages to a file because the
+            # oe-pkgdata-util reads it from a file
+            with tempfile.NamedTemporaryFile(mode="w+", prefix="installed-pkgs") as installed_pkgs:
+                pkgs = self.list_installed()
+
+                provided_pkgs = set()
+                for pkg in pkgs.values():
+                    provided_pkgs |= set(pkg.get('provs', []))
+
+                output = oe.utils.format_pkg_list(pkgs, "arch")
+                installed_pkgs.write(output)
+                installed_pkgs.flush()
+
+                cmd = ["oe-pkgdata-util",
+                    "-p", self.d.getVar('PKGDATA_DIR'), "glob", installed_pkgs.name,
+                    globs]
+                exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
+                if exclude:
+                    cmd.extend(['--exclude=' + '|'.join(exclude.split())])
+                try:
+                    bb.note('Running %s' % cmd)
+                    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+                    stdout, stderr = proc.communicate()
+                    if stderr: bb.note(stderr.decode("utf-8"))
+                    complementary_pkgs = stdout.decode("utf-8")
+                    complementary_pkgs = set(complementary_pkgs.split())
+                    skip_pkgs = sorted(complementary_pkgs & provided_pkgs)
+                    install_pkgs = sorted(complementary_pkgs - provided_pkgs)
+                    bb.note("Installing complementary packages ... %s (skipped already provided packages %s)" % (
+                        ' '.join(install_pkgs),
+                        ' '.join(skip_pkgs)))
+                    self.install(install_pkgs, hard_depends_only=True)
+                except subprocess.CalledProcessError as e:
+                    bb.fatal("Could not compute complementary packages list. Command "
+                            "'%s' returned %d:\n%s" %
+                            (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
         if self.d.getVar('IMAGE_LOCALES_ARCHIVE') == '1':
             target_arch = self.d.getVar('TARGET_ARCH')
-- 
2.34.1


