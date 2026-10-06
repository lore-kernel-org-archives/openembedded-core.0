Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252B4CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:50 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48871.1791301600155873037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ew7uKX36;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso2538086f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301598; x=1791906398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iJR0ziekbJSfTWfAAfSAl3K3B7FIO2PEUvkRz7DAUp4=;
        b=Ew7uKX36vPlKLrfmDOFQDeaNxWPtcg0r65sOs0Nc8Krz4WQxRxH4adkjAp7o6xzGUw
         DzBCc9LxNYiceHviwRyrxjQOpk+L0EOZeyC1n31w/rXs6hlWIIWA0Nnn8AcLdfzfKzdP
         LN//C0QQZzmVBBbL2bwWxjWDor2ExEvwkV0bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301598; x=1791906398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iJR0ziekbJSfTWfAAfSAl3K3B7FIO2PEUvkRz7DAUp4=;
        b=zQymfpMDm/rI/O8sL7nxIvG1EH4x/p//8Ca15VREwsBUXg+6YB5z2HMKHAgkwuZwGr
         Ii/Y8lVTqpDcr+Ukze9+Y6SJXZUl6LhoqOkmUM1P80GEQ4OQD41zukXOZa3zOI7ENXgb
         TS1boDl6mHD9ydPKCs/93ZxsAKc3qhAbK3U8JaPetUcyAQmY/woQDIu8pVDU6i2LeGYZ
         90m08wXot1yCwII0P/ODlDPKJ48DGAa9/GW9nbjGDdj6WzRm7ekFNXeV1ONElV3oMnCK
         apjag4fx910h/JBvxYTepQm4xsIoVNKaGu/1eUYd6oZTM3LVEWUBwNuUxEsmo8/Wo8wA
         i5Eg==
X-Gm-Message-State: AFq9FYJ/TBSX96eSeo9OorTEKzPNhOxMZCklO5YadxBRUeBq5+Z7IAjp
	WZT3pHSONuJonuyJHVrPZwm4BX3ksRASn6eQi9qe10AmnqO+5Ig28kqjUCAgnqrN5w2BlNZZcdF
	8ZY5uAIc=
X-Gm-Gg: AYBFou1xwqqYzrK29Ri3qOmAOBQS+V8fJt1Kdfj7qb3omzrNTlfDXvF8old9OpiiBr9
	v266QCeXpztq409j4S4hHhq+ridmgZZmgRPTgLCpHL3czhPOLOGc5qk11KoTt7M2uVeDdbKqnyw
	jrTXArJ3tFKm1RK6NdFwYuB67RdhoDehEr8jgkFzU+m4ucq6cELTS2sfvrKHKy6bg8txUHHJJmu
	oNgx6ffcAf/oahio3ipJHr+OsPGLwgo+kW7BanU20I8ldETdNIwmQ1xfpQ3rNx3c47f4Zo0DNZH
	QD4mWGuKDfJIXYIshdrRdGjbB9pXLuPdJYHRc0/WFzmlBTy3wOzCoqqRzVkejINuOpe4/1FXMFQ
	esBk7dBhH+cSCtduZ7pwR0NukhqtyOAmSH+aLlJv8IHiTkfA1y81EVnR5nFb0K/dq09bnf8hAsu
	gho9s1DShxRovThkTeUjmQqkgrzFksUuypA3aNsrLauWfrBr3l64xxog905sIgC9oMIAlmjBYUM
	aOho3SsFSCSsU38OHzt+jII8gW4mkU8VXEP4FZcLsRuWSYuoMTFqakofYYr/2lVaqDgTrME+FkR
	M+e6U1w=
X-Received: by 2002:a05:6000:98f:b0:488:7097:3b45 with SMTP id ffacd0b85a97d-48c47c8ece9mr17432864f8f.7.1791301598395;
        Tue, 06 Oct 2026 08:46:38 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 18/19] python3-hypothesis: upgrade 6.168.1 -> 6.168.3
Date: Tue,  6 Oct 2026 17:46:04 +0200
Message-ID: <7d751c02c23caef98af3bc727ef5f05d851b380d.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247307

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Changelog:
6.168.3 - 2026-09-28
- This patch fixes quadratic-time behaviour when summarising the
  statistics of a test run, which Hypothesis does for every test when
  running under pytest. This avoids an apparent hang after the last test
  case with a high number of test cases (>100k).

6.168.2 - 2026-09-27
- This patch makes writes to the cache of constants collected from local
  source files atomic. Previously, a concurrent process sharing the same
  .hypothesis directory, such as another pytest-xdist worker, could read
  a partially written cache file, which silently changed the data
  generated for a given @seed.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ca44cc161537f7f37b7ff7305ce6f58af7719308)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...hon3-hypothesis_6.168.1.bb => python3-hypothesis_6.168.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.1.bb => python3-hypothesis_6.168.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
index 7386f26afa4..980161d42cb 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "fd8acb5c67f260dfbdcc1b2dc95ff48b2b3f90708ae595c76f591bbf3f6f8eeb"
+SRC_URI[sha256sum] = "a43388f9067678fef6e13bdff325b6cfa6961a590498bb37f7ff31589c83bc75"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

