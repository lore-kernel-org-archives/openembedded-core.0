Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B29C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:08:44 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.46612.1753909719044596794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QPKlDOIS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76b6422756fso350317b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753909718; x=1754514518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEI8MjL87gtl6xuR9TNW2CXxsIbbu3aRbpq5JGGaQDw=;
        b=QPKlDOIS4VDMdvwTRY1nW/qj57E3qWBdCuhxt67qdWpW0ozFN5dUccmmt+oVYVsJVd
         znoR7F2WTQZcNKbS5wFM/ORnrHQLj57ZwKlkZuOSlgNpcpNNWjJOBN3PSEnhEUBvMYwP
         QU/Kt7oVChWXTg0abhQSvmn0lVaaShED2iQHwkpd8+eCitwFVWn2k6uBYsTywnMjaL6x
         jgq/nIfkxrqLCQo0JiqlnDe1qE52FXA6s4o+ZB7VFdtvN4YHKYglo6Z6lZrT2KXJQMRc
         eHguR92lcDLxgrWhOQWkqMhWiCs/SKAHgk+M36Pp5F/nm5Bg+qOvq53L2a5V0cGWTJx2
         jeew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753909718; x=1754514518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEI8MjL87gtl6xuR9TNW2CXxsIbbu3aRbpq5JGGaQDw=;
        b=bbbzOvN6dZRTDbiQrtqJDhr/UJPXroBMI+iBC1vrfORztyOiPB4sSyY/9anXcEQ/8N
         xdjeBhAgm9+/LXsCHeUJxMv2/Wf5xBL2aTQRaChXIOgIqpcegIQq6bolAAiRdOzGkObX
         Fnheu6JfrKf/nfi+J9JCxINffnjtIzqoP7238u5uE0lNr9MfV3egX+0La7vBQgKOx9G4
         wqdfXUnYUAScrm1Y3Pn4r/dYayKFosgZ2rqnkYXgT01WGqUdWWOgcVbTJZ1Zum9n2Ms6
         kLwKKpjPNK7zd3T2a9C5ALocDGDY4DGyfPu3+TKekRAvMvI1Xv0Ulj2vGux3JNG3X1Eh
         eBAQ==
X-Gm-Message-State: AOJu0YybI05q2KVnfOMIIvWcfRnzHYVY86OrZQrwdCaDhJl7kAISDMCm
	tITkkZxfasM2ArN8W/DNOyXiwdLwib6/6tQ5aU+aXy2otFM/e7t1LWDQd1NU99xnYxKJ6ysp+KT
	gPw+G
X-Gm-Gg: ASbGncvSYG1WEEDCrlWVlah0phreqwKwkkJ+hmnaEqqzT34RmlR6T7ZYIbTvkPa89Dj
	wlZm4aVQXH7LSeYgmfJhi05kN3NBfzA7C9KU/7f3l4uH1xh7AxhtYd8clLu3pA3N7IlBFekZ8Q0
	1CHwqx6GOg8XPFq6gzBr7iL33NbfmcdeMhAvypxlu7yRg3ykh8ERoCkD+O6f0UHdpa9Cwf5180+
	gCytXQcWNBfjlCyKD40wUow235CJyrmE2tlwWkxlhdg9fNf8W6qBk1DYMf5mgsJ1bvWXth1Xzo6
	ckRr5dNyk36bTRy/GlrScgttPX5Ru7qy6Gfv24jz9XRQePv8SjYGgYwAj+h5NwfM+DBZnOZzSFa
	h9kKc0CMoax3S
X-Google-Smtp-Source: AGHT+IGTd9TsrvPvAPVJye+IFZ0ek/jNRGz8NDCPS+ka74xSRv3svG9RxmLIMdHYDEBulfNVHdU6Lg==
X-Received: by 2002:a05:6a20:1590:b0:230:f847:6586 with SMTP id adf61e73a8af0-23dc0e92791mr7373937637.29.1753909718111;
        Wed, 30 Jul 2025 14:08:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-769ee9ef1casm4929456b3a.3.2025.07.30.14.08.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:08:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 4/8] dpkg: fix CVE-2025-6297
Date: Wed, 30 Jul 2025 14:08:23 -0700
Message-ID: <aeb49aa2bab1b6ed633922c8df24aacb6a90dcb6.1753909581.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753909581.git.steve@sakoman.com>
References: <cover.1753909581.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221154

From: Hongxu Jia <hongxu.jia@windriver.com>

Backport a patch from upstream to fix CVE-2025-6297 [1]

[1] https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=98c623c8d6814ae46a3b30ca22e584c77d47d86b

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dpkg/dpkg/CVE-2025-6297.patch             | 130 ++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.22.11.bb    |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch b/meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch
new file mode 100644
index 0000000000..69f65d8077
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/CVE-2025-6297.patch
@@ -0,0 +1,130 @@
+From 04cde8cbda7044d950488dd47321eebef4edd99f Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Guillem Jover <guillem@debian.org>
+
+CVE: CVE-2025-6297
+Upstream-Status: Backport [https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=98c623c8d6814ae46a3b30ca22e584c77d47d86b]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/at/deb-content.at | 32 ++++++++++++++++++++++++++++++++
+ src/deb/info.c        | 20 ++++++++++++++++++++
+ 2 files changed, 52 insertions(+)
+
+diff --git a/src/at/deb-content.at b/src/at/deb-content.at
+index f475603f9..aa5582992 100644
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
+index afe79011f..a3d566379 100644
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
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
index 47a8d5d5ea..4992c14074 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.11.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
+           file://CVE-2025-6297.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
-- 
2.43.0


