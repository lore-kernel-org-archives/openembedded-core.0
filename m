Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A716CCF2D4
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 22:37:04 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23095.1792363016276272249
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 15:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b3fbqC2d;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e946155442so12037165ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 15:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363016; x=1792967816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5pTve4dHmIzOL54ekIwM2QUjOWU2EybdBgtCUFbkik=;
        b=b3fbqC2deBC5XLwpjXRVN4FqyZ7EnGl6i3d2nqRGZmPgMY8mLxNJe5FC/2E01YqvDA
         LOsFVXhfo2vurM0hgSemX4FBkmduGnjw43++j0V+dabxWV3gEheAVqHApcpAsvv49SVU
         OjhawqBt8uXf3DwB5r0Wmi33/QdDKQk/ENeDSwJqqXwFNh0H7v1Vugg5CVlb1mC9wFOY
         ol61FT/IazlF547TAME6bZpTQaLJuiobFD833UYT+Sjeu19eNxKlJnmKSQSeuaacv51y
         9CPGq6eXHpc99LnjCjMbI5n5nvHS5RH2dprANDdkwUleisbMGPkssGN/+gzxqwLUgez5
         2QDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363016; x=1792967816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5pTve4dHmIzOL54ekIwM2QUjOWU2EybdBgtCUFbkik=;
        b=250YPWU5yqyH6PbiPzPlHWSekFqL+Rtb+OmEYMhVDJZh25vEnNwjRCIWN2lkNNeEcf
         7BTnNqJE0dd7LCbQOd9wNQBA5S3M+PgzeCMmwNw2xFo9N7eVQDr+6v3Jrgv1GS8tbJ8f
         SRRHk5DXpNguJ1Tx8vmAW8eL9WxQWksy3tdV7mWkpOPUJ7eU4kZJ2O0a52rddWUph83Z
         duOLYpqA3X6H+5CWG5QQ3eBQNkjNhfUhCBH81yf/auybL+JRt7r8Xc15AYe6NFFMjJx7
         A191zJvYLtd73ABuqavSaFX53aYYenRTGkCIJpB6T14ELqiIlpkUX+XRmPunqibRMuzm
         FyCQ==
X-Gm-Message-State: AFq9FYIOlNdVr59v5oa5Kv8iWiYQhqnwii67gS1UHbV164XebNPBwziV
	JvGhtWsOvg9rrGcfe9zRF3AX85zfh7+Gz+nCO8uzMox5iaz5YnTUfFxgPj+VMw==
X-Gm-Gg: AYBFou0cZknj9fROZiYshSEh0nk7UerB3yWgzv/upT7orklIPYGY39G04FUL2CH+N+V
	xuQbX2q/+FMnSmz/JEttxCocLUhrFu/AqGG0jKiC/GNtF6NRe4cKvux2H1QEdJ/WcvtPj8AuQpG
	zxKp2jbWNzRQA2IsnisRkBcO3/L+z08c0TFc/rqdMacfXiFJdM7RywKapOikFqvwWjpcSKBk55X
	pfI0DqqpGLrrP1ybivtJuOxZf/VUu1K9mClrgmXLIIBfO4LcKBBD8r7i9uSPacdVba8HF4fCUbD
	eMJiql02iQ6gkLpL8KAQco3xH0NuAzAKbRneFgTgAZXytM9CsOBjxfvDYZDcuVhfF/va1+jrgVh
	r5jU0BsTWY1wzV/ziBEHuNiOO4lNHdxKjCB6JkxhW7h4GNXm7YCGSYmSJZI1SR0SQwgHjm2BvqW
	4FqrjVlPYL9Wt+h/Vnso59At/FgZK1t7FuSocJhTDLftIkTArqKv76qhPL4ObkKHui6U7Bmyg28
	S4DDDFMyldxtvfs8RR7ZIVYd2/ak6A5rzrBnL0=
X-Received: by 2002:a17:90b:5870:b0:3ac:a6a5:5743 with SMTP id 98e67ed59e1d1-3acef29e6bdmr5071567a91.32.1792363015656;
        Sun, 18 Oct 2026 15:36:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac940055f5sm17875989a91.0.2026.10.18.15.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:36:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 3/5] libnotify: upgrade 0.8.8 -> 0.8.9
Date: Mon, 19 Oct 2026 11:36:41 +1300
Message-ID: <20261018223644.291257-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018223644.291257-1-ankur.tyagi85@gmail.com>
References: <20261018223644.291257-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 22:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248112

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/libnotify/-/blob/0.8.9/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnotify/{libnotify_0.8.8.bb => libnotify_0.8.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.8.bb => libnotify_0.8.9.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.9.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.8.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.9.bb
index c3f71dec4a..1f0653d2ed 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.9.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "23420ef619dc2cb5aebad613f4823a2fa41c07e5a1d05628d40f6ec4b35bfddd"
+SRC_URI[archive.sha256sum] = "c906bb084027ea512f94a60fbfc0cc8d4f17e4b4d525bed370d07a6d8714c923"
 
 EXTRA_OEMESON = "-Dman=false"
 

