Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8AC103A9B9
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:31:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20281.1774438303954241323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LrUi06Sr;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso44877645e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438302; x=1775043102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8062W+tk5yitffmG+nAyIkAqhP9TiXC+GzUEZs+RJw=;
        b=LrUi06Sri7ZPd1cv4ubuxpzDceVlgz1Ci6xfa+CpIegC+PSQD56xgWIvskitUZ0x26
         IrzXqpIyC3C7lRWnZVtIvMNdmwHdfIgGLHLru6wWWFtEB9zMwqOPQNYa4Bk0LVCzSZbQ
         tIumY5IqNeNYgJT+RBNjqwWMtzXrW4HvKfPDaj80fF4i6tAbwYyJY0gVeS7QxJLqMxWb
         VyGMCjGoz2MoQYArJHTzU3r/+VxKNlFrlD2XNyKiMjLBCqxVWjzr8cpOnfBuxRu1B0Wv
         FSH+eMXZLQXTg4u+UK922QLj8mmYHYaTwg9UXyadlzu8njN3L6j+5h88D66ZE8mFTTCB
         DF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438302; x=1775043102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8062W+tk5yitffmG+nAyIkAqhP9TiXC+GzUEZs+RJw=;
        b=fX2240SJAi1bv5ZEnIEd6/KRnkSzcaWr/65//L+Vz1/X2GzTTSLLPYmY00abe379Qu
         +UC3tPOISfvi2zcAp/pJGKz2c0Ca3Hysy1gAGpDwkpNn8FXYuCcH83t89oSTeeg7P3Wa
         4ZLyUM0zkibAbWRnLRMPy2q6Ar67Ki1GKQUMcbeednZHwwgWapKRcQUp919cRmEjjSOp
         L7Jdk/vFt7yplF6pCPFc8yWzTjlZt0in7+GousUHtvr8Frt3Z53xZo4hMtUA619lV90E
         xI/OrWey/Miz0saWg2D2eHTuOWDSwx/qvvtvVSFX/O5t6xPso1C5aBhcH0ZqnpxMI1Dv
         ciIQ==
X-Gm-Message-State: AOJu0Yzp75DTrKPrhoZnxl0QSiOfpMg0bmQboyMLmUYUbOKcS1MI1YyB
	/lnWptRdnWCDGMsc6P1urtiQFr/t8Bcxwts+/Sk/U81tY+M3D/5yqZQF88CK3Q==
X-Gm-Gg: ATEYQzzBBqxfsNST0u/vre4Aic/OzbJm8/VcQsNKHlW9R2T7wWnM1zaMmhTV0zjQMRp
	eHnS5LGFCqwPkNrA9i2cce2hLwNh20vKapasJseQJ6DW6TbItpuEgE+zDnP/S/5BGxKEoQOCnXH
	0OCvgxOhrHwwALfGSxIyHR+upq68cCHbrgBE2ls05ZLw9jGoUxyPCTS8EIyKBxHM2G7Wh7wpiLA
	DK4Q+c1Sw5gRpY4VCR8chLD0/JmzEez2lko5oXt5fadE4BNl+x7iif0uI2fqc07GLwqxaB6fHVy
	5MtZVOmhaC/kFL4EmVReutsoA0G/jYXrUGe/Uo6LIO56XNkvb4YRMhCxKHVx6r5Ozv8elFeqxY2
	J165HXi4ihFtBiSBq1Gh5JzI6mxW3TlFVFodV9lif9kcaKGRnTehxrDJzJAZ3/JXlD6lwHxUUPy
	manThCX5dvirsMHQ==
X-Received: by 2002:a05:600c:8711:b0:486:ffa3:584 with SMTP id 5b1f17b1804b1-48715febb55mr52790715e9.15.1774438301995;
        Wed, 25 Mar 2026 04:31:41 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:39 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 08/14] lttng-tools: Simplify setting PYTHON_INCLUDE
Date: Wed, 25 Mar 2026 12:24:18 +0100
Message-ID: <20260325113112.1163632-9-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233882

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
index 3a3f2cff2c..ef80c53e9c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
@@ -35,7 +35,7 @@ INSANE_SKIP:${PN}-ptest += "dev-deps"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
-                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
 "
 PACKAGECONFIG ??= "${LTTNGUST} kmod"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
-- 
2.53.0


