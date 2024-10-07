Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F96ECF8870
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 20:39:59 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.2476.1728333594854659246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 13:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C/UR+o8+;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5389917ef34so5604228e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 13:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728333592; x=1728938392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nf1v+sTYX1X3toeM8F66N8QImkAA2TRjwVsHZvaY3nA=;
        b=C/UR+o8+eOdJ+OetpRr9dkpxD1SIPvFYpeS4ayYkLY4eP+ioXux5pxaMWqRxUs8093
         tb24qiOIRa4eTxbOuPhDmqx0d/Xe2jcmbdWsP/xqj2TYXT67JcsUqiRNDmSI5V3jFk8g
         99RxaleFqfQHQPNS511YULE70mXQf43DtXDmisMEiNB40kPyR8FrwK8QDXizkJZztUeX
         wRCvgIPikRC8wz8bggF43mtUmSEo4z3kxHipyVKErsuIylbqw66m4YtGb43RhwK9eeww
         +Qq+Q6gbKgQ78g8Qx8MKkEW8iAG9CtgQ4T/kU/sP9L0L9rGFotq8rtKYfl4uBEqu5rCc
         Lr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728333592; x=1728938392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nf1v+sTYX1X3toeM8F66N8QImkAA2TRjwVsHZvaY3nA=;
        b=k0RuJFWknzAjBYzGFggRflX85pzn0aoP9VV8px1ssMvOAiYJuaKLXOfxLQ3Xd2jYme
         oe+Ew3HYAzRxAH+GVpiSDKMGGDDf79jVd4A2aGaa1BPnb2naCzRnKnfDwPycEF8D1//N
         i802O41LoA3ThPkkIlGr+Hgd+9ItvBRetil6VsgfEN0GRLXvAV+84KBUE9ED6NkwcD3W
         qR2L52Qo791VIfmIkwqvRT+rGo2CpSRksPqe4TVSgPqidFEyrxOPLDj3o1ug+od47M+D
         nUNwIfIiSVNLVfy9NbkyBAsfcHTq3xocHxSr5+ru4YS3cubfqFHcEsCU4kjirw6nDUvO
         Kh9Q==
X-Gm-Message-State: AOJu0YxtSyweJtv47dy+cuG+Gnb6FXi8k157nStZbD69c/ZQDWUuCgap
	sjC0BD1MOok6zMdL6aEVcFuCTSYOM9utatEjMHeMsvkjXP4M1A63dTpuUQ==
X-Google-Smtp-Source: AGHT+IERU6VhJAo+iPFKTZnp/UguhbgiOyC0PQXEh/GGtUuhJkm1dMHcAcKfbo/O/D5x16zFXGGIJQ==
X-Received: by 2002:a05:6512:33ce:b0:536:741a:6bad with SMTP id 2adb3069b0e04-539ab85b43cmr6318995e87.12.1728333592144;
        Mon, 07 Oct 2024 13:39:52 -0700 (PDT)
Received: from nova.frosteyes.dk (0x57346aa5.static.cust.fastspeed.dk. [87.52.106.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff23360sm925194e87.208.2024.10.07.13.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 13:39:51 -0700 (PDT)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [master][scarthgap][PATCH v3] lib/oe/package-manager: skip processing installed-pkgs with empty globs
Date: Mon,  7 Oct 2024 22:39:46 +0200
Message-ID: <20241007203946.684938-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 20:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205279

We can skip processing the installed-pkgs file if globs is empty.
This is the case if self.d.getVar for IMAGE_INSTALL_COMPLEMENTARY
returns an empty string. If globs is an empty string the result from
processing with empty glob in oe-pkgdata-util will always be 0 packages
to install.

Instead of return early on this we just skip and still generate the
locale archive if needed.

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
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


