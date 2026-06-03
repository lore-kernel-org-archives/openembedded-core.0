Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298BFCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 17:08:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25546.1780506526717940176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 10:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eeu0SVS8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso19255435e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780506525; x=1781111325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eiEgZ2fO+xt5tJxlIUxSGYHWY1CPeL5KGh9Xk8zYtxk=;
        b=eeu0SVS8RqppncgwkqkrZoCBvHLBlbB2NIAQs3E3J8+qXuS3Mw+pzMFhzre6Wt0uF6
         FCIMkgRZilzZAqzzkIkLbHqyCHB4evQrYexw3XjQqSEx5GJ2T1iqyBzjqifqmXKOOg3V
         Vb7jnmjFVGZgmgbgFUmt9BVECaxYzMBb2N0os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780506525; x=1781111325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eiEgZ2fO+xt5tJxlIUxSGYHWY1CPeL5KGh9Xk8zYtxk=;
        b=aBHm1HQIJP5FZS05oGkSsM53aJW0AB9j5GD0tH5cyRlAGXKSzfyq+Xrf3qK6uDZo53
         HO/sqcAEoQSuJ3wNLSrEaxMro9NvKfhemLE9eF/t2De3jWvW7trEp8Dbwu5QOvmst/c5
         KDrwYScMt8THinJDZjyOXVcQOdNh4YuV2n6s9tlvtn/MKuSX4L4FIMs4C4cdVqRN0/WA
         eN5x8JgBEdwdx1glFl2NqvTTODGzcQuKgO/okhIAd9PcjSBAt06G8DbYiVaKUELEzmuL
         kdJ2e8mIL3IQ2m7fMPlAsv3RMeaNHKu1kLuowZCYRHfSDkg067xXTFb0QPGct/PqtWmM
         hKVw==
X-Gm-Message-State: AOJu0YzHI0P32hcO9fJDLqwskL+U/UVwfualxMNjC4BjGi6zocBhgFn4
	7MQ7vYVdEasZTU5Yi30l0Iro25U67FmmXvAbxV+yh2yCjAcaLxWBN+MCzYeIUEIwO6iGaMtEil3
	keTLn
X-Gm-Gg: Acq92OFfVA70H4CrlJi1+dRFAatyChI/q/OY8GH6C6QnZC1MBl9sPoZcmiB6CD929AN
	4WEwtqBsTMpt3NH1DN3berMBXdyuU8dtAui//xy6YPzsCcKDVHTmkDgKoXYr3Snxe2ycxhaXB/d
	PvgisGTW8ZE73cQYPyocUcb2fO5xHR2f0tcsruFGW+gzsA4tCpxlUCERZEE/vhCJZkSU1shl5fb
	6Av93fVwIbZZvoUJ6fITk3AJHSM058/eA+HGauhZ3GNU3F8EgIhobOWxFTZrUPjM6bz4kUgcAQs
	ONoXN7Nkp9u2maAOvgq97jSca0wy7hJUuRVxazy8PSnG/TUL/r+1JoDa3J03Xj2rDgZDz0bHGth
	UNRYL5in2iV7TcUxT0GSbLny8W70eJpqB8Sf96mQ3a4hc0Um5A9eF6zbcAdplXOvx6Lf8+1TAmc
	Zxdch9Zy4nmxf3LNI5TcH0In6OkAsnFhCSnZQzlDscwxewMmenG6a7prfA4WDYPw==
X-Received: by 2002:a05:600c:34ca:b0:490:bb45:79f0 with SMTP id 5b1f17b1804b1-490bb457abdmr24698515e9.3.1780506524944;
        Wed, 03 Jun 2026 10:08:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:202c:df88:9261:8b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm35494755e9.2.2026.06.03.10.08.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 10:08:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xorg-minimal-fonts: Note where the binaries are build from
Date: Wed,  3 Jun 2026 18:08:43 +0100
Message-ID: <20260603170843.1484868-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 17:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238106

To save anyone else tring to work it out, note which repo the binaries
are generated from.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index 28010f5f227..97c8be0a078 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -4,6 +4,7 @@ HOMEPAGE = "http://www.x.org"
 
 SECTION = "x11/fonts"
 
+# Compiled fonts from https://gitlab.freedesktop.org/xorg/font/misc-misc/
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://../misc/fonts.dir;md5=82a143d94d6a974aafe97132d2d519ab \
                     file://../misc/cursor.pcf.gz;md5=40bc81001fef4c21ca08df4305014a2a"

