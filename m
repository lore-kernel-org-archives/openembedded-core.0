Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6CA731A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 11:53:32 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id a66so54295881wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 04:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hze2+GW1ytb/b9BVPcyTtT+euB2wdg9ntcGxRnvd+U8=;
	b=yM8RwiRkn4Lxn6FT7dKLq5YvoIH7qxlJCbvUnXVXGEUUcS42yuSB5jFEdaGRxtjC8S
	UrwCgL8tirTJig6tAG3S0rm4h7F/SINLGsmAY76y4AnhQ9KcIPkupuDlVkNKXKtI1Qal
	8ARFZI24J9de/NTXTwhymRpv6NoLV9IihQ7rNty2C88oAKRwWKRzPOGbxw7qlmkm/cdU
	iZMeTpJhxhMIHCm49uiCmsmeuRv3VuhB4a63BcIIoeNfWe7BeTAxmQdxgH4uJeHDi0os
	dXoM+Y+uVYk4NdL88WiqzPp8JkUIR5mqTRcbDH6tGzfE1lQNMgudXFIvMpgMkg2YY8T1
	FWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hze2+GW1ytb/b9BVPcyTtT+euB2wdg9ntcGxRnvd+U8=;
	b=PkdF9Jh9yw9i3FEeREiNvb9UyE1GtCYcLbzaPY+i/VKb2Y1QyzKIWZm/VMMdv1Diyj
	zeaOewDebG9gVF8XYzccebKaJpOTsCc37tuyc2Kt43E756bLi/+wCDU+2lEocqunY+Jc
	9n4CcftLeFcrLnG6Wplqu7DNG+9HauLllfHqYKYLVX9YL2wFG0Z9nzYOVWOEdEIYeUP8
	3gcqni57Lm3m6GfTcH+n9m3IRVjd/ibyhk58QLomp9tdSxcS9socS6r1Iqds6WGlUK0K
	CmvO+GmKxg1LNi3CKMHgia5ohwXqJeDUWYYH02dMpRjRaMZkWSmCre/S29NaUcjX4ejn
	ZCfQ==
X-Gm-Message-State: ALyK8tL7w+PJnMFZMBlSez5zqXY9geC6+tDQhYGB18SiElkdh2eQKp8HTpQNbr0f7TrSzzxe
X-Received: by 10.194.80.70 with SMTP id p6mr176604wjx.45.1466078011911;
	Thu, 16 Jun 2016 04:53:31 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q69sm2140010wmd.4.2016.06.16.04.53.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jun 2016 04:53:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2016 12:53:28 +0100
Message-Id: <1466078008-22339-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] autotools: ensure Makefile exists in do_compile
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
X-List-Received-Date: Thu, 16 Jun 2016 11:53:34 -0000

If a recipe is using the autotools class then presumably it is using Makefiles.
However the default do_compile() is forgiving and silently handles a missing
makefile, which means that if a recipe is using a hand-coded static Makefile
(e.g. git) but doesn't use brokensep the recipe will fail in do_install.

To make debugging this easier, override do_compile in autotools so that it fails
if a Makefile isn't present.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/autotools.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 03a61c3..1c884b4 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -312,6 +312,10 @@ autotools_do_configure() {
 	fi
 }
 
+autotools_do_compile() {
+    oe_runmake
+}
+
 autotools_do_install() {
 	oe_runmake 'DESTDIR=${D}' install
 	# Info dir listing isn't interesting at this point so remove it if it exists.
@@ -322,6 +326,6 @@ autotools_do_install() {
 
 inherit siteconfig
 
-EXPORT_FUNCTIONS do_configure do_install
+EXPORT_FUNCTIONS do_configure do_compile do_install
 
 B = "${WORKDIR}/build"
-- 
2.8.0.rc3


