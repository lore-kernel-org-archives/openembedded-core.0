Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D90E77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 14:47:55 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.12567.1733928474007704905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 06:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fFSERBMn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-725f4025e25so2761684b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 06:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733928473; x=1734533273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uiuRkYLn5G2/Z4BSKES3ES/jaggfFFis7eUvK8YZhz0=;
        b=fFSERBMnxfYCcHFJuZCvlS8SIdl5tqNRKlFgjN8JNfmIp6iQ7tW/y/rEC8lbVezBlp
         qFskk5hJANP96OJna/1bBjXSJ9wPVfxssXuw1E+EaKb2F51NQnvWZ1XFN1fYmiS2z83Y
         ztC/5TjTbluu6WdF3W1nEVyqeRrjrQJuF9t/fuvzEyTWvYLxDwD4b4ZlLsPqyxa32zn+
         3APjMh/h8q6qOyILCxPbyfCwARFz5EwDkEr6YkWr38WqhEER5XnJilBfqBN8NFZyfj43
         o60HnTPSms6CBT9Crwnlu+XCBZTIj335UZlvtJzhyAZvESINcC5uXdx80EuM+rxVSObs
         hnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928473; x=1734533273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiuRkYLn5G2/Z4BSKES3ES/jaggfFFis7eUvK8YZhz0=;
        b=QEZVJkN6bhsT0FWZLYKL1l/QDQHOz6mYGrqEeFKS3e5Uy6Rt5H0XUb1F+ggw938yqo
         I1XmfaXBtjL18iv+r6x1dImU5zA+bg9+R032/eEf31GY6toJ4xkQY5t9sLYaCHXVSXvW
         VeT+j5Q2l6nUjBiu0cWZ2cbJFR6iI7KUkVHBMeg2XrKND3rZiyoBma8MkhJCVyL987f4
         jUk6VoFKL7bX/7K2m7+52HvJRvrBQ6iL5M3kXFlDzkomwqmpeB2mrdky/6gLSip7R4Ya
         4Jmi1yHvOXyyF7BCWCxPu7/j79ng07QIMTxw0hZvh1PTRKz79ZrjfS3Qr5R98CotXvih
         22UA==
X-Gm-Message-State: AOJu0YyWFQq7+Fgy9FlGbnIv7EAAMP2thLy2p7ILKIKBkRQ8zO//cKwu
	WIlip/i8UGwP1v4XwdvKTIVcaZODrZaOMYLFnotQhDkYFN2LNC8i7hw27vM5b2rNguGbNdta0im
	X
X-Gm-Gg: ASbGncuVNx2tngsMtc+6VfBJ16+J+19ITT10vga0N0gP70zhQbLL27JR+2nMTm2OzDQ
	EYtcQ2I+7DybY6D0a0iTtpHLOz8pkpWKeXJCQNqVZp6ohMLvelkKMDmJzR0+Ccz2gQAiaBywM8j
	NLTOlxwsYq3hxBFbBhkW61UHiZ//DFxnkAmYSJa3lcZI4P8/zLAmg8YPIEIuZ7Kn3JSZscvM0FK
	+bPQ8FbBSECG5u3lLGxr5BPYMg+HyDFYz5B85d2E7w=
X-Google-Smtp-Source: AGHT+IGyw+ITDi40jntgW+4EmfDOk/E7Y6sXVsEqIQuespJLjjtcSRphKsHAvpL6KN6vCHTIyTuQ0A==
X-Received: by 2002:a05:6a20:1590:b0:1e0:d45d:645f with SMTP id adf61e73a8af0-1e1c13ce076mr5881934637.39.1733928473286;
        Wed, 11 Dec 2024 06:47:53 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd3891dc95sm7494377a12.42.2024.12.11.06.47.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:47:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] dbus: disable assertions and enable only modular tests
Date: Wed, 11 Dec 2024 06:47:37 -0800
Message-Id: <b132b817f5931b290e5348dd4a17fbfdc5c6e2c4.1733928291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733928291.git.steve@sakoman.com>
References: <cover.1733928291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 14:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208592

From: Alexander Kanavin <alex.kanavin@gmail.com>

There was a report that enabling assertions and all tests results in
notices in log.do_configure:

NOTE: building with unit tests increases the size of the installed library and renders it insecure.
NOTE: building with assertions increases library size and decreases performance.

This was overlooked when dbus and dbus-tests recipes were merged;
enabling all tests and assertions still requires a special, separate
build of dbus. If those tests are useful this could be revisited.
Until then, we should use productions settings for the main recipe.

Buildhistory-diff:
packages/core2-64-poky-linux/dbus/dbus-dbg: PKGSIZE changed from 9958176 to 8627824 (-13%)
packages/core2-64-poky-linux/dbus/dbus-lib: PKGSIZE changed from 544347 to 346339 (-36%)
packages/core2-64-poky-linux/dbus/dbus-ptest: PKGSIZE changed from 3524983 to 3116951 (-12%)
packages/core2-64-poky-linux/dbus/dbus-ptest: FILELIST: removed "/usr/share/installed-tests/dbus/test-dbus-launch-eval.sh_with_config.test /usr/share/installed-tests/dbus/test-counter_with_config.test /usr/libexec/installed-tests/dbus/test-dbus-launch-eval.sh /usr/libexec/installed-tests/dbus/test-dbus-launch-x11.sh /usr/share/installed-tests/dbus/test-counter.test /usr/libexec/installed-tests/dbus/test-counter /usr/share/installed-tests/dbus/test-dbus-launch-x11.sh.test /usr/share/installed-tests/dbus/test-dbus-launch-x11.sh_with_config.test /usr/share/installed-tests/dbus/test-dbus-launch-eval.sh.test"
packages/core2-64-poky-linux/dbus/dbus: PKGSIZE changed from 510939 to 350331 (-31%)

(From OE-Core rev: 054ce01ae84eb10e055a41ec8dd85ebce9ea23c8)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/dbus_1.14.8.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.8.bb b/meta/recipes-core/dbus/dbus_1.14.8.bb
index f03e5c2d2e..6f4d8ae92e 100644
--- a/meta/recipes-core/dbus/dbus_1.14.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.8.bb
@@ -22,9 +22,8 @@ EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
                 --enable-largefile \
                 --with-system-socket=/run/dbus/system_bus_socket \
-                --enable-tests \
+                --enable-modular-tests \
                 --enable-checks \
-                --enable-asserts \
                 --runstatedir=/run \
                 "
 EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
-- 
2.34.1


