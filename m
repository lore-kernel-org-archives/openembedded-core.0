Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F5BC27C51
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:06 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.36156.1717244703968853107
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YetGH3hR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f44b45d6abso20968295ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244703; x=1717849503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2fKnvmSzXFNKsC2kaIY/ZKGck9eKm5iZA1sQKa8ORU=;
        b=YetGH3hRyE4glaByqI7P8opnE90Ab0TIDgDF1tNW0eS4sUhazJ3Q63sXrnSFn89dWK
         LkqzYF43JPnyuuhb1SAakeOwCzP4Jc4QlzODHDfjc/QgH35WQo2bleg8G6Vdw7JBlXCQ
         ZW876XtdIj1RUbQg34sAkSTaqqxE8fc8cC9IRugBvJKFIxuiVqPNy20Na0jU7Hw1kXws
         cwezM7lXjCvMdUgd5KWKsvYR0yTeJ5ofnIILpGAn5gj6nSlwnRVj+zFI1IdELlVKuNQH
         K+FMGRuTazQdphkrx9fnCCVhZgJ6yEAzDqKY8k+at0yPbuNU3bz03De+e5RebEy/BGLx
         UvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244703; x=1717849503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2fKnvmSzXFNKsC2kaIY/ZKGck9eKm5iZA1sQKa8ORU=;
        b=ZF9O0Wa1vC5Fk56A3a6j+1L9maTY2D3Fg6Q3eJyqWKw1bfbcml18CeGiB+jpY6ac33
         N7YXR+gE0WjJlsuE1y/glj3kAj8aOFYx3p/QKR8/pi6YkceIXfJNLvUfu4HePTHJzH9L
         ftUgEicLEWlfCIzbsoadTJi7HpJOkupuvOafMvPI+8uiGADvRRvF3scOW3k8ewPy1dsT
         Ico3osy/CCRfb5F3X5+q/j/s3W0CEFCVPXNDTn34V59RiwbZhoINb2wve9cdpI+IyyJD
         faC9Go8FMtwMH2yp/KUS06KQ5GSNgo+vtQ64ZlEY2yhlkMc3eh6P1bQz2ErZbzlXJlBg
         LXfQ==
X-Gm-Message-State: AOJu0YyEN4PeL6Rec941HbYkRR1tdB6VeyLdySXbBKbu2Nd6VS1+z3Om
	yO9hnPS64s/mRJYKnjYtu+mzOhPO1blpqjdPwwdBBTJpaa7gWXFLbS2t52T9fI6430tOtHsJ8Uo
	i
X-Google-Smtp-Source: AGHT+IGH2sfbPN/efPJRbrG2w5P6PfD27MuI1t0wjUG8Rc+8qiTPIgOUuIHgvm+jKn2t/GBVKekecg==
X-Received: by 2002:a17:903:32c2:b0:1f3:2e5d:902d with SMTP id d9443c01a7336-1f636fd9704mr50378575ad.4.1717244702917;
        Sat, 01 Jun 2024 05:25:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/21] ghostscript: fix CVE-2024-33871
Date: Sat,  1 Jun 2024 05:24:32 -0700
Message-Id: <c28281b7e105536cdf61eef8fe81d85ff2a42e4f.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200102

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2024-33871.patch          | 43 +++++++++++++++++++
 .../ghostscript/ghostscript_10.02.1.bb        |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch
new file mode 100644
index 0000000000..abe6384997
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33871.patch
@@ -0,0 +1,43 @@
+From 7145885041bb52cc23964f0aa2aec1b1c82b5908 Mon Sep 17 00:00:00 2001
+From: Zdenek Hutyra <zhutyra@centrum.cz>
+Date: Mon, 22 Apr 2024 13:33:47 +0100
+Subject: [PATCH 4/5] OPVP device - prevent unsafe parameter change with SAFER
+
+Bug #707754 "OPVP device - Arbitrary code execution via custom Driver library"
+
+The "Driver" parameter for the "opvp"/"oprp" device specifies the name
+of a dynamic library and allows any library to be loaded.
+
+The patch does not allow changing this parameter after activating path
+control.
+
+This addresses CVE-2024-33871
+
+CVE: CVE-2024-33871
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=7145885041bb52cc2396]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ contrib/opvp/gdevopvp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/contrib/opvp/gdevopvp.c b/contrib/opvp/gdevopvp.c
+index 74200cf..80eb23b 100644
+--- a/contrib/opvp/gdevopvp.c
++++ b/contrib/opvp/gdevopvp.c
+@@ -3456,6 +3456,12 @@ _put_params(gx_device *dev, gs_param_list *plist)
+     code = param_read_string(plist, pname, &vdps);
+     switch (code) {
+     case 0:
++        if (gs_is_path_control_active(dev->memory)
++            && (!opdev->globals.vectorDriver || strlen(opdev->globals.vectorDriver) != vdps.size
++                || memcmp(opdev->globals.vectorDriver, vdps.data, vdps.size) != 0)) {
++            param_signal_error(plist, pname, gs_error_invalidaccess);
++            return_error(gs_error_invalidaccess);
++        }
+         buff = realloc(buff, vdps.size + 1);
+         memcpy(buff, vdps.data, vdps.size);
+         buff[vdps.size] = 0;
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index 91285ed2ad..8bda4404cc 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://CVE-2024-33870.patch \
            file://CVE-2024-33869-0001.patch \
            file://CVE-2024-33869-0002.patch \
+           file://CVE-2024-33871.patch \
            "
 
 SRC_URI[sha256sum] = "e429e4f5b01615a4f0f93a4128e8a1a4d932dff983b1774174c79c0630717ad9"
-- 
2.34.1


