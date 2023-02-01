Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F87FC636D7
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:32 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.24066.1675260864587352416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LjFl4lmU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id jh15so9523842plb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4R8kFauA4KrhqfbJ0XtGawJl6ZDxZC8cMd6zYpFYys=;
        b=LjFl4lmU2R62gtK7Fz2pHX7uN/lx26CEtgIeh+j2H4dkT+DXtaKCV5IfzBAXsdJoOp
         pBLDImMcA81UH/GWJUg0sc1PPt6Lwf1j+N3DoEDOeE6Pq4cil0ChagkVf5y/gPcyoZNc
         AzC+uVSIebKe3ibp/g3GbZHvCo6f2/YHxFlRAY1PgtBKQqvDoFjDrSN5WVIYPeqc9sqO
         vTS4hHSRs1eHHdnqQlEjE9NKlq0Mh16j1oFbBw7ZbzvNjGZoZ2yqeFMCzpvp0Tq6B723
         wfsOpiTMVU7SBXB1Pvu7vjvRNZyAdBWlkoBl0p0jUVMDK7H+tmRaT64a+nNKV3Xujzu3
         enKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4R8kFauA4KrhqfbJ0XtGawJl6ZDxZC8cMd6zYpFYys=;
        b=hJC9IrjHI5AFMMa7p6DrZF6fQdAXjmDLXesusRvT3+vmQni4QS2uJlUCnW5xOWF0vm
         fHwZKCcTRdqVZkcY7E4l+oeN3oPFjaWKsFP+kuXarVaH4l4uItVZoeJpIU01x1H9pA/D
         +CwVdjRqrWGdUb8aaJoc6Xj7V+B0XBi+1F3XUzwy7fDWa70q5oQMCvovNNp8xccrUWA+
         iQM7vESLSbz+I/hQzQSyvnYtfuZJVrZoJZdAxcdD6p8EGqLhDV2Zj795Lq9hx+7s+t1d
         3m47tFQSsDcBtEOqViExw4Ao1dYbz72T/srYcZzkIFUsYYGrBCsdvrz5nqemOVxP6TaG
         fw/w==
X-Gm-Message-State: AO0yUKU+8qBceVW01ko7mmNTO8DOp8q9ZrSUuibFa8AJC2xpQKxlIVue
	9LhWVcrYqPZSiTY1Tdqg3uabLUwSQbBOFc9Ri5o=
X-Google-Smtp-Source: AK7set9zxnQmnmKiaCfHnFQWArk5IllT4dcKS35/1/kSRz7eA2iaJyr01QP63JAh1PjrLFZeunfX1w==
X-Received: by 2002:a05:6a20:8f06:b0:bc:ee95:dd3 with SMTP id b6-20020a056a208f0600b000bcee950dd3mr3566772pzk.54.1675260863705;
        Wed, 01 Feb 2023 06:14:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/17] libtirpc: Check if file exists before operating on it
Date: Wed,  1 Feb 2023 04:13:49 -1000
Message-Id: <f7c2e4c768bb6870992a86bc500d960d4c88f929.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176546

From: Khem Raj <raj.khem@gmail.com>

In some cases (e.g. mingw) this file may not be installed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 547f3a13ee9268bbdd439c96108ba1fe9ab78873)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
index 8c6c20733c..f55e0b0ed1 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb
@@ -22,7 +22,7 @@ inherit autotools pkgconfig
 EXTRA_OECONF = "--disable-gssapi"
 
 do_install:append() {
-	chown root:root ${D}${sysconfdir}/netconfig
+	test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sysconfdir}/netconfig
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


