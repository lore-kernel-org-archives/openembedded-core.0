Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.2849.1614464056932680423
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Feb 2021 14:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CQgq4lzo;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id 201so8665623pfw.5
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 14:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UqHT1cWd5499d06b+fL4Yu8jiFboKJ7XNLXtI2tSEdQ=;
        b=CQgq4lzojDEpf4ave4zEDNq8vRcuIUoYD5A3ofvafSCF+3iWVPU/lkc7//UnhNxvty
         kDQl3k62WzLFT7tb5zZ4t0cR7oGhEbuo0N0K47MDfqwwSPhJbqXFRFaiA6xnpwt97xMM
         CwECNOnPelmIp8JdZ+rWag4T2FsFckGenL1w/xkn9F0mfXepkg1PBbFOZMGTI5r5rUao
         0kjYjYnrW9TtV/b5aWonvNTKZdpsvVtqb7DtfZVVbbVrl3WlmqoWU6eqe4zSf9x7Ocms
         vHR1yUReEBpkfyk2F2fhps+AZAuYCKOVg3wcf7oNYe+XOoFKXcuf6HsooRDvjVAGhqtc
         jqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UqHT1cWd5499d06b+fL4Yu8jiFboKJ7XNLXtI2tSEdQ=;
        b=ZSWR7j0YAcpLuJyhPyUBdOHbvlYGA9W3MJUodOMe4CJuUSd2scvq0BHmnDv/YQzyC/
         9i1t4GHS5Hl7wx9daxfkMy9aoGqP+8AjSlYoieQ/YSKY/WnfusQWXyPOYk2znRi38zEK
         UU2QccmXLJm/KYTxrHYKYu11Lv9LvjVsP4GoPBTYxukpLW7DKfBcId7R7hZ/rTlvqda9
         s0Va/7DeRkEd/a/xSeUaeGDwJxNo4G8vUW2kowJk/v2I0G3S5GYqwJm2KzPTxbIwFqym
         KM5C9MpEZAjU6Q3sl5EfMlW+ylzOYQGErjuTYZofXI2D+Fw6NvoLNhs46dg3pYOZts4d
         +7Sg==
X-Gm-Message-State: AOAM5334m7CE8XkDhUH3Vg6zYlilefpyVmx1yymtQMx5ybrYCbDTu55d
	C/dhOx9vA0okjxd+hkXzPCoybs9+xtJKkQ==
X-Google-Smtp-Source: ABdhPJzi84rYoKw5MB4ninz8quazGxK63Qe8iXTan5BWUgAGOfYe1BAylYaaXljrcx5milU4X0K5LA==
X-Received: by 2002:a63:d304:: with SMTP id b4mr8062268pgg.299.1614464055928;
        Sat, 27 Feb 2021 14:14:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id j5sm12188811pgl.55.2021.02.27.14.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 14:14:15 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] puzzles: Fix stringop-overflow warning
Date: Sat, 27 Feb 2021 14:14:11 -0800
Message-Id: <20210227221412.552759-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc11 is pedantic about it and finds a case where this
maybe used uninitialized

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-map-Fix-stringop-overflow-warning.patch | 42 +++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_git.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch b/meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch
new file mode 100644
index 0000000000..a02d8732ab
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch
@@ -0,0 +1,42 @@
+From 3d78d4cffcdc1242892b6c21c26d1c96938c48d1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Feb 2021 10:02:43 -0800
+Subject: [PATCH] map: Fix stringop-overflow warning
+
+Fixes
+
+../git/map.c: In function 'new_game_desc':
+../git/map.c:1663:23: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
+ 1663 |         ret[retlen++] = ',';
+      |         ~~~~~~~~~~~~~~^~~~~
+../git/./map.c: In function 'new_game_desc':
+../git/./map.c:1663:23: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
+ 1663 |         ret[retlen++] = ',';
+      |         ~~~~~~~~~~~~~~^~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ map.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/map.c b/map.c
+index 412305c..fa0c493 100644
+--- a/map.c
++++ b/map.c
+@@ -1659,8 +1659,10 @@ static char *new_game_desc(const game_params *params, random_state *rs,
+ 	    }
+ 	}
+ 
+-	ret[retlen++] = 'a'-1 + run;
+-	ret[retlen++] = ',';
++	if(ret != NULL) {
++		ret[retlen++] = 'a'-1 + run;
++		ret[retlen++] = ',';
++	}
+ 
+ 	run = 0;
+ 	for (i = 0; i < n; i++) {
+-- 
+2.30.1
+
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 5b65cf8655..ecc2b9844d 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch \
            file://fix-ki-uninitialized.patch \
            file://0001-malloc-Check-for-excessive-values-to-malloc.patch \
+           file://0001-map-Fix-stringop-overflow-warning.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.30.1

