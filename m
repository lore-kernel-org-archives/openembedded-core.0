Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97749C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 13:17:57 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.7468.1656076671806856036
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 06:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aGvfhmqt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so3310187wma.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=urTon9VxnN09q0G+pCtM8SmXZxIUsC8AnR9mYxB0Vk4=;
        b=aGvfhmqtKvk9o6jI0QVo1R2XWqVkki5SXNeeMp7mBnz56ULm+5cbElwr6ZYw58Jx/Z
         ra/I1pybkC461H1XI+W677lKdvqYwaUZxM4ZTscvzOzyzXIy2HAllibck3JE4h1TsLl1
         TPVNQObGjusjK0ApQOLHAH3dmOJ5PI1QYALoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=urTon9VxnN09q0G+pCtM8SmXZxIUsC8AnR9mYxB0Vk4=;
        b=IOmBWSX2obc7fd1yWhrdLA8Sjq+83NxuyUKFFJA/1y1OHkE94RfLuszOhdb2DQat5N
         qAwsLerHSt57v4Eu3OQacXFabU5q3LreKrJG/CVz7HnHOnVT/VKZPH5eRzXeLrp4hhBp
         F1PjEYyEfsWYNjHjk0Dpr9t60srFxBxaQlP1EZ3Wi3En+IyvqxD85gEs5C6Gqgj4hRIQ
         FErZGkGRSuZFAz98Ulu/kQ433qoTl8DfIjm1fGiou90sVGXG/WPnVAPXA043f5XmlAEV
         lJkiAYKjIq3YTHlf+QC8rvAcTHJ2cZxEt3idmUG/c35kUjuKD8ytVvoxPFLRz9+EGKyK
         L6ew==
X-Gm-Message-State: AJIora98mRClF0aZ/T6yy68FPuUywpD73XyzLxN9Q997ENUF9Bi96AsE
	QXUw6a7Ms8cjjb+ftKgpWaIQO6/tnKduPg==
X-Google-Smtp-Source: 
 AGRyM1vIbOQX8B3go7gd6oeRw6c3iIkXp9Aq2w/yc0h+XiHU0YBvg7TsA5XIc3ph/fjsIaU3O1DapA==
X-Received: by 2002:a05:600c:2e48:b0:39c:55ba:e4e9 with SMTP id
 q8-20020a05600c2e4800b0039c55bae4e9mr3707135wmf.180.1656076669882;
        Fri, 24 Jun 2022 06:17:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9f36:46c7:838f:1b87])
        by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c2b9400b00397623ff335sm2783921wmc.10.2022.06.24.06.17.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 06:17:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/scp: Disable scp test for dropbear
Date: Fri, 24 Jun 2022 14:17:47 +0100
Message-Id: <20220624131747.256657-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jun 2022 13:17:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167289

Fedora is switching to use sftp as the backend for scp. This means the
scp test fails on fedora36 hosts with a dropbear target as dropbear
doesn't support sftp.

The easiest way to resolve test failures in dropbear images is to stop
testing this against dropbear as it is no longer expected to work and will
likely spread as the change filters through other distros.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/scp.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
index 3a5f2921521..f2bbc947d6a 100644
--- a/meta/lib/oeqa/runtime/cases/scp.py
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -23,7 +23,7 @@ class ScpTest(OERuntimeTestCase):
         os.remove(cls.tmp_path)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['openssh-scp', 'dropbear'])
+    @OEHasPackage(['openssh-scp'])
     def test_scp_file(self):
         dst = '/tmp/test_scp_file'
 
-- 
2.34.1


