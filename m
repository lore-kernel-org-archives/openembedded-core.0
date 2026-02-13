Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC22FEF48F7
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67221.1770970223864567228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FvhIzO4l;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-436e87589e8so699383f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970222; x=1771575022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ScsJ8LpqVej8KRG4Lnz3GMTD9XX3bHJWfigZK6423A=;
        b=FvhIzO4luIk0KadOENIcvYd1bU9WGnecjQxb7LC463vLFlQ8wd2fNwtMbpD7Hcej1c
         5UJUOJal7FErXeCK9PQnXEhrkBpCBxdnXrqRanfO7X9Z4XnEPenFzLmebwgHJd8MtD/u
         QWC14+U496BL4qtii//ZyPZGeg6c8FEYAkiY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970222; x=1771575022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ScsJ8LpqVej8KRG4Lnz3GMTD9XX3bHJWfigZK6423A=;
        b=koF/oepq409flWBlVpd1gBbQHQDFQzolvfEWv5dMYUwK4HzGLCuS+htGEB690l5mi+
         aJPn5VXlVmeffvbk85IobxlzhrTnkljD4vzgc+zdbqqwmaZj27d7Q8QTvfCHjX8QUaLP
         GCZZz09VIBsM2LFqU9zqUiTAypNEZYKHWywGOzxP7ryonBeDxN6SkHgKethKL1xWA8bW
         FWTeOONRL/cmpG/OrDgwjteZ8AlzTEYjZnqRFTPRFXY3Fu4CX8VsMqG9leQGq+9ThgmD
         csI3IjNf6vSXKpcT0CN6msP+x6yLSRaWRGtX4mBsldaxX7lHGMu5Dj2qmhrDeyi+MvIj
         IpGg==
X-Gm-Message-State: AOJu0YwoMsRiqJMqojlt/tXz2xViWh0/LsvXhOI6eb30+9iNeY8ttfGV
	WN8wEuVmYiVdggeWcEwCJsGSjy7bJ9LuSa/GvvfW4QE7WWln+xtha4nhFT4qVm4InTz0Mh1lGqS
	1V3Nt
X-Gm-Gg: AZuq6aKxxDnKE1tRaVQ55uSk2WXY4SO0LHzhBFFhHsiJqsz7z/RQprd7NmWKDIOVljL
	zpD5wHII+c0JM06x9OCObFifrJAG5OlcH4VCwt5PsV++eBhFel/VjEamxLMSOnVEdUNUd3Klyob
	uJ70x4ip3F45/oo9B+StzRy0tP5+5GSePIXaEhCTjVxVghKGl63Dh7BXgGTKAhsGCakhb6/59f2
	JRtxQlrISplL7WWTgU950wBcebfRUQU6RZvMSzXxItaiOhTHX0c2tMav/cD999RLcy6NNYGDCTP
	BC6k5h7Bi2ZCXh/KYOwHpWsJIbdd6k269FyomHjiUSsWMOLQQGlupjsf7ZqlQmMHUhrIKQw/jG5
	7JrqbEUL9sTjY418I60Cb8ndDeEa2/B8S2cs9qqTRRBNRHgIdfjiJD8XQNmR1Yk1A86zkADxf76
	waFs6PSljOMVoEEuiv3OSW0wwHbcePbivN60m8UdlT0v5wINhUQOl9oQY/i1JwBBqTobeSI11zm
	HDsxxBkdQJSBqAR/NE6GLiziU8=
X-Received: by 2002:a05:6000:603:b0:436:3483:5c8 with SMTP id ffacd0b85a97d-4379791ce00mr1675864f8f.50.1770970221788;
        Fri, 13 Feb 2026 00:10:21 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:21 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 05/19] ffmpeg: ignore 10 CVEs
Date: Fri, 13 Feb 2026 09:08:23 +0100
Message-ID: <a07ebde9d8c0681899fe4de77de4e31359cabdfd.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231087

From: Peter Marko <peter.marko@siemens.com>

First group of CVEs got a bogus cpe update listing all tags since v7.0.
All CVEs were fixed in v7.0 except CVE-2025-22921 fixed in v8.0.

Second group has date CPE (2025-01-13) instead of version (v8.0).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
(cherry picked from commit dedc9e3fd5e15408ced81a33e4d25c4ea31274fe)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
index fdc16598d42..1e59bfa33fe 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
@@ -170,3 +170,10 @@ FILES:libswscale = "${libdir}/libswscale${SOLIBS}"
 FILES:${PN}-examples = "${datadir}/${BPN}/examples"
 
 CVE_PRODUCT = "ffmpeg libswresample libavcodec"
+
+CVE_STATUS_GROUPS = "CVE_STATUS_WRONG_CPE"
+CVE_STATUS_WRONG_CPE = "CVE-2023-51791 CVE-2023-51793 CVE-2023-51794 CVE-2023-51795 CVE-2023-51796 CVE-2023-51797 CVE-2023-51798 CVE-2025-22921"
+CVE_STATUS_WRONG_CPE[status] = "fixed-version: these CVEs are fixed in used version"
+
+CVE_STATUS[CVE-2025-25468] = "fixed-version: these CVEs are fixed since v8.0"
+CVE_STATUS[CVE-2025-25469] = "fixed-version: these CVEs are fixed since v8.0"

