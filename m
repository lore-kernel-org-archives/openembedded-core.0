Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915DBC25B4E
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:56 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.34113.1674440568003298467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=OoGss/iP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id a184so7742325pfa.9
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WowLmVc4UJdITjRnU6DI14Rgsd9L9jXGyHrsTiRW9EE=;
        b=OoGss/iP1a9L7GF5R70qP7BmZXAkIUei2mAlZkyf8HJobEET9m7zLo2jWtE+nAD3Q1
         tROxgMmVEErS3J4SZW9xcAI3XdS+xn/ufT93N2RkSjHnMJt6VfoJSUjJJJiy+WRbV6kK
         qPxfspxbhFdtYa7gPk/7R/7Be6cW6EhLinyzl+FUr6yn2RZLbdAAzjIn8Vv3w5GR4J/e
         YgI089BzsZhTdTwJhJqQlrTtE8jXUEf9FehOCV+DzE7nxYgOKvNiYubKn2oVjx4WHaP7
         50UUcczLLHO7jFftuPOZ02oico7dfzqI9V68G4QsCWeb/mkSCxeZPuPpXT1vaOruW30Z
         xNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WowLmVc4UJdITjRnU6DI14Rgsd9L9jXGyHrsTiRW9EE=;
        b=sGzUNyYmJZCnpU/By5lwT6ina3LmXbccg7tga+pGOUlRBdNhCw9ss4HvD72S6iTEHD
         D2A2XQCYYApm1aCjAJi6rrdEJVIA9gZepvXhWuXZKaQ4kraJCuZHEFJUy5Aukukadh4J
         1NB1JdswwhUCtSCekVMzx0RBDcucFFOZUcVgDgQ1yXqi1R7haUQ3HbIDi+XdGSVbrXMk
         lgJEchWGJAqvwHiPan8uJsqOXHqUAmoayrcp5yzfJ87ALQ96zvBj537npa8+fYR3uaYy
         k90TaWzJUIUiyHe0+50CDwwZM7rOv4mlDhQHpJQO2Rij8+W9Yky2+Zzr62/fzpPnpicb
         /xFA==
X-Gm-Message-State: AFqh2kpKIXK/dVZAORH5EEngqsa/cUbNqOMCinJi/QBB3SZYHtcJMFzf
	OGT/2uSWm/HhLs38VfMWcyjjxZxSCa7o2J3Z1tw=
X-Google-Smtp-Source: AMrXdXtRMwH3eimJxE/AqGpvyC6p07Siz/bBgganZLQ2tytALeqjES9NAzTibA0oRcOEjTvUmvhG1w==
X-Received: by 2002:a62:79d2:0:b0:582:b089:d9be with SMTP id u201-20020a6279d2000000b00582b089d9bemr24424977pfc.13.1674440567041;
        Sun, 22 Jan 2023 18:22:47 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 32/32] selftest/virgl: use pkg-config from the host
Date: Sun, 22 Jan 2023 16:21:26 -1000
Message-Id: <07a1df271d47306a41cef8810db4dfb0646866e3.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176296

From: Alexander Kanavin <alex.kanavin@gmail.com>

The check needs to report dri location on the host machine,
so pkg-config binary needs to be capable of finding the needed
dri.pc file on the host, and therefore needs to know where
host .pc files are located.

This may not be the case when using pkg-config from buildtools,
so this forces usage of host pkg-config.

runqemu already does the same PATH tweak, so this simply brings
the two in sync.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f0521f8a3ba7e15482756529ee7b0a95b3d53e7d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 857737f730..858f12ec90 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -263,7 +263,7 @@ class TestImage(OESelftestTestCase):
         except FileNotFoundError:
             self.fail("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
         try:
-            dripath = subprocess.check_output("pkg-config --variable=dridriverdir dri", shell=True)
+            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
         except subprocess.CalledProcessError as e:
             self.fail("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
-- 
2.25.1


