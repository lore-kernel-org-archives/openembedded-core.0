Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7ED2CA0FF0
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:44:56 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.65035.1756215891619856485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=s8w0Cpve;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-246181827e9so46931805ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215891; x=1756820691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTtTCizdLzpXXA1Hb3ysNHMVCySoUzceauVF2GPKoo0=;
        b=s8w0Cpve4OEMyPwEHxfhPrzzxby9aT0UjD1FdVYec31AXEJO/yNPj9ROjUAUlgnOxx
         XEW9pn3ViqkARdF4hwn17F6ObKZWg5aM5WpZZDjwpMRZFVD/2arggQIqFzBcDt9FnzYQ
         5aWLw9kmuY71uXz5//3Lnjx/SV2j1442QO47z/K2yOUmGapVoRcskHgltOLHfnlZB2Gh
         gkieRK7Q3CWQ49CQs0LPYCogdV4HlldgLiXRxehvdrsIAkMAEUqGnfVkwYVrNgnCt9NU
         hQe42GiUXxYGsFIu3R8T5Aaic8KZekMip8DR4Oz3bZrR5hxzpVb3eOn8e/OF/x4LFba4
         JSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215891; x=1756820691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTtTCizdLzpXXA1Hb3ysNHMVCySoUzceauVF2GPKoo0=;
        b=p7oHGUBHMYPS5d18Ui0SWtgkT3aauKBhXQ+pfk0PnrGDmys8ZYlIb2QMxuCq1ef0/3
         xjDXW2P/uv07ZV6XHgU8OC6HNi/xR5ZQ1A2bW5JkkFAjtKnGQAEV8DH1EA3wW0utYJfV
         9XB9hpZ80Cr5mBaNhqtUiq3nwxpTDsxncCqQjVvKdrMtgDB1/WgIliin/5w07RMHqZD/
         XB2dqyiCaRPmaL9Rw2vEvrxl6Pgn44OXpdKesd/NLfdZ+EtGgkEik6azIW9Eu0CbTiN/
         SiS6E309gMs6F84jvZ8CUiwVdWc2sjPc+SQPGYtiae/aRVRJGynj9h6XVpUKWyzM6jJU
         SI0Q==
X-Gm-Message-State: AOJu0Yw/Ja0DiX8ydyDQMAoXsSiCdUiXXdkAPo2RyXhe2UH4AdDip/LF
	lTTEKAE9ZJ5ejU7qWh4Z9Z36B7+8zxxKxq+ZDDKpXm1crFuxvHUfV/SnfAe56rIa7nqPf3+PEhi
	zNj1K
X-Gm-Gg: ASbGncvq9xLHBrjCr32x0Vx+hAtmUW6v0DxwpLYEB0pUjqrGV7w0KhfxkVr4Thu86jo
	MHEop7bqAlFWWlzKXBwpSynueBxwW5KmIr90r+MYGJHRO+o/1fvSmXjE31HPPJt2sI3C8TZqLJZ
	BXaiwLnm8vLnhqHksZd0AGkzJLYSiE5FMkk6q+D8MtHlgp529WGpP6MX5PxC9fGKHiz9HhV6X5G
	w9AZ0HhJeWiEoJ18RfhDPjKh6/zaOykHs3z81ywCBtlgPECjDL1dZ/eKP8qaCAyX0VuretwU4/N
	m5Kdn9QZPauGVfqihj8+0bb7dR2V5KnX161lGJqZXeu74PGKGxrio5HQy4ELn0W67t6KqMWycb3
	tWTx+PKorV8TgFQ==
X-Google-Smtp-Source: AGHT+IEMJsJZE3nwlgWYangCPKiMSeEauPUsK1AUjo+GHzTUbTTBRIrCv5fM2YUsieWhFPWT0mJ+MA==
X-Received: by 2002:a17:903:1b4e:b0:246:42eb:5795 with SMTP id d9443c01a7336-24642eb57f8mr198142135ad.30.1756215890692;
        Tue, 26 Aug 2025 06:44:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779fa9sm96941595ad.27.2025.08.26.06.44.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:44:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] dpkg: patch CVE-2025-6297
Date: Tue, 26 Aug 2025 06:44:30 -0700
Message-ID: <aaf58c4ad69203a6437362ef130e8ed3ce267e81.1756215756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215756.git.steve@sakoman.com>
References: <cover.1756215756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222469

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1] from 1.22.x branch.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6297

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../dpkg/dpkg/CVE-2025-6297.patch             | 125 ++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.21.4.bb     |   1 +
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
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
index 7ef6233ee4..27e835a288 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
            file://0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch \
+           file://CVE-2025-6297.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
-- 
2.43.0


