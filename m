Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADCDC25B79
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:27:07 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.11099.1715858818549894167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ASNq9+B9;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59cf8140d0so255119066b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858817; x=1716463617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiLX+csJI/an9dAclrorjUngC2nPx6Wr4Cikjg0bET4=;
        b=ASNq9+B9O015lEn6It3lOTnEP8WaTtgaY5L7k6shKtDNrXSGrEGDhyTHpbK+oLInRg
         VuPJBtA+HmdCrdfjCW55knyr6H30klRtwAhZHVDKOGs6KWr6OcVf+Y0FmMWNV3oldkhf
         WhZoHFUyorS6X95EJaqaTiB6H3nBTU7c8/+FxVe83iX/ySPKBphrqtHOru+A9q96EWZs
         SBAMABiSU91NO5NlCoxGdx05Ho0GbDZ4lKMOZBwdXro1OzGYtm8OqOEI8N3jDv137NsJ
         wDdBuWV/PlsDAAVbJQ5bhgH0k8YlImbj97G8smW8CKAcr7CbavsZkN5Ivv+N8R2ctQnZ
         V9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858817; x=1716463617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiLX+csJI/an9dAclrorjUngC2nPx6Wr4Cikjg0bET4=;
        b=w7f0W2X8XpgMWVYXtfqAdXeBE9CaV1bnDwLdr+/zzcd0w7gSgSRNKh1gclh9fYxGll
         5yXHrN6CvkYKhJyfGpinphCBDeGX6YkDaE0dSg7LbPtC7RMeyykSrf0LZUMisvH9g6D8
         ITUprIuVq/heBI8s+VU9cVRRUVsnS136VCI5UvChex7olaI5JU+auKY7EaVkFK+VL6Nk
         r3db21Obh3To8TUohw5BSzuOgq2LyO1fPYcjP9lkczyDf8lW4OaxcsQs3qoGxKxLKJdZ
         qqpztH9BQDdsdilx4yZi6/U9YBXy8GXyZkoqnhdIGQBgrOcgI8vL5U2SBLuIFtJAqyN0
         ZRHg==
X-Gm-Message-State: AOJu0YxPM9msf7yajD8ezhbi8O1scs+pH5axL/bwIW8/OaX0fIxisj23
	sXlCJ55TrrqUnxWinLlNI6gHdP5wwhdpO28r/SlJwW4Dq1AaC797g3dWPA==
X-Google-Smtp-Source: AGHT+IE0gL2/LQWOizkQFNfeYgGUmPOy75etWtXdvC/zm5ncqI8S4Gcp71609MA5X67g7MOxtiVtQw==
X-Received: by 2002:a17:906:7110:b0:a59:a18e:3fd9 with SMTP id a640c23a62f3a-a5a2d54c365mr1132476266b.5.1715858816859;
        Thu, 16 May 2024 04:26:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:26:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/13] perl: submit the rest of determinism.patch upstream
Date: Thu, 16 May 2024 13:26:35 +0200
Message-Id: <20240516112640.2145789-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112640.2145789-1-alex.kanavin@gmail.com>
References: <20240516112640.2145789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199475

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/perl/files/determinism.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index aa85ccef100..f2b11115524 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -8,9 +8,9 @@ b) Sort the order of the module lists from configure_mods.sh since otherwise
    the result isn't the same leading to makefile differences.
    Reported upstream: https://github.com/arsv/perl-cross/issues/88
 
-c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst 
+c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst
    there for good measure)
-   This needs to go to upstream perl (not done)
+   Submitted to upstream perl: https://github.com/dankogai/p5-encode/pull/179
 
 d) Use bash for perl-cross configure since otherwise trnl gets set to "\n" with bash
    and "" with dash
@@ -18,7 +18,7 @@ d) Use bash for perl-cross configure since otherwise trnl gets set to "\n" with
 
 RP 2020/2/7
 
-Upstream-Status: Pending [75% submitted]
+Upstream-Status: Submitted [see links above]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
 
 Index: perl-5.30.1/cpan/Encode/Byte/Makefile.PL
-- 
2.39.2


