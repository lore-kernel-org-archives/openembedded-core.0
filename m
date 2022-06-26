Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88981CCA47E
	for <webhook@archiver.kernel.org>; Sun, 26 Jun 2022 09:45:20 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.28510.1656236710569288406
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 02:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X4bkUcRg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 u12-20020a05600c210c00b003a02b16d2b8so3892648wml.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 02:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cqtsOSodEiF17P/liDvoKDu2XOdNE9Sk6cqx3wwfLZQ=;
        b=X4bkUcRggKdHxMdv7tp2dfFJ1CIv9IQBvokMGLQT1m+UrIhtt51k8iIqg+pf4Gqmwe
         X3LesPhIKItXi3bhdmDbLO2wnyuXQNP94ADKl3VWdkyL7v1jFCKYlnm0/nWZt5wEXWTD
         kA0B3sGOyX1MayvRWv89uRbGSr3JzkNLlCjtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cqtsOSodEiF17P/liDvoKDu2XOdNE9Sk6cqx3wwfLZQ=;
        b=ViEfSIKGx+zbuXEnHKdDi6Ns0idGpqH/SELgVdVJrP+TW/DgUP5dBeyf0QXMCMcW30
         N665IVT+iHaN5er2ge1R/VJAo5HR29yanRx5Pz3wYJD8tas99Zdpks++UO7/Oe7HD7nC
         uMF9XhKseHsYIt/4Ux24y8SvtUb2GSt93if9uyvnfhzyKrPaQQyDSORTKTFnVsiH3lil
         9XIW5G6g32fSsgTN8iSu2yK3KnX+06UcbQoeqUOefhw06/ud3lAp283FOOrHRgzaVOFB
         a0xckzrUBsBLwsDV2qP8XJvfyoFGtiNmTDlvGU98JPjkBuGua8HgXffa0eyaXMCaguMu
         ckoQ==
X-Gm-Message-State: AJIora98xwfOpdn9vyL8gfnNp43QP8mytXYCrX5OERypVmBP95DpumIH
	CD/APrW00EXfID1WLNp7Rai0CN3sypMbDg==
X-Google-Smtp-Source: 
 AGRyM1udun6RtsF4PjCQZd/EE2bcQUPjWA/MacnbMtPmDOgOsSsX3spDG/nWezMOCCeTTpWQMxHMPA==
X-Received: by 2002:a05:600c:1554:b0:39c:858f:6273 with SMTP id
 f20-20020a05600c155400b0039c858f6273mr8407838wmg.16.1656236708360;
        Sun, 26 Jun 2022 02:45:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2873:558:fe47:ee6f])
        by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm7305018wru.47.2022.06.26.02.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 02:45:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 1/4] package_manager: Change complementary package handling to
 not include soft dependencies
Date: Sun, 26 Jun 2022 10:45:03 +0100
Message-Id: <20220626094506.352336-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jun 2022 09:45:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167303

From: Ross Burton <ross.burton@arm.com>

We've some long standing bugs where the RDEPENDS from -dev packages causes
problems, e.g. dropbear and openssh components on an image working fine together
but then the SDK failing to build as the main openssh and dropbear packages
conflict with each other (pulled in by openssh-dev and dropbear-dev).

We propose changing the behavour of complementary package installation to
ignore RRECOMMENDS. If we then change the ${PN}-dev dependency on ${PN}
to a RRECOMMENDS, we can avoid many of the issues people run into yet still
have the desired behaviour of ${PN}-dev pulling in ${PN}.

This therefore changes the package manager code so that it doesn't follow
RRECOMMENDS for completementary package globs.

[RP: Added deb support]
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/package_manager/__init__.py     |  4 ++--
 meta/lib/oe/package_manager/deb/__init__.py | 10 +++++++---
 meta/lib/oe/package_manager/ipk/__init__.py |  4 +++-
 meta/lib/oe/package_manager/rpm/__init__.py |  4 ++--
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 80bc1a6bc6a..d3b45705ec4 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -266,7 +266,7 @@ class PackageManager(object, metaclass=ABCMeta):
         pass
 
     @abstractmethod
-    def install(self, pkgs, attempt_only=False):
+    def install(self, pkgs, attempt_only=False, hard_depends_only=False):
         """
         Install a list of packages. 'pkgs' is a list object. If 'attempt_only' is
         True, installation failures are ignored.
@@ -396,7 +396,7 @@ class PackageManager(object, metaclass=ABCMeta):
                 bb.note("Installing complementary packages ... %s (skipped already provided packages %s)" % (
                     ' '.join(install_pkgs),
                     ' '.join(skip_pkgs)))
-                self.install(install_pkgs)
+                self.install(install_pkgs, hard_depends_only=True)
             except subprocess.CalledProcessError as e:
                 bb.fatal("Could not compute complementary packages list. Command "
                          "'%s' returned %d:\n%s" %
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 86ddb130adf..b96ea0bad46 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -289,14 +289,18 @@ class DpkgPM(OpkgDpkgPM):
 
         self.deploy_dir_unlock()
 
-    def install(self, pkgs, attempt_only=False):
+    def install(self, pkgs, attempt_only=False, hard_depends_only=False):
         if attempt_only and len(pkgs) == 0:
             return
 
         os.environ['APT_CONFIG'] = self.apt_conf_file
 
-        cmd = "%s %s install --allow-downgrades --allow-remove-essential --allow-change-held-packages --allow-unauthenticated --no-remove %s" % \
-              (self.apt_get_cmd, self.apt_args, ' '.join(pkgs))
+        extra_args = ""
+        if hard_depends_only:
+            extra_args = "--no-install-recommends"
+
+        cmd = "%s %s install --allow-downgrades --allow-remove-essential --allow-change-held-packages --allow-unauthenticated --no-remove %s %s" % \
+              (self.apt_get_cmd, self.apt_args, extra_args, ' '.join(pkgs))
 
         try:
             bb.note("Installing the following packages: %s" % ' '.join(pkgs))
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 4cd3963111c..6fd2f021b68 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -337,7 +337,7 @@ class OpkgPM(OpkgDpkgPM):
 
         self.deploy_dir_unlock()
 
-    def install(self, pkgs, attempt_only=False):
+    def install(self, pkgs, attempt_only=False, hard_depends_only=False):
         if not pkgs:
             return
 
@@ -346,6 +346,8 @@ class OpkgPM(OpkgDpkgPM):
             cmd += " --add-exclude %s" % exclude
         for bad_recommendation in (self.d.getVar("BAD_RECOMMENDATIONS") or "").split():
             cmd += " --add-ignore-recommends %s" % bad_recommendation
+        if hard_depends_only:
+            cmd += " --no-install-recommends"
         cmd += " install "
         cmd += " ".join(pkgs)
 
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index b392581069c..d97dab32938 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -181,7 +181,7 @@ class RpmPM(PackageManager):
         os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
 
 
-    def install(self, pkgs, attempt_only = False):
+    def install(self, pkgs, attempt_only=False, hard_depends_only=False):
         if len(pkgs) == 0:
             return
         self._prepare_pkg_transaction()
@@ -192,7 +192,7 @@ class RpmPM(PackageManager):
 
         output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
                          (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
-                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == "1" else []) +
+                         (["--setopt=install_weak_deps=False"] if (hard_depends_only or self.d.getVar('NO_RECOMMENDATIONS') == "1") else []) +
                          (["--nogpgcheck"] if self.d.getVar('RPM_SIGN_PACKAGES') != '1' else ["--setopt=gpgcheck=True"]) +
                          ["install"] +
                          pkgs)
-- 
2.34.1


