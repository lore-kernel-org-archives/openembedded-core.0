Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B68AC48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 06:55:47 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.15515.1708930543172783114
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 22:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GIe4kuCl;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dc49b00bdbso22578315ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 22:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1708930542; x=1709535342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FObDJ83kv5FwU5GLzOLui9uMhj65GEQ7HGQwNn7dseY=;
        b=GIe4kuCl68XaLfOkyXzCJepmSiuaviUWBnqtWUeDeeBH/XEE9LWvh1JeBbWijCZZ3B
         TFGSUxbNcCieN/DV+RhiUys2P+LWvy/L+YdzD4trMAdQst/7nZ/5e8kkgnSO1zH0EzZ9
         zo7REWZBOOCiY8JQAv1MAuW/Nwrw8gKbDI2nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708930542; x=1709535342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FObDJ83kv5FwU5GLzOLui9uMhj65GEQ7HGQwNn7dseY=;
        b=NJGGRQNwrbJyWXX4zKg9PBY9UfCbswe/IGUe8D6VhR8rJT4L7tt169jnAdKVnYgYKA
         jg7vHpW2/P+/ulDL79nehQyf5yUHKeFKuPlbnWumMEahb21XpeI3ye7DcYXoB8kYFu03
         Dx8U2jXIyWY4RlYYZEtjl1e64rnjgWf+1gogLL+NSQO4laYDqHBGyMY50QzvvQsSIcgx
         I5qSBPeg6zfcwynD4Ly2DL5WkAf08QCSLDBQ57KVEhjEC/OS8X/ZUEVWGS9bk1MdAtXy
         sGKF3vY06I4z6vgayXXRxUDYq4rP7Te4BmfNB1gteZ2s+Vnpl8o6IsQgPeyUmA+MC1ju
         B7HA==
X-Gm-Message-State: AOJu0Yz3z1qrE41oT9KA/Vufquw8P2cyUQcKhRwol7G+ZD8mHUbfBtnx
	1kak7ujm7n1PJb8/Q8sK+ODsylO9tviTquZpbGGu3lUFt+aA4n4nzTIXA+f12t+qIi9hTMaocac
	9
X-Google-Smtp-Source: AGHT+IH9xBAjdHeW7Y4GoGhI3+3niDTVEVf79FN8VQ8ZX+I/pN1FV6imkd8LCuAjJuv4eWMN7IcqHA==
X-Received: by 2002:a17:903:246:b0:1dc:1e7c:cd3 with SMTP id j6-20020a170903024600b001dc1e7c0cd3mr6518179plh.47.1708930541626;
        Sun, 25 Feb 2024 22:55:41 -0800 (PST)
Received: from MVIN00020.mvista.com ([2405:201:c01c:781c:f5d0:9dd9:b81d:8cf])
        by smtp.gmail.com with ESMTPSA id i13-20020a17090332cd00b001db2ff16acasm3179598plr.128.2024.02.25.22.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 22:55:41 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] less: Fix for CVE-2022-48624
Date: Mon, 26 Feb 2024 12:25:30 +0530
Message-Id: <20240226065530.9575-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 06:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196181

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://github.com/gwsw/less/commit/c6ac6de49698be84d264a0c4c0c40bb870b10144]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../less/less/CVE-2022-48624.patch            | 41 +++++++++++++++++++
 meta/recipes-extended/less/less_551.bb        |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/less/less/CVE-2022-48624.patch

diff --git a/meta/recipes-extended/less/less/CVE-2022-48624.patch b/meta/recipes-extended/less/less/CVE-2022-48624.patch
new file mode 100644
index 0000000000..409730bd4f
--- /dev/null
+++ b/meta/recipes-extended/less/less/CVE-2022-48624.patch
@@ -0,0 +1,41 @@
+From c6ac6de49698be84d264a0c4c0c40bb870b10144 Mon Sep 17 00:00:00 2001
+From: Mark Nudelman <markn@greenwoodsoftware.com>
+Date: Sat, 25 Jun 2022 11:54:43 -0700
+Subject: [PATCH] Shell-quote filenames when invoking LESSCLOSE.
+
+Upstream-Status: Backport [https://github.com/gwsw/less/commit/c6ac6de49698be84d264a0c4c0c40bb870b10144]
+CVE: CVE-2022-48624
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ filename.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/filename.c b/filename.c
+index 5824e385..dff20c08 100644
+--- a/filename.c
++++ b/filename.c
+@@ -972,6 +972,8 @@ close_altfile(altfilename, filename)
+ {
+ #if HAVE_POPEN
+ 	char *lessclose;
++	char *qfilename;
++	char *qaltfilename;
+ 	FILE *fd;
+ 	char *cmd;
+ 	int len;
+@@ -986,9 +988,13 @@ close_altfile(altfilename, filename)
+ 		error("LESSCLOSE ignored; must contain no more than 2 %%s", NULL_PARG);
+ 		return;
+ 	}
+-	len = (int) (strlen(lessclose) + strlen(filename) + strlen(altfilename) + 2);
++	qfilename = shell_quote(filename);
++	qaltfilename = shell_quote(altfilename);
++	len = (int) (strlen(lessclose) + strlen(qfilename) + strlen(qaltfilename) + 2);
+ 	cmd = (char *) ecalloc(len, sizeof(char));
+-	SNPRINTF2(cmd, len, lessclose, filename, altfilename);
++	SNPRINTF2(cmd, len, lessclose, qfilename, qaltfilename);
++	free(qaltfilename);
++	free(qfilename);
+ 	fd = shellcmd(cmd);
+ 	free(cmd);
+ 	if (fd != NULL)
diff --git a/meta/recipes-extended/less/less_551.bb b/meta/recipes-extended/less/less_551.bb
index a818c68fc7..401f40bed5 100644
--- a/meta/recipes-extended/less/less_551.bb
+++ b/meta/recipes-extended/less/less_551.bb
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
+           file://CVE-2022-48624.patch \
 	  "
 
 SRC_URI[md5sum] = "4ad4408b06d7a6626a055cb453f36819"
-- 
2.25.1


