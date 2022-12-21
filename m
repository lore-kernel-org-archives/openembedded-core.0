Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D30C4708D
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 17:56:05 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.25613.1671645355992659364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 09:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k+bnuUd6;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id n4so16288637plp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 09:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGEXA0kYgO2n27p2A/FUBOD6AqajVORnk+/7kqBm7Nk=;
        b=k+bnuUd6RWlPwvi9a9Rgv2AqyoDDNvQqNwm/9sDa6uQGQ7BH/nI4We99g22VDlxHuL
         rQQCp1LDRLU0jyR2v6KpZ5eTcAhb4iUcL83Fs85hdg+1M5fS8Gv/+p9hGPY9w6GFJ5mr
         tpzkV97Q/YwOnC+Rr7O87BEaQEcGrLlrEpcbXlAlOv3IQo70mZe2M6YoTGlazqE0k+zF
         KY8mNL6XbjxH98/1yoo32KVmitMAlA/c5N3ls+9M8/Zh7Gya+6MNkPx+x3CCp0Up+8rd
         QXkDcZ47UaPHUCDyqcQfASqTKGQrwNnoZZX1BOQA/E6ot29duYP89oPKy6orHVWpEsJ9
         X9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGEXA0kYgO2n27p2A/FUBOD6AqajVORnk+/7kqBm7Nk=;
        b=HbJcpP4IJkqDTh4bqXq6NoY+OA6TjAEYfy3cof1hUa0SmlJ/fjcDsK40inJnNWOjqp
         1f6dn0GfFe+zeMJP3VXNhDpI4rLoYIBl1bVdruedESBYMUTZzC5wYTZcwN251iWWYsTz
         RSfe7izXRDlRbesh5epI9cBHaG67ts/wBxZUWr8WO1w5qWDsSODfrgK48OlY2sQBbsi7
         MhXHWEqJKDBWAebi7tqyMPK2n0RtzYcMCicxuoyZAOASNZrDZQp2nC10lifcm0N9emus
         Wpzc55W5EVwSMH/+fGFDMxN8OsIlpQ+00fblMaFrzBW+OIuCaNYRgjiUJO+Ui5rH9ypv
         gpvw==
X-Gm-Message-State: AFqh2kpRdZuw8fG4B0s6LeO84sBTB26vxEm7stxRum8IjvzOXtDg0kzf
	QVqpUciuNam1qe3t+Hj7w9/RcmXLusg=
X-Google-Smtp-Source: AMrXdXvIm5YKtZq+SyI8w08dpGOzTTMJA6gdoGtKUnpjKIvLgeUXYZyd9PoIw6cORWWxhI5t4o21VQ==
X-Received: by 2002:a17:90a:194:b0:223:f370:9614 with SMTP id 20-20020a17090a019400b00223f3709614mr3019868pjc.41.1671645354992;
        Wed, 21 Dec 2022 09:55:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id x11-20020a17090a294b00b00225a127b2a2sm1548943pjf.5.2022.12.21.09.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 09:55:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/9] gpgme: Fix with with largefile support
Date: Wed, 21 Dec 2022 09:55:44 -0800
Message-Id: <20221221175551.1940464-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221175551.1940464-1-raj.khem@gmail.com>
References: <20221221175551.1940464-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174927

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ix-io.c-Use-off_t-instead-of-off64_t.patch | 42 +++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.18.0.bb    |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch

diff --git a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
new file mode 100644
index 0000000000..be58c42128
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
@@ -0,0 +1,42 @@
+From be33cf1812b4c2a3ed85fb2532992bfb2b27b3be Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Dec 2022 08:44:13 -0800
+Subject: [PATCH] posix-io.c: Use off_t instead of off64_t
+
+configure.ac checks for largefile support via AC_SYS_LARGEFILE already,
+therefore use off_t and ino_t instead of 64bit variants. Musl e.g. does
+not define them without _LARGEFILE64_SOURCE and error is not seen on
+glibc because _GNU_SOURCE defines _LARGEFILE64_SOURCE
+
+Fixes errors like below on 32-bit musl systems
+
+../../../../../../../../workspace/sources/gpgme/src/posix-io.c:77:3: error: unknown type name 'ino64_t'; did you mean 'int64_t'?
+  ino64_t d_ino;
+  ^~~~~~~
+  int64_t
+                        ^
+../../../../../../../../workspace/sources/gpgme/src/posix-io.c:78:3: error: unknown type name 'off64_t'; did you mean 'off_t'?
+  off64_t d_off;
+  ^~~~~~~
+
+Upstream-Status: Submitted [https://lists.gnupg.org/pipermail/gnupg-devel/2022-December/035222.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/posix-io.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/posix-io.c b/src/posix-io.c
+index 0d0a98b..286a626 100644
+--- a/src/posix-io.c
++++ b/src/posix-io.c
+@@ -74,8 +74,8 @@
+  * define it ourselves.  */
+ struct linux_dirent64
+ {
+-  ino64_t d_ino;
+-  off64_t d_off;
++  ino_t d_ino;
++  off_t d_off;
+   unsigned short d_reclen;
+   unsigned char d_type;
+   char d_name[];
diff --git a/meta/recipes-support/gpgme/gpgme_1.18.0.bb b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
index 40c41876fa..7ff4837d6f 100644
--- a/meta/recipes-support/gpgme/gpgme_1.18.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0007-python-Add-variables-to-tests.patch \
            file://0008-do-not-auto-check-var-PYTHON.patch \
            file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
+           file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch \
            "
 
 SRC_URI[sha256sum] = "361d4eae47ce925dba0ea569af40e7b52c645c4ae2e65e5621bf1b6cdd8b0e9e"
-- 
2.39.0


