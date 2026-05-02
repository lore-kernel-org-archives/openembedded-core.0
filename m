Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB6ACD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9394.1777739454902250854
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FFf3w1F5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so25927535e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739453; x=1778344253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9I1WRrhUvgTaSs8f+T2lB4ykzH07i1K+hp3Zn0ePqs=;
        b=FFf3w1F5+k5D0cR85MMrIsOQCD1Ya5AY742iRvojcrrqxdKbgv7fuiCP/Aulc3y72c
         S4ol3COiComrOgdxmbgtJF/Ey4hGzmy1cg3nehl6tGdRt2Y4alBU5hkyLO8x6X6xbodb
         n/ueIAxLKyCGSriOEfWE4piGYqi/rYTWvdr8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739453; x=1778344253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R9I1WRrhUvgTaSs8f+T2lB4ykzH07i1K+hp3Zn0ePqs=;
        b=jnCO3GQapH3wgE5g9T18t965Llyfp4SwN/QOZn7a3ORbjkWArQ1UYTQA9uJy2RPGjP
         T1UZONFBnR6PZhAxEiEOi+F/duL+ER6J+w8Ifr/0rAJdhaypg4ahCseEKHyq7lM0Zk+l
         gTwXlVkpbhMifb2n0r9g3Jl2Nxim+rGiQYlcmjn7ahLAl2Wip8UvS9UM0R1LqU6qQKiT
         AgEwbMcV8i5FC65l+qvwlcYO6EO0kh1OCQmjC2WMlqGTwcqEP9j0AfrujL6dcJ73rXUx
         0knnMvjbxMImAki9+mv52omHxQYMiT8sqUDA6bfOWn1bASFywo/QOWS10opNwp9z3/Ym
         009A==
X-Gm-Message-State: AOJu0YyVxkm2T3pZXtJ0yHmE9iuliI+/IkaatrNTwdbq7qO78ujouJBA
	wYVg0slucz84FkQ/9W+mzKM+8VVmkM+zNPZRGbPtFN1BblR+5uyWE4gCQxy3e8hHNDMXkTS+fVm
	xQyCuBKrOWkktJmHutcffZugN/0uPH9y0Oo8+hTD6FyurciBRdGUNoJ6VJ1nERnFg7OjV9THxEa
	4KcXvfGMbaiw1H/C0=
X-Gm-Gg: AeBDieuimTgI/aM48mHyQXZTfhcYwXil07K2HVnf6eCMyNcW9rTxnhpt7fw1xhtIDNn
	+GVoiagMFXesDIvNE+h9k8Hw9D8fqwSYchsUFLv2nrM5KoEDE7tu0Qsp5+fxPos1IzJTdM74i8d
	w1ZwpVAMk/k3MS6OI39AabeNL6Gj//1xsg/BCo2upQ5h70sEe4+mbuBF0ftje1xGCFr4mSSds4S
	oZsF5dpSBmUhnl/uMO0O6D+oWVoEti5EvxexaeFwYAJVLvZaCqdvp0kF6K8mmWLTf1xQSrOzCdh
	PlRMIGP6pSYR6pjdi8CSSvjMdE7G8JF36FS+IE2p35YKjZ/epidizlb70aZ9h9SYv02qyjHH4sq
	+PQeVsgaO72Y4rAP4zW4502M9E/1cQwUtMCzZFNYMvbBPMyUrCOXe/qeJJSU+IaFZjkF7t6TrDc
	JOW2DEuN3QESX3kXWhdmRYg4dc7V1OlLXr9/ilx2i4SrzcGGyD+gvkx6hks12rP/o=
X-Received: by 2002:a05:600c:3549:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-48a980fc640mr56137255e9.0.1777739452813;
        Sat, 02 May 2026 09:30:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 39/62] python3-mako: upgrade 1.3.10 -> 1.3.12
Date: Sat,  2 May 2026 17:28:59 +0100
Message-ID: <20260502162929.1377831-39-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236348

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-mako_1.3.10.bb => python3-mako_1.3.12.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.10.bb => python3-mako_1.3.12.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.10.bb b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.3.10.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.12.bb
index 2d937dc184e..b2c1a8dad8d 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.10.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.12.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "mako"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28"
+SRC_URI[sha256sum] = "9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942088b7fd7af550a"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \

