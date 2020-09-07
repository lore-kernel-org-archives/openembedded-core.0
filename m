Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.6541.1599512019180582062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AHEbNCNE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id x14so16911765wrl.12
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=stCvZRvo733srl9Ik+BmvisWs9IDtq9aghvxuH6i7iU=;
        b=AHEbNCNEgwnirV4w/hgKB3viryrsyQRMSgYBzeWjnqGJ8uj7iRee7kyI32f+A9II8q
         Td2dyM5fPMCpI1oCLayV/IWO66SDJGRzHImP6M+Gn9GrjEzbHu3GPSGWwnI8SORtFaTJ
         nMmDMLVpPbWqwrNOB6z2kno4ASVfEqpuuCyzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=stCvZRvo733srl9Ik+BmvisWs9IDtq9aghvxuH6i7iU=;
        b=VGm6ccPoABueFTnFGiTNVEW42M4bd5snQjSLVNKM5nuXYAXguMbdLulZBLPo6dnUII
         v9oAOlPJI5CGJt/2IIB9Ymt4VkxTeNVlIAlCvfuDYp5T/R0q9z18HRonKjaa7S38sUsm
         DjiPHD63TmXE2oBWxdryrH64W6qIPkzUzbehToXz+UgWD3y6qk0iqPJpqNv4vk83AEOf
         0FxqYDk5oL8OpHKVtCaGGUseAwoUiWDSjgjxnwi66hP0KWleFiIWZhyA5fbsV/HI6lBr
         dCPMaC8+uAxGsD1NimkdznyflAfkABkpiIf+E3asWD8/Q3bbcsh6l9xanGMsItHrd296
         f1Og==
X-Gm-Message-State: AOAM531WZkhl+vAyfYZ6qFWH3u42+RVJzEzQ6bX577t3o2/oSzsJJ+3v
	pulWx0aB+gck/WUxaVncIZ4WsWDJiJRvTQ==
X-Google-Smtp-Source: ABdhPJxdHXULbNnXXH+c/hjoFFWt1qGlnTB5/CjsXAzgIy6+cfgzq1yJ6ONxJp9Xcf7AjTgxNFe4OA==
X-Received: by 2002:a5d:4d8a:: with SMTP id b10mr17634088wru.82.1599512017427;
        Mon, 07 Sep 2020 13:53:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:37 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 16/19] oeqa/selftest: Ensure buildtools in environment variables isn't replaced
Date: Mon,  7 Sep 2020 21:53:18 +0100
Message-Id: <20200907205321.1941682-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids the seeing broken replacements like:
oe-selftest-centos/build/build-st-926tools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt
which understandably break builds.

(From OE-Core rev: 04ee0e8b95cd8ed890374e0007f976684206b630)

(Cherry-picked from f930e2cadb9ee69759720b6c49aeeb6dd43a7edd but adjusted for thud)
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 0f7b3dcc113..e6b14da89d1 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -261,7 +261,7 @@ def fork_for_tests(concurrency_num, suite):
                     oe.path.copytree(selftestdir, newselftestdir)
 
                     for e in os.environ:
-                        if builddir in os.environ[e]:
+                        if builddir + "/" in os.environ[e] or os.environ[e].endswith(builddir):
                             os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
 
                     subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
-- 
2.25.1

