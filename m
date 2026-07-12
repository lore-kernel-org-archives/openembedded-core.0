Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515C1C4450C
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:27 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.934.1783881806486645527
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=g+3a+yMH;
 spf=pass (domain: underview.tech, ip: 209.85.128.182, mailfrom: vince@underview.tech)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81e69a2db34so35749807b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881805; x=1784486605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkjp/Ui3z0NDyXIH3nQu13Rw8g+SlquhdVP/pxEgEuI=;
        b=g+3a+yMHvlEQiDTnV1Z3Tp2zH9Sr6SLQZM1vRqrPKEIv3wzlpX9DGN4Sj0oU1QZJXj
         hTiGS18Tb1Aa0A6vR0h+40nmWsXy4VlN54Ic02H0w9veXhV0rqoa21jbN3oTHfQ96eA7
         wZq3uhyDrffTcs0it7lz5dtFPwxqd4aUb0w+QsLYipsSASxE5ypoVlPN/1FB75EyvdkZ
         0DPF5PndIE07EX4aKfDTB+Zf41+JULwk0sUpZxCd208KIpkMrcFZEYQKPlNLGQqVSZWu
         A8ajm3EjCdCi1lAxpvm5rQCWxWK20MqJE70UjEwQRHjagdOlpjN1XCmPOqyMDyVfkFaw
         la6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881805; x=1784486605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kkjp/Ui3z0NDyXIH3nQu13Rw8g+SlquhdVP/pxEgEuI=;
        b=gBGP4AWQ1eJNL4jZevuOQ4skEgDdd342MpLkybWMOL6HF57nMQItzeGu9JQJjKpRVX
         UyUOrxgWEeo3XYBPRT4rISAJre6IYd/8yENYEgAxCD9fdDgIJ7yD1lM2UWv+Z3LCib3p
         lAJx2FpUyYDYCpHGs+p3rGR9ecnn+1teRi0T7SgDnyie0Cuqq9p1vja3gE1zt+iuby/U
         mSDnGkK9VVtHCLLEpNChTUMJt00mJpJNHBxPpLj8YgyhfxVEllqysIyTowx32gLX7UgR
         px5OMZQ5y5iIkWPCytiRYpzQUmUbfXOi6Mw0wHfJ/jLpdVn9AGlm17SUpzM9eOCVq3az
         GPpQ==
X-Gm-Message-State: AOJu0YxUNNdOdTwe59BaTtGMcLQQgwvrMNFkZvr03KeH1K7Df3gjKSjc
	JE7oowrIlKiCd0OkMwxZXwMH0jxNyGnHKhjM0GveyAgihKqp32nNyBaVMGUEjl8csiwubEf+Upl
	YVD7Lix8=
X-Gm-Gg: AfdE7cnIAQDdGX7fwTax/DzZz4xFj7y1EJKfzpf531TAItviehHAiAFxxstJjsSwJc6
	frHkGdUBQloCtKcwl+eFoKs/3dEIm5vlmqxIUfCJqLgDTTWvu1SLYS1fTB/9nXykNNduEMKy2Yf
	0anXdXwFHH7hHEc7TH12Dr4yexanjHf+qSaIWkWAi9QHgxLZo9wm7/2urM4JJ2OGOufBdINc0G+
	tC8ybacKhCafnPcLMcfvnVUuz7bvWzc1OdCjyKQgeQU6XXN1m8MsZVSwoKp5pnjYfI2f9YQrKMQ
	H2oEUkBXzU0w0S6d52M3tbnRNlfPt0Kq7oyBfRyl9IJ/6m3Ky1KiIjCk3rS7P9bYo00CKf25ZlY
	sKpeYgtaueHjeJMh69lR+lHtdlCCGRqseoaZ2VFr3tkZF79qf+ont6RGlKLvDNRhuLHOU2WWJeV
	BBRfNGK1ZwDcwUTg==
X-Received: by 2002:a05:690e:4889:10b0:667:a025:89a4 with SMTP id 956f58d0204a3-667d7a94989mr3637037d50.18.1783881805546;
        Sun, 12 Jul 2026 11:43:25 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:24 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 09/27] ofono: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:49 -0400
Message-ID: <20260712184307.3259642-9-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240799

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-connectivity/ofono/ofono_2.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.19.bb b/meta/recipes-connectivity/ofono/ofono_2.19.bb
index 74fa70f609..defbe5fbe8 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.19.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.19.bb
@@ -44,4 +44,4 @@ RDEPENDS:${PN}-tests = "\
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-pygobject', '', d)} \
 "
 
-RRECOMMENDS:${PN} += "kernel-module-tun mobile-broadband-provider-info"
+RRECOMMENDS:${PN} += "${KERNEL_PACKAGE_NAME}-module-tun mobile-broadband-provider-info"
-- 
2.43.0


