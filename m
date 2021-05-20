Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.499.1621543751789743110
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hscH9OMq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id i17so18938485wrq.11
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RylHFdVx2EPqvZCBeu6FsbnR/l4LWhyzzywQS257ZyI=;
        b=hscH9OMqrXqz3g56VJ0vIbVKlsxFA8WUJEkSDAOWTnWDv9pMiCyc5L+wDuQsKVeTi1
         lSoqZQlVefZPlOui3+eZmpQ4KHG0hd6KkTRJ3TLvKRKmhGd87Kpfcq1mj0s44smTW2Uc
         YU3jRrFQ6eb+S/6Mu4R3FNUGurMpdlsM6XPOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RylHFdVx2EPqvZCBeu6FsbnR/l4LWhyzzywQS257ZyI=;
        b=o4942YwwDKpUsQ2/5JF9+5OYiNLmgEQGWQrenAlKU8xVQ39ko6S8oPFNJF7CZbZtlj
         m78EV44B4jKF9nrfXdywqaGeBlLQMvru8WbxxtFjBb9HGjR5RcYlAGSh3G5UjzcMoH24
         1wi4Nd99QfOIhyiOJc4MTgoCurNlWpH5U+9nUxfX9aOVjQheUukcS63+mEYfTQ2wRdxH
         cdWitW0OYakSSq3MH8Vj19OIw2B6dbAtDUmd7AtnNGN08SZUg5blzLvX+exJUuY6KoJk
         YjoMqTphY43gUAvrfuR5v/edcCjL5f5vXF4DTK6o9djLZuvKa7Ffvsg5SDWFQ6+2q4mc
         UEQQ==
X-Gm-Message-State: AOAM532RGQSEgczKHKHOl8WLoiS1ke6rz6e19Axu8vorCo6sRgyYGCyL
	JgGB2j4oalC7KH0t7hE/IVz+v0vtjFAQYw==
X-Google-Smtp-Source: ABdhPJzU6CaDv5sMXh/M8bzJiWR5+9Cp8wQ1yC+QsG14RiyWqX0RlQJ/D0YiisI+fOGLqm/mXeEiwA==
X-Received: by 2002:adf:f805:: with SMTP id s5mr6003575wrp.143.1621543750304;
        Thu, 20 May 2021 13:49:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:10 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 13/28] qemu: Exclude CVE-2007-0998 from cve-check
Date: Thu, 20 May 2021 21:48:47 +0100
Message-Id: <20210520204902.2527687-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CVE applies to the built-in VNC server but we don't enable this by default.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e1c1bfdbfe5..c56f341a5e1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -68,6 +68,10 @@ SRC_URI_append_class-nativesdk = " file://cross.patch"
 # Applies against virglrender < 0.6.0 and not qemu itself
 CVE_CHECK_WHITELIST += "CVE-2017-5957"
 
+# The VNC server can expose host files uder some circumstances. We don't
+# enable it by default.
+CVE_CHECK_WHITELIST += "CVE-2007-0998"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.30.2

