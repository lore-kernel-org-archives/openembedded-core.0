Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADE06C1BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 20:10:29 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id u6so8198128pfh.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 12:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0PirIaUmrHcHMLFHxt3nnpX4dRi3oQr9JldN64N5m40=;
	b=tAA/NCjo/ojEJys1lgoFDL7gdo9d+UmM4+8FU++J5qLAXQLXNPfoU4woFhSUhyzSh8
	LN9jqzGqGe1S4IZYBTiMp87DAD/eYjmPGvovhvOfi9DIezwgHuXTmUjg2l71JVRRIiMO
	+KpYX1x65gjFZD6o19tAPX/tYgCOOnbH1Ijp2m69P3QFeAhhGRbBSq7M9oyaQzJbAJB2
	LgxKz/nCat21zpVNUD/X0VqXv2iPjnyGY1jgkNokIyhq9nmgvfoFKJoHQJ4gYPK9jZCd
	TBfX5ZAL4OsmT+xpB9FVobBzDOH60H6oqm+4/MujKO7WFZu+J6lP/eNGOtiyDOoOhZEW
	egDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0PirIaUmrHcHMLFHxt3nnpX4dRi3oQr9JldN64N5m40=;
	b=bfoGNjJuD3L6DSS9JZGGSO/ABNUiruE+mWMmmpBxZ1kn7Tc002hjSHkrEw1P6KZkkm
	P5lD40mALt/iMq/IVZSHGVSr71dqfYt8ah/AfMlWISVVNQlheviyKWc3Nnlce8Lc5V6M
	WCyLxTaei0oPrUk+9Ky+lPzSeVicx8afLrRH6DG3f9beH/qAcQQjDPICnZ98vzztherr
	afIQmOu1/v0Vwe+yX6lPfwfON0s+2CA6jBkm7NlY9qLvcbXqqnekT+KG6VXD6jvkth3U
	HLRJHI1EknZzIBeM88EyMU0mfoCHs43VL2xs0/DI2k0aA0zFp+SXSuldntbzCgtOtncv
	KKIw==
X-Gm-Message-State: AJcUukeyv8XoYKCIFWJb56MR2NKcVK49hNQ0RUNAGUxRbCmVcHn7plI5
	6P/mFWJYlDc44tpiE56wAg8r5v8/80k=
X-Google-Smtp-Source: ALg8bN4Yi1MT7T60MllNhPF/Z+BKEAVhQKKk60aNsONtnHr8P7/3865uGnPHz8gz/KrS+itu5f3mZw==
X-Received: by 2002:a63:ce50:: with SMTP id r16mr19909154pgi.217.1545855030135;
	Wed, 26 Dec 2018 12:10:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	l3sm60029493pga.92.2018.12.26.12.10.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 12:10:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2018 12:09:53 -0800
Message-Id: <20181226200954.5267-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181226200954.5267-1-raj.khem@gmail.com>
References: <20181226200954.5267-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] ffmpeg: Backport patch to fix build with gcc9
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
X-List-Received-Date: Wed, 26 Dec 2018 20:10:29 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...cess_template-remove-FF_REG_sp-from-.patch | 31 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-postproc-postprocess_template-remove-FF_REG_sp-from-.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-postproc-postprocess_template-remove-FF_REG_sp-from-.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-postproc-postprocess_template-remove-FF_REG_sp-from-.patch
new file mode 100644
index 0000000000..83fb4b81af
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-postproc-postprocess_template-remove-FF_REG_sp-from-.patch
@@ -0,0 +1,31 @@
+From c1cbeb87db4bfc6e281e4254a6c7fdd3854fc9b9 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 20 Dec 2018 22:40:06 +0100
+Subject: [PATCH] postproc/postprocess_template: remove FF_REG_sp from clobber
+ list
+
+Future gcc may no longer support this
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/c1cbeb87db4bfc6e281e4254a6c7fdd3854fc9b9]
+Tested-by: James Almer <jamrial@gmail.com>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+---
+ libpostproc/postprocess_template.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libpostproc/postprocess_template.c b/libpostproc/postprocess_template.c
+index 485eb5cfc0..b0adfd168c 100644
+--- a/libpostproc/postprocess_template.c
++++ b/libpostproc/postprocess_template.c
+@@ -1317,7 +1317,7 @@ DERING_CORE((%0, %1, 8)       ,(%%FF_REGd, %1, 4),%%mm2,%%mm4,%%mm0,%%mm3,%%mm5,
+         "1:                        \n\t"
+         : : "r" (src), "r" ((x86_reg)stride), "m" (c->pQPb), "m"(c->pQPb2), "q"(tmp)
+           NAMED_CONSTRAINTS_ADD(deringThreshold,b00,b02,b08)
+-        : "%"FF_REG_a, "%"FF_REG_d, "%"FF_REG_sp
++        : "%"FF_REG_a, "%"FF_REG_d
+     );
+ #else // HAVE_7REGS && (TEMPLATE_PP_MMXEXT || TEMPLATE_PP_3DNOW)
+     int y;
+-- 
+2.20.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
index 7d1af04047..0c227b7fc9 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
@@ -26,6 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://CVE-2018-15822.patch \
+           file://0001-postproc-postprocess_template-remove-FF_REG_sp-from-.patch \
            "
 SRC_URI[md5sum] = "ae0bfdf809306a212b4f0e6eb8d1c75e"
 SRC_URI[sha256sum] = "a95c0cc9eb990e94031d2183f2e6e444cc61c99f6f182d1575c433d62afb2f97"
-- 
2.20.1


