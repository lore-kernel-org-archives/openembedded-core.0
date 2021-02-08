Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.35317.1612792378040809579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EH0jk3yl;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id u66so13704980oig.9
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XABP/Xw5iGtdHJeVPZwPXUJq2POkatbTZej7GhFDO0Q=;
        b=EH0jk3yly3OtdxG8OezU24tFfxzTI13bkhcir6WsC2D41tCtyfkViwAvV/9a/nnad/
         jWYbAqFyZXVRITEtXt9bjfIVgy2HGR93MnKBNVDgMKW6qHnucLEc4Dnv/5Ls4lgS647n
         btGbi8/kosHLRlPqus/j/IQqyuWW6fNsXOnbsVL6MS0AJtRV16Q0lXoNf41gmmm0W2uK
         dNYxUnOdwrs7aRqenytQEYckMLHzHt1+Oq5t1v6sBfFjoT/LivE2XkyUoAGIdaBKPPeL
         AErBwYMktYmTgFiFrYO07fYXtBdURTYx6s73cPY6rObfWjnLzV21ZTVw7YRjqoRATJ9f
         GH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XABP/Xw5iGtdHJeVPZwPXUJq2POkatbTZej7GhFDO0Q=;
        b=tkiCQDR2c1SaSCrxCbBqg+nQKZjCTe8/+E1YLYwdkRXkaJByP3Yd4o35ccHtNBDeWF
         rvhhpUZ9Lpb/YUFshdoZTAi9xtqf5G/MQ5iG5gqMe/BZEZboeNFbI5Hgl7LjBHRJoIpV
         7y89LmHRh64F1xACGAzXovlMdbsYo6tMiSREayewB8AEhYKGMp0VLA0eDJZtDelnIEsn
         xLG7dIhCFIdA6aIvNwzUuvp3jpSJxQFQt6J8l/KaN1RoPC0LmeV/IQRHGeIcw5Rnl8s0
         0g5j3DFEiITRzuAtq2FhNehRAj05l5o2BHv2wFV1aLLWfqUgrlKV69smmwq+lUF+FRHW
         wFeQ==
X-Gm-Message-State: AOAM531sym46CjDxctHHQgQtgIIzGOMP6zl/ScVad19cjGzVf5vEnAgQ
	wU0MbPRbd5vKMX76GcU7vM5ya5Yg/t20gOpnMYQ=
X-Google-Smtp-Source: ABdhPJwRyCStTugRVanmx8P7jSUDUS93/Jr1SB9szbv1uL1iTuVj823yevYBHLF3gvWcYliRCqY7Pg==
X-Received: by 2002:a54:4886:: with SMTP id r6mr11436355oic.54.1612792376955;
        Mon, 08 Feb 2021 05:52:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.52.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:52:56 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/28] sanity.bbclass: Check if PSEUDO_IGNORE_PATHS and paths under pseudo control overlap
Date: Mon,  8 Feb 2021 03:51:54 -1000
Message-Id: <89eb75f71b7af278e6cd92f676c1f102367bb42d.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Added a sanity check for when PSEUDO_IGNORE_PATHS and paths under pseudo control overlap to avoid random failures generated.

[YOCTO #14193]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e4bd8cabcdedf4b52345ef5eb421f71d0f19b1d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b678284554..866d066288 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -710,6 +710,16 @@ def check_sanity_version_change(status, d):
         if i and workdir.startswith(i):
             status.addresult("You are building in a path included in PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this path.\n")
 
+    # Check if PSEUDO_IGNORE_PATHS and and paths under pseudo control overlap
+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    pseudo_control_dir = "${D},${PKGD},${PKGDEST},${IMAGEROOTFS},${SDK_OUTPUT}"
+    pseudocontroldir = d.expand(pseudo_control_dir).split(",")
+    for i in pseudoignorepaths:
+        for j in pseudocontroldir:
+            if i and j:
+                if j.startswith(i):
+                    status.addresult("A path included in PSEUDO_IGNORE_PATHS " + str(i) + " and the path " + str(j) + " overlap and this will break pseudo permission and ownership tracking. Please set the path " + str(j) + " to a different directory which does not overlap with pseudo controlled directories. \n")
+
     # Some third-party software apparently relies on chmod etc. being suid root (!!)
     import stat
     suid_check_bins = "chown chmod mknod".split()
-- 
2.25.1

