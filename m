Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F314CCCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:45:51 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8055.1762461950203685734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tv6sIMgf;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2955623e6faso434095ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 12:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762461949; x=1763066749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIG17YdpOBsZGC09k+pdeHG4+tg+lYVcDW/i2JEIMH0=;
        b=Tv6sIMgfLPN6RGXRNrqti44YrKHuk3RY+2SiYI/qe5yGeE+4ckeN7ZZ9mERTBAztyE
         8oU/4Q5wXAw4mqyMZaglFV0hhN2aHfRYt3N1DToSMnYTkz7ovUrayABuDQhnAMwQuMpT
         0bYFkNi4yQqQ35fnFC4mKu1V+ufStk5wVw+114n+9x7ioPKMtYzCutBSHv9mYlkgbJbv
         ZzpOT4wUJ3k+QBjDsGz72NI314iZtITXN/9jj6W5dffePy4xiv+8qiXKkBnU3dXTta5f
         tEO2KuXNa6l9CUpvznkBqr3g/8nyQeeJdbrAH43DxFl42Hr6KHsfh4gkHj2veCduAfAt
         xe+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762461949; x=1763066749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zIG17YdpOBsZGC09k+pdeHG4+tg+lYVcDW/i2JEIMH0=;
        b=D/jL01ijKlVdLpnsmogAuwYwrqwuaPKtZRgkgPQyFuHE7lqEEE6O6uXb9fw+WZszLI
         GPIXQB3WHojcyhoJUYcu/Sn8Fp1HvRXGimUXgb2ToMqtPIjmtjQpG8Nfw8s/Gnd2m4fK
         Rt7jz0lKsCWN8/7a0O8nyVMhpMMcRqJOA1o5bG4CrjpNf0wWLb+3ulPzKcDPwPKpWWiD
         29QTPGcsr5Gds4xwpCfX/bCYfFAasMnNSezKAhjFzJVFNJpuMnsXsA/Ner19rZk8tYGr
         tGl2CvPrVUO/y0s7Tvazun4t0j17o9deFO09iIWx5iXsRjYn89J1iB0OkCnBCiqtJ4f9
         bVTg==
X-Gm-Message-State: AOJu0YzbDqUvFIUhfc9n0mExsRxsBqh30vA4QAGwpsA5l+oiucpJPDq7
	a6dTSl6HvVJPAvbieKhljC1X7FMEf4wITPAJBlD1poqlfXGlC0KyVZMYzUIz+A==
X-Gm-Gg: ASbGncvpdNKkEtuCcRd4wjh0TkXPRYIvHoArmCwotygy6oiTblE21NG9qHCV2xpUw7e
	QZ1/8pcFr1Pqm/Aa0+MY7dKes0CkAG5IPJ5ilwDir8WV/HJk3eLPh7KfNWl1lF5c71aNmeeUb9u
	GUcEU9MYMRKRe6T4bX2+FtGHruJMEDa5j1V7LYkFSggaomimf9mCA+iMAjrobTzfs4BkVlHVM2t
	+TsDsbUc62PTP2QchtY41k8am87y35vbYYjFxoEjZfnaegu8bSA9DRVLvRMc+7HQuCa5jQiHM/1
	+bowh9+QJI2j78ivfDl7imkIQ3J8VeP6E9A7qzzFxGAZXiqri2sv4Xm5yV/uPPR/3iqANWOh+fx
	J1T8uvVBr445OcFQXmce644/vUutvmyFQ6LPqHUfVUHH5y1FpT8aN75vw4nZzUZv9QHE+nyoBc2
	KAobPchY5n8F4drA==
X-Google-Smtp-Source: AGHT+IHzIHDYqxUhFd/NPaafBZasjPBk2o2ruOw/GSyKsz8W/U0Rm1YpaTw6sDkEQfh6VkjKXCOpZw==
X-Received: by 2002:a17:903:4b04:b0:296:3f23:b93b with SMTP id d9443c01a7336-297c03d1c79mr12592675ad.2.1762461949396;
        Thu, 06 Nov 2025 12:45:49 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cb47dbsm37527085ad.96.2025.11.06.12.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 12:45:49 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 3/4] libproxy: upgrade 0.5.10 -> 0.5.11
Date: Fri,  7 Nov 2025 09:45:35 +1300
Message-ID: <20251106204536.2079412-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106204536.2079412-1-ankur.tyagi85@gmail.com>
References: <20251106204536.2079412-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225998

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/libproxy/libproxy/releases/tag/0.5.11

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libproxy/{libproxy_0.5.10.bb => libproxy_0.5.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.10.bb => libproxy_0.5.11.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.10.bb b/meta/recipes-support/libproxy/libproxy_0.5.11.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.10.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.11.bb
index 21930ada00..1efa3cdc0e 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.10.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.11.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main;tag=${PV}"
-SRCREV = "7e4852f9658084c61a95973b8a1d720b1763437a"
+SRCREV = "3fd3a6e845c0386d91abc742453d0f29bf28c404"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
 GIDOCGEN_MESON_OPTION = 'docs'

