Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA81C54F30
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 12:06:34 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.11613.1724846784571666649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 05:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cbcn3wkk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37182eee02dso347331f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 05:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724846783; x=1725451583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWpK1HK24M7ifdacehXZ3oG6J2gmGcq8y+RfYH3st2w=;
        b=Cbcn3wkkZDhuLyMr9MVjfZp6AYwVEKqmEA5pKTP4fEYMjwhFBPcmDE9MUJpVUY922/
         8Diej2KvD635ru0gZ1fD4ElfXWy/AfFgZQvp57eZu3LQIsTjBeF7w7GV8bY4Lt7NMCM/
         dut8tBSBTT9cqWMbbk26PRSwoHpn5InG9rOnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724846783; x=1725451583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWpK1HK24M7ifdacehXZ3oG6J2gmGcq8y+RfYH3st2w=;
        b=UCIpNaA8AFytH8UjCFbtPLMjtV06dblHV2YzYHOezvYBnHMzI2iznjfjxGcsACjO0G
         /642HOBWj8l3KHUUzkmB7b+yYIvQVr60qcFNNN1vFAjOZjwe98dO+OszxuvZ2YW8y3/t
         GYzmwbaWViiwWOfmYjYXBrlKzLX+qBC5r9ToxNNhlZxXqaM0ZjRrVmFzRdIpj5w+SUvn
         G1xEUxA68CblVQ5+noibeA0hQKbnTBJrsa1VgAsKgVsgPl2aeQp3QsR2xUEjtb/fmFdP
         +V6uXEnuxh3AbAe5sWgiMZe+e3JnQqbpK6gE+CkY35zCtxHwf7N+QpcVq2wFFMByGdlx
         Z6gw==
X-Gm-Message-State: AOJu0Ywp/oMpIIqbqtALvXyCGS/NAHM8FjWAk3S1J0VvzhPIIoTEvULN
	aRqlSVAEjzkCPy7mhw6/tOMWag09jXPghJ/t4870oIXHgyfD/lk6zCjzTChrh5i7OgDU8GXos+g
	g
X-Google-Smtp-Source: AGHT+IF7D4tYs73EinSYAJ5km2xJywhnNnwThbcldn+Q03ZwR/32WqeY7QyiFHsrTgxaEttlgpSroQ==
X-Received: by 2002:adf:fd43:0:b0:36b:a5ac:7a with SMTP id ffacd0b85a97d-37495f3521emr1114160f8f.7.1724846782583;
        Wed, 28 Aug 2024 05:06:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:354e:532a:804e:264e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ffeb8sm15396085f8f.88.2024.08.28.05.06.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:06:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] insane: Optimise ERROR_QA/WARN_QA references in do_populate_sysroot
Date: Wed, 28 Aug 2024 13:06:20 +0100
Message-ID: <20240828120620.1458816-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828120620.1458816-1-richard.purdie@linuxfoundation.org>
References: <20240828120620.1458816-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 12:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203881

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

