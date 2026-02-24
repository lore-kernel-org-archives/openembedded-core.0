Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75339F3C986
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:41:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21851.1771944072467727196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CT0PEjFl;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so69702215e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771944070; x=1772548870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uunZ7kLlG6U1WfBKfGI+530BWPBmgkWwEPlKexkTC8A=;
        b=CT0PEjFlB7TIaj34Fm5sW2i29GDcyFajibl/CBjpcrnWIvxFF4S1Xhls6pv69eeI4N
         sa+youVkJI31pbrLHWNITOHWb24OFeTZpOtVbhaXGHE29HtX6ZErE/4Ul27+crUpS1DZ
         Y/E8s+bVcRT9vBcQJ0sPcW2HGLElNksv/r3vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944070; x=1772548870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uunZ7kLlG6U1WfBKfGI+530BWPBmgkWwEPlKexkTC8A=;
        b=Ebg0vGBlEV1zvmvv7RB6XgpELrYHLs6/IHzqF+ja8I4yfhffZfDIUrda4SFrLtpVCK
         gwmn9GBXlEF2asvPk6W82+3YH9qVncETKwIN8wu7JcPyYEDSeUuyc+aoT9Bj+0goJQHE
         YMkjT+cBYkEEF2WpV8Wu16qiy+jeBtdN31+mqwRezfMJTSyhdHZfu/5qCVPDlinsjds+
         nDUtX/GjQ36dQGdXKIzkXwUW8vWvb1RmNg7x9OyorVygwfqdchrcYT7etqSGhk3E+Yf0
         x79Vo8vJydGAb0HLD87mbGjf+qEB4D1/AEJ/MGXVvdPwf+FGdkyrV/aCSq+5XbhgT1Sp
         twqQ==
X-Gm-Message-State: AOJu0Yyr3wlicRtVD1bVXocPzBe9msiNHNyat5j7SbXwyktxfEUXykgv
	1xv7JkJ+IngbCbR3bm3PYjs9ohuf95bAl+t4nQ+Wu5wPqKruXxhcf5NYYLSpnRtKrH7WtK0hoyH
	pG7yl
X-Gm-Gg: ATEYQzxf57HUrM062TaqW4wRMWQKPYpg2WbxsZNdAriSbzQ+UAarUPhyifaPYzZe8V8
	/6c/X0a+texiUGbHvSsod0iFvpUuPo+3gyJR/HKGIdB80hnI0I1OeVMKMOzlkSrcVwyuUHqWMvQ
	uJ6dSiubag4c0ZR9b7Tx5HraoBEAH96HxrL2PCNdELil78WC8sI+pcY9ze7Oeacz2+YVIMYTJm2
	iT9NPHff6yNzwcm4Cnje93TtBAzJAQXC5lOAvayX4LLvxkuxFvb8rW65gBzjv2l2q+rDHIksP2E
	OeAbEl/THRPLcexIUuCqumOhfKjaU8Ss5jMIoUnUEaBGiSrVjDM5vxzWHC003Wdg906ac2ViXGT
	IIMZIHjCJNVCX9fFTZ+23xJpGo7tVXtS4DXKkJpVP5Pcd6P1S2k0bBh3VcjF1IN5+btKwy2F+Ej
	EApKwTERUQKP+zbtp7Sxo4iKgnrpGbcj6Qef0hLX3KeXMGhDVdWQFqKXO2xpCH1qQtqEyOr/4oS
	O7ZXIvHfKRNU15E1NtNrrCBBquH478XtQ==
X-Received: by 2002:a05:6000:4310:b0:437:4872:fc83 with SMTP id ffacd0b85a97d-4396f17b92bmr22690931f8f.33.1771944070430;
        Tue, 24 Feb 2026 06:41:10 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm28711195f8f.25.2026.02.24.06.41.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:41:10 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 8/9] glib-2.0: upgrade 2.86.3 -> 2.86.4
Date: Tue, 24 Feb 2026 15:41:01 +0100
Message-ID: <e0db8b99de2e50d362450a4eed0cf2dd56cee909.1771943829.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943829.git.yoann.congal@smile.fr>
References: <cover.1771943829.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231860

From: Peter Marko <peter.marko@siemens.com>

Fixes CVE-2026-1484, CVE-2026-1485 and CVE-2026-1489.

Release notes [1]:

Overview of changes in GLib 2.86.4, 2026-02-13
* Fix several security vulnerabilities of varying severity (see below
  for details)
* Bugs fixed:
  * #3858 (closed) glib-compile-resources: Incorrect compiler detection
    on Windows when building GTK causes a DoS (L. E. Segovia)
  * #3863 (closed) Iterating over a short (preallocated) GVariant
    bytestring invalidly refs a NULL GBytes (Christian Hergert)
  * #3870 (closed) (CVE-2026-1484) (YWH-PGM9867-168) Integer Overflow ->
    Buffer Underflow on Glib through glib/gbase64.c via
    g_base64_encode_close() leads to OOB Write (Marco Trevisan)
  * #3871 (closed) (CVE-2026-1485) (#YWH-PGM9867-169) Buffer underflow
    on Glib through gio/gcontenttype-fdo.c via parse_header() lead to
    OOB Read/Write (Marco Trevisan)
  * #3872 (closed) (CVE-2026-1489) (#YWH-PGM9867-171) Integer Overflow
    on Glib through glib/guniprop.c via output_marks() lead to OOB Write
    in glib/gutf8.c:g_unichar_to_utf8() (Marco Trevisan (Treviño))
  * !4946 (merged) Update Romanian translation glib-2-86
  * !4955 (merged) Backport !4954 (merged) “glib-compile-resources:
    Always assume MSVC compiler if VCINSTALLDIR is set” to glib-2-86
  * !4961 (merged) Backport !4960 (merged) “glib/gvariant: add failing
    test for bytestring and fix it” to glib-2-86
  * !4979 (merged) [glib-2-86] gbase64: Use gsize to prevent potential
    overflow
  * !4981 (merged) [glib-2-86] gio/gcontenttype-fdo: Do not overflow if
    header is longer than MAXINT
  * !4984 (merged) [glib-2-86] guniprop: Use size_t for output_marks
    length
  * !5010 (merged) Update Kazakh translation
* Translation updates:
  * Kazakh (Baurzhan Muftakhidinov)
  * Romanian (Antonio Marin)

[1] https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../{glib-2.0-initial_2.86.3.bb => glib-2.0-initial_2.86.4.bb}  | 0
 .../glib-2.0/{glib-2.0_2.86.3.bb => glib-2.0_2.86.4.bb}         | 0
 meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.3.bb => glib-2.0-initial_2.86.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.3.bb => glib-2.0_2.86.4.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2e15cc7675b..d1f25ef8f21 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -237,7 +237,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "b3211d8d34b9df5dca05787ef0ad5d7ca75dec998b970e1aab0001d229977c65"
+SRC_URI[archive.sha256sum] = "d4e2b5d791d5015ffd8c6971ad8e975a0a55c1a14926cdb25cf843ff00682260"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

