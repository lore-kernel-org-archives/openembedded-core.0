Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.5266.1612513404976858402
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 00:23:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XeGSirZk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 190so5259429wmz.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 00:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M2WpS7Z3OiN6U9IDiWNv+GoHujfjs2W7GJO9fyz0K44=;
        b=XeGSirZkbdrR0LjuV+mukAM652gkhg8RFEVx/XWH9y9O/RcY8sW+FH3VTQnT4z5F/C
         qsu4heSd01bi8pFlGSeZiQiX4SXt8Y2MJ2OF5NUaZ/TSn639f5dXIziSB115wFZC+zLO
         QUcnHpXA9DiA6tVytep53u/fkhmRvLDBPyF7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M2WpS7Z3OiN6U9IDiWNv+GoHujfjs2W7GJO9fyz0K44=;
        b=ghwO0Gq40+kvk0d6q0Hbm02ku2BeiorIfiD+YDw/QcUtUJFui5a59hZE5PCs1cGWSF
         xbMYC+D9Lw+ePZmI+/vwRxodnXp8UBVlrNV3XRMXemIkEALNI7bYt2t2m3wKmQyt+0t1
         E+U39lSwGAAchizX+N7cO1r5fXYimbtuaYKXkKSdvLg9lnNg3dXtalAT1BWGnxYry3tR
         Xf6KXIATT4IUvdaprS9IE9giqU49eR5TwX8+UskNvyafRgvVyX+aSgJNMVXAq28ROn1k
         sc29IKyPOa4UyfGe/oOaqBw72hfMnJK0KGuFGamtjXCyTj6Ex27DkWcTQ4AuRWkKKUdX
         4wOg==
X-Gm-Message-State: AOAM532empEzWIoNd0vOOgYbH5+nNjH4V7wC2OpFsmxHZR4u2hacXKGW
	4fIzqjA6Z51DhZuie04D2H8OAlhupL3XCA==
X-Google-Smtp-Source: ABdhPJzrg+IQtCAtJ/XI8kI40uF2hnrYhjTWESYynkPsaeV1YNE7J4WVz0Fj2OHfwN8DGfRUgn9DSQ==
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr2465293wmh.77.1612513403330;
        Fri, 05 Feb 2021 00:23:23 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d1b2:8778:591e:ef47])
        by smtp.gmail.com with ESMTPSA id l5sm11284330wrv.44.2021.02.05.00.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 00:23:22 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH] linux/portdefs.h: Fix pseudo to work with glibc 2.33
Date: Fri,  5 Feb 2021 08:23:22 +0000
Message-Id: <20210205082322.1620295-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In glibc 2.33, they've removed the _STAT_VER and _MKNOD_VER definitions
from public headers. They have no plans to add these back so pseudo needs
to attempt its own definitions. There is some protection as if they were
wrong and there was a mismatch, we'd get an error art runtime.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ports/linux/portdefs.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/ports/linux/portdefs.h b/ports/linux/portdefs.h
index a92e969..9545550 100644
--- a/ports/linux/portdefs.h
+++ b/ports/linux/portdefs.h
@@ -34,3 +34,22 @@ GLIBC_COMPAT_SYMBOL(memcpy,2.0);
 #include <sys/syscall.h>
 #include <sys/prctl.h>
 #include <linux/seccomp.h>
+
+#ifndef _STAT_VER
+#if defined (__aarch64__)
+#define _STAT_VER 0
+#elif defined (__x86_64__)
+#define _STAT_VER 1
+#else
+#define _STAT_VER 3
+#endif
+#endif
+#ifndef _MKNOD_VER
+#if defined (__aarch64__)
+#define _MKNOD_VER 0
+#elif defined (__x86_64__)
+#define _MKNOD_VER 0
+#else
+#define _MKNOD_VER 1
+#endif
+#endif
-- 
2.27.0

