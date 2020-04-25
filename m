Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.333.1587835713072829375
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q7s0GGKH;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id x17so14675869wrt.5
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mGOUQ70zHoGdFFuSV9NSXfYriptx6yMYqXPdbPBAjVA=;
        b=Q7s0GGKHArfPE2eXmo2jNfiWgXDt/WRdnNid8QOkpCKK/iHQ4lm3w1ktPcKKbL4UEA
         fLBJ8RHQacZMgHo5/PGGaRXWhw8xjTSahAzTHnc7mZT5Ff2T0jk6D68oHKxR0KWdXsLb
         nSO4TzuORjxxzetRw2NBoHDJ3u37W6LdvIszJrcOlm+o1sZCW/xe1kO8QOSCU35kz86q
         k8HJIfH9M/nyk6weSSX4q2xj5qp0FMIpd8CBmRxhA8ChytxPYmg6vXeYN8hBTH7hhtzc
         nhXs3NKviscXAg2Rz53600xZ6LTNJpbzsaVGHHO6H7q0h2duanMH/cMicp9GZlz5xgVM
         EzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mGOUQ70zHoGdFFuSV9NSXfYriptx6yMYqXPdbPBAjVA=;
        b=T8e5XTYEe+gjO5yB/XDBdhG8rrzfQ0qd/T0gsl70k8gGP57YrqruxT7GfdmZN7KUiE
         +q67AKbFTJ/r/JtuxfGq5J+KJ/qv24f6amMX4Rn7oH60HrYLypxvusocunfI7LlKbIg7
         RWkzS6l1sDRWUVX7RTqEhD+fFHBKr4w5DXCrVne4n20y63IzJKmeNJdT39FL4i8T3pSw
         BKmYwfAbWJFJaRfsl8f1mtCJ6upHj3q/EtTQb1tk93kYn+PTQaA7JR9HutGPkbhEz04m
         4CzWfdE20QFNDuaKyxqKCCJZ/+UI8UgM+0OtNynTSKc37EZ7RqD8Lfc59VDdAdw/yhdR
         LFmA==
X-Gm-Message-State: AGi0PuYH5gNaAeBq0btbtl9sWkcDOSkJ2TltRBimMR1A0etv64iDvQ8B
	PqKkVRRDcVDowUDGHnlid86/3Fei
X-Google-Smtp-Source: APiQypKoRywnQ5K5cfRYfzoCxFa8MOjEQtnnhPa5RIpY3W0ClH47nkrE1Q/fvwQG2JqB2b6rO6cEfQ==
X-Received: by 2002:adf:d0c5:: with SMTP id z5mr19079656wrh.410.1587835711407;
        Sat, 25 Apr 2020 10:28:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/15] quilt: do not test patch-wrapper as it is not enabled
Date: Sat, 25 Apr 2020 19:28:04 +0200
Message-Id: <20200425172814.27370-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream only enables the test if --with-patch-wrapper
was supplied to ./configure, and so should we.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index d6d06c049c..d2db079e0b 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -71,6 +71,9 @@ do_install_ptest() {
 	tar -c --exclude=mail.test --exclude=delete.test test/ | ( cd ${D}${PTEST_PATH} && tar -xf - && chmod 777 test)
 	cp ${WORKDIR}/Makefile ${D}${PTEST_PATH}
 	cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
+
+	# This is specifically excluded when --with-patch-wrapper is absent during ./configure
+	rm ${D}${PTEST_PATH}/test/patch-wrapper.test
 }
 
 PACKAGES += "guards guards-doc"
-- 
2.26.1

