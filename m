Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481D7C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 07:16:14 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1161.1787901369177353084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 00:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Eqmv7od0;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so5130295ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 00:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787901368; x=1788506168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sutdIk3lUbwBbv8G5uoraNxswXAtWSJ/oAMFZVSlo+w=;
        b=Eqmv7od04vEFalrqSyyDwpzCnxR5G37e3ENR3DFw2U2n8zSvFE7wnHjuICuBx1d2Vs
         XAVYGSzDHhVxyUjltf+o6y+y6/97WL2vHhoX3lpGaAW48EwUiucouwob1RrsusepIZGK
         gI3u2c+dU4jQ1v0GMgEyWAXUtezU/6/YKtn5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787901368; x=1788506168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sutdIk3lUbwBbv8G5uoraNxswXAtWSJ/oAMFZVSlo+w=;
        b=emS9L7aSiKoG94OxkdDe1zP0cUPFkhVSdhR460nsAzyZ9skwf+eEqSj939T/MFP/C/
         iynQmo0/9+1ZMPguhDHUZ5vvJaCDpe1Z2nF+v9/ZDaG8q+4FNjaOJy0U42fteDA9Ii+J
         ZltWRzJGNnXzQQm0e2neVg0nY/buiYEz0ApLL3IEgiTPyMoGZQuneANnxdWmw+gPvG0Q
         6Ge8Vvg+AanfP4TmDK4rBF1REwBXg15tJaeEzjfJY2hgnTSnKtzs0+BL+QZ5kMRZ1h/B
         Gwdg1qCpQyd+Pe0s8hrFr/tIyTeIIWfwQ5QUkHRTpVodsUfJ/NDMRgzMPcoDNmWKNLeC
         8d8Q==
X-Gm-Message-State: AFuF++kNZICxgH9PTI26G/lDsXGDsDh/4neev02zwhN3inS108itR026
	Bvhvc2ogRVRSlQRJa5djsEf0CLdvM0/xZO8Jp5K5JElIC37SQIAo7Q8r11hKoV4IW5PFCJh5N4n
	gF0SU
X-Gm-Gg: AR+sD13cg3XF4UZYKBdJXoYV0ZawyAjctcmNciONnyTUlNvR7fqN/pBdh/fvN/KUQZl
	aJ4MtjR5ZPZkYfS21RNyu6NqervFwzn35F5FQHJmkVlinfIhGoEsUEdub1HxRxLLZay+sVtpHsJ
	/kVPMrYvkGzY9X0FdhJ/xbgnGY1rJ9mJlD9YobnpTqYIynPJheIP5z8nLSmi0/WrkM6F6Nbg8JI
	DGxkqWisO6SU5j087gWBsVafQfhsP7xlpz5IW2LXuGmHCmklUR1AAK/OPkyeRe6jH8Eju8tS2D5
	pApbKShA2vk20M3FJ9Qxwrq1MCwn+nMNn0+MPfJ1UJO2crcWLU6Mg0MZawzvFHjNwRztHe7yyGY
	nY6jEYyfmQ9MM4AIFmDExFkXm0AldaAka7x2IR/+qxThPq7ecKMTk0GQ4aghjV23ptuaFkqCGKL
	d6c8A2doIO8mkFepn0C37TAuxZV7BAIGx4fFRIB2LzTCCHa5G4P8vMmq4iiuJKett4+5+ZwMP3K
	WmI
X-Received: by 2002:a17:902:f684:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2d74dc797admr84519745ad.7.1787901368337;
        Fri, 28 Aug 2026 00:16:08 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc5:2ce6:cc91:125f:50ad:f5e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8094dasm3061071eec.13.2026.08.28.00.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 00:16:07 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 2/2] p11-kit: Fix CVE-2026-18938
Date: Fri, 28 Aug 2026 12:45:53 +0530
Message-ID: <20260828071553.70382-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828071553.70382-1-vanusuri@mvista.com>
References: <20260828071553.70382-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 07:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244518

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-18938
[2] https://ubuntu.com/security/CVE-2026-18938

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../p11-kit/files/CVE-2026-18938.patch        | 52 +++++++++++++++++++
 .../recipes-support/p11-kit/p11-kit_0.25.3.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/p11-kit/files/CVE-2026-18938.patch

diff --git a/meta/recipes-support/p11-kit/files/CVE-2026-18938.patch b/meta/recipes-support/p11-kit/files/CVE-2026-18938.patch
new file mode 100644
index 0000000000..9439a4da31
--- /dev/null
+++ b/meta/recipes-support/p11-kit/files/CVE-2026-18938.patch
@@ -0,0 +1,52 @@
+From 3e64244e538550c6a7fcf826fa8c50a4604416dc Mon Sep 17 00:00:00 2001
+From: Zoltan Fridrich <zfridric@redhat.com>
+Date: Thu, 6 Aug 2026 11:39:22 +0200
+Subject: [PATCH] rpc: guard against overflow when decoding nested attributes
+ (CVE-2026-18938)
+
+A local attacker, or one with equivalent access to a reachable RPC channel,
+could exploit an integer overflow vulnerability. By sending specially crafted
+messages, the attacker can cause the system to miscalculate memory allocation
+for nested attributes. This leads to a memory corruption issue, specifically
+a heap out-of-bounds write, which can crash the p11-kit RPC parsing process,
+resulting in a Denial of Service (DoS). This vulnerability is only exploitable
+on 32 bit systems.
+
+Signed-off-by: Zoltan Fridrich <zfridric@redhat.com>
+
+Upstream-Status: Backport [https://github.com/p11-glue/p11-kit/commit/3e64244e538550c6a7fcf826fa8c50a4604416dc]
+CVE: CVE-2026-18938
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ p11-kit/rpc-message.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/p11-kit/rpc-message.c b/p11-kit/rpc-message.c
+index d6f0aad..105a4f1 100644
+--- a/p11-kit/rpc-message.c
++++ b/p11-kit/rpc-message.c
+@@ -1160,6 +1160,10 @@ p11_rpc_buffer_get_attribute_array_value (p11_buffer *buffer,
+ 	if (!p11_rpc_buffer_get_uint32 (buffer, offset, &count))
+ 		return false;
+ 
++	/* Guard against overflow */
++	if (count != 0 && (SIZE_MAX / count) < sizeof (CK_ATTRIBUTE))
++		return false;
++
+ 	if (!value) {
+ 		memset (&temp, 0, sizeof (CK_ATTRIBUTE));
+ 		attr = &temp;
+@@ -1191,6 +1195,10 @@ p11_rpc_buffer_get_mechanism_type_array_value (p11_buffer *buffer,
+ 	if (!p11_rpc_buffer_get_uint32 (buffer, offset, &count))
+ 		return false;
+ 
++	/* Guard against overflow */
++	if (count != 0 && (SIZE_MAX / count) < sizeof (CK_MECHANISM_TYPE))
++		return false;
++
+ 	if (!value) {
+ 		memset (&temp, 0, sizeof (CK_MECHANISM_TYPE));
+ 		mech = &temp;
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
index 6c5b82e6bc..ca10bbc6ac 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
@@ -13,6 +13,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https \
            file://fix-parallel-build-failures.patch \
            file://CVE-2026-13757.patch \
+           file://CVE-2026-18938.patch \
            "
 SRCREV = "917e02a3211dabbdea4b079cb598581dce84fda1"
 S = "${WORKDIR}/git"
-- 
2.43.0


