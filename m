Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722A6C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 12:12:07 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.29104.1698927118317885711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 05:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eHWBzr/m;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9d216597f64so128881766b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 05:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698927117; x=1699531917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rgbkwV0vPCBCYWk/boqCRCxYumhZ7394TWbGyre+RuI=;
        b=eHWBzr/mv6xRl9K5DzW+TvpMkQxjMXjXWhPIkkEukMQtAUC3GxVe4gG74eUqQZrolB
         +uhSymo0ixMd5Z2dqRzw0UDO/j9RjJGYjYojHNs+22Zk5ertLozkxgXMMeNLX7YKKsru
         u+qBI57zjH8Nux2nMOZLIoIoppD7zG8skZi4t1eMQWs678HK7u3exMXNzA8m0JlPDJNJ
         67iwO6NcBDM9ERzob8XP/Fr6onejuIc5TFLnvpaGVBumhL93YMiLRImU6IY4tt5X2rxp
         FhLY37B5QnAgrfjM9wxGGvhyRIAj6C7+UB6r1TbiUdtvMGfC2G0dn7JQwZObYTqILI4j
         QJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698927117; x=1699531917;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rgbkwV0vPCBCYWk/boqCRCxYumhZ7394TWbGyre+RuI=;
        b=FLtYcGQPQTnjgjZF+ZH0ETXpN3Z9eHzvaQxOYm3zfO5iVLjk84htiK0FaAG4s/u3cx
         thBTICnyqNS65ch4RP8YflBwzV8HcngdclHaosaXdPc5ME8YjtZKc4BzgrIMaZDJuiBI
         siwJ01b07oYJ8OpiWVhlLMlkRlGUBGvECAnc1emsw4MTG5k120nZ3hmk8QrwWJYlMh1Y
         /2aZ0Z2hsjKL9qf1mbhfGJzEG01tn3BM8cGchnrFRMJEzlpWIVZPl3HwPQs4mqoAXiuA
         b1hq6b+mnUYl7N1a+8+IftZvFTsVZ3iXlxQm03E5J/TA64FwrgpPZ02VItmpO/f8HeIW
         DX8g==
X-Gm-Message-State: AOJu0YwUcbBDlLWFMjtBLKKluWPBlGkcTTrL5raJsRzaBc1rwO/6tkLL
	1OfQugOe5aJBP5nRDhPEFYqsw0iZ9Zw=
X-Google-Smtp-Source: AGHT+IF+D6ENUbcsfjywj0HUvA9sVtL74a/9N2NFG4P2reizFvmhxQi6viyLEoLxFCbVy5p/xAdQgA==
X-Received: by 2002:a17:907:26c7:b0:9c4:4b20:44a9 with SMTP id bp7-20020a17090726c700b009c44b2044a9mr4777473ejc.65.1698927116728;
        Thu, 02 Nov 2023 05:11:56 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id y24-20020a17090629d800b009ce03057c48sm1065838eje.214.2023.11.02.05.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 05:11:56 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH 2/2] lib/oe/buildcfg.py: Remove unused parameter
Date: Thu,  2 Nov 2023 13:11:32 +0100
Message-ID: <20231102121132.1148-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231102121132.1148-1-jermain.horsman@nedap.com>
References: <20231102121132.1148-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 12:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190079

From: Jermain Horsman <jermain.horsman@nedap.com>

Several functions included the 'd' parameter but never used it,
additionally the value passed is always None.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/oe/buildcfg.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index b9d32c7cc1..b3fe510309 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -5,23 +5,23 @@ import bb.process
 
 def detect_revision(d):
     path = get_scmbasepath(d)
-    return get_metadata_git_revision(path, d)
+    return get_metadata_git_revision(path)
 
 def detect_branch(d):
     path = get_scmbasepath(d)
-    return get_metadata_git_branch(path, d)
+    return get_metadata_git_branch(path)
 
 def get_scmbasepath(d):
     return os.path.join(d.getVar('COREBASE'), 'meta')
 
-def get_metadata_git_branch(path, d):
+def get_metadata_git_branch(path):
     try:
         rev, _ = bb.process.run('git rev-parse --abbrev-ref HEAD', cwd=path)
     except bb.process.ExecutionError:
         rev = '<unknown>'
     return rev.strip()
 
-def get_metadata_git_revision(path, d):
+def get_metadata_git_revision(path):
     try:
         rev, _ = bb.process.run('git rev-parse HEAD', cwd=path)
     except bb.process.ExecutionError:
@@ -46,5 +46,5 @@ def get_layer_revisions(d):
     layers = (d.getVar("BBLAYERS") or "").split()
     revisions = []
     for i in layers:
-        revisions.append((i, os.path.basename(i), get_metadata_git_branch(i, None).strip(), get_metadata_git_revision(i, None), is_layer_modified(i)))
+        revisions.append((i, os.path.basename(i), get_metadata_git_branch(i).strip(), get_metadata_git_revision(i), is_layer_modified(i)))
     return revisions
-- 
2.42.0.windows.2


