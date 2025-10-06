Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDDACCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:15:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.33489.1759756499410172358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 06:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ihhGLbJZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e504975dbso29586445e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759756497; x=1760361297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TaLdcHkFVK3+dtgE1ZD4dXvNFclr+HqZUHzj/5R0ilA=;
        b=ihhGLbJZcUHXWbAOQhonZRBQqGB/OhdGMd/3u3V01gXagZYHHBZvP7Wmf0+PHSmfba
         dTbh63em8l4332LpWqeetog1P2tuarERMe+aJzixlRGKEM+JjSiENA/gwB+eUJDGLcDi
         WJhCbg2/fopL8L5TZHsmKo8/Gk7s0UTrxMk9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759756497; x=1760361297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaLdcHkFVK3+dtgE1ZD4dXvNFclr+HqZUHzj/5R0ilA=;
        b=eOe8WwGrUy7w3UI1UerCydihngYsBY176xEUlRQoO7Hiaq80bfKexls1VDYOSYYO+V
         asb9uW/7AMow5CeTkh7FUkVk5vlzvHwtMf828D9x7XCozXtjSzaO8qTkFk/AG4mZxamT
         aN5x8fLInPoxg7KmjPDnkyrPFLQ17bbkMkaO5sN5WCf8HnvuYkXb4uRkr7afY3Se1o8n
         oWsZ2xKjSXTwUc2kaAtOxIpgwuW+t7MqM3wKseh223C0BRpHmiEsyyQS/2xDs+u+b204
         7sNLhi1IAe2Z3XQI/EXLdkcWUgCglKffSy/3LizYi6uaA5KTquQfPd2govHanqO3R5DY
         hduQ==
X-Gm-Message-State: AOJu0YxZ/RDfy5Adldl98fQYkpElrZi0JjN2p/Ry5Xfwnks/RHUhcEKk
	XFQ2ixojKro+Ug54rd7x8YDLcBoZiKvqAtGBRRbRKYm2xS+I7OskFZ5t77O70LTyeBkIPuyNEAS
	wXDqn
X-Gm-Gg: ASbGnctcQPLNemZ3trHKvNZh5GgD/K7wc1Sz2axGAjiIR1EVjx0O2LnFmY4vv8+2nKI
	l0vIDaBkMz4YKAmaPA6IMjdpM2nFy1yiO2EK8c20zOwiOpczXiiFD9/NB3YCAuaM7yMGL0No+at
	SFqBXfJQQLNsE1/w2YW7eahDU3gP6RESR0KywNgfUeMk+en+3tX1Y6lslMNcp2glhPp/1xwm8E7
	6wJeQu2crS8ggIAR+85yRnjFAGcLS0960THu2KtICBQZZyHMMdF1dqk1uLhWLhPWCAaQwHEdrgS
	5OS5T3lG9JczNrhyV8MIeRmBI00Epth6XSgEWEo4iHYhJEVtkVDAdOa7QKgaRG5RqoAyFh9gFKR
	jVwDXD0YxgE+rN63i0mLKoyklCD2ptgnsSD+UB0z+2nKYNv+plqWydpryVl23LUQ5Gu/pEl4lyr
	6ac7A7Jwkw
X-Google-Smtp-Source: AGHT+IG8VeixqLcYllTU0MgLf/xVX2DFqR46xGKTIwXhYHc6ObyswHA8f3wXoT5myol0FYvCpmPp7A==
X-Received: by 2002:a05:600c:6308:b0:46e:376a:c9db with SMTP id 5b1f17b1804b1-46e71168c6fmr95030645e9.26.1759756497366;
        Mon, 06 Oct 2025 06:14:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3e9a:117:edd2:a796])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8abe49sm20994085f8f.21.2025.10.06.06.14.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:14:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] oeqa/selftest/oescripts: Ensure buildstats is present
Date: Mon,  6 Oct 2025 14:14:53 +0100
Message-ID: <20251006131454.846597-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251006131454.846597-1-richard.purdie@linuxfoundation.org>
References: <20251006131454.846597-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 13:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224481

These tests need buildstats to be configured. Add that piece of
config in case it isn't by default.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 64fb3f1a1db..ebaf01f777c 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -18,6 +18,10 @@ class OEPybootchartguyTests(OESelftestTestCase):
     @classmethod
     def setUpClass(cls):
         super().setUpClass()
+        cls.write_config(cls,
+"""
+INHERIT += "buildstats"
+""")
         bitbake("core-image-minimal -c rootfs -f")
         cls.tmpdir = get_bb_var('TMPDIR')
         cls.buildstats = cls.tmpdir + "/buildstats/" + sorted(os.listdir(cls.tmpdir + "/buildstats"))[-1]

