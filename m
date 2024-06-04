Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913E4C27C53
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:10:39 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.16156.1717488632209120859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UGIv8JET;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so400419866b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 01:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717488630; x=1718093430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjmAW+Q7yWlifDA20DiZKN6YZhT3vcUC2Vfslat+0bc=;
        b=UGIv8JETdIX0TM3fQHazE9fZCPuZZIf7WA9JMsSkMJuzY3kEZAhDfX1Lcax48bE+qH
         ncVQS81xCFCsaqGPcIxeVoGo9WLoLytxJkicBp4o+Bh9dGl2cjZM3ytNoFj3zxPdwdpN
         zEKZhm5Y41kI/gtnQwe4ebU8rKYyIwVllYNFwj6gLIACTgSGQgaU1fcswXv/+3cxgerw
         Ab2CizZiBNE8JT+Uk/+vgWoAx1I1mejecCXkc4mziuojbdl463tLB2A5uy1ilsdsR0pH
         joklKfkXSE4858eZzfKKIZIZF+SCpuHCfXaYpfr2V7dUGQ+uBJSo5UqN69IV1/HBMXt1
         xx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717488630; x=1718093430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjmAW+Q7yWlifDA20DiZKN6YZhT3vcUC2Vfslat+0bc=;
        b=m2EzSuiP6tS9CN9s9AbMFNyJNOaOfHlS1jFRYoUy8a9do2ouv1dRAHiW4mlI0JDeVp
         T1rWOzz3Eg0qXQvkGdQk0frvlK9DhDPV5jd/lrsfJ0+nsqBNmNTw9kkgMF7Nebdzk+4o
         Sx5nLXBh39TEvy+eFI6BTTMPSDcWhuR+E5ZCbZsHAqtoKc1vtEIFhmo2/t9SaPOtVmt/
         HTTP12xIGBeiagS/hpF3jyG3+9eXwssamICWad6BhW8/GMMuoFeL2+LED4KitJtuhypW
         uwIpbq6pRtT8Qth3y2/XcJyLvfQBaLCeMicAcK3kz3bUVSx5+yV+cGlYrfDdYjvPzOS0
         WyPg==
X-Gm-Message-State: AOJu0YzQ46ePy6/ohEru9s2F3lbzzq9nSnr7Ys2ZPCQzF/OZ2QYOg+Sq
	XgYl773OW18HHEwwhgKo3xG+fONqvCvRzumjIw+F1GEM6cwhSyOd55V8zg==
X-Google-Smtp-Source: AGHT+IHa3Hm4iFwTXsCxmv4wRDDUM12HmIKQUhhiNpmXHQ4qRk8wybcQ0wzBKp02XLYTFR2QuYxLkw==
X-Received: by 2002:a17:907:9284:b0:a62:5ff6:c728 with SMTP id a640c23a62f3a-a6822157081mr882716566b.76.1717488630582;
        Tue, 04 Jun 2024 01:10:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68e3ff633fsm389840866b.14.2024.06.04.01.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:10:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RESENDv3][PATCH 4/4] insane: add patch-status to default ERROR_QA
Date: Tue,  4 Jun 2024 10:10:23 +0200
Message-ID: <20240604081023.38549-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240604081023.38549-1-martin.jansa@gmail.com>
References: <20240604081023.38549-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200307

* it's enabled for patches in oe-core for very long time and I was using
  it for many other layers as well, so most layers should be in good
  shape

* it's also possible to disable it for individual layer as shown
  by oe-core in:
  https://git.openembedded.org/openembedded-core/commit/meta/classes-global/insane.bbclass?h=scarthgap&id=61a881fdbe8b5a21c6276b8a5d06cc30486b1eb3

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-global/insane.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 99736830b9..6d2f83c6f7 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -45,11 +45,10 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
-            patch-fuzz \
+            patch-fuzz patch-status \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
-ERROR_QA:append:layer-core = " patch-status"
 WARN_QA:append:layer-core = " missing-metadata missing-maintainer"
 
 FAKEROOT_QA = "host-user-contaminated"
-- 
2.45.2


