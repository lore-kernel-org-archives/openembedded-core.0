Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9085C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:13 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.1544.1654188792394489359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=z8j8dOyp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id j7so5422299pjn.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZyAIgHiOSDWEuKSa4JVgO2QyHWKMROWdRaVhJ0gZh+w=;
        b=z8j8dOypma6K2Z++J8YCCWdTQZ6JPXSGwub/DLzNvXhcvqNV3SNS0H/pmiuJCOeFrs
         FmVxTUYSMuQ49wSzqZE+o4WLDi6lWRuVkp6rdEBDRejgU1PKOpqkIwlffy8TT+bsCvpk
         htftS4xrPbDIaq/2VW0oUEjSKtYyxyIx5t/M0MIE4t/J/IUWs85+YxIeKolIaWQaK4+0
         /IfSXJ0nTyxv/u9A1V6zOSsV1M4OerIEvQQ7OJjNVRwSIAzpNILOpYh3t5+9GgeOX3Bq
         EGXzEzelmCtZ/lRtrPJh/JmaznW03LtVmea/V53cHXlKT3fwrppLEPYz9LaTZJCNOUZ3
         Dhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZyAIgHiOSDWEuKSa4JVgO2QyHWKMROWdRaVhJ0gZh+w=;
        b=yFjfmt2odvQ9JJ2VokGdaJ8v/32pOkGnmtrIp/4b46+ddksXnSn39SzQnZwSOZJe/S
         9/CSh6cHHZW4qiFUvjQ8tFsmadHr0X5wVUsL6o/udILb8xAQ/PHnUM23ereiqD4XOUHi
         zJBVSTqEYM0lRAU4ZgB/r66HfaRHPrHuuzo4DbJBE7EGnm9rGGszWFP1cezLeRQ9YvQE
         8xoXcdSKSs3MCdklB79aR5WRKTCvsEK7JQ0SNORfIqVNcQowhet+GhmY4fYENgGZVBEY
         cB/57FisQGLl7/Mgvt4xcR0KrtdG3kyXiohVe2AbUI1DKACobQz3fn8WUNBG2zhfA7Nn
         EgZQ==
X-Gm-Message-State: AOAM532inGrrRdBEGGQJpmt2JmJd7WDkjfOtjGDYijInV7l3EikUkYdZ
	7A/cVyQR+e6i21UTuUb9AHSDjxbfX3So0Yox
X-Google-Smtp-Source: 
 ABdhPJx4FzWaFtdj1k+kr8YuSoQjGnGftJPiosw4gnESRjys3G+3Mzn2EKfutj6gWGUvfoojpRL3uA==
X-Received: by 2002:a17:90a:7e02:b0:1e0:a6a7:6eb with SMTP id
 i2-20020a17090a7e0200b001e0a6a706ebmr6238572pjl.203.1654188790959;
        Thu, 02 Jun 2022 09:53:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.53.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:53:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/26] rust-common: Fix native signature
 dependency issues
Date: Thu,  2 Jun 2022 06:51:57 -1000
Message-Id: 
 <1887a69a1738cdf34d27f396943bce6a7e4f8e39.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:53:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166502

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The previous changes cause sstatetests.SStateTests.test_sstate_32_64_same_hash
to fail since RUST_XXX_SYS changes depending on the native architecture. This
is correct but these are accounted for in the layout of paths in TMPDIR so
they should be excluded from the task signatures for the correct behaviour.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2b9bb4c07d0ab53f58cbdd8a96896780a90be9a8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 3cdce36439..621cd4ad57 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -347,6 +347,9 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     with open(wd + sys + '.json', 'w') as f:
         json.dump(tspec, f, indent=4)
 
+# These are accounted for in tmpdir path names so don't need to be in the task sig
+rust_gen_target[vardepsexclude] += "RUST_HOST_SYS RUST_TARGET_SYS"
+
 do_rust_gen_targets[vardeps] += "DATA_LAYOUT TARGET_ENDIAN TARGET_POINTER_WIDTH TARGET_C_INT_WIDTH MAX_ATOMIC_WIDTH FEATURES"
 
 python do_rust_gen_targets () {
-- 
2.25.1


