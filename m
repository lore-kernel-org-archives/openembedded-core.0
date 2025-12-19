Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECFCD78782
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 13:47:50 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17034.1766152062786892123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 05:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=caDMRftS;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso136020385a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 05:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766152061; x=1766756861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fi9/1T8iXpuwCyl0pvF2TeKQ9O1lKka5iMdkD4hw2Jc=;
        b=caDMRftSM8mQq3LWM6txpQYNvgu4Kzc/EcAt4dLxMHk//7J/I/rf7AwRPq9t0vxOoA
         amEsK0bYjLfRpB07OoJcm7dr9vCliDCxzze3gPb42hjUURfKCJCsgbKkr430afkWey51
         vUvGd/M8ESA9pdPs3VAOyxty3wZBCQkzStvGhs9MelHShxHlB1v6A20jyx2+2MkNc/XC
         vlmHK58Rr8u3wTu4yDwF47vkzFNuBnvp2I89l06G/tyyEFxsXhcDyO9qMAgWTnLMP4Aw
         7iKOhexJq5bTg7fteAttoK/RPplczxxf0g3GhUKvtN3HQIdpVhVABPN7zugtMg50RSqM
         /Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766152061; x=1766756861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fi9/1T8iXpuwCyl0pvF2TeKQ9O1lKka5iMdkD4hw2Jc=;
        b=H+CDehJGcVP0l5yTxrFlBHRHbfyEffLb6Mq7qiAC1HbDHrwP7Koo/NH5Qs/Vz17hJB
         jiag0//rAVC/EVduEnFy2BXFA2uSXVPYhG2LvIwejPwRjW3UL44BVM+nCy1IFk5zz2gS
         RgETZl8i2tkEQBdQRjRdp3e/RjvSydbZY2oaY1yyiQIV3lvLCfVIacnbzHxyDkT0A8RM
         QJcbEJChBVCQvaXP8+s2Xo2zETJE9/yHNSJjl0PGzLGInp+ft7osB2sMG/lcbgBDFCES
         cdf0Au2tqHhnkgIwMMi/xVC1deJznjis8eX19RfyL9YCz63p5JhgTrRd/piA9200QRT0
         Pw+g==
X-Gm-Message-State: AOJu0YyX0PEUaKknIHYVQCc53ALAt2JfEmrlrEBfx4XgLi+3enq6jksC
	ydANIX+Avts90WRh790fpGH3oAu+zSy21BUHmn5iTt+E2N2o6t8WG1l/l4nk27deP5xsGTsTSj4
	TvgIJubU=
X-Gm-Gg: AY/fxX7XGoL7IfyK4FJoUPJQb61CVSbyykxSSKOvC/i0ym7+pQZ46L/ssuc4JLNd4jy
	Tx9Nql091Rds51BPgWzpkYe7Kd1YPB/AcnzM0hC8LJtw4TYxhg5IVBUcl7hPDUrsd0IBfzyju84
	OhfWcqUP73R5jnX5GF4LGOnqjq0xV7q+56pvd0V8SwPp1mVW+MIKlOGzX6wdWUy/yItIW51v6KJ
	mBG1rqeDcNXuzBF7nUaze/a9cDuupGftYl+GKEAELK1RWV+0Fs/3Zmvo/h7jAMbeKP10wPI3U9/
	UV4/TKcjcky7dPezxCxTPLOrzJtVuK74vZGC/w5HLXA1ix1fv1F7kRRp7nYRAapDmI2mWeoiBDw
	C4kU6L0ENYOmASCrAhuuFiaelfAHCQo9Jmg2wpeKQra1a+O5nXbhMjdlYJzAK4f3fbffXkDp0FN
	4SkYEL0dbNGvS1Nj8=
X-Google-Smtp-Source: AGHT+IHfmGfO62eGUm7XStqhnXyiEHF5dOcouKEKnKvx2CHdteXiUeZ6jYxXbiFuwtzO6DpUgjwE4Q==
X-Received: by 2002:a05:620a:1a20:b0:8bb:a346:8c83 with SMTP id af79cd13be357-8c090316d8cmr384860085a.33.1766152061087;
        Fri, 19 Dec 2025 05:47:41 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975eeb4bsm184777685a.52.2025.12.19.05.47.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 05:47:40 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5 v2] python3targetconfig: export _PYTHON_PROJECT_BASE
Date: Fri, 19 Dec 2025 08:47:31 -0500
Message-ID: <20251219134734.842422-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219134734.842422-1-tgamblin@baylibre.com>
References: <20251219134734.842422-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 13:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228234

See: https://github.com/python/cpython/commit/2950bc50af8f

As of 3.14.0, Python's sysconfig module looks for _PYTHON_PROJECT_BASE
to be set when cross-compiling, or otherwise it'll find and use the
native interpreter's paths when calling get_path() and filling out
_CONFIG_VARS. Set _PYTHON_PROJECT_BASE to "${B}" in
python3targetconfig's setup_target_config() to help avoid issues with
incorrect paths in rpm and other recipes that depend on this class.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-recipe/python3targetconfig.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 08bc619398..2877665737 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -12,6 +12,7 @@ DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
 
 setup_target_config() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+        export _PYTHON_PROJECT_BASE="${B}"
         export PYTHONPATH=${STAGING_LIBDIR}/python-sysconfigdata:$PYTHONPATH
         export PATH=${STAGING_EXECPREFIXDIR}/python-target-config/:$PATH
 }
-- 
2.52.0


