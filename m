Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB10DE67495
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:56 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68798.1766353066878243818
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zhZN9wfD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso5328897b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353066; x=1766957866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tx/Bh2HO40cAVWCG7pqsqT9XXAkDdVGC7ebb7CHq//c=;
        b=zhZN9wfDsY4RRcMH1XG5d2ZAIyqfBUL81yA/trY1vNJchfiOmM3Xh4MiPMfynb3xNX
         GahXaRDHfblpqMXkxYtFN7YoJU5L2NZE0J5tuXYMcwZcAyL8/puX5NnuoQKt9ghb9HUt
         3qSzlLojJnbPUC41wLtWCG8iMe/eqlrubblcfeZWgvjv/JDsSGu47iDv26+5Zc7QscXw
         jatVmbDT263moJ/RJH0Ai26yTyY4BgiY7jerNeV9jjKxIwQRS08czKw8N1jPiDaIS2+7
         tvSWwzJPp0oBQpjl4EIwsE3qFz4hj4VO0qjRYUPtfMjSd1PkWlU7GfgB8tuKPzf54xCZ
         vMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353066; x=1766957866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tx/Bh2HO40cAVWCG7pqsqT9XXAkDdVGC7ebb7CHq//c=;
        b=og5ZG30ua65Sfy18g1P9YyJVGTB6Uy2jV5pbtGtWInK/64XV9zkDyofRYF9nSxbQuI
         YVqqtDNnA3+HuExUpkWoSPnqL7Jcj1t90iRrnfXyfn1Mns9ciVBjJqEbOW2XlUptizZr
         6brjVB6j3N003sgWBtGqjSFE8J++o+xZDZOZjdhr4ngVLy4pLtpKY80Z/PaJCYtbxnMe
         3sqakTuQxaadTk+EumdzVV7BR8ZfYWDoyIieeK9Kag8SaOEMxknW/TE2atVeEm39Fi6/
         69AJRFupvE915nkEf0imNuqxQVPX66n5sXwOQILULKOt3dyFyrvF849vwQO2K3DZF/0N
         BUaw==
X-Gm-Message-State: AOJu0YzK1cArnqTKecIVAk8evx+wjG/0mOVSEnG8FIw/pkMFWdgNg4Bw
	Y7h85+OwcCrwcO/M56xndiQh24pEgxLdMV+FxO4QlTD93Rbi6T3d7hXotu45toHetl5lsAzg/j7
	CQo9h9Xk=
X-Gm-Gg: AY/fxX6Z2d8QwW2MLwJbcV1uh9onID+qezbWah/mx4KvJLFSgJmz6SaeI8buwQR2iKC
	vepVpcl9NYdS+KuLdasVNAjsOoE0YLsR28NkZrDjXqGvxLOwkG2kbEmiKOpyI5uE9tsLoO2UPIB
	ZGmEJRn3PJ3OcFHJ35ZU85mSfpoV2A+DUYGpZv4uwume809JlmLBy0U853R/khFyONEzMceXEDv
	Qoiq7nUc8QYk8RlTbFQIsVRnt6lReTA/i5nOeyb0V2c2IaEcVTSuOk+4oFO/TWiIeMXp+t5MwNf
	tjHpDtQ2zpNmQfwRzYDaylnjF5jW0N7IAl/IbzinclrekSyQR7wdKag6OiZ88BVwJW3iVtZCPOO
	AyyPkQYw6h4w6+0yZvsJJ7MKn6pO+rKFATzAjRHLi4OB7qto37yUUlxRXAptk5lkUSweDigjWTY
	bU
X-Google-Smtp-Source: AGHT+IGq82cNGzQRIMrtF4Rqz0nRY+nBVbya73g0gsgqEjaoKTQEPFmaMeLa9YhGQWUs3JqpDz4nDA==
X-Received: by 2002:a05:6a00:808c:b0:7e8:450c:61a1 with SMTP id d2e1a72fcca58-7ff66a6d896mr8825263b3a.56.1766353066089;
        Sun, 21 Dec 2025 13:37:46 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 15/18] xserver-nodm-init: avoid race condition related to udev
Date: Sun, 21 Dec 2025 13:37:08 -0800
Message-ID: <c455cbbbc2b268562c2592f60cbdc8e5606056b2.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228273

From: Chen Qi <Qi.Chen@windriver.com>

With systemd upgraded to 258+, there's a race condition error found
on qemuarm:

  failed to find screen to remove

This error is likely to be introduced by the following systemd commit:
https://github.com/systemd/systemd/commit/0ba9d06963ecb848e71951ed5e9f6f6f03b80b06

However, I think the commit cannot be reverted, not only because
there are a bunch of changes based on this one, but also because
the change look like a reasonable one.

Before xserver is able to handle such issue inside its codes, this service
need wait for udev to settle things before it starts. This can avoid the
above race condition error.

Fixes [YOCTO #16045]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 213dd5a0b786047cd4de0f51b4b49c9b8b628709)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../x11-common/xserver-nodm-init/xserver-nodm.service.in        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
index 87dc4f8fcd..43aaa84c0f 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
@@ -1,5 +1,7 @@
 [Unit]
 Description=Xserver startup without a display manager
+After=systemd-udev-settle.service
+Wants=systemd-udev-settle.service
 
 [Service]
 EnvironmentFile=/etc/default/xserver-nodm
-- 
2.43.0


