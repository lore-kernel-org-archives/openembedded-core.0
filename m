Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48ADDC2D0D0
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.16256.1718787607556997865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HIspLELb;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52c525257feso7981167e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787606; x=1719392406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLWA+haYajaP6sVHea9pPaz6VlgIhjGjglLtqsE8Tvw=;
        b=HIspLELbEFmF0ZKaJYnlb9sz4nXF9q9TbCJVVt4yHAfil6FB6T0Y28tXf0EYVbAx/Y
         zwGUbAkWrTOhmf8IXoFj+CU/6ikZh6GZMsCEk7MVRnxk+GX9xsGzIGRAkV8/E6r1snQI
         vNsIPx9UIH1QeWQOf6egx52WBWkFv6wSfOKfpffRoWWi5hk3hjVQwA/AZAwv7d0Ohhxq
         dTfZgB53RP5NRhoacQlF4LkHPYw7qYr2EXDZ3l/J50B9UuNfbU9ILqidqbAcioTkj+qj
         nO/1MDVJ/umuQyFBhTGv7SpJj3JdNgOY1UkH2Ue8tGaYQPen78f67Jv6irzxI1bNiTL9
         u1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787606; x=1719392406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLWA+haYajaP6sVHea9pPaz6VlgIhjGjglLtqsE8Tvw=;
        b=ROi+4O41Y/3xmZgFNaBrt3WT8x+6bxfY35y4n9d6dfESUZBQ0EZnUm+gi2L7eooR7S
         QK5CvdVU3T9mG3CYUsKO2fkqAT1NcoDk1mxeWyy56ZJf4tAqyMLVlrqyBbqC0FuuPsXn
         5Q5SJZ4XqngL5+BjXRlz5YkFk19wAWXuhifdli+6XTlaljBGDBrczL3tDfEKuYqd40pd
         OiqjEThRz1YpXQW5ECMZh1p9LAzbUQZB5QvmpzLrVT8wUaUlrZLYSGTYi6vJVGjXodwN
         /wDeNkJfjO7FWsAVQURvuIY57WXMjZ8D48x25bNXteFwIQUXt+mocV2E1uaQAOdQtOF0
         XPiA==
X-Gm-Message-State: AOJu0YwDQ0vfvldvSOehEq0XtURvdoCaU2fYNiyMRzNQDoZaqmENTSXF
	mNZahWNQ9Rli3XsqrPJuN1qSAb+fEU/ULE6pIIFxfcAuO5eSezHuF7mAFw==
X-Google-Smtp-Source: AGHT+IFPuhhE3U/TelfFxWKVocA/USP5kf5rGwlY88Xqc+kkvozG4tsWJxXGEutpo1PeLuoNwLQoVA==
X-Received: by 2002:a05:6512:3d0e:b0:52c:cda0:18bf with SMTP id 2adb3069b0e04-52ccda019d6mr377362e87.4.1718787605511;
        Wed, 19 Jun 2024 02:00:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/15] openssh: drop add-test-support-for-busybox.patch
Date: Wed, 19 Jun 2024 10:59:50 +0200
Message-Id: <20240619085957.2787700-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200894

From: Alexander Kanavin <alex@linutronix.de>

The ptest package is nowadays depending on coreutils
so busybox tweaks are both incomplete and unneeded.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../add-test-support-for-busybox.patch        | 47 -------------------
 .../openssh/openssh_9.7p1.bb                  |  1 -
 2 files changed, 48 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
deleted file mode 100644
index b8402a4dee0..00000000000
--- a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Adjust test cases to work with busybox.
-
-- Replace dd parameter "obs" with "bs".
-- Replace "head -<num>" with "head -n <num>".
-
-Signed-off-by: Maxin B. John <maxin.john@enea.com>
-Upstream-Status: Pending
-
-Index: openssh-7.6p1/regress/cipher-speed.sh
-===================================================================
---- openssh-7.6p1.orig/regress/cipher-speed.sh
-+++ openssh-7.6p1/regress/cipher-speed.sh
-@@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=0; for
- 		printf "%-60s" "$c/$m:"
- 		( ${SSH} -o 'compression no' \
- 			-F $OBJ/ssh_proxy -m $m -c $c somehost \
--			exec sh -c \'"dd of=/dev/null obs=32k"\' \
-+			exec sh -c \'"dd of=/dev/null bs=32k"\' \
- 		< ${DATA} ) 2>&1 | getbytes
- 
- 		if [ $? -ne 0 ]; then
-Index: openssh-7.6p1/regress/transfer.sh
-===================================================================
---- openssh-7.6p1.orig/regress/transfer.sh
-+++ openssh-7.6p1/regress/transfer.sh
-@@ -13,7 +13,7 @@ cmp ${DATA} ${COPY}		|| fail "corrupted
- for s in 10 100 1k 32k 64k 128k 256k; do
- 	trace "dd-size ${s}"
- 	rm -f ${COPY}
--	dd if=$DATA obs=${s} 2> /dev/null | \
-+	dd if=$DATA bs=${s} 2> /dev/null | \
- 		${SSH} -q -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
- 	if [ $? -ne 0 ]; then
- 		fail "ssh cat $DATA failed"
-Index: openssh-7.6p1/regress/key-options.sh
-===================================================================
---- openssh-7.6p1.orig/regress/key-options.sh
-+++ openssh-7.6p1/regress/key-options.sh
-@@ -47,7 +47,7 @@ for f in 127.0.0.1 '127.0.0.0\/8'; do
- 	fi
- 
- 	sed 's/.*/from="'"$f"'" &/' $origkeys >$authkeys
--	from=`head -1 $authkeys | cut -f1 -d ' '`
-+	from=`head -n 1 $authkeys | cut -f1 -d ' '`
- 	verbose "key option $from"
- 	r=`${SSH} -q -F $OBJ/ssh_proxy somehost 'echo true'`
- 	if [ "$r" = "true" ]; then
diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
index 82da92f63fc..ab453f7bbeb 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
@@ -24,7 +24,6 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://run-ptest \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
-           file://add-test-support-for-busybox.patch \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
            "
-- 
2.39.2


