Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B1AC54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 19:10:41 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.2049.1709838636772429951
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 11:10:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZRkh5ZNS;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dd41ed9b74so41125ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 11:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709838636; x=1710443436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFQNmk6tIDg+GG7o1RuwewRG69NNdIwObJnjz4nvAfA=;
        b=ZRkh5ZNSj+0UI0imC63KdrTcbJce4lsN6jocU2c9dNRLZ1ILXZhBIfkYACljlJ+z/S
         yYUvbK6L1oM3E1YLv2m42l2lyRPPiUPRdZ+DKmf3PB7FckKUJDWcWty9sMPCaO3dvwn2
         aiba3/M/GraT1LaslHPxIU1oID/si2hB6RuZCRTrlrKgXPvvxrCaPEnhb7VcUDt4U0Q+
         uU65aISE5BgcizpDtG4UcWBhe5pp/l5kLVKlW+5wqlXSHmYDQWqA+o0PMvpQ0eUrV37l
         ILKgP9+P8aX0nUybF1NirPb5JB50XhmdH/rJNbMVfX7vNGKlyMPdNmE3fQ35AbBn+lCV
         jE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709838636; x=1710443436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFQNmk6tIDg+GG7o1RuwewRG69NNdIwObJnjz4nvAfA=;
        b=Kz5jYpevjTJ3HMKAqeHxe9dO66dU7YJFKAWvz0LbSwj0VwzJiNSSzZifZRxaj1S1Lh
         S8VHCHxMkztGPpnutOmQe7B2SRnDPEv1Np912eM4QUrzZ5g/GeZwFuIpfLWun1Qp/yPu
         TmijQIeR0eZjxLrpMGxqj7MXrAPhs80RBHfLtcFgIHHbTYFVRSFLiBP7JWO1SKVqa/ug
         kk1avq5PUNZ1HK2xS8TYSCyRrCz1abUbM7Fs5Te+GUNztpIbQlGMQfj5nQiHTELmOWOd
         jEwJYKLink5fcU+WryuGtx5eM4W4YMF/EGbdKgrkNqZRQnDTFDzGNdngO1nvxxwtjiVa
         Dwfw==
X-Gm-Message-State: AOJu0YyYWQzP2gYnFPaKGV4pJnaf9ioCcSSMJFrKy1/8//aaC+t3HSiE
	Y2It1SH1PLVMIKOT2k3qBNHcI4wvWe7mdKjAZ7J/1HYhdJ1ueURtPWk6vO2+
X-Google-Smtp-Source: AGHT+IFSgXwM4z5FsB0PoxGTCUy9Vj9eEaFCKki4xop4csl0rHh6ljT3f6YuYNJdwPHRArC9Jk3dEw==
X-Received: by 2002:a17:902:6844:b0:1dd:4bc3:884c with SMTP id f4-20020a170902684400b001dd4bc3884cmr2687225pln.65.1709838635821;
        Thu, 07 Mar 2024 11:10:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::682a])
        by smtp.gmail.com with ESMTPSA id k1-20020a170902c40100b001dbb6fef41fsm2066947plk.257.2024.03.07.11.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:10:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Changqing Li <changqing.li@windriver.com>
Subject: [PATCH] systemd: Check for directory before chmod'ing it
Date: Thu,  7 Mar 2024 11:10:31 -0800
Message-ID: <20240307191031.1556652-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 19:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196818

da9db878a15 systemd: fix dead link /var/log/README
add -Dcreate-log-dirs=false which means journal dir
will not be generated regardless of VOLATILE_LOG_DIR value
if a distro decided to set VOLATILE_LOG_DIR=no this
code path will be executes and the directory being operated
upon wont exist ending in do_install errors

chown: cannot access '/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/systemd/255.4/image/var/log/journal': No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd_255.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.4.bb
index d59ca30c12f..bcef3e6b7ac 100644
--- a/meta/recipes-core/systemd/systemd_255.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.4.bb
@@ -306,7 +306,7 @@ do_install() {
 		# /var/log is typically a symbolic link to inside /var/volatile,
 		# which is expected to be empty.
 		rm -rf ${D}${localstatedir}/log
-	else
+	elif [ -e ${D}${localstatedir}/log/journal ]; then
 		chown root:systemd-journal ${D}${localstatedir}/log/journal
 
 		# journal-remote creates this at start
-- 
2.44.0


