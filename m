Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.522.1588772406019614176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 06:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hLkDuKBW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id y4so2232676wrm.11
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 06:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zP/UvFL/ozIuHttF7vrR2dr2kbQgtakVpWBBVIHgbAU=;
        b=hLkDuKBW5ffk18LbxgB5Jc6FIR5NaxfHzGBalNNddzwmwwJAManuxPOUaPhsWS5htC
         +IwDOsaU/AamPxbncKpRQ8TTOg+CCfRh/uTF09ZjfO1b8EjPo5UNKrvaZfs/P1Ym0HyD
         LTOPtarP8sQHc7tg3S/plIsmGx/K+8FgKoo4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zP/UvFL/ozIuHttF7vrR2dr2kbQgtakVpWBBVIHgbAU=;
        b=LrWaaEnJm5Imtpj+Y/sG8lorEYK53gio+2FbKF/6woCZEh0e9tP05U4G4JEsuJgYuf
         ogBDYYeT7e8xmidRBxnsIpUjgK3knuF2U8YbfE8dU1SNsznBcK07EuWvr5oz6rxBOMlP
         UsaDK9GgUg/yJR+h2fNt6a+aqfIToCf2cb/+R1OZQjWeToMwkfOjHZiB0l00GTxEKl5r
         3hcY+rAGKUlvxhVy1cooNNZ6w/+9rWYOelIYqWO0ed0Ahy6kb1IpveknShTjn1NS5aDW
         m3yTZ0yeRiiG+a2dKQbAKhLSn14zbfF8YfGEMLgW50J20n6dAxdAyj5e6miubVgn/KTC
         Y9nA==
X-Gm-Message-State: AGi0PuYIPc51hkZQMFiLLE3ofKk4+Vp/abbJ87/IbwoAG9ZNKIV/8sG+
	tIgd9KpZ5+BfGARVkRLoe1ErxnhRrDY=
X-Google-Smtp-Source: APiQypKkzrNbRYLU2c3HtFMrCQXDwtwJuSp9BE0+2aOWTvt87p3SNiXXtI99JsLJ3SfLdffda4QTXg==
X-Received: by 2002:adf:e802:: with SMTP id o2mr7911173wrm.110.1588772403977;
        Wed, 06 May 2020 06:40:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 60sm3059691wrr.7.2020.05.06.06.40.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 06:40:03 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: Promote warnings into errors
Date: Wed,  6 May 2020 14:40:02 +0100
Message-Id: <20200506134002.155500-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are several warnings the build can emit which show real problems
in the way recipes are being built. Some distros like poky and the Yocto
Project autobuilder have been fixing the issues these show for some time.

OE-Core has therefore been clean of these errors and warnings for some time.
Promote warnings into errors to match the defaults in poky to encourage
people to fix these real issue and reduce confusion when people switch
distros or customise.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 7fc8f33a982..8b19f445f9b 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -22,11 +22,9 @@ QA_SANE = "True"
 
 # Elect whether a given type of error is a warning or error, they may
 # have been set by other files.
-WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
-            textrel already-stripped incompatible-license files-invalid \
-            installed-vs-shipped compile-host-path install-host-path \
-            pn-overrides infodir build-deps src-uri-bad \
-            unknown-configure-option symlink-to-sysroot multilib \
+WARN_QA ?= " libdir xorg-driver-abi \
+            textrel incompatible-license files-invalid \
+            infodir build-deps src-uri-bad symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
             mime mime-xdg \
             "
@@ -36,6 +34,9 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             version-going-backwards expanded-d invalid-chars \
             license-checksum dev-elf file-rdeps configure-unsafe \
             configure-gettext perllocalpod shebang-size \
+            already-stripped installed-vs-shipped ldflags compile-host-path \
+            install-host-path pn-overrides unknown-configure-option \
+            useless-rpaths rpaths staticdev \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA_append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
-- 
2.25.1

