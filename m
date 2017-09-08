Return-Path: <will.newton@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3305371976
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 08:52:32 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k20so940555wre.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Zf7iOHGmAtnBMdMuQvOHhsTLgReYHgpTBdlYV1fNM+M=;
	b=r8NttrEWpaPCXEglL30GXByvy+7rdWkDStdgxeqygfJuHTneAQWWb7GerJeW/TWVIs
	VQ9phbPXKUFhLssYUZl5REbBSv7OTrlViMfEmZAQZBj7Rh3FkfoopFUOaK4+CkJnYN1E
	iq3i2zoN6Spal+O/nLW+WAj1VaUeOmfM3uFFITbPtiSY0ZE+M3mwdNtNlNopDxCu+3i/
	qeUhqzWYodG/LYrkhzh2BwaAJIyQE4SA7nakZGrpyuTDn+e8t19eH+5bZZqc156lJKLx
	4LeiOjswcTLpFqywaJAXQ0QokX0cT7+IycZJc1q+DE9EOHQ3X20aVbr95JKs186NEn5Y
	2mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Zf7iOHGmAtnBMdMuQvOHhsTLgReYHgpTBdlYV1fNM+M=;
	b=Y2wcARy9O0VyKXa27cSYWMisCMcjfEMqVgBgJeG5vhAHbCaLB1JlhQWT2w3Nf++7gy
	qzpWwfeepg4ejKeL4fokzb8prpTgVoxdKW5BrqYxBOTYEOBdYneodVzzHuhTb+6uWVGn
	vGsPoVEP9YuDCf1zgD1HFrV3vIm6jDAoTObNP7OdQ2H3d3luUlK9ue1ZaRkV85V2/vhI
	v2U9LI52PDemQ9gkplTpk2HPn8nZryxS+Szi6toZCdcxXa60eEHjFtOdmbOokERdewiv
	N6M50f68Aemu3jDH5kCM7GOwEToFuwtY/sIF7C+kcd//KE7Ye7apFp+XfJa3SH37KDO9
	I3wg==
X-Gm-Message-State: AHPjjUjqrw8sxK3piJVdu9b/2WNMo0OV7pWA/iqjLGxnjfi6nEKymAKf
	bdc4BPQblqlna82k
X-Google-Smtp-Source: ADKCNb6P3UYDBeEkkTrl4U0bYM+eGVHNq1VjaTDmG1pqMx+yH3qz8v/pI095qr64b2OIC51NayVBRw==
X-Received: by 10.223.176.46 with SMTP id f43mr1450499wra.206.1504860753494;
	Fri, 08 Sep 2017 01:52:33 -0700 (PDT)
Received: from localhost.localdomain
	(cpc99254-seac26-2-0-cust416.7-2.cable.virginm.net. [86.7.141.161])
	by smtp.gmail.com with ESMTPSA id s9sm625919wra.73.2017.09.08.01.52.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 01:52:32 -0700 (PDT)
From: Will Newton <will.newton@gmail.com>
X-Google-Original-From: Will Newton <willn@resin.io>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 09:52:23 +0100
Message-Id: <20170908085223.12278-1-willn@resin.io>
X-Mailer: git-send-email 2.13.5
Cc: Will Newton <willn@resin.io>
Subject: [PATCH v2] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Fri, 08 Sep 2017 08:52:33 -0000

The previous logic applied a regex to TUNE_FEATURES which could
set the GOARM value to 7 incorrectly, for example when dealing
with an arm1176 core. Simplify to check for the presence of
"armv7" instead. At the same time add a check for "armv6" and
set GOARM to 6 in that case.

Signed-off-by: Will Newton <willn@resin.io>
---
 meta/classes/goarch.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

Changes in v2:
 - Look for armv7 rather than armv7a

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 4a5b2ec..35f2987 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -38,8 +38,11 @@ def go_map_arch(a, d):
 
 def go_map_arm(a, f, d):
     import re
-    if re.match('arm.*', a) and re.match('arm.*7.*', f):
-        return '7'
+    if re.match('arm.*', a):
+        if 'armv7' in f:
+            return '7'
+        elif 'armv6' in f:
+            return '6'
     return ''
 
 def go_map_os(o, d):
-- 
2.7.4


