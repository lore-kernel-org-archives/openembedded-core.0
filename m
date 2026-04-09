Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D49EA3C5C
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:29 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144833.1775776287016698278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UFfJWzH8;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso17982315e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776285; x=1776381085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMEM8VvFmNdDO0qa35jZnfImu6P/RN8dlTc/DuIxpfs=;
        b=UFfJWzH807FptQKGyxlc+Xq3dTU0aiX1KcNzU9Egee/fiDYN8bSQZ2kUfCgovIHILS
         k24U6IPs3F6wE1DGh5Dagb2vAGMOo71Cdm1jkXXHagczlrk+OwF4IJMTaL/3Z01g17x8
         gmhNJAg+i/0Dl3sWUJR4p435gyVuvNanJXCtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776285; x=1776381085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sMEM8VvFmNdDO0qa35jZnfImu6P/RN8dlTc/DuIxpfs=;
        b=Nrvqg3Ghxl9xY1Tg3uskdOQCkOhvwP1iV0Dq8Rdl5olwOYNiZbfnRYNyUUBj2/8zF2
         TkSuOGlCJWqUiTvrDHN86Tq8Fl1B2ROC52Kw38ou2GXltrZsFks3Xn9g2ZOujsbaUNPx
         zzNdTJqCLCenRwHcjfAYtYjfHujR7nwzMGQSfYv/ig+lkZagG2FZP8Y+NMF4lneCq081
         Kp+qlg+TFeXT+/D6uldjlYVPmmCK+Nt7qYWHi7h5BtU4O8ULTU/8C0Ok8FddJsoFNlP9
         RP1HeIQS7edTmZtSZJQoPf1YoQozvqRGyjDluMhr/SLI4BPq2C5RSIb3bB495MzKyRQm
         tpvQ==
X-Gm-Message-State: AOJu0YxnerQWNvo7J3DEAbEmmcA58jgD0aBftH4MOMupoz/h+ykrUhMX
	wxu2YVU5/ErxuxRixke66JwZrFuv45AUytoYQX9oNVvcdZuWFezmExqxezzaZ7+30Di4FB6z3ud
	pGknlCH6RfM5m
X-Gm-Gg: AeBDieuCAszDFcxGRHp7QVzIW7pNtYFG7UsxUZYo+qrAKwT2o9WtoyoMhvqjGVnuPk2
	m3gAT4AWRk2lI6rG5gZ+UBkXmyCHXnx2bdGvXtlVMR6g/MPWdvFBm62DgaC2QSE0EraCKI71De8
	RgcdKabJWil5XsHaZN3Mtetcv+JpwHE4tQK6Uma/ofkSDmy2ETARMPe/tUGs/HMQ4uO9Y4q83jM
	5vi67EFVe0TNQX/jFcDJjTkbf5G+U+A1fsek/xRELhLf7kuaiEs7go10TP7Y7UdvCcrAio11PdX
	DLKUYGz/eNwIR3ji7e6w4FY9u47Ct4y4j15a7LlL1D+OZMXBCX4+LlOcS5lsLkc3TjFNBlMtYML
	qBgZbVWM6aMoFJwgBdDtD8RdkNyhlHXTrRdTRQNn1QJO7oCUfQalS8yBTcorUWb2trtgtpGHlxt
	qNI1lNcFzuZI6oIILa2THQH+GWIaEh02WhND8T3cTRaavdIRys6HrHsGw/JIn281P2eRYzpwxx5
	ZUyJG2wj09buSDjGW1yv1xnXSgI
X-Received: by 2002:a05:600c:4504:b0:485:3b9e:caa7 with SMTP id 5b1f17b1804b1-488d6864f6dmr7557465e9.23.1775776285153;
        Thu, 09 Apr 2026 16:11:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 13/30] sqlite3: Fix CVE-2025-70873
Date: Fri, 10 Apr 2026 01:10:13 +0200
Message-ID: <c83cd0147548921f87d4167f6a4a7c58ddc8600f.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234972

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch as per [1]

[1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
[2] https://sqlite.org/forum/forumpost/761eac3c82
[3] https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/files/CVE-2025-70873.patch         | 33 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
new file mode 100644
index 00000000000..86004c0b741
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
@@ -0,0 +1,33 @@
+From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Sat, 6 Dec 2025 20:41:24 +0000
+Subject: [PATCH] In the zipfile extension, only return as many bytes as
+ Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum post
+ 761eac3c82]. Adjust ./configure so that it builds zipfile into testfixture if
+ ZLIB is available, so that tests get run on unix platforms.
+
+FossilOrigin-Name: 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda216c6a4c26160909
+
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a]
+CVE: CVE-2025-70873
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ shell.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/shell.c b/shell.c
+index fa45d40..3c4902c 100644
+--- a/shell.c
++++ b/shell.c
+@@ -7668,7 +7668,7 @@ static void zipfileInflate(
+       if( err!=Z_STREAM_END ){
+         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
+       }else{
+-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out, zipfileFree);
+         aRes = 0;
+       }
+     }
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index acdd80022e1..9e10caa399a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2023-7104.patch \
            file://CVE-2025-29088.patch \
            file://CVE-2025-6965.patch \
+           file://CVE-2025-70873.patch \
            "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 

