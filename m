Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web08.2552.1615661503894230684
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=r5kDxN1h;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id w125so1840386oib.13
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1bhHzE+UB7JlWKxBrZSZEC9kqk8UxVS1X3PhGiithwQ=;
        b=r5kDxN1htE1A23sgGdwDWuY02m9qeVvSJXeEQjdU4Fz1TbZrtugkXgNBpU46ofDB6o
         vwuBmJ9YTU/H4SszMqkhJjVFEjoXSPKvHpMhmFrOm1L69242uzSxwygY6RdSnC5RGRMe
         buKRvgnzKM/DnlEhYBqT1x5eg9oGn4TkqdWgQEn/V2fNmjSY2rUEf7QdX3If0Qvi/bBI
         pO+Z5r3x/9I6EeFvmj5Wo6Jm0DtK8pEIarT8KKQHDNP30VOjPnziVZ+yiqia4LR7ryEp
         SdPweEqJ6Es5kjyUFlfGntGQpe+EcTeArfEQBpNeBuREFNgPgmZ1UpH5J8tiqQZMCqR8
         q9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1bhHzE+UB7JlWKxBrZSZEC9kqk8UxVS1X3PhGiithwQ=;
        b=MM3/EKrq5arBbtBM7SNBs6b66RFSFkxQ9bbgLPqqm1PKyAlAHd7eYdahD1HyLmusok
         vU9QPHqDvezXYAvm26rJBgdXyeyj8PZum59+j37R6BvYdJ9ymQboHM6X5rO8s0w1lEst
         qzZ9o9wq8yoyw58mKKVLgq6dUOHV5Cj67qObO099qfPFVzOQqSXc57rHar6JFaXMcTZc
         oe0TAFCCsZDfmQf0TKksRf28TrWy89xaSE6bFSzCpAO1NmOGixv2bnHbABvkMQeFcAAC
         7m+LhWQFeWbM5vmTUjGMZDGreH2GKYOQQKdJRscEzq+eCdM61iWwxKGaQf+Iw4jGo7aJ
         gSSw==
X-Gm-Message-State: AOAM531AeB7VQXR82pMC+gLGBHwFt/Q52JRaWVUg5VmO1gjKSIhUHCfq
	9+ED6CClappCeN8/TpAX+mLuWv8M82wK1FGB
X-Google-Smtp-Source: ABdhPJyOe7i8BTWBin5ACMWzIH6USUs3+iT9THeWAGU57E07eGXuCfQdDexxOk8f8e/3B6zRSN9TFw==
X-Received: by 2002:a54:4494:: with SMTP id v20mr14030345oiv.147.1615661502766;
        Sat, 13 Mar 2021 10:51:42 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:42 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/38] libid3tag: Fix reproducibility issue
Date: Sat, 13 Mar 2021 08:49:11 -1000
Message-Id: <d55f1632bbc6f9b7dadc874d68006d4ceb13937c.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Configure was swallowing our cflags meaning the resulting binaries were
not reproducible. Tweak configure not to do that and fix reproducibility.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1395269a6fae5cec01d721e2ad52bd7cb8fc38ce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libid3tag/libid3tag/cflags_filter.patch   | 21 +++++++++++++++++++
 .../libid3tag/libid3tag_0.15.1b.bb            |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch b/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
new file mode 100644
index 0000000000..0d1d0dc381
--- /dev/null
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
@@ -0,0 +1,21 @@
+configure contains CFLAGS filtering code which was removing our prefix-map
+flags. We need those to generate reproducible binaries. Allow them through.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: libid3tag-0.15.1b/configure.ac
+===================================================================
+--- libid3tag-0.15.1b.orig/configure.ac
++++ libid3tag-0.15.1b/configure.ac
+@@ -99,6 +99,10 @@ do
+ 	-mno-cygwin)
+ 	    shift
+ 	    ;;
++	-fmacro-prefix-map*|-fdebug-prefix-map*)
++	    CFLAGS="$CFLAGS $1"
++	    shift
++	    ;;
+ 	-m*)
+ 	    arch="$arch $1"
+ 	    shift
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index 0312a610c0..80581765ac 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
            file://0001-Fix-gperf-3.1-incompatibility.patch \
            file://10_utf16.patch \
            file://unknown-encoding.patch \
+           file://cflags_filter.patch \
            "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mad/files/libid3tag/"
 UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
-- 
2.25.1

