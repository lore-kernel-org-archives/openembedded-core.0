Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DD2E860F89
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 14:17:03 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g1so16064833wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 06:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zcEGZzrJszjVynjcnB/woQM91EjSTJPeimJSQHUmt4E=;
	b=fGx7cA4vL8S/lWf19ekVDZej9WEtTZiuPwEs9xSnSOdUGQ3bmmiOYlBBoHqet17ltm
	xUsTFNgyGpQZ+51qVZVd0nZ3E0cZx++9HWqe+xbABInhgsYf08TE+hBTeg4UGn/5Eg7a
	1oBzGzTLisiqHUfScLVJJfBMXLq4dPbZ0GLz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zcEGZzrJszjVynjcnB/woQM91EjSTJPeimJSQHUmt4E=;
	b=L9E0eh71HltHoVyneDH8lvt5oVxOIr+FgT3LBTP1JCTsU1I+pI6XsYs2Uk2twInYZ+
	HjcSTWF2d8hSOxvW8TRiBK5M8yilAMFaHs2BYou4CmGI+4lIhPRgLtpiJj3JRjjw+Hs5
	bkQK2DFurd97lh3P+DYXOtGOEek+IakFZS0KanY07AREETe4gzPKRfrvrsHpfKT9JJR4
	dq2AS2gWUrHhS44OfnRM4GV+2UayRL5E+o2gH7FLvYBu0i20Zz9hryiGPWkRiB+kYUfx
	JZCKH6oATc4xu5ItDdKvI4y6U+/icNJonG+B/84npG75Hztv6L7gxTjf5bFkbIP7w4UY
	i4DA==
X-Gm-Message-State: APjAAAULAVTGcs95EHLH5dCY4yxIwqWWVW0OdFA7CHnSDc9vrwwRBAkG
	te+r69AIm3ZDxyvpWvvUOTliTjvprvM=
X-Google-Smtp-Source: APXvYqyF76aK/KsOzlPsGUMny66Rhe+sTejcmZ5QrFi+F0hDOVwquAQEX2InefojujlWlUymJG7U2w==
X-Received: by 2002:a05:600c:2383:: with SMTP id
	m3mr30427380wma.32.1580739424222; 
	Mon, 03 Feb 2020 06:17:04 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l29sm2168822wrb.64.2020.02.03.06.17.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 06:17:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2020 14:17:01 +0000
Message-Id: <20200203141701.18379-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200203141701.18379-1-richard.purdie@linuxfoundation.org>
References: <20200203141701.18379-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] libxshmfence: Set shm directory deterministically
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Feb 2020 14:17:04 -0000
Content-Transfer-Encoding: 8bit

Without setting this it will vary depending on which directories are present
on the host.

[YOCTO #13778]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
index 85a48e4c588..cc456965305 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=47e508ca280fde97906eacb77892c3ac"
 
 DEPENDS += "virtual/libx11"
 
+EXTRA_OECONF += "--with-shared-memory-dir=/dev/shm"
+
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "42dda8016943dc12aff2c03a036e0937"
-- 
2.20.1


