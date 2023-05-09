Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84802C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:32:55 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.3052.1683671571784448099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=wfm1YuDf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64115eef620so45958644b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671571; x=1686263571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFdYxJsMgKXX+s4jmDU2zt/Davmm/8AoNeWL1scGzAg=;
        b=wfm1YuDfnA355OPtdq+ykJjxfQxExviJHHwyf/kS7dhSQyK+iLKL2P9BnTVzTZpDJx
         4VtAH0wsdLsdi2lVMy4dOQiwl6Vtdltt6l+JNYiRSLEcrNPMJLYgpF3HG9EeOZUxVTgb
         5QCuSCVns5IVHZCXI3WmaG3VY7MgY3x3veAJSSqdD/36yhY9jXcbyr2ts8/xT9rbqLVJ
         R9CqwX1hZRwSx79vEXwQ9MZmpnV8EVTjs0B8kRrbJQu0L/vd8LO3EDYzOQsBi7DOjWPD
         5GCQforDPzlz6byBvwJRXKpKoJMsh/U9wwJ5Jr8DhTTDifJP5FV/pu1NLV2o7x0SHUEd
         X6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671571; x=1686263571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFdYxJsMgKXX+s4jmDU2zt/Davmm/8AoNeWL1scGzAg=;
        b=g2VBllhVsaoUQf0r62NtCLPMsqjx8kjMi21op1k11JzcrqV7nFGsgtAEkpP5YGQDFR
         lMayXIHEjVswRr2li47Pz+50zva5rMBWTloBD/DhY8pOFWqttp4TS9Z81sAtjwsCTb8W
         Dw1mXYpPaw/0qZNdergaCGC8yhksM1QMocosUqPBJ/IgcF8vDL+9s2MUA+lK8YzQOK9z
         hl4maZn1bL5KgsAtRI81qh2/fOMskzlEgue56IoqC8X72OG0Mt2aKbZrUUsUDMJnHsZJ
         aS1ETtGsIyeYbcxS1H6XYmpuJeUZSsSokJAAo14SbFcKZF3fD0SHHYfdV07BiyshaoJZ
         fzuw==
X-Gm-Message-State: AC+VfDw1yC4r3Iw8XxinrcKV1u989FOnus+VlkzyaH5JITiIie5dfNeN
	fQZYcdOaCoUKA0UHouvxQHKI7w9n06FpetPOGYc=
X-Google-Smtp-Source: ACHHUZ4kQFgcyQLwBW0t4WOTkkJkTs7soP8pwFDJriHa8fQJefw7Qf98hwlxFcdU/JlgiAPK5X79jQ==
X-Received: by 2002:a05:6a00:2ea9:b0:63b:8963:d952 with SMTP id fd41-20020a056a002ea900b0063b8963d952mr18036001pfb.17.1683671570674;
        Tue, 09 May 2023 15:32:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.32.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:32:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/15] git: fix CVE-2023-25652
Date: Tue,  9 May 2023 12:32:28 -1000
Message-Id: <335ad8a6d795cd94b872370e44a033ce3fbf4890.1683671423.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181087

From: Archana Polampalli <archana.polampalli@windriver.com>

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

Upstream patches:
https://github.com/git/git/commit/9db05711c98efc14f414d4c87135a34c13586e0b

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../git/git/CVE-2023-25652.patch              | 94 +++++++++++++++++++
 meta/recipes-devtools/git/git_2.35.7.bb       |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2023-25652.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2023-25652.patch b/meta/recipes-devtools/git/git/CVE-2023-25652.patch
new file mode 100644
index 0000000000..825701eaff
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2023-25652.patch
@@ -0,0 +1,94 @@
+From 9db05711c98efc14f414d4c87135a34c13586e0b Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <Johannes.Schindelin@gmx.de>
+Date: Thu Mar 9 16:02:54 2023 +0100
+Subject: [PATCH] apply --reject: overwrite existing `.rej` symlink if it
+ exists
+
+   The `git apply --reject` is expected to write out `.rej` files in case
+   one or more hunks fail to apply cleanly. Historically, the command
+   overwrites any existing `.rej` files. The idea being that
+   apply/reject/edit cycles are relatively common, and the generated `.rej`
+   files are not considered precious.
+
+    But the command does not overwrite existing `.rej` symbolic links, and
+    instead follows them. This is unsafe because the same patch could
+    potentially create such a symbolic link and point at arbitrary paths
+    outside the current worktree, and `git apply` would write the contents
+    of the `.rej` file into that location.
+
+    Therefore, let's make sure that any existing `.rej` file or symbolic
+    link is removed before writing it.
+
+    Reported-by: RyotaK <ryotak.mail@gmail.com>
+    Helped-by: Taylor Blau <me@ttaylorr.com>
+    Helped-by: Junio C Hamano <gitster@pobox.com>
+    Helped-by: Linus Torvalds <torvalds@linuxfoundation.org>
+    Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+CVE: CVE-2023-25652
+Upstream-Status: Backport [https://github.com/git/git/commit/9db05711c98efc14f414d4c87135a34c13586e0b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ apply.c                  | 14 ++++++++++++--
+ t/t4115-apply-symlink.sh | 15 +++++++++++++++
+ 2 files changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/apply.c b/apply.c
+index fc6f484..47f2686 100644
+--- a/apply.c
++++ b/apply.c
+@@ -4584,7 +4584,7 @@ static int write_out_one_reject(struct apply_state *state, struct patch *patch)
+	FILE *rej;
+	char namebuf[PATH_MAX];
+	struct fragment *frag;
+-	int cnt = 0;
++	int fd, cnt = 0;
+	struct strbuf sb = STRBUF_INIT;
+
+	for (cnt = 0, frag = patch->fragments; frag; frag = frag->next) {
+@@ -4624,7 +4624,17 @@ static int write_out_one_reject(struct apply_state *state, struct patch *patch)
+	memcpy(namebuf, patch->new_name, cnt);
+	memcpy(namebuf + cnt, ".rej", 5);
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
+	if (!rej)
+		return error_errno(_("cannot open %s"), namebuf);
+
+diff --git a/t/t4115-apply-symlink.sh b/t/t4115-apply-symlink.sh
+index 65ac7df..e95e6d4 100755
+--- a/t/t4115-apply-symlink.sh
++++ b/t/t4115-apply-symlink.sh
+@@ -126,4 +126,19 @@ test_expect_success SYMLINKS 'symlink escape when deleting file' '
+	test_path_is_file .git/delete-me
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
+2.40.0
diff --git a/meta/recipes-devtools/git/git_2.35.7.bb b/meta/recipes-devtools/git/git_2.35.7.bb
index 199ac950fa..99d3d70683 100644
--- a/meta/recipes-devtools/git/git_2.35.7.bb
+++ b/meta/recipes-devtools/git/git_2.35.7.bb
@@ -11,6 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://fixsort.patch \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
            file://CVE-2023-29007.patch \
+           file://CVE-2023-25652.patch \
            "
 
 S = "${WORKDIR}/git-${PV}"
-- 
2.34.1


