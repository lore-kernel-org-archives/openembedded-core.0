Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9778BD6AAE4
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 15:39:46 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18705.1775144385086051852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 08:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TJbjyMCj;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b97f9587e6eso143383766b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 08:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775144383; x=1775749183; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKxP2KBhTBqkiLG3TfJAsJYbYU/58IJeFcBRDTeXn4I=;
        b=TJbjyMCj/JSAZtbWxpLsBDamg+kjKIgV0sX789gvAt4qT4kvkCy5f1UUo8QseG/L43
         PYhrWh0jIVk+yCCJ2I/t+tMcAvGbuBjbimaZ4T9KNLI+83FROM0kPBSAH7mq3yoEXKjC
         ggrENfgJh+wiNiqIGjrBs3T7suW+rLUkcn1eIqeCDycPSVsDMkjSMp5cO8G87vyck5HJ
         hTuwpbIK8gQe+REjyidKqOmzpdlggrKe/DkAtrMegJCLSICy+ubAReb3vUvzSFNvTlpO
         g+5QFoV6SpTec5OI8urK+iYlkIEewOjKgBteAMAbfy7x3s+NogyEDwzYW8LAIi/GczM9
         oAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775144383; x=1775749183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKxP2KBhTBqkiLG3TfJAsJYbYU/58IJeFcBRDTeXn4I=;
        b=OvJ/MxqVjUhC0zFXmRNRr/AKk2mQUCvNncN1FMJKkew/wZOOxH99axxsE0dtZES/2X
         Uo6wQCSbH5sD3I4GS+m5j/wdvXoEtE9Oy0L9Q6PTglPYGY6aNRUDgcBpLh3rE6CHiq+j
         kRPcSJK/tXO3csskyMyBpB+C4AZg6dmXEiH2cCbwvzPv3JoNOg7HHhdVYDvWfQOZvd8U
         Ur+tQZTTm8Tt4E3MoRKDDoHds2kyrgwAKR2Vlg8OBrQG0YxdUXsaqtL8YSSn1uriqj5q
         3nQSe7sLHlMx1XL05ht6adJyEIZHAcsMig9YR3XiUpu72Vpmw0Bru0eP6j9Dj30yS6jS
         +GFA==
X-Gm-Message-State: AOJu0Yy3ltILOSalffIClkH0NMJYRW8Yx+ajqLZ3yI/5xie+jflsY27b
	WiGAGpu5dBSSX9CQRJxSxLZFgmKlZV4EQqXlEyfUTg84iRhKbqYJRNBZ
X-Gm-Gg: ATEYQzw18beSGYLOIw/HcMqrPEf1HU1bb9IlVc83n7QMQA8ybwZDRS74e+Jihw7Na5i
	MTFLJR7Y4Xza0+KDHXAinLtG1xqxlMshcU3uzb+SpbBO1fQFxMJ98mWOovavg1mw6RBJ3NtffRz
	lbM1K5T82ylnVN77srNvwZoenhQEixx2Z+VlOaDAbAdgNF7WykpKVlzcQdVicJUtgY4qI2IgZiC
	X7hZIGpwlX2xcWnoEWQXlgAH7MNtpb3OHFpIE/5J7vB5fv0F6P/rVpFkkC+a42TFeQF5Fpa8u55
	sAJenZbK3gLafmfpdchl/v3MkPkaT8HmsvKRp9u5/PL0Go9b7i+sr16a6FoRPmz30yOVBcICM0n
	qokZy9N622R9WyumidHM9g2xNJRG4e6NLDUTsfYAIAOjv92GA8vj3rflgAgEpJnwLfkHopSnvZ8
	gWvEfWA1meVAtoeazKGDmxoIociIDQQg==
X-Received: by 2002:a17:906:5994:b0:b96:e0b1:ccf4 with SMTP id a640c23a62f3a-b9c3f1b6eeemr154317266b.47.1775144383263;
        Thu, 02 Apr 2026 08:39:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:fb7f:9298:379f:1206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff130fsm101831066b.47.2026.04.02.08.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:39:42 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Thu, 02 Apr 2026 17:39:39 +0200
Subject: [PATCH v2 3/4] sstate: remove dead code and unify path operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dead_code_and_unification-v2-3-259169372299@gmail.com>
References: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
In-Reply-To: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775144377; l=1577;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=QDDz4JNlsbni79G3POf5sQE/siQUpXvaQnlyDYCk81A=;
 b=l7VjHv9gRz+PWrW74G/IX9si1grGHHjcoktuiHsw1e+yy+xR6bq9J6fz/oP8UcKb1ZC69TOTS
 +KxVl3BeWryBhjlT2FT2F+q5oKa3I7KHnRHEF1ExUnF62dRRhIQP3nh
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 15:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234542

Most substring replacement operations performed on
'dirs' and 'plaindirs' are implemented in the same
pattern, except two. Unify the implementation.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-global/sstate.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 88449d19c7..6d5ff265c5 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -333,9 +333,9 @@ def sstate_install(ss, d):
     for plain in ss['plaindirs']:
         workdir = d.getVar('WORKDIR')
         sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
-        src = sstateinst + "/" + plain.replace(workdir, '')
+        src = plain.replace(workdir, sstateinst)
         if sharedworkdir in plain:
-            src = sstateinst + "/" + plain.replace(sharedworkdir, '')
+            src = plain.replace(sharedworkdir, sstateinst)
         dest = plain
         bb.utils.mkdirhier(src)
         prepdir(dest)
@@ -639,7 +639,6 @@ def sstate_package(ss, d):
     for state in ss['dirs']:
         if not os.path.exists(state[1]):
             continue
-        srcbase = state[0].rstrip("/").rsplit('/', 1)[0]
         # Find and error for absolute symlinks. We could attempt to relocate but its not
         # clear where the symlink is relative to in this context. We could add that markup
         # to sstate tasks but there aren't many of these so better just avoid them entirely.

-- 
2.43.0


