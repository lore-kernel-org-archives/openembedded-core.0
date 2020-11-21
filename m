Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.2679.1605917667990243889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 16:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0Kag/L80;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id v5so5404056pff.10
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 16:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5L8k9tY5FCc733zTRUSyWMhC5s5QxwxT2O7zOQpd/ZU=;
        b=0Kag/L80e03uqRyIgjMPlfoEfEt1jTXqvYCCxf4acSEAc98d7qjrsrp2bmk4wDRy4Q
         Iw8odaI+1IfxA8kElYg1JsbytbTFmXkX/x9CW0uMxQQrNK89WZ5+p9+zLgl5yakPPC2b
         Hu+plycX7pF/JJS5sRXwMsIZ2WMPNI3EmV4xT9TSPiSdVoRoLLvcE6ZZnAVLhnQ3XrYh
         jpVv1NxSccK8mYKPuvoDr3NKQmxb0+vW6ZsGOKcjD7t/LYQDa7eDp2ygPf2LwxkFhBuF
         eX1p92+W0BRzhaeI4I0/qFAQ9/yE3I+zD3oN1EQOAWB+fsvotptV3MkyZkWK06AnUSCW
         x0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5L8k9tY5FCc733zTRUSyWMhC5s5QxwxT2O7zOQpd/ZU=;
        b=G9lDQB4wnwHTreDjBpuPM4imOdNvvNf2wk7WP2Qp6sjK2+IRLgXj2LHW8aSf94Ah+E
         fMm1seny+FaUJZyI1SFyclgmjusbRsEZGb+qRgl5OD7pCRr/VS7nNuy5MbEG5+gIu0PX
         b6CitIgcOaXEeINy4uQw6G9dzvTaHvJ3iHGIYFWW7O1BtKJ8xTZOJaAbcGYSQCIzv0Wc
         SrvXNgHWUbI0YVKwK+8EhvIHPyAWGPPgMVIciayTAymkvlacyS/V+jya5IbKnJTaasSE
         DGID40LTycxWjzjIHvUlLyLl6MNTy0VCpXXvs7JSqUN6mLoPvJCQkH0OSwz3c8S0g8nm
         Os5Q==
X-Gm-Message-State: AOAM531jerCpA+JnXgxetht3Px3mapM1ad8CjLO02dPCz0bDvQM4Icu8
	RweSJvWrLeYHUgNi7lS9MTC5Rz4dUtn/V3KS
X-Google-Smtp-Source: ABdhPJz5Nnw455BwT6AXLziZe0K60ymSUcMgwLL2QbKg6+C2EMwfbvcwfRom8eIGjiC/9ToUW7SH/A==
X-Received: by 2002:a63:9508:: with SMTP id p8mr19249091pgd.189.1605917667267;
        Fri, 20 Nov 2020 16:14:27 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d10sm5302419pjj.38.2020.11.20.16.14.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 16:14:26 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/5] python3: whitelist CVE-2020-15523
Date: Fri, 20 Nov 2020 14:14:02 -1000
Message-Id: <c216431d0704bd8be237e860bbdc32be34a82aee.1605917505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605917505.git.steve@sakoman.com>
References: <cover.1605917505.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

This CVE is issue on _Py_CheckPython3 uses uninitialized dllpath when embedder sets module path with Py_SetPath.
Since it is .dll issue (on windows only), hence whitelist it.

https://bugs.python.org/issue29778

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.8.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index 758ed87546..5f7901dbf2 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -54,6 +54,9 @@ CVE_PRODUCT = "python"
 # This is not exploitable when glibc has CVE-2016-10739 fixed.
 CVE_CHECK_WHITELIST += "CVE-2019-18348"
 
+# This is windows only issue.
+CVE_CHECK_WHITELIST += "CVE-2020-15523"
+
 PYTHON_MAJMIN = "3.8"
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.17.1

