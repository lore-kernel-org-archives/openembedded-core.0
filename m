Return-Path: <pistora.tobias@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03D6C87FDB
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 10:52:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.45429.1754909533940209745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 03:52:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jwr0M7Rp;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: pistora.tobias@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-459d40d16bdso28143875e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 03:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754909532; x=1755514332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EbBeUlky6B1Ypfx4VcaE0LhnnRRUGRC6WlBQSjgw7n8=;
        b=Jwr0M7Rp4ip9l+tLvU81JISkusQv4PqjFE4BW9QlmpSm0TxIwA75qECzXbo7JqCeLf
         HSLfUpjAJSNCieE9WJkm0cYJapxYFNDhNgEB55z2UV/EidGIXJj+jT5fyeKs/bg4mgEY
         ifgcpn+uUfvTce4LWCWLVdb2brKjcrAOfFBf0UDYm4EoAO3BTL+faSbE4j/KHACFRPi2
         Rp0SPnQKyvQayM2ffs3H9V81CI5vGYVE9s+GjI4J/X5C/3Q60xPG7sp0glBnB7LlWEjv
         AknNbYdiNboYiiGurEdCqmkTeDW//yTdSQRp3RFaHUu+79+3vere10SNe2C1n3BJCg/f
         YUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909532; x=1755514332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbBeUlky6B1Ypfx4VcaE0LhnnRRUGRC6WlBQSjgw7n8=;
        b=M7XSXdxq8EC1rfXNi3MMg+qLG4UcfTMRHWaMZFNtliAdVwfSamIFWKlRQ/DHG5x1jH
         p2zbpmxwbDrnzMLYyj8rhKf+Oa6i+nkBxNLfW/YRPYRV0XsKP3jXbqJy1HLKol5P1evC
         Xeb60u4fc4zA54RB+Q38+74Xu3P5VkKvG6esOCVK/VQsTHpNsYOzl3PvZCXV6kag7iAU
         D3hI7DrB8DbZPuzZXeHnkZPz/nYz+ZGM8D9LPRESdzD+zd7Ne0MjyGzBr4/5iVxuKwDN
         49J2uwxZg26wgJ93V8eKrDeMOUPJHZMGokbQ484jxqhF78sPXIYUBlUoMevzQRvmiUkN
         EcgQ==
X-Gm-Message-State: AOJu0YwGZDN1Wy4saP8TRiZf0OSb1vXwhfO5X0fyoWw4+lpfBo1zh8fd
	jBCrIH4XBU6ePl9uSf+9A2G3l5irIUH8zOpnfstIZ4EXV7DDjE99qTG2QcbX8lbW
X-Gm-Gg: ASbGncs64ZFiuuzJuQ0faCsDUdZM+Yrnw55IUsDInY5qe7zEWlbeCmQwP7Jypz2jUHP
	jCt6+Dl7QodwCBqVC5VywFv2WueIh6KPOb9J3kGSCdo5CAB/+pe0CK2080Aj97//iVCsdDPv2w3
	/rpxAcW0Cfke7KSwOpltl9a9MC7J0sBlktxIH+2aPI8OtiVlKs63TSbVdX8HlK/q5GHnf/JNGVR
	0hwtyPXY3G9EQlXNW59T6q7RRlKIo71lt9FFXaNWXLw/kFGotzHV9OTYQSWUtTNDUpW5ePdcgp6
	hIil267piAOy8qXzYYUv1ufMKtQdR8x3NEYbgZHu/F1EGOHZqHqkC6NUAAaum9kMH3gd9WZyBHI
	Ut6aCMoT7YYrd3I1Ix4wdL33kwkbxyDwfjct8ZPpmXLYSQopxsOq6LkacrpHcA5+4gJpqvCwO9Q
	==
X-Google-Smtp-Source: AGHT+IFavfwkuP0CRXh/LhJ8G+kUdKtudYkNgS2SPiWQObbEX3LGQ9ci4UfdyA5L/xBdNF0txSjlkw==
X-Received: by 2002:a05:600c:4f4a:b0:459:dc92:b95f with SMTP id 5b1f17b1804b1-459f4f3df4bmr110356535e9.5.1754909531939;
        Mon, 11 Aug 2025 03:52:11 -0700 (PDT)
Received: from debian-workstation-pto.wien.schrack-seconet.com ([81.223.165.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458f713eb44sm373842945e9.14.2025.08.11.03.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:52:11 -0700 (PDT)
From: Tobias Pistora <pistora.tobias@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tobias Pistora <pistora.tobias@gmail.com>
Subject: [PATCH] devtool: fix upgrade for recipes with git submodules
Date: Mon, 11 Aug 2025 12:51:15 +0200
Message-Id: <20250811105115.33419-1-pistora.tobias@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 10:52:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221731

Fixes [YOCTO #15943]

Fixes invalid path argument while calling "git rev-list" from submodule folders.
Replaced the local __run() wrapper function with _run() at "git rev-list" command calls.

Signed-off-by: Tobias Pistora <pistora.tobias@gmail.com>
---
 scripts/lib/devtool/upgrade.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index d9aca6e2db..dda0a58098 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -280,7 +280,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             # note is still attached to the old commit. Avoid this by making
             # sure all old devtool related commits have a note attached to them
             # (this assumes git config notes.rewriteMode is set to ignore).
-            (stdout, _) = __run('git rev-list devtool-base..%s' % target_branch)
+            (stdout, _) = _run('git rev-list devtool-base..%s' % target_branch, cwd=path)
             for rev in stdout.splitlines():
                 if not oe.patch.GitApplyTree.getNotes(path, rev):
                     oe.patch.GitApplyTree.addNote(path, rev, "dummy")
@@ -298,7 +298,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
                         logger.warning('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
 
             # Remove any dummy notes added above.
-            (stdout, _) = __run('git rev-list devtool-base..%s' % target_branch)
+            (stdout, _) = _run('git rev-list devtool-base..%s' % target_branch, cwd=path)
             for rev in stdout.splitlines():
                 oe.patch.GitApplyTree.removeNote(path, rev, "dummy")
 
-- 
2.39.5


