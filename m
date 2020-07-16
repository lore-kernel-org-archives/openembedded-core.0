Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.13848.1594900589929934930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 04:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=MUeS3RwW;
 spf=pass (domain: burtonini.com, ip: 209.85.221.52, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f52.google.com with SMTP id s10so6711862wrw.12
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 04:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q6Q3T5+weE2SgiFcf9zUHbM/MXJuU+dzGDfFeN6gEhc=;
        b=MUeS3RwWHXkmLhrfvPGYmefh06e4OtgnjKgpuerNY44+M1U08UUX1IXXJl2ef6dfSf
         gxMz+3Kl5bcJJq+K7UE7iAIsCQpIzeGDxi3Jm88eIgqQoMWgjLVkv4EdXO9NWpSZALjI
         6GWq0lvqrRobBwijSgpmG5K6rl3Jkcd1NsI4335ECjeuz1zjTbFgaKYbElgCV+n58Mmk
         j3kclBZ7AGGWIsYjXuxAOePh5IiGS4uo/Uy2n++kca7IjYjVkIij0NVx+/vXMZxFnXl4
         EEXRyvFY0P3N9x8+m9sZ3T1Guo2uohID+HsyxKbeYWpujQJ+2PyyQGMuKbZ0IF3MQBB5
         UCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q6Q3T5+weE2SgiFcf9zUHbM/MXJuU+dzGDfFeN6gEhc=;
        b=MIiz+SNOfjg6FUuU0fu8thKsgstVD+kHAcj/+xYDLFWGG30mTh/ZB8V3+AW7LK644H
         AsQzuWw9JeJh7FrdfiIZQx9FuU/A0f2e81c5nnpyn51iF8hyl27k3EaF2cpOH9P1az/Q
         Wi5wgdOkWy+9kKiebu+rCxwB8Tw0YNG5vqs1L4+dISlaCoVVLckUAMXwgMCiVGCLPlvi
         Q3D7ZqpCzSqSSjfTiQzLQD+D6LHsBsM6thYNVotZUcDX/qtZ8nj7YfAvqc7qdzCsv1Hm
         vc1ta3G/uDvv2nhOY5xsrJbwNTc9L75dzGDUnJpZADh9iU3tCvQNe/FlqJ150/cQY1Nv
         l8Vg==
X-Gm-Message-State: AOAM532bWQT/ECDXAbhVOfDkaSKuYNDghIjwm7ioowQ+FksoQiHIF75Z
	GuMRe0CAzFeSIGO0+6Kk3cTfF9Cjtoo=
X-Google-Smtp-Source: ABdhPJxpwq9CCbrLulNcHtFiUYmZn/C/mErdOAskMFGZMOALC1sXzdqAmCCCjh9NRKfoEsJsj+ELew==
X-Received: by 2002:a5d:5490:: with SMTP id h16mr5055457wrv.394.1594900587990;
        Thu, 16 Jul 2020 04:56:27 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id w7sm7914939wmc.32.2020.07.16.04.56.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 04:56:27 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] autotools: don't special-case help2man-native for dependencies
Date: Thu, 16 Jul 2020 12:55:43 +0100
Message-Id: <20200716115546.3724268-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

help2man-native doesn't need to be handled specially, we can build it
normally or use INHIBIT_AUTOTOOLS_DEPS like everyone else.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/autotools.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 6c2a33ac72..1f3c771c69 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -5,7 +5,7 @@ def autotools_dep_prepend(d):
     pn = d.getVar('PN')
     deps = ''
 
-    if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
+    if pn in ['autoconf-native', 'automake-native']:
         return deps
     deps += 'autoconf-native automake-native '
 
-- 
2.26.2

