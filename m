Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527A2CD5BB1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 19:33:29 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4338.1779824006756417948
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 12:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=mmSY/Wqo;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-911501a99feso1318109585a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779824006; x=1780428806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCCoyw6Rug39R0VC3VSTMPTPxiRaCmlAZVV0gF/9w2U=;
        b=mmSY/Wqojr6IM0oYMgcPhf+qskOJFpMsPeORkqKGC3lQ451YrwvukN0H2dOx1lDJqm
         LNEao5Hcj6hqo+694cEGUmNsRCw4IDjEfxMdVAuJFXXIYkQhwsYOswRRmEt0AcgT8Kc1
         q/LNxwiuX68KZRe6Z0jiik5uRnsIYRGoU6RkxWTGetXWuUEZ4tzzUL05hRnQGWFyZkJ6
         ndr6dh4BHXAM1BB9mIM2q5FpHVg76Nm1UAK8YuY51qOV3G8c6zFrzMv7YHR+1v2rzZ1T
         UkFm5AvlxYvQ5IK7/ozp+oFQecNh2/qLGGtTF0QqUtpKOG5dti6Gm+2rYrkToupR9HoY
         MIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779824006; x=1780428806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TCCoyw6Rug39R0VC3VSTMPTPxiRaCmlAZVV0gF/9w2U=;
        b=fYqZ7EaSAf1FKKv7wyzp3MC8PRCa+QCQ6XNOC70vLIQ5aD1fighJaM1ShvNjwNVcER
         XJJbfBQvqnYQ9oORpGeJBjpbvMxeC1gpKjBmf027IyFXkgCoWiovzfiCvqsCl58qpiIj
         LzK1p/6rPGB46HoXcVvPIwccsb/Gj6UeDBJHPmMTz0lIHAsocTTWlAuKcK+yVXSBE3CU
         M9LtX5OnT0RYHKJg9zS+NesZbL9MuCXXhDvaK/auBRjYfSxq29LQvsVQuUCggWdIyVUY
         rjQ7FkNVXR5DGLtZLfWaa+y8wzIYNRgDhbAv/KWBGQvMMwsr7e63DVDdGIBgxsw5SGlo
         o/YA==
X-Gm-Message-State: AOJu0Yxm0oj8LkPc9rAx4hl85PmW4nAtxgmZjOGGvuDEp69BLLy5CjrF
	w+zOG5UX3TUlrch+gB/+2CZNoQqNKDYVRIcwj/2mge1OPDXapIPCV0Yqvj8iwxfeYwAoy7p8L9F
	0mkMc8Q8=
X-Gm-Gg: Acq92OHxj1JzqfwLOYa3xeAWwDrGUyZ3xz27EnNJUYPdMHW/OBCG55/CAWERK3CW7jw
	xN+kgCUef194vj7RsKjnovA6kMtyt8gtfAI3fY7vTZCvzYFJio9G9/jp6kq7ZCPvisqvmB60FAl
	eTCJxdtnfQ3qq5QVI1v1a/5LUyxBTgW4ZD063uwYxWCyA/PCc27cm/+QT894TEX56+mlxIB6hk6
	Ndp2pAaI91y7K4upLpi3/lsD1nywGu7YCE/kuULQQQX9pO7OZinyCkUFUaIzKySTLhdRVD9kfZd
	hkxCGZyot0UByUjmzzdBlN+9olamLYohjrN6BxaRaVHeYx9WxV7EWgoQvwDQP18yYjCMw5SApMF
	vu1OsqzC5oG61EyoU/IQrv9voFEde+uuGUHee91Ad0bOalEUvJ4ZV4qHtEbvKu4oCM2lT4UU++f
	xVvrBnWCALPcfZ2gkiEJGJEKWjYg==
X-Received: by 2002:a05:620a:a2ce:20b0:908:8470:4e8e with SMTP id af79cd13be357-914b49a10a3mr2121733785a.37.1779824005760;
        Tue, 26 May 2026 12:33:25 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87d1744sm293111285a.22.2026.05.26.12.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 12:33:24 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 2/6] patchtest: check for meta-selftest
Date: Tue, 26 May 2026 15:33:13 -0400
Message-ID: <20260526193317.807459-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526193317.807459-1-tgamblin@baylibre.com>
References: <20260526193317.807459-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 19:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237620

The patchtest suite (in particular, the selftests) makes use of the
meta-selftest layer for full operation. Make sure that the layer is
added to bblayers.conf before kicking off any test runs.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/patchtest b/scripts/patchtest
index 6dbb5adb15..e8ace03905 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -167,6 +167,17 @@ def main():
         logger.error("patchtest: there are uncommitted changes in the target repo that would be overwritten. Please commit or restore them before running patchtest")
         return 1
 
+    builddir = os.environ.get('BUILDDIR')
+    if builddir:
+        bblayers_conf = os.path.join(builddir, 'conf', 'bblayers.conf')
+        if os.path.exists(bblayers_conf):
+            with open(bblayers_conf) as f:
+                if 'meta-selftest' not in f.read():
+                    logger.error(
+                        "patchtest: meta-selftest layer not found in %s - add it to BBLAYERS before running patchtest" % bblayers_conf
+                    )
+                    return 1
+
     if os.path.isdir(patch_path):
         patch_list = [os.path.join(patch_path, f) for f in sorted(os.listdir(patch_path))]
     else:
-- 
2.54.0


