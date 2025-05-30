Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94924C5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 21:22:46 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.457.1748640157812923210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 14:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YO59u8pY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234d3261631so18158575ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 14:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748640157; x=1749244957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEP+0+jvLGI6dPnhU68a4VwFYm6ClLTEE6Ii1qAV6BY=;
        b=YO59u8pYqVmC658l2F6ijBsmF6Us93MxX0RYBuQKZ2ZfjxJ06wlD1SulXtxY7NvJP5
         uXl38T9N1iafwJ46LnKTVA/t/thzyq439vr2M67mJP6z64RW0hMrAZfk4r+4v2fu/qU6
         h7by9cfB+G9FMZvZu7R0tWV/rf1PP0FbYZ+jxl2dyuhi686vBhCjH/LtVb4gbzxzl9nC
         HzG6pYKL9rp4TScUwJ99IKtZuEPz2A96y6dc/GTUabIgnTCerPThqIww/nxzr8/mKJnH
         kpWFsRnW+Qt7OiymGLMJiadHbbezRLlqR1SaLMS8DU2jpAOhyRPBj3eiROyILkdQxdpn
         N05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748640157; x=1749244957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEP+0+jvLGI6dPnhU68a4VwFYm6ClLTEE6Ii1qAV6BY=;
        b=OLGe5uDCk7Yo+Z+KgL4b9tfcQ5VB8RMzDUOlGETFrzcRb8FcJ+0yCubiZIOYex7GnY
         tOe/qJ12frXwtR9nUgZAk+YyE/ZydCOnfEHhw+E7oMU4/GJA4tbcFOQaaQ1zhd7fWgLJ
         fSJ0juW7oXRoN1wMYMg715TaHSnct+GsCAQDymedWMaicLb4ae5ApIVZkbdUrHwTPvE3
         B52QTSBbIGrJ365W6wXbB/qvdBlAtMr8yMfADWaTZJyWZygCxZsRshQw1Shm4bnvw9Wk
         EhWCp+YRNCq3Pu46m91bnx/I74QCOJh6FYftYNIcmtkU5IT/s3FR+4ZjpiFNpyJy6hAZ
         0aRQ==
X-Gm-Message-State: AOJu0Ywk/QaCZnrF71HdHCTKE9cuA+cXSQmmK3l/yEo9woSkb9coEqj+
	Akq3lQk3iHjeYnpmXfM80sFstmDYB26NmJRCMjP8vWDBNj9i8ICpRYNZgwoMdFFi4JVmlKD3252
	xMaLY
X-Gm-Gg: ASbGncuCz/5lUZTw8STtf8bl7kntmlurIDg2eJTZEJe/xCh/fZW9+8p8EuG3DhBtQOe
	78g9wVW6fiP64wiaqAibz/w/74v32OT0wMajVJriv8oKpeQm24+TPmQ7feRsnLdk2+canO0meGp
	5u1ATTJ+OK0YW8cbSAl17JLKBGkmJp8PhpDm0QI/KN87GKWT2SsjG9//BJsmsTa+oMqWFDjT6zE
	Y8FS8ZdMzFaRg95ouQKE0F5I495DCm7f9JMOaoPMgaquHyqWaG1E0ovRYmoDb6lc8cS8PIRvcoK
	2XzB5nRk/OaboNmaBnxLtPpvsZzeylqq8Tw3YOLjkHE=
X-Google-Smtp-Source: AGHT+IHUner+zxNWPzUtbFjKoPH1dyXQcQz+06LQIIzHEwdPmAId62jIUlxgscONX34VW2nV1wce3g==
X-Received: by 2002:a17:902:e5cd:b0:234:a3d2:78fd with SMTP id d9443c01a7336-235395e2db1mr53781785ad.36.1748640157059;
        Fri, 30 May 2025 14:22:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506be2622sm32621815ad.102.2025.05.30.14.22.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 14:22:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/14] sstatetests: Switch to new CDN
Date: Fri, 30 May 2025 14:22:04 -0700
Message-ID: <5273129966d9851ae1fa47e57bce5448aa5ae38b.1748639952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748639952.git.steve@sakoman.com>
References: <cover.1748639952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 21:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217552

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The project is switching the way handle our CDN provision of sstate objects,
update the URL accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fea96974f1ee6ae6dceb39e3ca8157797d81586c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 86d6cd7464..4a2c425ac8 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -977,7 +977,7 @@ class SStateMirrors(SStateBase):
             self.append_config("""
 MACHINE = "{}"
 BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
-SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
+SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 """.format(machine))
         else:
             self.append_config("""
-- 
2.43.0


