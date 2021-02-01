Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.36629.1612196839157911529
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UIfl8/z9;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id k142so4944515oib.7
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WscHItuzsyZIjdrYjzOz/9/udRpmqULXTseKsR1aeTE=;
        b=UIfl8/z9lqj8w0Tfw0TScOS5VukyDcD0UdC6+WrkVYI0fnx86CqE1yZZEzuyQ/ZV7+
         lOJg8Quk7AGcVlie/NFKy+lYbgzZ/qiWLX4954XHrtScEhZACaNfFqOxHxm6kka2xWGt
         GNgwujDFoc6txn+aEsVVDqXd0QO4mYkwLZyVKJBoz9pPzn7moNgrldqBDPL0e5QW2iK7
         OxlU9I6KidI21K2Bul3yAd2OQ9hNW/TfM0EAAhTGz9anSFWYxbMjJ2uzYT72tWVuSOHd
         HjENqYxTPASYbRk4X62LPHWvla12ekab4VfqJe6lpZHZhjg36RteOm7uqaTvMxMrYkUH
         SmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WscHItuzsyZIjdrYjzOz/9/udRpmqULXTseKsR1aeTE=;
        b=mEsLeF0rFRXgSMdB8Bv32CwCMDrZZYr+MLhs8JEQAfCXgi7No+2VKdZzWKjtMRLsc+
         6Wl8BA0CKanMgFJ9X98Pe+r3WyYC8ICwi//XznDMihnG4ndCL20WVtDw3xdUGVM7ElJW
         GhTIHfzKawcBbm/6g+jywJtYfjQtDb29KTvQuKhhFzkrjREfkJHe9cDi8XXl7Ng52qG+
         u111j8PSXtNOrU+aymeFD56pp/9Ka5njGEzyw5Lxy7UnQls+taub5stZccTsukbI8bS1
         xcU4k1tf0w1FQ03SmrsfmJRDTp/sz+jXIDpVrS9PansuzmMLJOrmFCYXUTATucIqz4hP
         t8PQ==
X-Gm-Message-State: AOAM5303yHOH7+/8RZcBqhaT3TDgd1agQZLZgtdlw2AhCYFhBl0BhGJ7
	N6DU3BkhJ/tiqptpXYmBPST2CkQ606BoUfSDyZ8=
X-Google-Smtp-Source: ABdhPJy0/H5k8BoyMdzrr6Rx1hRzS8lUIrw1sYHApPpBc/cy5gjj6b1pW0pHt33IWef7n++6yFiL1g==
X-Received: by 2002:a05:6808:b23:: with SMTP id t3mr11065463oij.29.1612196838120;
        Mon, 01 Feb 2021 08:27:18 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.27.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:27:17 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/21] python3: Avoid installing test data into recipe-sysroot
Date: Mon,  1 Feb 2021 06:24:51 -1000
Message-Id: <f73ac290617e89b80e10dc700c0e90efddc8e1b2.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are several thousand files in the test directory which we don't need.
Adding these for the native and target sysroots is a crazy amount of files
to be throwing around needlessly. Delete the files from the sysroot side
of things to tidy up the sysroots and improve performance.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6bced03011ad1663d68b0322a2f8aeb4d836646)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.8.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index 9eddad4ad4..a86542e547 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -360,3 +360,9 @@ RDEPENDS_${PN}-dev = ""
 
 RDEPENDS_${PN}-tests_append_class-target = " bash"
 RDEPENDS_${PN}-tests_append_class-nativesdk = " bash"
+
+# Python's tests contain large numbers of files we don't need in the recipe sysroots
+SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
+py3_sysroot_cleanup () {
+	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
+}
-- 
2.25.1

