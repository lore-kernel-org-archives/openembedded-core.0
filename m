Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.4313.1612602258219788736
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 01:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=akaL6HdM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id o24so163380wmh.5
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 01:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yP/8bN+WP3uOxoW/e79H5rq+x6e6Xs9pUNGiZX5Btzc=;
        b=akaL6HdME3+XGDWO+KwyleOHfi6Qp8DkGVZ2uzdU6wXQHL2IhIN/U1VIgtfUDGbYj+
         NkkK/d1zEGA//Y6P064/H41Os7QuMWhwVo8nM+XC/DeZqZwQApR1ZWr9WwszYIAgBaY3
         kARlvcz/Mo2nGPkW082cPPg55slOPNjnLl8YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yP/8bN+WP3uOxoW/e79H5rq+x6e6Xs9pUNGiZX5Btzc=;
        b=ma86ObSNsg1cKMbIpYBY6K77rD7EcAUfIfzUy8fOibIXRFfVPz1nYPJZwX3keIR8sE
         euFP2qoBr/uUr4X5iX11sQvvYJLeBSbcvb0d/etTqDDqaiQG3WNo/nPxcTPtS/lrtqoS
         D+NfyY4Y8f42GJqnqdVOllC/wrU15+SwBJe3o7RjLkk08Xnal4wFbgh+zLtw/1aefius
         i1s6staGlh+7Auk9ng3v+bXrxQDjQ40JkcvavlmF8jk9OF4DPQq1yUu8dciWA36/E+wd
         amsRpFN2Nfb6oR2kx+xlP+HpBxYY3NHBo4VJDWcYqPUcNnclGfnlFPCTDXhfxO+UXGms
         XPhQ==
X-Gm-Message-State: AOAM533yNfhwj8HCU1xa/OqpzzNUuz5U9HlyOCxXPGKTmpyRpzRy01FF
	F9D+Ev7/tuEQeOfqFpx69vX7XfGOFwqWcg==
X-Google-Smtp-Source: ABdhPJyjEZJgWA9rzIvwcWMqbWOMzUKVrTLseeq7+0svd/c6rf/aATZu3A0KQhPXFI01v4sZTbPYsw==
X-Received: by 2002:a1c:d7:: with SMTP id 206mr6856224wma.68.1612602256609;
        Sat, 06 Feb 2021 01:04:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:be75:a088:9c76:71df])
        by smtp.gmail.com with ESMTPSA id o124sm11332678wmb.5.2021.02.06.01.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 01:04:16 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 02/10] unfs3: fix build with new autoconf
Date: Sat,  6 Feb 2021 09:04:07 +0000
Message-Id: <20210206090415.1707868-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
References: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch | 12 ++++++++++++
 meta/recipes-devtools/unfs3/unfs3_git.bb          |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch

diff --git a/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch b/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch
new file mode 100644
index 00000000000..e0746ad5188
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch
@@ -0,0 +1,12 @@
+diff --git a/Config/exports.l b/Config/exports.l
+index 662603c..7e7c4fc 100644
+--- a/Config/exports.l
++++ b/Config/exports.l
+@@ -50,6 +50,7 @@ OLDNET {IP}"/"{IP}
+ 
+ %option nounput
+ %option noinput
++%option noyywrap
+ 
+ %%
+ 
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index d60cee87c9b..b02369bd0e6 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https \
            file://0001-daemon.c-Libtirpc-porting-fixes.patch \
            file://0001-attr-fix-utime-for-symlink.patch \
            file://0001-Add-listen-action-for-a-tcp-socket.patch \
+           file://no-yywrap.patch \
           "
 SRCREV = "c12a5c69a8d59be6916cbd0e0f41c159f1962425"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>.+)"
-- 
2.27.0

