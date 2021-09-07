Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.242.1631025901983547547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 07:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Fv4mnL7A;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id q11-20020a9d4b0b000000b0051acbdb2869so13075109otf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 07:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nB5hqMLCcet/VVk3M6FLtx1y6B7zNR+hnTQeLoKG6sM=;
        b=Fv4mnL7AxB4AF/gjyMoRm2kM46mb/RWTXzrvrW2aoXlRGtEAeuZ6kxBlzgzkmUFF42
         ZAsF07bPiLSPFm0hC4I10+ueyhLdR1XoqwXgrPTEOcoNK92N8qKaHffFA05v358glPwD
         oIX/eIt7tQPIWi/qz+hbpjQbxgoKvMKke9/ADh6rih9KZsrTvINPD5Tjd6GYZ0T1oxSc
         MotitvYOTx5u31/ISYYqIwJHfKWvJKrIeeYCqwuzKau7kesQy+hhn5eM4oTkFpIR4g0Y
         cvcxISGbTQTW2SzKuy5eK+981TmM5EyRL7/IBo2L+Omll2zW8j4WFQfBzo4QjzpEcuqm
         es9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nB5hqMLCcet/VVk3M6FLtx1y6B7zNR+hnTQeLoKG6sM=;
        b=nKl0/BneKzgEkoz1TNtpYNKNQO81gkHIJaSIMYHwJfSPxwNzY+VWXjEiCk9b12bgTt
         XxxeLJAUdAnB3ROhqAwVdNOAb2PP5CFo+NCKkVj+QtrVWkqsCzm9ZhvDM5zSwg89p0LF
         I1uLsfQp3i/pJ7C9Kwx3LbB8Vb3rwRgmGKfZezfn1o1GR8u+JBPOxKV8NvBDXKABKdux
         J3mR2Be8JiHADQaxEUl+Zgzre5PPRQZUCD0pAbGaoTHcc9e9EUhlytVMVsUHV8leAwaR
         YGQydL3N+t38PqgV7EaPi5862EEBLcAqtm0EhIHTRgqT3tzKx0BA1MVDLy99pkLvUB/S
         7VpQ==
X-Gm-Message-State: AOAM530p7NGpXTiJAux14cKeQDucLhS6kHX/Wb1rBBAf7BsgTWV4pfSA
	sQtx97mfHAirPA3QsnZbT05L8KnJL3WY+8Nx
X-Google-Smtp-Source: ABdhPJzcvO69nsdic1+idMc7Tq/5AaypCvKt2JFZNnePNMvB1eKtRnnktI5Xtax4Ocl6OrNjetaSvw==
X-Received: by 2002:a9d:ecc:: with SMTP id 70mr15879541otj.96.1631025900814;
        Tue, 07 Sep 2021 07:45:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id q22sm1313761oof.14.2021.09.07.07.44.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:45:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/5] default-distrovars.inc: Set BBINCLUDELOGS to empty to disable printing failed task output multiple times
Date: Tue,  7 Sep 2021 04:44:08 -1000
Message-Id: <adea811a51be39eb02dc1c9a5e8e10c31d35edae.1631025627.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631025627.git.steve@sakoman.com>
References: <cover.1631025627.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <Martin.Jansa@gmail.com>

* the output is shown 3 times with default configuration and 5 times when --verbose
  is being used with knotty, there might be other use-cases where we actually need
  this, but until the logging is resolved better, setting this to empty looks like
  more reasonable option (considering that e.g. log.do_compile from chromium-x11
  can be over 50MB long, generating 150MB+ cooker log)

* more details in:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=14542

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ede2e0df7982777212b8c25195d41ce9e57562b5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/default-distrovars.inc | 6 ++++--
 meta/conf/documentation.conf                    | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 433d4b6651..e266d0f312 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -27,8 +27,10 @@ BB_GENERATE_MIRROR_TARBALLS ??= "0"
 
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
index b48cbd4ac0..a6746e863f 100644
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
2.25.1

