Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FD6E63F1C
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 22:11:07 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7664.1771193466550402675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 14:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HRZjgoRU;
 spf=pass (domain: konsulko.com, ip: 209.85.214.178, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aaed195901so12034865ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 14:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771193465; x=1771798265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2pGwDEMNL9rj5lShakCQIjtXQYaRlWwjIJQNyoVfo1g=;
        b=HRZjgoRUXEm2MhtlptMy84g4aC728WQA4qGuaRrmgio8jNtc2Aexa5jZZBi60yyat1
         NeXdBVvfcnXn17+w/6EV0L7RA9H8PLDN8nglypcGzxaeUqGPBOjqsrKs3CruBtXmrkcY
         Py70q5alM/V9q9cVjH37e7V94X4GeHCG40aW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771193465; x=1771798265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pGwDEMNL9rj5lShakCQIjtXQYaRlWwjIJQNyoVfo1g=;
        b=qDhLnf4YDqcpQaqAY5Yw98+PGbWzCcqsncGzB0lxuSweLSgvKLiVKX+rAlUurMcKYU
         +ve0XCRYwD7LmSjm/wbhyMJRnhjPqnXkq4cl/HlNfwOK6bDyRAFVn5QsFb5R3fEwNiJB
         sSgH+31f3eQ5erM2vjF9WON8gIc23+pXs4QKp8XiEhiQgQZDFOkxmNJ94uAmm0IloTuP
         6INJvGVj5nS2+/STYcGfno1BbRwy0w7hhLjPPuWn+wj3pi0Ui7xUcQaw8dQ4hA0yLzdf
         BfrLOKSBIkm1M2csSKXLLBKiL3HkIjxtkvqJOhIruMPYotKxsnXQ+wVwcdDu8IyaRX++
         GAUA==
X-Gm-Message-State: AOJu0Yy6lUneuVUpSkfycavyJSI2eA8oYRBgEIhVYfmzIR8ikpWDTAO0
	xRxlOCPqBdebl8ctyMdBWtXry3DIB8rEfB6NruYOdlksuwT+zq6OlD4+O2UnjVQeWWE3erlK5cf
	yfI2C
X-Gm-Gg: AZuq6aJJeeNu32XpVysOlmx2UHghNhSD4dPfsP/THEK+KDj/IAt6z/TN0kFkk2Yb9YB
	1lcbGBCwoGNQbxx7M+QzCqpVX9hix31CImrmY3fmdWhIfBrcIbH6+zCrHFwinCHX4mICYOcohXl
	Y/mW4wtYvKtYGDQ7HWF9stAcDT9i5gMjtfwsoFiHiFf4ny+lv4Os8BBw6a6qxV7PbCk6hn6gPQM
	JgjBROMLkluBaSPJtJjTO3umtzugZZOL7uzXdqCZfDjxU+mqGs91SBjP9AKypOjqdFjXjhLYgns
	YsAcRreXv5sAKEUcf0Tk6jUS54jZvrIfpJeaW2V7NjyML+dQf+ieQ8Gj4929yg3Z8mlr3T0fYWH
	D6boYgLJPkKPKIlhyNUpk7MYItMK8FDC8Ny/4Apq9N5cdu2m1QtyUtGo508QzjBQd8NTrVyIGBp
	Q9djKEmCulr0VL1tzH5/lYCy/Zr3lgp8aj4H+Lkpk/96zj3Cai7f4zNLflVRECcBk=
X-Received: by 2002:a17:903:3545:b0:2aa:d672:3be with SMTP id d9443c01a7336-2ab506152c4mr84906055ad.52.1771193465399;
        Sun, 15 Feb 2026 14:11:05 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aafc527sm47966055ad.89.2026.02.15.14.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 14:11:04 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] checklayer: fix get_depgraph() hang when command fails
Date: Sun, 15 Feb 2026 14:10:57 -0800
Message-ID: <20260215221057.2776109-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 22:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231171

From: Tim Orling <tim.orling@konsulko.com>

The get_depgraph() function hangs indefinitely when a layer causes
command failures (e.g. meta-virtualization) because:

1. bb.command.CommandFailed was not included in the event mask passed
   to set_event_mask(), so the failure event was silently dropped and
   the while True loop never received a terminating event.

2. There was no timeout handling for the case where wait_event()
   repeatedly returns None, leaving no escape from the loop.

Add CommandFailed to the event mask so failure events are properly
received and handled. Also add a timeout counter that raises
RuntimeError after 300 consecutive seconds of no events, preventing
an infinite hang.

Fixes [YOCTO #16170]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 scripts/lib/checklayer/__init__.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 86aadf39a6..b70cef1b14 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -360,12 +360,15 @@ def get_depgraph(targets=['world'], failsafe=False):
     depgraph = None
     with bb.tinfoil.Tinfoil() as tinfoil:
         tinfoil.prepare(config_only=False)
-        tinfoil.set_event_mask(['bb.event.NoProvider', 'bb.event.DepTreeGenerated', 'bb.command.CommandCompleted'])
+        tinfoil.set_event_mask(['bb.event.NoProvider', 'bb.event.DepTreeGenerated', 'bb.command.CommandCompleted', 'bb.command.CommandFailed'])
         if not tinfoil.run_command('generateDepTreeEvent', targets, 'do_build'):
             raise RuntimeError('starting generateDepTreeEvent failed')
+        timeouts = 0
+        max_timeouts = 300
         while True:
             event = tinfoil.wait_event(timeout=1000)
             if event:
+                timeouts = 0
                 if isinstance(event, bb.command.CommandFailed):
                     raise RuntimeError('Generating dependency information failed: %s' % event.error)
                 elif isinstance(event, bb.command.CommandCompleted):
@@ -382,6 +385,10 @@ def get_depgraph(targets=['world'], failsafe=False):
                         raise RuntimeError('Nothing provides %s.' % (event._item))
                 elif isinstance(event, bb.event.DepTreeGenerated):
                     depgraph = event._depgraph
+            else:
+                timeouts += 1
+                if timeouts > max_timeouts:
+                    raise RuntimeError('Timed out waiting for dependency graph generation to complete after %d seconds' % max_timeouts)
 
     if depgraph is None:
         raise RuntimeError('Could not retrieve the depgraph.')
-- 
2.43.0


