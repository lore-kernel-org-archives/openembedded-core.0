Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34260C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 22:00:31 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.782.1657231227628584527
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=r6KtLVGT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id y141so21927284pfb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wJwdnG/dK3HUJAFujjHOK4fDPS7QGU6w+Xde8nOlqeE=;
        b=r6KtLVGTdcafjOmwPYMzrobiA8cvW1hK+52nR2UhzU7L7CQ+CH14t5VOyVW6HocBg9
         45wn52Wv+4V+wGyjddVx7uBTAFEcKn+0o/mV1IeillP/Hrjh8o6RtlmIoBTqRK7hNM4s
         z26kMlKeQoGeT328xiLlpvGAUmrWQOqgwBRWLbySgWf0ZOOSyntFXEWPhBQITCato9jJ
         Gwwpijc/aTT9jHpa8f7woxcPp0vn5J6sVhTDoVFcHR/2mWgD/s5lD1TKidGAMom08l89
         kguZRuKg6yBq7WX8BrnxcEOV3lH8SosdfjJZbW09TteJRqVZXb1CDByf5NKXpwXyjFQa
         tpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wJwdnG/dK3HUJAFujjHOK4fDPS7QGU6w+Xde8nOlqeE=;
        b=3CE3B2SfgNof+ep8/k3GGDnklLVf9Po5mGUnMVhB+nckM+ozm1ackkwGg96JehIiFA
         9Bp4HOaQDNR5MNVRkPYVRzowWTiAS7h3ReDxsXNW1zoSR4lHYKKWuHkpJgRS8l/+ixNC
         igpgx5lqG88NXAz7SWyigAV3e8GP5IT6APSEXKNbnvsQPlJ8OzK/N1GsdT/LsBRO/HEA
         JSI/qUmYE098du58/gEjxPVwhVQiKjM9k+s6Kh1APDo8/OMgflxpA/PIkjOcxXfbjpVN
         yyS7jve3X6F0TL+aLhSt+BwCmfQ5/vglGllT5tqREHX4UCi3pfBgzNjxM3Lcpd8GsjW9
         tvvg==
X-Gm-Message-State: AJIora9bo/nFOnR4L3kuHxoFWn6F7IMmy4kGyWGaEl+fiUb4U2QwaiS8
	fwzm3uLNZMg/m4P6C3V6VpUijlL2L2ObRBwk
X-Google-Smtp-Source: 
 AGRyM1vtiLEVopkpMybKEsuxJDkJ7Il6G1DDfHibjcTeqca9DFrRqejPMeptnsx1gQBYy3roZ5QN4A==
X-Received: by 2002:a63:1f5f:0:b0:412:9ace:9fd6 with SMTP id
 q31-20020a631f5f000000b004129ace9fd6mr208953pgm.199.1657231226530;
        Thu, 07 Jul 2022 15:00:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.15.00.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:00:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/14] dropbear: break dependency on base package
 for -dev package
Date: Thu,  7 Jul 2022 11:59:34 -1000
Message-Id: 
 <7bc7d4d24ee05a3bbb9a82ff1089da5d162c8497.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 22:00:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167810

Otherwise the SDK fails to build as the main openssh and dropbear packages
conflict with each other

Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 4667abcc925ae0c430cccb480ec530506f6201ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index b949a9a337..026292230c 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -12,6 +12,11 @@ DEPENDS = "zlib virtual/crypt"
 RPROVIDES_${PN} = "ssh sshd"
 RCONFLICTS_${PN} = "openssh-sshd openssh"
 
+# break dependency on base package for -dev package
+# otherwise SDK fails to build as the main openssh and dropbear packages
+# conflict with each other
+RDEPENDS:${PN}-dev = ""
+
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
-- 
2.25.1


