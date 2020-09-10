Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.20777.1599740702168668000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KZNnDexM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id a17so6481398wrn.6
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9bs6XBdBVL+85NRzmOVAino/C+Wp4kLqdkb2mJ0G0Wk=;
        b=KZNnDexMDr9Ybnlqh5gTdaex2dbbQeYYugRBOeiNeKUDyITtOq/yodUD0aMV5IBORw
         S0G4GNxMKjkjSl0s9Atpu2x+orCMDiBexZgieR8VlFGZ6AaEuKmp1vjmhvegHpBmFtZI
         L/v5WpUVhJByVJvYRR6xAP6NYM3TyrZuSZpMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9bs6XBdBVL+85NRzmOVAino/C+Wp4kLqdkb2mJ0G0Wk=;
        b=Cpw2YTsBfDftJDuEjNYGXgYtjVwLOVUjOKH8fnnkB7obAK/M9C4V/Eyg1NtsH9Fimx
         Loc8IRnQRrsCEvEAG/SlPEVAa+5fGqqmOxf2ItA0CcUbPy4l1Vhoqkd6B4IkWUZhZWiH
         CFwhIu1Ay6BuYynjuyBW1pYTPW/b+ATlrqlyLhcnbFSZGlF+k7M6NgDdcuYM43Vg39OE
         noM+OAzyLESXfgR5DWGdSgepkKAW2aHMVkXvOAoBhPycCi2qRkK8WRdYrritNqFQRBXW
         UAOwj8HZXMA3m1+kd23qM+vLVk3RsRiw1R7X5smhuIaLFXBe38SGexAWWNH0BAuzveVa
         XT1Q==
X-Gm-Message-State: AOAM530b4tWuycwyYV4fhhBhslr69m43NJ++mMyTB8ZSLRH30Tm4HwMb
	bdG6kUmyx19fy8EuSXICZRevRwKUZHWC1Q==
X-Google-Smtp-Source: ABdhPJwhPjrf7b3fcBlp0ybS/F43DLTn1opKFpQKT47z7tte9h8hENDDjPXrDoQ/HK+ThSt4Mdl2GA==
X-Received: by 2002:a5d:668b:: with SMTP id l11mr8455638wru.89.1599740700434;
        Thu, 10 Sep 2020 05:25:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:59 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 25/29] selftest/signing: Ensure build path relocation is safe
Date: Thu, 10 Sep 2020 13:24:29 +0100
Message-Id: <20200910122433.2040293-25-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly to 04ee0e8b95cd8ed890374e0007f976684206b630, ensure only full
build paths are replaced in the environment to avoid breaking buildtools.

(From OE-Core rev: be07d93a4f59d4563f2d064be1997b39f05e9f0e)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 4fa99acbc94..8d585430be0 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -40,7 +40,9 @@ class Signing(OESelftestTestCase):
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

