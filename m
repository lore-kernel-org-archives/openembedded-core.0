Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF37C531C7
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5472.1784741052975332234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T4qMDpTc;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954aff6088so37724325e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741051; x=1785345851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+vczk8CvcY4aL8g5YbXn0iT24zJtlAf/6DTKKazpNOw=;
        b=T4qMDpTcwaWYnrW0OFw59CzE4alpBR+gPNMgTCJohoF2eIyE8vUdKOo4oo8sfXH5gg
         ewlDlOCESIGSwqwv4EqlIX9Bpkj8DdLgXc7TFEFtgCbYGII3EpiuCMMlziMQkLVx1ORg
         u86eKIaSsyMToY5xKq/pomDu9SW1ny33/s4sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741051; x=1785345851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+vczk8CvcY4aL8g5YbXn0iT24zJtlAf/6DTKKazpNOw=;
        b=k2zHnaz0pncw2YOVsSBKQs0C4LnsCN2ohxNgCTy/GO2kZzJ7p/VKO2b/ZN0mkqyv1b
         Rn01OEQsmSIQihgs2nKePPvDjjK6TSVUa35wZXj2H3mtGKWQyKUrysF/IAlWE8/z28zs
         ixgMfNADgZPjCMxo+EPQLo8HGLDOXht5+JkHwGLhOsxi0lEdP8TBVFSZV3klUiHpx2bw
         Pkg0+qR3HieQn1pD0NSXez+dUOcJTfpspS96eBr/1k64J14xg/1bqRWQryoK+5gORZ9s
         qdiCfWYwOgMpa4bHAB63Ed69xJNYoxqZeYJszoN9JSzRGuO8wWUbnVI0klmWfGSGwXY3
         FFxA==
X-Gm-Message-State: AOJu0YyFpgTBUMhPJfV6cazTI9x5ER5dH26e2bfsM1xdW7lTmd5DWbaY
	cSDuEKtoE89EY9CsvmIvGQFqZtuzwLPGjxTCJm447132a4Yq2n3LGNIQjOfB47mwqRaW0VKr+y7
	4A4agnkA=
X-Gm-Gg: AR+sD1122ULAwEaWh3S8UMm88AVtiTTlwqBXkB20xYBO3rFQo+r4h6lmVzcBuVgr93f
	dVl0uxYPSQOL+QZwZp22f8Znwf4Mxhp6RWw/cxnRzWTZOV6d8WtGWS6Q709SQisofsucarq5ydK
	ZxinU4JVk/uG8OS83vSUY34nkcqgkfoZhN+6UJKsPr1GLbGMZJ9eVf50ZJ5eYO1sDpBw014g7ZD
	t5egd1V+MiVrcrbyTY9NFinCNFVQxkzQJl0K/3SwhBiRQFJ09VTQ7k8bs6FfTUcNOCOmQol/kmg
	C6RDZ9B+QaXxRfcMo/5xJMoFgLbpRw66PmWZxd94v2ZAXyAWUSa78NFpFCdIKAeIHORezPKkq/8
	nI117ySk/vQLHmxtwqQn9tYlYQUlU2LwmIUmu97eZ5mpOQLNGnLNjGEXtkb41r936UMrtN2DbdZ
	R27vOurXcbsynEvGsLLFFzI3+Oii4Kodz7dkMq7nb5B0Y5yeEoMdWDJxX9ldCoXPHlVZeA6JmOw
	VaV68k/HET7
X-Received: by 2002:a7b:c8c7:0:b0:493:bfad:9d99 with SMTP id 5b1f17b1804b1-4954a3dc36dmr190017475e9.13.1784741051101;
        Wed, 22 Jul 2026 10:24:11 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/27] openssh: Fix CVE-2026-59995
Date: Wed, 22 Jul 2026 19:23:36 +0200
Message-ID: <e0636bd6a225446695e2267c501e1fa52f0bae29.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241733

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-59995. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/1b39f39657d2e58f8ec57341581a39bbf0be645b
[2] https://www.cve.org/CVERecord?id=CVE-2026-59995

Signed-off-by: Devansh Patel <devanshp@cisco.com>
[YC: patch referenced in https://ubuntu.com/security/CVE-2026-59995]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-59995.patch      | 44 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch
new file mode 100644
index 00000000000..ac1712eec2f
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch
@@ -0,0 +1,44 @@
+From 02e4b3cfd0bef64381921cdb9d6a21b1f50fdb74 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 29 Jun 2026 01:47:21 +0000
+Subject: [PATCH] upstream: avoid download to server-controlled path when
+ performing
+
+download on the commandline. From Swival scanner
+
+OpenBSD-Commit-ID: d1b2c44305fdfe6d51eed9ecc727e59478bf311f
+
+CVE: CVE-2026-59995
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/1b39f39657d2e58f8ec57341581a39bbf0be645b]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk in sftp.c and retained
+  the Wrynose OpenSSH 10.3p1 revision because this stable backport carries
+  only the functional security change.
+
+(cherry picked from commit 1b39f39657d2e58f8ec57341581a39bbf0be645b)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ sftp.c | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/sftp.c b/sftp.c
+index eebb166e8..33c8364e3 100644
+--- a/sftp.c
++++ b/sftp.c
+@@ -2287,13 +2287,8 @@ interactive_loop(struct sftp_conn *conn, char *file1, char *file2)
+ 				return (-1);
+ 			}
+ 		} else {
+-			/* XXX this is wrong wrt quoting */
+-			snprintf(cmd, sizeof cmd, "get%s %s%s%s",
+-			    global_aflag ? " -a" : "", dir,
+-			    file2 == NULL ? "" : " ",
+-			    file2 == NULL ? "" : file2);
+-			err = parse_dispatch_command(conn, cmd,
+-			    &remote_path, startdir, 1, 0);
++			err = process_get(conn, dir, file2, remote_path, 0, 0,
++			    global_aflag, 0);
+ 			free(dir);
+ 			free(startdir);
+ 			free(remote_path);
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 0f4839f7675..c3b8d910dd7 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-59999.patch \
            file://CVE-2026-59997.patch \
            file://CVE-2026-59996.patch \
+           file://CVE-2026-59995.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 

