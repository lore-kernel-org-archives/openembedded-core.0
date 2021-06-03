Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.643.1622735006624379165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FEO6jEHg;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id u24so7630914edy.11
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 08:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LtVJviWQrv1i+5J5gFe+ayBZe3d0t0kMi9h4mWPx22w=;
        b=FEO6jEHgay4sw5hv7UJr4omVHzeNedpFB80ANZmzEsMHML55/oDTOhL/ZWwzywZaRZ
         QVDu30+GCH38etD6fd61LuznXhUEBwwTrghyZYCmN5GzGgUyPkEZq+lpdoD1Ts75+kaC
         knzZq+/qCuX7mwZsPJChxYauIhe1vV5vAY2m87Lm38gxV7BqnfgU/xCKX9/AEQ1+cG3k
         N0/EmcDmYQ2QFEvuEw4gvgSZEdH00W9mNj95Z7vPR6MwBZpkVYiB9443m1IZpKiz7kxV
         hmGeUkDsooT7sl0F47+K1TsXQiEUeRhYMowO2qK6DwFStgGn8iyUufXN0gK+597r6aOy
         asdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LtVJviWQrv1i+5J5gFe+ayBZe3d0t0kMi9h4mWPx22w=;
        b=NNkzlsD7eSy/uiduuMtJVaXsMhLzaJPSUEE+702hNKitXhSC12DazjH61mq9s95XZI
         xRBHdz3BWkyubv32D/mnCoVMdDD1O0tXTNgsIaasQzNh45hX/TTNMnFE5lQnNydxwymC
         k3JFVasQRGuQkPm9S0StZ07wfmpuzdt2aDhk38l8wkNamoI2H9Oy7cGLrcxgQbYgPrtq
         +bf7FK/HqSrDlOMsqB8T+vIzxUT4U3qXaTkBkD+kxgEMI0LxzEaVKqWjIzyjdH3iDK5X
         e+HZZQ8HuMMC7UZCq3W9qTJ06gbSxDOwifb1KCqlCdWQhxvUXpDXFvGLniVzeNGuKUE4
         XbOQ==
X-Gm-Message-State: AOAM533zNP/l2Ukkioq8w/qD5+EIIjSKS960hU0gJWOE/uBT0DVZHAWS
	sPTbXs7oBqx8js+rW2yZlctKux1El2Kjcw==
X-Google-Smtp-Source: ABdhPJxHGxpcZNTYJHrdoH/ylD6WT/ZdKux0eZoDSDLdb7bK1doarPw24cvXCNyjZHVnKCIKEQCzLQ==
X-Received: by 2002:aa7:cfc5:: with SMTP id r5mr85194edy.319.1622735005084;
        Thu, 03 Jun 2021 08:43:25 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d17sm1644338ejp.90.2021.06.03.08.43.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 08:43:24 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] systemd: Add more ugly casts to fix build with musl
Date: Thu,  3 Jun 2021 17:43:07 +0200
Message-Id: <20210603154313.2894136-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603154313.2894136-1-schnitzeltony@gmail.com>
References: <20210603154313.2894136-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0010-Use-uintmax_t-for-handling-rlim_t.patch      | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
index af1a6bb053..940db4c5c6 100644
--- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -47,9 +47,18 @@ index b7e18768e3..3195ab205d 100644
  #if SIZEOF_DEV_T == 8
  #  define DEV_FMT "%" PRIu64
 diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
-index 23d108d5df..94373c9422 100644
+index 23d108d5df..b037734ee3 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
+@@ -43,7 +43,7 @@ int setrlimit_closest(int resource, const struct rlimit *rlim) {
+             fixed.rlim_max == highest.rlim_max)
+                 return 0;
+ 
+-        log_debug("Failed at setting rlimit " RLIM_FMT " for resource RLIMIT_%s. Will attempt setting value " RLIM_FMT " instead.", rlim->rlim_max, rlimit_to_string(resource), fixed.rlim_max);
++        log_debug("Failed at setting rlimit " RLIM_FMT " for resource RLIMIT_%s. Will attempt setting value " RLIM_FMT " instead.", (uintmax_t)rlim->rlim_max, rlimit_to_string(resource), (uintmax_t)fixed.rlim_max);
+ 
+         if (setrlimit(resource, &fixed) < 0)
+                 return -errno;
 @@ -308,13 +308,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
          if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
                  s = strdup("infinity");
-- 
2.31.1

