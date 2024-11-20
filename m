Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1BBD63953
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:44 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.13947.1732111059956686276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=N2cJcT6e;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21269c8df64so10618595ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111059; x=1732715859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZR9szJTYHAA+5hHVaAaYJBZWXd/eZxs14F4rhxsofXQ=;
        b=N2cJcT6eTwbEX4+tVv46pj40osu2ENxyjT9mXwufzZ+nwFzWKDg3/my397YN3/ue8L
         sVqAcWx7FlBIUjbnNVs1++kI8rw1Q0lREdf85buw14/nOwMVuS0ZCzu/AkCG+3iF9JZF
         Ix5S4JeXcUFkN/6CMwI/8MeUooSMBOrNDp+nOePHtasgc/J5DoKhSbmx3HIk3yKH3gQV
         9rS5KyPdI2AFfAF3Z9OpK6K6DlAOOU5SKUzWZiSCouXW/Zs82CZPLHQMI6Jg5srPPyhC
         R30WV4kFYel6PgsMKuuDuwfPymZ1065BuFKpTC88/8pUHs0cidCAK9A80SQV4QPVjxYK
         +H9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111059; x=1732715859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZR9szJTYHAA+5hHVaAaYJBZWXd/eZxs14F4rhxsofXQ=;
        b=JAY1KMhPk3dKMR0i6WXm0+7XCjDnUMXM/nugzh95FMfOSk8wE1wcOVEuPYuGum4ojJ
         mUJ4fGqikxwF0jo1dixlEn7Ivg9+WiVWtPG8xMs3o2Y0seSwDaaAaTH9Hx2SE8/Upafp
         m3ivHnEtdHCOIDicjYaJQVoqJ5/6F5uUSgFRrv9fl38qrztPyuGiH0Isg9zIsABtAYSy
         GoLbqrsf4p/WPWEszcgLUoe0DTKcGPTEg+ERKNQkibhg8qWMe+P0X918hlqkOeI6HFGW
         adTkZr5sG5UvX81tuIWqvWiVZfjtIZmW0kvIh0o1mjQKlPc0FKwwUU8yRqcOSdXqlKcr
         PUqQ==
X-Gm-Message-State: AOJu0Yw+4gQMsVFyx5CkIXzsvgKLhd75iRNXQOoWintnryUDR0JP5h4n
	PWKaDrflaAIgrGT1Z4Cf6ZDmNKs0KAj8Ao/isQU49EQbKmzIiqNN/q/h0Q8NAFcU6xKyv/VjlOB
	Y
X-Google-Smtp-Source: AGHT+IFbvDM9ZUcMFGzkduUZ7Y96uCylISxYxq3F16H/r4NYP6yqo6nNB42McDf+WVgW+36QfcQd0w==
X-Received: by 2002:a17:903:230d:b0:211:ee35:830c with SMTP id d9443c01a7336-2126a34d311mr37551685ad.15.1732111059192;
        Wed, 20 Nov 2024 05:57:39 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 18/31] lib/oe/package-manager: skip processing installed-pkgs with empty globs
Date: Wed, 20 Nov 2024 05:56:50 -0800
Message-Id: <0f4100e40b97d2b349bcf261f6a0ee489d916629.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207442

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


