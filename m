Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.12670.1596464851605645449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sB26VlU/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id u10so11245624plr.7
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=IFHRV7z5ABFOVEtNV39hlbE3peqCnmbdJsbFHKkhG0g=;
        b=sB26VlU/AVDCR5EojdS3gArqDHwXIrTM1InkSu93N1YJIS+4EFMnEQ7QjAKaBRb0kI
         NdBAcIGwg5whKXDeYxXaiVnGvutAE3ZV+cMPTZEwug5FpFL/A611TJIi6KFRwrNFA2rm
         u7PtBQQX4YkM6Z8q9ALPWDB0epmWsKjazU6vrte100V0e1WBBwAXUL8G6C9iPEL2wLA6
         rDwwnUS1xypx7FEAhWqR/QaNAGdcR4YswNHBQdDtLFpJd5Q74RG/g4YnFkZST4DxhDY4
         QVFR5RdxWnGfzYfphfhEqwlv9uAcdV6BqineHXu+o2NijxnSVXRn8Iryo12Wr2uuL8Qx
         454A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=IFHRV7z5ABFOVEtNV39hlbE3peqCnmbdJsbFHKkhG0g=;
        b=Jn33xr0pJRRA0ozW73tg7wpKmjDYELgcTPvn4BB/ZA2dHSHwqKi00qnQSlPooR9PqX
         2UiJfDLmQdDPRpvsc1Q6SHBPfCBNBtn/v+4yr4DPXdBm+lVGooFyCTD/8+J+ScnWP/FC
         N7Lk2Oo9j1T3XYdtBSb0o3QDZrz1GkpXDP9SY39NWZh4SXtinqwIEYud020mP8UDYDhy
         xXvkUmy63dDPm89gQsW9CQ8t0FbDizWTC3uaBK/0BcmYWPPevEJGjYar0f/0ZEMDnclP
         MjoLSEMhhCmxlg1I1odqmpPibUec7drzwn7h1IqzWQ91FnnV5wICP71KZt7fEC/Vy71L
         tGHw==
X-Gm-Message-State: AOAM533TWCmEEDfWnosw6nDrpsXmfYp283pYnp4buVIgZr1u3AE3SFmJ
	jbtSO0Swju0rujEBxLNE5xpMo8lnIRs=
X-Google-Smtp-Source: ABdhPJytQA1wnZC2wZ3x49KPN+tUfP1DPMVXKc0tLF3CCR+atr+oNIYnd4EXSno8oBrj2WT3s8A26Q==
X-Received: by 2002:a17:902:7404:: with SMTP id g4mr1475855pll.242.1596464850702;
        Mon, 03 Aug 2020 07:27:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:30 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/12] layer.conf: fix adwaita-icon-theme signature change problem
Date: Mon,  3 Aug 2020 04:26:57 -1000
Message-Id: <0a664b963c116786382fbba6f3386a7105a01122.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

allarch package adwaita-icon-theme inherit both allarch and
gtk-icon-cache, since commit 31e3d34c8a9c3e8481aa837aa0bf52adf095fe62
[gtk-icon-cache.bbclass: add runtime dependency], it start depend on
non-allarch packages gdk-pixbuf and gtk+3, which make it's signature
changes when machine changed.

like for task do_prepare_recipe_sysroot:
"Hash for dependent task
gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot changed from
a72aba8432699c8ce4ca1f71833ef14a89ffde0ea4063e37b9d819fdb1e407f4 to
1ad4e1bd76921b71482657f3b017184e9ade8e2a0b9f43ad64ed2dda83b1520f"

the only way to fix this is remove the task dependency.
SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS not work in class, so add it in
layer.conf.

Maybe we have other recipes under other layers have similar problem, we
can only add one by one to its layer.conf, seems not a good idea. but
add *->pixbuf will influence other packages

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec0888d73d7e7f811961f50f334c72fbc6b1d401)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 43917d4c3c..70a8d0ee3c 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -80,6 +80,8 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   weston-init->kbd \
   connman->xl2tpd \
   lttng-tools->lttng-modules \
+  adwaita-icon-theme->gdk-pixbuf \
+  adwaita-icon-theme->gtk+3 \
 "
 
 # Avoid adding bison-native to the sysroot without a specific
-- 
2.17.1

