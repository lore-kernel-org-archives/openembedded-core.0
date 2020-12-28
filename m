Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.2376.1609185901726876969
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:05:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=izeXMpJy;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id cw27so10771300edb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jWJmef9shkLMnRzbMpFC7Kd40Bn6rMn08hRsTfEq89U=;
        b=izeXMpJyOfq/LedOXEfCZKcX/IyOSKprWyr2I/M4Cz+/W3RHQLP+hGltOeJkdAVFL5
         MG09OIGbM9L5qoVoQZ7b5jeZm4QIHn1y07vm7Q+w6oPE4cGba1gLCdeP7sGIP54if7yi
         X4rtno4QSLVjK+sgMrZHqKs2XrPBkfm+ei0h3jPYbm/n4RJjd9TasQ7yCidQSKdHVKYA
         ZuIkCtdi4f4pTxiXAHyJ8vJhUO7+IF+FS6Wl8VLIXu0NEhO5so6MfeLoqtY8aKv5Tieb
         obl7GGTVLwai4nFn/KOYzvp8ji10Xl3mFQemjFGQmTaC1ytZdZt5a0omXyxFIFOllimF
         4YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jWJmef9shkLMnRzbMpFC7Kd40Bn6rMn08hRsTfEq89U=;
        b=DxFJZkFcP4Dba/0TmAyZafyyNgnt13rOvaBHKZ8FaK0sQwOy2iPSaTw952cUxBSTvG
         kM4fNvxM+V3arQ3kojKuA8WCh83PGGNjH8zsqQNBZhLxtSTImmf+lijRuWVEmG5adZ5m
         jkPJ4Rir2XjyCRyJ3NW9YxdlLZKYlMuwI1fCVdj3QZx1SaUFNu0JG505suTLNnBRpDxK
         6mA6WhsDglSBWzF3YCECBYSXQkkL2dbgH175QY94tAF0kSY+iS7ctmjYb+zJMBUPVfJl
         qWT4+Zn1bk1Hifc92Qi8CUgPNouATNNdsIclMBB2rtSreNOxUxYNUyZAmbs8ZFJqEVRW
         WDxw==
X-Gm-Message-State: AOAM531v+9xyEA4oNVKmVASIWG3Hi/b0P0tHzhauS/VGNyrZbyryfifL
	Bn7t39HyritpXk7t7OjIi5LBX2SRjE0=
X-Google-Smtp-Source: ABdhPJxz2MeR4q9Np3BzaNKwLdhJrQEmSvEzR5XcMzGukDU1I5TK6mnBQpoBIOoPJJ/djCcqWt+5BQ==
X-Received: by 2002:a05:6402:c95:: with SMTP id cm21mr43836249edb.294.1609185900355;
        Mon, 28 Dec 2020 12:05:00 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:59 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/22] gawk: add missing ptest dependency
Date: Mon, 28 Dec 2020 21:04:36 +0100
Message-Id: <20201228200436.78130-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Somewhere between the recipe updates, the needed locale
is no longer installed to the ptest image implicitly.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/gawk/gawk_5.1.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk_5.1.0.bb b/meta/recipes-extended/gawk/gawk_5.1.0.bb
index 8c6411c867..ae897be62e 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.1.0.bb
@@ -53,4 +53,8 @@ do_install_ptest() {
 
 RDEPENDS_${PN}-ptest += "make"
 
+RDEPENDS_${PN}-ptest_append_libc-glibc = "\
+     locale-base-en-us.iso-8859-1 \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

