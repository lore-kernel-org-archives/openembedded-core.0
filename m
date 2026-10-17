Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F78CCF2CC
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 22:57:15 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5694.1792277832032697179
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 15:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: otavio.salvador@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535a54bed9so1363057eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 15:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792277831; x=1792882631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFWPpAAsFryqghOfW0JeQybS53CAOfLkdWcv3hWnL4s=;
        b=vnfETEb5/8NCdtFLtM9qpi8fso8HqH8c3EAuGregSN1XQnC9M3tAYeZW3rSu75ihLb
         6cac2GIiuWmnlO9VaYFMvnzeaBNlgfKmazmFiDAkjNtsx+bG3Eqn3LtHxGlR01faXs6t
         269Rt0iwba1ED+kcJLlmcUAvd8Ad9dJFzUMiHvdU6dVQHhRRQD+Qq2h6sPNfYQlhYoqo
         KMZOwThpzgb3fnrqfkE2liFs7UOjDfkRN1GZp3xiVck4NcMxsvZ1DzhBW3STotLUx9eS
         KQhnL5lCdZ3pPc8P54zGDMEejgDBf7BBWNF5XhRNXPyUQQgyAq2xhfTZllSCIJ+chBjZ
         WbdA==
X-Gm-Message-State: AFq9FYJpLXy1W8A0DYKNtHiJIZFoe/FaBTJQG16BiwezAW1cPXNQqFSf
	jcg7mhBmZW/pXQQtB+Bhfq/tPifpONlmEsmn2JxTn4Y6czxea1bH8zYuhottlG2C
X-Gm-Gg: AYBFou33lVUHeyN0JPmz5eY16k+BsKv0vOcqm2qMtubG+X7h1hMT1XJwMOc03bzJ2nG
	Y0D371j2OhA0G4DC2BR53a36+g8RrnCrYcQUHPfmZQXuximchSEknn6ikCaStl5D8gxZtiJSKXZ
	EhpIbU7ZFfZMjkxHADzLTHPqmUwCOyCsSp4c7RgRGzNA2AEMDKb1u7v8drhb+DKhqZjPOaUtgtl
	F9wFRFur87QGFCnPhoVoMHUDCMOs8vv9Nb9GZIBascoURQL9DWkukN89e3r4Fc10kQFHt1zM96N
	WXpD6SI+SchAaWdXDaSMj1CmZWq1FyWuyta6mpdm5j4NgZRt5G4UxDetX6UIGDjCKApXkYxKJUr
	+mm9q5BfqIjfKxL+tQu9A2aHz2ZGf/KldZ0nwN5xgCTZpCoVxcCGs2Wd3zuI9uCEEwFQhzk7a3v
	za0B7qtZzGT4zxEtusj1EcmURCM8ismDgzVDAOW9CdPeoC1O6xoYt75WcNOol+Ui9FDxtBw+zb9
	X4vCTZiHGMFhqbQexZQ59JcGyC/mJHaYHk+bZqHtXB6nrsmDAmPkiY8n6mq2P9C0IgQ7hFhc4nP
	iRcS8jdI5ciUeaQvDJu49C1L5EoYXkjrHiiD32NfmVX3LL4FHCXiY+Zza655r/k8P5qQ7J3ScyM
	X
X-Received: by 2002:a05:7301:fc09:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-361a1860934mr4916204eec.14.1792277831397;
        Sat, 17 Oct 2026 15:57:11 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm19325035eec.23.2026.10.17.15.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 15:57:10 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH 3/3] checklayer: Reuse signatures of an identical successful world dump
Date: Sat, 17 Oct 2026 19:56:56 -0300
Message-ID: <20261017225656.680168-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261017225656.680168-1-otavio@ossystems.com.br>
References: <20261017225656.680168-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 22:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248100

test_signatures and test_world dump the same world signatures, with and
without -k, and so do test_machine_signatures and test_machine_world for
each machine; when the dump succeeds, the second only repeats a world
parse. Keep the signatures of each successful dump, keyed by the layers in
bblayers.conf, MACHINE and extra variables, and return them when the
same dump is asked for again. A failed dump is not kept, so the world
tests still run it and report the failure.

Tested on meta-freescale with two machines: 5 world dumps instead of 8,
same results; a recipe breaking world on one machine still fails
test_machine_world for that machine only.

Suggested-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/lib/checklayer/__init__.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index aa19a8e2ae..8838a7df48 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -287,9 +287,18 @@ def check_command(error_msg, cmd, cwd=None):
         raise RuntimeError(msg)
     return output
 
+# The world signatures of each dump that succeeded: the tests ask for the
+# same dump with and without -k, which only differ when it fails
+signatures_cache = {}
+
 def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
     import re
 
+    with open(os.path.join(builddir, 'conf', 'bblayers.conf')) as f:
+        key = (f.read(), machine, extravars)
+    if key in signatures_cache:
+        return signatures_cache[key]
+
     # some recipes needs to be excluded like meta-world-pkgdata
     # because a layer can add recipes to a world build so signature
     # will be change
@@ -320,7 +329,7 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
             # in a world build lack some dependencies. There is a
             # separate test_machine_world_build which exposes the
             # failure.
-            pass
+            key = None
         else:
             raise
 
@@ -362,6 +371,8 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
     if not sigs:
         raise RuntimeError('Can\'t load signatures from %s' % sigs_file)
 
+    if key:
+        signatures_cache[key] = (sigs, tune2tasks)
     return (sigs, tune2tasks)
 
 def get_depgraph(targets=['world'], failsafe=False):
-- 
2.54.0


