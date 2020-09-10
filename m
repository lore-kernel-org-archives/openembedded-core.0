Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.20438.1599740677965949803
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YZEW2brS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id e16so6509873wrm.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rNHXntbq2kHCqx768B/7/wMbqimTGVcQwdAJa1boTDQ=;
        b=YZEW2brS716hfpFwk3sONPitJuMr6cKHee42nRatvWqUsfyr0RWTguivmd8JXnQBRm
         +s8hCiqmBVitJeZUuTiFPbtjqY4HlJG7Cr0EKWmuNgI0Mgxcvs06ez/Eh9IQCyWSsmO5
         ACazRvFkR3EhdGPKCv8nVy1EW7cq0d04U0Ma4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rNHXntbq2kHCqx768B/7/wMbqimTGVcQwdAJa1boTDQ=;
        b=hgJ4ShkCHKUjYQ+wPEP0D6a4Pe0yMhC2glTFHhNOQT1Dh5X+o4YCUFQ0dMkAc2gLKf
         qHJWbh5PauU4r5S0DHVhxq8KpBQDpjAUAR5CGVGZfVLrimVKgm7t/D9PSDHAnuwyo9V5
         iKolwccN+GTA0lDU2nUyHtnFFIw6Yl6q2i4ceaPB6dyJTcePT1NXr5BD86fBh0AV/E8D
         sC5pjwGU13D8Vy0uc/MnlGAKijU/Qqj2lwvpCLPCRE0t88VbFgME9cg54T979DEFYvlE
         0FDbT1TdOVk9UBDJMAsR604lQfkgutPHtK0qeGlmEEt70mvDO88ifvvWdxACUN6UMKCu
         67jg==
X-Gm-Message-State: AOAM532AY9mDSNBu7UJnM0y9NFnTo166ICZWo1rNSQsG21WOovCNvZK0
	uMjACErMsp80+QndynbSMJekluM/2wgLFA==
X-Google-Smtp-Source: ABdhPJxxjufYVsKALDw4a/A/6UHsLX4ZMwIa1dQ0VkjOmCt23mzt9eod5tpoGSMZk/moiUYH6qYfXw==
X-Received: by 2002:adf:f984:: with SMTP id f4mr8813116wrr.102.1599740676210;
        Thu, 10 Sep 2020 05:24:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:35 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 03/29] oeqa/selftest: Ensure buildtools in environment variables isn't replaced
Date: Thu, 10 Sep 2020 13:24:07 +0100
Message-Id: <20200910122433.2040293-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
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
index 1a58d35ba0a..3e0e5d770c8 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -194,7 +194,7 @@ def fork_for_tests(concurrency_num, suite):
                     oe.path.copytree(selftestdir, newselftestdir)
 
                     for e in os.environ:
-                        if builddir in os.environ[e]:
+                        if builddir + "/" in os.environ[e] or os.environ[e].endswith(builddir):
                             os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
 
                     subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
-- 
2.25.1

