Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC211061B2B
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 09:57:30 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16611.1774951041314323006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 02:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=VEboCL0V;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.45, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66bb3766125so425749a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 02:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774951040; x=1775555840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwN2igoF2qTedj5q/7FvM+ZE0jCVib5hXWhvwnsKv5o=;
        b=VEboCL0V7m0s3rMBylFaKFjwJA9ql7rAIafxrL2fxaG1tw9O+Q8vBKFlmP83/ejwVy
         qvgQYI5qKMcsB7Oim3vXQUlAnvA/4jhFJnO3AofS+XkU8k3yoHLP20lmNZZNvcgZM3bK
         vd8CLLZh6l2FLd2BSqtyBnpTMIyX+GrOvAvKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951040; x=1775555840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CwN2igoF2qTedj5q/7FvM+ZE0jCVib5hXWhvwnsKv5o=;
        b=I38emSzdYOJoFA8diET/iFI1GwKcVWj58jU5k5STzNznDnc5BAv0Ws733NkIHLcC4O
         oVvXURYaiBU1YtvyMYaXKC2F+rhEhbWNqV7w4CgZpT85FcSQFTY0/FSADvLGuM6DLG20
         aIYN9ESe/2S/vqc8zcMvzaCq04QLbOVsNmk/q4Su4DGbtIx5VFA50BX8UD1N0JNO3nSC
         ih0E4RTcEMFbvRXd4c1IEBVnhisMQrf9z53btpxvOHzMKwReeNVjkskyOL8lFiLVGJ1K
         mj+tByAgpu7O1qvOe9+4Qz7U42Pnbog5QD7YZx0iFq7yNn1MGUeNAk4HO6ahvGagysII
         ajMw==
X-Gm-Message-State: AOJu0YwxBm3kVsh7cr3f4EUy5Ukf1a/TbOoYxiAzwrEwtRSiUTyB6zMV
	Yz/52SdtjOJPxlYYqIQAidIgruO30nXmrl2sk5xUcspQndymMJ8OdxO5b9uAs6C20jShczrbbtS
	cKDZmOuM=
X-Gm-Gg: ATEYQzzSNcGX4pTtDydVK4bADMzIo7TElxevQMpTJfkvzQV/OhrfOemr07FTLW9zx3q
	xhyDEILToBqLV8oAm3+q4KVx7PT5SYznkB7jzR4zk1h1Ifgw+ATbGzjf4AjhsG+amdQbySIIOP6
	M/rgZV1PgzewnxobUdzC2MHzb3I5EHBuH1lzPq8IKTFbIhT9P0q6LgPTpI20BG5E5LlNA66IlBS
	NucZHGloUwPubVhaaq24fyCwINB3r9P1CLub0b7u8AeUA0XesXjWSe6LRJ/tITZD12yoGpytlSe
	1iEHySO9ytnSodf4IVAxsrLDxImNj+GW4tU2w4qH3Ept/2MoDbjjuC5WbJuo6+87YKLAWZM9pdd
	Mf4WBBLx27zCUXNHlHZlMNDySr5lFv7bWCL4LfKcKAsMvRIvXMuD+eFx/L3lYgr0uM8+WWUSv4u
	yNIpq4k2SeX0F0jYxCGN22PYjwDWxhUUWk06CVYQz4tWXm5+fVPDYTWY4YhoGQQT3McZEdLCNM7
	aQT4unHpDE=
X-Received: by 2002:a05:6402:1d52:b0:66b:eb2e:8af9 with SMTP id 4fb4d7f45d1cf-66beb2e8d36mr1854220a12.0.1774951039639;
        Tue, 31 Mar 2026 02:57:19 -0700 (PDT)
Received: from adam.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl. [212.57.59.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7607a653sm3413599a12.24.2026.03.31.02.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:57:19 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v8 5/7] meta/lib/oe/rootfs.py: assign warn_check regex string to a variable
Date: Tue, 31 Mar 2026 11:57:11 +0200
Message-ID: <20260331095714.1285106-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
References: <20260331095714.1285106-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 09:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234277

DNF5 has a hardcoded warning when gpg checks are disabled.
As such, the rpm rootfs.py PkgRootfs class needs to have a
a negative lookahead filter specific for the following warning:
"Warning: skipped OpenPGP checks" if RPM_SIGN_PACKAGES != 1.

This filter is added in the next patch.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/lib/oe/rootfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 14befac8fa..7ef7e71f9e 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -25,6 +25,7 @@ class Rootfs(object, metaclass=ABCMeta):
         self.deploydir = self.d.getVar('IMGDEPLOYDIR')
         self.progress_reporter = progress_reporter
         self.logcatcher = logcatcher
+        self.warn_check_regex = r'^(warn|Warn|WARNING:)'
 
         self.install_order = Manifest.INSTALL_ORDER
 
@@ -84,7 +85,7 @@ class Rootfs(object, metaclass=ABCMeta):
                 bb.warn(msg)
 
     def _log_check_warn(self):
-        self._log_check_common('warning', '^(warn|Warn|WARNING:)')
+        self._log_check_common('warning', self.warn_check_regex)
 
     def _log_check_error(self):
         self._log_check_common('error', self.log_check_regex)
-- 
2.53.0


