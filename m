Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2A5C48BC4
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 03:55:54 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.3634.1708660548122141574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 19:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GsmRmxIW;
 spf=pass (domain: mvista.com, ip: 209.85.128.171, mailfrom: vanusuri@mvista.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-607dec82853so4556317b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 19:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1708660546; x=1709265346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YCT9mju1/jSLaACVkVxrAftUSgo6Cq7kQI+DRYhvzWo=;
        b=GsmRmxIWojm/np7jwTnxbQVdRQ65ssreVTmXTiooxu90Pj1IB4Oia27YdK+zFl9LJ8
         NGFFFytpt51qysuziXo9hmpgbka/rb1QyOXbG5ci9XEIMPN7b4m4W9VqiKHqhjTiQ516
         nrQ7VWPqvUusTkPkC7l0HdMEaBxF0aewaM8UU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708660546; x=1709265346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCT9mju1/jSLaACVkVxrAftUSgo6Cq7kQI+DRYhvzWo=;
        b=dSjPquHPxoFSJZYhxh41j9eN21MInCyM7O9tsTiBEjlX1wifagquXuzCsxOBdsy6GA
         9hNYurGTnbiFh5nCkKBt9Olrq/VNF5PmkGXi3XMkrDPNy/jn5/MGfQgT4rroFnpWxCvo
         2f+PWYbIAFM8d7PIDI2zKBYAmq8pFsHu1gNOVpqPNry0xDYNI0vrS9IqzX1O7hoHyk3j
         YDTlYXxU1AD/7g0LC5yFwQblvyCaz6188+C8Bpkq+UYCEprUtYYtPYTOwYyc3gtpNJjr
         5q2sZx3HWdLLT1yNtciwgHt7yhd992eRtKsrpsCA5LSs5PbWr8lyObhmKyqlSt2ptK3d
         LFZw==
X-Gm-Message-State: AOJu0YxjwedRrbXGSyVZ7XfWUd0WgDV8zMYNc27726iSlj9li7EH/ciz
	bTOzR5btvawtjEYU+zszD1PFHv1evdbL2xE09Vx3a1O6UuFu2yiOsWtN8jhBItU10ZRt3RHZ3bw
	b
X-Google-Smtp-Source: AGHT+IHVI34Z8UG+mydY+l5Z7jU5z8pdYztGZX77UkhVSd0F6xC48YuoVta4ZG+n4dUh4VM2/6NUjw==
X-Received: by 2002:a81:a14f:0:b0:608:af6:afa4 with SMTP id y76-20020a81a14f000000b006080af6afa4mr998323ywg.39.1708660546468;
        Thu, 22 Feb 2024 19:55:46 -0800 (PST)
Received: from MVIN00020.mvista.com ([2405:201:c01c:781c:d232:7153:3629:9fbf])
        by smtp.gmail.com with ESMTPSA id n14-20020a635c4e000000b005dc2ca5b667sm9827414pgm.10.2024.02.22.19.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 19:55:46 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] less: Fix for CVE-2022-48624
Date: Fri, 23 Feb 2024 09:25:28 +0530
Message-Id: <20240223035528.6230-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 03:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196047

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://github.com/gwsw/less/commit/c6ac6de49698be84d264a0c4c0c40bb870b10144]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../less/less/CVE-2022-48624.patch            | 41 +++++++++++++++++++
 meta/recipes-extended/less/less_600.bb        |  1 +
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
diff --git a/meta/recipes-extended/less/less_600.bb b/meta/recipes-extended/less/less_600.bb
index f68281ac93..f88127a9e3 100644
--- a/meta/recipes-extended/less/less_600.bb
+++ b/meta/recipes-extended/less/less_600.bb
@@ -27,6 +27,7 @@ DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://CVE-2022-46663.patch \
+           file://CVE-2022-48624.patch \
 	  "
 
 SRC_URI[sha256sum] = "6633d6aa2b3cc717afb2c205778c7c42c4620f63b1d682f3d12c98af0be74d20"
-- 
2.25.1


