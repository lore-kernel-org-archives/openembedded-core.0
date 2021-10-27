Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8888DC4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:58 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.9130.1635325677173009385
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G8260tWn;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 g205-20020a1c20d6000000b0032cc6bbd505so5024890wmg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kRyICmCxXcwEo0NNBM0bhhXZ19EPVVArwqrBl4OQH8w=;
        b=G8260tWn16GBcALuLQldARmn9G1Bq+3ZtohF3zT00blhNk9Cvjz/xt8sIrbDVBRsAs
         nW0MDBevGzlACyJh7mnHRjnEbfhUsKbzN4YAHz5UwRDE0XlQycaJx9qoxfNySt73P8vq
         k47u9Ry1B7Soj61vXDcecOJas4O82BPDpTbl1/H/3s/Wl3LjNijJ13I5UBJKqck4kHYK
         9Bpd3ScaOFoW/D8TR6JqwX5pTFEAMCzCnlVke22STfUd2erLPV5h3Cw21Ckbc/AoSS9+
         +It8rlNZ8iyKlhTXgwX93P0BTRRhbFTT7sBsFrzLoQmylpFIpxO7npIh1DIhzGqunceB
         bGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kRyICmCxXcwEo0NNBM0bhhXZ19EPVVArwqrBl4OQH8w=;
        b=Ep1/5N7wLyZ79JY1PxIF74DKTGQ+B6onxRE8Mbg3T85An/tlXa1AYDI3815DB1GlIX
         FXVDwlw1EcNotZ7E1p5AAGniuGBBERkq3J+0sIcPWlI3z3SXyE3LwyaFjwLbpekRh1gB
         uGGLAS2Gr/KMiU9WVnkMWVsqlIaCuxj9tSYDFzjsbyFA/FKnonOw/oDH+Z8ihdGAlsVi
         euhr3z6b0C2m5o21NvyzduLIeLAl/OdiNnOB1lLJEoKqDMyJphQKGL/JTFGf0Cf8JaZL
         9/WOTj0hWxnqnFGZpwYPOFy7tNK1gJlPDldp6tsle0q4LYRyVuJN/++a2xBsiiKn55WW
         /+ew==
X-Gm-Message-State: AOAM533zuBZ0tXnAMSwTWI7F/o8bT26Vib2sgco0g3UeyJcOlVDtWSsz
	qRgwWOg4FkOLRf2F4Yi3ku/hrw87x3k=
X-Google-Smtp-Source: 
 ABdhPJxx8uXeem4dDk5Gn9C+qe5/AngJagHDRZ+f3em2oJ+eT2BQGEOkp2Cwx33RhNPigeZiDk7bDw==
X-Received: by 2002:a7b:c103:: with SMTP id w3mr4403383wmi.179.1635325675804;
        Wed, 27 Oct 2021 02:07:55 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/30] systemtap: address ncurses 6.3 compatibility
Date: Wed, 27 Oct 2021 11:07:32 +0200
Message-Id: <20211027090736.2546759-26-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157502

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...staprun-address-ncurses-6.3-failures.patch | 61 +++++++++++++++++++
 .../recipes-kernel/systemtap/systemtap_git.bb |  4 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
new file mode 100644
index 0000000000..b53e107d84
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
@@ -0,0 +1,61 @@
+From 191f528da19193d713d94ee252e2485efd9af4d3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 25 Oct 2021 17:59:24 +0200
+Subject: [PATCH] staprun: address ncurses 6.3 failures
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ staprun/monitor.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/staprun/monitor.c b/staprun/monitor.c
+index 478634c09..f4fbfd686 100644
+--- a/staprun/monitor.c
++++ b/staprun/monitor.c
+@@ -448,12 +448,12 @@ void monitor_render(void)
+       if (active_window == 0)
+         wattron(status, A_BOLD);
+       wprintw(status, "\n%*s\t%*s\t%*s\t%*s\t%*s\t%*s\t%s\n",
+-              width[p_index], HIGHLIGHT("index", p_index, comp_fn_index),
+-              width[p_state], HIGHLIGHT("state", p_state, comp_fn_index),
+-              width[p_hits], HIGHLIGHT("hits", p_hits, comp_fn_index),
+-              width[p_min], HIGHLIGHT("min", p_min, comp_fn_index),
+-              width[p_avg], HIGHLIGHT("avg", p_avg, comp_fn_index),
+-              width[p_max], HIGHLIGHT("max", p_max, comp_fn_index),
++              (int)width[p_index], HIGHLIGHT("index", p_index, comp_fn_index),
++              (int)width[p_state], HIGHLIGHT("state", p_state, comp_fn_index),
++              (int)width[p_hits], HIGHLIGHT("hits", p_hits, comp_fn_index),
++              (int)width[p_min], HIGHLIGHT("min", p_min, comp_fn_index),
++              (int)width[p_avg], HIGHLIGHT("avg", p_avg, comp_fn_index),
++              (int)width[p_max], HIGHLIGHT("max", p_max, comp_fn_index),
+               HIGHLIGHT("name", p_name, comp_fn_index));
+       if (active_window == 0)
+         wattroff(status, A_BOLD);
+@@ -466,17 +466,17 @@ void monitor_render(void)
+           json_object *probe, *field;
+           probe = json_object_array_get_idx(jso_probe_list, i);
+           json_object_object_get_ex(probe, "index", &field);
+-          wprintw(status, "%*s\t", width[p_index], json_object_get_string(field));
++          wprintw(status, "%*s\t", (int)width[p_index], json_object_get_string(field));
+           json_object_object_get_ex(probe, "state", &field);
+-          wprintw(status, "%*s\t", width[p_state], json_object_get_string(field));
++          wprintw(status, "%*s\t", (int)width[p_state], json_object_get_string(field));
+           json_object_object_get_ex(probe, "hits", &field);
+-          wprintw(status, "%*s\t", width[p_hits], json_object_get_string(field));
++          wprintw(status, "%*s\t", (int)width[p_hits], json_object_get_string(field));
+           json_object_object_get_ex(probe, "min", &field);
+-          wprintw(status, "%*s\t", width[p_min], json_object_get_string(field));
++          wprintw(status, "%*s\t", (int)width[p_min], json_object_get_string(field));
+           json_object_object_get_ex(probe, "avg", &field);
+-          wprintw(status, "%*s\t", width[p_avg], json_object_get_string(field));
++          wprintw(status, "%*s\t", (int)width[p_avg], json_object_get_string(field));
+           json_object_object_get_ex(probe, "max", &field);
+-          wprintw(status, "%*s\t", width[p_max], json_object_get_string(field));
++          wprintw(status, "%*s\t", (int)width[p_max], json_object_get_string(field));
+           getyx(status, discard, cur_x);
+           json_object_object_get_ex(probe, "name", &field);
+           wprintw(status, "%.*s", max_cols-cur_x-1, json_object_get_string(field));
+-- 
+2.20.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 8f0de5f0f0..d11d9b93a2 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,7 +6,9 @@ HOMEPAGE = "https://sourceware.org/systemtap/"
 
 require systemtap_git.inc
 
-SRC_URI += "file://0001-improve-reproducibility-for-c-compiling.patch"
+SRC_URI += "file://0001-improve-reproducibility-for-c-compiling.patch \
+           file://0001-staprun-address-ncurses-6.3-failures.patch \
+           "
 
 DEPENDS = "elfutils"
 
-- 
2.20.1


