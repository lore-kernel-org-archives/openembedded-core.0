Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240EEC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 16:49:52 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.78.1665074987212593632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 09:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CaIur2TA;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id a22so1385084qkk.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 09:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F7qF8hUjWe4OMbyZmsAWRBdpvzRTivPJK8AWKQs++hw=;
        b=CaIur2TA6+0zTqfqZuKMSIb7ZB+NtNmlLdoWP3GkGhZBdsebV7drgA4qQm/CiZoB6O
         z0imcR44KCB8xApW0Gkl99TSQsA5yPavKIiqw/R8PsNeia6WV4H1MvqBt+fzGu6pXDgE
         /c+8OlUn5UYQvVYlYzSvDvFE9JvymHb2wXqX3zOCqpIRTPes9mcXf1h3EYesZmfhmtua
         SkPnQri1TVcER2khlnrxQnyu6K2+QNXo6CEbc3sWW8Bo+AHGr/sbAR2S0YITMx7pCAqG
         X3Rf23UBOCbyv8//qmIh0UufNb+orvU6bKnhxXNTzUsqG7haJl5f+F9crZ9HZZQh3jqw
         OopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7qF8hUjWe4OMbyZmsAWRBdpvzRTivPJK8AWKQs++hw=;
        b=h+X4XCtWQ26OopAMioWRwLdD2X4DuioY6deYZDb2b4Nnwav0CSsgxxqXX6AOzReMIQ
         g7QyjBJB68QjOPBMGlDZp2RIloXKT+l0Qa89IBANwyYKnnpDtqGRmmIczeuOG6BTa0TX
         vXCkqbihalFmheYC9axJVH0dPUvqqvoNHxFuTkTm1VO6WDmC4gE/xZEcn0YGszEYzX+j
         JYwJBSO3rz5XAXpIezNEHmhQcaTpLeg6HM1hA448qftt1oddRQsAhcw5YJlrT+ELaFNN
         gK69p9V3NCSdeIti+cfqgNx67pq5Z73389t3zBlWpabzLFtffnkQnHnU2WOXR01+x+Or
         +WbA==
X-Gm-Message-State: ACrzQf23uF00hrJbekNQby4m8MW/19itG0zP3A9mpplGciR3/2CgcXzg
	l2gtvcDeTojuTl5x/D2faUU=
X-Google-Smtp-Source: 
 AMsMyM6FPb1SJTqm5Y/ZC+gQ/hsOp1QmzRQ6FGaf9CklrnNUdk0WlgR4GZ6uQyLV4VlYO2fi1Hyqhg==
X-Received: by 2002:a05:620a:4450:b0:6ce:968b:d43f with SMTP id
 w16-20020a05620a445000b006ce968bd43fmr812757qkp.570.1665074986151;
        Thu, 06 Oct 2022 09:49:46 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 c20-20020ac86614000000b003447c4f5aa5sm62885qtp.24.2022.10.06.09.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 09:49:45 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] perf: make scripting depend on setuptools3
Date: Thu,  6 Oct 2022 12:49:44 -0400
Message-Id: <20221006164944.52304-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 16:49:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171511

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It looks like this should have been an error for a while, but it
only started showing up in my 6.x linux-yocto-dev testing.

Without the inherit of setuptool3, we get a module missing error
during configure and the build obviously fails.

Tested against 5.x and 6.x kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v2: as suggested by Ross, we remove the perf dependency on python that
    is picked up from the inherited setuptools3.

Test build and target runs, everything works as expected.

 meta/recipes-kernel/perf/perf.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 31bc04635d..7629423cb4 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -48,7 +48,7 @@ PROVIDES = "virtual/perf"
 inherit linux-kernel-base kernel-arch manpages
 
 # needed for building the tools/perf Python bindings
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3targetconfig', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3targetconfig setuptools3', '', d)}
 inherit python3-dir
 export PYTHON_SITEPACKAGES_DIR
 
@@ -338,6 +338,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
 
 RDEPENDS:${PN} += "elfutils bash"
+# PN picks up a python3-core RDEPENDS, due to needing setuptool3 as a build
+# dependency, we remove it from the package, as PN-python is where the scripting
+# is packaged.
+RDEPENDS:${PN}:remove = "python3-core"
 RDEPENDS:${PN}-archive =+ "bash"
 RDEPENDS:${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS:${PN}-perl =+ "bash perl perl-modules"
-- 
2.19.1


