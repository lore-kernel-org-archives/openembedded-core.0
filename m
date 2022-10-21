Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692F4C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 14:53:28 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.10765.1666364001557082183
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 07:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aRlNbsu5;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-131dda37dddso3903263fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XyI9ousf0MPY81cZsCziviLhDKH+Mlh8sundQNd5yzc=;
        b=aRlNbsu5RBMgOJAneYogtCBxCmompwqYAb1PgnV+nVE081uBkmk7GsrV5jD3qsGnNE
         v1prjUrwxPiVBigHfZfwP01CPEKaph9dI6pNztPp72X7I//BJeApuFFKmJpBtdwWBf/Q
         jIpX67YVdycqRbrUla/riiN0g7DsKLTEB+qU+HwAd8y1KElwqSIUpwcyCpgMPjttHqMy
         o2RP53DSfKAd9dMXTUa4GB/zOgaxx9RrfpUzEAntPqo27xQ/zxUD3rjL/u4igmRwAm3o
         j8g88zLUfxy673iQE1qGeEogYQVjXYPWTgxAB07QlZI4p7T8q/F0ywXwT3F/Y+G5z5RY
         GWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyI9ousf0MPY81cZsCziviLhDKH+Mlh8sundQNd5yzc=;
        b=n6nepZE1A4JoMenO1V41eSQ3wRMuiIXAPk2KyIMJYXkGDAlqNTjlks1coOAlHeKcyh
         7oaAwNTRTddyna8uK9k87mG5rtn+u20PtVWfnGqFe/Nk/QzlK9hjbZx+fYbdlVnoGt71
         ZR9+TidAj1CCnY1cHXl4Gj0rlWN4ACYFHGMjBv/ncrKw+0D3QtZ88EmxnP9xlZ3SyemT
         KrJAT8UbJMPYojqgoa63AkGOW9uJYbV67H0J6Cjrr8oYakasmiZTudNRrjhwheCX9LQZ
         Yaa6anz+yhuNaXREGJhtfmwLyaG2hTOmkLtm8HilVl9ggF6VBsQATDLfWnsTytKHRJR/
         //ng==
X-Gm-Message-State: ACrzQf096FQAn9Kl4tIaEV5TCJLfEyLNNMoQQNSUF9kyQ+qlgHGcuGfy
	fu1NOudREajPigMLI5CGbdAIVyLJH94=
X-Google-Smtp-Source: AMsMyM65ym+1gYxoQ5vSYU7oiBvYVkPMzzmQk40MKzREI9vYfkc+QBZX3Q53W2jP+/mI7oHOv6ImBg==
X-Received: by 2002:a05:6870:659f:b0:132:78e0:6e6b with SMTP id fp31-20020a056870659f00b0013278e06e6bmr12317235oab.8.1666364000453;
        Fri, 21 Oct 2022 07:53:20 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id x67-20020a9d37c9000000b006619caef3bdsm1186581otb.25.2022.10.21.07.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 07:53:19 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jon.mason@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] runqemu: Fix gl-es argument from causing other arguments to be ignored
Date: Fri, 21 Oct 2022 09:53:11 -0500
Message-Id: <20221021145311.52133-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 14:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172021

The code to parse arguments was inadvertently skipping all arguments in
the elif block after gl-es if it was specified on the command line.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 983f7514c7..189fc3da91 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -497,7 +497,7 @@ class BaseConfig(object):
                 self.gtk = True
             elif arg == 'gl':
                 self.gl = True
-            elif 'gl-es' in sys.argv[1:]:
+            elif arg == 'gl-es':
                 self.gl_es = True
             elif arg == 'egl-headless':
                 self.egl_headless = True
-- 
2.33.0


