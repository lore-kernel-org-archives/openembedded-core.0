Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.61230.1594051914151305959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=k+Npx/3F;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id s14so15510648plq.6
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=iyDToiN8eeezqiAjA/irRk3Z+D958LelkNk66s13pc4=;
        b=k+Npx/3FrF+wUK8cKQUSQ5eNWfx2S+4dxEI1nrUxm98TP1mVRCZyJ59/Wha8S+UW99
         1MxifH2xweJLir6RV+Pi6ZpGYLy9848Ex3VOHC44quviMPachSANvdOheBNu15wf7sSn
         h/Cu8RGAYyyPqFp5bzmHe1b8BkT/43vp+u4UQb7RWEjM4YV2BGA1I/1Vq+X5iQOVdUpd
         7B8fQ1xUW9Y3DnFF/hv8DuPXLE25OWKEwsf1I6BcW/nwlVl93mm7eAagS/HSZN5lNx8a
         a71Tot9zJhM2YmNZtbixq6q+yIsicbJqPnrCV53h3KV0+jbyhRh/zW9kcRI/URqE0gMS
         ht4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=iyDToiN8eeezqiAjA/irRk3Z+D958LelkNk66s13pc4=;
        b=pY6uVDYHvS1Tx30xk0lVHGSOwNSX7ejiapVHIcmEz1GUVCZiuLauKxalUsLX72Cpi2
         pGt08dff1+FiHObCkR0om2Sqg5146NxlCbUnonvOWfen9ygtihX/WLTRZyXSJp8g4jk3
         Aet7ovMI1IgDaFNcBNwczc4GViAH+65d3GBnhq/j1dsPkkNYkfd7fA8m9uInbW7Y5QOK
         2L2gWMpN3lPQnXc0ftVQqsw8bthAlGrAVTRiHci/BNu6JuVxLq1JbA+Rowq1gGyJoL7G
         QN1R8oxP82DzowoJiX59UafIJKBaJBG45bCyrsdFiXCXaF3tQGuniqOIyYXlmwUmaFQo
         QkOw==
X-Gm-Message-State: AOAM533UdxminrfH3VyVyr+huBSt4VprEwthoUk3IOmui5WHARLQ5E3j
	D8zpXwNOC3IGC1GjxAWql42VxMX2FqduoA==
X-Google-Smtp-Source: ABdhPJyEMhoatOWWEWeQOEG3Gpeb26FN6qi55yNff818JPzyIfhx326J0dGYxvBzMjVVhO5H7VLpow==
X-Received: by 2002:a17:902:121:: with SMTP id 30mr42313785plb.44.1594051913243;
        Mon, 06 Jul 2020 09:11:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:52 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/25] oeqa/targetcontrol: Attempt to fix log closure warning message
Date: Mon,  6 Jul 2020 06:10:22 -1000
Message-Id: <5f19120d537bc5c7a4a7d8535182adc0f687c830.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We continue to see the warning message:

WARNING: lib/bb/daemonize.py:76: ResourceWarning: unclosed file <_io.TextIOWrapper
name='build/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0-r0/testimage/qemurunner_log.20200703011821'
mode='a' encoding='UTF-8'>

I've been unable to reprodue this but believe its caused by garbage
collection of the FileHandler used in QemuTarget being delayed until
after a new tinfoil instance is created by a subseqent test.

Force the log file to be closed when we stop using it to avoid this.

[YOCTO #13961]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e15cc7801ec611f867f5b31028741722ac718c87)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/targetcontrol.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 7bbba6016b..19f5a4ea7e 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -187,6 +187,7 @@ class QemuTarget(BaseTarget):
         except:
             pass
         self.logger.removeHandler(self.loggerhandler)
+        self.loggerhandler.close()
         self.connection = None
         self.ip = None
         self.server_ip = None
-- 
2.17.1

