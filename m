Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752AFC54E5A
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:30 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.101639.1709565804611612508
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aPWIHJeY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-299d3b09342so3420948a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709565804; x=1710170604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSJnFiMl9fHGbO0sRFKWORSR71HMQX49/TvPYqlwlSk=;
        b=aPWIHJeYMGC+kXnr8Y5xs9REEwH3uQegVJbehu+fEgycbWTTExzlqXC0X4gsWQM5qG
         nkYH1Oot2sgCl/A20Cubz+ZYg/BHr50Iya23o3LlWjprPTsx3Naf5o0n5B6cmD5C1tZD
         NaU+j++0D+FULchhxK8cEbSj+L/0aNAzoXRlcS+a2GwOrCodmC0fsGtsLkesg3Lx44Ex
         6xuHVJR2dMpCx8tpHv9o6S6Jvhmxn0PFiU99Rkn+rGc0qEFvF9xS5JHsBsi9QwJACmJ6
         BQ7vZg+Ng80pFbVBNfJpURCrM/AJXmxCIT9TLy+P/mmj/b5S3RoTXqP7sZCkqm89toZb
         tYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565804; x=1710170604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSJnFiMl9fHGbO0sRFKWORSR71HMQX49/TvPYqlwlSk=;
        b=o4cpJEMtZpp5koRTKXMy9viIMs9QXaTfUVMUIyk6YzigSbizZ0lgafm/osTB4EwjNm
         LU1ygDgAXck9oEFqseyrfM3+Ts8LKRtmy/J6bUo7CWTOvYdf5vHERqAMhz2Vykfh6nnM
         w3jn4Bp45olyk4sXy9vez6qxUPIIHdD9tLSL6zEh5tT4UhkodP8rjbzNAw5YlNOVVP0z
         vM9oLYSOeRav9tyL/UMF1Nzr/CQP7czdSHQLX7Q3cOZJMZtmoLOi2Q3ObwbY7aRPODJI
         uvQGxor3HhB6j4Rlg5XrXrGXY+Wb6PwgwQiHVLnAsfMPW/lcVS6oZLSd3xpFpoCzfEmR
         oVoQ==
X-Gm-Message-State: AOJu0YzN77gLnqy0uPz2QfJgFh+yBpGmsD8lLC+VGnCHRH0OnSyy7d8E
	DCvaqH6aq7YL4grkPBt+tS3qIhQ3ABQwqVcMltMXKWMikbLZtHeCtM/bph0SU7nxek91xJCeqEu
	OtzA=
X-Google-Smtp-Source: AGHT+IEMg7zimkxiB7QFYRyxlsy4PLw9Cy/V0heoTUvP4P8VP55g+T1w5iN/gpzHeqDe2MaJDAmnpg==
X-Received: by 2002:a17:90a:b382:b0:29a:da46:8d27 with SMTP id e2-20020a17090ab38200b0029ada468d27mr8079115pjr.0.1709565803940;
        Mon, 04 Mar 2024 07:23:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b0029981c0d5c5sm8898968pjy.19.2024.03.04.07.23.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:23:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/11] less: Fix for CVE-2022-48624
Date: Mon,  4 Mar 2024 05:23:06 -1000
Message-Id: <8d91ab209398a8415009bc3093d407bf8871dafd.1709565668.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709565668.git.steve@sakoman.com>
References: <cover.1709565668.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196599

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://github.com/gwsw/less/commit/c6ac6de49698be84d264a0c4c0c40bb870b10144]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


