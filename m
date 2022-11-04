Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979FEC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:57 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.7183.1667530892267218729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3b9tDV1k;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id io19so3709862plb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIy+fVNOZRPSX2QTvqZvgM0UAdmsrNPVaF33Vsu7dtM=;
        b=3b9tDV1kyybT/sIJhDq5HKCughkuN+OXBMSMAAa44YYy5CipiDsxS+I8AHBx8p6xnD
         HhsL4NkFAO7NdMn+XrnJUop/g7/9WQVLZGcMrKGEOlyrgFx/+WYdYLB9mK5XyrQUK5Ey
         d5DoqPmgM1ZCkAJmC0tRYSHM/WyOO+qyB78nKIqgFtljGyMMoAXOVNlbKVaIw60A86f9
         nxK3h4B5yABngS3xGEWrNyTKzBJ0U2jNyveSLRQQNFiWXoZqdzgvI4vTUGkaxunLbmZ6
         eHicnyUG+lFlJe0FWidoKgfBp0YNNdPe0GbKi15Y6iSkny8xWmzg/dxH/jekFWM0cQTm
         /8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIy+fVNOZRPSX2QTvqZvgM0UAdmsrNPVaF33Vsu7dtM=;
        b=wNthNPlVD7il8LJGYxla4wQj2SRKwro96NdbWCAB4xlfNVR/odz1Cj00GanGRbFu+0
         U2MXzcWFgePJB2RU1yvcXuIGowK2YcVRPZfpz3VbyHgEUrM3ZUP+BLpKW5mcEX47lg4T
         XVpOMGR7zRu9LpJTbJYYqJGKoD8lNKPP1HsmkqzfF5RZuX7rNF62OvWXfnRQTxIo95rD
         m0BoMbXKjFpL66zsHz9XR4c/t3V5aH/kKrxkGjXDGaIiZ2DerOLRlKzjy5HDQUCNTbwU
         2P7SN/PH9kPcDUWCK+4J3wBYCQzSCvokcKfKsETexa07Bs0wxEuv0628wXxhrykLPe82
         nW/w==
X-Gm-Message-State: ACrzQf0bY1rVUyucGecud8BYq8rd0xLfOkVjKSOBcwxOkQ+9SG1wqhjv
	3/fAY/rBB28pJZqwSh24RtI25/qcLhFwpc66
X-Google-Smtp-Source: AMsMyM7f7EkHbiNxtDuinqWNJ7ju62PsYL09xYUwk7TZjSns2pZ0YJBPHTArCycDToFvvHsV8mti8g==
X-Received: by 2002:a17:90a:458b:b0:215:e103:e943 with SMTP id v11-20020a17090a458b00b00215e103e943mr7121609pjg.146.1667530913898;
        Thu, 03 Nov 2022 20:01:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/31] oe/packagemanager/rpm: don't leak file objects
Date: Thu,  3 Nov 2022 17:00:53 -1000
Message-Id: <f00ee38a0ce27b2c608d58553a954d041f340335.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172679

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28706c27680745c9f8df27713ce63ef5d611138c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/rpm/__init__.py | 33 +++++++++++++--------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index b392581069..97ef387f3b 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -96,11 +96,15 @@ class RpmPM(PackageManager):
         archs = ["sdk_provides_dummy_target"] + archs
         confdir = "%s/%s" %(self.target_rootfs, "etc/dnf/vars/")
         bb.utils.mkdirhier(confdir)
-        open(confdir + "arch", 'w').write(":".join(archs))
+        with open(confdir + "arch", 'w') as f:
+            f.write(":".join(archs))
+
         distro_codename = self.d.getVar('DISTRO_CODENAME')
-        open(confdir + "releasever", 'w').write(distro_codename if distro_codename is not None else '')
+        with open(confdir + "releasever", 'w') as f:
+            f.write(distro_codename if distro_codename is not None else '')
 
-        open(oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"), 'w').write("")
+        with open(oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"), 'w') as f:
+            f.write("")
 
 
     def _configure_rpm(self):
@@ -110,14 +114,17 @@ class RpmPM(PackageManager):
         platformconfdir = "%s/%s" %(self.target_rootfs, "etc/rpm/")
         rpmrcconfdir = "%s/%s" %(self.target_rootfs, "etc/")
         bb.utils.mkdirhier(platformconfdir)
-        open(platformconfdir + "platform", 'w').write("%s-pc-linux" % self.primary_arch)
+        with open(platformconfdir + "platform", 'w') as f:
+            f.write("%s-pc-linux" % self.primary_arch)
         with open(rpmrcconfdir + "rpmrc", 'w') as f:
             f.write("arch_compat: %s: %s\n" % (self.primary_arch, self.archs if len(self.archs) > 0 else self.primary_arch))
             f.write("buildarch_compat: %s: noarch\n" % self.primary_arch)
 
-        open(platformconfdir + "macros", 'w').write("%_transaction_color 7\n")
+        with open(platformconfdir + "macros", 'w') as f:
+            f.write("%_transaction_color 7\n")
         if self.d.getVar('RPM_PREFER_ELF_ARCH'):
-            open(platformconfdir + "macros", 'a').write("%%_prefer_color %s" % (self.d.getVar('RPM_PREFER_ELF_ARCH')))
+            with open(platformconfdir + "macros", 'a') as f:
+                f.write("%%_prefer_color %s" % (self.d.getVar('RPM_PREFER_ELF_ARCH')))
 
         if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
             signer = get_signer(self.d, self.d.getVar('RPM_GPG_BACKEND'))
@@ -164,13 +171,13 @@ class RpmPM(PackageManager):
                     repo_uri = uri + "/" + arch
                     repo_id   = "oe-remote-repo"  + "-".join(urlparse(repo_uri).path.split("/"))
                     repo_name = "OE Remote Repo:" + " ".join(urlparse(repo_uri).path.split("/"))
-                    open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'a').write(
-                             "[%s]\nname=%s\nbaseurl=%s\n%s\n" % (repo_id, repo_name, repo_uri, gpg_opts))
+                    with open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'a') as f:
+                        f.write("[%s]\nname=%s\nbaseurl=%s\n%s\n" % (repo_id, repo_name, repo_uri, gpg_opts))
             else:
                 repo_name = "OE Remote Repo:" + " ".join(urlparse(uri).path.split("/"))
                 repo_uri = uri
-                open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'w').write(
-                             "[%s]\nname=%s\nbaseurl=%s\n%s" % (repo_base, repo_name, repo_uri, gpg_opts))
+                with open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'w') as f:
+                    f.write("[%s]\nname=%s\nbaseurl=%s\n%s" % (repo_base, repo_name, repo_uri, gpg_opts))
 
     def _prepare_pkg_transaction(self):
         os.environ['D'] = self.target_rootfs
@@ -329,7 +336,8 @@ class RpmPM(PackageManager):
             return e.output.decode("utf-8")
 
     def dump_install_solution(self, pkgs):
-        open(self.solution_manifest, 'w').write(" ".join(pkgs))
+        with open(self.solution_manifest, 'w') as f:
+            f.write(" ".join(pkgs))
         return pkgs
 
     def load_old_install_solution(self):
@@ -363,7 +371,8 @@ class RpmPM(PackageManager):
         bb.utils.mkdirhier(target_path)
         num = self._script_num_prefix(target_path)
         saved_script_name = oe.path.join(target_path, "%d-%s" % (num, pkg))
-        open(saved_script_name, 'w').write(output)
+        with open(saved_script_name, 'w') as f:
+            f.write(output)
         os.chmod(saved_script_name, 0o755)
 
     def _handle_intercept_failure(self, registered_pkgs):
-- 
2.25.1


