Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17E1E66883
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 19:38:34 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web11.54203.1732390706795137412
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 11:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RtNz+41h;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: hiagofranco@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5151e429d53so91707e0c.3
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 11:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732390705; x=1732995505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atb25WKL44/D7zlQkVjtAM4s/z/QxPUmc3bFsUIrqx8=;
        b=RtNz+41hMw3GJHCvXv/HFHMVYfMBZqFrUmJ7viTQLBqdQdHMaVNyuxhNwvHPIDjmNZ
         eSo7LCzjhyXhWiOsDLuKvmLbzwRsYyFjSYuE6i2BQD0tPbvwyRMBgxQM/W6p7CCr+A9b
         Zf7xwq5K87izRfvGBJ46cHaHcXpDgGYBc/ha5SMB3nYJT41V+wpAX74X0PKHqFcWITm5
         ZmblmlbRMzEHyt6rxVU6tf7Rz6YTS3bbpCzYBFPsngTEsM7tWNyNpZ8Ctw2fs1WufrNv
         8ovlXkLnYEAIh6dtqk9WCjiqmFrxhMWgeHnf4Yg46A/UU8AuTyfR4SnIs7y7DR4fOgqJ
         jNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732390705; x=1732995505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atb25WKL44/D7zlQkVjtAM4s/z/QxPUmc3bFsUIrqx8=;
        b=O5ptvBYoU1grKvVTfd8ffuNvvyOh0S6F3kJzuliobi/sXEPYMY95kjjNmjpI4EbkA2
         YKA2HXkpGgxg6P8EbL1/nuEJKyYKxH4xbrZl/3r1cGKNGzPqq3chdEMYAK/P+x4wHuuv
         YJxpdqDdLL8z0HIVr3SVwFH7hHlWPSb8f79jor+zSdXU5C8tHVYA8hFgPE463WoFarll
         U+QIB7qXbKTsuotLWLM9Yg96U3ZcrvvqHuw1OT9eUpCrzJ2tu+7vvGjSMMLpYPw/OTnW
         x58R3UAnHWTOkmVb4HWj4FG9fgruDn+R9xJfIPJY4XQZLaorNGEB3Am/TBOTDrF/bmAk
         I9iw==
X-Gm-Message-State: AOJu0YwPHE7lRIRDK8oAvmU3Goh59wkmaffOeLqTZ0hg/ACBYW5mAvf9
	7QLiWlTZd657UJAdFd0UwV7l5ZgPoX8euTOM5OEJCrRAY7E0M2Fx9WpK8g==
X-Gm-Gg: ASbGnctCnmkQCpJF7djzXqrWoG6VTkRs1E193jIIfsXZxiMxW6Ap81coExTlk+e9QdC
	Kkn9q60zvBxR+TeZUXc6NlPv1AkyL3s1WlFEnWLG7LCBhUcKHoKotPJP+rEu9/DtU5Oo7xGyGjS
	/R6i9NJ50MTMh7Kxneh+ogsoaxsasG0QRumghPAiK94gXLE2fKL4sUDgdK0YSWptOJ+YP5FHrXj
	IrOgYxjOdzlQuGT3q3cDpXJC9I42BsqRXMKjxTW8mH6jzJrIwI=
X-Google-Smtp-Source: AGHT+IHWLagF59z7HZFoIquKsIncCC+N17WnUj8JMJeoea7KsEDOsj/LWii4oVMRdTvo+lWJsXYNkA==
X-Received: by 2002:a05:6122:4d8d:b0:50d:83e1:94fb with SMTP id 71dfb90a1353d-51500ad9579mr7816108e0c.12.1732390705318;
        Sat, 23 Nov 2024 11:38:25 -0800 (PST)
Received: from hiagof-nb.. ([146.70.98.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-514faf3a95fsm508162e0c.15.2024.11.23.11.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 11:38:24 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2 2/3] libdisplay-info: add recipe
Date: Sat, 23 Nov 2024 16:35:28 -0300
Message-Id: <20241123193527.1435268-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241123193527.1435268-1-hiagofranco@gmail.com>
References: <20241123193527.1435268-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 19:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207692

From: Hiago De Franco <hiago.franco@toradex.com>

libdisplay-info is a EDID and DisplayID library. Goals:

- Provide a set of high-level, easy-to-use, opinionated functions as
  well as low-level functions to access detailed information.
- Simplicity and correctness over performance and resource usage.
- Well-tested and fuzzed.

Since commit a16598b038b2 ("backend-drm: make libdisplay-info
mandatory") from Weston, this library is now mandatory in order to
build weston 14.0.1 and newer.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta/conf/distro/include/maintainers.inc         |  1 +
 .../libdisplay-info/libdisplay-info_0.2.0.bb     | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 04208ebbf22b..53bb9d024e8a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -325,6 +325,7 @@ RECIPE_MAINTAINER:pn-libcomps = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libdazzle = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hiago.franco@toradex.com>"
 RECIPE_MAINTAINER:pn-libdnf = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libdrm = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER:pn-libedit = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
new file mode 100644
index 000000000000..629f0d420fee
--- /dev/null
+++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "EDID and DisplayID library"
+DESCRIPTION = "The goal of this library is to provide a set of high-level, \
+easy-to-use, and opinionated functions, as well as low-level functions for \
+accessing detailed information, prioritizing simplicity and correctness over \
+performance and resource usage, while being well-tested and fuzzed."
+HOMEPAGE = "https://gitlab.freedesktop.org/emersion/libdisplay-info"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4426409957080ee0352128354cea2de"
+DEPENDS = "hwdata-native"
+
+SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https"
+SRCREV = "66b802d05b374cd8f388dc6ad1e7ae4f08cb3300"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
-- 
2.39.5


