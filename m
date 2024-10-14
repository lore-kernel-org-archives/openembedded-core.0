Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A437D18132
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 17:13:04 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.341.1728925976022952551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 10:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ql/ftuWK;
 spf=pass (domain: konsulko.com, ip: 209.85.215.181, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7ea79711fd4so991310a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728925975; x=1729530775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7GU+ew/TlJBWVdTzIKiLbnJpEZq7koIaqIIh3+6Qx0=;
        b=Ql/ftuWKuCZc3qbH3UrjMKUKKUgEeNPlNUQHIP/k8VLwHYMvpvvpu0u0m0fhuDAPma
         /6lnEJLlPAG6eWkOuF7Fuphv0IthXoh1C5Z7ZA9zxTOtTD/sBmB2EZ7uMJH5B0gbgZOU
         4FhPRQfv+jG6fBJdMJM5gnMXq1N3EJRby+K8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728925975; x=1729530775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7GU+ew/TlJBWVdTzIKiLbnJpEZq7koIaqIIh3+6Qx0=;
        b=ZDamtxEPU2QlHFyqaHeqsT4BdYaZcJzH7lKKyEXA/iKr+nU0Th5E9LN3s9a/reDRIw
         EpMyowqvXPyww8PiMzjDUMhIBxqJuUQtg6ZXXNhWML7msTD1W3p8dDd/nilbyvMn7DGM
         ujEvaztwMjSwJUweoBqTfQiLm2sZ9G0ngsDRQxUSwYniLNgP9NhfomiRwIMejehcnelM
         V+7oYKZTOEMt93wHuzEV6R/JGuKQ20wuyXAQoSh9z0Yiy0rm+9iUpz3SigLTTLmr1t5Q
         c8J/wgOjjfGinqP0G8jBIZp1FvQVpVkR06rMLJE8CgINFbhey9zt8jjVNU7OTB9s9gIc
         VRiA==
X-Gm-Message-State: AOJu0Yw2GqNNYi1IGLR1Q8gN2n3PpUb9MVn7nbZQCmU9aLo0fF2PrXHg
	PIfrHn3mEq3buuXBja3ELquBeldfOJg+9tuVr5fv4vLvmM1vAP+mo44+nAfXFnnbblqIzrd4A3M
	XSlg=
X-Google-Smtp-Source: AGHT+IHGD1GcDdZz+XzCdWloVjTPGxvjV3RBz0UpW+s/qQoIu5gzKnr/F8UmA0BhWXtDmAHHQDrntQ==
X-Received: by 2002:a17:90a:b882:b0:2e2:de27:db09 with SMTP id 98e67ed59e1d1-2e2f0aebfd5mr14925931a91.19.1728925974961;
        Mon, 14 Oct 2024 10:12:54 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2d822893esm9322440a91.5.2024.10.14.10.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 10:12:54 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-pytest-subtests: RDEPENDS on python3-attrs
Date: Mon, 14 Oct 2024 10:11:45 -0700
Message-ID: <20241014171144.2937130-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 17:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205789

From: Tim Orling <tim.orling@konsulko.com>

setup.cfg shows run-time dependency on python3-attrs>=19.2.0

https://github.com/pytest-dev/pytest-subtests/blob/3671b40691440fcb01e96e346220ac4fe62d3580/setup.cfg#L30

This was caught during testing ptests for python3-cryptography 43.0.1 upgrade.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
index 9163f9d3fd0..7afd1fc563c 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.13.1.bb
@@ -16,6 +16,7 @@ inherit pypi python_setuptools_build_meta
 DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += " \
+	python3-attrs \
     python3-pytest \
 "
 
-- 
2.47.0


