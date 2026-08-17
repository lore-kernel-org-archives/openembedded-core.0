Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D14C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 20:04:29 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3738.1786997059814947075
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 13:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V3oF7FW1;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b01562adbdso2528132eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 13:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786997059; x=1787601859; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s15aOIjTXJUenxPQsH7HPkz3vj7Fq8jhiOjdzDg8rkw=;
        b=V3oF7FW1leV0N4o6Ajr/hiCm4B4dPxXvoO8LAdfxzE97AvNJAuPE/K02wwgD9Ir9dU
         3l4awqbKQmP4OSHeHsT1lQTdhYQYYS3oEy7ESSPY24GwwpR8r89kmaZHImVnS0zjFaw3
         wtoGbJyNjg61LHytjKI7hzNeN+GS3gQKbhs2whmHXkUkrUJJc8AKDu/BNwlBtTUOv99f
         acMBVo+6CbO+NQV2o/vh0C28eJ271p+HKuezVEiOFAuPm/umexGHMXebGGA0q47rmOWY
         FhgfI2Rw9d8VFwwI+JRpKDT64ugc7Nh6seHcXczwe2c5qzCPQPuANK4dqAQcWUaK+pkP
         rvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786997059; x=1787601859;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s15aOIjTXJUenxPQsH7HPkz3vj7Fq8jhiOjdzDg8rkw=;
        b=kvjNGXfFLQkl/ec/V3ZtxMByzC7Npkh4iCoq05K0DHqmg9D/6eW5llgLqo6CZW/dHy
         3ernVqhaxtTjRjds3odd725V0p+ghAmdVr1+2nPaxxuASoiTIAZT3b8ihhT2/sWNjlOZ
         tvzaOkQ6PYgKjilIug3B5ZDKUL31Oq4RwOcYUQy73t8o5ChK5poGu352QpuJkCJFJ3FB
         EfO1lN3BtYxk0A7VutSgkd8kdlhjU/9pH4Biv/fUcmvTe7EvVAfC3flNwR0c59VG85UL
         tpmI/aUrvwb/YNx0WtVRxSfnI6/fC+jIu5y1SKPYLRMWCFMFWt57KFHlKJrczKVB0yyx
         cjxA==
X-Gm-Message-State: AOJu0YwdL6jIG0VzXOggX9eN2rA9CeaoArPcUVdNmookEjaC6PPIr4So
	OfHl3kzdbzXqfZZ1rcfvUl5Afxg1177if78aD2aO6zWruqH5llXwoYi6kOzVhQ==
X-Gm-Gg: AR+sD13ZsejNV71b0b8oyESe4bP6mRp1zLGULCRn9LoSa4Wxjqh4+fA0wXOl/UnxLrj
	YtBfiOniP9ZbRv+UAS6a6JtzZ4gHeaVD8BssczAbQnFZi7lzOchdVdECRupAjQQsL2f4J0tsZrm
	eZIR217xJGQ0NG9Rd642MHo3jNCwBpg+inZmuZoxVrHAd3y9Yc3yGsuJUjpCNh/KOsbGf5HN8Ht
	N+2rxorIun/SyTexls2MylaZOgghRXUtTlBYYkI9fwGAHxmBvFl3Sy9cuv0Q1Ux2dRsIzKQ07BD
	a7J1BwAJmW4ITPw0B4eEYOlxWp1ciTOXsqHmfV8FfXp8SNkxX9Y4cTq+L8tD+WxYi0NhDxZdow4
	FlS7qe240j3f7B+/OYj9yM6Ec4iMbPUFqpE5ydE5XOTP4FO7N8yt4kW0VoH7SojT0BStKApgH2e
	mUNARR1hFpHplfJY3Ws2ojerYYTCehzGEZz9IR2BcfZZ4jratWLPU+YxANLw==
X-Received: by 2002:a4a:edce:0:b0:6a3:e0fb:6f39 with SMTP id 006d021491bc7-6b11e1f9cbemr2690739eaf.23.1786997058544;
        Mon, 17 Aug 2026 13:04:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b01:ba50::44ae])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1165cd4f0sm2533828eaf.4.2026.08.17.13.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 13:04:18 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] AGENTS.md: Add file
Date: Mon, 17 Aug 2026 14:04:11 -0600
Message-ID: <20260817200415.2733971-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810161132.614235-1-JPEWhacker@gmail.com>
References: <20260810161132.614235-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 20:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243638

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
index 0000000000..bbc140ae30
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
+    e.g. `openssl: upgrade 3.2.0 -> 3.2.1` or `classes/rootfs-postcommands: fix typo`.
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
+  - Reference bugs as `[YOCTO #1234]` when applicable.
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
2.55.0


