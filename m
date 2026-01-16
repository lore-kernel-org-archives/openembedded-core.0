Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63822D4898C
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 11:59:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4497.1768564792059884240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 03:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EAStx1rW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47d1d8a49f5so11778145e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 03:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768564790; x=1769169590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cJZf/4y81aAUn+69kw9VQg97stYUxekHqG6yE1ovQQc=;
        b=EAStx1rWSfPhNs/5msDoVfcYyb1nq4cL1XuBJIxHJUHb5YDUcc2JL+6u+Nh3/VtGXV
         LVKd/bPD7TpkcfOz2Q4Pfag+IWC05HGk2NOQ601l4KG3ULG70oqmqmVsF1oHq2ZHLHbp
         etnYk45JOMW1/Q+lxTbobMKXhcLJ8Yptx0cuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768564790; x=1769169590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJZf/4y81aAUn+69kw9VQg97stYUxekHqG6yE1ovQQc=;
        b=EiJIVJa0UKX3skpf9o6eM3K4cZvyViQ/wlYNY+/QKMpWVKAp/tDo9CsV0yY3rmhOP2
         3fFo8NmfiF4DhPVqiPpIUh5v6LgzNEk1Hy0ck6EVfbqs75oehvm1enbbK8O556X6TOjn
         C0vGFc7GufFIy9/zp2gzRuvYS9uZSgbPIMGIXyeKV/xt78DN6KgQDkD24vztHzRhHwmx
         qohga3DsH/FJdbYT3AiSv08cXcVoBquLRP8pHKg1jjUS52oh8cYmMuvYQTWjFPLKV87j
         tRhMLX+5RzUfH3qkdKZTN6ofQTAhoLNySCv9I4JNfoa4S61R8dxaQEqJTIVR7+zih+CI
         P6wQ==
X-Gm-Message-State: AOJu0Yyw8Bg1uCOorMPUIA04qnh4p7PN4hT8OxNYiXXeOD5PMg6KYPTY
	rnojEwQs4Id7YFm/EdEJExatz7IGCBN1EVT7PVgxSmxfkaumTfoI3wjdNdxKqJuvKlKz9KvgbVe
	SGfrDu9Q=
X-Gm-Gg: AY/fxX4flzjVyHdkeFJbmphScK0G8uSELsu7bD8yeU4Ama8QhXCdD2kFHoBmx0mr7cX
	ncYoOyFlPkdwr4klLCI7xaJ0ieKSNYzu1CvaaU00ZrKazWrJSTa5xq7o/yQR6SLPiBGkco0HwWQ
	OjNJ5kR+fSyoN+Djyby8JZDHMNuQuSxFBmBaggLUHTb1ObRGkS0yNSpJDwu/xCwGMMU01PMt7mB
	fR+y/DCkQdMcyqBh8t6Z2hM2gijIf49yWZ9BtEskncFi+NgMIiGDssDBjqHX6v7D5GQKx+FzCEK
	9gFIzwtN6LyGJmLvGXWslSxdYOrQX+yshyoSlQG5SsPf3FfhYzRY7cdr6uJ/zxhn1dz5f6EFi1g
	hEpyfA2X3O59b7oZOv+wiPIRnca6rFyTsoBA5b/8nj4A+jzkqYTBNS9E8j+d7Lqbl13XQEjGcrl
	hP7noMP1YXOII3uDLSw0ptfCr/fv2GtH00N24YwZw=
X-Received: by 2002:a05:600c:4684:b0:47e:df86:e83d with SMTP id 5b1f17b1804b1-4801e3484b7mr38321015e9.31.1768564790021;
        Fri, 16 Jan 2026 03:59:50 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:51c8:b033:6424:aa11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b2755absm118840165e9.15.2026.01.16.03.59.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 03:59:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/oe-git-archive: Ensure new push parameter is specified
Date: Fri, 16 Jan 2026 11:59:48 +0000
Message-ID: <20260116115948.3100906-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 11:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229545

Fixes a regresion in "oeqa/gitarchive: Fix git push URL parameter" due to a missing parameter.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-git-archive | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
index 9305ed0b0f9..9484fc53c7d 100755
--- a/scripts/oe-git-archive
+++ b/scripts/oe-git-archive
@@ -106,7 +106,7 @@ def main(argv=None):
         gitarchive.gitarchive(args.data_dir, args.git_dir, args.no_create, args.bare,
                               args.commit_msg_subject.strip(), args.commit_msg_body, args.branch_name,
                               args.no_tag, args.tag_name, args.tag_msg_subject, args.tag_msg_body,
-                              args.exclude, args.notes, args.push, keywords, log)
+                              args.exclude, args.notes, bool(args.push), args.push, keywords, log)
 
     except gitarchive.ArchiveError as err:
         log.error(str(err))

