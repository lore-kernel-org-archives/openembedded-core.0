Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.26679.1613945840257559471
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 14:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K5D20koR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id v14so17100349wro.7
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 14:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxVM3ks3h5dfVAN2AwOBsR0It4bJL7fy0+54R83VO+U=;
        b=K5D20koR4p0yxIlNkOWvwHiGyakkCBY0nF+UbRS77bebGmWtnnjokUSjI7wuTnZQwH
         7/s2nHCMj0LwqUst9RK2LXSuwUdIQSk5bGtgrtcL/83aYD6JJqA6+avv04urFy04VEnp
         ECc4sQuuJUR8ypxnoAPjp3fWc1flVwlvSv238=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxVM3ks3h5dfVAN2AwOBsR0It4bJL7fy0+54R83VO+U=;
        b=QX/UC+ab1fC3tMVAdW1K1NRDlg9Sl15tP8FUNYIYFjWDas1FsOzSpDiYqSmhG105Ex
         DMo0/CrM0PRShlcjk86sQrMzXPHbFYNrVrLSh/c3f7qdYXy20DEs5SuU9WPXP+USTrBx
         kXseDtytrBDekakqWO5qYdeyUDZwwP79tMf3ura5GkZCvuLHmZDHFP2GywEYyBSXMx3S
         hUS7CsphDYnDBhOFd7s1hUstbwtvIX9/+JxZnbTMgLNYemmcuAm6HXRZ97Rclo7Vj2E1
         kU9GpUBoXkytEp4TJUr6oXvkQQp2EzTMoorGNlKiYQFtvO+TEFy4CvONbRloXCth2zdY
         VGIw==
X-Gm-Message-State: AOAM532m60wRz9h9ICf3Dld905V3Vvixn3Fsfd2ddXfEoXfOzP7ywKsp
	DnPupCXsY9SbDHCgGKGF3AWHeU7WE0bbSA==
X-Google-Smtp-Source: ABdhPJy5DV2nqii3fWmGf2xRFWFTQz++sapg6KfqxEvVG1T8x+nNmefzMcqjJ32C85f9QBkI9bBKBQ==
X-Received: by 2002:a5d:45d1:: with SMTP id b17mr3166929wrs.160.1613945838457;
        Sun, 21 Feb 2021 14:17:18 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id m4sm10196612wrb.87.2021.02.21.14.17.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 14:17:18 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] rsync: Fix a file sorting determinism issue
Date: Sun, 21 Feb 2021 22:17:11 +0000
Message-Id: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../rsync/files/determism.patch               | 28 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.3.bb    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/determism.patch

diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
new file mode 100644
index 00000000000..53a4ca75058
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -0,0 +1,28 @@
+The Makefile calls awk on a "*.c" glob. The results of this glob are sorted
+but the order depends on the locale settings, particularly whether
+"util.c" and "util2.c" sort before or after each other. In en_US.UTF-8
+they sort one way, in C, they sort the other. The sorting order changes 
+the output binaries. The behaviour also changes dependning on whether
+SHELL (/bin/sh) is dash or bash.
+
+Specify a C locale setting to be deterministic.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: rsync-3.2.3/Makefile.in
+===================================================================
+--- rsync-3.2.3.orig/Makefile.in
++++ rsync-3.2.3/Makefile.in
+@@ -26,6 +26,11 @@ MKDIR_P=@MKDIR_P@
+ VPATH=$(srcdir)
+ SHELL=/bin/sh
+ 
++# We use globbing in commands, need to be deterministic
++unexport LC_ALL
++LC_COLLATE=C
++export LC_COLLATE
++
+ .SUFFIXES:
+ .SUFFIXES: .c .o
+ 
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
index b7205e5bdef..c08f93884f5 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -12,6 +12,7 @@ DEPENDS = "popt"
 SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
            file://makefile-no-rebuild.patch \
+           file://determism.patch \
            "
 
 SRC_URI[sha256sum] = "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e"
-- 
2.27.0

