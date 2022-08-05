Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D887C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:10 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.6770.1659705180369431073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a95SOqho;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id v3so3295770wrp.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=X0ddlNTM7x3TqGetYwP3c0jqPQVAIatsfShG4OmIc34=;
        b=a95SOqho7YZIxRTzJs9ZbS3vxyYSdCqguOw4TamYzkEGhAMSZphwOBK1UkJSl6arRF
         FZB08iirA3qWJo1sV3T5HMGT8rv/nKcX6oKxpJ/uXnmhOpcDRL8yKUOYbGKL3GwUj5kf
         wlGVHHF3W1DWKoEDbc4L8h540xSNq3FNv16O8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=X0ddlNTM7x3TqGetYwP3c0jqPQVAIatsfShG4OmIc34=;
        b=yiKIkXu3u8g3GwY3W3qdDxltiV1JdLBIPQKkSF0uJnlppBC3BmBS5BHIrDqmlnG2ch
         fmJJ8/zvrcE4kRsWzqwoeq9Bh8UA3XD9Ft/G8izl1b2tPhOb9YJvsXU6ZZTJOCft8byf
         jlR+C3bElMkQgNbu5HIgA0I6IaM3yE97WFhMe1ehGwMn2yaWPtMGr0kb+agnKPa+mLQA
         VYg1vqa4rhuDIaznjxCUDj7Vhu92MIgwVA0RQ8YyfKmOpkpG+5/GR5X/0dPmdK/O2dRD
         tws+xfLGwf+hshOsJvFEUqlfMNQB5psipcwndgw6Ow4ERmqXmxgTYgQZfF+dKaJkmNtp
         BZsw==
X-Gm-Message-State: ACgBeo1OxtMzSq2CMQfbneHHGuZTrJoJbyghZaT6JUYIlWfTraUZ0PED
	J+R1wVRyi9HyGVWRZt7IodnpgJL9hnbHbA==
X-Google-Smtp-Source: 
 AA6agR4IVR1ifQTeFp/Jgr58nmCB8peGJtyyEhV2HbpJxfXqmMJB0AjcbTI1vfyw6RZ3M71Cr+JpTQ==
X-Received: by 2002:adf:fb10:0:b0:207:af88:1eb9 with SMTP id
 c16-20020adffb10000000b00207af881eb9mr4355795wrr.238.1659705178691;
        Fri, 05 Aug 2022 06:12:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.12.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:12:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/29] rust-common: Drop export directive from wrappers
Date: Fri,  5 Aug 2022 14:12:30 +0100
Message-Id: <20220805131252.3706794-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168941

These variables don't need to be exported into the environment, which reduces
the scope of rebuilds when variable values change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-common.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 0c9363b31a1..b79a829462c 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -153,11 +153,11 @@ create_wrapper () {
 	chmod +x "${file}"
 }
 
-export WRAPPER_TARGET_CC = "${CC}"
-export WRAPPER_TARGET_CXX = "${CXX}"
-export WRAPPER_TARGET_CCLD = "${CCLD}"
-export WRAPPER_TARGET_LDFLAGS = "${LDFLAGS}"
-export WRAPPER_TARGET_AR = "${AR}"
+WRAPPER_TARGET_CC = "${CC}"
+WRAPPER_TARGET_CXX = "${CXX}"
+WRAPPER_TARGET_CCLD = "${CCLD}"
+WRAPPER_TARGET_LDFLAGS = "${LDFLAGS}"
+WRAPPER_TARGET_AR = "${AR}"
 
 # compiler is used by gcc-rs
 # linker is used by rustc/cargo
-- 
2.34.1


