Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CA9CD37B6
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8174.1778224362368441196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yvVyMk66;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-444826c16ffso1480742f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224360; x=1778829160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2yMZWuN9JnyJMDQmh+P4F7yc4BMiGgCIltyzJ2Eq/E=;
        b=yvVyMk66JVsNXWDBWzNHPEkE8KRyoaC6Jyio3IoHj069LfTiOeFhSrPhfRHvIuaF1Y
         ++bwucmyrBf2dmsbIY4+GOBorIqbqBJie1Rd58s4+HHB8Y9BVMseKfuDa/eDC2+Vub9w
         bXq8GBhXBztGp7vHTfKE+bIIvZZ8ULTKE8RKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224360; x=1778829160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s2yMZWuN9JnyJMDQmh+P4F7yc4BMiGgCIltyzJ2Eq/E=;
        b=piCLcoymt4LQEQCiaTRH79RkqwYp2W3TwyZs9gJzinZr3vyfu1xe+Mfiiqnhj0RW3T
         HeHqsvHSuInEET7QFiJXQ46iJDFhx6rbdwDEUK1q/6xKpHDFXiPb8sTcBp2gPjLn7nMQ
         UngRQRwat8VJXP74kTvF4v7zuTl7Nz1NfS/4ka4ee3H/uZMcs4o2+bI5+VjQ7GskrcOt
         Sn3VeSESbPImDz2v52ULT1ahH+Y8uj31QJ2ful5QsU3VAh9048DU6vCawbuA5h/mYmY9
         C4lOwtSHK3pu7+s+Y7+r8IEuPTJs8se5gI64j+LhGgKYw5uNKndcAwQ9OeCqKlJvtNJP
         KAgA==
X-Gm-Message-State: AOJu0Yx+bFmGVgfJphnLh0qA+wuEQS4b806NDYg+9XPkrFUSgtHUZEdn
	hiEgCfq+lf2OxOM9IgYL7rz/51l2AaXxRG6GMuKdaofYS6g8ylrBlgXQIGfwrqLvXhtJbEAbeF4
	IQ+i8NwI=
X-Gm-Gg: Acq92OHdpAyzyEp7kSN63gTOzE+HmJcR5pSNlOhcPIUfy69YZq12acsBAnHokMIReoI
	g8bBWQ2f7tNCA5o5DvMck6KBpkrZ5Nqvu4wdJ7UAF2YH5aK3r367uQAokEj95uu1JRba5lJIjGo
	kDlIGP+jP7X8tIMkxz/q1/eR/sBlrcrCQnMohOs+LOLVviHozu9+xugxn08NYbVa+Lwp4PJZo+x
	zUKd8sDaUCHHBM4eckuZp63sB2VvbRAOuX13/7zuv5wGeJvf78NjyNhy2XNgA0En5taZf54k21t
	Hb4ahKKJzbPoH8txJs5Da2EBrfRyGotanxszY0y1X7yODNZp1y8WTZVlEEXwUHPJDk4u/5AfO+6
	W5DB28YDdWI7jE5e7eXEye37nSpbWgIHbaQ74cHRiRzVzdCGuXhOnqf3osO+YpMhhRbUVB6WFFH
	IMv393qvRM2/aYEVRyLCk6Qorz90YICxmlJMLkmokK1sk61jJ/sZb0EVjs6WYSoeehSuzkYTkci
	kO/JUfgqbmtK30hYD4VN89Iyxwju6H1TtDfng==
X-Received: by 2002:a05:6000:4313:b0:454:af3:33a0 with SMTP id ffacd0b85a97d-4540af333d1mr3814006f8f.17.1778224360286;
        Fri, 08 May 2026 00:12:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 39/52] gobject-introspection: remove obsolete explicit debug packaging
Date: Fri,  8 May 2026 09:11:32 +0200
Message-ID: <4830d64b30c9a92fafefadf98660a1cf7314e87e.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236681

From: Ross Burton <ross.burton@arm.com>

The .debug directories are packaged automatically by default, so this is
redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4612565dcabde01b6fe9b741da29ccbe75c99cc2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gobject-introspection/gobject-introspection_1.86.0.bb        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
index fbba8fd6ec4..51cae5fff60 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb
@@ -195,7 +195,6 @@ FILES:${PN}-dev:append = " ${datadir}/gobject-introspection-1.0/gdump.c \
 FILES:${PN}-dev:append = " ${datadir}/gobject-introspection-1.0/tests/*.c \
                            ${datadir}/gobject-introspection-1.0/tests/*.h"
 
-FILES:${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
 FILES:${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
 
 # glib-2.0 is required for libgirepository

