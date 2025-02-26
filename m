Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8164CC021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 12:20:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.4729.1740572441494727054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 04:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CUwl8KH0;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4399ca9d338so41588945e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 04:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740572440; x=1741177240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCPsgO5iiFyJZup0MDCsSx5hRhP/43bWRZ1vZwvgFXA=;
        b=CUwl8KH08zq+f/D2kdt3+mEo6LH4PGLFSOKD77ZRTggF8mP8YHRz6hvpkoWUTHPV8A
         NCx8mcuD38w/PhwNqIxj0vhaegzK4Btr443FyIJf8+eB3FJibw3T0n1e7eNoR/JHncuP
         gpcaKdQL8rk4NXluKm7lQm3/xKq+5oLFt2Kvo7W/JHTQvY/EnjnkWJ4Qx7i5ddmL9GDx
         AU40tm2GWEnM7s5icH+KazNPcfkG134YclqHn1pMUTrY/S84bL4yY2XfZpX1u42Eg8tD
         YG94IcO+x3GaBtTLG6TRIpvLa2aFGJOfzeacnaBe6QQMbCiAzWrRFH3Ok/ZL5Hi/sAZw
         1TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740572440; x=1741177240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCPsgO5iiFyJZup0MDCsSx5hRhP/43bWRZ1vZwvgFXA=;
        b=cgDYBPoMYB5eFSEHdMObxl6vtiXHLpdVGbpQbDZ+n3Lbf2kwyRUYal0jrbCC14mFAo
         c7h19StD7JjU5j9MqPHaMjT4i6zG5BVb1WXswK+na19HoFjXGr/gst2YTLnek1kHDGKM
         zPpm5vw4Osx7hhjGHbd80M9WP+o8ClQ+B5XiExJES24Cife6lAv48RdXy7oDBRocOQ+3
         UCcf6lxzk9MF/ky5WxQhwprbWIOvuAjtGo9LBVcwQ2U2kpXg8ugSSdf7++UqOqGpHtZ9
         Omc9dUaUk4N1tOHKzn7y5dJ4wj/HQGcqvOt0zRQstNHbyuyDLQQFBnfDrWBswsOzik9e
         daqg==
X-Gm-Message-State: AOJu0YwtkI8QXGJwO+o4PzbGS6IA0vDNV4p5LM6e7+Jc3Bo6M/DfPusS
	q3F13z1Q8cS31osL1ZBrE6W7fGpjUCuTZ19P7IOWzEvnmFZuJ0m2C7IaEw==
X-Gm-Gg: ASbGncvLuHcu6ZJNTgEGbjXLL7O+qQTZHTof06TZXCbCD3o5APP9kvlJxN4+GdlBcDi
	4vYGmz5XCIIgGgq6pc7h6BswjRk+2yqlHKVEZHhKgjOnp6uQh3EX+Wg2ldfjIV4/5KP9uJ/DlBw
	vANtSWeuV7ZY5KqeGq5VLTitHud+nJGdnNFyWAoHsI0AyQ4knvcKuV/gzKQOlaoaMzeKqU/6B0b
	bPRT4w/u+OWx2LohS4jV+YJOlSea0Z1huiGO98oioYcAYwHKpP79cYaGf2itIOU48EFcHbzrUHZ
	vsWTMHUA5susW2XFmbOcrq9q3LkTgqq3L8w75ApqKr6elDSCz8XEL3MX
X-Google-Smtp-Source: AGHT+IFp2CiMh5TtVuY00Yrc2CJ6kpfYWUv4IbLppQeGo15nJx35CJXIKevBsqbGQwifJ9oyW1kvWg==
X-Received: by 2002:a05:600c:1914:b0:439:98ef:5d6 with SMTP id 5b1f17b1804b1-43ab0f6de5bmr55376355e9.22.1740572439367;
        Wed, 26 Feb 2025 04:20:39 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5871f4sm19795115e9.39.2025.02.26.04.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 04:20:38 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2] rpm-sequoia-crypto-policy: clean up dependencies
Date: Wed, 26 Feb 2025 13:20:33 +0100
Message-ID: <20250226122033.2547511-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 12:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211955

Rely on host-provided coreutils and make.

openssl-native is not needed either, as the build scripts
use crypto functionality via python.

Python 3.11+ is needed by the python build scripts, which is
ensured by "inherit python3native".

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 098881e3da..f66cb56468 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -5,8 +5,7 @@ LICENSE = "LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-DEPENDS = "coreutils-native openssl-native make-native"
-
+# Python 3.11+ is needed to build fedora-crypto-policies
 inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
-- 
2.48.1


