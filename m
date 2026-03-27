Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D45510BA445
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:21 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68452.1774600275737714299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HZsYxvYJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so13522085e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774600274; x=1775205074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDLuo+1DNT28AZt2wNtI4uovK6MgckoVedKbetkEv/k=;
        b=HZsYxvYJLtvRBlLwdBIPiyY6Q0QH5LO2Ets7ZhrCl6E4tpZH4migzpBgzQ8o2oKh9j
         6hX9Xbb661M5ZledrXjbdaVlrVhd2Hc1Xvwi6juGxQWTuGbI/+2rPo/Cw0WRRqlCZD4s
         ZTG0x3kU3jXJeSXIR60s1oqupyp7OfvH84ZVGdwlbdsN+V/nwbqykgXEaLtiLSVQe3L1
         Uoc6gdWlVSSEC8T0Uw21oSna1hhyzq/Zgcxt45Z/O/D2KGT23qsMNQ/0kr0PB8Uwdt1E
         8i3B+zsHrww6gIn+SevhqiXlH1jVTxlcV8CtvDvV8ayOAPQBSkd40zwTidfJa1aziBKk
         3jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600274; x=1775205074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDLuo+1DNT28AZt2wNtI4uovK6MgckoVedKbetkEv/k=;
        b=iyOXLLZQWHuq1x/SGAnxo1gqYH/IawXj/cDYBKLfrflM4RWyKFxqR5fjGhX/8g1cEl
         g2B529vtHCR5w0YLQZNmmXn+/A+O4oOqKHBfgFaUs2QMbHYEYEwwzK+32ssHMPugrGC0
         5h42cvU9MG1oZncZNHxUFouRvxPpn+qs5RuJ4LdWgcbxosaI8k8PlmZqxeU/oR4sPewq
         PE35KUfw/wEdLMFRdWYA8JsNigSNPLzeaUHtFPHhE9B9Cdn3RRHP7Pvx6E+4R7MjYXjZ
         aBVRp+B1lr9uSuRhPUsRqTpEzP7Jm6+xG+gVOv/AxSXJgIjuj70R/Cmvyfxi4ZLTB4UW
         Vz7g==
X-Gm-Message-State: AOJu0YycsY0hwkwQSPm04xT/0d4LpH8L7fmNPBbWhkA4K4ytihIhzyM8
	gf6NBOcutj9o3j980+427OJ/CTSicIJE2kuBKc1POj7C9AUUnZpIpLhj+gZUeQ==
X-Gm-Gg: ATEYQzyoHatxR6KrFMdBi56NWrNZ8imXd4f29Q4GDdn20faWQxOx9RWSpJ6Y9wrPEzv
	cmaTydR1aBRdBXlWtniK50lo6p677DUJuaumstWLW5AkAGlaBm4OaOgwhgsJfFaNaaRjWn7vpZK
	41p/TiGUi7qYjnAzGHrGqLoopv9Pl9xkxrZ7I/nWpBiFfxGZ/2/ppf2Gy7ucnI+Z5GL/uQlSRTE
	iDiy4mFmHknjOwHsyFu4nVYm9ddpckAsbD+sys2OYP2DoOQdbdQ9GPIXU2JZWBE4xSarpLfZ97/
	tW4dowviCX59Q7r0Atp8tA73+rrRU9lcm06WtXnAx4zCTL0oigq4mJV2anm2nNs3N3GhVSzbqkx
	+yLrQHeZ9TTHiBzRitdWWx8cEyGrrEESzQk+XxwgGxFwY4fgvVvlyRNYyBi6IxSTmZzGRcweS1r
	7X/SAWbCUoK3ZQxw==
X-Received: by 2002:a05:600c:1f13:b0:487:169:9f64 with SMTP id 5b1f17b1804b1-48727d73709mr25130485e9.12.1774600273381;
        Fri, 27 Mar 2026 01:31:13 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm76411485e9.6.2026.03.27.01.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:13 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 10/12] lttng-ust: Stop using PYTHON_ABI
Date: Fri, 27 Mar 2026 09:30:53 +0100
Message-ID: <20260327083055.12571-10-zboszor@gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234065

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
index 1a15c5b420..5c1c74b7a8 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b04e8f34dbcf08198c6618d05e8fe7b"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
-                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
 "
 
 inherit autotools lib_package manpages python3native pkgconfig
-- 
2.53.0


