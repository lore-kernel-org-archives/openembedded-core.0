Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8DDC44507
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 12:36:41 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4203.1783773392155703803
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 05:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R7cd2W+S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47d70879764so1108083f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783773390; x=1784378190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G/EMpyrKfaA0tG7/VQnjvtSQoRzUHamldZwOTgUj+UA=;
        b=R7cd2W+S4xZthPMTreq70PwroW5x7RY5KAo6NjEWs+C4NaTMOBATeJJehxk+MvNaaj
         RtFsIPKxIc+xDzFLGXXvz8IbxJFjhiQacCezN0MfF7QK2U9+blj/7d2cQm0BDvMDEDJK
         FgVZMB83AonlBEx09GXeALabfF39ur1b1mqoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783773390; x=1784378190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G/EMpyrKfaA0tG7/VQnjvtSQoRzUHamldZwOTgUj+UA=;
        b=lR9//Q8q7TTEoGAyyYumyRHjQHtz54WGj6vNvPAwuzNrPpUBzcPN2NrFc/KYiEL2b+
         guZhfE4m2dsLsYUAaDETKci0A4chJE3vV68dZ0uppcvbJRGGe+0xfEmvDENO4TEdnASc
         kVIOvxl6a0Q1cuHWkuc6cyCEmSPoxCmtNY/xl+B4/As6zLE/Y2Dep/RVCjz9Np+C/okK
         r4q8Jt4HqKG737cH+m/BxSLit0+EsWAQwuODqsDeYp64kR2nR6K/1ep30sFotwwWsFlr
         fbn9w5UvKolqi49cezS/FGAWgBUgFiL2HyO7NqLXfek1Uzunb3wdyhLNGQzHd+I7FwUK
         Hcyg==
X-Gm-Message-State: AOJu0YxWfLJzxVJQje0qV8Z+M9ihdqd1rszOR5C8DigM3GI/RIU6XJoS
	tdR7xFnPQWeM/7MeiAn9928+pg0bjR82oO7mVEPX25A36m61WgkVQtJs6hCpw24aoLsqmI84weI
	f71z8Sog=
X-Gm-Gg: AfdE7cnGTVv3Zx7pPnw5ddeEKZ6cEaVaWiE7SOxyhDquqSNP6QBMDQ0sraQRmSkpuwX
	2i8hgQCw54Mn8Eo5sRZ6Te/I4H2Qj4A5ZrSdPD0+LMNyYVV8jLXf+ziT1WclpBPlW/78NJ1jDhq
	rmf2tFkv8iOD6qYbivYvBhYoJyrTciyJSWrpOcDo8aGzaK+jaNbXtK6xLdyOMhj9S2mLp4Mg7c7
	j+WZSruZjqWO+AWI/gKY7OafgZQeu6OytUabGODSGlbNOgSJrkuC4Gr26uibPEokXdBJzuYwzq/
	IAoReBgLKtwmdBeKve2uNgCSUEEZWtM+YNTE8kHRtveTXBN80GCghkRFgmHRxo/bpojeBQ8AFF0
	QzRcVPpz7KOtCGRSI0IE4977Dj4P2I4Xw7oEjg4QobUPBqUtCXmYMqegc8FnMMxSBs4FqiloqaD
	wgbdfFkwTo9wclddGAWLtSY/1b+FHNsMDhClGnu43ewlbVtTLHotIF
X-Received: by 2002:a05:6000:40c9:b0:475:f100:3603 with SMTP id ffacd0b85a97d-47f2dd01c1dmr2453224f8f.50.1783773390489;
        Sat, 11 Jul 2026 05:36:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2004:2e5c:aef2:b707])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm77172097f8f.17.2026.07.11.05.36.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:36:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] libmicrohttpd: upgrade 1.0.5 -> 1.0.6
Date: Sat, 11 Jul 2026 13:36:21 +0100
Message-ID: <20260711123626.1583730-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
References: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 12:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240712

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libmicrohttpd_1.0.5.bb => libmicrohttpd_1.0.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.5.bb => libmicrohttpd_1.0.6.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb
index 935fbfcf89d..30344bf13f0 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b46d00f58efa6f497b97d2e782c4ee66301d412ddd855dd3068518b3a2cd3ea2"
+SRC_URI[sha256sum] = "bb5cfcadfc52dbd5eb512d6e2995e0361351c33e97a87aba426d3a4a7ba6cf70"
 
 inherit autotools lib_package pkgconfig gettext
 

