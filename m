Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.20406.1599740607933487018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JGtz9vRP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id e17so5439969wme.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kl0gp+qLm9ESOmjZy4GhBbGWA7odC4l+pOVfq5niZOM=;
        b=JGtz9vRPIn2YFjWkr36InasJ3QZm24A3V0VbH2IF1UHlBElckaWpjcuFojOf1EwYCC
         23JLOJvrbU62GIlHcLwRAMYTJZGwGmjYj0Nq2fKFRdz5NQ6k9MZLTyoIxy6L7t++cx48
         JNu1Fb4Z6lWkhxGkSLrHvyeZKRJFt2wZtUiIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kl0gp+qLm9ESOmjZy4GhBbGWA7odC4l+pOVfq5niZOM=;
        b=eVRautxmylzaS1kRxwOYlG5zDy7CgeGznfIUWC/rzgesohCd/9GianAP3F1wW4HKws
         kk5+UAE/vtw0kHsCDYGjDl19j1/ORqVyBmz9isAuwQcsuFRTSH+fij3tVrfdOmCKmsfw
         06HogoAy4zCU/Ny/ifv9wgTepLp6zxiofvoFcO/obAbK0/V3BvJCuVz7d9U3gv+gsfTN
         +OoMyftnYe2RV5kujmRxcKy0sxl0K+vVAQMl9ucHAJRFwJ8o8stpAgvU1O6ODpMF0D0R
         H7Dpn2H3CkVoKUPcariLo52GM0xJa/soDkVustoM/zcyUw9oLxRFi6XrV6T6al3IXeH4
         T/qw==
X-Gm-Message-State: AOAM530zISPeAeP7WvNzJS0HWr9n72afSLi0InH6e0te/iSecKvv+OWe
	uR85HzN/tRTEawRlYL26VydG/IhGbpmXaQ==
X-Google-Smtp-Source: ABdhPJzSvan4N1PTr+SuLDFk0UP2FOBFszp8KcCWs1KO//dVZULhSvV6zfdcfU2kOdoxX3ObiRndng==
X-Received: by 2002:a1c:b703:: with SMTP id h3mr8067385wmf.131.1599740606207;
        Thu, 10 Sep 2020 05:23:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:25 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][warrior 20/22] selftest/signing: Ensure build path relocation is safe
Date: Thu, 10 Sep 2020 13:23:04 +0100
Message-Id: <20200910122306.2040194-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly to 04ee0e8b95cd8ed890374e0007f976684206b630, ensure only full
build paths are replaced in the environment to avoid breaking buildtools.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index b390f37d8e6..41627ff8585 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -44,7 +44,9 @@ class Signing(OESelftestTestCase):
         origenv = os.environ.copy()
 
         for e in os.environ:
-            if builddir in os.environ[e]:
+            if builddir + "/" in os.environ[e]:
+                os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
+            if os.environ[e].endswith(builddir):
                 os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
 
         os.chdir(newbuilddir)
-- 
2.25.1

