Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1024A10BA441
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68446.1774600269849969307
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sHzY/yec;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b7c2788dso1073639f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774600268; x=1775205068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNdmWgA3Os258qwMAO7LTEFXVgP+6nxrxsDlPP2jerw=;
        b=sHzY/yec+NQfOsYz2j7nK/RRRoCwm/La9HLxjdsTtVOUDVsADDdy5s6dAfs0C/UDVa
         2iCvGIn/sNcGH0vfF0Oz9cZ4/vEbmlmagvD1VlJOuF0z5ETBhuaKnIJbFwSIh67Y1VfC
         4SsYCrObmsTZEtvtpvbAMq8rRq/J8P1uJezx6g2H/8YT/oxzqN+QlzyrLQUVwkqOBd9R
         C5F1GL2DzjXiMjtLa/1Mjy3sXCsBuKdPrEyKNnSGfe6QSIZZ0c6zYvCZr/LKJQh5Flp4
         QSNx5bfDn0LXvTztl7XZOU3OnlyoNBcVRkhQfVyf39CiPIt3HzH7QKvowg8QsUxvnaXK
         0jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600268; x=1775205068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNdmWgA3Os258qwMAO7LTEFXVgP+6nxrxsDlPP2jerw=;
        b=sP8JfLCPqXzAhgPiz9CLmM5mtSgWr0FQBj9G/SuIgaVNwvOSeQD1jkKRq1ZvoU9LAY
         m4bNVtIrqOMnA82clHEy2F4GuUL2j9U2W2WrzenL12e1TmhaIhM8kSpZeC9nmA/DuNLq
         ZbZXeN0M19QMIw92+Ixm/XHkDbvSekIlHZlrLxpCseQDIAuzy+GS/zfLSZHP03BzpuoK
         +xFoZVAn0RhxfYbxeRiki7VP3bOaI3YIsT8TGprptUkXkb9DUmf9B9kEiEBAGZoiTHcb
         yUVxP0GMjDsJLYMPuAcPRfly1XB+TQ5nbm6R3rJAoy7EInhULPwqZPcy6/FQrcYW71n8
         Y82A==
X-Gm-Message-State: AOJu0YzfdhMPoze9QvYUXIvWHoos43Nd2BnYRWIl2jKj48XE/556of2L
	VTi9NBYBGWOBOxsJAkrQ1TFg9dOCErWQSTPw38rDQNcmGlyFMRnQmo7JnLLxOg==
X-Gm-Gg: ATEYQzx+lcFHxkkVQUPOlSkI6wDhFxlddhl3EA70+moC/MeqeBaDqt5Qecz5adQ9jUr
	IW3UGjf2qNEE8xmlzCmhi2tSajXJmWrgKaIeJ/Hd/oek6iq3e4cSWX/r7Kq4ZSUcvXJM+w0rRNa
	QdBDpFz1qq0Uf7GjkHCNpvqckZ2TE/ys+xSuxOYmYjBFP9A2rLVz9ykBwtfqJQikIVFiAeBmtiP
	bjXYeAgqFw12+60cNU1zBVau80gOw1goBn4MryGONSkvNC8fNnrLSdVpyskVhLudy/MKuqqKoIp
	ZFXO1x7UIMCFQCba20dlSgdEHug3FDO4rOD77RljoakdRA6foVVFii4o4Oe6JxFssNCmTbQG5uV
	TGw6JFjkOwH8Q2lBa0RUbQnX6mv3sXtb2NvdoAtk+zAMSrubrHhCXcXA7y/waArSmUVGSsL7vrO
	TstE+WuW0uVxgoCQ==
X-Received: by 2002:a05:600c:4744:b0:486:af22:4a2a with SMTP id 5b1f17b1804b1-48727d5a2e4mr23900995e9.7.1774600267711;
        Fri, 27 Mar 2026 01:31:07 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm76411485e9.6.2026.03.27.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:07 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 02/12] python3-dir.bbclass: Move PYTHON_ABI into PYTHON_DIR
Date: Fri, 27 Mar 2026 09:30:45 +0100
Message-ID: <20260327083055.12571-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327083055.12571-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260327083055.12571-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234057

PYTHON_DIR is now suffixed with PYTHON_ABI.

Python build helper classes and the python build modules
use PYTHON_DIR internally, some of them do not care about
the ABI flag. So it's important that the destination
directory is set correctly.

This will also allow fixing recipes that may or may not have
been using PYTHON_ABI consistently, since it was set to an
empty string.

Also added a new variable called PYTHON_MAINVERSION which
is a combination of PYTHON_BASEVERSION and PYTHON_ABI.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python3-dir.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
index 3eb0dea9b2..f3ad0a2d91 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -6,6 +6,7 @@
 
 PYTHON_BASEVERSION = "3.14"
 PYTHON_ABI = ""
-PYTHON_DIR = "python${PYTHON_BASEVERSION}"
+PYTHON_MAINVERSION = "${PYTHON_BASEVERSION}${PYTHON_ABI}"
+PYTHON_DIR = "python${PYTHON_MAINVERSION}"
 PYTHON_PN = "python3"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
-- 
2.53.0


