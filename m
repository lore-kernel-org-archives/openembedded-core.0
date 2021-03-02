Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.8132.1614691204906952920
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 05:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@enlyze-com.20150623.gappssmtp.com header.s=20150623 header.b=0wajg+Qa;
 spf=none, err=permanent DNS error (domain: enlyze.com, ip: 209.85.221.45, mailfrom: c.finck@enlyze.com)
Received: by mail-wr1-f45.google.com with SMTP id 7so19858253wrz.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 05:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enlyze-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b3LOdW09c3OkiHmKcGb+CoKO4CCKDSEgzMWQwBcQwYE=;
        b=0wajg+QaHzexPAfQHpKsMhkoYY10BeP2wADhgWJ4Y6oCBZU0KlXUHP5aNV7CW+oD/F
         RNmWLs+e5UxjZqqOF3Q48yx1WqionEj1DkBvjusNYStpSOgKLV6qYHT6veDGFgKr2K/M
         kOLq4nE+BXYFHeUU890R8PFBvitkqpiOvMKBf/yW7ZkVwjI8Vqb+9AhxqKOgkZI24TH6
         lv69eXJwUOGnBj4ivCeOt42jFn4FOnFclFrcYxWNA9LW2yaar0fO9H4Yf8Oxoi7fYU2L
         nemFdfkxU8Am9SmhBUKEiuZ0lHww1LGrzfMp7sNnXd/50rR3SecjwJlVEa+kOj0jY1iF
         CuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b3LOdW09c3OkiHmKcGb+CoKO4CCKDSEgzMWQwBcQwYE=;
        b=Gm3Ekx8P958LxKdEHp9yQhSHayZ0wGuHftSemp8Ic0TZ651l98xmS7WZ0LnVtLMY4g
         R26/y7ngaWikmHhZK4DXG2rIW/LRJJK7DXBHrO1W1K0mVSoc1ToXMBdmwe7ZUjPyJ36o
         2yvGEnqlqAXWOS/Dtu3DMwLNmoiJ0vv0NqbHj6w5Y6rAM4RLg6YRGUl8nEnzA3u+xTu/
         wksrI+cxNcwRFxwfHi2wby9UJ3F1/Y+jqDTtiSDVFOgHycdYcjuZ3KSzEneYI+AAJQSV
         /dHlf+0Qkv/CmeH+bD1LGXyc8m/Ghdbdg3P4R6RSyUfP5tbhdhE69IL9tl0i5UuT0Uwv
         +ELg==
X-Gm-Message-State: AOAM532dNN8m7UoQFdwXppuhz5AIhcT3dTBchRT/2jcyl/6dV6KQxH4R
	85S33TkAR0AaHb02SONkzXyrLXGAkITC+CNK
X-Google-Smtp-Source: ABdhPJyFkOWXk7LiahOqz0fCj2ETF5hMJmsmNfirdteZBLKQ/0XbX5pm2z+w3WFycu+Lf6C2nQoRag==
X-Received: by 2002:adf:eec5:: with SMTP id a5mr6915466wrp.303.1614691203255;
        Tue, 02 Mar 2021 05:20:03 -0800 (PST)
Return-Path: <c.finck@enlyze.com>
Received: from localhost.localdomain (xdsl-212-8-141-28.nc.de. [212.8.141.28])
        by smtp.gmail.com with ESMTPSA id s124sm2538726wms.40.2021.03.02.05.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 05:20:03 -0800 (PST)
From: "Colin Finck" <c.finck@enlyze.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Finck <c.finck@enlyze.com>
Subject: [PATCH] dosfstools: Build --without-iconv
Date: Tue,  2 Mar 2021 14:19:45 +0100
Message-Id: <20210302131945.556-1-c.finck@enlyze.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new version has an internal CP850 conversion table, hence it doesn't
need iconv anymore (and currently errors when trying).
---
 meta/recipes-devtools/dosfstools/dosfstools_4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
index e1d1734b99..7476c043c9 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_URI = "https://github.com/dosfstools/dosfstools/releases"
 
 inherit autotools gettext pkgconfig update-alternatives
 
-EXTRA_OECONF = "--enable-compat-symlinks"
+EXTRA_OECONF = "--enable-compat-symlinks --without-iconv"
 
 CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
-- 
2.28.0.windows.1

