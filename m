Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.8714.1614344474661389468
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YhnyGYyc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id l12so8496099wry.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xcTLnFw5QSNb20+MSOXFBGST1vvhFd4eDPVj5V31nBE=;
        b=YhnyGYyco2rdWGvJYgj8xNGUJCENXJGQpa78CoCWMG/TbPIu0yVlYsDWfGeEBXdmHw
         8t9evnXYJtmbHMJIk8dihZGnjIUpY4Zrg9M5ZJw569AZR+EGAbGSqc7m8OKoD6s29CXq
         Dr/aktye1+zhUyVb/cW+IrVfpNDIpGZO5iFio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xcTLnFw5QSNb20+MSOXFBGST1vvhFd4eDPVj5V31nBE=;
        b=SYDy95rpS2U8DuvALjvJGGEHomc2ZSWH00+/Yp+R2bVjHYpLGYCNCTPnvkSvxReJ7h
         7N9iww70bdeYASHT9i2e0DRA4yPes40vsPROvZdZab0QQ1H3+xRhR2fAfW4IU0kD7vxl
         MFjRV4y2/W3yvyapkJHVfEF5Zg3LHy/OfmVZEJtGxkPwnlXSQ2vG6vOEF/XsvEpPW8H4
         zJX6dkJRMnV2ZsNeMvdGk/yrflMHXa60vl7oGJC1HlfOqZDNgHqgpqylUBy+zTXQ36EQ
         dQwrrFE7VBLY6Qkkx0uEIAdGj0OcuDJdIul7l0WFZyUPIdRYmFsCiEwEm5/RTmvDOxRy
         HAQw==
X-Gm-Message-State: AOAM533PRvGH64Jqg95D1rG+hxSorn2CisTTXiIuOjcZxZNLHoiPMB5D
	EuKrUCEo0X8poig55k+CBJkrbCahUYcw+w==
X-Google-Smtp-Source: ABdhPJxrfe8D+lxiCbqkVvrYmHzYgx8lPQS8fk98Y3JC5WnHZBeMFf2zF2fbfJ7pSGpcYJ19wIOVSg==
X-Received: by 2002:a5d:5104:: with SMTP id s4mr3012318wrt.62.1614344472889;
        Fri, 26 Feb 2021 05:01:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:12 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/13] parted: Fix reproducibility issue
Date: Fri, 26 Feb 2021 13:01:00 +0000
Message-Id: <20210226130106.3925837-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
References: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't use tbe BUILDINFO line of host information in the Makefile
so remove it for reproducibility.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 -
 meta/recipes-extended/parted/parted_3.4.bb   | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 2d65b1d5e6b..ec8ac0bcc84 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -48,7 +48,6 @@ exclude_packages = [
 	'ltp',
 	'meson',
 	'ovmf-shell-efi',
-	'parted-ptest',
 	'perf',
 	'python3-cython',
 	'qemu',
diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-extended/parted/parted_3.4.bb
index db59189fa0e..79dad546878 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -39,6 +39,7 @@ do_install_ptest() {
 	sed -i "s|^abs_srcdir =.*|abs_srcdir = \.|g" $t/tests/Makefile
 	sed -i "s|^abs_top_srcdir =.*|abs_top_srcdir = \.\.|g" $t/tests/Makefile
 	sed -i "s|^Makefile:.*|Makefile:|g" $t/tests/Makefile
+	sed -i "/^BUILDINFO.*$/d" $t/tests/Makefile
 	for i in print-align print-max print-flags dup-clobber duplicate fs-resize; \
 	  do cp ${B}/tests/.libs/$i $t/tests/; \
 	done
-- 
2.27.0

