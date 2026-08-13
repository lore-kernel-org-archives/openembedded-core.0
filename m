Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95028C5CFEB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 15:22:33 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21784.1786634543541640861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 08:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xu9KO4tT;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso502965f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786634542; x=1787239342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xiDj5rjAGvS/ZsPre8YsIb92mZ/JO86A+0F0UBTmouI=;
        b=xu9KO4tTUZTguZQnFEkUWZ4BwULk2oQU95qho/P6+KfhHKij8M3xaVj2Owi93hc8RL
         +gH+yc+pli254vlp0ZDv/P9P2aWtfsG6nvc7M5P2ETDEkrjYeqWQAgp8xOBTdXkCDDoo
         35nyt1qIWH+5DZHdH/Eovln1lTSAxU/vK341I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634542; x=1787239342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xiDj5rjAGvS/ZsPre8YsIb92mZ/JO86A+0F0UBTmouI=;
        b=TCnLLuLDPYJ2ebdNnfmyVUVesCCnpVdlVX/HPn0XdlgeYOUEa8AcX4sFqyw0Y0NWjI
         JZdmVQpGfbHANWiYrNDzblsZNUxUgddrR/peOxfetx7OwIz3eNsNRMY1saMO2fXWuHnt
         yMzw+BDXxFpwmZ/PDX7xceqz55+VMThvvD2bC8CKvTOUgG8Fk0nc1W1xMNO+Tixkkzzc
         ptfgekygFniPC6UhNftNOq14PxKYQat8TXw4Bpvms7KvZM7A1mNDRvWTuZQiwWdFbpri
         PKlfrMlnNMLoVZ3t3K7MkW2GS2zItnEdpwrKJVf0efGoYN1wHF4eZ9649hFguG/FS4pS
         F9jg==
X-Gm-Message-State: AOJu0YzdNMm+Iv/laPgVQZl3QR2EFNjgMZehjQqHKXxn9ZyJ23rYZeM2
	1NCc+wwfNIQmzepmZ/SIXqxaq6y1lyndE168mO6R8bAtiSxDIyc880cLib8gXydRXOx9WiGoX3U
	/FQkajKV8zQ==
X-Gm-Gg: AR+sD139d6lIA90xz1wYGsX1CU4e97a2urrBNv5eAwG5rxG+0s48FKQ/VBh/9ucWffZ
	m757Vc+xWIzdYnbMwA7f+qtQw2SR8pP8d5eikAxQ05VQChIIUx6N6gWjlV+atSt6DFIHZ/FYAbA
	/54jrhdoY+kUe9X1qxFUUVBCc/syAUXYxI37PoA4jUsU2N7hLHlOXu1WdarPLrmPz1vj9wQBc5b
	xCCAnQvSBN5BsEZGNiZ97At2clWLYTcZjAwkxWarB6JspjWs6R89ArLSQ54lBXbkjw7Pm2SjCj7
	73VVz6Mv+k80ssHCgWE+riPGViCCwYBfr5BhC/uzXmecMu4Vm8d4T+ON6+h3KLH/oATV2xYyZPm
	n+PfEVX37JdTRQToNDJN1CqGK5gfydBMTnQn5ptaMtfW6hTzWO+Rf54x7cRBKP4+UI5WnBWpmux
	cgvzvelwf/nl4vYXADIF1EaxJlXuMmucaI9XzP8GzYwXDtckaJe/U9S3R2eGQchTg0+ZaREn9k/
	h5pOl6WCvMqz6VGFDcvnK+A/UgaDAUK3DjOK5FvRJDf730aqf41I5f3c5oMF/l5WWyc5vRNSzzX
	SNenEx7Y+3tUCDieZRSuOgwwe9Drl9Zrj8OD4sn0
X-Received: by 2002:a5d:64cb:0:b0:481:51b5:7503 with SMTP id ffacd0b85a97d-48159cbfa53mr10909283f8f.7.1786634541755;
        Thu, 13 Aug 2026 08:22:21 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a068sm110450f8f.12.2026.08.13.08.22.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:22:21 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/17] selftest: uboot: remove duplicated KVM presence test
Date: Thu, 13 Aug 2026 17:21:51 +0200
Message-ID: <19e2414c7ec6e95fe36d13f0b2a83a273c0141b0.1786633048.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1786633048.git.fabien.thomas@smile.fr>
References: <cover.1786633048.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 15:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243358

From: Yoann Congal <yoann.congal@smile.fr>

test_boot_uboot_kvm_to_full_target test, needs a working KVM.
It checked it with the kvm-ok tool but that tool is not documented as a
requirement. Also, the check is also done by runqemu called later in the
test.

Remove it from the test and let runqemu have the responsibility of
checking for KVM.

Note that the KVM check now happens *after* the image build instead of
before it.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a91494f29a1f9da28280bc93771714c4545da46)
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/lib/oeqa/selftest/cases/uboot.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
index 2e4530fddd..847fa205a1 100644
--- a/meta/lib/oeqa/selftest/cases/uboot.py
+++ b/meta/lib/oeqa/selftest/cases/uboot.py
@@ -9,7 +9,7 @@ import os
 import textwrap
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu, get_bb_var, get_bb_vars, runCmd
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var, get_bb_vars
 from oeqa.core.decorator.data import skipIfNotArch, skipIfNotBuildArch
 from oeqa.core.decorator import OETestTag
 
@@ -51,11 +51,9 @@ QEMU_USE_KVM = "False"
     def test_boot_uboot_kvm_to_full_target(self):
         """
         Tests building u-boot and booting it with QEMU and KVM.
-        Requires working KVM on build host. See "kvm-ok" output.
+        Requires working KVM on build host.
         """
 
-        runCmd("kvm-ok")
-
         image = "core-image-minimal"
         vars = get_bb_vars(['HOST_ARCH', 'BUILD_ARCH'], image)
         host_arch = vars['HOST_ARCH']

