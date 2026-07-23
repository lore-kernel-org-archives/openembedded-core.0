Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124A7C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:07 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19523.1784798763386650397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WZ4sSs2Z;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceb096e675so5012615ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784798763; x=1785403563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2EtZm5n8do9wevKtSVXp/o4265+P0TBGlYyPhKLrmE=;
        b=WZ4sSs2Zdtxe5talsGdwd0RxUWrVWH6b2Swol83EusjurOVjTOPpQtwQjGuIjSN3yi
         bEVQoF6Ozm3areH8MmcSDfVUtgTfYUwE/dX5A5cK09UKmZm7OCcL7VzfmHQ9MzhHotkK
         v+8zxSN9k+fTUKpQ3llKpcw7j5huJo/GptRJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798763; x=1785403563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2EtZm5n8do9wevKtSVXp/o4265+P0TBGlYyPhKLrmE=;
        b=IvpDqfQ6EEhoQ9HDEhMUM1kbuyIuirLjI+MQCpGcf9Bg5Yt9L11/hZZdn8RumdexkE
         1bGjFOVvcD1MLWDsoAATLXSyYuT+lCcjfTXNFPXAu0l6Dzzp/1V8PNbxo1msaVhvYryq
         8v7nQcthH8QK7g8fQK6CGL5vFTdIbdiqcoR0A6hrGbZBND+crzk3JgXjDVNI5tKXtkjs
         N+FWZaZ+u/DncPt638Cvv1EAzld7IAHKDGLtW9qpzhns1l0ay1nj8oMCmNCEjHccGQe7
         mTvmejV9fSfScojGFKSlqHNTS22xGe3DAgwb4/cw5PUnjj3//oqRH90l/yrbyWjwVVbU
         cpQw==
X-Gm-Message-State: AOJu0YwDtpLl9anktTrpRLptwPY4yeG3rv0DaTax/QRFvq9S4hrWCODc
	Zw0W1DgzaIoVLN4x85mpNcoQXzf7BAvUCsShjdWdXygHret9nOHM4da+gaTmE6L9tn+bBhj1Xg1
	C8iBh/U0=
X-Gm-Gg: AR+sD10gNzxZ2YySeTBL3d0HX60Y8tL/SZHcx42p2VRvkGeFI0SuDIF2MSibKMYl49Z
	HhNHWOQjARC8UG16bZKG/QuNQQ6dVdcUbvmbbpcMlvwsWv5V6lPbG/ZP85zQzsB+V+ktNl9sSQ0
	gjQj1Z6TrgBhoZLicyAoQGdDtbLVgUFUp6/+HwcuxzZcYV5QlwyFV8Ssccm6DR97K2K8i97BUK2
	bmxbmajR/3ROqCrdLBLoitLorsYep2XWIfxFreIL24gYKRJTk6sDMptzDl0SGfeOGhQWHV2ufA8
	IIzg0TQ2N1rt1UjvuXZQyDQ3cATOCg10vsxB7LN66EcLVKRa+LrghbjcPxVCedHn70KWmAcD2aO
	Txl+y8dcIsE1SFPmpVnIDWkNyhlBp7XhyvIuOxrkscTQqRiCVoL1FTVC7OEeP1YEGwazCbZ7jmu
	kgF35koioJTFk=
X-Received: by 2002:a17:903:3806:b0:2cc:77f3:a927 with SMTP id d9443c01a7336-2cfa6c5df36mr26149315ad.26.1784798762717;
        Thu, 23 Jul 2026 02:26:02 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm19333788eec.27.2026.07.23.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:26:02 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCHv2 01/13] vim: Security Fix for CVE-2026-28422
Date: Thu, 23 Jul 2026 14:53:42 +0530
Message-Id: <20260723092354.54697-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241805

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-28422
[2] https://security-tracker.debian.org/tracker/CVE-2026-28422

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../vim/files/CVE-2026-28422.patch            | 44 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28422.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28422.patch b/meta/recipes-support/vim/files/CVE-2026-28422.patch
new file mode 100644
index 0000000000..89f219ccf6
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28422.patch
@@ -0,0 +1,44 @@
+From fcf19885004325f5a52db6bd6893cb5b387799d3 Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Tue, 24 Feb 2026 20:29:20 +0000
+Subject: [PATCH 01/17] patch 9.2.0078: [security]: stack-buffer-overflow in
+ build_stl_str_hl()
+
+Problem:  A stack-buffer-overflow occurs when rendering a statusline
+          with a multi-byte fill character on a very wide terminal.
+          The size check in build_stl_str_hl() uses the cell width
+          rather than the byte length, allowing the subsequent fill
+          loop to write beyond the 4096-byte MAXPATHL buffer
+          (ehdgks0627, un3xploitable).
+Solution: Update the size check to account for the byte length of
+          the fill character (using MB_CHAR2LEN).
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-gmqx-prf2-8mwf
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/4e5b9e31cb7484ad156fba995fdce3c9b075b5fd]
+CVE: CVE-2026-28422
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/buffer.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/buffer.c b/src/buffer.c
+index 0feafc590d..363dd0e04a 100644
+--- a/src/buffer.c
++++ b/src/buffer.c
+@@ -5293,7 +5293,8 @@ build_stl_str_hl(
+ 	}
+ 	width = maxwidth;
+     }
+-    else if (width < maxwidth && outputlen + maxwidth - width + 1 < outlen)
++    else if (width < maxwidth &&
++	    outputlen + (maxwidth - width) * MB_CHAR2LEN(fillchar) + 1 < outlen)
+     {
+ 	// Find how many separators there are, which we will use when
+ 	// figuring out how many groups there are.
+-- 
+2.44.4
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d69a337b4e..485eedb061 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-52858.patch \
            file://CVE-2026-52859.patch \
            file://CVE-2026-52860.patch \
+           file://CVE-2026-28422.patch \
            "
 
 PV .= ".1683"
-- 
2.34.1


