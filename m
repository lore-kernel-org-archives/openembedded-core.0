Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338CDC07CB1
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 13:49:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.95053.1701092970909863790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 05:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=Qlk43hez;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40b3e7f2fd9so17110305e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 05:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1701092969; x=1701697769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QyhnO4Gc8H8Y9w+f6rWqQh9YPG3IFKCCK6TjWy+zpPE=;
        b=Qlk43hezjjdfFCitD5h51n7VoBjVMaybbnki4N+io9qk6rDZGESqR+VaGkTLsESacS
         SiheTxmTJh2SJ15mJBzeP+gKDUJLNZTthGj/6UAIQPVwbg4jj72gJ6p4xTXZ9WMxo5N8
         6MmQizDozprW3llOfPt9CxJnA+0/STWV5eDNwtxTIh98xvwCRoWVcrnByLmj4vPnokhC
         aTU7enFJJ125I6+xyyaXjOSzTXcZQrJxgCtjQFkMq72+NrS4VYwULDTS+2eK5JYmQIY6
         JhjFRJRpH3SijHfZQvcsYBL4UCHZIo15ENcbM9tPgH5NETrAEoBsUpWZjtQW1ClJX1F4
         g3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701092969; x=1701697769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QyhnO4Gc8H8Y9w+f6rWqQh9YPG3IFKCCK6TjWy+zpPE=;
        b=nKcqLwAGGgRX4N4Sm6ZZ0iWxXgaBMxU3J3+ZBflt6xfjuNwt5UPOo2vl9ASMlpw1Sl
         Wa9HFyv+pkB5DlOST3GG/orX6EQh8NJB6RUIdOIYQeQsvCklUNKg8XLj30FEHGC2ApbR
         d1V94cGF7r0K8+lUacQmi3xPnAfVClQ2E9DNYB1Yq6SXItYxBdhp5Dh8wGqYjo2Oq8na
         vAPeW+zKmw/LXCYsDgctcQg8aTVrK9vp8ofkq8k0lItcyrdKCm6i5+ua7SHMaSVM/o3J
         +gB42JlZcKN1BNgZhDhqP5DhAI2VbLuy7fYw8riWQ2uA2/UGK/pSUnSPjhVi0cLWl1RN
         cvWQ==
X-Gm-Message-State: AOJu0Yw5vBVwD+Fw9r5+jcwTGLxJYizRAq3Gh1T8CHBBgy1DaguReHXn
	quBbZ2YettbnHPvfeIBaBbKalDCrRZ6e+zqEXx0=
X-Google-Smtp-Source: AGHT+IGXY3JZgJrxPE8DpWyvVjTN9ePtqmD0NiR8a5yhhkgtQFLyEgWNaAAJwSciOrG4Ns9mb+CUug==
X-Received: by 2002:a05:600c:158a:b0:406:7021:7d8 with SMTP id r10-20020a05600c158a00b00406702107d8mr8029452wmf.20.1701092968667;
        Mon, 27 Nov 2023 05:49:28 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600c198800b0040b481222e3sm2086440wmq.41.2023.11.27.05.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 05:49:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] lib/oe/patch: handle creating patches for CRLF sources
Date: Mon, 27 Nov 2023 14:49:03 +0100
Message-Id: <20231127134903.1327808-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 13:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191303

Using devtool to patch CRLF based sources creates patch files which have
mixed end of lines : LF for headers and CRLF for source context and
modified lines.

Python open(..., newline=None) (default for newline arg)does detect
end-of-line in this mixed file but only outputs LF EOL data. This
result in patch files that does not apply on the original sources.

Switching to open(..., newline='') allows to detect end-of-line but keep
the original end-of-line intact. This generate correct patches for CRLF
based sources.

Fixes [YOCTO #15285]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index ff9afc9df9..7bf660978e 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -477,7 +477,7 @@ class GitApplyTree(PatchTree):
                         patchlines = []
                         outfile = None
                         try:
-                            with open(srcfile, 'r', encoding=encoding) as f:
+                            with open(srcfile, 'r', encoding=encoding, newline='') as f:
                                 for line in f:
                                     if line.startswith(GitApplyTree.patch_line_prefix):
                                         outfile = line.split()[-1].strip()
-- 
2.30.2


