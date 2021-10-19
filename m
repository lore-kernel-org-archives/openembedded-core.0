Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578A4C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:13 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.15290.1634673312972454308
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kUaIqHW6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id s1so12650290plg.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p2yGI8dfhyquT4Oanc4xwKK12sMSLbFLYQAVdIBjeyU=;
        b=kUaIqHW61ayQLd7tiNYDb3IcxmM8VSWYwacoAKQ4NRf0zIVlmnR8tz/Cwxh98xpdTx
         tabIIWXA7ULwouDBL0Et5ayX6amiXVjFX6JS6Bni00ICRZ08UQqvdRX2FF60GZDw7VUB
         2TRhZFiiRvyJUc0rZ/jZsYNQbT1xTlvK0m/GpMwM417N9yEpO+EBbhOuKIdL6RXiKrp7
         9rK6FYHs3Q/CUGKnQvK5E1TztjhVUjphS8akUFZmzxzMNXeqv/6vupACL+IV0R9aBxxr
         9Ktp3o9cE/quv6QBIZb2BXJ2YBVK5MxvQily3jM3lpfLL67oysdGqWWn4JcifbRj0f30
         a9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p2yGI8dfhyquT4Oanc4xwKK12sMSLbFLYQAVdIBjeyU=;
        b=6qvA+QaJpb6MLW64kahyBHwKI1Jmw1PH6MIdF6eaFwPjH470A3nloWcsUYfkkIWLmU
         HyuX1ckSs9CNGFNBEURVgikSBg9Nz+AKR9/tGSLxDE2XJwb8tciXJfL8y8kJEP0binb2
         a1b+UvFm3JaT9GLuwirUnAIVFSYjG8FEWhhyt7vkjDraVVjVKJTIEG74xad4C6Mwvmq2
         I53tDFgIAC3cQfaO7BfvSidr4dAXNp3KuIu/d1grWC2LnA3cl5Qp1sS5Nfu5JYnkeGbL
         MFbdYMgAtV2/UUcXKeCAkh9Jckc4arnvZXO0lPAUE49Y3RgzGfc5sMj/5svRvJQ6jjFo
         o56w==
X-Gm-Message-State: AOAM531GClVzm0yg7V2KbzVOSiBLz41bMG/9x4JMPTJJQBK6vwIX5Ulf
	vk0K6e9PpZNdtDFUDH/7e+plMhRWTDjtp7B0wkE=
X-Google-Smtp-Source: 
 ABdhPJzXr4mCJHqyDVn542UrnrpeTfpLNrcva14LpNvnw4itUmMEWSMwVnvEq1+r3c0Xlr37eK8VDw==
X-Received: by 2002:a17:90b:1e01:: with SMTP id
 pg1mr2044695pjb.81.1634673312041;
        Tue, 19 Oct 2021 12:55:12 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/38] mesa: Ensure megadrivers runtime mappings
 are deterministic
Date: Tue, 19 Oct 2021 09:53:38 -1000
Message-Id: 
 <422ce20c7d3089c25593210b1e8a9dec99fb9965.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157232

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a sort to ensure the package dependency output is determnistic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 693e8d0dfe0b475bc233ccc1ad7674d39de346ce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a1bf878b1a..bfab19e773 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -231,7 +231,7 @@ python mesa_populate_packages() {
     import re
     dri_drivers_root = oe.path.join(d.getVar('PKGD'), d.getVar('libdir'), "dri")
     if os.path.isdir(dri_drivers_root):
-        dri_pkgs = os.listdir(dri_drivers_root)
+        dri_pkgs = sorted(os.listdir(dri_drivers_root))
         lib_name = d.expand("${MLPREFIX}mesa-megadriver")
         for p in dri_pkgs:
             m = re.match(r'^(.*)_dri\.so$', p)
-- 
2.25.1


