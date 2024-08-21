Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AB7C5472C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 12:50:54 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.18789.1724244645081789421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 05:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2lM1jq6o;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7141e20e31cso1053477b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 05:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724244644; x=1724849444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CMAtGLlHnnXxDRK+QXgOVvqJDkAqgjcg9pvu39SsNs=;
        b=2lM1jq6oH3f3eIZV7WYMFt0c+dQJWlTR8d/8BB7+k1qx0czTRF4pprq9mzzi99X92i
         uIsaoEMPnEdtZgcl1oEmM1eF7gduy815EXJVcjTsf2wRBEmaqN/BlJpsrnB6CLUYovqQ
         XBpQ61kdX6XX3Z/yckHKJyS0I7j0CTJL0ov9G2iQO6i4QKdejGxVPq8w66P3w1s11UdY
         JIuOL1/veQAUiiQJ/DLAXtcaycpJY99+1pQ/jUNPJ48fzMR3mmPPfg1QY2dtneB8b++E
         VlDY7Q2GXtnU2MuoaWsRJqoA5KeF8ZWS582fxYFDgrbSHVreYCP7u7WHWphxBDwmQgbp
         pNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244644; x=1724849444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CMAtGLlHnnXxDRK+QXgOVvqJDkAqgjcg9pvu39SsNs=;
        b=dj4KmcM2fWgyjOP2squ6xxcb6Ny9WCvNR7+XTe6RCF82Zmfs431hTnz4PhVF6Q8zsd
         v3T1V6X0TDvDsZtMrMNVjVGJZ5i9wQ9h5YWM6ESAlsyDit+/OXubQppNo/VFHbKD4Ovp
         uicOH4yklN5REgtuTBZwSO8dj2u6MFOyk/3s4tXjfnJrNySOHqlDfIb1cHJ5kqKUTW6c
         PVfuhQGZQOn816BknuEhW0gr6jcTo6WXroS7MMVzUGHZ3Cm+N4Ukwhl94VOKpYaF4VD3
         88dpxwE8f1wr6mKx7bQKHBkjF75ST7cRY580YIugrUa278ZrhOLLfaQNBI0n59agGyzX
         3VPA==
X-Gm-Message-State: AOJu0YziMkf8CXC883Zu3noJ4l8T74AGsiulee2QLAoJC25sWgXOC6Kq
	q0y0vV+ICRquzsITs4jFTInld9uePHlY4zX32pFLmySOyR/qzyJCGpxN/tT0YypqH8dZEyb+vsA
	DOMI=
X-Google-Smtp-Source: AGHT+IG99gdMLMkf9Ob4nHJiQ/jxQSAsVclJeWXZ/klBXMNlyS3KZAw+OXXTHIwwqSyy6f8YyG/7Nw==
X-Received: by 2002:a05:6a00:2ea9:b0:70d:3354:a19b with SMTP id d2e1a72fcca58-7142351e466mr3231446b3a.22.1724244644338;
        Wed, 21 Aug 2024 05:50:44 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7142a8a481dsm691789b3a.36.2024.08.21.05.50.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:50:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/18] os-release: Fix VERSION_CODENAME in case it is empty
Date: Wed, 21 Aug 2024 05:50:18 -0700
Message-Id: <d53b627a68701393ac0a1acb591817f4b5dde59d.1724244509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724244509.git.steve@sakoman.com>
References: <cover.1724244509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 12:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203595

From: Daniel Semkowicz <dse@thaumatec.com>

If DISTRO_CODENAME was not set, VERSION_CODENAME field was populated
with unparsed string. This resulted in the following line in os-release
file:

  VERSION_CODENAME="${DISTRO_CODENAME}"

According to systemd documentation, this field is optional.
Fix the problem by setting VERSION_CODENAME conditionally, only if
DISTRO_CODENAME was set.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 70a0b8bc1d846c857be90ce2e97e60c5ee32558e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/os-release/os-release.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 8906906bc3..93af08c182 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -24,7 +24,7 @@ ID = "${DISTRO}"
 NAME = "${DISTRO_NAME}"
 VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in d else ''}"
 VERSION_ID = "${DISTRO_VERSION}"
-VERSION_CODENAME = "${DISTRO_CODENAME}"
+VERSION_CODENAME = "${@d.getVar('DISTRO_CODENAME') or ''}"
 PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
 
 # The vendor field is hardcoded to "openembedded" deliberately. We'd
-- 
2.34.1


