Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A79FC72D0
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 17:26:24 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34478.1774200382646403512
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 10:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NpnzCJXB;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-128e4d0cc48so2163513c88.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 10:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774200382; x=1774805182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xo1+ZOg9bayxtrMi25M+Hf2J3bzD1kPOgHjqvF+xh1U=;
        b=NpnzCJXB4npDvvA8druDeIZ6X0+n8UAxRF0i7ZcGgSHtFWHniV5uC3DCsVAuL2EVL+
         N5kmx6hw6FHRfm7+7PHpW2wz2YDYJXKq2fqhOUF/7LPdRIyi4v+uWVYF5+rNCx6rnbX+
         QZueUE12RHVB4ek+WdUrr1Ok6AuZpmI0xeKXXFDSuMxVogBqq6/ImvJKpmZnrsP+oqsY
         lB/F/OmMEqaRxxOfLmQk8kEDTTD3b5U3lYG4Ghs/4373cedn83+T9fI1lg39xryeWYLn
         OF1h1MwyvOsu8ygJCeMv0UhdclT+/oZr0mc8NV3i0dXeN+cmWkWOJE+ckCS1gruWwzMu
         lyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774200382; x=1774805182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo1+ZOg9bayxtrMi25M+Hf2J3bzD1kPOgHjqvF+xh1U=;
        b=ZwEEJ9KT/mgDwcCQyJhIqsZCFdfJ0G/vo1/xi+4bZLykCSTfwWoZ72/hyl1JxrzlKM
         /enj8mxcwxj2oggabCb51DL/Iuag2Xm+XaIzSoWmet7gdAAdhE0RHm0epcwE5NTJ98kS
         HsCbJTGhM7MDU0AKwm8nmHluwoe+gDgugaTbA2QhRQ7xukLbjspzND1f7XduoCURiZlW
         hz25EGjHUJio/v09k0fRi/dZYCk3D8iaDVIotD+SGX4bAhNy2GCbD8P6R4XOL2CwHomJ
         OPwW7Luq3LmPEQXIbpbtuyHpfXSkTFP5FY190aZgm8XKmmP0tRj1sB50xYmYbMo3SS4P
         E6sg==
X-Gm-Message-State: AOJu0YwUFdVILpVXQqTeKfdInvcYiBkz9H8UOIliEi/3rKiP/ObC7A2a
	FQZrMhUaCZKJKMEQ99nxHXxCp2xf046ZcVNNPjNINmnESzpVGCbRTGiDvgum/rtm+9ghKQ==
X-Gm-Gg: ATEYQzxyoDCdOb9vF3ENrerKycxvht2WiRlhIcnjDnAEHSo0LvAfiYhCocC739pdZSH
	MsA+tyHf16wnItrikbNfMk4RdIHQLUZ5Go6EGgyH7bBPODEWQaZYNDgz+Aaa87pF10Q/Mi1I33j
	zZnDnECxHRfCLdpoN/qkHyE/NwHh+9ZlVv6Divlr7qSeTnHzNUpapBu9WZTiFtqGmATtS/XxxQJ
	WlIuPBz3YprNcKtapTSL3I4Gle5Ceku7gvpcbGWgoGNny9bwJQ+EF0Ns5RB1D4b3U3LqanhcwL+
	dp9dveWFqvPyP0j5lcyPfADxJnXh6TIEIFD8nj5K1FOSENSHgmy4La9JYufrOt/cyExztj/0g4U
	fpo9o5NrhwAL+2HqLSC2iknhw5WfiRTr7RxjwqaBs817QV57o1ngEmgpNJeX/r+ptKrWawabq82
	YibBonrbYcQ77Mec4AiouwIhimS21/72S+byM7I8odWLoBLgJKnuGY34FWlDfaEKjS630t0osCa
	0TG0jH8OEl0o8jOH4yvGdZCMXnR/u+DBojRcrSoK18NiOg/cGabkHBHW8ft
X-Received: by 2002:a05:7022:43a4:b0:128:d5bd:3572 with SMTP id a92af1059eb24-12a726f5b50mr4689695c88.31.1774200381663;
        Sun, 22 Mar 2026 10:26:21 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a736b952asm7716349c88.12.2026.03.22.10.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 10:26:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] classes/cpan: Convert tabs to spaces in pythonic function
Date: Sun, 22 Mar 2026 10:26:18 -0700
Message-ID: <20260322172618.2481145-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 17:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233683

Makes is adhere to OE-Core coding conventions

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/classes-recipe/cpan.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.bbclass
index 87ebed124a..dbf44da9d2 100644
--- a/meta/classes-recipe/cpan.bbclass
+++ b/meta/classes-recipe/cpan.bbclass
@@ -70,12 +70,12 @@ cpan_do_install () {
 
 # Generate ecosystem-specific Package URL for SPDX
 def cpan_spdx_name(d):
-	bpn = d.getVar('BPN')
-	if bpn.startswith('perl-'):
-		return bpn[5:]
-	elif bpn.startswith('libperl-'):
-		return bpn[8:]
-	return bpn
+    bpn = d.getVar('BPN')
+    if bpn.startswith('perl-'):
+        return bpn[5:]
+    elif bpn.startswith('libperl-'):
+        return bpn[8:]
+    return bpn
 
 SPDX_PACKAGE_URLS =+ "pkg:cpan/${@cpan_spdx_name(d)}@${PV} "
 

