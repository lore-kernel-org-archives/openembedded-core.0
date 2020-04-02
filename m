Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.305.1585842486691584513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 08:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ArFVwIsx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id f6so4207060wmj.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ITjBVoGQRmPgSBq7iV791bVihvY8FsqBdjbtstpGE4=;
        b=ArFVwIsxaTX1e7PKD6XnjCLR4+hjJAmlszMsPxGikCt846c2WMm+dd7xqzOhSSKDQa
         izIIJsgydP46eutRR+3SnaINebY6iP8L3wwS+EG1ncv46WW58Ax0y8jdRoS0+3NEebmD
         MoaZIp7CeMPlUD0jUCR6vBpDH31n2+eq+MaS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ITjBVoGQRmPgSBq7iV791bVihvY8FsqBdjbtstpGE4=;
        b=Oa+0uhuiO6bAr8bnaLS8ZNcAQHrJjazVYASDbrUoFxJmp3bHeRdDpsBjAa/VWxN1B0
         H0csc6wUzM5gPAWgZ/faMJnYTbkZfdGScc+u7ZCvFXCs9YwX964NZxVqSF735+5W/NRW
         4ZSjJI88N/76oasgeV994Xw3I4TvcgM3P7SI2bvwznsFzZZx1EG+DHK6IahpfYgP8VqZ
         TFcWNZDwnM0bZHqwvTJxEkV8ggercbBT8djk5kjpv5qSre5ANhbRmp0Bkdq14zGVwt9g
         ESaDf4skexnhpi4bVzo1OqAQpQSdTDGuk6okLrdWOoVBHEYKIYJ4rs1+u9BUf/Cl3gCT
         G+Ng==
X-Gm-Message-State: AGi0PuZ2rJX0Cr2YCU8fyOb12B4yO20lq9dvnJhuRFjw2wV99I/3lQ1u
	sZwxDxWrI6uy+BW1ZNRwpYXITFQk+5s=
X-Google-Smtp-Source: APiQypJyQ/UWr9hB3xEHtdaEltGmRrVyfozKrfAG7WJ5uJsgzTN7enm/JRQ7dlM42Wfk1YjWjePGdQ==
X-Received: by 2002:a1c:6385:: with SMTP id x127mr3936223wmb.141.1585842484731;
        Thu, 02 Apr 2020 08:48:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b203sm7726001wmc.45.2020.04.02.08.48.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 08:48:03 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Require gcc 5.0 minimum version
Date: Thu,  2 Apr 2020 16:48:02 +0100
Message-Id: <20200402154802.135316-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After polling various develoeprs, its clear that many layers are struggling
with gcc 4.8 and its better for the project to adopt 5.0 as a minimum
version at this point in time. We should have technology like
buildtools-extended-tarball available to ensure things still work on Centos 7
and Debian 8.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 88888e814a4..edd2df26263 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -521,7 +521,7 @@ def check_wsl(d):
             return "OpenEmbedded doesn't work under WSL at this time, sorry"
     return None
 
-# Require at least gcc version 4.8.
+# Require at least gcc version 5.0.
 #
 # This can be fixed on CentOS-7 with devtoolset-6+
 # https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
@@ -535,8 +535,8 @@ def check_gcc_version(sanity_data):
     
     build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
     if build_cc.strip() == "gcc":
-        if LooseVersion(version) < LooseVersion("4.8"):
-            return "Your version of gcc is older than 4.8 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
+        if LooseVersion(version) < LooseVersion("5.0"):
+            return "Your version of gcc is older than 5.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
     return None
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
-- 
2.25.1

