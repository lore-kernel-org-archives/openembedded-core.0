Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC711C5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 16:11:43 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33739.1786378302359108080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 09:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gkoljb9u;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb61bbeb25so1363036a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786378301; x=1786983101; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QagFOsxkskgnobK+6SGMS5UlvBt98OmaItFf3jaeI0U=;
        b=Gkoljb9uTpIG/zUdrHuVjYa69SK+hztUL0wWxM783aiE8a+tZxfDuwxM/saKBR0y3b
         CifcQgvxn9kozuRuHF5x/P8vSEp3AOPnTyVPTOJ5mJijbL/pPqq2DLCoDrwQ0sq3qK8i
         iBj7YAYosZeFj9HO0upXfwnMwHQjhKor8nlrvsuypYbHuPHfOae1uHpRCQwhOhPaLJrk
         H9HzKLMhT5lXmKmSw6OdqjsKHWbXh7TxakA4lK49y1I/lcCmCY4J6P8OxcLR5P00zTQ/
         wGdtVb8N+UKNmkKC83XSoXC5BP/Ic7p8XN0Me8evT/snj+fMm6KEBtIBCcz+jZhhRmWD
         Unqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786378301; x=1786983101;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QagFOsxkskgnobK+6SGMS5UlvBt98OmaItFf3jaeI0U=;
        b=Rxdhn2PdA0qw5IMWPI7qgrCIUzMBFTrtmXvf2muGijuDLjVA5+pfLsHE8C9yV9Y7cN
         S0zgYIDv7msNQiHmyR/qVFsFgK0zO7GZhbRQWAWgnIWJFVTmALftNKvEjMvZqsnHWKDD
         Ucb4Oigoxx5BWFtfr3Im0sq4LpYMDtHI1A6DAjMnp/R5Swom63PG+1iGwHPLd3D3DQaJ
         +kZeJLYsgQJLb34JUO/E2taLV6jMYBueklgQaXBmTcOGxqpu2GQZMwOWW7ebS2zlyvJx
         cN9lrV6AZXWrDAT8ILXAMtG9JmNv7chVAa5gk/ywiJMtQ+pFDe62rIztBvh9u3Ip5FUx
         vbIg==
X-Gm-Message-State: AOJu0YxaKoFXT38NSZ2jC4esnquaG1E5fBqKaQLzW5NSJby+zOGJckrm
	Ra3HkFxKTr5BPChrmK6cTZNeY7Q0AhwlyjNImKQAYUcg+npv1IoImo3tpVKJFw==
X-Gm-Gg: AR+sD13j59c6dJkdUxPF3vL3sZRzP/XS5dG20ZY0cdIuvdmD4cgXUmZQ+4PXjB+Uki0
	6CJscZiXP00tHzpLe7gMKdKexyoj1huXTWIkV+C9bn9sbbL/aooj8xghJL0DCIAaIW2PLAZ8lB6
	hrkLyAD6G/X5AmWDZY9fKCIqjrGPKo6bB5o31nOC3veTM0RfpAiLzwM1HB9tIg/JTcqCcnYQgzL
	DnIIWVqywtxK7sTgMtXbOtb35P/kNBpd5kgmT69xSABM98ROriVewKIiLQzd85wrowzvtoojyni
	hgQh2O1Ko8JYJsjSw5I6/HsBpbwE78QJw5cTIVn+OCeqChEaLVYz18rpKodIbT2JH8phoc/pk9t
	gTkqCNtENr0d4pVoU2Kdjiadsr0WEgWkO2SYFa0S7xbw4UJZeajkDv5ekuyVs2GU6r1KCs3NMxy
	S/N25HS2bsk2zft/NXvrtPbAZZDVurpgpEOvlOXfVeceP7YG9dHqZI22rI7A==
X-Received: by 2002:a05:6830:3689:b0:7e6:fdea:7ab1 with SMTP id 46e09a7af769-7f34dd8905cmr19278324a34.8.1786378301443;
        Mon, 10 Aug 2026 09:11:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b01:ba50::abb5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b7b9678sm7499938a34.21.2026.08.10.09.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:11:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] AGENTS.md: Add file
Date: Mon, 10 Aug 2026 10:11:30 -0600
Message-ID: <20260810161132.614235-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 16:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243136

Adds an AGENTS.md file to direct agents about better commit practices.
This is specifically *not* attempting to improve or direct agents about
the code that they generate. It has been noted that when AI is used to
write code and commit code, the commit messages that it generates can be
long and draw out (e.g. a "wall of text") which affects maintainer
ability to review the patches. Therefore, this AGENTS.md text file is
only focused on instructing the agents to produce commits that are more
suitable for our review process.

This file is intended to help agents comply with the existing project
document (and specifically, the AI Policy[1]), and does not constitute a
new policy. Any subsequent changes to this file should derive and comply
with the project documentation and policies.

It what can only be described as the most bizarre interaction with a
computer I've ever experienced, the best way to get an AGENTS.md file
that AI agents actually respect as intended is to instruct one to write
it for you (as opposed to writing one by hand). Future edits to this
file will likely be most effective if written by an Agent.

[1]: https://docs.yoctoproject.org/contributor-guide/submit-changes.html#acceptance-of-ai-generated-code
AI-Generated: Uses Claude Sonnet 5

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 AGENTS.md | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 AGENTS.md

diff --git a/AGENTS.md b/AGENTS.md
new file mode 100644
index 0000000000..ce4d6d9e6e
--- /dev/null
+++ b/AGENTS.md
@@ -0,0 +1,55 @@
+# AGENTS.md — OpenEmbedded-Core & BitBake
+
+Guidance for AI agents working in the `openembedded-core` repository.
+
+## Making changes
+
+- No web PR workflow. The project use **patches on mailing lists**
+  (openembedded-core@lists.openembedded.org) tracked via patchwork. Don't
+  assume GitHub PR conventions apply.
+- One Git commit per logical change (e.g., one commit per recipe added/upgraded).
+- Commit message format:
+  - Summary line prefixed with the recipe name or short file path,
+    e.g. `openssl: upgrade to 3.2.1` or `classes/rootfs-postcommands: fix typo`.
+    Check `git log --oneline <path>` for the prefix convention already in use.
+  - Body explains what/why/how, and how it was tested.
+  - Prefer explaining *why* a change was made over restating what's
+    already visible in the diff, unless the diff is long/hard to follow
+    or the reason for the change isn't known — in those cases, summarize
+    what changed instead.
+  - Be succinct: use as few sentences and lines as possible while still
+    covering what/why/how. Cut restatements, filler, and any detail a
+    reviewer wouldn't need (e.g. exact test-run counts, step-by-step
+    narration). One short paragraph is usually enough; only add a second
+    if a distinct point (e.g. testing) needs it.
+  - The most relevant information about the change should be presented first.
+  - Reference bugs as `Fixes [YOCTO #1234]` when applicable.
+  - Use `Reported-by`, `Suggested-by`, `Tested-by`, `Reviewed-by`, `Cc` tags
+    where relevant.
+
+### AI-generated code
+
+- **Mandatory**: any AI-generated code/commit must add an `AI-Generated:`
+  tag line in the commit message, placed *before* `Signed-off-by` (if present),
+  naming the tool used, e.g.:
+
+  ```
+  component: Add the ability to ...
+
+  AI-Generated: Uses GitHub Copilot
+  ```
+
+- Also add a code comment or other in-patch indication that the code is
+  AI-generated (recommended, not just the commit tag).
+- **Mandatory** Do not automatically add a `Signed-off-by`. This tag must
+  always be written by the human contributor, never by the AI tool — the
+  DCO/Developer's Statement of Origin still applies in full.
+- Contributor is responsible for confirming the AI tool's terms don't
+  conflict with the project's open source license/IP policy, and that
+  any third-party copyrighted material in the AI output is properly
+  licensed before contributing it. See the Linux Foundation generative AI
+  guidance: https://www.linuxfoundation.org/legal/generative-ai.
+- `Co-authored-by` should be omitted in favor of the `AI-generated` tag.
+
+When in doubt about a convention, grep `git log --oneline <path>` in the
+target repo for precedent before inventing a new style.
-- 
2.54.0


