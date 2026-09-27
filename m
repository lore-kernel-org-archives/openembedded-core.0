Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77323CA5FA3
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 16:46:47 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40583.1790527598178130359
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 09:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HvEIKFXQ;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so18002565e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790527596; x=1791132396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CBMZZ0h4zJ/ihN4JK6d2J5f7klervHnmAsNjllpoDpM=;
        b=HvEIKFXQCAUj5aIjM+L/W0VmA+NoP6EKZyHKr2ezNYB53lGLsacaugDYggcnc9FWJ6
         ar6EftLDq5YfjGLSSBCUwcuLaAkHx4aI9Jmz3ehvAUdIrNTuOQS7rnzYU6Ngw00QlOsz
         z7OQAwXtyAPKDdnBtZOyfQzKrk0qFAUygmrQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527596; x=1791132396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CBMZZ0h4zJ/ihN4JK6d2J5f7klervHnmAsNjllpoDpM=;
        b=tB5sNfzqNq8QbbaRsyq4e0CMbS0vioxE3LVF6dY8wV94G8W513I4p0ZX9CXCxDdqMT
         XUAWHL7CZcSvaYAtvV5fc/Fs72ce0XJeQ+U23emthrm7gCNDkWDoEm7xube69oY8E1WT
         RjXfX4/neXh52VqNyuAXTXcwNKljz7KrsD1Ewq0DhZS2I2b8THkykDcO5nzg33/E665+
         FNVxNws617wsbz7DzD1QUhSEgQAuw2iKesmF4wJH9At4AhAgTsChB1l+Rcbl95hp6NHX
         Zs3adkX7nTMy3WRQ9xSJhlEpeHcROXkM6QdfDqn4jn4FJmTgPcwI6Fg+6bqbpv8GJYmk
         9Wkg==
X-Gm-Message-State: AFuF++m3DcZKp0I92MA7g6dpe7OyCb6nNBCL5wTib4CZIEKXa0qO9Y7E
	Q5AWfGKiD/oZF1tQIrK9dBDq18QS2ndNStvfT9tFtwLSr7fbaUlOeMpwFlF3VqadPtGIEjUnrRl
	FnLh5dTs=
X-Gm-Gg: AYBFou3zJc3YimE/1l6FqpIPNgaY0LveJncouG7TEhTv2tWMLDpjhT7y3xCLnBCUcP0
	Rfws46lw3OD/aBk0et3Ca6iSwwnHuh1PL8ReMvo2L8eEmrn87mjS/25d2Rj7eJqzmpqOFQNkK2Y
	u+Kbr+FZpxkghclSPi8glBwAeJ7kTy5xVRarrJa6kdlXdeHJ82vtjCdzrju52GWWHRR4x4WhlVv
	X3aV8+oM5Vw1GfsiIGlv0dO3tHLol6atvaZuocmVA/Wt3BzdS/0pZsHjBtFo9C6rDiv+6/8pQo2
	abE+LP+iHAt9Zk/jFnRr4+UT+Y4skEL2CehhRIE8HVpFjJYWX+74ZaRMj3qsQVZ2NtKjjP733dl
	GvO0I5DhU3BfYvYl5y0Y5dwuYq11+nIzf8GtNEMmcvWnZpESnXxS5Qlrn0dXDOEM4jbN1HEGc7J
	cV/mshuU51OH2/0IJ4Fa8eQbsci7fI4MtQfcW9y412C9DZFZh/s784sTiVYozgb5+Tl6gh8sBQn
	iF9RyJTadMZQw2ARKpszMKJCZI=
X-Received: by 2002:a05:600d:4445:10b0:4a0:37b:5c25 with SMTP id 5b1f17b1804b1-4a0037b5ccbmr12959205e9.11.1790527596111;
        Sun, 27 Sep 2026 09:46:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6474:fa9a:9a9b:3f85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0029203absm54683365e9.6.2026.09.27.09.46.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:46:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] erofs-utils: Make reproducible for different BUILD_ARCH
Date: Sun, 27 Sep 2026 17:46:24 +0100
Message-ID: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 16:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246691

configure was querying the host's page size. Avoid this and set a value
based on the target insteadl. aarch64 is the only one we commonly build
which isn't 4k as far as I know.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
index 45339656b5b..21e5be73c42 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
@@ -17,6 +17,11 @@ PACKAGECONFIG ??= "lz4 zlib"
 PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
+# Would otherwise query the build system
+BLOCKSIZE = "4096"
+BLOCKSIZE:aarch64 = "16384"
+CACHED_CONFIGUREVARS += "erofs_cv_max_block_size=${BLOCKSIZE}"
+
 EXTRA_OECONF = "${PACKAGECONFIG_CONFARGS} --disable-fuse"
 
 CFLAGS:append:powerpc64le = " -D__SANE_USERSPACE_TYPES__"

