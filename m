Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B37C7EE22
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 05:25:30 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.81904.1684128325696037445
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 22:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DuMb5BFR;
 spf=pass (domain: mvista.com, ip: 209.85.216.45, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2502346bea0so7645103a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 22:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1684128325; x=1686720325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3sVW6LYKaolwwEkOq9d3FY+zWQY3JQ6TJLgPV/hmZxQ=;
        b=DuMb5BFRx3px288tWrqGOHeqMx74j0WT0J7gqT9ElZQsxs1sW/nm+T0hqzX3fL+BEd
         w/T8od8qOOw+ugDjAAM46GAV9ZMT20dl7CJIAApUW1DjAmAABjNFr2PRjpA2EJnPl6Nk
         XgAZZiqzgG7mAgiBz23ARbsvoZirvefKuwBqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684128325; x=1686720325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sVW6LYKaolwwEkOq9d3FY+zWQY3JQ6TJLgPV/hmZxQ=;
        b=d7m/y9ywgr5nzE22+nw5Gynk3GcU4v6R9tguMoyPrRXR/mrYe1yJ5VPgqX4Fu8ARFL
         goJ0hpzEwVRO0qJwwgSoEhNwq5qSDqBLa71MaJdmWA+AUVeQUn5LCKzMc7BxESYRlZe4
         UAmdHP4Pt+SPTwFFq12s8DmC7pczqYg96stodWymE2UvEvKH8N8lY6VAqOYz1g4Q/TFT
         Nh8g/YOVIQ8aXIqjPhquP67k4FWfnZReWiLS1NeAGZ2JtzDHiUUzdAuXz0dItaPchO/y
         WGpTU3I8MF9Iofs/JCGjykTCIfE6COrZ2/VOSE29w5/1GuVFjr/zbee5Q5p1C9GaHuGR
         Vt6w==
X-Gm-Message-State: AC+VfDwL3ST3N8br9JvKdmvgFbM0f1izgkwL5TVDtmodW9SR8CoPrzmu
	cyjC3vX988Pd/pdQ/gnYkXBGqZ92FsAO0w8FFGE=
X-Google-Smtp-Source: ACHHUZ42xFPihnrSlGrRJHksc+OHRRtlr2+W2P6YaKLIZBRr6DP6IF+IfLCvZoaT5IF+3USOrMSzJg==
X-Received: by 2002:a17:90b:1992:b0:24e:55c3:89af with SMTP id mv18-20020a17090b199200b0024e55c389afmr33081202pjb.18.1684128324779;
        Sun, 14 May 2023 22:25:24 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.137])
        by smtp.gmail.com with ESMTPSA id qe15-20020a17090b4f8f00b00250e48c27cdsm8423780pjb.45.2023.05.14.22.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:25:24 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 15 May 2023 10:55:18 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] git: fix CVE-2023-25652
Date: Mon, 15 May 2023 10:55:17 +0530
Message-Id: <20230515052517.29549-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 05:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181228

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
 .../git/files/CVE-2023-25652.patch            | 95 +++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-25652.patch

diff --git a/meta/recipes-devtools/git/files/CVE-2023-25652.patch b/meta/recipes-devtools/git/files/CVE-2023-25652.patch
new file mode 100644
index 0000000000..9dde2626cc
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2023-25652.patch
@@ -0,0 +1,95 @@
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
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ apply.c                  | 14 ++++++++++++--
+ t/t4115-apply-symlink.sh | 15 +++++++++++++++
+ 2 files changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/apply.c b/apply.c
+index f8a046a..8253173 100644
+--- a/apply.c
++++ b/apply.c
+@@ -4504,7 +4504,7 @@ static int write_out_one_reject(struct apply_state *state, struct patch *patch)
+ 	FILE *rej;
+ 	char namebuf[PATH_MAX];
+ 	struct fragment *frag;
+-	int cnt = 0;
++	int fd, cnt = 0;
+ 	struct strbuf sb = STRBUF_INIT;
+ 
+ 	for (cnt = 0, frag = patch->fragments; frag; frag = frag->next) {
+@@ -4544,7 +4544,17 @@ static int write_out_one_reject(struct apply_state *state, struct patch *patch)
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
+index 872fcda..1e9e006 100755
+--- a/t/t4115-apply-symlink.sh
++++ b/t/t4115-apply-symlink.sh
+@@ -44,4 +44,19 @@ test_expect_success 'apply --index symlink patch' '
+ 
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
index 36318eed20..33da20cd26 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -28,6 +28,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://CVE-2023-22490-2.patch \
            file://CVE-2023-22490-3.patch \
            file://CVE-2023-23946.patch \
+           file://CVE-2023-25652.patch \
            "
 S = "${WORKDIR}/git-${PV}"
 
-- 
2.25.1


