Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A29BCD3440
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 18:37:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4865.1762972617112244530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 10:36:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LP8IG9+h;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so1040539f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 10:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762972615; x=1763577415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vMz+/MQ/dS8oFYGbOgLO/AI3dgU9g4HmnCl0ok8k7K0=;
        b=LP8IG9+hahM/Brp+IUNYrT8dKnzvXf1HaQcb7qriw+7oYwhNn4UxtKIO87WIIRUg8V
         L9xopEg9m9fRnrXvxmhm+/vJM7hd0EdRnN9cXwSU33xf4CzxGAAQX1oZhq/2sckX544g
         mmn8DlScKcJo2Bb5aZ6O72n6OAOV8RJGkHyeTnT5XprhZZ3OBOXOThvFKEonoyyUUuT5
         c+zBYeDwPWhxzZMT33wuMchzSpHk4GEd71RPd4ZqZPySaY1uFRplulDncVde/QC0mc9f
         25Kp/uO9jKMBXFhZzmZV1STyyXf81QOpSvLBkkjHrLQDtBNVnbOU+vf1GR7sLWtH41vs
         vB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762972615; x=1763577415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMz+/MQ/dS8oFYGbOgLO/AI3dgU9g4HmnCl0ok8k7K0=;
        b=OjnelUO9e/e/OFybiLEwQVaV0Z043qvGpkR1vx1ssxe/5kVu6ACQspJUloUqnXLMVU
         qX1tFSXwLiQi5hrtQdb8ULNXZeQk6me738ENrsbVeK333j0yezMP+xIu7d7mJnJjmvk8
         +ik5vSRSEFD+0pc6LECifZwjLFYfNd9r5eM0EU3LpPDbQArV3p58jwCYHMXie1sm3VhP
         DK7hjpH07nWDHubKRBmEEP+Q9SguozhjK5jeUtWGPWoog4a1WXPZC/WTB6ZG9ksGB2Qy
         3cRbOnrAmCHSdGLTMiXly1prtr1yI6v3STqQw2ZuKdGgUZRmHalyW0LVzxaIE2PIDZAJ
         Ix6g==
X-Gm-Message-State: AOJu0YyLfkqSOyfa36Pzbv6Mt9EWg9sKLl2kmuX7GPhi6NBQux8k/S/v
	mr1PlAD3U3d1wpd4ghzLYeFkZxSYtY1z60cz6fS8wIMawEKKPyXO4LYLgD1w2VOq
X-Gm-Gg: ASbGncuHeoWXMWaHNnKK36tJBua2xT67iJZVFRTAjQkpYiOtnK2X+7J26p6GxyjsAOZ
	dLFmgkdxBAQoWcAydKGhrgMX+WvgavBZKsrw2UkZlqKdT5oU3epX9Jn4Rxvn7LIQypOglYIANh1
	Pp7CdsP/ImAghNFhAVMezJZhj8X3k73iPWoLhJWZuJSXJX9OoUgkQDhOkCyb3kiCb35bC7zT6cA
	kOjoWsQHJM9wUla16WyTCkr4+rWpBKKj4WAfLorhmH4EuIfM/HGdxEFGOtsj+K+hYgt3BjndMY4
	eS9xK6ZE8nf4BDJmGw+1Xkf04/b4p2tca/a4RUjg4s93zmalZimzaAIyEo7hqg3exxWv7cQJVRm
	W0JTlcr/yLTWGMDi1O29y0NUJzAxd7RuDtf+bWdMbWvLsVgyYpCFoO52POXEEOTAxke+QYWF8z+
	c4P2g3QI3w
X-Google-Smtp-Source: AGHT+IH237HthFfSf/Rwlf2yQFhyNBc4Y5yHYevCW4t43M+N9yDBvj24ocPVnfnOhfte28nRmWG2Mg==
X-Received: by 2002:a05:6000:1841:b0:42b:3090:2680 with SMTP id ffacd0b85a97d-42b4bb875f9mr3871372f8f.10.1762972615151;
        Wed, 12 Nov 2025 10:36:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b316775f2sm25422963f8f.16.2025.11.12.10.36.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 10:36:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] babeltrace2: fetch with https protocol
Date: Wed, 12 Nov 2025 19:36:54 +0100
Message-ID: <20251112183654.1049165-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 18:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226216

The source doesn't support the default "git" protocol anymore for
anonymous download, causing fetching failures.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
index 7ece3140f7..8fa0f9f20d 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0 \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=https \
            file://run-ptest \
            file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \

