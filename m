Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD9077D2A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 14:19:29 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u185so6028550pgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 07:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mIIvjuQ9UxQr+6wCYwWBPnazvaFIrEN6dJOVAVv6e+8=;
	b=Egjub6/vhtCsOiAi0usDTvhfoB485Zp6drwqDCeh5YhIKQNPawAkhIltfKMbVhKto8
	1MncuBM6vFdw0GdwEufggScG+UXlCmj0F/s7O7H93MPAvmp2+krRksdVfAcvb/db4X+S
	RT5lkDRZHWIT1FC2+soo9vBwWynYTtti3Xj0+UMbyTEXZVyqyriIoJk4T9mm6rjZBno0
	FqbqVkwNmaEa8CrVlgiIR8ooz3+gQ6SPUpZ1x74LyRUYU0p4rgafrTIDB6/liftrYWWS
	QHTH5vOWU53aO8hr499UfSVzcy9hIyJQm5Mr6kWQ3XgLkLC/PezfDFn8R6Rg9vMe6ZG9
	7s+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mIIvjuQ9UxQr+6wCYwWBPnazvaFIrEN6dJOVAVv6e+8=;
	b=pzamInpSy2Q5Ea/mAWvOeRPIutGnT4Ft+t6a0bXS/Gj9BZ7Kf03K+PTywuNHoNBUiX
	KidRdyiP/YAqTptSsIS6eDSD2esJJAHIVJm5jRDMulxn35D1b8As5xPO1U6rKMXjgBmq
	G/GFoNOUIWQ01/y2HEhpX/lJWQW6xuh1zZ6pohI+/4AbcEyXKuk341WGTw0XxM+nnjXM
	e+3/d/bAXcMpSAszHX3nSXPlIL9vA86qZvL4m3GPupO0+irf2AAFtlcaPc8GDKDGMLeM
	8uXcRJazlGiy6dvO0ImRPZC846nlYZ+3cyBL5VwQs91TEopg4brDtzdbW69IoIFT04wq
	yuwg==
X-Gm-Message-State: AHYfb5hfL4Ct0tddz3viuIKT7IFqYzQTSTKT6pie7Fsjis2rL8RLOKkn
	tLOtXSDLm+Li/PdT
X-Received: by 10.99.61.79 with SMTP id k76mr7780405pga.206.1502288371401;
	Wed, 09 Aug 2017 07:19:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8e89])
	by smtp.gmail.com with ESMTPSA id
	s89sm9342832pfe.155.2017.08.09.07.19.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 07:19:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 07:19:19 -0700
Message-Id: <20170809141922.2603-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [PATCH 1/4] musl: Drop the protected symbol optimization at configure time
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
X-List-Received-Date: Wed, 09 Aug 2017 14:19:30 -0000

lld and gold can not handle it and treat it wrong

Fixes

[YOCTO #11689]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 53a8ba196a..93e3535c8d 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -36,6 +36,7 @@ CONFIGUREOPTS = " \
     --libdir=${libdir} \
     --includedir=${includedir} \
     --syslibdir=${base_libdir} \
+    --disable-visibility \
 "
 
 do_configure() {
-- 
2.14.0


