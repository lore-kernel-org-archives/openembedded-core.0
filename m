Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8E9C27C77
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 13:07:36 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.9064.1718111252026868719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 06:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HPvxEXlG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7041ed475acso2824548b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718111251; x=1718716051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRdw/fHN0rDuLmuNYju+3VMjjq9dWhAgyxjYewhLDo8=;
        b=HPvxEXlGRWGgGYI6Nk6yJsGULgUund94/b6IFwpt4v70S/sEbKuVYHVyzRXorBzXmQ
         yvhdo/R0lYD98h4PYdoew5XuHFUos4tOij5uUYsf8NjGTxoaOND8PX235WFB2L/HfDB0
         OjwoRJQsv+uV8ANYB+BuxTzkv3602dHjpKbIuKCpWT9t2FenIhzF3rHhw8EjY/d+iHmC
         /djtrVH+Y4DqexbaUbxE+0GjHs3D4SgzHKc0EtHK8bH0CINByzw0E+mJ9s+LoFZG8e/w
         TJ3kGpR+K0Pr+53XiaJyQqh9W/Zrg2rJzHYfGYiqwtUWvMOCnWFKPLyFD2so5591GshW
         zGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111251; x=1718716051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRdw/fHN0rDuLmuNYju+3VMjjq9dWhAgyxjYewhLDo8=;
        b=tObkM9OD7QMzw/ma2pR8pujRRuBIaSmbk/oVPL1V1+f0/MphyemlHmkf5pXKo5FIl/
         AgR1Df1YKsH5ywndss/PolRqd/SHn77t62DMtih/AkVOsTc2cU6Q2QivgNUQJT6R2gto
         MaCHYaTah7pxFVjSPGBE9Z/ZJjiuQQqJxesCeTPwmlIWJkRpxuejJtu1OYcxF3EgPiAj
         8CafrAcngJiVaFw/7XCVdaUK0/Oz7NHIPw45Eyv0edVpAg5MCa3MJFrVYkpVc3jdBUtW
         /+h4LcB8QinCnTeYdAd6td9HqvqGaOtqscdSOw3TGNqUJ9W8/5UKidiOBlHFc7LhBGTI
         r2Qg==
X-Gm-Message-State: AOJu0YwY42tNaHSVKBAQcW3vQz4e1PlD1APSDZ8e6x5+N+v1oYQvfKyy
	7ho1hpqvlBWqgti6RL5C0h4p3EvNaAaX8qKpYKDDoWENRkueO/gQTS8/V+ZF/N5IVux1MwIZWPS
	o
X-Google-Smtp-Source: AGHT+IG6WYiNLxPHPOgumsbiEb9+WcOFw/0C9bxSLie7r/9FiviSFKyS1apPHhw3FQ7kLkG6wdm++g==
X-Received: by 2002:a17:90a:ab94:b0:2c3:4a9:7bfc with SMTP id 98e67ed59e1d1-2c304a980a9mr5243625a91.29.1718111250927;
        Tue, 11 Jun 2024 06:07:30 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c3076dcf04sm4380915a91.48.2024.06.11.06.07.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:07:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/10] util-linux: Fix CVE-2024-28085
Date: Tue, 11 Jun 2024 06:07:16 -0700
Message-Id: <b40a77416f73955833faeddf6091a99ff9837199.1718111104.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718111104.git.steve@sakoman.com>
References: <cover.1718111104.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 13:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200510

From: Soumya Sambu <soumya.sambu@windriver.com>

wall in util-linux through 2.40, often installed with setgid
tty permissions, allows escape sequences to be sent to other
users' terminals through argv. (Specifically, escape sequences
received from stdin are blocked, but escape sequences received
from argv are not blocked.) There may be plausible scenarios
where this leads to account takeover.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-28085

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  2 ++
 .../util-linux/CVE-2024-28085-0001.patch      | 36 +++++++++++++++++++
 .../util-linux/CVE-2024-28085-0002.patch      | 34 ++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index d506783f9a..48520ef951 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -40,6 +40,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            file://0001-login-utils-include-libgen.h-for-basename-API.patch \
            file://fcntl-lock.c \
+           file://CVE-2024-28085-0001.patch \
+           file://CVE-2024-28085-0002.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.patch
new file mode 100644
index 0000000000..af39931b3f
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.patch
@@ -0,0 +1,36 @@
+From 07f0f0f5bd1e5e2268257ae1ff6d76a9b6c6ea8b Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 17 Jan 2024 12:37:08 +0100
+Subject: [PATCH] wall: fix calloc cal [-Werror=calloc-transposed-args]
+
+term-utils/wall.c:143:37: error: xcalloc sizes specified with sizeof in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
+  143 |         buf->groups = xcalloc(sizeof(*buf->groups), buf->ngroups);
+      |                                     ^
+term-utils/wall.c:143:37: note: earlier argument should specify number of elements, later size of each element
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2024-28085
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/07f0f0f5bd1e5e2268257ae1ff6d76a9b6c6ea8b]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ term-utils/wall.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/term-utils/wall.c b/term-utils/wall.c
+index 377db45..85c006a 100644
+--- a/term-utils/wall.c
++++ b/term-utils/wall.c
+@@ -135,7 +135,7 @@ static struct group_workspace *init_group_workspace(const char *group)
+
+	buf->requested_group = get_group_gid(group);
+	buf->ngroups = sysconf(_SC_NGROUPS_MAX) + 1;  /* room for the primary gid */
+-	buf->groups = xcalloc(sizeof(*buf->groups), buf->ngroups);
++	buf->groups = xcalloc(buf->ngroups, sizeof(*buf->groups));
+
+	return buf;
+ }
+--
+2.40.0
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.patch
new file mode 100644
index 0000000000..a2b914d580
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.patch
@@ -0,0 +1,34 @@
+From 404b0781f52f7c045ca811b2dceec526408ac253 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 21 Mar 2024 11:16:20 +0100
+Subject: [PATCH] wall: fix escape sequence Injection [CVE-2024-28085]
+
+Let's use for all cases the same output function.
+
+Reported-by: Skyler Ferrante <sjf5462@rit.edu>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2024-28085
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/404b0781f52f7c045ca811b2dceec526408ac253]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ term-utils/wall.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/term-utils/wall.c b/term-utils/wall.c
+index 85c006a..0212c03 100644
+--- a/term-utils/wall.c
++++ b/term-utils/wall.c
+@@ -328,7 +328,7 @@ static char *makemsg(char *fname, char **mvec, int mvecsz,
+		int i;
+
+		for (i = 0; i < mvecsz; i++) {
+-			fputs(mvec[i], fs);
++			fputs_careful(mvec[i], fs, '^', true, TERM_WIDTH);
+			if (i < mvecsz - 1)
+				fputc(' ', fs);
+		}
+--
+2.40.0
-- 
2.34.1


