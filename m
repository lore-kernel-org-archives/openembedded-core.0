Return-Path: <dan.dedrick@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id DA33971DEE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 22:15:15 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id o7so3020578pgc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 14:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8EUB2xHX5tIhMJc6rty3YLbSHbOJEud2MnUif2TRaC8=;
	b=pwxjsb38BBxBu7QPErtYztF/qA/xSA3yZk2iet/RYPmtST9hTejxPloPKYAyTprj+6
	X+bkXwh8Gt9JfhF01DsWS8lbYpDTTA5Jun7A4F7D6Yuy6Cz/qX7ctLVEQ00QbSMcsW1u
	80hUUFlAX9cNNVrvG9HWEPbcVPepmZrVD2Ws+da+bOQB0vZhyBAJgl5gyxOD4P7YWkl1
	XV9pT9o07RJZoxM8IIrWlRajat8z5/NOBOBRkz3mYa/ZzjxBSZRfqXbGFb4OJRx6fPtQ
	wtWFhUEmC6TuOM3Fzm2RoJo8qBHG2Q50NjfYsf9kigkjeUmCoYO6/YVKxUUi+eKYn8cq
	zX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8EUB2xHX5tIhMJc6rty3YLbSHbOJEud2MnUif2TRaC8=;
	b=OngC5+cvuD0+2rG7eurXC+z2CtOoI+NRIg0EDKkDKn0eQYeNYIoaagw335+4z47U2b
	NyneLIjCkiVy9de4mlSBh8okC6UVxPB2ZLiNV/5CWAXg2+1dAUwOIyJywStxp9oJfea9
	74WsNrtFzUaPzQ1StbCWlr4D629uQTc4FUhzOJPmKSys/xsxMUUy6kPXlTweJc9rXPsZ
	GXsQrc+ULC7mUS/Lm9d7770D6QD1dj+6rw83/6eGT0fvfahqHcuYb1pG2tkJLhnUMdCy
	xLnsDWJezV3WSO4YHrtnTgmxdT19bdb0bDUqN93kSbuI6uyAMiFSMJNbEX1X/QO4u1N1
	k9Pg==
X-Gm-Message-State: AJaThX6Vx58p7l/OkqFtCl5hpsly1bVP0Bqq5ksTmdV1wY4ascJcjhgS
	TKFMLw8RRob1FilMvId5Mb4ADw==
X-Google-Smtp-Source: ABhQp+SAefycjaPmKEUXleAOV3iYbtvOf9EzAdAdv0WUmhGtR0TdmAZ+Lor/RqT+pod9dadGZedqTw==
X-Received: by 10.101.65.4 with SMTP id w4mr1768049pgp.74.1510179316710;
	Wed, 08 Nov 2017 14:15:16 -0800 (PST)
Received: from aeryn.lexmark.com ([2605:a000:7980::1])
	by smtp.gmail.com with ESMTPSA id
	d190sm8376348pgc.53.2017.11.08.14.15.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Nov 2017 14:15:16 -0800 (PST)
From: Dan Dedrick <dan.dedrick@gmail.com>
X-Google-Original-From: Dan Dedrick <ddedrick@lexmark.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Nov 2017 17:13:30 -0500
Message-Id: <20171108221330.5179-1-ddedrick@lexmark.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] staging: fix up multilib destsysroot path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Nov 2017 22:15:16 -0000

The issues here was that WORKDIR changes based on the multilib variant
and the WORKDIR is used in the RECIPE_SYSROOT path. We need to use the
same WORKDIR that everything else is using so reset it before we expand
RECIPE_SYSROOT.

Signed-off-by: Dan Dedrick <ddedrick@lexmark.com>
---
 meta/classes/staging.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index c479bd93ea..bd2ecd4776 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -479,6 +479,7 @@ python extend_recipe_sysroot() {
                 if variant not in multilibs:
                     multilibs[variant] = get_multilib_datastore(variant, d)
                 d2 = multilibs[variant]
+                d2.setVar("WORKDIR", d.getVar("WORKDIR"))
                 destsysroot = d2.getVar("RECIPE_SYSROOT")
 
         native = False
-- 
2.13.6


