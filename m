Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619D7C3DA4B
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 13:10:42 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.7320.1720789839921394064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 06:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TqA/1Otu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4266fd39527so14600965e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 06:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720789838; x=1721394638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X69PpHmxYiGLovRoxqoRyAd9y88kslYf3LzLQV8XlhE=;
        b=TqA/1Otu1+SX2OYeyx8kdFVZviYtiykz/D2JvhRfdIsbodrmavv7kiFqWtQwD8mEQD
         lc0LjwQwgjzPxzUVfG7pYsSW02XQzU3vpcmtDAqZVBKJFwalOUcIKxW/cqixj64zZrvf
         97+kvi//yst+PuUquSac9QkSjCmuVPLxAN/Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720789838; x=1721394638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X69PpHmxYiGLovRoxqoRyAd9y88kslYf3LzLQV8XlhE=;
        b=PYxf0C+5m/RdBK6o+PSgAV+qC50ihTwz2lhODrcb/xOl6Hmf3gtF3yupPsKX0B2cnK
         ar1EfVsM36KmYfg/ebJnukvbdNN80iNGjux83Aisi6jWsx/l0i9zXUHU8XzdPAc7B+xa
         bH85IiwSXm0000G8Ug0Wh6TmND6WBHE8rJaRNJ5t1A1CR8w3zL6jjhiMADmJGvE9RV84
         YIGIn/+o3qWLyadnDvXmyS0KCl9i50zZYwpvLkQK/O7lUxjfEHdMzOIAq+xCHuuRXHt3
         9XqRYROceiBMg7nRf1dLJqthisblAkf8Z6IXIMTkazjLBIkE8a/HXEtbS4f/QTETvAXt
         msKQ==
X-Gm-Message-State: AOJu0Yzq+X6frHqyqi7Bzyzq1LCJlkq3YkrUxjDQbtmT3OGt1dbjtwDl
	66KjuuOR7SVhmhsDUFALhxOi6ikzH3VqS1+oVB06GxGqfS3rbcw/krybFr1IFMJnDMSCpri4wI9
	f
X-Google-Smtp-Source: AGHT+IEpbixYP2g8he3ZuMCyGV9oeD9upgyS0kcsxrIfWBqBeWnodyF4p/c+jjmYuGeoutcn/J8S3g==
X-Received: by 2002:a05:600c:3209:b0:426:5471:156a with SMTP id 5b1f17b1804b1-426707caee4mr68068285e9.13.1720789837859;
        Fri, 12 Jul 2024 06:10:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c138:9d7a:7e79:ba70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f23999csm23630235e9.8.2024.07.12.06.10.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 06:10:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oeqa/selftest/incompatible_lic: Ensure tests work with ERROR_QA changes
Date: Fri, 12 Jul 2024 14:10:34 +0100
Message-ID: <20240712131036.1598257-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 13:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201824

Recent changes to ERROR_QA meant that the build was failing in ways the test
wasn't expecting. Tweak the tests to ensure those failures don't impact the test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index f4af67a239e..4c228de6a33 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -114,7 +114,7 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
 
     def test_bash_and_license(self):
         self.disable_class("create-spdx")
-        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " & SomeLicense"')
+        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " & SomeLicense"\nERROR_QA:remove = "license-exists"')
         error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash cannot be installed into the image because it has incompatible license(s): GPL-3.0-or-later"
 
         result = bitbake('core-image-minimal', ignore_status=True)
@@ -123,12 +123,12 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
 
     def test_bash_or_license(self):
         self.disable_class("create-spdx")
-        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " | SomeLicense"')
+        self.write_config(self.default_config() + '\nLICENSE:append:pn-bash = " | SomeLicense"\nERROR_QA:remove = "license-exists license-file-missing"')
 
         bitbake('core-image-minimal')
 
     def test_bash_license_exceptions(self):
-        self.write_config(self.default_config() + '\nINCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal = "bash:GPL-3.0-or-later"')
+        self.write_config(self.default_config() + '\nINCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal = "bash:GPL-3.0-or-later"\nERROR_QA:remove = "license-incompatible"')
 
         bitbake('core-image-minimal')
 

