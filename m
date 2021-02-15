Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web12.31518.1613399900529408129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kzSENZkM;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id v193so7928810oie.8
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+uaM246T+FGEA8H9WorqFTimf0IAN0yEkG57kgNuMrg=;
        b=kzSENZkMIgTJ2F0qB1682i5Z5IS0SU47dqU7ajhpqLpjdb7DbZofPgDTwRhgXFxWci
         shWe5yEVggKjT0RE2louX5VBLFaCx0pD88py6LpVFCSa0U5eJ+IrGqkm81W6hOIAEJv0
         16GxN33FS9MJp2o8dd4EbXN/7ii7IVNtCYtxXP4JDguY5nmN80XpWE5EU1duHjQ4rNHr
         woDaoAP1t+Mtq69LUXy4hSKxiQbURkZOj8xGygTpufjBCcYJWm5ycONbW0WfudeX6WGn
         7sCDW+fYY5yN93ZrxFWxZH7GHi/Wx2VdIpjAQ2aInkADFpLzWHld9dnbNvAxxu0o8gPX
         8YoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+uaM246T+FGEA8H9WorqFTimf0IAN0yEkG57kgNuMrg=;
        b=Q4kX23CI4gVSE7+mB5bTquNclgF1oboOVmRUa0bGvfXKO/pBw1xZhX4JC49jXg/OLD
         IKhCZleRFTS6AMNveymz4mhAu1DqpaZhI0yHd6/kiKgneyIEAX8nCCjeCjbDwkAodU7J
         BDoMo8c2ybedXTllbT3c3gFk74dsgBWms3V9AxB2zB/LJRhMorg7YYcNyzvsBqT1JWt2
         9MPWQWSa+KFLYxPP+j9MD2p0l4XoIbHP2SN2dLM9Bkou7HtDWYsykCDoWiH0TmA8b7hn
         EGT9nWbFB57Q8F7lNchD0Dasr6u+q0m0xXiPA1/K4AOoHiKA4sUX9SD4Wy/J8c+HmvmN
         EhdA==
X-Gm-Message-State: AOAM532rujhR9yGgUvTyp0EytivHE0M05E3YgEAoSGYmrzmwmZqzXJ0g
	PbTab08eJkCLLFUR+3i6IgIBr2T//lRfy6sH
X-Google-Smtp-Source: ABdhPJy9n1qqW7O/m+Qe8X0ZwIjpDoMptD7bw+6Ea6fgp6GtTmorJmpof4As9/hRDVfmvEBh4UXwBQ==
X-Received: by 2002:a05:6808:140a:: with SMTP id w10mr8597979oiv.146.1613399899497;
        Mon, 15 Feb 2021 06:38:19 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.38.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:38:19 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/17] oe-pkgdata-util: Check if environment script is initialized
Date: Mon, 15 Feb 2021 04:37:17 -1000
Message-Id: <dfa4b0e6cabb870a33627ff5a0b5f413f6edb1e2.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Tinfoil doesn't behave well if environment is not initialized, this check ensures a proper error log if environment is not initialized.

[YOCTO #12096]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e88073e16f1b4cfd0f97c81a988640a84adad674)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/oe-pkgdata-util | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 93220e3617..75dd23efa3 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -598,6 +598,9 @@ def main():
             logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
             sys.exit(1)
         logger.debug('Found bitbake path: %s' % bitbakepath)
+        if not os.environ.get('BUILDDIR', ''):
+            logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
+            sys.exit(1)
         tinfoil = tinfoil_init()
         try:
             args.pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
-- 
2.25.1

