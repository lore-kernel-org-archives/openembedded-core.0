Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6835CD98E0
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:11 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105051.1781424244216036804
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QrBG66Bc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4908b92904fso27347645e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424242; x=1782029042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDtFHtFLck8gJQ7G0YUXNnf7WnXzU6CQJF2zCrNDmcc=;
        b=QrBG66Bc1Y7GPEj3HQoEF2bo1Ctk7ygocF5MXHbr1dV15X4EGnKyBF8fk8DGkg/Wq5
         4G7xAmJuo5rIL5BjsxZZFNraBKE1w7ResbFYyIqGtsFrEzt+XE1TZaXcZvk4iD1Y5k70
         lgg94SWq2sn+T8bAUhAXzNDKk4/YdXty2QioA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424242; x=1782029042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xDtFHtFLck8gJQ7G0YUXNnf7WnXzU6CQJF2zCrNDmcc=;
        b=X3k+KkUuGTkbFwpOYPlGRSzZWFb/2Obed2jM38IAJo2U+enf+vbgR4BRCV41AWi10y
         ma7/90F1inWk5zUaxt22JMlF7SO411p5Z/xYIlSdUXx50ORzIOMl+27OEvQ/jKCX53uU
         RCUPCNQ7IliiLg85+FRN3mGqJ1uy7V3qGySUu/hNaNulhHHozwNMGu6lrNu0s6mZXhsK
         S5NrVNLW+i307vjYrE5T5NqUzRikUl0Vm1q7TK0DYyc/d9GnFLQlfKqv04cFpfAY7lz2
         rc5rPdTNXUXq0sPRhXZLPJWOIUuYXAnG7F+7cS1O8n8w9G5IOiocFfv02E/nqbviN859
         z2yw==
X-Gm-Message-State: AOJu0Yy3y2H3RtOuXhf9cVQwIbeQZTt0oO7SAFVmdlAen7kDVrRjMLn0
	5xOS/SGg45rOKxZx7KK4sd5yULmR57+nD3fq0kMwbPp+msPRTjou7K/4CJyQWBZJslK/NTV288m
	0OpSD
X-Gm-Gg: Acq92OEEVFABHanBhAaD/0Ulks+kLY7jpgjlzV5FG9s7l8mYIwLwLemuKAnnckpAB9F
	tTvdBb02NpLga1wPerTrxV1caj0Bbemc74ExywdPs05aAfUR1ErqiZxE9OU3EJJ0N3PNB5bZ4VY
	mfTh845lW2q37gCZF3koQqFjxKVef9crASYd10Aqp1U3uKAGzMZ1Al6gjnLyFTo5uzxLvVQYcpd
	0iAzvsn9JgOm39jmp0nDyjduGSPC/7liRrV8GMFBfmxuaLpu6q8UPjMTDhSoTq92HibDML5aWxG
	VbnJYH/8qFe0qrXfpMD7qgBGGNl0qlYf6qc6k1oJUPZaUJ3/RfM4JUonDmBVi7DXhw8/+c8WSiC
	7r7ctt0sYaoWVjDGUGsE3J4da3MFxC/YgLrmE6ZulIVQholefik1gWE1B20NPuWyOFl6eSxD/Da
	4W8u1poddej4UX7wICWUQyuCY2R4g2pdAHkn2XiVZKOUdaCasrBaCn
X-Received: by 2002:a05:600c:e54a:20b0:490:e190:38f3 with SMTP id 5b1f17b1804b1-490ec504dc0mr78369105e9.21.1781424242386;
        Sun, 14 Jun 2026 01:04:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 33/56] python3-meson-python: upgrade 0.19.0 -> 0.20.0
Date: Sun, 14 Jun 2026 09:02:44 +0100
Message-ID: <20260614080307.4017177-33-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238717

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...n3-meson-python_0.19.0.bb => python3-meson-python_0.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-meson-python_0.19.0.bb => python3-meson-python_0.20.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-meson-python_0.19.0.bb b/meta/recipes-devtools/python/python3-meson-python_0.20.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
rename to meta/recipes-devtools/python/python3-meson-python_0.20.0.bb
index 530edc9b127..19902f6e4c8 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.19.0.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.20.0.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 PYPI_PACKAGE = "meson_python"
 
 inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "9959d198aa69b57fcfd354a34518c6f795b781a73ed0656f4d01660160cc2553"
+SRC_URI[sha256sum] = "6d9726ae6cd37e22f210c74b364b30180a68c20442e97ff09f3c566a414af738"
 
 DEPENDS:remove:class-native = "python3-meson-python-native"
 

