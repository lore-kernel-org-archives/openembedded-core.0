Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046F8C6379F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:22 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9388.1672830376764924673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EW9jZXwK;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id az7so8166965wrb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsAkQ0r7EamsztOtaaveQ8AE9iA8/sKHQeOKphzwA68=;
        b=EW9jZXwKaxfq50LqydVKGfYtwRfN6/ocR/jRI+O2uoZKTf/WYaXgmwjTAhi2FuINeo
         VPem8+vJ0VuWT9uj1eGjicI3ShkitBIbVpSe456ESAdJGKBL4OMF8xz5biiO2D4MKLKZ
         v2kVJAjhNsXsGv0clEZfsrv7WGOdHsp6Z6t/O1KEsN/khejfQJ0S7+7+MQPBilhAEjDU
         8xKAx1mEHsxQXFzkFcnX6qWUFxYce4g2KnwXwI/GeYyDZCunovDllqY9GHwkRARpIz13
         g60c2+dDXbC8F/xocFoOIWmzCZIKUMpUwmwiGKO2D2E0kAeI9ScRwougGJYDAqEBe5Tn
         pinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsAkQ0r7EamsztOtaaveQ8AE9iA8/sKHQeOKphzwA68=;
        b=TogFBUR87FESxGYw1HFH92TedpelEv7TgDEjZlExdfST5YU+8f0dpsbYd13kmY3xT6
         qpfZjH7L6TegoHMEhJXbZ9Ts7xGfdv24UHHmGMrZyNiuipkfK2PTTGubrb9AfMTTeV3l
         VsPgUNM/jnyOJt10+KEMG0iH03BWs/GTmPtFVuYL1AKREZJ2EYzDa6ZF8fztXXYP5/v2
         uTaYuVak5QPgaikbk+KLFdyIzTWfckLCItooi+qrkxaTMkoZO7mQ7IpVxragSHiwr1Tt
         eTvsjOxzUzfRV8kw/sWKjYCVy44V0JndRIXRLOdf2lf9uqWmODsjU1cdlM0AEdC3srQy
         8Xsw==
X-Gm-Message-State: AFqh2koApiMl8o2OvzGuN8WVlAvD/DOPkQuJQtJ8Fr9NwRAtmQrcdBdR
	MERdoF7peqGdiCky3GXK2+hOdZuoZ4s=
X-Google-Smtp-Source: AMrXdXvEIFQZw1BAvdTctNGwY9CJQaaZtZpAZHsXnNRYa0RA04GCeA99cVRnJVYsYwwXML8Zm0BNhg==
X-Received: by 2002:a5d:4304:0:b0:2a1:328f:23aa with SMTP id h4-20020a5d4304000000b002a1328f23aamr2446872wrq.6.1672830375161;
        Wed, 04 Jan 2023 03:06:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/77] python3-subunit: upgrade 1.4.1 -> 1.4.2
Date: Wed,  4 Jan 2023 12:05:00 +0100
Message-Id: <20230104110548.2537259-29-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175415

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-subunit_1.4.1.bb => python3-subunit_1.4.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-subunit_1.4.1.bb => python3-subunit_1.4.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.1.bb b/meta/recipes-devtools/python/python3-subunit_1.4.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-subunit_1.4.1.bb
rename to meta/recipes-devtools/python/python3-subunit_1.4.2.bb
index c5faeaa513..a018ef1dc8 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://README.rst;beginline=1;endline=20;md5=909c08e291647fd
 
 PYPI_PACKAGE = "python-subunit"
 
-SRC_URI[sha256sum] = "5fe5686904428501376e7b11593226d37638fbd981c1fc9ed6aac180525d78c1"
+SRC_URI[sha256sum] = "2988d324d55ec35dd037e502e3f74ac38f4e457bd44ee0edf5e898f7ee1134d4"
 
 inherit pypi setuptools3
 
-- 
2.30.2


