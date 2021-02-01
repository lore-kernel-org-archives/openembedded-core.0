Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.36611.1612196789109012457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WLUIUj4D;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id e70so16812600ote.11
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4ZF49RNIeUpxxaxId2X8l+rCUzxOq7qQiJaFjrcXFoA=;
        b=WLUIUj4DDQJx36KFWRepYqeRn7onlPHvrvG/LMzLHZt+6ZqymIfUSEZNuCmhDcZw7q
         a4aEn3X8Xjon5NSdzKQDUkf3zD7Sz+sTkgFScmck0b9gPByvGoFeTlX2P4W/E+DezYwW
         hPe+Zd3ECaaiYKvnfGCSjMwnAuitQvjARiThfCeCtn/m/48BDu2cAxfLSBM3jqtlhLKF
         WV7iqG+IzwrPqWS4fIqRj+OsOQxCbDnW2HkAQc8s6XAI0XJryGyywtSNlOlabzsqGp3k
         6YzrmkEcdaykKscj/76b7ifND4OJ8CKzD0qy/JcEAO7zOg+2u3eFvMQL3C/FCJFoksb8
         wHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4ZF49RNIeUpxxaxId2X8l+rCUzxOq7qQiJaFjrcXFoA=;
        b=fCYZoTgfC86xAoXJk03ijL1iITlU4Om8nuOxK5Eq7F93ElpGCTw4Ibu6yUU9g20wYN
         glmuDsA8GhhfkQ1P12nA/oQIYmmCI/LGZ7CpMidZCkSqUJC8fb/U7JEcvSi/qJ2CLS2U
         FlXv0OF6J7KySNctQJ/8wv4vuI4icBc3brxXd3v7su1cCee2KO/5vghcKN5jncicMWzL
         HChHsZgsxn6XgSAe+D5H3ZOOak6dHyrj78U4Na2rWTkFN45a+SCQ1Wat5/h3teYTlscy
         RbzpEDg8C4aYIVWjgZFEOo/beyVPr2xX8SgM0SzPEx1Gb5Py/CTxKBFhQJq9v5bUTEYX
         lB6A==
X-Gm-Message-State: AOAM533fO1mA3mH2eElBsdcK3mhQszXz8lnvIKlgNETUJht/ZfnosX/g
	avHZxIlzpV++3WSoBsP6m1IA4H9Q490AyJJq2Fw=
X-Google-Smtp-Source: ABdhPJypzIh2vaMiaCa/jHUiToOKBnF6OVVw0Ic1FJlxFx969SNFGwxd8VgE5gxqcRGvz+KROortaQ==
X-Received: by 2002:a05:6830:4006:: with SMTP id h6mr11852067ots.33.1612196786638;
        Mon, 01 Feb 2021 08:26:26 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.26.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:26:26 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/21] devtool: Fix file:// fetcher symlink directory structure
Date: Mon,  1 Feb 2021 06:24:42 -1000
Message-Id: <cd9cee29b656e4c8642971cb87154cc4d5fda599.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

Add relative path if file is under directory.

[YOCTO #13738]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 19ddacc1b38f9ebb86a9359963ccc3c707f7125e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f7d8a82117..7b62b7e7b8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -474,7 +474,11 @@ def symlink_oelocal_files_srctree(rd,srctree):
                 destpth = os.path.join(srctree, relpth, fn)
                 if os.path.exists(destpth):
                     os.unlink(destpth)
-                os.symlink('oe-local-files/%s' % fn, destpth)
+                if relpth != '.':
+                    back_relpth = os.path.relpath(local_files_dir, root)
+                    os.symlink('%s/oe-local-files/%s/%s' % (back_relpth, relpth, fn), destpth)
+                else:
+                    os.symlink('oe-local-files/%s' % fn, destpth)
                 addfiles.append(os.path.join(relpth, fn))
         if addfiles:
             bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
-- 
2.25.1

