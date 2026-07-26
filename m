Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90260C54EFC
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7377.1785054615269944905
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kolUsvll;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4957eefd361so13244225e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054613; x=1785659413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C+gYTYrA5k1zeACyQgVfAOqc+0ndLjMjbrGAoYan9Cc=;
        b=kolUsvll4g6hNVU3eCo0qnQIw4EvUAK8nXPuP+h4QDsmFZkMYIFggm8t4sbYvRNyn3
         K+CH2EsN/EGPZj+UoCutq2krtWL69SUDyg0YRQq7EU7pVQpnustJx0bUpGoNO/TG8lKQ
         Xaspd8C3vsBjH9kqs3WfDQqZcFPRylr1/BjeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054613; x=1785659413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C+gYTYrA5k1zeACyQgVfAOqc+0ndLjMjbrGAoYan9Cc=;
        b=KIIrLSALLaN3XH1d6EnujnsVXDSeVVaxYyaqWMT0FJVRbANL+u6GlYChVE/rUx0GpE
         UYQTTkHdmx3qODks2cQKfpuSSdA6fNhmG0ihJ5HTwaZBpc3K79z4LF2uKSnB2izPyYdV
         kP7C+qtPazxP0XjIskVE2cR0BnTL4T9hWZesuKPypcta+hsmCgDue/QUW1Tv/R+cCQLu
         AV+PSleii35nSgP0TZnbdqytANyOPBpQwHtxM4FrJb5wU4o7n23SQJ/J0/e9GZOi1PwN
         0VL78yJp1+38VfKV5GSQlHysvR/o12bDOfB7nwp7Gmh898BkpZs0+sZDMUZskGYOOzP0
         +pRg==
X-Gm-Message-State: AOJu0YzH20/PySnktakAKVko12yKiWCTdQs0lf5+ZrqGlFWQDJIySIXL
	odjQRg1AEPRWTX0JcyLQTNG23xzSkSslBf6L28F8aZW5qo6WE2KyUdcclpogkzVQFlBT7Sbvblg
	9GhcWXi4=
X-Gm-Gg: AR+sD12dmrgeAfTL/IfKcFbYzubJ+b9Yasbe/Wo2Fj5HV/99mmzPkRuhnqvQcZsLcIm
	6fAbcSkXMxLJMh0e2EFmOifoNVXMtMs1woNiUxHFgyCnETROPmh0aqqRxA7eo7gfuKIjDqlHvOq
	wQvpqRDb5dAp1gfzn9cpqVRoaMVTElgshLolU9VVy76BNZpQyUifrdgc36iEaZ7YwjiJLXfkvSv
	ZLvyLUYiELPRSRYxJQgclG5DdY3GZ0OjsZ6lQ6FX0H+BMhBaw2rA9ijurIH+XaIVp9wbovW+Lgd
	2u22VEqmGMpBZV48GrKofZgRa4Vjpu0HJTPC05ut/YmmuyCQHXKZJKUdRKycyESdgU8fAoaVy3Z
	fe5ry7t7um10h7nYTWm+NeACvOZBhKcml3UXAPSW9t0vUEekCCbAjLtiQ9JljdfaAAv75abw24M
	R9WOr+ddFUuCHCtszllDXras5z9pzXIeJn7DXMZ/JA9kgEMVJxGlVnE26Kyqlt/YaN1JAYAs7Px
	zNhsw==
X-Received: by 2002:a05:600c:1d0d:b0:495:3de8:33a6 with SMTP id 5b1f17b1804b1-496b56ffdecmr61848815e9.16.1785054613391;
        Sun, 26 Jul 2026 01:30:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/31] openssh: Fix CVE-2026-59997
Date: Sun, 26 Jul 2026 10:29:31 +0200
Message-ID: <171530a1066afd2d420c33d063238af7e73ee784.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241989

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-59997. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/e9916c44c1324ab9ab022719e4df08a390a83014
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59997

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-59997.patch      | 58 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch
new file mode 100644
index 00000000000..aa171def018
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch
@@ -0,0 +1,58 @@
+From 3011cbb6bb73f3f3dc90fa1d48736803fa407509 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 5 Jun 2026 08:53:07 +0000
+Subject: [PATCH] upstream: pass >9 commandline arguments to the internal-sftp
+ server,
+
+previously they were silently dropped; reported by Steve Caffrey ok deraadt@
+
+CVE: CVE-2026-59997
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/e9916c44c1324ab9ab022719e4df08a390a83014]
+
+Backport Changes:
+- Retained the Scarthgap session.c OpenBSD revision identifier because the
+  10.4 identifier does not describe the older source baseline.
+
+OpenBSD-Commit-ID: ee6cd5430a3ca027c3223af54b58ad3cc7ccd624
+(cherry picked from commit e9916c44c1324ab9ab022719e4df08a390a83014)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ session.c | 19 ++++++++++---------
+ 1 file changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/session.c b/session.c
+index eb932b8bf..1a01ecf74 100644
+--- a/session.c
++++ b/session.c
+@@ -1650,21 +1650,22 @@ do_child(struct ssh *ssh, Session *s, const char *command)
+ 		exit(1);
+ 	} else if (s->is_subsystem == SUBSYSTEM_INT_SFTP) {
+ 		extern int optind, optreset;
+-		int i;
+-		char *p, *args;
++		int sftp_argc;
++		char **sftp_argv;
+ 
+ 		setproctitle("%s@%s", s->pw->pw_name, INTERNAL_SFTP_NAME);
+-		args = xstrdup(command ? command : "sftp-server");
+-		for (i = 0, (p = strtok(args, " ")); p; (p = strtok(NULL, " ")))
+-			if (i < ARGV_MAX - 1)
+-				argv[i++] = p;
+-		argv[i] = NULL;
++		if (argv_split(command == NULL ? "sftp-server" : command,
++		    &sftp_argc, &sftp_argv, 1) != 0) {
++			error("internal error: can't split internal-sftp "
++			    "arguments");
++			exit(1);
++		}
+ 		optind = optreset = 1;
+-		__progname = argv[0];
++		__progname = sftp_argv[0];
+ #ifdef WITH_SELINUX
+ 		ssh_selinux_change_context("sftpd_t");
+ #endif
+-		exit(sftp_server_main(i, argv, s->pw));
++		exit(sftp_server_main(sftp_argc, sftp_argv, s->pw));
+ 	}
+ 
+ 	fflush(NULL);
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index b6eda3607a9..4c8604f4b74 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -38,6 +38,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-35414-CVE-2026-35387.patch \
            file://CVE-2026-35388.patch \
            file://CVE-2026-59999.patch \
+           file://CVE-2026-59997.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

