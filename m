Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.3233.1630670126053868218
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 04:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MsgiGh/t;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id v5so2318819edc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 04:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gbC5CWSHbu8DnuMG4o+DLG3SF2VKpjtObIXLW99EFpc=;
        b=MsgiGh/tcl+Qm+DRAmTPmeZCUV++M7pTqp96cBtrT7+PF4ABTQxqXRUc2Q8kEbaGw9
         yBip2rcrhTJ56uhaRvEGhqvlC9wQD/rnP0VN/yAyz8IehyHIcVW8UbSCZ9ZYgaUKoZ9l
         kk0t0WndPMfHNhsOSBU9ntqNmutG4kS4UmWCdJrWMdV/FIIX8qfc9/4WPyJ98kvNFnSb
         Z06BqCmwG/kslvFspuO49I+yhlmDepnF5TfGmr6oZUH5YorirBFctFtoXcm+O2QxcyIE
         suUcV/ZBS6bw6SnR3Oimh5MyfqcbuT3qh2H/BR/aaBO6OPGnv6QoRORuJ1MmQ2HYgc52
         uewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gbC5CWSHbu8DnuMG4o+DLG3SF2VKpjtObIXLW99EFpc=;
        b=lzmm6U2RH3IRE/a0JhtXzphy8O0efStBEpudFLoQcFh+1xG82CFhVy3oF9lGaIVLIO
         rpCorCguvcPvg/VECzMH0S2WnkQAHdZZTSunFgD40kkgMIgdI708cb4MYmvy3IhAcLcS
         0N8WFA1aBTizHacJy/2I3ynYalp7GoF/IoKiUlCKHPR6OIHf6BgMj0Fmijcu1/Z7eVDj
         ZL1gzEQtB47/fbjgPHk8fFEyVmjq+DXjACfVrRhtvNmO79svt9jDJDPYWUdN3YhXAd67
         Lc7O6xUyqOJjreZIEarhBVzNcG6ISZNyl0Gh4yc7o5+Yi0wwdVT/prpqD5LevwBBQkmJ
         Qo0A==
X-Gm-Message-State: AOAM5330a9/h7rbsgBcJq48HbYeGPxode5BezBpOFhM/V7A3ffLg+Im8
	CIIw2wqQ4cynbIYYI0w7tLRAdKt5oWs=
X-Google-Smtp-Source: ABdhPJx96szLfwoLXYMAutNJ+qATDmFUq44ut34M+WKWL6Sbk/3h5vHf/0qNjXSd86zQGot91+ETQQ==
X-Received: by 2002:a50:cc4b:: with SMTP id n11mr3488418edi.132.1630670124211;
        Fri, 03 Sep 2021 04:55:24 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m6sm2709680edi.10.2021.09.03.04.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:55:23 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [RFC][PATCH] default-distrovars.inc: Set BBINCLUDELOGS to empty to disable printing failed task output multiple times
Date: Fri,  3 Sep 2021 13:55:21 +0200
Message-Id: <20210903115521.1962799-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* the output is shown 3 times with default configuration and 5 times when --verbose
  is being used with knotty, there might be other use-cases where we actually need
  this, but until the logging is resolved better, setting this to empty looks like
  more reasonable option (considering that e.g. log.do_compile from chromium-x11
  can be over 50MB long, generating 150MB+ cooker log)

* more details in:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=14542

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 6 ++++--
 meta/conf/documentation.conf                    | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index f91df632d5..5035508b98 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -33,8 +33,10 @@ BB_GENERATE_MIRROR_TARBALLS ??= "0"
 
 NO32LIBS ??= "1"
 
-# Default to emitting logfiles if a build fails.
-BBINCLUDELOGS ??= "yes"
+# Default logger already emits logfiles if a build fails, setting this to any non-empty value would just include more copies (prefixed with "|") in the output
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=14542
+BBINCLUDELOGS ??= ""
+
 SDK_VERSION ??= "nodistro.0"
 DISTRO_VERSION ??= "nodistro.0"
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index c5a38b0764..f4697e28d0 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -88,7 +88,7 @@ BBFILE_COLLECTIONS[doc] = "Lists the names of configured layers. These names are
 BBFILE_PATTERN[doc] = "Variable that expands to match files from BBFILES in a particular layer. This variable is used in the layer.conf file and must be suffixed with the name of a layer."
 BBFILE_PRIORITY[doc] = "Assigns the priority for recipe files in each layer. Setting this variable allows you to prioritize a layer against other layers that contain the same recipe."
 BBFILES[doc] = "List of recipe files used by BitBake to build software."
-BBINCLUDELOGS[doc] = "Variable that controls how BitBake displays logs on build failure."
+BBINCLUDELOGS[doc] = "Variable that controls how BitBake displays logs on build failure. Set to empty if you don't want to have 2nd copy of failed task output (prefixed with '|') in the cooker log."
 BBINCLUDELOGS_LINES[doc] = "Amount of log lines printed on failure."
 BBLAYERS[doc] = "Lists the layers to enable during the build. This variable is defined in the bblayers.conf configuration file."
 BBMASK[doc] = "Prevents BitBake from processing specific recipes or recipe append files."
-- 
2.32.0

