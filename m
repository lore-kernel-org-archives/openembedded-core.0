Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB99C6FD18
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:54:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.10296.1682178896861703920
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=BrV+8Yzy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1a686260adcso34946035ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682178896; x=1684770896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiU/+OJ1+NTRsOIuMwE2sdY2j7LBza6ASYTNd6CifPA=;
        b=BrV+8YzyGBnES7qyyEc80GtjrbMk4iXsLAavS1840W7Ra1dLOI7Po64XGNAXymqpQf
         cva5GDl0K3J7g1k7On1C3HlM9BAcYT7WDHZc3MeEPy9rMl2npPG393qAJszHwpyKYUvz
         1SdG4wGw/TVL/vt+Hf2xAaowKGLSvsDvqKPTCzideSXKq+gOxtkcBTfcnJRUFZtdm6d3
         mRpSRh3zTPMihr8tj09kJzxiaj1xJlx636VXhFZupVATrXq6ls9qOB4J/dnQVavrnYP7
         gEafaARNGUr7ka/fO8ephgSyhVjRgUWb4rcYgD9hW/BCQFZUhGzoEEYJo+QwvwaVI5HG
         uwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682178896; x=1684770896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiU/+OJ1+NTRsOIuMwE2sdY2j7LBza6ASYTNd6CifPA=;
        b=jgGnttH4oMJg9VqrT4CgsWhb68lXezqEFIMXcV7I8729Dy2hNG5/H8wNPhWP92l4jX
         zOdC+GK6CrsdMLstYWtqnQjOMFt+Jo8LGDPAitT/Of7uItoQGl6eKfs6wmZZjYMFcNno
         XULiN0B7ZHIwQxpYwC5eBeAksPQUpRsrFK6ANx8ODYLSzk/n6FOd5PmqtfFYqWmQfGTn
         Hb8YhgRKBK4LYFKQli0ZVeyu1lEHYzwDKYMgqQyJECC8j0nelFdJs6q6d6qj7qsmjfHc
         Kf5AdG+ngbRkyx0o0EITI36PTVYD0gkAQT9hOLfHPyL0/gW7K14vFZ7unOXlI+Rip8m7
         zn7A==
X-Gm-Message-State: AAQBX9ci6cN8Z99y+8PL/kGeNAe7vtsrF+fQhDbc3tX7tr5eV2pjK1wd
	7akFjlZPpw/WO5M4Ke/5QNXF/+oK9gxWwc089Uw=
X-Google-Smtp-Source: AKy350bpUsaw9/0skuBeeQFozQqDMbyM7BKJddozsMG/YGWQn9MUaSlcPtIJUHRmKOskKZ6aWf12Kw==
X-Received: by 2002:a17:902:f292:b0:1a6:b247:4316 with SMTP id k18-20020a170902f29200b001a6b2474316mr8300774plc.62.1682178895969;
        Sat, 22 Apr 2023 08:54:55 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001a686578b44sm4205342pld.110.2023.04.22.08.54.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:54:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] cargo : non vulnerable cve-2022-46176 added to excluded list
Date: Sat, 22 Apr 2023 05:54:35 -1000
Message-Id: <7e4037fd0a66a860b4809be72a89e2de97960a17.1682178752.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178752.git.steve@sakoman.com>
References: <cover.1682178752.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180305

From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>

This cve (https://nvd.nist.gov/vuln/detail/CVE-2022-46176) is a security vulnirability when using cargo ssh.
Kirkstone doesn't support rust on-target images and the bitbake using the 'wget' (which uses 'https') for fetching the sources instead of ssh.
So, cargo-native also not vulnerable to this cve and so added to excluded list.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Acked-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 8b5f8d49b8..cb2d920441 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -15,6 +15,11 @@
 # the aim of sharing that work and ensuring we don't duplicate it.
 #
 
+#cargo https://nvd.nist.gov/vuln/detail/CVE-2022-46176
+#cargo security advisor https://blog.rust-lang.org/2023/01/10/cve-2022-46176.html
+#This CVE is a security issue when using cargo ssh. In kirkstone, rust 1.59.0 is used and the rust on-target is not supported, so the target images are not vulnerable to the cve.
+#The bitbake using the 'wget' (which uses 'https') for fetching the sources instead of ssh. So, the cargo-native are also not vulnerable to this cve and so added to excluded list.
+CVE_CHECK_IGNORE += "CVE-2022-46176"
 
 # strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
 # CVE is more than 20 years old with no resolution evident
-- 
2.34.1


