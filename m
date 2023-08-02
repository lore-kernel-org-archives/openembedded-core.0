Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B79DC41513
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:24:39 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.16295.1690986277693423847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 07:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=OAJ210kt;
 spf=pass (domain: baylibre.com, ip: 209.85.221.51, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-317716a4622so6349609f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 07:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690986276; x=1691591076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uhR97aLN33Lpj5pk6L5LM7sy2JV3qJwmrAk+O9JL40=;
        b=OAJ210ktCfxUcptl04H73uRctSseXMUluRy3VWhbrkUHp+hYjk9hgEo1vLnUhN+nVk
         kdLb/TBRoeYrd3vCaaDxiA1ezKkc8nf1ARV0ie5hmoPPyFz1bDg9BKVGoaNT2ZKVWVU2
         jEBk4+MqeHWtLQ24bYFAxey/hIi2MPvQgjmEludC+oVljWyCeFvTnkX4p5KVXgngr/I5
         +Isie9ajMQPhThGLXBydq1fBJ6kSN8xuh4mV6DubZ7FwWBd8qMS1rDVOqjdSiBnrojgQ
         ZXZh8dJmDFJtZ4k7aHMD6MJb6p6DrxmVERAddu/JdDaqxstAm3O1jhBuLMDgcaKi/Ga3
         HN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690986276; x=1691591076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uhR97aLN33Lpj5pk6L5LM7sy2JV3qJwmrAk+O9JL40=;
        b=im7FmsBLgO5q9lJvF5iw1crVD71zg2iXArxwIzY4xvFZQikgufVOoyAcfIFeR/vXDU
         1MW12JMz6qJXoNUFbHhnfOQWlwQcMQ/jPg6aTG66/2xetOjlA1cVxiw9RUAh50QuO+gx
         DAIDue13qjit0+vLbsz8hX6aBW4PWSgi/KJAzcGUGQsd8FhJm89o6VQC6FNAD+GysnDm
         in8dry7FW6qQH2/uX5SXiNdNVb+VrEjJoyQFvLvGUUxM/ezBQGmN7OokvZx2WGKAz6iW
         nCHNusX49bgTKrYt3u6S+kQWHYcFEVittrVibCVpD9az7hDqOFnExl2n4RqrO+Djh/Fw
         yZHA==
X-Gm-Message-State: ABy/qLYA6WTePOU4+NvHL8MAke1Q+SIxgQpnuFTwYUgfsLmgc97S9Wuf
	pcTAsUIQMpmcXtwdhEE0Gsv54NEfWdYXNjPiKlxfHQ==
X-Google-Smtp-Source: APBJJlGYP5YGWEVm4CSHyzuR/8Zg+5XoZjyEXtMQZkGjMzOMivcall+v8x5aR8ZbiVEK6PyRMl1aIg==
X-Received: by 2002:a05:6000:1371:b0:317:5e22:3ed4 with SMTP id q17-20020a056000137100b003175e223ed4mr4784546wrz.49.1690986275767;
        Wed, 02 Aug 2023 07:24:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id y17-20020adfd091000000b003178dc2371bsm15707079wrh.7.2023.08.02.07.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 07:24:35 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 3/5] sstatesig: add a new info level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK
Date: Wed,  2 Aug 2023 16:24:30 +0200
Message-ID: <20230802142432.2296716-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802142432.2296716-1-jstephan@baylibre.com>
References: <20230802142432.2296716-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 14:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185406

as of now, SIGGEN_LOCKEDSIGS_TASKSIG_CHECK can take 2 values: "warn" and
"error", displaying respectively a warning or a fatal error message
only when a task is locked and the task signature is different from
the locked one.

The "info" level is introduced to add a "note" message to remind the
user that a recipe is locked even if the signature is equivalent to the
locked one.

The "warn" and "error" level display the warn/error message for each
task having a mismatch of the signature. Doing this with the "info"
level would result in very verbose output if there are several tasks
locked, so the info level will only print once the list of recipes that
have locked signature.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/sstatesig.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f943df181e6..90002f67550 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -104,6 +104,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         self.lockedhashfn = {}
         self.machine = data.getVar("MACHINE")
         self.mismatch_msgs = []
+        self.lockedsigs_msgs = ""
         self.unlockedrecipes = (data.getVar("SIGGEN_UNLOCKED_RECIPES") or
                                 "").split()
         self.unlockedrecipes = { k: "" for k in self.unlockedrecipes }
@@ -264,6 +265,12 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         warn_msgs = []
         error_msgs = []
         sstate_missing_msgs = []
+        info_msgs = None
+
+        if self.lockedsigs:
+            self.lockedsigs_msgs = "The following recipes have locked tasks:"
+            for pn in self.lockedsigs:
+                self.lockedsigs_msgs += " %s" % (pn)
 
         for tid in sq_data['hash']:
             if tid not in found:
@@ -276,7 +283,9 @@ class SignatureGeneratorOEBasicHashMixIn(object):
                                                % (pn, taskname, sq_data['hash'][tid]))
 
         checklevel = d.getVar("SIGGEN_LOCKEDSIGS_TASKSIG_CHECK")
-        if checklevel == 'warn':
+        if checklevel == 'info':
+            info_msgs = self.lockedsigs_msgs
+        if checklevel == 'warn' or checklevel == 'info':
             warn_msgs += self.mismatch_msgs
         elif checklevel == 'error':
             error_msgs += self.mismatch_msgs
@@ -287,6 +296,8 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         elif checklevel == 'error':
             error_msgs += sstate_missing_msgs
 
+        if info_msgs:
+            bb.note(info_msgs)
         if warn_msgs:
             bb.warn("\n".join(warn_msgs))
         if error_msgs:
-- 
2.41.0


