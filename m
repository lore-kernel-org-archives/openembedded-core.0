Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.10603.1614352524352510540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 07:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OB8BMcRJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id p3so7721346wmc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 07:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kPT94xDjXrjRWXFMEI9gNBmyQA/qQoiCajJ55wWMR7g=;
        b=OB8BMcRJ5TMicgJt9ELlYJjwIK6+BzAsmW4YQg+ng9f6gdvzeBT2QlCkw3f8Qq4OPg
         yEeLYwt+fjO+L6O+6qtXct3tfM6tXviC6xgD4Aw3bz5nKglDwD1TNCcIuHxvESHBCkge
         E2GzjuHnwIDKFDz9CEfW60e9wihJuoL+oVvmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kPT94xDjXrjRWXFMEI9gNBmyQA/qQoiCajJ55wWMR7g=;
        b=WaYJeQDiBQ9JD7K5JrWDMS79KAxGB5SaZrLsZknBNBaJlkLovydA8jG/P8/swzuQvj
         eFAyTjG4QgMxE0EyblXmQieCwdjh09MfDiDZXku8wpGNXTyR2a8ihm8jpv8QrAONOwQw
         viuJ8DMtOp73xaL7VO825HT/xWFn/sVgYAvRVLr/qJtWSY75cR5gc7Z5Q2vdLC5/oVcT
         asKb5jl2X3wj0gMSGDqedUbb8X0pwN/fiCLLU/NN+QZnvFtBfmPKPPs0bm3zw2QjtNZI
         N550r1tVBOJChRECvPzm6m0AqPXfld3YQWgchaDasYLBdtBTz51Gb9oUxGE9FxBFfiIl
         76NQ==
X-Gm-Message-State: AOAM532pPdC83WduUd4F1DFBJ4S0SpuU0sQv3eIkZ6D/ZUtqJCfao2S/
	92a7I9M/CAdF2mwWkCi4RUHLXOdMcZiCnA==
X-Google-Smtp-Source: ABdhPJxNVi0yXVdQUB+5VFmxlLQV17xjO4c2UQgvzZkVomhxQPqf8GG8A9Y3VBMSiTv/kYrvzluL/Q==
X-Received: by 2002:a1c:7312:: with SMTP id d18mr3311898wmb.155.1614352522343;
        Fri, 26 Feb 2021 07:15:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id f5sm5661736wrx.39.2021.02.26.07.15.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 07:15:22 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package/package_rpm: Disable font_provides configuration for reproducibilty
Date: Fri, 26 Feb 2021 15:15:21 +0000
Message-Id: <20210226151521.3932282-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The host may or may not have fc-cache which is used for find provides
information by rpmdeps. This lead to non-deterministic build output.
Disable the font provides code so we have deterministic builds,
we have nothing using/relying on it at this point.

Need to disable this in both the rpmdeps code and in package_rpm
itself although the latter shouldn't be being used.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass     | 2 +-
 meta/classes/package_rpm.bbclass | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 417e2252979..e3f0a7060bf 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1710,7 +1710,7 @@ if [ x"$D" = "x" ]; then
 fi
 }
 
-RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --alldeps"
+RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --alldeps --define '__font_provides %{nil}'"
 
 # Collect perfile run-time dependency metadata
 # Output:
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index c1824306ee6..84a9a6dd12f 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -689,6 +689,7 @@ python do_package_rpm () {
     cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
+    cmd = cmd + " --define '__font_provides %{nil}'"
     if perfiledeps:
         cmd = cmd + " --define '__find_requires " + outdepends + "'"
         cmd = cmd + " --define '__find_provides " + outprovides + "'"
-- 
2.27.0

