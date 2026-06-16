Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264E0CD98F5
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:17:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5791.1781637413855236839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KiIMwZAb;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4624c1409c9so85427f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637412; x=1782242212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L9T5xWH4uxlWEACCC6/GniA/XcpvXJUSVtbqT6pPMo=;
        b=KiIMwZAbJJ4lFMQ7eak2la68MH6/zR2o3Iv2DtT3Jj6fNLjUAvr4xEKXS5QdRadvX7
         9xi4VQlArfuXUYDX7gcmy0jN6ZujuzTs8pQT/ykBX9ywQsGyssDMRaRkfTkX6+M6M+Yc
         zP/5PWuxEcIuF3YSIhO3J8wr4hB1rX59u6jVzU+PMWLo8VPOSQRnZFVGdZKIMpT+L45t
         dZM1WuUG58wr9Sy3tVkzoftOVzqqikbfCcStBjH+E0WyPyd1nydRneyqgFLNwr8AZMm9
         gkilm6bp2Y4QXjjM5DGA2Qye5EApfsHT85sh/zM47PpE/D75RgQR2gNVu850j/WOJ+/3
         uDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637412; x=1782242212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2L9T5xWH4uxlWEACCC6/GniA/XcpvXJUSVtbqT6pPMo=;
        b=CZw2O9/+7MpaSKk8L/mEp4Ls7W7g9JdtprzbqFJ4xuYB1lkR41feywG61uCJtg3lQ6
         grfdgtxD2T4U+WxbQyJH1FhufMe2Ycw5qma2yn8lQZsWBn8T90pVAsmB3IlwC1907MSR
         8U3qHZ5VJY7JH37DsyCU69nUiZ4IcrVS2laddm3JEEDw18dStVomDyawIlgbDUtVd8O6
         NVsDDTsqGr7k8Dk8KS6b0ZhBUA4+euq1dGvKy/iCKdwFOhelWYj7cYifQWbUu1+KfJRy
         z3ogy2AxkJVSoZjBoqfqd0qA7eeAYmjcEPsplTbnlCJ9YzJ0kCfPO4q+ljKHP0uF0ktI
         Tk2A==
X-Gm-Message-State: AOJu0Yy6Vot9oKC7IJtAHXsdgpXYTkqzdKmzlsCRWjB8x7yNQwCmPwb0
	nqQBo/7lFDG2zf0zMVGSMuEWWVZS7CK3GQIqp4l/38djulRovOcmEbD/MdXIppEs
X-Gm-Gg: Acq92OGWU7q2v/P78v0yKhteSbIM8kF1P7TkdOib0yLCf50Mr8Q6pgeVNR4Dk3bocIa
	4PBAGGrdM2nDhHtztHxymWhdtKu3KXffXzKCBjpjjkyx3bjaiTdDAKP9HDgWJ2nV8kIIzSEzrj3
	3JvcX5sLTOkD5Xgvn4mwj8Th8WfRDI9Y5iqxOlug307sZ/daER4SogTlgQBvDYC+pB7wohZBUXM
	HmIJErjuMOLPldmoUFoeCoCpYD/ksbHF0rqKAwWwxXVsNs2Mf4IfjD2/HBoPMOV0HZX4qxPhd6F
	ZLACUC8u6IUTi0nIY78XM4k0m/96cnX/NMn8rcZqbmyBvyG8V/EEoEiCx0xV+ooB0i6JxY7/8Q9
	73L4nTdaNYgOIImulOBuj7hsop85uuiAnvcnpQ7Phheu/2WzCo0zXDnh+xMX/CToHSAqDvyxY1I
	ZR93hwd1ig5oKb6NECV3qQ8WgssfgnTQSfgt2ZptCWM8TStCj5qGhehpzSJfw=
X-Received: by 2002:a05:600c:3e83:b0:490:b025:f324 with SMTP id 5b1f17b1804b1-492333dd091mr11773575e9.32.1781637412033;
        Tue, 16 Jun 2026 12:16:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/30] jansson: add a recipe from meta-oe
Date: Tue, 16 Jun 2026 21:16:15 +0200
Message-ID: <20260616191628.2014553-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238944

From: Alexander Kanavin <alex@linutronix.de>

This is a new hard dependency of igt-gpu-tools.

Adjust:
update to latest version
correct CVE_CHECK_IGNORE -> CVE_STATUS

License-Update: dtoa license used for dtoa.c per https://github.com/akheron/jansson/commit/2297a2e320ebecc6dc98f7034a2f38509ad1d7f5

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc        |  1 +
 meta/recipes-extended/jansson/jansson_2.15.0.bb | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-extended/jansson/jansson_2.15.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 86048e791c..001b41ffb9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -298,6 +298,7 @@ RECIPE_MAINTAINER:pn-iputils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-iso-codes = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER:pn-itstool = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-iw = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-jansson = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-json-glib = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-kbd = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-extended/jansson/jansson_2.15.0.bb b/meta/recipes-extended/jansson/jansson_2.15.0.bb
new file mode 100644
index 0000000000..fda7a54ed8
--- /dev/null
+++ b/meta/recipes-extended/jansson/jansson_2.15.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
+HOMEPAGE = "http://www.digip.org/jansson/"
+BUGTRACKER = "https://github.com/akheron/jansson/issues"
+LICENSE = "MIT & dtoa"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9911525d4128bee234ee2d3ccaa2537"
+
+GITHUB_BASE_URI = "https://github.com/akheron/jansson/releases"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
+
+SRC_URI[sha256sum] = "070a629590723228dc3b744ae90e965a569efb9c535b3309b52e80e75d8eb3be"
+
+inherit autotools pkgconfig github-releases
+
+CVE_STATUS[CVE-2020-36325] = "disputed: upstream considers it isn't a real bug per https://github.com/akheron/jansson/issues/548"
+
+BBCLASSEXTEND = "native"
-- 
2.47.3


