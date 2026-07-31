Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836F6C55171
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 15:28:29 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13.1785511700650695385
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 08:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=efgSW/8Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: twoerner@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso392521e0c.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 08:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785511699; x=1786116499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F0Sg/5eEE9YGtEb5/elpzX0ofAgSiKn5ZC6cvlKurlE=;
        b=efgSW/8ZWLSrU+6QlaunaXafiDVPvQ6bh3ffgje6La+rktkC1I723MuFEAr1t90qaR
         P6AGrL4iDHRAxzsfKZbIqbItwHIX11LDwrVNQkscIkmjpzr5itFWn7rOAcPzppzxyfQ6
         X58meklFGW97Gqb+8axv5DlN5T+KWNwqfLGmaCSEStpJb3tc25QuaNePVGA7WciVcMz+
         PCG2RzIG6pN1kzmWOGOSe768NryHc543ASf1q8sO0YwAeateSNrpSSF0ovxfebC14KBG
         mHDDZBKlwQTULnsLX+NYT/4e+bCxlyPElToXtoD4HV4Vn/vK2IyLJMUHpfRXUK/Ar7F3
         OZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511699; x=1786116499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F0Sg/5eEE9YGtEb5/elpzX0ofAgSiKn5ZC6cvlKurlE=;
        b=LIIacZZovsAIrJfUJ9+YyNSpzRhl6bo28RqsVeJyk0b5S2ah5XNhgxUDhfg7pZ1bHW
         AoG1ZKvrVRwMC2lqszV7xLNNP8I09zKeaaJs6IhLpBE4PJk9QP9UsLm/dUcgSkNOSS/M
         HZTUs3i3EoiWZKF02Svrt9HQzlmi2xm2fkIV9gFI7k5+vzBk45//PT2N3WlIi8yvsAVy
         saM/OqDZtBj7qFlzkRrHk2f+M2IkdxRqGE9RCidcwUpKmLU8jZCQLpLpXYLzs4Lyy1Pu
         ql/8jlBq6IwQuI3KRCkgnl67ztD7FamEGJdfgBBm0jXIC3dxr/cBbWYBwc/ujfKg0A2d
         lu3Q==
X-Gm-Message-State: AOJu0Yx1g3VHiPChHC6cAoGodmuJ3ZWh29xc8Oqdl6qfWiy62L3qoNYe
	hZVM92qZleUEUaEKpvVcr72bqFG9cxp5ekng7rcjru7tFKqIxGpaQWyTp1gujA==
X-Gm-Gg: AR+sD12YH5jJO4U3rfjOLTfCaSWDp8d6Jmili1erjsAHMY9sDjMWVfQTpvVvHElVjom
	j2FO4lWFkFcOI/U2WvbvbP2tf74MYVLrt0n/7lX06vEKTyV/8Wqb9fvfi5QpZud1NlDsdReW08N
	lqfc/7GiTjHdQIICPLhaan76VJjhvXBPRf4Y/d3nxvWmKruNBmI/g6zc4AAO94AIfbQvMTpK8Gk
	+/bxS5FM6OXRMv42B6dBu4TDvq69PUUMoBto84Tp0Zpg1hUP3YGJUlfNK57aUiC/z18M1893EAl
	MqX+s14usMs6ZhH07/RCoQyWg4PxmILEAtFk18VFCUGSAE2zWczlonHixIVFloiESndz3v3o6CK
	O7exUGa8M06n5yXrSejmxLnpb80yrKJdWKDlKiVvj+sTDF5Mr0WdM53ocwLBgZIMp9NSr9ziBlz
	3akTUQKVLZU95bGxtNOEcNYvAmfrhlIDYS3fAe8vr8YLyS/T6EZ/72kNY9xb+G/a6+aGBVyt9nr
	TZqnB+QNA6SPTXKlr/mFA1Es/2rbyY=
X-Received: by 2002:a05:6102:1493:b0:738:84c:6b3 with SMTP id ada2fe7eead31-75b2196462fmr518883137.3.1785511699486;
        Fri, 31 Jul 2026 08:28:19 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-759c9559116sm837007137.11.2026.07.31.08.28.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:28:18 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 4/6] oeqa/selftest/wic: drop dead COREBASE/scripts wic lookup
Date: Fri, 31 Jul 2026 11:28:08 -0400
Message-ID: <20260731152810.2641327-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260731152810.2641327-1-twoerner@gmail.com>
References: <20260731152810.2641327-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 15:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242450

wic moved to a standalone repository and is no longer shipped in
scripts/, so that search path can never match. Look for wic only in the
wic-tools native sysroot.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v5:
- trimmed the commit message

changes in v4:
- new in v4
---
 meta/lib/oeqa/selftest/cases/wic.py | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index f9b893fc8581..8a39a4ddc603 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -100,18 +100,11 @@ class WicTestCase(OESelftestTestCase):
 
     def _get_wic_path(self):
         if WicTestCase.wic_bindir is None:
-            search_paths = [
-                os.path.join(self.td['COREBASE'], 'scripts'),
-                os.path.join(get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools'), 'usr', 'bin'),
-            ]
-
-            for bindir in search_paths:
-                if os.path.exists(os.path.join(bindir, 'wic')):
-                    WicTestCase.wic_bindir = bindir
-                    break
-
-            if WicTestCase.wic_bindir is None:
-                self.fail("Unable to find the wic binary in %s" % ', '.join(search_paths))
+            bindir = os.path.join(get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools'),
+                                  'usr', 'bin')
+            if not os.path.exists(os.path.join(bindir, 'wic')):
+                self.fail("Unable to find the wic binary in %s" % bindir)
+            WicTestCase.wic_bindir = bindir
 
         path_entries = []
         for path_group in (
-- 
2.50.0.173.g8b6f19ccfc3a


