Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DB3CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:09:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.33376.1759756146735920114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 06:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XX90ZjUO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so47665875e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 06:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759756145; x=1760360945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhZ2nURZcmQNSltd2b9d1j7Sq34CYkCsqHW2gNrcG3k=;
        b=XX90ZjUOc6tjBR1ZKknDovdeX0E8ZTaeotiZEC0uALS0Td2+99X9EmCyd8YvMN6UNq
         HjaHlFx7GfZnjWqTOQWygdqhTw40dOUf15Ubl6qGLRK1VPc7kx5SGhrNrYD7ghttFx2B
         kncKLieezSlGT/suiK0+8FmE1auiByViVpJ6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759756145; x=1760360945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nhZ2nURZcmQNSltd2b9d1j7Sq34CYkCsqHW2gNrcG3k=;
        b=XwO9ZhT6d8cSMRuiLasD8GJ3hnfBKi9RYw2S2UXXNv0iXEtelqtvCgRhnMNhsvwPQi
         h7XVntli+pC+SkB/YEVvWizI6S6a6oqqF6Gd7TXlYPBxVcNX8qCnhMwgzMdurJjuZMHV
         qmuZVGHovd5l6c3tMpsP/9IuZE6kqp8/R3SI8+up5ijNNXAEmKaWhivFdyeSy9zwENI8
         JYideLNICF9RitiYlflsttfAYkegUtFjTo7yhWUWzymqQDG9pWWs4GnHHsnMw8ADQu8X
         Zh4J+3VPcJZmlcJ8PI2R7bUbAqjTzGkR7YkWduM1rkl+rXlBj/EJ0R9hRtgFb8YEsc4P
         gmXg==
X-Gm-Message-State: AOJu0Yz/7YD6f6r4C2QaAvjfIzwyBOJ+D0h28XVjX+5+xf5H4lN7KjIL
	ZWQNTpTvxEQ20up5Ygzm92bfQ/nQMwWUTDROc3aD156BhW6FzFcjMM/mhne6UpZKbaBxk92OKgx
	F9G5d
X-Gm-Gg: ASbGncuI5/z3BRBuV7NzmZ8W+EqXHG8bk1IjXYqZr3Mgi2VqaKgkUFX4UWnUZFowDUi
	eIbVu5oASvC+oq1cCsLIQTXLfgCDpG2kJGWIH2Y5Dme71Y/WwJiBxX3QP4aKnTI0NI4GLiPrhJu
	TQO0o31FSaG3HOqXTs8/U/FMYsXLlcFzCIgyYim/fKlEux2O687c3CblgXjVV39sYOZwQqwfX56
	2pn8I3JoQWq5+GvyZAdsAgWtInIYrGps63YOG+nNlMM1GjWM/AvzNE5NlDrkaURDVahO9kQ+ljn
	hRanCcHDj/ct8s94raaWseLwdLHgkhTIabcsH87IfZNVvh6gNl2ZC6wMkxI1TvTYAvSq4uBSDSQ
	9W+aG90UjvlB4tKXlNss47h44niMZygfO8XV3E9Ml1c9w7i43Z/W6lt6vJRtJQY3ugP9AZ4ahuc
	L59FYaQ9fd
X-Google-Smtp-Source: AGHT+IFHjvqgNj96V2zMhRy1hbWgbGXnU3By3K9phuxtANEuPgRaaMTJkHV2ScAuVV79RUg8O3MXog==
X-Received: by 2002:a05:600c:8b22:b0:46e:4937:dd1b with SMTP id 5b1f17b1804b1-46e7113f670mr108182965e9.17.1759756144486;
        Mon, 06 Oct 2025 06:09:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3e9a:117:edd2:a796])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f4abcsm20657928f8f.53.2025.10.06.06.09.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:09:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest: Fix single threaded race issue
Date: Mon,  6 Oct 2025 14:09:02 +0100
Message-ID: <20251006130902.846106-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 13:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224479

oe-selftest sets up separate build directories to run the tests in.
To to this, environment paths pointing at the previous build directory
are updated. In the multi-threaded case this is fine as the thread is
destroyed and the parent remains unchanged but in the single threaded
case, the environment is broken afterwards. This can mean we try and access
a directory which is in the process of being deleted (e.g. by clobberdir).

Restore the environment afterwards regardless to ensure the single threaded
case doesn't try and access the build directory which is now being deleted.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 16f82c6737d..c9eb4817253 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -44,9 +44,13 @@ class NonConcurrentTestSuite(unittest.TestSuite):
         self.bb_vars = bb_vars
 
     def run(self, result):
+        origenv = os.environ.copy()
         (builddir, newbuilddir) = self.setupfunc("-st", None, self.suite)
         ret = super().run(result)
+        # In forks we don't have to restore but in a single process, restore cwd and the env
         os.chdir(builddir)
+        for e in origenv:
+            os.environ[e] = origenv[e]
         if newbuilddir and ret.wasSuccessful() and self.removefunc:
             self.removefunc(newbuilddir)
 

