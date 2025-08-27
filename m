Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BB5CA0FFB
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:19 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.6602.1756330213934376726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I4UEUQ9A;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e4f2e4c40so348741b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330213; x=1756935013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGMSBQY1LOzlJXcI61QgB1/I2ULe0p7TCjebJ3zTvUM=;
        b=I4UEUQ9AT+uOZs1sEyIjVMcdUloEiVzbNGPeROceY4lrXj+Da6zVWz12+QrwKZoccB
         B+jVznv57OlLEjW0fZUSOMlzLNFzCVU7xz963ixMFEXpoAg2l9t0PNFgYSgJ5b07fN77
         Weeg94YR26gScd2TnpS5NBP6A4H6chgW85LOCO2dM0KXaB1ozuP6YcjqVboDIZoZ/acJ
         HnNtXxu/pchct2aOLATdPrI6J2iMFQr7TIg9IF4nsImI743edhhxVyy26vAxK70++Nfn
         T5emQkAOxC1XUeV73t64JfLb+5euMVy/hQsu98MR5g7vvVNLOCYvCdg+Du/wwYyP6x+p
         7xZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330213; x=1756935013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGMSBQY1LOzlJXcI61QgB1/I2ULe0p7TCjebJ3zTvUM=;
        b=ZCREqY8KtR6UuHxz1Yr7p25iBF4Iv2ifRIC3HZszqJQoMJwdFIXqo6QtZWKVeBZs6T
         4B6wO90MA1ML+OjNJztpcgVbkfQPenm/xFDbnkBUrbEdYR5bK0Gqt4LlQVBUwXeZdhtL
         YdxcaTW6LGWqyAdS5gxvOggTDhqAwwmAdog6xGOfv1PtB8gJpM7HpQsRBjPc/Sm1mU8e
         KqEWLKumwhjs2wUnMvgNmQbznyZ+P2+cB2WxlXQSg+fTemO51hSf1L0q7gEUdI+FcVrO
         XoP/AthykDIXAe83TNqYVYi30V5VHji6MAO1tN1soepoGYxzYbUBjgNKVdJRR3BZOMZ7
         GLZw==
X-Gm-Message-State: AOJu0YwZXEf2GfhxP9AkBUXUpXgS/2rCzK27wf+Dgk6YrRkBjRqMcs6g
	2O05hexI5o9Zl9cEYT2obytXClCvTTiXpj1WFn0zAI0EudPNyeXOuFwUOQRNu7mrSJ09qt40toc
	wxlj9
X-Gm-Gg: ASbGncuCWTOxy/Vl3p34Qyw9csZ8Yh8HWPW6klh273WIGiTB7J9ACnM5ilBquScuBNr
	J9rOnU6RxNMstfbTizX8qJBckfwlasEI/DYRMkBXxrxaa4hBOeNyp6qDuEjOiNmTnGBoYBDw8fO
	0ZxYAStSJ24++YXMdFPfpEmKk1htW79oxqjdeKfjoCHP3OvaOZK4w5y9OWTZAXAbN28tLM2vDFD
	+LNZdc2I+1Dbi7+Kig0FPrJjT5lkyJGh7kuFuNYA4+j79pb87NSPnPLJiTB9OGxe/f8Rcfp1zRA
	bTFZQ+jhxPUlhTOn2+PI9R5A1oStMJd7yiH0k/WQduTPrypitFDwbcLSeBuPBl1RrTQiFWsBcsf
	t7InEC/JIM27JTw==
X-Google-Smtp-Source: AGHT+IGdp4U+1LiTYe4MsWRZhq1fDqFS0Pw+TsYh8T03M1F5mqEotcL7+Ax8ZnAqnNB8A01j1nS1Lg==
X-Received: by 2002:a05:6a20:a124:b0:240:5b1:e157 with SMTP id adf61e73a8af0-24340d1241bmr27770978637.32.1756330213067;
        Wed, 27 Aug 2025 14:30:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/33] dpkg: patch CVE-2025-6297
Date: Wed, 27 Aug 2025 14:29:18 -0700
Message-ID: <859e5a47744a91b40d5d12c46ff4d8657ef5cf6e.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222519

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1] from 1.22.x branch.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6297

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dpkg/dpkg/CVE-2025-6297.patch             | 125 ++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.22.0.bb     |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch b/meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch
new file mode 100644
index 0000000000..537f77643b
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch
@@ -0,0 +1,125 @@
+From 98c623c8d6814ae46a3b30ca22e584c77d47d86b Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Sat, 7 Jun 2025 14:17:07 +0200
+Subject: [PATCH] dpkg-deb: Fix cleanup for control member with restricted
+ directories
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When extracting a control member into a temporary directory, which is
+documented as being a safe operation even on untrusted data, the code
+in charge of the temporary directory cleanup does not sanitize the
+directory permissions, which is then unable to perform the «rm -rf»
+when running as a non-root user, leaving temporary files behind.
+
+Given automated and repeated execution of dpkg-deb commands on
+adversarial .deb packages or with well compressible files, placed
+inside a directory with permissions not allowing removal by a non-root
+user, this can end up with a DoS scenario due to causing disk quota
+exhaustion or disk full conditions.
+
+This is considered a minor issue, given the required conditions to
+trigger a problem with it, but an issue non the less given the
+documented security guarantees of the command. This has been an
+issue since the initial commit introducing dpkg-deb in C.
+
+We use an existing string for the error message to avoid new strings
+needing translation for stable branches, which make the error message
+less descriptive than what would be ideal. This will be improved in
+git HEAD.
+
+Reported-by: zhutyra on HackerOne
+Fixes: CVE-2025-6297
+Stable-Candidate: 1.20.x 1.21.x 1.22.x
+(cherry picked from commit ed6bbd445dd8800308c67236ba35d08004c98e82)
+(cherry picked from commit 02ad0532bd490cbc95b344f670e622a38eecfbf6)
+(cherry picked from commit d8a76551e22abe76eefd7fef5c7f51f4118eb40e)
+
+CVE: CVE-2025-6297
+Upstream-Status: Backport [https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=98c623c8d6814ae46a3b30ca22e584c77d47d86b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/at/deb-content.at | 32 ++++++++++++++++++++++++++++++++
+ src/deb/info.c        | 20 ++++++++++++++++++++
+ 2 files changed, 52 insertions(+)
+
+diff --git a/src/at/deb-content.at b/src/at/deb-content.at
+index a192c9493..d48eed72b 100644
+--- a/src/at/deb-content.at
++++ b/src/at/deb-content.at
+@@ -127,3 +127,35 @@ newline'
+ ])
+ 
+ AT_CLEANUP
++
++AT_SETUP([dpkg-deb .deb extraction cleanup])
++AT_KEYWORDS([dpkg-deb deb extraction])
++
++DPKG_GEN_CONTROL([pkg-ctrl-dir-perms])
++AT_CHECK([
++dpkg-deb --root-owner-group -Znone -b pkg-ctrl-dir-perms
++DPKG_AR_EXTRACT([pkg-ctrl-dir-perms.deb])
++dpkg-deb -R pkg-ctrl-dir-perms.deb pkg-ctrl-dir-perms-bad
++mkdir -p pkg-ctrl-dir-perms-bad/DEBIAN/rx-subdir/inner
++touch pkg-ctrl-dir-perms-bad/DEBIAN/rx-subdir/inner/file
++chmod 0555 pkg-ctrl-dir-perms-bad/DEBIAN
++chmod 0555 pkg-ctrl-dir-perms-bad/DEBIAN/rx-subdir
++chmod 0555 pkg-ctrl-dir-perms-bad/DEBIAN/rx-subdir/inner
++$TAR cf control.tar --format=gnu --sort=name --mtime @0 --clamp-mtime --owner root:0 --group root:0 -C pkg-ctrl-dir-perms-bad/DEBIAN .
++DPKG_AR_GEN([pkg-ctrl-dir-perms.deb], [debian-binary control.tar data.tar])
++], [0], [dpkg-deb: building package 'pkg-ctrl-dir-perms' in 'pkg-ctrl-dir-perms.deb'.
++])
++AT_CHECK([
++dpkg-deb --ctrl-tarfile pkg-ctrl-dir-perms.deb | $TAR tvf -
++], [0], [dr-xr-xr-x root/root         0 1970-01-01 00:00 ./
++-rw-r--r-- root/root       176 1970-01-01 00:00 ./control
++dr-xr-xr-x root/root         0 1970-01-01 00:00 ./rx-subdir/
++dr-xr-xr-x root/root         0 1970-01-01 00:00 ./rx-subdir/inner/
++-rw-r--r-- root/root         0 1970-01-01 00:00 ./rx-subdir/inner/file
++])
++# Check that we can cleanup the temporarily extracted control.tar member.
++AT_CHECK([
++dpkg-deb -I pkg-ctrl-dir-perms.deb
++], [0], [ignore])
++
++AT_CLEANUP
+diff --git a/src/deb/info.c b/src/deb/info.c
+index f3d57e2ce..396ea4d14 100644
+--- a/src/deb/info.c
++++ b/src/deb/info.c
+@@ -45,14 +45,34 @@
+ #include <dpkg/pkg-format.h>
+ #include <dpkg/buffer.h>
+ #include <dpkg/path.h>
++#include <dpkg/treewalk.h>
+ #include <dpkg/options.h>
+ 
+ #include "dpkg-deb.h"
+ 
++static int
++cu_info_treewalk_fixup_dir(struct treenode *node)
++{
++  const char *nodename;
++
++  if (!S_ISDIR(treenode_get_mode(node)))
++    return 0;
++
++  nodename = treenode_get_pathname(node);
++  if (chmod(nodename, 0755) < 0)
++    ohshite(_("error setting permissions of '%.255s'"), nodename);
++
++  return 0;
++}
++
+ static void cu_info_prepare(int argc, void **argv) {
+   char *dir;
++  struct treewalk_funcs cu_info_treewalk_funcs = {
++    .visit = cu_info_treewalk_fixup_dir,
++  };
+ 
+   dir = argv[0];
++  treewalk(dir, TREEWALK_NONE, &cu_info_treewalk_funcs);
+   path_remove_tree(dir);
+   free(dir);
+ }
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
index 7eaae9f22e..41f5123508 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
            file://0001-dpkg-Support-muslx32-build.patch \
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
+           file://CVE-2025-6297.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
-- 
2.43.0


