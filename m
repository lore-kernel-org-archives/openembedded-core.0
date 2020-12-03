Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.11389.1607008180697479167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ybSI+Ws4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id o9so1454727pfd.10
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=hZmOV9RE2zXF2TVChNJQvhinc3T85N3t8LBQ5fJWx+w=;
        b=ybSI+Ws4eSqg1D1XvpHJNtvBxUGH6OMUGoi9UPUjUL4vjjMQ6JvBgHWfZNZlpRCFKG
         aDY9YvB9eO1+/ZQT4cTTTQs+uwCQTDL3dfhexb/MCVkkAFWJyT2GhRnfDBsG7jBLVVeI
         DIYrqi3wRhb3wEn5xbRj6dWAu+GcuEIeJJwDx8tM8mpYeCeZaVSLY3stx1b4Kk7sEpAO
         lHMlBZH6dZwDoBKjsrUHlnTzqGGN8s0M4fF/WwNa7oRCarpjU+sFdmEJCM1W/6JrngaJ
         uJ+ORmkCvzyzTePPo5UTdsutoxrQqHCZSfK3XE7GI4+FEDzgTIt28V7zTzmr5tmTEWQp
         mhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=hZmOV9RE2zXF2TVChNJQvhinc3T85N3t8LBQ5fJWx+w=;
        b=c6Mq21QyFX+UD0zCVsijdxw+iJtYtRiUAkG0fWggbjFYtnmBr12lNoXrrVZo1uXgYN
         KaAmZ/BzS9YWbHUE1HvlCVu8s773lzJZewwufpWAD368QGoQiM0ELFc+pX5MDekMzJW6
         kVx49zOEucFP8Z0s6G1Tep/BTPjZU+k0z2Z+nQmMIog8vYSsxqRXxqoXyYH2uv8QA03W
         RZjE5wR1cs9TXNnQVyT9v8xb9EU4ab7jf+u3oupMYaZ7A1G2eGsCSvj199qDapkrYUMw
         vE2wQxTgcn+9HitlnpYnSAAu6qNvAxuAQRC5D7uXzz+N2J6JA/8M1QrcvgF1INiV3bSh
         jWUw==
X-Gm-Message-State: AOAM532ocmG9n0twvZB6eqdU2Y3FlArftZLoaHcUA5MNbdN7E5PrguuH
	Ril0o42MWnRRxmtLxfgvJI7s0+4yJKqTgkW+
X-Google-Smtp-Source: ABdhPJxfZQp57rx6rcOCELh7XpQrqNlb+4Sbb2oFuHs/YS6X7+m6H8SkiClGP0SD5aTBYcCVFvKtXA==
X-Received: by 2002:a63:1d55:: with SMTP id d21mr3368948pgm.324.1607008179730;
        Thu, 03 Dec 2020 07:09:39 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:38 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/28] pseudo: Upgrade to include mkostemp64 wrapper
Date: Thu,  3 Dec 2020 05:08:13 -1000
Message-Id: <7f8cebb94965113b7c9c781743ad5ef27a37aed1.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Newer systems are using this currently unwrapped glibc function,
add it.

[YOCTO #14080]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cba4f51f0166e2c20e854ee0344be0c58769eaca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 9b7ee1c18c..2e13fec540 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "07141f919dc8582460f984ed1d2fb73e05f82ef3"
+SRCREV = "cca0d7f15b7197095cd587420d31b187620c3093"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.17.1

