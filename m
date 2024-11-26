Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5959D65549
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 18:32:04 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.53883.1732645918765569383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 10:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HhrToAkA;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a736518eso9897325e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732645917; x=1733250717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngReJmOOZMReS0+J2UehkFfgmf2C0uJWOUdPkJhAdl4=;
        b=HhrToAkATTHpmEH1/ze5giLalL9vCyQBiSQhEzDdaEi9YZ+IBFiGEaKCPRkxWrbboj
         9BA5pSX5Rn5kNH00fXIdTzTjHycGIxITb1sN8xx4WHTekJn5wPp6Ks5wYUk6c00hppVK
         Vc28Dr/Y+sm5zcNXi4J30Eb6+qK+u9LsX7H/vG5eYbbeJMFx0D/xNp9Rj5WAnyB6xZz3
         OTABg4kuRJk/QUlVFfuNY/kW3BssvApilAUaOC4JggIpLQksPPW+w3cI3c8Lj+bWHoP/
         zGhDk8fIJjX67gkd5tgTag0tc0dXxaSEltbQiYii/xAO0EWTTBOCHeqGR9k3tWjQzu0B
         x/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732645917; x=1733250717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngReJmOOZMReS0+J2UehkFfgmf2C0uJWOUdPkJhAdl4=;
        b=ETBc8DyUREt+6PtgoMdIYkIQfwm92BpxzJ4NmhvblMWGuUMoKKEwdNd4JEVdbFlt9K
         fe9IQQZh/DA2RpIDN9PaTvJ5aMg3oiQzl9tAAlw/GfkT7chZRNh/EOwCspDUvzx2BsVw
         8gNpT4Ceu/sl3rvcliu15Ncnj87iLqJwa8evJcBgdXNnGhJqgiU8mMT3MsIprQGAOwFy
         NOKk8vkvhE9LD7iLQUkPQ6iCtNdF3cmbgPgcIgmt5MzO2uKSBlYwK8nSJcFSrRKMYJtO
         1IfEqSWR+OtA85+6N53oH5ae3r4mNpV7rbjBjkkjBibSvOLesNeNm1g2sxIn4U9vkDrY
         ls0w==
X-Gm-Message-State: AOJu0Ywam19mVx1Zy0pe9LynwFUd+f5MZTTZ0/7Zsgh0vLS9kPvT3Aad
	wPNTP4VkYEOZOI99H2UMTqNxalzQBkqmOCvlqL4hZJ+xznRh+kOiKs7Cbw==
X-Gm-Gg: ASbGncu/PHoMLtkL+i3B956i2a8SEH/Xl0dOwZq8U0aOtjPcZs1Fjt25WRNqk/k6qax
	mSOefgYVc58XxKjqq+a8jrni+iz6ZmfSgK6ExNpcbh+dvgBACPhafR4XrdpwS2+ds7FNxYa+IpM
	7f5hrpbcahIBl48g7gWs5BHqcfOYGV5wsul/ca16VRseW5LUpvwU6waJWPZkGNZwt1w26xTzKZQ
	PU/fs5ExsXjFdGfZ0f3u4Ymb1fvRKsn73LDwLZaEEddYYc4W7AvpBtxz/2geZQ5n5nwt3jhM0o=
X-Google-Smtp-Source: AGHT+IGiR/00mp3fEQM8OLnsbJgNWJZgsyl8p9HVOBOkVyh/UeCtNPCnK46JY3NT47PNNhpErcwmiw==
X-Received: by 2002:a5d:6d8c:0:b0:382:51ae:755c with SMTP id ffacd0b85a97d-38260bc6d05mr22398393f8f.46.1732645916543;
        Tue, 26 Nov 2024 10:31:56 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434a5f96236sm32368685e9.35.2024.11.26.10.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 10:31:56 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH 2/2] python3-isodate: move to meta-python
Date: Tue, 26 Nov 2024 18:31:50 +0000
Message-ID: <20241126183150.7417-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241126183150.7417-1-gudni.m.g@gmail.com>
References: <20241126183150.7417-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 18:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207883

python3-rdflib was the last consumer of this recipe in oe-core.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/conf/distro/include/maintainers.inc         |  1 -
 .../python/python3-isodate_0.6.1.bb              | 16 ----------------
 2 files changed, 17 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-isodate_0.6.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d61b88f7de..8648f8caa8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -644,7 +644,6 @@ RECIPE_MAINTAINER:pn-python3-imagesize = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-iniconfig = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-iniparse = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-iso8601 = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-isodate = "Leon Anavi <leon.anavi@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-installer = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-jsonpointer = "Bruce Ashfield <bruce.ashfield@gmail.com>"
diff --git a/meta/recipes-devtools/python/python3-isodate_0.6.1.bb b/meta/recipes-devtools/python/python3-isodate_0.6.1.bb
deleted file mode 100644
index 293fb08277..0000000000
--- a/meta/recipes-devtools/python/python3-isodate_0.6.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "ISO 8601 date/time parser"
-HOMEPAGE = "https://github.com/gweis/isodate/"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
-
-SRC_URI[sha256sum] = "48c5881de7e8b0a0d648cb024c8062dc84e7b840ed81e864c7614fd3c127bde9"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-numbers \
-    python3-six \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


