Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BF7CCD192
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:01 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.2326.1760064660044446407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PjAiM3yX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7930132f59aso2263415b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064659; x=1760669459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LV8FfAJ9B6IaMw2hofgYDKMadVGYWBv5dzmcCrmapVk=;
        b=PjAiM3yXXPTE8zG8F1tfZWPgV2I+eFf/atalC/6kGn1bEqeMSk1+jP1fKtZE6gqkoH
         zWUNBF2VPgm6A9EZ2akG6xeXpXHtxLEsQjUlD9iuXS59Et2hWl69Kc9Ex8Qa1XDexapp
         T/NAF072GO/3QWtPZGl7hx9RmAhgcZKKlCuYvTanOgXK+157gX8Pl68GTOB/6r8znYBW
         qms1Ba0RfHhFFZJ6XiSNwexqnltqTj/yZEeTBYtmFaRO7V7PUJ2doxHQI5/ye3bt05vv
         eDtk+Xp49s1XauIBsVeHBOkTRfIGAOWw57wy8TIJvA7WJZFh2CAc0/BKukbcXLObpa9w
         ZF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064659; x=1760669459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LV8FfAJ9B6IaMw2hofgYDKMadVGYWBv5dzmcCrmapVk=;
        b=PmIEKGI7iz3Bo64YY+2R1qCxO8XWqode6g+95VEGsE8zQBODQf0GUkQjEfnI6A5bop
         kCZ3cSkzOL8gsZIXVA1U0sMYBn1LNztxBEGL9/kaWS+TezaDGmmvII9yycLzWK5snHDf
         Qhh2nrEYWe2m6J7zI/VII4bLkuyt/ECcR6hPVg9rMW6Gwow1QDE8/GoAbQaC62tSQhcm
         JBBp96pGCtRV7zF7evtnEsIKsU0yIgeYln7ijKXAZq/qB8Rn574A1NWUDMihanwMPC/V
         4P5ULUZt4nKpqL4mas9HJRaXEkPf/48UhejYFjANgXESRZyyrLm5lx3KrVXW3+lR3pWp
         Qo+w==
X-Gm-Message-State: AOJu0Yzq23OeiXcvbPUBd0AjQpZ0apXRg8XIPFHgen+HvS7SPZWS2lUq
	eFI53YDm0EOZXQSYILZVYzeainRrmb13m2F+u57kPeq5AUKVK6UKotldVV3t5WuLZfnKHoXy4VU
	ATHsx
X-Gm-Gg: ASbGncuPPZDz7nRXO3mwlX2VEosB3lUsNwHhfiT0k4exj1xMV1olfFg4gjXHTZEnygs
	t2AzRH1N+z58GeVCIa2S48h+yu3CluR/a8rqmY4nyXoaSQ5RVQTuvXRHJ5ShX4DOCYbHyJf9rHh
	2vVtZMekKEgRGeKMtgy2rja6UaSzINS6qJmlIfuikxlWfLr3Xxvk1EHVCxDJGtkS3MBFPHLpZlE
	XyLwkf4vDg4fzruEYh12EhqdV3GH8T5hQ9g23Ko/1sDgKebVilVLApLCPZVFVE8QI89CX9nQcpw
	zIW04NzQ9LnkpBrueEQHBbI6HRk53EaE+FFHtgbpZik7zCEoUDXJeNX4NWwFDa+zjkeFC1+U6wq
	a31kMTvzphUaRVDrUgoPjUXVZ/AiqQvgs
X-Google-Smtp-Source: AGHT+IHxjxkuh1tYCZBG2hUPhQgi8FnfqE9yRWs8GB5wF9DlILlXEkvGQYyOo3sA+0qngVv5QP1SgQ==
X-Received: by 2002:a05:6a00:990:b0:781:b59c:b0ca with SMTP id d2e1a72fcca58-79385325547mr11095473b3a.3.1760064659332;
        Thu, 09 Oct 2025 19:50:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.50.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:50:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/18] tiff: ignore 5 CVEs
Date: Thu,  9 Oct 2025 19:50:29 -0700
Message-ID: <faf1e12ae0f9de56402830460315e5be0d13f4a5.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224654

From: Peter Marko <peter.marko@siemens.com>

These CVEs are for tools which were removed in v4.6.0 via [1] and
re-introduced again in v4.7.0 via [2].

[1] https://gitlab.com/libtiff/libtiff/-/commit/eab89a627f0a65e9a1a47c4b30b4802c80b1ac45
[2] https://gitlab.com/libtiff/libtiff/-/commit/9ab54a858049bef020d578c71d82669531551c00

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 1d3d08ff9d..9957699fb2 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -28,6 +28,10 @@ UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
 CVE_STATUS[CVE-2015-7313] = "fixed-version: Tested with check from https://security-tracker.debian.org/tracker/CVE-2015-7313 and already 4.3.0 doesn't have the issue"
 CVE_STATUS[CVE-2023-3164] = "cpe-incorrect: Issue only affects the tiffcrop tool not compiled by default since 4.6.0"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_REMOVED_TOOLS"
+CVE_STATUS_REMOVED_TOOLS = "CVE-2024-13978 CVE-2025-8176 CVE-2025-8177 CVE-2025-8534 CVE-2025-8851"
+CVE_STATUS_REMOVED_TOOLS[status] = "cpe-incorrect: tools affected by these CVEs are not present in this release"
+
 inherit autotools multilib_header
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
-- 
2.43.0


