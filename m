Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE0BC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:08:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.38780.1656684508875417177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dtH8tO+l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so1647636wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kVbIKuvPFRHUCvXIkFSpmtpWqKhfWTWDPDG72E/aNTM=;
        b=dtH8tO+l2DN2nsdbtTWea4XvMRYiG/hojp2EIwC4s+QdKwZEQgE9TEamUZhiLP3M22
         iqZYchyu3pGVslfHj66FOipxzPV/+ht0k4cTzsIvgI5nSndIFVBcX9GeBrLUey7XU3j6
         XOy1pRUTDbzlCEBDvZTa56LuhZh68/hC++kRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kVbIKuvPFRHUCvXIkFSpmtpWqKhfWTWDPDG72E/aNTM=;
        b=gMBFOwDiwpwxYq6WF2tBezGfBL+YuWUYzYQMz3NY4nQtmCR/722AungPHF3jVBFbtx
         9Iy6QOpkmKaxR+fx4ulGGYz1Z+fEM4TZ4fPZcXsOIcfWygBiQn5ZzzOaNPQp4qvzFGnw
         QKrhYaKZlwAtwtYPWukFOyDyvN2iXCWLa0XQ6bVPNt7eo4PHKDd+Q143EFBLHWzk+70R
         sLxy1vKixqoZ50OWHVJuGOSKR/ImudJMnRcXqWmhFk+gNHhmDluCSDw/dyBtaFaXgDTp
         KM6OW8uONQ+4Cd+41+GWIlAQSujrALNA4KEYplTcroKNFp35DVg4JAoRlYuFvNu050Pp
         tLQg==
X-Gm-Message-State: AJIora+zjtLEAm8aRDjaqfSFyLapWZNdazxZEW/5Pdqimg7DUmDnZgQ4
	KN9NlNCGkNSzGJVB8dqym6T/Lg8CaLt/ig==
X-Google-Smtp-Source: 
 AGRyM1tIJoHp4kkTQZzAmskQ26olRJ5gzfsunNH+qmRgwUZHLMY7a2hIOAJQQ5KEQUFVbjQrCZIo8w==
X-Received: by 2002:a05:600c:b5a:b0:3a0:569f:9158 with SMTP id
 k26-20020a05600c0b5a00b003a0569f9158mr16801271wmr.118.1656684506793;
        Fri, 01 Jul 2022 07:08:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a49f:615b:a613:6a47])
        by smtp.gmail.com with ESMTPSA id
 m32-20020a05600c3b2000b0039744bd664esm7165185wms.13.2022.07.01.07.08.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:08:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: Add buildpaths to WARN_QA by default
Date: Fri,  1 Jul 2022 15:08:25 +0100
Message-Id: <20220701140825.783703-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:08:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167472

This was never enabled originally as there were a ton of warnings and
we weren't able to fix them. Now we have reproducibile builds, this can
be enabled by default as there shouldn't be such paths any longer.

This is known to work well for OE-Core, other layers may have variable
quaility but enabling it will start to hint to other layers and maintainers
that these issues need fixing.

It also will give developers early warning of reproducibility issues, rather
than us catching them on the YP autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index fc7bb431e09..8c5d5ecc820 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -20,7 +20,7 @@
 
 # Elect whether a given type of error is a warning or error, they may
 # have been set by other files.
-WARN_QA ?= " libdir xorg-driver-abi \
+WARN_QA ?= " libdir xorg-driver-abi buildpaths \
             textrel incompatible-license files-invalid \
             infodir build-deps src-uri-bad symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
-- 
2.34.1


