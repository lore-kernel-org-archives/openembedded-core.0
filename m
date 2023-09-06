Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75073EB8FCA
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:48:52 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.7474.1694004528753981181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NLpQbGC4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c1ff5b741cso28224765ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694004528; x=1694609328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuhZhSZyoTy/OotBaoOoUTFJd+juR6EFOGJWKH64Rvg=;
        b=NLpQbGC41BUnvgbZja3GrLky2gzYoQi26g3cH2E/4rUS+ZiQCeyBW3cWCpb0vQhvZ4
         JZE/SUuUE2RLXi3hHasxYpufHJeSRE9M8IEEoYVVwbL01XRTSePHhGxpZKeKMwvTfh38
         DlUf7GJe4VaStPOMBN8ZmyQRkmEFJ+NOmyaZBXzLpBg2BOYkPUfqYmWdAYaBeONdWjHY
         PnaS5t+82WWxDgClJW3q45QIOSwIaypOmQzW7ZWGXlh/4QJE600e2cuJ3be4AwM3G/Qf
         hgMdkRjshDFUoJOZX8VQ/rVYHg3o6fNjZxyTxgKAth9A16dmUBU1T69AtmD1b6Wf/4tZ
         FFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004528; x=1694609328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuhZhSZyoTy/OotBaoOoUTFJd+juR6EFOGJWKH64Rvg=;
        b=CnLwppigyLXl63NvPdWvmMI3rFQLR8U8s44R95jKNvHlkmBLHIfTWhQLa2vxXkTlXF
         1ZBG6UFThMXfCb6NxA6Hei7ww6bCbUJFZ/jY/5J4aem0QIbrZFZWawlSZhVfaIkGqJ+0
         OGshcK+rSx3Q4PgviHmR+46ZDy9BJWqTGJXXd6Erj47sQxxbYxQmuUv1/evAQM/v6AgY
         WyIzWTzrTk/W/cKtq3kqn6MyNz/24oOknMgzIuIoG5JurnPuGfvTVRqGWCl8AvvfrUl6
         OcbcxU62uTCbOYc5qg+B6kCYHkOLh6eUE5cck4P//mW81WPIxvl6iP1hcmCQLWZoD3Qy
         qb5g==
X-Gm-Message-State: AOJu0YwHBfN7eTPZKBiGqJDkk1NtTQnleKF1RrrE/lLTN6k//gZ/Avwn
	PCFa4VThUhcsx6Z2n7b5JaMWtUMgfov9URwprls=
X-Google-Smtp-Source: AGHT+IE8vSMlyUAHA8Au5LY2xL3ojaPOTYteZiBU8esNJcKXNoJBT4ofkbhEYa439lIz1VsQw8Ws8w==
X-Received: by 2002:a17:90a:c095:b0:26b:c5b:bb44 with SMTP id o21-20020a17090ac09500b0026b0c5bbb44mr14749457pjs.13.1694004527790;
        Wed, 06 Sep 2023 05:48:47 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a928a00b00267d9f4d340sm12495009pjo.44.2023.09.06.05.48.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 05:48:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/14] nasm: fix CVE-2020-21528
Date: Wed,  6 Sep 2023 02:48:17 -1000
Message-Id: <87c4ec2d73ac2e52005e16e38a9a12affb8d51bd.1694004064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694004064.git.steve@sakoman.com>
References: <cover.1694004064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187306

From: Archana Polampalli <archana.polampalli@windriver.com>

A Segmentation Fault issue discovered in in ieee_segment function in outieee.c
in nasm 2.14.03 and 2.15 allows remote attackers to cause a denial of service
via crafted assembly file.

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-21528

Upstream patches:
https://github.com/netwide-assembler/nasm/commit/93c774d482694643cafbc82578ac8b729fb5bc8b

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../nasm/nasm/CVE-2020-21528.patch            | 47 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.15.05.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2020-21528.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2020-21528.patch b/meta/recipes-devtools/nasm/nasm/CVE-2020-21528.patch
new file mode 100644
index 0000000000..2303744540
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2020-21528.patch
@@ -0,0 +1,47 @@
+From 93c774d482694643cafbc82578ac8b729fb5bc8b Mon Sep 17 00:00:00 2001
+From: Cyrill Gorcunov <gorcunov@gmail.com>
+Date: Wed, 4 Nov 2020 13:08:06 +0300
+Subject: [PATCH] BR3392637: output/outieee: Fix nil dereference
+
+The handling been broken in commit 98578071.
+
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/93c774d482694643cafbc82578ac8b729fb5bc8b]
+
+CVE: CVE-2020-21528
+
+Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ output/outieee.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/output/outieee.c b/output/outieee.c
+index bff2f085..b3ccc5f6 100644
+--- a/output/outieee.c
++++ b/output/outieee.c
+@@ -795,6 +795,23 @@ static int32_t ieee_segment(char *name, int *bits)
+             define_label(name, seg->index + 1, 0L, false);
+         ieee_seg_needs_update = NULL;
+
++        /*
++         * In commit 98578071b9d71ecaa2344dd9c185237c1765041e
++         * we reworked labels significantly which in turn lead
++         * to the case where seg->name = NULL here and we get
++         * nil dereference in next segments definitions.
++         *
++         * Lets placate this case with explicit name setting
++         * if labels engine didn't set it yet.
++         *
++         * FIXME: Need to revisit this moment if such fix doesn't
++         * break anything but since IEEE 695 format is veeery
++         * old I don't expect there are many users left. In worst
++         * case this should only lead to a memory leak.
++         */
++        if (!seg->name)
++            seg->name = nasm_strdup(name);
++
+         if (seg->use32)
+             *bits = 32;
+         else
+--
+2.40.0
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.05.bb b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
index bcb7e071d6..aba061f56f 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.05.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0002-Add-debug-prefix-map-option.patch \
            file://CVE-2022-44370.patch \
            file://CVE-2022-46457.patch \
+           file://CVE-2020-21528.patch \
            "
 
 SRC_URI[sha256sum] = "3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa6f35668bee2fd0"
-- 
2.34.1


