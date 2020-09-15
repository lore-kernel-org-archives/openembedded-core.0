Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.10736.1600167361683900928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 03:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PKPTfmV9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id y15so2987321wmi.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 03:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zAeI3HIYHhWdy62QVgL8ez5Uc2Nag+745tnVj09HdYg=;
        b=PKPTfmV96VL7TdHxG2HfJEbofX2qVr9NVx0NG7mpfx9OeA21ZSD+oJuummJFHAab7A
         pBdFLWGHHx9C6ns5HnOBn7J+Bei1CDsffBSfFQaF0YkGNGJow8AwVDkZHKHZlnf3hvUP
         2LEzFhUg1aMOm/d1SegLHdmFzbpc77MXmHBbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zAeI3HIYHhWdy62QVgL8ez5Uc2Nag+745tnVj09HdYg=;
        b=QwCbrcHS3EF5mSzikyeWm6gavur96+fZILoEPA40mCC/9X7L3uovfNnQZTYxqJ8x2i
         DnsB1K+/nKzpKPOzZkFvQO99ko06dRUBJ401Q9y8yt7l8NCTzUOiZH3IuIMqqh+v8RSi
         soSg/lEkXQWN/w0+yxkyyQWEkBAq22ktq4Dc+1BrWRXMoGZAGmkG8GsTewptMSLCUzHo
         femLO1SOeqVrf+qMDn/qouA0pjFcCiDFGPjWkAUUmLcZPJO0e+cDQQQ9RYx9RJwvEOu6
         /e+K7EyjRjPpvXq3ipwfrtpEzE71Gt2tWcR0Da+0VVnf67Chjdi7u3JFRtp6GIk1TjEd
         KUfg==
X-Gm-Message-State: AOAM532eVp6FXZLCDe5afFzL2BhCpGaeW3z6w+d98NYCGX15eVRmdm2r
	6oJUzeP1khppc8egZOjkkDBbTFw+CkorFA==
X-Google-Smtp-Source: ABdhPJy9qRsvicKlfwj55UVQ+1RbjsOq1SwnD6cd4XrzS8wgqntHK2uvzWo2KvBg/kiEB15X//M1wQ==
X-Received: by 2002:a05:600c:4142:: with SMTP id h2mr4054414wmm.128.1600167359795;
        Tue, 15 Sep 2020 03:55:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6142:eacd:f73a:2991])
        by smtp.gmail.com with ESMTPSA id i3sm25805694wrs.4.2020.09.15.03.55.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 03:55:59 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] Revert "core-image-sato: qemumips use 512 mem"
Date: Tue, 15 Sep 2020 11:55:57 +0100
Message-Id: <20200915105557.2211949-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200915105557.2211949-1-richard.purdie@linuxfoundation.org>
References: <20200915105557.2211949-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 45da2fc4f7272366ffc7cde24d9040c919466201.

qemumips is unstable with more than 256MB memory, the original issue
this limit was added for remains.

We'll have to find other solutions to the systemd out of memory issues.
---
 meta/recipes-sato/images/core-image-sato.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 878e0eaa8d2..673106eb6d3 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -12,3 +12,4 @@ TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool nativesdk-glib-2.0"
 TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
 
 QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
+QB_MEM_qemumips = "-m 256"
-- 
2.25.1

