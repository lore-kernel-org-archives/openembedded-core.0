Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.12139.1620737504688712667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 05:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CICEQv+O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id t18so20033135wry.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MbmZwJoRzsw3VAzTLEsj98NEFpDlcp5mS7/+RnoAMuA=;
        b=CICEQv+OZO05RunKmyX5OFJzu4nacKJ7sAs5kGV/K6/c6LWgRA0lPjazLFReo7rdGj
         bPaG4tstaaSUGlukPLlLrJrxna9K0S5CFguA3ucMg3yixXF7ADFfAyWjTGMSIODLifVm
         e41Z7MR9oQU/GjlzfXYrbXCgp0IVhVvdt01bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MbmZwJoRzsw3VAzTLEsj98NEFpDlcp5mS7/+RnoAMuA=;
        b=ZxlobVVnjsl0jduMr0ncu0DJveTUYV8OWUHnSitweTDYUNrBUqSVDcJRlSVYBbh4Ks
         qUbDYW3akBwxJi9Ej2iXW0/jLsU/XFzF5gKikGgil6eH7mxcVN0rNlAnhBlLVnVUI37z
         9LIq3seISzZm7c+0tEhGWYgB3TRXbyUVaA1yBkX8U/wqYP2gIwu6jnsu2zvYexox4WA/
         uKhBWv5Ezhp7NpdOVMKH8K5dITPvSaTByUYN/ynAZgAQkxBr0sytrhoyxVAA4bKDaJcF
         EBJnIPhWGGDZil/SGW6t0+aMWTNZVkYzbLU+Wk47c0SWZE09e+QP6ZgWbw2KxuxffKAJ
         TNFQ==
X-Gm-Message-State: AOAM530OidZuia4dKUqkdDTl154yDOYMIwrwGe3bS4Noq/LFs5uEu/sv
	iTHVabWfAj5Nnjv0P8fzA+lzj7NdlyqaVQ==
X-Google-Smtp-Source: ABdhPJyjLdI3rrNNirIDGC0rMZov+25UoA8o8N+hwU0knomvCsvwQACfdAU58WxWD9SVuUa6HYzblA==
X-Received: by 2002:a05:6000:1cc:: with SMTP id t12mr37913550wrx.156.1620737503201;
        Tue, 11 May 2021 05:51:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id y14sm27119099wrs.64.2021.05.11.05.51.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:51:43 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/8] ghostscript: Exclude CVE-2013-6629 from cve-check
Date: Tue, 11 May 2021 13:51:37 +0100
Message-Id: <20210511125138.2232637-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
References: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CVE is in the jpeg sources included with ghostscript. We use our own
external jpeg library so this doesn't affect us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
index 9ace037aa95..81f8d615aed 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.54.0.bb
@@ -19,6 +19,10 @@ DEPENDS_class-native = "libpng-native"
 UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
+# As of ghostscript 9.54.0 the jpeg issue in the CVE is present in the gs jpeg sources
+# however we use an external jpeg which doesn't have the issue.
+CVE_CHECK_WHITELIST += "CVE-2013-6629"
+
 def gs_verdir(v):
     return "".join(v.split("."))
 
-- 
2.30.2

