Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.17513.1613314202003577170
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 06:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QwrWLiWy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id n4so2549693wrx.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 06:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GyuHQDhTE+YwfL2fy1D50Xjr27T3FhV+9x+u2H+XrOw=;
        b=QwrWLiWyTQpuHqwkh3s1v8J+1W5a19OWsblN/MQcw2pUL30YIgrj5MprND8Vt8bey/
         4DXQt7++V8abwtv6UwrRJy57+CLU/Yb3kdQxTHCr1902hoMpNjbSEdt+KHsf+lJ0RCdw
         z2J6z6ypvY/Xh5y3A0V0iLnftIeyUZdJCtTNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GyuHQDhTE+YwfL2fy1D50Xjr27T3FhV+9x+u2H+XrOw=;
        b=cSV5OVL+jOn+YFAzUcbO4nx00DpYorOY8iQpI85Sx0XKul6dQG0FYnbS0U2aO01D4e
         AVavHKQj1QOaNCnZPXLyVY0gZPwRj5+vNY8+jA/fu8rfK0GZKUjiKpmslPhJBc05C5Dm
         V9ARVlh4WmzfAkSDsj5+NJpmwxzlpvUMFnqbNWCaS120S6PGB/zTCS/JBghv6McsUsKF
         SKIX5gmwKVQKKQCFziNvUNs4fH4PmXea+k5hmCxZiyuHRDuthuVyv97v1DwVTa1Uvj8t
         Ppnza/TKUcFzaVj+ffNb5AgbM26JLkCBVB4U3On7XWnPzC8WqfzgLFVqfvegdsXmr6Yb
         wZjA==
X-Gm-Message-State: AOAM5311TabgAtA4InMBpmDDxVIe+y1gv9x1GvUTYCcMwXnq8hVnheLd
	hPz+p48LJFgef7cCN2AWiRvNA4dt16QeNQ==
X-Google-Smtp-Source: ABdhPJx8zGAXrWFWX/7q1+A48ONxRCicsd61a98o/+SL85cpm8u9bT/fG+LwHR+TVvpRPrVxOR9TqQ==
X-Received: by 2002:adf:bb54:: with SMTP id x20mr14473339wrg.112.1613314200581;
        Sun, 14 Feb 2021 06:50:00 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6c46:cb67:3902:3f00])
        by smtp.gmail.com with ESMTPSA id a186sm10710684wme.17.2021.02.14.06.50.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 06:50:00 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] buildtools-extended-tarball: Add glibc-gconvs needed for build
Date: Sun, 14 Feb 2021 14:49:58 +0000
Message-Id: <20210214144958.1966826-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210214144958.1966826-1-richard.purdie@linuxfoundation.org>
References: <20210214144958.1966826-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building vim it tries to rebuild files using iconv. If this fails
the build continues anyway but the output is not determnistic as builds
using a hosttools tarball are different from builds where there isn't a
hosttools tarball. Add the needed gconvs to the tarball when iconv is
present to become determistic and generate vim locales consistently.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 08164867548..83e3fddccc1 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -28,11 +28,21 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
+    nativesdk-glibc-gconv-ibm850 \
+    nativesdk-glibc-gconv-iso8859-1 \
+    nativesdk-glibc-gconv-utf-16 \
+    nativesdk-glibc-gconv-cp1250 \
+    nativesdk-glibc-gconv-cp1251 \
+    nativesdk-glibc-gconv-cp1252 \
+    nativesdk-glibc-gconv-euc-jp \
+    nativesdk-glibc-gconv-libjis \
     nativesdk-libxcrypt-dev \
     nativesdk-parted \
     nativesdk-dosfstools \
     nativesdk-gptfdisk \
     "
+# gconv-cp1250, cp1251 and euc-jp needed for iconv to work in vim builds
+# also copied list from uninative
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
 
-- 
2.27.0

