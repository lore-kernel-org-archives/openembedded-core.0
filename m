Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952A9F8DFE3
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:15 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28560.1776378786419210691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iR3EBK8I;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-483487335c2so381975e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378784; x=1776983584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwTVIoATG0nuEQawV94F0xmwLgenCLpp9msphq4MknQ=;
        b=iR3EBK8ITilxXVy89OiBfJ+fwj9NfPC/pSWCAEBlZedBamfsdWWwa4n1K6OOna37jC
         JD2g/Y7wrY2+Wx2eZ3j09tlMhDrWrxI22COxZSZlScHpO5L3folMLpO61/BHKwUYmY8v
         ySxoK2+0cAn8cQ0yraSrocHwzRtP7sE4Dg+So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378784; x=1776983584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zwTVIoATG0nuEQawV94F0xmwLgenCLpp9msphq4MknQ=;
        b=GOhPM6Q0EdLqw5V0qApfc7PNC5ra0GkwwR45YLy4Xu4AI2hoIM5c6bkWPZP2qcM7Mw
         60BfguYKSeEz57Y71i02mNpxyPTyBtltMI1iigW73NcrqtMnTOUUnt210NV9HMAoPKaR
         AaIDINBYKj2tXC5uJPwzXbZiBXB+92YC5SASdV1U3GOWfIG7oVoIvA9T74dFHhDf8gDi
         HSJOae5a9rrGROCYwUy+Xaoq7aTxw9AADs5aMGU6XusoIHNF5Bj/B8YGkqBnVrJuYBTl
         NYG6IremWfz9bwvxkaY4JolJiyy2/cF+ILlVuQD09nT74INodKngHtRkK0M+KIg2uhtZ
         X8pg==
X-Gm-Message-State: AOJu0YwC0IC+j1FK040pV4ZSTCZjkQWHyKeCLN9DNla+BM4TBIrxMf2r
	DUECBrcnl8vN/Ra3lqTzPjQjfDiRb6CIIi609g3C6aMdPOFAzZ67BPDsismg6FmFqIecnl2QRi6
	58JaDQuz+/aM5
X-Gm-Gg: AeBDievqgkQL1tWrFBoNwftLeiaJNdr8y+AQ4mCTjj8ylNCTJAeH2CGzPbMw2NH6njs
	Y2yxGDUSmBA26BQsOu4xiUJNczZRZh5aTPJ40eBKXbYAXJjAITK7C0M7p6/Gv3YqprQooTdGZzD
	VHH0dFOULdUn9wli6/RSmJTYZY7Dl+obeG66sLcD5YP8ohAPQ94q/+gwjLcREs7mq4XZEOX76W2
	mksE05RzkC8PVbOufCQKCmH5XhMbS9sAWpA+/QedDQG9OEamneyDUerDNAwR28rYf3p6qA+e1IW
	8bhbHdv+tqBBcmjHrHCGDcSvnPK+LgHFTTfPl/SGwdAnm8cRS8GM76nlzOns8Y7veOQldsk4dCW
	oZ11JBAmd9yQ1A4wRnUYOTEKMTV0KHs3OwBAW+TheMtXvqfZ0ENsHcQSje4sO87VFtVlTXG4Wdx
	wfPwJbvGl/w78KdVh/bWyWYBVleVYiqJoOOE5pz1yo6VHwlAWYPx7ldnYzaJhO0Ikj9FKZf2KrB
	v7xZ52yGr88oZGeRZ3qC5n4ocGNvy6I74Xkbw==
X-Received: by 2002:a05:600d:8402:b0:488:ae26:435e with SMTP id 5b1f17b1804b1-488fb778d74mr3737355e9.16.1776378784525;
        Thu, 16 Apr 2026 15:33:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 09/51] libarchive: upgrade 3.8.5 -> 3.8.6
Date: Fri, 17 Apr 2026 00:29:52 +0200
Message-ID: <4f873ad9abb1c10d0dc41f219f4a8ae5b8b1d53c.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235438

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

Libarchive 3.8.6 is a security and bugfix release.

Notable fixes:
* libarchive: fix incompatibility with Nettle 4.x (#2858)
* libarchive: fix NULL pointer dereference in archive_acl_from_text_w() (#2859)
* bsdunzip: fix ISO week year and Gregorian year confusion (#2860)
* 7zip: ix SEGV in check_7zip_header_in_sfx via ELF offset validation (#2864)
* 7zip: fix out-of-bounds access on ELF 64-bit header (#2875)
* RAR5 reader: fix infinite loop in rar5 decompression (#2877)
* RAR5 reader: fix potential memory leak (#2892)
* RAR5: fix SIGSEGV when archive_read_support_format_rar5 is called twice (#2893)
* CAB reader: fix memory leak on repeated calls to archive_read_support_format_cab (#2895)
* mtree reader: Fix file descriptor leak in mtree parser cleanup (CWE-775, #2878)
* various small bugfixes in code and documentation

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.6

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9e5d18040b0999dbfaea09b8a8a9f8a4bcac6349)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.5.bb => libarchive_3.8.6.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.5.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.6.bb
index fcfaf5d2313..c984eb78401 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.6.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7eaa2102f03b7ffd"
+SRC_URI[sha256sum] = "213269b05aac957c98f6e944774bb438d0bd168a2ec60b9e4f8d92035925821c"
 
 inherit autotools update-alternatives pkgconfig
 

