Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19D4CF58DB
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 19:56:20 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16300.1763582176437903313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 11:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oMbbT2uV;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so1556695e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763582174; x=1764186974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iEgafwrIe56jtSGJIYYT7k7FUWUlLpQ0yw82CUXxlc=;
        b=oMbbT2uVrMBgAH/zWtBT2R9rCiRAPn6r58CicWBndt24MAvPSt9rSTit78waglxkpT
         2I+70Nba0NBwDbWRw9hzG1vpcax/jx0BVNHAplyA8rLtbeWxwDqjzi+k6uV+ro0Dgzxr
         HgYuuEGJZIlACEhS7jHBaZoTKJwPkUTL/24zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763582174; x=1764186974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9iEgafwrIe56jtSGJIYYT7k7FUWUlLpQ0yw82CUXxlc=;
        b=kHP+hUQCVpPkjmiIJZXM1w6J+7C/FmBWVVGvJ2kpacUY5WC5024RdQV1olHYwt9EIm
         f2YjJavxeFTcgFOjE35ohWhv8KPM/5awMJoUkmCQssN2DrSHyQvZz4QB6iCvv3JpyaEY
         a2KDlx3Q5Y4EDKHz/8z4wGGrli6aWFNIX1PUZb4ouEUrF9ZhMg1kvc1MYLraFCx3gqUy
         5L4VMag9sYxzjErhoILh8SmqPYUgM3Ok4dRI0Iw5vmZunKQnaoPWY+maTk8rLtKt/VR1
         ggBedEnRYOjyg88GNQAxjcwJ8D9HxMVJpe3xYvtW6ZOf+uB9DquV2wN8PRXQI94Aw/BH
         rPrw==
X-Gm-Message-State: AOJu0YxcpMaojyPujhoiWYt5JBJEpkR//OORg7uhe7OrAjU6BQHEqzuq
	tzQ2OYiZD5VlExkKagq4KRqEVGC8bvqBhv4B91mim+c/Exf9am0njZBNVWMID4b2yAj4UWSQqDA
	gAt3xC1I=
X-Gm-Gg: ASbGncsGedIl0IlMXvMS7WkkCfILdx32GumJI85MdUnAJXTBKK6CUF/0CL9QXwJOF36
	SPiD+0S5Shhjo2SWrsB76VEygeyqXUFhSRf4qeA2PQX2SZIWWaYjFQqtpHAB4TS2KxWbt/iIQ2Q
	XUVVT4jeY4lgETCAuE9agIVIUqWZe+qOog6C1Rih72PYV06YqhQWB2sz+gvYu5T/3cXUBbHWrRb
	P1MmfsRU4s72I1m83PmMcEqCNdqXbod2u5jXyDqf/vksu01FcGCcjUdo07Ges9ByYtmKWPM3DCM
	Baf2+CIR8r2mzsaMYGySgqPeSb+nUnX8TW/tMb4epGqCsJTJTsZzvO4n32gXpsw7B9HRFvpqqCB
	N7PUjDqsAJ8z49alk6xyHST31Vn+0RdmpdEwBuKkpefuDhvCogJmaidWe0pGEMMf+pXvJr1TLEw
	AI5qD9OAFOVhyf1t3bygQQV6QpAEu2trc+jp0+q1iKmsFQ3Va3oQ3hQFbBxKXGsHjfok1NndBcR
	nmOicTNdB5l7lEoWTzLnQ==
X-Google-Smtp-Source: AGHT+IEPXckLwJSxTEiAe/h368bT6+EGAXKBB2IksJrASqwqcNhy9gY6WBRhKttzwOW2MEEsMIWy9w==
X-Received: by 2002:a05:600c:46c3:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-477b8954d83mr5312945e9.4.1763582174543;
        Wed, 19 Nov 2025 11:56:14 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a96a58c5sm50519895e9.0.2025.11.19.11.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:56:13 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [RFC PATCH 5/5] runtime_test: Add rust-out-of-tree selftest
Date: Wed, 19 Nov 2025 20:55:40 +0100
Message-Id: <20251119195540.2671856-6-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251119195540.2671856-1-yoann.congal@smile.fr>
References: <20251119195540.2671856-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 19:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226585

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust-out-of-tree-module recipe compiles and
run properly: check that the dmesg output is as expected.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 66cb112a7c1..a6f75c1e29f 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -493,7 +493,7 @@ class RustKernel(OESelftestTestCase):
             import textwrap
             self.write_config(textwrap.dedent("""
                 DISTRO_FEATURES:append = ' rust-kernel'
-                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal kernel-module-rust-out-of-tree"
             """))
             bitbake(self.image)
 
@@ -505,3 +505,10 @@ class RustKernel(OESelftestTestCase):
                 self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
                 self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
 
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_out_of_tree")
+                self.assertEqual(status, 1, "Loading rust_out_of_tree module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_out_of_tree dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust out-of-tree sample", output, "Out-of-tree Rust sample expected output not found in dmesg")
+

