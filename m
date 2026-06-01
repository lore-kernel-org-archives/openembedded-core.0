Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2E5CD6E61
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 18:13:00 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5833.1780337577391117055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 11:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ljnNar6F;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-69de16f5f79so2660794eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 11:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780337576; x=1780942376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bE/m/EwT8wiIT9xWM5u2keCOTU8uU+DaYlj14wOKico=;
        b=ljnNar6FNDOzAh12n2Tka7ADdenp73cbkc2CqFeYheJFHX0rn2SLAb5OMBJI5TEZFZ
         aQD74gt9S2yrdOS3J9sr1DqMnACDdznG1QQFh+rkZs79Fhfbm9HKp9SLqc1C1eCxebq5
         MxfA+69NnKtNKDcsDIKUIoSy8wBftJIZhBQeyj7KVKkfIgga9M95ogxsi3DMwayL0uwM
         dpb/ixXQ5xn4fDYXwo53PzuJeDcBAfsp1SUqvm2+/u2ll4/eQ2BmPRkpb6fDtjr7GPXt
         tF0M6+Gu7kf3MRilGlS2a/OACK0yuhnaaq+CJX9HXyqxgUkBBLkvUwViBubaTNrWLJTQ
         6e5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780337576; x=1780942376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bE/m/EwT8wiIT9xWM5u2keCOTU8uU+DaYlj14wOKico=;
        b=DzrNM4ebglzLQ+GmpFU3c24T4npQwHMwG6Ia5HIhkdxWd7c04O5YVmHmtRA93InHDa
         WOEO+GF9W/bltkZ1p3oQd4N6Qgt5zrzhNPkMW0c0zZkYA6EGgw1QPRHEq1QT77Akp3GV
         RoRSq5mbVdV0AuMt6Epm+iztyqYg1ddjOwTb+rD3dXbkIN3sRw8xboxQnLsBvICsJnO5
         sJTR9fCaj7T+jHP3wMBdfGJv347n7rq/uMSS79fG73+koS9orippjmpAMLst+nlNG02U
         2xzGzManKMrI2ye6s9Dsj9zrl+TQM5XHxYk7X4KQ6H1Ar+YOwGTE6F+EfHMi8RK16nne
         tyDA==
X-Gm-Message-State: AOJu0Yy0MonXhCJT7716sS/DjaG4V/WG3vYqmEFEqTfhNKMAcVT27x/5
	425GYCkVhPbMEOzA/PdXgQWuWyJYO7ncZdYKEYs0+SP3Ajr8I5x18/SX2gRA1Q==
X-Gm-Gg: Acq92OE87CggWLf/hfCuqf1Og0ulUEHfBwmhsqJX2f1NtbYhwgOuNSlo6PXS2OD5fk1
	vNC22p8V95xCeM2Z2BE3CCXRStYdxylZ/2RdltE3izFaKwgHQMTcAjeFonLR2I26H4W0TqrXzKc
	nKdj9TvvFN/9U0jj4LEVOev4OsSF1Hb3x4Jl9bvnDQd5Vi005Doj/N8Z5kjXrsYDqiyzUwMfo+A
	RdpExEasufLPNYuEQN+qC3kPT82DNTIMxcCsVJLKKjquODiIub1AkppG0JbJrb42VDMfsOIEWCm
	UEiEyTSJPE3qI3/R836ZQHx4dEwH70GEa/z/tfvE8H/BJSLcZn3l97+CpDPx1jBRaL/Ld6qnKjG
	UOu+WAHIbIJC6zN/6f1WVx6p5/iFxXQYe7h8GjavHnR7X1jBP+R+mTDFJudtAflldVSXSYj3GgH
	zG+CRjLioV3maGrD/UOoYO3pZJdGFmiSLlqwq0qXVYxQ==
X-Received: by 2002:a05:6820:1510:b0:69d:f3a6:1f59 with SMTP id 006d021491bc7-69e102fb42amr6530812eaf.27.1780337576620;
        Mon, 01 Jun 2026 11:12:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::399e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e30afb3e6sm860649eaf.3.2026.06.01.11.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:12:56 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 3/8] glib-2.0: Change from Public Domain to Gnome GCR Documentation License
Date: Mon,  1 Jun 2026 12:11:38 -0600
Message-ID: <20260601181251.123019-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601181251.123019-1-JPEWhacker@gmail.com>
References: <20260601181251.123019-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 18:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237978

The file docs/reference/COPYING is an exact match for the text of the
Gnome GCR Documentation License (SPDX ID GCR-docs), so use that license
instead of Public Domain. This licenses actually requires that the
copyright notice be preserved, unlike Public Domain, so its likely that
using Public Domain is actually an error due to a misreading of the
license text.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 7fcfd2bf38..dee94ec060 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
 
 # pcre is under BSD;
 # docs/reference/COPYING is with a 'public domain'-like license!
-LICENSE = "LGPL-2.1-or-later & BSD-3-Clause & PD"
+LICENSE = "LGPL-2.1-or-later & BSD-3-Clause & GCR-docs"
 LIC_FILES_CHKSUM = "file://COPYING;md5=41890f71f740302b785c27661123bff5 \
                     file://glib/glib.h;beginline=4;endline=17;md5=72f7cc2847407f65d8981ef112e4e630 \
                     file://LICENSES/LGPL-2.1-or-later.txt;md5=41890f71f740302b785c27661123bff5 \
-- 
2.54.0


