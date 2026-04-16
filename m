Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB068F8A171
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:09:05 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26348.1776373735646237689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uMuJj/vC;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so112528335e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 14:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776373734; x=1776978534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ek7sn9nuGbLhV1PydAplnAmYMiui3S1QYx7dZCcMiqE=;
        b=uMuJj/vCz6BJf4zErnuy1fqfoX7bZyjp45YnhffB2Y7rd3oaiEPUzcav9Vp1Fc2SAA
         SBnfBw4ahsEVB8RP6Eju890bdUpsjyA3AF6sCNDBkKJuwIvqkDODwtc7W1k9Ivhl7Gr9
         LsdG3LwuoZ+/ULqO1fQXvVekMS3H49wS8Uxs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373734; x=1776978534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ek7sn9nuGbLhV1PydAplnAmYMiui3S1QYx7dZCcMiqE=;
        b=CUBra4LiTisi550qLXyisFlWeAeT4yvR6tn9JR1Ek1NIOXX5q4uJZ3HgttFK3TEz+y
         0tld84i0xwhVV8QOIYbaM5wmyzX297ACKHwCP3cH1fQtIL4Io3bWnOMTpqGBmOFK7vEv
         oOgo6zXTLXjQ/ia09FK18SNY5+6rh2EqJ302EhmHDWqX+X5OHmVdcEwB450gzGDdf5hz
         f6EfAkAEsKIqkaaRhoAgUgAMBP//kW8ar7kIii1T6BF5Fumm3voF0+1o3tAUXZ1BuwF0
         rGAFQDk138byFc6wBZAT/uE8LuVqsIjW+fgEBkK30bHv3fVh/AUsqipUX/VwZ1qMy1MU
         bWVg==
X-Gm-Message-State: AOJu0Yz6L2lZTlPkfkiwmWIwHf6XAXqZdmTmBGqg+sSa9ots2TE/Jlba
	sxXKVTDdEbhw7nO1Pkzm7+DiZeMzmCCe3Mfi7hJCKdIQQNA0ZayU2ZHfgQWgFIKcy//BKm9oHCj
	dCAoTOMsAaCC0
X-Gm-Gg: AeBDietC2o2xeAgaER8CouEqwOC8ANhI8YxHtRSjsTx+rqU9Ut2yuGuT+i5SVzEYJ87
	920UbbcWsak0Gf9UNIiroQduNCpfItGFD5wNfM0vp0CyRiUA09I8OpAu+yZevjQhUFUC2oCHNSN
	jdI72kv4ycNwTWAINI5/6nb4x9cxPYnWkdCkIAYrAzu138TJTkqTIrzcb6sDZO3EQiVJvKmbCt1
	lHXbjLLyVIic1VLpzfLDaRyF5gmIm99U/u8BkY4CyJcK4jqmCMA6TZmNgrM2eE4ETqsPQqcS6si
	ogQK/3m7wiJvExswAYjnCqfpwoEYMolZQtWs0KUPGG6JKIQ03qZnWKZ2lPZzHkc4YSpEZ5vj/bV
	9jp1s3AXs5zUysEc8ma63Tpveh5acKWmcZb/pSdOwyXxhBcZ4ad4UmJmqNhaibDfln0Ym262OlM
	Po85UFv0ari4+6WzTGwvSfyKTH24FA1uZt3ec+i768qZnOKxFwK9gBEj2PeV+gMg1cEpeAgXDrr
	W6XoUbR7n/9p1ukpM2/FwimY9AUvTgNUggOPAc1+ebiiqLH
X-Received: by 2002:a05:600c:4e8b:b0:488:c257:a73b with SMTP id 5b1f17b1804b1-488fb74a723mr3317795e9.9.1776373733804;
        Thu, 16 Apr 2026 14:08:53 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7c2167sm944985e9.36.2026.04.16.14.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:08:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 3/8] build-appliance-image: switch SRC_URI to https protocol
Date: Thu, 16 Apr 2026 23:03:56 +0200
Message-ID: <20260416210836.1336162-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416210836.1336162-1-yoann.congal@smile.fr>
References: <20260416210836.1336162-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 21:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235420

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index f53856a06db..91f85fa72ee 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -31,9 +31,9 @@ SRCREV_oe-core ?= "4a388406acf0210e8a47c4733979256b10e078ff"
 SRCREV_yocto ?= "f3b63d0d6882af61020bd6f7150fae68a0322f63"
 SRCREV_FORMAT = "bitbake_oe-core_yocto"
 
-SRC_URI = "git://git.openembedded.org/bitbake;name=bitbake;branch=master;destsuffix=bitbake \
-           git://git.openembedded.org/openembedded-core;name=oe-core;branch=master;destsuffix=openembedded-core \
-           git://git.yoctoproject.org/meta-yocto;name=yocto;branch=master;destsuffix=meta-yocto \
+SRC_URI = "git://git.openembedded.org/bitbake;name=bitbake;branch=master;destsuffix=bitbake;protocol=https \
+           git://git.openembedded.org/openembedded-core;name=oe-core;branch=master;destsuffix=openembedded-core;protocol=https \
+           git://git.yoctoproject.org/meta-yocto;name=yocto;branch=master;destsuffix=meta-yocto;protocol=https \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
            file://README_VirtualBox_Guest_Additions.txt \

