Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491FFC3DA4A
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 07:25:00 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.5054.1738999492518716671
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 23:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aAv0hf+I;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4363ae65100so33258095e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 23:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738999490; x=1739604290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTfvEU+fE4BHGbvdhuF8cxM6p4lUxcDUI+coObHyPiI=;
        b=aAv0hf+ITJYLlzPoIJ4lGwlVQZCaYlf7n87/CzQyX/9Ebay2yZDSs7Hpk8cUKqfjWB
         IPJbbT/m5qWdKqqrWPR1Jr7Fjv7ICAJbBHJVeQwgVH7vdbi3hisFk/PP2sx/7AZjnl9L
         G1F8RsDhGE8RBO5b0QfcFtaX+WGK5z/8MPj36UWFNZMCa6YdgWWd/hrR/+CgP2F/4X13
         gBcMoOpc9rPZBNQteSE3e3J6ryzfcXhgRv+xPxX3EeziJlh8oQbQBO8gQh09/HVqthUi
         4GZORl5e/W97vyZgaZJRyeiuWiss2brpd+rA2USWUjiUSkb7kKGqSDD3c/ui/BhKxxsG
         8v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738999490; x=1739604290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTfvEU+fE4BHGbvdhuF8cxM6p4lUxcDUI+coObHyPiI=;
        b=hVupumo4jkDw3tUiuZ2d5HIrwSjCsqvmdc9lmv65g5H3y9+bzVAczTM7SIZP4jPdIV
         ZFf8mPrqpHDcCZ5FHSEt7FnPehKQiSd5qq5aHt3+wy+YhTRfKkIx+EBDowl7EDxW+H92
         PicqWWlmIkGQZEKjgxiM6Is5qkWMZsYOUXzyKPVIo/84qfKSXI8594QVwfBcy3+8mu8k
         leSpBCWiIW2B7nuXqnrxn4d8G0AAF9oYhDEGFwAJO2uthh9MtzaQv6M/Q/pk4iKYTZvM
         Jl8B0yYZ0oXQKj4PhPNA15Prz1lbhIxhgDEosCjSnQ35rdrvrSUGvi7xJO2W0Dg1aZi9
         4IRQ==
X-Gm-Message-State: AOJu0YyHwIXKkb7LBiiq83POt5TQN5MofDMrRIA5zI4fLwJ15kqydD7d
	X9z7wCxIbZ9jSf9PhOi8KPulqMfSJHKzL+0OXC/CgqZiBAQX7MGgwim3Kg==
X-Gm-Gg: ASbGncvNnW2zHc+ZmUgA2FFXC5VFVErC0LtHvOlopjHg7RN47q06iMfxeFJIfkB2Hbw
	52er8lrwN1svp/nC6Gny+3Y+39G7IMrIPbXvFs57ISoKyPhQ6cuJp2653ZtfH4MQI+U+lqXvPD1
	M/o1qBmYT6HYxics8g2SrMNjBCsx+nnnsxKhEwwlaK9ff/mZT1Rlv7FcdnGRVdD71PLcAFajU8k
	z5njIiw8IfrwrHv0Kd54nnPogLr5+iF5uIDBGJBknYTGCcAV4HEFGKI49YyqKhnN4VsfIp4AjXL
	WPeMbjks01AAilTnQdC5qh6ImIWYB1gIgba/PILrN0xmgw==
X-Google-Smtp-Source: AGHT+IEkBZnfLtM5a0LwptxHjJrrlKEDrZwgjczeS4DTJw3sH9UiT1j2yupQTHbAJk5y5sV8Bdu7dg==
X-Received: by 2002:a05:600c:c0b:b0:436:1ac2:1acf with SMTP id 5b1f17b1804b1-439249a7c30mr56409705e9.20.1738999489932;
        Fri, 07 Feb 2025 23:24:49 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd07fa80csm2178356f8f.13.2025.02.07.23.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 23:24:49 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v10 3/5] rpm: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Sat,  8 Feb 2025 08:24:43 +0100
Message-ID: <20250208072445.986573-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208072445.986573-1-zboszor@gmail.com>
References: <20250208072445.986573-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 07:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211016

Point to the crypto policy file so RPM signing may work.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 6c995ff50c..d296c20d78 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -100,6 +100,7 @@ WRAPPER_TOOLS = " \
 do_install:append:class-native() {
         for tool in ${WRAPPER_TOOLS}; do
                 test -x ${D}$tool && create_wrapper ${D}$tool \
+                        SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
                         RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
                         RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
                         MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-- 
2.48.1


