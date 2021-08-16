Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.31602.1629152864780351922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 15:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NpEwhqwj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so886176wml.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 15:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I5bLfM5s3Y8vCHnOVG8hsEFnDDiXZlIm31X6jdlAZC4=;
        b=NpEwhqwjMi1bXTc6Qat7tVi4wET2dyWBdgywHjHEnqW0CsyS+hQ25XHLhAlte9hahY
         AuLfo44KfUCsBc/9pJb3iigm4jk3qBdP8j/kCsQDguTF3JMjyGPNwZne73Bz4UYeUj/u
         ui5EkJpUzTP83OskQuhXTa1UxYqpz7OX/ASn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I5bLfM5s3Y8vCHnOVG8hsEFnDDiXZlIm31X6jdlAZC4=;
        b=tRRwhF25dSLmyPIkFXOlqEjR9VebbNaQyekjXdggmKlzmaHryncmTB9XoGjggPhn06
         m1h5OjtUzMRdH1CtFnxEV4RjIsVUdQoAmcXBvqCyExezz6HSIGkObM8ixfWbBfCnthCh
         yrcCWehkdZYqEKh+rTnoIEybYWxyO+S+pB2sBx9+GIlfyiDet6ZyOqU2LfdaT0Iuzakq
         JD8l+YVs8G8LHtpfxwLiNu1+eGEG8Lf9rOSqLaHVoSR/r4PR1hrzGAuwgycbNahO/Oak
         WSW9UcdDRfsT2TzuXG9cJJP6ayRC9bGmpFne/4lDoi5oHGNmrdALg0A82N3D7wGz5PM7
         b9Yw==
X-Gm-Message-State: AOAM532W4Kua1TLSHXzgpborfQusoJ/bLn9rDGCHtHlEC5dhPRcVkx8Y
	40C8EAmEeXvqHbPY7Jj/mPcpg9G5jv3sug==
X-Google-Smtp-Source: ABdhPJw5/fcbRhDJEreHYexzly0zHju/sZ26wncAaib2vRuW6q1lisKP46eiY9dYpFlteR2Ph2POgg==
X-Received: by 2002:a1c:a7c2:: with SMTP id q185mr331601wme.91.1629152863303;
        Mon, 16 Aug 2021 15:27:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f791:56b8:5572:9d45])
        by smtp.gmail.com with ESMTPSA id p1sm83450wmq.48.2021.08.16.15.27.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 15:27:43 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] package: Fix overrides converion issue with PKGSIZE
Date: Mon, 16 Aug 2021 23:27:42 +0100
Message-Id: <20210816222742.3865259-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210816222742.3865259-1-richard.purdie@linuxfoundation.org>
References: <20210816222742.3865259-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes pkgdata PKGSIZE info after the overrides change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license_image.bbclass | 2 +-
 meta/classes/package.bbclass       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 5cec7a07fa2..5490d121f17 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -87,7 +87,7 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                 # If the package doesn't contain any file, that is, its size is 0, the license
                 # isn't relevant as far as the final image is concerned. So doing license check
                 # doesn't make much sense, skip it.
-                if pkg_dic[pkg]["PKGSIZE_%s" % pkg] == "0":
+                if pkg_dic[pkg]["PKGSIZE:%s" % pkg] == "0":
                     continue
             else:
                 # Image manifest
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fb3c346f692..e17f0c797e3 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1670,7 +1670,7 @@ fi
             for dfile in (d.getVar('FILERDEPENDSFLIST:' + pkg) or "").split():
                 write_if_exists(sf, pkg, 'FILERDEPENDS:' + dfile)
 
-            sf.write('%s_%s: %d\n' % ('PKGSIZE', pkg, total_size))
+            sf.write('%s:%s: %d\n' % ('PKGSIZE', pkg, total_size))
 
         # Symlinks needed for rprovides lookup
         rprov = d.getVar('RPROVIDES:%s' % pkg) or d.getVar('RPROVIDES')
-- 
2.30.2

