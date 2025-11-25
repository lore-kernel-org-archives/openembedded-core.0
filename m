Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501A8D0EE3D
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:59:20 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4355.1764104350866139892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:59:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hrjobnpN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3437ea05540so5120352a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104350; x=1764709150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xcad1Br49b/voGtcI61/1Uhwd60QXjpgPerOvUMJ+A=;
        b=hrjobnpNH3+EuBjjDBirfIEFdnHzEERaszREyWl1gVcJPOYvHIzQ/P/XeJHsHX1vX7
         gGuz8euVB90SFascprJvkVeXYpHKZtjvZQxUHN2ZegFFryfKmAOpwtIORjIENNOBPkke
         gO1HdaDy48b7qil8HfSkQg2qDfjk594X0S+m5Bs1+xaJDkP4zJ7vsiUM9764QA44w346
         Q3yJ00sZUphhLjaKunSJEWQmj1urx6104bE1175lbMAXCIF2NaYnnYfKMS/uTJAgP+xN
         2hFfUto4wLkPbI1uWGs9gzEd7/mtEbV/RxVpekZjuMXbBLFYS8OuEpTgGc8sMClrzOHz
         HAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104350; x=1764709150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0xcad1Br49b/voGtcI61/1Uhwd60QXjpgPerOvUMJ+A=;
        b=MQ2Fiy3qBoBmCDjO4xtVuzLb2skWSGOYNqwQXDGPeSY1OzY8wkaJuGs1k2207VnqV3
         BvEcsgUa7U2De+Ay/lSFiKafCjzB83dKqx4MfuA2mzX403FMG9g7SZGHhVxvJDaSx0IX
         scJEXYO1fk73N+EUVB5X7++ARCS1Z1gjugrpFC46euGHdBw27gZ3BqXwLFbQ60aHWu1+
         CTa8XNUex9uxr/4ByztHKgsKSHOy4nXT0RbM095yKPSqj6So2ME3amW76texWgWSF0JM
         IVeCkYjaB13bh9M4XOGJyICuX3Xj8zaxsx8pT36elm43m0k6oDUNam5Umq5E2WBgbwin
         YC6A==
X-Gm-Message-State: AOJu0Yy7UU+6hamArELM7TlMgRCcOgugGFQuJX7FoxkCdXW+JNmOUXuP
	8lQPDOu/jA7WXioQCfPY7+gMsAWVVIvhbBnJ5n+2DK/5QJcUrsM//lUOK3Se0BUeOpFsE5lKlgq
	qu5mC
X-Gm-Gg: ASbGncu1I16Bp3OttbfFBEduTateJaAibd7PI0PAQBnzYgkvahcbhP2QEaldeYeVz/S
	siiD2JHC+9/cwoimZc+HTTCH+3BoPUUf6zGxuNIt2XOkD+AZyy4U8X21/Lq2bwaIn8PZ58x2I/E
	z73Mgz+76mIWmfUmQ6PB27vFxqngqv2CM8sTo83A/YQlEb+p77tGrzNF4ECgFDdAf5xdHXVd/vs
	KCt55oNqfUM6FuSxJgkMdMxkZ0Mh3c5nd06vGncpF7JLnSUr2NaIPGtsDGk/gavCsSNKpvmZdc3
	ZKA8Hho3z5bZ5RwcaRkR7Gj4YL4q/MWXrnA5KF0jtkm7YjWYoolx2LAU/1OFGsIeR16YTl1Qlvb
	dbfOY4deV3BiRMG+HGHI4ZXcEAtizKUcyMi9mwtDmwPg3NiJRaNkwSMuAX84R/NjrQjH/5EH1So
	/fLAXSHcn2JSwB
X-Google-Smtp-Source: AGHT+IHonmHlaOUVaUtkeqiLb+MsmbjaanzhOlgQW43WQiwIVdfxXaorm/rLEcBrqSpu2ToXxEcmOQ==
X-Received: by 2002:a17:90b:2cce:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-34733f5d400mr17399956a91.37.1764104350051;
        Tue, 25 Nov 2025 12:59:10 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm17340755a12.4.2025.11.25.12.59.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:59:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/9] libarchive: patch 3.8.3 security issue 2
Date: Tue, 25 Nov 2025 12:58:46 -0800
Message-ID: <efe032eef7034009f1202985b2036fc79e06bddf.1764104199.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764104199.git.steve@sakoman.com>
References: <cover.1764104199.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226793

From: Peter Marko <peter.marko@siemens.com>

Pick patch [2] as listed in [1].

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.3
[2] https://github.com/libarchive/libarchive/pull/2768

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-request-2768-from-Commandoss-master.patch | 28 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch
new file mode 100644
index 0000000000..66e88c91b4
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch
@@ -0,0 +1,28 @@
+From 82b57a9740aa6d084edcf4592a3b8e49f63dec98 Mon Sep 17 00:00:00 2001
+From: Tim Kientzle <kientzle@acm.org>
+Date: Fri, 31 Oct 2025 22:07:19 -0700
+Subject: [PATCH] Merge pull request #2768 from Commandoss/master
+
+Fix for an out-of-bounds buffer overrun when using p[H_LEVEL_OFFSET]
+
+(cherry picked from commit ce614c65246158bcb0dc1f9c1dce5a5af65f9827)
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/82b57a9740aa6d084edcf4592a3b8e49f63dec98]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_read_support_format_lha.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_lha.c b/libarchive/archive_read_support_format_lha.c
+index 2a84ad9d..abf8b879 100644
+--- a/libarchive/archive_read_support_format_lha.c
++++ b/libarchive/archive_read_support_format_lha.c
+@@ -690,7 +690,7 @@ archive_read_format_lha_read_header(struct archive_read *a,
+ 	 * a pathname and a symlink has '\' character, a directory
+ 	 * separator in DOS/Windows. So we should convert it to '/'.
+ 	 */
+-	if (p[H_LEVEL_OFFSET] == 0)
++	if (lha->level == 0)
+ 		lha_replace_path_separator(lha, entry);
+ 
+ 	archive_entry_set_mode(entry, lha->mode);
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 88e9fbf8e9..da11e052a7 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -41,6 +41,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch \
            file://0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch \
            file://0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch \
+           file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


