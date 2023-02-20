Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7428AC64EC4
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:20 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.14086.1676902755396186562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:19:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1bHA7FnP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id u10so1472526pjc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qdo5/QtSzW+PTDveKsD9vVBBlf+wSZS4OAiPhbvMEAY=;
        b=1bHA7FnP35KOSSaBts1mqaPkUpoR3f5S9cmIDKbZn+58KP5dTMjOOWJj61w96nr/Du
         08pUwO2i0x2mvsH6sxx1Q8kQnswCdXKqI7hnfIKJAvLw9320du1YdKrSPAKdHNG+9Yz3
         3a7568S7hTtDsCwTlMczmF6l6Z2XYQukBx4xWou7NQyQPVhp+S13aGe7nbb5Q6+AHpmI
         Dv5mSJWE26muhdmlOS1zRQU/uxNvyC5Tw3wa6uTrpvVOf/0gRGmyxcXfsFoKvJB+Smdr
         c9/visCSCriQZNz22T86dRZ9MGWfg1u7qNaeWfcnhBYy5xsKJl9CXwzjDwuPhL5RyV4i
         6mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdo5/QtSzW+PTDveKsD9vVBBlf+wSZS4OAiPhbvMEAY=;
        b=Tmx6E7/X6rfT3f64/JufarOmYb/SUGXCda2AcVMhHfr3+8Uo6ZxUE6hzzOBTYrl0TM
         83xlPlHKhAQOBAaGlvkvJLKj4lMxkP022IwFA1kGwuzumOQkQgsmrTUJq5PCeSWx6bfC
         Zv82wI/lxdzl0fJE6Hw66+o1e/vMeKwyZTbQ4iv8x+kFxDycKYUyvArYc3PIWr0oxuPG
         eFmiDMIOTGYPWLsrE03wgW5J9FRQPS6JcylGXvSSHcSwG5E/rbK5uGVZytYbe0ePWNvh
         C2i0qWLh2CO3MjzWPDTIKjnMlnLO+JE+MQbgbe7jpHevkXQ8D/qEcoci4cCc+xqf2iyQ
         X62w==
X-Gm-Message-State: AO0yUKWez5h2oU1P1A8alQ2+kEphypbJ9wkTNqUcW6qAdiqIPzPcTt7D
	kY/KSZhJWgWIJEf9mJYk3GHsFRy2gGfLvL80oQA=
X-Google-Smtp-Source: AK7set+n4ggGWmJxDU4K6xvfKwF/5k2kz3r8H0Lfbsl1Xy0WNZvdFtXX0iu6GUAZBu07fIJqYc7Csw==
X-Received: by 2002:a05:6a20:69aa:b0:c2:addd:b508 with SMTP id t42-20020a056a2069aa00b000c2adddb508mr1984014pzk.2.1676902754300;
        Mon, 20 Feb 2023 06:19:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.19.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:19:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/22] oeqa qemurunner: read more data at a time from serial
Date: Mon, 20 Feb 2023 04:18:27 -1000
Message-Id: <62df87d3544b7fc3717743b131a62c6092359ec5.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177426

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Use a short sleep to bundle serial console reads so that
we are not reading one character at a time which reduces busy
looping.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit cafe65d8cf7544edbd387f7f5f6d77c64c6b18fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c68974f25c..3aeef19434 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -198,7 +198,7 @@ class QemuRunner:
         qmp_file = "." + next(tempfile._get_candidate_names())
         qmp_param = ' -S -qmp unix:./%s,server,wait' % (qmp_file)
         qmp_port = self.tmpdir + "/" + qmp_file
-        # Create a second socket connection for debugging use, 
+        # Create a second socket connection for debugging use,
         # note this will NOT cause qemu to block waiting for the connection
         qmp_file2 = "." + next(tempfile._get_candidate_names())
         qmp_param += ' -qmp unix:./%s,server,nowait' % (qmp_file2)
@@ -463,6 +463,8 @@ class QemuRunner:
                     socklist.remove(self.server_socket)
                     self.logger.debug("Connection from %s:%s" % addr)
                 else:
+                    # try to avoid reading only a single character at a time
+                    time.sleep(0.1)
                     data = data + sock.recv(1024)
                     if data:
                         bootlog += data
-- 
2.34.1


