Return-Path: <andreas.kaufmann.79@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 98B5260103
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 16:06:21 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l9so17016206wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 09:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MN8nY3u5Z8CQVHSXLN129MG0vpefEqruZpk6vV8jHec=;
	b=MTWuqd3KKXNR9pDP/ft5EC5MxTzm60LNKwg9yXr/mzrK0XWOEPxv1jv7+++52PDriF
	ZqTSbck8tUiXxMqq7Pn0YzHR0mf7mEn54M+CHqk8m98+TRJZn6m4h/THNccwEy/XmJv5
	UFe2E7wRwQuaEzLDHe5HYatsyDgr5WKRqv7wRUmjRbAMI3leT/EPAjoU93TAnK1ryb5b
	/eGDVf/wLEDRcytvhZxJgEpEFKlQoTPd9oOYwAmjVbtbd6vZ7dFzTHupdkXEB2dKWOYb
	XhReQVFDzYXe+BD7lNiRe/tBoRgwz+bITBVhLGxdvBTGEl2iwbxzuU/C9bV0n6Ek3ZG8
	scjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MN8nY3u5Z8CQVHSXLN129MG0vpefEqruZpk6vV8jHec=;
	b=nMbnpcmbZZ16mD77U8R8UmAxVHX/kVeuQTa77v0itcXV7U+wsTPB6Yz/cdqcU/xdPP
	PvK2zA15rTjPVGmjR4a/bA7TG8iaGVGJMMw5YHOyN77zb1Op2PdLuyQDmMz981jVW9FK
	qn2CKhnq6Z5CeV6L+I+ZYrqZyH6DHIQB+9AnEWxgdaf8SH/vhNIDEosaMsUzxfeeuAfY
	Nh4bjuSaJVF7fwE86vl2QVMH/a4bWm8otrutZJfqoERWiTR9YROacDV2QX3KqAC/Dq3/
	WOiiQ1CCRjk+aInv7GcXQ6OA+z1QvrCpvHkke57XJkUo5FbUiozzwAD42bUZc2CFaXu1
	zsCg==
X-Gm-Message-State: AElRT7HmBkPA9yXgkF8VfTpjqdc79xUtoZn8WjxlZxNi/0r4E4Nyus/Y
	Ab1Aswb2/S7O7p8Bw5iOPYbBdg==
X-Google-Smtp-Source: AG47ELuwM2DWiddtYCKsME6IFN4gFoa/8Fdig6rxny/eAirEtOBoS0v8LnwI9ezfXXPLMK1jPqy+8w==
X-Received: by 10.80.144.142 with SMTP id c14mr17833387eda.149.1521734782053; 
	Thu, 22 Mar 2018 09:06:22 -0700 (PDT)
Received: from localhost.localdomain (ip4d14822b.dynamic.kabel-deutschland.de.
	[77.20.130.43])
	by smtp.gmail.com with ESMTPSA id t4sm1470723edt.33.2018.03.22.09.06.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Mar 2018 09:06:21 -0700 (PDT)
From: Andreas Kaufmann <andreas.kaufmann.79@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 17:06:08 +0100
Message-Id: <1521734768-11762-1-git-send-email-andreas.kaufmann.79@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] pseudo: explicitly enable xattr support
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
X-List-Received-Date: Thu, 22 Mar 2018 16:06:21 -0000

Pseudo is using a custom configure script that detects if it shall build with
extended file attribute support or not. The check is done by simply calling
'getfattr' provided by attr-native which is not part of the dependency list.
Due to the recent changes (recipe specific sysroot & cleanup of $PATH) this
call fails now when the recipe is being build for the first time (at least
when being build for nativesdk case). Explicitly setting up a dependency to
attr-native just to satisfy configure would be wrong also since the real
dependency is to attr/nativesdk-attr which are already part of the dependency
list (see DEPENDS). Therefore bypass the test in the configure by explicitly
enabling xattr using a configure option available in any case.

Signed-off-by: Andreas Kaufmann <andreas.kaufmann.79@gmail.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index fb74252..cdc2a58 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -26,7 +26,7 @@ do_configure () {
 NO32LIBS ??= "1"
 NO32LIBS_class-nativesdk = "1"
 
-PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback --enable-epoll"
+PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback --enable-epoll --enable-xattr"
 
 # Compile for the local machine arch...
 do_compile () {
-- 
2.7.4


