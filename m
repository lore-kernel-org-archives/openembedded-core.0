Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.16163.1599555865452890172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 02:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MZrnMMdc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id g4so18264923wrs.5
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vLUbebq31Qiz70gTlgE14O398GIqAC66Ra20REBhr1U=;
        b=MZrnMMdcOb3VYjyr9noFkzhwMIaaVFBHdJglrHt2ln/5QmlD2JPN/toyOAJ8gcKdPB
         ft7RxvlH96NIKTGZ1mxzYXKu/bGmnEKy1TrQjreBqip3/vIITNQyCXbN7HJAzuP+XOx6
         mGcQ8kANQLSCqsO42/snwwMugTjyhECYVd+Us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vLUbebq31Qiz70gTlgE14O398GIqAC66Ra20REBhr1U=;
        b=jbLF8uA6oR7Z9bhzdzbcDIhQLU3GMhrivG1iPinxSoK++93U+PUjmLLvk8IoR76mH/
         K00fRzTfjzzi+rh1SEhSl8XKEGUGKHv7etWRKP7+LQPtmXgrSmoLX5b6i02LU5ANxdey
         Yz+JpNiyqY5VbKZH0svGlXCdN4cXmAfKWhCgeClbpj04RpIGfzGc7H3IzOAa8OFq435A
         lDMJ5d0Abl2SenxgdKCTPfWg8gGpSvOizry8lsr8gcR7aB+OldnS32HOYkcTYPJipibz
         hq5PigBi3P6TQIEGKF4Q1scKVsn81X8zW087YRW6vC7fe4Ho+iDFS/nf/dh18RLDAn7B
         PR4g==
X-Gm-Message-State: AOAM533qFekb5Y4gVb7LItc1WV4wFfUSBmfSt7rK5HeqkYDJB8OxTplh
	/vRAfJAGufKKPuF1FF8EdcBpsOHSg79tlg==
X-Google-Smtp-Source: ABdhPJz9hEsUjv3XYu0wTO2hmawQSKknPDDNGWuRiUM9hGAKYTiXdFrDdiEWLD4jBsK2RJtIrS5a6g==
X-Received: by 2002:adf:e802:: with SMTP id o2mr25335052wrm.309.1599555863406;
        Tue, 08 Sep 2020 02:04:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id o128sm29229030wmo.39.2020.09.08.02.04.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 02:04:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/concurrencytest: Improve builddir path manipulations
Date: Tue,  8 Sep 2020 10:04:21 +0100
Message-Id: <20200908090421.1962198-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200908090421.1962198-1-richard.purdie@linuxfoundation.org>
References: <20200908090421.1962198-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its possible some patterns may cause problems with the current path
manipulations, make a small tweak to try and avoid potential pathname
overlap issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 23f7d71bdbc..dd3609c1d6f 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -82,7 +82,9 @@ class OESelftestTestContext(OETestContext):
         oe.path.copytree(selftestdir, newselftestdir)
 
         for e in os.environ:
-            if builddir + "/" in os.environ[e] or os.environ[e].endswith(builddir):
+            if builddir + "/" in os.environ[e]:
+                os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
+            if os.environ[e].endswith(builddir):
                 os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
 
         subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
-- 
2.25.1

