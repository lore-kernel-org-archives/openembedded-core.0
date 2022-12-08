Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABBFC3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 07:26:43 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.7833.1670484395720006810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 23:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=apDvttP/;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id a14so641034pfa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 23:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJAuCWm16xvVfcrb6UC5gcm5aRNJlybdxVFFmbRXiM0=;
        b=apDvttP/6r6U6bbT6CzwIBoxizWs0y/OaXkDnPy6YJkc47TRTjv1pTX2Fx3h/zZqIv
         2i2qsL8zD4OhlhfbsmHjGOAZionp+C4zTnfSuUaWwU5ecKMubaaqwlKmySAyrlFT19Kb
         NR3sW2PcS53cQS9XI76bmGQHXOMr9yxjybbL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJAuCWm16xvVfcrb6UC5gcm5aRNJlybdxVFFmbRXiM0=;
        b=7YcP5MKHX5HOOjPAB/E+wgBGF5Q7l3/qiLIaHyBSHKdR1HaegO+3XWMpb7M/Y0PEMo
         kuCbNJCCJIt0lFnyEx4CNuGnAPpjQqEC84fN1wQJhH0KW13ncd0rnS6mCmxMRdAr4gXA
         diqI5nBcbOrgIyGIDgMAd92e0hmQTooDyHFCEQLYjgcX7R4F3VRKXW3wGJevsjoDSThV
         cwv4YMyxNQNpN7xqdUVU2IwHrsi2UtbADGhhLbdMhuovtkRABFNtmlkrp6kkFGyq4F7l
         Gj5uT1l6GadQ5Q5heMgVENhP1MBCb98T9aUP0nRduHfN+VMzNwlZof9MztOBoPspT5iR
         DYpQ==
X-Gm-Message-State: ANoB5pkomCSyTDk5HyZ3JJi7afhMg3IzF+2BqYN2Vu2eXh3bmjEpGrwO
	O82fTXqwdL/zyvOzCMQsqC4Gra5oOZe4yk9z
X-Google-Smtp-Source: AA0mqf7bL8V/rvAV8cLzyjvfdvcTetFSjBun2itmcqubsC6evJtKJc57Ykyd5yvw3Yqm/eHEIHSIRQ==
X-Received: by 2002:a05:6a00:4009:b0:563:2ada:30a3 with SMTP id by9-20020a056a00400900b005632ada30a3mr77930836pfb.27.1670484394666;
        Wed, 07 Dec 2022 23:26:34 -0800 (PST)
Received: from MVIN00024 ([103.250.136.158])
        by smtp.gmail.com with ESMTPSA id x19-20020aa79413000000b00576ebde78ffsm7110895pfo.192.2022.12.07.23.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 23:26:34 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 08 Dec 2022 12:56:28 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] libarchive: CVE-2022-36227 NULL pointer dereference in archive_write.c
Date: Thu,  8 Dec 2022 12:56:27 +0530
Message-Id: <20221208072627.30880-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 07:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174390

Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libarchive/CVE-2022-36227.patch           | 43 +++++++++++++++++++
 .../libarchive/libarchive_3.4.2.bb            |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
new file mode 100644
index 0000000000..980a0e884a
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
@@ -0,0 +1,43 @@
+From 6311080bff566fcc5591dadfd78efb41705b717f Mon Sep 17 00:00:00 2001
+From: obiwac <obiwac@gmail.com>
+Date: Fri, 22 Jul 2022 22:41:10 +0200
+Subject: [PATCH] CVE-2022-36227
+
+libarchive: CVE-2022-36227 Handle a `calloc` returning NULL (fixes #1754)
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5]
+CVE: CVE-2022-36227
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com
+---
+ libarchive/archive_write.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
+index 98a55fb..7fe88b6 100644
+--- a/libarchive/archive_write.c
++++ b/libarchive/archive_write.c
+@@ -211,6 +211,10 @@ __archive_write_allocate_filter(struct archive *_a)
+ 	struct archive_write_filter *f;
+ 
+ 	f = calloc(1, sizeof(*f));
++
++	if (f == NULL)
++		return (NULL);
++
+ 	f->archive = _a;
+ 	f->state = ARCHIVE_WRITE_FILTER_STATE_NEW;
+ 	if (a->filter_first == NULL)
+@@ -527,6 +531,10 @@ archive_write_open(struct archive *_a, void *client_data,
+ 	a->client_data = client_data;
+ 
+ 	client_filter = __archive_write_allocate_filter(_a);
++
++	if (client_filter == NULL)
++		return (ARCHIVE_FATAL);
++
+ 	client_filter->open = archive_write_client_open;
+ 	client_filter->write = archive_write_client_write;
+ 	client_filter->close = archive_write_client_close;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
index 7d2e7b711b..e0a6174d8b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2021-23177.patch \
            file://CVE-2021-31566-01.patch \
            file://CVE-2021-31566-02.patch \
+           file://CVE-2022-36227.patch \
 "
 
 SRC_URI[md5sum] = "d953ed6b47694dadf0e6042f8f9ff451"
-- 
2.25.1


