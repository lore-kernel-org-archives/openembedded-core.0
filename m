Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1D7C77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 07:14:48 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.43849.1684307685063236600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 00:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=XXKSDUVr;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-24de2954bc5so400586a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 00:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1684307684; x=1686899684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RLGbvRSJQiJ4NjCEQSVl0FP3d+9X2E1IUMLrA6PsySw=;
        b=XXKSDUVr42XIekVxgYCp/+JM5xnp+PllmPeb2kV6B8+4zqomvJo+yUewaU377QRtVx
         wBG2THAP7KNeJNdaZMOuoxEw8nJ7S9l9aURvjIOW3HCilWtswA6eSnMABqvRhmXV5le1
         Vuxwh1X83fhkBEp1734Iep3K0VCRaTY2M+wOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684307684; x=1686899684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLGbvRSJQiJ4NjCEQSVl0FP3d+9X2E1IUMLrA6PsySw=;
        b=KNbBxcTi5Fp8W8btCeUsfEZVcCoHebm+NbdmZ79TasXya7tR+QJYc9CxMiOkExFF4N
         ZTiFfx1/zYx9ngs1OOZBxPEONnTPojSwZmOq6tWEQOdSExjcnKkPlLITlGRRLI218HZe
         PCt8S8uJZGQJra4M+yw8cCMfGUVOAwCXTUTijG7ei4gnRp13d3wsM9pkubhgkXMnYW89
         Z+THueXok6ZaWrvl1AW4LYmqdx1p8xBzsSlDealbKu69dfN5jyv3Kq1O98wpsHZoZ0Y9
         jACD9k/rFEZxwBR/mehJ/sa5eBVigwPBWmGsJ5yfQ+G+RXn5TNN8IkuBGrnzb/37lG+8
         zoOg==
X-Gm-Message-State: AC+VfDx1kMlQ7bQIuVUbq1WpdLODxWSlOPcRYSxTWPj9nRqYRFKcQOAX
	ZN4c7TpN42ojyvMeZ4LW7X65aMFtAERdYXmSric=
X-Google-Smtp-Source: ACHHUZ7bCOK7xn2JOcSWVb5hSkUYTlG4esxFGQ7tuR/AgINAGST6yXLhuj+4mU5/XeOwx6iiEuPhuA==
X-Received: by 2002:a17:90a:8a8d:b0:24e:69e:71f with SMTP id x13-20020a17090a8a8d00b0024e069e071fmr38276734pjn.7.1684307684149;
        Wed, 17 May 2023 00:14:44 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.155])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902e9c400b001a673210cf4sm16698555plk.74.2023.05.17.00.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 00:14:43 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 17 May 2023 12:44:38 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCHv2] git: fix CVE-2023-25652
Date: Wed, 17 May 2023 12:44:37 +0530
Message-Id: <20230517071437.17612-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 07:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181448

Git is a revision control system. Prior to versions 2.30.9, 2.31.8, 2.32.7,
2.33.8, 2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1, by feeding
specially crafted input to `git apply --reject`, a path outside the working
tree can be overwritten with partially controlled contents (corresponding to
the rejected hunk(s) from the given patch). A fix is available in versions
2.30.9, 2.31.8, 2.32.7, 2.33.8, 2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3,
and 2.40.1. As a workaround, avoid using `git apply` with `--reject` when applying
patches from an untrusted source. Use `git apply --stat` to inspect a patch before
applying; avoid applying one that create a conflict where a link corresponding to
the `*.rej` file exists.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-25652

Upstream-Status: Backport from https://github.com/git/git/commit/9db05711c98efc14f414d4c87135a34c13586e0b

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../git/files/CVE-2023-25652.patch            | 94 +++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-25652.patch

diff --git a/meta/recipes-devtools/git/files/CVE-2023-25652.patch b/meta/recipes-devtools/git/files/CVE-2023-25652.patch
new file mode 100644
index 0000000000..d6b17a2b8a
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2023-25652.patch
@@ -0,0 +1,94 @@
+From 9db05711c98efc14f414d4c87135a34c13586e0b Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <johannes.schindelin@gmx.de>
+Date: Thu, 9 Mar 2023 16:02:54 +0100
+Subject: [PATCH] apply --reject: overwrite existing `.rej` symlink if it
+ exists
+
+The `git apply --reject` is expected to write out `.rej` files in case
+one or more hunks fail to apply cleanly. Historically, the command
+overwrites any existing `.rej` files. The idea being that
+apply/reject/edit cycles are relatively common, and the generated `.rej`
+files are not considered precious.
+
+But the command does not overwrite existing `.rej` symbolic links, and
+instead follows them. This is unsafe because the same patch could
+potentially create such a symbolic link and point at arbitrary paths
+outside the current worktree, and `git apply` would write the contents
+of the `.rej` file into that location.
+
+Therefore, let's make sure that any existing `.rej` file or symbolic
+link is removed before writing it.
+
+Reported-by: RyotaK <ryotak.mail@gmail.com>
+Helped-by: Taylor Blau <me@ttaylorr.com>
+Helped-by: Junio C Hamano <gitster@pobox.com>
+Helped-by: Linus Torvalds <torvalds@linuxfoundation.org>
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/9db05711c98efc14f414d4c87135a34c13586e0b]
+CVE: CVE-2023-25652
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ apply.c                  | 14 ++++++++++++--
+ t/t4115-apply-symlink.sh | 15 +++++++++++++++
+ 2 files changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/apply.c b/apply.c
+index 4f303bf..aa7111d 100644
+--- a/apply.c
++++ b/apply.c
+@@ -4531,7 +4531,7 @@ static int write_out_one_reject(struct apply_state *state, struct patch *patch)
+ 	FILE *rej;
+ 	char namebuf[PATH_MAX];
+ 	struct fragment *frag;
+-	int cnt = 0;
++	int fd, cnt = 0;
+ 	struct strbuf sb = STRBUF_INIT;
+ 
+ 	for (cnt = 0, frag = patch->fragments; frag; frag = frag->next) {
+@@ -4571,7 +4571,17 @@ static int write_out_one_reject(struct apply_state *state, struct patch *patch)
+ 	memcpy(namebuf, patch->new_name, cnt);
+ 	memcpy(namebuf + cnt, ".rej", 5);
+ 
+-	rej = fopen(namebuf, "w");
++	fd = open(namebuf, O_CREAT | O_EXCL | O_WRONLY, 0666);
++	if (fd < 0) {
++		if (errno != EEXIST)
++			return error_errno(_("cannot open %s"), namebuf);
++		if (unlink(namebuf))
++			return error_errno(_("cannot unlink '%s'"), namebuf);
++		fd = open(namebuf, O_CREAT | O_EXCL | O_WRONLY, 0666);
++		if (fd < 0)
++			return error_errno(_("cannot open %s"), namebuf);
++	}
++	rej = fdopen(fd, "w");
+ 	if (!rej)
+ 		return error_errno(_("cannot open %s"), namebuf);
+ 
+diff --git a/t/t4115-apply-symlink.sh b/t/t4115-apply-symlink.sh
+index 1acb7b2..2b034ff 100755
+--- a/t/t4115-apply-symlink.sh
++++ b/t/t4115-apply-symlink.sh
+@@ -125,4 +125,19 @@ test_expect_success SYMLINKS 'symlink escape when deleting file' '
+ 	test_path_is_file .git/delete-me
+ '
+ 
++test_expect_success SYMLINKS '--reject removes .rej symlink if it exists' '
++	test_when_finished "git reset --hard && git clean -dfx" &&
++
++	test_commit file &&
++	echo modified >file.t &&
++	git diff -- file.t >patch &&
++	echo modified-again >file.t &&
++
++	ln -s foo file.t.rej &&
++	test_must_fail git apply patch --reject 2>err &&
++	test_i18ngrep "Rejected hunk" err &&
++	test_path_is_missing foo &&
++	test_path_is_file file.t.rej
++'
++
+ test_done
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 8b864053eb..e64472ea28 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -29,6 +29,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://CVE-2023-22490-3.patch \
            file://CVE-2023-23946.patch \
            file://CVE-2023-29007.patch \
+           file://CVE-2023-25652.patch \
            "
 S = "${WORKDIR}/git-${PV}"
 
-- 
2.25.1


