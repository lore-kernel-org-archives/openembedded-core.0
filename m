Return-Path: <frezidok1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DECECD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 09:32:47 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7911.1778146366352420566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 02:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QxApp7Oc;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: frezidok1@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a746f9c092so987705e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146364; x=1778751164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=twraJ6XO6aRYtror4E+8iNGz1nTBJtJKHdFsHHO/T5U=;
        b=QxApp7Oc0N+PAUFxHL+eMWagHuKftWqocr+CQu5F4wkjmBs+fWn79VIYR61Q8Aa6Gg
         w6lCCQeZ9LmWVPP9a5cOgZy+OQ5FkyqKtdzV5pt5azQnP+3eqahRyI6wo+cxskgHy3yd
         lG9d+KioKS+Vfwa+6PAin4IJ5lQsYKC5GZo8zact3ObSDcZ6dmaMxDivhJr0kuJcXDf8
         DazohGQ2Q+ylF2/3LTVaA+ybIaQTcE7nFFbu53U2UlOZjaNGWRTVID3VZo0wC+R+lWQg
         Fk27F2Yq0ObtWgdnLx7PLt5Cjy0ANMFS7FTW2+H75a9eEDRrPp6bDxq0l8vLX+lhmYEr
         6/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146364; x=1778751164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twraJ6XO6aRYtror4E+8iNGz1nTBJtJKHdFsHHO/T5U=;
        b=oUrFK8bUwO2WciMwTuIGhXcZKwhq6+H6SeEFIuXGJsHjVe6/8ORfJeE/axDmDsBRfq
         ijwIJmHdhuRGnVY2YcJNOwIuq4v5AkasiPq05gHVdvnGv/V0mG4w1ABcWbAdaREpGF0w
         xBeJwpZhlyvkqijFKwoOLjw0YDoLZtMeme96Ea91KLWVnuwang3lTk1Pu/rjQ1TIC+dR
         +c349Qq/cRcU0PkdfjKCZCuVlQMZSYRtOSQTOrIDUl69jJeO8/CcYdn0Ccc6feWMJLlW
         Xlk7DQBN//bJiXlYRjQ5h8+Renj2Z03LFqMuuX9sE/gLq3Um2wgy3euliLy+wsmBRmQn
         ISEg==
X-Gm-Message-State: AOJu0Yw3NqIZ0mJg56p2z0BLxglD4yBY2HomqUa/08yeIaoo370mbsBv
	COMJaI47ckioDVJp359DEFjIQ5xo488+yy/GmukGdEt5wp/ffAp2M24WxPb7oTUaPtA=
X-Gm-Gg: AeBDieuTOnS9i0pYkEEDl3Ndcuz2NZG4Z8GXp4sWxJ9JxYp/tH3hIKmG20Bm5J3V+Mr
	9eZBAXnjepO8eyr315LQD+8A02U7kejIAFISYCLpL4xezHqzQfzZm2UW3Dw52jCQ4CSakS5Nc14
	YeEKmqFh7rFTAqalK1MllTQg8gfIP2vfNrFoDHcuqVKQzt7R0Grcy4FYApaMhy6bSbDEEFN+3ZE
	vfIi50tuidN7cKGoo3fDxrexxjIlON7QTdSmbQSctYenattEylwvxMh5IPJsoE5NKL8Mcfh7pVg
	A3lmSSVp60N6ezT5wCwCMltT2tXTStcvlnl7os2fN7VJEiZsq0uRFWwUBFBryaIiW4MfRdQFgk4
	uP4cNh8v3nfOW5603dadk8uas3iOOugQAoBp2q8Gie35samMdO74WR6MPdvIlK3S8cuP/3dTej8
	FJ1Q5CR+bBCMqMCSw7Ds+SB9ToAQoa0A==
X-Received: by 2002:a05:6512:400f:b0:5a2:b86b:56c2 with SMTP id 2adb3069b0e04-5a899bc9384mr682301e87.21.1778146363583;
        Thu, 07 May 2026 02:32:43 -0700 (PDT)
Received: from ubuntu1.. ([213.87.139.100])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3936109039csm56796631fa.8.2026.05.07.02.32.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:32:43 -0700 (PDT)
From: frezidok1@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] shadow-native: Disable syslog usage
Date: Thu,  7 May 2026 12:32:22 +0300
Message-Id: <20260507093222.33735-1-frezidok1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 09:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236569

Upstream has accepted configure option and merged it into their master branch.

After they release v4.20 we can remove the patch and rewrite recipe with the configure option.

---
 .../shadow/files/disable_syslog.patch         | 22 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow_4.17.2.bb |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/disable_syslog.patch

diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/meta/recipes-extended/shadow/files/disable_syslog.patch
new file mode 100644
index 00000000000..7299a8e61cd
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -0,0 +1,22 @@
+When building images using shadow-native, we shouldn't be spamming the host's
+log with lots of syslog messages which aren't relavent. Disable syslog use
+in the native case.
+
+Upstream-Status: Submitted [Merged to upstream's master, waiting for release]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
+
+Index: shadow-4.17.2/lib/defines.h
+===================================================================
+--- shadow-4.17.2.orig/lib/defines.h
++++ shadow-4.17.2/lib/defines.h
+@@ -88,7 +88,9 @@
+ 
+ /* cleaner than lots of #ifdefs everywhere - use this as follows:
+    SYSLOG((LOG_CRIT, "user %s cracked root", user)); */
+-#ifdef ENABLE_NLS
++#if 1
++#define SYSLOG(x)
++#elif ENABLE_NLS
+ /* Temporarily set LC_TIME to "C" to avoid strange dates in syslog.
+    This is a workaround for a more general syslog(d) design problem -
+    syslogd should log the current system time for each event, and not
diff --git a/meta/recipes-extended/shadow/shadow_4.17.2.bb b/meta/recipes-extended/shadow/shadow_4.17.2.bb
index 5459d4e57ff..19512f25941 100644
--- a/meta/recipes-extended/shadow/shadow_4.17.2.bb
+++ b/meta/recipes-extended/shadow/shadow_4.17.2.bb
@@ -23,6 +23,7 @@ SRC_URI:append:class-target = " \
 
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
+           file://disable_syslog.patch \
            "
 SRC_URI[sha256sum] = "064a7c048e613ef5b5f3613e137d79d35d062ab434e89020f743e90844ec5c4f"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"

