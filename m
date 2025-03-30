Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BD8C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 19:41:55 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.36533.1743363711379418464
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 12:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FxsrABJ0;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so3064986276.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743363710; x=1743968510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzB4juVtEPNlU+LRWGU5teMCzxGUujwCL63mCTbto34=;
        b=FxsrABJ0UyYMfESl+YHUdnGKPwzWnADZ4L3ZoyeAKc676AwafT5oFCQ03I0lTYIF5s
         1YnoDcYd2BttgIeN2TDYjUoPeoBjpTkTMBLfjQvJcFkkidtydPtY1/sZ5MjeUCBdUeK9
         Fbs4Bb+hHp0cqykHnJKHbP2eHQDtm2Jzz1+/d8RLw8FSWo6IAshSNs9m2UWoZq3Zxnho
         wkRLuPS9qAHHtVa3wmXLsLHTX7i3kdKYmxFnu+zptoVpC6cQaT2tl6vuk/5ZbUleQEsS
         xhf4JQJ8UekXjQfm55MQcSkzIKdSZm8Ax376qUDr+LxNA5Abpos3UPjFgf01G/Kfa38e
         oKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743363710; x=1743968510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzB4juVtEPNlU+LRWGU5teMCzxGUujwCL63mCTbto34=;
        b=aC+6t3i8W4S6bx+F+639W4sTUXc2El+DAEk1eBDgjBLfZ/2dmStb/5z7fe1f3bM0oa
         ERDbGSqign8rujQrdyaiZ7FzR6qyZK4Czhir77cz8hRwnPD3+jEIIKTnoUAqSsIJZ4Rz
         7qhJhmNxTCfgR6B4PqEfyU62T2GVCH/wpK4/6LalDcx8UyvM+sUNg+Lxd/xF8N0O+34N
         ksfGnZdG8YdeHqnRkZbzMgaK9gquMKbFRgUF9klGgcWM2fOvRQRmbzmDoqCxc+tedlsd
         1FFl0bPF+/6tfjKymENhtSMFN2wQ0w2pecKLmLhi14HEORdSjv8w5pLRL1jo14VOtyxa
         PyQQ==
X-Gm-Message-State: AOJu0Yz1KT0AhpzxIPoyZNCqI+wr3x1l7H1N2KuoKfATUogPAJYmNoIQ
	IIwBTtXNkOIIbkfwND0fcArHfgG6cFI8BU+zbaYhge9+b3YBif+Q0yYEGV94
X-Gm-Gg: ASbGncuMsCTD3jH29wYrDqOsDMMKQ6ha/9Qgt8B4QWwduBqpFHTHp+FF0rNnALr9arp
	MoB3LqZxgbQPIgZ47pQ1mFb9abZhwwGl813Tg29pCRfEnu0IS0AqddBnUDk18TPkl86NH+hRcUE
	KccdboPxbmhVpo0s2KUBr4i5VL0pY24adsBVM3F+4GdB/B8gHUxUueSkzweuVOAeY7W89qAuGE8
	Yk4ug/mNC0CimNegfCzcUBwnzsJdC1eTgLt7/EyBIcy3nQJAmdc/B0x+M1vzF/4UQIoBpcFZO2t
	h/nes1Dft04SGLgcGx83Q/OpyPx1ET9npEidjrCwjpVVcXyycg==
X-Google-Smtp-Source: AGHT+IHnDD35uZCKLD7sG13bbJI/vrC+S+reHgwa1WzMCODupQXF27hg/8jkA9Tmjxdcg2kj7DJ4tg==
X-Received: by 2002:a05:690c:6ac7:b0:6f5:4304:fb8 with SMTP id 00721157ae682-7025713581bmr91855717b3.18.1743363709952;
        Sun, 30 Mar 2025 12:41:49 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-702557ec41bsm10639527b3.124.2025.03.30.12.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 12:41:49 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [PATCH 2/2] perl: upgrade 5.40.0 -> 5.40.1
Date: Sun, 30 Mar 2025 15:41:23 -0400
Message-ID: <20250330194123.1301304-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250330194123.1301304-1-schonm@gmail.com>
References: <20250330194123.1301304-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 19:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213923

From https://metacpan.org/pod/perldelta :

"There are no changes intentionally incompatible with 5.40.0. If any exist, they are bugs, and we request that you submit a report."

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta/recipes-devtools/perl/{perl_5.40.0.bb => perl_5.40.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.40.0.bb => perl_5.40.1.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.40.0.bb b/meta/recipes-devtools/perl/perl_5.40.1.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.40.0.bb
rename to meta/recipes-devtools/perl/perl_5.40.1.bb
index 0d4338f29f..448fd52ed6 100644
--- a/meta/recipes-devtools/perl/perl_5.40.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.1.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "c740348f357396327a9795d3e8323bafd0fe8a5c7835fc1cbaba0cc8dfe7161f"
+SRC_URI[perl.sha256sum] = "02f8c45bb379ed0c3de7514fad48c714fd46be8f0b536bfd5320050165a1ee26"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.43.0


