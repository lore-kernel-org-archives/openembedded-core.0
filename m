Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32DCC98308
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:44 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2921.1790154701905312175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o4yguigI;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so4540955e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154700; x=1790759500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xT3dcrLX5cRuY9vO/bWRk1wfXfmMkEz5uPzrrFArt9Y=;
        b=o4yguigIb4J+IxJAtaGNmswEyih1XMi0QFl2ecf/tGYl3XOk00rvS6qRXXR+539isW
         /FNKNtqw5zHVUlI6420LS/wYoVzmNxBHFWNKQ5r/+h2MlKze7kKzl/ZYRjK3H+qlahaH
         GehsM038VFTL6FhfLYrngbbxx/jJQC6uipmv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154700; x=1790759500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xT3dcrLX5cRuY9vO/bWRk1wfXfmMkEz5uPzrrFArt9Y=;
        b=ePZdr91E+12twNVlWORIAeUxRZC7/9Eat7pcGdCnqUg2suZxDPnimK+t1Nnm/KJH0k
         ZyzRCWMPoihJFCUwmHMUYxlKIQtQiBsQDDWaal7bAbjlc9f4nkoySioCUftgNe7oU07J
         JzFid4aXLKT/wN6084ZzoU0axx60gjMlJ8GwGUBO9QCK16nmRicXh/oLhBX8nHVinfnU
         oaaMJN5dtYuIR+DMW1lEW45xM+gCB+Qvkra/8T5wGa7UEBHPcKCfDGs3tLKnH2SX1JMR
         Ur1sEhrLAKynR30nGyp/V1fkZnSrNzr0/i+gRGxfdVpvDoS6gQIC5BWXy0bdRvnMCz/v
         gabQ==
X-Gm-Message-State: AFuF++kdlJZALrpz2rFfaqU2CbbxEalCVTLiq0+4v1iG34UKTaG8p1xW
	itFpOZXLrHYy3Iw/xFK0DCEPyDqmkpx3cZKKzjFZNwd+57973CohmAWXtaxIU36TdRiShkk4G6j
	oJwrO6yE=
X-Gm-Gg: AYBFou3s4KPe52+KHOw5Bx+oFgnIWTrw8MRN/p4zg/JT9y5PKp+TIavT5dzmiQrU6ux
	MQtqJ7bQjcy4fUpC/FLna92MoB1x7C/TtgrJtdST0MXBe3qXnPEzuMF86YC++kmNc10vOXBe7I9
	Ct+RO+jZCxn34ctvUsdUVte2MmqS5P2N6Y/9bEtGDlaQerNf4IBkzP3GatM2pqI+pJ0pjsp0l4E
	6H/2Qet1IAHgdIPhQw7bkWpsR0wedXhEprkPpY4X2YgMQqHQ4bg6iTimYZpbeEerM1wZQPel2tX
	wvej+HNJmJLbzhujJeIDD8VRwxQcd6H9eVhHZ+/EyGTmHOU+ERuFHMWaq7nzfN3TGosXtbAJ+4v
	pMbaEMhqHlntBAS1xzigZ8LpSGQ0zc4/ub3pIjiza0+0fEKYBsNu33pPzPseyzjnwrxxLQZEPyk
	hrx2Y/AoPaq7k2n3ITw0fcRbQ7WVzYXZnex6/PhJ1If84WVgFLHPYvX03d/kC5XssQyV+euipg0
	cgNf7fDaO8rdeGhr1KPlewJEPQ/VHkaJpewYs8cGy8WD2eLYQSu8HAKz43gZ7lJ4ou0Re6T6rC7
	rW/ihLU=
X-Received: by 2002:a05:600c:4455:b0:49e:660a:935e with SMTP id 5b1f17b1804b1-49fdf14fa54mr23209415e9.29.1790154700065;
        Wed, 23 Sep 2026 02:11:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/48] curl: set CVE_STATUS for CVE-2026-8458
Date: Wed, 23 Sep 2026 11:10:22 +0200
Message-ID: <e986fa2c8d74c1b943bb9069e47d1a9ae7dee9e0.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246482

From: Devansh Patel <devanshp@cisco.com>

CVE-2026-8458 allows a Negotiate-authenticated connection to be
incorrectly reused for a request using a different SASL service name.

Scarthgap uses curl 8.7.1, which is within the affected version range.
The vulnerable code path on Linux requires both Negotiate authentication
and GSSAPI support, represented by the negotiate-auth and krb5
PACKAGECONFIG options.

The upstream fix [1] stores the SASL service name in struct Curl_creds
and includes it in connection-reuse comparisons. However, struct
Curl_creds was introduced by the credential-management rework in [2],
after curl 8.7.1. Therefore, the security fix cannot be cleanly
backported without introducing a substantial credential-management
refactor.

Use a conditional CVE_STATUS as the least invasive solution. Report the
CVE as unpatched when both krb5 and negotiate-auth are enabled. Otherwise,
mark it not-applicable-config because the vulnerable GSSAPI-backed
Negotiate implementation is not built. The default Scarthgap
configuration enables negotiate-auth but does not enable krb5.

References:
[1] https://github.com/curl/curl/commit/5e99b73cf441d9c369768b9cd48b5389b9a2503d
[2] https://github.com/curl/curl/commit/8f71d0fde515aa4c68002477356c35bd79927729
[3] https://curl.se/docs/CVE-2026-8458.html

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 365f02ad596..f2479a33643 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -57,6 +57,7 @@ CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of conten
 CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
+CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: applicable only with GSS-API-backed Negotiate authentication', d)}"
 
 
 inherit autotools pkgconfig binconfig multilib_header ptest

