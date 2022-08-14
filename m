Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F336C25B0F
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 22:20:57 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web12.10110.1660515649881659689
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=egupTRtO;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id m2so5014326pls.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=NrRd4SdHkzL2S6mneNj5HL1GYvJqrQZ+OfLlFhIDT2k=;
        b=egupTRtOuzK+/5f1TK7UvPHUCMXVzdmvHY5sPW8TDoDgnRhrMuwo4pAewOVzhjWlFC
         xgq5ElCujHkIRxsd3sYxp7Ir4oS5dDzwluFKR7OgJJd2l8RerZKM2dJkhmZrzXi29Vvc
         bY/LuiCfPo0xLjlxuhhxIO8wevGTUgN9Fu9Tcixa6uJJwqAb+LEw8w4SlS8HO3NaQJ2W
         xAj+K5av/XrnoSeQOLLFlh177MQFnMWirU872rzK+BuhRovhEZBeOzwCKMMObzAIzAok
         t+ms4mZwkTfQM0a5oB4NnVHqORrAk7wtHhFcXOHRg/oll+TtF4oWqwl/PYUF+fpaSQc4
         DvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=NrRd4SdHkzL2S6mneNj5HL1GYvJqrQZ+OfLlFhIDT2k=;
        b=hEyQzL8IJAVVi8DxiRuQ8hsDst+O0W5i4JVQnvCcIY7vy4W3jTDQ6G7Z+nJRiHH7wX
         ksvVf93qL4C8bUWffYReHTuwFThKb8WQK5O0lNPFQN/ycSDV8k9XsdahbN6LhMdMjLMr
         16CwarKP7d2p036zBg/mxyd8C+zvIOHoMFK4lhVqDY/2FkiK8yp8JYJapH3aYei0Lx3I
         sRomuhNQfzScaahWhCFr63WYF9Seed7JzcHsuoa+KE7L7xJXLOqstTIKuFBTvbBbwE4D
         SW+8DVC8+3jxrX8Wp1pgOWDS7BxJL/xCqhe36XJs/xS9SG0S05UMQZn0Iaj+wmTciCWU
         Gt7g==
X-Gm-Message-State: ACgBeo3SWTfWK4iExcsKBR7O4nRIuVrGIbVVDjzWBYQs6LF6zpmCUObR
	PY5kD6DGHOz2wt3IBHhtBD92ryvF6DiFSw==
X-Google-Smtp-Source: 
 AA6agR4F8P91ZMacXd2lMBqng7BWSBOrYiIMxgTNBICCbcTCJBwNtYVyUzfVoBeA+0uYDleP9zMMxA==
X-Received: by 2002:a17:90a:b703:b0:1dd:1e2f:97d7 with SMTP id
 l3-20020a17090ab70300b001dd1e2f97d7mr24423331pjr.62.1660515648862;
        Sun, 14 Aug 2022 15:20:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 k15-20020a170902d58f00b0016d8b0dfd61sm5819502plh.178.2022.08.14.15.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 15:20:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 08/10] libxml2: Ignore CVE-2016-3709
Date: Sun, 14 Aug 2022 15:20:35 -0700
Message-Id: <20220814222037.283943-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220814222037.283943-1-raj.khem@gmail.com>
References: <20220814222037.283943-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 22:20:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169335

This is fixed via a revert in 2.9.11 [1]

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/c1ba6f54d32b707ca6d91cb3257ce9de82876b6f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/libxml/libxml2_2.9.14.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 3081ebf92f0..e58298d3b01 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -29,6 +29,10 @@ SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c
 
 BINCONFIG = "${bindir}/xml2-config"
 
+# Fixed since 2.9.11 via
+# https://gitlab.gnome.org/GNOME/libxml2/-/commit/c1ba6f54d32b707ca6d91cb3257ce9de82876b6f
+CVE_CHECK_IGNORE += "CVE-2016-3709"
+
 PACKAGECONFIG ??= "python \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
-- 
2.37.2


