Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052C6C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 19:47:38 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.3202.1744746452966650278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 12:47:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R8sEZ1FS;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so7763647a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 12:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744746451; x=1745351251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=InN8SLJszeAzi4k4AejUnIA0HrMdudbJDxB0qzSZDKw=;
        b=R8sEZ1FSxu3VFzK+QoZqwGdHdg5tZUqM+CNb4cpW1ujDPAt9FWPQbafp+7tsD2Eirh
         4DbBmPgh3Zu95ISF2T2FjrwNJ8D7ZkvlokqS1EKarDJwTa6lcc+7BylbVzvwWEnQj9Yv
         jrtjKPg8xxJtrLTQ3rhqdXcbf5qSp9f6EJNQv9UacHSeud9TLOCxruf4CJpyLaIkZ5SO
         5IeycoiMNVjP0VLTzONue4boZiduvoFkManCAaGeVR473gCb9yNhJzsPuQeqBhQ12rBv
         DX1xlTzmbU+daOvq9ycxFE/kGt6Yf4TuI76woq2Azai+SGfQudPH3pw08S6V1P4DkTw9
         08Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744746451; x=1745351251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=InN8SLJszeAzi4k4AejUnIA0HrMdudbJDxB0qzSZDKw=;
        b=un4WVFgRWCEtq1TFBAWGSOkLM84xJ6ngpPbB78zrXKjPFFsGqtz6ZyOzBOTJ7COqRj
         hz+QnMG5tT3QBTqFAjgmTIB6WTKCa1fHUbfrnl1oXpTjXXehFv7kErgj/23T3bNITE8+
         MGELr6vliMZULo0x36CIcmXkdZZpedl3hwhJSv8A8i4qIRWWj3nZo/hdagQi4dWfw6FS
         r0iHyVa5rqYj1Qf7AAApSvy2dQGGkbNQk6I1vneJTokb1fHFU7nBpcV7g8MeYauN0Pgw
         ED/44noL+wv5EIwv6tGYeEMSUJlRNAKa0nGr+H4P6xqJ7pjJAEjCTUOl4+8ZvlL8aUah
         is1w==
X-Gm-Message-State: AOJu0YxlfeCP+ODCqr7e+US/pL+aohPB76y3KeRsTyk3a66zP5wDtym9
	WibSUvgFcIK0LPirj77G+v8Bk5Ey2VoorIS6H92bHUJDLqXsJ2L64EhQOwoE
X-Gm-Gg: ASbGncuAdoSwXweb8hzYiDuvmhdol8cCAyycaq6DhrmOzfuVyamNwWE2+0CWD6nhpbW
	CAc6Av9xNq5DHuCTqajyK9A5D3qwyWAaA4mRwbNZ8htvuflIhUugL/M8B7YN+sn4VNs8p7khqAE
	7DAoMqg8vsiFEvdpfqjG5OEXsPymoVwn7xPee6amOfWA+GzTxhHXqBpnwptdZt9D2K4D675s0JO
	+zc8kkIQDewNct23EHa6deY4jJl9VZcIP83ewShFFPysHS0okbTV1sULEORtRUqqIGVO7U5xzRv
	zMKBxHVrDhi6JTNiB/PYrMgx/0HZiKwh3+3AIp4mSmU=
X-Google-Smtp-Source: AGHT+IFs3IomG4VkSJtzhockUAaTJkt0nhBlEuBmtOF7/2aGx2iHFq6NE3yOnw0KYCjOxrDiBSOnEg==
X-Received: by 2002:a05:6402:34ca:b0:5e5:bfab:51f with SMTP id 4fb4d7f45d1cf-5f49967fa18mr420878a12.0.1744746451037;
        Tue, 15 Apr 2025 12:47:31 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f36f068968sm7158866a12.35.2025.04.15.12.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:47:30 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] buildcfg: get_metadata_git_*: catch also bb.process.NotFoundError
Date: Tue, 15 Apr 2025 21:47:26 +0200
Message-ID: <20250415194727.157145-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 19:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214966

From: Martin Jansa <martin.jansa@gmail.com>

* bb.process.NotFoundError is triggered when e.g. oe.buildcfg.get_metadata_git_branch
  is called on non-existent directory

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oe/buildcfg.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index 4b22f18f36..85b903fab0 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -17,21 +17,21 @@ def get_scmbasepath(d):
 def get_metadata_git_branch(path):
     try:
         rev, _ = bb.process.run('git rev-parse --abbrev-ref HEAD', cwd=path)
-    except bb.process.ExecutionError:
+    except (bb.process.ExecutionError, bb.process.NotFoundError):
         rev = '<unknown>'
     return rev.strip()
 
 def get_metadata_git_revision(path):
     try:
         rev, _ = bb.process.run('git rev-parse HEAD', cwd=path)
-    except bb.process.ExecutionError:
+    except (bb.process.ExecutionError, bb.process.NotFoundError):
         rev = '<unknown>'
     return rev.strip()
 
 def get_metadata_git_toplevel(path):
     try:
         toplevel, _ = bb.process.run('git rev-parse --show-toplevel', cwd=path)
-    except bb.process.ExecutionError:
+    except (bb.process.ExecutionError, bb.process.NotFoundError):
         return ""
     return toplevel.strip()
 
@@ -39,21 +39,21 @@ def get_metadata_git_remotes(path):
     try:
         remotes_list, _ = bb.process.run('git remote', cwd=path)
         remotes = remotes_list.split()
-    except bb.process.ExecutionError:
+    except (bb.process.ExecutionError, bb.process.NotFoundError):
         remotes = []
     return remotes
 
 def get_metadata_git_remote_url(path, remote):
     try:
         uri, _ = bb.process.run('git remote get-url {remote}'.format(remote=remote), cwd=path)
-    except bb.process.ExecutionError:
+    except (bb.process.ExecutionError, bb.process.NotFoundError):
         return ""
     return uri.strip()
 
 def get_metadata_git_describe(path):
     try:
         describe, _ = bb.process.run('git describe --tags --dirty', cwd=path)
-    except bb.process.ExecutionError:
+    except (bb.process.ExecutionError, bb.process.NotFoundError):
         return ""
     return describe.strip()
 

