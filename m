Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC7BC433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 21:30:22 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.30349.1638653421046651254
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 13:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tdp8OZO4;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 13so13115654ljj.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 13:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NJSfTQp578j79O9Ad2DYbbb3UJ6f9gKVAx8QFVR/cOw=;
        b=Tdp8OZO4BIMlF0duIbWKE7Add4U6SAbOpVGIBFpDUF0F8c0snx6fRsI0EiDs0HlB6A
         zUiI/RexlGL+5PECYLo4nhEMyh46qENSDs/fyHxvtftFwULATYAbqJGs3DDYzgFvnEzM
         XjyO4Mv56fM+BTESsx6tATO8z7FJLsJamz1lGzydizrCrwNIepEhO2bYYE0SQUYi9y/C
         KNt7X1UxtIb8XFXtzdboe6BufpPE+UunGWEH6OjqCmPrcXAXsJvX6DNRoD/WEQQOFFyk
         MreBWmoEaWcOvUVRxprl47XvNRQ5vD6yk8Qe9WLZ3obF8aik1xxX6o05LBDSRTrvV72f
         OQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NJSfTQp578j79O9Ad2DYbbb3UJ6f9gKVAx8QFVR/cOw=;
        b=BU1lN7EefG47yT5zwh2QwtAJuKyW2YyAKcG/h3iBwKJTEWZ3u8DTBcmcWK5rWpALvx
         m1NSSdGl44zLbV8fkXxGyMCApSrTQvIR7CGmikuwxx6dzSMhbCzMrFyFcJIg/+LS2TOn
         wHDbN089EsfpJr0bJTWGZgDmatfJXmmgPjvO8SkodfUvc+kFt6y28/U2Qsl7PcXSC+2B
         LHDsUY2gvu1rvI9Sr1SvkFBumkik2dz84I9P3+BYFwnRqa3XWZLN6IIBph2f0IlpneWs
         QLebhFMSeZd2cZxQ/PKSDp5ud+ExOaR4U6HiivdQgaUBmfAEQn0fQk+T9yUFLgoc0Ie4
         CbGg==
X-Gm-Message-State: AOAM531mAquydYck0+YXN954hA/pL4RQvbQ8zVN1hXxGRkguYYLreL6V
	YWqbDnsABjLaNeieCzYVriBSFKLQR+hpVg==
X-Google-Smtp-Source: 
 ABdhPJw6eI3xKo1xoRr6VNrEX52yOamG4iubZg8Zd44PF4mL4pZp3Rmj3AKrN5eJsi/AIvW3eCRUoA==
X-Received: by 2002:a05:651c:1b0:: with SMTP id
 c16mr25477309ljn.339.1638653419449;
        Sat, 04 Dec 2021 13:30:19 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 p3sm874262lfh.124.2021.12.04.13.30.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 13:30:19 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH v3 1/4] kernel: Pass rpaths in BUILD_LDFLAGS
Date: Sat,  4 Dec 2021 22:29:37 +0100
Message-Id: <20211204212940.3787349-2-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204212940.3787349-1-jacob.kroon@gmail.com>
References: <20211204212940.3787349-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 21:30:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159182

Building the kernel involves building native tools that are run during
the kernel build itself. One of the upcoming patches removes
${STAGING_LIBDIR_NATIVE} and ${STAGING_BASE_LIBDIR_NATIVE} from the rpath,
so pass them here so that the kernel tools can continue to run.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2d219cb5e5..aae3fc887e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -228,6 +228,7 @@ KERNEL_EXTRA_ARGS ?= ""
 
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX}" HOSTCXXFLAGS="${BUILD_CXXFLAGS}""
+BUILD_LDFLAGS += "-Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}"
 
 KERNEL_ALT_IMAGETYPE ??= ""
 

