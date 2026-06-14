Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABACACD98D2
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105036.1781424201225646966
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N2kzVUtj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b613a17bso19541525e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424199; x=1782028999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xQlmA0vycRMod/2f6zYGNRisAGjkRUWdAE4TEqUOtA=;
        b=N2kzVUtjuuDDXVJVPSWDgvCxZ+nzUI/Bnwm1xowq2YlPC2FUuEVNEwulh1/e2XcR76
         mN1RIm3GoGk3nr6WvCmJnLu+w6jxa4SE/5md70V4Z/ajDzo2KCqhYEYZ/kzK+/UJyD8w
         2D0TqNR4x6jzL46vOyda4JYu80OGcYuInr5bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424199; x=1782028999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7xQlmA0vycRMod/2f6zYGNRisAGjkRUWdAE4TEqUOtA=;
        b=G2J+Uvuaav4rPpABGqEMAQ+tEn0ipcdweUutyJrk01HeQcpTI5BE/LmNjPc3IXQmnX
         LIMjmPPTCMT+5q8IOepyDWCGtakEeoHoD/8BkDVN6IbYBO818NuHb54LSDp6LxhmSewv
         Qvnz3EnCiGN0pmxsPrPq4YR5ROBXY6V8+j/kqC33yvOYdfQHYCuJwNgDZe7lzdux2OBa
         Vcp6kUOFPtxIDeIxM3MUBWcUnARsf6laTTPsteuW9in7DfEcPtEKF61uOO5l8RqrsINW
         xGeUFeZ0cUZs06g+cGT6XY5rvYHwTVC75qIksCDou/ruCnpRMt/czsDgUmNmcYZEqIBA
         PeJw==
X-Gm-Message-State: AOJu0YzFEelYLQnBN54Ql3i3uWssLwed+nAWzLF+IBAw5l1CZ2/eHQdV
	8deluGKpiG4exr/E+U4QeTwoQWrbAg9VyQz+oLr8v9muJ1gqM16STo8BS9g5jA2Ow/6FSGSFeRA
	ZpGes
X-Gm-Gg: Acq92OGwv6qlI7X6h2QazNwdDhuYq68nwh4ZnHaPUavOuTR4uPjmcJazEgqbOqvb0D9
	WwNeL6RKS9wwiNKDtWe4Xy7KoY9R3rx53QJ4HVSkG/koW9NwDnWA9YEk6YqT34Q2Pu4j6YTWx+g
	kALi0aqSPgzga3WVn0xXRkkwAPgfgN+DCVAySuiRFw0OYqWtmU51P/zSUYtLJdOwaHu7sgjJ/DA
	3XMKLYNFR0RyrnY1bpNXGP/Ux1tYeN7B1Nw4+ZjUWSGD46Ir6gllMicYRF7mGLAKl38CBGS5NDR
	nYLUsuOU2FbFKc0BARyAs6XC/C/3JCmLDXxhSWhDUX1E/iIypEG9ldPhT7YNzHrmny989GgOZBu
	PsAWZDds1bpooG1M2yei4K44aZQCje11chY0ffyVv4DSTexiVyZ1M/qv8IDhtTmlaP8CFF6zqtp
	PXXoFdB15D029rcvs50I55AjmzExqVJVQTer2oNzdQd1XPWPJHuzQe
X-Received: by 2002:a05:600c:15c7:b0:492:1e36:8c71 with SMTP id 5b1f17b1804b1-4921e368cb8mr60133985e9.36.1781424199531;
        Sun, 14 Jun 2026 01:03:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/56] libmodulemd: upgrade 2.15.2 -> 2.15.3
Date: Sun, 14 Jun 2026 09:02:17 +0100
Message-ID: <20260614080307.4017177-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238690

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libmodulemd_2.15.2.bb => libmodulemd_2.15.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libmodulemd/{libmodulemd_2.15.2.bb => libmodulemd_2.15.3.bb} (94%)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.3.bb
similarity index 94%
rename from meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
rename to meta/recipes-devtools/libmodulemd/libmodulemd_2.15.3.bb
index 32d2a39c417..4627e534286 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
 SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main;tag=${PV}"
 
-SRCREV = "b8b11b4dafaa2c4d73883152bfa7e5bd81cd7395"
+SRCREV = "a8f1c5b1243a8e844a276094007a2bbf8a13b40f"
 
 inherit meson gobject-introspection pkgconfig manpages
 

