Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8A3C636F0
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 17:15:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.1946.1724865351994966207
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 10:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hogn/feS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so58870745e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 10:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724865350; x=1725470150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWpK1HK24M7ifdacehXZ3oG6J2gmGcq8y+RfYH3st2w=;
        b=Hogn/feS+EeGWpqwsjktknDRPbbuXXa1TzP6Vm6JtN3LwR34XTTKuDe6omvBFqD905
         aT8YfbfymNcYm/Q2qngHvJaRMC+youh8nfnxk6r3VHY+ob+gfL38PrcHJRvpqLIlP95v
         warK79skSDYvn8VxuNsyDzrNCelyTZkbgAKpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724865350; x=1725470150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWpK1HK24M7ifdacehXZ3oG6J2gmGcq8y+RfYH3st2w=;
        b=Hrj9coNpFf6XFY5Eq7tIbNrsp3joS0L1mFmgPCUIJKU5mC/KGXjLQ+eH18XyU9Z/4E
         dHaKZsG3HPusfSr8a/CVwpU5GhSY7R6iG7F/KmDYucwDnRK+yeTJFP5v0nS2HnHMlivO
         WeXya2DKd3e301X9P/bKn/dtEEQ+9FjZvg55A4IiNpoaImM1Mpu953Rp+T6Q4eMOBEtw
         Hb/5tX7rYBY25SSLWUGFKILm+fmuTA0vOKhNmd5J351ONXXwpNhjy/8Byh8viYtMpexW
         2MoCcNBvwxFUGaBXu0dAtfdb6Qy12FxcLwH+mBn0WbfYickF6jDGuVQ+K0gKrcZt7eER
         6wog==
X-Gm-Message-State: AOJu0YwpWlbtfyhVZb+sQvfCg4tPT+TTR6sX2ALsCnH+QrqLCuIUl+XH
	JcGYptNG5V6SX9JTDs//Xwfk9Uiu/9n0tpqyglaoWjm9tZfEURpUVkCuCdwqq2xLoerJt/VpB7r
	a
X-Google-Smtp-Source: AGHT+IGv4DrZMzcUI6Uz36YmUu1ZBZ+UHGX5XmQ5ZkpFZ19u6/O21XNFGSJ5d9zYwfVB2s2UUuW5qg==
X-Received: by 2002:a05:600c:4707:b0:426:5b21:97fa with SMTP id 5b1f17b1804b1-42bb27a102cmr2440065e9.29.1724865350116;
        Wed, 28 Aug 2024 10:15:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:354e:532a:804e:264e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba6425bf2sm26715935e9.46.2024.08.28.10.15.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 10:15:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] insane: Optimise ERROR_QA/WARN_QA references in do_populate_sysroot
Date: Wed, 28 Aug 2024 18:15:48 +0100
Message-ID: <20240828171548.1545246-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828171548.1545246-1-richard.purdie@linuxfoundation.org>
References: <20240828171548.1545246-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 17:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203887

The new contains code can't inspect variable references in handle_error()
calls. Expand what is effectively a hardcoded reference anyway so the code
can optimise it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 6a84c4aa74d..a008f21c6ee 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -789,9 +789,8 @@ def qa_check_staged(path,d):
             if not skip_shebang_size:
                 errors = {}
                 package_qa_check_shebang_size(path, "", d, None, errors)
-                for e in errors:
-                    oe.qa.handle_error(e, errors[e], d)
-
+                if "shebang-size" in errors:
+                    oe.qa.handle_error("shebang-size", errors["shebang-size"], d)
 
 # Run all package-wide warnfuncs and errorfuncs
 def package_qa_package(warnfuncs, errorfuncs, package, d):

