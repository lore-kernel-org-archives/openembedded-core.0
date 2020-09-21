Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.43056.1600697791988482579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 07:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=CoDyevKS;
 spf=pass (domain: blade-group.com, ip: 209.85.128.53, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f53.google.com with SMTP id q9so12309119wmj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 07:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eQp/6/2FXu6aayqxA6lPATB2LBv7BqAxsFVo/WpSKB4=;
        b=CoDyevKSWMLcIYWYOvsaoy1F3bskj8ici4SkbrAs65xX0rKws0Vky/r8UASJZUWn++
         3EWSLg8kkV3pspptLrGuDk/btqWp6dJAteHu/Eew9RvHk4nmMiYAxujUp8LNEZikN8Z2
         z08DzVogr3edgEOw9uBtM+pfePVXMCMIGy4IMQzZHkwJ+tFj8yqPw2t9g/xMUDhusfYB
         OzxNMqXllQdNKaLM5J+ZQg1aAGolDNDOaetn1um/NPt+LpShgI66wPyxKw1J7+7lZj5B
         CLnKewY006Vw3q8AzB6cG4R3f8R37pPFS7R99uBhNPrZSmx+HVeo9DJTYg7V5D2IlT+V
         jZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eQp/6/2FXu6aayqxA6lPATB2LBv7BqAxsFVo/WpSKB4=;
        b=AqkAYHosetFu/QQ3inVUrm1RnA8J0+Ee/YAYg6Aqdo+EnM6fCTunf1jyR0Vy5DWsDs
         2SDpA7tjq5pLkBz3NLIA86GqxUxEiVQbchq2f6nDvcbMwEdpD+vj/LvL+r+ILgaJiRtN
         CVe5mnFALLVZ/eFudUAxMSVOqh90/nPXOYb5tsOpbS2LyZEaE0eqVqe6smwjlfZfJ1Mu
         9BEHr0HKw0VJqqgWffVkB6PCRLky2McEhagEE8k9QlFjDVFg1QasaPCglwYFZ20yjAZT
         U/mbW1ElKkk54F91twm5+4K13OX2hkYB+Q9ORc+iNrN0v3e5J74K+M3FWKX/9UUXewtF
         u5FQ==
X-Gm-Message-State: AOAM532b+zIXHCwtPV/k4pMQt68QbUYMp5wOYnVW+I1gZLKryGhlV919
	NR6KFql4QO3ZLijbfyNQy//o7XPSVR2Mno/1
X-Google-Smtp-Source: ABdhPJz+BTUoJp/wTbJ9p0Y3qFCa+zIUB6UKHngyxh9g14nJJTFXczVvXlMS16efgDSvuS69RxsZrg==
X-Received: by 2002:a1c:9a10:: with SMTP id c16mr97936wme.96.1600697790120;
        Mon, 21 Sep 2020 07:16:30 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id f14sm22524804wrt.53.2020.09.21.07.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:16:29 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 3/8] systemtap: clarify the relation between exporter and python3-probes feature
Date: Mon, 21 Sep 2020 16:15:39 +0200
Message-Id: <20200921141544.3145189-4-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921141544.3145189-1-yann@blade-group.com>
References: <20200921141544.3145189-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 375e570454..89f550c859 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -27,15 +27,13 @@ PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,
 
 inherit autotools gettext pkgconfig distutils3-base systemd
 
+# exporter comes with python3-probes
 PACKAGES =+ "${PN}-exporter"
-
 FILES_${PN}-exporter = "${sysconfdir}/stap-exporter/* \
                         ${sysconfdir}/sysconfig/stap-exporter \
                         ${systemd_unitdir}/system/stap-exporter.service \
                         ${sbindir}/stap-exporter"
-
 RDEPENDS_${PN}-exporter = "${PN} python3-core python3-netclient"
-
 SYSTEMD_SERVICE_${PN}-exporter = "stap-exporter.service"
 
 PACKAGES =+ "${PN}-examples"
-- 
2.28.0

