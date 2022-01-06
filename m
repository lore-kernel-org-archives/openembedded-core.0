Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47399C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 15:58:52 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.10389.1641484731081625833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 07:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FPgwCfC/;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id e9so4153936wra.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 07:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m2+nZ8uvuXoU8GXkJfWMJDt5Oz9eeinL5BsTPFInnNw=;
        b=FPgwCfC/Svw+kKquPw+Ye5BmU42bovtM/Kh4w074dSBnGN0LvhQCtQPvyzBKHAMlqP
         mtdbHqdXSWyDxEKcVh2T3Lxzdi95xG5864wnq3wvy9l5sD8rCFJMKgGl5dgf0YvfxWkE
         9KoMUaCcxhwuOjPsFvMava5VET6UwrGKpM2YjIZxmlFOxo3Q++XD8AZ6Fi6fdgWxsmQ5
         dtj+AE8AU0DcPSVt5OLdhFRJeipbENSIwQ+1GkqYwYd96dUktO0bUTqqz9WgmoGpId3G
         CDLyc0PQLRhM+MBcnuh9kWYuaK8yq17B2LCl5sf6PI5Xo0a03diZNErr/wEr46IOuJN3
         y+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m2+nZ8uvuXoU8GXkJfWMJDt5Oz9eeinL5BsTPFInnNw=;
        b=UCmIJxFV7bcUaKSDE67J/6iLKOkjSvSLrJS5zUjFZec93K8FyCDRL1pbCBb5Bn1PxL
         ZGmsMXVPRecamRdlLjoM1UzFRoVbM/rs4FaDCqKbTxpcf9qtB6TYylSwmrO7NaQcFNMY
         n6xyq5JN2C5jW54lDN/3czCTWGZsoe2/kcAMRa21MQSmlCQADsh0vSqfpJBlh6ZlJagY
         fSQMTkc7uPfp0GXYAk8vuRqFIQIVTqNJ5BtmMMui6c4Md3ctRp0/tiIGcpgknCAgKkNY
         k78RpLTbr/HdkEnxP/feLl2VZVsdtjOBfEAyYZYeoswzejh9qn8qu2mlgGs8OZvsYPu2
         CEgw==
X-Gm-Message-State: AOAM532lJrF7ruQs17Fj5uCFhVLmA/wO/oroedeQZaFCq+YZruI5VKQZ
	oP+4s8YJS+HYt81HKvvAaSlXmTu5jpE=
X-Google-Smtp-Source: 
 ABdhPJxZV32RLyIrTd5V226VkRku5Gns+tNKjgoz5/OJLpujVvTnedaNRr3kBKsMEsPoJQB3e8j4Tw==
X-Received: by 2002:adf:ea91:: with SMTP id s17mr997469wrm.183.1641484729569;
        Thu, 06 Jan 2022 07:58:49 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 e12sm2462759wrc.104.2022.01.06.07.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 07:58:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] virgl: skip headless test on alma 8
Date: Thu,  6 Jan 2022 16:58:44 +0100
Message-Id: <20220106155845.215669-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 15:58:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160236

As a centos 8 spinoff, it lacks the same vgem kernel module.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index a90f62bfe1..5637a02451 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -214,7 +214,7 @@ class TestImage(OESelftestTestCase):
         import subprocess, os
 
         distro = oe.lsb.distro_identifier()
-        if distro and distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04']:
+        if distro and distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04', 'almalinux-8.5']:
             self.skipTest('virgl headless cannot be tested with %s' %(distro))
 
         render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one sutable for mesa llvmpipe sofware renderer."""
-- 
2.20.1


