Return-Path: <frezidok1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27DFCD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 12:14:49 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10243.1778156080449007782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 05:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z2KLOHf9;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: frezidok1@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a8891f0c88so436098e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 05:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778156078; x=1778760878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L2/seNw8MQKiaDDXidNmZ8/0gciDhn5T3YPynoWgjx8=;
        b=Z2KLOHf98L0xw9PvHf6mz2mfYhBzF3IF1i+Eu6fGurNi7KIhg8DhoQ+ZC0J8Jy9seH
         EUkBW/xlrl+qXXsZRI/hGVZs620MxutwTyPcNhe6pZUGgOpna9o9nJXqC+nfSRLM6llR
         z7VIIdTaOYOITYytNJ9WQqnUexbzIDqB8hbM958tW5SnHiHH+gKm9m8H7zaG+Llatgbf
         5I1EMmzlRcwhohZTjOSwj3dkZvBRPGqQvn8VEp8lkVIa2mcUB9x0utIfb+Qy7lXEb4sd
         jkIhqLF66viswYMaS9/k17jff7lecUhMWHj7an8R3IZCGnduw982UCopnoEP17oJTFm6
         os0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778156078; x=1778760878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2/seNw8MQKiaDDXidNmZ8/0gciDhn5T3YPynoWgjx8=;
        b=oL/01uHl10/Iv14Fxw80ja4ORmmXgEtIGynhTuRZ0Le4Xubo07F1b829AJTS5w74dl
         Zao9rU3gF/f7BN7BLLzbialOr6HO2/CGU+v/EwjBPlLltfrKHfeh9IQvNjbRW916C5kT
         SY5ii6YLF+RgwQII43IsVT9KRpu4F2pTgRUW53Ki89NYLGBIr/vTw1qQ8ovALinUak5K
         Rf/4YwT4+E98x/EYYOhQ1f75RpU8W/VbY0uBk0GpQoo1oUo0Uro9cj+Y/NNMlppabXZA
         CKI+MB2JAFse73lLTt5Nz9viUTYyiJr6dYumKJVzqQONeuHOKl+B0YePXRZlR+i7KttN
         EKfw==
X-Gm-Message-State: AOJu0Ywinm9/lo2lZt9BQo0Kh4RZfVx96Ir7MXVi/pxr4flSNZ9k8qzU
	TpysgZyiivBCU6NtopbJSnpUNC4dhSu+W73et3W6+U2cZDh0szcjxkinjsrTxxDYv8Q=
X-Gm-Gg: AeBDieuKg4XIX0j0sh6TMLrnFDgH5gYJ31H5url+ANbhspPjm1ZSdAlTmTv9ZN2IXbM
	gFEvD72viu5nVW0EOltJdj8C+/qWDeKpmh2dD3xotD9F+RZCKVBvRuH+4Thzb2Qq+85JZG36Awp
	xDRcKdPymvDXDyTBepuYqYEzL+A2SVW/fnWDNgXyX+VmisKEdRtx2U+zAcAML9APArNwla6fHyf
	zjgpcVTyYhAdnhr9YJUbFwHwxBKKx9IMRCoYDQXodJvIwdtVbd+VUaOlME1vDZoVSiTWxX7YJOP
	ni0OVzcDq+3eNvD2YXVqvIdoFAgYB4uWVOBkMNWXNmhMT9WHRJMpqnppjDmD0r6tKw9g9Etd0V0
	Eh5ML/vN51sb1ZKpy5v7ypqdl/VxfIwZGhrw9i93paw7SSd7m1ohMLOXrVtZESLa3lMJh79KUIa
	zz6EM5CU+EW1x515mvQCoZGOo3MdRC4w==
X-Received: by 2002:a05:6512:2386:b0:5a4:194c:d897 with SMTP id 2adb3069b0e04-5a887ae2025mr2987824e87.12.1778156077702;
        Thu, 07 May 2026 05:14:37 -0700 (PDT)
Received: from ubuntu1.. ([213.87.139.100])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393cda76671sm9713671fa.6.2026.05.07.05.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 05:14:37 -0700 (PDT)
From: frezidok1@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Sakhonchik <frezidok1@gmail.com>
Subject: [PATCH] [V2] shadow-native: Change upstream status of disable_syslog.patch
Date: Thu,  7 May 2026 15:14:34 +0300
Message-Id: <20260507121434.63608-1-frezidok1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 12:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236586

From: Dmitry Sakhonchik <frezidok1@gmail.com>

Upstream has accepted configure option and merged it into their master branch.

https://github.com/shadow-maint/shadow/pull/1618

After they release v4.20 we can remove the patch and rewrite recipe with the configure option.

Fixes [YOCTO #15785]

Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
---
 meta/recipes-extended/shadow/files/disable_syslog.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/files/disable_syslog.patch b/meta/recipes-extended/shadow/files/disable_syslog.patch
index 7299a8e61c..9f8ffcd379 100644
--- a/meta/recipes-extended/shadow/files/disable_syslog.patch
+++ b/meta/recipes-extended/shadow/files/disable_syslog.patch
@@ -2,8 +2,9 @@ When building images using shadow-native, we shouldn't be spamming the host's
 log with lots of syslog messages which aren't relavent. Disable syslog use
 in the native case.
 
-Upstream-Status: Inappropriate [Would upstream accept a configure option?]
+Upstream-Status: Inappropriate [upstream has accepted a better patch at https://github.com/shadow-maint/shadow/pull/1618]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
 
 Index: shadow-4.17.2/lib/defines.h
 ===================================================================

