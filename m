Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C340DC54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 04:04:13 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.37692.1674619449963821060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 20:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kc6xqFUw;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id b10so17255849pjo.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 20:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cznSmPewr0FbPSLLCw25xN9+AwTyVBqApRGBcJBmWOM=;
        b=kc6xqFUwSO0472vTKUw1VkaIg7dFz7/89FOqcM6/M105dfXvC3B6h55b/hHaSn2vL+
         zbN/+kXrfiy2rA+Rzphh8X5on00ounmvM6/IwwC1pTAgS+PVuEFGP1Ws0JYz0i23sYJz
         DNmrruyMATd1TFJ5kHPbfgwUQV2bJqPRywtK0zNc6+i5DL0Roo8mq+nP+805B7b8iFOo
         wV9gcPQslSMC+o+P6oU420S7gYg8IeeyitMsjrlNUArleDu0TBJ8MMhrEAZ2zeSr4xOo
         3/VJ/1QTFL2M49hCUSq68U1DzfJGS4pUK5tZ/zYvIPhxpVkJqBfe5VG1PMhjY9y9F1dS
         c5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cznSmPewr0FbPSLLCw25xN9+AwTyVBqApRGBcJBmWOM=;
        b=ZMEKcb3cR2fMZKEsCqn/8zpYx/ZsrtKm7eUnM/LTCTqyTb2B9WAjSXnjuVTV7hclo1
         pmE4Bai0elAaIHsb654S2AGvlYJQ7PLlLHIGdTUM4doQssO0cwl1bcFAFC8DTRlDaZKw
         //aYmQGa4s7agJXjPrA+RkDczNF6VvsHSD0eK4Uj40Uk3Xh9L8XYoDsxJk8L/MqGnsCg
         RVLla5rq7hhl8AFtBhoMeZZoqdDvzdVl7z+81R5HfDg6aCAB2IKs/9UJ4xvhH38ZsR0Z
         6g1sWmYhkJeLKdxAH6N2CaBIhXIdTkUItTnUfGk5WQ+j7JrrDjibJDOb2xDwxxLJmAWN
         QIIg==
X-Gm-Message-State: AFqh2kq+gvOyNy5RWB5N5mOOOElKc8eliRN1aKjmqQf8gbzyaem/miAh
	n2afXU9zS2N03xOkPjZ1IEzOZPahmODRiw==
X-Google-Smtp-Source: AMrXdXsM9te22G9+Ol0ZLI39mnS3WEGhkI2pXxQYtY+455F8nwgNvAMJIBjJhd2zNRuoz4G1JIXw5g==
X-Received: by 2002:a17:903:2785:b0:194:b2ab:efd9 with SMTP id jw5-20020a170903278500b00194b2abefd9mr27910790plb.53.1674619448784;
        Tue, 24 Jan 2023 20:04:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id y13-20020a170902ed4d00b001947222676csm2462714plb.249.2023.01.24.20.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 20:04:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] systemd: Add another fix for using XSI strerror_r
Date: Tue, 24 Jan 2023 20:03:56 -0800
Message-Id: <20230125040358.3573537-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 04:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176338

This makes systemd continue to work on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...util-Make-STRERROR-portable-for-musl.patch | 42 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_252.4.bb    |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-errno-util-Make-STRERROR-portable-for-musl.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-errno-util-Make-STRERROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0001-errno-util-Make-STRERROR-portable-for-musl.patch
new file mode 100644
index 0000000000..2fb8985ad1
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-errno-util-Make-STRERROR-portable-for-musl.patch
@@ -0,0 +1,42 @@
+From f66b5c802ce0a3310f5580cfc1b02446f8087568 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Jan 2023 23:39:46 -0800
+Subject: [PATCH] errno-util: Make STRERROR portable for musl
+
+Sadly, systemd has decided to use yet another GNU extention in a macro
+lets make this such that we can use XSI compliant strerror_r() for
+non-glibc hosts
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/errno-util.h | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/basic/errno-util.h b/src/basic/errno-util.h
+index 091f99c590..eb5c1f9961 100644
+--- a/src/basic/errno-util.h
++++ b/src/basic/errno-util.h
+@@ -14,8 +14,16 @@
+  * https://stackoverflow.com/questions/34880638/compound-literal-lifetime-and-if-blocks
+  *
+  * Note that we use the GNU variant of strerror_r() here. */
+-#define STRERROR(errnum) strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_BUF_LEN)
+-
++static inline const char * STRERROR(int errnum);
++
++static inline const char * STRERROR(int errnum) {
++#ifdef __GLIBC__
++        return strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_BUF_LEN);
++#else
++        static __thread char buf[ERRNO_BUF_LEN];
++        return strerror_r(abs(errnum), buf, ERRNO_BUF_LEN) ? "unknown error" : buf;
++#endif
++}
+ /* A helper to print an error message or message for functions that return 0 on EOF.
+  * Note that we can't use ({ … }) to define a temporary variable, so errnum is
+  * evaluated twice. */
+-- 
+2.39.1
+
diff --git a/meta/recipes-core/systemd/systemd_252.4.bb b/meta/recipes-core/systemd/systemd_252.4.bb
index d291a2a9a1..e6c873f53b 100644
--- a/meta/recipes-core/systemd/systemd_252.4.bb
+++ b/meta/recipes-core/systemd/systemd_252.4.bb
@@ -50,6 +50,7 @@ SRC_URI_MUSL = "\
                file://0002-Add-sys-stat.h-for-S_IFDIR.patch \
                file://0001-Adjust-for-musl-headers.patch \
                file://0001-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch \
+               file://0001-errno-util-Make-STRERROR-portable-for-musl.patch \
                "
 
 PAM_PLUGINS = " \
-- 
2.39.1


