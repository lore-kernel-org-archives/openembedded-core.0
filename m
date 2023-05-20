Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E14C7EE2A
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 16:05:25 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.13401.1684598721228215861
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 09:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cgzoPbCO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-64d44b198baso410670b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 09:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684598720; x=1687190720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vf5g+ZtcTKH8bPjK2XJqO5Hwn0GOdjUkCmVjjZduh5Q=;
        b=cgzoPbCOLI7Gek8Bj28rHFlYUsxHOF+Lj+mZ/Rc5nTHzsMqdNozjM2LzCjv40Koxce
         YjbglhpeYOeh+UfJPNpVRFegIGsjbkPmEgclKgFlbB4xTWKFItm2V4vykPdLowyw4FVl
         N/WhDEV+DdnQFMOKLc8OXC3fozQLh/SRobPffieOGPNvhHppu5pzecMXqG7bGzkIqX/G
         USaxsM067MFgEuvQ61RtHUqyI4pqDjaasZ4N90tdGQ2MUrKFJc1vhaK5dv9XoRMUcT00
         o2p1o6vKwYbPLud6qQbD6Pgxq+jz9I8JHuE4sFRtD8rjt4Ra9JLEjHqFIOAKk3yXYfkP
         ittg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684598720; x=1687190720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vf5g+ZtcTKH8bPjK2XJqO5Hwn0GOdjUkCmVjjZduh5Q=;
        b=c2c5WOE8T0wdPDnfst0D9t2DmVIIMtjwbufjd36y16r4QlT43TgunHXwvrZfnPJtZe
         LI1N+dCiBP5kKrEpn0KADCQAhhBr5fPwVkh5HD54R4ZYqSwdnUu7o5BADVInEwY4FkJ/
         BQYOLic7T9zPtT98VUxotU91UrPtAh2bLOPHJ1AkQkaY8qSGaWujgG1CoqjZOW0RCaNY
         BmqK4k1Cm2wPURHgnubtQ7UpWpgje2Sjl2GBTitryu070YqQgk1O2r5GM4xJJ1bk12Hl
         ehzoujawL5FGIty513FrI0pxZhCuuPjpS0mP5XFTLYlwVBWLfWlv/3YepoQq/9gXu61Z
         Jp0g==
X-Gm-Message-State: AC+VfDxl0ehAeTt14ce6uwAlw82deYXxio9PrFS76ZZY+v7DLwxlwuyY
	IAPJbq/nrG9lDH9H+OYRmu6/mPlpLIVLYVy7MQM=
X-Google-Smtp-Source: ACHHUZ7spN/E4ckPBN5ci/ElrK2RnAxlvwsMn8Ntp5SGVgpaJVjqI93eE1RIA7+uPuU5dL2NA/3L4Q==
X-Received: by 2002:a05:6a00:1f05:b0:64d:411b:3a0c with SMTP id be5-20020a056a001f0500b0064d411b3a0cmr3451206pfb.14.1684598719799;
        Sat, 20 May 2023 09:05:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00642f1e03dc1sm1457790pfi.174.2023.05.20.09.05.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 09:05:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/11] git: fix CVE-2023-25652
Date: Sat, 20 May 2023 06:04:58 -1000
Message-Id: <6747482316b8f7839a09bf041d8c11b559f84b44.1684598568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684598568.git.steve@sakoman.com>
References: <cover.1684598568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 16:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181565

From: Hitendra Prajapati <hprajapati@mvista.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


