Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E0FD2ED18
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:35 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5047.1768910967954588767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1k0XHKQQ;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43590777e22so273265f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910966; x=1769515766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43uA3w4veefmnXhnhAd7FGhTHNfEexB0CNExXSaybxw=;
        b=1k0XHKQQR3zW8yUIX4Di6jqWQ6rs5I0wejrcM+zVKjo70qf9Zw1YtvFRDH55UcsK4c
         FgQA4The6naLcZoLvz8fyVzBM1+MgYSxPs96BMdrQMDdz0wNAn0h58NGJqCkleOiIfdu
         9FPsRgxRK4TnPDyZUXij8jcn04tGC3rn5+c5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910966; x=1769515766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=43uA3w4veefmnXhnhAd7FGhTHNfEexB0CNExXSaybxw=;
        b=sgBqBAO3BP9xXqGQCwWSS/61Tag1/uzRDrRxW1mRGOMtWO+LYhCLLDLrLgaF1yVyIw
         Hfx04oil3qihVDicKgtlA/xi9Mr08sr/CjqnXdfy4QM1VDbnxy2SRmUWqjuMvVdLvdwS
         rwdnEVm7a7DaLyBsr7WqkxeyrwpJ8G699au8pTL0rNHRvEJKR8PT5O8dGckzSG0BRbxi
         4AUYDtJk4VoGsRIagQcPhzeTgv3rJNkfDSlpqw/fg4+vG/52eYmqA/uVlI2aRv+d09UV
         vafNvQz1jduh/AxoISVwUY2uyHJz8bOlaGex/4CR+1FS2xNSDUD5Er/YN1fiF0wvRe/K
         cyNw==
X-Gm-Message-State: AOJu0YyE48VeIEbJs2Pm2LACoceslhbGzS6g9ZXXGIkm91vepSCF7UI9
	KcGghqgh6Y5WWSz24Mq9SfdHpn6lIKq0T0mHil6Z0D4JbvBUM7ie6ILAIQMt0HC+YpP2ZLnPuAN
	VZHZL
X-Gm-Gg: AZuq6aKiiDb+UVdyIEaVDs4Nw88Lf17y1ed/LaGlBL99dskoNGYTRjV4SskP+bHFbE3
	Hp02wRfhbMRioRgV+Oe+Lvxv2oJhnXpGeSlwqs1hMskEeyK9lx8fsvrtrbyj/gzTRmMPS5kIETG
	06tpIvZwmo25ZccBXgAm7xWPYTuvbCPXLP5iD62+2JP1v5GPCk2iQg8I+zz8Vg5sMxl6CK4BLmb
	xrZEl+vV8FiLATRsXOOqkwuOPr0NPN5jtmLCmr0GFbpz0LRUXN9a5/Lvv09r6k7LZn0hbpkm0tx
	nsmFzkdpg1pWWWDTxTpSM7TGlYYrvzjcKuedv8qYZgpnfR5KGf49WM0Bsq/QGdZh62zpIKf5Cg7
	wpKwOtBSy4qv18fxGRi8WB3QRGRrqVdLDgfbqqR6Adim7eBpoaVF5Pc9ZRY1xSabp6iN2PaoFNP
	8GZMdzWAx8YewdPlScLOFsbhbvGBLTmK97oH1jPwdMuAYCDrUor8QwXbE6seWFxsI5xOJl5fyT4
	uYO9fXW9v0kEddCQ9aQfYAv3j/CGQZl
X-Received: by 2002:a05:6000:4022:b0:431:a50:6e97 with SMTP id ffacd0b85a97d-4356a051a63mr15632079f8f.34.1768910966079;
        Tue, 20 Jan 2026 04:09:26 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/22] pseudo: Add hard sstate dependencies for pseudo-native
Date: Tue, 20 Jan 2026 13:08:34 +0100
Message-ID: <714fd40e1f2d7c1d8568f5cb02b23c1075c1c328.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229698

From: Paul Barker <paul@pbarker.dev>

Where a task (such as do_package) runs under fakeroot, the corresponding
setscene task (do_package_setscene) will also run under fakeroot when
restoring from sstate. Assuming pseudo is used as the fakeroot
implementation, we need pseudo-native and all its runtime dependencies
to be available in the sysroot before running any setscene tasks under
fakeroot.

We already add a hard dependency from all do_package_setscene tasks to
virtual/fakeroot-native:do_populate_sysroot in base.bbclass, but this
does not cover transitive dependencies. So, extend the dependencies of
pseudo-native:do_populate_sysroot_setscene to ensure that the sqlite3
library is also available in the sysroot before running fakeroot
setscene tasks.

[YOCTO #15963]

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c146ca657440550e00bc5e53d13502ef7aa945b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 7e09b6d58c..9c191560fb 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -156,3 +156,10 @@ do_install:append:class-nativesdk () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Setscene tasks which run under fakeroot must not be executed before
+# pseudo-native and *all* its runtime dependencies are available in the
+# sysroot.
+PSEUDO_SETSCENE_DEPS = ""
+PSEUDO_SETSCENE_DEPS:class-native = "sqlite3-native:do_populate_sysroot"
+do_populate_sysroot_setscene[depends] += "${PSEUDO_SETSCENE_DEPS}"

