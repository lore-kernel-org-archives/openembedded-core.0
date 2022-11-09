Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B31C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 20:21:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.2167.1668025281396467004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 12:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mYshTGLq;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id a14so27614204wru.5
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 12:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRgA97ejqrifIAa7gXIk6QrJU8fmmQvH3vVuYHtddnU=;
        b=mYshTGLqLyffUs4ZN7paI+ensGHcvSWxcChGxdC/ggUkQD55gH5whdyF/3m79ZV9rK
         5GXa7ATIZUONEVOzzPwg7FZFAQLsActmGY3zEHomBLMBZr+xPXzcLfMcZGecpBEIfDWC
         qctQeHjCEbX5WjoMM2BUOoKKprP2j3DCsIzvt/KMz76GS58WZGfvmBj/2o5Yr3qlk1uX
         HkZj6y5Lk3eIOTEgcp7UZ4ASoGkKAU7raB274ciiM44Y0bpqNr5LE1W9sZn3Po8ibLpa
         JD+KFGTfKOZcPJb4zrNZLQuC/S4eeWT+ESiWS6siEio4qhSQirlCNaaDlptX1DNVUBl9
         JXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRgA97ejqrifIAa7gXIk6QrJU8fmmQvH3vVuYHtddnU=;
        b=UDKyD5yPsVJE3mFWgpQwVjtRA3RkxvIf5rmCSdNW9OXyk30mqE4nlLAtgxxskxBewn
         zZf4BljZOQUCEUVNBQlkbCOaMKQlBuEmk5Qkl/xVlEfKYGusjsOeIAff+DITpueWuygL
         f/oQupzHy6Z8p8BCpXes+R+apXmNRhTYCJOUhv5/IceU9CxqxgOxfES0Ybai/eIJ6WYc
         Dupgk5Hnx7wrFTRjVWOkH5nhoARmGf72rQgs13bXbaCU0QJPtJeAwyLu4ACBtzY3w3gD
         gca27ajQCsdwKxbSpi3twc7ab7f6FVyDxi4rymlIeLqUsoiRChL8FzO3s1Ri3gN20GEF
         jHTg==
X-Gm-Message-State: ACrzQf1iO2snzTaEdsvyQonbfAcoNnFck3Ys4p6ONwBEJlBpF/soQNm6
	ZUfTLj5RkGcYZz3jxAEoqDBXEt3yIdE=
X-Google-Smtp-Source: AMsMyM7VlXoP/G2Tx6eT6AbgDdp3cUY6v65Q1IY1euM3TXZXxdCXNsA61PohR9KIYrcVmajGxPDkhQ==
X-Received: by 2002:adf:e704:0:b0:23a:1e9a:c554 with SMTP id c4-20020adfe704000000b0023a1e9ac554mr19954751wrm.167.1668025282344;
        Wed, 09 Nov 2022 12:21:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm4168055wms.3.2022.11.09.12.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 12:21:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 5/5] sanity.bbclass: do not check for presence of distutils
Date: Wed,  9 Nov 2022 21:21:12 +0100
Message-Id: <20221109202112.2035727-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221109202112.2035727-1-alex@linutronix.de>
References: <20221109202112.2035727-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 20:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173054

This will be removed in 3.12 and has been deprecated for a while.

If anything breaks because of its absence on the host, this would
expose the breakage so it can be fixed.

icu source specifically does not refer to distutils anywhere.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/sanity.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 606444cae1..38f4a4b22f 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -625,11 +625,9 @@ def check_sanity_version_change(status, d):
     # never again until the sanity version or host distrubution id/version changes.
 
     # Check the python install is complete. Examples that are often removed in
-    # minimal installations: glib-2.0-natives requries # xml.parsers.expat and icu
-    # requires distutils.sysconfig.
+    # minimal installations: glib-2.0-natives requries # xml.parsers.expat
     try:
         import xml.parsers.expat
-        import distutils.sysconfig
     except ImportError as e:
         status.addresult('Your Python 3 is not a full install. Please install the module %s (see the Getting Started guide for further information).\n' % e.name)
 
-- 
2.30.2


