Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D40AC7EE23
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 17:21:06 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.51331.1682788861862516026
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 10:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=FHjI4ncf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1aae46e62e9so1663815ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682788861; x=1685380861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hehms40VKagwa60FcV4yTscgz8hcv03ZSkhNaxCTtY=;
        b=FHjI4ncfrspQTjdHIu6XkhZ824H8PnkSlPoeWhQTxHJjqU6HlBRd4mIbNZDBmdj6pQ
         l8qM3p6iT/usrYGQVJc8+XM5A/aqXcOgSnpWad1AW59fqYNGxhzGteSwEvg5nGHfk5MM
         Dtc2OKKlxXAqMZFvur5n9LCkFcPyOMhcq86ZjpUTgbG0eGs7WWu1c6E8NeN0FAPVl3v4
         tDmRgIFLeS4H7io0E/kGYMfS6HWuzZzGtOMkG6QFvwOD/23S5vKEf+W8CjtuBMLz/bbF
         fPvDC/YJot0p6gIhfR38qXzggB/kxhapy3Yq7E7q9s/uoA+PdppZ9/5k3ekLfW17PlEA
         /TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682788861; x=1685380861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hehms40VKagwa60FcV4yTscgz8hcv03ZSkhNaxCTtY=;
        b=XS1nAV5FRQI+zFVy9cvo4ZIAevBs9s4A6i7zKQ2pWybi5U9I2c9KIyBe/74KXhsJ13
         ozYssz+cAITTruhSj5kQrWOZ1qHUWPJHEaZNfcFOKHZ9JZcttKCxWaJPlyJ1gnRTMqrL
         VHU+70MfNiHYWkJZzNbL11wueTolujKwgv0nkJ3NEMde46XSzbQF4dYKh3Iis7p02e46
         uFnFJLSy6gkV8KLxfGqbZDBoG/ePdfFpK3mUSiID77jTibRFX+q1ATUt/fXhz9f87ogK
         pE9yDDERRnAvWSrnSYD1i2BHdteh8ly8/gY53/HSF06ErhVabHeFyC28BjtAlxT8p84J
         4GYg==
X-Gm-Message-State: AC+VfDxuxODAXd31JEv6i7tyusaOh9KTRmgYvOMrihOMEwX4Y/HT5OJ/
	mMv0sl/NdF/W9QlmSeX3Eu3plANaI3RFNiNXizs=
X-Google-Smtp-Source: ACHHUZ7XVJ/gVWScPlSn9j6Z4L2QFM2wHAIDLiFt8p1GpkVp9yFH5hnRl5En1+Im/cos6unBfsLDGw==
X-Received: by 2002:a17:902:e74c:b0:1aa:db0f:1aba with SMTP id p12-20020a170902e74c00b001aadb0f1abamr2128158plf.47.1682788860932;
        Sat, 29 Apr 2023 10:21:00 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001a6b9c42dbasm15156041plz.88.2023.04.29.10.20.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 10:21:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/13] qemu: Whitelist CVE-2023-0664
Date: Sat, 29 Apr 2023 07:20:25 -1000
Message-Id: <c812189760292ae39f7c10cfbde8f11130cce085.1682788726.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682788726.git.steve@sakoman.com>
References: <cover.1682788726.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 17:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180548

From: Virendra Thakur <virendrak@kpit.com>

This CVE is related to Windows.

Link: https://nvd.nist.gov/vuln/detail/CVE-2023-0664

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a6ee958e4b..7f2b52fa88 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -112,6 +112,11 @@ CVE_CHECK_IGNORE += "CVE-2007-0998"
 # https://bugzilla.redhat.com/show_bug.cgi?id=1609015#c11
 CVE_CHECK_IGNORE += "CVE-2018-18438"
 
+# As per https://nvd.nist.gov/vuln/detail/CVE-2023-0664
+# https://bugzilla.redhat.com/show_bug.cgi?id=2167423
+# this bug related to windows specific.
+CVE_CHECK_IGNORE += "CVE-2023-0664"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.34.1


