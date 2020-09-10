Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.20720.1599740604445425839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AtoPbPvA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id y15so5608298wmi.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GKkFSBjD6c+wsZZROpuIvXFLHLXLh3Tn5IHHY19pzt8=;
        b=AtoPbPvAWtEp5b8L8akBHGD3N3lpuG6t0xMTe7MRbeRb/vuklIPq8m0JH/w/8YxzFo
         v4UuFP6sHEbzgFP73I5hsOCrnR+EtpG66mtcgWPw+fGbUMWhspRZQhJR5o4P8sgDQX9P
         QMZxG/jM0ki9kUzhKhchWOVBGvJEXGwBZL6Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GKkFSBjD6c+wsZZROpuIvXFLHLXLh3Tn5IHHY19pzt8=;
        b=TC9suT4aEoHgCHJBSH+pzdUgokI7DEco7Oy/0ifEGZtjyjg9PWigoa14669NSLVuvQ
         RpMEY8L+jIlPnazr0psLRAQteUXCfoH/XKrs8Tckn80VCnkAa3E1BdMvvCKQ9jj+1dOl
         jaocDGAtFGhL8QelILzQrI1DZU0aoLJfDAuFXhbnIHu+YlqNW/13oqVyVM3d7tVCiNIO
         +2FohOwSbTKSnebrvY6gNIK7qvyVvl64f6GXH/xK2RetZ5DPFEaWELP0fzbhb7/imh7x
         amesxGx2qTLnG4vlmXUB4NXEWV2kliDcmDeU39i0CBL3aWUHDBavv/OOU7iH2Sck6fDV
         lFhA==
X-Gm-Message-State: AOAM530PQgLGzlgPET0ipDJ1pCHMjoXgGUlASR1bVTTkRO6eFM8yBivL
	oGFdXzSi0+KTe3Z/eQR07Yqhjwrc/4GgGQ==
X-Google-Smtp-Source: ABdhPJxF4m/Hd3XDbwbfRSzUtjntF6r9eP6EsVjlh7Q0IFh2t2Jpm6cC96MpJfDvZJLJMozKzB3qqQ==
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr8465073wmj.33.1599740602690;
        Thu, 10 Sep 2020 05:23:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:21 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior 16/22] oeqa/selftest: Ensure buildtools in environment variables isn't replaced
Date: Thu, 10 Sep 2020 13:23:00 +0100
Message-Id: <20200910122306.2040194-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids the seeing broken replacements like:
oe-selftest-centos/build/build-st-926tools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt
which understandably break builds.

(From OE-Core rev: 04ee0e8b95cd8ed890374e0007f976684206b630)

(Cherry-picked from f930e2cadb9ee69759720b6c49aeeb6dd43a7edd but adjusted for thud)
(From OE-Core rev: b51a8c390714357713e91d828708c85cf5f68971)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 6bf7718863f..5f10267f70e 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -199,7 +199,7 @@ def fork_for_tests(concurrency_num, suite):
                     oe.path.copytree(selftestdir, newselftestdir)
 
                     for e in os.environ:
-                        if builddir in os.environ[e]:
+                        if builddir + "/" in os.environ[e] or os.environ[e].endswith(builddir):
                             os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
 
                     subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
-- 
2.25.1

