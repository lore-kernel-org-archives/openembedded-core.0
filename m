Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28020C021BE
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 20:57:00 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.19954.1740517012798483214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 12:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tmx6h/5u;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f441791e40so9424860a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740517012; x=1741121812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ye2oqwf/XFDGyA5vxlXGMdHMhj/8Q4efILkPJhFWhXA=;
        b=tmx6h/5uayq7FTPOjnA9eCzxQOeA/W6kOjO7egFlscLTsc/LwPVaXizAprTwx3mi0G
         eDT+RfLHAMjptBgdleIuJxTmavr3sAhpmj6IJ7GrPpL5DA7Y8ZRrePitldAHfYm8MfQd
         AL0gfn+ovpf7mL+4RWQwpDgSFtUc7bIOlSFJJe+CiBDQatalB5oZUw4BSES7Ek3FHRMP
         PoMCg1TM8VKZv81GGNMRZX5zt3r7qA8PcvakpjG/bhZBrz5xcOkmsyvR8yK4bdJxIpxE
         OuIB50GA2hMDZk9p4GxQ7jSQWCSszCIrBMruzqy/5GTZsXWw62znmHWlYiZFWJ0pR4ZD
         8s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517012; x=1741121812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ye2oqwf/XFDGyA5vxlXGMdHMhj/8Q4efILkPJhFWhXA=;
        b=Uro9fzvKX70mtAvfpJZQDjvby4jyzO4xC65ttGINIefdBS+fORZeTfy1u1+3X9J1z9
         fov4q76/NG2f1lJZyYTarBx0VOK1arEQwF328ReO5MSZ/tbNTjPt3V5//aTa4hSKfK9e
         VrNYm5ay9wtkx1R/uCRFxXOfycexmF8El1EKoj3qketgETdIK5gRi/DBEz9bkV8YM5qq
         BosD0q2sSOuWTzgox73nPgY+RXnTJ7WKNL/KvKwrpBZ56KZGlDLr52a30Uui8BZtPvcK
         9PeqxvzU1C6WYWZe5n8fsMakurQANE6qvu1+1isZ0+Xbs9L7+sxAczHuFOfONtk+40DN
         tbjg==
X-Gm-Message-State: AOJu0YzHxI/2CJivuzhyhBrfEQunDJf94+sb9sCbUsF7p/mTf8LOLVBs
	C9sVJcNoy6NtuBcASFd5dlQ3YOWdTFrUFbjH8uf/wGadzNWrbijvIVh9c0jpNpMDVAEmoJ7ao3+
	p
X-Gm-Gg: ASbGncsYJoTGiLF/in93m/9qfmSuIEmLCccfjOI7fG2/REBZFuLabH2EDgjK8iF2tA4
	35XQ0+uJH1quzofVwIZLMoaiN3wJcXWXXVsoOQNet1PW474GgVw/sT0X9uWvcOIUzshDFmDwbf/
	ePAl19fmERdHUD73OC2jwaxr0i8QbIt2udDUyhBJa5iY5+W8f6K8eFAgB6iZUQ8iZhfXCEkPcKR
	klk1qpHxjZvmQaO1qqLS4Cf8bkJBIy6JZlw1UPTXmSeE6eGIeU6yPieAaCLed090sTsiAZtAUMl
	2YHhwoKAhc/iwXaJZQ==
X-Google-Smtp-Source: AGHT+IF2OTrM09qlCUaXfslWFrULzikV4NZP3Wx3jVdAoYvPHyiyD9GaiWeOXbUZtFgFTVZKMbjvjA==
X-Received: by 2002:a17:90b:1643:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-2fce86ae28amr31391646a91.10.1740517012089;
        Tue, 25 Feb 2025 12:56:52 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02d9b4sm10083810a91.6.2025.02.25.12.56.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:56:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/10] bind: Upgrade 9.18.28 -> 9.18.33
Date: Tue, 25 Feb 2025 12:56:32 -0800
Message-ID: <37f07393c6977e7765ebfd948a017dab9be6a367.1740516861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740516861.git.steve@sakoman.com>
References: <cover.1740516861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 20:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211933

From: Vijay Anusuri <vanusuri@mvista.com>

Includes security fixes for CVE-2024-12705 CVE-2024-11187 and other bug
fixes

Release Notes:
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-33
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-32
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-31
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-30
https://downloads.isc.org/isc/bind9/9.18.33/doc/arm/html/notes.html#notes-for-bind-9-18-29

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.18.28.bb => bind_9.18.33.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.28.bb => bind_9.18.33.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.28.bb b/meta/recipes-connectivity/bind/bind_9.18.33.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.28.bb
rename to meta/recipes-connectivity/bind/bind_9.18.33.bb
index 4b0948298e..2554a7bb5f 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.28.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.33.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7"
+SRC_URI[sha256sum] = "fb373fac5ebbc41c645160afd5a9fb451918f6c0e69ab1d9474154e2b515de40"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


