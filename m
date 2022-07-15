Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850B3C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:59:04 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.946.1657900741731272885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WybOz0uI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id bu1so7287037wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pP8NV7+n26Df0kNbXAJ89kS/18XvgaP1iLHfiSSVPtY=;
        b=WybOz0uIqkjf4EHz8R0lYhPzFfOmF4VWNjjXvhoOE3NgPVWW1ayNM/SiBwVuRqXEwO
         6+G04Sg3b3N6MnPNq7nTlDBucl1w1PjhKTRL1eRzZj5oQU85D8/A4jm0mmiYluILM4FO
         07UPWClJYuKLfn8LeKhFObdxAxmzrlmeSpCDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pP8NV7+n26Df0kNbXAJ89kS/18XvgaP1iLHfiSSVPtY=;
        b=mkdii3MA/sQ4NrXMru3CymAEJNBWpqidlVwJT6U5sadt4Wv9x7C4joiGrgFWZAUvS3
         EXszToVxuzcBMxxMEuNW+TmSou4L0YqQN2OC8vIJSF1eUB6Y60Sok/F86HnXwYndhJpg
         u/hX8hsrOxDxI0EN75N+D+LIgiPs62qvnOivSm5vUd3cqjIUg0h6REfQlbJF6TAg2Ft4
         hhKVycL83C7kb98Vs8D5GQADN1vxkX0zkhXixfDIYYiReIFcjXyXC6+iJRo7A6reHD6d
         wza8kR1l1ssuS87VsO655I1WqHnIMjac5lXcs9ZpeJLMtYvpws257MjNBfHcTfzgDeUP
         XIRQ==
X-Gm-Message-State: AJIora/L3SymP1zQLxFOy9qcU4iZn4Gjp5WuVMeeoul8FKV51VZgmghF
	ZYX/uTKIY3sJH+QSYytsCXFHVZAIP/ZUFg==
X-Google-Smtp-Source: 
 AGRyM1vyDvvA2JbVrpVXNzwgBvV6Z5Lb6wXab8tMzWwFEZtR0jPX7Y3x7nJCjY8WTKuT5qXllr0E9g==
X-Received: by 2002:a5d:584b:0:b0:21d:bd2e:42a7 with SMTP id
 i11-20020a5d584b000000b0021dbd2e42a7mr12198583wrf.192.1657900739929;
        Fri, 15 Jul 2022 08:58:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef6a:f831:81f1:d696])
        by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b003a1980d55c4sm10065849wmb.47.2022.07.15.08.58.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 08:58:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/runtime_test/virgl: Disable for all almalinux
Date: Fri, 15 Jul 2022 16:58:59 +0100
Message-Id: <20220715155859.665686-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:59:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168120

We can't support vgem on RHEL derived distros so disable this test for
all almalinux hosts rather than specific versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 8eacde40adb..857737f730c 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -252,7 +252,7 @@ class TestImage(OESelftestTestCase):
         import subprocess, os
 
         distro = oe.lsb.distro_identifier()
-        if distro and distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04', 'almalinux-8.5', 'almalinux-8.6']:
+        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or distro.startswith('almalinux')):
             self.skipTest('virgl headless cannot be tested with %s' %(distro))
 
         render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one suitable for mesa llvmpipe software renderer."""
-- 
2.34.1


