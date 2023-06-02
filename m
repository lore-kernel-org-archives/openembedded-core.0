Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82247C7EE32
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:35:08 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.13176.1685712903921560385
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=baMVgqaT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30ad752f433so1855136f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685712902; x=1688304902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdIaRcCWonAN8QTLc7Tm1d7IedxlZLR631LNirdd9oI=;
        b=baMVgqaTZXiqkjLZlO6FbfOSUN0u3Xz0gVG9A87dLe3QKM/ZZ+uwEkbRJeqhtHjveI
         7tswi6+Dh4yIhVZtwKguV5/HX0lyges7KWmFtAVh7hE+rej/+FkEIrvpD2+Z4NFcqld4
         KnGHS0ylxzkprC0o53H6qqdrN6SqMA0DE3pfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712902; x=1688304902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdIaRcCWonAN8QTLc7Tm1d7IedxlZLR631LNirdd9oI=;
        b=SjJnBCTEymQ8sHJLXxVceH1u1SbiEgUZ401uuklyWLSYZvVk2EuvWCoAOpOpGqeE+/
         q/LJzccAZKl0T227qszKagOylPth1a2yNdy33ThOytZ4xZAcFClSULYNMkByRHfvQRz7
         Pc67zxwRqoARV5IbmyLap0HQmyYIfWr1SmfkeL8ue4kHCcmyzekHrWAshYhoS/XweVnu
         WNp0g1JihzF1DUp53fPjtunuc0B0OlpKdP3X+uvX+Q/f762t4bZa1lEz8TUryMMWvdNM
         d178aQE2uypcBcP4w7DA/32Cp6c9fUgaDX8BlulDoIzwY10I1fJBzv/4Lkpx35KopIOs
         Sbmw==
X-Gm-Message-State: AC+VfDwulyI7bn35g9MJRxK8v0L9ZAJBOCP3RNXrrOVqV0pvePJenxWv
	KKjKNsklFTQKtidBqcDC2EBugjYt9FbdmpQLf5E=
X-Google-Smtp-Source: ACHHUZ7sN+lYDAO6QPNxs9g3fLoV0ocd3v8oBAprzK4IoBs7PT2Y1z2DjcukhEQbB8OpCHtN/WcIjw==
X-Received: by 2002:adf:f08a:0:b0:30a:d4e3:8a08 with SMTP id n10-20020adff08a000000b0030ad4e38a08mr4155429wro.71.1685712902302;
        Fri, 02 Jun 2023 06:35:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm1734262wrw.70.2023.06.02.06.35.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:35:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] selftest/incompatible_lic: Ensure create_sdpx isn't used with the tests
Date: Fri,  2 Jun 2023 14:34:51 +0100
Message-Id: <20230602133453.229023-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
References: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182327

The SPDX class doens't get on well with non-standard licenses. Disable it for
the purposes of this test to avoid errors.

Add a new helper function to the core test code to allow this to be done easily.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/case.py                   | 7 +++++++
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index dcad4f76ecd..54d90c78ac5 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -249,6 +249,13 @@ class OESelftestTestCase(OETestCase):
         self.logger.debug("Writing to: %s\n%s\n" % (self.machineinc_path, data))
         ftools.write_file(self.machineinc_path, data)
 
+    def disable_class(self, classname):
+        destfile = "%s/classes/%s.bbclass" % (self.builddir, classname)
+        os.makedirs(os.path.dirname(destfile), exist_ok=True)
+        self.track_for_cleanup(destfile)
+        self.logger.debug("Creating empty class: %s\n" % (destfile))
+        ftools.write_file(destfile, "")
+
     # check does path exist
     def assertExists(self, expr, msg=None):
         if not os.path.exists(expr):
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 4edf60fc55f..1597d30ab03 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -113,6 +113,7 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
             raise AssertionError(result.output)
 
     def test_bash_and_license(self):
+        self.disable_class("create-spdx")
         self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " & SomeLicense"')
         error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash cannot be installed into the image because it has incompatible license(s): GPL-3.0-or-later"
 
@@ -121,6 +122,7 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
             raise AssertionError(result.output)
 
     def test_bash_or_license(self):
+        self.disable_class("create-spdx")
         self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " | SomeLicense"')
 
         bitbake('core-image-minimal')
-- 
2.39.2


