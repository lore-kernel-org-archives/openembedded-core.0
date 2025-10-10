Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B87CCCD18D
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:01 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.2339.1760064654447561783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Bsm7xvus;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-796f9a8a088so1350247b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064654; x=1760669454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfuyQP74gZxg2wwQAOJAJWkVhjH7lWkKojcMnpIN8b0=;
        b=Bsm7xvush9YH/X6sFosLESQkUFizWHxnQT60f49dSynew5WiaymHOyt7ETczB1W78d
         jl/m1DHA8dU/p+PhyF/j4xLKSzNj1fQshodMtvfrMpyju1EUK3GWMPNENqL6ZOY2iuoJ
         /HKBD0WLrr4FujnsTM4Kr4/MQC8J2lcoWE2FqTAUAdvrNQGyzMxSTOyG4F5RO6DpA72B
         wt2uSBIPlPCej7zUsb6YDWHbEGTTwTHwTYaBaoNz+mTFU+UpK0xamrnijHK7d5QKBluN
         PgYrM5dRkvTnPAIYfS+eWHQusXLNdNsNfh1EpIdxKzjGT3aUbdOZFVsuTzgHwDmSSQnl
         VCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064654; x=1760669454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfuyQP74gZxg2wwQAOJAJWkVhjH7lWkKojcMnpIN8b0=;
        b=n7aRolcUKchO6TsB83k2eZtHGCXc84Wnpvxfdfpa4bcUv5zRvB501+HOszIZekH/4D
         z9foUZcCIk6wLvC2z7n6VJwx0dJVAzOvslsG0wrYUR1ZL1SyKwvXoM1eeuhsOZB5rJZP
         Qc98Nh8oRlJ3g/PEd22SwqUT7JnINKZrTs2zwcvodhF0kFZ8k9hzS2q1o1TEtGCU0C6n
         UrK50JdgQXGreppA0EdLNGhAZrDtdgdtBvrxucuOrlRvnWZRGL0krUDYari2Qj4qmAN8
         He/c4tP7IRNCqNG+pVPmWeAQo8bUgD2vwOD0vFvdRuLtYmTJ5nfJLYhpgsV1M1dq0lqc
         o0Zw==
X-Gm-Message-State: AOJu0YyyiRMbR/j50p1UQkD8LebsZDy++IzOeNU7BJ6S3ApbUwDJ886z
	DXNT1JuftawgntH8OVKiIc+Ig1aKTxn9pJb1B6NIeacJHG49CxqTqehV7gkd66jTgJg4yuNtVjJ
	Gv80Z
X-Gm-Gg: ASbGnctdkymMSSlSQYIbU8AEEV4WbtvQcZRdVKRAonzpYievRkhJ5wkCR1vHDeE8wZy
	+CpImZAVJQoqexCj/uRoQ4zu3+8gUu3CYwanozui5A5nqZQ/9PgL0OaRcdZPd7Mja7nUIetsgBx
	Eka/TCXEzFGPmSlWXMy3D6vFNxpWRVvbjCV8z2H5uci8Bc0IZqho0kle1n6JD/wVeUCBS0e2c1/
	EmdzVPhsaKWE1TFpEDT5QnEmzZn/WUv06pyYZj2qBJAQf2Gju9TK74677Z9Cv1lSz/4wAHmcUJD
	bTM+iwXVjKMVDnpoeXqzv9xNaBpP4YIJAedaadulWNfXJMKmMwmrn+cx1xnnsj36XMDhcKq0Gk5
	rjdQn2SZW2Rc7ecSr64auJ7KqsLOCUrNC
X-Google-Smtp-Source: AGHT+IG/m4fjT3/hDXYPaBsAN/59xFcdmbYLZI7nfGbivXi79BbWlk0+ycej1f3eJOBDtX/ywGQlmg==
X-Received: by 2002:a05:6a00:cc9:b0:781:189:ae43 with SMTP id d2e1a72fcca58-79386e51126mr9801647b3a.20.1760064653643;
        Thu, 09 Oct 2025 19:50:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.50.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:50:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/18] ghostscript: patch CVE-2025-59799
Date: Thu,  9 Oct 2025 19:50:25 -0700
Message-ID: <2f1d5b9ad1af6d2b28e9e7b46aadd879a67b8fc6.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224650

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in the NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2025-59799.patch          | 41 +++++++++++++++++++
 .../ghostscript/ghostscript_10.05.1.bb        |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch
new file mode 100644
index 0000000000..9401474c47
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch
@@ -0,0 +1,41 @@
+From 6dab38fb211f15226c242ab7a83fa53e4b0ff781 Mon Sep 17 00:00:00 2001
+From: Piotr Kajda <petermasterperfect@gmail.com>
+Date: Thu, 8 May 2025 11:37:09 +0100
+Subject: [PATCH] pdfwrite - bounds check some strings
+
+Bug #708517
+
+This differs very slightly from the proposed patch in the bug report, I
+had a quick scout through the C file and found another similar case.
+
+Both fixed here.
+
+CVE: CVE-2025-59799
+Upstream-Status: Backport [https://github.com/ArtifexSoftware/ghostpdl/commit/6dab38fb211f15226c242ab7a83fa53e4b0ff781]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ devices/vector/gdevpdfm.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/devices/vector/gdevpdfm.c b/devices/vector/gdevpdfm.c
+index 5aa3644e2..4b1d7d89c 100644
+--- a/devices/vector/gdevpdfm.c
++++ b/devices/vector/gdevpdfm.c
+@@ -199,6 +199,8 @@ pdfmark_coerce_dest(gs_param_string *dstr, char dest[MAX_DEST_STRING])
+ {
+     const byte *data = dstr->data;
+     uint size = dstr->size;
++    if (size > MAX_DEST_STRING)
++        return_error(gs_error_limitcheck);
+     if (size == 0 || data[0] != '(')
+         return 0;
+     /****** HANDLE ESCAPES ******/
+@@ -859,6 +861,8 @@ pdfmark_put_ao_pairs(gx_device_pdf * pdev, cos_dict_t *pcd,
+             char buf[30];
+             int d0, d1;
+ 
++            if (Action[1].size > 29)
++                return_error(gs_error_rangecheck);
+             memcpy(buf, Action[1].data, Action[1].size);
+             buf[Action[1].size] = 0;
+             if (sscanf(buf, "%d %d R", &d0, &d1) == 2)
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index 0ae939e780..0f123d4899 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
            file://CVE-2025-59798.patch \
+           file://CVE-2025-59799.patch \
            "
 
 SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"
-- 
2.43.0


