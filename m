Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE34C433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:04:54 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.23599.1641765893335967005
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hkroNLaL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id o3so271479pjs.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l/2+OK+PnP2Qfqte71BHYz6UX0nkZEzK3x7wWlDzrVg=;
        b=hkroNLaLFiRb/QbfgFZIT0Paqnhg0TlhtpwyoBx9ry41VKJ6rjIzcSq0dng7CCpeMx
         /fnXvkCHi2o2rzZhPkwfjlkS7p8BZL81ebPi1TPFprbdMBglq/UgLylaidelYABXumyW
         3n98H2CiJXU3k7W0nPhrdX+uAutjX6V5MA6u2uhFxe9O/cCr/g7CrzStx6B36KpG6/fB
         3Hb4LSeKs/xgGrIz5A6m822u1EtjSoNM5/TrXFPxcQPW3E7LPEV7oENiS2z2BkKyOKeK
         s1gBvWHL8o9x/0Mp7TPKK34WyN0wy4KCtSVCNpWOGnYwsmxVHsOXlCWQ7alhEIIq/Uka
         IgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l/2+OK+PnP2Qfqte71BHYz6UX0nkZEzK3x7wWlDzrVg=;
        b=3ERfMoy1xqwbOZeCyIzu71FAFGe0HZDgHdAMOh4QxtFkjwcVrVIzqZyDLeCi7SpQEE
         wCGXB13n7i+w5/wiCw6Wos+6GZZ1jWmfLVKs34Ih37+MOYNPaMt+fP/udRtYU9ddoTy9
         zs35h61MDvDt3mcs0R7eXW2lNSLVbG367yj9EDJFbhAzLfAXEyJJlwKxSuZqbbngPIRi
         zzg0vk82pTj0MRaHIVF89Vce578INlBEdYlpKFob37iZSGlAsRFYQWPbqu8KR9L2/Xyi
         vGyR538yKDr6HBclWokPRBQtUL6Yt6zC2uGwd0PKnVBiY1WvdGn/ZuGmZ9tnoB9Cupup
         tSGA==
X-Gm-Message-State: AOAM531RivUBSt10+Aj0DsO/shYnHEVVOqJtclTOfL3frXr5BzjbQjnh
	JhWVbrdA3rqx5G0jdAI2XNnlKhsk1jpagY3qF/4=
X-Google-Smtp-Source: 
 ABdhPJzbE8xWswY5P06LGOshulHuvav832X2lkcn69PRJWk8AvEdsLn51SNp5nmXY5VRzTb5JUm+Bw==
X-Received: by 2002:a17:90b:1086:: with SMTP id
 gj6mr2338376pjb.168.1641765892495;
        Sun, 09 Jan 2022 14:04:52 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k10sm4426150pfi.52.2022.01.09.14.04.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:04:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/12] selftest: skip virgl test on fedora 35
Date: Sun,  9 Jan 2022 12:04:13 -1000
Message-Id: 
 <bb767e338ad25e27e6bf2c7dfdecc639e8105059.1641765639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641765639.git.steve@sakoman.com>
References: <cover.1641765639.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:04:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160300

This test will fail any time the host has libdrm > 2.4.107

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index f5b3ba27a9..20dc1c9482 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -183,6 +183,8 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Centos 8')
         if distro and distro == 'fedora-34':
             self.skipTest('virgl isn\'t working with Fedora 34')
+        if distro and distro == 'fedora-35':
+            self.skipTest('virgl isn\'t working with Fedora 35')
         if distro and distro == 'opensuseleap-15.0':
             self.skipTest('virgl isn\'t working with Opensuse 15.0')
 
-- 
2.25.1


