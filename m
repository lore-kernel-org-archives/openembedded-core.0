Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24317C3ABA5
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:07 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.8203.1745981645608633639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LCRYyU1S;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22da3b26532so58082715ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981645; x=1746586445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEzCE+eHkAcKTIz5/LUCWkKogaZfVj4KmgWDJkrSwXU=;
        b=LCRYyU1S9i1xED2LrDjsSN/8QRtReTJF60r0RTD+S5Wm8Mr5jeuBaobXyPg0zjAPUb
         k+6JHkJDaH4f11/QZI/XTbrxyu9End7EehpJ1cXoI/NTERosKU7YeyZ/CRq+OIU5VjMg
         Zbfu5C9V26B8wbthnJ+VSlPzYIf1WyY63fVbkY81pB18ejpF61gqAGp6J+UnlzoPitTu
         VU5V39tnOlqeAG4RwaC3tCGU45J3BcB73AgnOlY86Sjmme0KK4g93qlytBUiS4tWnEAd
         Qw+NrMEl+jhjgIGdysTqSfSqyroogFisC+qTbQTwdGRJQnxL0geU8Kgb3TwfOLCUtYaj
         Yv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981645; x=1746586445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEzCE+eHkAcKTIz5/LUCWkKogaZfVj4KmgWDJkrSwXU=;
        b=s0ExSTSboQs8ftFKfYHPGm9tXc5X7Y0YTblu31HluIhgzpnC5mXZclwH++99/nHzsi
         vOAehso4N+MybqTZb7KthudGtFIdJ729x3N1gKL5wKKAnGr9tipBp2q4M+opkDjOICaF
         cbC6iN0yYPiaGXYIpVoqxqFsHZhXB2EzjXC6OQOaIqGPw6WeL0mDlkz8Fafblh1xHO2Z
         LjEzMKVyN8SnWryK/l2CxCoiqnZW9Rrv/p5PHFLRJQmhMtfV6jLNJxCS+p79C3rMpeUO
         mIfnOxZpQjmDqwriySWJlpkiuZNgNcQ7QnIplyI3j5hoAkZeU2mgcdTjnjfDayVl/URj
         bbUg==
X-Gm-Message-State: AOJu0YzPDrl6+VP5pa29Sso3ixcisAy8Se4qNZt0Jzo5g0i9K8EzdiHd
	GJJPH8kP5KlWsXzLBsfaOyq93OjjYUYTkZDvjZWzBT0r5ayyGG28qN9XAhbZBbpmgxx1jKBj63U
	H
X-Gm-Gg: ASbGncvwykM2O3/FRYxnB/bGNdO8lktgPG0uIj0HkXYaMhLoi7sVwK9vYkh0QwC7OUh
	EWYcI4/Ai9DFSu6Vj6SHIQ1jTJipMehYvwKWuIJpSJwa3S4vc2rbmjYbpA+/OdyWX+UI0QpLOeD
	AqzBphQ1mSuWixSAlMQTlw9QFniyJxWtbTtwcVO/ZbzoNRe3XwNdPb8kjE+KBi6+gJZ8HiHFBEK
	+kLyHRuLzzmH1vmN/kT+EnzAj8y/1gtMLHCRU9saLV3lZOSUqI+mh1kTTXaC8ZJMAilNSHJkBN7
	gOEqrcaZoeW+8yv/WMNMoNvc/qMBMj8=
X-Google-Smtp-Source: AGHT+IG9xVWSqU0agdSHOQ9/g8WjWarrHVq+o+f2FybjmWAgMf6rx8nDKVbKEbZEGgTfbWLKvvDTTQ==
X-Received: by 2002:a17:902:e784:b0:223:5e76:637a with SMTP id d9443c01a7336-22df3502ba2mr26803355ad.23.1745981644828;
        Tue, 29 Apr 2025 19:54:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.54.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:54:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/14] ghostscript: ignore CVE-2025-27833
Date: Tue, 29 Apr 2025 19:53:29 -0700
Message-ID: <e1f3d02e80f6bdd942321d9f6718dcc36afe9df8.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981510.git.steve@sakoman.com>
References: <cover.1745981510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215694

From: Peter Marko <peter.marko@siemens.com>

Vulnerable code was introduced in 9.56.0, so 9.55.0 is not affected yet

Commit introducing vulnerable feature:
* https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/pdf/pdf_fmap.c?id=0a1d08d91a95746f41e8c1d578a4e4af81ee5949
Commit fixing the vulnerability:
* https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=477e36cfa1faa0037069a22eeeb4fc750733f120

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 8499bb3676..3d4ac77cfa 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -22,9 +22,10 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 # As of ghostscript 9.54.0 the jpeg issue in the CVE is present in the gs jpeg sources
 # however we use an external jpeg which doesn't have the issue.
 CVE_CHECK_IGNORE += "CVE-2013-6629"
-
 # Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.
 CVE_CHECK_IGNORE += "CVE-2023-38560 CVE-2024-46954"
+# Vulnerable code was introduced in 9.56.0, so 9.55.0 is not affected yet
+CVE_CHECK_IGNORE += "CVE-2025-27833"
 
 def gs_verdir(v):
     return "".join(v.split("."))
-- 
2.43.0


