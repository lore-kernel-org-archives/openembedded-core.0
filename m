Return-Path: <ivan.nestlerode@sonos.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC6FCD342F
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 21:29:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25833.1777930135983426948
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=bapRT+5l;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+ivan.nestlerode.sonos.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3123543A36;
	Mon,  4 May 2026 21:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 056E8C2BCB8;
	Mon,  4 May 2026 21:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777930135;
	bh=0nVdDgcPM9m0o5CacH4FRueikpg9z3HNnKZDj9B4mr8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=bapRT+5l74QkViq/R0NrdQDAY+lWTQV9Pf6zL//pQNBzBN0gaR3922VJimqEu+LzJ
	 UsMxVSb+mdJ5N5v65F1LFu4xmUQQSujKjCFCAqW9dCHdnxlbHIEBBwg9SUbldtPUrA
	 zZpn0bkns1jydNA8j/ojr0KIxoZNTG5x43Nn1E47Ept8+ZD+2heH+ILOn4U0ygKY/r
	 n/sdP3sM95BzD/C8mtWeZTYfCQi8wSsAObOAmLVATnEiwxvq1avS2ay0qVOskTHiPu
	 KUe0WMSMqGkvN8UET+T4DeuiQj0mJifMVLauaBhTjBvz7nZIX/rdLEBMcvYEgMVu16
	 tp/m8hA+gam6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA98CD342F;
	Mon,  4 May 2026 21:28:54 +0000 (UTC)
From: Ivan Nestlerode via B4 Relay <devnull+ivan.nestlerode.sonos.com@kernel.org>
Date: Mon, 04 May 2026 17:28:43 -0400
Subject: [PATCH] glibc: Fix recipe bug that disabled stack protector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-glibc-fix-stackprot-v1-1-fbfd0f22ddd2@sonos.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bsHKEvpKdDBdbSlSNCKI/p50H
 JiZBzIlpgxj9UCiizOHo0BTV2BWfXhCtoWhFe0geiHR77wYdHxjPrXZYgonStV0UlstFuWglDF
 REf7rNL/vBybS8xdlAAAA
X-Change-ID: 20260504-glibc-fix-stackprot-47134ada0b7f
To: openembedded-core@lists.openembedded.org
Cc: Ivan Nestlerode <ivan.nestlerode@sonos.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777930134; l=1583;
 i=ivan.nestlerode@sonos.com; s=20260504; h=from:subject:message-id;
 bh=sz53G9VmClsk4hMabYD7S+5Wg5jjaID8amIrvH975nc=;
 b=fM1gNscflG5MLDvzGU2f8STsfz3/YdUIwv3uSEPbwuZ4+DhYK6axt0C78Rme6RglDaTJPzSzD
 psdaczaPH64AL8L5e+G7tYVLdPDVw49zq6/X5ON9NX+SbkAcB6viNHX
X-Developer-Key: i=ivan.nestlerode@sonos.com; a=ed25519;
 pk=kcjfcLwbjs7Fqv95W59a7YVW52AGAkgpAOoPa23YKXU=
X-Endpoint-Received: by B4 Relay for ivan.nestlerode@sonos.com/20260504
 with auth_id=767
X-Original-From: Ivan Nestlerode <ivan.nestlerode@sonos.com>
Reply-To: ivan.nestlerode@sonos.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236458

From: Ivan Nestlerode <ivan.nestlerode@sonos.com>

Fixes [YOCTO #16265]

The glibc recipe is supposed to be building with
--enable-stack-protector=strong, but some CACHED_CONFIGVARS values are
actually breaking this, causing glibc to be built with no stack
protector at all.

Remove these CACHED_CONFIGVARS values so that stack protector support is
detected properly in do_configure and then enabled properly during
do_compile.

Full details are here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16265

Signed-off-by: Ivan Nestlerode <ivan.nestlerode@sonos.com>
---
The glibc recipe is supposed to be building with
--enable-stack-protector=strong, but some CACHED_CONFIGVARS values
are actually breaking this, causing glibc to be built with no stack
protector at all.
    
Full details are here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16265
---
 meta/recipes-core/glibc/glibc.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 30d93bca77..dae087d53f 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -21,9 +21,6 @@ CACHED_CONFIGUREVARS += " \
   libc_cv_slibdir=${base_libdir} \
   libc_cv_rootsbindir=${base_sbindir} \
   libc_cv_localedir=${localedir} \
-  libc_cv_ssp_strong=no \
-  libc_cv_ssp_all=no \
-  libc_cv_ssp=no \
   libc_cv_include_x86_isa_level=no \
 "
 

---
base-commit: 9ca41405e6bca276468a3b6f67eaa328b8016485
change-id: 20260504-glibc-fix-stackprot-47134ada0b7f

Best regards,
-- 
Ivan Nestlerode <ivan.nestlerode@sonos.com>



