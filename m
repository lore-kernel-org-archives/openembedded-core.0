Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0BDC55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:44 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15084.1785846222795315659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SSOv6/R8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495590dde14so31732685e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 05:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785846221; x=1786451021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ohbXTmwDi36uxmv+onK+kOKn0BD7H1nZyCbHgEUq+Qc=;
        b=SSOv6/R80xLFl2f8AUzhjOiGvcmR21WIO/Suv+6pbhYectHGcDvK3BQiKXd/e/XvmF
         o0ySDIcb56u9oikUYZ42fww1DpZimAM+Vy1X+Uvl6FgQJdsuJCN3pKwStgsaPRISdAnu
         9Y4m4DXpToxeKRfW5cX2/xDIRuBudCD3cWozo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846221; x=1786451021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ohbXTmwDi36uxmv+onK+kOKn0BD7H1nZyCbHgEUq+Qc=;
        b=F/FzXwIkfeLcDPxt4xsC2m32aRDeMHBSke0bylsHsn4ZZtJlkzjVjn3Tyrj5SWEA6P
         KDDUEGsnXaE8nLzN8F0GWlTzfo1ML0ZiZikSObH0KWRR1GL+TtDvnbvZlFeqWPG0CNky
         xVfW4V3sBl4LxXUmGWik/Fqf+j4pBm6ottMxvz7H8FcO92hVIqOdv+mYEZS/8qhFQ9EE
         9D5vrx7x/Y3v3vPl0PRrFQDsuBI42Eyr4FZWdzsKxvFtYaBI6++FWLFP6ViA1O6tIDmQ
         6yaOsxo3PPM5xx1GuOdNcwJ3WivpLHQt59nHCKqm6TgFXZrjQ1zzGKextUsTCb+SV0LF
         w0+g==
X-Gm-Message-State: AOJu0YzTbiRsPoTYhPvCWsaAapRg7mMWrwbMGrNUatTKzawpLAX7IuvT
	u2OUI9z/ycV9FMC9QdYucIn86wJZBVA9BIgKvT2xZCmCAMUb0AaPubu+DEPyOzCQXuTQE8hZvTT
	6Ft99P5s=
X-Gm-Gg: AR+sD11W6RBNMQaGmdCf7NktYtpeLML5eDExrXX5flxIPWx9M1ymXNGmIxGp1+BUQ1W
	CqT9dL4LkHi1w/DpDGx82pXuk6ficpThJ4ClW2KmuhmVQuMIrlqIO4sCZzPDpjk0uuxEg52MKtQ
	mW+G+r1W++eCJF0+x2MEAVi+vV6WEkmDyaTHyP5xJKc4WTh68nxwtTkApdmztOLlh+2rMGI9xYx
	/RMh1SvyAQSSqAVKFgzdHVwoxblF4tdgEZh5h8LmxYQJ99ljOrWUG+DMqfwFiPPnBQZ2sD04XYZ
	uHqz11o1BPB/eEjfkls7mJn9D0lo2ZSEu4e6Ti+dvZm/FZhK1bPeELVUYxwsi94OUVU1DJFxEYo
	cjS/12fBNjyJQSfJFgF6B8BPFrdJ/E9MsmlfzpYkeErnSvBjKChc9NW0ZFZOxm9NfKwkoNBC+iF
	eN6KmJWVeK8vddEjhfs56WlMI4ZAJ0pt5cEMSx93DWFXOvt5qSCwN3V/xux2pCR11HkF6HoLvXe
	9RrQX9rKRXpYhItF02xS1Hl62R2
X-Received: by 2002:a05:600c:8b14:b0:493:e983:806e with SMTP id 5b1f17b1804b1-4980c66d8e5mr349741225e9.3.1785846220837;
        Tue, 04 Aug 2026 05:23:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm76247535e9.4.2026.08.04.05.23.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:23:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] xmodmap: Upgrade 1.0.11 -> 1.0.12
Date: Tue,  4 Aug 2026 13:23:30 +0100
Message-ID: <20260804122335.3094065-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242742

Changes:

- xmodmap 1.0.12
- meson: include headers when checking for functions
- meson: Add option to build with meson
- handle.c: handle -Wuse-after-free warning from gcc 15
- gitlab CI: drop the ci-fairy check-mr job
- parse_keysym: handle possible NULL return from copy_to_scratch()
- Strip trailing whitespace from source files
- xmodmap.1: Some editorial changes for this man page [Debian bug #1094313]
- Improve man page text & formatting
- Accept --help & --version as aliases to -help & -version
- Use _strnicmp() instead of strncasecmp() on Windows
- Assume target platforms have strncasecmp now
- Remove "All rights reserved" from Oracle copyright notices
- gitlab CI: stop requiring Signed-off-by in commits

License-Update: Copyright line removal of "all rights reserved"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-app/{xmodmap_1.0.11.bb => xmodmap_1.0.12.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.11.bb => xmodmap_1.0.12.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb
rename to meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb
index dc955aa9778..633c70ee048 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.11.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.12.bb
@@ -9,9 +9,9 @@ from the user's session startup script to configure the keyboard \
 according to personal tastes."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=272c17e96370e1e74773fa22d9989621"
+LIC_FILES_CHKSUM = "file://COPYING;md5=76caa89655fe179dbb374831c98ca65f"
 
 PE = "1"
-SRC_URI[sha256sum] = "9a2f8168f7b0bc382828847403902cb6bf175e17658b36189eac87edda877e81"
+SRC_URI[sha256sum] = "fc54b9b5bbf2ae58ba8f9d42bd051c41c7438377400c42c17d7496d19e1bb3ce"
 
 SRC_URI_EXT = "xz"

