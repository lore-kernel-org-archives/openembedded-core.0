Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CC5CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:30 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33486.1781132129597652219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=knVA8vd9;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b64c8311so80565775e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132128; x=1781736928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kvK7v8XdfaN5DfCnGBOgvKeAznSvQeDkpbq7y5OMlw=;
        b=knVA8vd9i4aVi7iK+JtON/OO/4wm6dROSd4/WWLSP0gUwe+AwJeVa7RijLG51Z20U/
         3rJPUt/6Jg5JsQ4vo5B5BntNpeNlplhLB3osVijLj0bLtqTfUbHOiAfqWWXEuKQKkHTx
         1YpMA4oxYLt/5Jg8qNeI3Z/NI7DQbgZ7bMMw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132128; x=1781736928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3kvK7v8XdfaN5DfCnGBOgvKeAznSvQeDkpbq7y5OMlw=;
        b=D0ENJUk+Whdst4e6OAMDMVCm3j3eB7/RjnqqsZsGlHYCEpf+VLt9geN/U84SqEz6Q7
         valn7sQMnGkoUIWi2NH6D0xzjWOxvdAgpXtAgpcaXOSls6TAsJa6lzFbc958N3NiCtcB
         1X4whgalpTUMx4egIMXIlN7Rk3xf2A7cTTICJsNoyl4tgYx6YR1s/0mFt7fl8E/KGazT
         eyctwkdvbJHdjzhi5GO41Fh03GeOWThF51QBlURAjYvbPOfU7pWhkOJtL28MFzOWX3r5
         19oXyMfiRv8wmpZYM1QGhsD1XsFDvSJDrGVYLJCEjIjtVkxywZYq15TI93IkVxobSZFw
         gA/A==
X-Gm-Message-State: AOJu0Yz9dPBe0dCzFa6/J9EyJBHL/m6kVgP3kNjwUWy7y1w+JxDvApF1
	DWGJePuC8AfmtfHjfVaA9oJGwVxXp2o9Jeeif+5z2DT4lihaj7c5h1WnqOdG20he0ThB3U0CyWQ
	dyfUd
X-Gm-Gg: Acq92OEhHhcgJa4TWBiX36WuAqVzrfg5VK4WZNHcDYgcrz7czb6gLUsXI/gqmq0TLWN
	/lXJ6ItCBRfJtANSYUwjSMVBIALIiCLhsTE8r6VhPsmalZwyif7T6IAseGF86g6H5PsjjSXDw7r
	4QzlGp/VorjfnFBwEWqmCfaxzVK9LaDP5AVMj4nNcH0uMn0WnW38n/1Fa1j3JFiY3t6WR9PRRIl
	l814LS0WwgAQbLs828P3WpIlTqmcrl5E2N7gdKoZqPURz63NTUYnQ0ocpsaGVum2so0pzCnZYEV
	v64Hea8OTJzkdzVetgvUZUqdvIlKTAr7MoC9WPf0Za2KJ9Rz20mjdULEuAVyH6WWLkB0G6n9udo
	ivMm35oFKeNTDTedeq80wUcscUiwmGGyPwyPbI/5bIsc4wqvDuTBPTqKzhxxmh/U8GpU1osnfD/
	L8xXbtS7N2HG3aR49tR5jJjpUTocD/itDoXBZjaHG4kVp+o4roYJObLCShKWXRtetM4wlhNCLq9
	mDLvg+/C7Qf7oOlJunXVcLtQuy87Akh/JKhraaUDr05si5QbQ==
X-Received: by 2002:a05:600d:8444:20b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-490c6c20071mr242352495e9.3.1781132128011;
        Wed, 10 Jun 2026 15:55:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/21] python3: reference upstream ticket in a test skip
Date: Thu, 11 Jun 2026 00:55:12 +0200
Message-ID: <3ad25cdf47e75d2edc217727eb3f8bd01ed76e47.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238417

From: Ross Burton <ross.burton@arm.com>

I've filed a ticket upstream for the libedit-related test failure in
test_bang_completion_without_do_shell(), add a reference to the comment.

(From OE-Core rev: b5c24e1491dcb9ab0f782df6be6582fbd2151724)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.14.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
index 919cfde9aec..02bda8ddcf5 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -271,6 +271,7 @@ SKIPPED_TESTS = " \
 # but not bang completion. test_bang_completion_without_do_shell() passes if
 # building with readline, but we don't want to change the default, so skip the
 # test.
+# https://github.com/python/cpython/issues/150922
 SKIPPED_TESTS += " \
     --ignore test_bang_completion_without_do_shell \
 "

