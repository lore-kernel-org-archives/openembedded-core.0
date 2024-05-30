Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06AFC25B7E
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 18:38:16 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.4938.1717094293629636414
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 11:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vczCNbZF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-701b0b0be38so1161633b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 11:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717094293; x=1717699093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1JA9n7keJFje6ituDNj6KQ05CFEbixfsRA7s+CZcpM=;
        b=vczCNbZFPquUETKZvflOH6ofTpG7zwRiqFlB2tCYdCTE1uTrDcVCNQapXzAhnfTBD2
         KkNfLwrq649ObKh/fkiWNAdF4ptV6J9wdjfDC4T/NtPt+jxrmiUxCmlX8KzVRJzJLuD0
         DvW9fB74hGJAB5RYj7828N6PT8Xmm9N3ebDblcI+QkU/BD6Ch8Tu8XxT6OK3YvPfR/Ex
         8+Lduqr3vxiG2eD+MViJxAgLmM6TIWqnxJojvAXU1fJL6VyfDmCG52pBzwLbkv0RljuD
         WdADvQW3sZX4u/eGki5fkkI8AEdTNi3rFbgGoYKDFWI92lbE9RCcvDdD6r7hZEZvsJ7E
         JbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717094293; x=1717699093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1JA9n7keJFje6ituDNj6KQ05CFEbixfsRA7s+CZcpM=;
        b=SuGT7D+B+SUvGvp0aLO1BNbwWyLyhHg+GdeuM51HDFSphctRF0/PiKAp5BLhI/bmtT
         izz66DVsI3vfy675qC2SqnVp7r1gn38Fjqi8oKTVFyZPWxdoTiiXEbihi1vQUwKgP+R8
         LoXnW+j6CPDqnrFbYzFVoXaN7LHRvNGzRxLq8VaD0vfYMXjS1tWfvBPN+HWEv/CzJYJ6
         75IDBtOIe4mUgXniFuk/U8hCmcHoRKmBNcMZogH1yefYDBzJ3mHSE1ACzWQuIaE+4fA2
         KO9EIdXnY+F31/1EYeFnifwhW7Ge+H1o7ke429syQkPIOqbQZ3Rr5DW0u77tBFnM9Pdn
         NkGg==
X-Gm-Message-State: AOJu0Yw+mA+jD8MzpgCogW7C7SSFQqMrtznu3OpsPjfg+oU38WHiyAam
	SsvevQ9r4kxK8qp4SQfhOu403RFqOYHZ6/nRk52hvywFXG6RYeoxa/Xbb3jR+5RSyjL2xBfUAlh
	u
X-Google-Smtp-Source: AGHT+IGizNHhh1PDQ5/EmQ+zxs/tBjeefqhqj3Hg1inOi74hVMe3apwW18K+SLPRw9KIh2J3iu0oBA==
X-Received: by 2002:a05:6a20:12d5:b0:1af:9edd:9cb3 with SMTP id adf61e73a8af0-1b2645bf0b1mr3502641637.17.1717094292667;
        Thu, 30 May 2024 11:38:12 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423dbfc4sm62005b3a.66.2024.05.30.11.38.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 11:38:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/7] ghostscript: fix CVE-2024-33870
Date: Thu, 30 May 2024 11:38:00 -0700
Message-Id: <9f0c63b568312da93daeb31eeb2874b98d1e3eea.1717094145.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717094145.git.steve@sakoman.com>
References: <cover.1717094145.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 18:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200039

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2024-33870.patch          | 92 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
new file mode 100644
index 0000000000..0d289b6d07
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
@@ -0,0 +1,92 @@
+From 79aef19c685984dc3da2dc090450407d9fbcff80 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Tue, 26 Mar 2024 12:00:14 +0000
+Subject: [PATCH 1/5] Bug #707686
+
+See bug thread for details
+
+In addition to the noted bug; an error path (return from
+gp_file_name_reduce not successful) could elad to a memory leak as we
+did not free 'bufferfull'. Fix that too.
+
+This addresses CVE-2024-33870
+
+CVE: CVE-2024-33870
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=79aef19c685984dc]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gpmisc.c | 33 ++++++++++++++++++++++++++++++---
+ 1 file changed, 30 insertions(+), 3 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index f9a9230..3b6fffa 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1042,7 +1042,7 @@ gp_validate_path_len(const gs_memory_t *mem,
+                      const uint         len,
+                      const char        *mode)
+ {
+-    char *buffer, *bufferfull;
++    char *buffer, *bufferfull = NULL;
+     uint rlen;
+     int code = 0;
+     const char *cdirstr = gp_file_name_current();
+@@ -1095,8 +1095,10 @@ gp_validate_path_len(const gs_memory_t *mem,
+             return gs_error_VMerror;
+
+         buffer = bufferfull + prefix_len;
+-        if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
+-            return gs_error_invalidfileaccess;
++	if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success) {
++           code = gs_note_error(gs_error_invalidfileaccess);
++            goto exit;
++        }
+         buffer[rlen] = 0;
+     }
+     while (1) {
+@@ -1131,9 +1133,33 @@ gp_validate_path_len(const gs_memory_t *mem,
+             code = gs_note_error(gs_error_invalidfileaccess);
+         }
+         if (code < 0 && prefix_len > 0 && buffer > bufferfull) {
++            uint newlen = rlen + cdirstrl + dirsepstrl;
++            char *newbuffer;
++            int code;
++
+             buffer = bufferfull;
+             memcpy(buffer, cdirstr, cdirstrl);
+             memcpy(buffer + cdirstrl, dirsepstr, dirsepstrl);
++	    /* We've prepended a './' or similar for the current working directory. We need
++             * to execute file_name_reduce on that, to eliminate any '../' or similar from
++             * the (new) full path.
++             */
++            newbuffer = (char *)gs_alloc_bytes(mem->thread_safe_memory, newlen + 1, "gp_validate_path");
++            if (newbuffer == NULL) {
++                code = gs_note_error(gs_error_VMerror);
++                goto exit;
++            }
++
++            memcpy(newbuffer, buffer, rlen + cdirstrl + dirsepstrl);
++            newbuffer[newlen] = 0x00;
++
++            code = gp_file_name_reduce(newbuffer, (uint)newlen, buffer, &newlen);
++            gs_free_object(mem->thread_safe_memory, newbuffer, "gp_validate_path");
++            if (code != gp_combine_success) {
++                code = gs_note_error(gs_error_invalidfileaccess);
++                goto exit;
++            }
++
+             continue;
+         }
+         else if (code < 0 && cdirstrl > 0 && prefix_len == 0 && buffer == bufferfull) {
+@@ -1152,6 +1178,7 @@ gp_validate_path_len(const gs_memory_t *mem,
+                                            gs_path_control_flag_is_scratch_file);
+     }
+
++exit:
+     gs_free_object(mem->thread_safe_memory, bufferfull, "gp_validate_path");
+ #ifdef EACCES
+     if (code == gs_error_invalidfileaccess)
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index e99c740685..5fa4da0fb8 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -43,6 +43,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2023-38559.patch \
                 file://CVE-2023-43115.patch \
                 file://CVE-2023-46751.patch \
+                file://CVE-2024-33870.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


