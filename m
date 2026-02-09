Return-Path: <logan.gallois@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E595AE9461F
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 23:07:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8011.1770678425718728499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 15:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XRs1c8op;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: logan.gallois@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee07570deso31286265e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 15:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770678424; x=1771283224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAHjBItgoq2EDdKpB00uHA2sUZrn4+69NEVQNovkY4c=;
        b=XRs1c8opRpJ3E1IaW/QYg3eKWJeYJ92Jlf88++Zew/vd4zhXZv4rvB5VQfXypRcrMx
         kBr7m5unsCBSmO++zDZeNn4OK/mQUuVLHysO9pM/eNEfHBMOTEZ0EL9Q5T9HUUGtuv7L
         KCQtV6PIm4XKdWlS4RWiO53hLJB3qTTEMrIIqTwMbWkpEFCnp37iB6sB+K0bgLchbXiC
         guonUEKLc5/dDmfF3WpbYn5n7F23P17Zs9IdPPQhNfvHDogjjn3MgmL4Fvt5p01t0dvn
         tpEoTo61+VwWZrp6kssp3A1gCFOXxkCmfUTjxc0SvQF6EyzVXfaWLSFj1dooaTIeOJez
         sxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770678424; x=1771283224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OAHjBItgoq2EDdKpB00uHA2sUZrn4+69NEVQNovkY4c=;
        b=hOf6LgcW7BcsAoOvDRoy1qchYOyzyDAAqYqjhzx97eD7MvnpV92W/BVO28Y90yP081
         FskbLJdt7nH8mf5LqwCKXhEKqvUU1/mf5oYrm5/qPIfpcwyeYWILmTgmxqOy4CRuyGPt
         BRK0HQji09oAijwC+veuMDhPM9SfjuFHdeu7SJvc07tTSYfGNRywCRlXRqbbiiGl9qCg
         ZjXGPoXqhsbLoU0KtjtXdZufM/rDt8pZ/jtAGA52vmn3Wc1hOL/ga8X4eRX7TXTXNKwq
         4/1Hlzv8a1J7Et9JQukfNrYPN3Es2ZVDIhNEca+ibdf8UvZdYslxpcpvxkTbKqpn1oLd
         F8Pg==
X-Gm-Message-State: AOJu0Yx0bV0ZusOsQZVqWPqTZ9X1+qHqMp9HLzZzmdNewdawAxy22rrS
	scxk3hrgPMl5G5pZSq1zjh/ImFUwWs97qXV0TS49ACFMVdvCsfbqJ37O
X-Gm-Gg: AZuq6aIZpxXk4Z1XuzbKIUvRnWJU+AG+g6ZRLV0A6xSXeb6nzcD99IHGpRwZHzY16Gi
	DmMuzpxDE/ArDEBeN3rl+Mnm6v+ihs/d/pT/i7sQ9zzGcPQ8IbMAm/PMubhUiHY2CYd140wyEpo
	E/TSD9pHzQQ0R0NUs/z+oV0IFTwZK8iptxVPfGSQdyt9ELKdQXH7kh/+Jj7xkHrHg4I/SMRa33M
	Ij7A/WjYZE06pkrgu1UkKu09cZlSO7X7w8aDBKGmuahbhZIyMYNiV2OZdiVHIh93QlMXCOzAlf8
	XLrdz05eIkS74VP0AG7CGKQIP7z3usJNiPbb+LG7b7XYrtr2ANCvVkb15N5fxTNkTqZgwvRIEqS
	feVBX7HPkX4HhMZhZ5peiL9C8zgOlY9LS6XlYdwM8gvh5wlY94uK0Oub62skTUVgC/VSuyr9ACF
	xkh/i9rQAEHh1mL40xII9ScxQ0K0syPs/sT1ev4HNKYQpzV3544dv20Aii7gkKaFRgKA==
X-Received: by 2002:a05:600c:5253:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-48320212d6emr171410515e9.22.1770678423911;
        Mon, 09 Feb 2026 15:07:03 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm32149755e9.1.2026.02.09.15.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:07:03 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: logan.gallois@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-Core][whinlatter][PATCH v3] oe-setup-build: TEMPLATECONF were not applied correctly
Date: Tue, 10 Feb 2026 00:07:01 +0100
Message-ID: <20260209230701.2979-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208144031.3519-1-logan.gallois@gmail.com>
References: <20260208144031.3519-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 23:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230821

Signed-off-by: Logan Gallois <logan.gallois@gmail.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index edbcd48355a..7bcdeee4c32 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -98,7 +98,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


