Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7166FC4450A
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:43 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1263.1783747475796344285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=JK1Xaf2b;
 spf=pass (domain: underview.tech, ip: 74.125.224.49, mailfrom: vince@underview.tech)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-667bae10ba3so1392194d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747475; x=1784352275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yC3cW7+v8iI92/PASnEH3u9HXahgAhPwLQ+UpPIwAs=;
        b=JK1Xaf2bj23xD0xZAdEakjGmOhUlV6eis6/US5pswj4RGc0OankuLXXZET43QrDgKH
         e+QWNixjtwVZdxRiRVUkdnWzl1B3nG4+ifTTYaVFI6WRXcLngDlrEQsS7aKQygV06mOH
         5NcU04egj5ntSQWx3iFhBfJuxnO7UG53od5ba8gmMDZsxLoYotJzwF7MgeVryfxW2uKp
         +qvIz2DPfxU9foE6EGsGBeFPenx01XhsnYHFe5LJoa4n5UDZQnxrVu7cDMXxCQEnS89c
         rps/iDU53HUO/BoJjv+iwGsj7gTUv0Xn45beA7qpmrhSCJzUse20k7C/i2y4xy+MnEGi
         CtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747475; x=1784352275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7yC3cW7+v8iI92/PASnEH3u9HXahgAhPwLQ+UpPIwAs=;
        b=jtzJP3e52Ma3iFiQvIUQaiq4rdBipEhNa6iPuJLDMLM2GF+bP0bQTb7A7kXkfP2SEZ
         9gq3ojOlvc9EPSqwcDs17tM545Ndycay/w4WsDrUu5vLlN/MqDXJKaNUOBOP29KOM2By
         bnFVw89y0dCY4dlZxV84jOWQ/UMjCpy0W1VJ0LYMgCiwcZPWFd55heoatVPdwU9TuQyh
         xuRitGK5Ebs3oXElcVlBoONA1GtpVziFYzm5xWgsFLFPib7zg92UJXFl43/xeHmx/YNF
         byMqXxleNC2cQsLb/TS6w8zJgQRRLgIrT/ylH+wqQB4VUAWyOg3jwx/aJfCr/e+PFXLM
         l83Q==
X-Gm-Message-State: AOJu0YyVE6U3MPaiVjM0zUQDlSI+3DpC4yQQwQgI8PRl0yVDp6IRLkHE
	efKexIqAiovYXOtOCeA9sxF64kHLA5BNWQb60Pt/VSVN4d6xNvH7u8259Z/zp4eObOeYqtL9a80
	JY7rgGvM=
X-Gm-Gg: AfdE7cnyUP1+TBAOQpKr8W2PDoNPm2Cmlv1e7miBODOBJXlGR5DUGarehCxK19HXbL8
	atUOyH9bb4zCwTh8ffNBXxKMWGrw2riOvdz/C9FF698q+gDduB2xlq4pQ5WRUhFQ1gC3z4is+nS
	7/9eg+SUW0c7jgsCS9+06ly6XzUHWI7by5QP9ZvT4sLBPJ9XoG7m77opWxgM+ZLsp9PXikM6Yrr
	k63uR9xSgk4+51Z3n6EBGZfCPn1Bz4z1SDidByZ2+NFTQqZAdQ81BfEsQtwKG0co5lp5dXX9ttD
	D7V78MMziOuLgCZQXIX6MKi1Hn2r5AcccZ3Mrrlf38EWoF8MKZd1jOVtTusM69eP2yLRR9O9MNo
	7CpU/p5k8VbEEjD20btprG6/9TdsNOl8q4os1MqwXIcBMH6WaQJEACBhWVsmiCirK+lAUKUbhR+
	Cyw76UMyvkfGZqi8UQ1zocaMcv
X-Received: by 2002:a53:c5d1:0:b0:667:c879:a262 with SMTP id 956f58d0204a3-667d7b209c4mr937034d50.47.1783747474860;
        Fri, 10 Jul 2026 22:24:34 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:34 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 06/19] ofono: rename kernel prefix
Date: Sat, 11 Jul 2026 01:23:50 -0400
Message-ID: <20260711052403.1292286-6-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240687

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-connectivity/ofono/ofono_2.19.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.19.bb b/meta/recipes-connectivity/ofono/ofono_2.19.bb
index 74fa70f609..3e10858726 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.19.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.19.bb
@@ -13,7 +13,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] = "d554525ad2db1ccd2fe3ed733e437d76997e7f443c085b87e6be1fded020bc8f"
 
-inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
+inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data kernel-vars
 
 INITSCRIPT_NAME = "ofono"
 INITSCRIPT_PARAMS = "defaults 22"
@@ -44,4 +44,4 @@ RDEPENDS:${PN}-tests = "\
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-pygobject', '', d)} \
 "
 
-RRECOMMENDS:${PN} += "kernel-module-tun mobile-broadband-provider-info"
+RRECOMMENDS:${PN} += "${KERNEL_PACKAGE_NAME}-module-tun mobile-broadband-provider-info"
-- 
2.43.0


