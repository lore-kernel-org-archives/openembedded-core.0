Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4386ACD3431
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 10:26:07 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.46883.1725445565664315235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 03:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jx5Wa822;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-374ba78f192so3168562f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 03:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725445564; x=1726050364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/CuCOBoNz6yWYmXgYYjTfL+0XPmXMZLuBVIl6V4M3P0=;
        b=Jx5Wa822N4aOhljpQunmxdmW+QETV4tGzBJUVWAEH9VqvMrtFHmri0a8QSm9X/Uot+
         +/dFcuQyyh9eihJxzrwHCsaKnlxzMHZLCaehDUZYrcEBc7b9QlxmJFd7MoGyF+v+d0x8
         H+1l/OGl4nNGfqWIzEP6P1+jTpimle8crKfN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725445564; x=1726050364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/CuCOBoNz6yWYmXgYYjTfL+0XPmXMZLuBVIl6V4M3P0=;
        b=gIJrakVRKoTqiE+GBM+RiIgFKRP/nE25b12XED0W8Llvxl7AMRn8B++XVszp3UWahl
         lWyKUZnS6tqorOPtkHFPDM77nvaQTdn6z9WqIJ9WSPv3ACoCmCJ5KvIjwCbJlud7p9XB
         RdKy4roVTuuUFrNnwLgwRRqe0Bci0kmh/i62+tAGalpFzgaaKbSJPcNH3gKZK1/WUBfc
         Rdm2z2IKlZZIRvLREFG0swNdnXHyk+4FKwZZkPFxz5gD216Y520CqZWdkLJi+VuqQkgM
         GAPqwTd+Wonai8DUELaITmH2/ty4jog4xfiGLglqly44NmhQPXYyxq6XHa7Gxae14oNO
         e3jg==
X-Gm-Message-State: AOJu0YyBQ/ck2UfZDWYwYGM2liEb8LdH4OZEKrTCow/S5NfiQeuHDXZM
	25IY/YedGd7vXit5LI7HaC/ROQBsOLGeAItuie6pjPoLimohCPcAk68q2OKC2RTsA8zQOIUkHLM
	N
X-Google-Smtp-Source: AGHT+IFE7nGe9obTnyBhhzB8xZODddTC/+hgzhm/wV9m8J2cTQWx7cPJmXJSAmb61eC408P9e7GuTQ==
X-Received: by 2002:adf:fc0f:0:b0:374:b300:c4d5 with SMTP id ffacd0b85a97d-376dd71a859mr2247485f8f.28.1725445563379;
        Wed, 04 Sep 2024 03:26:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:99f4:e9dc:3777:c785])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c71140bbsm9333279f8f.110.2024.09.04.03.26.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 03:26:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: Remove dependency on TCLIBC from QA test
Date: Wed,  4 Sep 2024 11:26:02 +0100
Message-ID: <20240904102602.849950-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 10:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204198

The TCLIBC value is already encoded into build paths through the triplet
so no need to encode it here where it can cause problems for allarch output
that span multiple libcs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index d7aba89b494..1691d96b64a 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -430,6 +430,7 @@ def package_qa_hash_style(path, name, d, elf):
     if has_syms and not sane:
         path = package_qa_clean_path(path, d, name)
         oe.qa.handle_error("ldflags", "File %s in package %s doesn't have GNU_HASH (didn't pass LDFLAGS?)" % (path, name), d)
+package_qa_hash_style[vardepsexclude] = "TCLIBC"
 
 
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"

