Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.941.1594746174726773120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 10:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=F2PO/4NJ;
 spf=pass (domain: burtonini.com, ip: 209.85.221.68, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f68.google.com with SMTP id a6so23108078wrm.4
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 10:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QS39BiohDCj2vAsIvXE5pLdzjg+DKMruJ3oCvhgsmS0=;
        b=F2PO/4NJTodxomotCZgzP5DDP5vc7CmYntSISy8LBNg/uXWZySce4iHCkQuQFwYWlP
         +wRVpbnW9J3gfeIPYA28m80hEfIFW8TvKpoxDx4A8QahfVyXSl34cSjERTVeYEVJwZMW
         +JteTREkcwYeRfnHFov38xSqPU+/vwJmDkX/uzVsY67avmfwgvWaD/KJdaCAsrvvgWn4
         hJKquLXh+jp/YynuFYv855ZFBjlJL0MGcLgvpqm+9KkKeLhrgsBujiRV5mRKic5V4wvQ
         m0jcute6a94YRib3eX76s+IYFNhopuP/hsXCSm1dl+JYh700EgKP2hzOBl8t3WDr0LEs
         zBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QS39BiohDCj2vAsIvXE5pLdzjg+DKMruJ3oCvhgsmS0=;
        b=dS1PNqM3OBSSjNNBslADVKoPgh9EMN8QzfZheabKyrhODP/0rvTWFNQpZVdwP3BCzB
         M3Uzq5Db4ZOeWun0jBLl3+5y8jwNN/+9Tl9MgzyEKPosjgbOElcSRVzlIRwic9Vyt0pq
         KJfBSt96eE6F13p+XHDfwft5UKp00apVsgqhJyUvnQEqhOhf86mPYXDCj5hiimmW5Ybi
         xDjN16sCukEQXItuB9yHu0ax6wa5vuHi7rPldOTfKpXTOw8WRSQvagSdIjT25f1jtfkg
         h4CeS+c41QM2ErlyoQMngqzd5ibDD48/xuOR7p8juoNdSfSFwtjCbYaeWpa+c5cM01VS
         2akg==
X-Gm-Message-State: AOAM530MgNa4iOj9tb2oizBzaw8FW04lOOgG2EfqYFW88u3XIy+S655R
	0CLSOkFI8LJyB20srw4qnxD0goC5Wk0=
X-Google-Smtp-Source: ABdhPJyKe3aId60S5WHIEehrIT8txvOYnJWwEEocukB6TgSncqtN+Av1ifmTU3BIozonTFkD5LpQ+g==
X-Received: by 2002:a5d:55c9:: with SMTP id i9mr6838136wrw.404.1594746172785;
        Tue, 14 Jul 2020 10:02:52 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id y16sm30552773wro.71.2020.07.14.10.02.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 10:02:52 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] init-ifupdown: always make machine-specific
Date: Tue, 14 Jul 2020 18:02:47 +0100
Message-Id: <20200714170248.1036410-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

We make this recipe machine-specific for all qemu targets, but otherwise
defaults to tune-specific.

However the network configuration is typically machine-specific, so do
this in the recipe directly so that BSPs don't need to do it themselves.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index 733ae41f20..b6fc8a4d41 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -34,7 +34,7 @@ do_install_append_qemuall () {
 	touch ${D}${sysconfdir}/network/nm-disabled-eth0
 }
 
-PACKAGE_ARCH_qemuall = "${MACHINE_ARCH}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 RDEPENDS_${PN} = "netbase"
 RCONFLICTS_${PN} = "netbase (< 1:5.0)"
 
-- 
2.26.2

