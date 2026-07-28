Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0F7C54FCE
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:16 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2811.1785277335777683604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fW8DKhMZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-472326ca506so258903f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277334; x=1785882134; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m27sI871iMP7TIYq8oCrtYo14LVZJ5vLHEPwsJlwsdU=;
        b=fW8DKhMZxDqIVb1B51z0ivvD+/gIQyzC+StyOG6ge4Xtdlq7xVnBw0TukIdSnPT7lp
         v6dtB4CqYkglCxfTJ62JM9Z0PccOB0htP77IVFH/pLgxHCGf7ZuSIbn0RZfc5j9+oNvP
         VGSkPo3YTa9UtmJFH9GOUyxjoBoOX8VjQ1ujw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277334; x=1785882134;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m27sI871iMP7TIYq8oCrtYo14LVZJ5vLHEPwsJlwsdU=;
        b=MOPulVg+QL5UVxl90xsrfLi3erTDNzo9TexDp2OS206vD97jMAslPBo857TGAoZMJZ
         oDLO2LHj4TAyNcVM7aHdlmSHQhwoOmosHnR8Y2aA6cfzrKzpFz73MIzSpFrDQtBBh2mi
         Z24w318GZnax3aaDvPydeEau80kicoPu7mT0SKDXKuwhpIRemmynHANLbo9AQJKh4ZSu
         QUEv68UtLtSTvHtoL7+W3isolTbZzJwoeX1ynF6xoavFC+3JrEH0IzvF1KkprMSTV/XX
         b6AmK9QlZGklbgKkoQdGiYaWZnAeRs+ipBEwqmqM0ImWmt41nS/ntpcc3HYqL80839P4
         OXFw==
X-Gm-Message-State: AOJu0YzgWnFGFKfdnVOKT9Vb1ZNDq7GBKxhQlSu7B950ghiMbqmIHyBI
	gd7XB9gnd7ItDzS5LQwtg7wlY8Jge2bxq+fJt2RivYVXouNkP/1R0LXJOJb2tX8JMVrYUAufqIH
	1wTXTH30=
X-Gm-Gg: AR+sD11gk20RrMA4PnBco1PbDXQbgIlzpuq//fy70qJjT6rMjS6fhKmyIiaZe53r+D8
	D5zQvIH60R+AXynCgw1Nxx7/mo5lN4V3q/jLMJGL83r1edMqYM1KJYecLLcCw2EwECG+wz9CXQE
	hAzzxrpH9wBa8VekO5CUB35yUo1DnelgDEVy8GUi2oiQeEawyKZXhyvYyb8ybfIyxeukh6nq2O5
	LD0lOmwg3ZAWNMSxjkVvwfdiF8wfR5WWEJ40zyOqK4qKGbDJ96kG8+0tiu0gaaGtXRoiQJ0Yd5j
	uKJ2rDlV+LPH868+O6Z7cCmotCkIXWMLgfoeZVWJZAevSiW34LsFKFTMAK9RcTTZipdW2ZhULsX
	biTgtQJq3Jn1FaSaADcBuUFntoYlEUlG7UqYvziVcOcIFR5GSIjkEu7nCVhDjh7+YZfxslf6x86
	sRpRNuzZnKgofdSgaSJj1GRXHmkbyoS77xDuaBnwZCzY4gri3b6fPZQZepaPPhz4gXri2Jy7U2Y
	sSc8slPlGiXtOkN97jvLbKNmxiZUx7EyQfq24cEFoET0Lx/KbWA8uCh/dks+O/gW7U+QMeMyrg=
X-Received: by 2002:a05:600c:4583:b0:496:c361:fb96 with SMTP id 5b1f17b1804b1-496c60bebd0mr43162955e9.0.1785277333871;
        Tue, 28 Jul 2026 15:22:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/19] curl: add annotation for CVE-2026-10536
Date: Wed, 29 Jul 2026 00:21:52 +0200
Message-ID: <637ce45a66ff7125b98fc126321b31cb0cf6bf0f.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242220

From: João Marcos Costa <joaomarcos.costa@bootlin.com>

This CVE is detailed here: https://curl.se/docs/CVE-2026-10536.html

and the fix essentially consolidates the fact that HTTP2 stream
dependency is deprecated.

While oe-core provides a PACKAGECONFIG to enable HTTP2, it is not
actually used so the affected part of the code is not compiled. For
instance, in the do_configure logs:

"""
(...)
HTTP2: no (--with-nghttp2, --with-hyper)
(...)
"""

Ignore this CVE unless 'nghttp2' is enabled.

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 276526f01e5..3e48c58fa78 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -53,6 +53,7 @@ CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on go
 CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older"
 CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
+CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 
 
 inherit autotools pkgconfig binconfig multilib_header ptest

