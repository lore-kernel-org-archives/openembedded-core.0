Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE364C3DA70
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 15:59:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.64184.1722009566299694724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 08:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAREXpc3;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4280bca3960so7193765e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 08:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722009564; x=1722614364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QpPbTGRI6KlGK10IB3dOXf+MK+S21ogmvz5EU0odNfg=;
        b=hAREXpc31rOejSZ1L57RPmDX3UICYpJd4WlT5IUT/NsU/vmYyYDfjUo3g53tz7Tux5
         s3k+uq4AArkrhtkMWQbljWODJ73t4L102g9iXFC+HXiwAO/z3VhFs8wPocgS558zJEl8
         roBYSTxhazaky7pjtqv97JpsOCAZerHnnJQtKlnatQPGjUXAwgEpAvi8njLig08AJNsT
         +pwjHIYDjzh0JFYlRk8ve3onxgEp7ED18d/fSs6su7ZajVw7s61LIAYpHVk2CvlsHzhU
         5XVhQ8pDTvjChWafC174cK72ChXyM7vKFRHkVyhDjDM3bSdr+/MerTEouTBgKgRMzR8A
         0FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722009564; x=1722614364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpPbTGRI6KlGK10IB3dOXf+MK+S21ogmvz5EU0odNfg=;
        b=brEDv/eHqi9kieYvVezlSG/ueKl7qLolD6izzt4nrzEgUqppBAAkVlrWnqxp1zkYP3
         LuxBvcyFPpOlVgkCwUceQl25asHSZNUk0COFl/jcz8Log4LBfJVMxyLWIC7fD2coJU17
         kONXtaeBV5dbI5wc1lexaSfztjWqaxGRPPhESR0f8GJ6RlHWS+GObPFhKUaPzFYFo7ut
         eFVxrmoUyijN7nnFPZ7KpZ2IMmldO8RJe0AX+k0dJwFU85zFPhcGSyn4iVIa8edhx7UM
         KcH/VFdmmNEbxO9odEM2IsNCPAq153gXqW+qii47wXE4U+msrh1d9V0SkecSJ4Cw9uJJ
         tmHA==
X-Gm-Message-State: AOJu0Yy/loRJoCw2Q3vQO0gIBsV+B4/ipnI32RUcNkG8FF8oNqd2sjtu
	NraQXky8+FxGg0ylJea52uL6dSWot/TgXemSEkkt6bjN1LPU8AJDW9Zdcw==
X-Google-Smtp-Source: AGHT+IGCOLyLmQujqJ5abuI6FdVUvE+YMNprvpNCAqGnTeFnXo40M521CbAajQnuQA4p2+CCdHajkw==
X-Received: by 2002:adf:f4c4:0:b0:367:8926:812e with SMTP id ffacd0b85a97d-36b5d0bb098mr64678f8f.62.1722009564150;
        Fri, 26 Jul 2024 08:59:24 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367e49bdsm5535308f8f.44.2024.07.26.08.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 08:59:23 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-core][scarthgap][PATCH 1/4] oeqa/runtime/scp: requires openssh-sftp-server
Date: Fri, 26 Jul 2024 16:48:35 +0100
Message-ID: <20240726154838.1731195-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 15:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202545

From: Jose Quaresma <quaresma.jose@gmail.com>

The SCP protocol was deprecated in favor of the SFTP.
For the legacy SCP protocol scp should be run with "-O".
Instead of adding "-O" on the scp_options ssh oeqa we can
require the openssh-sftp-server to be instaled on the target.

This way the test will work more deterministic regardless of
the host machine client used.
For the old fashion clients still using legacy SCP protocol
the openssh-sshd server will be used, for the new ones using
the SFTP the openssh-sftp-server will be picked.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2f43da91ba20d18bc419bca7651bb383a51f20af)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oeqa/runtime/cases/scp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
index ee97b8ef66..364264369a 100644
--- a/meta/lib/oeqa/runtime/cases/scp.py
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -25,7 +25,7 @@ class ScpTest(OERuntimeTestCase):
         os.remove(cls.tmp_path)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['openssh-scp'])
+    @OEHasPackage({'openssh-scp', 'openssh-sftp-server'})
     def test_scp_file(self):
         dst = '/tmp/test_scp_file'
 
-- 
2.45.2


