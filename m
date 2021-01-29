Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.7466.1611915869316597984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dUaxP5Ek;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f48.google.com with SMTP id a14so9957491edu.7
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=j6NXTQUCdTDeZzc8RXmU0cntdRdsG78K4NuvlIFDzlk=;
        b=dUaxP5EknK2C6ZCpmJYfgkxbrvumTP8eCP7gB0CzwfKavO2QDAsmPbKRp6xAX1xgXn
         weHHZ+sW5bR19KY2TD3O+HD9LQys0J+sP1wHL+KUcK+i09OgIlUyno6jBmYG5LZ1eqAV
         Sn8nX3wJFKnGAahhque4qDkcVE5tx7WoHcD6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j6NXTQUCdTDeZzc8RXmU0cntdRdsG78K4NuvlIFDzlk=;
        b=BM+tw/WMzqeL6rC4rVxR/xHsshejWQxOBf751kVLt6ELJspuHNXj1uNADzg2YceEKy
         uXI9CkRW2InRtsaBFpHGBQfdLwRFLPUwgh5ZTj2n/AHJpqf7KgY1NN0NEfiB0XBxrhdk
         Qya69QjCxglZmaNq4TI6/PKueElcmgdJqh84/MiGLzlMkSygYWARkNw1UeXqVaaCYfae
         KustbFVZIMmPSrvv35OYWkGmr2oele3XEJP3J+34e9uMmpmBSmxhoVaoUaCV1P6YwwnO
         nGLLn8JlaVRfPHAFj5yNVYzPAQacFDtZN4WpO8hgCCVwYzvzkhnUJyiZHR6Hjc1a54ik
         7CYg==
X-Gm-Message-State: AOAM530D3K2pWUoJtzZHzJtCKZOoRey8vaLWOqir2l/lgPAFcv0JWMgh
	l7rPz4scs+tVquRsoeUOJvsITZ8eenmFSw==
X-Google-Smtp-Source: ABdhPJyrChde9n5IBokNQckAOX+22du7CSYmSP5rDywwT5zxBkC140CNsDUtfjjiJXrcG6FZSFSL6w==
X-Received: by 2002:a05:6402:1c0b:: with SMTP id ck11mr4266138edb.35.1611915867718;
        Fri, 29 Jan 2021 02:24:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:27 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/13] msmtp: Fix to work with autoconf 2.70
Date: Fri, 29 Jan 2021 10:24:18 +0000
Message-Id: <20210129102419.1360572-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the required gettext version macro to work with the new autoconf
version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../msmtp/msmtp/autoconf270.patch               | 17 +++++++++++++++++
 meta/recipes-extended/msmtp/msmtp_1.8.14.bb     |  3 ++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/msmtp/msmtp/autoconf270.patch

diff --git a/meta/recipes-extended/msmtp/msmtp/autoconf270.patch b/meta/recipes-extended/msmtp/msmtp/autoconf270.patch
new file mode 100644
index 00000000000..6efd3d6d7cc
--- /dev/null
+++ b/meta/recipes-extended/msmtp/msmtp/autoconf270.patch
@@ -0,0 +1,17 @@
+Update to add the required gettext version to work with autoconf 2.70
+
+Upstream-Status: Pending
+RP - 2021/1/28
+
+Index: msmtp-1.8.14/configure.ac
+===================================================================
+--- msmtp-1.8.14.orig/configure.ac
++++ msmtp-1.8.14/configure.ac
+@@ -44,6 +44,7 @@ case "${target}" in *-*-mingw*) LIBS="$L
+ 
+ dnl Gettext
+ AM_GNU_GETTEXT([external])
++AM_GNU_GETTEXT_VERSION([0.21])
+ 
+ dnl Headers, functions, and types
+ AC_CHECK_HEADERS([sysexits.h netdb.h arpa/inet.h sys/select.h sys/socket.h sys/wait.h netinet/in.h])
diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.14.bb b/meta/recipes-extended/msmtp/msmtp_1.8.14.bb
index 3bd5f9edeb5..c35c8e7ecc9 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.14.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.14.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
-SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
+SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz \
+           file://autoconf270.patch"
 SRC_URI[sha256sum] = "d56f065d711486e9c234618515a02a48a48dab4051b34f3e108fbecb6fb773b4"
 
 inherit gettext autotools update-alternatives pkgconfig
-- 
2.27.0

