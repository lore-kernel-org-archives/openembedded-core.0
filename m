Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2FBC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156317.1783358253716467149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MV3UV+TD;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so22901495e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358252; x=1783963052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QeSXOmoWO0DAdvoTiqYtRP3N7sTSjDJ3drECZFqPjo=;
        b=MV3UV+TDBN+fzT+1+A2NYUCnFUastrtOO7ykLXwwL/XKW9OQJZhURN5PibIPSFaUS7
         4+cKMQ/NjChpyc3YqGXl58fn6uYlkjqsmlBfKFVVV4lsf8lZcPBniuXQT7zE3MdPCdKM
         QK/cFnmMqZWXAMjUaSkcbqbRIOTvkYTWnlSXhsOuOfsXpDaoknzPvw7k0psaQOS5eQuR
         siahDPbtwNkE33T+dWC4vu2tZ643y+I01bEcucQucjG6yjyLe1ukqeFYiIVmmo6Vrez5
         K9zd2M6NcT2gNu+jI6hmu0evw1yPdqq+uGavbWJecOqHKOqcW56si3zVBPPjYUKNgcvv
         4lGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358252; x=1783963052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2QeSXOmoWO0DAdvoTiqYtRP3N7sTSjDJ3drECZFqPjo=;
        b=CBf/qUakH1tiXqkGUNsS2epyQlzIlbI5qkDgRFrwcf6r8NUAX33DyWRO6wMXwfDwQL
         WefzJyGRe9Oe28/O4rl+2O45YPe9im0VuEB9605c4W2z3wW4Q9SmnPy0+BgOElmyU4du
         j4y/Nn8so+oXBcAXpZEkGpUdVNM8D3xwwLSX7wRvw3gTSKIlSzAjOo0Z8LOmq7ieYHEK
         MOK/WpKZcq6khqUJh/jzd61FIKBgwb1AzWPuO1B494+ZJAUbmSYAXWlOB9hfO3sh0dQ+
         nHSqcmDVWMBi3Nbe2Bn++UUE/94lnIODvzgMtk0/VyGUH6gJb/6di33/o97RG+Zasvfz
         cS/g==
X-Gm-Message-State: AOJu0Yw7POs0BALgOaxH7myuFfBY2g+clOc2Fgxe3xBB6pt2Tmu4B3Zx
	yyxNwEtX1KGmCZAFuPpmr1bLGnx87PZwRbGtOOkNYAnWwZIsdGWWOHG3q/6Rqw==
X-Gm-Gg: AfdE7ck+56T73wW0C7hXCQ/UvN0clrA62DotQeXe8+Wl7+XP0K84GYqNBbBVYJSa2N6
	8M+XvGmalPr3GxfKlCVW+U70kLSGDHrSjx5FMWV7vgvcI+TDkNiqffqlU43H+6Xq71oZRKdydlI
	MhY43Ed2TMGsa+mquXHz+atbyIMmtNdksqdZaUKEk2K/lX5gKhc/A1kuIA5fff72e1RyMWPCs9E
	L1iRgjdSjem+RYk/w9pDgryZLvxyk4nGujeZSCnyuX322KC4GliFL6QeOKpl949YzvbVecVmhBx
	OHLIL9ZjPrSI5WZTm5ikiOgnPWzB8g9+6Wf5S9IubF+cI2vC/rQJDPZjCER/0tV2eL2VzZfhofV
	kOVjspzj/21tmKOI0YcCvLhqv+BJPc2YLNcQ4lTLCxcQyA4wejnJRoxOo942hwK+k3yqSMJA1Iy
	nEIUWvzNXuQdmODPLSYPaa2SVAhfjlCgxtWnbuCrAq/7fgvZ8R
X-Received: by 2002:a05:600c:4e03:b0:492:6447:7a7f with SMTP id 5b1f17b1804b1-493df84d585mr3912485e9.6.1783358251919;
        Mon, 06 Jul 2026 10:17:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/45] python3-setuptools-scm: upgrade 10.0.5 -> 10.2.0
Date: Mon,  6 Jul 2026 19:16:45 +0200
Message-ID: <20260706171701.70536-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240317

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...etuptools-scm_10.0.5.bb => python3-setuptools-scm_10.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.0.5.bb => python3-setuptools-scm_10.2.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb
index 3e86c4fd2c..d3ff181ad6 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "bbba8fe754516cdefd017f4456721775e6ef9662bd7887fb52ae26813d4838c3"
+SRC_URI[sha256sum] = "ec8ea1738b92e42146a46e29a0e9de9ad462744c63cf9778677b95dfd605adde"
 
 PYPI_PACKAGE = "setuptools_scm"
 
-- 
2.47.3


