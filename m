Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507FAC79FB5
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:05 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34929.1788788162001177338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=izwmranR;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so69882f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788160; x=1789392960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xf08nSSbQ8EEQ+XAvAkwH80uulQFqSvs9TBEm7AsgvY=;
        b=izwmranR3S2X7OkllUqCVh3HDQVlJO3yYczqkVFSetvh8KC+WIXMPHjdKGi2zpCRyx
         N2exnqjPe3MJsfRshq2Goi59NPKuBboO2y3JSzof2cEjFzcJiJqWdGQXtrV1WvW6k8xY
         Dri5hsXpbUr32CgbFPfYweZcEIA63vKXU603E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788160; x=1789392960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xf08nSSbQ8EEQ+XAvAkwH80uulQFqSvs9TBEm7AsgvY=;
        b=dmxx8neXIwPxNV4iSBx6mSRc5AJmI4rZ2yy5bhKDXA0IdsZfUiC175nkXxwTFh+xQZ
         zc56Ub1FgPf9z0KqHXKfOkFQCav8CBhnznGKsk1SgC2GI1g8BBlBdZUieNn5WLhYWxu7
         w3thvxG6MYXmPokh63og2FkEpHIxQU0c8DE07KyXe0tev4Io8VZHu7NNi9TG3poTkmui
         m55xqi4oaw45QvC7nkPq6HMgM34qbbjsX0V344LMC1qQFacfsmyQPi34KRS5OpEuW7o5
         KYhAzmWEMLbMms3K8I2kU6H6ueTTZ4QOXEW6aZY218udjrfqxaYrV0o7J/SjwvzLry7U
         yyMw==
X-Gm-Message-State: AFuF++kplTIJgPojFzdeRbHYkInIMRtwEQh9NG75tz+OAHAq/EG+3cpZ
	2qTWgftJT/Th6Yer/jZH197Zcxeh36PO1XuQ9Na6TY1MNd9Q7TU9eMQ/jgKUYLzovaY+eDEnLi0
	vHaPY0KY=
X-Gm-Gg: AYBFou3sd0c1KiE8rArsynB0doYGcrCKW2EGcjpuHYJufSxZk1pJY/fV85WNXr2PWL7
	jEVtFl2LVOAv4LAZwzfBxMIdsTd6qLqWWqCH6oSBYzAmcHKYG7Y8RdvJlvmf7XbddfrUx68m2f0
	o05Jor/7wuvMxeYoqAJQ+XFINPMgs7R748BY+jLat4DTRxjQAk/j2b7s/Q5NbQdgbkHF/a8ISug
	Ebjjlzw+amRb8sBU3iFVCYISoetujwmz/gwQsyNuF2AQNNyQi4yxhhmQnaTEsup+UeymS5GPxKx
	UcA3n8wQ6+pkOx647nCThEIwUE7kuylwTF5+qhbHNvH7vLy1siA+SsxPMkmuWWsMsoge1HcLNS6
	cSgT4PNKe/SW6CJSiFeB77yjooDxXwiCf1mMvRLlJqIVAn7VyUgm2aqer+aq53Bl16N5gUNl5Vn
	OMe4j3CHd8iaPr/mrZ7jUFmBU2iNqmPMWr7NVZDonTC2qMLG6ZOpRtuGvaIOXdHqkI6msMHtBz4
	GHi6GTsskiRNMLeE7mAa9lF1tMwD/avUlk/Dxy+rNkvLYXjm1y8gnaJJrSjtmUU
X-Received: by 2002:adf:e944:0:b0:485:8ea0:da8c with SMTP id ffacd0b85a97d-485a242f46cmr1011569f8f.16.1788788160194;
        Mon, 07 Sep 2026 06:36:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/35] python3-dbusmock: fix CVE_PRODUCT
Date: Mon,  7 Sep 2026 15:35:13 +0200
Message-ID: <b64bc962ffe320ff3ceebc62584bf05955cd08ad.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245275

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-dbusmock (0.31.1)
Before -> After: python:python-dbusmock -> python-dbusmock_project:python-dbusmock
Newly caught CVEs: CVE-2015-1326 (.pyc code exec via AddTemplate)
Status: patched (fixed 0.15.1)

Note: The original commit targeted python3-dbusmock_0.38.1.bb. This is
adjusted for Scarthgap, where the recipe version is 0.31.1.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0405d7d4e476964239e1c27c987ec9c12372e95f)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
index fc32c6bbb6c..4145ee8ea70 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb
@@ -11,6 +11,8 @@ PYPI_PACKAGE = "python-dbusmock"
 inherit pypi python_setuptools_build_meta
 DEPENDS += "python3-setuptools-scm-native"
 
+CVE_PRODUCT = "python-dbusmock_project:python-dbusmock"
+
 RDEPENDS:${PN} += "\
     python3-dbus \
     python3-unittest \

