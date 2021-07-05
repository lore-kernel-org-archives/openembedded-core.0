Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web08.514.1625524629256831398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Drz3kLb1;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id u11so22360779oiv.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5JFajAhR1kFKkkG+PiSdODnUs5Cua1mIpGp6YcsrTxg=;
        b=Drz3kLb1Q/RFLytGwS8tdZ6SuBtZquhrsw1kX++95Q3zQAPuNbAjQO6af/t6maWqw5
         Xkbf2qHGZ/dfXs5s13E2QPReSQz+oI8mBSulP7ooDhWgLNuncUi7WW5vymmUAHcsIFMs
         SBMZt/kkgGIdN/1tTWTyDfxaGsrz/RveAEPK6M5bDVc6Fj+3ceHiYIOj+hk6mgiQGxF+
         Sifu9ygH27+OCOR5to2hPqFv/YnQss8kOgIRW0XbiR0Um0lKs12oVaAVUKSM8ZWTOzxt
         OeTWTYv1+taDpyoiycxpTSnY5QREzA5LKCdNMX48sFVynkyYlgvSclOAsJ4NJcxSn5qx
         rkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5JFajAhR1kFKkkG+PiSdODnUs5Cua1mIpGp6YcsrTxg=;
        b=n3CtsXaTfLEmi5bwN9E68tpto9XFPP4iFb57gPJWrXW5WMpx8HLKnjfzLUbLJr7pmy
         65j7VBigF04Ubgd7/Yn0XpvFQXZvhk+pxjGG3tMkyK95FDAVI44mVycXjUWPcB4zdnMO
         y2BXCIR4EzV78Y+nVAM3Y/SXE272qjH6eQyiv7JnPsCNLlRmBxWdl3AgWnxolrByjmlg
         1jrQdGXSKHUHlKzUJhNnn/7nLgMvYrCvq1exsJNc9d4hiJPTh2ho4LMhdfqIq7ZVbew+
         B+8Tr+GNxShabKq6k86Ok5ge/wWckdfb0JHipMSWXpLEFaFhU+ZQuyNJH4jbI9tfmLlK
         Wzww==
X-Gm-Message-State: AOAM530i9y3R15V/lMW8uCbZnGyym6dcUoX/WlMHwKcdgozUBRt0UlBO
	ZcE9dZP92BcGfdGlsin3NZYc/4mq1M3PtfKY
X-Google-Smtp-Source: ABdhPJy5q0GOPNDJcNzFB+0Nc0JADlrMSRnVmXbDH0ezY5Zm6/7wFwo99v++lphDFeJtQs7OwRuk0Q==
X-Received: by 2002:aca:4482:: with SMTP id r124mr11577240oia.153.1625524628239;
        Mon, 05 Jul 2021 15:37:08 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.37.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:37:07 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/19] devtool: deploy-target: Fix preserving attributes when using --strip
Date: Mon,  5 Jul 2021 12:34:55 -1000
Message-Id: <c2f8d8db8b3f05dfa40912cc0b9788b762806a33.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Amstutz <florian.amstutz@scs.ch>

Commit a2db4fa127a3347fc6df31f895fb0b552669119e added ${WORKDIR}/deploy-* to
PSEUDO_IGNORE_PATHS. This breaks the --strip mode since ${D} is copied to
deploy-target-stripped. Use the directory devtool-deploy-target-stripped
instead.

[YOCTO #14451]

Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 02661f20faf11d0fa2f1874bd423f5d9fa7a31c9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/deploy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index aaa25dda08..d802b22e8f 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -168,7 +168,7 @@ def deploy(args, config, basepath, workspace):
         if args.strip and not args.dry_run:
             # Fakeroot copy to new destination
             srcdir = recipe_outdir
-            recipe_outdir = os.path.join(rd.getVar('WORKDIR'), 'deploy-target-stripped')
+            recipe_outdir = os.path.join(rd.getVar('WORKDIR'), 'devtool-deploy-target-stripped')
             if os.path.isdir(recipe_outdir):
                 bb.utils.remove(recipe_outdir, True)
             exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
-- 
2.25.1

