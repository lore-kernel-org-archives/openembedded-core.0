Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48271C6FA91
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 12:28:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.5258.1663331280520581141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 05:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=as7qwuK8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 u15-20020a05600c19cf00b003b4acef34b1so3175681wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=uE0O5JKED4puUv5GyMSRJBpTvmLXSClC3TwXOQahHBE=;
        b=as7qwuK8q5ciTLXmSZzVjIJdVDyCCcNuuR4ElB/RmIBGc1c8TP0vW++0imep0gajXQ
         wMRGfpJhynUz17xI608oFtT9pNUc4tvsYANMJ7wi4QyJvbYxBFHvmULcaMJFy63E/Mzp
         YA/upi8NrzVppSHRPI6DRhYOmInNrOsFw00jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uE0O5JKED4puUv5GyMSRJBpTvmLXSClC3TwXOQahHBE=;
        b=AhpM3kwab1aNY4S29/uYShDihi6TBtz1hcUpuLsBFLg5tM2wZkbedSzS0NNhIOWNvW
         h2+Sf0OD0xxVeDsU5SixBTMOQl7QmMmw0YgmdzbCJSJDwCU5alJN+mAaMvgn1fveMPld
         /25GxF66uojZAkHfp3KzcclljIL8OW0SlfftASv6nKu7jQ7I92gpwDNgTr4CGH9AfUbi
         tD86KfS7ICZILPmIaZV+QIiJd9X+APcBiOBB08+0XDqRmAteJoXTN6ew7xlq9p/yfuhv
         ff1u3uaFKgJrBLm1TYomK2KjSnyi4H+i5kvI5jenODwZr4kkERlSI9Gnq+wLin27aaJ2
         e7Xw==
X-Gm-Message-State: ACgBeo1TR7knLa4oVleO/HQXuldPtdHEmZzp5cxeLOpuM+aLaHpF+7jT
	yWBZaKzZ6W6eWE/TTH4JoRLtYjkv7l7oHA==
X-Google-Smtp-Source: 
 AA6agR72icJGqYlh6M7Szj41S3AFXe1sdDe8C0jxCpTkAiR0p27KDhuNy57W/gSkYtUqF3GgM1CKCw==
X-Received: by 2002:a05:600c:4f82:b0:3b4:9f2f:430b with SMTP id
 n2-20020a05600c4f8200b003b49f2f430bmr9605426wmq.16.1663331278301;
        Fri, 16 Sep 2022 05:27:58 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:816c:1950:863b:51c])
        by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003b33de17577sm1988312wmj.13.2022.09.16.05.27.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 05:27:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] oetest: Drop getResults usage from oeRuntimeTest
Date: Fri, 16 Sep 2022 13:27:54 +0100
Message-Id: <20220916122756.1191173-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916122756.1191173-1-richard.purdie@linuxfoundation.org>
References: <20220916122756.1191173-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 12:28:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170788

Despite the name, this code is only used from testexport and the function
in question is broken on python 3.8 onwards. Since nobody is using it
and the failure log handling here is of questionable benefit anyway, drop it.
We should be using the same code for normal test runs and testexport,
not having two different codepaths.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/oetest.py | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index cf2cb30a3e2..cf417db0d42 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -28,7 +28,7 @@ try:
     import oeqa.sdkext
 except ImportError:
     pass
-from oeqa.utils.decorators import LogResults, gettag, getResults
+from oeqa.utils.decorators import LogResults, gettag
 
 logger = logging.getLogger("BitBake")
 
@@ -109,20 +109,6 @@ class oeRuntimeTest(oeTest):
     def tearDown(self):
         # Uninstall packages in the DUT
         self.tc.install_uninstall_packages(self.id(), False)
-
-        res = getResults()
-        # If a test fails or there is an exception dump
-        # for QemuTarget only
-        if (type(self.target).__name__ == "QemuTarget" and
-                (self.id() in res.getErrorList() or
-                self.id() in  res.getFailList())):
-            self.tc.host_dumper.create_dir(self._testMethodName)
-            self.tc.host_dumper.dump_host()
-            self.target.target_dumper.dump_target(
-                    self.tc.host_dumper.dump_dir)
-            print ("%s dump data stored in %s" % (self._testMethodName,
-                     self.tc.host_dumper.dump_dir))
-
         self.tearDownLocal()
 
     # Method to be run after tearDown and implemented by child classes
-- 
2.34.1


