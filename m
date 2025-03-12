Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE3FC28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:27 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.4758.1741809377644092371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YmIvKh57;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso586319a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809377; x=1742414177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jnb6jY0ft7m18MRl4JJk8nQn+dYCq4+zek518ewF4OI=;
        b=YmIvKh57OtsgA6Xgtu5J+mlkgPTRv3SfUz0hE1OlSCxMtwO145Vq82kn2ul++OKg/d
         JoWIYeASbllgGCmsCd35VEjljQc+fqmn3OzNaFD/gqS58EQ3Wc0I0aU8b7AzH58a05F+
         v142rprK62N+vc2l26aIbKyNzHFKR5X8N7zqnLW08z1fx0p/r7ZldpdFLmQadA7tHJcS
         Flt7WoxVh6AT22HBv3Y45RAE1e9wq9VRQ+LSJUyLIXhSs4Ww2IxdTg3gtgNMArTqCHWF
         vaHIhfFNFkfNDvnb6/AJwAxkiJvp75gmmKWQubus86iqWPWzNUDkFgMyUBOClNqVFxWC
         nmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809377; x=1742414177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jnb6jY0ft7m18MRl4JJk8nQn+dYCq4+zek518ewF4OI=;
        b=wlu+iaI+4MzNrIy5LM8c0GlFN0Rif75ilDd9qoYHzgxbfwdJm5wNsl3ORV4Dhdfcx5
         XtfrnkuJn8y7KSoNb9zTk37ZJNQcgEUSVDSuY7RGKoxVtDGFXqhqMfPjZsmsUlLtwES5
         tNIKqF7zAiI3y2GUlvRaaOMBDjyE7gsCyp4+npbwoyhTog49eIYt42TX3Njd3TKfzI3T
         TlLVTAyXXJjsGV0C8DFgjP3MiNuzEYIRIH/Ul7+CDjbHq/Wk4JP3UE+pvmPZsdyRSCym
         wjb6u41Ug7lkhrP2WX2Jech+ewOVJ/d2ey+lUPxnhOjLjLOCQkm4QkY9GQdf/3RRiM6H
         SIHQ==
X-Gm-Message-State: AOJu0Yxa8nwAAtISh2k4+DdzKDJZI54JPrOpqwnbKk8sABHIfhLJyoKl
	CZRaNCtffJjoETjiC0Xa+CHzWv0r0Jw1PMI9dhC0zPZTIa2+zSqndt9vPvrowFA5u5OlULCVRvR
	d
X-Gm-Gg: ASbGncuN7Zk/0BUtnW4QFB/BxxczschMfGPyWjylU+4nc/yLK8ODNGU/j5wtaxvg0qI
	m9r4LZa+8hgKEVc9owEI/ia37X6cXJgmMvIzHCIFZesDInq2Dg5esjD2RZmWyQSkz4YSzDyD+vK
	hCzlrBP26q1QAtiIh4cBCuE14qujy1T2j0B3GTEree0NgWUaYcqp6dDgPHij+5OCZGXM7KMXNOx
	VuyHd8srmghu9Kud0MQSICSwlwBuzoNb1TONKuJpDp+SUHPEA2jTvKV9rNOmlfAWmvgGQJ8Tk4a
	Q0OUFDb/+a0jGGhqXdM9OQ0UVgp7tAcakJI=
X-Google-Smtp-Source: AGHT+IHBJbnI+ZLPcc2jbH589DUAZz2oTseBNg5MG5vPsXY9GMfKx5G74zmCoqyAA4mG+W6kmO1H5w==
X-Received: by 2002:a05:6a20:c79a:b0:1f5:8153:9407 with SMTP id adf61e73a8af0-1f5815394eamr19324350637.20.1741809376917;
        Wed, 12 Mar 2025 12:56:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/28] grub: patch CVE-2024-45775
Date: Wed, 12 Mar 2025 12:55:34 -0700
Message-ID: <4e01993bf71d3b8e2375ab43857b671738953507.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212707

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-45775.patch           | 38 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45775.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45775.patch b/meta/recipes-bsp/grub/files/CVE-2024-45775.patch
new file mode 100644
index 0000000000..70492b8c2e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45775.patch
@@ -0,0 +1,38 @@
+From 05be856a8c3aae41f5df90cab7796ab7ee34b872 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:55 +0000
+Subject: [PATCH] commands/extcmd: Missing check for failed allocation
+
+The grub_extcmd_dispatcher() calls grub_arg_list_alloc() to allocate
+a grub_arg_list struct but it does not verify the allocation was successful.
+In case of failed allocation the NULL state pointer can be accessed in
+parse_option() through grub_arg_parse() which may lead to a security issue.
+
+Fixes: CVE-2024-45775
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45775
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=05be856a8c3aae41f5df90cab7796ab7ee34b872]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/commands/extcmd.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/grub-core/commands/extcmd.c b/grub-core/commands/extcmd.c
+index 90a5ca24a..c236be13a 100644
+--- a/grub-core/commands/extcmd.c
++++ b/grub-core/commands/extcmd.c
+@@ -49,6 +49,9 @@ grub_extcmd_dispatcher (struct grub_command *cmd, int argc, char **args,
+     }
+ 
+   state = grub_arg_list_alloc (ext, argc, args);
++  if (state == NULL)
++    return grub_errno;
++
+   if (grub_arg_parse (ext, argc, args, state, &new_args, &new_argc))
+     {
+       context.state = state;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 4e13b0eb43..0378d5ee72 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -26,6 +26,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45783.patch \
            file://CVE-2025-0624.patch \
            file://CVE-2024-45774.patch \
+           file://CVE-2024-45775.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


