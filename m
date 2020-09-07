Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.43943.1599492987173413463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 08:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bPZVsxr1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id y15so1971844wmi.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=53d3Uc4/KmX6S1KNpweP5rHVDugU4+Ly86lTqdTVP6c=;
        b=bPZVsxr1j3B7Zpa0jDQumVDZM6PymSi8JiZjORqCZ1wfO1pNjpa9c5vnpDQxfySMYr
         nKUxyw4F4wQ/UDFMG1oidhHB/IMTNcT3nhKw6BKkj+Z9iNABxeoXcRb+l2Mq4LaCbJfh
         0o2qNote9+bqNRQ80MmT8Ye6YV6uaOSADaUvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=53d3Uc4/KmX6S1KNpweP5rHVDugU4+Ly86lTqdTVP6c=;
        b=JyIah0iTXBuisopbK5B6S3FehlIlP0gFdn5cBMGeBOHhwHWLajJHtMel0V7UGzJMUl
         WtxdcP7G44lSi4AkkWximRgw7grpCC0+MCNQNua86+Djxqpqk7yaNTmt8cP3SaZosXiF
         1OwR+XvWLvG1XYm+9CnLSI3gAPLOCnznxe7qdEG8hqzbu/ugZqUyo62VLdQb9qxl9DIE
         QMjUeNz2oIOisd2LIp6Rjgs1chYI52AAa9y08nTcLP+4dr/TabYVD2PM8iHXfjCND2zk
         LlhFWeBfs6UkSh+Ci5Qlkm+IkM38mkDUQX9M74vP3lwI2TOKjg5UN30uidPyahQcor7v
         DOpA==
X-Gm-Message-State: AOAM530WcqoFMUs5WHbB05UhN2nbBDC2ZxkGSEX1Ehjkke7y1p1XTFlz
	dJqdoeQ7zLAYZLDKwDvMUSEJfYcpbg59Qw==
X-Google-Smtp-Source: ABdhPJxp5oEneQfWtDkREual1PucZd7TBl917XNC29/5RZ9dR6RCuU/eJby4KV1dsyQ6TXrYYlnOKw==
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr21087400wmd.9.1599492985038;
        Mon, 07 Sep 2020 08:36:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.f.d.f.5.0.6.0.0.2.6.1.6.b.c.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7cb6:1620:605:fdfd])
        by smtp.gmail.com with ESMTPSA id 11sm26764904wmi.14.2020.09.07.08.36.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 08:36:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/signing: Ensure build path relocation is safe
Date: Mon,  7 Sep 2020 16:36:23 +0100
Message-Id: <20200907153623.1928165-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly to 04ee0e8b95cd8ed890374e0007f976684206b630, ensure only full
build paths are replaced in the environment to avoid breaking buildtools.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 202d54994b6..3332bea1b9b 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -44,8 +44,8 @@ class Signing(OESelftestTestCase):
         origenv = os.environ.copy()
 
         for e in os.environ:
-            if builddir in os.environ[e]:
-                os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
+            if builddir + "/" in os.environ[e]:
+                os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
 
         os.chdir(newbuilddir)
         try:
-- 
2.25.1

