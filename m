Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9DDC9830D
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:44 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2922.1790154703675841979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OxO9zXPQ;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so3843795e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154702; x=1790759502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kr/h0A+ETkvns0fCZNrdF5zQsnX/lAr9mCObyQaCU70=;
        b=OxO9zXPQETvcGLdA0prrJH0rCiWvJfa9O+XRcCBNc36m7JZxcwdDZIaCdAFhzOub0o
         kCPIXDaIICTByrXQIHpKBN4OQULzXNSQ4/qCI9K5aCQM/atmPWE9i1ymdvc+IDsD7HeF
         5D8AQzx/brNj3SpJrpoind/SfTnOLKCd/nkxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154702; x=1790759502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Kr/h0A+ETkvns0fCZNrdF5zQsnX/lAr9mCObyQaCU70=;
        b=bkyY/qAH0Z67je96/aPFx7PeHPttrRXtkplDcUoqZQ9rqzXV/URhUY+Q4bE5orix3n
         yELh3WzTaHEA81+P7o0mORdaobRY108ezIcApw91ho2xKEcV/YyItVRH6tAU25kFDxmC
         oUX7rJm8nWZ5blUAooxRSKi2RTaf3WmYZbJrdDIzcAFXfV1vGqsnrQDCjhm77K3k6g5Z
         WWM8PbHyJHBX9NfLyAdzK8QxEhgqW72c0ixlBIiVvThKKdxv6MOBFGCdexARB7EO3c/X
         gbCz5Ban9szAX9PVI1B17EX5UkbhTFKZJo9qHt9mcO0w8yOFsJKDYpewOGANZQw9I0oK
         ekZA==
X-Gm-Message-State: AFuF++m4r/cmWVpBN1gYduYCBF+I33T5Xf7p9BHKX7c8vTAoe7z26apr
	QBu9/7DKBkls3dWB1mLSnIR2Cvta0BugVQ0b5yVVsJ3vi1Z0ib4PHq2MCZWWFNwNtUKUHkIcGKS
	YLmaYNpQ=
X-Gm-Gg: AYBFou1jW0XoTDNY/9BSQChRQ8zmUIZI2LLkJzqhoK7SzzYLuQHxOkCYZS7hBQ4RmA4
	ox0DZp0tBd6mm5IJTm18vYg7ooodLpIxLPYmqgYjFCxhL91AmRlMQnoYh+O5SWDXURNKN7+2gF8
	0a7BJLff35T9CHAqbyD9in2axn34bUfFVvrFcnPscUIXXb8EuWZ5QTKOInjqnJEq7pALT4V3/wX
	Y7/Ukx2Z5UBJoOLd1m5wy2qWiZ84CGd3jwMNMSnpxsAfMsQ5VSejbOX5d4bmWYMmyL8q1+KpGnl
	VvCjp1ZIq9Ql5zQhUhvCf6DJ9MOiO4EGhmKAZFchi9IETVKk3sFuCz3CWyvTNrazn/unPB/VHuE
	iUa0zuLgrqfUjzmrQeWMNPYQeWcIosCsaZmR6g8mVxRUYYyg2C3Wg4UsjgxGuq4emBgGhLT0lCz
	C9RYsrzfrfIT2GqwNUbkAkYNW9Vr4dLBy15PAOi2MMN/g8zkj7KsVIHCQw7C80LAucrVfACayFI
	zyRMCJ0B4A5gMcDQ19eNoI3zfxKi/R+lB6vVZejnirf91d9ps2M4myKFBlRsOpiZtSIsQT0
X-Received: by 2002:a05:600c:19cf:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-49fdf0feeddmr26267205e9.32.1790154701920;
        Wed, 23 Sep 2026 02:11:41 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/48] improve_kernel_cve_report: validate that cve details field exists
Date: Wed, 23 Sep 2026 11:10:24 +0200
Message-ID: <aff05d8a232ea2428c14087a7c5a89991b43bc2d.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246484

From: Daniel Turull <daniel.turull@ericsson.com>

Check if the cve information has the details field to avoid crashing

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80ff4903ea1b839f9cd9393b314c3adfbb80b765)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/contrib/improve_kernel_cve_report.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib/improve_kernel_cve_report.py
index 3a15b1ed26e..dc961d59389 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -362,7 +362,7 @@ def cve_update(cve_data, cve, entry):
     if entry['status'] == "Unpatched" and cve_data[cve]['status'] == "Patched":
         # Backported-patch (e.g. vendor kernel repo with cherry-picked CVE patch)
         # has priority over unpatch from CNA
-        if cve_data[cve]['detail'] == "backported-patch":
+        if "detail" in cve_data and cve_data[cve]['detail'] == "backported-patch":
             return
         logging.warning("CVE entry %s update from Patched to Unpatched from the scan result", cve)
         cve_data[cve] = copy_data(cve_data[cve], entry)

