Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F068BC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:20:36 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30709.1787815231420018119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 00:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SecYpQVR;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbee846deecso2117002a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 00:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815231; x=1788420031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUSiVz1s4c5vx758hwr0LNjRL69oY7ASOhFiTQvmnGc=;
        b=SecYpQVR7Ldvpha6d7pR4WPCOVCAJZBcpLPTWEG8QOOJ8teqxs1jP5gfRSLM3BLsgx
         Csa909hpDQjlgJDmu3ERGYsoHnW4HefKYDOtuGjbCFbmruRd9L0EZs9uS5PkCGCV6RfZ
         Ap6FDGX7m00qf4ojc17dpiNWtdvY/6wPsvA+9X4YeirLUJMkonv6vTR39sdvevK4+4O4
         5pGYkQFzY1Ifwv7LLCa9deJa/QvJSrJEmiqOgTuWEf+GTacy2LkW87DHWVP2HARaW4c3
         Z4Ji4h7pQ7xIUehklBETuVk62iOb8DVZqtPVK690WfvmQje22oXa/emWePnl6GbSRE76
         /6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815231; x=1788420031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUSiVz1s4c5vx758hwr0LNjRL69oY7ASOhFiTQvmnGc=;
        b=ayq5jIlZaW0t2rb/QQ+9dRYZz+gnY/10UaBbwGmplsSNu2mE2Uh296CypdpthtZTQS
         QSwHNXGaynEOi5rgr1HbP8wUs10+ZIj2bov7+bqa6GyrNr2StGEqF0rxh86EhSJKN4dK
         b2GnhSsfr+g30T9ffOjJIxArhe362rPynNIXjF14j4i/jK6jd0e32wBqX9Z7+RbAVwCM
         YxEv+0Ww3ccFa/5QP6Oz5Iqh1nm/ijGi8Q+sk0H6NZ0hpxW79LOHKF06BylJdKbLAT42
         0DWSdaj2mXmzOsYoAfbjgeV/AHoV+NM1UdvBbGqZJHIQeeBpU/Vh/0dc5+FEXePYmQUp
         V2eQ==
X-Gm-Message-State: AFuF++mwq/i6Nz7Gxo8qdFDAsBaZpBifjp2LV/p6onFMa9BqJk7qG28p
	h7gs8KDywAWbn1GvcJk1S7KiPwrNE5LDPQgSAoBBUEPvS+U6EucUc03mpJ69ug==
X-Gm-Gg: AR+sD11KjCTmccGk8FxUwmdahGNRetwyFb+GM8mM1YKHo624U+z16uIo/daSjkytwFD
	uHZGi077lbFTe1RHa77QIxd+mQA7t6jw3PgOF7ul2rs1VzOdG6XU0rhyNapR3Dt8D1OA8mqty7x
	qojWW+odljawkb1T1frkpALlxQgAMYPABEPICxTnlyN+Mit48SEx5Aw5gIp3p9U7NkIMtJxYZex
	apvoE2C6fZnacjgwuRGr2CPcsc7SS5b2dZsD/acxcdGHAiVx9c2gaxm/2O5i0nUhbiCqq4X76k8
	lsVFQ44ao6Hu/xmSzrRHKwKBzS3SAjXAYrOKGslCqs+7/KxXbfb911BXzei7CW536YiPLBSugqQ
	jWQV0Qh3m0tK+0HXS8zhrhej6dnq1c+7hjCEB3cA08NhQJxmT6xdIShnqUkq5m32J/i+dYK0KlM
	AQ93L7ES9FZo7IHD3Tw7olcwp7zGGcebPPE9dHICRaajW2O+eyhC5387AD0b5hIJQp47AIleplf
	pKqOnAr6P/NwlWWmuUdFfPY6l/eg4BRi5hmgKB2xR+k0BzJoZN8cHPf6f55zQHX3eUyjO1nhHbp
	YKf14Slm
X-Received: by 2002:a05:6a20:9e4d:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3cf8403156amr26800401637.12.1787815230752;
        Thu, 27 Aug 2026 00:20:30 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm22860700eec.8.2026.08.27.00.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:20:30 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH 3/3] python3-websockets: upgrade 17.0.1 -> 17.1
Date: Thu, 27 Aug 2026 12:50:10 +0530
Message-ID: <20260827072010.394532-3-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827072010.394532-1-Yash.Shinde.oss.dev@gmail.com>
References: <20260827072010.394532-1-Yash.Shinde.oss.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 07:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244463

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

https://websockets.readthedocs.io/en/stable/project/changelog.html
https://github.com/python-websockets/websockets/compare/17.0.1...17.1

- New features
Added support for reconnecting automatically by using reconnect()
as an iterator to the threading implementation.

connect() now follows redirects in the threading implementation.

connect() can connect to another host and port than those specified
in the URI in the threading implementation.

- Improvements
Connections are now garbage collected immediately once closed.

unix_connect() and unix_serve() now accept path-like objects,
such as pathlib.Path, in the path argument.

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
---
 ...{python3-websockets_17.0.1.bb => python3-websockets_17.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_17.0.1.bb => python3-websockets_17.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_17.0.1.bb b/meta/recipes-devtools/python/python3-websockets_17.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_17.0.1.bb
rename to meta/recipes-devtools/python/python3-websockets_17.1.bb
index 6733cfd0f9..b5ee3ec661 100644
--- a/meta/recipes-devtools/python/python3-websockets_17.0.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "5baa9bc0dfbae8c507e51c8cf1b6d4628086f7a87bbd3a9952bd5f035451f1cc"
+SRC_URI[sha256sum] = "acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a"
 
 BBCLASSEXTEND = "native nativesdk"
 

