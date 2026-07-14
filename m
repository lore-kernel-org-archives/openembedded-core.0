Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D02C44513
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:20 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1659.1784055858940429766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ntmg6+6R;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9ed64d490so1735622a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055858; x=1784660658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VB1w3RMyoJtvjK8bhEfJYnSBgwA8m1MKVblZgloMj6s=;
        b=ntmg6+6Rwyo7IqQeWsGqG40fMj/f3zJYJSSc2oPOfvbKQu9GrOYsxqGqFV6JeqcZnT
         BRCdQJgN/I0LIhCfRX+wMPurCETUW4yBZIQs/XhsqpUYU9CwL4pqDAxokm1Bx3+mKr6q
         0bQWXg6RtcNV20H2UGdpVHgHO+WUNCZLU4oq6jRXZormJTbHF0lAgFzBxXjB9CMufDcL
         GBplyu2S0FPRUrzUAG+qcBnTOA/QwSjqTHAx3kD/0eOCM5tpxb5pgRaUHtusdQnNHH0j
         w8ibZIUEKph6SYMfc/rV2zAYfxNFE6A23Y43qauKXEvRyn8K2KNzHHwO1Hz/nu5iriLq
         mPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055858; x=1784660658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VB1w3RMyoJtvjK8bhEfJYnSBgwA8m1MKVblZgloMj6s=;
        b=NQ9y/Vsq6yojNf61KGRF+UC65+rii7zjeamMpJPCl6mqiLl9OaTm5YZLVDLRjDmg4G
         uBaccdsptsiuNU3pZGOq9ZmJ5B8KMW8zNd67CUQ3f4A4Th+gS0ANABBBZdbVWy1zH/08
         xoxCSZYf6/weWD42evFp6QflBtcCsJDR92YORvpjfhovLHHnHIKk2H2EeNXptKPj9kFK
         vgmfGfQbFCAdjzyB9A4AMlzEDXUxoach+S+8KSxhc5xOotRmyEyz2wc+dUBADwYVzPNL
         Y1LM8TimmNMInR3RhhheSjzjUlsayZZTZLLjd62hUySqjKUxW5I7ERw5iE3QDdo+HJb7
         g8/Q==
X-Gm-Message-State: AOJu0Yxbp1CXYKX/PSKFl4yR+RfnDHfQJ5l50h+GzvWdhV/AClQai/vF
	8b/v3rvRD3vdGg6WBvYCmQsoeY6aLVf67YzLn0eDigAikQ/1Wc0wT1gXqHgsIg==
X-Gm-Gg: AfdE7clPGOZ5m4Ywjix82aXz5BfM7A1oWZkrQuabpbuMlhcUPlvf9qpXSg9mqYAu1tt
	h4L1ZSMLyo39+wyFP3k+mF4sg/FjI74wj4wcGKQGHT2MZagdFIHbOc+urzAk2FfBicYkx3I0mat
	3hYR1ibnLjXaQ/szvGZqKI+DIs6Cj1tR8OBftOzb2S5wn9xF3+oh8QeX9W8pdUIKpdipXApcQ/u
	Gl/kjVquU3lwVjB8pYII99dmCBdy6Wuaj2AMinHFTzQIWzd5qbrUfrMjSXv8QkkZpwMEUUqynzo
	IKVIKPcFXKKUBkDekUac7mowncX6EPR5/oQ9i81o/c8mZSFkzRN/p/oBmyJ37c2gOcLkkZUFLuA
	CLIRuWg4WOoDqQXljMy3MrveALb0dPUSUkSKPbzOai1GZqxANyBV1+Qcez5h0Ulc4n78Wm6Io1U
	mU3D6FjGZVEg==
X-Received: by 2002:a4a:ee19:0:b0:6a1:7fef:e88a with SMTP id 006d021491bc7-6a3d9f3d337mr25585eaf.28.1784055858141;
        Tue, 14 Jul 2026 12:04:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:17 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 12/22] gnu-config: Replace deprecated SPDX identifier
Date: Tue, 14 Jul 2026 12:31:22 -0600
Message-ID: <20260714190405.3328796-13-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240920

GPL-3.0-with-autoconf-exception is deprecated. Replace it with
"GPL-3.0-or-later WITH Autoconf-exception-generic-3.0"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 5d82be87da..d5b4189573 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "gnu-configize"
 DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a directory tree"
 HOMEPAGE = "https://git.savannah.gnu.org/cgit/config.git"
 SECTION = "devel"
-LICENSE = "GPL-3.0-with-autoconf-exception"
+LICENSE = "GPL-3.0-or-later WITH Autoconf-exception-generic-3.0"
 LIC_FILES_CHKSUM = "file://config.guess;beginline=9;endline=29;md5=10922f9231863a06f6efb67691fa46e0"
 
 DEPENDS:class-native = "hostperl-runtime-native"
-- 
2.54.0


