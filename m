Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7557BE7B615
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 12:58:12 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.17466.1696424283125957698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 05:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=BuJ6V5rQ;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3214cdb4b27so2068940f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696424281; x=1697029081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8vLO8UcNl6/CIVv6Ew7H0M4nnSmZ3I3HCqzEYBLF4c=;
        b=BuJ6V5rQehT55ikjSz7cuK+YAHTkj5IPjFw7eHNXjBjQtxlMQ4Hv0+Dv/J175zrDYs
         b7NBylLfbfagQj4UQegwAJj9Y2buo9C9CH7Jcpp1cqovziJsvZofxd11AeT/QzLQ9/+s
         ronltNZvTLcu6RzkBOcIBebAlDZSua6Mqwls2eSloZ7t5/05TLHNjVR+WMwBBhRYep7+
         60j7vW64IRx+Cw5HKgNATyWYglXIddtQWxWHthTw7GrNv7nCb1/aKPkjkBPgW7VYZSi6
         /BlhN/FbaVYJCDyAaTyyUjJidPw1Ea9nD3TZNAUxqxkwUzXVAMoMCmRt7N3auFdiKTkf
         ndww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696424281; x=1697029081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8vLO8UcNl6/CIVv6Ew7H0M4nnSmZ3I3HCqzEYBLF4c=;
        b=jnd8XTPhhb18hFR4NqGEppx0QVzUsOwmgolid3rh4aXqSdwSTenwcl6HjfBpo2jD6Q
         7+9Wv5p5pE2rC5pGY3/5aYs9S4Y3fc75ihn0eKIVTw+pAdVlIIsNIocD8DmjNo+mjks7
         IiHZSyyZ3EMqeycOjMvNyj6naOOUed6/A6XN8LTrodIMqIml4Yh0vnXunSRxalleBzPr
         yiaau0rmXPCNyKaBvp3qg/HikPd2CCC4555VtY1llDyViPfY1N4Z39Kxr3RTcSqjW4uN
         Um2AwL5c07CWMCPg92kIM6CXZwTtg7yb/2Q8SZhrf1Gs3OOXC9AveHwQitqnLs3oKXhT
         WyQA==
X-Gm-Message-State: AOJu0Yzh2Q0W/IhkcULSSfXWpHM5ufQB/IR0ZagkmXm0YUrgCW3KVdIK
	urLRrFcJ5kLFjb2C+LBBq4j1tnzCdsz3XbfmHnc=
X-Google-Smtp-Source: AGHT+IGWJG++IBkzhMXtQtIyM8cr2+mpRUYGMIqbCnhAadysK2qXQ5bpAyTL3yn+RLsbZHwMRkU6EA==
X-Received: by 2002:a5d:5187:0:b0:31f:ec06:20f with SMTP id k7-20020a5d5187000000b0031fec06020fmr2220893wrv.14.1696424281428;
        Wed, 04 Oct 2023 05:58:01 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id j16-20020a056000125000b00326f5d0ce0asm3958763wrx.21.2023.10.04.05.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:58:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 4/4] insane: Add a naive heuristic to detect test subdirectories
Date: Wed,  4 Oct 2023 14:57:31 +0200
Message-Id: <20231004125731.1785803-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231004125731.1785803-1-yoann.congal@smile.fr>
References: <20231004125731.1785803-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 12:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188684

From: Jérémy Rosen <jeremy.rosen@smile.fr>

if there is a "test" or "tests" subdirectory at toplevel, this usually
means we have some unit tests available.

This test is very good at detecting handcrafted tests and I was not able
to find any false positive.

False positive can be dealt with the usual INSANE_SKIP mechanism

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 35b6408b57..ffae4b98da 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1394,6 +1394,10 @@ python do_qa_patch() {
     elif os.path.exists(os.path.join(srcdir, "Makefile.in")) and (match_line_in_files(srcdir, "**/Makefile.in", r'\s*TESTS\s*\+?=') or match_line_in_files(srcdir,"**/*.at",r'.*AT_INIT')):
         oe.qa.handle_error("unimplemented-ptest", "%s: autotools-based tests detected" % d.getVar('PN'), d)
 
+    # Last resort, detect a test directory in sources
+    elif any(filename.lower() in ["test", "tests"] for filename in os.listdir(srcdir)):
+        oe.qa.handle_error("unimplemented-ptest", "%s: test subdirectory detected" % d.getVar('PN'), d)
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


