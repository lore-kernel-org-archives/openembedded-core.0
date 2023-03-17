Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB94C74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:43:09 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.476.1679092985161719013
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kHcpflQo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id k2so6813825pll.8
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftPcUGI+ZrZi3iXXb0d46DkLgV/pCs9XLybapFBW9eU=;
        b=kHcpflQoTlw5pTuiGfOQPxrw0ru9KvkmxwWRzudays/1k950d5Hqq67UkMWO0zqJgy
         XSUBn6t6DPZpxq9LYh+80vxAeQmhzygR/A8i3Pvyd/CmpiBMlKSmdmKx5JEQHheWqSEC
         Et7jvHeeP4vUAJCroh/QMw7Lr/B3uMY/OcTmrY2Y7Es3EYqV8QDzaj5xlOeB2PUQ2a+/
         5wWPMi6q2rqDezzn1SLMb6luap/6bAMGdKp/m5YUk8mp+x1aR2lyzTU46UERRLMBoGYy
         n2tkBn1KaApB6y0tM+RlpOyyl63kSjNqGLOjOO9wgQ8rAVJw38owMoDDjOq1AzyAXyvH
         olkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftPcUGI+ZrZi3iXXb0d46DkLgV/pCs9XLybapFBW9eU=;
        b=U3R8+E47sF0d8AqYK8v2BkXhA4ax72Wh3ZvZbwIj6p4cJ4E3dR+4T1V70dXA6fxskn
         sS36faYy+MG8rk+OXe02VtsWfkbovnByKKVgNoiVuZn4pM29qwk3daMCRYuhr38aEkri
         IEjpXtapUlC5EysJ2NA+Ul+qSCQAyeegMjh33DLgF3ortfKEOv+mOFU8nOWOFEmeG614
         TPPTM1ghynT5xrXJcSTcIYqZ0g6+3t3gq4xBYS/ZxXBdOSnJZTU1H7CKmD/a1rCA70nc
         P2AQ49JFnPBhHt59yZ4TQJl5TJiS/BnLh7upplXywy0UNJUjd79ym9267KJnVYD3GujI
         3YAA==
X-Gm-Message-State: AO0yUKWuiMm7g+c0XiyJqqs6O+FXnqkAWRe5N9b1l/W50LpSQe7RntP6
	5WE/Dob21QONMn8+t9uYimnW2cdVWc8cuSmIwB8=
X-Google-Smtp-Source: AK7set/6ZvogAONany58eQGs8yqNdS+EVATHcxq9JkMXJBJuUQ7v1J+lqz6z3W1GEFLDskXY3jOjeg==
X-Received: by 2002:a17:903:7cb:b0:19c:fc41:2dfd with SMTP id ko11-20020a17090307cb00b0019cfc412dfdmr7816741plb.29.1679092984145;
        Fri, 17 Mar 2023 15:43:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.43.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:43:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/21] selftest/runtime_test/virgl: Disable for all Rocky Linux
Date: Fri, 17 Mar 2023 12:42:26 -1000
Message-Id: <0f317a0533f20580e77a0d6d0b636c05b3230b1e.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178773

From: Michael Halstead <mhalstead@linuxfoundation.org>

RHEL compatible kernels do not support vgem so we disable virgl headless
testing.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 78bc1ba2361249ec845d1b9e28d429a37dd83910)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 858f12ec90..29e82881d1 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -252,7 +252,8 @@ class TestImage(OESelftestTestCase):
         import subprocess, os
 
         distro = oe.lsb.distro_identifier()
-        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or distro.startswith('almalinux')):
+        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or
+            distro.startswith('almalinux') or distro.startswith('rocky')):
             self.skipTest('virgl headless cannot be tested with %s' %(distro))
 
         render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one suitable for mesa llvmpipe software renderer."""
-- 
2.34.1


